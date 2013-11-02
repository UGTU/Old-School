unit uSheduleAddExaminationWithPrefetch;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, SheduleClasses,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, SheduleController,
  DBLookupEh, DBCtrlsEh, Mask, ComCtrls, ToolWin, ImgList, Contnrs, SheduleGrids;

type
  TfrmSheduleAddExaminationWithPrefetch = class(TfrmBaseDialog)
    Label28: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbdtBeginDate: TDBDateTimeEditEh;
    Bevel4: TBevel;
    dbcbCampus: TDBLookupComboboxEh;
    dbcbExecPrep: TDBLookupComboboxEh;
    dbcbExecWorkType: TDBLookupComboboxEh;
    dbcbRoom: TDBLookupComboboxEh;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbdtStart: TDBDateTimeEditEh;
    dbdtStop: TDBDateTimeEditEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    actRefreshConflictList: TAction;
    actShowConflictList: TAction;
    ImageList1: TImageList;
    dbcbKafedra: TDBComboBoxEh;
    dbcbFormEd: TDBComboBoxEh;
    dbcbDisc: TDBComboBoxEh;
    dbcbVidZanyat: TDBComboBoxEh;
    dbcbVidNagruzki: TDBComboBoxEh;
    dbcbCalcUnit: TDBComboBoxEh;
    dbcbPlanTeacherFIO: TDBComboBoxEh;
    dbcbPlanTeacherWorkType: TDBComboBoxEh;
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label3: TLabel;
    Label39: TLabel;
    procedure dbcbRoomKeyValueChanged(Sender: TObject);
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure dbcbExecPrepKeyValueChanged(Sender: TObject);
    procedure actRefreshConflictListExecute(Sender: TObject);
    procedure actShowConflictListExecute(Sender: TObject);
    procedure actRefreshConflictListUpdate(Sender: TObject);
    procedure dbdtBeginDateChange(Sender: TObject);
    procedure actShowConflictListUpdate(Sender: TObject);
    procedure dbcbExecWorkTypeKeyValueChanged(Sender: TObject);
    procedure dbcbKafedraChange(Sender: TObject);
    procedure dbcbFormEdChange(Sender: TObject);
    procedure dbcbDiscChange(Sender: TObject);
    procedure dbcbVidZanyatChange(Sender: TObject);
    procedure dbcbVidNagruzkiChange(Sender: TObject);
    procedure dbcbCalcUnitChange(Sender: TObject);
    procedure dbcbPlanTeacherFIOChange(Sender: TObject);
    procedure dbcbPlanTeacherWorkTypeChange(Sender: TObject);
    procedure dbdtStartChange(Sender: TObject);
    procedure dbdtStopChange(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure dbcbKafedraKeyPress(Sender: TObject; var Key: Char);
  private
    fHourInNormPerEd, fMinuteInNormPerEd: word;
    fIsDepProcess: boolean;
    fFormStartClosing: boolean;
    temp: TSheduleExamination;
 //   fIsConflictOptModified: boolean;
    fExamination: TSheduleExamination;
    fShedulerGrid: TCustomExamSheduleGrid;
    conflictList: TSheduleExaminationList;
    fIsShadowModified: boolean;
    fConflictConditionsWereChanged: boolean;
  //  fRoomInConflict, fCalcUnitInConflict, fTeachersInConflict: string;
    fPrepodPlanIKList: string;
 //   procedure SetIsConflictOptModified(const Value: boolean);
 //   property IsConflictOptModified: boolean read fIsConflictOptModified write SetIsConflictOptModified;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(IsDepProcess: boolean);
    property Examination: TSheduleExamination read fExamination write fExamination;
    property ShedulerGrid: TCustomExamSheduleGrid read fShedulerGrid write fShedulerGrid;
  end;

var
  frmSheduleAddExaminationWithPrefetch: TfrmSheduleAddExaminationWithPrefetch;

implementation

uses GeneralController, NagruzkaController, DateUtils, uSheduleConflictLog;

{$R *.dfm}

{ TfrmSheduleAddExamination }

procedure CloseComboBox(AComboBox: TDBComboBoxEh);
begin
  AComboBox.ItemIndex:= -1;
  AComboBox.KeyItems.Clear;
  AComboBox.Items.Clear;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.actRefreshConflictListExecute(
  Sender: TObject);
begin
{    if (ShedulerGrid.DefaultSemLengthInfo.IsAudDateAllow(VarToDateTime(dbdtBeginDate.Value))) then
    begin
      Application.MessageBox('Дата проведения экзамена (консультации) выходит за рамки сессии!', PChar(Caption),MB_ICONWARNING);
      exit;
    end;       }
    Panel2.Top:= round((Height - Panel2.Height)/2);
    Panel2.Visible:= true;
    Refresh;
    try
      if Assigned(temp) then FreeAndNil(temp);
      temp:= TSheduleExamination.Create;
      if fExamination <> nil then
        temp.Assign(fExamination);

      temp.SheduleIK:= ShedulerGrid.SheduleIK;
      temp.KafedraIK:= StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]);
      temp.FormEdIK:= StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]);
      temp.PlanTeacherIK:= StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]);
      temp.DiscIK:= StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]);
      temp.VidZanyatIK:= StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]);
      temp.VidNagruzkiIK:= StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]);
      temp.CalcUnitIK:= StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]);
      temp.TeacherIK:= dbcbExecWorkType.KeyValue;
      temp.RoomIK:= dbcbRoom.KeyValue;     

      // времено отключим проверку конфликтов
      TSheduleController.MainFunctions.GetExamConflictList(fExamination, ShedulerGrid.SheduleIK, conflictList, dbcbExecWorkType.KeyValue, dbcbRoom.KeyValue, StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]));
      fConflictConditionsWereChanged:= false;
    //  dbcbKafedraChange(dbcbKafedra);
    finally
      Panel2.Visible:= false;
    end;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.actRefreshConflictListUpdate(
  Sender: TObject);
var
  tempBool: boolean;
begin
  (Sender as TAction).Enabled:= (dbcbPlanTeacherWorkType.ItemIndex >= 0) and (dbcbRoom.KeyValue <> NULL) and (dbcbExecWorkType.KeyValue <> NULL);
  if fIsShadowModified and (dbdtBeginDate.Value <> NULL) and (dbdtStart.Value <> NULL) and (dbdtStop.Value <> NULL) then
    IsModified:= (Sender as TAction).Enabled and (VarToDateTime(dbdtStart.Value) < VarToDateTime(dbdtStop.Value))
  else IsModified:= false;

//  (Sender as TAction).Enabled:= (dbdtBeginDate.Value <> NULL) and (dbdtStart.Value <> NULL) and (dbdtStop.Value <> NULL);

end;

procedure TfrmSheduleAddExaminationWithPrefetch.actShowConflictListExecute(Sender: TObject);
var
  tempForm: TfrmConflictEventLog;
begin
  tempForm:= TfrmConflictEventLog.CreateDialog(self, Connection, nil);
  tempForm.DrawConflictList:= conflictList;
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.actShowConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (not fConflictConditionsWereChanged) and actRefreshConflictList.Enabled and (conflictList.Count > 0);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbCalcUnitChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbPlanTeacherFIO);
  if dbcbCalcUnit.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbPlanTeacherFIO.ItemIndex:= TSheduleController.MainFunctions.GetTeacherListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        dbcbPlanTeacherFIO.KeyItems, dbcbPlanTeacherFIO.Items, TNagruzkaController.Preparation.GetTabNFromTeacherIK(fExamination.PlanTeacherIK))
    else dbcbPlanTeacherFIO.ItemIndex:= TSheduleController.MainFunctions.GetTeacherListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        dbcbPlanTeacherFIO.KeyItems, dbcbPlanTeacherFIO.Items, -1);
    if (fIsDepProcess) and (fExamination = nil) and  (dbcbPlanTeacherFIO.ItemIndex < 0) then
      dbcbPlanTeacherFIO.ItemIndex:= dbcbPlanTeacherFIO.KeyItems.IndexOf(IntToStr(IK));
  end;
  dbcbPlanTeacherFIO.Enabled:= dbcbCalcUnit.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbCampusKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbRoom);
  if (dbcbCampus.KeyValue <> NULL) then
  begin
    if fExamination <> nil then
      dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, '', fExamination.RoomIK)
    else dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, '', lastValue);
  end;
  dbcbRoom.Enabled:= dbcbCampus.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbDiscChange(Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbVidZanyat);
  if dbcbDisc.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbVidZanyat.ItemIndex:= TSheduleController.MainFunctions.GetVidZanyatListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), dbcbVidZanyat.KeyItems, dbcbVidZanyat.Items, fExamination.VidZanyatIK)
    else dbcbVidZanyat.ItemIndex:= TSheduleController.MainFunctions.GetVidZanyatListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), dbcbVidZanyat.KeyItems, dbcbVidZanyat.Items, -1);
  end;
  dbcbVidZanyat.Enabled:= dbcbDisc.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbExecPrepKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbExecWorkType);
  if dbcbExecPrep.KeyValue <> NULL then
  begin
    if fExamination <> nil then
      dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), ShedulerGrid.DefaultSemLengthInfo.MinSessionStart, '', fExamination.TeacherIK)
    else dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), ShedulerGrid.DefaultSemLengthInfo.MinSessionStart, '', lastValue);
  end;
  dbcbExecWorkType.Enabled:= dbcbExecPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbExecWorkTypeKeyValueChanged(
  Sender: TObject);
begin
//  if (dbcbPlanWorkType.KeyValue = NULL) and (dbcbExecWorkType.KeyValue <> NULL) then
//    dbcbPlanWorkType.KeyValue:= dbcbExecWorkType.KeyValue;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbFormEdChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbDisc);
  if dbcbFormEd.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbDisc.ItemIndex:= TSheduleController.MainFunctions.GetDiscListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]), dbcbDisc.KeyItems, dbcbDisc.Items, fExamination.DiscIK)
    else dbcbDisc.ItemIndex:= TSheduleController.MainFunctions.GetDiscListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]), dbcbDisc.KeyItems, dbcbDisc.Items, -1);
  end;
  dbcbDisc.Enabled:= dbcbFormEd.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbKafedraChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbExecPrep);
  CloseComboBox(dbcbFormEd);
  if dbcbKafedra.ItemIndex >= 0 then
  begin
    TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbExecPrep.ListSource.DataSet, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]));
    if fIsDepProcess then
    begin
      dbcbExecPrep.KeyValue:= IK;
      dbcbExecPrep.Enabled:= false;
    end
    else
    begin
      if fExamination <> nil then
        dbcbExecPrep.KeyValue:= fExamination.TabN;
    end;
    if fExamination <> nil then
      dbcbFormEd.ItemIndex:= TSheduleController.MainFunctions.GetFormEdListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbFormEd.KeyItems, dbcbFormEd.Items, fExamination.FormEdIK)
    else dbcbFormEd.ItemIndex:= TSheduleController.MainFunctions.GetFormEdListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbFormEd.KeyItems, dbcbFormEd.Items, -1);
  end;
  if not fIsDepProcess then
    dbcbFormEd.Enabled:= dbcbKafedra.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbKafedraKeyPress(
  Sender: TObject; var Key: Char);
var
  i,n: integer;
  tempStr: string;
begin
  if Key in [#8, #46, #37, #39, #9] then exit;
  tempStr:= Copy((Sender as TDBComboBoxEh).Text, 1, (Sender as TDBComboBoxEh).SelStart);
  for I := 0 to (Sender as TDBComboBoxEh).Items.Count - 1 do
    if Pos(tempStr + Key, Copy((Sender as TDBComboBoxEh).Items[i], 1, (Sender as TDBComboBoxEh).SelStart + 1)) <> 0 then
    begin
      n:= (Sender as TDBComboBoxEh).SelStart;
      if (Sender as TDBComboBoxEh).ItemIndex <> i then (Sender as TDBComboBoxEh).ItemIndex:= i;
      (Sender as TDBComboBoxEh).SelStart:= n + 1;
      Key:= #0;
      exit;
    end;
  Key:= #0;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbPlanTeacherFIOChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbPlanTeacherWorkType);
  if dbcbPlanTeacherFIO.ItemIndex >= 0 then
  begin
    if (not fIsDepProcess) and (fExamination = nil) and (dbcbExecPrep.KeyValue = NULL) then
      dbcbExecPrep.KeyValue:= StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]);
    if fExamination <> nil then
      dbcbPlanTeacherWorkType.ItemIndex:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]), dbcbPlanTeacherWorkType.KeyItems, dbcbPlanTeacherWorkType.Items, fExamination.PlanTeacherIK)
    else dbcbPlanTeacherWorkType.ItemIndex:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]), dbcbPlanTeacherWorkType.KeyItems, dbcbPlanTeacherWorkType.Items, -1);
  end;
  dbcbPlanTeacherWorkType.Enabled:= dbcbPlanTeacherFIO.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbPlanTeacherWorkTypeChange(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCampus);
  if dbcbPlanTeacherWorkType.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIKFromPrefetch(@dbcbCampus.ListSource.DataSet, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]), fPrepodPlanIKList, TSheduleController.MainFunctions.GetCampusFromRoom(fExamination.RoomIK))
    else dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIKFromPrefetch(@dbcbCampus.ListSource.DataSet, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]), fPrepodPlanIKList, lastValue);

    if (fExamination = nil) and (dbcbExecWorkType.KeyValue = NULL) and (StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]) = dbcbExecPrep.KeyValue) then
      dbcbExecWorkType.KeyValue:= StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]);
  end;
  dbcbCampus.Enabled:= dbcbPlanTeacherWorkType.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbRoomKeyValueChanged(Sender: TObject);
begin
  fIsShadowModified:= true;
  fConflictConditionsWereChanged:= true;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbVidNagruzkiChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbCalcUnit);
  if dbcbVidNagruzki.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbCalcUnit.ItemIndex:= TSheduleController.MainFunctions.GetCalcUnitListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), dbcbCalcUnit.KeyItems, dbcbCalcUnit.Items, fExamination.CalcUnitIK)
    else dbcbCalcUnit.ItemIndex:= TSheduleController.MainFunctions.GetCalcUnitListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), dbcbCalcUnit.KeyItems, dbcbCalcUnit.Items, -1);
  end;
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbcbVidZanyatChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbVidNagruzki);
  if dbcbVidZanyat.ItemIndex >= 0 then
  begin
    if fExamination <> nil then
      dbcbVidNagruzki.ItemIndex:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), dbcbVidNagruzki.KeyItems, dbcbVidNagruzki.Items, fExamination.VidNagruzkiIK)
    else dbcbVidNagruzki.ItemIndex:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), dbcbVidNagruzki.KeyItems, dbcbVidNagruzki.Items, -1);
  end;
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbdtBeginDateChange(Sender: TObject);
begin
  if Self.Showing then
    fIsShadowModified:= true;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbdtStartChange(
  Sender: TObject);
var
  h, m, s, ms: word;
begin
  if dbdtStart.Value <> NULL then
  begin
    DecodeTime(dbdtStart.Value, h, m, s, ms);
    if (m + fMinuteInNormPerEd >= 60) then
    begin
      inc(h);
      m:= m + fMinuteInNormPerEd - 60;
    end;
    if (h+fHourInNormPerEd < 24) then
      dbdtStop.Value:= EncodeTime(h+fHourInNormPerEd, m, s, ms);
  end;
  if Self.Showing then
    fIsShadowModified:= true;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.dbdtStopChange(Sender: TObject);
var
  h, m, s, ms: word;
begin
  if dbdtStop.Value <> NULL then
  begin
    DecodeTime(dbdtStop.Value, h, m, s, ms);
    if (m - fMinuteInNormPerEd < 0) then
    begin
      dec(h);
      m:= 60 + (m - fMinuteInNormPerEd);
    end;
    if (h-fHourInNormPerEd >= 0) then
      dbdtStart.Value:= EncodeTime(h-fHourInNormPerEd, m, s, ms);
  end;
  if Self.Showing then
    fIsShadowModified:= true;
end;

destructor TfrmSheduleAddExaminationWithPrefetch.Destroy;
begin
  fFormStartClosing:= true;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRoom);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCampus);
  TSheduleController.MainFunctions.ClearPrefetchPlanNagr;
  if temp <> nil then FreeAndNil(temp);
  if conflictList <> nil then conflictList.Free;
  inherited;
end;

function TfrmSheduleAddExaminationWithPrefetch.DoApply: boolean;
var
  y,m,d,h,min,s,ms: word;
begin
 { if fPrepodPlanIKList = '' then
  begin
    Application.MessageBox('Перед началом сохранения экзамена (консультации) необходимо указать все параметры!', PChar(Caption), MB_ICONWARNING);
    Result:= false;
    exit;
  end;  }
  Panel2.Top:= round((Height - Panel2.Height)/2);
  Panel2.Visible:= true;
  Refresh;
  try
    if fConflictConditionsWereChanged then    
      actRefreshConflictListExecute(actRefreshConflictList);

    temp.ExamDate:= dbdtBeginDate.Value;
    DecodeDate(dbdtBeginDate.Value, y,m,d);
    DecodeTime(dbdtStart.Value, h,min,s,ms);
    temp.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(dbdtStop.Value, h,min,s,ms);
    temp.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);

    if TSheduleController.MainFunctions.CheckExamForConflict(temp, conflictList) then
    begin
      Application.MessageBox('Происходит одновременное выполнение данного экзамена/консультации и одного из обнаруженных конфликтов, список которых можно просмотреть нажав на кнопку "Список конфликтов"!', PChar(Caption), MB_ICONWARNING);
      exit;
    end;

    if TSheduleController.MainFunctions.CheckPrepodSessionTimeConstraint(ShedulerGrid.SheduleIK, temp) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данный преподаватель не может проводить занятие в указанное время!', PChar(Caption), MB_ICONWARNING);
      Result:= false;
      exit;
    end;
    if not TSheduleController.MainFunctions.CheckRoomUseConstraint(fPrepodPlanIKList, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbRoom.KeyValue) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данное занятие не может проводиться в указанной аудитории!', PChar(Caption), MB_ICONWARNING);
      Result:= false;
      exit;
    end;

    Result:= TSheduleController.MainFunctions.SaveExam(temp, fExamination, ShedulerGrid, fPrepodPlanIKList);
    if Result then fIsShadowModified:= false;
  finally
    Panel2.Visible:= false;
  end;
end;

function TfrmSheduleAddExaminationWithPrefetch.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Label17MouseEnter(
  Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Label17MouseLeave(
  Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Label3MouseEnter(
  Sender: TObject);
begin
  Label3.Font.Style:= Label3.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Label3MouseLeave(
  Sender: TObject);
begin
  Label3.Font.Style:= Label3.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddExaminationWithPrefetch.Read(IsDepProcess: boolean);
begin
  fHourInNormPerEd:= 2;
  fMinuteInNormPerEd:= 0;
  fFormStartClosing:= true;
  dbcbKafedra.ItemIndex:= -1;
  dbcbFormEd.ItemIndex:= -1;
  dbcbDisc.ItemIndex:= -1;
  dbcbVidZanyat.ItemIndex:= -1;
  dbcbVidNagruzki.ItemIndex:= -1;
  dbcbCalcUnit.ItemIndex:= -1;
  dbcbPlanTeacherFIO.ItemIndex:= -1;
  dbcbPlanTeacherWorkType.ItemIndex:= -1;
  fFormStartClosing:= false;
  fConflictConditionsWereChanged:= false;
  fIsDepProcess:= IsDepProcess;
  conflictList:= TSheduleExaminationList.Create;
  fIsShadowModified:= false;
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRoom, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecWorkType, 'ik_id_prepod', 'full_work_type_name');

  if fIsDepProcess then
    TSheduleController.MainFunctions.LoadPlanNagrForTeacherToPrefetch(TDepExamSheduleGrid(ShedulerGrid).KafedraIK, ShedulerGrid.SheduleIK, false)
  else TSheduleController.MainFunctions.LoadPlanNagrForGroupToPrefetch(IK, ShedulerGrid.SheduleIK, false);

  if Examination <> nil then
  begin
    Caption:= 'Изменить информацию об экзамене/консультации';
    dbcbKafedra.ItemIndex:= TSheduleController.MainFunctions.GetDepartmentListForAddEventFromPrefetch(dbcbKafedra.KeyItems, dbcbKafedra.Items, fExamination.KafedraIK);
    dbdtBeginDate.Value:= fExamination.ExamDate;
    dbdtStart.Value:= fExamination.Start;
    dbdtStop.Value:= fExamination.Stop;

{    actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);  }

    fIsShadowModified:= false;
  //  fConflictConditionsWereChanged:= false;

   { dbcbFormEd.KeyValue:= fExamination.FormEdIK;
    dbcbPlanPrep.KeyValue:= TNagruzkaController.Instance.GetTabNFromTeacherIK(fExamination.PlanTeacherIK);
    dbcbPlanWorkType.KeyValue:= fExamination.PlanTeacherIK;
    dbcbDisc.KeyValue:= fExamination.DiscIK;
    dbcbPotok.KeyValue:= TNagruzkaController.Instance.GetPotokFromShema(fExamination.CalcUnitIK);
    dbcbVidZanyat.KeyValue:= fExamination.VidZanyatIK;
    dbcbVidNagruzki.KeyValue:= fExamination.VidNagruzkiIK;
    dbcbCalcUnit.KeyValue:= fExamination.CalcUnitIK;
    dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusFromRoom(fExamination.RoomIK);
    dbcbRoom.KeyValue:= fExamination.RoomIK;
    dbcbExecPrep.KeyValue:= fExamination.TabN;
    dbcbExecWorkType.KeyValue:= fExamination.TeacherIK;   }
  end
  else
  begin
    Caption:= 'Добавить экзамен/консультацию';
    dbcbKafedra.ItemIndex:= TSheduleController.MainFunctions.GetDepartmentListForAddEventFromPrefetch(dbcbKafedra.KeyItems, dbcbKafedra.Items, -1);
    dbdtBeginDate.Value:= ShedulerGrid.DefaultSemLengthInfo.SessionStart + ShedulerGrid.DayIndex;
    dbdtStart.Value:= ShedulerGrid.DefaultSemLengthInfo.WorkTimeStart;
    dbdtStop.Value:= ShedulerGrid.DefaultSemLengthInfo.WorkTimeStart + EncodeTime(2, 0, 0, 0);

   { actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);}

  end;

end;

{
procedure TfrmSheduleAddExaminationWithPrefetch.SetIsConflictOptModified(
  const Value: boolean);
begin
  fIsConflictOptModified := Value;
  if not fIsDepProcess then
  begin
    dbcbKafedra.Enabled:= not fIsConflictOptModified;
    dbcbExecPrep.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= dbcbExecPrep.Enabled and (dbcbExecPrep.KeyValue <> NULL);
    dbcbFormEd.Enabled:= dbcbKafedra.Enabled and (dbcbKafedra.ItemIndex >= 0);
  end
  else
  begin
    dbcbFormEd.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= not fIsConflictOptModified;
  end;

  dbcbDisc.Enabled:= dbcbFormEd.Enabled and (dbcbFormEd.ItemIndex >= 0);
  dbcbVidZanyat.Enabled:= dbcbDisc.Enabled and (dbcbDisc.ItemIndex >= 0);
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.Enabled and (dbcbVidZanyat.ItemIndex >= 0);
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.Enabled and (dbcbVidNagruzki.ItemIndex >= 0);
  dbcbPlanTeacherFIO.Enabled:= dbcbCalcUnit.Enabled and (dbcbCalcUnit.ItemIndex >= 0);
  dbcbPlanTeacherWorkType.Enabled:= dbcbPlanTeacherFIO.Enabled and (dbcbPlanTeacherFIO.ItemIndex >= 0);
  dbcbCampus.Enabled:= dbcbPlanTeacherWorkType.Enabled and (dbcbPlanTeacherWorkType.ItemIndex >= 0);
  dbcbRoom.Enabled:= dbcbCampus.Enabled and (dbcbCampus.KeyValue <> NULL);
end;     }

end.
