unit CommonNagruzkaController;
 {#Author villain@ist.ugtu.net}
interface

uses GeneralController, NagruzkaClasses, ComCtrls, ADODB, DB, uDM, Classes, Contnrs, StdCtrls, Forms, Controls, SysUtils,
    Windows, Messages, Variants, ExcelXP, ComObj, NagruzkaController, Graphics;

type
  TCommonNagruzkaController = class(TInterfacedObject, ICommonNagruzkaController)
  public
  //  function GetCalcUnitsForShedule(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, VidNagruzkiIK: integer; isShowFirst: boolean; dopConditions: string; defaultValue: Variant): Variant;
    procedure DeleteKafedra(KafedraIK: integer);
    procedure ExportAllNagrByFaculty(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
    procedure ExportCompireByYears(YearOneIK, YearTwoIK, TypeEdIK: integer; YearOneName, YearTwoName: string; ProgressBar: TProgressBar);
    procedure ExportAllFactNagrByFaculty(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
    procedure ExportAllNagrByFacultyForStaffCalc(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
  end;

implementation

procedure TCommonNagruzkaController.DeleteKafedra(KafedraIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'UpdateKafedraInFac';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;



{
function TCommonNagruzkaController.GetCalcUnitsForShedule(SourceDataSet: PDataSet;
  TeacherIK, ContentPlanIK, VidNagruzkiIK: integer; isShowFirst: boolean;
  dopConditions: string; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Prepod_plan_nagr.ik_prepod_plan, Prepod_plan_nagr.ik_calc_unit, Calc_unit.cName_calc_unit, Potok_shema.ik_decompose_type ' +
                'From Prepod_plan_nagr INNER JOIN Calc_unit ON Prepod_plan_nagr.ik_calc_unit = Calc_unit.ik_calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok ' +
                'Where (ik_content_plan_nagr = ' + IntToStr(ContentPlanIK) + ') and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (ik_vid_nagruzki = ' +
                IntToStr(VidNagruzkiIK) + ')' + dopConditions + ' Order By cName_calc_unit', 'ik_calc_unit', isShowFirst, defaultValue)
end;
    }


procedure TCommonNagruzkaController.ExportAllFactNagrByFaculty(YearIK,
  TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  IExcelActiveWS: ExcelWorksheet;
  RangeE: ExcelRange;
  planHour: double;
  allSumStr: string;
  j, i, k, rowCount, facCount, facBeginRow: integer;
  tempDataSet, secTempDataSet, thirdDataSet: TADODataSet;
const
  cols: array[1..4] of STRING = ('C','D','F','H');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);

  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  thirdDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  tempDataSet.CommandText:= 'SELECT count(ik_kaf) as KafCount FROM kafedra WHERE (ik_fac in (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.FieldByName('KafCount').AsInteger*3;
  tempDataSet.Close;

  if (3 - IExcelApp.ActiveWorkbook.Sheets.Count) > 0 then
    IExcelApp.ActiveWorkbook.Worksheets.Add(EmptyParam, IExcelApp.ActiveWorkbook.Worksheets.get_Item(IExcelApp.ActiveWorkbook.Worksheets.Count), 3 - IExcelApp.ActiveWorkbook.Sheets.Count, EmptyParam,0);

  for j := 1 to 3 do
  begin
    IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[j] as ExcelWorksheet;
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
    case j of
    1: IExcelActiveWS.Name:= 'факт. осень';
    2: IExcelActiveWS.Name:= 'факт. весна';
    3: IExcelActiveWS.Name:= 'факт. год';
    end;

    RangeE:= IExcelActiveWS.Range['A1', 'J1'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Ухтинский государственный технический университет';
    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
    RangeE.Font.Bold:= true;
    RangeE:= IExcelActiveWS.Range['A2', 'J2'];
    RangeE.MergeCells:= true;
    case j of
    1: RangeE.Value2:= 'Объем учебных поручений, выполненных преподавателями кафедр за осенний семестр ' + YearName + ' уч. года';
    2: RangeE.Value2:= 'Объем учебных поручений, выполненных преподавателями кафедр за весенний семестр ' + YearName + ' уч. года';
    3: RangeE.Value2:= 'Объем учебных поручений, выполненных преподавателями кафедр за ' + YearName + ' уч. год';
    end;
    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
    RangeE.Font.Bold:= true;

    RangeE:= IExcelActiveWS.Range['A3', 'J3'];
    RangeE.MergeCells:= true;
    RangeE:= IExcelActiveWS.Range['A4', 'A5'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= '№ п/п';
    RangeE:= IExcelActiveWS.Range['B4', 'B5'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Наименование кафедры';
    RangeE:= IExcelActiveWS.Range['C4', 'E4'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Всего по кафедре';
    RangeE:= IExcelActiveWS.Range['C5', 'C5'];
    RangeE.Value2:= 'Всего';
    RangeE:= IExcelActiveWS.Range['D5', 'D5'];
    RangeE.Value2:= 'Лекц.';
    RangeE:= IExcelActiveWS.Range['E5', 'E5'];
    RangeE.Value2:= '%';
    RangeE:= IExcelActiveWS.Range['F4', 'I4'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'в т.ч. с учеными степенями и званиями';
    RangeE:= IExcelActiveWS.Range['F5', 'F5'];
    RangeE.Value2:= 'Всего';
    RangeE:= IExcelActiveWS.Range['G5', 'G5'];
    RangeE.Value2:= '%';
    RangeE:= IExcelActiveWS.Range['H5', 'H5'];
    RangeE.Value2:= 'Лекц.';
    RangeE:= IExcelActiveWS.Range['I5', 'I5'];
    RangeE.Value2:= '%';
    RangeE:= IExcelActiveWS.Range['J4', 'J5'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= '% ост. лекц. к всего лекц.';
    RangeE:= IExcelActiveWS.Range['A4', 'J5'];
    RangeE.Font.Bold:= true;
    RangeE:= IExcelActiveWS.Range['A1', 'J5'];
    RangeE.VerticalAlignment:= xlCenter;
    RangeE.HorizontalAlignment:= xlCenter;
  end;
  tempDataSet.Close;


  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  for j := 1 to 3 do
  begin
    rowCount:= 6;
    facCount:= 0;
    allSumStr:= '';
    IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[j] as ExcelWorksheet;
    tempDataSet.First;
    while not tempDataSet.Eof do
    begin
      secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
      secTempDataSet.Open;
      if (secTempDataSet.RecordCount = 0) then
      begin
        secTempDataSet.Close;
        tempDataSet.Next;
        continue;
      end;
      facBeginRow:= rowCount;
      secTempDataSet.First;
      while not secTempDataSet.Eof do
      begin
        RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
        RangeE.Value2:= IntToStr(rowCount - facCount - 5) + '.';
        RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
        RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
        if j <> 3 then
        begin
          case j of
          1: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1)';
          2: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)';
          end;
          planHour:= 0;
          thirdDataSet.Open;
          while not thirdDataSet.Eof do
          begin
            planHour:= planHour + thirdDataSet.FieldByName('f_fact_hour').AsFloat;
            thirdDataSet.Next;
          end;
          RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
          RangeE.Value2:= planHour;
          RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
          if thirdDataSet.Locate('ik_vid_zanyat', 3, [loPartialKey]) then
            RangeE.Value2:= thirdDataSet.FieldByName('f_fact_hour').AsFloat
          else RangeE.Value2:= 0;
          RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
          thirdDataSet.Close;
          case j of
          1: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(2, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1)';
          2: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(2, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)';
          end;
          planHour:= 0;
          thirdDataSet.Open;
          while not thirdDataSet.Eof do
          begin
            planHour:= planHour + thirdDataSet.FieldByName('f_fact_hour').AsFloat;
            thirdDataSet.Next;
          end;
          RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
          RangeE.Value2:= planHour;
          RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
          if thirdDataSet.Locate('ik_vid_zanyat', 3, [loPartialKey]) then
            RangeE.Value2:= thirdDataSet.FieldByName('f_fact_hour').AsFloat
          else RangeE.Value2:= 0;
          RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(F' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
          RangeE:= IExcelActiveWS.Range['I' + IntToStr(rowCount), 'I' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/F' + IntToStr(rowCount) + ', 2)';
          RangeE:= IExcelActiveWS.Range['J' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/D' + IntToStr(rowCount) + ', 2)';
          thirdDataSet.Close;
        end
        else
        begin
          RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(''' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '''!C' + IntToStr(rowCount) + ', ''' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '''!C' + IntToStr(rowCount) + ')';
          RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(''' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '''!D' + IntToStr(rowCount) + ', ''' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '''!D' + IntToStr(rowCount) + ')';
          RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
          RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(''' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '''!F' + IntToStr(rowCount) + ', ''' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '''!F' + IntToStr(rowCount) + ')';
          RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
          RangeE.Value2:= '=SUM(''' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '''!H' + IntToStr(rowCount) + ', ''' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '''!H' + IntToStr(rowCount) + ')';
          RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(F' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
          RangeE:= IExcelActiveWS.Range['I' + IntToStr(rowCount), 'I' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/F' + IntToStr(rowCount) + ', 2)';
          RangeE:= IExcelActiveWS.Range['J' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
          RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/D' + IntToStr(rowCount) + ', 2)';
        end;
        inc(rowCount);
        secTempDataSet.Next;
        ProgressBar.Position:= ProgressBar.Position + 1;
        Application.ProcessMessages;
      end;
      secTempDataSet.Close;

      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      if (((rowCount - facCount - 6) - (facBeginRow - facCount - 5)) <> 0) then
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.-' + IntToStr(rowCount - facCount - 6) + '.'
      else
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= 'Итого по ' + Trim(tempDataSet.FieldByName('Cshort_name_fac').AsString);
      RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= '=SUM(C' + IntToStr(facBeginRow) + ':C' + IntToStr(rowCount-1);
      RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= '=SUM(D' + IntToStr(facBeginRow) + ':D' + IntToStr(rowCount-1);
      RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
      RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= '=SUM(F' + IntToStr(facBeginRow) + ':F' + IntToStr(rowCount-1);
      RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
      RangeE.Value2:= '=SUM(H' + IntToStr(facBeginRow) + ':H' + IntToStr(rowCount-1);
      RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(F' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
      RangeE:= IExcelActiveWS.Range['I' + IntToStr(rowCount), 'I' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/F' + IntToStr(rowCount) + ', 2)';
      RangeE:= IExcelActiveWS.Range['J' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/D' + IntToStr(rowCount) + ', 2)';
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
      RangeE.Font.Bold:= true;
      allSumStr:= allSumStr + 'C' + IntToStr(rowCount) + ',';
      inc(rowCount);
      inc(facCount);
      tempDataSet.Next;
    end;

    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    if (rowCount > 6) then
      RangeE.Value2:= '1.-' + IntToStr(rowCount - facCount - 6) + '.';
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    RangeE.Value2:= 'Итого по УГТУ';
    RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
    for I := 1 to 4 do
    begin
      for k := 1 to Length(allSumStr) do
        if allSumStr[k] = cols[i-1] then
          allSumStr[k]:= cols[i][1];
      RangeE:= IExcelActiveWS.Range[cols[i] + IntToStr(rowCount), cols[i] + IntToStr(rowCount)];
      RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
    end;
    RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(F' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['I' + IntToStr(rowCount), 'I' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/F' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['J' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(H' + IntToStr(rowCount) + '*100/D' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['A6', 'A' + IntToStr(rowCount)];
    RangeE.HorizontalAlignment:= xlRight;
    RangeE:= IExcelActiveWS.Range['A4', 'J' + IntToStr(rowCount)];
    RangeE.Columns.AutoFit;
    RangeE.Borders.LineStyle:= 1;
    RangeE.Font.Size:= 10;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'J' + IntToStr(rowCount)];
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 11;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+2), 'J' + IntToStr(rowCount+2)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Начальник УНМУ';
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+4), 'J' + IntToStr(rowCount+4)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Зам. начальника учебного отдела';
  end;
  tempDataSet.Close;
  thirdDataSet.Free;
  secTempDataSet.Free;
  tempDataSet.Free;
 // secTempDataSet.Close;

  IExcelApp.Visible[0]:= true;
finally
  IExcelApp:= nil;
  RangeE:= nil;
end;
end;

procedure TCommonNagruzkaController.ExportAllNagrByFaculty(YearIK, TypeEdIK: integer; YearName: string;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  IExcelActiveWS: ExcelWorksheet;
  RangeE: ExcelRange;
  tempStr: string;
  NumbersList: TStringList;
  vzColumns: array of integer;
  j, i, k, g, rowCount, facCount: integer;
  tempDataSet, secTempDataSet, thirdDataSet: TADODataSet;
const
  cols: array[1..26] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);

  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  thirdDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  tempDataSet.CommandText:= 'SELECT count(ik_kaf) as KafCount FROM kafedra WHERE (ik_fac in (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.FieldByName('KafCount').AsInteger * 4;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  SetLength(vzColumns, tempDataSet.RecordCount);
  IExcelApp.ActiveWorkbook.Worksheets.Add(EmptyParam, IExcelApp.ActiveWorkbook.Worksheets.get_Item(IExcelApp.ActiveWorkbook.Worksheets.Count), 4 - IExcelApp.ActiveWorkbook.Sheets.Count, EmptyParam,0);

  for j := 1 to 4 do
  begin
    IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[j] as ExcelWorksheet;
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
    case j of
    1: IExcelActiveWS.Name:= 'осень';
    2: IExcelActiveWS.Name:= 'весна';
    3: IExcelActiveWS.Name:= 'год';
    4: IExcelActiveWS.Name:= 'год-осень-весна';
    end;

    RangeE:= IExcelActiveWS.Range['A1', cols[Length(vzColumns) + 3] + '1'];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Ухтинский государственный технический университет';
    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
    RangeE.Font.Bold:= true;

    RangeE:= IExcelActiveWS.Range['A2', cols[Length(vzColumns) + 3] + '2'];
    RangeE.MergeCells:= true;
    case j of
    1: RangeE.Value2:= 'Объемы учебных поручений по факультетам и кафедрам за осенний семестр на ' + YearName + ' учебный год';
    2: RangeE.Value2:= 'Объемы учебных поручений по факультетам и кафедрам за весенний семестр на ' + YearName + ' учебный год';
    3,4: RangeE.Value2:= 'Объемы учебных поручений по факультетам и кафедрам на ' + YearName + ' учебный год';
    end;
    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
    RangeE.Font.Bold:= true;

    RangeE:= IExcelActiveWS.Range['A3', 'A3'];
    RangeE.Value2:= 'Наименование кафедр';
    RangeE.Orientation:= 90;
    RangeE:= IExcelActiveWS.Range['B3', 'B3'];
    RangeE.Value2:= 'Семестры';
    RangeE.Orientation:= 90;

    i:= 1;
    tempDataSet.First;
    while not tempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range[cols[i + 2] + '3', cols[i + 2] + '3'];
      RangeE.Value2:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
      RangeE.Orientation:= 90;
      vzColumns[i-1]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
      tempDataSet.Next;
      inc(i);
    end;

    for I := 1 to Length(vzColumns) + 3 do
    begin
      RangeE:= IExcelActiveWS.Range[cols[i] + '4', cols[i] + '4'];
      RangeE.Value2:= IntToStr(i);
    end;
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns) + 3] + '3', cols[Length(vzColumns) + 3] + '3'];
    RangeE.Value2:= 'ИТОГО';
    RangeE.Orientation:= 90;

    RangeE:= IExcelActiveWS.Range['A1', cols[Length(vzColumns) + 3] + '4'];
    RangeE.VerticalAlignment:= xlCenter;
    RangeE.HorizontalAlignment:= xlCenter;
  end;
  tempDataSet.Close;

  NumbersList:= TStringList.Create;
  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  for j := 1 to 4 do
  begin
    NumbersList.Clear;
    rowCount:= 5;
    facCount:= 0;
    IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[j] as ExcelWorksheet;
    tempDataSet.First;
    while not tempDataSet.Eof do
    begin
      secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
      secTempDataSet.Open;
      if (secTempDataSet.RecordCount = 0) then
      begin
        secTempDataSet.Close;
        tempDataSet.Next;
        continue;
      end;

      inc(facCount);
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), cols[Length(vzColumns) + 3] + IntToStr(rowCount)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= Trim(tempDataSet.FieldByName('cName_fac').AsString);
      RangeE.HorizontalAlignment:= xlCenter;
      inc(rowCount);

      secTempDataSet.First;
      while not secTempDataSet.Eof do
      begin
        if (j <> 4) then
        begin
          RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + 2)];
          RangeE.MergeCells:= true;
          RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
          case j of
          1: RangeE.Value2:= 'осень';
          2: RangeE.Value2:= 'весна';
          3: RangeE.Value2:= 'год';
          end;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
          RangeE.Value2:= 'факт';
          RangeE.Font.Color:= clRed;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
          RangeE.Value2:= 'откл';
          RangeE.Font.Color:= clBlue;
          if (j <> 3) then
          begin
            case j of
            1: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1)';
            2: thirdDataSet.CommandText:= 'SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)';
            end;
            thirdDataSet.Open;

            for I := 0 to Length(vzColumns) - 1 do
              if thirdDataSet.Locate('ik_vid_zanyat', vzColumns[i], [loPartialKey]) then
              begin
                RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
                RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
                RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
                RangeE.Value2:= thirdDataSet.FieldByName('f_fact_hour').AsFloat;
                RangeE.Font.Color:= clRed;
                RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
                RangeE.Value2:= thirdDataSet.FieldByName('f_fact_hour').AsFloat - thirdDataSet.FieldByName('f_plan_hour').AsFloat;
                RangeE.Font.Color:= clBlue;
              end;
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount), cols[Length(vzColumns)+3] + IntToStr(rowCount)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount) + ')';
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+1), cols[Length(vzColumns)+3] + IntToStr(rowCount+1)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+1) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+1) + ')';
            RangeE.Font.Color:= clRed;
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+2), cols[Length(vzColumns)+3] + IntToStr(rowCount+2)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+2) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+2) + ')';
            RangeE.Font.Color:= clBlue;
            NumbersList.Add(IntToStr(rowCount));
            thirdDataSet.Close;
          end
          else
          begin
            for I := 0 to Length(vzColumns)-1 do
            begin
              RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
              RangeE.Value2:= '=SUM(' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(rowCount) + ',' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(rowCount) + ')';
              RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
              RangeE.Value2:= '=SUM(' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(rowCount+1) + ',' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(rowCount+1) + ')';
              RangeE.Font.Color:= clRed;
              RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
              RangeE.Value2:= '=' + cols[i+3] + IntToStr(rowCount+1) + ' - ' + cols[i+3] + IntToStr(rowCount);
              RangeE.Font.Color:= clBlue;
            end;
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount), cols[Length(vzColumns)+3] + IntToStr(rowCount)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount) + ')';
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+1), cols[Length(vzColumns)+3] + IntToStr(rowCount+1)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+1) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+1) + ')';
            RangeE.Font.Color:= clRed;
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+2), cols[Length(vzColumns)+3] + IntToStr(rowCount+2)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+2) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+2) + ')';
            RangeE.Font.Color:= clBlue;
            NumbersList.Add(IntToStr(rowCount));
          end;
        end
        else
        begin
          RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + 8)];
          RangeE.MergeCells:= true;
          RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
          RangeE.Value2:= 'осень';
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
          RangeE.Value2:= 'факт';
          RangeE.Font.Color:= clRed;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
          RangeE.Value2:= 'откл';
          RangeE.Font.Color:= clBlue;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+3), 'B' + IntToStr(rowCount+3)];
          RangeE.Value2:= 'весна';
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+4), 'B' + IntToStr(rowCount+4)];
          RangeE.Value2:= 'факт';
          RangeE.Font.Color:= clRed;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+5), 'B' + IntToStr(rowCount+5)];
          RangeE.Value2:= 'откл';
          RangeE.Font.Color:= clBlue;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+6), 'B' + IntToStr(rowCount+6)];
          RangeE.Value2:= 'год';
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+7), 'B' + IntToStr(rowCount+7)];
          RangeE.Value2:= 'факт';
          RangeE.Font.Color:= clRed;
          RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+8), 'B' + IntToStr(rowCount+8)];
          RangeE.Value2:= 'откл';
          RangeE.Font.Color:= clBlue;
          for I := 0 to Length(vzColumns)-1 do
          begin
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 5 + facCount);
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 6 + facCount);
            RangeE.Font.Color:= clRed;
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 7 + facCount);
            RangeE.Font.Color:= clBlue;

            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+3), cols[i+3] + IntToStr(rowCount+3)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 5 + facCount);
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+4), cols[i+3] + IntToStr(rowCount+4)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 6 + facCount);
            RangeE.Font.Color:= clRed;
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+5), cols[i+3] + IntToStr(rowCount+5)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 7 + facCount);
            RangeE.Font.Color:= clBlue;

            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+6), cols[i+3] + IntToStr(rowCount+6)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[3] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 5 + facCount);
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+7), cols[i+3] + IntToStr(rowCount+7)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[3] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 6 + facCount);
            RangeE.Font.Color:= clRed;
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+8), cols[i+3] + IntToStr(rowCount+8)];
            RangeE.Value2:= '=' + (IExcelApp.ActiveWorkbook.Worksheets[3] as ExcelWorksheet).Name + '!' + cols[i+3] + IntToStr(((rowCount-4-facCount) div 9)*3 + 7 + facCount);
            RangeE.Font.Color:= clBlue;
          end;
          for I := 0 to 8 do
          begin
            RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+i), cols[Length(vzColumns)+3] + IntToStr(rowCount+i)];
            RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+i) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+i) + ')';
            if ((i mod 3) = 1) then
              RangeE.Font.Color:= clRed;
            if ((i mod 3) = 2) then
              RangeE.Font.Color:= clBlue;
          end;
          NumbersList.Add(IntToStr(rowCount));
        end;
        if j = 4 then
          inc(rowCount, 9)
        else inc(rowCount, 3);
        ProgressBar.Position:= ProgressBar.Position + 1;
        secTempDataSet.Next;
        Application.ProcessMessages;
      end;
      secTempDataSet.Close;
      tempDataSet.Next;
    end;
    if (j <> 4) then
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + 2)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'ИТОГО УНИВЕРСИТЕТ';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      case j of
      1: RangeE.Value2:= 'осень';
      2: RangeE.Value2:= 'весна';
      3: RangeE.Value2:= 'год';
      end;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
      RangeE.Value2:= 'факт';
      RangeE.Font.Color:= clRed;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
      RangeE.Value2:= 'откл';
      RangeE.Font.Color:= clBlue;
      for I := 0 to Length(vzColumns) do
      begin
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
        tempStr:= '';
        for k := 0 to NumbersList.Count - 1 do
          tempStr:= tempStr + cols[i+3] + NumbersList[k] + ',';
        RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
        tempStr:= '';
        for k := 0 to NumbersList.Count - 1 do
          tempStr:= tempStr + cols[i+3] + IntToStr(StrToInt(NumbersList[k]) + 1) + ',';
        RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
        RangeE.Font.Color:= clRed;
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
        tempStr:= '';
        for k := 0 to NumbersList.Count - 1 do
          tempStr:= tempStr + cols[i+3] + IntToStr(StrToInt(NumbersList[k]) + 2) + ',';
        RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
        RangeE.Font.Color:= clBlue;
      end;
      inc(rowCount, 3);
    end
    else
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + 8)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'ИТОГО УНИВЕРСИТЕТ';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= 'осень';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
      RangeE.Value2:= 'факт';
      RangeE.Font.Color:= clRed;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
      RangeE.Value2:= 'откл';
      RangeE.Font.Color:= clBlue;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+3), 'B' + IntToStr(rowCount+3)];
      RangeE.Value2:= 'весна';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+4), 'B' + IntToStr(rowCount+4)];
      RangeE.Value2:= 'факт';
      RangeE.Font.Color:= clRed;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+5), 'B' + IntToStr(rowCount+5)];
      RangeE.Value2:= 'откл';
      RangeE.Font.Color:= clBlue;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+6), 'B' + IntToStr(rowCount+6)];
      RangeE.Value2:= 'год';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+7), 'B' + IntToStr(rowCount+7)];
      RangeE.Value2:= 'факт';
      RangeE.Font.Color:= clRed;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+8), 'B' + IntToStr(rowCount+8)];
      RangeE.Value2:= 'откл';
      RangeE.Font.Color:= clBlue;
      for I := 0 to Length(vzColumns) do
      begin
        for g := 0 to 8 do
        begin
          RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+g), cols[i+3] + IntToStr(rowCount+g)];
          tempStr:= '';
          for k := 0 to NumbersList.Count - 1 do
            tempStr:= tempStr + cols[i+3] + IntToStr(StrToInt(NumbersList[k]) + g) + ', ';
          RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(tempStr);
          if ((g mod 3) = 1) then
            RangeE.Font.Color:= clRed;
          if ((g mod 3) = 2) then
            RangeE.Font.Color:= clBlue;
        end;
      end;
      inc(rowCount, 9);
    end;

    RangeE:= IExcelActiveWS.Range['A1', 'A' + IntToStr(rowCount-1)];
    RangeE.HorizontalAlignment:= xlCenter;
    RangeE.VerticalAlignment:= xlCenter;
    RangeE:= IExcelActiveWS.Range['A1', cols[Length(vzColumns) + 3] + IntToStr(rowCount-1)];
    RangeE.Columns.AutoFit;
    RangeE.Borders.LineStyle:= 1;
    RangeE.Font.Size:= 9;

    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+1), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+1)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Начальник УНМУ';
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+3), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+3)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'Зам. начальника учебного отдела';
  end;

  tempDataSet.Close;
  thirdDataSet.Free;
  secTempDataSet.Free;
  tempDataSet.Free;

  IExcelApp.Visible[0]:= true;
finally
  IExcelApp:= nil;
  RangeE:= nil;
end;
end;

procedure TCommonNagruzkaController.ExportAllNagrByFacultyForStaffCalc(YearIK,
  TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  allSumStr: string;
  j, i, rowCount, facCount, facBeginRow: integer;
  tempDataSet, secTempDataSet, thirdDataSet: TADODataSet;
const
  cols: array[1..26] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);

  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  thirdDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  tempDataSet.CommandText:= 'SELECT count(ik_kaf) as KafCount FROM kafedra WHERE (ik_fac in (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.FieldByName('KafCount').AsInteger;
  tempDataSet.Close;

  with (IExcelApp.ActiveWorkbook.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
      Orientation:= xlLandscape;
      CenterHorizontally:= True;
      LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
      RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
      TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
      BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
      PrintTitleRows:= '$5:$5';
      FitToPagesWide:= 1;
      FitToPagesTall:= False;
      Zoom:= False;
  end;

  RangeE:= IExcelApp.Range['A1', 'F1'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Ухтинский государственный технический университет';
  RangeE.Font.Bold:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
  RangeE:= IExcelApp.Range['A2', 'F2'];
  RangeE.MergeCells:= true;
  RangeE.Font.Bold:= true;
  RangeE.Value2:= 'Объем учебных поручений по кафедрам и факультетам';
  RangeE:= IExcelApp.Range['A3', 'F3'];
  RangeE.MergeCells:= true;
  RangeE.Font.Bold:= true;
  RangeE.Value2:= 'для расчета штатного расписания ППС';
  RangeE:= IExcelApp.Range['A4', 'F4'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'на ' + YearName + ' учебный год';
  RangeE.Font.Bold:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
  RangeE:= IExcelApp.Range['A5', 'A5'];
  RangeE.Value2:= '№ п/п';
  RangeE:= IExcelApp.Range['B5', 'B5'];
  RangeE.Value2:= 'Наименование кафедры';
  RangeE:= IExcelApp.Range['C5', 'C5'];
  RangeE.Value2:= 'Общая нагрузка';
  RangeE:= IExcelApp.Range['D5', 'F5'];
  RangeE.Value2:= 'Лекции';
  RangeE:= IExcelApp.Range['E5', 'F5'];
  RangeE.Value2:= 'Почасовая нагрузка';
  RangeE:= IExcelApp.Range['F5', 'F5'];
  RangeE.Value2:= 'Нагрузка кафедральная';

  rowCount:= 6;
  facCount:= 0;
  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  allSumStr:= '';
  tempDataSet.First;
  while not tempDataSet.Eof do
  begin
    secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
    secTempDataSet.Open;
    if (secTempDataSet.RecordCount = 0) then
    begin
      secTempDataSet.Close;
      tempDataSet.Next;
      continue;
    end;
    facBeginRow:= rowCount;
    secTempDataSet.First;
    while not secTempDataSet.Eof do
    begin
      RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= IntToStr(rowCount - facCount - 5) + '.';
      RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr WHERE ik_vid_zanyat = 3';
      thirdDataSet.Open;
      RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(4, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(4, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelApp.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      RangeE:= IExcelApp.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= '=C' + IntToStr(rowCount) + '-E' + IntToStr(rowCount);
      secTempDataSet.Next;
      inc(rowCount);
      ProgressBar.Position:= ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    secTempDataSet.Close;
    RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    if (((rowCount - facCount - 6) - (facBeginRow - facCount - 5)) <> 0) then
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.-' + IntToStr(rowCount - facCount - 6) + '.'
    else
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.';
    RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    RangeE.Value2:= 'Итого по ' + Trim(tempDataSet.FieldByName('Cshort_name_fac').AsString);
    RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(C' + IntToStr(facBeginRow) + ':C' + IntToStr(rowCount-1);
    RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(D' + IntToStr(facBeginRow) + ':D' + IntToStr(rowCount-1);
    RangeE:= IExcelApp.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(E' + IntToStr(facBeginRow) + ':E' + IntToStr(rowCount-1);
    RangeE:= IExcelApp.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(F' + IntToStr(facBeginRow) + ':F' + IntToStr(rowCount-1);
    RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Font.Bold:= true;
    allSumStr:= allSumStr + 'C' + IntToStr(rowCount) + ',';
    inc(rowCount);
    inc(facCount);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
  if (rowCount > 6) then
      RangeE.Value2:= '1.-' + IntToStr(rowCount - facCount - 6) + '.';
  RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
  RangeE.Value2:= 'Итого по УГТУ';
  RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  for I := 4 to 6 do
  begin
    for j := 1 to Length(allSumStr) do
      if allSumStr[j] = cols[i-1] then
        allSumStr[j]:= cols[i][1];
    RangeE:= IExcelApp.Range[cols[i] + IntToStr(rowCount), cols[i] + IntToStr(rowCount)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  end;
  RangeE:= IExcelApp.Range['A1', 'F5'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelApp.Range['A4', 'F4'];
  RangeE.VerticalAlignment:= xlTop;
  RangeE:= IExcelApp.Range['A5', 'F5'];
  RangeE.Font.Bold:= true;
  RangeE:= IExcelApp.Range['A5', 'F' + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelApp.Range['A6', 'A' + IntToStr(rowCount)];
  RangeE.HorizontalAlignment:= xlRight;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
  RangeE.Font.Size:= 11;
  RangeE.Font.Bold:= true;
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+2), 'F'  + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelApp.Range['A' + IntToStr(rowCount+4), 'F'  + IntToStr(rowCount+4)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  thirdDataSet.Free;
  secTempDataSet.Free;
  tempDataSet.Free;

  IExcelApp.Visible[0]:= true;
finally
  IExcelApp:= nil;
  RangeE:= nil;
end;
end;

procedure TCommonNagruzkaController.ExportCompireByYears(YearOneIK, YearTwoIK,
  TypeEdIK: integer; YearOneName, YearTwoName: string;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  IExcelActiveWS: ExcelWorksheet;
  RangeE: ExcelRange;
  allSumStr: string;
  vzColumns: array of integer;
  j, i, rowCount, facCount, facBeginRow: integer;
  tempDataSet, secTempDataSet, thirdDataSet: TADODataSet;
const
  cols: array[1..26] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);

  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  thirdDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  tempDataSet.CommandText:= 'SELECT count(ik_kaf) as KafCount FROM kafedra WHERE (ik_fac in (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
  tempDataSet.Open;
  ProgressBar.Max:= tempDataSet.FieldByName('KafCount').AsInteger*4 + 5;
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT * FROM vid_zaniat WHERE bit_nagr = 1';
  tempDataSet.Open;
  SetLength(vzColumns, tempDataSet.RecordCount);
  IExcelApp.ActiveWorkbook.Worksheets.Add(EmptyParam, IExcelApp.ActiveWorkbook.Worksheets.get_Item(IExcelApp.ActiveWorkbook.Worksheets.Count), 6 - IExcelApp.ActiveWorkbook.Sheets.Count, EmptyParam,0);

  for j := 1 to 6 do
  begin
    IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[j] as ExcelWorksheet;
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
    case j of
    1: IExcelActiveWS.Name:= 'сравн. по кафедрам';
    2: IExcelActiveWS.Name:= 'сравн. по универ.';
    3: IExcelActiveWS.Name:= 'сравн. c поч. фондом';
    4: IExcelActiveWS.Name:= 'сравн. лекц. нагр.';
    5: IExcelActiveWS.Name:= 'сравн. всей нагр.';
    6: IExcelActiveWS.Name:= 'сравн. средней нагр.';
    end;

    if j = 3 then
    begin
      RangeE:= IExcelActiveWS.Range['A1', 'D1'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Ухтинский государственный технический университет';
      RangeE.Font.Bold:= true;
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);

      RangeE:= IExcelActiveWS.Range['A2', 'D2'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= 'Плановая нагрузка по университету в сравнении ' + YearOneName + ' у.г. с ' + YearTwoName + ' у.г.';
      RangeE:= IExcelActiveWS.Range['A3', 'D3'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= '(с учетом почасового фонда)';
      RangeE:= IExcelActiveWS.Range['A4', 'D4'];
      RangeE.MergeCells:= true;
      RangeE:= IExcelActiveWS.Range['A5', 'A5'];
      RangeE.Value2:= 'Учебный год';
      RangeE.Orientation:= 90;
      RangeE:= IExcelActiveWS.Range['B5', 'B5'];
      RangeE.Value2:= 'Плановая нагрузка';
      RangeE.Orientation:= 90;
      RangeE:= IExcelActiveWS.Range['C5', 'C5'];
      RangeE.Value2:= 'Почасовой фонд';
      RangeE.Orientation:= 90;
      RangeE:= IExcelActiveWS.Range['D5', 'D5'];
      RangeE.Value2:= 'Нагрузка к расчету штатов';
      RangeE.Orientation:= 90;
      continue;
    end;

    if (j = 4) or (j = 5) then
    begin
      RangeE:= IExcelActiveWS.Range['A1', 'F1'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Ухтинский государственный технический университет';
      RangeE.Font.Bold:= true;
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
      RangeE:= IExcelActiveWS.Range['A2', 'F2'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      case j of
      4: RangeE.Value2:= 'Лекционная нагрузка по университету';
      5: RangeE.Value2:= 'Плановая нагрузка по кафедрам университета';
      end;
      RangeE:= IExcelActiveWS.Range['A3', 'F3'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= 'в сравнении ' + YearOneName + ' у.г. с ' + YearTwoName + ' у.г.';
      RangeE:= IExcelActiveWS.Range['A4', 'F4'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      if j = 5 then
      begin
        RangeE.Value2:= '(без учета почасового фонда)';
        RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
      end;
      RangeE:= IExcelActiveWS.Range['A5', 'A5'];
      RangeE.Value2:= '№ п/п';
      RangeE:= IExcelActiveWS.Range['B5', 'B5'];
      RangeE.Value2:= 'Наименование кафедры';
      RangeE:= IExcelActiveWS.Range['C5', 'C5'];
      case j of
      4: RangeE.Value2:= 'Лекционная нагрузка ' + YearOneName;
      5: RangeE.Value2:= 'Общая нагрузка ' + YearOneName;
      end;
      RangeE:= IExcelActiveWS.Range['D5', 'D5'];
      case j of
      4: RangeE.Value2:= 'Лекционная нагрузка ' + YearTwoName;
      5: RangeE.Value2:= 'Общая нагрузка ' + YearTwoName;
      end;
      RangeE:= IExcelActiveWS.Range['E5', 'E5'];
      RangeE.Value2:= 'Разница';
      RangeE:= IExcelActiveWS.Range['F5', 'F5'];
      RangeE.Value2:= '%';
      continue;
    end;

    if j = 6 then
    begin
      RangeE:= IExcelActiveWS.Range['A1', 'H1'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Ухтинский государственный технический университет';
      RangeE.Font.Bold:= true;
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
      RangeE:= IExcelActiveWS.Range['A2', 'H2'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= 'Плановая нагрузка по кафедрам университета';
      RangeE:= IExcelActiveWS.Range['A3', 'H3'];
      RangeE.MergeCells:= true;
      RangeE.Font.Bold:= true;
      RangeE.Value2:= 'в сравнении ' + YearOneName + ' у.г. с ' + YearTwoName + ' у.г.';
      RangeE:= IExcelActiveWS.Range['A4', 'H4'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= '(без учета почасового фонда)';
      RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);
      RangeE.Font.Bold:= true;
      RangeE:= IExcelActiveWS.Range['A5', 'A6'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= '№ п/п';
      RangeE:= IExcelActiveWS.Range['B5', 'B6'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Наименование кафедры';
      RangeE:= IExcelActiveWS.Range['C5', 'E5'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Нагрузка (час.)';
      RangeE:= IExcelActiveWS.Range['C6', 'C6'];
      RangeE.Value2:= YearOneName;
      RangeE:= IExcelActiveWS.Range['D6', 'D6'];
      RangeE.Value2:= YearTwoName;
      RangeE:= IExcelActiveWS.Range['E6', 'E6'];
      RangeE.Value2:= 'Разница';
      RangeE:= IExcelActiveWS.Range['F5', 'F5'];
      RangeE.Value2:= 'Штаты';
      RangeE:= IExcelActiveWS.Range['F6', 'F6'];
      RangeE.Value2:= '(ед.)';
      RangeE:= IExcelActiveWS.Range['G5', 'H5'];
      RangeE.MergeCells:= true;
      RangeE.Value2:= 'Сред.нагрузка (час.)';
      RangeE:= IExcelActiveWS.Range['G6', 'G6'];
      RangeE.Value2:= YearOneName;
      RangeE:= IExcelActiveWS.Range['H6', 'H6'];
      RangeE.Value2:= YearTwoName;
      continue;
    end;

    RangeE:= IExcelActiveWS.Range['A1', cols[Length(vzColumns) + 3] + '1'];
    RangeE.MergeCells:= true;
    RangeE.Font.Bold:= true;
    RangeE.Value2:= 'Ухтинский государственный технический университет';
    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);

    RangeE:= IExcelActiveWS.Range['A2', cols[Length(vzColumns) + 3] + '2'];
    RangeE.MergeCells:= true;
    RangeE.Font.Bold:= true;
    case j of
    1: RangeE.Value2:= 'Объемы плановых учебных поручений по факультетам и кафедрам';
    2: RangeE.Value2:= 'Таблица сравнения плановой нагрузки по УГТУ';
    end;
    RangeE:= IExcelActiveWS.Range['A3', cols[Length(vzColumns) + 3] + '3'];
    RangeE.MergeCells:= true;
    RangeE.Font.Bold:= true;
    RangeE.Value2:= 'на ' + YearOneName + ' у.г. в сравнении с ' + YearTwoName + ' у.г.';
//    RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
    RangeE:= IExcelActiveWS.Range['A4', cols[Length(vzColumns) + 3] + '4'];
    RangeE.MergeCells:= true;
    RangeE:= IExcelActiveWS.Range['A5', 'A5'];
    case j of
    1: RangeE.Value2:= 'Наименование кафедр';
    2: RangeE.Value2:= 'Год, отклонение';
    end;
    RangeE.Orientation:= 90;
    RangeE:= IExcelActiveWS.Range['B5', 'B5'];
    case j of
    1: RangeE.Value2:= 'Уч. год';
    2: RangeE.Value2:= 'Семестры';
    end;
    RangeE.Orientation:= 90;

    i:= 1;
    tempDataSet.First;
    while not tempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range[cols[i + 2] + '5', cols[i + 2] + '5'];
      RangeE.Value2:= tempDataSet.FieldByName('cName_vid_zanyat').AsString;
      RangeE.Orientation:= 90;
      vzColumns[i-1]:= tempDataSet.FieldByName('iK_vid_zanyat').AsInteger;
      tempDataSet.Next;
      inc(i);
    end;

    for I := 1 to Length(vzColumns) + 3 do
    begin
      RangeE:= IExcelActiveWS.Range[cols[i] + '6', cols[i] + '6'];
      RangeE.Value2:= IntToStr(i);
    end;
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns) + 3] + '5', cols[Length(vzColumns) + 3] + '5'];
    RangeE.Value2:= 'ИТОГО';

    RangeE:= IExcelActiveWS.Range['A1', cols[Length(vzColumns) + 3] + '6'];
    RangeE.VerticalAlignment:= xlCenter;
    RangeE.HorizontalAlignment:= xlCenter;
  end;
  tempDataSet.Close;

  rowCount:= 7;

  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  facCount:= 0;
  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[1] as ExcelWorksheet;
  tempDataSet.First;
  while not tempDataSet.Eof do
  begin
    secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
    secTempDataSet.Open;
    if (secTempDataSet.RecordCount = 0) then
    begin
      secTempDataSet.Close;
      tempDataSet.Next;
      continue;
    end;

    inc(facCount);
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), cols[Length(vzColumns) + 3] + IntToStr(rowCount)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= Trim(tempDataSet.FieldByName('cName_fac').AsString);
    RangeE.HorizontalAlignment:= xlCenter;
    inc(rowCount);

    secTempDataSet.First;
    while not secTempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + 2)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);

      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= YearOneName;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
      RangeE.Value2:= YearTwoName;
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
      RangeE.Value2:= 'откл';
      RangeE.Font.Color:= clRed;

      thirdDataSet.CommandText:= 'SELECT ik_vid_zanyat, sum(f_plan_hour) as f_plan_hour, sum(f_fact_hour) as f_fact_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr GROUP BY ik_vid_zanyat';
      thirdDataSet.Open;
      for I := 0 to Length(vzColumns) - 1 do
        if thirdDataSet.Locate('ik_vid_zanyat', vzColumns[i], [loPartialKey]) then
          begin
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
            RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
          end;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT ik_vid_zanyat, sum(f_plan_hour) as f_plan_hour, sum(f_fact_hour) as f_fact_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr GROUP BY ik_vid_zanyat';
      thirdDataSet.Open;
      for I := 0 to Length(vzColumns) - 1 do
        if thirdDataSet.Locate('ik_vid_zanyat', vzColumns[i], [loPartialKey]) then
          begin
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
            RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
            RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
            RangeE.Value2:= '=' + cols[i+3] + IntToStr(rowCount+1) + '-' + cols[i+3] + IntToStr(rowCount);
            RangeE.Font.Color:= clRed;
          end;
      thirdDataSet.Close;

      RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount), cols[Length(vzColumns)+3] + IntToStr(rowCount)];
      RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount) + ')';
      RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+1), cols[Length(vzColumns)+3] + IntToStr(rowCount+1)];
      RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+1) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+1) + ')';
      RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+2), cols[Length(vzColumns)+3] + IntToStr(rowCount+2)];
      RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+2) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+2) + ')';
      RangeE.Font.Color:= clRed;
      inc(rowCount, 3);
      ProgressBar.Position:= ProgressBar.Position + 1;
      Application.ProcessMessages;
      secTempDataSet.Next;
    end;
    secTempDataSet.Close;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['A5', 'A' + IntToStr(rowCount-1)];
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A5', cols[Length(vzColumns) + 3] + IntToStr(rowCount-1)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+1), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+1)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+3), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+3)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[2] as ExcelWorksheet;
  rowCount:= 7;
  for j := 1 to 3 do
  begin
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    RangeE.Value2:= YearOneName;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+1), 'A' + IntToStr(rowCount+1)];
    RangeE.Value2:= YearTwoName;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+2), 'A' + IntToStr(rowCount+3)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= 'откл';
    RangeE.Font.Color:= clRed;
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    case j of
    1: RangeE.Value2:= 'осень';
    2: RangeE.Value2:= 'весна';
    3: RangeE.Value2:= 'год';
    end;
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+1), 'B' + IntToStr(rowCount+1)];
    case j of
    1: RangeE.Value2:= 'осень';
    2: RangeE.Value2:= 'весна';
    3: RangeE.Value2:= 'год';
    end;
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+2), 'B' + IntToStr(rowCount+2)];
    RangeE.Value2:= 'час.';
    RangeE.Font.Color:= clRed;
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount+3), 'B' + IntToStr(rowCount+3)];
    RangeE.Value2:= '%';
    RangeE.Font.Color:= clRed;
    case j of
    1: tempDataSet.CommandText:= 'SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1)';
    2: tempDataSet.CommandText:= 'SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)';
    3: tempDataSet.CommandText:= 'SELECT ik_vid_zanyat, sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr GROUP BY ik_vid_zanyat';
    end;
    tempDataSet.Open;
    for I := 0 to Length(vzColumns) - 1 do
      if tempDataSet.Locate('ik_vid_zanyat', vzColumns[i], [loPartialKey]) then
      begin
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount), cols[i+3] + IntToStr(rowCount)];
        RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
      end;
    tempDataSet.Close;
    case j of
    1: tempDataSet.CommandText:= 'SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1)';
    2: tempDataSet.CommandText:= 'SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)';
    3: tempDataSet.CommandText:= 'SELECT ik_vid_zanyat, sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr GROUP BY ik_vid_zanyat';
    end;
    tempDataSet.Open;
    for I := 0 to Length(vzColumns) - 1 do
      if tempDataSet.Locate('ik_vid_zanyat', vzColumns[i], [loPartialKey]) then
      begin
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+1), cols[i+3] + IntToStr(rowCount+1)];
        RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+2), cols[i+3] + IntToStr(rowCount+2)];
        RangeE.Value2:= '=' + cols[i+3] + IntToStr(rowCount+1) + '-' + cols[i+3] + IntToStr(rowCount);
        RangeE.Font.Color:= clRed;
        RangeE:= IExcelActiveWS.Range[cols[i+3] + IntToStr(rowCount+3), cols[i+3] + IntToStr(rowCount+3)];
        RangeE.Value2:= '=ROUND(' + cols[i+3] + IntToStr(rowCount+2) + '*100/' + cols[i+3] + IntToStr(rowCount) + ', 2)';
        RangeE.Font.Color:= clRed;
      end;
    tempDataSet.Close;
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount), cols[Length(vzColumns)+3] + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount) + ')';
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+1), cols[Length(vzColumns)+3] + IntToStr(rowCount+1)];
    RangeE.Value2:= '=SUM(' + cols[3] + IntToStr(rowCount+1) + ':' + cols[Length(vzColumns)+2] + IntToStr(rowCount+1) + ')';
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+2), cols[Length(vzColumns)+3] + IntToStr(rowCount+2)];
    RangeE.Value2:= '=' + cols[Length(vzColumns)+3] + IntToStr(rowCount+1) + '-' + cols[Length(vzColumns)+3] + IntToStr(rowCount);
    RangeE.Font.Color:= clRed;
    RangeE:= IExcelActiveWS.Range[cols[Length(vzColumns)+3] + IntToStr(rowCount+3), cols[Length(vzColumns)+3] + IntToStr(rowCount+3)];
    RangeE.Value2:= '=ROUND(' + cols[Length(vzColumns)+3] + IntToStr(rowCount+2) + '/' + cols[Length(vzColumns)+3] + IntToStr(rowCount) + ', 2)';
    RangeE.Font.Color:= clRed;
    inc(rowCount, 4);
    ProgressBar.Position:= ProgressBar.Position + 1;
    Application.ProcessMessages;
  end;
  RangeE:= IExcelActiveWS.Range['A5', 'A' + IntToStr(rowCount-1)];
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A5', cols[Length(vzColumns) + 3] + IntToStr(rowCount-1)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+1), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+1)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+3), cols[Length(vzColumns) + 3]  + IntToStr(rowCount+3)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[3] as ExcelWorksheet;
  RangeE:= IExcelActiveWS.Range['A6', 'A6'];
  RangeE.Value2:= YearOneName;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A7', 'A7'];
  RangeE.Value2:= YearTwoName;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A8', 'A8'];
  RangeE.Value2:= 'откл';
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
  tempDataSet.Open;
  RangeE:= IExcelActiveWS.Range['B6', 'B6'];
  RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(2, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(2, ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
  tempDataSet.Open;
  RangeE:= IExcelActiveWS.Range['C6', 'C6'];
  RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['D6', 'D6'];
  RangeE.Value2:= '=B6 - C6';
  ProgressBar.Position:= ProgressBar.Position + 1;
  tempDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(1, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
  tempDataSet.Open;
  RangeE:= IExcelActiveWS.Range['B7', 'B7'];
  RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrForUniversity(2, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) UNION SELECT * FROM GetAllNagrForUniversity(2, ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
  tempDataSet.Open;
  RangeE:= IExcelActiveWS.Range['C7', 'C7'];
  RangeE.Value2:= tempDataSet.FieldByName('f_plan_hour').AsFloat;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['D7', 'D7'];
  RangeE.Value2:= '=B7 - C7';
  RangeE:= IExcelActiveWS.Range['B8', 'B8'];
  RangeE.Value2:= '=B7-B6';
  RangeE:= IExcelActiveWS.Range['C8', 'C8'];
  RangeE.Value2:= '=C7-C6';
  RangeE:= IExcelActiveWS.Range['D8', 'D8'];
  RangeE.Value2:= '=D7-D6';
  RangeE:= IExcelActiveWS.Range['A8', 'D8'];
  RangeE.Font.Color:= clRed;
  RangeE:= IExcelActiveWS.Range['A10', 'A10'];
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A12', 'A12'];
  RangeE.Value2:= 'Зам. начальника учебного отдела';
  ProgressBar.Position:= ProgressBar.Position + 1;

  RangeE:= IExcelActiveWS.Range['A5', 'D8'];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A1', 'D4'];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(0.8, 0);
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A5', 'D5'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;

  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[4] as ExcelWorksheet;
  rowCount:= 6;
  facCount:= 0;
  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  allSumStr:= '=SUM(';
  tempDataSet.First;
  while not tempDataSet.Eof do
  begin
    secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
    secTempDataSet.Open;
    if (secTempDataSet.RecordCount = 0) then
    begin
      secTempDataSet.Close;
      tempDataSet.Next;
      continue;
    end;
    facBeginRow:= rowCount;
    secTempDataSet.First;
    while not secTempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= IntToStr(rowCount - facCount - 5) + '.';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr WHERE ik_vid_zanyat = 3';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(1, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr WHERE ik_vid_zanyat = 3';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= '=D' + IntToStr(rowCount) + '-C' + IntToStr(rowCount);
      RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
      secTempDataSet.Next;
      inc(rowCount);
      ProgressBar.Position:= ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    secTempDataSet.Close;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    if (((rowCount - facCount - 6) - (facBeginRow - facCount - 5)) <> 0) then
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.-' + IntToStr(rowCount - facCount - 6) + '.'
    else
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.';
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    RangeE.Value2:= 'Итого по ' + Trim(tempDataSet.FieldByName('Cshort_name_fac').AsString);
    RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(C' + IntToStr(facBeginRow) + ':C' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(D' + IntToStr(facBeginRow) + ':D' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(E' + IntToStr(facBeginRow) + ':E' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Font.Bold:= true;

    allSumStr:= allSumStr + 'C' + IntToStr(rowCount) + ',';
    inc(rowCount);
    inc(facCount);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
  if (rowCount > 6) then
      RangeE.Value2:= '1.-' + IntToStr(rowCount - facCount - 6) + '.';
  allSumStr:= allSumStr + ')';
  RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
  RangeE.Value2:= 'Итого по УГТУ';
  RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.Value2:= allSumStr;
  for I := 4 to 5 do
  begin
    for j := 1 to Length(allSumStr) do
      if allSumStr[j] = cols[i-1] then
        allSumStr[j]:= cols[i][1];
    RangeE:= IExcelActiveWS.Range[cols[i] + IntToStr(rowCount), cols[i] + IntToStr(rowCount)];
    RangeE.Value2:= allSumStr;
  end;
  RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
  RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
  RangeE:= IExcelActiveWS.Range['A1', 'F5'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A5', 'F5'];
  RangeE.Font.Bold:= true;
  RangeE:= IExcelActiveWS.Range['A5', 'F' + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A6', 'A' + IntToStr(rowCount)];
  RangeE.HorizontalAlignment:= xlRight;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
  RangeE.Font.Size:= 11;
  RangeE.Font.Bold:= true;

  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+2), 'F' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+4), 'F' + IntToStr(rowCount+4)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[5] as ExcelWorksheet;
  rowCount:= 6;
  facCount:= 0;
  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  allSumStr:= '';
  tempDataSet.First;
  while not tempDataSet.Eof do
  begin
    secTempDataSet.CommandText:= 'SELECT * FROM kafedra WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
    secTempDataSet.Open;
    if (secTempDataSet.RecordCount = 0) then
    begin
      secTempDataSet.Close;
      tempDataSet.Next;
      continue;
    end;
    facBeginRow:= rowCount;
    secTempDataSet.First;
    while not secTempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= IntToStr(rowCount - facCount - 5) + '.';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= '=D' + IntToStr(rowCount) + '-C' + IntToStr(rowCount);
      RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
      secTempDataSet.Next;
      inc(rowCount);
      ProgressBar.Position:= ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    secTempDataSet.Close;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    if (((rowCount - facCount - 6) - (facBeginRow - facCount - 5)) <> 0) then
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.-' + IntToStr(rowCount - facCount - 6) + '.'
    else
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 5) + '.';
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    RangeE.Value2:= 'Итого по ' + Trim(tempDataSet.FieldByName('Cshort_name_fac').AsString);
    RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(C' + IntToStr(facBeginRow) + ':C' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(D' + IntToStr(facBeginRow) + ':D' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(E' + IntToStr(facBeginRow) + ':E' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Font.Bold:= true;

    allSumStr:= allSumStr + 'C' + IntToStr(rowCount) + ',';
    inc(rowCount);
    inc(facCount);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
  if (rowCount > 6) then
      RangeE.Value2:= '1.-' + IntToStr(rowCount - facCount - 6) + '.';
  allSumStr:= allSumStr;
  RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
  RangeE.Value2:= 'Итого по УГТУ';
  RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  for I := 4 to 5 do
  begin
    for j := 1 to Length(allSumStr) do
      if allSumStr[j] = cols[i-1] then
        allSumStr[j]:= cols[i][1];
    RangeE:= IExcelActiveWS.Range[cols[i] + IntToStr(rowCount), cols[i] + IntToStr(rowCount)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  end;
  RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
  RangeE.Value2:= '=ROUND(E' + IntToStr(rowCount) + '*100/C' + IntToStr(rowCount) + ', 2)';
  RangeE:= IExcelActiveWS.Range['A1', 'F5'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A4', 'F4'];
  RangeE.VerticalAlignment:= xlTop;
  RangeE:= IExcelActiveWS.Range['A5', 'F5'];
  RangeE.Font.Bold:= true;
  RangeE:= IExcelActiveWS.Range['A5', 'F' + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A6', 'A' + IntToStr(rowCount)];
  RangeE.HorizontalAlignment:= xlRight;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
  RangeE.Font.Size:= 11;
  RangeE.Font.Bold:= true;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+2), 'F' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+4), 'F' + IntToStr(rowCount+4)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  IExcelActiveWS:= IExcelApp.ActiveWorkbook.Worksheets[6] as ExcelWorksheet;
  rowCount:= 7;
  facCount:= 0;
  tempDataSet.CommandText:= 'SELECT * FROM Fac WHERE (Ik_fac IN (SELECT ik_fac FROM dbo.GetNagrFacPermissionsFromRelTable() AS GetFacPermissions_1)) ORDER BY Cname_fac';
  tempDataSet.Open;
  allSumStr:= '';
  tempDataSet.First;
  while not tempDataSet.Eof do
  begin
    secTempDataSet.CommandText:= 'SELECT kafedra.*, rates_table.all_rates FROM kafedra INNER JOIN (SELECT ik_kaf, sum(f_rates) as all_rates FROM Relation_kafedra_prep GROUP BY ik_kaf) rates_table ON kafedra.ik_kaf = rates_table.ik_kaf WHERE (ik_fac = ' + tempDataSet.FieldByName('ik_fac').AsString + ') and (kafedra.ik_kaf IN (SELECT ik_kaf FROM GetNagrKafPermissionsFromRelTable() AS GetFacPermissions_1))';
    secTempDataSet.Open;
    if (secTempDataSet.RecordCount = 0) then
    begin
      secTempDataSet.Close;
      tempDataSet.Next;
      continue;
    end;
    facBeginRow:= rowCount;
    secTempDataSet.First;
    while not secTempDataSet.Eof do
    begin
      RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
      RangeE.Value2:= IntToStr(rowCount - facCount - 6) + '.';
      RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
      RangeE.Value2:= Trim(secTempDataSet.FieldByName('cshort_name_kaf').AsString);
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearOneIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      thirdDataSet.CommandText:= 'SELECT sum(f_plan_hour) as f_plan_hour FROM (SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 1) ' +
        'UNION SELECT * FROM GetAllNagrByDepPlan(3, ' + secTempDataSet.FieldByName('ik_kaf').AsString + ', ' + IntToStr(YearTwoIK) + ', ' + IntToStr(TypeEdIK) + ', 2)) all_nagr';
      thirdDataSet.Open;
      RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
      RangeE.Value2:= thirdDataSet.FieldByName('f_plan_hour').AsFloat;
      thirdDataSet.Close;
      RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
      RangeE.Value2:= '=D' + IntToStr(rowCount) + '-C' + IntToStr(rowCount);
      RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
      RangeE.Value2:= secTempDataSet.FieldByName('all_rates').AsFloat;
      RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(C' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
      RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
      RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
      secTempDataSet.Next;
      inc(rowCount);
      ProgressBar.Position:= ProgressBar.Position + 1;
      Application.ProcessMessages;
    end;
    secTempDataSet.Close;
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
    if (((rowCount - facCount - 7) - (facBeginRow - facCount - 6)) <> 0) then
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 6) + '.-' + IntToStr(rowCount - facCount - 7) + '.'
    else
        RangeE.Value2:= IntToStr(facBeginRow - facCount - 6) + '.';
    RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
    RangeE.Value2:= 'Итого по ' + Trim(tempDataSet.FieldByName('Cshort_name_fac').AsString);
    RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(C' + IntToStr(facBeginRow) + ':C' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(D' + IntToStr(facBeginRow) + ':D' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['E' + IntToStr(rowCount), 'E' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(E' + IntToStr(facBeginRow) + ':E' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['F' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Value2:= '=SUM(F' + IntToStr(facBeginRow) + ':F' + IntToStr(rowCount-1);
    RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(C' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
    RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
    RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'F' + IntToStr(rowCount)];
    RangeE.Font.Bold:= true;
    allSumStr:= allSumStr + 'C' + IntToStr(rowCount) + ',';
    inc(rowCount);
    inc(facCount);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount)];
  if (rowCount > 7) then
      RangeE.Value2:= '1.-' + IntToStr(rowCount - facCount - 7) + '.';
  RangeE:= IExcelActiveWS.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount)];
  RangeE.Value2:= 'Итого по УГТУ';
  RangeE:= IExcelActiveWS.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount)];
  RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  for I := 4 to 6 do
  begin
    for j := 1 to Length(allSumStr) do
      if allSumStr[j] = cols[i-1] then
        allSumStr[j]:= cols[i][1];
    RangeE:= IExcelActiveWS.Range[cols[i] + IntToStr(rowCount), cols[i] + IntToStr(rowCount)];
    RangeE.Value2:= TGeneralController.Instance.ParseExcelSumExpression(allSumStr);
  end;
  RangeE:= IExcelActiveWS.Range['G' + IntToStr(rowCount), 'G' + IntToStr(rowCount)];
  RangeE.Value2:= '=ROUND(C' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
  RangeE:= IExcelActiveWS.Range['H' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
  RangeE.Value2:= '=ROUND(D' + IntToStr(rowCount) + '/F' + IntToStr(rowCount) + ', 2)';
  RangeE:= IExcelActiveWS.Range['A1', 'H6'];
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE:= IExcelActiveWS.Range['A4', 'F4'];
  RangeE.VerticalAlignment:= xlTop;
  RangeE:= IExcelActiveWS.Range['A5', 'H6'];
  RangeE.Font.Bold:= true;
  RangeE:= IExcelActiveWS.Range['A5', 'H' + IntToStr(rowCount)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE:= IExcelActiveWS.Range['A7', 'A' + IntToStr(rowCount)];
  RangeE.HorizontalAlignment:= xlRight;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount), 'H' + IntToStr(rowCount)];
  RangeE.Font.Size:= 11;
  RangeE.Font.Bold:= true;
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+2), 'H' + IntToStr(rowCount+2)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Начальник УНМУ';
  RangeE:= IExcelActiveWS.Range['A' + IntToStr(rowCount+4), 'H' + IntToStr(rowCount+4)];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Зам. начальника учебного отдела';

  thirdDataSet.Free;
  secTempDataSet.Free;
  tempDataSet.Free;
  IExcelApp.Visible[0]:= true;
finally
  IExcelApp:= nil;
  RangeE:= nil;
end;
end;

end.
