unit uNagruzkaDep;
  {#Author villain@ist.ugtu.net}
interface

uses
  DBTVTeacherobj, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  ActnList, ImgList, DBGridEh, ToolWin, DB, ADODB, NagruzkaController,
  Menus, DBLookupEh, uUchPlan, Mask, DBCtrlsEh, GeneralController, UchPlanController,
  GridsEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  System.Actions, DBAxisGridsEh;

type
  PPanel = ^TPanel;

  TfmNagruzkaDep = class(TfmBase)
    PageControl1: TPageControl;
    tsPrepods: TTabSheet;
    ToolBar1: TToolBar;
    actList: TActionList;
    ImageList1: TImageList;
    actAddPotok: TAction;
    actEditPotok: TAction;
    actDelPotok: TAction;
    actAddPrepod: TAction;
    actEditPrepod: TAction;
    actDelPrepod: TAction;
    tsPotok: TTabSheet;
    tsNagruzka: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    Panel7: TPanel;
    Label27: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    dbgVidZanyatPlan: TDBGridEh;
    actAddPlan: TAction;
    actEditPlan: TAction;
    actDelPlan: TAction;
    actAddDisc: TAction;
    actEditDisc: TAction;
    actDelDisc: TAction;
    dsDiscInPlan: TDataSource;
    ToolButton20: TToolButton;
    actExport: TAction;
    ToolButton21: TToolButton;
    actAddPotokShema: TAction;
    actExportTeacherList: TAction;
    ToolButton25: TToolButton;
    Panel9: TPanel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    actExportDepPlan: TAction;
    actExportFactPlanResult: TAction;
    PopupMenu5: TPopupMenu;
    actExportDepPlan1: TMenuItem;
    actExportFactPlanResult1: TMenuItem;
    PopupMenu6: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu7: TPopupMenu;
    actEditPotok1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu8: TPopupMenu;
    actEditPrepod1: TMenuItem;
    N4: TMenuItem;
    Panel6: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ToolButton26: TToolButton;
    actLoadNagrAvto: TAction;
    ToolButton28: TToolButton;
    potokTreeView: TTreeView;
    ImageList2: TImageList;
    actExportDistributedNarg: TAction;
    MSExcel4: TMenuItem;
    Panel8: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    ToolButton29: TToolButton;
    actLockUnlockPlan: TAction;
    Label4: TLabel;
    Label6: TLabel;
    PopupMenu9: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    actEditPotokShema: TAction;
    actDelPotokShema: TAction;
    N16: TMenuItem;
    actGetDistributedNagr: TAction;
    ToolButton32: TToolButton;
    N17: TMenuItem;
    tvPrepods: TTreeView;
    ImageList3: TImageList;
    Bevel6: TBevel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    potokFilter: TDBEditEh;
    Label9: TLabel;
    actExportDistributedNagrForShedule: TAction;
    MSExcel1: TMenuItem;
    actExportSummaryNagrForYear: TAction;
    MSExcel2: TMenuItem;
    tsUchPlan: TTabSheet;
    fmUchPlan: TfmUchPlan;
    FacSpec: TPanel;
    dbcbeFac: TDBLookupComboboxEh;
    Label10: TLabel;
    Label11: TLabel;
    dbcbeSpec: TDBLookupComboboxEh;
    cbKaf: TCheckBox;
    PContentForDiscVC: TPanel;
    DBGEContentForDiscVC: TDBGridEh;
    dsContentForDiscVC: TDataSource;
    PContentForDiscAZ: TPanel;
    DBGEContentForDiscAZ: TDBGridEh;
    dsContentForDiscAZ: TDataSource;
    ToolButton5: TToolButton;
    actAddPotokSemester: TAction;
    actAddPotokSemesterShema: TAction;
    addSemesterShema: TToolButton;
    ToolButton6: TToolButton;
    actCloseFactNagr: TAction;
    ToolButton12: TToolButton;
    actAutoShema: TAction;
    actExportFactNagrExecution: TAction;
    N1: TMenuItem;
    actShowUchPlan: TAction;
    N18: TMenuItem;
    ToolButton15: TToolButton;
    ExportFactNagrYearExecution: TAction;
    N19: TMenuItem;
    Panel4: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel4: TBevel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    cbRepType: TDBComboBoxEh;
    cbFormEd: TDBComboBoxEh;
    Splitter1: TSplitter;
    dbNagrCommit: TDBGridEh;
    dsNagrCommit: TDataSource;
    Panel3: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    lblFull: TLabel;
    Label16: TLabel;
    lblPart: TLabel;
    Label15: TLabel;
    lblAll: TLabel;
    Label17: TLabel;
    lblNo: TLabel;
    Label18: TLabel;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    Button1: TButton;
    actNagrAutoFill: TAction;
    dbcbPlans: TDBLookupComboboxEh;
    combineGroups: TToolButton;
    btnCombinePotoks: TButton;
    actCombinePotoks: TAction;
    TabSheet1: TTabSheet;
    dbgNormTime: TDBGridEh;
    dsPlanNormTime: TDataSource;
    Panel10: TPanel;
    ToolBar5: TToolBar;
    ToolButton16: TToolButton;
    ToolButton24: TToolButton;
    ActionList1: TActionList;
    actNormSaveChanges: TAction;
    actNormUndoChanges: TAction;
    btnDividePotok: TButton;
    actDividePotok: TAction;
    btnShema: TButton;
    procedure actAddPrepodExecute(Sender: TObject);
    procedure actDelPrepodExecute(Sender: TObject);
    procedure actEditPrepodExecute(Sender: TObject);
    procedure actEditPrepodUpdate(Sender: TObject);
    procedure actAddPotokUpdate(Sender: TObject);
    procedure actEditPotokExecute(Sender: TObject);
    procedure actLoadPotokExecute(Sender: TObject);
    procedure actDelPotokExecute(Sender: TObject);
    procedure dbgPotokDblClick(Sender: TObject);
    procedure actEditPotokUpdate(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actDelPlanExecute(Sender: TObject);
    procedure actEditPlanUpdate(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure actAddDiscExecute(Sender: TObject);
    procedure actDelDiscExecute(Sender: TObject);
    procedure actEditDiscUpdate(Sender: TObject);
    procedure actAddPlanUpdate(Sender: TObject);
    procedure actAddPotokShemaExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dbgVidZanyatPlanDblClick(Sender: TObject);
    procedure actExportTeacherListExecute(Sender: TObject);
    procedure dbgVidZanyatPlanDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure actExportDepPlanExecute(Sender: TObject);
    procedure actExportFactPlanResultExecute(Sender: TObject);
    procedure dbgPotokKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgVidZanyatPlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actLoadNagrAvtoExecute(Sender: TObject);
    procedure actAddPotokShemaUpdate(Sender: TObject);
    procedure potokTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actLockUnlockPlanExecute(Sender: TObject);
    procedure actLockUnlockPlanUpdate(Sender: TObject);
    procedure actEditPotokShemaUpdate(Sender: TObject);
    procedure actDelPotokShemaExecute(Sender: TObject);
    procedure actGetDistributedNagrExecute(Sender: TObject);
    procedure potokTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure tvPrepodsChange(Sender: TObject; Node: TTreeNode);
    procedure tvPrepodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExportDistributedNargExecute(Sender: TObject);
    procedure actExportTeacherListUpdate(Sender: TObject);
    procedure potokTreeViewDblClick(Sender: TObject);
    procedure potokFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure potokFilterEnter(Sender: TObject);
    procedure potokFilterExit(Sender: TObject);
    procedure potokTreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actExportDistributedNagrForSheduleExecute(Sender: TObject);
    procedure actExportSummaryNagrForYearUpdate(Sender: TObject);
    procedure actExportUpdate(Sender: TObject);
    procedure actExportSummaryNagrForYearExecute(Sender: TObject);
    procedure dbcbeFacKeyValueChanged(Sender: TObject);
    procedure cbKafClick(Sender: TObject);
    procedure dbcbeSpecKeyValueChanged(Sender: TObject);
    procedure fmUchPlandbcbSpclzKeyValueChanged(Sender: TObject);
    procedure fmUchPlandbcbFormEdKeyValueChanged(Sender: TObject);
    procedure fmUchPlandbgDiscDblClick(Sender: TObject);
    procedure fmUchPlandbgDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fmUchPlansgDiscMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure fmUchPlansgDiscMouseLeave(Sender: TObject);
    procedure actAddPotokSemesterShemaExecute(Sender: TObject);
    procedure actAddPotokSemesterShemaUpdate(Sender: TObject);
    procedure dbgVidZanyatPlanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actAutoShemaUpdate(Sender: TObject);
    procedure actAutoShemaExecute(Sender: TObject);
    procedure actExportFactNagrExecutionExecute(Sender: TObject);
    procedure actShowUchPlanExecute(Sender: TObject);
    procedure actShowUchPlanUpdate(Sender: TObject);
    procedure ExportFactNagrYearExecutionExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure potokTreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure potokTreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbNagrCommitDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbNagrCommitDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure actNagrAutoFillExecute(Sender: TObject);
    procedure dbcbPlansKeyValueChanged(Sender: TObject);
    procedure dbNagrCommitCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actCombinePotoksExecute(Sender: TObject);
    procedure actNormSaveChangesExecute(Sender: TObject);
    procedure dsPlanNormTimeDataChange(Sender: TObject; Field: TField);
    procedure actNormUndoChangesUpdate(Sender: TObject);
    procedure actNormUndoChangesExecute(Sender: TObject);
    procedure actDividePotokExecute(Sender: TObject);
    procedure dbNagrCommitDblClick(Sender: TObject);
    procedure btnShemaClick(Sender: TObject);

  private
    fIK: integer;
    fYearIK: integer;
    fSemIK: integer;
    incorectDisc: TStringList;
    fIsLoadFromMaster: boolean;
    fCurrentRow: integer;
    fNagrTempDataSet : TADODataSet;
    fIsNormChange: boolean;
    procedure CalcHour;
    procedure RecalcStatistic;
    procedure RefreshTeacherList(FilterType: TTeacherTreeViewFilter);
    procedure RefreshPlanNagr(PlanID: integer);
    function CheckPotokCombine(Grid: TDBGridEh): boolean;
  protected
    procedure DoRefreshFrame;override;
  public
    procedure CloseFrame; override;
    procedure Read;
    property IK:Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
    property CurrentRow: Integer read fCurrentRow write fCurrentRow;
    property IsLoadFromMaster: boolean read fIsLoadFromMaster write fIsLoadFromMaster default false;
    procedure CreateNagr();
  end;

var
  fmNagruzkaDep: TfmNagruzkaDep;

implementation

uses NagruzkaClasses, uNagruzkaAddPotok, uNagruzkaAddPrep, uMain, DBTVWorkTypeObj, DBTVdepobj,
  uNagruzkaAddPlan, uNagruzkaAddDiscToPlan, uNagruzkaEditPotokShemes, Contnrs,
  uNagruzkaConflictOnAvtoBuild, uNagruzkaDistributedDuty, uDMUgtuStructure, uDM, uDMUchPlan,
  uNagruzkaAddPotokSemester, uNagruzkaEditPotokSemesterShemes, uNagruzkaDividePotok,
  uWaitingForm;

//var
//  MyDepThreadQueue: TObjectList;

{$R *.dfm}

{ TfmNagruzkaDep }

procedure TfmNagruzkaDep.Read;
var tempDS: TADODataSet;
begin

  fmUchPlan.Connection:= Connection;
  fmUchPlan.ReadModelUchPlan;

  if dmUgtuStructure.adodsFacultyAll.Active=false then
     dmUgtuStructure.adodsFacultyAll.Active:=true;

  if dm.aspGetDiscWork.Active=true then
     dm.aspGetDiscWork.Active:=false;

  PageControl1.ActivePageIndex:= 0;
  Refresh;

  if dm.aspAddDefaultPlans.Active then dm.aspAddDefaultPlans.Close;
  dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_kaf').Value:= fIK;
  dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_type_semestr').Value:= fSemIK;
  dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_year').Value:= fYearIK;
  dm.aspAddDefaultPlans.ExecProc;

  incorectDisc:= TStringList.Create;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cname_plan');
  TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlans, 'ik_plan_nagr', 'cname_plan');
  TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlans.ListSource.DataSet, self.IK, fYearIK, fSemIK, true, NULL);
  dbcbPlans.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlans.ListSource.DataSet, self.IK, fYearIK, fSemIK, true, NULL);
  RefreshPlanNagr(dbcbPlans.KeyValue);

  dbgVidZanyatPlan.DataSource:= dsDiscInPlan;

  RefreshTeacherList(TTeacherTreeViewFilter(frmMain.actPrepodsFilter.Tag));
  TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, -1, -1, false);

  dbgVidZanyatPlan.Height:= Panel7.Height - 82;
  PageControl1Change(PageControl1);
  fNagrTempDataSet := TGeneralController.Instance.GetNewADODataSet(true);

  


  TNagruzkaController.PlanNagruzka.ClosePlanNormTime;
  //подгрузка норм времени
  if dm.dsAllTimeNorm.Active then dm.dsAllTimeNorm.Close;
  dm.dsAllTimeNorm.CommandText:= 'select * from AllNormTime(19)';   //подгружаются нормы, начиная с 2012 года


  dm.aspPlanNormTime.Parameters.ParamByName('@ik_kaf').Value:= Self.IK;
  dm.aspPlanNormTime.Parameters.ParamByName('@ik_year').Value:= YearIK;
  dm.aspPlanNormTime.Parameters.ParamByName('@ik_sem_type').Value:= SemIK;
  dm.aspPlanNormTime.Open;
  dsPlanNormTime.DataSet :=  dm.aspPlanNormTime;

  fIsNormChange:= false;
end;

procedure TfmNagruzkaDep.RecalcStatistic;
var full, unfull, nofull: integer;
begin
  lblAll.Caption := IntToStr(dm.adsNagrCommit.RecordCount);
  full := 0; unfull := 0;
  with dbNagrCommit.DataSource.DataSet do
  begin
    First;
    while Not Eof do
    begin
      case FieldByName('n_full').AsInteger of
      0: inc(full);
      1: inc(unfull);
      2: inc(nofull);
      end;
      Next;
    end;
  end;
  lblFull.Caption :=  IntToStr(full);
  lblPart.Caption := IntToStr(unfull);
  lblNo.Caption := IntToStr(nofull);
end;

procedure TfmNagruzkaDep.RefreshPlanNagr(PlanID: integer);
begin
    dm.adsNagrCommit.Close;
    dm.adsNagrCommit.CommandText := 'select * from GetPotentialForKafForPotoks(' + IntToStr(PlanID) + ')';
    dm.adsNagrCommit.Open;
end;

procedure TfmNagruzkaDep.RefreshTeacherList(FilterType: TTeacherTreeViewFilter);
begin
  TPrepodTreeLoadThread.Create(self.IK, self.YearIK, self.SemIK, self.tvPrepods, FilterType);
end;

procedure TfmNagruzkaDep.SpeedButton8Click(Sender: TObject);
begin
  inherited;
 Panel4.Visible := false;
end;

procedure TfmNagruzkaDep.actAddPrepodExecute(Sender: TObject);
var
  temp: TfrmNagruzkaAddPrep;
begin
  temp:= TfrmNagruzkaAddPrep.CreateDialog(nil, self.Connection, nil);
try
  temp.Tag:= IK;
  temp.IK:= -1;
  temp.Read;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
//    TPrepodTreeLoadThread.Create(self, TTeacherTreeViewFilter(tvPrepods.Tag));
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
finally
  temp.Free;
end;
end;

procedure TfmNagruzkaDep.actAutoShemaExecute(Sender: TObject);
var PotokSemIK: integer;
    tempDS, ShemeDS, planDS: TADODataSet;
    shemeGUID, cuCount, i: integer;
     fCurrentShema: TPotokSemesterShema;
    fShemas: TPotokSemesterShemas;
    yearNode: TTreeNode;
begin
  inherited;

  shemeGUID := -1;
  fShemas := TPotokSemesterShemas.Create;

  PotokSemIK := TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  ShemeDS := TGeneralController.Instance.GetNewADODataSet(true);
  planDS := TGeneralController.Instance.GetNewADODataSet(true);

  tempDS.CommandText := 'select * from Shema_decompose';
  ShemeDS.CommandText := 'select * from Potok_semestr_shema pss,Calc_unit_semestr cus '+
                         'where cus.ik_shema = pss.ik_shema and pss.ik_potok_semestr=' + IntToStr(PotokSemIK);
  planDS.CommandText := 'SELECT sum(group_count) group_count, sum(subgroup_count) subgroup_count, sum(budget_count) budget_count, sum(contract_count) contract_count from GetPlanContingentPotokSemester('+IntToStr(PotokSemIK)+')';
  tempDS.Open;
  ShemeDS.Open;
  planDS.Open;
  while not tempDS.Eof do
  begin
     ShemeDS.Filter := 'ik_decompose_type='+tempDS.FieldByName('ik_decompose_type').AsString;
     ShemeDS.Filtered := true;

     if ShemeDS.RecordCount<>0 then
     begin
       while not ShemeDS.Eof do
       begin
         fCurrentShema := TPotokSemesterShema.Create(ShemeDS.FieldByName('ik_shema').AsInteger,tempDS.FieldByName('ik_decompose_type').AsInteger,
                                                   PotokSemIK,tempDS.FieldByName('cName_decompose').AsString);
         ShemeDS.Next;
       end;

     end else
     begin
        fCurrentShema := TPotokSemesterShema.Create(shemeGUID,tempDS.FieldByName('ik_decompose_type').AsInteger,
                                                   PotokSemIK,tempDS.FieldByName('cName_decompose').AsString);
        dec(shemeGUID);
        fCurrentShema.CalcUnitList := TNagruzkaController.Preparation.GetAutoCalcUnits(PotokSemIK,fCurrentShema.DecomposeTypeIK,
                                                                                      fCurrentShema.IK);
     end;
     fShemas.Add(fCurrentShema);
     tempDS.Next;
  end;

  TNagruzkaController.Preparation.SavePotokSemesterShema(PotokSemIK,fShemas);

  fShemas.Clear;
  fShemas.Free;
  tempDS.Close;
  ShemeDS.Free;
  tempDS.Free;

  //обновить дерево
  PotokSemIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
  yearNode:= potokTreeView.Selected;
  TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, TPotokTreeViewPotokItem(yearNode.Data).IK, PotokSemIK, true);

end;

procedure TfmNagruzkaDep.actAutoShemaUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokShemeUnion) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokSheme) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotok)
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.actCombinePotoksExecute(Sender: TObject);
var i, DiscID, PotokSemestrID: integer;
    lGrups: TStringList;
begin
  lGrups := TStringList.Create;
  for i := 0 to dbNagrCommit.SelectedRows.Count - 1 do
  begin
    dbNagrCommit.DataSource.DataSet.GotoBookmark(Pointer(dbNagrCommit.SelectedRows[i]));
    if i=0 then
    begin
      DiscID :=  dbNagrCommit.DataSource.DataSet.FieldByName('ik_disc').AsInteger;
      PotokSemestrID := dbNagrCommit.DataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    end
    else lGrups.Add(dbNagrCommit.DataSource.DataSet.FieldByName('ik_grup').AsString);
  end;

  //чистим нагрузку и потоки по небазовым группам
   if TNagruzkaController.PlanNagruzka.DeleteOldNagrForGrup(YearIK,SemIK,DiscID,Self.IK,lGrups) then
       //добавляем группы в один базовый поток
       TNagruzkaController.PlanNagruzka.AddGrupsToPotok(PotokSemestrID, lGrups)
       else  MessageBox(Handle,'По выбранным потокам уже введены события расписания','Внимание, заполнено расписание',MB_ICONERROR);

  //TNagruzkaController.PlanNagruzka.

 // if PotokSemestrID=0 then PotokSemestrID := TNagruzkaController.PlanNagruzka.CreatePotok(dbcbPlans.KeyValue, lGrups);

  dsNagrCommit.DataSet.Active := false;
  dsNagrCommit.DataSet.Active := true;

end;

procedure TfmNagruzkaDep.actDelPrepodExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить преподавателя "' + tvPrepods.Selected.Text + '"? ' + #10#13#10#13 +
   'При этом будут удалены соответсвующие записи: ' + #10#13 +
   '  1) из запланированной и фактической нагрузки данного преподавателя;' + #10#13 +
   '  2) из расписания данного преподавателя.'),'Удаление преподавателя', mb_YesNo) = mrYes) then
  begin
    if TNagruzkaController.Preparation.DeletePrepodFromKafedra(TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).TabN, IK) then
    begin
 //     tvPrepods.Items.Delete(tvPrepods.Selected);
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
    end;
  end;
end;

procedure TfmNagruzkaDep.actDividePotokExecute(Sender: TObject);
begin
  frmDividePotok := TfrmDividePotok.Create(self);
  frmDividePotok.IK := dbNagrCommit.DataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger;
  frmDividePotok.Read;
  if (frmDividePotok.ShowModal() = mrOk) then
  begin
    actNagrAutoFillExecute(nil);
    dsNagrCommit.DataSet.Active := false;
    dsNagrCommit.DataSet.Active := true;
  end;
end;

procedure TfmNagruzkaDep.actEditPrepodExecute(Sender: TObject);
var
  temp: TfrmNagruzkaAddPrep;
begin
  temp:= TfrmNagruzkaAddPrep.CreateDialog(nil, self.Connection, nil);
try
  temp.IK:= TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).TabN;
  temp.Tag:= IK;
  temp.Read;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
 //   tvPrepods.Selected.Text:= temp.dbeFam.Text + ' ' + temp.dbeName.Text + ' ' + temp.dbeCoatch.Text;
 //   TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).TeacherFIO:= tvPrepods.Selected.Text;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
finally
  temp.Free;
end;
end;

procedure TfmNagruzkaDep.actEditPrepodUpdate(Sender: TObject);
begin
  if tvPrepods.Selected = nil then
    (Sender as TAction).Enabled:= false
  else
  begin
    if tvPrepods.Selected.Data <> nil then
      (Sender as TAction).Enabled:= TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).ItemType = ttvitTeacher
    else (Sender as TAction).Enabled:= false;
  end;
end;

procedure TfmNagruzkaDep.actAddPotokUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

procedure TfmNagruzkaDep.actEditPotokExecute(Sender: TObject);
var
  tempForm: TfrmAddPotok;
begin
  tempForm:= TfrmAddPotok.CreateDialog(Application, Connection, nil);
try
  tempForm.IK:= Self.IK;
  tempForm.CurYear := fYearIK;
  tempForm.CurSem := fSemIK;
  if TAction(Sender).Tag = 1  then
    tempForm.Tag:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK
  else tempForm.Tag:= -1;
  tempForm.Read;
  if (tempForm.ShowModal() = mrOk) or (tempForm.bbApply.Tag = 1) then
  begin
    if TAction(Sender).Tag = 1 then
      TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, tempForm.dbcbYear.KeyValue, tempForm.Tag, false)
    else TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, tempForm.dbcbYear.KeyValue, -1, false);

  {  if TAction(Sender).Tag = 1 then
    begin
//      potokTreeView.Items.Delete(potokTreeView.Selected);
      yearNode:= nil;
      for i := 0 to potokTreeView.Items.Count - 1 do
        if TPotokTreeViewPotokItem(potokTreeView.Items[i].Data).PotokTreeViewItemType = ptvitYearEnterUnion then
          if (TPotokTreeViewPotokItem(potokTreeView.Items[i].Data).IK = tempForm.dbcbYear.KeyValue) then
          begin
            yearNode:= potokTreeView.Items[i];
            break;
          end;
      if yearNode <> nil then
        for i := 0 to yearNode.Count - 1 do
          if TPotokTreeViewPotokItem(yearNode.Item[i].Data).PotokTreeViewItemType = ptvitPotok then
            if (TPotokTreeViewPotokItem(yearNode.Item[i].Data).IK = ) then
            begin
              potokTreeView.Select(yearNode.Item[i]);
              yearNode.Item[i].Expand(false);
              break;
            end;
      //      if yearNode = nil then yearNode:= potokTreeView.Items.AddChildObject(nil, 'Потоки, поступившие в ' + tempForm.dbcbYear.Text + '-м году', TPotokTreeViewPotokItem.Create(ptvitYearEnterUnion, tempForm.dbcbYear.KeyValue, ''));
  //    potokTreeView.Select(yearNode);
  //    yearNode.Expand(false);
//      potokTreeView.Select((TNagruzkaController.Instance as IPreparationNagruzkaController).AddPotokTreeNode(tempForm.Tag, tempForm.dbeName.Text, potokTreeView, yearNode, true));
    end
    else
    begin

    end;   }

//    TNagruzkaController.Instance.BuildPotokTree(self, IK, potokTreeView);
  end;
finally
  tempForm.Free;
end;
end;

procedure TfmNagruzkaDep.actEditPotokShemaUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokSheme
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.actDelPotokExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить поток "' + potokTreeView.Selected.Text + '"?'),'Удаление потока', mb_YesNo) = mrYes) then
  begin
    TNagruzkaController.Preparation.DeletePotok(TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK, IK);
    potokTreeView.Items.Delete(potokTreeView.Selected);
//    TNagruzkaController.Instance.BuildPotokTree(IK, potokTreeView);
  end;
end;

procedure TfmNagruzkaDep.actDelPotokShemaExecute(Sender: TObject);
var
  curShema: TPotokTreeViewPotokShemeItem;
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранную схему деления потока?','Удаление схемы деления потока', mb_YesNo) = mrYes) then
  begin
    curShema:= potokTreeView.Selected.Data;
    TNagruzkaController.Preparation.DeleteShemaOfPotok(curShema.PotokShemeIK);
    potokTreeView.Items.Delete(potokTreeView.Selected);
  end;
end;

procedure TfmNagruzkaDep.dbgPotokDblClick(Sender: TObject);
begin
  if (actEditPotok.Enabled) then
    actEditPotokExecute(nil);
end;

procedure TfmNagruzkaDep.dbgPotokKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditPotok.Enabled then
      actEditPotokExecute(actEditPotok);
end;

procedure TfmNagruzkaDep.actEditPotokUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotok
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.tvPrepodsChange(Sender: TObject; Node: TTreeNode);
var
  temp: TObject;
begin
  if not fIsLoadFromMaster then
  begin
    if (tvPrepods.SelectionCount > 0) then
      begin
        temp:= tvPrepods.Selected.Data;
        if (temp is TTeacherTreeViewTeacherItem) then
          frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: ' + TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).TeacherFIO
        else frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: <не выбран>';
      end
      else frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: <не выбран>';
  end;
end;

procedure TfmNagruzkaDep.tvPrepodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  dbNode: TObject;
  i, j, tabN, TeacherIK: integer;
begin
  if (tvPrepods.SelectionCount > 0) and (Key = VK_RETURN) and (not fIsLoadFromMaster) then
  begin
    dbNode:= tvPrepods.Selected.Data;
    if (dbNode is TTeacherTreeViewTeacherItem) then
    begin
      case TTeacherTreeViewTeacherItem(dbNode).ItemType of
        ttvitTeacher:
          begin
            tabN:= TTeacherTreeViewTeacherItem(dbNode).TabN;
            frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
            for i:=0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
            if TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).ik = tabN then
            begin
              frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:= true;
              break;
            end;
          end;
        ttvitWorkType:
          begin
            tabN:= TTeacherTreeViewTeacherItem(dbNode).TabN;
            TeacherIK:= TTeacherTreeViewWorkTypeItem(dbNode).TeacherIK;
            frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
            for i:=0 to frmMain.DBDekTreeView_TEST1.Selected.Count-1 do
            if TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).ik = tabN then
            begin
              frmMain.DBDekTreeView_TEST1.Selected.Item[i].Expand(false);
              for j := 0 to frmMain.DBDekTreeView_TEST1.Selected.Count - 1 do
              if TDBNodeWorkTypeObject(frmMain.DBDekTreeView_TEST1.Selected.Item[j].Data).Ik = TeacherIK then
              begin
                frmMain.DBDekTreeView_TEST1.Selected.Item[j].Selected:= true;
                break;
              end;
              break;
            end;
          end;
      end;
    end;
  end;
end;

procedure TfmNagruzkaDep.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaDep.dsPlanNormTimeDataChange(Sender: TObject;
  Field: TField);
begin
  fIsNormChange:= true;

end;

procedure TfmNagruzkaDep.ExportFactNagrYearExecutionExecute(Sender: TObject);
begin
  inherited;
  TNagruzkaController.PrintFactNagrExecution(fYearIK, 0, (FrameObject as TDBNodedepartmentObject).ik,1);
end;

procedure TfmNagruzkaDep.fmUchPlandbcbFormEdKeyValueChanged(Sender: TObject);
begin
  try
  if dmUgtuStructure.dsYearUPForNagr<>nil then
  begin
  fmUchPlan.dbcbYear.ListSource:=dmUgtuStructure.dsYearUPForNagr;
  dmUgtuStructure.dsYearForUchPlan.Active := false;
  with dmUgtuStructure.dsYearForUchPlan.Parameters do
  begin
    Clear;
    AddParameter;
    if cbKaf.Checked then
      Items[0].Value := 1
    else
      Items[0].Value := 0;
    AddParameter;
    Items[1].Value := ik;
    AddParameter;
    if fmUchPlan.dbcbSpclz.KeyValue=null then  Items[2].Value := -1 else
      Items[2].Value := fmUchPlan.dbcbSpclz.KeyValue;
    AddParameter;
    Items[3].Value := dbcbeSpec.KeyValue;
    AddParameter;
    Items[4].Value := fmUchPlan.dbcbFormed.KeyValue;
  end;
  dmUgtuStructure.dsYearForUchPlan.ExecProc;
  dmUgtuStructure.dsYearForUchPlan.Active := true;

  fmUchPlan.dbcbYear.KeyValue:=NULL;

  if dmUgtuStructure.dsYearForUchPlan.RecordCount=1 then
    fmUchPlan.dbcbYear.KeyValue:=dmUgtuStructure.dsYearForUchPlan.FieldByName('ik_year_uch_pl').Value;

  end;
  except
    //raise;
  end;
end;

procedure TfmNagruzkaDep.fmUchPlandbcbSpclzKeyValueChanged(Sender: TObject);
begin
  try
  if dmUgtuStructure.dsFormEdForNagr<>nil then
  begin
  fmUchPlan.dbcbFormEd.ListSource:=dmUgtuStructure.dsFormEdForNagr;
  dmUgtuStructure.adospFormEdForNagr.Active := false;
  with dmUgtuStructure.adospFormEdForNagr.Parameters do
  begin
    Clear;
    AddParameter;
    if cbKaf.Checked then
      Items[0].Value := 1
    else
      Items[0].Value := 0;
    AddParameter;
    Items[1].Value := ik;
    AddParameter;
    if fmUchPlan.dbcbSpclz.KeyValue=null then  Items[2].Value := -1 else

    Items[2].Value := fmUchPlan.dbcbSpclz.KeyValue;
  end;
  dmUgtuStructure.adospFormEdForNagr.ExecProc;
  dmUgtuStructure.adospFormEdForNagr.Active := true;

  dmUgtuStructure.dsYearForUchPlan.Active := false;

  fmUchPlan.dbcbFormEd.KeyValue:=NULL;
  fmUchPlan.dbcbYear.KeyValue:=NULL;

  if dmUgtuStructure.adospFormEdForNagr.RecordCount=1 then
    fmUchPlan.dbcbFormEd.KeyValue:=dmUgtuStructure.adospFormEdForNagr.FieldByName('ik_form_ed').Value;

  end; 
  except
    //raise;
  end;
end;

procedure TfmNagruzkaDep.fmUchPlandbgDiscDblClick(Sender: TObject);
begin
  //
end;

procedure TfmNagruzkaDep.fmUchPlandbgDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfmNagruzkaDep.fmUchPlansgDiscMouseLeave(Sender: TObject);
begin
  PContentForDiscVC.Visible:=false;
  PContentForDiscAZ.Visible:=false;
  CurrentRow:=0;
end;

procedure TfmNagruzkaDep.fmUchPlansgDiscMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow:Integer;
  ik_discpl, ik_vidzanyat : integer;
begin
fmUchPlan.sgDisc.MouseToCell(X, Y, ACol, ARow);

if CurrentRow<>ARow then
  if ARow>0 then
  begin
  PContentForDiscVC.Visible:=false;
  PContentForDiscAZ.Visible:=false;
  
  CurrentRow:=ARow;

  ik_discpl:= fmUchPlan.dsDisc.DataSet.FieldByName('ik_disc_uch_plan').AsInteger;
  ik_vidzanyat:= TUchPlanController.Instance.getColumnParamKey(ARow-1);
  if ik_discpl = NULL then exit;

  case TUchPlanController.Instance.getColumnType(ARow-1) of
    3:
    begin

      if (dmUchPlan.ADOQContentForDiscVC.Active) then dmUchPlan.ADOQContentForDiscVC.Close;

      dmUchPlan.ADOQContentForDiscVC.CommandText:=
      'Select cshort_name_kaf, n_sem, '+
      '(select top 1 tasks_count from '+
      '(select tasks_count '+
      'From Vid_zanyat_with_several_tasks vzst '+
      'where ik_upContent = cup.ik_upContent '+
      'union '+
      'select 1 '+
      ') as term '+
      ') as tasks_count, n_module, i_balls From Content_UchPl cup '+
      'LEFT JOIN Vid_zanyat_with_several_tasks vzst ON cup.ik_upContent = vzst.ik_upContent '+
      'left join kafedra k on k.ik_kaf=cup.ik_kaf ' +
      'Where (ik_disc_uch_plan = ' + IntToStr(ik_discpl) + ') '+
      'and (ik_vid_zanyat = '+ IntToStr(ik_vidzanyat) + ')';

      dmUchPlan.ADOQContentForDiscVC.Open;

      if dmUchPlan.ADOQContentForDiscVC.RecordCount>0 then
      begin

      if (ik_vidzanyat=33) then
        begin
        DBGEContentForDiscVC.DataSource.DataSet.FieldByName('n_module').Visible:=true;
        DBGEContentForDiscVC.DataSource.DataSet.FieldByName('i_balls').Visible:=true;
        end
      else
        begin
        DBGEContentForDiscVC.DataSource.DataSet.FieldByName('n_module').Visible:=false;
        if (ik_vidzanyat=6) then
          DBGEContentForDiscVC.DataSource.DataSet.FieldByName('i_balls').Visible:=true
        else
          DBGEContentForDiscVC.DataSource.DataSet.FieldByName('i_balls').Visible:=false;
        end;
  
      PContentForDiscVC.Visible:=true;
      PContentForDiscVC.Top:=380+y;
      PContentForDiscVC.Height:=55+16*dmUchPlan.ADOQContentForDiscVC.RecordCount;
      PContentForDiscVC.Left:=fmUchPlan.Splitter1.Left+10+x;

      end
      else
        PContentForDiscVC.Visible:=false;

    end;
    11:
    begin

      if (dmUchPlan.ADOQContentForDiscAZ.Active) then dmUchPlan.ADOQContentForDiscAZ.Close;

      dmUchPlan.ADOQContentForDiscAZ.CommandText:=
      'SELECT cName_vid_zanyat, cshort_name_kaf, i_hour_per_week, '+
      '(select top 1 week_count from '+
      '(select week_count from UchPlan_WeekCount_Exception '+
      'where ik_upContent in (select ik_upContent from Content_UchPl where '+
      'ik_upContent = cup.ik_upContent) '+
      'union '+
      'select kol_ned from sem_uch_pl where n_sem=cup.n_sem and '+
      'ik_uch_plan=(select ik_uch_plan from sv_disc '+
      'where ik_disc_uch_plan = (select ik_disc_uch_plan from Content_UchPl where '+
      'ik_upContent = cup.ik_upContent))) as term '+
      ') as week_count '+
      'FROM Content_UchPl cup '+
      'left join kafedra k on k.ik_kaf=cup.ik_kaf '+
      'left join vid_zaniat vz on vz.iK_vid_zanyat=cup.iK_vid_zanyat '+
      'WHERE (vz.ik_vid_zanyat in (3,4,5)) '+
      'and (ik_disc_uch_plan = ' + IntToStr(ik_discpl) + ') '+
      'and (n_sem = '+ IntToStr(ik_vidzanyat) + ')';

      dmUchPlan.ADOQContentForDiscAZ.Open;

      if dmUchPlan.ADOQContentForDiscAZ.RecordCount>0 then
      begin

      PContentForDiscAZ.Visible:=true;
      PContentForDiscAZ.Top:=380+y;
      PContentForDiscAZ.Height:=55+16*dmUchPlan.ADOQContentForDiscAZ.RecordCount;
      PContentForDiscAZ.Left:=fmUchPlan.Splitter1.Left+10+x;

      end
      else
        PContentForDiscAZ.Visible:=false;
    end;
  end;


  end
  else
  begin
    PContentForDiscVC.Visible:=false;
    PContentForDiscAZ.Visible:=false;
  end;
end;


procedure TfmNagruzkaDep.N1Click(Sender: TObject);
begin
 Panel4.Visible := true;
 cbRepType.Text:= 'за семестр';
 cbFormEd.Text:= 'бюджет';
end;

procedure TfmNagruzkaDep.actEditPlanExecute(Sender: TObject);
begin
  frmNagruzkaAddPlan:= TfrmNagruzkaAddPlan.CreateDialog(nil, self.Connection, nil);
try
  frmNagruzkaAddPlan.IK:= self.IK;
  if ((Sender as TAction).Tag = 1) then
    frmNagruzkaAddPlan.Tag:= dbcbPlan.KeyValue
  else
    frmNagruzkaAddPlan.Tag:= -1;
  frmNagruzkaAddPlan.Read(fYearIK, fSemIK);
  if ((Sender as TAction).Tag = 1) then
  begin
    frmNagruzkaAddPlan.dbcbTypeEd.KeyValue:= dbcbPlan.ListSource.DataSet.FieldByName('ik_type_ed').AsInteger;
    frmNagruzkaAddPlan.dbcbFormEd.KeyValue:= dbcbPlan.ListSource.DataSet.FieldByName('ik_form_ed').AsInteger;
  end;
  frmNagruzkaAddPlan.IsModified:= false;
  if (frmNagruzkaAddPlan.ShowModal() = mrOk) or (frmNagruzkaAddPlan.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, frmNagruzkaAddPlan.LastPlanIK);
  end;
finally
  frmNagruzkaAddPlan.Free;
end;
end;

procedure TfmNagruzkaDep.actDelPlanExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранный план учебной нагрузки?' + #10#13#10#13 +
   'При этом будут удалены соответсвующие записи: ' + #10#13 +
   '  1) из фактической нагрузки данного преподавателя;' + #10#13 +
   '  2) из расписания данного преподавателя.','Удаление плана учебной нагрузки', mb_YesNo) = mrYes) then
  begin
    TNagruzkaController.PlanNagruzka.DeletePlanNagr(dbcbPlan.KeyValue);
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, NULL);
    if dm.aspAddDefaultPlans.Active then dm.aspAddDefaultPlans.Close;
    dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_kaf').Value:= fIK;
    dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_type_semestr').Value:= fSemIK;
    dm.aspAddDefaultPlans.Parameters.ParamByName('@ik_year').Value:= fYearIK;
    dm.aspAddDefaultPlans.ExecProc;

    {dbcbPlans.DataSource.DataSet.Active := false;
    dbcbPlans.DataSource.DataSet.Active := true;
    dbcbPlans.DataSource.DataSet.First;
    dbcbPlans.KeyValue := dbcbPlans.DataSource.DataSet.FieldByName('ik_plan_nagr').AsInteger;

    dsNagrCommit.DataSet.Active := false;
    dsNagrCommit.DataSet.Active := true;}
  end;
end;

procedure TfmNagruzkaDep.actEditPlanUpdate(Sender: TObject);
begin
  if dbcbPlan.ListSource <> nil then
  begin
    if (dbcbPlan.ListSource.DataSet <> nil) then
    begin
      if dbcbPlan.ListSource.DataSet.Active and dbcbPlan.Enabled then
        (Sender as TAction).Enabled:= (dbcbPlan.KeyValue <> NULL) and (not dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean)
      else (Sender as TAction).Enabled:= false;
    end
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.dbcbeFacKeyValueChanged(Sender: TObject);
begin
  try
  dmUgtuStructure.adospSpecForNagr.Active := false;
  with dmUgtuStructure.adospSpecForNagr.Parameters do
  begin
    Clear;
    AddParameter;
    //if cbKaf.Checked then
    //  Items[0].Value := 1
    //else
      Items[0].Value := 0;
    AddParameter;
    Items[1].Value := ik;
    AddParameter;
    Items[2].Value := dbcbeFac.KeyValue;
  end;
  dmUgtuStructure.adospSpecForNagr.ExecProc;
  dmUgtuStructure.adospSpecForNagr.Active := true;

  dmUgtuStructure.adospSpclzForNagr.Active := false;
  dmUgtuStructure.adospFormEdForNagr.Active := false;
  dmUgtuStructure.dsYearForUchPlan.Active := false;

  dbcbeSpec.KeyValue:=NULL;
  fmUchPlan.dbcbSpclz.KeyValue:=NULL;
  fmUchPlan.dbcbFormEd.KeyValue:=NULL;
  fmUchPlan.dbcbYear.KeyValue:=NULL;

  if dmUgtuStructure.adospSpecForNagr.RecordCount=1 then
    dbcbeSpec.KeyValue:=dmUgtuStructure.adospSpecForNagr.FieldByName('ik_spec').Value;

  except
    //raise;
  end;
end;

procedure TfmNagruzkaDep.dbcbeSpecKeyValueChanged(Sender: TObject);
begin
  try
  if dbcbeSpec.KeyValue<>NULL then fmUchPlan.SpecIK := dbcbeSpec.KeyValue;

  fmUchPlan.dbcbSpclz.ListSource:=dmUgtuStructure.dsSpclzForNagr;
  dmUgtuStructure.adospSpclzForNagr.Active := false;
  with dmUgtuStructure.adospSpclzForNagr.Parameters do
  begin
    Clear;
    AddParameter;
    if cbKaf.Checked then
      Items[0].Value := 1
    else
      Items[0].Value := 0;
    AddParameter;
    Items[1].Value := ik;
    AddParameter;
    Items[2].Value := dbcbeSpec.KeyValue;
  end;
  dmUgtuStructure.adospSpclzForNagr.ExecProc;
  dmUgtuStructure.adospSpclzForNagr.Active := true;

  fmUchPlan.dbcbSpclz.KeyValue:=-1;

  dmUgtuStructure.adospFormEdForNagr.Active := false;
  dmUgtuStructure.dsYearForUchPlan.Active := false;
  
  fmUchPlan.dbcbSpclz.KeyValue:=NULL;
  fmUchPlan.dbcbFormEd.KeyValue:=NULL;
  fmUchPlan.dbcbYear.KeyValue:=NULL;

  if dmUgtuStructure.adospSpclzForNagr.RecordCount=1 then
    fmUchPlan.dbcbSpclz.KeyValue:=dmUgtuStructure.adospSpclzForNagr.FieldByName('ik_spclz').Value;

  except
    //raise;
  end;
end;

procedure TfmNagruzkaDep.dbcbPlanKeyValueChanged(Sender: TObject);
var
  i: integer;
begin
  if dsDiscInPlan.DataSet <> nil then
    if dsDiscInPlan.DataSet.Active then
      dsDiscInPlan.DataSet.Close;
  dsDiscInPlan.DataSet:= nil;
  Label29.Caption:= '0 час.';
  Label8.Caption:= '0 час.';
  Label6.Caption:= '-';
try
  if dbcbPlan.KeyValue <> NULL then
  begin
    try
      dbcbPlan.Enabled:= false;
      Panel8.Left:= round(Width/2 - Panel8.Width/2);
      Panel8.Top:= round(Height/2 - Panel8.Height/2);
      Panel8.Visible:= true;
      for I := 0 to actList.ActionCount - 1 do
        if actList.Actions[i].Category = 'catNagruzka' then
          actList.Actions[i].Update;
      Refresh;

      fNagrTempDataSet.CommandText := 'SELECT * FROM GetDepartmentPlanNagr(' + IntToStr(dbcbPlan.KeyValue) + ') ORDER BY n_sem, cName_disc, cName_potok';
      fNagrTempDataSet.Open;
      dsDiscInPlan.DataSet:= fNagrTempDataSet;//TNagruzkaController.PlanNagruzka.LoadAllPlanNagr(dbcbPlan.KeyValue);


      if dbcbPlan.ListSource.DataSet.Active then
      begin
        if dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean then
          Label6.Caption:= 'редактирование плана запрещено'
        else Label6.Caption:= 'редактирование плана разрешено';
      end;
      if not fIsLoadFromMaster then
        frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки: ' + dbcbPlan.Text;
      if PageControl1.ActivePageIndex=2 then dbgVidZanyatPlan.SetFocus;
    finally
      CalcHour;
      Panel8.Visible:= false;
      dbcbPlan.Enabled:= true;
    end;
  end
  else if not fIsLoadFromMaster then frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки: <не выбран>';
except
  dbcbPlan.KeyValue:= NULL;
  raise;
end;
end;

procedure TfmNagruzkaDep.dbcbPlansKeyValueChanged(Sender: TObject);
begin
  RefreshPlanNagr((Sender as TDBLookupComboboxEh).KeyValue);
  RecalcStatistic;
end;

procedure TfmNagruzkaDep.actAddDiscExecute(Sender: TObject);
var
  tempForm: TfrmNagruzkaAddDiscToPlan;
  disc_plan_hour, disc_busy_hour: double;
begin
  tempForm:= TfrmNagruzkaAddDiscToPlan.CreateDialog(nil, self.Connection, nil);
try
  TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;
  tempForm.Label2.Caption:= TNagruzkaController.Directory.GetDepartmentName(self.IK, true) + ', ' + AnsiLowerCase(dbcbPlan.ListSource.DataSet.FieldByName('cFullName_plan').AsString);
  tempForm.IK:= dbcbPlan.KeyValue;
  tempForm.Tag:= (Sender as TAction).Tag;
  tempForm.Read(self);
  if (Sender as TAction).Tag = 1 then
  begin
    tempForm.IK:= dbcbPlan.KeyValue;
    tempForm.dbcbPotokPlan.KeyValue:= dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    tempForm.dbcbDiscPlan.KeyValue:= dsDiscInPlan.DataSet.FieldByName('ik_disc').AsInteger;
    tempForm.dbcbPotokPlan.Enabled:= false;
    tempForm.dbcbDiscPlan.Enabled:= false;
    tempForm.Caption:= 'Изменение учебной нагрузки по дисциплине';
    tempForm.HelpKeyword:= 'Нагрузка\Edit_DiscNagrDep.htm';
  end
  else
  begin
    tempForm.Caption:= 'Добавление дисциплины в план учебной нагрузки';
    tempForm.HelpKeyword:= 'Нагрузка\Add_DiscNagrDep.htm';
  end;
  tempForm.IsModified:= false;
  if (tempForm.ShowModal() = mrOk) or (tempForm.bbApply.Tag = 1) then
  begin
    if dsDiscInPlan.DataSet.Locate('ik_disc; ik_potok_semestr', VarArrayOf([tempForm.dbcbDiscPlan.KeyValue, tempForm.dbcbPotokPlan.KeyValue]), [loPartialKey]) then
      if TNagruzkaController.PlanNagruzka.GetPlanHourForDiscipline(dbcbPlan.KeyValue, tempForm.dbcbDiscPlan.KeyValue, tempForm.dbcbPotokPlan.KeyValue, disc_plan_hour, disc_busy_hour) then
      begin
        dsDiscInPlan.DataSet.Edit;
        dsDiscInPlan.DataSet.FieldByName('plan_hour').Value:= disc_plan_hour;
        dsDiscInPlan.DataSet.FieldByName('busy_hour').Value:= disc_busy_hour;
        dsDiscInPlan.DataSet.Post;
      end;
    CalcHour;
  end;
  TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;
finally
  tempForm.Free;
end;
end;

procedure TfmNagruzkaDep.actDelDiscExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранную дисциплину?' + #10#13#10#13 +
   'При этом будут удалены соответсвующие записи: ' + #10#13 +
   '  1) из фактической нагрузки преподавателей;' + #10#13 +
   '  2) из расписания преподавателей.','Удаление дисциплины из плана учебной нагрузки', mb_YesNo) = mrYes) then
  begin
     TNagruzkaController.PlanNagruzka.DeleteDiscfromPlanNagr(dbcbPlan.KeyValue, dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').AsInteger, dsDiscInPlan.DataSet.FieldByName('ik_disc').AsInteger);
     dsDiscInPlan.DataSet.Delete;
     if dsDiscInPlan.DataSet.RecordCount = 0 then
       dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbPlan))
     else CalcHour;

    dsNagrCommit.DataSet.Active := false;
    dsNagrCommit.DataSet.Active := true;
  end;
end;

procedure TfmNagruzkaDep.actEditDiscUpdate(Sender: TObject);
begin
  if dbcbPlan.ListSource <> nil then
  begin
    if (dbcbPlan.ListSource.DataSet <> nil) then
    begin
      if (dbcbPlan.ListSource.DataSet.Active) and dbcbPlan.Enabled then
        (Sender as TAction).Enabled:= (dbcbPlan.KeyValue <> NULL) and (not dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean) and (dsDiscInPlan.DataSet.RecordCount > 0)
      else (Sender as TAction).Enabled:= false;
    end
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.actAddPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= dbcbPlan.Enabled;
end;


procedure TfmNagruzkaDep.actAddPotokShemaExecute(Sender: TObject);
var
  potokIK: integer;
  yearNode: TTreeNode;
begin
  frmNagruzkaEditPotokShemes:= TfrmNagruzkaEditPotokShemes.CreateDialog(Application, self.Connection, nil);
try
  if (Sender as TAction).Tag = 1 then
  begin
    frmNagruzkaEditPotokShemes.IK:= TPotokTreeViewPotokShemeItem(potokTreeView.Selected.Data).IK;
    frmNagruzkaEditPotokShemes.Tag:= TPotokTreeViewPotokShemeItem(potokTreeView.Selected.Data).PotokShemeIK;
    frmNagruzkaEditPotokShemes.Caption:= 'Изменение схемы деления потока "' + TPotokTreeViewPotokShemeItem(potokTreeView.Selected.Data).PotokName + '"';
  end
  else
  begin
    frmNagruzkaEditPotokShemes.Tag:= -1;
    frmNagruzkaEditPotokShemes.IK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
    frmNagruzkaEditPotokShemes.Caption:= 'Добавление схемы деления для потока "' + TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokName + '"';
  end;
  frmNagruzkaEditPotokShemes.Read;

  if (frmNagruzkaEditPotokShemes.ShowModal() = mrOk)  or (frmNagruzkaEditPotokShemes.bbApply.Tag = 1) then
  begin


      case TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType of
        ptvitPotok:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
            yearNode:= potokTreeView.Selected.Parent;
          end;
        ptvitPotokSheme:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Parent.Data).IK;
            yearNode:= potokTreeView.Selected.Parent.Parent.Parent;
          end;
        ptvitPotokSemShema:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Parent.Data).IK;
          end;
        ptvitPotokShemeUnion:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Data).IK;
            yearNode:= potokTreeView.Selected.Parent.Parent;
          end
        else exit;
      end;
      TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, TPotokTreeViewPotokItem(yearNode.Data).IK, potokIK, true);

    end;
finally
  frmNagruzkaEditPotokShemes.Free;
end;
end;

procedure TfmNagruzkaDep.actAddPotokShemaUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokShemeUnion) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokSheme) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotok)
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.CalcHour;
var
  allPlanHour, allBusyHour: double;
begin
  allPlanHour:= 0;
  allBusyHour:= 0;
  incorectDisc.Clear;
  if dsDiscInPlan.DataSet <> nil then
    if dsDiscInPlan.DataSet.Active then
    begin
      dsDiscInPlan.DataSet.DisableControls;
      dsDiscInPlan.DataSet.First;
      while not dsDiscInPlan.DataSet.Eof do
      begin
        allPlanHour:= allPlanHour + dsDiscInPlan.DataSet.FieldByName('Plan_hour').AsFloat;
        allBusyHour:= allBusyHour + dsDiscInPlan.DataSet.FieldByName('busy_hour').AsFloat;
        if RoundFloat(dsDiscInPlan.DataSet.FieldByName('Plan_hour').AsFloat, 5) <> RoundFloat(dsDiscInPlan.DataSet.FieldByName('busy_hour').AsFloat, 5) then
          incorectDisc.Add(dsDiscInPlan.DataSet.FieldByName('ik_disc').AsString + ' - ' + dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').AsString);
        dsDiscInPlan.DataSet.Next;
      end;
      dsDiscInPlan.DataSet.First;
      dsDiscInPlan.DataSet.EnableControls;
    end;
  Label29.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
  Label8.Caption:= FloatToStrF(allBusyHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfmNagruzkaDep.cbKafClick(Sender: TObject);
begin
  dbcbeSpecKeyValueChanged(sender);
end;

function TfmNagruzkaDep.CheckPotokCombine(Grid: TDBGridEh): boolean;
var isRight: boolean;
    i: integer;
    discName: string;
begin
  discName := '';
  for i := 0 to Grid.SelectedRows.Count - 1 do
  with Grid.DataSource.DataSet do
  begin
    GotoBookmark(Pointer(Grid.SelectedRows[i]));
    if discName='' then discName := FieldByName('cName_disc').AsString;
    if (discName<>FieldByName('cName_disc').AsString)or(FieldByName('subgroup_count').AsInteger=0) then
    begin
         result:= false;
         exit;
    end;
  end;
  result:= true;
end;

procedure TfmNagruzkaDep.CloseFrame;
var
  i: integer;
  WaitResult: Cardinal;
begin
 { if Assigned(MyDepThreadQueue) then
  begin
    for I := 0 to MyDepThreadQueue.Count - 1 do
      (MyDepThreadQueue[i] as TThread).Terminate;
 //   WaitForSingleObject(TeacherTreeLoadMutex, INFINITE);
//    WaitForSingleObject(PotokTreeLoadMutex, INFINITE);
 //   MyDepThreadQueue.Clear;
 //   FreeAndNil(MyDepThreadQueue);
 //   ReleaseMutex(PotokTreeLoadMutex);
 //   ReleaseMutex(TeacherTreeLoadMutex);
  end;}
  repeat
    WaitResult:= MsgWaitForMultipleObjects(1, TeacherTreeLoadMutex, true, INFINITE, QS_ALLEVENTS);
  until WaitResult = WAIT_OBJECT_0;
  repeat
    WaitResult:= MsgWaitForMultipleObjects(1, PotokTreeLoadMutex, true, INFINITE, QS_ALLEVENTS);
  until WaitResult = WAIT_OBJECT_0;
//  WaitForSingleObject(TeacherTreeLoadMutex, INFINITE);
//  WaitForSingleObject(PotokTreeLoadMutex, INFINITE);
  TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
  potokTreeView.Items.Clear;
  tvPrepods.Items.Clear;
  inherited;
end;

procedure TfmNagruzkaDep.CreateNagr;
begin
  //вызов заполнения нагрузки по умолчанию
end;

procedure TfmNagruzkaDep.PageControl1Change(Sender: TObject);
var
  temp: TObject;
begin
{if PageControl1.ActivePageIndex=0 then
frmMain.CurrentTopic:='Нагрузка\FrameDep.htm';

if PageControl1.ActivePageIndex=1 then
frmMain.CurrentTopic:='Нагрузка\Add_Thread.htm';

if PageControl1.ActivePageIndex=2 then
frmMain.CurrentTopic:='Нагрузка\Add_NagrDep.htm'; }

  if fIsLoadFromMaster then exit;
  case PageControl1.ActivePageIndex of
  0: if (tvPrepods.SelectionCount > 0) then
      begin
        temp:= tvPrepods.Selected.Data;
        if (temp is TTeacherTreeViewTeacherItem) then
          frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: ' + TTeacherTreeViewTeacherItem(tvPrepods.Selected.Data).TeacherFIO
        else frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: <не выбран>';
      end
      else frmMain.StatusBar1.Panels[1].Text:= 'Преподаватель: <не выбран>';
  1:
  begin
    
  if (potokTreeView.SelectionCount > 0) then
        frmMain.StatusBar1.Panels[1].Text:= 'Поток: ' + TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokName
      else frmMain.StatusBar1.Panels[1].Text:= 'Поток: <не выбран>';
  end;
  2:
  begin
     if dbcbPlan.KeyValue <> NULL then
        frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки: ' + dbcbPlan.Text
     else frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки: <не выбран>';
    // dbNagrCommit.DataSource.DataSet.Refresh;
    RefreshPlanNagr(dbcbPlans.KeyValue);
    RecalcStatistic;
  end;
  3: if fmUchPlan.dbcbYear.KeyValue <> NULL then
        frmMain.StatusBar1.Panels[1].Text:=
        'Учебный план: ' + fmUchPlan.dbcbSpclz.ListSource.DataSet.FieldByName('cName_spclz_short').AsString
         + ', ' + AnsiLowerCase(fmUchPlan.dbcbFormEd.Text) + ', ' + fmUchPlan.dbcbYear.Text
        //'План учебной нагрузки: ' + dbcbPlan.Text
     else frmMain.StatusBar1.Panels[1].Text:= 'Учебный план: <не выбран>';
  end;
end;

procedure TfmNagruzkaDep.potokFilterEnter(Sender: TObject);
begin
  if potokFilter.Text = 'Введите название потока' then
  begin
    potokFilter.Text:= '';
    potokFilter.Font.Color:= clWindowText;
  end;  
end;

procedure TfmNagruzkaDep.potokFilterExit(Sender: TObject);
begin
  if potokFilter.Text = '' then
  begin
    potokFilter.Text:= 'Введите название потока';
    potokFilter.Font.Color:= clSilver;
  end;
end;

procedure TfmNagruzkaDep.potokFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, -1, -1, false);
end;

procedure TfmNagruzkaDep.potokTreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  if not fIsLoadFromMaster then
  begin
    if (potokTreeView.SelectionCount > 0) then
      frmMain.StatusBar1.Panels[1].Text:= 'Поток: ' + TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokName
    else frmMain.StatusBar1.Panels[1].Text:= 'Поток: <не выбран>';
  end;
end;

procedure TfmNagruzkaDep.potokTreeViewDblClick(Sender: TObject);
//var
//  expendState: boolean;
begin
  if TGeneralController.Instance.GetAltKeyState and (potokTreeView.Selected <> nil) then
  begin
   { expendState:= not potokTreeView.Selected.Expanded;
    if expendState then
      potokTreeView.Selected.Expand(false)
    else potokTreeView.Selected.Collapse(false);      }
    case TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType of
      ptvitPotok: actEditPotokExecute(actEditPotok);
      ptvitPotokSheme: actAddPotokShemaExecute(actEditPotokShema);

    end;
  end;
end;

procedure TfmNagruzkaDep.potokTreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var Node: TTreeNode;
  PotokIK: integer;
  fPotokSpec: TSpecNodes;
  I: Integer;
begin
  ShowMessage('Извините! Функция пока не реализована.');
{  Node:=potokTreeView.GetNodeAt(X,Y);

  fPotokSpec := TSpecNodes.Create;
  for I := 0 to dbNagrCommit.SelectedRows.Count - 1 do
  begin
    dbNagrCommit.DataSource.DataSet.GotoBookmark(Pointer(dbNagrCommit.SelectedRows[i]));
    with dbNagrCommit.DataSource.DataSet do
    begin
      fPotokSpec.Add(TSpecNode.Create(FieldByName('ik_spec').AsInteger, FieldByName('ik_year').AsInteger,FieldByName('Ik_grup').AsInteger,
      FieldByName('cName_spec').AsString, FieldByName('year_value').AsString,FieldByName('Cname_grup').AsString));
    end;

  end;
  if Node = nil then PotokIK := 0
   // ShowMessage('Новый поток')
    else  //ShowMessage('В поток ' + TPotokTreeViewPotokItem(Node.Data).PotokName)
       PotokIK := TPotokTreeViewPotokItem(Node.Data).PotokIK;

 // TNagruzkaController.Preparation.CreatePotokByGroups(PotokIK, Self.IK, YearIK, fPotokSpec);
 }
end;

procedure TfmNagruzkaDep.potokTreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = dbNagrCommit;

end;

procedure TfmNagruzkaDep.potokTreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if Node <> nil then
    if TPotokTreeViewPotokItem(Node.Data).PotokTreeViewItemType = ptvitPotok then
      if not TPotokTreeViewPotokItem(Node.Data).IsLoad then
        TNagruzkaController.Preparation.LoadPotokNodeInfo(potokTreeView, Node);
end;

procedure TfmNagruzkaDep.potokTreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (potokTreeView.SelectionCount > 0) and (Key = VK_RETURN) and (not fIsLoadFromMaster) then
    case TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType of
      ptvitPotok: actEditPotokExecute(actEditPotok);
      ptvitPotokSheme: actAddPotokShemaExecute(actEditPotokShema);
    end;
end;

procedure TfmNagruzkaDep.dbgVidZanyatPlanDblClick(Sender: TObject);
begin
  if TGeneralController.Instance.GetAltKeyState then
  begin
    if actGetDistributedNagr.Enabled then
      actGetDistributedNagrExecute(actGetDistributedNagr);
  end
  else
  begin
    if actEditDisc.Enabled then
      actAddDiscExecute(actEditDisc);
  end;
end;

procedure TfmNagruzkaDep.actExportTeacherListExecute(Sender: TObject);
begin
try
  Panel9.Visible:= true;
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Refresh;
  TNagruzkaController.Preparation.ExportTeacherList(IK, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportTeacherListUpdate(Sender: TObject);
begin
  actExportTeacherList.Enabled:= tvPrepods.Items.Count > 0;
end;

procedure TfmNagruzkaDep.actExportUpdate(Sender: TObject);
begin
  actLockUnlockPlanUpdate(actExportDepPlan);
  actExportSummaryNagrForYearUpdate(actExportSummaryNagrForYear);
  (Sender as TAction).Enabled:= actExportDepPlan.Enabled or actExportSummaryNagrForYear.Enabled;
end;

procedure TfmNagruzkaDep.dbgVidZanyatPlanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'cName_disc') then
  begin
    if incorectDisc.IndexOf(dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_potok_semestr').AsString) > -1 then
    begin
      dbgVidZanyatPlan.Canvas.Font.Color:= clRed;
      dbgVidZanyatPlan.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, Column.Field.AsString);
    end;
  end;
end;

procedure TfmNagruzkaDep.dbgVidZanyatPlanDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (Field.FieldName = 'cName_disc') then
  begin
    if incorectDisc.IndexOf(dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_potok_semestr').AsString) > -1 then
    begin
      dbgVidZanyatPlan.Canvas.Font.Color:= clRed;
      dbgVidZanyatPlan.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, Field.AsString);
    end;
  end;
end;

procedure TfmNagruzkaDep.dbgVidZanyatPlanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if TGeneralController.Instance.GetAltKeyState then
    begin
      if actGetDistributedNagr.Enabled then
        actGetDistributedNagrExecute(actGetDistributedNagr);
    end
    else
    begin
      if actEditDisc.Enabled then
        actAddDiscExecute(actEditDisc);
    end;
  end;
end;

procedure TfmNagruzkaDep.dbNagrCommitCellMouseClick(Grid: TCustomGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  btnCombinePotoks.Enabled := (dbNagrCommit.SelectedRows.Count > 1)and(CheckPotokCombine(dbNagrCommit));
  btnDividePotok.Enabled := (dbNagrCommit.SelectedRows.Count = 1)and(dbNagrCommit.DataSource.DataSet.FieldByName('nPotoks').AsString<>'');
  btnShema.Enabled := (dbNagrCommit.SelectedRows.Count = 1)and(dbNagrCommit.DataSource.DataSet.FieldByName('nPotoks').AsString<>'');
end;

procedure TfmNagruzkaDep.dbNagrCommitDblClick(Sender: TObject);
var discIK,potokSemIK: integer;
begin

  if dsNagrCommit.DataSet.FieldByName('ik_potok_semestr').AsInteger>0 then
  begin
    discIK := dsNagrCommit.DataSet.FieldByName('ik_disc').AsInteger;
    potokSemIK := dsNagrCommit.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    dbcbPlan.KeyValue := dbcbPlans.KeyValue;

    dsDiscInPlan.DataSet.First;
    while (dsDiscInPlan.DataSet.FieldByName('ik_disc').AsInteger<>discIK)or(dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').AsInteger<>potokSemIK) do
      dsDiscInPlan.DataSet.Next;

    actAddDiscExecute(actEditDisc);
    end;

end;

procedure TfmNagruzkaDep.dbNagrCommitDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 case dbNagrCommit.DataSource.DataSet.FieldByName('n_full').AsInteger of
  0: dbNagrCommit.Canvas.Font.Color:= clBlack;
  1: dbNagrCommit.Canvas.Font.Color:= clBlue;
  2: dbNagrCommit.Canvas.Font.Color:= clRed;
 end;
  dbNagrCommit.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, Column.Field.AsString);
end;

procedure TfmNagruzkaDep.dbNagrCommitDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
 case dbNagrCommit.DataSource.DataSet.FieldByName('n_full').AsInteger of
  0: dbNagrCommit.Canvas.Font.Color:= clBlack;
  1: dbNagrCommit.Canvas.Font.Color:= clBlue;
  2: dbNagrCommit.Canvas.Font.Color:= clRed;
 end;
  dbNagrCommit.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, Field.AsString);
end;

procedure TfmNagruzkaDep.actExportDepPlanExecute(Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
try
  Refresh;
  TNagruzkaController.PlanNagruzka.ExportKafedraPlan(dbcbPlan.KeyValue, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportDistributedNagrForSheduleExecute(
  Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
try
  Refresh;
  TNagruzkaController.PlanNagruzka.ExportDitributedNagrForShedule(dbcbPlan.KeyValue, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportDistributedNargExecute(Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
try
  Refresh;
  TNagruzkaController.PlanNagruzka.ExportDitributedNagr(dbcbPlan.KeyValue, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportFactNagrExecutionExecute(Sender: TObject);
begin
   Panel4.Visible := false;
  if cbRepType.Text = 'за семестр' then
  begin
  if cbFormEd.Text = 'бюджет' then
   TNagruzkaController.PrintFactNagrExecution(fYearIK, fSemIK, (FrameObject as TDBNodedepartmentObject).ik, 1)
   else
   TNagruzkaController.PrintFactNagrExecution(fYearIK, fSemIK, (FrameObject as TDBNodedepartmentObject).ik, 2);
  end
   else
   if cbFormEd.Text = 'бюджет' then
   TNagruzkaController.PrintFactNagrExecution(fYearIK, 0, (FrameObject as TDBNodedepartmentObject).ik, 1)
   else
   TNagruzkaController.PrintFactNagrExecution(fYearIK, 0, (FrameObject as TDBNodedepartmentObject).ik, 2);

end;

procedure TfmNagruzkaDep.actExportFactPlanResultExecute(Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
try
  Refresh;
  TNagruzkaController.FactNagruzka.ExportFactResult(dbcbPlan.KeyValue, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportSummaryNagrForYearExecute(Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
try
  Refresh;
  TNagruzkaController.PlanNagruzka.ExportKafedraPlanForYear(IK, fYearIK, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actExportSummaryNagrForYearUpdate(Sender: TObject);
begin
  if dbcbPlan.ListSource <> nil then
  begin
    if dbcbPlan.ListSource.DataSet.Active then
      (Sender as TAction).Enabled:= dbcbPlan.ListSource.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.actGetDistributedNagrExecute(Sender: TObject);
var
  temp: TfrmNagruzkaDistributedDuty;
//  studCount: integer;
//  DiscHour, RaspHour: double;
begin
 // studCount:=0;
  temp:= TfrmNagruzkaDistributedDuty.CreateDialog(nil, Connection, nil);
  temp.Tag:= 1;
  temp.Read(dbcbPlan.KeyValue, fYearIK, fSemIK, dsDiscInPlan.DataSet.FieldByName('ik_disc').AsInteger, dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').AsInteger, IK, dsDiscInPlan.DataSet.FieldByName('plan_hour').AsFloat);
  temp.AllHour:= dsDiscInPlan.DataSet.FieldByName('plan_hour').AsFloat;
  temp.ShowModal;
  if temp.Tag = 4 then
  begin
//    TNagruzkaController.Instance.LoadContentPlanNagr(false, dbcbPlan.KeyValue, dsDiscInPlan.DataSet.FieldByName('ik_potok').AsInteger, dsDiscInPlan.DataSet.FieldByName('ik_disc').AsInteger, dsDiscInPlan.DataSet.FieldByName('ik_type_disc').AsInteger, dsDiscInPlan.DataSet.FieldByName('n_sem').AsInteger, dsDiscInPlan.DataSet.FieldByName('bit_calc_as_practice').AsBoolean, DiscHour, RaspHour, true);
    dsDiscInPlan.DataSet.Edit;
    dsDiscInPlan.DataSet.FieldByName('busy_hour').AsFloat:= temp.DistrHour; // RaspHour;
    dsDiscInPlan.DataSet.Post;
 //   TNagruzkaController.Instance.CloseContentPlanNagr;
    CalcHour;
  end;
  temp.Free;
end;

procedure TfmNagruzkaDep.actNagrAutoFillExecute(Sender: TObject);
var   conflicList: TObjectList;
      temp: TfrmNagruzkaConflictOnAvtoBuild;
      FWaitingForm : TfrmWaiting;
      aMes: string;
begin

  dm.aspPlanNormTime.Locate('ik_plan_nagr', dbcbPlans.KeyValue, []);

  if dm.aspPlanNormTime.FieldByName('ik_norm_time').Value > 0  then
  begin
    //здесь будет бегунок
    FWaitingForm := TfrmWaiting.Create(nil);
    //FWaitingForm.ActionComponentUI1.ActionComponent:=Report;
    FWaitingForm.Show;
   // FWaitingForm.WindowReportControlCollection1ProgressMessage(nil,2,'Идет подсчет нагрузки',aMes);
    {------------------------------------------------------------------------------------------------}

    if dm.aspDefaultPotoks.Active then dm.aspDefaultPotoks.Close;
    dm.aspDefaultPotoks.Parameters.ParamByName('@ik_plan_nagr').Value:= dbcbPlans.KeyValue;
    dm.aspDefaultPotoks.ExecProc;

    conflicList:= TObjectList.Create;
    try
      TNagruzkaController.PlanNagruzka.LoadPlanNagrAvto(dbcbPlans.KeyValue, conflicList);
      dbcbPlanKeyValueChanged(nil);
      if conflicList.Count > 0 then
      begin
        temp:= TfrmNagruzkaConflictOnAvtoBuild.CreateDialog(nil, self.Connection, nil);
        temp.Read(conflicList);
        temp.ShowModal;
        temp.Free;
      end;
    finally
      conflicList.Clear;
      conflicList.Free;
      Panel8.Visible:= false;

      RefreshPlanNagr(dbcbPlans.KeyValue);
      RecalcStatistic;

    //бегунок закончился
    FWaitingForm.Close;
    FWaitingForm.Free;
    FWaitingForm:=nil;
    end
  end

   else
      if MessageBox(Handle, 'Проверьте нормы времени, установленные для плана нагрузки',
      'Невозможно автоматически запланировать нагрузку', MB_OKCancel)=mrOk
      then begin
        PageControl1.ActivePageIndex := 4;
      end;

end;

procedure TfmNagruzkaDep.actNormSaveChangesExecute(Sender: TObject);
begin
    fIsNormChange:= not TNagruzkaController.Preparation.SavePlanNormTime(Self.IK, YearIK, SemIK);

end;

procedure TfmNagruzkaDep.actNormUndoChangesExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите отменить сделанные изменения значений норм времени?', 'Отмена изменений в разделе "Нормы времени"', MB_YESNO) = mrYes then
  begin
    dsPlanNormTime.DataSet.Close;
    dsPlanNormTime.DataSet.Open;
  end;
  fIsNormChange := false;
end;

procedure TfmNagruzkaDep.actNormUndoChangesUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= fIsNormChange;
end;

procedure TfmNagruzkaDep.actAddPotokSemesterShemaExecute(Sender: TObject);
var
  potokIK, ShemaIK: integer;
  yearNode: TTreeNode;
begin
  inherited;
  frmNagruzkaEditPotokSemShemes:= TfrmNagruzkaEditPotokSemShemes.CreateDialog(Application, self.Connection, nil);
  try

  {  frmNagruzkaEditPotokSemShemes.IK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;

    case TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType of
        ptvitPotok: ShemaIK := -1;  //если выделили поток
        ptvitPotokSheme: ShemaIK:= TPotokTreeViewPotokShemeItem(potokTreeView.Selected.Data).PotokShemeIK;  //Выделили конкретную схему
        ptvitPotokSemShema: ShemaIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Parent.Data).IK;
        ptvitPotokShemeUnion: ShemaIK := -1;   //если выделили наименование "Схемы деления"
        else exit;
      end;                }

    frmNagruzkaEditPotokSemShemes.IK:= dsNagrCommit.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    ShemaIK := -1;

    frmNagruzkaEditPotokSemShemes.ShemaIK := ShemaIK;

    frmNagruzkaEditPotokSemShemes.PotokName := dsNagrCommit.DataSet.FieldByName('nPotoks').AsString;
    frmNagruzkaEditPotokSemShemes.YearIK := fYearIK;
    frmNagruzkaEditPotokSemShemes.Caption:= 'Редактирование схем деления для потока "' + dsNagrCommit.DataSet.FieldByName('nPotoks').AsString + '"';
    if ShemaIK=-1 then frmNagruzkaEditPotokSemShemes.Read;

  if (frmNagruzkaEditPotokSemShemes.ShowModal() = mrOk)  or (frmNagruzkaEditPotokSemShemes.bbApply.Tag = 1) then
  begin
   {  case TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType of
        ptvitPotok:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
            yearNode:= potokTreeView.Selected;
          end;
        ptvitPotokSheme:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Parent.Data).IK;
            yearNode:= potokTreeView.Selected.Parent.Parent;
          end;
        ptvitPotokSemShema:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Parent.Data).IK;
          end;
        ptvitPotokShemeUnion:
          begin
            potokIK:= TPotokTreeViewPotokItem(potokTreeView.Selected.Parent.Data).IK;
            yearNode:= potokTreeView.Selected.Parent;
          end
        else exit;
      end;
      TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, TPotokTreeViewPotokItem(yearNode.Data).IK, potokIK, true);
      }
    end;
finally
  frmNagruzkaEditPotokShemes.Free;
end;    
end;

procedure TfmNagruzkaDep.actAddPotokSemesterShemaUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokShemeUnion) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotokSheme) or (TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotok)
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.actLoadNagrAvtoExecute(Sender: TObject);
var
  conflicList: TObjectList;
  temp: TfrmNagruzkaConflictOnAvtoBuild;
begin
  Panel8.Top:= round((Height - Panel8.Height)/2);
  Panel8.Left:= round((Width - Panel8.Width)/2);
  Panel8.Visible:= true;
  Refresh;
  conflicList:= TObjectList.Create;
try
  TNagruzkaController.PlanNagruzka.LoadPlanNagrAvto(dbcbPlan.KeyValue, conflicList);
  dbcbPlanKeyValueChanged(nil);
  if conflicList.Count > 0 then
  begin
    temp:= TfrmNagruzkaConflictOnAvtoBuild.CreateDialog(nil, self.Connection, nil);
    temp.Read(conflicList);
    temp.ShowModal;
    temp.Free;
  end;
finally
  conflicList.Clear;
  conflicList.Free;
  Panel8.Visible:= false;
end;
end;

procedure TfmNagruzkaDep.actLoadPotokExecute(Sender: TObject);
var tempForm: TfrmAddPotokSemester;
begin
  tempForm:= TfrmAddPotokSemester.CreateDialog(Application, Connection, nil);

  try
  tempForm.IK:= Self.IK;
  tempForm.SemIK := fSemIK;
  tempForm.YearIK := fYearIK;
 { if TAction(Sender).Tag = 1  then
    tempForm.Tag:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;  }
 { else tempForm.Tag:= -1;}
  tempForm.Read;
  if (tempForm.ShowModal() = mrOk) {or (tempForm.bbApply.Tag = 1)} then
  begin
   // if TAction(Sender).Tag = 1 then
      TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, tempForm.dbcbSemester.KeyValue, tempForm.Tag, false)
   // else TPotokTreeLoadThread.Create(Self.IK, potokTreeView, potokFilter.Text, tempForm.dbcbYear.KeyValue, -1, false);
  end;
finally
  tempForm.Free;
  potokTreeView.Items.Clear;
 // TPotokTreeLoadThread.Create(Self.IK, SemIK, YearIK, potokTreeView, potokFilter.Text, -1, -1, false);
  //TPotokTreeLoadThread.Execute;
end;
end;

procedure TfmNagruzkaDep.actLockUnlockPlanExecute(Sender: TObject);
begin
  TNagruzkaController.PlanNagruzka.SetPlanStatus(dbcbPlan.KeyValue, not dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean);
  dbcbPlan.ListSource.DataSet.Close;
  dbcbPlan.ListSource.DataSet.Open;
  if dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean then
    Label6.Caption:= 'редактирование плана запрещено'
  else
    Label6.Caption:= 'редактирование плана разрешено';
end;

procedure TfmNagruzkaDep.actLockUnlockPlanUpdate(Sender: TObject);
begin
  if (dbcbPlan.ListSource <> nil) then
  begin
    if (dbcbPlan.ListSource.DataSet <> nil) then
    begin
      if dbcbPlan.ListSource.DataSet.Active and dbcbPlan.Enabled then
        (Sender as TAction).Enabled:= (dbcbPlan.KeyValue <> NULL)
      else (Sender as TAction).Enabled:= false;
    end
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
  if (Sender as TAction).Enabled then
  begin
    if dbcbPlan.ListSource.DataSet.FieldByName('bit_close_status').AsBoolean then
    begin
      (Sender as TAction).Hint:= 'Разрешить редактирование плана учебной нагрузки';
      actLockUnlockPlan.ImageIndex:= 27;
    end
    else
    begin
      (Sender as TAction).Hint:= 'Запретить редактирование плана учебной нагрузки';
      actLockUnlockPlan.ImageIndex:= 26;
    end;
  end;
end;

procedure TfmNagruzkaDep.actShowUchPlanExecute(Sender: TObject);
var tempDS: TADODataSet;
    pID: integer;
begin
   //загрузить список спецальностей
   dmUgtuStructure.adospSpecForNagr.Active := false;
   with dmUgtuStructure.adospSpecForNagr.Parameters do
   begin
     Clear;
     AddParameter;
     Items[0].Value := 3;
     AddParameter;
     Items[1].Value := ik;
     AddParameter;
     Items[2].Value := 0;
  end;
  dmUgtuStructure.adospSpecForNagr.ExecProc;
  dmUgtuStructure.adospSpecForNagr.Active := true;
   pID := TPotokTreeViewPotokItem(potokTreeView.Selected.Data).IK;
   PageControl1.ActivePageIndex := 3;
   tempDS := TGeneralController.Instance.GetNewADODataSet(false);
   tempDS.CommandText := 'select Uch_pl.*,(yup.year_value - Year_uch_pl.year_value)*2+ps.id_sem_type n_sem from Uch_pl, Year_uch_pl,Potok, Potok_semestr ps, Year_uch_pl yup '+
                         'where Uch_pl.ik_uch_plan = Potok.ik_uch_plan and Potok.ik_potok = ps.id_potok and Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl ' +
                         'and ps.id_year = yup.ik_year_uch_pl and ps.ik_potok_semestr = ' + IntToStr(pID);
   tempDS.Open;
   dbcbeSpec.KeyValue := tempDS.FieldByName('ik_spec').AsInteger;

   if tempDS.FieldByName('ik_spclz').AsInteger <> 0 then
      fmUchPlan.dbcbSpclz.KeyValue := tempDS.FieldByName('ik_spclz').AsInteger
     else fmUchPlan.dbcbSpclz.KeyValue := -1;
   fmUchPlan.dbcbFormEd.KeyValue := tempDS.FieldByName('ik_form_ed').AsInteger;
   fmUchPlan.dbcbYear.KeyValue := tempDS.FieldByName('ik_year_uch_pl').AsInteger;
   fmUchPlan.cmbxSem.Value :=  tempDS.FieldByName('n_sem').AsInteger;

   tempDS.Close;
   tempDS.Free;
end;

procedure TfmNagruzkaDep.actShowUchPlanUpdate(Sender: TObject);
begin
  if (potokTreeView.SelectionCount > 0) then
    (Sender as TAction).Enabled:= TPotokTreeViewPotokItem(potokTreeView.Selected.Data).PotokTreeViewItemType = ptvitPotok
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaDep.Button1Click(Sender: TObject);
begin
  inherited;
  CreateNagr;
end;

procedure TfmNagruzkaDep.btnShemaClick(Sender: TObject);
begin
  inherited;
  actAddPotokSemesterShemaExecute(nil);
end;

end.
