unit uSheduleAddExamination;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, SheduleClasses,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, SheduleController,
  DBLookupEh, DBCtrlsEh, Mask, ComCtrls, ToolWin, ImgList, Contnrs, SheduleGrids;

type
  TfrmSheduleAddExamination = class(TfrmBaseDialog)
    Label28: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbdtBeginDate: TDBDateTimeEditEh;
    Bevel4: TBevel;
    dbcbCalcUnit: TDBLookupComboboxEh;
    dbcbCampus: TDBLookupComboboxEh;
    dbcbDisc: TDBLookupComboboxEh;
    dbcbExecPrep: TDBLookupComboboxEh;
    dbcbExecWorkType: TDBLookupComboboxEh;
    dbcbFormEd: TDBLookupComboboxEh;
    dbcbKaf: TDBLookupComboboxEh;
    dbcbPlanPrep: TDBLookupComboboxEh;
    dbcbPlanWorkType: TDBLookupComboboxEh;
    dbcbPotok: TDBLookupComboboxEh;
    dbcbRoom: TDBLookupComboboxEh;
    dbcbVidNagruzki: TDBLookupComboboxEh;
    dbcbVidZanyat: TDBLookupComboboxEh;
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
    Label4: TLabel;
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
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    procedure dbcbKafKeyValueChanged(Sender: TObject);
    procedure dbcbRoomKeyValueChanged(Sender: TObject);
    procedure dbcbFormEdKeyValueChanged(Sender: TObject);
    procedure dbcbPlanPrepKeyValueChanged(Sender: TObject);
    procedure dbcbPlanWorkTypeKeyValueChanged(Sender: TObject);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure dbcbPotokKeyValueChanged(Sender: TObject);
    procedure dbcbVidZanyatKeyValueChanged(Sender: TObject);
    procedure dbcbVidNagruzkiKeyValueChanged(Sender: TObject);
    procedure dbcbCalcUnitKeyValueChanged(Sender: TObject);
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure dbcbExecPrepKeyValueChanged(Sender: TObject);
    procedure actRefreshConflictListExecute(Sender: TObject);
    procedure actShowConflictListExecute(Sender: TObject);
    procedure actRefreshConflictListUpdate(Sender: TObject);
    procedure dbdtBeginDateChange(Sender: TObject);
    procedure actShowConflictListUpdate(Sender: TObject);
    procedure dbcbExecWorkTypeKeyValueChanged(Sender: TObject);
  private
    fIsDepProcess: boolean;
    fFormStartClosing: boolean;
    temp: TSheduleExamination;
    fIsConflictOptModified: boolean;
    fExamination: TSheduleExamination;
    fShedulerGrid: TCustomExamSheduleGrid;
    conflictList: TSheduleExaminationList;
    IsShadowModified: boolean;
    fRoomInConflict, fCalcUnitInConflict, fTeachersInConflict: string;
    fPlanNagrIKList, fContentPlanNagrIKList, fPrepodPlanIKList: string;
    procedure SetIsConflictOptModified(const Value: boolean);
    property IsConflictOptModified: boolean read fIsConflictOptModified write SetIsConflictOptModified;
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
  frmSheduleAddExamination: TfrmSheduleAddExamination;

implementation

uses GeneralController, NagruzkaController, DateUtils, uSheduleConflictLog;

{$R *.dfm}

{ TfrmSheduleAddExamination }

procedure TfrmSheduleAddExamination.actRefreshConflictListExecute(
  Sender: TObject);
var
  y,m,d,h,min,s,ms: word;
begin
  if IsConflictOptModified then
  begin
    if (ShedulerGrid.DefaultSemLengthInfo.IsAudDateAllow(VarToDateTime(dbdtBeginDate.Value))) then
    begin
      Application.MessageBox('Дата проведения экзамена (консультации) выходит за рамки сессии!', PChar(Caption),MB_ICONWARNING);
      exit;
    end;
    Panel2.Top:= round((Height - Panel2.Height)/2);
    Panel2.Visible:= true;
    Refresh;
    try
      if Assigned(temp) then FreeAndNil(temp);
      temp:= TSheduleExamination.Create;
      temp.ExamDate:= dbdtBeginDate.Value;
      DecodeDate(dbdtBeginDate.Value, y,m,d);
      DecodeTime(dbdtStart.Value, h,min,s,ms);
      temp.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
      DecodeTime(dbdtStop.Value, h,min,s,ms);
      temp.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
      if fExamination <> nil then
        temp.ExamIK:= fExamination.ExamIK;

      // времено отключим проверку конфликтов
      fCalcUnitInConflict:= '';
      fTeachersInConflict:= '';
      fRoomInConflict:= '';
//      TSheduleController.Instance.GetExamConflictList(temp, ShedulerGrid.SheduleIK, conflictList, fCalcUnitInConflict, fTeachersInConflict, fRoomInConflict);
      IsConflictOptModified:= false;
      dbcbKafKeyValueChanged(dbcbKaf);
      Panel2.Visible:= false;
    except
      Panel2.Visible:= false;
      raise;
    end;
  end;
end;

procedure TfrmSheduleAddExamination.actRefreshConflictListUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbdtBeginDate.Value <> NULL) and (dbdtStart.Value <> NULL) and (dbdtStop.Value <> NULL);
  IsModified:= IsShadowModified and (not fIsConflictOptModified) and (Sender as TAction).Enabled;
end;

procedure TfrmSheduleAddExamination.actShowConflictListExecute(Sender: TObject);
var
  tempForm: TfrmConflictEventLog;
begin
  tempForm:= TfrmConflictEventLog.CreateDialog(self, Connection, nil);
  tempForm.DrawConflictList:= conflictList;
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmSheduleAddExamination.actShowConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= actRefreshConflictList.Enabled and (conflictList.Count > 0);
end;

procedure TfrmSheduleAddExamination.dbcbCalcUnitKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCampus);
  if (dbcbCalcUnit.KeyValue <> NULL) and (fContentPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIK(@dbcbCampus.ListSource.DataSet, dbcbCalcUnit.KeyValue, ShedulerGrid.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, TSheduleController.MainFunctions.GetCampusFromRoom(fExamination.RoomIK))
    else dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIK(@dbcbCampus.ListSource.DataSet, dbcbCalcUnit.KeyValue, ShedulerGrid.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, lastValue)
  end;
  dbcbCampus.Enabled:= dbcbCalcUnit.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbCampusKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbRoom);
  if (dbcbCampus.KeyValue <> NULL) and (fPrepodPlanIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, fRoomInConflict, fExamination.RoomIK)
    else dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, fRoomInConflict, lastValue);
  end;
  dbcbRoom.Enabled:= dbcbCampus.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbDiscKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbPotok);
  if (dbcbDisc.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbPotok.KeyValue:= TSheduleController.MainFunctions.GetPotokListForAddEvent(@dbcbPotok.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, TNagruzkaController.Preparation.GetPotokFromShema(fExamination.CalcUnitIK))
    else dbcbPotok.KeyValue:= TSheduleController.MainFunctions.GetPotokListForAddEvent(@dbcbPotok.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, lastValue);
  end;
  dbcbPotok.Enabled:= dbcbDisc.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbExecPrepKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbExecWorkType);
  if dbcbExecPrep.KeyValue <> NULL then
  begin
    if fExamination <> nil then
      dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, dbcbKaf.KeyValue, ShedulerGrid.DefaultSemLengthInfo.MinSessionStart, fTeachersInConflict, fExamination.TeacherIK)
    else dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, dbcbKaf.KeyValue, ShedulerGrid.DefaultSemLengthInfo.MinSessionStart, fTeachersInConflict, lastValue);
  end;
  dbcbExecWorkType.Enabled:= dbcbExecPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbExecWorkTypeKeyValueChanged(
  Sender: TObject);
begin
//  if (dbcbPlanWorkType.KeyValue = NULL) and (dbcbExecWorkType.KeyValue <> NULL) then
//    dbcbPlanWorkType.KeyValue:= dbcbExecWorkType.KeyValue;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbFormEdKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbPlanPrep);
  if dbcbFormEd.KeyValue <> NULL then
  begin
    if fExamination <> nil then
      dbcbPlanPrep.KeyValue:= TSheduleController.MainFunctions.GetTeacherListForAddEvent(@dbcbPlanPrep.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbFormEd.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, TNagruzkaController.Preparation.GetTabNFromTeacherIK(fExamination.PlanTeacherIK))
    else dbcbPlanPrep.KeyValue:= TSheduleController.MainFunctions.GetTeacherListForAddEvent(@dbcbPlanPrep.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbFormEd.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, lastValue);
    if (fIsDepProcess) and (dbcbPlanPrep.KeyValue = NULL) then
      dbcbPlanPrep.KeyValue:= IK;
  end;
  dbcbPlanPrep.Enabled:= dbcbFormEd.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbKafKeyValueChanged(Sender: TObject);
var
  lastFEValue, lastTValue: Variant;
begin
  if fFormStartClosing then exit;
  lastTValue:= TGeneralController.Instance.CloseLockupCB(@dbcbExecPrep);
  lastFEValue:= TGeneralController.Instance.CloseLockupCB(@dbcbFormEd);
  if dbcbKaf.KeyValue <> NULL then
  begin
    if fExamination <> nil then
      dbcbFormEd.KeyValue:= TSheduleController.MainFunctions.GetFormEdListForAddEvent(@dbcbFormEd.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, fIsDepProcess, false, false, fExamination.FormEdIK)
    else dbcbFormEd.KeyValue:= TSheduleController.MainFunctions.GetFormEdListForAddEvent(@dbcbFormEd.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, fIsDepProcess, false, false, lastFEValue);
    TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbExecPrep.ListSource.DataSet, dbcbKaf.KeyValue, );
    if fIsDepProcess then
      dbcbExecPrep.KeyValue:= IK
    else
    begin
      if fExamination <> nil then
        dbcbExecPrep.KeyValue:= fExamination.TabN
      else dbcbExecPrep.KeyValue:= lastTValue;
    end;
  end;
  if not fIsDepProcess then
    dbcbFormEd.Enabled:= dbcbKaf.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbPlanPrepKeyValueChanged(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  if (dbcbPlanPrep.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    dbcbPlanWorkType.KeyValue:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEvent(@dbcbPlanWorkType.ListSource.DataSet, IK, dbcbPlanPrep.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, TGeneralController.Instance.CloseLockupCB(@dbcbPlanWorkType));
    if (dbcbExecWorkType.KeyValue <> NULL) and (fIsDepProcess) and (fExamination = nil) and (dbcbPlanWorkType.KeyValue = NULL) then
      dbcbPlanWorkType.KeyValue:= dbcbExecWorkType.KeyValue;
    if (not fIsDepProcess) and (fExamination = nil) and (dbcbExecPrep.KeyValue = NULL) then
      dbcbExecPrep.KeyValue:= dbcbPlanPrep.KeyValue;
  end
  else TGeneralController.Instance.CloseLockupCB(@dbcbPlanWorkType);
  dbcbPlanWorkType.Enabled:= dbcbPlanPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbPlanWorkTypeKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbDisc);
  if (dbcbPlanWorkType.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbDisc.KeyValue:= TSheduleController.MainFunctions.GetDiscListForAddEvent(@dbcbDisc.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, fExamination.DiscIK)
    else dbcbDisc.KeyValue:= TSheduleController.MainFunctions.GetDiscListForAddEvent(@dbcbDisc.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, fPlanNagrIKList, fIsDepProcess, false, false, lastValue);
    if (fExamination = nil) and (dbcbExecWorkType.KeyValue = NULL) then
      dbcbExecWorkType.KeyValue:= dbcbPlanWorkType.KeyValue;
  end;
  dbcbDisc.Enabled:= dbcbPlanWorkType.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbPotokKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbVidZanyat);
  if (dbcbPotok.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbVidZanyat.KeyValue:= TSheduleController.MainFunctions.GetVidZanyatListForAddEvent(@dbcbVidZanyat.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue,
        dbcbPotok.KeyValue, fPlanNagrIKList, false, false, fExamination.VidZanyatIK)
    else  dbcbVidZanyat.KeyValue:= TSheduleController.MainFunctions.GetVidZanyatListForAddEvent(@dbcbVidZanyat.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue,
        dbcbPotok.KeyValue, fPlanNagrIKList, false, false, lastValue);
  end;
  dbcbVidZanyat.Enabled:= dbcbPotok.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbRoomKeyValueChanged(Sender: TObject);
begin
  IsShadowModified:= (dbcbCalcUnit.KeyValue <> NULL) and (dbcbRoom.KeyValue <> NULL) and (dbcbExecWorkType.KeyValue <> NULL) and (dbdtStart.Value <> NULL) and (dbdtStop.Value <> NULL);
  if IsShadowModified then
    IsShadowModified:= VarToDateTime(dbdtStart.Value) < VarToDateTime(dbdtStop.Value);
end;

procedure TfrmSheduleAddExamination.dbcbVidNagruzkiKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCalcUnit);
  if (dbcbVidNagruzki.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbCalcUnit.KeyValue:= TSheduleController.MainFunctions.GetCalcUnitListForAddEvent(@dbcbCalcUnit.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fCalcUnitInConflict, fContentPlanNagrIKList, fIsDepProcess, false, fExamination.CalcUnitIK)
    else dbcbCalcUnit.KeyValue:= TSheduleController.MainFunctions.GetCalcUnitListForAddEvent(@dbcbCalcUnit.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fCalcUnitInConflict, fContentPlanNagrIKList, fIsDepProcess, false, lastValue);
  end;
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddExamination.dbcbVidZanyatKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbVidNagruzki);
  if (dbcbVidZanyat.KeyValue <> NULL) and (fPlanNagrIKList <> '') then
  begin
    if fExamination <> nil then
      dbcbVidNagruzki.KeyValue:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEvent(@dbcbVidNagruzki.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, fPlanNagrIKList, false, fExamination.VidNagruzkiIK)
    else dbcbVidNagruzki.KeyValue:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEvent(@dbcbVidNagruzki.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, fPlanNagrIKList, false, lastValue);
  end;
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.KeyValue <> NULL;
end;

procedure TfrmSheduleAddExamination.dbdtBeginDateChange(Sender: TObject);
begin
  IsConflictOptModified:= true;
end;

destructor TfrmSheduleAddExamination.Destroy;
begin
  fFormStartClosing:= true;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRoom);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCampus);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCalcUnit);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbVidNagruzki);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbVidZanyat);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPotok);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPlanWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPlanPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbFormEd);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbKaf);
  if temp <> nil then FreeAndNil(temp);
  if conflictList <> nil then conflictList.Free;
  inherited;
end;

function TfrmSheduleAddExamination.DoApply: boolean;
begin
  if fPrepodPlanIKList = '' then
  begin
    Application.MessageBox('Перед началом сохранения экзамена (консультации) необходимо указать все параметры!', PChar(Caption), MB_ICONWARNING);
    Result:= false;
    exit;
  end;
  Panel2.Top:= round((Height - Panel2.Height)/2);
  Panel2.Visible:= true;
  Refresh;
  try
    temp.KafedraIK:= dbcbKaf.KeyValue;
    temp.FormEdIK:= dbcbFormEd.KeyValue;
    temp.PlanTeacherIK:= dbcbPlanWorkType.KeyValue;
    temp.DiscIK:= dbcbDisc.KeyValue;
    temp.VidZanyatIK:= dbcbVidZanyat.KeyValue;
    temp.VidNagruzkiIK:= dbcbVidNagruzki.KeyValue;
    temp.CalcUnitIK:= dbcbCalcUnit.KeyValue;
    temp.TeacherIK:= dbcbExecWorkType.KeyValue;
    temp.RoomIK:= dbcbRoom.KeyValue;

    if TSheduleController.MainFunctions.CheckPrepodSessionTimeConstraint(ShedulerGrid.SheduleIK, temp) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данный преподаватель не может проводить занятие в указанное время!', PChar(Caption), MB_ICONWARNING);
      Result:= false;
      exit;
    end;
    if not TSheduleController.MainFunctions.CheckRoomUseConstraint(fPrepodPlanIKList, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbRoom.KeyValue) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данное занятие не может проводиться в указанной аудитории!', PChar(Caption), MB_ICONWARNING);
      Result:= false;
      exit;
    end;

    Result:= TSheduleController.MainFunctions.SaveExam(temp, fExamination, ShedulerGrid, fPrepodPlanIKList);
    if Result then IsShadowModified:= false;    
  finally
    Panel2.Visible:= false;
  end;
end;

function TfrmSheduleAddExamination.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmSheduleAddExamination.Read(IsDepProcess: boolean);
begin
  fFormStartClosing:= false;
  fIsDepProcess:= IsDepProcess;
  conflictList:= TSheduleExaminationList.Create;
  IsShadowModified:= false;
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'cName_kaf');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'Ik_form_ed', 'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanWorkType, 'ik_id_prepod', 'Cname_work_type');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotok, 'ik_potok', 'Cname_potok');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'Cname_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZanyat, 'iK_vid_zanyat', 'cName_vid_zanyat');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidNagruzki, 'ik_vid_nagruzki', 'Cname_vid_nagruzki');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCalcUnit, 'ik_calc_unit', 'cName_calc_unit');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRoom, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecWorkType, 'ik_id_prepod', 'Cname_work_type');
  TSheduleController.MainFunctions.GetDepartmentListForAddEvent(@dbcbKaf.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, fIsDepProcess, false, false);
  if Examination <> nil then
  begin
    Caption:= 'Изменить информацию об экзамене';
    dbdtBeginDate.Value:= fExamination.ExamDate;
    dbdtStart.Value:= fExamination.Start;
    dbdtStop.Value:= fExamination.Stop;
    actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);
    dbcbKaf.KeyValue:= fExamination.KafedraIK;
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
    Caption:= 'Добавить экзамен';
    dbdtBeginDate.Value:= ShedulerGrid.DefaultSemLengthInfo.MinSessionStart + ShedulerGrid.DayIndex;
    dbdtStart.Value:= ShedulerGrid.DefaultSemLengthInfo.WorkTimeStart;
    dbdtStop.Value:= ShedulerGrid.DefaultSemLengthInfo.WorkTimeStart + EncodeTime(2, 0, 0, 0);
    actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);
    if fIsDepProcess then
    begin
      dbcbKaf.KeyValue:= TDepExamSheduleGrid(ShedulerGrid).KafedraIK;
      dbcbKaf.Enabled:= false;
      dbcbExecPrep.KeyValue:= IK;
      dbcbExecPrep.Enabled:= false;
    end;
  end;     
  IsShadowModified:= false;
end;

procedure TfrmSheduleAddExamination.SetIsConflictOptModified(
  const Value: boolean);
begin
  fIsConflictOptModified := Value;
  if not fIsDepProcess then
  begin
    dbcbKaf.Enabled:= not fIsConflictOptModified;
    dbcbExecPrep.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= dbcbExecPrep.Enabled and (dbcbExecPrep.KeyValue <> NULL);
    dbcbFormEd.Enabled:= dbcbKaf.Enabled and (dbcbKaf.KeyValue <> NULL);
  end
  else
  begin
    dbcbFormEd.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= not fIsConflictOptModified;
  end;

  dbcbPlanPrep.Enabled:= dbcbFormEd.Enabled and (dbcbFormEd.KeyValue <> NULL);
  dbcbPlanWorkType.Enabled:= dbcbPlanPrep.Enabled and (dbcbPlanPrep.KeyValue <> NULL);
  dbcbDisc.Enabled:= dbcbPlanWorkType.Enabled and (dbcbPlanWorkType.KeyValue <> NULL);
  dbcbPotok.Enabled:= dbcbDisc.Enabled and (dbcbDisc.KeyValue <> NULL);
  dbcbVidZanyat.Enabled:= dbcbPotok.Enabled and (dbcbPotok.KeyValue <> NULL);
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.Enabled and (dbcbVidZanyat.KeyValue <> NULL);
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.Enabled and (dbcbVidNagruzki.KeyValue <> NULL);
  dbcbCampus.Enabled:= dbcbCalcUnit.Enabled and (dbcbCalcUnit.KeyValue <> NULL);
  dbcbRoom.Enabled:= dbcbCampus.Enabled and (dbcbCampus.KeyValue <> NULL);
end;

end.
