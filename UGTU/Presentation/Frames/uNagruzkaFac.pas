unit uNagruzkaFac;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh, ActnList, ImgList, ToolWin, DB, ADODB, Mask, DBCtrlsEh,
  DBLookupEh, GeneralController, NagruzkaController, NagruzkaClasses, GridsEh, Menus;

type
  TfmNagruzkaFac = class(TfmBase)
    PageControl1: TPageControl;
    tsDepartments: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    actList: TActionList;
    actAddKaf: TAction;
    actEditKaf: TAction;
    actDelKaf: TAction;
    dsDepartments: TDataSource;
    DBGridEh1: TDBGridEh;
    tsTimeNorm: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel2: TPanel;
    actAddNorm: TAction;
    actEditNorm: TAction;
    actDelNorm: TAction;
    dsNormOfTime: TDataSource;
    tsContingent: TTabSheet;
    Panel4: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolBar4: TToolBar;
    BitBtn1: TToolButton;
    BitBtn2: TToolButton;
    Bevel1: TBevel;
    actContSaveChanges: TAction;
    actContUndoChanges: TAction;
    Bevel6: TBevel;
    Panel5: TPanel;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actNormSaveChanges: TAction;
    actNormUndoChanges: TAction;
    Panel6: TPanel;
    dbcbNorm: TDBLookupComboboxEh;
    Label1: TLabel;
    Panel7: TPanel;
    dbgVidZanyat: TDBGridEh;
    Label3: TLabel;
    Splitter1: TSplitter;
    Panel8: TPanel;
    Label4: TLabel;
    DBGridEh2: TDBGridEh;
    ToolBar5: TToolBar;
    ToolButton9: TToolButton;
    ToolBar6: TToolBar;
    ToolButton10: TToolButton;
    ToolBar7: TToolBar;
    ToolButton11: TToolButton;
    ToolBar8: TToolBar;
    ToolButton12: TToolButton;
    actAddDiscNormRow: TAction;
    actDelDiscNormRow: TAction;
    actAddPracticeNormRow: TAction;
    actDelPracticeNormRow: TAction;
    dsNormOfTimeForPractice: TDataSource;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu3: TPopupMenu;
    N2: TMenuItem;
    Bevel2: TBevel;
    dsPlanContingentOfSepGroups: TDataSource;
    actAddRecordToPlanContOfSepGroups: TAction;
    actDelRecordToPlanContOfSepGroups: TAction;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    ToolBar9: TToolBar;
    ToolButton13: TToolButton;
    ToolBar10: TToolBar;
    ToolButton14: TToolButton;
    dbgPlanContingent: TDBGridEh;
    Label2: TLabel;
    procedure actAddKafExecute(Sender: TObject);
    procedure actDelKafExecute(Sender: TObject);
    procedure actEditKafExecute(Sender: TObject);
    procedure dbcbNormKeyValueChanged(Sender: TObject);
    procedure actAddNormExecute(Sender: TObject);
    procedure actEditNormUpdate(Sender: TObject);
    procedure actAddNormUpdate(Sender: TObject);
    procedure actEditNormExecute(Sender: TObject);
    procedure actDelNormExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actEditKafUpdate(Sender: TObject);
    procedure dbgVidZanyatDblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgVidZanyatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDepartmentsDataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure dbgVidZanyatMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actContUndoChangesUpdate(Sender: TObject);
    procedure actContSaveChangesExecute(Sender: TObject);
    procedure actDelDiscNormRowExecute(Sender: TObject);
    procedure actAddDiscNormRowExecute(Sender: TObject);
    procedure actAddPracticeNormRowExecute(Sender: TObject);
    procedure actDelPracticeNormRowExecute(Sender: TObject);
    procedure actNormUndoChangesUpdate(Sender: TObject);
    procedure actNormUndoChangesExecute(Sender: TObject);
    procedure actDelDiscNormRowUpdate(Sender: TObject);
    procedure actDelPracticeNormRowUpdate(Sender: TObject);
    procedure actAddDiscNormRowUpdate(Sender: TObject);
    procedure actAddPracticeNormRowUpdate(Sender: TObject);
    procedure dsNormOfTimeDataChange(Sender: TObject; Field: TField);
    procedure actNormSaveChangesExecute(Sender: TObject);
    procedure actAddRecordToPlanContOfSepGroupsUpdate(Sender: TObject);
    procedure actDelRecordToPlanContOfSepGroupsUpdate(Sender: TObject);
    procedure actAddRecordToPlanContOfSepGroupsExecute(Sender: TObject);
    procedure actDelRecordToPlanContOfSepGroupsExecute(Sender: TObject);
    procedure actContUndoChangesExecute(Sender: TObject);
    procedure dsPlanContingentOfSepGroupsStateChange(Sender: TObject);
    procedure dbgPlanContingentDblClick(Sender: TObject);
    procedure dbgPlanContingentDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    fIK: integer;
    fYearIK: integer;
    fSemIK: integer;
    fLastNormIK: integer;
 //   fLastYearIK: integer;
    fPlanContingentGrid: TPlanContingentGrid;
    fIsNormChange: boolean;
    fIsPlanContOfSepGroupsModified: boolean;
  protected
    procedure DoRefreshFrame;override;
  public
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure CloseFrame; override;
    procedure Read;
    property IK: Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
    property LastNormIK: Integer read fLastNormIK write fLastNormIK;
 //   property LastYearIK: Integer read fLastYearIK write fLastYearIK;
  end;

var
  fmNagruzkaFac: TfmNagruzkaFac;


implementation

uses uNagruzkaAddKaf, uMain, uNagruzkaAddNorm, DBTVDepObj, uGroupEdtDlg, uDM;

{$R *.dfm}

{ TfmNagruzkaFac }

procedure TfmNagruzkaFac.Read;
begin

  PageControl1.ActivePageIndex:= 0;
  dsDepartments.DataSet:= DataSet;
  //TGeneralController.Instance.InitializeLockupCB(@dbcbContingentYear, 'ik_year_uch_pl', 'big_year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbNorm, 'ik_norm_of_time', 'cName_norm');
{  if not Assigned(fPlanContingentGrid) then
    fPlanContingentGrid:= TPlanContingentGrid.Create(Panel9);
  fPlanContingentGrid.ReadContingent(IK, fYearIK);}
  dsPlanContingentOfSepGroups.DataSet:= TNagruzkaController.Preparation.GetPlanContingentOfSeparatedGroups(IK, fYearIK);

{  if fLastYearIK = -1 then
    dbcbContingentYear.KeyValue:= TNagruzkaController.Instance.GetAllYears(@dbcbContingentYear.ListSource.DataSet, true, NULL)
  else dbcbContingentYear.KeyValue:= TNagruzkaController.Instance.GetAllYears(@dbcbContingentYear.ListSource.DataSet, false, fLastYearIK);
 }
  if fLastNormIK = -1 then
    dbcbNorm.KeyValue:= TNagruzkaController.Preparation.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, self.IK, true, NULL)
  else dbcbNorm.KeyValue:= TNagruzkaController.Preparation.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, self.IK, false, fLastNormIK);
  PageControl1Change(PageControl1);
  Panel7.Height:= round((Panel2.Height - Panel6.Height)/2);
  fIsPlanContOfSepGroupsModified:= false;
  fIsNormChange:= false;   
end;

procedure TfmNagruzkaFac.actAddDiscNormRowExecute(Sender: TObject);
begin
  dsNormOfTime.DataSet.First;
  dsNormOfTime.DataSet.Insert;
  fIsNormChange:= true;
end;

procedure TfmNagruzkaFac.actAddDiscNormRowUpdate(Sender: TObject);
begin
  if (dsNormOfTime.DataSet <> nil) then
    actAddDiscNormRow.Enabled:= dsNormOfTime.DataSet.Active and (dbcbNorm.KeyValue <> NULL)
  else actAddDiscNormRow.Enabled:= false;
end;

procedure TfmNagruzkaFac.actAddKafExecute(Sender: TObject);
begin
  frmNagruzkaAddKaf:= TfrmNagruzkaAddKaf.CreateDialog(nil, self.Connection, nil);
try
  frmNagruzkaAddKaf.Caption:= 'Добавление новой кафедры';
  frmNagruzkaAddKaf.Tag:= -1;
  frmNagruzkaAddKaf.IK:= IK;
  frmNagruzkaAddKaf.Read;
  if (frmNagruzkaAddKaf.ShowModal() = mrOk) or (frmNagruzkaAddKaf.bbApply.Tag = 1) then
  begin
    DataSet.Close;
    DataSet.Open;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
finally
  frmNagruzkaAddKaf.Free;
end;
end;

procedure TfmNagruzkaFac.actDelDiscNormRowExecute(Sender: TObject);
begin
  dsNormOfTime.DataSet.Delete;
  fIsNormChange:= true;
end;

procedure TfmNagruzkaFac.actDelDiscNormRowUpdate(Sender: TObject);
begin
  if (dsNormOfTime.DataSet <> nil) then
  begin
    if (dsNormOfTime.DataSet.Active) then
      actDelDiscNormRow.Enabled:= dsNormOfTime.DataSet.RecordCount > 0
    else actDelDiscNormRow.Enabled:= false;
  end
  else actDelDiscNormRow.Enabled:= false;
end;

procedure TfmNagruzkaFac.actDelKafExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы действительно хотите удалить выбранную кафедру?','Удаление кафедры', mb_YesNoCancel) = mrYes) then
  begin
    TNagruzkaController.CommonFunctions.DeleteKafedra(DBGridEh1.DataSource.DataSet.FieldByName('ik_kaf').AsInteger);
    DataSet.Close;
    DataSet.Open;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
end;

procedure TfmNagruzkaFac.actEditKafExecute(Sender: TObject);
begin
  frmNagruzkaAddKaf:= TfrmNagruzkaAddKaf.CreateDialog(nil, self.Connection, nil);
try
  frmNagruzkaAddKaf.Caption:= 'Изменение информации о кафедре';
  frmNagruzkaAddKaf.Tag:= DBGridEh1.DataSource.DataSet.FieldByName('ik_kaf').AsInteger;
  frmNagruzkaAddKaf.IK:= IK;
  frmNagruzkaAddKaf.Read;
  if (frmNagruzkaAddKaf.ShowModal() = mrOk) or (frmNagruzkaAddKaf.bbApply.Tag = 1) then
  begin
    DataSet.Close;
    DataSet.Open;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
finally
  frmNagruzkaAddKaf.Free;
end;
end;

procedure TfmNagruzkaFac.dbcbNormKeyValueChanged(Sender: TObject);
var
  NormForDisc, NormForPractice: PDataSet;
begin
  TNagruzkaController.Preparation.CloseNormOfTime;
  if (dbcbNorm.KeyValue <> NULL) then
  begin
    new(NormForDisc);
    new(NormForPractice);
    try
      if TNagruzkaController.Preparation.LoadContentNormOfTime(dbcbNorm.KeyValue, NormForDisc, NormForPractice) then
      begin
        frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: ' + dbcbNorm.Text;
        dsNormOfTime.DataSet:= NormForDisc^;
        dsNormOfTimeForPractice.DataSet:= NormForPractice^;
      end;
    finally
      dispose(NormForDisc);
      dispose(NormForPractice);
    end;
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: <не выбраны>';
  fIsNormChange:= false;
end;

procedure TfmNagruzkaFac.actAddNormExecute(Sender: TObject);
var
  tempForm: TfrmNagruzkaAddNorm;
begin
  tempForm:= TfrmNagruzkaAddNorm.CreateDialog(nil, self.Connection, nil);
try
  tempForm.IK:= -1;
  tempForm.Read(self.IK);
  if (tempForm.ShowModal() = mrOk) or (tempForm.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
    dbcbNorm.KeyValue:= TNagruzkaController.Preparation.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, self.IK, false, tempForm.LastAddedNorm);
  end;
finally
  tempForm.Free;
end;
end;

procedure TfmNagruzkaFac.actEditNormUpdate(Sender: TObject);
begin
  if (dbcbNorm.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbNorm.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaFac.actNormSaveChangesExecute(Sender: TObject);
begin
  fIsNormChange:= not TNagruzkaController.Preparation.SaveContentNormOfTime(dbcbNorm.KeyValue);
end;

procedure TfmNagruzkaFac.actNormUndoChangesExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите отменить сделанные изменения значений норм времени?', 'Отмена изменений в разделе "Нормы времени"', MB_YESNO) = mrYes then
  begin
    dsNormOfTime.DataSet.Close;
    dsNormOfTime.DataSet.Open;
    dsNormOfTimeForPractice.DataSet.Close;
    dsNormOfTimeForPractice.DataSet.Open;
  end;
end;

procedure TfmNagruzkaFac.actNormUndoChangesUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= fIsNormChange and (dbcbNorm.KeyValue <> NULL);
end;

procedure TfmNagruzkaFac.actAddNormUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled:= true;
end;

procedure TfmNagruzkaFac.actAddPracticeNormRowExecute(Sender: TObject);
begin
  dsNormOfTimeForPractice.DataSet.First;
  dsNormOfTimeForPractice.DataSet.Insert;
  fIsNormChange:= true;
end;

procedure TfmNagruzkaFac.actAddPracticeNormRowUpdate(Sender: TObject);
begin
  if (dsNormOfTimeForPractice.DataSet <> nil) then
    actAddPracticeNormRow.Enabled:= dsNormOfTimeForPractice.DataSet.Active and (dbcbNorm.KeyValue <> NULL)
  else actAddPracticeNormRow.Enabled:= false;
end;

procedure TfmNagruzkaFac.actAddRecordToPlanContOfSepGroupsExecute(
  Sender: TObject);
var
  r:integer;
begin
  frmGroupEdt:=TfrmGroupEdt.Create(self);
  frmGroupEdt.WithSpec := true;
  try
    frmGroupEdt.bEdit := false;
    frmGroupEdt.dbneYear.MaxValue := CurrentYear;
    frmGroupEdt.Caption := 'Добавление группы';
    frmGroupEdt.FacIK := Self.IK;
    frmGroupEdt.IsModified:= (frmGroupEdt.edtName.Text <> '') and (frmGroupEdt.dbneYear.Text <> '') and (frmGroupEdt.dblcbUchPln.KeyValue <> NULL);
    r:= frmGroupEdt.ShowModal;
    if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
  finally
    dbgPlanContingent.DataSource.DataSet.Active := false;
    dbgPlanContingent.DataSource.DataSet.Active := true;
    frmGroupEdt.Free;
  end;
end;

procedure TfmNagruzkaFac.actAddRecordToPlanContOfSepGroupsUpdate(
  Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

procedure TfmNagruzkaFac.actContSaveChangesExecute(Sender: TObject);
begin
  if {fPlanContingentGrid.SaveContingent and }TNagruzkaController.Preparation.SavePlanContingentOfSepGroups(fYearIK) then
    fIsPlanContOfSepGroupsModified:= false;
end;

procedure TfmNagruzkaFac.actContUndoChangesExecute(Sender: TObject);
begin
 // fPlanContingentGrid.ClearList;
  if dsPlanContingentOfSepGroups.DataSet <> nil then
    if dsPlanContingentOfSepGroups.DataSet.Active then
      dsPlanContingentOfSepGroups.DataSet.Close;
 // fPlanContingentGrid.ReadContingent(IK, fYearIK);
  dsPlanContingentOfSepGroups.DataSet:= TNagruzkaController.Preparation.GetPlanContingentOfSeparatedGroups(IK, fYearIK);
  fIsPlanContOfSepGroupsModified:= false;
end;

procedure TfmNagruzkaFac.actContUndoChangesUpdate(Sender: TObject);
begin
  {if fPlanContingentGrid <> nil then
    (Sender as TAction).Enabled:= fPlanContingentGrid.IsModified or fIsPlanContOfSepGroupsModified
  else (Sender as TAction).Enabled:= false;        }
end;

procedure TfmNagruzkaFac.actEditNormExecute(Sender: TObject);
var
  tempForm: TfrmNagruzkaAddNorm;
begin
  tempForm:= TfrmNagruzkaAddNorm.CreateDialog(nil, self.Connection, nil);
try
  tempForm.IK:= dbcbNorm.KeyValue;
  tempForm.Read(self.IK);
  tempForm.dbcbSpeciality.KeyValue:= dbcbNorm.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger;
  tempForm.dbcbYear.KeyValue:= dbcbNorm.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  tempForm.IsModified:= false;
  if (tempForm.ShowModal() = mrOk) or (tempForm.bbApply.Tag = 1) then
    dbcbNorm.KeyValue:= TNagruzkaController.Preparation.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, self.IK, false, TGeneralController.Instance.CloseLockupCB(@dbcbNorm));
finally
  tempForm.Free;
end;
end;

procedure TfmNagruzkaFac.actDelNormExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы действительно хотите удалить выбранные нормы времени?','Удаление норм времени', mb_YesNo) = mrYes) then
  begin
    TNagruzkaController.Preparation.DeleteNormOfTime(dbcbNorm.KeyValue);
    TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
    dbcbNorm.KeyValue:= TNagruzkaController.Preparation.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, self.IK, true, NULL);
  end;
end;

procedure TfmNagruzkaFac.actDelPracticeNormRowExecute(Sender: TObject);
begin
  dsNormOfTimeForPractice.DataSet.Delete;
  fIsNormChange:= true;
end;

procedure TfmNagruzkaFac.actDelPracticeNormRowUpdate(Sender: TObject);
begin
  if (dsNormOfTimeForPractice.DataSet <> nil) then
  begin
    if (dsNormOfTimeForPractice.DataSet.Active) then
      actDelPracticeNormRow.Enabled:= dsNormOfTimeForPractice.DataSet.RecordCount > 0
    else actDelPracticeNormRow.Enabled:= false;
  end
  else actDelPracticeNormRow.Enabled:= false;
end;

procedure TfmNagruzkaFac.actDelRecordToPlanContOfSepGroupsExecute(
  Sender: TObject);
begin
  dsPlanContingentOfSepGroups.DataSet.Delete;
  fIsPlanContOfSepGroupsModified:= true;
end;

procedure TfmNagruzkaFac.actDelRecordToPlanContOfSepGroupsUpdate(
  Sender: TObject);
begin
  if dsPlanContingentOfSepGroups.DataSet <> nil then
  begin
    if dsPlanContingentOfSepGroups.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanContingentOfSepGroups.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaFac.DBGridEh1DblClick(Sender: TObject);
var
  i, depIK: integer;
begin
  if (DBGridEh1.DataSource.DataSet <> nil) then
  if  DBGridEh1.DataSource.DataSet.Active then
  begin
  //  actEditKafExecute(nil);
    DBGridEh1.DataSource.DataSet.DisableControls;
    try
      depIK:= DBGridEh1.DataSource.DataSet.FieldByName('ik_kaf').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:=0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if TDBNodedepartmentObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).ik = depIK then
        begin
          frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:=true;
          break;
        end;
    finally
      DBGridEh1.DataSource.DataSet.EnableControls;
    end;
  end;
end;

procedure TfmNagruzkaFac.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditKaf.Enabled then
      DBGridEh1DblClick(DBGridEh1);
end;

procedure TfmNagruzkaFac.dbgPlanContingentDblClick(Sender: TObject);
var
  r:integer;
  tempDS: TADODataSet;
begin
  dm.adospGetUchPlnGroup.Active := false;
  with dm.adospGetUchPlnGroup.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := dsPlanContingentOfSepGroups.DataSet.FieldByName('ik_grup').AsInteger;
  end;
  dm.adospGetUchPlnGroup.ExecProc;
  dm.adospGetUchPlnGroup.Active := true;

  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select Grup.*, rsf.ik_fac from Grup, Relation_spec_fac rsf where rsf.ik_spec_fac=Grup.ik_spec_fac and ik_grup=' + dsPlanContingentOfSepGroups.DataSet.FieldByName('ik_grup').AsString;
  tempDS.Open;
  
  frmGroupEdt:=TfrmGroupEdt.Create(self);

  frmGroupEdt.bEdit := true;
  frmGroupEdt.WithSpec := true;
  frmGroupEdt.SpecFacIK := tempDS.FieldByName('ik_spec_fac').Value;
  frmGroupEdt.dbneYear.MaxValue := CurrentYear;
  frmGroupEdt.edtName.Text := tempDS.FieldByName('Cname_grup').Value;
  //frmGroupEdt.ProfIK := tempDS.FieldByName('ik_spclz').Value;
  frmGroupEdt.dbneYear.Value := tempDS.FieldByName('nYear_post').Value;
  frmGroupEdt.LoadUchPlan(tempDS.FieldByName('ik_spec_fac').Value);
  if tempDS.FieldByName('Ik_uch_plan').Value<> NULL then
    frmGroupEdt.dblcbUchPln.KeyValue := tempDS.FieldByName('Ik_uch_plan').Value
  else
    frmGroupEdt.dblcbUchPln.KeyValue := -1;
  frmGroupEdt.ik := tempDS.FieldByName('Ik_grup').Value;
  frmGroupEdt.FacIK := tempDS.FieldByName('ik_fac').Value;
  frmGroupEdt.edtName.Text := tempDS.FieldByName('Cname_grup').Value;

  if tempDS.FieldByName('DateCreate').Value <>NULL then
    frmGroupEdt.dbdteCreate.Text := tempDS.FieldByName('DateCreate').Value
  else frmGroupEdt.dbdteCreate.Value := null;
  if tempDS.FieldByName('DateExit').Value <>NULL then
    frmGroupEdt.dbdteExit.Text := tempDS.FieldByName('DateExit').Value
  else frmGroupEdt.dbdteExit.value := null;
    
  frmGroupEdt.Caption := 'Редактирование группы';
  frmGroupEdt.IsModified:= false;
  r:= frmGroupEdt.ShowModal;
  if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
  begin
    dsPlanContingentOfSepGroups.DataSet.Active:=false;
    dsPlanContingentOfSepGroups.DataSet.Active:=true;
  end;
  frmGroupEdt.Free;

  tempDS.Close;
  tempDS.Free;

end;

procedure TfmNagruzkaFac.dbgPlanContingentDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if dbgPlanContingent.DataSource.DataSet.FieldByName('ik_uch_plan').Value=NULL then
    dbgPlanContingent.Canvas.Font.Color:= clRed;
  dbgPlanContingent.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, Field.AsString);
end;

procedure TfmNagruzkaFac.actEditKafUpdate(Sender: TObject);
begin
  if (DBGridEh1.DataSource.DataSet.Active) then
    (Sender as TAction).Enabled:= DBGridEh1.DataSource.DataSet.RecordCount > 0
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaFac.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaFac.CloseFrame;
begin
 // fPlanContingentGrid.ClearList;
  if dsPlanContingentOfSepGroups.DataSet <> nil then
    if dsPlanContingentOfSepGroups.DataSet.Active then
      dsPlanContingentOfSepGroups.DataSet.Close;
  if dbcbNorm.KeyValue <> NULL then
    fLastNormIK:= TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbNorm);
{  if dbcbContingentYear.KeyValue <> NULL then
    fLastYearIK:= TGeneralController.Instance.CloseLockupCB(@dbcbContingentYear);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbContingentYear);  }

  inherited;
end;

constructor TfmNagruzkaFac.CreateFrame(AOwner: TComponent; AObject: TObject;
  AConn: TADOConnection);
begin
  inherited CreateFrame(AOwner, AObject, AConn);
  fLastNormIK:= -1;
 // fLastYearIK:= -1;
end;

procedure TfmNagruzkaFac.dbgVidZanyatDblClick(Sender: TObject);
begin
  if actEditNorm.Enabled then
    actEditNormExecute(actEditNorm);
end;

procedure TfmNagruzkaFac.dbgVidZanyatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditNorm.Enabled then
      actEditNormExecute(actEditNorm);
end;

procedure TfmNagruzkaFac.dbgVidZanyatMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (X > dbgVidZanyat.CellRect(2, 0).Left) and (X < dbgVidZanyat.CellRect(2, 0).Right) then
    dbgVidZanyat.Hint:= 'Норма времени на одного студента';
  if (X > dbgVidZanyat.CellRect(3, 0).Left) and (X < dbgVidZanyat.CellRect(3, 0).Right) then
    dbgVidZanyat.Hint:= 'Норма времени на одну расчетную единицу';
  if (X > dbgVidZanyat.CellRect(5, 0).Left) and (X < dbgVidZanyat.CellRect(5, 0).Right) then
    dbgVidZanyat.Hint:= 'Максимальная норма времени на одного студента';
  if (X > dbgVidZanyat.CellRect(6, 0).Left) and (X < dbgVidZanyat.CellRect(6, 0).Right) then
    dbgVidZanyat.Hint:= 'Минимальный контингент для проведения занятия';
  if (X > dbgVidZanyat.CellRect(7, 0).Left) and (X < dbgVidZanyat.CellRect(7, 0).Right) then
    dbgVidZanyat.Hint:= 'Норма времени на одного студента для минимального контингента';
  if (X > dbgVidZanyat.CellRect(8, 0).Left) and (X < dbgVidZanyat.CellRect(8, 0).Right) then
    dbgVidZanyat.Hint:= 'Норма времени на одну расчетную единицу для минимального контингента';
//  SendMessage(dbgVidZanyat.Handle, WM_NCHITTEST, 0, 0)
end;

procedure TfmNagruzkaFac.dsDepartmentsDataChange(Sender: TObject;
  Field: TField);
begin
  if (dsDepartments.DataSet <> nil) then
      if (dsDepartments.DataSet.Active) then
      begin
        if dsDepartments.DataSet.RecordCount > 0 then
          frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: ' + dsDepartments.DataSet.FieldByName('cshort_name_kaf').AsString
        else frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: <не выбран>';
      end
      else frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: <не выбран>';
end;

procedure TfmNagruzkaFac.dsNormOfTimeDataChange(Sender: TObject; Field: TField);
begin
  fIsNormChange:= dbcbNorm.KeyValue <> NULL;
end;

procedure TfmNagruzkaFac.dsPlanContingentOfSepGroupsStateChange(
  Sender: TObject);
begin
  fIsPlanContOfSepGroupsModified:= true;
end;

procedure TfmNagruzkaFac.PageControl1Change(Sender: TObject);
begin

  case PageControl1.ActivePageIndex of
  0:
    if (dsDepartments.DataSet <> nil) then
      if (dsDepartments.DataSet.Active) then
      begin
        if dsDepartments.DataSet.RecordCount > 0 then
          frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: ' + dsDepartments.DataSet.FieldByName('cshort_name_kaf').AsString
        else frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: <не выбран>';
      end
      else frmMain.StatusBar1.Panels[1].Text:= 'Кафедра: <не выбран>';
  1: if (dbcbNorm.KeyValue <> NULL) then
      frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: ' + dbcbNorm.Text
     else frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: <не выбраны>';
  2: frmMain.StatusBar1.Panels[1].Text:= '';
  end;
end;

end.
