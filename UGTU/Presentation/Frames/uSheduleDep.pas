unit uSheduleDep;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, Mask,
  DBCtrlsEh, ToolWin, ImgList, ActnList, DBGridEh, DBLookupEh, GridsEh, DB,
  Tabs, DockTabSet, SheduleController, SheduleClasses, SheduleGrids, uLessonShedule, ADODB,
  uExaminationShedule;

type
  TfmSheduleDep = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actDelShedule: TAction;
    actFullScreen: TAction;
    actMakeBookmark: TAction;
    actNextWeek: TAction;
    actPrevWeek: TAction;
    actCloseFullScreen: TAction;
    ImageList2: TImageList;
    actLoadShedule: TAction;
    DBGridEh1: TDBGridEh;
    actAddRoom: TAction;
    actDelRoom: TAction;
    dsRoomFond: TDataSource;
    ImageList3: TImageList;
    DockTabSet2: TDockTabSet;
    actCTSaveChanges: TAction;
    actCTUndoChanges: TAction;
    actTCSetAll: TAction;
    actTCUncheckAll: TAction;
    actSetRoomList: TAction;
    Panel2: TPanel;
    Bevel1: TBevel;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet7: TTabSheet;
    ToolBar8: TToolBar;
    actLoadPrevPeriodList: TAction;
    actDeleteRoomFromConstraint: TAction;
    ilRoomConstraint: TImageList;
    fmLessonShedule1: TfmLessonShedule;
    fmExaminationShedule1: TfmExaminationShedule;
    actSessionConstAdd: TAction;
    actSessionConstDel: TAction;
    actSessionConstLoadAvto: TAction;
    actSCSaveChanges: TAction;
    actSCUndoChanges: TAction;
    actAddSCOK: TAction;
    dsSessionTime: TDataSource;
    TabSheet2: TTabSheet;
    Panel9: TPanel;
    Bevel5: TBevel;
    DockTabSet1: TDockTabSet;
    PageControl2: TPageControl;
    tsTeacherWorkConstraint: TTabSheet;
    tsUseRoomFundConstraint: TTabSheet;
    dbcbCTeachers: TDBLookupComboboxEh;
    Label2: TLabel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Bevel2: TBevel;
    Panel6: TPanel;
    ToolBar5: TToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolBar6: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    Panel5: TPanel;
    Bevel3: TBevel;
    Panel7: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    DBGridEh2: TDBGridEh;
    Panel8: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel4: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbdtSessionDate: TDBDateTimeEditEh;
    dbdtWorkTimeStart: TDBDateTimeEditEh;
    CheckBox1: TCheckBox;
    dbdtWorkTimeStop: TDBDateTimeEditEh;
    ToolBar7: TToolBar;
    ToolButton19: TToolButton;
    ToolButton21: TToolButton;
    TreeView1: TTreeView;
    Bevel6: TBevel;
    Panel10: TPanel;
    Label6: TLabel;
    Panel11: TPanel;
    Label7: TLabel;
    ToolButton4: TToolButton;
    procedure dbcbCTeachersKeyValueChanged(Sender: TObject);
    procedure actTCSetAllExecute(Sender: TObject);
    procedure actTCUncheckAllExecute(Sender: TObject);
    procedure actTCSetAllUpdate(Sender: TObject);
    procedure DockTabSet2Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure Panel2Resize(Sender: TObject);
    procedure actLoadPrevPeriodListExecute(Sender: TObject);
    procedure actDelRoomExecute(Sender: TObject);
    procedure actCTUndoChangesExecute(Sender: TObject);
    procedure actCTSaveChangesExecute(Sender: TObject);
    procedure actSetRoomListExecute(Sender: TObject);
    procedure actDeleteRoomFromConstraintExecute(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actSessionConstAddExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure actAddSCOKUpdate(Sender: TObject);
    procedure actSessionConstAddUpdate(Sender: TObject);
    procedure actAddSCOKExecute(Sender: TObject);
    procedure actSessionConstLoadAvtoExecute(Sender: TObject);
    procedure actSessionConstDelExecute(Sender: TObject);
    procedure dsSessionTimeUpdateData(Sender: TObject);
    procedure actSCUndoChangesUpdate(Sender: TObject);
    procedure actSCUndoChangesExecute(Sender: TObject);
    procedure actSCSaveChangesExecute(Sender: TObject);
    procedure actSessionConstDelUpdate(Sender: TObject);
    procedure actCTSaveChangesUpdate(Sender: TObject);
    procedure DockTabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure actDeleteRoomFromConstraintUpdate(Sender: TObject);
    procedure actDelRoomUpdate(Sender: TObject);
  private
    fTeacherSemesterConstraintGrid: TTeacherSemesterConstraintsGrid;
    fIK: integer;
    fYearIK: integer;
    fSemIK: integer;
    fSheduleIK: integer;
    lastTeacherIK: Variant;
    lastTabSheet, lastConstraintTabSheet, lastSheduleTabSheet: integer;
    currentSemInfo: TDefaultSemLengthInfo;
    fIsSessionConstraintUpdate, fIsSemesterConstraintUpdate: boolean;
    procedure RealodRoomConstraintForItem;
    procedure OnSemesterCheckBoxClick(Sender: TObject);
  protected
    procedure DoRefreshFrame;override;
  public
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection); override;
    procedure Read;
    procedure CloseFrame; override;
    property IK: Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
  end;

  TRoomConstraintsLoadThread = class(TThread)
  protected
    fMyOwnerFrame: TfmSheduleDep;
    procedure LoadRoomConstraints;
  public
    constructor Create(AfMyOwnerFrame: TfmSheduleDep);
    procedure Execute; override;
  end;


var
  fmSheduleDep: TfmSheduleDep;

implementation

uses GeneralController, NagruzkaController, uSheduleAddRooms, uSheduleSetRoomConstraints,
  ExceptionBase;

{$R *.dfm}

{ TfmSheduleDep }

procedure TfmSheduleDep.dbcbCTeachersKeyValueChanged(Sender: TObject);
begin
  if Assigned(dsSessionTime.DataSet) then
  begin
    dsSessionTime.DataSet.Free;
    dsSessionTime.DataSet:= nil;
  end;
  fTeacherSemesterConstraintGrid.ClearItems;
  if dbcbCTeachers.KeyValue <> NULL then
  begin
    dsSessionTime.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
    TSheduleController.ConstraintFunctions.InitializeTeacherConstraints(fSheduleIK, dbcbCTeachers.KeyValue, fIK, fTeacherSemesterConstraintGrid);
    TSheduleController.ConstraintFunctions.InitializeTeacherSessionConstraints(fSheduleIK, dbcbCTeachers.KeyValue, fIK, dsSessionTime.DataSet as TADODataSet);
   // Panel2Resize(Panel2);
  end;
end;

procedure TfmSheduleDep.actAddSCOKExecute(Sender: TObject);
begin
  if not currentSemInfo.IsSessionDateAllow(VarToDateTime(dbdtSessionDate.Value)) then
  begin
    Application.MessageBox('”казанна€ дата выходит за рамки сессии!','',MB_ICONWARNING);
    exit;
  end;
  if not CheckBox1.Checked then
    if (TTime(VarToDateTime(dbdtWorkTimeStart.Value)) > currentSemInfo.WorkTimeEnd) or (TTime(VarToDateTime(dbdtWorkTimeStart.Value)) < currentSemInfo.WorkTimeStart) or
     (TTime(VarToDateTime(dbdtWorkTimeStop.Value)) > currentSemInfo.WorkTimeEnd) or (TTime(VarToDateTime(dbdtWorkTimeStop.Value)) < currentSemInfo.WorkTimeStart) then
    begin
      Application.MessageBox('”казанное врем€ выходит за рамки рабочего дн€ в данном учебном семестре!','',MB_ICONWARNING);
      exit;
    end;
  if CheckBox1.Checked then
  begin
    dsSessionTime.DataSet.Insert;
    dsSessionTime.DataSet.FieldByName('ik_kaf').AsInteger:= fIK;
    dsSessionTime.DataSet.FieldByName('iTab_n').AsInteger:= dbcbCTeachers.KeyValue;
    dsSessionTime.DataSet.FieldByName('d_session_date').AsDateTime:= dbdtSessionDate.Value;
    dsSessionTime.DataSet.FieldByName('d_work_time_start').AsDateTime:= currentSemInfo.WorkTimeStart;
    dsSessionTime.DataSet.FieldByName('d_work_time_end').AsDateTime:= currentSemInfo.WorkTimeEnd;
    dsSessionTime.DataSet.Post;
  end
  else
  begin
    dsSessionTime.DataSet.Insert;
    dsSessionTime.DataSet.FieldByName('ik_kaf').AsInteger:= fIK;
    dsSessionTime.DataSet.FieldByName('iTab_n').AsInteger:= dbcbCTeachers.KeyValue;
    dsSessionTime.DataSet.FieldByName('d_session_date').AsDateTime:= dbdtSessionDate.Value;
    dsSessionTime.DataSet.FieldByName('d_work_time_start').AsDateTime:= dbdtWorkTimeStart.Value;
    dsSessionTime.DataSet.FieldByName('d_work_time_end').AsDateTime:= dbdtWorkTimeStop.Value;
    dsSessionTime.DataSet.Post;
  end;
  Panel8.Visible:= false;
  fIsSessionConstraintUpdate:= true;     
end;

procedure TfmSheduleDep.actAddSCOKUpdate(Sender: TObject);
begin
  if CheckBox1.Checked then
    actAddSCOK.Enabled:= dbdtSessionDate.Value <> NULL
  else actAddSCOK.Enabled:= (dbdtSessionDate.Value <> NULL) and (dbdtWorkTimeStart.Value <> NULL) and (dbdtWorkTimeStop.Value <> NULL);
end;

procedure TfmSheduleDep.actCTSaveChangesExecute(Sender: TObject);
begin
  fIsSemesterConstraintUpdate:= not TSheduleController.ConstraintFunctions.SaveTeacherConstraints(fSheduleIK, dbcbCTeachers.KeyValue, fIK, fTeacherSemesterConstraintGrid);
end;

procedure TfmSheduleDep.actCTSaveChangesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= fIsSemesterConstraintUpdate;
end;

procedure TfmSheduleDep.actCTUndoChangesExecute(Sender: TObject);
begin
  TSheduleController.ConstraintFunctions.InitializeTeacherConstraints(fSheduleIK, dbcbCTeachers.KeyValue, fIK, fTeacherSemesterConstraintGrid);
  fIsSemesterConstraintUpdate:= false;
  Panel2Resize(Panel2);
end;

procedure TfmSheduleDep.actDeleteRoomFromConstraintExecute(Sender: TObject);
var
  prepodPlanIKList, objectIKList: TStringList;
  objectIsDep: boolean;
begin
  if Application.MessageBox('¬ы уверены в том, что хотите сн€ть данное ограничение по использованию аудиторного фонда', 'ќграничени€ по использованию аудиторного фонда', MB_YESNO) = mrYes then
  begin
    objectIsDep:= false;
    prepodPlanIKList:= nil;
    case TRoomConstraintItem(TreeView1.Selected.Data).ItemType of
    rcitDisc: prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForDisc(fIK, fYearIK, fSemIK, TRoomConstraintItem(TreeView1.Selected.Data).IK);
    rcitPotok: prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForPotok(fIK, fYearIK, fSemIK, TRoomConstraintItem(TreeView1.Selected.Parent.Data).IK, TRoomConstraintItem(TreeView1.Selected.Data).IK);
    rcitVZandVN: prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForVZandVN(TRoomConstraintVZandVNItem(TreeView1.Selected.Data).ContentPlanNagrIKList);
    rcitCalcUnit: prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForCalcUnit(TRoomConstraintVZandVNItem(TreeView1.Selected.Parent.Data).ContentPlanNagrIKList, TRoomConstraintItem(TreeView1.Selected.Data).IK);
    rcitPrepodName:
      begin
        prepodPlanIKList:= TStringList.Create;
        prepodPlanIKList.Assign(TRoomConstraintPrepodItem(TreeView1.Selected.Data).PrepodPlanNagrIKAsList);
      end;
    rcitRoom:
      begin
        prepodPlanIKList:= TStringList.Create;
        objectIKList:= TStringList.Create;
        prepodPlanIKList.Assign(TRoomConstraintPrepodItem(TreeView1.Selected.Parent.Data).PrepodPlanNagrIKAsList);
        objectIKList.Add(IntToStr(TRoomConstraintItem(TreeView1.Selected.Data).IK));
      end;
    rcitAllRoomInKaf:
      begin
        prepodPlanIKList:= TStringList.Create;
        objectIKList:= TStringList.Create;
        objectIsDep:= true;
        prepodPlanIKList.Assign(TRoomConstraintPrepodItem(TreeView1.Selected.Parent.Data).PrepodPlanNagrIKAsList);
        objectIKList.Add(IntToStr(TRoomConstraintItem(TreeView1.Selected.Data).IK));
      end;
    end;
    if not Assigned(prepodPlanIKList) then
      raise EApplicationException.Create('ѕроизошла ошибка во врем€ обработки информации об учебной нагрузке')
    else
      if TSheduleController.ConstraintFunctions.DeleteRoomConstraint(prepodPlanIKList, objectIKList, objectIsDep) then
        RealodRoomConstraintForItem;
  end;
end;

procedure TfmSheduleDep.actDeleteRoomFromConstraintUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= TreeView1.Selected <> nil;
end;

procedure TfmSheduleDep.actDelRoomExecute(Sender: TObject);
var
  i: integer;
  fDeletedRooms: TStringList;
begin
 { if Application.MessageBox('¬ы уверены что хотите удалить выбранные аудитории из аудиторного фонда кафедры в текущем учебном периоде?',
    '”даление аудиторий из аудиторного кафедры', MB_YESNO) = mrYes then
  begin
    fDeletedRooms:= TStringList.Create;
    for i := 0 to DBGridEh1.SelectedRows.Count-1 do
    begin
      dsRoomFond.DataSet.GotoBookmark(Pointer(DBGridEh1.SelectedRows[I]));
      fDeletedRooms.Add(dsRoomFond.DataSet.FieldByName('ik_room').AsString);
    end;
    if TSheduleController.AccountFunctions.DeleteRoomsFromRoomFund(fSheduleIK, fDeletedRooms) then
    begin
      dsRoomFond.DataSet.Close;
      dsRoomFond.DataSet.Open;
    end;
    fDeletedRooms.Free;
  end;        }
end;

procedure TfmSheduleDep.actDelRoomUpdate(Sender: TObject);
begin
  if dsRoomFond.DataSet <> nil then
  begin
    if dsRoomFond.DataSet.Active then
      (Sender as TAction).Enabled:= DBGridEh1.SelectedRows.Count > 1
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmSheduleDep.actLoadPrevPeriodListExecute(Sender: TObject);
var
  temp: TfrmSheduleAddRooms;
begin
  temp:= TfrmSheduleAddRooms.CreateDialog(nil, Connection, nil);
  temp.Read(fIK, fSheduleIK);
  if (temp.ShowModal = mrOK) or (temp.bbApply.Tag = 1) then
    TSheduleController.AccountFunctions.GetRoomFund(@dsRoomFond.DataSet, fIK, fSheduleIK);
  temp.Free;
end;

procedure TfmSheduleDep.actSCSaveChangesExecute(Sender: TObject);
begin
  (dsSessionTime.DataSet as TADODataSet).UpdateBatch();
  fIsSessionConstraintUpdate:= false;
end;

procedure TfmSheduleDep.actSCUndoChangesExecute(Sender: TObject);
begin
  dsSessionTime.DataSet.Close;
  dsSessionTime.DataSet.Open;
  fIsSessionConstraintUpdate:= false;
end;

procedure TfmSheduleDep.actSCUndoChangesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= fIsSessionConstraintUpdate;
end;

procedure TfmSheduleDep.actSessionConstAddExecute(Sender: TObject);
begin
  if (currentSemInfo.MinSessionStart = 0) or (currentSemInfo.MaxSessionStop = 0) or (currentSemInfo.WorkTimeStart = 0) or (currentSemInfo.WorkTimeEnd = 0) then
  begin
    Application.MessageBox('ѕеред установкой ограничений на врем€ работы преподавателей в период сессии необходимо заполнить информацию о продолжительности учебного семестра', 'Ќе заполнена информаци€ о продолжительности семестра', MB_ICONWARNING);
    exit;
  end;
  Panel8.Visible:= true;
end;

procedure TfmSheduleDep.actSessionConstAddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbCTeachers.KeyValue <> NULL) and (dsSessionTime.DataSet <> nil);  
end;

procedure TfmSheduleDep.actSessionConstDelExecute(Sender: TObject);
begin
  dsSessionTime.DataSet.Delete;
  fIsSessionConstraintUpdate:= true;
end;

procedure TfmSheduleDep.actSessionConstDelUpdate(Sender: TObject);
begin
  if dsSessionTime.DataSet <> nil then
  begin
    if dsSessionTime.DataSet.Active then
      (Sender as TAction).Enabled:= dsSessionTime.DataSet.RecordCount > 0
    else
      (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmSheduleDep.actSessionConstLoadAvtoExecute(Sender: TObject);
var
  i: double;
  startDate, stopDate: TDate;
begin
  i:= 0;
  dsSessionTime.DataSet.DisableControls;
  dsSessionTime.DataSet.First;
  while not dsSessionTime.DataSet.Eof do
    dsSessionTime.DataSet.Delete;
  startDate:= currentSemInfo.MinSessionStart;
  stopDate:= currentSemInfo.MaxSessionStop;
  while startDate + i < stopDate do
  begin
    if currentSemInfo.IsSessionDateAllow(startDate + i) then
    begin
      dsSessionTime.DataSet.Insert;
      dsSessionTime.DataSet.FieldByName('ik_kaf').AsInteger:= fIK;
      dsSessionTime.DataSet.FieldByName('iTab_n').AsInteger:= dbcbCTeachers.KeyValue;
      dsSessionTime.DataSet.FieldByName('d_session_date').AsDateTime:= startDate + i;
      dsSessionTime.DataSet.FieldByName('d_work_time_start').AsDateTime:= currentSemInfo.WorkTimeStart;
      dsSessionTime.DataSet.FieldByName('d_work_time_end').AsDateTime:= currentSemInfo.WorkTimeEnd;
      dsSessionTime.DataSet.Post;        
    end;
    i:= i + 1.0;
  end;
  dsSessionTime.DataSet.EnableControls;
  fIsSessionConstraintUpdate:= true;
end;

procedure TfmSheduleDep.actSetRoomListExecute(Sender: TObject);
var
  temp: TfrmSheduleSetRoomConstraints;
  itemCaption: string;
  prepodPlanIKList: TStringList;
begin
  temp:= TfrmSheduleSetRoomConstraints.CreateDialog(nil, Connection, nil);
try
  prepodPlanIKList:= nil;
  case TRoomConstraintItem(TreeView1.Selected.Data).ItemType of
    rcitDisc: 
      begin
        itemCaption:= TreeView1.Selected.Text;
        prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForDisc(fIK, fYearIK, fSemIK, TRoomConstraintItem(TreeView1.Selected.Data).IK);
      end;
    rcitPotok: 
      begin
        itemCaption:= TreeView1.Selected.Parent.Text + ', ' + TreeView1.Selected.Text;
        prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForPotok(fIK, fYearIK, fSemIK, TRoomConstraintItem(TreeView1.Selected.Parent.Data).IK, TRoomConstraintItem(TreeView1.Selected.Data).IK);
      end;
    rcitVZandVN: 
      begin
        itemCaption:= TreeView1.Selected.Parent.Parent.Text + ', ' + TreeView1.Selected.Parent.Text + ', ' + AnsiLowerCase(TreeView1.Selected.Text);
        prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForVZandVN(TRoomConstraintVZandVNItem(TreeView1.Selected.Data).ContentPlanNagrIKList);
      end;
    rcitCalcUnit:
      begin
        itemCaption:= TreeView1.Selected.Parent.Parent.Parent.Text + ', ' + TreeView1.Selected.Parent.Parent.Text + ', ' + AnsiLowerCase(TreeView1.Selected.Parent.Text) + ', ' + TreeView1.Selected.Text;
        prepodPlanIKList:= TSheduleController.ConstraintFunctions.GetPrepodPlanIKListForCalcUnit(TRoomConstraintVZandVNItem(TreeView1.Selected.Parent.Data).ContentPlanNagrIKList, TRoomConstraintItem(TreeView1.Selected.Data).IK);
      end;
    rcitPrepodName:
      begin
        itemCaption:= TreeView1.Selected.Parent.Parent.Parent.Parent.Text + ', ' + TreeView1.Selected.Parent.Parent.Parent.Text + ', ' + AnsiLowerCase(TreeView1.Selected.Parent.Parent.Text) + ', ' + TreeView1.Selected.Parent.Text + ', ' + TreeView1.Selected.Text;
        prepodPlanIKList:= TStringList.Create;
        prepodPlanIKList.Assign(TRoomConstraintPrepodItem(TreeView1.Selected.Data).PrepodPlanNagrIKAsList);
      end;
  end;
  if not Assigned(prepodPlanIKList) then
    raise Exception.Create('ѕроизошла ошибка во врем€ обработки информации об учебной нагрузке');
  temp.Read(fIK, fYearIK, fSemIK, prepodPlanIKList, itemCaption);
  if (temp.ShowModal = mrOK) or (temp.bbApply.Tag = 1) then
     RealodRoomConstraintForItem;
  FreeAndNil(temp);
except
  if Assigned(temp) then temp.Free;
  raise;
end;
end;

procedure TfmSheduleDep.actTCSetAllExecute(Sender: TObject);
var
  i: integer;
begin
  for I := 0 to fTeacherSemesterConstraintGrid.TCItemsCount - 1 do
    fTeacherSemesterConstraintGrid.TeacherConstraints[i].CheckBox.Checked:= true;
  fIsSemesterConstraintUpdate:= true;
end;

procedure TfmSheduleDep.actTCSetAllUpdate(Sender: TObject);
begin
  if fTeacherSemesterConstraintGrid <> nil then
    (Sender as TAction).Enabled:= fTeacherSemesterConstraintGrid.TCItemsCount > 0
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmSheduleDep.actTCUncheckAllExecute(Sender: TObject);
var
  i: integer;
begin
  for I := 0 to fTeacherSemesterConstraintGrid.TCItemsCount - 1 do
    fTeacherSemesterConstraintGrid.TeacherConstraints[i].CheckBox.Checked:= false;
  fIsSemesterConstraintUpdate:= true;
end;

procedure TfmSheduleDep.CheckBox1Click(Sender: TObject);
begin
  dbdtWorkTimeStart.Enabled:= not CheckBox1.Checked;
  dbdtWorkTimeStop.Enabled:= not CheckBox1.Checked;
end;

procedure TfmSheduleDep.CloseFrame;
begin
  lastTabSheet:= PageControl1.ActivePageIndex;
  lastConstraintTabSheet:= PageControl2.ActivePageIndex;
  lastSheduleTabSheet:= PageControl3.ActivePageIndex;
  lastTeacherIK:= TGeneralController.Instance.CloseLockupCB(@dbcbCTeachers);
  if Assigned(dsSessionTime.DataSet) then
  begin
    dsSessionTime.DataSet.Free;
    dsSessionTime.DataSet:= nil;
  end;
  if Assigned(dsRoomFond.DataSet) then
  begin
    if dsRoomFond.DataSet.Active then dsRoomFond.DataSet.Close;
    dsRoomFond.DataSet.Free;
    dsRoomFond.DataSet:= nil;
  end;
  if Assigned(fTeacherSemesterConstraintGrid) then
    FreeAndNil(fTeacherSemesterConstraintGrid);
  TreeView1.Items.Clear;
end;

constructor TfmSheduleDep.CreateFrame(AOwner: TComponent; AObject: TObject;
  AConn: TADOConnection);
begin
  inherited CreateFrame(AOwner, AObject, AConn);
  lastTeacherIK:= NULL;
  lastTabSheet:= 0;
  lastConstraintTabSheet:= 0;
  lastSheduleTabSheet:= 0;
end;

procedure TfmSheduleDep.DockTabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  PageControl2.ActivePageIndex:= NewTab;
end;

procedure TfmSheduleDep.DockTabSet2Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  PageControl3.ActivePageIndex:= NewTab;
  case NewTab of
  0: fmLessonShedule1.IsFullScreen:= fmExaminationShedule1.IsFullScreen;
  1: fmExaminationShedule1.IsFullScreen:= fmLessonShedule1.IsFullScreen;
  end;
end;

procedure TfmSheduleDep.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmSheduleDep.dsSessionTimeUpdateData(Sender: TObject);
begin
  fIsSessionConstraintUpdate:= true;
end;

procedure TfmSheduleDep.OnSemesterCheckBoxClick(Sender: TObject);
begin
  fIsSemesterConstraintUpdate:= true;
end;

procedure TfmSheduleDep.Panel2Resize(Sender: TObject);
begin
 { if fTeacherSemesterConstraintGrid <> nil then
  begin
  if fTeacherSemesterConstraintGrid.ColCount > 1 then
    if fTeacherSemesterConstraintGrid.ClientWidth > (120 + 80*(fTeacherSemesterConstraintGrid.ColCount-1)) then
    begin
      addWidth:= round((fTeacherSemesterConstraintGrid.ClientWidth - 120 - 80*(fTeacherSemesterConstraintGrid.ColCount-1))/fTeacherSemesterConstraintGrid.ColCount);
      fTeacherSemesterConstraintGrid.DefaultColWidth:= 79 + addWidth;
      fTeacherSemesterConstraintGrid.ColWidths[0]:= fTeacherSemesterConstraintGrid.ClientWidth - (80 + addWidth)*(fTeacherSemesterConstraintGrid.ColCount-1);
    end
    else
    begin
      fTeacherSemesterConstraintGrid.DefaultColWidth:= 80;
      fTeacherSemesterConstraintGrid.ColWidths[0]:= 120;
    end;
  end;   }
end;

procedure TfmSheduleDep.Read;
var
  chokeDS: PDataSet;
begin
  if (fYearIK = 0) and (fSemIK = 0) then
    raise Exception.Create('Ќе указан номер семестра и год обучени€');
  fSheduleIK:= TSheduleController.MainFunctions.GetSheduleIK(fYearIK, fSemIK);
  currentSemInfo:= TSheduleController.AccountFunctions.GetSemesterLength(fSheduleIK, false, chokeDS);
  if currentSemInfo.MinSessionStart <> 0 then
    dbdtSessionDate.Value:= currentSemInfo.MinSessionStart;
  TreeView1.Items.Clear;
  TRoomConstraintsLoadThread.Create(self);
  fTeacherSemesterConstraintGrid:= TTeacherSemesterConstraintsGrid.Create(Panel4);
  fTeacherSemesterConstraintGrid.OnCheckBoxChange:= OnSemesterCheckBoxClick;
  dsRoomFond.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  TSheduleController.AccountFunctions.GetRoomFund(@dsRoomFond.DataSet, fIK, fSheduleIK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbCTeachers, 'iTab_n', 'FIO');
  TNagruzkaController.Preparation.GetAllWorkedPrepInKaf(@dbcbCTeachers.ListSource.DataSet, fIK, fYearIK, fSemIK);
  if lastTeacherIK <> NULL then
    dbcbCTeachers.KeyValue:= lastTeacherIK;
  if not fmLessonShedule1.IsFrameLoad then
    fmLessonShedule1.Read(true, fIK, fSheduleIK)
  else
  begin
    if fmLessonShedule1.CurrentSheduleGrid.IsLoad then
      fmLessonShedule1.CurrentSheduleGrid.GoToDate(fmLessonShedule1.CurrentSheduleGrid.PeriodStart);
  end;
  if not fmExaminationShedule1.IsFrameLoad then
    fmExaminationShedule1.Read(true, fIK, fSheduleIK)
  else
  begin
    if fmExaminationShedule1.CurrentSheduleGrid.IsLoad then
      fmExaminationShedule1.CurrentSheduleGrid.UpdateVisibleEvents;
  end;
  fmLessonShedule1.IsLoadInWindow:= false;
  fmExaminationShedule1.IsLoadInWindow:= false;
  Panel4.Height:= round(Panel3.Height/2);
  fIsSessionConstraintUpdate:= false;
  fIsSemesterConstraintUpdate:= false;
  PageControl1.ActivePageIndex:= lastTabSheet;
  PageControl2.ActivePageIndex:= lastConstraintTabSheet;
  DockTabSet1.TabIndex:= lastConstraintTabSheet;
  PageControl3.ActivePageIndex:= lastSheduleTabSheet;
  DockTabSet2.TabIndex:= lastSheduleTabSheet;
end;

procedure TfmSheduleDep.RealodRoomConstraintForItem;
var
  i: integer;
begin
  case TRoomConstraintItem(TreeView1.Selected.Data).ItemType of
      rcitDisc:
        begin
          for I := 0 to TreeView1.Selected.Count - 1 do
            TreeView1.Selected.Item[0].Delete;
          TSheduleController.ConstraintFunctions.ReadPotoksToRoomConstraint(fIK, fYearIK, fSemIK, TreeView1.Selected, TreeView1);
        end;
      rcitPotok:
        begin
          for I := 0 to TreeView1.Selected.Count - 1 do
            TreeView1.Selected.Item[0].Delete;
          TSheduleController.ConstraintFunctions.ReadVZandVNsToRoomConstraint(fIK, fYearIK, fSemIK, TreeView1.Selected, TreeView1);
        end;
      rcitVZandVN:
        begin
          for I := 0 to TreeView1.Selected.Count - 1 do
            TreeView1.Selected.Item[0].Delete;
          TSheduleController.ConstraintFunctions.ReadCalcUnitsToRoomConstraint(TreeView1.Selected, TreeView1);
        end;
      rcitCalcUnit:
        begin
          for I := 0 to TreeView1.Selected.Count - 1 do
            TreeView1.Selected.Item[0].Delete;
          TSheduleController.ConstraintFunctions.ReadPrepodsToRoomConstraint(TRoomConstraintVZandVNItem(TreeView1.Selected.Parent.Data).ContentPlanNagrIKList, TreeView1.Selected, TreeView1);
        end;
      rcitPrepodName:
        begin
          for I := 0 to TreeView1.Selected.Count - 1 do
            TreeView1.Selected.Item[0].Delete;
          TSheduleController.ConstraintFunctions.ReadRoomsToRoomConstraint(TreeView1.Selected, TreeView1);
          TreeView1.Selected.Expand(true);
        end;
      rcitRoom, rcitAllRoomInKaf: TreeView1.Selected.Delete
  end;
end;

procedure TfmSheduleDep.SpeedButton2Click(Sender: TObject);
begin
  Panel8.Visible:= false;
end;

procedure TfmSheduleDep.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  if TRoomConstraintItem(Node.Data).ItemType = rcitDisc then
    if not TRoomConstraintDiscItem(Node.Data).IsNodeLoad then
      TSheduleController.ConstraintFunctions.ReadPotoksToRoomConstraint(fIK, fYearIK, fSemIK, Node, TreeView1);
end;

{ TRoomConstraintsLoadThread }

constructor TRoomConstraintsLoadThread.Create(AfMyOwnerFrame: TfmSheduleDep);
begin
  inherited Create(true);
  FreeOnTerminate:= true;
  fMyOwnerFrame:= AfMyOwnerFrame;
  Resume;
end;

procedure TRoomConstraintsLoadThread.Execute;
begin
  Synchronize(LoadRoomConstraints);
  Terminate;
end;

procedure TRoomConstraintsLoadThread.LoadRoomConstraints;
begin
  TSheduleController.ConstraintFunctions.InitializeRoomConstraints(fMyOwnerFrame.IK, fMyOwnerFrame.YearIK, fMyOwnerFrame.SemIK, fMyOwnerFrame.TreeView1);
end;

end.
