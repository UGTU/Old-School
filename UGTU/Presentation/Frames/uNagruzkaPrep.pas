unit uNagruzkaPrep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, DBGridEh, DBTVTeacherobj,
  DB, ImgList, ActnList, Grids, Mask, DBCtrlsEh, DBLookupEh, ToolWin, ADODB,
  SheduleController, Menus, GeneralController, NagruzkaController, GridsEh;

type
  PPanel = ^TPanel;
  PToolButton = ^TToolButton;
  PDBLookupComboboxEh = ^TDBLookupComboboxEh;
  PDBEditEh = ^TDBEditEh;
  
  TfmNagruzkaPrep = class(TfmBase)
    PageControl1: TPageControl;
    actList: TActionList;
    ImageList1: TImageList;
    actAddPlan: TAction;
    actDelPlan: TAction;
    dsFactNagr: TDataSource;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    Panel7: TPanel;
    Label27: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    dsPlanNagr: TDataSource;
    TabSheet5: TTabSheet;
    ToolBar2: TToolBar;
    Panel2: TPanel;
    dbcbFact: TDBLookupComboboxEh;
    Label1: TLabel;
    dbgVidZanyatPlan: TDBGridEh;
    actAddFact: TAction;
    ToolButton8: TToolButton;
    dbgVidZanyatFact: TDBGridEh;
    actEditPlan: TAction;
    ToolButton1: TToolButton;
    actEditFact: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actDelFact: TAction;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    actExportTeacherPlan: TAction;
    Panel9: TPanel;
    Label31: TLabel;
    ProgressBar1: TProgressBar;
    PopupMenu5: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    Panel4: TPanel;
    Label14: TLabel;
    Label36: TLabel;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    PopupMenu7: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    actAddFact1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel16: TPanel;
    Image1: TImage;
    Label15: TLabel;
    Label16: TLabel;
    Bevel6: TBevel;
    Panel20: TPanel;
    Image2: TImage;
    Label43: TLabel;
    Label44: TLabel;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    actGiveDutyToAnotherTeacher: TAction;
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure dbcbFactKeyValueChanged(Sender: TObject);
    procedure actEditFactUpdate(Sender: TObject);
    procedure actAddFactExecute(Sender: TObject);
    procedure actAddFactUpdate(Sender: TObject);
    procedure actAddPlanUpdate(Sender: TObject);
    procedure actEditPlanUpdate(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actDelFactExecute(Sender: TObject);
    procedure actDelPlanExecute(Sender: TObject);
    procedure actExportTeacherPlanUpdate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actExportTeacherPlanExecute(Sender: TObject);
    procedure dbgVidZanyatFactDblClick(Sender: TObject);
    procedure dbgVidZanyatPlanDblClick(Sender: TObject);
    procedure dbgVidZanyatPlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgVidZanyatFactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actGiveDutyToAnotherTeacherExecute(Sender: TObject);
    procedure dbgVidZanyatFactDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    fIK: Integer;
    fYearIK: integer;
    fSemIK: integer;
    fNormOfTime: TADODataSet;
    incorrectDisc, correctDisc: TStringList;
    fLastPlanIK: integer;
    fLastFactIK: integer;
    fIsLoadFromMaster: boolean;
  protected
    procedure DoRefreshFrame;override;
  public
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure CloseFrame; override;
    procedure Read;
    property IK: Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
    property LastPlanIK: integer read fLastPlanIK write fLastPlanIK default -1;
    property LastFactIK: integer read fLastFactIK write fLastFactIK default -1;
    property IsLoadFromMaster: boolean read fIsLoadFromMaster write fIsLoadFromMaster default false;
  end;

var
  fmNagruzkaPrep: TfmNagruzkaPrep;

implementation

uses uNagruzkaAddPlan,  uMain, DBTVObj, DBTVDepObj, DBTVFacDepObj,
  DateUtils, uNagruzkaAddFact, uNagruzkaDiscToTeacher,
  uNagruzkaSelTeacherForFactEdit, uNagruzkaSelectTeacher;

{$R *.dfm}

procedure TfmNagruzkaPrep.Read;
begin
  PageControl1.ActivePageIndex:= 0;
  Refresh;
  incorrectDisc:= TStringList.Create;
  correctDisc:= TStringList.Create;

  fNormOfTime:= TADODataSet.Create(nil);
  fNormOfTime.Connection:= Self.Connection;

  //план
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cName_plan');
  if fLastPlanIK = -1 then
    dbcbPlan.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, true, NULL)
  else
    dbcbPlan.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, fLastPlanIK);

  //fact
  TGeneralController.Instance.InitializeLockupCB(@dbcbFact, 'ik_plan_nagr', 'cName_plan');

  if fLastFactIK = -1 then
    dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, true, NULL)
  else dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, fLastFactIK);

  {dbgVidZanyatPlan.Height:= Panel7.Height - 85;
  Panel4.Top:= dbgVidZanyatPlan.Height + dbgVidZanyatPlan.Top + 5;
  dbgVidZanyatFact.Height:= Panel7.Height - 85;
  Panel5.Top:= dbgVidZanyatFact.Height + dbgVidZanyatFact.Top + 5; }

  PageControl1Change(PageControl1);
end;

procedure TfmNagruzkaPrep.dbcbPlanKeyValueChanged(Sender: TObject);
var
  planHour: double;
begin
  planHour:= 0;
  //semPlanHour:= 0;
  if dsPlanNagr.DataSet <> nil then
  begin
    if dsPlanNagr.DataSet.Active then
      dsPlanNagr.DataSet.Close;
    dsPlanNagr.DataSet.Free;
  end;
  if (dbcbPlan.KeyValue <> NULL) then
  begin
    Panel20.Left:= round(Width/2 - Panel20.Width/2);
    Panel20.Top:= round(Height/2 - Panel20.Height/2);
    Panel20.Visible:= true;
    Refresh;
    try
      dsPlanNagr.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
      TNagruzkaController.Instance.LoadAllTeacherPlanNagr(@dsPlanNagr.DataSet, dbcbPlan.KeyValue, self.IK, planHour);
    //semPlanHour:= TNagruzkaController.Instance.GetAllSemesterPlanHour(dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, IK);
    finally
      Panel20.Visible:= false;
      if not fIsLoadFromMaster then frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (план): ' + dbcbPlan.Text
    end;
  end
  else if not fIsLoadFromMaster then frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (план): <не выбран>';
  Label14.Caption:= FloatToStrF(planHour, ffFixed, 10, 2) + ' час.';
  //Label3.Caption:= FloatToStrF(semPlanHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfmNagruzkaPrep.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaPrep.dbcbFactKeyValueChanged(Sender: TObject);
var
  allPlanHour, allFactHour: double;
begin
  allPlanHour:= 0;
  allFactHour:= 0;
 // semFactHour:= 0;
//  semPlanHour:= 0;
  if dsFactNagr.DataSet <> nil then
  begin
    if dsFactNagr.DataSet.Active then
      dsFactNagr.DataSet.Close;
    dsFactNagr.DataSet.Free;
  end;
  if (dbcbFact.KeyValue <> NULL) then
  begin
    Panel20.Left:= round(Width/2 - Panel20.Width/2);
    Panel20.Top:= round(Height/2 - Panel20.Height/2);
    Panel20.Visible:= true;
    Refresh;
    try
      dsFactNagr.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
      TNagruzkaController.Instance.LoadAllTeacherFactNagr(@dsFactNagr.DataSet, dbcbFact.KeyValue, self.IK, allFactHour, incorrectDisc, correctDisc);
      // временное решение, вместо него надо то, что закомментировано ниже
      dsFactNagr.DataSet.First;
      allPlanHour:= 0;
      while not dsFactNagr.DataSet.Eof do
      begin
        allPlanHour:= allPlanHour + dsFactNagr.DataSet.FieldByName('plan_hour').AsFloat;
        dsFactNagr.DataSet.Next;
      end;
      //allPlanHour:= TNagruzkaController.Instance.GetAllTeacherPlanHour(dbcbFact.KeyValue, IK);
 //   semPlanHour:= TNagruzkaController.Instance.GetAllSemesterPlanHour(dbcbFact.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbFact.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, IK);
//    semFactHour:= TNagruzkaController.Instance.GetAllSemesterFactHour(dbcbFact.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbFact.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, IK);
    finally
      Panel20.Visible:= false;
      if not fIsLoadFromMaster then frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (факт): ' + dbcbFact.Text;
    end;
  end
  else if not fIsLoadFromMaster then frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (факт): <не выбран>';
  Label9.Caption:= FloatToStrF(allFactHour, ffFixed, 10, 2) + ' час.';
  Label12.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
//  Label5.Caption:= FloatToStrF(semPlanHour, ffFixed, 10, 2) + ' час.';
//  Label8.Caption:= FloatToStrF(semFactHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfmNagruzkaPrep.actEditFactUpdate(Sender: TObject);
begin
  if dsFactNagr.DataSet <> nil then
  begin
    if dsFactNagr.DataSet.Active then
      (Sender as TAction).Enabled:= dsFactNagr.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaPrep.actAddFactExecute(Sender: TObject);
var
  temp: TfrmNagruzkaAddFact;
  tempSTFE: TfrmNagruzkaSelTeacherForFactEdit;
  tempDS: TADODataSet;
  fTeacherIK: integer;
begin
  temp:= nil;
  fTeacherIK:= 0;
  if ((Sender as TAction).Tag = 1) then
  begin
    tempSTFE:= nil;
    tempDS:= nil;
    try
      tempDS:= TNagruzkaController.Instance.GetTeacherIKFromTeacherPlan(dbcbFact.KeyValue, dsFactNagr.DataSet.FieldByName('ik_disc').AsInteger, dsFactNagr.DataSet.FieldByName('ik_potok').AsInteger, self.IK);
      if tempDS.RecordCount > 1 then
      begin
        tempSTFE:= TfrmNagruzkaSelTeacherForFactEdit.CreateDialog(nil, Connection, nil);
        tempSTFE.Read(tempDS, self.IK);
        if tempSTFE.ShowModal() = mrOk then fTeacherIK:= tempSTFE.dbcbPrep.KeyValue
        else exit;
      end
      else fTeacherIK:= tempDS.FieldByName('ik_id_prepod').AsInteger;
    finally
      if tempSTFE <> nil then tempSTFE.Free;
      if tempDS <> nil then if tempDS.Active then tempDS.Close;
      tempDS.Free;
    end;
  end;
try
  temp:= TfrmNagruzkaAddFact.CreateDialog(nil, self.Connection, nil);
  temp.IK:= self.IK;
  temp.Label2.Caption:= TNagruzkaController.Instance.GetTeacherFIO(self.IK);
  temp.Read(dbcbFact.KeyValue, fYearIK, fSemIK);
  if ((Sender as TAction).Tag = 1) then
  begin
    temp.dbcbPlan.KeyValue:= dbcbFact.KeyValue;
    if fTeacherIK = 0 then
      temp.dbcbPrep.KeyValue:= self.IK
    else
      temp.dbcbPrep.KeyValue:= fTeacherIK;
    temp.dbcbDisc.KeyValue:= dsFactNagr.DataSet.FieldByName('ik_disc').AsInteger;
    temp.dbcbPotok.KeyValue:= dsFactNagr.DataSet.FieldByName('ik_potok').AsInteger;
  end;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbFact);
    dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, temp.dbcbPlan.KeyValue);
    if (temp.dbcbDisc.KeyValue <> NULL) and (temp.dbcbPotok.KeyValue <> NULL) then
      dsFactNagr.DataSet.Locate('ik_disc; ik_potok', VarArrayOf([temp.dbcbDisc.KeyValue, temp.dbcbPotok.KeyValue]), [loPartialKey]);
  end;
finally
  if temp <> nil then temp.Free;
end;
end;

procedure TfmNagruzkaPrep.actAddFactUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled:= dbcbFact.KeyValue <> NULL;
end;

procedure TfmNagruzkaPrep.actAddPlanUpdate(Sender: TObject);
begin
  actAddPlan.Enabled:= dbcbPlan.KeyValue <> NULL;
end;

procedure TfmNagruzkaPrep.actEditPlanUpdate(Sender: TObject);
begin
   if dsPlanNagr.DataSet <> nil then
   begin
    if dsPlanNagr.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanNagr.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmNagruzkaPrep.actEditPlanExecute(Sender: TObject);
var
  temp: TfrmNagruzkaDiscToTeacher;
begin
  temp:= nil;
try
  temp:= TfrmNagruzkaDiscToTeacher.CreateDialog(nil, self.Connection, nil);
  temp.IK:= self.IK;
  temp.Read(dbcbPlan.KeyValue, fYearIK, fSemIK);
  if ((Sender as TAction).Tag = 1) then
  begin
    temp.dbcbDisc.KeyValue:= dsPlanNagr.DataSet.FieldByName('ik_disc').AsInteger;
    temp.dbcbPotok.KeyValue:= dsPlanNagr.DataSet.FieldByName('ik_potok').AsInteger;
  end;
  temp.IsModified:= false;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, temp.dbcbPlan.KeyValue);
    if (temp.dbcbDisc.KeyValue <> NULL) and (temp.dbcbPotok.KeyValue <> NULL) then
      dsPlanNagr.DataSet.Locate('ik_disc; ik_potok', VarArrayOf([temp.dbcbDisc.KeyValue, temp.dbcbPotok.KeyValue]), [loPartialKey]);
    dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbFact));
  end;
finally
  if temp <> nil then temp.Free;
end;
end;

procedure TfmNagruzkaPrep.actDelFactExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('¬ы уверены, что хотите удалить фактическую нагрузку по выбранной дисциплине?'),'”даление дисциплины из фактической нагрузки преподавател€', mb_YesNo) = mrYes) then
  begin
    TNagruzkaController.Instance.DeleteDiscFromFactNagr(dbcbFact.KeyValue, dsFactNagr.DataSet.FieldByName('ik_disc').AsInteger, dsFactNagr.DataSet.FieldByName('ik_potok').AsInteger, self.IK);
    dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbFact));
  end;
end;

procedure TfmNagruzkaPrep.actDelPlanExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('¬ы уверены, что хотите отменить закрепление учебной нагрузки по выбранной дисциплине за данным преподавателем?' + #10#13#10#13 +
   'ѕри этом будут удалены соответсвующие записи: ' + #10#13 +
   '  1) из фактической нагрузки преподавателей;' + #10#13 +
   '  2) из расписани€ преподавателей.'),'”даление дисциплины из плана учебной нагрузки', mb_YesNo) = mrYes) then
  begin
    TNagruzkaController.Instance.DeleteDiscFromTeacherPlanNagr(self.IK, dbcbPlan.KeyValue, dsPlanNagr.DataSet.FieldByName('ik_disc').AsInteger, dsPlanNagr.DataSet.FieldByName('ik_potok').AsInteger);
    dbcbPlan.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbPlan));
    dbcbFact.KeyValue:= TNagruzkaController.Instance.GetPlansForTeacher(@dbcbFact.ListSource.DataSet, self.IK, fYearIK, fSemIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbFact));
  end;
end;

procedure TfmNagruzkaPrep.CloseFrame;
begin
  if dbcbPlan.KeyValue <> NULL then
    fLastPlanIK:= TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
  if dbcbFact.KeyValue <> NULL then
    fLastFactIK:= TGeneralController.Instance.CloseLockupCB(@dbcbFact);
  inherited;
end;

constructor TfmNagruzkaPrep.CreateFrame(AOwner: TComponent; AObject: TObject;
  AConn: TADOConnection);
begin
  inherited CreateFrame(AOwner, AObject, AConn);
  fLastPlanIK:= -1;
  fLastFactIK:= -1;
end;

procedure TfmNagruzkaPrep.actExportTeacherPlanUpdate(Sender: TObject);
begin
  actExportTeacherPlan.Enabled:= dbcbFact.KeyValue <> NULL;
end;

procedure TfmNagruzkaPrep.actGiveDutyToAnotherTeacherExecute(Sender: TObject);
var
  tempST: TfrmNagruzkaSelectTeacher;
begin
  tempST:= TfrmNagruzkaSelectTeacher.CreateDialog(nil, Connection, nil);
  try
    tempST.Read(dbcbPlan.ListSource.DataSet.FieldByName('ik_kaf').AsInteger);
    if tempST.ShowModal = mrOk then
      if TNagruzkaController.Instance.GiveDutyToAnotherTeacher(self.IK, tempST.dbcbWorkType.KeyValue, dbcbPlan.KeyValue, dsPlanNagr.DataSet.FieldByName('ik_disc').AsInteger, dsPlanNagr.DataSet.FieldByName('ik_potok').AsInteger, -1) then
        actDelPlanExecute(actDelPlan);
  finally
    if Assigned(tempST) then tempST.Free;
  end;
end;

procedure TfmNagruzkaPrep.PageControl1Change(Sender: TObject);
begin

{if PageControl1.ActivePageIndex=0 then
frmMain.CurrentTopic:='Ќагрузка\Add_PlanNagrPrep.htm';

if PageControl1.ActivePageIndex=1 then
frmMain.CurrentTopic:='Ќагрузка\Add_FactNagrPrep.htm';}


  if fIsLoadFromMaster then exit;
  case PageControl1.ActivePageIndex of
  0: if dbcbPlan.KeyValue <> NULL then
       frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (план): ' + dbcbPlan.Text
     else frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (план): <не выбран>';

  1: 
   { if dbcbFact.KeyValue <> NULL then
       frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (факт): ' + dbcbFact.Text
     else frmMain.StatusBar1.Panels[1].Text:= 'ѕлан учебной нагрузки (факт): <не выбран>';   }
  end;
end;

procedure TfmNagruzkaPrep.actExportTeacherPlanExecute(Sender: TObject);
begin
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
  Refresh;
try
  TNagruzkaController.Instance.ExportIndividTeacherPlan(dbcbFact.KeyValue, self.ik, ProgressBar1);
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmNagruzkaPrep.dbgVidZanyatFactDblClick(Sender: TObject);
begin
  if actEditFact.Enabled then
    actAddFactExecute(actEditFact);
end;

procedure TfmNagruzkaPrep.dbgVidZanyatPlanDblClick(Sender: TObject);
begin
  if actEditPlan.Enabled then
    actEditPlanExecute(actEditPlan);
end;

procedure TfmNagruzkaPrep.dbgVidZanyatPlanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditPlan.Enabled then
      actEditPlanExecute(actEditPlan);
end;

procedure TfmNagruzkaPrep.dbgVidZanyatFactDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'cName_disc') then
  begin
    if incorrectDisc.IndexOf(dbgVidZanyatFact.DataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + dbgVidZanyatFact.DataSource.DataSet.FieldByName('ik_potok').AsString) > -1 then
    begin
      dbgVidZanyatFact.Canvas.Font.Color:= clRed;
      dbgVidZanyatFact.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, dbgVidZanyatFact.DataSource.DataSet.FieldByName('cName_disc').AsString);
    end;
    if correctDisc.IndexOf(dbgVidZanyatFact.DataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + dbgVidZanyatFact.DataSource.DataSet.FieldByName('ik_potok').AsString) > -1 then
    begin
      dbgVidZanyatFact.Canvas.Font.Color:= clGreen;
      dbgVidZanyatFact.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, dbgVidZanyatFact.DataSource.DataSet.FieldByName('cName_disc').AsString);
    end;
  end;
end;

procedure TfmNagruzkaPrep.dbgVidZanyatFactKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditFact.Enabled then
      actAddFactExecute(actEditFact);
end;

end.
