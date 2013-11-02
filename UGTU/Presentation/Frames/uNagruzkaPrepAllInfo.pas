unit uNagruzkaPrepAllInfo;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, DBGridEh, GridsEh, Mask, Contnrs,
  DBCtrlsEh, DBLookupEh, ComCtrls, ImgList, ADODB, DB, ActnList, ToolWin, Menus;

type
  TfmNagruzkaPrepAllInfo = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Label27: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    TabSheet5: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    dbcbFact: TDBLookupComboboxEh;
    Panel13: TPanel;
    Panel3: TPanel;
    ImageList1: TImageList;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Bevel6: TBevel;
    Panel20: TPanel;
    Image1: TImage;
    Label43: TLabel;
    Label44: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Panel5: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel9: TPanel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dbcbFactKeyValueChanged(Sender: TObject);
  private
    fIK: Integer;
    fYearIK: integer;
    fSemIK: integer;
    fKafIK: Integer;
    fNeedTeacherIK: integer;
    fLastPlanIK: integer;
    fLastFactIK: integer;
    fIsLoadFromMaster: boolean;
    fWTPlanPanels, fWTPlanSplitters, fWTFactPanels, fWTFactSplitters: TObjectList;
 //   incorrectDiscOsn, correctDiscOsn, incorrectDiscSovm, correctDiscSovm, incorrectDiscPoch, correctDiscPoch: TStringList;
  protected
    procedure DoRefreshFrame;override;
  public
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    property IK: Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
    property KafIK: Integer read fKafIK write fKafIK;
    property NeedTeacherIK: Integer read fNeedTeacherIK write fNeedTeacherIK;
    property IsLoadFromMaster: boolean read fIsLoadFromMaster write fIsLoadFromMaster default false;
    procedure CloseFrame; override;
    procedure Read;
    procedure CalcAllPlanHour;
    procedure CalcAllFactHour;
  end;

  TTeacherWorkTypePanel = class(TPanel)
  protected
    fOwnerFrame: TfmNagruzkaPrepAllInfo;
    fTitlePanel: TPanel;
    fAddRecord: TAction;
    fAdditionRecord: TAction;
    fEditRecord: TAction;
    fDeleteRecord: TAction;
    fDBGridEh: TDBGridEh;
    fDataSource: TDataSource;
    fActionToolBar: TToolBar;
    fWTNameLabel: TLabel;
    fTeacherIK: integer;
    fTabN: integer;
    fWorkTypeIK: integer;
    fDefenceFundIK: integer;
    fPlanHour: double;
    procedure actAddExecute(Sender: TObject); virtual; abstract;
    procedure actAddUpdate(Sender: TObject); virtual; abstract;
    procedure actAdditionExecute(Sender: TObject); virtual; abstract;
    procedure actAdditionUpdate(Sender: TObject); virtual; abstract;
    procedure actDelExecute(Sender: TObject); virtual; abstract;
    procedure actDelUpdate(Sender: TObject); virtual; abstract;
  private
    procedure DBGridDblClick(Sender: TObject); virtual;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    constructor Create(AParent: TWinControl; AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer);
    destructor Destroy; override;
    procedure ReloadDataSet; virtual; abstract;
    procedure CloseDataSet; virtual;
    property PlanHour: double read fPlanHour write fPlanHour;
  end;

  TTeacherWorkTypePlanPanel = class(TTeacherWorkTypePanel)
  private
    fWTHourLabel: TLabel;
    fGiveNagrToAnotherTeacher: TAction;
  protected
    procedure actAddExecute(Sender: TObject); override;
    procedure actAddUpdate(Sender: TObject); override;
    procedure actDelExecute(Sender: TObject); override;
    procedure actDelUpdate(Sender: TObject); override;
    procedure actGiveDutyToAnotherTeacherExecute(Sender: TObject);
  public
    constructor Create(AParent: TWinControl; AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer; AImages: TImageList; AStartImageIndex: integer);
    procedure ReloadDataSet; override;
    procedure CloseDataSet; override;
  end;

  TTeacherWorkTypeFactPanel = class(TTeacherWorkTypePanel)
  private
    fWTPlanHourCaptionLabel: TLabel;
    fWTPlanHourLabel: TLabel;
    fWTFactHourCaptionLabel: TLabel;
    fWTFactHourLabel: TLabel;
    fGetIndividualPlan: TAction;
    fFactHour: double;
    fIncorrectDiscList, fCorrectDiscList: TStringList;
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridDblClick(Sender: TObject); override;
  protected
    procedure actAddExecute(Sender: TObject); override;
    procedure actAddUpdate(Sender: TObject); override;
    procedure actAdditionExecute(Sender: TObject); override;
    procedure actAdditionUpdate(Sender: TObject); override;
    procedure actDelExecute(Sender: TObject); override;
    procedure actDelUpdate(Sender: TObject); override;
    procedure actGetIndividualPlanExecute(Sender: TObject);
  public
    constructor Create(AParent: TWinControl; AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer; AImages: TImageList; AStartImageIndex: integer);
    procedure ReloadDataSet; override;
    procedure CloseDataSet; override;
    destructor Destroy; override;
    property FactHour: double read fFactHour write fFactHour;
  end;

var
  fmNagruzkaPrepAllInfo: TfmNagruzkaPrepAllInfo;

implementation

uses GeneralController, NagruzkaController, uMain, uNagruzkaDiscToTeacher,
  uNagruzkaSelTeacherForFactEdit, uNagruzkaAddFact, uNagruzkaSelectTeacher, uNagruzkaAdditionFactNagr;

{$R *.dfm}

{ TfmNagruzkaPrepAllInfo }

procedure TfmNagruzkaPrepAllInfo.CalcAllFactHour;
var
  i: integer;
  allPlanHour, allFactHour: double;
begin
  allPlanHour:= 0;
  allFactHour:= 0;
  for i := 0 to fWTPlanPanels.Count - 1 do
  begin
    allPlanHour:= allPlanHour + TTeacherWorkTypeFactPanel(fWTFactPanels[i]).PlanHour;
    allFactHour:= allFactHour + TTeacherWorkTypeFactPanel(fWTFactPanels[i]).FactHour;
  end;
  Label35.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
  Label37.Caption:= FloatToStrF(allFactHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfmNagruzkaPrepAllInfo.CalcAllPlanHour;
var
  i: integer;
  allPlanHour: double;
begin
  allPlanHour:= 0;
  for i := 0 to fWTPlanPanels.Count - 1 do
    allPlanHour:= allPlanHour + TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).PlanHour;
  Label32.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfmNagruzkaPrepAllInfo.CloseFrame;
begin
  inherited;
  if dbcbPlan.KeyValue <> NULL then
    fLastPlanIK:= TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
  if dbcbFact.KeyValue <> NULL then
    fLastFactIK:= TGeneralController.Instance.CloseLockupCB(@dbcbFact);
  if Assigned(fWTPlanPanels) then
  begin
    fWTPlanPanels.Clear;
    FreeAndNil(fWTPlanPanels);
  end;
  if Assigned(fWTPlanSplitters) then
  begin
    fWTPlanSplitters.Clear;
    FreeAndNil(fWTPlanSplitters);
  end;
  if Assigned(fWTFactPanels) then
  begin
    fWTFactPanels.Clear;
    FreeAndNil(fWTFactPanels);
  end;
  if Assigned(fWTFactSplitters) then
  begin
    fWTFactSplitters.Clear;
    FreeAndNil(fWTFactSplitters);
  end;
end;

constructor TfmNagruzkaPrepAllInfo.CreateFrame(AOwner: TComponent;
  AObject: TObject; AConn: TADOConnection);
begin
  inherited;
  fNeedTeacherIK:= -1;
  fLastPlanIK:= -1;
  fLastFactIK:= -1;
end;

procedure TfmNagruzkaPrepAllInfo.dbcbFactKeyValueChanged(Sender: TObject);
var
  allPlanHour, allFactHour: double;
  i: integer;
begin
  allPlanHour:= 0;
  allFactHour:= 0;
//  semFactHour:= 0;
 // semPlanHour:= 0;
  for i := 0 to fWTFactPanels.Count - 1 do
    TTeacherWorkTypeFactPanel(fWTFactPanels[i]).CloseDataSet;

  if (dbcbFact.KeyValue <> NULL) then
  begin
    Panel20.Left:= round(Width/2 - Panel20.Width/2);
    Panel20.Top:= round(Height/2 - Panel20.Height/2);
    Panel20.Visible:= true;
    Refresh;
    try
      for i := 0 to fWTFactPanels.Count - 1 do
      begin
        TTeacherWorkTypeFactPanel(fWTFactPanels[i]).ReloadDataSet;
        allPlanHour:= allPlanHour + TTeacherWorkTypeFactPanel(fWTFactPanels[i]).PlanHour;
        allFactHour:= allFactHour + TTeacherWorkTypeFactPanel(fWTFactPanels[i]).FactHour;
      end;
   // semPlanHour:= TNagruzkaController.Instance.GetAllSemesterPlanHourForTeacher(dbcbFact.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbFact.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, KafIK, IK);
   // semFactHour:= TNagruzkaController.Instance.GetAllSemesterFactHourForTeacher(dbcbFact.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbFact.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, KafIK, IK);
    finally
      Panel20.Visible:= false;
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (факт): ' + dbcbFact.Text;
    end;
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (факт): <не выбран>';
  Label35.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
  Label37.Caption:= FloatToStrF(allFactHour, ffFixed, 10, 2) + ' час.';
  //Label5.Caption:= FloatToStrF(semPlanHour, ffFixed, 10, 2) + ' час.';
  //Label8.Caption:= FloatToStrF(semFactHour, ffFixed, 10, 2) + ' час.';

end;

procedure TfmNagruzkaPrepAllInfo.dbcbPlanKeyValueChanged(Sender: TObject);
var
  allPlanHour: double;
  i: integer;
begin
  allPlanHour:= 0;
//  semPlanHour:= 0;
  for i := 0 to fWTPlanPanels.Count - 1 do
    TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).CloseDataSet;
  if (dbcbPlan.KeyValue <> NULL) then
  begin
    Panel20.Left:= round(Width/2 - Panel20.Width/2);
    Panel20.Top:= round(Height/2 - Panel20.Height/2);
    Panel20.Visible:= true;
    Refresh;
    try
      for i := 0 to fWTPlanPanels.Count - 1 do
      begin
        TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).ReloadDataSet;
        allPlanHour:= allPlanHour + TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).PlanHour;
      end;
   //   semPlanHour:= TNagruzkaController.Instance.GetAllSemesterPlanHourForTeacher(dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, KafIK, IK);
    finally
      Panel20.Visible:= false;
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (план): ' + dbcbPlan.Text;
    end;
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (план): <не выбран>';
  Label32.Caption:= FloatToStrF(allPlanHour, ffFixed, 10, 2) + ' час.';
 // Label3.Caption:= FloatToStrF(semPlanHour, ffFixed, 10, 2) + ' час.';

end;

procedure TfmNagruzkaPrepAllInfo.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaPrepAllInfo.PageControl1Change(Sender: TObject);
begin
{if PageControl1.ActivePageIndex=0 then
frmMain.CurrentTopic:='Нагрузка\Add_PlanNagrPrep.htm';

if PageControl1.ActivePageIndex=1 then
frmMain.CurrentTopic:='Нагрузка\Add_FactNagrPrep.htm';}

  case PageControl1.ActivePageIndex of
  0: if (dbcbPlan.KeyValue <> NULL) then
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (план): ' + dbcbPlan.Text
     else
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (план): <не выбран>';
  1: 
    if (dbcbFact.KeyValue <> NULL) then
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (факт): ' + dbcbFact.Text
     else
      frmMain.StatusBar1.Panels[1].Text:= 'План учебной нагрузки (факт): <не выбран>';    
  end;
end;

procedure TfmNagruzkaPrepAllInfo.Read;
var
  temp: TADODataSet;
  i, j: integer;
begin
  PageControl1.ActivePageIndex:= 0;

  fWTPlanPanels:= TObjectList.Create(true);
  fWTPlanSplitters:= TObjectList.Create(true);
  fWTFactPanels:= TObjectList.Create(true);
  fWTFactSplitters:= TObjectList.Create(true);
  if (fNeedTeacherIK = -1) then
  begin
    temp:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      TNagruzkaController.Preparation.GetAllPrepWorkTypes(@temp, IK, KafIK, fYearIK, fSemIK, false);
      while not temp.Eof do
      begin
        i:= fWTPlanPanels.Add(TTeacherWorkTypePlanPanel.Create(Panel3, Self, temp.FieldByName('ik_id_prepod').AsInteger, ImageList1, 0));
        if temp.RecNo = temp.RecordCount then
          TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Align:= alClient
        else
        begin
          TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Align:= alTop;
          TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Height:= round((frmMain.Panel1.Height - 100)/temp.RecordCount);
          TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Top:= TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Height*i + 5;
        end;

        i:= fWTFactPanels.Add(TTeacherWorkTypeFactPanel.Create(Panel13, Self, temp.FieldByName('ik_id_prepod').AsInteger, ImageList1, 4));
        if temp.RecNo = temp.RecordCount then
          TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Align:= alClient
        else
        begin
          TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Align:= alTop;
          TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Height:= round((frmMain.Panel1.Height - 100)/temp.RecordCount);
          TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Top:= TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Height*i + 5;
        end;
        temp.Next;
      end;
    finally
      if temp.Active then temp.Close;
      temp.Free;
    end;

    if fWTPlanPanels.Count > 1 then
      for i := 1 to fWTPlanPanels.Count-1 do
      begin
          j:= fWTPlanSplitters.Add(TSplitter.Create(nil));
          TSplitter(fWTPlanSplitters[j]).Parent:= Panel3;
          TSplitter(fWTPlanSplitters[j]).Align:= alTop;
          TSplitter(fWTPlanSplitters[j]).Height:= 3;
          TSplitter(fWTPlanSplitters[j]).Top:= TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Top;
      end;

    if fWTFactPanels.Count > 1 then
      for i := 1 to fWTFactPanels.Count-1 do
      begin
        j:= fWTFactSplitters.Add(TSplitter.Create(nil));
        TSplitter(fWTFactSplitters[j]).Parent:= Panel13;
        TSplitter(fWTFactSplitters[j]).Align:= alTop;
        TSplitter(fWTFactSplitters[j]).Height:= 3;
        TSplitter(fWTFactSplitters[j]).Top:= TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Top;
      end;
  end
  else
  begin
    i:= fWTPlanPanels.Add(TTeacherWorkTypePlanPanel.Create(Panel3, Self, fNeedTeacherIK, ImageList1, 0));
    TTeacherWorkTypePlanPanel(fWTPlanPanels[i]).Align:= alClient;
    i:= fWTFactPanels.Add(TTeacherWorkTypeFactPanel.Create(Panel13, Self, fNeedTeacherIK, ImageList1, 4));
    TTeacherWorkTypeFactPanel(fWTFactPanels[i]).Align:= alClient;
  end;
  Refresh;

  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cName_plan');
  if fLastPlanIK = -1 then
    dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, KafIK, fYearIK, fSemIK, true, NULL)
  else
    dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbPlan.ListSource.DataSet, KafIK, fYearIK, fSemIK, false, fLastPlanIK);


  TGeneralController.Instance.InitializeLockupCB(@dbcbFact, 'ik_plan_nagr', 'cName_plan');
  if fLastFactIK = -1 then
    dbcbFact.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbFact.ListSource.DataSet, KafIK, fYearIK, fSemIK, true, NULL)
  else
    dbcbFact.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@dbcbFact.ListSource.DataSet, KafIK, fYearIK, fSemIK, false, fLastFactIK);

  PageControl1Change(PageControl1);
end;

{ TTeacherWorkTypePlanPanel }

procedure TTeacherWorkTypePlanPanel.actAddExecute(Sender: TObject);
var
  temp: TfrmNagruzkaDiscToTeacher;
begin
  temp:= TfrmNagruzkaDiscToTeacher.CreateDialog(nil, fOwnerFrame.Connection, nil);
  try
    temp.IK:= fTeacherIK;
    temp.Read(fOwnerFrame.dbcbPlan.KeyValue, fOwnerFrame.YearIK, fOwnerFrame.SemIK);
    if ((Sender as TAction).Tag = 2) then
    begin
      temp.dbcbDisc.KeyValue:= fDataSource.DataSet.FieldByName('ik_disc').AsInteger;
      temp.dbcbPotok.KeyValue:= fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    end;
    temp.IsModified:= false;
    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
      ReloadDataSet;
      if (temp.dbcbDisc.KeyValue <> NULL) and (temp.dbcbPotok.KeyValue <> NULL) then
        fDataSource.DataSet.Locate('ik_disc; ik_potok_semestr', VarArrayOf([temp.dbcbDisc.KeyValue, temp.dbcbPotok.KeyValue]), [loPartialKey]);
      fOwnerFrame.CalcAllPlanHour;
      if (fOwnerFrame.dbcbFact.KeyValue = fOwnerFrame.dbcbPlan.KeyValue) then
        fOwnerFrame.dbcbFactKeyValueChanged(fOwnerFrame.dbcbFact);
    end;
  finally
    if Assigned(temp) then FreeAndNil(temp);
  end;
end;

procedure TTeacherWorkTypePlanPanel.actAddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (fOwnerFrame.dbcbPlan.KeyValue <> NULL);
end;

procedure TTeacherWorkTypePlanPanel.actDelExecute(Sender: TObject);
begin
   if (Application.MessageBox(PChar('Вы уверены, что хотите отменить закрепление учебной нагрузки по выбранной дисциплине за данным преподавателем?' + #10#13#10#13 +
   'При этом будут удалены соответсвующие записи: ' + #10#13 +
   '  1) из фактической нагрузки преподавателей;' + #10#13 +
   '  2) из расписания преподавателей.'),'Удаление дисциплины из плана учебной нагрузки', mb_YesNo) = mrYes) then
  begin
    if TNagruzkaController.PlanNagruzka.DeleteDiscFromTeacherPlanNagr(fTeacherIK, fOwnerFrame.dbcbPlan.KeyValue, fDataSource.DataSet.FieldByName('ik_disc').AsInteger, fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger) then
    begin
      fPlanHour:= fPlanHour - fDataSource.DataSet.FieldByName('plan_hour').AsFloat;
      fDataSource.DataSet.Delete;
      fWTHourLabel.Caption:= FloatToStrF(fPlanHour, ffFixed, 10, 2) + ' час.';
      fOwnerFrame.CalcAllPlanHour;
      fOwnerFrame.dbcbFactKeyValueChanged(fOwnerFrame.dbcbFact);
    end;
  end;
end;

procedure TTeacherWorkTypePlanPanel.actDelUpdate(Sender: TObject);
begin
  if Assigned(fDataSource) then
  begin
    if Assigned(fDataSource.DataSet) then
    begin
      if fDataSource.DataSet.Active then
        (Sender as TAction).Enabled:= (fDataSource.DataSet.RecordCount > 0) and (fOwnerFrame.dbcbPlan.KeyValue <> NULL)
      else (Sender as TAction).Enabled:= false;
     end
     else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TTeacherWorkTypePlanPanel.actGiveDutyToAnotherTeacherExecute(
  Sender: TObject);
var
  tempST: TfrmNagruzkaSelectTeacher;
begin
  tempST:= TfrmNagruzkaSelectTeacher.CreateDialog(nil, fOwnerFrame.Connection, nil);
  try
    tempST.Read(fOwnerFrame.KafIK, fOwnerFrame.YearIK, fOwnerFrame.SemIK);
    if tempST.ShowModal = mrOk then
    begin
      if TNagruzkaController.PlanNagruzka.GiveDutyToAnotherTeacher(fTeacherIK, tempST.dbcbWorkType.KeyValue, fOwnerFrame.dbcbPlan.KeyValue, fDataSource.DataSet.FieldByName('ik_disc').AsInteger, fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger, -1) then
      begin
        fPlanHour:= fPlanHour - fDataSource.DataSet.FieldByName('plan_hour').AsFloat;
        fDataSource.DataSet.Delete;
        fWTHourLabel.Caption:= FloatToStrF(fPlanHour, ffFixed, 10, 2) + ' час.';
      end;
      if (tempST.dbcbPrep.KeyValue = fTabN) then
        fOwnerFrame.dbcbPlanKeyValueChanged(fOwnerFrame.dbcbPlan)
      else fOwnerFrame.CalcAllPlanHour;
    end;
  finally
    if Assigned(tempST) then FreeAndNil(tempST);
  end;
end;

procedure TTeacherWorkTypePlanPanel.CloseDataSet;
begin
  inherited CloseDataSet;
  fWTHourLabel.Caption:= '0 час.';
end;

constructor TTeacherWorkTypePlanPanel.Create(AParent: TWinControl; AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer; AImages: TImageList; AStartImageIndex: integer);
var
  tempColumn: TColumnEh;
  tempAddButton, tempEditButton, tempDelButton, tempSep, tempGDATButton: TToolButton;
begin
  inherited Create(AParent, AOwnerFrame, ATeacherIK);
  fWTHourLabel:= TLabel.Create(fTitlePanel);
  fWTHourLabel.Parent:= fTitlePanel;
  fWTHourLabel.Caption:= '0 час.';
  fWTHourLabel.Top:= 6;
  fWTHourLabel.Left:= fWTNameLabel.Width + 6;
  fWTHourLabel.Font.Color:= clMaroon;

  tempColumn:= fDBGridEh.Columns.Add;
  tempColumn.FieldName:= 'plan_hour';
  tempColumn.Title.Caption:= 'Количество часов';
  tempColumn.Width:= round(fDBGridEh.Width*0.15);

  fAddRecord.Hint:= 'Закрепить учебную нагрузку ...';
  fEditRecord.Hint:= 'Изменить объемы закрепленной нагрузки по дисциплине ...';
  fDeleteRecord.Hint:= 'Отменить закрепление учебной нагрузки';
  fGiveNagrToAnotherTeacher:= TAction.Create(Self);
  fGiveNagrToAnotherTeacher.Hint:= 'Передать учебную нагрузку другому преподавателю ...';
  fGiveNagrToAnotherTeacher.OnExecute:= actGiveDutyToAnotherTeacherExecute;
  fGiveNagrToAnotherTeacher.OnUpdate:= actDelUpdate;

  fActionToolBar:= TToolBar.Create(fTitlePanel);
  fActionToolBar.Parent:= fTitlePanel;
  fActionToolBar.Images:= AImages;
  tempGDATButton:= TToolButton.Create(fActionToolBar);
  tempGDATButton.Parent:= fActionToolBar;
  tempGDATButton.Action:= fGiveNagrToAnotherTeacher;
  tempGDATButton.ImageIndex:= AStartImageIndex+3;
  tempGDATButton.ShowHint:= true;
  tempSep:= TToolButton.Create(fActionToolBar);
  tempSep.Parent:= fActionToolBar;
  tempSep.Style:= tbsSeparator;
  tempSep.Width:= 8;
  tempDelButton:= TToolButton.Create(fActionToolBar);
  tempDelButton.Parent:= fActionToolBar;
  tempDelButton.Action:= fDeleteRecord;
  tempDelButton.ImageIndex:= AStartImageIndex+2;
  tempDelButton.ShowHint:= true;
  tempEditButton:= TToolButton.Create(fActionToolBar);
  tempEditButton.Parent:= fActionToolBar;
  tempEditButton.Action:= fEditRecord;
  tempEditButton.ImageIndex:= AStartImageIndex+1;
  tempEditButton.ShowHint:= true;
  tempAddButton:= TToolButton.Create(fActionToolBar);
  tempAddButton.Parent:= fActionToolBar;
  tempAddButton.Action:= fAddRecord;
  tempAddButton.ImageIndex:= AStartImageIndex;
  tempAddButton.ShowHint:= true;

  fActionToolBar.Align:= alNone;
  fActionToolBar.Top:= 0;
  fActionToolBar.Width:= 100;
  fActionToolBar.Left:= fTitlePanel.Width - 100;
  fActionToolBar.Anchors:= [akTop,akRight];
end;

procedure TTeacherWorkTypePlanPanel.ReloadDataSet;
begin
  fPlanHour:= 0;
  if Assigned(fDataSource) then
    if Assigned(fDataSource.DataSet) then
    begin
      if fDataSource.DataSet.Active then fDataSource.DataSet.Close;
      TNagruzkaController.PlanNagruzka.LoadAllTeacherPlanNagr(@fDataSource.DataSet, fOwnerFrame.dbcbPlan.KeyValue, fTeacherIK, fPlanHour);
    end;
  fWTHourLabel.Caption:= FloatToStrF(fPlanHour, ffFixed, 10, 2) + ' час.';
end;

{ TTeacherWorkTypeFactPanel }

procedure TTeacherWorkTypeFactPanel.actAddExecute(Sender: TObject);
var
  temp: TfrmNagruzkaAddFact;
  tempSTFE: TfrmNagruzkaSelTeacherForFactEdit;
  tempDS: TADODataSet;
  detectTeacherIK: integer;
begin
  temp:=nil;
  tempDS:=nil;
  tempSTFE:=nil;
  detectTeacherIK:=0;
  if ((Sender as TAction).Tag = 2) then
  begin
    try
      tempDS:= TNagruzkaController.PlanNagruzka.GetTeacherIKFromTeacherPlan(fOwnerFrame.dbcbFact.KeyValue, fDataSource.DataSet.FieldByName('ik_disc').AsInteger, fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger, fTeacherIK);
      if tempDS.RecordCount > 1 then
      begin
        tempSTFE:= TfrmNagruzkaSelTeacherForFactEdit.CreateDialog(nil, fOwnerFrame.Connection, nil);
        tempSTFE.Read(tempDS, fTeacherIK);
        if tempSTFE.ShowModal() = mrOk then detectTeacherIK:= tempSTFE.dbcbPrep.KeyValue
        else exit;
      end
      else detectTeacherIK:= tempDS.FieldByName('ik_id_prepod').AsInteger;
    finally
      if Assigned(tempSTFE) then FreeAndNil(tempSTFE);
      if Assigned(tempDS) then
      begin
        if tempDS.Active then tempDS.Close;
        FreeAndNil(tempDS);
      end;
    end;
  end;

  try
    temp:= TfrmNagruzkaAddFact.CreateDialog(nil, fOwnerFrame.Connection, nil);
    temp.IK:= fTeacherIK;
    temp.Label2.Caption:= TNagruzkaController.Preparation.GetTeacherFIO(temp.IK);

   if (Sender as TAction).Tag = 0 then
   begin
     if MessageBox(Handle, 'Вы хотите добавить фактическую нагрузку без расписания?',
					  'ИС УГТУ', MB_YESNO)=IDYES then
                temp.WithoutSheduler := true else temp.WithoutSheduler := false;
  {  if MessageDlg('Вы хотите добавить фактическую нагрузку без расписания?',mtConfirmation,
               [mbYes, mbNo],0)=mrYes  then}
   end
   else
        if MessageBox(Handle, 'Вы хотите редактировать фактическую нагрузку без расписания?',
					  'ИС УГТУ', MB_YESNO)=IDYES then
                temp.WithoutSheduler := true else temp.WithoutSheduler := false;

    temp.Read(fOwnerFrame.dbcbFact.KeyValue, fOwnerFrame.YearIK, fOwnerFrame.SemIK);
    if ((Sender as TAction).Tag = 2) then
    begin
      temp.dbcbPlan.KeyValue:= fOwnerFrame.dbcbFact.KeyValue;
      if detectTeacherIK = 0 then
        temp.dbcbPrep.KeyValue:= temp.IK
      else temp.dbcbPrep.KeyValue:= detectTeacherIK;
      temp.dbcbDisc.KeyValue:= fDataSource.DataSet.FieldByName('ik_disc').AsInteger;
      temp.dbcbPotok.KeyValue:= fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger;
    end;
    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
      TGeneralController.Instance.CloseLockupCB(@fOwnerFrame.dbcbFact);
      fOwnerFrame.dbcbFact.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlans(@fOwnerFrame.dbcbFact.ListSource.DataSet, fOwnerFrame.KafIK, fOwnerFrame.YearIK, fOwnerFrame.SemIK, false, temp.dbcbPlan.KeyValue);
      if (temp.dbcbDisc.KeyValue <> NULL) and (temp.dbcbPotok.KeyValue <> NULL) then
        fDataSource.DataSet.Locate('ik_disc; ik_potok_semestr', VarArrayOf([temp.dbcbDisc.KeyValue, temp.dbcbPotok.KeyValue]), [loPartialKey]);
    end;
  finally
    if Assigned(temp) then FreeAndNil(temp);
  end;
end;

procedure TTeacherWorkTypeFactPanel.actAdditionExecute(Sender: TObject);
var temp: TfrmAdditionFactNagr;
    tempDS: TADODataSet;
begin
  temp:=nil;
  tempDS:=nil;

  try
    temp := TfrmAdditionFactNagr.CreateDialog(nil, fOwnerFrame.Connection, nil);
    temp.TeacherIK:= fTeacherIK;
    temp.PlanIK := fOwnerFrame.dbcbFact.KeyValue;
    temp.lblPrepod.Caption:= TNagruzkaController.Preparation.GetTeacherFIO(temp.TeacherIK);
    temp.Read();
    if ((Sender as TAction).Tag = 2) then temp.DiscIK := fDataSource.DataSet.FieldByName('ik_disc').AsInteger;

    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
        ReloadDataSet;
    end;
  finally
    if Assigned(temp) then FreeAndNil(temp);
  end;
end;

procedure TTeacherWorkTypeFactPanel.actAdditionUpdate(Sender: TObject);
begin
(Sender as TAction).Enabled:= (fOwnerFrame.dbcbFact.KeyValue <> NULL);
end;

procedure TTeacherWorkTypeFactPanel.actAddUpdate(Sender: TObject);
begin

  (Sender as TAction).Enabled:= (fOwnerFrame.dbcbFact.KeyValue <> NULL);
end;

procedure TTeacherWorkTypeFactPanel.actDelExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить фактическую нагрузку по выбранной дисциплине?'),'Удаление дисциплины из фактической нагрузки преподавателя', mb_YesNo) = mrYes) then
    if TNagruzkaController.FactNagruzka.DeleteDiscFromFactNagr(fOwnerFrame.dbcbFact.KeyValue, fDataSource.DataSet.FieldByName('ik_disc').AsInteger, fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger, fTeacherIK) then
    begin
      ReloadDataSet;
      fOwnerFrame.CalcAllFactHour;
    end;
end;

procedure TTeacherWorkTypeFactPanel.actDelUpdate(Sender: TObject);
begin
  if Assigned(fDataSource) then
  begin
    if Assigned(fDataSource.DataSet) then
    begin
      if fDataSource.DataSet.Active then
        (Sender as TAction).Enabled:= (fDataSource.DataSet.RecordCount > 0) and fAddRecord.Enabled
      else (Sender as TAction).Enabled:= false;
    end
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TTeacherWorkTypeFactPanel.actGetIndividualPlanExecute(
  Sender: TObject);
begin
  fOwnerFrame.Panel9.Left:= round((fOwnerFrame.Width - fOwnerFrame.Panel9.Width)/2);
  fOwnerFrame.Panel9.Top:= round((fOwnerFrame.Height - fOwnerFrame.Panel9.Height)/2);
  fOwnerFrame.Panel9.Visible:= true;
try
  fOwnerFrame.Refresh;
  TNagruzkaController.FactNagruzka.ExportIndividTeacherPlan(fOwnerFrame.dbcbFact.KeyValue, fTeacherIK, fOwnerFrame.ProgressBar1);
finally
  fOwnerFrame.Panel9.Visible:= false;
end;
end;

procedure TTeacherWorkTypeFactPanel.CloseDataSet;
begin
  inherited CloseDataSet;
  fWTPlanHourLabel.Caption:= '0 час.';
  fWTFactHourLabel.Caption:= '0 час.';
end;

constructor TTeacherWorkTypeFactPanel.Create(AParent: TWinControl;
  AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer; AImages: TImageList;
  AStartImageIndex: integer);
var
  tempColumn: TColumnEh;
  tempAddButton, tempAdditionButton, tempEditButton, tempDelButton, tempSep, tempGIPButton: TToolButton;
begin
  inherited Create(AParent, AOwnerFrame, ATeacherIK);
  fIncorrectDiscList:= TStringList.Create;
  fCorrectDiscList:= TStringList.Create;
  fDBGridEh.OnDrawColumnCell:= DBGridDrawColumnCell;

//  fTitlePanel.Height:= 26;


  fAdditionRecord.Hint:= 'Закрепить дополнительную учебную нагрузку ...';
  fWTPlanHourCaptionLabel:= TLabel.Create(fTitlePanel);
  fWTPlanHourCaptionLabel.Parent:= fTitlePanel;
  fWTPlanHourCaptionLabel.Caption:= 'запланировано:';
  fWTPlanHourCaptionLabel.Top:= 6;
  fWTPlanHourCaptionLabel.Left:= fWTNameLabel.Width + 6;
  fWTPlanHourCaptionLabel.Font.Color:= clGreen;

  fWTPlanHourLabel:= TLabel.Create(fTitlePanel);
  fWTPlanHourLabel.Parent:= fTitlePanel;
  fWTPlanHourLabel.Caption:= '0 час.';
  fWTPlanHourLabel.Top:= 6;
  fWTPlanHourLabel.Left:= fWTPlanHourCaptionLabel.Left + fWTPlanHourCaptionLabel.Width + 6;
  fWTPlanHourLabel.Font.Color:= clMaroon;

  fWTFactHourCaptionLabel:= TLabel.Create(fTitlePanel);
  fWTFactHourCaptionLabel.Parent:= fTitlePanel;
  fWTFactHourCaptionLabel.Caption:= 'выполнено:';
  fWTFactHourCaptionLabel.Top:= 6;
  fWTFactHourCaptionLabel.Left:= fWTPlanHourCaptionLabel.Left + fWTPlanHourCaptionLabel.Width + 90;
  fWTFactHourCaptionLabel.Font.Color:= clGreen;

  fWTFactHourLabel:= TLabel.Create(fTitlePanel);
  fWTFactHourLabel.Parent:= fTitlePanel;
  fWTFactHourLabel.Caption:= '0 час.';
  fWTFactHourLabel.Top:= 6;
  fWTFactHourLabel.Left:= fWTFactHourCaptionLabel.Left + fWTFactHourCaptionLabel.Width + 6;
  fWTFactHourLabel.Font.Color:= clMaroon;

  tempColumn:= fDBGridEh.Columns.Add;
  tempColumn.FieldName:= 'plan_hour';
  tempColumn.Title.Caption:= 'Запланировано часов';
  tempColumn.Width:= round(fDBGridEh.Width*0.15);
  tempColumn:= fDBGridEh.Columns.Add;
  tempColumn.FieldName:= 'fact_hour';
  tempColumn.Title.Caption:= 'Выполнено часов';
  tempColumn.Width:= round(fDBGridEh.Width*0.15);

  fAddRecord.Hint:= 'Заполнить фактическую нагрузку ...';
  fEditRecord.Hint:= 'Изменить фактическую нагрузку по дисциплине ...';
  fDeleteRecord.Hint:= 'Удалить фактическую нагрузку по дисциплине';
  fGetIndividualPlan:= TAction.Create(Self);
  fGetIndividualPlan.Hint:= 'Сформировать выписку для индивидуального плана преподавателя ...';
  fGetIndividualPlan.OnExecute:= actGetIndividualPlanExecute;
  fGetIndividualPlan.OnUpdate:= actDelUpdate;

  fActionToolBar:= TToolBar.Create(fTitlePanel);
  fActionToolBar.Parent:= fTitlePanel;
  fActionToolBar.Images:= AImages;
  tempGIPButton:= TToolButton.Create(fActionToolBar);
  tempGIPButton.Parent:= fActionToolBar;
  tempGIPButton.Action:= fGetIndividualPlan;
  tempGIPButton.ImageIndex:= AStartImageIndex+3;
  tempGIPButton.ShowHint:= true;
  tempSep:= TToolButton.Create(fActionToolBar);
  tempSep.Parent:= fActionToolBar;
  tempSep.Style:= tbsSeparator;
  tempSep.Width:= 8;

  tempAdditionButton:= TToolButton.Create(fActionToolBar);
  tempAdditionButton.Parent:= fActionToolBar;
  tempAdditionButton.Action:= fAdditionRecord;
  tempAdditionButton.ImageIndex:= AStartImageIndex+4;
  tempAdditionButton.ShowHint:= true;

  tempDelButton:= TToolButton.Create(fActionToolBar);
  tempDelButton.Parent:= fActionToolBar;
  tempDelButton.Action:= fDeleteRecord;
  tempDelButton.ImageIndex:= AStartImageIndex+2;
  tempDelButton.ShowHint:= true;
  tempEditButton:= TToolButton.Create(fActionToolBar);
  tempEditButton.Parent:= fActionToolBar;
  tempEditButton.Action:= fEditRecord;
  tempEditButton.ImageIndex:= AStartImageIndex+1;
  tempEditButton.ShowHint:= true;
  tempAddButton:= TToolButton.Create(fActionToolBar);
  tempAddButton.Parent:= fActionToolBar;
  tempAddButton.Action:= fAddRecord;
  tempAddButton.ImageIndex:= AStartImageIndex;
  tempAddButton.ShowHint:= true;



  fActionToolBar.Align:= alNone;
  fActionToolBar.Top:= 0;
  fActionToolBar.Width:= 150;
  fActionToolBar.Left:= fTitlePanel.Width - 150;
  fActionToolBar.Anchors:= [akTop,akRight];
end;

procedure TTeacherWorkTypeFactPanel.DBGridDblClick(Sender: TObject);
begin
  if fDataSource.DataSet.FieldByName('ik_potok_semestr').AsInteger>0 then
  begin
    if fEditRecord.Enabled then
      actAddExecute(fEditRecord);
  end else actAdditionExecute(fEditRecord);
end;

procedure TTeacherWorkTypeFactPanel.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'cName_disc') then
  begin
    if fIncorrectDiscList.IndexOf(fDataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + fDataSource.DataSet.FieldByName('ik_potok_semestr').AsString) > -1 then
    begin
      fDBGridEh.Canvas.Font.Color:= clRed;
      fDBGridEh.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, fDataSource.DataSet.FieldByName('cName_disc').AsString);
    end;
    if fCorrectDiscList.IndexOf(fDataSource.DataSet.FieldByName('ik_disc').AsString + ' - ' + fDataSource.DataSet.FieldByName('ik_potok_semestr').AsString) > -1 then
    begin
      fDBGridEh.Canvas.Font.Color:= clGreen;
      fDBGridEh.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, fDataSource.DataSet.FieldByName('cName_disc').AsString);
    end;
  end;
end;

destructor TTeacherWorkTypeFactPanel.Destroy;
begin
  if Assigned(fIncorrectDiscList) then FreeAndNil(fIncorrectDiscList);
  if Assigned(fCorrectDiscList) then FreeAndNil(fCorrectDiscList);
  inherited;
end;

procedure TTeacherWorkTypeFactPanel.ReloadDataSet;
begin
  fPlanHour:= 0;
  fFactHour:= 0;
  if Assigned(fDataSource) then
    if Assigned(fDataSource.DataSet) then
    begin
      TNagruzkaController.FactNagruzka.LoadAllTeacherFactNagr(@fDataSource.DataSet, fOwnerFrame.dbcbFact.KeyValue, fTeacherIK, fFactHour, fIncorrectDiscList, fCorrectDiscList);
      // временное решение, вместо него надо то, что закомментировано ниже
      fDataSource.DataSet.First;
      while not fDataSource.DataSet.Eof do
      begin
        fPlanHour:= fPlanHour + fDataSource.DataSet.FieldByName('plan_hour').AsFloat;
        fDataSource.DataSet.Next;
      end;
      //planHour:= TNagruzkaController.Instance.GetAllTeacherPlanHour(dbcbFact.KeyValue, Panel16.Tag);
    end;
   fWTPlanHourLabel.Caption:= FloatToStrF(fPlanHour, ffFixed, 10, 2) + ' час.';
   fWTFactHourLabel.Caption:= FloatToStrF(fFactHour, ffFixed, 10, 2) + ' час.';
end;

{ TTeacherWorkTypePanel }

procedure TTeacherWorkTypePanel.CloseDataSet;
begin
  if Assigned(fDataSource) then
    if Assigned(fDataSource.DataSet) then
      if fDataSource.DataSet.Active then fDataSource.DataSet.Close;      
end;

constructor TTeacherWorkTypePanel.Create(AParent: TWinControl;
  AOwnerFrame: TfmNagruzkaPrepAllInfo; ATeacherIK: integer);
var
  tempColumn: TColumnEh;
  tempDS: TADODataSet;
begin
  inherited Create(nil);
  Parent:= AParent;
  BevelOuter:= bvNone;
  fOwnerFrame:= AOwnerFrame;
  fTeacherIK:= ATeacherIK;
  fTitlePanel:= TPanel.Create(Self);
  fTitlePanel.Parent:= Self;
  fTitlePanel.Align:= alTop;
  fTitlePanel.Height:= 26;
  fTitlePanel.BevelOuter:= bvNone;
  fWTNameLabel:= TLabel.Create(fTitlePanel);
  fWTNameLabel.Parent:= fTitlePanel;
  fWTNameLabel.Left:= 0;
  fWTNameLabel.Top:= 6;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT rkp.ik_work_type, rkp.ik_defence_fund, rkp.iTab_n, cName_work_type, ISNULL(cName_defence_fund, ''<не указан>'') as cName_defence_fund FROM Relation_kafedra_prep rkp INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type ' +
      'LEFT JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund WHERE ik_id_prepod = ' + IntToStr(ATeacherIK);
    tempDS.Open;
    fWorkTypeIK:= tempDS.FieldByName('ik_work_type').AsInteger;
    fDefenceFundIK:= tempDS.FieldByName('ik_defence_fund').AsInteger;
    fTabN:= tempDS.FieldByName('iTab_n').AsInteger;
    fWTNameLabel.Caption:= tempDS.FieldByName('cName_work_type').AsString + ', ' + AnsiLowerCase(tempDS.FieldByName('cName_defence_fund').AsString) + ':';
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;

  fDataSource:= TDataSource.Create(Self);
  fDataSource.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  fDBGridEh:= TDBGridEh.Create(Self);
  fDBGridEh.Parent:= Self;
  fDBGridEh.OnKeyDown:= DBGridKeyDown;
  fDBGridEh.OnDblClick:= DBGridDblClick;
  fDBGridEh.DataSource:= fDataSource;
  fDBGridEh.Flat:= true;
  fDBGridEh.Options:= fDBGridEh.Options - [dgEditing, dgIndicator];
  fDBGridEh.Options:= fDBGridEh.Options + [dgRowSelect, dgAlwaysShowSelection];
  fDBGridEh.UseMultiTitle:= true;
  fDBGridEh.AutoFitColWidths:= true;
  fDBGridEh.Align:= alClient;
  tempColumn:= fDBGridEh.Columns.Add;
  tempColumn.FieldName:= 'cName_disc';
  tempColumn.Title.Caption:= 'Дисциплина';
  tempColumn.Width:= round(fDBGridEh.Width*0.5);
  tempColumn:= fDBGridEh.Columns.Add;
  tempColumn.FieldName:= 'cName_potok';
  tempColumn.Title.Caption:= 'Поток';
  tempColumn.Width:= round(fDBGridEh.Width*0.2);

  fAddRecord:= TAction.Create(Self);
  fAddRecord.Tag:= 1;
  fAddRecord.OnExecute:= actAddExecute;
  fAddRecord.OnUpdate:= actAddUpdate;
  fEditRecord:= TAction.Create(Self);
  fEditRecord.Tag:= 2;
  fEditRecord.OnExecute:= actAddExecute;
  fEditRecord.OnUpdate:= actDelUpdate;
  fDeleteRecord:= TAction.Create(Self);
  fDeleteRecord.OnExecute:= actDelExecute;
  fDeleteRecord.OnUpdate:= actDelUpdate;

  fAdditionRecord:= TAction.Create(Self);
  fAdditionRecord.OnExecute:= actAdditionExecute;
  fAdditionRecord.OnUpdate:= actAdditionUpdate;
end;

procedure TTeacherWorkTypePanel.DBGridDblClick(Sender: TObject);
begin
  if fEditRecord.Enabled then
    actAddExecute(fEditRecord);
end;

procedure TTeacherWorkTypePanel.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridDblClick(fDBGridEh);
end;

destructor TTeacherWorkTypePanel.Destroy;
begin
  if Assigned(fDataSource) then
    if Assigned(fDataSource.DataSet) then
    begin
      if fDataSource.DataSet.Active then fDataSource.DataSet.Close;
      fDataSource.DataSet.Free;
    end;
  inherited;
end;

end.
