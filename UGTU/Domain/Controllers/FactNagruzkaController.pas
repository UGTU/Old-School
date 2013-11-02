unit FactNagruzkaController;
 {#Author villain@ist.ugtu.net}
interface

uses GeneralController, ADODB, DB, uDM, SysUtils, Contnrs, Forms, ComCtrls,
  NagruzkaClasses, Classes, StdCtrls, DateUtils, Controls, Graphics, Windows,
  Messages, Variants, ExcelXP, ComObj, SheduleController, NagruzkaController;

type
  TFactNagruzkaController = class(TInterfacedObject, IFactNagruzkaController)
  public
    function GetDisciplinesFromFact(SourceDataSet: PDataSet; TeacherIK, PlanIK: integer; isShowFirst: boolean): Variant;
    function GetPotoksFromFact(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean): Variant;
    function GetAllVedomost(PlanIK, CalcUnitIK, ShemaDecomposeType, DiscIK, VidZanyatIK, TeacherIK, PlanStudCount: integer; HourPerUnit: double; WorkDayStart: TTime): TObjectList;

    function DeleteDiscFromFactNagr(PlanIK, DiscIK, PotokIK, TeacherIK: integer): boolean;

    procedure ExportIndividTeacherPlan(PlanIK, TeacherIK: integer; ProgressBar: TProgressBar);
    procedure ExportFactResult(PlanIK: integer; ProgressBar: TProgressBar);
    function LoadAllTeacherFactNagr(SourceDataSet: PDataSet; PlanIK, TeacherIK: Integer; var allFactHour:double; incorrectList, correctList: TStringList): TDataSet;
    function LoadAdditionTeacherFact(PlanIK, TeacherIK, DiscIK: Integer; var DiscHour: double):  TDataSet;
    function LoadTakeFactNagr(TeahcerIK, PlanIK, PlanTeacherIK, DiscIK, PotokIK, PotokNormIK: integer; ASemStart, ASemStop: TDate; ATakeFactNagr: TObjectList): TDataSet;
    function LoadTakeFactNagrItem(isNeedCreate: boolean; var CreateItem: TTakeFactNagrItem; ContentPlanNagrIK, VidZanyatIK, VidZanyatTypeIK, VidZanyatTypeByTimeIK, VidNagruzkiIK: integer): TDataSet;
    function SaveFact(TeacherIK: integer; TakeFactNagr: TObjectList): boolean;
    function SaveFactWithoutSheduler(TeacherIK: integer; aTakeFactNagr: TObjectList): boolean;
    function SaveAdditionFact(TeacherIK, PlanIK, DiscIK: integer): boolean;
    function GetAllSemesterFactHour(YearIK, SemIK, TeacherIK: integer): double;
    function GetAllSemesterFactHourForTeacher(YearIK, SemIK, KafedraIK, TabN: integer): double;
    function GetAllTeacherFacts(SourceDataSet: PDataSet; KafedraIK, TabN: integer; isShowFirst: boolean): Variant;
  end;

implementation

{ TDepNagruzkaController }

function TFactNagruzkaController.DeleteDiscFromFactNagr(PlanIK, DiscIK,
  PotokIK, TeacherIK: integer): boolean;
var
  tempDataSet: TADOStoredProc;
  tempDS: TADODataSet;
begin
 
  Result:= false;

  if PotokIK>0 then
  begin
    tempDataSet:= TADOStoredProc.Create(nil);
    tempDataSet.Connection:= dm.DBConnect;
    tempDataSet.ProcedureName:= 'UpdateFactNagr';
    tempDataSet.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
    tempDataSet.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
    tempDataSet.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
    tempDataSet.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
    try
      tempDataSet.ExecProc;
      tempDataSet.Free;
      Result:= true;
    except
      tempDataSet.Free;
      raise;
    end;
  end else
  begin
    tempDS := TADODataSet.Create(nil);
    tempDS.Connection:= dm.DBConnect;
    tempDS.CommandText := 'select * from Addition_prepod_fact where ik_plan_nagr='+IntToStr(PlanIK) +
                          ' and ik_id_prepod = ' + IntToStr(TeacherIK) + ' and ik_disc = ' + IntToStr(DiscIK);
    try
      tempDS.Open;
      while not tempDS.Eof do
        tempDS.Delete;
      Result:= true;
    finally
       tempDS.Close;
       tempDS.Free;
    end;
  end;

end;

procedure TFactNagruzkaController.ExportFactResult(PlanIK: integer;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  vzColumns: array of integer;
  i, j, k, rowCount, prevRowCount: integer;
  tempDataSet: TADODataSet;
  chokeDS: PDataSet;
  minYear: integer;
  groupCaption, stepCaption: TStringList;
  captionStr, tempStr, twoTempStr, allTempStr, allTwoTempStr, stepTempStr, stepTwoTempStr: string;
  tempStoredProc: TADOStoredProc;
const
  conditions: array[0..4] of string = ('(Prepods.ik_degree is not NULL) and (Relation_kafedra_prep.ik_work_type = 1)',
      '(Prepods.ik_degree is NULL) and (Relation_kafedra_prep.ik_work_type = 1)',
      '(Prepods.ik_degree is not NULL) and (Relation_kafedra_prep.ik_work_type = 2)',
      '(Prepods.ik_degree is NULL) and (Relation_kafedra_prep.ik_work_type = 2)',
      '(Relation_kafedra_prep.ik_work_type = 3)');
  captions: array[0..4] of string = ('Итого по остепененным доцентам', 'Итого по неостепененным преподавателям',
        'Итого по остепенным доцентам (совместители)','Итого по неостепененным преподавателям (совместители)',
        'Итого по почасовикам');
      //  'Итого по остепененным доцентам, профессорам и почасовикам');
//  cols: array[0..25] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
  IExcelApp.Workbooks.Add(null,0);
try
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1.5, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$3:$4';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  SetLength(vzColumns, tempDataSet.RecordCount);
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT year_value, ik_sem_type FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  case tempDataSet.FieldByName('ik_sem_type').AsInteger of
  1: minYear:= tempDataSet.FieldByName('year_value').AsInteger;
  2: minYear:= tempDataSet.FieldByName('year_value').AsInteger+1;
  end;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT count(ik_id_prepod) as PrepCount FROM Relation_kafedra_prep WHERE ik_kaf = (SELECt ik_kaf FROm Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.FieldByName('PrepCount').AsInteger;
  tempDataSet.Close;

  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE.Value2:= 'Сведения о фактическом выполнении нагрузки';
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Font.Bold:= true;
  tempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('cshort_name_kaf').AsString;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT (' + #39 + ' за ' + #39 + ' + Cname_sem_type  + ' + #39 + ' семестр ' + #39 + ' +  Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ' учебного года ' + #39 + ') as cName_plan From Plan_nagr ' +
    'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type ' +
    'INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + '2'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE.Value2:= 'профессорско-преподавательским составом кафедры ' + tempStr + AnsiLowerCase(tempDataSet.FieldByName('cName_plan').AsString);
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Font.Bold:= true;
  tempDataSet.Close;

  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + '4'];
  RangeE.Interior.Pattern:= xlSolid;
  RangeE.Interior.Color:= 15332083;

  RangeE:= IExcelApp.Range['A3', 'A3'];
  RangeE.Value2:= 'Фамилия, Имя, Отчество';
  RangeE:= IExcelApp.Range['B3', 'B3'];
  RangeE.Value2:= 'Должность';
  RangeE:= IExcelApp.Range['C3', 'C3'];
  RangeE.Orientation:= 90;
  RangeE.Value2:= 'Штатный совместитель';
  RangeE:= IExcelApp.Range['D3', 'D3'];
  RangeE.Orientation:= 90;
  RangeE.Value2:= 'План/Факт';

  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  i:= 0;
  while not tempDataSet.Eof do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + '3', TGeneralController.Instance.GetExcelColumnLetter(i + 4) + '3'];
    RangeE.Value2:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
    RangeE.Orientation:= 90;
    vzColumns[i]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
    tempDataSet.Next;
    inc(i);
  end;
  tempDataSet.Close;

  for i:= 1 to Length(vzColumns) + 4 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i-1) + '4', TGeneralController.Instance.GetExcelColumnLetter(i-1) + '4'];
    RangeE.Value2:= IntToStr(i);
  end;

  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) +  '3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + '3'];
  RangeE.Orientation:= 90;
  RangeE.Value2:= 'ИТОГО';

  rowCount:= 5;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetAllTeacherNagr';
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, 0);
  allTempStr:= '';
  allTwoTempStr:= '';
  stepTempStr:= '';
  stepTwoTempStr:= '';
  groupCaption:= TStringList.Create;
  stepCaption:= TStringList.Create;
  for j := 0 to 4 do
  begin
    if j > 0 then
    begin
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns)) + IntToStr(rowCount)];
      RangeE.MergeCells:= true;
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.2, 0);
    end;
    inc(rowCount);
    tempDataSet.CommandText:= 'SELECT ik_id_prepod, Prepods.*, cName_degree, Cname_capacity, Relation_kafedra_prep.ik_work_type, Relation_kafedra_prep.ik_capacity FROM Prepods ' +
      'INNER JOIN Relation_kafedra_prep ON Prepods.iTab_n = Relation_kafedra_prep.iTab_n LEFT JOIN PrepodRank ON Prepods.ik_rank = PrepodRank.ik_rank LEFT JOIN PrepodDegree ON Prepods.ik_degree = PrepodDegree.ik_degree ' +
      'LEFT JOIN PrepodCapacity ON Relation_kafedra_prep.ik_capacity = PrepodCapacity.ik_capacity WHERE (Relation_kafedra_prep.ik_kaf in (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')) and (ISNULL(YEAR(release_date), ' + IntToStr(minYear) +') >= ''' + IntToStr(minYear) + ''') and ' + conditions[j];
    tempDataSet.Open;
    if tempDataSet.RecordCount > 0 then
    begin
      prevRowCount:= rowCount;
      groupCaption.Clear;
      while not tempDataSet.Eof do
      begin
        tempStoredProc.Parameters.ParamByName('@ik_id_prepod').Value:= tempDataSet.FieldByName('ik_id_prepod').AsString;
        tempStoredProc.Open;
        RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount+1)];
        RangeE.MergeCells:= true;
        tempStr:= Trim(tempDataSet.FieldByName('clastname').AsString) + ' ' + Copy(tempDataSet.FieldByName('cfirstname').AsString, 1, 1) + '. ' + Copy(tempDataSet.FieldByName('cotch').AsString, 1, 1) + '.';
        RangeE.Value2:= tempStr;
        if groupCaption.IndexOf(tempStr) < 0 then
          groupCaption.Add(tempStr);
        if (tempDataSet.FieldByName('ik_degree').Value <> NULL) then
          if stepCaption.IndexOf(tempStr) < 0 then
            stepCaption.Add(tempStr);
        RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount+1)];
        RangeE.MergeCells:= true;
        tempStr:= '';
        if (tempDataSet.FieldByName('ik_degree').Value <> NULL) then
          tempStr:= tempStr + tempDataSet.FieldByName('cName_degree').AsString + ', ';
        if (tempDataSet.FieldByName('ik_capacity').Value <> NULL) then
          tempStr:= tempStr + tempDataSet.FieldByName('cName_capacity').AsString + ', ';
        Delete(tempStr, length(tempStr)-1, 2);
        RangeE.Value2:= tempStr;
        RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount+1)];
        RangeE.MergeCells:= true;
        case (tempDataSet.FieldByName('ik_work_type').AsInteger) of
          1: RangeE.Value2:= 'штат';
          2: RangeE.Value2:= 'совм.';
          3: RangeE.Value2:= 'поч.';
        end;
        RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
        RangeE.Value2:= 'план';
        RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+1), 'D' + IntToStr(rowCount+1)];
        RangeE.Value2:= 'факт';
        for i:= 0 to Length(vzColumns)-1 do
        begin
          if tempStoredProc.Locate('ik_vid_zanyat_plan', vzColumns[i], [loPartialKey]) then
          begin
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount)];
            RangeE.Value2:= tempStoredProc.FieldByName('plan_hour').AsFloat;
          end;

          if tempStoredProc.Locate('ik_vid_zanyat_fact', vzColumns[i], [loPartialKey]) then
          begin
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
            RangeE.Value2:= tempStoredProc.FieldByName('fact_hour').AsFloat;
          end;
        end;
        tempStoredProc.Close;
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount)];
        RangeE.Value2:= '=SUM(E' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 2) + IntToStr(rowCount) + ')';
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+1)];
        RangeE.Value2:= '=SUM(E' + IntToStr(rowCount+1) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 2) + IntToStr(rowCount+1) + ')';

        {RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+2), cols[Length(vzColumns) + 3] + IntToStr(rowCount+2)];
        RangeE.MergeCells:= true;
        RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.1, 0);     }
        tempDataSet.Next;
        Inc(rowCount, 2);
        ProgressBar.Position:= ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;
     { RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), cols[Length(vzColumns) + 3] + IntToStr(rowCount+2)];
      RangeE.Interior.Pattern:= xlSolid;
      RangeE.Interior.Color:= 15332083;  }

      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount)];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= captions[j];

      captionStr:= '';
      for I := 0 to groupCaption.Count - 1 do
        captionStr:= captionStr + groupCaption[i] + ', ';
      Delete(captionStr, length(captionStr)-1, 2);
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+1), 'A' + IntToStr(rowCount+2)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= captionStr;

      RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+1), 'D' + IntToStr(rowCount+1)];
      RangeE.Value2:= 'план';
      RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+2), 'D' + IntToStr(rowCount+2)];
      RangeE.Value2:= 'факт';

      tempStr:= '';
      twoTempStr:='';
      i:= prevRowCount;
      while i < rowCount do
      begin
        tempStr:= tempStr + 'E' + IntToStr(i) + ',';              //план для текущей группы
        twoTempStr:= twoTempStr + 'E' + IntToStr(i+1) + ',';      //факт для текущей группы
        inc(i, 2);
      end;
   //   allTempStr:= allTempStr + tempStr;
   //   allTwoTempStr:= allTwoTempStr + twoTempStr;

      Delete(tempStr, Length(tempStr), 1);
      Delete(twoTempStr, Length(twoTempStr), 1);
      RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+1), 'E' + IntToStr(rowCount+1)];
      RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
      RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+2), 'E' + IntToStr(rowCount+2)];
      RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(twoTempStr);
      allTempStr:= allTempStr + 'E' + IntToStr(rowCount+1) + ',';
      allTwoTempStr:= allTwoTempStr + 'E' + IntToStr(rowCount+2) + ',';
      if (tempDataSet.FieldByName('ik_degree').Value <> NULL) then
      begin
        stepTempStr:= stepTempStr + 'E' + IntToStr(rowCount+1) + ',';
        stepTwoTempStr:= stepTwoTempStr + 'E' + IntToStr(rowCount+2) + ',';
      end;
      i:= 1;
      while i < Length(vzColumns) do
      begin
          for k:= 0 to Length(tempStr)-1 do
            if tempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
              tempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];
          for k:= 0 to Length(twoTempStr)-1 do
            if twoTempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
              twoTempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];

          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
          RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
          RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(twoTempStr);
          inc(i);
      end;

    {  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+3), cols[Length(vzColumns) + 3] + IntToStr(rowCount+3)];
      RangeE.MergeCells:= true;
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.1, 0);     }
      Inc(rowCount, 3);
    end;
    tempDataSet.Close;
  end;
  tempDataSet.Free;
  tempStoredProc.Free;

  //выводим всех остепененных

  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns)) + IntToStr(rowCount)];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.2, 0);
  inc(rowCount);

 { RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), cols[Length(vzColumns) + 3] + IntToStr(rowCount+2)];
  RangeE.Interior.Pattern:= xlSolid;
  RangeE.Interior.Color:= 15332083;      }
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount)];
  RangeE.MergeCells:= true;
  RangeE.Font.Bold:= true;
  RangeE.Value2:= 'Итого по остепененным доцентам, профессорам и почасовикам';

  captionStr:= '';
  for I := 0 to stepCaption.Count - 1 do
    captionStr:= captionStr + stepCaption[i] + ', ';
  Delete(captionStr, length(captionStr)-1, 2);
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+1), 'A' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= captionStr;

  RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+1), 'D' + IntToStr(rowCount+1)];
  RangeE.Value2:= 'план';
  RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+2), 'D' + IntToStr(rowCount+2)];
  RangeE.Value2:= 'факт';
  Delete(stepTempStr, Length(stepTempStr), 1);
  Delete(stepTwoTempStr, Length(stepTwoTempStr), 1);
  RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+1), 'E' + IntToStr(rowCount+1)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(stepTempStr);
  RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+2), 'E' + IntToStr(rowCount+2)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(stepTwoTempStr);
  i:= 1;
  while i < Length(vzColumns) do
  begin
    for k:= 0 to Length(stepTempStr)-1 do
      if stepTempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
        stepTempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];
    for k:= 0 to Length(stepTwoTempStr)-1 do
      if stepTwoTempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
        stepTwoTempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(stepTempStr);
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(stepTwoTempStr);
    inc(i);
  end;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+3), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+3)];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.2, 0);
  inc(rowCount, 4);

  // выводим итог по кафедре за семестр

  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+3)];
  RangeE.Interior.Pattern:= xlSolid;
  RangeE.Interior.Color:= 15332083;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount)];
  RangeE.MergeCells:= true;
  RangeE.Font.Bold:= true;
  RangeE.Value2:= 'Итого по кафедре за семестр';
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+1), 'A' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE:= IExcelApp.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE:= IExcelApp.Range['C' + IntToStr(rowCount+1), 'C' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+3), 'A' + IntToStr(rowCount+3)];
  RangeE.Font.Bold:= true;
  RangeE.Value2:= 'Отклонение от плана +/-';
  RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+1), 'D' + IntToStr(rowCount+1)];
  RangeE.Value2:= 'план';
  RangeE:= IExcelApp.Range['D' + IntToStr(rowCount+2), 'D' + IntToStr(rowCount+2)];
  RangeE.Value2:= 'факт';
  Delete(allTempStr, Length(allTempStr), 1);
  Delete(allTwoTempStr, Length(allTwoTempStr), 1);
  RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+1), 'E' + IntToStr(rowCount+1)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allTempStr);
  RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+2), 'E' + IntToStr(rowCount+2)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allTwoTempStr);
  RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+3), 'E' + IntToStr(rowCount+3)];
  RangeE.Value2:= '=' + 'E' + IntToStr(rowCount+2) + '-' + 'E' + IntToStr(rowCount+1);
  i:= 1;
  while i < Length(vzColumns) do
  begin
    for k:= 0 to Length(allTempStr)-1 do
      if allTempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
        allTempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];
    for k:= 0 to Length(allTwoTempStr)-1 do
      if allTwoTempStr[k] = TGeneralController.Instance.GetExcelColumnLetter(i+3)[1] then
        allTwoTempStr[k]:= TGeneralController.Instance.GetExcelColumnLetter(i+4)[1];
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allTempStr);
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allTwoTempStr);
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount+3), TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount+3)];
    RangeE.Value2:= '=' + TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount+2) + '-' + TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount+1);
    inc(i);
  end;

  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+3)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.WrapText:= true;
  RangeE.WrapText:= true;
  RangeE:= IExcelApp.Range['A3', 'A' + IntToStr(rowCount+3)];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(3, 0);
  IExcelApp.Visible[0]:= true;
  IExcelApp:= nil;
  RangeE:= nil;
  groupCaption.Free;
  stepCaption.Free;
except
  RangeE:= nil;
  if IExcelApp <> nil then
  begin
    IExcelApp.DisplayAlerts[0]:= false;
    IExcelApp.Quit;
    IExcelApp:= nil;
  end;
  raise;
end;
end;

procedure TFactNagruzkaController.ExportIndividTeacherPlan(PlanIK,
  TeacherIK: integer; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  vzColumns: array of integer;
  i, j, rowCount: integer;
  tempDataSet: TADODataSet;
  sumFact, sumPlan, tempStr: string;
  isStudentsCalcAsContract: boolean;
  tempStoredProc, secTempStoredProc: TADOStoredProc;
//const
//  cols: array[0..25] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$9:$10';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;
try
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  SetLength(vzColumns, tempDataSet.RecordCount);
  tempDataSet.Close;

  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '1'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'ВЫПИСКА К ИНДИВИДУАЛЬНОМУ ПЛАНУ РАБОТЫ ПРЕПОДАВАТЕЛЯ';

  tempDataSet.CommandText:= 'SELECT Plan_nagr.ik_type_ed, (''УЧЕБНАЯ РАБОТА за '' + LOWER(cName_sem_type) + '' семестр '' + Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1) ' +
    ' + '' учебного года ('' + cName_type_ed + '', '' + LOWER(cName_form_ed) + '')'') as cName_plan From Plan_nagr ' +
    'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type ' +
    'INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  isStudentsCalcAsContract:= tempDataSet.FieldByName('ik_type_ed').AsInteger = 2;
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '2'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= tempDataSet.FieldByName('cName_plan').AsString;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT kafedra.cname_kaf, Fac.Cname_fac, PrepodWorkType.cName_work_type, PrepodDegree.cName_degree, PrepodRank.cName_rank, PrepodCapacity.Cname_capacity, ' +
		'(RTRIM(Prepods.clastname) + '' '' + RTRIM(dbo.Prepods.cfirstname) + '' '' + RTRIM(dbo.Prepods.cotch)) AS FIO ' +
    'FROM Relation_kafedra_prep INNER JOIN kafedra ON Relation_kafedra_prep.ik_kaf = kafedra.ik_kaf ' +
    'INNER JOIN Prepods ON Relation_kafedra_prep.iTab_n = Prepods.iTab_n INNER JOIN Fac ON kafedra.ik_fac = Fac.ik_fac ' +
    'LEFT JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type ' +
    'LEFT JOIN PrepodDegree ON Prepods.ik_degree = PrepodDegree.ik_degree LEFT JOIN PrepodRank ON Prepods.ik_rank = PrepodRank.ik_rank ' +
    'LEFT JOIN PrepodCapacity ON Relation_kafedra_prep.ik_capacity = PrepodCapacity.ik_capacity WHERE Relation_kafedra_prep.ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDataSet.Open;

  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '3'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= tempDataSet.FieldByName('FIO').AsString;

  RangeE:= IExcelApp.Range['A4', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '4'];
  RangeE.MergeCells:= true;
  if tempDataSet.FieldByName('cName_rank').Value <> NULL then
    tempStr:= 'Научное звание: ' + AnsiLowerCase(tempDataSet.FieldByName('cName_rank').AsString)
  else tempStr:= 'Научное звание: <отсутствует>';
  if tempDataSet.FieldByName('cName_degree').Value <> NULL then
    tempStr:= tempStr + ', научная степень: ' + AnsiLowerCase(tempDataSet.FieldByName('cName_degree').AsString)
  else tempStr:= tempStr + ', научная степень: <отсутствует>';
  RangeE.Value2:= tempStr;

  RangeE:= IExcelApp.Range['A5', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '5'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= tempDataSet.FieldByName('Cname_fac').AsString + ', ' + AnsiLowerCase(tempDataSet.FieldByName('cname_kaf').AsString);

  RangeE:= IExcelApp.Range['A6', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '6'];
  RangeE.MergeCells:= true;
  if tempDataSet.FieldByName('Cname_capacity').Value <> NULL then
    tempStr:= 'Должность: ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_capacity').AsString)
  else tempStr:= 'Должность: <не указана>';
  if tempDataSet.FieldByName('cName_work_type').Value <> NULL then
    tempStr:= tempStr + ', вид работы: ' + AnsiLowerCase(tempDataSet.FieldByName('cName_work_type').AsString)
  else tempStr:= tempStr + ', вид работы: : <не указан>';
  RangeE.Value2:= tempStr;
  tempDataSet.Close;

  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '6'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(0.8, 0);

  RangeE:= IExcelApp.Range['A7', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '7'];
  RangeE.MergeCells:= true;

  RangeE:= IExcelApp.Range['A8', 'A9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= '№';
  RangeE:= IExcelApp.Range['B8', 'B9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Дисциплина, Поток';
  RangeE:= IExcelApp.Range['C8', 'C9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Нагрузка';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range['D8', 'D9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Количество студентов';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range['E8', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + '8'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Количество часов по видам учебной нагрузки';
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + '8', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '8'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Всего часов';
  i:= 0;
  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  while not tempDataSet.Eof do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + '9', TGeneralController.Instance.GetExcelColumnLetter(i + 4) + '9'];
    RangeE.Value2:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
    RangeE.Orientation:= 90;
    vzColumns[i]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
    tempDataSet.Next;
    inc(i);
  end;
  tempDataSet.Close;

  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + '9', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + '9'];
  RangeE.Value2:= 'План';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + '9', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + '9'];
  RangeE.Value2:= 'Факт';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '9', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '9'];
  RangeE.Value2:= 'откл. (+/-)';
  RangeE.Orientation:= 90;

  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('GetTeacherIndividualPlan', false);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TeacherIK);

  secTempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('GetTeacherFactNagr', false);
  secTempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 2);
  secTempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  secTempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, 0);
  secTempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, 0);
  secTempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TeacherIK);

  tempStoredProc.Open;
  ProgressBar.Max:= tempStoredProc.RecordCount;

  rowCount:= 10;
  while not tempStoredProc.Eof do
  begin
    RangeE:= IExcelApp.Range['A' + intToStr(rowCount), 'A' + intToStr(rowCount)];
    RangeE.Value2:= (rowCount - 11) div 3 + 1;

    RangeE:= IExcelApp.Range['C' + intToStr(rowCount), 'C' + intToStr(rowCount)];
    RangeE.Value2:= 'план';
    RangeE:= IExcelApp.Range['C' + intToStr(rowCount+1), 'C' + intToStr(rowCount+1)];
    RangeE.Value2:= 'факт';

 {   RangeE:= IExcelApp.Range['D' + intToStr(rowCount), 'D' + intToStr(rowCount)];
    if isStudentsCalcAsContract then
      RangeE.Value2:= tempStoredProc.FieldByName('contract_count').Value
    else RangeE.Value2:= tempStoredProc.FieldByName('budget_count').Value;

    RangeE:= IExcelApp.Range['D' + intToStr(rowCount+1), 'D' + intToStr(rowCount+1)];
    RangeE.Value2:= tempStoredProc.FieldByName('student_count_fact').Value;     }

    if (tempStoredProc.FieldByName('ik_disc_plan').Value = NULL) then
    begin      // по факту
      RangeE:= IExcelApp.Range['B' + intToStr(rowCount), 'B' + intToStr(rowCount)];
      RangeE.Value2:= tempStoredProc.FieldByName('cName_disc_fact').AsString;
      RangeE:= IExcelApp.Range['B' + intToStr(rowCount+1), 'B' + intToStr(rowCount+1)];
      RangeE.Value2:= tempStoredProc.FieldByName('cName_potok_fact').AsString;

      secTempStoredProc.Parameters.ParamByName('@ik_disc').Value:= tempStoredProc.FieldByName('ik_disc_fact').Value;
      secTempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value:= tempStoredProc.FieldByName('ik_potok_fact').Value;
      secTempStoredProc.Open;
      for i:= 0 to Length(vzColumns)-1 do
      if secTempStoredProc.Locate('ik_vid_zanyat_fact', vzColumns[i], [loPartialKey]) then
      begin
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount)];
        RangeE.Value2:= secTempStoredProc.FieldByName('plan_hour').AsFloat;
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
        RangeE.Value2:= secTempStoredProc.FieldByName('fact_hour').AsFloat;
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
        RangeE.Value2:= secTempStoredProc.FieldByName('plan_hour').AsFloat - secTempStoredProc.FieldByName('fact_hour').AsFloat;
      end;
      secTempStoredProc.Close;
    end
    else
    begin           //по плану
      RangeE:= IExcelApp.Range['B' + intToStr(rowCount), 'B' + intToStr(rowCount)];
      RangeE.Value2:= tempStoredProc.FieldByName('cName_disc_plan').AsString;
      RangeE:= IExcelApp.Range['B' + intToStr(rowCount+1), 'B' + intToStr(rowCount+1)];
      RangeE.Value2:= tempStoredProc.FieldByName('cName_potok_plan').AsString;
      secTempStoredProc.Parameters.ParamByName('@ik_disc').Value:= tempStoredProc.FieldByName('ik_disc_plan').Value;
      secTempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value:= tempStoredProc.FieldByName('ik_potok_plan').Value;
      secTempStoredProc.Open;
      for i:= 0 to Length(vzColumns)-1 do
      if secTempStoredProc.Locate('ik_vid_zanyat_plan', vzColumns[i], [loPartialKey]) then
      begin
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount)];
        RangeE.Value2:= secTempStoredProc.FieldByName('plan_hour').AsFloat;
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
        RangeE.Value2:= secTempStoredProc.FieldByName('fact_hour').AsFloat;
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
        RangeE.Value2:= secTempStoredProc.FieldByName('plan_hour').AsFloat - secTempStoredProc.FieldByName('fact_hour').AsFloat;
      end;
      secTempStoredProc.Close;
    end;

    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount)];
    RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(4) + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount) + ')';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1)];
    RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(4) + IntToStr(rowCount+1) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+1) + ')';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + intToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + intToStr(rowCount+2)];
    RangeE.Value2:= '=' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount) + '-' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1);
    RangeE.Font.Bold:= true;

    rowCount:= rowCount + 3;
    tempStoredProc.Next;
    ProgressBar.Position:= ProgressBar.Position + 1;
    Application.ProcessMessages;
  end;
  if (rowCount > 10) then
  begin
    RangeE:= IExcelApp.Range['B' + intToStr(rowCount), 'B' + intToStr(rowCount)];
    RangeE.Value2:= 'Итого';
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 14;
    RangeE:= IExcelApp.Range['C' + intToStr(rowCount), 'C' + intToStr(rowCount)];
    RangeE.Value2:= 'план';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range['C' + intToStr(rowCount+1), 'C' + intToStr(rowCount+1)];
    RangeE.Value2:= 'факт';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range['C' + intToStr(rowCount+2), 'C' + intToStr(rowCount+2)];
    RangeE.Value2:= 'откл.';
    RangeE.Font.Bold:= true;

    i:= 0;
    while (i <= Length(vzColumns)-1) do
    begin
      sumPlan:= '=SUM(';
      sumFact:= '=SUM(';
      for j:= 1 to tempStoredProc.RecordCount do
      begin
        sumPlan:= sumPlan + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(10 + (j-1)*3) + ',';
        sumFact:= sumFact + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(11 + (j-1)*3) + ',';
      end;
      Delete(sumFact, length(sumFact), 1);
      Delete(sumPlan, length(sumPlan), 1);
      sumPlan:= sumPlan + ')';
      sumFact:= sumFact + ')';
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount)];
      RangeE.Value2:= sumPlan;
      RangeE.Font.Bold:= true;
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1)];
      RangeE.Value2:= sumFact;
      RangeE.Font.Bold:= true;
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+2)];
      RangeE.Value2:= '=' + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount) + '-' + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount+1);
      RangeE.Font.Bold:= true;
      inc(i);
    end;

    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount)];
    RangeE.Value2:= '=SUM(E' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount) + ')';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1)];
    RangeE.Value2:= '=SUM(E' + IntToStr(rowCount+1) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 3) + IntToStr(rowCount+1) + ')';
    RangeE.Font.Bold:= true;
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + intToStr(rowCount+2), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + intToStr(rowCount+2)];
    RangeE.Value2:= '=' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 4) + intToStr(rowCount) + '-' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + intToStr(rowCount+1);
    RangeE.Font.Bold:= true;
  end;

  RangeE:= IExcelApp.Range['A8', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount+2)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;  
  IExcelApp.Visible[0]:= true;
  IExcelApp:= nil;
  RangeE:= nil;
except
  RangeE:= nil;
  IExcelApp.DisplayAlerts[0]:= false;
  IExcelApp.Quit;
  IExcelApp:= nil;
  raise;
end;
end;

function TFactNagruzkaController.GetAllSemesterFactHour(YearIK, SemIK,
  TeacherIK: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherHourBySemester';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  tempStoredProc.Parameters.CreateParameter('@ik_sem', ftInteger, pdInput, 0, SemIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('all_fact_hour').AsFloat;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

function TFactNagruzkaController.GetAllSemesterFactHourForTeacher(YearIK, SemIK,
  KafedraIK, TabN: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherHourBySemester';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 4);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  tempStoredProc.Parameters.CreateParameter('@ik_sem', ftInteger, pdInput, 0, SemIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TabN);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('all_fact_hour').AsFloat;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

function TFactNagruzkaController.GetAllTeacherFacts(SourceDataSet: PDataSet;
  KafedraIK, TabN: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_fact From Plan_nagr ' +
    'INNER JOIN Content_plan_nagr ON Plan_nagr.ik_plan_nagr = Content_plan_nagr.ik_plan_nagr INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr '+
    'INNER JOIN Prepod_fact_nagr ON Prepod_plan_nagr.ik_prepod_plan = Prepod_fact_nagr.ik_prepod_plan INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed ' +
    'INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (Plan_nagr.ik_kaf = ' + IntToStr(KafedraIK) + ') and (Prepod_fact_nagr.ik_id_prepod in (SELECT ik_id_prepod FROM Relation_kafedra_prep WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (iTab_n = ' + IntToStr(TabN) + '))) Order By ik_year, ik_sem_type, ik_type_ed, ik_form_ed', 'ik_plan_nagr', isShowFirst, NULL);
end;

function TFactNagruzkaController.GetAllVedomost(PlanIK, CalcUnitIK, ShemaDecomposeType, DiscIK, VidZanyatIK, TeacherIK, PlanStudCount: integer; HourPerUnit: double; WorkDayStart: TTime): TObjectList;
var
  semNumber, potokIK: integer;
  tempDataSet:TADODataSet;
  y,m,d, h, n, ms: word;
  katZach: string;
begin
  Result:= TObjectList.Create(true);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECT * FROM GetInfoFromVedomostForFactNagr(' + IntToStr(PlanIK) + ', ' + IntToStr(CalcUnitIK) + ', ' + IntToStr(ShemaDecomposeType) + ', ' + IntToStr(VidZanyatIK) + ', ' + IntToStr(DiscIK) + ')';

 {
  tempDataSet.CommandText:= 'Select ik_potok, year_value FROM Potok INNER JOIN Year_uch_pl ON Potok.ik_year_enter = Year_uch_pl.ik_year_uch_pl ' +
    'WHERE ik_potok = (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok = (SELECT ik_shema_of_potok FROM Calc_unit WHERE ik_calc_unit = ' + IntToStr(CalcUnitIK) + '))';
  tempDataSet.Open;
  potokIK:= tempDataSet.FieldByName('ik_potok').AsInteger;
  semNumber:= tempDataSet.FieldByName('year_value').AsInteger;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT year_value, ik_sem_type, ik_type_ed FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  case tempDataSet.FieldByName('ik_type_ed').AsInteger of
   1: katZach:= ' = 1';
   else katZach:= ' <> 1';
  end;
  if tempDataSet.FieldByName('ik_sem_type').AsInteger = 1 then
    semNumber:= (tempDataSet.FieldByName('year_value').AsInteger - semNumber)*2 + 1
  else semNumber:= (tempDataSet.FieldByName('year_value').AsInteger - semNumber)*2 + 2;
  tempDataSet.Close;

  case ShemaDecomposeType of
  1: tempDataSet.CommandText:= 'Select DISTINCT v.Ik_ved, v.Dd_exam, ds.StudCount From Vedomost v INNER JOIN (SELECT ik_ved, count(cOsenca) as StudCount FROM Uspev WHERE (cOsenca > 0) ' +
      'and (ik_zach in (SELECT ik_zach FROM StudGrup WHERE ik_kat_zach in (SELECT ik_kat_zach FROM Kat_zach WHERE ik_type_kat ' + katZach + '))) GROUP BY ik_ved) ds ON v.ik_ved = ds.ik_ved ' +
      'INNER JOIN Content_UchPl ON v.ik_upContent = Content_UchPl.ik_upContent INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan ' +
      'Where (v.Dd_exam is not NULL) and (sv_disc.ik_uch_plan = (SELECT ik_uch_plan FROM Calc_unit WHERE ik_calc_unit = ' + IntToStr(CalcUnitIK) + ')) and (sv_disc.ik_disc = ' + IntToStr(DiscIK) + ') and (Content_UchPl.n_sem = ' + IntToStr(semNumber) + ') and (Content_UchPl.ik_vid_zanyat = ' + IntToStr(VidZanyatIK) +
      ') and (v.Itab_n = ' + IntToStr(TeacherIK) + ') and (v.ik_grup in (SELECT ik_grup FROM Grup WHERE ((ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(potokIK) + ')) ' +
        'or (ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(potokIK) + ')))  and (nYear_post = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' + IntToStr(potokIK) + ')))))';
  2, 3: tempDataSet.CommandText:= 'Select DISTINCT v.Ik_ved, v.Dd_exam, ds.StudCount From Vedomost v INNER JOIN (SELECT ik_ved, count(cOsenca) as StudCount FROM Uspev WHERE (cOsenca > 0) ' +
      'and (ik_zach in (SELECT ik_zach FROM StudGrup WHERE ik_kat_zach in (SELECT ik_kat_zach FROM Kat_zach WHERE ik_type_kat ' + katZach + '))) GROUP BY ik_ved) ds ON v.ik_ved = ds.ik_ved ' +
      'INNER JOIN Content_UchPl ON v.ik_upContent = Content_UchPl.ik_upContent INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan ' +
      'Where (v.Dd_exam is not NULL) and (sv_disc.ik_uch_plan = (SELECT ik_uch_plan FROM Calc_unit WHERE ik_calc_unit = ' + IntToStr(CalcUnitIK) + ')) and (sv_disc.ik_disc = ' + IntToStr(DiscIK) + ') and (Content_UchPl.n_sem = ' + IntToStr(semNumber) + ') and (Content_UchPl.ik_vid_zanyat = ' + IntToStr(VidZanyatIK) +
      ') and (v.Itab_n = ' + IntToStr(TeacherIK) + ') and (v.ik_grup in (SELECT ik_grup FROM Relation_calc_unit_grup WHERE ik_calc_unit = ' + IntToStr(CalcUnitIK) + '))';
  end;             }
  tempDataSet.Open;
  tempDataSet.First;
  DecodeTime(WorkDayStart, h, n, ms, ms);
  while not tempDataSet.Eof do
  begin
    DecodeDate(tempDataSet.FieldByName('Dd_exam').AsDateTime, y, m, d);
    Result.Add(TFactEvent.Create(EncodeDateTime(y, m, d, h, n, 0, 0), EncodeDateTime(y, m, d, 9, 0, 0, 0)));
    case ShemaDecomposeType of
    1,2: TFactEvent(Result[Result.Count-1]).StudentCount:= tempDataSet.FieldByName('StudCount').AsInteger;
    3: TFactEvent(Result[Result.Count-1]).StudentCount:= PlanStudCount;
    end;
    TFactEvent(Result[Result.Count-1]).GroupHour:= HourPerUnit;
   // tempFE.CheckBox.Checked:= true;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TFactNagruzkaController.GetDisciplinesFromFact(
  SourceDataSet: PDataSet; TeacherIK, PlanIK: integer;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_plan_nagr.ik_disc, discpln.Cname_disc From Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan ' +
      'INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr INNER JOIN discpln ON Content_plan_nagr.ik_disc = discpln.ik_disc Where (Prepod_fact_nagr.itab_n = ' + IntToStr(TeacherIK) + ') and (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') Order By Cname_disc', 'ik_disc', isShowFirst, NULL);
end;

function TFactNagruzkaController.GetPotoksFromFact(SourceDataSet: PDataSet;
  TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Potok.ik_potok, Potok.Cname_potok From Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan ' +
      'INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok ' +
      'INNER JOIN Potok ON Potok_shema.ik_potok = Potok.ik_potok Where (Prepod_fact_nagr.itab_n = ' + IntToStr(TeacherIK) + ') and (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (Content_plan_nagr.ik_disc = ' + IntToStr(DiscIK) + ') Order By Cname_potok', 'ik_potok', isShowFirst, NULL);
end;

{function TFactNagruzkaController.GetTeacherFacts(SourceDataSet: PDataSet;
  TeacherIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_fact From Plan_nagr ' +
    'INNER JOIN Content_plan_nagr ON Plan_nagr.ik_plan_nagr = Content_plan_nagr.ik_plan_nagr INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr '+
    'INNER JOIN Prepod_fact_nagr ON Prepod_plan_nagr.ik_prepod_plan = Prepod_fact_nagr.ik_prepod_plan INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed ' +
    'INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (Plan_nagr.ik_kaf = (SELECT ik_kaf FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (Prepod_fact_nagr.ik_id_prepod = ' + IntToStr(TeacherIK) + ') Order By ik_year, ik_sem_type, ik_type_ed, ik_form_ed', 'ik_plan_nagr', isShowFirst, defValue);
end;              }

function TFactNagruzkaController.LoadAdditionTeacherFact(
  PlanIK, TeacherIK, DiscIK: Integer; var DiscHour: double): TDataSet;
begin
  Result:= nil;

  if dm.adsVidZanyat.Active then dm.adsVidZanyat.Close;
  if dm.adsAdditionReason.Active then dm.adsAdditionReason.Close;
  

  dm.adsVidZanyat.CommandText:= 'select * from vid_zaniat where iK_vid_zanyat in (select iK_vid_zanyat '+
                                  'from Content_UchPl,sv_disc where Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan '+
                                  'and sv_disc.ik_disc = ' + IntToStr(DiscIK) + ')';

  dm.adsAdditionReason.CommandText:= 'select * from Addition_nagr_reason';


  if dm.aspAdditionFactNagr.Active then dm.aspAdditionFactNagr.Close;
  dm.aspAdditionFactNagr.Parameters.ParamByName('@ik_plan_nagr').Value:= PlanIK;
  dm.aspAdditionFactNagr.Parameters.ParamByName('@ik_disc').Value:= DiscIK;
  dm.aspAdditionFactNagr.Parameters.ParamByName('@ik_id_prepod').Value:= TeacherIK;
  dm.aspAdditionFactNagr.Open;

    DiscHour:= 0;

    while not dm.aspAdditionFactNagr.Eof do
    begin
      DiscHour:= DiscHour + dm.aspAdditionFactNagr.FieldByName('f_all_fact_hour').AsFloat;
      dm.aspAdditionFactNagr.Next;
    end;

  //dm.aspAdditionFactNagr.First;
  Result:= dm.aspAdditionFactNagr;

end;

function TFactNagruzkaController.LoadAllTeacherFactNagr(SourceDataSet: PDataSet; PlanIK, TeacherIK: Integer; var allFactHour: double; incorrectList, correctList: TStringList): TDataSet;
var
  tempDataSet: TADODataSet;
  tempStoredProc: TADOStoredProc;
  DiscPlanHour, DiscFactHour: double;
begin
  Result:= nil;
  incorrectList.Clear;
  correctList.Clear;
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherFactNagr';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TeacherIK);

  if SourceDataSet^.Active then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandText:= 'SELECT * FROM GetAllTeacherNagrForPreview(2, ' + IntToStr(PlanIK) + ', ' + IntToStr(TeacherIK) + ')';
  SourceDataSet^.Open;
  SourceDataSet^.First;
  allFactHour:= 0;
  while not SourceDataSet^.Eof do
  begin
    tempDataSet.CommandText:= 'SELECT sum(hour_unit + student_hour) as PlanHour FROM GetTeacherPlanNagr(1, ' + IntToStr(PlanIK) + ', ' + SourceDataSet^.FieldByName('ik_disc').AsString + ', ' + SourceDataSet^.FieldByName('ik_potok_semestr').AsString + ', ' + IntToStr(TeacherIK) + ')';
    tempDataSet.Open;
    DiscPlanHour:= tempDataSet.FieldByName('PlanHour').AsFloat;
    tempDataSet.Close;

    tempStoredProc.Parameters.ParamByName('@ik_disc').Value:= SourceDataSet^.FieldByName('ik_disc').AsInteger;
    tempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value:= SourceDataSet^.FieldByName('ik_potok_semestr').AsInteger;
    tempStoredProc.Open;
    DiscFactHour:= 0;
    while not tempStoredProc.Eof do
    begin
      DiscFactHour:= DiscFactHour + tempStoredProc.FieldByName('fact_hour').AsFloat;
      tempStoredProc.Next;
    end;
    tempStoredProc.Close;
    SourceDataSet^.Edit;
    SourceDataSet^.FieldByName('plan_hour').AsFloat:= DiscPlanHour;
    SourceDataSet^.FieldByName('fact_hour').AsFloat:= DiscFactHour;
    SourceDataSet^.Post;
    if RoundFloat(DiscPlanHour, 2) > RoundFloat(DiscFactHour, 2) then
      incorrectList.Add(SourceDataSet^.FieldByName('ik_disc').AsString + ' - ' + SourceDataSet^.FieldByName('ik_potok_semestr').AsString);
    if RoundFloat(DiscPlanHour, 2) < RoundFloat(DiscFactHour, 2) then
      correctList.Add(SourceDataSet^.FieldByName('ik_disc').AsString + ' - ' + SourceDataSet^.FieldByName('ik_potok_semestr').AsString);

    allFactHour:= allFactHour + DiscFactHour;
    SourceDataSet^.Next;
  end;
  SourceDataSet^.First;
end;

function TFactNagruzkaController.LoadTakeFactNagrItem(isNeedCreate: boolean; var CreateItem: TTakeFactNagrItem; ContentPlanNagrIK, VidZanyatIK, VidZanyatTypeIK, VidZanyatTypeByTimeIK,
  VidNagruzkiIK: integer): TDataSet;
begin
  if dm.aspTakeFactVZNagr.Active then
    dm.aspTakeFactVZNagr.Close;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@i_type').Value:= 2;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_plan_nagr').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_disc').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_potok').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@fact_ik_id_prepod').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@plan_ik_id_prepod').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_vid_zanyat').Value:= 0;
  dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_vid_nagruzki').Value:= 0;
  dm.aspTakeFactVZNagr.Open;
  while not dm.aspTakeFactVZNagr.Eof do
    dm.aspTakeFactVZNagr.Delete;
  Result:= dm.aspTakeFactVZNagr;
  if isNeedCreate then
    CreateItem:= TTakeFactNagrItem.Create(ContentPlanNagrIK, VidZanyatIK, VidZanyatTypeIK, VidZanyatTypeByTimeIK, VidNagruzkiIK);
end;

function TFactNagruzkaController.LoadTakeFactNagr(TeahcerIK, PlanIK, PlanTeacherIK, DiscIK, PotokIK, PotokNormIK: integer;
  ASemStart, ASemStop: TDate; ATakeFactNagr: TObjectList): TDataSet;
var
  tempDS: TADODataSet;
  tempASP: TADOStoredProc;
  tempTFN: TTakeFactNagrItem;
  byPlanHour, curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curNormPerUnitForMin, curNormPerStudentForMin: double;
  curMinContingent, InPlanCount, AllTaskCount, WeekInPlanCount: integer;
  taskCount: TStringList;
  tempList: TObjectList;
  tempTFVZN: TTakeFactNagrVZItem;
  I: Integer;
begin
  Result:= nil;
  ATakeFactNagr.Clear;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempASP:= TGeneralController.Instance.GetNewADOStoredProc('GetTakeFactNagr', false);
  taskCount:= TStringList.Create;

try
  if dm.aspTakeFactNagr.Active then
    dm.aspTakeFactNagr.Close;

  tempASP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempASP.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempASP.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  tempASP.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
  tempASP.Parameters.CreateParameter('@fact_ik_id_prepod', ftInteger, pdInput, 0, TeahcerIK);
  tempASP.Parameters.CreateParameter('@plan_ik_id_prepod', ftInteger, pdInput, 0, PlanTeacherIK);
  tempASP.Open;

  while not tempASP.Eof do
  begin
    tempTFN:= TTakeFactNagrItem.Create(tempASP.FieldByName('ik_content_plan_nagr').AsInteger, tempASP.FieldByName('ik_vid_zanyat').AsInteger, tempASP.FieldByName('iK_type_vz').AsInteger, tempASP.FieldByName('ikTypeZanyat').AsInteger, tempASP.FieldByName('ik_vid_nagruzki').AsInteger);
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@i_type').Value:= 2;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_plan_nagr').Value:= PlanIK;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_disc').Value:= DiscIK;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_potok').Value:= PotokIK;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@fact_ik_id_prepod').Value:= TeahcerIK;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@plan_ik_id_prepod').Value:= PlanTeacherIK;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_vid_zanyat').Value:= tempASP.FieldByName('ik_vid_zanyat').AsInteger;
    dm.aspTakeFactVZNagr.Parameters.ParamByName('@ik_vid_nagruzki').Value:= tempASP.FieldByName('ik_vid_nagruzki').AsInteger;
    TNagruzkaController.PlanNagruzka.GetNormValues(PotokNormIK, PlanIK, DiscIK, PotokIK, tempASP.FieldByName('ik_vid_zanyat').AsInteger, tempASP.FieldByName('ik_vid_nagruzki').AsInteger, tempASP.FieldByName('ik_content_plan_nagr').AsInteger, curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curMinContingent, curNormPerUnitForMin, curNormPerStudentForMin);
  //  TPlanNagruzkaController.Instance.GetCalcUnits(false, nil, PlanTeacherIK, tempASP.FieldByName('ik_content_plan_nagr').AsInteger, curMinContingent, curNormPerUnit, curNormPerUnitForMin, curInPlanCount);
//    curInPlanCount:= 1;
 //   tempTFN.InPlanCount:= curInPlanCount;
    tempTFN.NormPerUnit:= curNormPerUnit;
    tempTFN.NormPerStudent:= curNormPerStudent;
    tempTFN.MaxNormPerStudent:= curMaxNormPerStudent;
    tempTFN.MinContingent:= curMinContingent;
    tempTFN.NormPerUnitForMin:= curNormPerUnitForMin;
    tempTFN.NormPerStudentForMin:= curNormPerStudentForMin;
    dm.aspTakeFactVZNagr.Open;
    while not dm.aspTakeFactVZNagr.Eof do
    begin
      // определим inPlanCount для этой расч. единицы
      taskCount.Clear;
      if not TNagruzkaController.PlanNagruzka.GetUchPlanParametrsForCalcUnit(dm.aspTakeFactVZNagr.FieldByName('ik_uch_plan').AsInteger, TNagruzkaController.PlanNagruzka.GetSemesterNumberForPotok(tempASP.FieldByName('ik_content_plan_nagr').AsInteger), tempASP.FieldByName('ik_content_plan_nagr').AsInteger, tempASP.FieldByName('ik_vid_zanyat').AsInteger, byPlanHour, inPlanCount, taskCount, WeekInPlanCount) then
      begin
        inPlanCount:= 1;
        taskCount.Add('1');
      end;
      AllTaskCount:= 0;
      for i := 0 to taskCount.Count - 1 do
        AllTaskCount:= AllTaskCount + StrToInt(taskCount[i]);

      tempDS.CommandText:= 'Select * From Prepod_fact_nagr Where (ik_prepod_plan = ' + dm.aspTakeFactVZNagr.FieldByName('ik_prepod_plan').AsString + ') and (ik_id_prepod = ' + IntToStr(TeahcerIK) + ')';
      tempDS.Open;
      if tempASP.FieldByName('iK_type_vz').AsInteger = 3 then
        tempList:= TSheduleController.MainFunctions.GetAllEventsInInterval(ASemStart, ASemStop, dm.aspTakeFactVZNagr.FieldByName('ik_prepod_plan').AsInteger, TeahcerIK)
      else
      begin
        tempList:= TObjectList.Create(true);
        while not tempDS.Eof do
        begin
          tempList.Add(TFactEvent.Create(tempDS.FieldByName('d_date_execute').AsDateTime, tempDS.FieldByName('d_date_execute').AsDateTime));
          tempDS.Next;
        end;
      end;
      tempTFVZN:= tempTFN.AddTakeFactNagrVZItem(TTakeFactNagrVZItem.Create(dm.aspTakeFactVZNagr.FieldByName('ik_prepod_plan').AsInteger, dm.aspTakeFactVZNagr.FieldByName('ik_calc_unit').AsInteger, dm.aspTakeFactVZNagr.FieldByName('cName_calc_unit').AsString, dm.aspTakeFactVZNagr.FieldByName('by_plan_number').AsInteger, GetTaskCountFromList(taskCount, dm.aspTakeFactVZNagr.FieldByName('by_plan_number').AsInteger), dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger, tempList, true, WeekInPlanCount, dm.aspTakeFactVZNagr.FieldByName('bit_calc_students_only').AsBoolean));
//      tempList.Free;

      if (dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger < curMinContingent) then
      begin
        if (dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger * curNormPerStudentForMin * AllTaskCount > dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger * curMaxNormPerStudent) and (curMaxNormPerStudent <> 0) then
          tempTFVZN.NormPerStudent:= (curMaxNormPerStudent/AllTaskCount)
        else
          tempTFVZN.NormPerStudent:= curNormPerStudentForMin;
        tempTFVZN.NormPerUnit:= curNormPerUnitForMin;
      end
      else
      begin
        if (dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger * curNormPerStudent * AllTaskCount > dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger * curMaxNormPerStudent) and (curMaxNormPerStudent <> 0) then
          tempTFVZN.NormPerStudent:= (curMaxNormPerStudent/AllTaskCount)
        else
          tempTFVZN.NormPerStudent:= curNormPerStudent;
        tempTFVZN.NormPerUnit:= curNormPerUnit;
      end;

      for I := 0 to tempTFVZN.GetEventList.Count - 1 do
      begin
        if tempASP.FieldByName('iK_type_vz').AsInteger = 3 then
        begin
          if tempDS.Locate('d_date_execute', tempTFVZN.Events[i].EventStart, [loPartialKey]) then
          begin
            tempTFVZN.Events[i].CheckBox.Checked:= true;
            tempTFVZN.Events[i].GroupHour:= 2;
            tempTFVZN.Events[i].StudentCount:= tempDS.FieldByName('i_fact_student').AsInteger;
          end
          else
          begin
            tempTFVZN.Events[i].CheckBox.Checked:= false;
            tempTFVZN.Events[i].GroupHour:= 2;
            tempTFVZN.Events[i].StudentCount:= dm.aspTakeFactVZNagr.FieldByName('i_student_count').AsInteger;
          end;
        end
        else
        begin
          if tempDS.Locate('d_date_execute', tempTFVZN.Events[i].EventStart, [loPartialKey]) then
          begin
            tempTFVZN.Events[i].CheckBox.Checked:= true;
            if RoundFloat(tempDS.FieldByName('f_all_fact_hour').AsFloat - tempDS.FieldByName('i_fact_student').AsFloat * tempTFVZN.NormPerStudent * tempTFVZN.TaskCount * tempTFVZN.WeekInPlanCount, 2) > 0 then
              tempTFVZN.Events[i].GroupHour:= RoundFloat(tempDS.FieldByName('f_all_fact_hour').AsFloat - tempDS.FieldByName('i_fact_student').AsFloat * tempTFVZN.NormPerStudent * tempTFVZN.TaskCount * tempTFVZN.WeekInPlanCount, 2)
            else tempTFVZN.Events[i].GroupHour:= 0;
            tempTFVZN.Events[i].StudentCount:= tempDS.FieldByName('i_fact_student').AsInteger;
          end;
        end;
      end;
      tempDS.Close;
      dm.aspTakeFactVZNagr.Next;
    end;
    dm.aspTakeFactVZNagr.Close;
    ATakeFactNagr.Add(tempTFN);
    tempASP.Next;
  end;

  dm.aspTakeFactNagr.Parameters.ParamByName('@i_type').Value:= 3;
  dm.aspTakeFactNagr.Parameters.ParamByName('@ik_plan_nagr').Value:= PlanIK;
  dm.aspTakeFactNagr.Parameters.ParamByName('@ik_disc').Value:= DiscIK;
  dm.aspTakeFactNagr.Parameters.ParamByName('@ik_potok').Value:= PotokIK;
  dm.aspTakeFactNagr.Parameters.ParamByName('@fact_ik_id_prepod').Value:= TeahcerIK;
  dm.aspTakeFactNagr.Parameters.ParamByName('@plan_ik_id_prepod').Value:= PlanTeacherIK;
  dm.aspTakeFactNagr.Open;
  while not dm.aspTakeFactNagr.Eof do
    dm.aspTakeFactNagr.Delete;

  tempASP.First;
  while not tempASP.Eof do
  begin
    dm.aspTakeFactNagr.Insert;
    dm.aspTakeFactNagr.FieldByName('ik_content_plan_nagr').AsInteger:= tempASP.FieldByName('ik_content_plan_nagr').AsInteger;
    dm.aspTakeFactNagr.FieldByName('ik_vid_zanyat').AsInteger:= tempASP.FieldByName('ik_vid_zanyat').AsInteger;
    dm.aspTakeFactNagr.FieldByName('cName_vid_zanyat').AsString:= tempASP.FieldByName('cName_vid_zanyat').AsString;
    dm.aspTakeFactNagr.FieldByName('iK_type_vz').AsInteger:= tempASP.FieldByName('iK_type_vz').AsInteger;
    dm.aspTakeFactNagr.FieldByName('ik_vid_nagruzki').AsInteger:= tempASP.FieldByName('ik_vid_nagruzki').AsInteger;
    dm.aspTakeFactNagr.FieldByName('Cname_vid_nagruzki').AsString:= tempASP.FieldByName('Cname_vid_nagruzki').AsString;
   // dm.aspTakeFactNagr.FieldByName('for_plan_hour').AsFloat:= tempASP.FieldByName('cur_fact_hour').AsFloat; // изменить
    dm.aspTakeFactNagr.FieldByName('f_hour_per_unit').AsFloat:= tempASP.FieldByName('cur_fact_hour').AsFloat;
    dm.aspTakeFactNagr.Post;
    tempASP.Next;
  end;
  tempASP.Close;
  dm.aspTakeFactNagr.First;
  Result:= dm.aspTakeFactNagr;
finally
  if Assigned(taskCount) then taskCount.Free;
  if tempASP.Active then tempASP.Close;
  tempASP.Free;
  if tempDS.Active then tempDS.Close;
  tempDS.Free;
end;
end;

function TFactNagruzkaController.SaveAdditionFact(TeacherIK, PlanIK, DiscIK: integer): boolean;
var  tempDS: TADODataSet;
     k: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'Select * from Addition_prepod_fact';
  tempDS.Open;
  try
    dm.aspAdditionFactNagr.First;
    while (not dm.aspAdditionFactNagr.Eof) do
    begin
      if (dm.aspAdditionFactNagr.FieldByName('f_all_fact_hour').AsFloat = 0.0) then
        dm.aspAdditionFactNagr.Delete
      else dm.aspAdditionFactNagr.Next;
    end;

    dm.aspAdditionFactNagr.First;
    while (not dm.aspAdditionFactNagr.Eof) do
    begin
      if dm.aspAdditionFactNagr.FieldByName('ik_addition').Value = NULL then      // значит надо вставить запись
      begin
        tempDS.Insert;
        tempDS.FieldByName('ik_plan_nagr').Value:= PlanIK;
        tempDS.FieldByName('ik_disc').Value:= DiscIK;
        tempDS.FieldByName('ik_id_prepod').Value:= TeacherIK;
        tempDS.FieldByName('ik_vid_zanyat').Value:= dm.aspAdditionFactNagr.FieldByName('ik_vid_zanyat').Value;
        tempDS.FieldByName('ik_vid_nagruzki').Value:= dm.aspAdditionFactNagr.FieldByName('ik_vid_nagruzki').Value;
        tempDS.FieldByName('ik_addition_reason').Value:= dm.aspAdditionFactNagr.FieldByName('ik_addition_reason').Value;
        tempDS.FieldByName('i_fact_student').Value:= dm.aspAdditionFactNagr.FieldByName('i_fact_student').Value;
        tempDS.FieldByName('f_all_fact_hour').Value:= dm.aspAdditionFactNagr.FieldByName('f_all_fact_hour').Value;

        tempDS.Post;
      end;
      dm.aspAdditionFactNagr.Next;
    end;

    while not tempDS.Eof do
    begin
      if (tempDS.FieldByName('ik_addition').Value <> NULL) then
      begin
        if not dm.aspAdditionFactNagr.Locate('ik_addition', tempDS.FieldByName('ik_addition').AsInteger, [loPartialKey]) then
          tempDS.Delete
        else
        begin
          tempDS.Edit;
          tempDS.FieldByName('ik_vid_zanyat').Value:= dm.aspAdditionFactNagr.FieldByName('ik_vid_zanyat').Value;
          tempDS.FieldByName('ik_vid_nagruzki').Value:= dm.aspAdditionFactNagr.FieldByName('ik_vid_nagruzki').Value;
          tempDS.FieldByName('ik_addition_reason').Value:= dm.aspAdditionFactNagr.FieldByName('ik_addition_reason').Value;
          tempDS.FieldByName('i_fact_student').Value:= dm.aspAdditionFactNagr.FieldByName('i_fact_student').Value;
          tempDS.FieldByName('f_all_fact_hour').Value:= dm.aspAdditionFactNagr.FieldByName('f_all_fact_hour').Value;
          tempDS.Post;
          tempDS.Next;
        end;
      end
      else tempDS.Next;
    end;

    try
      tempDS.UpdateBatch();
    except
      on E: EOleException do
      begin
        K:= E.ErrorCode;
        if (k = ADO_ERROR_TWO) or (k = ADO_ERROR) then
          Result:= true
        else raise;
      end;
      on E: Exception do raise;
    end;


    Result:= true;
  finally
    tempDS.Close;
    tempDS.Free;

    dm.aspAdditionFactNagr.EnableControls;
  end;

end;

function TFactNagruzkaController.SaveFact(TeacherIK: integer; TakeFactNagr: TObjectList): boolean;
var
  tempDataSet: TADODataSet;
  tempTFN: TTakeFactNagrItem;
  i, j, k: integer;
  isInDB: boolean;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  i:= 0;
  while i <= TakeFactNagr.Count - 1 do
  begin
    tempTFN:= TakeFactNagr[i] as TTakeFactNagrItem;
    if tempTFN.IsRemoved then
    begin
      for j := 0 to tempTFN.GetItemsList.Count - 1 do
      begin
        tempDataSet.CommandText:= 'Select * From Prepod_fact_nagr Where (ik_prepod_plan = ' + IntToStr(tempTFN.Items[j].PrepodPlanNagrIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')';
        tempDataSet.Open;
        tempDataSet.First;
        while not tempDataSet.Eof do
          tempDataSet.Delete;
        tempDataSet.UpdateBatch();
        tempDataSet.Close;
      end;
      TakeFactNagr.Delete(i);
      continue;
    end;
    j:= 0;
    while j <= tempTFN.GetItemsList.Count - 1 do
    begin
      tempDataSet.CommandText:= 'Select * From Prepod_fact_nagr Where (ik_prepod_plan = ' + IntToStr(tempTFN.Items[j].PrepodPlanNagrIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')';
      tempDataSet.Open;
      tempDataSet.First;
      if tempTFN.Items[j].IsRemoved then
      begin
        while not tempDataSet.Eof do
          tempDataSet.Delete;
        tempDataSet.UpdateBatch();
        tempDataSet.Close;
        tempTFN.DeleteTakeFactNagrVZItem(j);
        continue;
      end;
      while not tempDataSet.Eof do
      begin
        isInDB:= false;
        for k := 0 to tempTFN.Items[j].GetEventList.Count - 1 do
        begin
          if (tempDataSet.FieldByName('d_date_execute').AsDateTime = tempTFN.Items[j].Events[k].EventStart)
            and tempTFN.Items[j].Events[k].CheckBox.Checked then
          begin
            tempDataSet.Edit;
            tempDataSet.FieldByName('i_fact_student').AsInteger:= tempTFN.Items[j].Events[k].StudentCount;
            tempDataSet.FieldByName('f_all_fact_hour').AsFloat:= RoundFloat((tempTFN.Items[j].Events[k].StudentCount * tempTFN.Items[j].NormPerStudent + tempTFN.Items[j].Events[k].GroupHour) * tempTFN.Items[j].TaskCount * tempTFN.Items[j].WeekInPlanCount, 2);
            tempDataSet.Post;
            isInDB:= true;
            break;
          end;
        end;
        if isInDB then
          tempDataSet.Next
        else
          tempDataSet.Delete;
      end;
      for k := 0 to tempTFN.Items[j].GetEventList.Count - 1 do
      begin
        if tempTFN.Items[j].Events[k].CheckBox.Checked then
          if not tempDataSet.Locate('d_date_execute', tempTFN.Items[j].Events[k].EventStart, [loPartialKey]) then
          begin
            tempDataSet.Insert;
            tempDataSet.FieldByName('i_fact_student').AsInteger:= tempTFN.Items[j].Events[k].StudentCount;
            tempDataSet.FieldByName('f_all_fact_hour').AsFloat:= RoundFloat((tempTFN.Items[j].Events[k].StudentCount * tempTFN.Items[j].NormPerStudent + tempTFN.Items[j].Events[k].GroupHour) * tempTFN.Items[j].TaskCount * tempTFN.Items[j].WeekInPlanCount, 2);
            tempDataSet.FieldByName('ik_prepod_plan').AsInteger:= tempTFN.Items[j].PrepodPlanNagrIK;
            tempDataSet.FieldByName('ik_id_prepod').AsInteger:= TeacherIK;
            tempDataSet.FieldByName('d_date_execute').AsDateTime:= tempTFN.Items[j].Events[k].EventStart;
            tempDataSet.Post;
          end;
      end;
      try
      tempDataSet.UpdateBatch();
      except
      end;
      tempDataSet.Close;
      inc(j);
    end;
    inc(i);
  end;
  tempDataSet.Free;
  Result:= true;
end;

function TFactNagruzkaController.SaveFactWithoutSheduler(TeacherIK: integer;
  aTakeFactNagr: TObjectList): boolean;
var tempSP: TADOStoredProc;
   i: integer;
begin
  tempSP:= TADOStoredProc.Create(nil);
  tempSP.ProcedureName:= 'UpdateFactNagrForTeacher';
  tempSP.Connection:= dm.DBConnect;
  tempSP.Parameters.CreateParameter('@ik_prepod_plan', ftInteger, pdInput, 0, 0);
  tempSP.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, 0);
  tempSP.Parameters.CreateParameter('@cDate', ftDateTime, pdInput, 0, StrToDateTime('01.01.2000'));
  tempSP.Parameters.CreateParameter('@fact_hour', ftFloat, pdInput, 0, 0);
  tempSP.Parameters.CreateParameter('@fact_student', ftInteger, pdInput, 0, 0);
  try
    for I := 0 to aTakeFactNagr.Count - 1 do
    begin

    tempSP.Parameters.ParamByName('@ik_prepod_plan').Value := (aTakeFactNagr.Items[i] as TTakeFactNagrItem).PlanItemIK;
    tempSP.Parameters.ParamByName('@ik_id_prepod').Value := TeacherIK;
    tempSP.Parameters.ParamByName('@cDate').Value := DateTimeToStr(Now);
    tempSP.Parameters.ParamByName('@fact_hour').Value := (aTakeFactNagr.Items[i] as TTakeFactNagrItem).FactHours;
    tempSP.Parameters.ParamByName('@fact_student').Value := (aTakeFactNagr.Items[i] as TTakeFactNagrItem).FactStudent;
    tempSP.ExecProc;
    
    end;
  finally
    tempSP.Free;
  end;

  Result:= true;

end;

end.
