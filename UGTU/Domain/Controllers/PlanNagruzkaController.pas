unit PlanNagruzkaController;
 {#Author villain@ist.ugtu.net}
interface

uses GeneralController, NagruzkaClasses, ComCtrls, ADODB, DB, uDM, Classes, Contnrs, StdCtrls, Forms, Controls, SysUtils,
    Windows, Messages, Variants, ExcelXP, ComObj, NagruzkaController;

const
  BezDeleniyaType = 1; //идентификатор типа схемы деления "Без деления потока"
  ContrToBudgPereves = 0.8;

type
  TPlanNagruzkaController = class(TInterfacedObject, IPlanNagruzkaController)
  public
    procedure CloseContentPlanNagr();
    procedure ClosePlanNormTime();

  //  function GetPlanName(PlanIK: integer): string;

    function GetAllTeacherPlanHour(PlanIK, TeacherIK: integer): double;
    function GetAllSemesterPlanHour(YearIK, SemIK, TeacherIK: integer): double;
    function GetAllSemesterPlanHourForTeacher(YearIK, SemIK, KafedraIK, TabN: integer): double;
    function GetInCommissionNumbersFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetDisciplinesFromDepPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean): Variant;
    procedure GetDisciplinesFromPotok(SourceDataSet: PDataSet; PotokIK, PlanNagrIK: integer);
    function GetDisciplinesFromTeahcerPlan(SourceDataSet: PDataSet; PlanIK, TeacherIK: integer;  var planHour: double; isShowFirst, isNeedCalc: boolean; defaultValue: Variant): Variant;
    function GetPotoksFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetPotoksFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK: integer; isShowFirst: boolean): integer;
    function GetPotoksForPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean): Variant;
    function GetCalculationSchemeGrid(AOwner: TComponent; PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount: integer; ifDiscCalcAsPractice: boolean): double;
    function GetByPlanNumbers(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, CalcUnitIK, InCommissionNumber: integer; isShowFirst: boolean): Variant;
    function GetCalcUnits(UnitsOwner: TComponent; TeacherIK, ContentPlannagrIK, MinContingent: integer; NormPerUnit, NormPerUnitForMin: double): TObjectList;
    function GetUchPlanParametrsForCalcUnit(UchPlanIK, SemesterNumber, ContentPlanNagrIK, VidZanyatIK: integer; var inPlanHour: double; var inPlanCount: integer; taskCounts: TStringList; var WeekInPlanCount: integer): boolean;
    function GetSemesterNumberForPotok(PotokIK, PlanIK: integer): integer; overload;
    function GetSemesterNumberForPotok(ContentPlanNagrIK: integer): integer; overload;
    function GetDistributedNagr(PlanIK, DiscIK, PotokSemIK: integer): TDataSet;
    function GiveDutyToAnotherTeacher(SourceTeacherIK, TargetTeacherIK, PlanIK, DiscIK, PotokIK, ContentPlanNagrIK: integer): boolean;
    procedure GetPickListForVidNagruzki(PotokIK, DiscIK, DiscTypeIK, VidZanyatIK: integer; outputPickList: TStrings);
    procedure FullPickListForVidNagruzki(DiscIK, DiscTypeIK, VidZanyatIK: integer; outputPickList: TStrings);
    function GetVidZanyatsFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK, PotokIK: integer; isShowFirst: boolean): Variant;
    function GetVidNagruzkiFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK, PotokIK, VidZanyatIK: integer; isShowFirst: boolean): Variant;
    function GetVidZanyatFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK, PotokSemIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    procedure SetPlanStatus(PlanIK: integer; CloseStatus: boolean);
    function GetCurrentNormOfTime(VidZanyatIK, VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean; var NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; var MinContingent: integer): boolean;
    function GetDefaultNormOfTime(VidZanyatIK, VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean; var NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; var MinContingent: integer): boolean;
    function GetCalcUnitsFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, InComissionNumber: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetTeacherIKFromTeacherPlan(PlanIK, DiscIK, PotokIK, TeacherIK: integer): TADODataSet;
    function GetPlanHourForShedule(PrepodPlanIKList: string): double;
    procedure GetNormValues(NormIK, PlanIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK, ContentPlanNagrIK: integer; var NormPerUnit, NormPerStudent, MaxNormPerStudent: double; var MinRequedContingent: integer; var NormPerUnitForMin, NormPerStudentForMin: double);
    procedure GetPotokInfo(PlanIK, PotokSemIK: integer; var StudCount, Course, grupCount, subgroupCount: string);
    function GetPotokShemes(PlanIK, PotokIK: integer): TDataSet;
    function GetPlanHourForDiscipline(PlanIK, DiscIK, PotokIK: integer; var plan_hour, busy_hour: double): boolean;
    function GetPlans(SourceDataSet: PDataSet; KafedraIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetPlansForTeacher(SourceDataSet: PDataSet; TeacherIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetTeachersFromPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;

    procedure DeletePlanNagr(PlanIK: integer);
    procedure DeleteDiscFromPlanNagr(PlanIK, PotokSemIK, DiscIK: Integer);
    function DeleteDiscFromTeacherPlanNagr(TeacherIK, PlanIK, DiscIK, PotokIK: integer): boolean;
    procedure DeleteVidZanyatFromTeacherPlanNagr(TeacherIK, PlanIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK: integer);

    function DoIHavePermsOnNormException(): boolean;

    procedure ExportDitributedNagr(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportDitributedNagrForShedule(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportKafedraPlan(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportKafedraPlanForYear(KafedraIK, YearIK: integer; ProgressBar: TProgressBar);

    function IsConflictOnAutoBuildExists(conflictList: TObjectList; AShemaTypeName, APotokName: string; AItemType: TConflictOnAutoBuildItemType): boolean;

    function LoadAllPlanNagr(PlanIK: integer): TDataSet;
    procedure LoadAllTeacherPlanNagr(SourceDataSet:PDataSet; PlanIK, TeacherIK: Integer; var AllPlanHour: double);
    function LoadContentPlanNagr(isEdit: boolean; PlanIK, PotokSemIK, DiscIK, DiscTypeIK{, semesterNumber}: Integer; DiscTypeCalcAsPractice: boolean; var DiscHour, RaspHour:double; isNeedCalc: boolean): TDataSet;
    function LoadTakeNagr(UnitsOwner: TComponent; PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK, TeacherIK: integer; ATakeNagr: TObjectList): TDataSet;
    procedure LoadPlanNagrByDiscAvto(PlanIK, DiscIK, PotokSemIK: integer; DiscName, PotokName: string; conflictDecomposeType: TObjectList);
    procedure LoadPlanNagrAvto(PlanIK: integer; conflictList: TObjectList);
    function LoadVidZanyatTaskCountInfo(VidZanyatIK, VidNagruzkiIK: integer; planNumberPickList: TStrings): TADODataSet;

    function SaveDiscToTeacher(TeacherIK: integer; ATakeNagr: TObjectList): boolean;
    function SaveContingient(YearIK, FacIK: integer; PlanContingentList: TObjectList): boolean;
    function SavePlan(var PlanIK: integer; KafedraIK, YearIK, SemTypeIK, TypeEdIK, FormEdIK: integer): boolean;
    function SavePlanContent(PlanIK, DiscIK, PotokIK: integer; DiscName, potokName: string; DiscTypeCalcAsPractice: boolean; conflictList: TObjectList): boolean;
    function SetNormOfTimeExceptionForCurrentDisc(DiscCalcAsPractice: boolean; VidZanyatIK, VidNagruzkiIK: integer; NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; MinContingent: integer): boolean;

    procedure TakeAllNagrOnDiscToTeacher(TeacherIK, PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK: integer; ATakeNagr: TObjectList);

    //версия 4: работа с группами
    procedure GetSpecByFac(SourceDataSet: PDataSet; FacIK: integer; isShowFirst: boolean; defaultValue: Variant);
    procedure GetProfileBySpec(SourceDataSet: PDataSet; SpecFacIK: integer; isShowFirst: boolean; defaultValue: Variant);


    //версия 4: работа с потоками
    procedure AddGrupsToPotok(PotokSemestrID: integer; aGrups: TStringList);

    //удаление старой нагрузки по группам
    function DeleteOldNagrForGrup(YearIK, SemIK, DiscIK, KafIK: integer; aGrups: TStringList): boolean;

  end;

implementation

uses ExceptionBase;

//  TAColNames_two: array[1..5] of string = ('Название расч. единицы', '№ в комиссии', 'Часов на р.е.','Кол-во студентов', 'Всего часов');

{ TPlanNagruzkaController }

procedure TPlanNagruzkaController.AddGrupsToPotok(PotokSemestrID: integer; aGrups: TStringList);
var
  tempStoredProc: TADOStoredProc;
  i: integer;
begin
 try
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'Nagr_AddGrupToPotok';
  tempStoredProc.Connection:= dm.DBConnect;

  tempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, PotokSemestrID);
  tempStoredProc.Parameters.CreateParameter('@ik_grup', ftInteger, pdInput, 0, 0);
  for I := 0 to aGrups.Count - 1 do
  begin
    tempStoredProc.Parameters.ParamByName('@ik_grup').Value := StrToInt(aGrups[i]);
    tempStoredProc.ExecProc;
  end;
  finally
      tempStoredProc.Free;
  end;
  // внимание!!! Удалить все старые потоки и нагрузки


end;

procedure TPlanNagruzkaController.CloseContentPlanNagr;
begin
  if dm.aspContentPlanNagr.Active then
     dm.aspContentPlanNagr.Close;
  dm.aspContentPlanNagr.Tag:= -1;
  if dm.adsNormOfTime.Active then dm.adsNormOfTime.Close;
  if dm.qContentUchPlan.Active then dm.qContentUchPlan.Close;
end;

procedure TPlanNagruzkaController.ClosePlanNormTime;
begin
  if dm.aspPlanNormTime.Active then
     dm.aspPlanNormTime.Close;
end;

procedure TPlanNagruzkaController.DeleteDiscFromPlanNagr(PlanIK, PotokSemIK,
  DiscIK: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'UpdateDiscInPlanNagr';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  tempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, PotokSemIK);
  try
      tempStoredProc.ExecProc;
      tempStoredProc.Free;
  except
      tempStoredProc.Free;
      raise;
  end;
end;

function TPlanNagruzkaController.DeleteDiscFromTeacherPlanNagr(TeacherIK,
  PlanIK, DiscIK, PotokIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'UpdateDiscInPlanNagr';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  tempStoredProc.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TPlanNagruzkaController.DeleteOldNagrForGrup(YearIK, SemIK,
  DiscIK, KafIK: integer; aGrups: TStringList): boolean;
var
  i: integer;
begin
 try
  Result := false;
  dm.aspDeleteOldNagr.Parameters.ParamByName('@ik_year').Value := YearIK;
  dm.aspDeleteOldNagr.Parameters.ParamByName('@ik_sem').Value := SemIK;
  dm.aspDeleteOldNagr.Parameters.ParamByName('@ik_disc').Value := DiscIK;
  dm.aspDeleteOldNagr.Parameters.ParamByName('@ik_kaf').Value := KafIK;

  for I := 0 to aGrups.Count - 1 do
  begin
    dm.aspDeleteOldNagr.Parameters.ParamByName('@ik_grup').Value := StrToInt(aGrups[i]);
    dm.aspDeleteOldNagr.ExecProc;
  end;
  Result := true;
  except

  end;

end;

procedure TPlanNagruzkaController.DeletePlanNagr(PlanIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'UpdatePlanNagr';
  tempStoredProc.Connection:= dm.DbConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  try
      tempStoredProc.ExecProc;
      tempStoredProc.Free;
  except
      tempStoredProc.Free;
      raise;
  end;
end;

procedure TPlanNagruzkaController.ExportKafedraPlan(PlanIK: integer;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  KafedraName, PlanName: string;
  vzColumns: array of integer;
  discHour, vzHour: double;
  i, rowCount: integer;
  tempDataSet, planNagrDataSet, discPlanNagr: TADODataSet;
//const
//  cols: array[1..26] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
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
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$3:$3';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDataSet.Open;
  KafedraName:= tempDataSet.FieldByName('cshort_name_kaf').AsString;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT (Cname_sem_type  + '' семестр '' +  Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1) + '' учебного года ('' + cName_type_ed + '', '' + cName_form_ed + '' форма обучения) '') as cName_plan From Plan_nagr ' +
    'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type ' +
    'INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  PlanName:= tempDataSet.FieldByName('cName_plan').AsString;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  SetLength(vzColumns, tempDataSet.RecordCount);
  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '1'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Расчет нагрузки профессорско-преподавательского состава на кафедре ' + KafedraName;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.5, 0);

  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '2'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= PlanName;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.5, 0);

  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '2'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Font.Size:= 14;

  RangeE:= IExcelApp.Range['A3', 'A3'];
  RangeE.Value2:= '№';
  RangeE:= IExcelApp.Range['B3', 'B3'];
  RangeE.Value2:= 'Дисциплина';
  RangeE:= IExcelApp.Range['C3', 'C3'];
  RangeE.Value2:= 'Поток';
  RangeE:= IExcelApp.Range['D3', 'D3'];
  RangeE.Value2:= 'Курс';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range['E3', 'E3'];
  RangeE.Value2:= 'Кол. гр.';
  RangeE.Orientation:= 90;
  RangeE:= IExcelApp.Range['F3', 'F3'];
  RangeE.Value2:= 'Кол. студ.';
  RangeE.Orientation:= 90;
  i:= 1;
  while not tempDataSet.Eof do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 5) + '3', TGeneralController.Instance.GetExcelColumnLetter(i + 5) + '3'];
    RangeE.Value2:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
    RangeE.Orientation:= 90;
    vzColumns[i-1]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
    tempDataSet.Next;
    inc(i);
  end;
  tempDataSet.Close;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '3'];
  RangeE.Value2:= 'ИТОГО';

  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '3'];
//  RangeE.WrapText:= True;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;

  planNagrDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  discPlanNagr:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    planNagrDataSet.CommandText:= 'SELECT * FROM GetContentOfDepartmentPlanNagr(1, ' + IntToStr(PlanIK) + ', 0)';
    planNagrDataSet.Open;
    ProgressBar.Max:= planNagrDataSet.RecordCount;

    rowCount:= 4;
    while not planNagrDataSet.Eof do
    begin
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= rowCount-3;
      RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('cName_disc').AsString;
      RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('Cname_potok').AsString;
      RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('course_number').AsString;
      RangeE:= IExcelApp.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= IntToStr(planNagrDataSet.FieldByName('group_count').AsInteger + planNagrDataSet.FieldByName('sep_group_count').AsInteger);
      RangeE:= IExcelApp.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('student_count').AsString;

      discPlanNagr.CommandText:= 'SELECT ik_vid_zanyat, sum(plan_hour) as vz_plan_hour FROM GetPlanNagrForDiscipline(' + IntToStr(PlanIK) + ', ' + planNagrDataSet.FieldByName('ik_disc').AsString + ', ' + planNagrDataSet.FieldByName('ik_potok_semestr').AsString +  ') GROUP BY ik_vid_zanyat';
      discPlanNagr.Open;
      while not discPlanNagr.Eof do
      begin
        for i:= 1 to Length(vzColumns) do
          if (discPlanNagr.FieldByName('ik_vid_zanyat').AsInteger = vzColumns[i-1]) then
          begin
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount)];
            RangeE.Value2:= discPlanNagr.FieldByName('vz_plan_hour').AsFloat;
            break;
          end;
        discPlanNagr.Next;
      end;
      discPlanNagr.Close;
      {LoadContentPlanNagr(false, PlanIK, planNagrDataSet.FieldByName('ik_potok').AsInteger, planNagrDataSet.FieldByName('ik_disc').AsInteger, planNagrDataSet.FieldByName('ik_type_disc').AsInteger, planNagrDataSet.FieldByName('n_sem').AsInteger, planNagrDataSet.FieldByName('bit_calc_as_practice').AsBoolean, discHour, discHour, true);
      for i:= 1 to Length(vzColumns) do
      begin
        dm.aspContentPlanNagr.First;
        vzHour:= 0;
        while not dm.aspContentPlanNagr.Eof do
        begin
          if (dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger = vzColumns[i-1]) then
            vzHour:= vzHour + dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat;
          dm.aspContentPlanNagr.Next;
        end;
        if vzHour <> 0 then
        begin
          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount)];
          RangeE.Value2:= vzHour;
        end;
      end;       }
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount)];
      RangeE.Value2:=  '=SUM(G' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 5) + IntToStr(rowCount) + ')';
//      CloseContentPlanNagr;
      planNagrDataSet.Next;
      ProgressBar.Position:= ProgressBar.Position + 1;
      inc(rowCount);
      Application.ProcessMessages;
    end;
  finally
    if planNagrDataSet.Active then planNagrDataSet.Close;
    planNagrDataSet.Free;
    if discPlanNagr.Active then discPlanNagr.Close;
    discPlanNagr.Free;
  end;

  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'ИТОГО:';
  for i:= 1 to Length(vzColumns) do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(i + 5) + '4:' + TGeneralController.Instance.GetExcelColumnLetter(i + 5) + IntToStr(rowCount-1) + ')';
  end;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount)];
  RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + '4:' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount-1) + ')';
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount)];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Font.Bold:= true;

  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumns) + 6) + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;

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

procedure TPlanNagruzkaController.ExportKafedraPlanForYear(KafedraIK, YearIK: integer; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  IExcelActiveWS: ExcelWorksheet;
  RangeE: ExcelRange;
  Title: string;
  vzColumnsIK: array of integer;
  vzColumnsName: array of string;
  formEdIKs: array of integer;
  formEdNames: array of string;
  SemesterIKs: array of integer;
  SemesterNames: array of string;
  SemesterRows: array of string;
  i, j, k, rowCount: integer;
  tempDataSet, typeEdDS: TADODataSet;
  planStoredProc: TADOStoredProc;
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  typeEdDS:= TGeneralController.Instance.GetNewADODataSet(false);
  planStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('GetSummaryNagrForDepartmentPlan', false);
  try
    tempDataSet.CommandText:= 'SELECT * FROM Form_ed WHERE ik_form_ed in (SELECT ik_form_ed FROM Plan_nagr WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (ik_year = ' + IntToStr(YearIK) + '))';
    tempDataSet.Open;
    SetLength(formEdIKs, tempDataSet.RecordCount);
    SetLength(formEdNames, tempDataSet.RecordCount);
    i:= 1;
    while not tempDataSet.Eof do
    begin
      formEdIKs[i-1]:= tempDataSet.FieldByName('Ik_form_ed').AsInteger;
      formEdNames[i-1]:= tempDataSet.FieldByName('Cname_form_ed').AsString;
      tempDataSet.Next;
      inc(i);
    end;
    tempDataSet.Close;

    tempDataSet.CommandText:= 'SELECT * FROM SemesterType WHERE ik_sem_type in (SELECT ik_sem_type FROM Plan_nagr WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (ik_year = ' + IntToStr(YearIK) + '))';
    tempDataSet.Open;
    SetLength(SemesterIKs, tempDataSet.RecordCount);
    SetLength(SemesterNames, tempDataSet.RecordCount);
    SetLength(SemesterRows, tempDataSet.RecordCount);
    i:= 1;
    while not tempDataSet.Eof do
    begin
      SemesterIKs[i-1]:= tempDataSet.FieldByName('ik_sem_type').AsInteger;
      SemesterNames[i-1]:= tempDataSet.FieldByName('Cname_sem_type').AsString;
      tempDataSet.Next;
      inc(i);
    end;
    tempDataSet.Close;

    tempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE ik_kaf = ' + IntToStr(KafedraIK);
    tempDataSet.Open;
    Title:= tempDataSet.FieldByName('cshort_name_kaf').AsString;
    tempDataSet.Close;
    tempDataSet.CommandText:= 'SELECT (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1) + '' учебный год '') as year_name From Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK);
    tempDataSet.Open;
    Title:= Title + ' на ' + tempDataSet.FieldByName('year_name').AsString;
    tempDataSet.Close;

    tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
    tempDataSet.Open;
    SetLength(vzColumnsIK, tempDataSet.RecordCount);
    SetLength(vzColumnsName, tempDataSet.RecordCount);
    i:= 1;
    while not tempDataSet.Eof do
    begin
      vzColumnsIK[i-1]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
      vzColumnsName[i-1]:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
      tempDataSet.Next;
      inc(i);
    end;
    tempDataSet.Close;

    planStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
    planStoredProc.Parameters.CreateParameter('@ik_type_ed', ftInteger, pdInput, 0, 0);
    planStoredProc.Parameters.CreateParameter('@ik_form_ed', ftInteger, pdInput, 0, 0);
    planStoredProc.Parameters.CreateParameter('@ik_sem_type', ftWord, pdInput, 0, 0);
    planStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);

    typeEdDS.CommandText:= 'SELECT * FROM Type_ed WHERE ik_type_ed in (SELECT ik_type_ed FROM Plan_nagr WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (ik_year = ' + IntToStr(YearIK) + '))';
    typeEdDS.Open;
    ProgressBar.Max:= typeEdDS.RecordCount * Length(SemesterIKs) * Length(formEdIKs);
    if (typeEdDS.RecordCount - IExcelApp.ActiveWorkbook.Sheets.Count > 0) then
      IExcelApp.ActiveWorkbook.Worksheets.Add(EmptyParam, IExcelApp.ActiveWorkbook.Worksheets.get_Item(IExcelApp.ActiveWorkbook.Worksheets.Count), typeEdDS.RecordCount - IExcelApp.ActiveWorkbook.Sheets.Count, EmptyParam,0);

    while not typeEdDS.Eof do
    begin
      IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[typeEdDS.RecNo] as ExcelWorksheet;
      IExcelActiveWS.Name:= typeEdDS.FieldByName('cName_type_ed').AsString;
      planStoredProc.Parameters.ParamByName('@ik_type_ed').Value:= typeEdDS.FieldByName('ik_type_ed').AsInteger;
      for j := 0 to Length(SemesterIKs) - 1 do SemesterRows[j]:= '';

      with IExcelActiveWS.PageSetup do
      begin
        Orientation:= xlLandscape;
        CenterHorizontally:= True;
        LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
        RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
        TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
        BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
        PrintTitleRows:= '$3:$3';
        FitToPagesWide:= 1;
        FitToPagesTall:= False;
        Zoom:= False;
      end;
      RangeE:= IExcelActiveWS.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + '1'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= 1;
      RangeE.Value2:= 'Расчет нагрузки профессорско-преподавательского состава на кафедре ' + Title + ' (' + typeEdDS.FieldByName('cName_type_ed').AsString + ')';
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.5, 0);
      RangeE.VerticalAlignment:= xlCenter;
      RangeE.HorizontalAlignment:= xlCenter;

      for i := 0 to Length(vzColumnsIK) - 1 do
      begin
        RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 1) + '2', TGeneralController.Instance.GetExcelColumnLetter(i + 1) + '2'];
        RangeE.Value2:= vzColumnsName[i];
        RangeE.Orientation:= 90;
      end;
      RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + '2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + '2'];
      RangeE.Font.Bold:= 1;
      RangeE.Value2:= 'ИТОГО';
      RangeE.Orientation:= 90;
      RangeE:= IExcelActiveWS.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + '2'];
      RangeE.VerticalAlignment:= xlCenter;
      RangeE.HorizontalAlignment:= xlCenter;
      rowCount:= 3;

      for i := 0 to Length(formEdIKs) - 1 do
      begin
        planStoredProc.Parameters.ParamByName('@ik_form_ed').Value:= formEdIKs[i];
        RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
        RangeE.MergeCells:= true;
        RangeE.Font.Bold:= 1;
        RangeE.Font.Italic:= 1;
        RangeE.Value2:= AnsiUpperCase('Форма обучения: ' + formEdNames[i]);
        inc(rowCount);
        for j := 0 to Length(SemesterIKs) - 1 do
        begin
          planStoredProc.Parameters.ParamByName('@ik_sem_type').Value:= SemesterIKs[j];
          RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
          RangeE.Font.Bold:= 1;
          RangeE.Value2:= AnsiUpperCase('за ' + SemesterNames[j] + ' семестр:');
          RangeE.VerticalAlignment:= xlCenter;
          RangeE.HorizontalAlignment:= xlRight;
          planStoredProc.Open;
          for k := 0 to Length(vzColumnsIK) - 1 do
            if planStoredProc.Locate('ik_vid_zanyat', vzColumnsIK[k], [loPartialKey]) then
            begin
              RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount)];
              RangeE.Value2:= planStoredProc.FieldByName('plan_hour').AsFloat;
            end;
          planStoredProc.Close;
          RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(B' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK)) + IntToStr(rowCount) + ')';
          SemesterRows[j]:= SemesterRows[j] + 'B' + IntToStr(rowCount);
          if i <> Length(formEdIKs) - 1 then SemesterRows[j]:= SemesterRows[j] + ', ';
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
          RangeE.VerticalAlignment:= xlCenter;
          RangeE.HorizontalAlignment:= xlCenter;
          inc(rowCount);
          ProgressBar.Position:= ProgressBar.Position + 1;
        end;
        RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
        RangeE.MergeCells:= true;
        inc(rowCount);
      end;

      for j := 0 to Length(SemesterIKs) - 1 do
      begin
        RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
        RangeE.Font.Bold:= 1;
        RangeE.Value2:= AnsiUpperCase('Итого за ' + SemesterNames[j] + ' семестр:');
        RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
        RangeE.Value2:= '=SUM(' + SemesterRows[j] + ')';
        for k := 1 to Length(vzColumnsIK) - 1 do
        begin
          SemesterRows[j]:= StringReplace(SemesterRows[j], TGeneralController.Instance.GetExcelColumnLetter(k), TGeneralController.Instance.GetExcelColumnLetter(k + 1), [rfReplaceAll, rfIgnoreCase]);
          RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(' + SemesterRows[j] + ')';
        end;
        RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
        RangeE.Value2:= '=SUM(B' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK)) + IntToStr(rowCount) + ')';
        inc(rowCount);
      end;
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
      RangeE.MergeCells:= true;
      inc(rowCount);
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Font.Bold:= 1;
      RangeE.Value2:= AnsiUpperCase('Всего за год:');
      RangeE.VerticalAlignment:= xlCenter;
      RangeE.HorizontalAlignment:= xlRight;

      for k := 0 to Length(vzColumnsIK) - 1 do
      begin
        RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount)];
        RangeE.Font.Bold:= 1;
        RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount - Length(SemesterIKs) - 1) + ':' + TGeneralController.Instance.GetExcelColumnLetter(k + 1) + IntToStr(rowCount - 2) + ')';
      end;
      RangeE:= IExcelActiveWS.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
      RangeE.Font.Bold:= 1;
      RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount - Length(SemesterIKs) - 1) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount - 2) + ')';

      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount - Length(SemesterIKs) - 1), TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
      RangeE.VerticalAlignment:= xlCenter;
      RangeE.HorizontalAlignment:= xlCenter;

      RangeE:= IExcelActiveWS.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(vzColumnsIK) + 1) + IntToStr(rowCount)];
      RangeE.Columns.AutoFit;
      RangeE.Borders.LineStyle:= 1;
      RangeE.Font.Size:= 10;

      typeEdDS.Next;
    end;
    typeEdDS.Close;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
    if typeEdDS.Active then typeEdDS.Close;
    typeEdDS.Free;
    if planStoredProc.Active then planStoredProc.Close;
    planStoredProc.Free;
  end;

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

procedure TPlanNagruzkaController.FullPickListForVidNagruzki(DiscIK, DiscTypeIK,
  VidZanyatIK: integer; outputPickList: TStrings);
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  outputPickList.Clear;
  try
    if VidZanyatIK = 32 then
      tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki = 1'
    else
    begin
      case DiscTypeIK of
        2,3: tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norm_of_time_practice WHERE (ik_disc = ' + IntToStr(DiscIK) + '))'
        else tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norma_of_time WHERE (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + '))';
      end;
    end;
    tempDS.Open;
    while not tempDS.Eof do
    begin
      outputPickList.Add(tempDS.FieldByName('cName_vid_nagruzki').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagruzkaController.GetByPlanNumbers(SourceDataSet: PDataSet;
  TeacherIK, ContentPlanIK, CalcUnitIK, InCommissionNumber: integer;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Prepod_plan_nagr.* From Prepod_plan_nagr Where (ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ') and (ik_id_prepod = ' +
                IntToStr(TeacherIK) + ') and (ik_calc_unit = ' + IntToStr(CalcUnitIK) + ') and (commission_member = ' + IntToStr(InCommissionNumber) + ') Order By by_plan_number', 'by_plan_number', isShowFirst, NULL)
end;

function TPlanNagruzkaController.GetCalculationSchemeGrid(AOwner: TComponent;
  PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount: integer; ifDiscCalcAsPractice: boolean): double;
var
  calcUnitDS: TADODataSet;
  inPlanCount, fullInPlanCount, TypeEdIK,AllPotokBudg, AllPotokContr: integer;  //все бюджетники и все контрактники по потоку

  vzWasFoundInUchPlan, calcUnitCalcOnlyStudents, isLectureHere: boolean;
  tempGrid: TCalculationSchemeGrid;
  fNormPerStudent: double;
begin
  Result:= 0;


  tempGrid:= TCalculationSchemeGrid.Create(AOwner);
  dm.adsVidZanyat.Locate('ik_vid_zanyat', VidZanyatIK, [loPartialKey]);
  calcUnitDS:= TGeneralController.Instance.GetNewADODataSet(false);



  calcUnitDS.CommandText:= 'SELECT ik_type_ed FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK);
  calcUnitDS.Open;
  TypeEdIK:= calcUnitDS.FieldByName('ik_type_ed').AsInteger;
  calcUnitDS.Close;
  //определение: где проводятся лекции для данного потока
  calcUnitDS.CommandText:= 'SELECT sum(budget_count) budg,sum(contract_count) contr '+
                           'FROM Calc_unit_semestr cus,Potok_semestr_shema pss,Potok_semestr ps '+
                           'Where cus.ik_shema = pss.ik_shema and ps.ik_potok_semestr = pss.ik_potok_semestr '+
                           'and ik_decompose_type='+ IntToStr(BezDeleniyaType)+
                           ' and pss.ik_potok_semestr=(select ik_potok_semestr from Potok_semestr_shema where ik_shema='+IntToStr(SchemaOfPotokIK)+
                           ') and ps.id_year = (SELECT ik_year FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';


  calcUnitDS.Open;
  AllPotokBudg:= calcUnitDS.FieldByName('budg').AsInteger;
  AllPotokContr:= calcUnitDS.FieldByName('contr').AsInteger;
  if TypeEdIK=1 then isLectureHere := (AllPotokContr/(AllPotokBudg+AllPotokContr)<ContrToBudgPereves)
    else isLectureHere := (AllPotokContr/(AllPotokBudg+AllPotokContr)>=ContrToBudgPereves);
  calcUnitDS.Close;

  calcUnitDS.CommandText:= 'SELECT cName_calc_unit, ik_uch_plan, budget_count, contract_count FROM Calc_unit_semestr cus,Potok, Potok_semestr ps,Potok_semestr_shema pss '+
        'WHERE (cus.ik_shema = ' + IntToStr(SchemaOfPotokIK) + ') and cus.ik_shema=pss.ik_shema and pss.ik_potok_semestr=ps.ik_potok_semestr '+
        'and potok.ik_potok = ps.id_potok and (ps.id_year = (SELECT ik_year FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + '))';
  calcUnitDS.Open;
  calcUnitDS.First;
  while not calcUnitDS.Eof do
  begin
    if TypeEdIK = 1 then
    //80% - на контракт
      calcUnitCalcOnlyStudents:= (calcUnitDS.FieldByName('contract_count').AsInteger/(calcUnitDS.FieldByName('contract_count').AsInteger + calcUnitDS.FieldByName('budget_count').AsInteger)) >= 0.8
    else calcUnitCalcOnlyStudents:= (calcUnitDS.FieldByName('contract_count').AsInteger/(calcUnitDS.FieldByName('contract_count').AsInteger + calcUnitDS.FieldByName('budget_count').AsInteger)) < 0.8;
    // если уч. план этой расч. ед. не найден в списке уч. планов, то пропускаем ее
    if not dm.adsPotokShemasInfo.Locate('ik_shema; ik_uch_plan; bit_calc_students_only', VarArrayOf([SchemaOfPotokIK, calcUnitDS.FieldByName('ik_uch_plan').AsInteger, calcUnitCalcOnlyStudents]), [loPartialKey]) then
    begin
      calcUnitDS.Next;
      continue;
    end;
    inPlanCount:= 0;
    fullInPlanCount:= 0;
    vzWasFoundInUchPlan:= false;
    dm.qContentUchPlan.First;
    while not dm.qContentUchPlan.Eof do
    begin
      if (dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger = VidZanyatIK) and
        (dm.qContentUchPlan.FieldByName('ik_shema').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_shema').AsInteger) and
        (dm.qContentUchPlan.FieldByName('ik_uch_plan').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_uch_plan').AsInteger) then
        begin
          vzWasFoundInUchPlan:= true;
          Inc(inPlanCount);
          Inc(fullInPlanCount, dm.qContentUchPlan.FieldByName('tasks_count').AsInteger);
        end;
        dm.qContentUchPlan.Next;
    end;
    // если ВЗ должен быть в уч. плане, но он там не найден, то пропускаем эту расч. единицу
    if dm.adsVidZanyat.FieldByName('bit_must_be_in_uch_plan').AsBoolean and (not vzWasFoundInUchPlan) then
    begin
      calcUnitDS.Next;
      continue;
    end;
    if (inPlanCount = 0) then inPlanCount:= 1;
    if (fullInPlanCount = 0) then fullInPlanCount:= 1;

    tempGrid.RowCount:= tempGrid.RowCount + 1;
    tempGrid.Cells[0, tempGrid.RowCount - 1]:= calcUnitDS.FieldByName('cName_calc_unit').AsString;
    if (tempGrid.ColWidths[0] < tempGrid.Canvas.TextWidth(tempGrid.Cells[0, tempGrid.RowCount - 1]) + 10) then
      tempGrid.ColWidths[0]:= tempGrid.Canvas.TextWidth(tempGrid.Cells[0, tempGrid.RowCount - 1]) + 10;
    tempGrid.Cells[1, tempGrid.RowCount - 1]:= IntToStr(inPlanCount) + ' (заданий: ' + IntToStr(fullInPlanCount) + ')';
    tempGrid.Cells[9, tempGrid.RowCount - 1]:= IntToStr(CommissionCount);
    if TypeEdIK = 1 then
      tempGrid.Cells[2, tempGrid.RowCount - 1]:= calcUnitDS.FieldByName('budget_count').AsString
    else tempGrid.Cells[2, tempGrid.RowCount - 1]:= calcUnitDS.FieldByName('contract_count').AsString;
    if ifDiscCalcAsPractice then
    begin
      if dm.adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', VidNagruzkiIK, [loPartialKey]) then
      begin
        fNormPerStudent:= dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat;
        tempGrid.Cells[3, tempGrid.RowCount - 1]:= dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsString;
        tempGrid.Cells[5, tempGrid.RowCount - 1]:= dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsString;
      end
      else
      begin
        tempGrid.Cells[3, tempGrid.RowCount - 1]:= '<не заполнено>';
        tempGrid.Cells[5, tempGrid.RowCount - 1]:= '<не заполнено>';
      end;
    end
    else
    begin
      if dm.adsNormOfTime.Locate('ik_norm_of_time;ik_vid_zanyat; ik_vid_nagruzki',
          VarArrayOf([dm.adsNormOfTime.FieldByName('ik_norm_of_time').AsInteger,VidZanyatIK, VidNagruzkiIK]), [loPartialKey]) then
      begin
        if (dm.adsPotokShemasInfo.FieldByName('student_count').AsInteger < dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger) and
          (dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger <> 0) then
        begin
          if (dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat*fullInPlanCount > dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat)
            and (dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat <> 0) then
            fNormPerStudent:= dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat/fullInPlanCount
          else fNormPerStudent:= dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat;
          tempGrid.Cells[5, tempGrid.RowCount - 1]:= dm.adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsString;
        end
        else
        begin
          if (dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat*fullInPlanCount > dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat)
            and (dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat <> 0) then
            fNormPerStudent:= dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat/fullInPlanCount
          else fNormPerStudent:= dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat;
          tempGrid.Cells[5, tempGrid.RowCount - 1]:= dm.adsNormOfTime.FieldByName('f_norm_per_ed').AsString;
        end;
        tempGrid.Cells[3, tempGrid.RowCount - 1]:= FloatToStrF(fNormPerStudent, ffFixed, 10, 2);
      end
      else
      begin
        tempGrid.Cells[3, tempGrid.RowCount - 1]:= '<не заполнено>';
        tempGrid.Cells[5, tempGrid.RowCount - 1]:= '<не заполнено>';
      end;
    end;
    if (tempGrid.Cells[3, tempGrid.RowCount - 1] <> '<не заполнено>') then
      tempGrid.Cells[4, tempGrid.RowCount - 1]:= FloatToStrF(StrToFloat(tempGrid.Cells[2, tempGrid.RowCount - 1]) * RoundFloat(fullInPlanCount * fNormPerStudent, 2), ffFixed, 10, 2)
    else tempGrid.Cells[4, tempGrid.RowCount - 1]:= '0';
    if dm.adsVidZanyat.FieldByName('bit_must_be_in_uch_plan').AsBoolean then
    begin
      if dm.qContentUchPlan.Locate('ik_vid_zanyat; ik_shema; ik_uch_plan', VarArrayOf([VidZanyatIK, SchemaOfPotokIK, calcUnitDS.FieldByName('ik_uch_plan').AsInteger]), [loPartialKey]) then
      begin
        tempGrid.Cells[6, tempGrid.RowCount - 1]:= dm.qContentUchPlan.FieldByName('kol_ned').AsString;
        if (dm.qContentUchPlan.FieldByName('i_hour_per_week').Value <> NULL) then
          tempGrid.Cells[7, tempGrid.RowCount - 1]:= dm.qContentUchPlan.FieldByName('i_hour_per_week').AsString
        else tempGrid.Cells[7, tempGrid.RowCount - 1]:= '-';
      end
      else
      begin
        tempGrid.Cells[6, tempGrid.RowCount - 1]:= '<не заполнено>';
        tempGrid.Cells[7, tempGrid.RowCount - 1]:= '<не заполнено>';
      end;
    end
    else
    begin
      tempGrid.Cells[6, tempGrid.RowCount - 1]:= '-';
      tempGrid.Cells[7, tempGrid.RowCount - 1]:= '-';
    end;
    if calcUnitCalcOnlyStudents and ((VidZanyatIK <> 32)
       or((VidZanyatIK=32) and not isLectureHere)) then
    begin
      tempGrid.Cells[8, tempGrid.RowCount - 1]:= '<не учитывается>';
      tempGrid.Cells[10, tempGrid.RowCount - 1]:= FloatToStrF((StrToFloat(tempGrid.Cells[4, tempGrid.RowCount - 1]))*StrToFloat(tempGrid.Cells[9, tempGrid.RowCount - 1]), ffFixed, 10, 2);
    end
    else
    begin
      if (tempGrid.Cells[7, tempGrid.RowCount - 1] = '-') or (tempGrid.Cells[7, tempGrid.RowCount - 1] = '<не заполнено>') then
      begin
        if (VidZanyatIK = 32) then
          tempGrid.Cells[8, tempGrid.RowCount - 1]:= FloatToStrF(dm.adsPotokShemasInfo.FieldByName('consultation_hour').AsFloat/dm.adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat, ffFixed, 10, 2)
        else
        begin
          if tempGrid.Cells[5, tempGrid.RowCount - 1] = '<не заполнено>' then
            tempGrid.Cells[8, tempGrid.RowCount - 1]:= '0'
          else tempGrid.Cells[8, tempGrid.RowCount - 1]:= FloatToStrF(StrToFloat(tempGrid.Cells[5, tempGrid.RowCount - 1])*fullInPlanCount, ffFixed, 10, 2);
        end;
      end
      else
      begin
        if tempGrid.Cells[5, tempGrid.RowCount - 1] = '<не заполнено>' then
          tempGrid.Cells[8, tempGrid.RowCount - 1]:= '0'
        else tempGrid.Cells[8, tempGrid.RowCount - 1]:= FloatToStrF(StrToFloat(tempGrid.Cells[5, tempGrid.RowCount - 1]) * StrToFloat(tempGrid.Cells[6, tempGrid.RowCount - 1]) * StrToFloat(tempGrid.Cells[7, tempGrid.RowCount - 1]) * fullInPlanCount, ffFixed, 10, 2);
      end;
      tempGrid.Cells[10, tempGrid.RowCount - 1]:= FloatToStrF((StrToFloat(tempGrid.Cells[8, tempGrid.RowCount - 1]) + StrToFloat(tempGrid.Cells[4, tempGrid.RowCount - 1]))*StrToFloat(tempGrid.Cells[9, tempGrid.RowCount - 1]), ffFixed, 10, 2);
    end;
    Result:= Result + StrToFloat(tempGrid.Cells[10, tempGrid.RowCount - 1]);
    calcUnitDS.Next;
  end;
end;

function TPlanNagruzkaController.GetCalcUnits(UnitsOwner: TComponent;
  TeacherIK, ContentPlannagrIK: integer; MinContingent: integer; NormPerUnit, NormPerUnitForMin: double): TObjectList;
var
  tempDataSet, calcUnitUchPlansDS: TADODataSet;
  tempStoredProc: TADOStoredProc;
  i, semNumber, vidZanyatIK, InPlanCount, AllTaskCount, WeekInPlanCount, AvailStudentCount: integer;
  planUnitHour, curPlanUnitHour: double;
  isVZMustBeInUchPlan: boolean;
  tasksCount: TStringList;
begin
  Result:= nil;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tasksCount:= TStringList.Create;
try
  tempDataSet.CommandText:= 'SELECT ik_vid_zanyat, bit_must_be_in_uch_plan FROM vid_zaniat WHERE ik_vid_zanyat in (SELECT ik_vid_zanyat FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlannagrIK) + ')';
  tempDataSet.Open;
  vidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
  isVZMustBeInUchPlan:= tempDataSet.FieldByName('bit_must_be_in_uch_plan').AsBoolean;
  tempDataSet.Close;
  semNumber:= GetSemesterNumberForPotok(ContentPlanNagrIK);

  calcUnitUchPlansDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= TObjectList.Create(true);
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('GetCalcUnitsForPlanNagr', false);
  calcUnitUchPlansDS.CommandText:= 'SELECT DISTINCT ik_uch_plan FROM Potok WHERE ik_potok =(select id_potok from Potok_semestr ps, Potok_semestr_shema pss where pss.ik_potok_semestr=ps.ik_potok_semestr and ik_shema = (SELECT ik_shema FROM Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) + '))';
  calcUnitUchPlansDS.Open;
  while not calcUnitUchPlansDS.Eof do
  begin
    tasksCount.Clear;
    AllTaskCount:= 0;
    if isVZMustBeInUchPlan or (vidZanyatIK = 32) then // если вид занятий должен быть в уч. плане, то надо проверить есть ли он там вообще и заодно получить кол-во часов и кол-во работ
    begin
      if not GetUchPlanParametrsForCalcUnit(calcUnitUchPlansDS.FieldByName('ik_uch_plan').AsInteger, semNumber, ContentPlannagrIK, VidZanyatIK, planUnitHour, InPlanCount, tasksCount, WeekInPlanCount) then continue;
    end
    else  // если его там быть не должно то и проверять не будем
    begin
      planUnitHour:= -1;
      InPlanCount:= 1;
      WeekInPlanCount:= 1;
      tasksCount.Add('1');
    end;
    for I := 0 to tasksCount.Count - 1 do
      AllTaskCount:= AllTaskCount + StrToInt(tasksCount[i]);
    tempStoredProc.Parameters.Clear;
    tempStoredProc.Parameters.CreateParameter('@ik_content_plan_nagr', ftInteger, pdInput, 0, ContentPlannagrIK);
    tempStoredProc.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0, calcUnitUchPlansDS.FieldByName('ik_uch_plan').AsInteger);
    tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
    tempStoredProc.Parameters.CreateParameter('@in_plan_count', ftWord, pdInput, 0, inPlanCount);
    tempStoredProc.Open;

    while not tempStoredProc.Eof do
    begin
        if vidZanyatIK <> 32 then
        begin
          if (planUnitHour = -1) then
          begin
            if tempStoredProc.FieldByName('student_count').AsInteger < MinContingent then
              curPlanUnitHour:= NormPerUnitForMin
            else curPlanUnitHour:= NormPerUnit //* inPlanCount//+ NormPerStudent * StudentInPotok
          end
          else
          begin
            if tempStoredProc.FieldByName('student_count').AsInteger < MinContingent then
              curPlanUnitHour:= planUnitHour * NormPerUnitForMin
            else curPlanUnitHour:= planUnitHour * NormPerUnit //* inPlanCount; //+ NormPerStudent * StudentInPotok;
          end;
        end
        else curPlanUnitHour:= planUnitHour;

        if planUnitHour = 0 then // т.е. вид занятий должен быть в уч. плане, но его там не оказалось, то значит выбранный вид занятий для выбранной дисциплины не проводится и поэтому чтобы не считалась норма на студента установим кол-во студентов в 0
          AvailStudentCount:= 0
        else AvailStudentCount:= tempStoredProc.FieldByName('student_count').AsInteger - tempStoredProc.FieldByName('busy_student_count').AsInteger;

        Result.Add(TCalcUnit.Create(UnitsOwner,
                                (tempStoredProc.FieldByName('my_hour').AsFloat <> 0) or (tempStoredProc.FieldByName('my_student_count').AsInteger <> 0),
                                tempStoredProc.FieldByName('ik_calc_unit').AsInteger, inPlanCount, AllTaskCount,
                                tempStoredProc.FieldByName('by_plan_number').AsInteger,
                                GetTaskCountFromList(tasksCount, tempStoredProc.FieldByName('by_plan_number').AsInteger),
                                tempStoredProc.FieldByName('member_number').AsInteger,
                                tempStoredProc.FieldByName('cName_calc_unit').AsString,
                                tempStoredProc.FieldByName('my_hour').AsFloat,
                                curPlanUnitHour*WeekInPlanCount-tempStoredProc.FieldByName('busy_hour').AsFloat,
                                tempStoredProc.FieldByName('busy_hour').AsFloat,
                                tempStoredProc.FieldByName('my_student_count').AsInteger,
                                AvailStudentCount, tempStoredProc.FieldByName('busy_student_count').AsInteger, WeekInPlanCount, tempStoredProc.FieldByName('bit_calc_students_only').AsBoolean));
        tempStoredProc.Next;
    end;
    tempStoredProc.Close;
    calcUnitUchPlansDS.Next;
  end;
  calcUnitUchPlansDS.Close;
finally
  if Assigned(tasksCount) then tasksCount.Free;  
  if Assigned(tempStoredProc) then tempStoredProc.Free;
  if Assigned(calcUnitUchPlansDS) then calcUnitUchPlansDS.Free;
  if Assigned(tempDataSet) then tempDataSet.Free;
end;
end;

function TPlanNagruzkaController.GetCalcUnitsFromTeacherPlan(
  SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, InComissionNumber: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * FROM GetCalcUnitsFromTeacherPlan(' + IntToStr(TeacherIK) + ', ' + IntToStr(ContentPlanIK) + ', ' + IntToStr(InComissionNumber) + ')', 'ik_calc_unit', isShowFirst, defaultValue);
{  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Prepod_plan_nagr.ik_calc_unit, Calc_unit.ik_uch_plan, Calc_unit.cName_calc_unit, Potok_shema.ik_decompose_type ' +
                'From Prepod_plan_nagr INNER JOIN Calc_unit ON Prepod_plan_nagr.ik_calc_unit = Calc_unit.ik_calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok ' +
                'Where (ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ') and (commission_member = ' + IntToStr(InComissionNumber) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') Order By cName_calc_unit', 'ik_calc_unit', isShowFirst, defaultValue)}
end;

function TPlanNagruzkaController.GetUchPlanParametrsForCalcUnit(UchPlanIK, SemesterNumber,
  ContentPlannagrIK, VidZanyatIK: integer; var inPlanHour: double; var inPlanCount: integer; taskCounts: TStringList; var WeekInPlanCount: integer): boolean;
var
  discTypeCalcMode: boolean;
  tempDataSet: TADODataSet;
begin
  Result:= false;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECT bit_calc_as_practice FROM Type_disc WHERE ik_type_disc = (SELECT ik_type_disc FROM discpln WHERE ik_disc = (SELECT ik_disc FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlannagrIK) + '))';
  tempDataSet.Open;
  discTypeCalcMode:= tempDataSet.FieldByName('bit_calc_as_practice').AsBoolean;
  tempDataSet.Close;
  if VidZanyatIK = -1 then
  begin
    tempDataSet.CommandText:= 'SELECT ik_vid_zanyat FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlannagrIK);
    tempDataSet.Open;
    VidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempDataSet.Close;
  end;
  taskCounts.Clear;
  try
    if VidZanyatIK = 32 then
    begin
      tempDataSet.CommandText:= 'SELECT dbo.GetConsultationHour(2, ' + IntToStr(SemesterNumber) + ', ' + IntToStr(UchPlanIK) + ', ' + IntToStr(ContentPlannagrIK) + ', 0) as cons_value';
      tempDataSet.Open;
      inPlanHour:= tempDataSet.FieldByName('cons_value').AsFloat;
      inPlanCount:= 1;
      WeekInPlanCount:= 1;
      taskCounts.Add('1');
      tempDataSet.Close;
    end
    else
    begin
      tempDataSet.CommandText:= 'Select Content_UchPl.*, sv_disc.iHour_gos, ISNULL(vzst.tasks_count, 1) as tasks_count, ISNULL(upwce.week_count, sem_uch_pl.kol_ned) as kol_ned From Content_UchPl ' +
          'LEFT JOIN UchPlan_WeekCount_Exception upwce ON Content_UchPl.ik_upContent = upwce.ik_upContent LEFT JOIN Vid_zanyat_with_several_tasks vzst ON Content_UchPl.ik_upContent = vzst.ik_upContent ' +
          'INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) ' +
          'Where (Content_UchPl.n_sem = ' + IntToStr(SemesterNumber) + ') and (sv_disc.ik_uch_plan = ' + IntToStr(UchPlanIK) +
          ') and (sv_disc.ik_disc = (Select ik_disc From Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) + ')) and (Content_UchPl.ik_vid_zanyat = ' + IntToStr(vidZanyatIK) + ') and '
          + '(Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlannagrIK) + ')))';
      tempDataSet.Open;

      if not discTypeCalcMode then
      begin
        if tempDataSet.RecordCount > 0 then
        begin
          if (tempDataSet.FieldByName('i_hour_per_week').Value <> NULL) then
            inPlanHour:= tempDataSet.FieldByName('i_hour_per_week').AsFloat * tempDataSet.FieldByName('kol_ned').AsFloat
          else inPlanHour:= -1;
        end
        else inPlanHour:= 0;
        if tempDataSet.RecordCount <> 0 then
        begin
          inPlanCount:= tempDataSet.RecordCount;
          tempDataSet.First;
          while not tempDataSet.Eof do
          begin
            taskCounts.Add(tempDataSet.FieldByName('tasks_count').AsString);
            tempDataSet.Next;
          end;
        end
        else
        begin
          inPlanCount:= 1;
          taskCounts.Add('1');
        end;
        WeekInPlanCount:= 1;
      end
      else
      begin
        inPlanHour:= 1;
        inPlanCount:= 1;
        taskCounts.Add('1');
        WeekInPlanCount:= tempDataSet.FieldByName('iHour_gos').AsInteger;
      end;

      tempDataSet.Close;
      if discTypeCalcMode then
      begin
        tempDataSet.CommandText:= 'SELECT ik_practice_norm_type FROM Content_norm_of_time_practice WHERE (ik_norm_of_time = ' +
          '(SELECT ik_norm_of_time FROM Potok_semestr WHERE ik_potok_semestr = (SELECT ik_potok_semestr FROM Potok_semestr_shema WHERE ik_shema = ' +
          '(SELECT ik_shema FROM Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) +
          ')))) and (ik_disc = (SELECT ik_disc FROM Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) + ')) and (ik_vid_nagruzki = (SELECT ik_vid_nagruzki FROM Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) + '))';
        tempDataSet.Open;
        if tempDataSet.RecordCount > 0 then
         case tempDataSet.FieldByName('ik_practice_norm_type').AsInteger of
           2: WeekInPlanCount:= WeekInPlanCount*6;
           3: ;
           else WeekInPlanCount:= 1;
         end;
        tempDataSet.Close;
      end;
    end;
    Result:= true;
  finally
    if Assigned(tempDataSet) then tempDataSet.Free;    
  end;
end;

procedure TPlanNagruzkaController.GetNormValues(NormIK, PlanIK, DiscIK, PotokIK, VidZanyatIK,
  VidNagruzkiIK, ContentPlanNagrIK: integer; var NormPerUnit, NormPerStudent,
  MaxNormPerStudent: double; var MinRequedContingent: integer; var NormPerUnitForMin, NormPerStudentForMin: double);
var
  tempDataSet: TADODataSet;
 // calcStudentsOnly: boolean;
  discTypeCalcMode: boolean;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
try
 { tempDataSet.CommandText:= 'SELECT calc_student_only FROM GetContentOfDepartmentPlanNagr(2, ' + IntToStr(PlanIK) + ', ' + IntToStr(PotokIK) + ')';
  tempDataSet.Open;
  calcStudentsOnly:= tempDataSet.FieldByName('calc_student_only').AsBoolean;
  tempDataSet.Close;   }

  tempDataSet.CommandText:= 'SELECT bit_calc_as_practice FROM Type_disc WHERE ik_type_disc = (SELECT ik_type_disc FROM discpln WHERE ik_disc = ' + IntToStr(DiscIK) + ')';
  tempDataSet.Open;
  discTypeCalcMode:= tempDataSet.FieldByName('bit_calc_as_practice').AsBoolean;
  tempDataSet.Close;
  if discTypeCalcMode then
  begin
      tempDataSet.CommandText:= 'Select * From Content_norm_of_time_practice Where (ik_norm_of_time = ' + IntToStr(NormIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ')';
      tempDataSet.Open;
//      if calcStudentsOnly then NormPerUnit:= 0
      NormPerUnit:= tempDataSet.FieldByName('f_norm_per_ed').AsFloat;
      NormPerStudent:= tempDataSet.FieldByName('f_norm_per_student').AsFloat;
      MaxNormPerStudent:= 0;
      MinRequedContingent:= 0;
      NormPerUnitForMin:= 1;
      NormPerStudentForMin:= 0;
      tempDataSet.Close;
  end
  else
  begin
    if VidZanyatIK <> 32 then
    begin
      tempDataSet.CommandText:= 'Select * From Content_norma_of_time Where (ik_norm_of_time = ' + IntToStr(NormIK) + ') and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ')';
      tempDataSet.Open;
//      if calcStudentsOnly then NormPerUnit:= 0
      NormPerUnit:= tempDataSet.FieldByName('f_norm_per_ed').AsFloat;
      NormPerStudent:= tempDataSet.FieldByName('f_norm_per_student').AsFloat;
      MaxNormPerStudent:= tempDataSet.FieldByName('max_norm_per_student').AsFloat;
      MinRequedContingent:= tempDataSet.FieldByName('min_requed_student').AsInteger;
//      if calcStudentsOnly then NormPerUnitForMin:= 0
      NormPerUnitForMin:= tempDataSet.FieldByName('f_norm_per_ed_for_min').AsFloat;
      NormPerStudentForMin:= tempDataSet.FieldByName('f_norm_per_student_for_min').AsFloat;
      tempDataSet.Close;
    end
    else
    begin
      NormPerUnit:= 1;
      NormPerStudent:= 0;
      MaxNormPerStudent:= 0;
      MinRequedContingent:= 0;
      NormPerUnitForMin:= 1;
      NormPerStudentForMin:= 0;
    end;
  end;
  tempDataSet.CommandText:= 'SELECT * FROM Norm_of_time_exceptions WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK);
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then
  begin
    NormPerUnit:= tempDataSet.FieldByName('f_norm_per_ed').AsFloat;
    NormPerStudent:= tempDataSet.FieldByName('f_norm_per_student').AsFloat;
    MaxNormPerStudent:= tempDataSet.FieldByName('max_norm_per_student').AsFloat;
    MinRequedContingent:= tempDataSet.FieldByName('min_requed_student').AsInteger;
    NormPerUnitForMin:= tempDataSet.FieldByName('f_norm_per_ed_for_min').AsFloat;
    NormPerStudentForMin:= tempDataSet.FieldByName('f_norm_per_student_for_min').AsFloat;
  end;
finally
  if tempDataSet.Active then tempDataSet.Close;
  tempDataSet.Free;
end;
end;

function TPlanNagruzkaController.GetPlanHourForDiscipline(PlanIK, DiscIK,
  PotokIK: integer; var plan_hour, busy_hour: double): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT sum(plan_hour) as all_plan_hour FROM GetPlanNagrForDiscipline(' + IntToStr(PlanIK) + ', ' + IntToStr(DiscIK) + ', ' + IntToStr(PotokIK) + ')';
    tempDS.Open;
    plan_hour:= tempDS.FieldByName('all_plan_hour').AsFloat;
    tempDS.Close;
    tempDS.CommandText:= 'SELECT (sum(ISNULL(hour_unit, 0) + ISNULL(student_hour, 0))) as all_busy_hour FROM GetTeacherPlanNagr(2, ' + IntToStr(PlanIK) + ', ' + IntToStr(DiscIK) + ', ' + IntToStr(PotokIK) + ', NULL)';
    tempDS.Open;
    busy_hour:= tempDS.FieldByName('all_busy_hour').AsFloat;
    Result:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagruzkaController.GetPlans(SourceDataSet: PDataSet;
  KafedraIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cFullName_plan, (''Тип обучения: '' + LOWER(cName_type_ed) + '', форма обучения: '' + LOWER(cName_form_ed)) as cName_plan From Plan_nagr ' + 'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (ik_kaf = ' + IntToStr(KafedraIK) + ') and (ik_year = ' + IntToStr(YearIK) + ') and (Plan_nagr.ik_sem_type = ' + IntToStr(SemIK) + ') Order By ik_year DESC, Plan_nagr.ik_sem_type DESC, Plan_nagr.ik_type_ed, Plan_nagr.ik_form_ed', 'ik_plan_nagr', isShowFirst, defValue);
end;

function TPlanNagruzkaController.GetPlansForTeacher(SourceDataSet: PDataSet;
  TeacherIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT release_date FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDS.Open;
  if tempDS.FieldByName('release_date').Value = NULL then
    Result:= GetPlans(SourceDataSet, TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(TeacherIK), YearIK, SemIK, isShowFirst, defValue)
 else
    begin
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_plan From Plan_nagr ' + 'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed ' +
      'INNER JOIN Shedule ON (Plan_nagr.ik_year = Shedule.ik_year) and (Plan_nagr.ik_sem_type = Shedule.ik_sem_type) Where (ik_kaf = ' + IntToStr(TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(TeacherIK)) +
      ') and (d_sem_start < ''' + FormatDateTime('dd.mm.yyyy', tempDS.FieldByName('release_date').AsDateTime) + ''') Order By Plan_nagr.ik_year, Plan_nagr.ik_sem_type, Plan_nagr.ik_type_ed, Plan_nagr.ik_form_ed', 'ik_plan_nagr', isShowFirst, NULL);
    end;
  tempDS.Close;
  tempDS.Free;
end;

function TPlanNagruzkaController.GetTeachersFromPlan(SourceDataSet: PDataSet;
  PlanIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Relation_kafedra_prep.ik_id_prepod, Prepods.itab_n, Relation_kafedra_prep.ik_work_type, (RTRIM(Prepods.clastname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cfirstname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cotch) + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '')'') AS FIO, (RTRIM(Prepods.clastname) + ' + #39 + ' ' + #39 + ' + LEFT(dbo.Prepods.cfirstname, 1) + ' + #39 + '. ' + #39 + ' + LEFT(dbo.Prepods.cotch, 1) + ' + #39 + '.' + #39 + ') AS shortFIO ' +
    'From Relation_kafedra_prep INNER JOIN Prepods ON Relation_kafedra_prep.itab_n = Prepods.itab_n LEFT JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type ' +
    'Where (ik_id_prepod in (Select ik_id_prepod From Prepod_plan_nagr INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr Where Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ')) Order By FIO', 'ik_id_prepod', isShowFirst, defaultValue);
end;

function TPlanNagruzkaController.GetPlanHourForShedule(PrepodPlanIKList: string): double;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECt sum(f_hour_per_unit + i_student_count*f_norm_per_student) as res_value FROM ' +
    '(SELECt ik_vid_zanyat, ik_vid_nagruzki, f_hour_per_unit, i_student_count FROM Prepod_plan_nagr INNER JOIN ' +
    'Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr WHERE Prepod_plan_nagr.ik_prepod_plan in (' + PrepodPlanIKList + ')) f ' +
    'INNER JOIN (SELECT ik_vid_zanyat, ik_vid_nagruzki, f_norm_per_student FROM Content_norma_of_time WHERE ' +
    'ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok = ' +
    '(SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_content_plan_nagr = (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')))))) s ' +
    'ON (f.ik_vid_zanyat = s.ik_vid_zanyat) and (f.ik_vid_nagruzki = s.ik_vid_nagruzki)';

  {tempDataSet.CommandText:= 'SELECt sum(f_hour_per_unit + i_student_count*f_norm_per_student) as res_value FROM ' +
    '(SELECt ik_vid_zanyat, ik_vid_nagruzki, f_hour_per_unit, i_student_count FROM Prepod_plan_nagr INNER JOIN ' +
    'Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr WHERE (Content_plan_nagr.ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ') and (ik_calc_unit = ' + IntToStr(CalcUnitIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')) f ' +
    'INNER JOIN (SELECT ik_vid_zanyat, ik_vid_nagruzki, f_norm_per_student FROM Content_norma_of_time WHERE ' +
    'ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok = (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ')))) s ' +
    'ON (f.ik_vid_zanyat = s.ik_vid_zanyat) and (f.ik_vid_nagruzki = s.ik_vid_nagruzki)';
  }
  tempDataSet.Open;
  Result:= tempDataSet.FieldByName('res_value').AsFloat;
  tempDataSet.Close;
  tempDataSet.Free;
end;

procedure TPlanNagruzkaController.GetPotokInfo(PlanIK, PotokSemIK: integer;
  var StudCount, Course, grupCount, subgroupCount: string);
var
  tempDataSet: TADODataSet;
//  typeEdIK, planYearValue: integer;
begin
  Course:= '-';
  StudCount:= '0';
  grupCount:= '0';
  subgroupCount:= '0';
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
try
  tempDataSet.CommandText:= 'SELECT student_count, group_count, subgroup_count, sep_group_count, course_number, sep_subgroup_count '+
      'FROM GetContentOfDepartmentPlanNagr(2, ' +  IntToStr(PlanIK) + ', ' + IntToStr(PotokSemIK) + ')';
  tempDataSet.Open;
  grupCount:= IntToStr(tempDataSet.FieldByName('group_count').AsInteger + tempDataSet.FieldByName('sep_group_count').AsInteger);
  if (tempDataSet.FieldByName('sep_group_count').AsInteger <> 0) then
  begin
    if tempDataSet.FieldByName('sep_subgroup_count').AsInteger <> 0 then
      subgroupCount:= IntToStr(tempDataSet.FieldByName('subgroup_count').AsInteger + tempDataSet.FieldByName('sep_subgroup_count').AsInteger)
    else subgroupCount:= tempDataSet.FieldByName('subgroup_count').AsString + '+?';
  end
  else subgroupCount:= tempDataSet.FieldByName('subgroup_count').AsString;
  Course:= tempDataSet.FieldByName('course_number').AsString;
  StudCount:= tempDataSet.FieldByName('student_count').AsString;

finally
  if tempDataSet.Active then tempDataSet.Close;
  if Assigned(tempDataSet) then tempDataSet.Free;
end;
end;

function TPlanNagruzkaController.GetPotokShemes(PlanIK, PotokIK: integer): TDataSet;
begin
  if dm.aspPotokShemes.Active then dm.aspPotokShemes.Close;
  dm.aspPotokShemes.Parameters.ParamByName('@ik_plan_nagr').Value:= PlanIK;
  dm.aspPotokShemes.Parameters.ParamByName('@ik_potok').Value:= PotokIK;
  dm.aspPotokShemes.Open;
  Result:= dm.aspPotokShemes;
end;

procedure TPlanNagruzkaController.GetProfileBySpec(SourceDataSet: PDataSet;
  SpecFacIK: integer; isShowFirst: boolean; defaultValue: Variant);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select iK_spclz, cName_spclz from spclz where (spclz.ik_spec is null) or (spclz.ik_spec in (select ik_spec from Relation_spec_fac where ik_spec_fac = '+IntToStr(SpecFacIK)+'))', 'iK_spclz', isShowFirst, defaultValue);
end;

function TPlanNagruzkaController.GetSemesterNumberForPotok(PotokIK,
  PlanIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  Result:= 0;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'Select year_value From Potok INNER JOIN Year_uch_pl ON Potok.ik_year_enter = Year_uch_pl.ik_year_uch_pl ' +
      'Where ik_potok = ' + IntToStr(PotokIK);
    tempDataSet.Open;
    Result:= tempDataSet.FieldByName('year_value').AsInteger;
    //uchPlanIK:= tempDataSet.FieldByName('ik_uch_plan').AsInteger;
    tempDataSet.Close;

    tempDataSet.CommandText:= 'SELECT year_value, ik_sem_type FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = ' + IntToStr(PlanIK);
    tempDataSet.Open;
    if tempDataSet.FieldByName('ik_sem_type').AsInteger = 1 then
      Result:= (tempDataSet.FieldByName('year_value').AsInteger - Result)*2 + 1
    else Result:= (tempDataSet.FieldByName('year_value').AsInteger - Result)*2 + 2;
    tempDataSet.Close;
  finally
    if Assigned(tempDataSet) then tempDataSet.Free;
  end;
end;

function TPlanNagruzkaController.GetSemesterNumberForPotok(
  ContentPlanNagrIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  Result:= 0;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'Select year_value From Potok inner join Uch_pl on Potok.ik_uch_plan=Uch_pl.ik_uch_plan INNER JOIN Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl ' +
      'Where ik_potok = (Select id_potok From Potok_semestr ps,Potok_semestr_shema pss WHERE ps.ik_potok_semestr = pss.ik_potok_semestr '+
      'and ik_shema = (SELECT ik_shema FROM Content_plan_nagr Where ik_content_plan_nagr = ' + IntToStr(ContentPlanNagrIK) + '))';
    tempDataSet.Open;
    Result:= tempDataSet.FieldByName('year_value').AsInteger;
    //uchPlanIK:= tempDataSet.FieldByName('ik_uch_plan').AsInteger;
    tempDataSet.Close;

    tempDataSet.CommandText:= 'SELECT year_value, ik_sem_type FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr = ' + IntToStr(ContentPlannagrIK) + ')';
    tempDataSet.Open;
    if tempDataSet.FieldByName('ik_sem_type').AsInteger = 1 then
      Result:= (tempDataSet.FieldByName('year_value').AsInteger - Result)*2 + 1
    else Result:= (tempDataSet.FieldByName('year_value').AsInteger - Result)*2 + 2;
    tempDataSet.Close;
  finally
    if Assigned(tempDataSet) then tempDataSet.Free;
  end;
end;

procedure TPlanNagruzkaController.GetSpecByFac(SourceDataSet: PDataSet;
  FacIK: integer; isShowFirst: boolean; defaultValue: Variant);
begin


 TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select ik_spec_fac,isnull(Sh_spec+ '', '','''')  + Cname_spec as Cname_spec from Spec_stud, Relation_spec_fac where Spec_stud.ik_spec = Relation_spec_fac.ik_spec and spDateExit is null and ik_fac='+IntToStr(FacIK), 'ik_spec_fac', isShowFirst, defaultValue);

end;

function TPlanNagruzkaController.GetTeacherIKFromTeacherPlan(
  PlanIK, DiscIK, PotokIK, TeacherIK: integer): TADODataSet;
begin
  Result:= TGeneralController.Instance.GetNewADODataSet(false);
  Result.CommandText:= 'Select DISTINCT Relation_kafedra_prep.ik_id_prepod, (RTRIM(Prepods.clastname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cfirstname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cotch) + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '')'') AS FIO ' +
    'From Relation_kafedra_prep INNER JOIN Prepods ON Relation_kafedra_prep.itab_n = Prepods.itab_n LEFT JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type ' +
    'Where (ik_id_prepod in (Select ik_id_prepod From Prepod_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr Where (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')))) and (ik_prepod_plan in (SELECT ik_prepod_plan FROM Prepod_fact_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')))) Order By FIO';
  Result.Open;
end;

function TPlanNagruzkaController.IsConflictOnAutoBuildExists(
  conflictList: TObjectList; AShemaTypeName, APotokName: string;
  AItemType: TConflictOnAutoBuildItemType): boolean;
var
  i: integer;
begin
  Result:= false;
  for I:= 0 to conflictList.Count - 1 do
    if (TConflictOnAutoBuildItem(conflictList[i]).ShemaTypeName = AShemaTypeName) and
      (TConflictOnAutoBuildItem(conflictList[i]).PotokName = APotokName) and
      (TConflictOnAutoBuildItem(conflictList[i]).ItemType = AItemType) then
    begin
      Result:= true;
      break;
    end;
end;

function TPlanNagruzkaController.LoadContentPlanNagr(isEdit: boolean;
  PlanIK, PotokSemIK, DiscIK, DiscTypeIK{, semesterNumber}: Integer; DiscTypeCalcAsPractice: boolean;
  var DiscHour, RaspHour: double; isNeedCalc: boolean): TDataSet;
var
  tempDataSet:TADODataSet;
 // calcStudentsOnly: boolean;
begin
  Result:= nil;
  CloseContentPlanNagr;
  TNagruzkaController.Preparation.CloseNormOfTime;
  if dm.adsVidZanyat.Active then dm.adsVidZanyat.Close;

  if DiscTypeCalcAsPractice then
    dm.adsVidZanyat.CommandText:= 'select * from GetVidZanyatForDisc(2,'+IntToStr(PlanIK)+','+VarToStr(PotokSemIK)+','+
                                  IntToStr(DiscIK)+','+IntToStr(DiscTypeIK)+')'
   else
     dm.adsVidZanyat.CommandText:= 'select * from GetVidZanyatForDisc(1,'+IntToStr(PlanIK)+','+VarToStr(PotokSemIK)+','+
                                  IntToStr(DiscIK)+','+IntToStr(DiscTypeIK)+')';



  dm.adsNormOfTime.CommandText:= 'Select * From Content_norma_of_time Where ik_norm_of_time = (Select ik_norm_of_time From Potok_semestr Where ik_potok_semestr = ' + VarToStr(PotokSemIK) + ')';
  dm.adsNormOfTime.Open;
  dm.adsNormOfTimeForPractice.CommandText:= 'Select * From Content_norm_of_time_practice Where (ik_norm_of_time = (Select ik_norm_of_time From Potok_semestr Where ik_potok_semestr = ' + VarToStr(PotokSemIK) + ')) and (ik_disc = ' + IntToStr(DiscIK) + ')';
  dm.adsNormOfTimeForPractice.Open;

  //грузим содержание нагрузки для дисциплины
  dm.qContentUchPlan.SQL.Clear;
  dm.qContentUchPlan.SQL.Add('Select Content_UchPl.*, ISNULL(vzst.tasks_count, 1) as tasks_count, ISNULL(upwce.week_count, sem_uch_pl.kol_ned) as kol_ned,'+
    'units_plans.ik_shema, units_plans.ik_uch_plan From Content_UchPl LEFT JOIN UchPlan_WeekCount_Exception upwce '+
    'ON Content_UchPl.ik_upContent = upwce.ik_upContent LEFT JOIN Vid_zanyat_with_several_tasks vzst '+
    'ON Content_UchPl.ik_upContent = vzst.ik_upContent INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan '+
    'INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) '+
    'INNER JOIN (SELECT DISTINCT ps.ik_potok_semestr, pss.ik_shema, Potok.ik_uch_plan,(ye.year_value - yup.year_value)*2+ps.id_sem_type as n_sem from Potok inner join Potok_semestr ps '+
    'on potok.ik_potok = ps.id_potok inner join Potok_semestr_shema pss on pss.ik_potok_semestr = ps.ik_potok_semestr '+
    'INNER JOIN Calc_unit_semestr cus ON pss.ik_shema = cus.ik_shema inner join Uch_pl on Uch_pl.ik_uch_plan = Potok.ik_uch_plan '+
		'inner join Year_uch_pl yup on Uch_pl.ik_year_uch_pl = yup.ik_year_uch_pl inner join Year_uch_pl ye on ps.id_year = ye.ik_year_uch_pl '+
    'WHERE ps.ik_potok_semestr =' +IntToStr(PotokSemIK)+') units_plans ON sv_disc.ik_uch_plan = units_plans.ik_uch_plan and Content_UchPl.n_sem = units_plans.n_sem '+
    'Where (sv_disc.ik_disc = '+IntToStr(DiscIK)+') and (Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = '+IntToStr(PlanIK)+'))');


  dm.qContentUchPlan.Open;

  GetPotokShemes(PlanIK, PotokSemIK);
  
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  if dm.adsPotokShemasInfo.Active then dm.adsPotokShemasInfo.Close;
  dm.adsPotokShemasInfo.CommandText:= 'SELECT * FROM GetPotokShemaInfo(' + IntToStr(PlanIK) + ', ' + IntToStr(PotokSemIK) + ', ' + IntToStr(DiscIK) {+ ', ' + IntToStr(semesterNumber)} + ')';
  dm.adsPotokShemasInfo.Open;

  if DiscTypeCalcAsPractice then
    dm.aspContentPlanNagr.Tag:= 1
  else dm.aspContentPlanNagr.Tag:= 0;
  dm.aspContentPlanNagr.Parameters.ParamByName('@ik_plan_nagr').Value:= PlanIK;
  dm.aspContentPlanNagr.Parameters.ParamByName('@ik_disc').Value:= DiscIK;
  dm.aspContentPlanNagr.Parameters.ParamByName('@ik_potok').Value:= PotokSemIK;
  dm.aspContentPlanNagr.Open;

  {      подгружаются исключения норм времени

  try
  
    tempDataSet.CommandText:= 'SELECT * FROM Norm_of_time_exceptions WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr  = ' + IntToStr(PotokSemIK) + ')))';
    tempDataSet.Open;
    tempDataSet.First;
    while not tempDataSet.Eof do
    begin
      if dm.aspContentPlanNagr.Locate('ik_content_plan_nagr', tempDataSet.FieldByName('ik_content_plan_nagr').AsInteger, [loPartialKey]) then
      begin
        if DiscTypeCalcAsPractice then
        begin
          if dm.adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', dm.aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger, [loPartialKey]) then
          begin
            dm.adsNormOfTimeForPractice.Edit;
            dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat:= tempDataSet.FieldByName('f_norm_per_student').AsFloat;
            dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsFloat:= tempDataSet.FieldByName('f_norm_per_ed').AsFloat;
            dm.adsNormOfTimeForPractice.Post;
          end;
        end
        else
        begin
          if dm.adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger, dm.aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
          begin
            dm.adsNormOfTime.Edit;
            dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat:= tempDataSet.FieldByName('f_norm_per_student').AsFloat;
            dm.adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat:= tempDataSet.FieldByName('f_norm_per_ed').AsFloat;
            dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat:= tempDataSet.FieldByName('max_norm_per_student').AsFloat;
            dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger:= tempDataSet.FieldByName('min_requed_student').AsInteger;
            dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat:= tempDataSet.FieldByName('f_norm_per_student_for_min').AsFloat;
            dm.adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat:= tempDataSet.FieldByName('f_norm_per_ed_for_min').AsFloat;
            dm.adsNormOfTime.Post;
          end;
        end;
      end;
      tempDataSet.Next;
    end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;               }

  if isNeedCalc then
  begin
    DiscHour:= 0;
    RaspHour:= 0;
    while not dm.aspContentPlanNagr.Eof do
    begin
      DiscHour:= DiscHour + dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat;
      RaspHour:= RaspHour + dm.aspContentPlanNagr.FieldByName('busy_hour').AsFloat;
      dm.aspContentPlanNagr.Next;
    end;
  end;
  dm.aspContentPlanNagr.First;
  Result:= dm.aspContentPlanNagr;
end;

procedure TPlanNagruzkaController.LoadAllTeacherPlanNagr(SourceDataSet:PDataSet; PlanIK, TeacherIK: Integer; var AllPlanHour: double);
var
  tempDS: TADODataSet;
  DiscHour: double;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  if SourceDataSet^.Active then
    SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandText:= 'SELECT * FROM GetAllTeacherNagrForPreview(1, ' + IntToStr(PlanIK) + ', ' + IntToStr(TeacherIK) + ')';
  SourceDataSet^.Open;
  SourceDataSet^.First;
  AllPlanHour:= 0;
  while not SourceDataSet^.Eof do
  begin
    tempDS.CommandText:= 'SELECT ik_vid_zanyat, ik_vid_nagruzki, sum(hour_unit + student_hour) as f_all_hour FROM GetTeacherPlanNagr(1, ' + IntToStr(PlanIK) + ', ' + SourceDataSet^.FieldByName('ik_disc').AsString + ', ' + SourceDataSet^.FieldByName('ik_potok_semestr').AsString + ', ' + IntToStr(TeacherIK) + ') GROUP BY ik_vid_zanyat, ik_vid_nagruzki';
    tempDS.Open;
    tempDS.First;
    DiscHour:= 0;                                                                       
    while not tempDS.Eof do
    begin
      DiscHour:= DiscHour + tempDS.FieldByName('f_all_hour').AsFloat;
      tempDS.Next;
    end;
    tempDS.Close;
    AllPlanHour:= AllPlanHour + DiscHour;
    SourceDataSet^.Edit;
    SourceDataSet^.FieldByName('plan_hour').AsFloat:= DiscHour;
    SourceDataSet^.Post;
    SourceDataSet^.Next;
  end;
  tempDS.Free;
end;

{function TPlanNagruzkaController.SaveAllDiscToTeacher(TeacherIK, PlanIK,
  DiskIK, PotokIK: integer): boolean;
var
  tempDataSet, secTempDataSet, thirdDataSet: TADODataSet;
  tempStoredProc: TADOStoredProc;
  uchPlanIK, semNumber, vidZanyatIK: integer;
  planUnitHour: double;
  inPlanCount: word;
begin

  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiskIK) + ') and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = ' + IntToStr(PotokIK) + ')))) and (iTab_n = ' + IntToStr(TeacherIK) + ')';
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then  
    if MessageBox(FMessageHandle, 'Перед закреплением всей учебной нагрузки по данной дисциплине, ' + #10#13 +
      'вся учебная нагрузка по данной дисциплине, закрепленная ранее будет удалена!' + #10#13+
      'При этом будут удалены соответсвующие записи: ' + #10#13 +
      '  1) из фактической нагрузки преподавателей;' + #10#13 +
      '  2) из расписания преподавателей.', 'Закрепление всей дисциплины', MB_YESNO) = mrNo then
        begin
          tempDataSet.Close;
          Result:= false;
          exit;
        end;
  tempDataSet.Close;

  secTempDataSet:= TADODataSet.Create(nil);
  secTempDataSet.Connection:= dm.DBConnect;
  thirdDataSet:= TADODataSet.Create(nil);
  thirdDataSet.Connection:= dm.DBConnect;
  thirdDataSet.LockType:= ltBatchOptimistic;

  tempDataSet.CommandText:= 'Select Grup.ik_uch_plan, YEAR(Grup.DateCreate) as group_year From Relation_potok_grup INNER JOIN Grup ON Relation_potok_grup.ik_grup = Grup.ik_grup ' +
    'Where Relation_potok_grup.ik_potok = ' + IntToStr(PotokIK);
  tempDataSet.Open;
  semNumber:= tempDataSet.FieldByName('group_year').AsInteger;
  uchPlanIK:= tempDataSet.FieldByName('ik_uch_plan').AsInteger;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT year_value, ik_sem_type FROM Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  if tempDataSet.FieldByName('ik_sem_type').AsInteger = 1 then
      semNumber:= (tempDataSet.FieldByName('year_value').AsInteger - semNumber)*2 + 1
  else
      semNumber:= (tempDataSet.FieldByName('year_value').AsInteger - semNumber)*2 + 2;
  tempDataSet.Close;

  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetCalcUnitsForPlanNagr';

  tempStoredProc.Parameters.CreateParameter('@ik_content_plan_nagr', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@ik_vid_nagruzki', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TeacherIK);
  tempStoredProc.Parameters.CreateParameter('@in_plan_count', ftWord, pdInput, 0, 0);

  tempDataSet.CommandText:= 'SELECT * FROM Content_plan_nagr WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiskIK) + ') and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = ' + IntToStr(PotokIK) + '))';
  tempDataSet.Open;
  while not tempDataSet.Eof do
  begin
    vidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempStoredProc.Parameters.ParamByName('@ik_content_plan_nagr').Value:= tempDataSet.FieldByName('ik_content_plan_nagr').Value;
    thirdDataSet.Close;

    if vidZanyatIK = 32 then
    begin
        thirdDataSet.CommandText:= 'SELECT sum(Content_UchPl.i_hour_per_week * sem_uch_pl.kol_ned)*0.05 as individ_hour FROM Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan ' +
          'INNER JOIN sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) ' +
          'WHERE (Content_UchPl.ik_vid_zanyat between 3 and 5) and (sv_disc.ik_uch_plan = ' + IntToStr(uchPlanIK) + ') and (sv_disc.ik_disc = ' + IntToStr(DiskIK) + ') and (Content_UchPl.n_sem = ' + IntToStr(semNumber) + ') and '
          + '(Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + '))';
        thirdDataSet.Open;
        planUnitHour:= round(thirdDataSet.FieldByName('individ_hour').AsFloat);
        inPlanCount:= 1;
        thirdDataSet.Close;
    end
    else
    begin
      thirdDataSet.CommandText:= 'Select Content_UchPl.*, sem_uch_pl.kol_ned From Content_UchPl INNER JOIN sv_disc ON Content_UchPl.ik_disc_uch_plan = sv_disc.ik_disc_uch_plan INNER JOIN ' +
        'sem_uch_pl ON (sv_disc.ik_uch_plan = sem_uch_pl.ik_uch_plan) and (Content_UchPl.n_sem = sem_uch_pl.n_sem) Where (Content_UchPl.n_sem = ' + IntToStr(semNumber) + ') and (sv_disc.ik_uch_plan = ' + IntToStr(uchPlanIK) +
        ') and (sv_disc.ik_disc = ' + IntToStr(DiskIK) + ') and (Content_UchPl.ik_vid_zanyat = ' + IntToStr(vidZanyatIK) + ') and '
        + '(Content_UchPl.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + '))';
      thirdDataSet.Open;
      planUnitHour:= -1;
      if thirdDataSet.RecordCount > 0 then
        if (thirdDataSet.FieldByName('i_hour_per_week').Value <> NULL) then
         planUnitHour:= thirdDataSet.FieldByName('i_hour_per_week').AsFloat * thirdDataSet.FieldByName('kol_ned').AsFloat;
      if thirdDataSet.RecordCount <> 0 then inPlanCount:= thirdDataSet.RecordCount
      else inPlanCount:= 1;
      thirdDataSet.Close;
    end;
    tempStoredProc.Parameters.ParamByName('@in_plan_count').Value:= inPlanCount;

    if vidZanyatIK <> 32 then
    begin
      secTempDataSet.CommandText:= 'SELECT * FROM Content_norma_of_time WHERE (ik_vid_zanyat = ' + IntToStr(vidZanyatIK) + ') and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK) + '))';
      secTempDataSet.Open;
      while not secTempDataSet.Eof do
      begin
        if (planUnitHour = -1) then
          planUnitHour:= secTempDataSet.FieldByName('f_norm_per_ed').AsFloat //* inPlanCount//+ NormPerStudent * StudentInPotok
        else
          planUnitHour:= planUnitHour * secTempDataSet.FieldByName('f_norm_per_ed').AsFloat; //* inPlanCount; //+ NormPerStudent * StudentInPotok;
        thirdDataSet.CommandText:= 'SELECT * FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr = ' + VarToStr(tempStoredProc.Parameters.ParamByName('@ik_content_plan_nagr').Value) + ') and (iTab_n = ' + IntToStr(TeacherIK) + ') and (ik_vid_nagruzki = ' + secTempDataSet.FieldByName('ik_vid_nagruzki').AsString + ')';
        thirdDataSet.Open;
        while not thirdDataSet.Eof do
          thirdDataSet.Delete;
        tempStoredProc.Parameters.ParamByName('@ik_vid_nagruzki').Value:= secTempDataSet.FieldByName('ik_vid_nagruzki').Value;
        tempStoredProc.Open;
        while not tempStoredProc.Eof do
        begin
          thirdDataSet.Insert;
          thirdDataSet.FieldByName('ik_content_plan_nagr').Value:= tempStoredProc.Parameters.ParamByName('@ik_content_plan_nagr').Value;
          thirdDataSet.FieldByName('iTab_n').Value:= TeacherIK;
          thirdDataSet.FieldByName('ik_vid_nagruzki').Value:= secTempDataSet.FieldByName('ik_vid_nagruzki').Value;
          thirdDataSet.FieldByName('ik_calc_unit').Value:= tempStoredProc.FieldByName('ik_calc_unit').AsInteger;
          thirdDataSet.FieldByName('by_plan_number').Value:= tempStoredProc.FieldByName('by_plan_number').AsInteger;
          thirdDataSet.FieldByName('i_student_count').Value:= tempStoredProc.FieldByName('student_count').AsInteger - tempStoredProc.FieldByName('busy_student_count').AsInteger;
          thirdDataSet.FieldByName('f_hour_per_unit').Value:= planUnitHour-tempStoredProc.FieldByName('busy_hour').AsFloat;
          thirdDataSet.Post;
          tempStoredProc.Next;
        end;
        tempStoredProc.Close;
        thirdDataSet.UpdateBatch();
        secTempDataSet.Next;
      end;
     secTempDataSet.Close;
    end
    else
    begin
      thirdDataSet.CommandText:= 'SELECT * FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr = ' + VarToStr(tempStoredProc.Parameters.ParamByName('@ik_content_plan_nagr').Value) + ') and (iTab_n = ' + IntToStr(TeacherIK) + ') and (ik_vid_nagruzki = 1)';
      thirdDataSet.Open;
      while not thirdDataSet.Eof do
        thirdDataSet.Delete;
      tempStoredProc.Parameters.ParamByName('@ik_vid_nagruzki').Value:= 1;
      tempStoredProc.Open;
      while not tempStoredProc.Eof do
      begin
          thirdDataSet.Insert;
          thirdDataSet.FieldByName('ik_content_plan_nagr').Value:= tempStoredProc.Parameters.ParamByName('@ik_content_plan_nagr').Value;
          thirdDataSet.FieldByName('iTab_n').Value:= TeacherIK;
          thirdDataSet.FieldByName('ik_vid_nagruzki').Value:= 1;
          thirdDataSet.FieldByName('ik_calc_unit').Value:= tempStoredProc.FieldByName('ik_calc_unit').AsInteger;
          thirdDataSet.FieldByName('by_plan_number').Value:= tempStoredProc.FieldByName('by_plan_number').AsInteger;
          thirdDataSet.FieldByName('i_student_count').Value:= tempStoredProc.FieldByName('student_count').AsInteger - tempStoredProc.FieldByName('busy_student_count').AsInteger;
          thirdDataSet.FieldByName('f_hour_per_unit').Value:= planUnitHour-tempStoredProc.FieldByName('busy_hour').AsFloat;
          thirdDataSet.Post;
          tempStoredProc.Next;
      end;
      tempStoredProc.Close;
      thirdDataSet.UpdateBatch();
    end;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  thirdDataSet.Free;
  secTempDataSet.Free;
  tempDataSet.Free;
  tempStoredProc.Free;
  Result:= true;
end;     }

function TPlanNagruzkaController.SaveContingient(YearIK, FacIK: integer;
  PlanContingentList: TObjectList): boolean;
var
  tempDS: TADODataSet;
  i: integer;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  try
  tempDS.CommandText:= 'SELECT * FROM Plan_contingent WHERE (ik_spec_fac in (SELECT ik_Spec_fac FROM Relation_spec_fac WHERE ik_fac = ' + IntToStr(FacIK) + ')) and (ik_year = ' + IntToStr(YearIK) + ')';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  for I := 0 to PlanContingentList.Count - 1 do
    with TPlanContingentItem(PlanContingentList[i]) do
      if (GroupCount <> 0) and (SubgroupCount <> 0) and ((Budget <> 0) or (Contract <> 0)) then
      begin
        tempDS.Insert;
        tempDS.FieldByName('ik_year').AsInteger:= YearIK;
        tempDS.FieldByName('ik_spec_fac').AsInteger:= SpecIK;
        tempDS.FieldByName('course_number').AsInteger:= Course;
        tempDS.FieldByName('group_count').AsInteger:= GroupCount;
        tempDS.FieldByName('subgroup_count').AsInteger:= SubgroupCount;
        tempDS.FieldByName('budget_count').AsInteger:= Budget;
        tempDS.FieldByName('contract_count').AsInteger:= Contract;
        tempDS.Post;
      end
      else
      begin
        if ((GroupCount <> 0) and (SubgroupCount <> 0) and (Budget = 0) and (Contract = 0)) or
          (((GroupCount = 0) and (SubgroupCount <> 0)) or ((GroupCount <> 0) and (SubgroupCount = 0))) then
        begin
          tempDS.Close;
          tempDS.Free;
          Application.MessageBox('Плановый контингент заполнен не корректно! Сохранение не возможно.','Плановый контингент',MB_ICONWARNING);
          exit;
        end;
      end;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;
  Result:= true;
  except
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    raise;
  end;
end;

function TPlanNagruzkaController.SaveDiscToTeacher(TeacherIK: integer;
  ATakeNagr: TObjectList): boolean;
var
  tempDataSet: TADODataSet;
  tempTCU: TTakeNagrUnit;
  i, j: integer;
  isOccured: boolean;
  K: HResult;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
try
  try
  i:= 0;
  while i <= ATakeNagr.Count - 1 do
  begin
    tempTCU:= TTakeNagrUnit(ATakeNagr[i]);
    tempDataSet.CommandText:= 'Select * From Prepod_plan_nagr Where (ik_content_plan_nagr = ' + IntToStr(tempTCU.ContentPlanNagrIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')';
    tempDataSet.Open;
    tempDataSet.First;
    if tempTCU.IsRemoved then
    begin
      while not tempDataSet.Eof do
        tempDataSet.Delete;
      ATakeNagr.Delete(i);
      tempDataSet.UpdateBatch();
      tempDataSet.Close;  
      continue;
    end;
    while not tempDataSet.Eof do
    begin
      isOccured:= false;
      for j := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
        if (tempTCU.TakeCalcUnits[j].CalcUnitIK = tempDataSet.FieldByName('ik_calc_unit').AsInteger)
          and (tempTCU.TakeCalcUnits[j].ByPlanNumber = tempDataSet.FieldByName('by_plan_number').AsInteger)
          and (tempTCU.TakeCalcUnits[j].MemberNumber = tempDataSet.FieldByName('commission_member').AsInteger)
          and (tempTCU.TakeCalcUnits[j].CheckBox.Checked)then
          begin
            isOccured:= true;
            tempDataSet.Edit;
            tempDataSet.FieldByName('f_hour_per_unit').Value:= tempTCU.TakeCalcUnits[j].CurrentHourValue;
            tempDataSet.FieldByName('i_student_count').Value:= tempTCU.TakeCalcUnits[j].CurrentStudentValue;
            tempDataSet.Post;
            break;
          end;
      if not isOccured then
        tempDataSet.Delete
      else
        tempDataSet.Next;
    end;
    tempDataSet.First;
    for j := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
      if tempTCU.TakeCalcUnits[j].CheckBox.Checked then
        if not tempDataSet.Locate('ik_calc_unit; by_plan_number; commission_member', VarArrayOf([tempTCU.TakeCalcUnits[j].CalcUnitIK, tempTCU.TakeCalcUnits[j].ByPlanNumber, tempTCU.TakeCalcUnits[j].MemberNumber]), [loPartialKey]) then
        begin
          tempDataSet.Insert;
          tempDataSet.FieldByName('ik_calc_unit').Value:= tempTCU.TakeCalcUnits[j].CalcUnitIK;
          tempDataSet.FieldByName('f_hour_per_unit').Value:= tempTCU.TakeCalcUnits[j].CurrentHourValue;
          tempDataSet.FieldByName('i_student_count').Value:= tempTCU.TakeCalcUnits[j].CurrentStudentValue;
          tempDataSet.FieldByName('by_plan_number').Value:= tempTCU.TakeCalcUnits[j].ByPlanNumber;
          tempDataSet.FieldByName('commission_member').Value:= tempTCU.TakeCalcUnits[j].MemberNumber;
          tempDataSet.FieldByName('ik_content_plan_nagr').Value:= tempTCU.ContentPlanNagrIK;
          tempDataSet.FieldByName('ik_id_prepod').Value:= TeacherIK;
          tempDataSet.Post;
        end;
    tempDataSet.UpdateBatch();
    tempDataSet.Close;
    inc(i);
  end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
  Result:= true;
except
  on E: EOleException do
  begin
    K:= E.ErrorCode;
    if (k = ADO_ERROR_TWO) or (k = ADO_ERROR) then Result:= true
    else raise;
  end;
  on E: Exception do raise;
end;

end;

function TPlanNagruzkaController.SavePlan(var PlanIK: integer; KafedraIK, YearIK,
  SemTypeIK, TypeEdIK, FormEdIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
//  tempDS: TADODataSet;
begin
//  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
//  tempDS.CommandText:= 'SELECT Plan_nagr ';
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePlanNagr', false);

  if (PlanIK < 0) then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  tempStoredProc.Parameters.CreateParameter('@ik_sem_type', ftWord, pdInput, 0, SemTypeIK);
  tempStoredProc.Parameters.CreateParameter('@ik_type_ed', ftInteger, pdInput, 0, TypeEdIK);
  tempStoredProc.Parameters.CreateParameter('@ik_form_ed', ftInteger, pdInput, 0, FormEdIK);
  try
    tempStoredProc.Open;
    PlanIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Free;
    Result:= true;
  except
    on E: Exception do
    begin
      tempStoredProc.Free;
      raise EApplicationException.Create(E.Message);
    end;
  end;
end;

function TPlanNagruzkaController.SavePlanContent(PlanIK,
  DiscIK, PotokIK: integer; DiscName, potokName: string; DiscTypeCalcAsPractice: boolean; conflictList: TObjectList): boolean;
var
  tempDataSet, secTempDS, normTempDS: TADODataSet;
  k: integer;
  calcStudentsOnly, normHasException: boolean;
begin
  Result:= false;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  secTempDS:= TGeneralController.Instance.GetNewADODataSet(true);

  tempDataSet.CommandText:= 'SELECT bit_calc_only_student, ik_type_ed FROM Type_ed WHERE ik_type_ed = (SELECT ik_type_ed FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDataSet.Open;
  calcStudentsOnly:= tempDataSet.FieldByName('bit_calc_only_student').AsBoolean;
  tempDataSet.Close;

  dm.aspContentPlanNagr.DisableControls;
  try
    dm.aspContentPlanNagr.First;
    while (not dm.aspContentPlanNagr.Eof) do
    begin
      if (dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 0.0) then
        dm.aspContentPlanNagr.Delete
      else dm.aspContentPlanNagr.Next;
    end;

    secTempDS.CommandText:= 'SELECT * FROM Content_plan_nagr WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr  = ' + IntToStr(PotokIK) + '))';
    secTempDS.Open;

    dm.aspContentPlanNagr.First;
    while (not dm.aspContentPlanNagr.Eof) do
    begin
      if (dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value = NULL) then
        raise Exception.Create('В строке №' + IntToStr(dm.aspContentPlanNagr.RecNo) + ' не указан вид занятий.');
      if (dm.aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value = NULL) then
        raise Exception.Create('В строке №' + IntToStr(dm.aspContentPlanNagr.RecNo) + ' не указан вид нагрузки.');

      tempDataSet.CommandText:= 'Select * FROM Calc_unit_semestr cus WHERE cus.ik_shema = ' + dm.aspContentPlanNagr.FieldByName('ik_shema').AsString + ' and cus.ik_shema in (select pss.ik_shema from potok_semestr_shema pss,potok_semestr ps where pss.ik_potok_semestr = ps.ik_potok_semestr and (ps.id_year = (SELECT ik_year FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')))';
      tempDataSet.Open;
      if tempDataSet.RecordCount = 0 then
        if not IsConflictOnAutoBuildExists(conflictList, dm.aspContentPlanNagr.FieldByName('name_potok_shema').AsString, potokName, cabiNoCUContingent) then
          conflictList.Add(TConflictOnAutoBuildItem.Create(dm.aspContentPlanNagr.FieldByName('name_potok_shema').AsString, potokName, cabiNoCUContingent));
      tempDataSet.Close;

      if dm.aspContentPlanNagr.FieldByName('ik_content_plan_nagr').Value = NULL then  // значит надо вставить запись
      begin
        secTempDS.Insert;
        secTempDS.FieldByName('ik_plan_nagr').Value:= PlanIK;
        secTempDS.FieldByName('ik_disc').Value:= DiscIK;
        secTempDS.FieldByName('ik_vid_zanyat').Value:= dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value;
        secTempDS.FieldByName('ik_shema').Value:= dm.aspContentPlanNagr.FieldByName('ik_shema').Value;
        secTempDS.FieldByName('ik_vid_nagruzki').Value:= dm.aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value;
        secTempDS.FieldByName('i_commission_count').Value:= dm.aspContentPlanNagr.FieldByName('i_commission_count').Value;
        secTempDS.Post;
      end;
      dm.aspContentPlanNagr.Next;
    end;

    // удалим то, что было в базе, а сейчас удалилось, а также обновим старые записи
    while not secTempDS.Eof do
    begin
      if (secTempDS.FieldByName('ik_content_plan_nagr').Value <> NULL) then
      begin
        if not dm.aspContentPlanNagr.Locate('ik_content_plan_nagr', secTempDS.FieldByName('ik_content_plan_nagr').AsInteger, [loPartialKey]) then
          secTempDS.Delete
        else
        begin
          secTempDS.Edit;
          secTempDS.FieldByName('ik_vid_zanyat').Value:= dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value;
          secTempDS.FieldByName('ik_shema').Value:= dm.aspContentPlanNagr.FieldByName('ik_shema').Value;
          secTempDS.FieldByName('ik_vid_nagruzki').Value:= dm.aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value;
          secTempDS.FieldByName('i_commission_count').Value:= dm.aspContentPlanNagr.FieldByName('i_commission_count').Value;
          secTempDS.Post;
          secTempDS.Next;
        end;
      end
      else secTempDS.Next;
    end;

    try
      secTempDS.UpdateBatch();
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

    secTempDS.Close;
    Result:= true;
  finally
    dm.aspContentPlanNagr.EnableControls;
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
    if secTempDS.Active then secTempDS.Close;
    secTempDS.Free;
    if Assigned(normTempDS) then
    begin
      if normTempDS.Active then normTempDS.Close;
      normTempDS.Free;
    end;
  end;
end;

function TPlanNagruzkaController.GetAllTeacherPlanHour(PlanIK,
  TeacherIK: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherPlanHour';
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('all_plan_hour').AsFloat;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

function TPlanNagruzkaController.GetAllSemesterPlanHour(YearIK, SemIK,
  TeacherIK: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherHourBySemester';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  tempStoredProc.Parameters.CreateParameter('@ik_sem', ftInteger, pdInput, 0, SemIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('all_plan_hour').AsFloat;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

function TPlanNagruzkaController.GetAllSemesterPlanHourForTeacher(YearIK, SemIK,
  KafedraIK, TabN: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'GetTeacherHourBySemester';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  tempStoredProc.Parameters.CreateParameter('@ik_sem', ftInteger, pdInput, 0, SemIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, TabN);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('all_plan_hour').AsFloat;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

function TPlanNagruzkaController.GetDefaultNormOfTime(VidZanyatIK,
  VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean; var NormPerStudent,
  NormPerUnit, MaxNormPerStudent, NormPerStudentForMin,
  NormPerUnitForMin: double; var MinContingent: integer): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    if DiscTypeCalcAsPractice then
    begin
      if dm.adsNormOfTimeForPractice.Active then
        if dm.adsNormOfTimeForPractice.RecordCount > 0 then
        begin
          dm.adsNormOfTimeForPractice.First;
          tempDS.CommandText:= 'SELECT * FROM Content_norm_of_time_practice WHERE (ik_norm_of_time = ' + dm.adsNormOfTimeForPractice.FieldByName('ik_norm_of_time').AsString + ') and (ik_disc = ' + dm.adsNormOfTimeForPractice.FieldByName('ik_disc').AsString + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ')';
          tempDS.Open;
          if tempDS.RecordCount > 0 then
          begin
            NormPerStudent:= tempDS.FieldByName('f_norm_per_student').AsFloat;
            NormPerUnit:= tempDS.FieldByName('f_norm_per_ed').AsFloat;
            Result:= true;
          end;
          tempDS.Close;
        end;
    end
    else
    begin
      if dm.adsNormOfTime.Active then
        if dm.adsNormOfTime.RecordCount > 0 then
        begin
          dm.adsNormOfTime.First;
          tempDS.CommandText:= 'SELECT * FROM Content_norma_of_time WHERE (ik_norm_of_time = ' + dm.adsNormOfTime.FieldByName('ik_norm_of_time').AsString + ') and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ')';
          tempDS.Open;
          if tempDS.RecordCount > 0 then
          begin
            NormPerStudent:= tempDS.FieldByName('f_norm_per_student').AsFloat;
            NormPerUnit:= tempDS.FieldByName('f_norm_per_ed').AsFloat;
            MaxNormPerStudent:= tempDS.FieldByName('max_norm_per_student').AsFloat;
            MinContingent:= tempDS.FieldByName('min_requed_student').AsInteger;
            NormPerStudentForMin:= tempDS.FieldByName('f_norm_per_student_for_min').AsFloat;
            NormPerUnitForMin:= tempDS.FieldByName('f_norm_per_ed_for_min').AsFloat;
            Result:= true;
          end;
          tempDS.Close;
        end;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagruzkaController.GetDisciplinesFromDepPlan(
  SourceDataSet: PDataSet; PlanIK: integer;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT discpln.ik_disc, discpln.cName_disc From Content_plan_nagr INNER JOIN discpln ON Content_plan_nagr.ik_disc = discpln.ik_disc Where Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ' Order By discpln.cName_disc', 'ik_disc', isShowFirst, NULL);
end;

function TPlanNagruzkaController.GetPotoksFromTeacherPlan(SourceDataSet: PDataSet;
  TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT ps.ik_potok_semestr, Ps.cName_potok, ps.ik_norm_of_time From Content_plan_nagr cpn INNER JOIN Potok_semestr_shema pss ON cpn.ik_shema = pss.ik_shema ' + 'INNER JOIN Potok_semestr ps on ps.ik_potok_semestr=pss.ik_potok_semestr inner join Potok p ON ps.id_potok = p.ik_potok INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_content_plan_nagr = ppn.ik_content_plan_nagr Where (cpn.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ppn.ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (cpn.ik_disc = ' + IntToStr(DiscIK) + ') Order By cName_potok', 'ik_potok_semestr', isShowFirst, defaultValue);
end;

function TPlanNagruzkaController.GetVidZanyatFromTeacherPlan(SourceDataSet: PDataSet;
  TeacherIK, PlanIK, DiscIK, PotokSemIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
 // if isOnlyAuditor then
 //   Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_plan_nagr.ik_vid_zanyat, vid_zaniat.cName_vid_zanyat, ikTypeZanyat, iK_type_vz, Content_plan_nagr.ik_content_plan_nagr From Content_plan_nagr INNER JOIN vid_zaniat ' + 'ON Content_plan_nagr.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr Where (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (Content_plan_nagr.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = ' + IntToStr(PotokIK) + ')) and (Content_plan_nagr.ik_disc = ' + IntToStr(DiscIK) + ') and (Prepod_plan_nagr.ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (vid_zaniat.ik_type_vz = 3) Order By cName_vid_zanyat', 'ik_vid_zanyat', isShowFirst, defaultValue)
 // else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT cpn.ik_vid_zanyat, vz.cName_vid_zanyat, ikTypeZanyat, iK_type_vz From Content_plan_nagr cpn INNER JOIN vid_zaniat vz ' + 'ON cpn.ik_vid_zanyat = vz.ik_vid_zanyat INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_content_plan_nagr = ppn.ik_content_plan_nagr Where (cpn.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (cpn.ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokSemIK) + ')) and (cpn.ik_disc = ' + IntToStr(DiscIK) + ') and (ppn.ik_id_prepod = ' + IntToStr(TeacherIK) + ') Order By cName_vid_zanyat', 'ik_vid_zanyat', isShowFirst, defaultValue);
end;

procedure TPlanNagruzkaController.GetPickListForVidNagruzki(PotokIK, DiscIK, DiscTypeIK, VidZanyatIK: integer; outputPickList: TStrings);
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  outputPickList.Clear;
  try
    if VidZanyatIK = 32 then
      tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki = 1'
    else
    begin
      case DiscTypeIK of
        2,3: tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norm_of_time_practice WHERE (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok_semestr WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')))'
        else tempDS.CommandText:= 'SELECT DISTINCT cName_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norma_of_time WHERE (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok_semestr WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')))'
      end;
    end;
    tempDS.Open;
    while not tempDS.Eof do
    begin
      outputPickList.Add(tempDS.FieldByName('cName_vid_nagruzki').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagruzkaController.LoadAllPlanNagr(PlanIK: integer): TDataSet;
//var
 // studCount, course, group, subgroup, prevPotokIK: integer;
 // DiscHour, RaspHour: double;
 // isBadContingent: boolean;
begin
  Result:= nil;
  if dm.adsAllPlanNagr.Active then
    dm.adsAllPlanNagr.Close;
  dm.adsAllPlanNagr.CommandText:= 'SELECT * FROM GetDepartmentPlanNagr(' + IntToStr(PlanIK) + ') ORDER BY n_sem, cName_disc, cName_potok';
  dm.adsAllPlanNagr.Open;
  Result:= dm.adsAllPlanNagr;
{  if isBadContingent then
    Application.MessageBox(PChar('Система не обнаружила ожидаемый контингент для некоторых потоков данного плана учебной нагрузки.' + #10#13 +
      'Записи плана соответствующие данным потокам не будут отображены. ' + #10#13 +
      'Заполните ожидаемый контингент для всех потоков данного плана учебной нагрузки.'),'План учебной нагрузки кафедры',MB_ICONWARNING);
}
end;

function TPlanNagruzkaController.SetNormOfTimeExceptionForCurrentDisc(DiscCalcAsPractice: boolean; VidZanyatIK,
  VidNagruzkiIK: integer; NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; MinContingent: integer): boolean;
begin
  Result:= false;
  if not DiscCalcAsPractice then
  begin
    if dm.adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([VidZanyatIK, VidNagruzkiIK]), [loPartialKey]) then
    begin
      dm.adsNormOfTime.Edit;
      dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat:= NormPerStudent;
      dm.adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat:= NormPerUnit;
      dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat:= MaxNormPerStudent;
      dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger:= MinContingent;
      dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat:= NormPerStudentForMin;
      dm.adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat:= NormPerUnitForMin;
      dm.adsNormOfTime.Post;
      Result:= true;
    end;
  end
  else
  begin
    if dm.adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', VidNagruzkiIK, [loPartialKey]) then
    begin
      dm.adsNormOfTimeForPractice.Edit;
      dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat:= NormPerStudent;
      dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsFloat:= NormPerUnit;
      dm.adsNormOfTimeForPractice.Post;
      Result:= true;
    end;
  end;
  if Result then
  begin
    dm.aspContentPlanNagr.Edit;
    dm.aspContentPlanNagr.Post;
  end;
end;

procedure TPlanNagruzkaController.SetPlanStatus(PlanIK: integer; CloseStatus: boolean);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'SetPlanNagrStatus';
    tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
    tempStoredProc.Parameters.CreateParameter('@bit_close_status', ftBoolean, pdInput, sizeof(CloseStatus), CloseStatus);
    try
      tempStoredProc.ExecProc;
    except
      raise;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure TPlanNagruzkaController.TakeAllNagrOnDiscToTeacher(TeacherIK, PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK: integer; ATakeNagr: TObjectList);
var
  vidZanyatDS, vidNagruzkiDS: TADODataSet;
  NormPerUnit, NormPerStudent, MaxNormPerStudent, NormPerUnitForMin, NormPerStudentForMin: double;
  minContingent, i: integer;
  tempList: TObjectList;
  curTakeHour: double;
begin
  ATakeNagr.Clear;
  vidZanyatDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vidNagruzkiDS:= TGeneralController.Instance.GetNewADODataSet(false);
try
  GetVidZanyatsFromDepPlan(@vidZanyatDS, PlanIK, DiscIK, PotokIK, false);
  while not vidZanyatDS.Eof do
  begin
    GetVidNagruzkiFromDepPlan(@vidNagruzkiDS, PlanIK, DiscIK, PotokIK, vidZanyatDS.FieldByName('ik_vid_zanyat').AsInteger, false);
    while not vidNagruzkiDS.Eof do
    begin
      GetNormValues(PotokNormOfTimeIK, PlanIK, DiscIK, PotokIK, vidZanyatDS.FieldByName('ik_vid_zanyat').AsInteger, vidNagruzkiDS.FieldByName('ik_vid_nagruzki').AsInteger, vidNagruzkiDS.FieldByName('ik_content_plan_nagr').AsInteger, NormPerUnit, NormPerStudent, MaxNormPerStudent, minContingent, NormPerUnitForMin, NormPerStudentForMin);
      tempList:= GetCalcUnits(nil, TeacherIK, vidNagruzkiDS.FieldByName('ik_content_plan_nagr').AsInteger, minContingent, NormPerUnit, NormPerUnitForMin);
      for i := 0 to tempList.Count - 1 do
      begin
        curTakeHour:= 0;
        curTakeHour:= curTakeHour + TCalcUnit(tempList[i]).CalcAllHour(minContingent, NormPerStudent, NormPerStudentForMin, MaxNormPerStudent);

       { if tempCU.CurrentStudentValue < minContingent then
        begin
          if (tempCU.MaxStudentValue * NormPerStudentForMin * tempCU.InPlanCountForThisCalcUnit > tempCU.MaxStudentValue * MaxNormPerStudent) and (MaxNormPerStudent <> 0) then
            curTakeHour:= curTakeHour + tempCU.CurrentStudentValue * (MaxNormPerStudent/tempCU.InPlanCountForThisCalcUnit) * tempCU.WeekInPlanCount + tempCU.CurrentHourValue
          else
            curTakeHour:= curTakeHour + tempCU.CurrentStudentValue * NormPerStudentForMin * tempCU.WeekInPlanCount + tempCU.CurrentHourValue;
        end
        else
        begin
          if (tempCU.MaxStudentValue * NormPerStudent * tempCU.InPlanCountForThisCalcUnit > tempCU.MaxStudentValue * MaxNormPerStudent) and (MaxNormPerStudent <> 0) then
            curTakeHour:= curTakeHour + tempCU.CurrentStudentValue * (MaxNormPerStudent/tempCU.InPlanCountForThisCalcUnit) * tempCU.WeekInPlanCount + tempCU.CurrentHourValue
          else
            curTakeHour:= curTakeHour + tempCU.CurrentStudentValue * NormPerStudent * tempCU.WeekInPlanCount + tempCU.CurrentHourValue;
        end;  }

        TCalcUnit(tempList[i]).CheckBox.Checked:= curTakeHour <> 0;
      end;
      ATakeNagr.Add(TTakeNagrUnit.Create(vidNagruzkiDS.FieldByName('ik_content_plan_nagr').AsInteger, vidZanyatDS.FieldByName('ik_vid_zanyat').AsInteger, vidNagruzkiDS.FieldByName('ik_vid_nagruzki').AsInteger, vidZanyatDS.FieldByName('cName_vid_zanyat').AsString, vidNagruzkiDS.FieldByName('cName_vid_nagruzki').AsString, NormPerUnit, NormPerStudent, MaxNormPerStudent, minContingent, NormPerUnitForMin, NormPerStudentForMin, tempList));
      tempList.Free;
      vidNagruzkiDS.Next;
    end;
    vidZanyatDS.Next;
  end;
  vidZanyatDS.Close;
finally
  if vidNagruzkiDS.Active then vidNagruzkiDS.Close;
  if vidZanyatDS.Active then vidZanyatDS.Close;
  vidNagruzkiDS.Free;
  vidZanyatDS.Free;
end;
end;

function TPlanNagruzkaController.GetDisciplinesFromTeahcerPlan(
  SourceDataSet: PDataSet; PlanIK, TeacherIK: integer; var planHour: double;
  isShowFirst, isNeedCalc: boolean; defaultValue: Variant): Variant;
var
  tempDataSet, secTempDataSet: TADODataSet;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_plan_nagr.ik_disc, ik_type_disc, discpln.cName_disc From Content_plan_nagr INNER JOIN discpln ON Content_plan_nagr.ik_disc = discpln.ik_disc ' + 'INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr Where (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (Prepod_plan_nagr.ik_id_prepod = ' + IntToStr(TeacherIK) + ') Order By discpln.cName_disc', 'ik_disc', isShowFirst, defaultValue);
  if isNeedCalc then
  begin
    tempDataSet:= TADODataSet.Create(nil);
    tempDataSet.Connection:= dm.DBConnect;
    secTempDataSet:= TADODataSet.Create(nil);
    secTempDataSet.Connection:= dm.DBConnect;

    planHour:= 0;
    tempDataSet.CommandText:= 'SELECT DISTINCT Content_plan_nagr.ik_plan_nagr, Content_plan_nagr.ik_disc, Potok_shema.ik_potok FROM Content_plan_nagr INNER JOIN Potok_shema ON Content_plan_nagr.ik_shema_of_potok = Potok_shema.ik_shema_of_potok ' +
      'INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')';
    tempDataSet.Open;
    while not tempDataSet.Eof do
    begin
      secTempDataSet.CommandText:= 'SELECT sum(hour_unit + student_hour) as all_disc_hour FROM GetTeacherPlanNagr(1, ' + IntToStr(PlanIK) + ', ' + tempDataSet.FieldByName('ik_disc').AsString + ', ' +tempDataSet.FieldByName('ik_potok').AsString + ', ' + IntToStr(TeacherIK) + ')';
      secTempDataSet.Open;
      planHour:= planHour + secTempDataSet.FieldByName('all_disc_hour').AsFloat;
      secTempDataSet.Close;
      tempDataSet.Next;
    end;
    tempDataSet.Close;
    tempDataSet.Free;
    secTempDataSet.Free;
  end;
end;

function TPlanNagruzkaController.GetDistributedNagr(PlanIK, DiscIK,
  PotokSemIK: integer): TDataSet;
var
  tempDS, secTempDS: TADODataSet;
  tempStr: string;
begin
  Result:= nil;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  secTempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT * FROM GetDistributedNagr(' + IntToStr(PlanIK) + ', ' + IntToStr(DiscIK) + ', ' + IntToStr(PotokSemIK) + ')';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      secTempDS.CommandText:= 'SELECT cName_calc_unit FROM Calc_unit_semestr WHERE ik_calc_unit in (SELECT ik_calc_unit FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr = ' + tempDS.FieldByName('ik_content_plan_nagr').AsString + ') and (ik_id_prepod = ' + tempDS.FieldByName('ik_id_prepod').AsString + '))';
      secTempDS.Open;
      tempStr:= '';
      while not secTempDS.Eof do
      begin
        tempStr:= tempStr + secTempDS.FieldByName('cName_calc_unit').AsString + ', ';
        secTempDS.Next;
      end;
      secTempDS.Close;
      Delete(tempStr, Length(tempStr)-1, 2);
      tempDS.Edit;
      tempDS.FieldByName('cList_calc_unit').AsString:= tempStr;
      tempDS.Post;
      tempDS.Next;
    end;
    Result:= tempDS;
  except
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    if secTempDS.Active then secTempDS.Close;
    secTempDS.Free;
    raise;
  end;
end;

procedure TPlanNagruzkaController.LoadPlanNagrAvto(PlanIK: integer; conflictList: TObjectList);
var
  potokDS, discDS: TADODataSet;
  curPotokStudCount, curPotokCourse, group, subgroup: string;
  allHour, rasp: double;
begin
  potokDS:= TGeneralController.Instance.GetNewADODataSet(false);
  discDS:= TGeneralController.Instance.GetNewADODataSet(false);
  GetPotoksForPlan(@potokDS, planIK, false);
  potokDS.First;
  while not potokDS.Eof do
  begin
    GetPotokInfo(PlanIK, potokDS.FieldByName('ik_potok_semestr').AsInteger, curPotokStudCount, curPotokCourse, group, subgroup);
   //конфликты по потокам пока убираем
   { if curPotokStudCount = '0' then
    begin
      if not IsConflictOnAutoBuildExists(conflictList, '', potokDS.FieldByName('cName_potok').AsString, cabiNoGroupContingent) then
        conflictList.Add(TConflictOnAutoBuildItem.Create('', potokDS.FieldByName('cName_potok').AsString, cabiNoGroupContingent));
      potokDS.Next;
      continue;
    end;       }
    GetDisciplinesFromPotok(@discDS, potokDS.FieldByName('ik_potok_semestr').AsInteger, PlanIK);

    while not discDS.Eof do
    begin
      LoadContentPlanNagr(true, PlanIK, potokDS.FieldByName('ik_potok_semestr').AsInteger, discDS.FieldByName('ik_disc').AsInteger, discDS.FieldByName('ik_type_disc').AsInteger, {discDS.FieldByName('n_sem').AsInteger, }discDS.FieldByName('bit_calc_as_practice').AsBoolean, allHour, rasp, false);
      if dm.aspContentPlanNagr.RecordCount = 0 then // т.е. дисциплина еще не посчитана
      begin
        LoadPlanNagrByDiscAvto(planIK, discDS.FieldByName('ik_disc').AsInteger, potokDS.FieldByName('ik_potok_semestr').AsInteger, discDS.FieldByName('cName_disc').AsString, potokDS.FieldByName('cName_potok').AsString, conflictList);
        SavePlanContent(PlanIK, discDS.FieldByName('ik_disc').AsInteger, potokDS.FieldByName('ik_potok_semestr').AsInteger, discDS.FieldByName('cName_disc').AsString, potokDS.FieldByName('cName_potok').AsString, discDS.FieldByName('bit_calc_as_practice').AsBoolean, conflictList);
      end;
      discDS.Next;
    end;
    discDS.Close;
    potokDS.Next;
  end;
  potokDS.Close;
  discDS.Free;
  potokDS.Free;
end;

procedure TPlanNagruzkaController.LoadPlanNagrByDiscAvto(planIK, DiscIK, PotokSemIK: integer; DiscName, PotokName: string; conflictDecomposeType: TObjectList);
var
  tempDS: TADODataSet;
  ik_fac: integer;
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //получаем номер факультета (видимо, чтобы получить нормы времени)
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'Nagr_GetFacForPlan';
    tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, planIK);
    try
      tempStoredProc.Open;
      tempStoredProc.first;
    except
      raise;
    end;
                
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  dm.adsVidZanyat.First;
  while not dm.adsVidZanyat.Eof do
  begin
    if dm.adsVidZanyat.FieldByName('ik_vid_zanyat').AsInteger = 32 then
      tempDS.CommandText:= 'SELECT * FROM Vid_nagruzki WHERE ik_vid_nagruzki = 1'
    else
    begin
      if dm.aspContentPlanNagr.Tag = 1 then
        tempDS.CommandText:= 'SELECT * FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norm_of_time_practice WHERE (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok_semestr WHERE ik_potok_semestr = ' + IntToStr(PotokSemIK) + ')))'
      else tempDS.CommandText:= 'SELECT * FROM Vid_nagruzki WHERE ik_vid_nagruzki in (SELECT ik_vid_nagruzki FROM Content_norma_of_time WHERE (ik_vid_zanyat = ' + dm.adsVidZanyat.FieldByName('ik_vid_zanyat').AsString + ') and (ik_norm_of_time = (SELECT ik_norm_of_time FROM Potok_semestr WHERE ik_potok_semestr = ' + IntToStr(PotokSemIK) + ')))'
    end;
    tempDS.Open;
    while not tempDS.Eof do
    begin
      if not dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([dm.adsVidZanyat.FieldByName('ik_vid_zanyat').AsInteger, tempDS.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
      begin
       if (dm.adsVidZanyat.FieldByName('ik_vid_zanyat').AsInteger<>50)  //если не деловые игры или ФЭУ то добавляем вид нагрузки
        or (tempStoredProc.FieldByName('ik_fac').AsInteger=4) then
       begin
        dm.aspContentPlanNagr.Insert;
        dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value:= dm.adsVidZanyat.FieldByName('ik_vid_zanyat').AsInteger;
        dm.aspContentPlanNagrname_vid_nagruzkiSetText(dm.aspContentPlanNagr.FieldByName('name_vid_nagruzki'), tempDS.FieldByName('cName_vid_nagruzki').AsString);
        if dm.aspContentPlanNagr.FieldByName('ik_shema').Value = NULL then
        begin
          if dm.adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger, tempDS.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
            if not IsConflictOnAutoBuildExists(conflictDecomposeType, dm.adsNormOfTime.FieldByName('cname_decompose_type').AsString, PotokName, cabiAvtoBuild) then
              conflictDecomposeType.Add(TConflictOnAutoBuildItem.Create(dm.adsNormOfTime.FieldByName('cname_decompose_type').AsString, PotokName, cabiAvtoBuild));
          dm.aspContentPlanNagr.Cancel;
        end                                 
        else dm.aspContentPlanNagr.Post;
       end;
      end;
      tempDS.Next;
    end;
    tempDS.Close;
    dm.adsVidZanyat.Next;

  end;
  finally
    tempStoredProc.Free;
  end;

end;

function TPlanNagruzkaController.LoadTakeNagr(UnitsOwner: TComponent;PlanIK, DiscIK,
  PotokIK, PotokNormOfTimeIK, TeacherIK: integer; ATakeNagr: TObjectList): TDataSet;
var
  curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curNormPerUnitForMin, curNormPerStudentForMin: double;
  temp: TList;
  tempTCU: TTakeNagrUnit;
  i, curMinContingent: integer;
  curTakeHour: double;
  UniqueValues: TStringList;
begin
  if dm.adsTeacherTakeNagr.Active then
    dm.adsTeacherTakeNagr.Close;

  UniqueValues:= TStringList.Create;
  dm.adsTeacherTakeNagr.CommandText:= 'SELECT DISTINCT Prepod_plan_nagr.ik_content_plan_nagr, Content_plan_nagr.ik_vid_zanyat, cName_vid_zanyat, Content_plan_nagr.ik_vid_nagruzki, Cname_vid_nagruzki, f_hour_per_unit as take_hour FROM ' +
    'Content_plan_nagr INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr INNER JOIN vid_zaniat ON Content_plan_nagr.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat ' +
    'INNER JOIN Vid_nagruzki ON Content_plan_nagr.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki WHERE (ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') ORDER BY ik_vid_zanyat';
  dm.adsTeacherTakeNagr.Open;
  ATakeNagr.Clear;
  while not dm.adsTeacherTakeNagr.Eof do
  begin
    if UniqueValues.IndexOf(dm.adsTeacherTakeNagr.FieldByName('ik_content_plan_nagr').AsString) >= 0 then
    begin
      dm.adsTeacherTakeNagr.Delete;
      continue;
    end
    else UniqueValues.Add(dm.adsTeacherTakeNagr.FieldByName('ik_content_plan_nagr').AsString);
    GetNormValues(PotokNormOfTimeIK, PlanIK, DiscIK, PotokIK, dm.adsTeacherTakeNagr.FieldByName('ik_vid_zanyat').AsInteger, dm.adsTeacherTakeNagr.FieldByName('ik_vid_nagruzki').AsInteger, dm.adsTeacherTakeNagr.FieldByName('ik_content_plan_nagr').AsInteger, curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curMinContingent, curNormPerUnitForMin, curNormPerStudentForMin);
    temp:= GetCalcUnits(UnitsOwner, TeacherIK, dm.adsTeacherTakeNagr.FieldByName('ik_content_plan_nagr').AsInteger, curMinContingent, curNormPerUnit, curNormPerUnitForMin);

    // может убрать VidNagruzkiIK
    ATakeNagr.Add(TTakeNagrUnit.Create(dm.adsTeacherTakeNagr.FieldByName('ik_content_plan_nagr').AsInteger, 0, dm.adsTeacherTakeNagr.FieldByName('ik_vid_nagruzki').AsInteger, '', '', curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curMinContingent, curNormPerUnitForMin, curNormPerStudentForMin, temp));
    tempTCU:= TTakeNagrUnit(ATakeNagr[ATakeNagr.Count-1]);
    curTakeHour:= 0;
    for I := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
    if tempTCU.TakeCalcUnits[i].CheckBox.Checked then
    begin
      curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[i].CalcAllHour(curMinContingent, curNormPerStudent, curNormPerStudentForMin, curMaxNormPerStudent);

  {    if (tempTCU.TakeCalcUnits[i].CurrentStudentValue < curMinContingent) then
      begin
        if (tempTCU.TakeCalcUnits[i].MaxStudentValue * curNormPerStudentForMin * tempTCU.TakeCalcUnits[i].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[i].MaxStudentValue * curMaxNormPerStudent) and (curMaxNormPerStudent <> 0) then
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[i].CurrentStudentValue * (curMaxNormPerStudent/tempTCU.TakeCalcUnits[i].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[i].WeekInPlanCount + tempTCU.TakeCalcUnits[i].CurrentHourValue
        else
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[i].CurrentStudentValue * curNormPerStudentForMin * tempTCU.TakeCalcUnits[i].WeekInPlanCount + tempTCU.TakeCalcUnits[i].CurrentHourValue;
      end
      else
      begin
        if (tempTCU.TakeCalcUnits[i].MaxStudentValue * curNormPerStudent * tempTCU.TakeCalcUnits[i].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[i].MaxStudentValue * curMaxNormPerStudent) and (curMaxNormPerStudent <> 0) then
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[i].CurrentStudentValue * (curMaxNormPerStudent/tempTCU.TakeCalcUnits[i].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[i].WeekInPlanCount + tempTCU.TakeCalcUnits[i].CurrentHourValue
        else
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[i].CurrentStudentValue * curNormPerStudent * tempTCU.TakeCalcUnits[i].WeekInPlanCount + tempTCU.TakeCalcUnits[i].CurrentHourValue;
      end;   }

    end;
    dm.adsTeacherTakeNagr.Edit;
    dm.adsTeacherTakeNagr.FieldByName('take_hour').AsFloat:= RoundFloat(curTakeHour,2);
    dm.adsTeacherTakeNagr.Post;
    dm.adsTeacherTakeNagr.Next;
  end;
  Result:= dm.adsTeacherTakeNagr;
end;

function TPlanNagruzkaController.LoadVidZanyatTaskCountInfo(VidZanyatIK,
  VidNagruzkiIK: integer; planNumberPickList: TStrings): TADODataSet;
begin
 { Result:= TGeneralController.Instance.GetNewADODataSet(true);
  Result.CommandText:= 'SELECT by_plan_number, tasks_count FROM Vid_zanyat_with_several_tasks WHERE ik_content_plan_nagr = -1';
  Result.Open;
  while not Result.Eof do
    Result.Delete;
  dm.adsVidZanyatTaskCount.First;
  while not dm.adsVidZanyatTaskCount.Eof do
  begin
    Result.Insert;
    Result.FieldByName('by_plan_number').AsInteger:= dm.adsVidZanyatTaskCount.FieldByName('by_plan_number').AsInteger;
    Result.FieldByName('tasks_count').AsInteger:= dm.adsVidZanyatTaskCount.FieldByName('tasks_count').AsInteger;
    Result.Post;
    dm.adsVidZanyatTaskCount.Next;
  end;
  // в разных уч. планах количество работ может быть различным !

  dm.qContentUchPlan.First;
  while not dm.qContentUchPlan.Eof do
  begin
    if (dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger = dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger) and
      (dm.qContentUchPlan.FieldByName('ik_shema_of_potok').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_shema_of_potok').AsInteger) and
      (dm.qContentUchPlan.FieldByName('ik_uch_plan').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_uch_plan').AsInteger) then
    begin
              if (dm.qContentUchPlan.FieldByName('i_hour_per_week').Value <> NULL) then
                uchPlanHour:= uchPlanHour + dm.qContentUchPlan.FieldByName('i_hour_per_week').AsFloat * dm.qContentUchPlan.FieldByName('kol_ned').AsFloat * dm.adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat;
              vzWasFoundInUchPlan:= true;
              Inc(inPlanCount);
    end;
    dm.qContentUchPlan.Next;
  end;    }
end;

function TPlanNagruzkaController.GetVidZanyatsFromDepPlan(
  SourceDataSet: PDataSet; PlanIK, DiscIK, PotokIK: integer;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_plan_nagr.ik_vid_zanyat, vid_zaniat.cName_vid_zanyat From Content_plan_nagr INNER JOIN vid_zaniat ON Content_plan_nagr.iK_vid_zanyat = vid_zaniat.iK_vid_zanyat Where (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (Content_plan_nagr.ik_disc = ' + IntToStr(DiscIK) + ') and (Content_plan_nagr.ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')) Order By vid_zaniat.cName_vid_zanyat', 'ik_vid_zanyat', isShowFirst, NULL);
end;

function TPlanNagruzkaController.GetVidNagruzkiFromDepPlan(SourceDataSet: PDataSet;
  PlanIK, DiscIK, PotokIK, VidZanyatIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_plan_nagr.*, Vid_nagruzki.Cname_vid_nagruzki From Content_plan_nagr INNER JOIN Vid_nagruzki ON Content_plan_nagr.iK_vid_nagruzki = Vid_nagruzki.iK_vid_nagruzki Where (Content_plan_nagr.ik_plan_nagr = ' + IntToStr(PlanIK) + ') and (Content_plan_nagr.ik_disc = ' + IntToStr(DiscIK) + ') and (Content_plan_nagr.ik_shema in (SELECT ik_shema FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokIK) + ')) and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') Order By Cname_vid_nagruzki', 'ik_vid_nagruzki', isShowFirst, NULL);
end;

function TPlanNagruzkaController.GiveDutyToAnotherTeacher(SourceTeacherIK, TargetTeacherIK, PlanIK, DiscIK,
  PotokIK, ContentPlanNagrIK: integer): boolean;
var
  tempSP: TADOStoredProc;
begin
  Result:= false;
  tempSP:= TGeneralController.Instance.GetNewADOStoredProc('Nagruzka_GiveNagrToAnotherTeacher', false);
  if ContentPlanNagrIK = -1 then
    tempSP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else tempSP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempSP.Parameters.CreateParameter('@source_teacher', ftInteger, pdInput, 0, SourceTeacherIK);
  tempSP.Parameters.CreateParameter('@target_teacher', ftInteger, pdInput, 0, TargetTeacherIK);
  tempSP.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempSP.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  tempSP.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
  tempSP.Parameters.CreateParameter('@ik_content_plan_nagr', ftInteger, pdInput, 0, ContentPlanNagrIK);
  try
    tempSP.ExecProc;
    Result:= true;
  finally
    tempSP.Free;
  end;
end;

function TPlanNagruzkaController.GetInCommissionNumbersFromTeacherPlan(
  SourceDataSet: PDataSet; TeacherIK, ContentPlanIK: integer;
  isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT commission_member FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') ORDER BY commission_member', 'commission_member', isShowFirst, defaultValue)
end;

function TPlanNagruzkaController.GetCurrentNormOfTime(VidZanyatIK, VidNagruzkiIK: integer;
  DiscTypeCalcAsPractice: boolean; var NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; var MinContingent: integer): boolean;
begin
  Result:= false;
  if DiscTypeCalcAsPractice then
  begin
    if dm.adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', VidNagruzkiIK, [loPartialKey]) then
    begin
      NormPerStudent:= dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat;
      NormPerUnit:= dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsFloat;
      Result:= true;
    end;
  end
  else
  begin
    if dm.adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([VidZanyatIK, VidNagruzkiIK]), [loPartialKey]) then
    begin
      NormPerStudent:= dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat;
      NormPerUnit:= dm.adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat;
      MaxNormPerStudent:= dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat;
      NormPerStudentForMin:= dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat;
      NormPerUnitForMin:= dm.adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat;
      MinContingent:= dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger;
      Result:= true;
    end;
  end;
end;

procedure TPlanNagruzkaController.GetDisciplinesFromPotok(
  SourceDataSet: PDataSet; PotokIK, PlanNagrIK: integer);
begin
  if (SourceDataSet^.Active) then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandText:= 'SELECT distinct ik_disc, cName_disc, ik_type_disc, bit_calc_as_practice, ik_potok_semestr, cName_potok '+
  ' FROM GetDisciplinesForPlanNagr(' + IntToStr(PlanNagrIK) + ') WHERE ik_potok_semestr = ' + IntToStr(PotokIK);
  SourceDataSet^.Open;
end;

function TPlanNagruzkaController.GetPotoksForPlan(SourceDataSet: PDataSet;
  PlanIK: integer; isShowFirst: boolean): Variant;
begin
  if (SourceDataSet^.Active) then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandType:= cmdStoredProc;
  (SourceDataSet^ as TADODataSet).CommandText:= 'GetPotokForPlanNagr';
  (SourceDataSet^ as TADODataSet).Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  SourceDataSet^.Open;
  if (isShowFirst) then
  begin
    if (SourceDataSet^.RecordCount > 0) then
      Result:= SourceDataSet^.FieldByName('ik_potok_semestr').Value
    else Result:= NULL;
  end
  else Result:= NULL;
end;

function TPlanNagruzkaController.GetPotoksFromDepPlan(SourceDataSet: PDataSet;
  PlanIK, DiscIK: integer; isShowFirst: boolean): integer;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select ik_potok_semestr,cName_potok,ik_norm_of_time From GetPotoksForPlanDisc('+IntToStr(DiscIK)+','+IntToStr(PlanIK)+') Order By cName_potok', 'ik_potok_semestr', isShowFirst, NULL);
end;

procedure TPlanNagruzkaController.ExportDitributedNagr(PlanIK: integer;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  prepColumns: array of integer;
  i, j, rowCount: integer;
  minYear: integer;
  chokeDS: PDataSet;
  tempDataSet, planNagrDataSet: TADODataSet;
  tempStr: string;
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
    TopMargin:= IExcelApp.CentimetersToPoints(1.5, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$3:$3';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;
try
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECT year_value, Plan_nagr.ik_sem_type From Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  case tempDataSet.FieldByName('ik_sem_type').AsInteger of
  1: minYear:= tempDataSet.FieldByName('year_value').AsInteger;
  2: minYear:= tempDataSet.FieldByName('year_value').AsInteger+1;
  end;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT count(DISTINCT iTab_n) as TeachersCount FROM Relation_kafedra_prep WHERE (ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')) and (ISNULL(YEAR(release_date), ' + IntToStr(minYear) +') >= ''' + IntToStr(minYear) + ''')';
  tempDataSet.Open;
  SetLength(prepColumns, tempDataSet.FieldByName('TeachersCount').AsInteger);
  tempDataSet.Close;
  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE.Value2:= 'Сведения о распределении учебной нагрузки';
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('cshort_name_kaf').AsString;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT year_value, Plan_nagr.ik_sem_type , (' + #39 + ' за ' + #39 + ' + Cname_sem_type  + ' + #39 + ' семестр ' + #39 + ' +  Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + '' учебного года ('' + cName_type_ed + '', '' + cName_form_ed + '' форма обучения)'') as cName_plan From Plan_nagr ' +
    'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type ' +
    'INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '2'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE.Value2:= 'между профессорско-преподавательским составом кафедры ' + tempStr;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['A3', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '3'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE.Value2:= AnsiLowerCase(tempDataSet.FieldByName('cName_plan').AsString);
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.Close;

  RangeE:= IExcelApp.Range['A4', 'A4'];
  RangeE.Value2:= '№ п/п';
  RangeE:= IExcelApp.Range['B4', 'B4'];
  RangeE.Value2:= 'Дисциплина';
  RangeE:= IExcelApp.Range['C4', 'C4'];
  RangeE.Value2:= 'Поток';
  RangeE:= IExcelApp.Range['D4', 'D4'];
  RangeE.Value2:= 'Курс';
  RangeE.Orientation:= 90;

  tempDataSet.CommandText:= 'Select Prepods.iTab_n, (clastname + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''. (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO From Prepods ' +
    'WHERE iTab_n in (SELECT iTab_N FROM Relation_kafedra_prep Where (ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')) and (ISNULL(YEAR(release_date), ' + IntToStr(minYear) +') >= ''' + IntToStr(minYear) + ''')) ORDER BY FIO';
  tempDataSet.Open;
  i:= 0;
  while not tempDataSet.Eof do
  begin
      prepColumns[i]:= tempDataSet.FieldByName('iTab_n').AsInteger;
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i+4) + '4', TGeneralController.Instance.GetExcelColumnLetter(i+4) + '4'];
      RangeE.Orientation:= 90;
      RangeE.Value2:= tempDataSet.FieldByName('FIO').AsString;
      tempDataSet.Next;
      inc(i);
  end;
  tempDataSet.Close;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '4', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '4'];
  RangeE.Value2:= 'ИТОГО';

  RangeE:= IExcelApp.Range['A4', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '4'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;

  planNagrDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    planNagrDataSet.CommandText:= 'SELECT * FROM GetContentOfDepartmentPlanNagr(1, ' + IntToStr(PlanIK) + ', 0)';
    planNagrDataSet.Open;
    ProgressBar.Max:= planNagrDataSet.RecordCount;

    rowCount:= 5;
    while not planNagrDataSet.Eof do
    begin
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= rowCount-4;
      RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('cName_disc').AsString;
      RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('Cname_potok').AsString;
      RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= planNagrDataSet.FieldByName('course_number').AsString;

      tempDataSet.CommandText:= 'SELECT rkp.iTab_n, sum(plan_hour) as prep_plan_hour FROM (SELECT ik_id_prepod, sum(hour_unit + student_hour) as plan_hour FROM GetTeacherPlanNagr(2, ' + IntToStr(PlanIK) + ', ' + planNagrDataSet.FieldByName('ik_disc').AsString + ', ' + planNagrDataSet.FieldByName('ik_potok_semestr').AsString + ', NULL) GROUP BY ik_id_prepod) prep_nagr ' +
        'INNER JOIN Relation_kafedra_prep rkp ON prep_nagr.ik_id_prepod = rkp.ik_id_prepod WHERE rkp.ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ') GROUP BY iTab_n';
      tempDataSet.Open;
      tempDataSet.First;
      while not tempDataSet.Eof do
      begin
        for i:= 0 to Length(prepColumns)-1 do
          if (tempDataSet.FieldByName('iTab_n').AsInteger = prepColumns[i]) then
            if tempDataSet.FieldByName('prep_plan_hour').AsFloat > 0 then
            begin
              RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount)];
              RangeE.Value2:= tempDataSet.FieldByName('prep_plan_hour').AsFloat;
              break;
            end;
        tempDataSet.Next;
      end;

     { for i:= 0 to Length(prepColumns)-1 do
       if tempDataSet.Locate('iTab_n', prepColumns[i], [loPartialKey]) then
        begin
          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i+4) + IntToStr(rowCount)];
          if tempDataSet.FieldByName('prep_plan_hour').AsFloat > 0 then
            RangeE.Value2:= tempDataSet.FieldByName('prep_plan_hour').AsFloat;
        end;}
      tempDataSet.Close;
      RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount)];
      RangeE.Value2:=  '=SUM(E' + IntToStr(rowCount) + ':' + TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 3) + IntToStr(rowCount) + ')';
      ProgressBar.Position:= ProgressBar.Position + 1;
      inc(rowCount);
      planNagrDataSet.Next;
      Application.ProcessMessages;
    end;
  finally
    if planNagrDataSet.Active then planNagrDataSet.Close;
    planNagrDataSet.Free;
  end;                   

  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'ИТОГО:';
  for i:= 0 to Length(prepColumns)-1 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + '5:' + TGeneralController.Instance.GetExcelColumnLetter(i + 4) + IntToStr(rowCount-1) + ')';
  end;
  RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount)];
  RangeE.Value2:= '=SUM(' + TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + '5:' + TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount-1) + ')';
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 5) + IntToStr(rowCount)];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Font.Bold:= true;

  RangeE:= IExcelApp.Range['A4', TGeneralController.Instance.GetExcelColumnLetter(Length(prepColumns) + 4) + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;

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

procedure TPlanNagruzkaController.ExportDitributedNagrForShedule(PlanIK: integer;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  prepColumns: array of integer;
  rowCount, rowsInDisc, inLectCount, inPractCount, inLabCount, inCourseWorkCount: integer;
  tempDataSet, nagrListDS, calcUnitListDS: TADODataSet;
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
  IExcelApp.Workbooks.Add(null,0);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  nagrListDS:= TGeneralController.Instance.GetNewADODataSet(false);
  calcUnitListDS:= TGeneralController.Instance.GetNewADODataSet(false);
try
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1.5, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$3:$3';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;       

  tempDataSet.CommandText:= 'SELECT year_value, Plan_nagr.ik_sem_type, Cname_sem_type, cshort_name_kaf, Cshort_name_fac From Plan_nagr INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN kafedra ON Plan_nagr.ik_kaf = kafedra.ik_kaf INNER JOIN Fac On kafedra.ik_fac = Fac.ik_fac Where ik_plan_nagr = ' + IntToStr(PlanIK);
  tempDataSet.Open;
  RangeE:= IExcelApp.Range['A1', 'B1'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'УТВЕРЖДАЮ: ';
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE:= IExcelApp.Range['A2', 'B2'];
  RangeE.Value2:= 'Декан ';
  RangeE.HorizontalAlignment:= xlLeft;
  RangeE:= IExcelApp.Range['B2', 'B2'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= tempDataSet.FieldByName('Cshort_name_fac').AsString;
  RangeE.Borders.Item[xlEdgeBottom].LineStyle:= xlContinuous;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlThin;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['A3', 'B3'];
  RangeE.MergeCells:= true;
  RangeE.Font.Size:= 8;
  RangeE.Value2:= '(наименование факультета)';
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['A4', 'B4'];
  RangeE.MergeCells:= true;
  RangeE.Borders.Item[xlEdgeBottom].LineStyle:= xlContinuous;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlThin;
  RangeE:= IExcelApp.Range['A5', 'B5'];
  RangeE.MergeCells:= true;
  RangeE.Font.Size:= 8;
  RangeE.Value2:= '(ФИО, подпись)';
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['A6', 'B6'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= '«___» ________________ 2008г.';
  RangeE.HorizontalAlignment:= xlCenter;

  RangeE:= IExcelApp.Range['C1', 'K1'];
  RangeE.MergeCells:= true;
  RangeE.Font.Bold:= true;
  RangeE.Value2:= ' ПЛАН ';
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['C3', 'K3'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'распределения учебной нагрузки между профессорско-преподавательским составом на кафедре ';
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['C4', 'K4'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= tempDataSet.FieldByName('cshort_name_kaf').AsString + ' УГТУ на ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_sem_type').AsString) + ' семестр ' + tempDataSet.FieldByName('year_value').AsString + '-' + IntToStr(tempDataSet.FieldByName('year_value').AsInteger + 1) + ' учебного года (для составления расписания)';
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.Close;
  
  RangeE:= IExcelApp.Range['A8', 'A9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= '№ п/п';
  RangeE:= IExcelApp.Range['B8', 'B9'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Наименование дисциплины';
  RangeE:= IExcelApp.Range['C8', 'D8'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Лекционный курс';
  RangeE:= IExcelApp.Range['C9', 'C9'];
  RangeE.Value2:= 'Группы, специальности, входящие в поток';
  RangeE:= IExcelApp.Range['D9', 'D9'];
  RangeE.Value2:= 'ФИО преподавателя';
  RangeE:= IExcelApp.Range['E8', 'G8'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Практические занятия';
  RangeE:= IExcelApp.Range['E9', 'E9'];
  RangeE.Value2:= '№ группы';
  RangeE:= IExcelApp.Range['F9', 'F9'];
  RangeE.Value2:= 'ФИО преподавателя';
  RangeE:= IExcelApp.Range['G9', 'G9'];
  RangeE.Value2:= '№ аудитории';
  RangeE:= IExcelApp.Range['H8', 'J8'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Лабораторные занятия';
  RangeE:= IExcelApp.Range['H9', 'H9'];
  RangeE.Value2:= '№ подгруппы';
  RangeE:= IExcelApp.Range['I9', 'I9'];
  RangeE.Value2:= 'ФИО преподавателя';
  RangeE:= IExcelApp.Range['J9', 'J9'];
  RangeE.Value2:= '№ аудитории';
  RangeE:= IExcelApp.Range['K8', 'K8'];
  RangeE.Value2:= 'Курсовой проект';
  RangeE:= IExcelApp.Range['K9', 'K9'];
  RangeE.Value2:= 'ФИО преподавателя';
  RangeE:= IExcelApp.Range['A8', 'K9'];
  RangeE.Font.Bold:= true;

  rowCount:= 10;

  tempDataSet.CommandText:= 'SELECT DISTINCT cpn.ik_disc, cName_disc, Potok.ik_potok, year_value, Potok_semestr.cName_potok FROM Content_plan_nagr cpn INNER JOIN discpln ON cpn.ik_disc = discpln.ik_disc ' +
    'INNER JOIN Potok_semestr_shema ON cpn.ik_shema = Potok_semestr_shema.ik_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr inner join potok on Potok_semestr.id_potok '+
    '= Potok.ik_potok INNER JOIN Year_uch_pl ON Potok.ik_year_enter = Year_uch_pl.ik_year_uch_pl WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ' ORDER BY year_value, cName_potok, cName_disc';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.RecordCount;
  while not tempDataSet.Eof do
  begin
    inLectCount:= 0;
    inLabCount:= 0;
    inPractCount:= 0;
    inCourseWorkCount:= 0;
    nagrListDS.CommandText:= 'SELECT DISTINCT ik_content_plan_nagr, ik_vid_zanyat, ik_id_prepod, FIO FROM GetDistributedNagr(' +  IntToStr(PlanIK) + ', ' + tempDataSet.FieldByName('ik_disc').AsString + ', ' + tempDataSet.FieldByName('ik_potok').AsString + ') WHERE (ik_vid_zanyat in (3,4,5)) or (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ikTypeZanyat = 4))';
    nagrListDS.Open;
    while not nagrListDS.Eof do
    begin
      case nagrListDS.FieldByName('ik_vid_zanyat').AsInteger of
        3,4,5: ;
        else
          begin
            RangeE:= IExcelApp.Range['K' + IntToStr(rowCount + inCourseWorkCount), 'K' + IntToStr(rowCount + inCourseWorkCount)];
            RangeE.Value2:= nagrListDS.FieldByName('FIO').AsString;
            inc(inCourseWorkCount);
            nagrListDS.Next;
            continue;
          end;
      end;
      calcUnitListDS.CommandText:= 'SELECT cName_calc_unit FROM Calc_unit WHERE ik_calc_unit in (SELECT ik_calc_unit FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr = ' + nagrListDS.FieldByName('ik_content_plan_nagr').AsString + ') and (ik_id_prepod = ' + nagrListDS.FieldByName('ik_id_prepod').AsString + '))';
      calcUnitListDS.Open;
      while not calcUnitListDS.Eof do
      begin
        case nagrListDS.FieldByName('ik_vid_zanyat').AsInteger of
          3:
            begin
              RangeE:= IExcelApp.Range['C' + IntToStr(rowCount + inLectCount), 'C' + IntToStr(rowCount + inLectCount)];
              RangeE.Value2:= calcUnitListDS.FieldByName('cName_calc_unit').AsString;
              RangeE:= IExcelApp.Range['D' + IntToStr(rowCount + inLectCount), 'D' + IntToStr(rowCount + inLectCount)];
              RangeE.Value2:= nagrListDS.FieldByName('FIO').AsString;
              inc(inLectCount);
            end;
          5:
            begin
              RangeE:= IExcelApp.Range['E' + IntToStr(rowCount + inPractCount), 'F' + IntToStr(rowCount + inPractCount)];
              RangeE.Value2:= calcUnitListDS.FieldByName('cName_calc_unit').AsString;
              RangeE:= IExcelApp.Range['F' + IntToStr(rowCount + inPractCount), 'F' + IntToStr(rowCount + inPractCount)];
              RangeE.Value2:= nagrListDS.FieldByName('FIO').AsString;
              inc(inPractCount);
            end;
          4:
            begin
              RangeE:= IExcelApp.Range['H' + IntToStr(rowCount + inLabCount), 'H' + IntToStr(rowCount + inLabCount)];
              RangeE.Value2:= calcUnitListDS.FieldByName('cName_calc_unit').AsString;
              RangeE:= IExcelApp.Range['I' + IntToStr(rowCount + inLabCount), 'I' + IntToStr(rowCount + inLabCount)];
              RangeE.Value2:= nagrListDS.FieldByName('FIO').AsString;
              inc(inLabCount);
            end;
        end;
        calcUnitListDS.Next;
      end;
      calcUnitListDS.Close;
      nagrListDS.Next;
    end;
    nagrListDS.Close;
    rowsInDisc:= 0;
    if (inLectCount > inLabCount) and (inLectCount > inPractCount) and (inLectCount > inCourseWorkCount) then rowsInDisc:= inLectCount;
    if (inPractCount > inLabCount) and (inPractCount > inLectCount) and (inPractCount > inCourseWorkCount) then rowsInDisc:= inPractCount;
    if (inLabCount > inLectCount) and (inLabCount > inPractCount) and (inLabCount > inCourseWorkCount) then rowsInDisc:= inLabCount;
    if (inCourseWorkCount > inLectCount) and (inCourseWorkCount > inPractCount) and (inCourseWorkCount > inLabCount) then rowsInDisc:= inCourseWorkCount;
    if rowsInDisc > 0 then
    begin
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + rowsInDisc - 1)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= tempDataSet.RecNo;
      RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount + rowsInDisc - 1)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= tempDataSet.FieldByName('cName_disc').AsString;
      rowCount:= rowCount + rowsInDisc;
    end;
    ProgressBar.Position:= ProgressBar.Position + 1;
    tempDataSet.Next;
  end;

  calcUnitListDS.Free;
  nagrListDS.Free;
  tempDataSet.Free;
  RangeE:= IExcelApp.Range['A8', 'K' + IntToStr(rowCount-1)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;

  IExcelApp.Visible[0]:= true;
  IExcelApp:= nil;
  RangeE:= nil;
except
  if calcUnitListDS.Active then calcUnitListDS.Close;
  calcUnitListDS.Free;
  if nagrListDS.Active then nagrListDS.Close;
  nagrListDS.Free;
  if tempDataSet.Active then tempDataSet.Close;
  tempDataSet.Free;
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

procedure TPlanNagruzkaController.DeleteVidZanyatFromTeacherPlanNagr(TeacherIK,
  PlanIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'UpdateDiscInPlanNagr';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 4);
  tempStoredProc.Parameters.CreateParameter('@ik_plan_nagr', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  tempStoredProc.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, TeacherIK);
  tempStoredProc.Parameters.CreateParameter('@ik_vid_zanyat', ftInteger, pdInput, 0, VidZanyatIK);
  tempStoredProc.Parameters.CreateParameter('@ik_vid_nagruzki', ftInteger, pdInput, 0, VidNagruzkiIK);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TPlanNagruzkaController.DoIHavePermsOnNormException: boolean;
var
  tempDataSet: TADODataSet;
begin
  Result:= false;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'SELECT has_perms_by_name(''dbo.Norm_of_time_exceptions'', ''OBJECT'', ''INSERT'') as answer';
    tempDataSet.Open;
    if tempDataSet.FieldByName('answer').Value <> NULL then
      Result:= tempDataSet.FieldByName('answer').AsInteger = 1;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

{
function TPlanNagruzkaController.GetPlanName(PlanIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_plan From Plan_nagr ' + 'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (ik_plan_nagr = ' + IntToStr(PlanIK) + ')';
  tempDS.Open;
  Result:= tempDS.FieldByName('cName_plan').AsString;
  tempDS.Close;
  tempDS.Free;
end;                }

end.
