unit uSheduleSemester;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, Mask, DBCtrlsEh, ActnList, ImgList, ADODB, DB, DBLookupEh;

type
  TfmSheduleSemester = class(TfmBase)
    ImageList1: TImageList;
    ActionList1: TActionList;
    actSLSaveChanges: TAction;
    actSLUndoChanges: TAction;
    dsFaculties: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel4: TPanel;
    ToolBar4: TToolBar;
    BitBtn1: TToolButton;
    BitBtn2: TToolButton;
    DBGridEh1: TDBGridEh;
    Label11: TLabel;
    Label6: TLabel;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbdtSemesterStop: TDBDateTimeEditEh;
    dbdtSessionStop: TDBDateTimeEditEh;
    dbdtSessionStart: TDBDateTimeEditEh;
    dbdtWorkTimeStop: TDBDateTimeEditEh;
    dbdtWorkTimeStart: TDBDateTimeEditEh;
    dbdtSemesterStart: TDBDateTimeEditEh;
    dsSemLengthException: TDataSource;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    actAddLengthException: TAction;
    actDelLengthException: TAction;
    actLoadExceptionsAvto: TAction;
    Bevel6: TBevel;
    tsScheduleSearch: TTabSheet;
    Panel5: TPanel;
    actStartSearchEvents: TAction;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Splitter1: TSplitter;
    DBGridEh3: TDBGridEh;
    Label20: TLabel;
    DBGridEh4: TDBGridEh;
    dsFoundEvents: TDataSource;
    dsFoundExams: TDataSource;
    Panel10: TPanel;
    Image1: TImage;
    Label23: TLabel;
    Label24: TLabel;
    Panel11: TPanel;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    Panel6: TPanel;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    actStartSearchExams: TAction;
    dbcbSearchCampusEvents: TDBLookupComboboxEh;
    dbcbSearchGroupEvents: TDBLookupComboboxEh;
    dbcbSearchNumberEvents: TDBLookupComboboxEh;
    dbcbSearchPart: TDBLookupComboboxEh;
    dbcbSearchPrepEvents: TDBLookupComboboxEh;
    dbcbSearchTypeEvents: TDBComboBoxEh;
    dbdtSearchDateEvents: TDBDateTimeEditEh;
    dbdtSearchTimeStartEvents: TDBDateTimeEditEh;
    dbdtSearchTimeStopEvents: TDBDateTimeEditEh;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    dbcbSearchCampusExams: TDBLookupComboboxEh;
    dbcbSearchGroupExams: TDBLookupComboboxEh;
    dbcbSearchNumberExams: TDBLookupComboboxEh;
    dbcbSearchPrepExams: TDBLookupComboboxEh;
    dbcbSearchTypeExams: TDBComboBoxEh;
    dbdtSearchDateExams: TDBDateTimeEditEh;
    dbdtSearchTimeStartExams: TDBDateTimeEditEh;
    dbdtSearchTimeStopExams: TDBDateTimeEditEh;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    procedure actSLSaveChangesUpdate(Sender: TObject);
    procedure dbdtSemesterStartChange(Sender: TObject);
    procedure actSLSaveChangesExecute(Sender: TObject);
    procedure actSLUndoChangesExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actLoadExceptionsAvtoUpdate(Sender: TObject);
    procedure actLoadExceptionsAvtoExecute(Sender: TObject);
    procedure actAddLengthExceptionExecute(Sender: TObject);
    procedure actDelLengthExceptionExecute(Sender: TObject);
    procedure dbcbSearchTypeEventsChange(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure actStartSearchEventsExecute(Sender: TObject);
    procedure dbcbSearchCampusEventsKeyValueChanged(Sender: TObject);
    procedure dbdtSearchDateEventsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actStartSearchEventsUpdate(Sender: TObject);
    procedure actStartSearchExamsExecute(Sender: TObject);
    procedure actStartSearchExamsUpdate(Sender: TObject);
    procedure dbcbSearchCampusExamsKeyValueChanged(Sender: TObject);
    procedure dbcbSearchTypeExamsChange(Sender: TObject);
    procedure dbdtSearchDateExamsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsSemLengthExceptionStateChange(Sender: TObject);
  private
    fYearIK: integer;
    fSemIK: integer;
    fSheduleIK: integer;
    fIsSemLengthChange, fIsPrepListLoaded, fIsGroupListLoaded: boolean;
  protected
    procedure DoRefreshFrame;override;
  public
    procedure Read;
    procedure CloseFrame; override;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
  end;

var
  fmSheduleSemester: TfmSheduleSemester;

implementation

uses SheduleController, uMain, DBTVFacScheduleobj, SheduleClasses,
  GeneralController, NagruzkaController;

{$R *.dfm}

{ TfmSheduleSemester }

procedure TfmSheduleSemester.actAddLengthExceptionExecute(Sender: TObject);
begin
  dsSemLengthException.DataSet.Insert;
  fIsSemLengthChange:= true;
end;

procedure TfmSheduleSemester.actDelLengthExceptionExecute(Sender: TObject);
begin
  dsSemLengthException.DataSet.Delete;
  fIsSemLengthChange:= true;
end;

procedure TfmSheduleSemester.actLoadExceptionsAvtoExecute(Sender: TObject);
begin
  if (DayOfWeek(dbdtSemesterStart.Value) = 1) or (DayOfWeek(dbdtSemesterStop.Value) = 1) or
    (DayOfWeek(dbdtSessionStart.Value) = 1) or (DayOfWeek(dbdtSessionStop.Value) = 1) then
  begin
    Application.MessageBox('Указанная дата попадает на выходной день!', 'Продолжительность семестра', MB_ICONWARNING);
    exit;
  end;
  if TSheduleController.AccountFunctions.LoadSemLengthExceptionAvto(fSheduleIK, VarToDateTime(dbdtSemesterStart.Value), VarToDateTime(dbdtSessionStart.Value), VarToDateTime(dbdtSessionStop.Value)) then
    fIsSemLengthChange:= true;
end;

procedure TfmSheduleSemester.actLoadExceptionsAvtoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbdtSemesterStart.Value <> NULL) and (dbdtSemesterStop.Value <> NULL) and (dbdtSessionStart.Value <> NULL) and (dbdtSessionStop.Value <> NULL);
end;

procedure TfmSheduleSemester.actSLSaveChangesExecute(Sender: TObject);
begin
  if (DayOfWeek(dbdtSemesterStart.Value) = 1) or (DayOfWeek(dbdtSemesterStop.Value) = 1) or
    (DayOfWeek(dbdtSessionStart.Value) = 1) or (DayOfWeek(dbdtSessionStop.Value) = 1) then
  begin
    Application.MessageBox('Указанная дата попадает на выходной день!', 'Продолжительность семестра', MB_ICONWARNING);
    exit;
  end;
  if TSheduleController.AccountFunctions.SaveSemsterLength(fSheduleIK, fYearIK, fSemIK, dbdtSemesterStart.Value, dbdtSemesterStop.Value, dbdtSessionStart.Value, dbdtSessionStop.Value, dbdtWorkTimeStart.Value, dbdtWorkTimeStop.Value) then
    fIsSemLengthChange:= false;
end;

procedure TfmSheduleSemester.actSLSaveChangesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= fIsSemLengthChange;
end;

procedure TfmSheduleSemester.actSLUndoChangesExecute(Sender: TObject);
var
  tempInfo: TDefaultSemLengthInfo;
  chokeDS: PDataSet;
begin
  tempInfo:= TSheduleController.AccountFunctions.GetSemesterLength(fSheduleIK, true, chokeDS);
  dsSemLengthException.DataSet:= chokeDS^;
  if tempInfo <> nil then
  begin
    if tempInfo.SemStart <> 0 then dbdtSemesterStart.Value:= tempInfo.SemStart;
    if tempInfo.SemStop <> 0 then dbdtSemesterStop.Value:= tempInfo.SemStop;
    if tempInfo.SessionStart <> 0 then dbdtSessionStart.Value:= tempInfo.SessionStart;
    if tempInfo.SessionStop <> 0 then dbdtSessionStop.Value:= tempInfo.SessionStop;
    if tempInfo.WorkTimeStart <> 0 then dbdtWorkTimeStart.Value:= tempInfo.WorkTimeStart;
    if tempInfo.WorkTimeEnd <> 0 then dbdtWorkTimeStop.Value:= tempInfo.WorkTimeEnd;
  end;
  fIsSemLengthChange:= false;
end;

procedure TfmSheduleSemester.actStartSearchEventsExecute(Sender: TObject);
begin
  Panel10.Left:= round(Width/2 - Panel10.Width/2);
  Panel10.Top:= round(Height/2 - Panel10.Height/2);
  Panel10.Visible:= true;
  Refresh;
  try
    case dbcbSearchTypeEvents.ItemIndex of
    0: if RadioButton1.Checked then
        TSheduleController.MainFunctions.SearchEventsForRoom(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchNumberEvents.KeyValue, dbdtSearchDateEvents.Value, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_start').AsDateTime, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_stop').AsDateTime)
      else TSheduleController.MainFunctions.SearchEventsForRoom(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchNumberEvents.KeyValue, dbdtSearchDateEvents.Value, dbdtSearchTimeStartEvents.Value, dbdtSearchTimeStopEvents.Value);
    1:
      if RadioButton1.Checked then
        TSheduleController.MainFunctions.SearchEventsForPrep(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchPrepEvents.KeyValue, dbdtSearchDateEvents.Value, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_start').AsDateTime, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_stop').AsDateTime)
      else TSheduleController.MainFunctions.SearchEventsForPrep(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchPrepEvents.KeyValue, dbdtSearchDateEvents.Value, dbdtSearchTimeStartEvents.Value, dbdtSearchTimeStopEvents.Value);
    2:
      if RadioButton1.Checked then
        TSheduleController.MainFunctions.SearchEventsForGroup(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchGroupEvents.KeyValue, dbdtSearchDateEvents.Value, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_start').AsDateTime, dbcbSearchPart.ListSource.DataSet.FieldByName('dEvent_stop').AsDateTime)
      else TSheduleController.MainFunctions.SearchEventsForGroup(dsFoundEvents.DataSet as TADODataSet, fSheduleIK, dbcbSearchGroupEvents.KeyValue, dbdtSearchDateEvents.Value, dbdtSearchTimeStartEvents.Value, dbdtSearchTimeStopEvents.Value);
    end;
  finally
    Panel10.Visible:= false;
  end;
end;

procedure TfmSheduleSemester.actStartSearchEventsUpdate(Sender: TObject);
var
  isTimeParamFill: boolean;
begin
  isTimeParamFill:= dbdtSearchDateEvents.Value <> NULL;
  if RadioButton1.Checked then
    isTimeParamFill:= isTimeParamFill and (dbcbSearchPart.KeyValue <> NULL)
  else
    isTimeParamFill:= isTimeParamFill and (dbdtSearchTimeStartEvents.Value <> NULL) and (dbdtSearchTimeStopEvents.Value <> NULL);
  case dbcbSearchTypeEvents.ItemIndex of
  -1: (Sender as TAction).Enabled:= false;
  0: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchNumberEvents.KeyValue <> NULL);
  1: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchPrepEvents.KeyValue <> NULL);
  2: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchGroupEvents.KeyValue <> NULL);
  end;
end;

procedure TfmSheduleSemester.actStartSearchExamsExecute(Sender: TObject);
begin
  Panel10.Left:= round(Width/2 - Panel10.Width/2);
  Panel10.Top:= round(Height/2 - Panel10.Height/2);
  Panel10.Visible:= true;
  Refresh;
  try
    case dbcbSearchTypeExams.ItemIndex of
    0: TSheduleController.MainFunctions.SearchExamsForRoom(dsFoundExams.DataSet as TADODataSet, fSheduleIK, dbcbSearchNumberExams.KeyValue, dbdtSearchDateExams.Value, dbdtSearchTimeStartExams.Value, dbdtSearchTimeStopExams.Value);
    1: TSheduleController.MainFunctions.SearchExamsForPrep(dsFoundExams.DataSet as TADODataSet, fSheduleIK, dbcbSearchPrepExams.KeyValue, dbdtSearchDateExams.Value, dbdtSearchTimeStartExams.Value, dbdtSearchTimeStopExams.Value);
    2: TSheduleController.MainFunctions.SearchExamsForGroup(dsFoundExams.DataSet as TADODataSet, fSheduleIK, dbcbSearchGroupExams.KeyValue, dbdtSearchDateExams.Value, dbdtSearchTimeStartExams.Value, dbdtSearchTimeStopExams.Value);
    end;
  finally
    Panel10.Visible:= false;
  end;
end;

procedure TfmSheduleSemester.actStartSearchExamsUpdate(Sender: TObject);
var
  isTimeParamFill: boolean;
begin
  isTimeParamFill:= (dbdtSearchDateExams.Value <> NULL) and (dbdtSearchTimeStartExams.Value <> NULL) and (dbdtSearchTimeStopExams.Value <> NULL);
  case dbcbSearchTypeExams.ItemIndex of
  -1: (Sender as TAction).Enabled:= false;
  0: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchNumberExams.KeyValue <> NULL);
  1: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchPrepExams.KeyValue <> NULL);
  2: (Sender as TAction).Enabled:= isTimeParamFill and (dbcbSearchGroupExams.KeyValue <> NULL);
  end;
end;

procedure TfmSheduleSemester.CloseFrame;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchPart);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchCampusEvents);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchNumberEvents);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchPrepEvents);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchGroupEvents);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchCampusExams);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchNumberExams);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchPrepExams);
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchGroupExams);
  if Assigned(dsSemLengthException.DataSet) then
  begin
    if dsSemLengthException.DataSet.Active then
      dsSemLengthException.DataSet.Close;
    dsSemLengthException.DataSet:= nil;
  end;
  if Assigned(dsFoundEvents.DataSet) then
  begin
    if dsFoundEvents.DataSet.Active then
      dsFoundEvents.DataSet.Close;
    dsFoundEvents.DataSet.Free;
  end;
  if Assigned(dsFoundExams.DataSet) then
  begin
    if dsFoundExams.DataSet.Active then
      dsFoundExams.DataSet.Close;
    dsFoundExams.DataSet.Free;
  end;
  inherited;
end;

procedure TfmSheduleSemester.dbcbSearchCampusEventsKeyValueChanged(Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchNumberEvents);
  if (dbcbSearchCampusEvents.KeyValue <> NULL) then
    TSheduleController.MainFunctions.GetAllCampusRooms(@dbcbSearchNumberEvents.ListSource.DataSet, dbcbSearchCampusEvents.KeyValue);
end;

procedure TfmSheduleSemester.dbcbSearchCampusExamsKeyValueChanged(
  Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbSearchNumberExams);
  if (dbcbSearchCampusExams.KeyValue <> NULL) then
    TSheduleController.MainFunctions.GetAllCampusRooms(@dbcbSearchNumberExams.ListSource.DataSet, dbcbSearchCampusExams.KeyValue);
end;

procedure TfmSheduleSemester.dbcbSearchTypeEventsChange(Sender: TObject);
begin
  Label15.Visible:= dbcbSearchTypeEvents.ItemIndex = 1;
  dbcbSearchPrepEvents.Visible:= dbcbSearchTypeEvents.ItemIndex = 1;
  Label18.Visible:= dbcbSearchTypeEvents.ItemIndex = 0;
  Label19.Visible:= dbcbSearchTypeEvents.ItemIndex = 0;
  dbcbSearchCampusEvents.Visible:= dbcbSearchTypeEvents.ItemIndex = 0;
  dbcbSearchNumberEvents.Visible:= dbcbSearchTypeEvents.ItemIndex = 0;
  Label17.Visible:= dbcbSearchTypeEvents.ItemIndex = 2;
  dbcbSearchGroupEvents.Visible:= dbcbSearchTypeEvents.ItemIndex = 2;
  if (dbcbSearchTypeEvents.ItemIndex = 1) and (not fIsPrepListLoaded) then
  begin
    TNagruzkaController.Directory.GetAllTeachers(@dbcbSearchPrepEvents.ListSource.DataSet);
    fIsPrepListLoaded:= true;
  end;
  if (dbcbSearchTypeEvents.ItemIndex = 2) and (not fIsGroupListLoaded) then
  begin
    TNagruzkaController.Preparation.GetAllGroupsStudyAtYear(@dbcbSearchGroupEvents.ListSource.DataSet, fYearIK);
    fIsGroupListLoaded:= true;
  end;
  DBGridEh3.Columns.Items[1].Visible:= dbcbSearchTypeEvents.ItemIndex <> 1;
end;

procedure TfmSheduleSemester.dbcbSearchTypeExamsChange(Sender: TObject);
begin
  Label29.Visible:= dbcbSearchTypeExams.ItemIndex = 1;
  dbcbSearchPrepExams.Visible:= dbcbSearchTypeExams.ItemIndex = 1;
  Label32.Visible:= dbcbSearchTypeExams.ItemIndex = 0;
  Label33.Visible:= dbcbSearchTypeExams.ItemIndex = 0;
  dbcbSearchCampusExams.Visible:= dbcbSearchTypeExams.ItemIndex = 0;
  dbcbSearchNumberExams.Visible:= dbcbSearchTypeExams.ItemIndex = 0;
  Label31.Visible:= dbcbSearchTypeExams.ItemIndex = 2;
  dbcbSearchGroupExams.Visible:= dbcbSearchTypeExams.ItemIndex = 2;
  if (dbcbSearchTypeExams.ItemIndex = 1) and (not fIsPrepListLoaded) then
  begin
    TNagruzkaController.Directory.GetAllTeachers(@dbcbSearchPrepExams.ListSource.DataSet);
    fIsPrepListLoaded:= true;
  end;
  if (dbcbSearchTypeExams.ItemIndex = 2) and (not fIsGroupListLoaded) then
  begin
    TNagruzkaController.Preparation.GetAllGroupsStudyAtYear(@dbcbSearchGroupExams.ListSource.DataSet, fYearIK);
    fIsGroupListLoaded:= true;
  end;
  DBGridEh4.Columns.Items[2].Visible:= dbcbSearchTypeExams.ItemIndex <> 1;
end;

procedure TfmSheduleSemester.dbdtSearchDateEventsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actStartSearchEvents.Enabled then
      actStartSearchEventsExecute(actStartSearchEvents);
end;

procedure TfmSheduleSemester.dbdtSearchDateExamsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actStartSearchExams.Enabled then
      actStartSearchExamsExecute(actStartSearchExams);
end;

procedure TfmSheduleSemester.dbdtSemesterStartChange(Sender: TObject);
begin
  fIsSemLengthChange:= (dbdtSessionStart.Value <> NULL) and (dbdtSessionStop.Value <> NULL) and (dbdtSemesterStart.Value <> NULL) and
    (dbdtSemesterStop.Value <> NULL) and (dbdtWorkTimeStart.Value <> NULL) and (dbdtWorkTimeStop.Value <> NULL);
end;

procedure TfmSheduleSemester.DBGridEh1DblClick(Sender: TObject);
var
  i, facIK: integer;
begin
  if (dsFaculties.DataSet <> nil) then
    if dsFaculties.DataSet.Active then
    begin
      dsFaculties.DataSet.DisableControls;
      facIK:= dsFaculties.DataSet.FieldByName('ik_fac').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:= 0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if (TDBNodeFacultyScheduleObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK = facIK) then
      begin
        frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:= true;
        break;
      end;
      dsFaculties.DataSet.EnableControls;
  end;
end;

procedure TfmSheduleSemester.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1DblClick(DBGridEh1);  
end;

procedure TfmSheduleSemester.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmSheduleSemester.dsSemLengthExceptionStateChange(Sender: TObject);
begin
  dbdtSemesterStartChange(nil);  
end;

procedure TfmSheduleSemester.RadioButton1Click(Sender: TObject);
begin
  dbcbSearchPart.Enabled:= RadioButton1.Checked;
  dbdtSearchTimeStartEvents.Enabled:= RadioButton2.Checked;
  dbdtSearchTimeStopEvents.Enabled:= RadioButton2.Checked;
  Label21.Enabled:= RadioButton2.Checked;
  Label16.Enabled:= RadioButton2.Checked;
end;

procedure TfmSheduleSemester.Read;
begin
  if (fYearIK = 0) and (fSemIK = 0) then
    raise Exception.Create('Не указан номер семестра и год обучения');
  fIsPrepListLoaded:= false;
  fIsGroupListLoaded:= false;
  dsFaculties.DataSet:= DataSet;
  fSheduleIK:= TSheduleController.MainFunctions.GetSheduleIK(fYearIK, fSemIK);
  actSLUndoChangesExecute(actSLUndoChanges);
  dsFoundEvents.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsFoundExams.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchCampusEvents, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchNumberEvents, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchPrepEvents, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchGroupEvents, 'ik_grup', 'Cname_grup');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchPart, 'ik_event_type', 'cName_event');
  TSheduleController.MainFunctions.GetParts(@dbcbSearchPart.ListSource.DataSet);
  TSheduleController.MainFunctions.GetAllCampus(@dbcbSearchCampusEvents.ListSource.DataSet, false, NULL);

  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchCampusExams, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchNumberExams, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchPrepExams, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSearchGroupExams, 'ik_grup', 'Cname_grup');
  TSheduleController.MainFunctions.GetAllCampus(@dbcbSearchCampusExams.ListSource.DataSet, false, NULL);

  dbdtSearchDateEvents.Value:= Now;
  dbdtSearchDateExams.Value:= Now;
  dbcbSearchTypeEvents.ItemIndex:= 0;
  dbcbSearchTypeExams.ItemIndex:= 0;
  PageControl1.ActivePageIndex:= 0;
end;

end.
