unit uNagruzkaFillFactNagrByCU;
    {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, NagruzkaClasses, NagruzkaController, GeneralController,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, ADODB, SheduleController, uNagruzkaFillFactNagrByVZ,
  ImgList, ComCtrls, ToolWin;

type
  TfrmNagruzkaFillFactNagrByCU = class(TfrmBaseDialog)
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    dbcbByPlanNumber: TDBLookupComboboxEh;
    dbcbCalcUnit: TDBLookupComboboxEh;
    Panel4: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    Panel6: TPanel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    actAddDate: TAction;
    actAddNoAud: TAction;
    actEditNoAud: TAction;
    actDelNoAud: TAction;
    Panel9: TPanel;
    Panel8: TPanel;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    dbdtDateValue: TDBDateTimeEditEh;
    Label7: TLabel;
    dbdtTime: TDBDateTimeEditEh;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    Bevel3: TBevel;
    dbcbInComissionNumber: TDBLookupComboboxEh;
    Label4: TLabel;
    Image9: TImage;
    Label8: TLabel;
    procedure dbcbCalcUnitKeyValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbcbByPlanNumberKeyValueChanged(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure actAddNoAudExecute(Sender: TObject);
    procedure actEditNoAudExecute(Sender: TObject);
    procedure actEditNoAudUpdate(Sender: TObject);
    procedure actAddNoAudUpdate(Sender: TObject);
    procedure actAddDateUpdate(Sender: TObject);
    procedure actAddDateExecute(Sender: TObject);
    procedure actDelNoAudExecute(Sender: TObject);
    procedure dbdtTimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbInComissionNumberKeyValueChanged(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    fMySGFact: TFactGrid;
    fParentForm: TfrmNagruzkaFillFactNagrByVZ;
    fTeacherIK: integer;
    fPlanTeacherIK: integer;
    taskCountList: TStringList;
   // procedure QuickSortEventList;
    procedure ShakerSortEventList;
    procedure mySGFactCheckBoxChange(Sender: TObject);
    procedure mySGFactSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
    procedure mySGFactMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(TeacherIK, PlanTeacherIK: integer; AParrentForm: TfrmNagruzkaFillFactNagrByVZ);
    destructor Destroy; override;
  end;

var
  frmNagruzkaFillFactNagrByCU: TfrmNagruzkaFillFactNagrByCU;

implementation

{$R *.dfm}

procedure TfrmNagruzkaFillFactNagrByCU.actAddDateExecute(Sender: TObject);
var
  y,m,d,h,mn,s, ms: word;
begin
  DecodeDate(dbdtDateValue.Value, y,m,d);
  DecodeTime(dbdtTime.Value, h, mn, s, ms);
  if Panel8.Tag = -1 then
  begin
{    curHour:= 0;
    for i:= 0 to fMySGFact.EventDatesCount-1 do
      if fMySGFact.EventDates[i].CheckBox.Checked then
        curHour:= curHour + fMySGFact.EventDates[i].GroupHour;
    if (dbcbByPlanNumber.ListSource.DataSet.FieldByName('f_hour_per_unit').AsFloat - curHour < 0) then
      allowHour:= 0
    else
      allowHour:= dbcbByPlanNumber.ListSource.DataSet.FieldByName('f_hour_per_unit').AsFloat - curHour;}
    fMySGFact.AddNewEvent(true, EncodeDateTime(y, m, d, h, mn, s, ms), EncodeDateTime(y, m, d, h, mn, s, ms), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger, dbcbByPlanNumber.ListSource.DataSet.FieldByName('f_hour_per_unit').AsFloat);
  end
  else
  begin
    fMySGFact.EventDates[Panel8.Tag].EventStart:= EncodeDateTime(y, m, d, h, mn, s, ms);
    fMySGFact.Cells[1, Panel8.Tag+1]:= IntToStr(d) + ' ' + MonthNames[m] + ' ' + IntToStr(y) + ' (' + FormatDateTime('h:mm', dbdtTime.Value) + ')';
  end;
  fMySGFact.Invalidate;
  Panel8.Visible:= false;
  mySGFactCheckBoxChange(nil);
  fMySGFact.UpdateAllCheckBox;
  IsModified:= true;
  ToolButton2.Down:= false;
  ToolButton4.Down:= false;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actAddDateUpdate(Sender: TObject);
begin
  actAddDate.Enabled:= dbdtDateValue.Value <> NULL;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actAddNoAudExecute(Sender: TObject);
begin
  if not Panel8.Visible then
    ToolButton2.Down:= true;
  if Panel8.Visible and (Panel8.Tag >= 0) then
  begin
    Panel8.Visible:= false;
    ToolButton2.Down:= true;
    ToolButton4.Down:= false;
  end;
  if ToolButton2.Down then
  begin
    Panel8.Top:= 22;
    Panel8.Visible:= true;
    dbdtDateValue.Value:= fParentForm.CurrentSemInfo.MinSessionStart;
    dbdtTime.Value:= fParentForm.CurrentSemInfo.WorkTimeStart;
    Panel8.Tag:= -1;
  end
  else Panel8.Visible:= false;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actAddNoAudUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= dbcbByPlanNumber.KeyValue <> null;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actDelNoAudExecute(Sender: TObject);
begin
  fMySGFact.DeleteLine(fMySGFact.Row);
  fMySGFact.UpdateAllCheckBox;
  IsModified:= true;
  fMySGFact.Invalidate;
  mySGFactCheckBoxChange(nil);
end;

procedure TfrmNagruzkaFillFactNagrByCU.actEditNoAudExecute(Sender: TObject);
begin
  if not Panel8.Visible then
    ToolButton4.Down:= true;
  if ToolButton4.Down then
  begin
    Panel8.Top:= 66;
    Panel8.Visible:= true;
    dbdtDateValue.Value:= fMySGFact.EventDates[fMySGFact.Row-1].EventStart;
    dbdtTime.Value:= fMySGFact.EventDates[fMySGFact.Row-1].EventStart;
    Panel8.Tag:= fMySGFact.Row-1;
  end
  else Panel8.Visible:= false;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actEditNoAudUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= fMySGFact.Row > 0;
end;

procedure TfrmNagruzkaFillFactNagrByCU.actOKUpdate(Sender: TObject);
begin
  if Tag = -1 then
    (Sender as TAction).Enabled:= IsModified and (fMySGFact.RowCount > 1)
  else (Sender as TAction).Enabled:= IsModified;
end;

procedure TfrmNagruzkaFillFactNagrByCU.dbcbByPlanNumberKeyValueChanged(
  Sender: TObject);
var
  i, j, inPlanCount, allTaskCount, WeekInPlanCount: integer;
  byPlanHour: double;
  isMod, tempTFVZNWasCreatedHere: boolean;
  tempTFVZN: TTakeFactNagrVZItem;
begin
  fMySGFact.Clear;
  taskCountList.Clear;
  if (dbcbByPlanNumber.KeyValue <> NULL) then
  begin
    if fParentForm.CurTFN.VidZanyatMustBeInUchPlan or (fParentForm.CurTFN.VidZanyatIK = 32) then
    begin
      if not TNagruzkaController.PlanNagruzka.GetUchPlanParametrsForCalcUnit(dbcbCalcUnit.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger, TNagruzkaController.PlanNagruzka.GetSemesterNumberForPotok(fParentForm.CurTFN.ContentPlanNagrIK), fParentForm.CurTFN.ContentPlanNagrIK, fParentForm.CurTFN.VidZanyatIK, byPlanHour, inPlanCount, taskCountList, WeekInPlanCount) then
      begin
    //    inPlanCount:= 1;
        allTaskCount:= 1;
        taskCountList.Add('1');
      end
      else // т.е. вид занятий не найден в уч. плане - ну и фиг с ним, но inPlanCount все равно надо поставить в 1
        if byPlanHour = 0 then
        begin
     //     inPlanCount:= 1;
          allTaskCount:= 1;
          taskCountList.Add('1');
        end
        else
          for I := 0 to taskCountList.Count - 1 do
            allTaskCount:= allTaskCount + StrToInt(taskCountList[i]);
    end
    else
    begin
   //   inPlanCount:= 1;
      allTaskCount:= 1;
      taskCountList.Add('1');
      WeekInPlanCount:= 1
    end;
    Panel6.Visible:= not ((fParentForm.CurTFN.VidZanyatTypeIK = 3) or ((fParentForm.CurTFN.VidZanyatTypeIK = 4) and ((fParentForm.CurTFN.VidZanyatTypeByTimeIK = 1) or (fParentForm.CurTFN.VidZanyatTypeByTimeIK = 2) or (fParentForm.CurTFN.VidZanyatTypeByTimeIK = 4))));

    tempTFVZNWasCreatedHere:= false;

    if Tag = -1 then // т.е. в списке fTakeFactNagr не было соответсвующей записи
    begin
      tempTFVZN:= nil;
      for I := 0 to fParentForm.CurTFN.GetItemsList.Count - 1 do
        if fParentForm.CurTFN.Items[i].PrepodPlanNagrIK = dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger then
        begin
          tempTFVZN:= fParentForm.CurTFN.GetItemsList[i] as TTakeFactNagrVZItem;
          if tempTFVZN.IsRemoved then IsModified:= true;
          break;
        end;
      if (tempTFVZN = nil) then
      begin
        case fParentForm.CurTFN.VidZanyatTypeIK of
        3: tempTFVZN:= TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger,
            TSheduleController.MainFunctions.GetAllEventsInInterval(fParentForm.CurrentSemInfo.MinSemStart, fParentForm.CurrentSemInfo.MaxSemStop, dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, fTeacherIK), true, WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean);
        4:
          begin
            case fParentForm.CurTFN.VidZanyatTypeByTimeIK of //т.е. экзамен (1), курсовые (4), зачет(2)
            1: tempTFVZN:= TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger,
              TSheduleController.MainFunctions.GetAllExamsInInterval(fParentForm.CurrentSemInfo.MinSessionStart, fParentForm.CurrentSemInfo.MaxSessionStop, dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, fTeacherIK), true, WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean);
            2, 4:
              tempTFVZN:= TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger,
                TNagruzkaController.FactNagruzka.GetAllVedomost(fParentForm.PlanIK, dbcbCalcUnit.KeyValue, dbcbCalcUnit.ListSource.DataSet.FieldByName('ik_decompose_type').AsInteger, fParentForm.DiscIK, fParentForm.CurTFN.VidZanyatIK, TNagruzkaController.Preparation.GetTabNFromTeacherIK(fParentForm.TeahcerIK),
                dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger, dbcbByPlanNumber.ListSource.DataSet.FieldByName('f_hour_per_unit').AsFloat, fParentForm.CurrentSemInfo.WorkTimeStart), true, WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean);
            else tempTFVZN:= TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger, nil, false, WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean);
            end;
          end;
        else tempTFVZN:= TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger, nil, false, WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean);
        end;

        tempTFVZNWasCreatedHere:= true;

        if (dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger * fParentForm.CurTFN.NormPerStudentForMin * allTaskCount > dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger * fParentForm.CurTFN.MaxNormPerStudent) and (fParentForm.CurTFN.MaxNormPerStudent <> 0) then
          tempTFVZN.NormPerStudentForMin:= (fParentForm.CurTFN.MaxNormPerStudent/allTaskCount)
        else
          tempTFVZN.NormPerStudentForMin:= fParentForm.CurTFN.NormPerStudentForMin;

        tempTFVZN.NormPerUnitForMin:= fParentForm.CurTFN.NormPerUnitForMin;


        if (dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger * fParentForm.CurTFN.NormPerStudent * allTaskCount > dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger * fParentForm.CurTFN.MaxNormPerStudent) and (fParentForm.CurTFN.MaxNormPerStudent <> 0) then
          tempTFVZN.NormPerStudent:= (fParentForm.CurTFN.MaxNormPerStudent/allTaskCount)
        else
          tempTFVZN.NormPerStudent:= fParentForm.CurTFN.NormPerStudent;
        tempTFVZN.NormPerUnit:= fParentForm.CurTFN.NormPerUnit;

        case fParentForm.CurTFN.VidZanyatTypeIK of
        3:
          begin
            for I := 0 to tempTFVZN.GetEventList.Count - 1 do
            begin
              tempTFVZN.Events[i].StudentCount:= tempTFVZN.DefStudentCount;
              tempTFVZN.Events[i].GroupHour:= 2*tempTFVZN.NormPerUnit;
            end;
          end;
        4:
          if (fParentForm.CurTFN.VidZanyatTypeByTimeIK <> 2) and (fParentForm.CurTFN.VidZanyatTypeByTimeIK <> 4) then
            for I := 0 to tempTFVZN.GetEventList.Count - 1 do
            begin
              tempTFVZN.Events[i].StudentCount:= tempTFVZN.DefStudentCount;
              if (fParentForm.CurTFN.VidZanyatTypeByTimeIK = 1) then
                tempTFVZN.Events[i].GroupHour:= MinutesBetween(tempTFVZN.Events[i].EventStop, tempTFVZN.Events[i].EventStart)/60
              else tempTFVZN.Events[i].GroupHour:= tempTFVZN.NormPerUnit;
            end;
        end;
      end;
    end
    else tempTFVZN:= fParentForm.CurTFN.Items[Tag];

    fMySGFact.IsAuditor:= fParentForm.CurTFN.VidZanyatTypeIK = 3;
    fMySGFact.NormPerUnit:= tempTFVZN.NormPerUnit;
    fMySGFact.NormPerStudent:= tempTFVZN.NormPerStudent;
    fMySGFact.NormPerUnitForMin:= tempTFVZN.NormPerUnitForMin;
    fMySGFact.NormPerStudentForMin:= tempTFVZN.NormPerStudentForMin;
    fMySGFact.TaskCount:= tempTFVZN.TaskCount;
    fMySGFact.WeekInPlanCount:= tempTFVZN.WeekInPlanCount;
    fMySGFact.AssignEventDates(tempTFVZN.GetEventList);
    if tempTFVZNWasCreatedHere and Assigned(tempTFVZN) then FreeAndNil(tempTFVZN);

    if fMySGFact.EventDatesCount > 0 then ShakerSortEventList;
    for j:= 0 to fMySGFact.EventDatesCount-1 do fMySGFact.AddLine(j);
  end;
  isMod:= IsModified;
  mySGFactCheckBoxChange(nil);
  IsModified:= isMod;
  fMySGFact.Invalidate;
  fMySGFact.UpdateAllCheckBox;
end;

procedure TfrmNagruzkaFillFactNagrByCU.dbcbCalcUnitKeyValueChanged(Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbByPlanNumber);
  if (dbcbCalcUnit.KeyValue <> NULL) then
  begin
    dbcbByPlanNumber.KeyValue:= TNagruzkaController.PlanNagruzka.GetByPlanNumbers(@dbcbByPlanNumber.ListSource.DataSet, fPlanTeacherIK, fParentForm.CurTFN.ContentPlanNagrIK, dbcbCalcUnit.KeyValue, dbcbInComissionNumber.KeyValue, true);
    dbcbByPlanNumber.Visible:= dbcbByPlanNumber.ListSource.DataSet.RecordCount <> 1;
    Label5.Visible:= dbcbByPlanNumber.ListSource.DataSet.RecordCount <> 1;
  end;
end;

procedure TfrmNagruzkaFillFactNagrByCU.dbcbInComissionNumberKeyValueChanged(
  Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbCalcUnit);
  if dbcbInComissionNumber.KeyValue <> NULL then
    TNagruzkaController.PlanNagruzka.GetCalcUnitsFromTeacherPlan(@dbcbCalcUnit.ListSource.DataSet, fPlanTeacherIK, fParentForm.CurTFN.ContentPlanNagrIK, dbcbInComissionNumber.KeyValue, false, NULL);
end;

procedure TfrmNagruzkaFillFactNagrByCU.dbdtTimeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actAddDate.Enabled then
      actAddDateExecute(actAddDate);
end;

destructor TfrmNagruzkaFillFactNagrByCU.Destroy;
begin
  if Assigned(taskCountList) then FreeAndNil(taskCountList); 
  inherited;
end;

function TfrmNagruzkaFillFactNagrByCU.DoApply: boolean;
var
  i: integer;
  tempTFVZN: TTakeFactNagrVZItem;
begin
  if Tag = -1 then // т.е. в списке fTakeFactNagr не было соответсвующей записи
    begin
      tempTFVZN:= nil;
      for I := 0 to fParentForm.CurTFN.GetItemsList.Count - 1 do
        if fParentForm.CurTFN.Items[i].PrepodPlanNagrIK = dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger then
        begin
          tempTFVZN:= fParentForm.CurTFN.GetItemsList[i] as TTakeFactNagrVZItem;
          break;
        end;
      if tempTFVZN = nil then
      begin
        tempTFVZN:= fParentForm.CurTFN.AddTakeFactNagrVZItem(TTakeFactNagrVZItem.Create(dbcbByPlanNumber.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger, dbcbCalcUnit.KeyValue, dbcbCalcUnit.Text, dbcbByPlanNumber.KeyValue, GetTaskCountFromList(taskCountList, dbcbByPlanNumber.KeyValue), dbcbByPlanNumber.ListSource.DataSet.FieldByName('i_student_count').AsInteger, nil, false, fMySGFact.WeekInPlanCount, dbcbCalcUnit.ListSource.DataSet.FieldByName('bit_calc_students_only').AsBoolean));
        tempTFVZN.NormPerStudent:= fMySGFact.NormPerStudent;
        tempTFVZN.NormPerUnit:= fMySGFact.NormPerUnit;
      end;
      tempTFVZN.IsRemoved:= false;
    end
    else tempTFVZN:= fParentForm.CurTFN.GetItemsList[Tag] as TTakeFactNagrVZItem;
  tempTFVZN.AssingEventList(fMySGFact.GetEventDates);
  Result:= true;
end;

function TfrmNagruzkaFillFactNagrByCU.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaFillFactNagrByCU.FormDestroy(Sender: TObject);
begin
  inherited;
  fMySGFact.Free;
end;

procedure TfrmNagruzkaFillFactNagrByCU.Label8Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaFillFactNagrByCU.Label8MouseEnter(Sender: TObject);
begin
  Label8.Font.Style:= Label8.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaFillFactNagrByCU.Label8MouseLeave(Sender: TObject);
begin
  Label8.Font.Style:= Label8.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaFillFactNagrByCU.mySGFactCheckBoxChange(Sender: TObject);
var
  i: integer;
  hour: double;
begin
  hour:= 0;
  for i:= 0 to fMySGFact.EventDatesCount-1 do
    if fMySGFact.EventDates[i].CheckBox.Checked then
      if fMySGFact.Cells[4, i+1] <> '' then
        hour:= hour + StrToFloat(fMySGFact.Cells[4, i+1]);
  Label6.Caption:= FloatToStrF(hour, ffFixed, 10 ,2) + ' час.';
  IsModified:= true;
end;

procedure TfrmNagruzkaFillFactNagrByCU.mySGFactMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  sRow, sCol: integer;
begin
  inherited;
  fMySGFact.MouseToCell(X,Y,sCol, sRow);
  if (sCol > -1) and (sRow > -1) then
    fMySGFact.Hint:= fMySGFact.Cells[sCol, sRow];
end;

procedure TfrmNagruzkaFillFactNagrByCU.mySGFactSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  mySGFactCheckBoxChange(nil);
  IsModified:= true;
end;

{
procedure TfrmNagruzkaFillFactNagrByCU.QuickSortEventList;

  procedure sort(l,r: integer);
  var
    i,j: integer;
    x, y: TFactEvent;
  begin
    i:=l;
    j:=r;
    x:= fMySGFact.EventDates[(l+r) DIV 2];
    repeat
      while (fMySGFact.EventDates[i].EventStart < x.EventStart) and (i <= r) do inc(i);
      while (x.EventStart < fMySGFact.EventDates[j].EventStart) and (j >= l) do dec(j);
      if i <= j then
      begin
        y:= TFactEvent.Create(fMySGFact.EventDates[i]);
        fMySGFact.EventDates[i].Assign(fMySGFact.EventDates[j]);
        fMySGFact.EventDates[j].Assign(y);
        FreeAndNil(y);
        i:=i+1;
        j:=j-1;
      end;
    until i>j;
    if l<j then sort(l,j);
    if i<r then sort(i,r);
  end;

begin
  sort(0, fMySGFact.EventDatesCount-1);
end;
         }


procedure TfrmNagruzkaFillFactNagrByCU.Read(TeacherIK, PlanTeacherIK: integer; AParrentForm: TfrmNagruzkaFillFactNagrByVZ);
begin
  taskCountList:= TStringList.Create;
  fMySGFact:= TFactGrid.Create(Panel9);
  fMySGFact.Parent:= Panel9;
  fMySGFact.AllCheckBox.Parent:= Panel9;
  fMySGFact.Align:= alClient;
  fMySGFact.OnCheckBoxChange:= mySGFactCheckBoxChange;
  fMySGFact.OnSetEditText:= mySGFactSetEditText;
  fMySGFact.OnMouseMove:= mySGFactMouseMove;
  fTeacherIK:= TeacherIK;
  fPlanTeacherIK:= PlanTeacherIK;
  fParentForm:= AParrentForm;
  TGeneralController.Instance.InitializeLockupCB(@dbcbInComissionNumber, 'commission_member', 'commission_member');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCalcUnit, 'ik_calc_unit', 'Cname_calc_unit');
  TGeneralController.Instance.InitializeLockupCB(@dbcbByPlanNumber, 'by_plan_number', 'by_plan_number');
  dbcbInComissionNumber.KeyValue:= TNagruzkaController.PlanNagruzka.GetInCommissionNumbersFromTeacherPlan(@dbcbInComissionNumber.ListSource.DataSet, PlanTeacherIK, fParentForm.CurTFN.ContentPlanNagrIK, true, NULL);
  if (dbcbInComissionNumber.KeyValue <> NULL) and (dbcbInComissionNumber.ListSource.DataSet.RecordCount = 1) then
  begin
    dbcbInComissionNumber.Visible:= false;
    Label4.Visible:= false;
    Label2.Left:= 8;
    dbcbCalcUnit.Left:= 115;
    Label5.Left:= 275;
    dbcbByPlanNumber.Left:= 335;
  end
  else
  begin
    dbcbInComissionNumber.Visible:= true;
    Label4.Visible:= true;
    Label2.Left:= 143;
    dbcbCalcUnit.Left:= 250;
    Label5.Left:= 410;
    dbcbByPlanNumber.Left:= 470;
  end;
end;

procedure TfrmNagruzkaFillFactNagrByCU.ShakerSortEventList;
var
  i,j,k,l,r:integer;
  toleft:boolean;
  replaceEvent: TFactEvent;
begin
  if fMySGFact.EventDatesCount <= 1 then exit;
  L:= 0;
  r:= fMySGFact.EventDatesCount-2;
  repeat
    k:=0;
    if toleft then
    begin
      toleft:= false;
      for i:= L to r do
       if fMySGFact.EventDates[i+1].EventStart < fMySGFact.EventDates[i].EventStart then
        begin
          replaceEvent:= TFactEvent.Create(fMySGFact.EventDates[i]);
          fMySGFact.EventDates[i].Assign(fMySGFact.EventDates[i+1]);
          fMySGFact.EventDates[i+1].Assign(replaceEvent);
          FreeAndNil(replaceEvent);
          inc(k);
        end;
      dec(r);
    end;
    if toleft = false then
    begin
      toleft:= true;
      for i:= r downto l do
       if fMySGFact.EventDates[i+1].EventStart < fMySGFact.EventDates[i].EventStart then
        begin
          replaceEvent:= TFactEvent.Create(fMySGFact.EventDates[i]);
          fMySGFact.EventDates[i].Assign(fMySGFact.EventDates[i+1]);
          fMySGFact.EventDates[i+1].Assign(replaceEvent);
          FreeAndNil(replaceEvent);
          inc(k);
        end;
      inc(l);
    end;
  until k=0;
end;

procedure TfrmNagruzkaFillFactNagrByCU.SpeedButton5Click(Sender: TObject);
begin
  Panel8.Visible:= false;
  ToolButton2.Down:= false;
  ToolButton4.Down:= false;
end;

end.
