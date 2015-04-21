unit uStudent;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls,
  Grids, DBGridEh, Mask, DBCtrlsEh, ImgList, DBTVStudObj, DBLookupEh, db,
  DBCtrls,
  ExtDlgs, jpeg, VarfileUtils, ComObj, GridsEh, ActnList, Menus, dbtvSpecobj,
  dbtvFacobj,
  ReportsBase, D_StudUspevRep, ApplicationController, uWaitingController,
  uAddress,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, System.Actions,
  DBAxisGridsEh, uUspevGroupController, GeneralController, uReviewDoc;

type
  TfmStudent = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Panel7: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    dbcbeSex: TDBComboBoxEh;
    Panel8: TPanel;
    Label1: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbgeLang: TDBGridEh;
    Panel5: TPanel;
    Label27: TLabel;
    Label29: TLabel;
    Panel2: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    cbChildren: TCheckBox;
    cbJob: TCheckBox;
    cbInvalid: TCheckBox;
    cbAppNeed: TCheckBox;
    TabSheet5: TTabSheet;
    dbdteBirthDate: TDBDateTimeEditEh;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    gbExiled: TGroupBox;
    DBGridEh5: TDBGridEh;
    gbAcadem: TGroupBox;
    dbgeAcadem: TDBGridEh;
    gbEntered: TGroupBox;
    DBGridEh3: TDBGridEh;
    Label37: TLabel;
    Panel9: TPanel;
    Label38: TLabel;
    ilPages: TImageList;
    Label13: TLabel;
    Label18: TLabel;
    dbgeFam: TDBGridEh;
    Splitter1: TSplitter;
    dbgeChangeFam: TDBGridEh;
    dbgeDocuments: TDBGridEh;
    iPhoto: TImage;
    dbcbeSchool: TDBLookupComboboxEh;
    dbcbeCat: TDBLookupComboboxEh;
    dbcbeCitizenship: TDBLookupComboboxEh;
    dbcbePreparation: TDBLookupComboboxEh;
    dbcbeSocWork: TDBLookupComboboxEh;
    dbcbeSpecCount: TDBLookupComboboxEh;
    dbcbeFamState: TDBLookupComboboxEh;
    eFam: TDBEditEh;
    eName: TDBEditEh;
    eMid: TDBEditEh;
    eYearFinished: TDBNumberEditEh;
    eEmail: TDBEditEh;
    eBirthPlace: TDBEditEh;
    dbcbeMedal: TDBLookupComboboxEh;
    Label42: TLabel;
    dbcbeMilitaryState: TDBLookupComboboxEh;
    Label43: TLabel;
    Label44: TLabel;
    Bevel2: TBevel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    eNum: TDBEditEh;
    odPhoto: TOpenPictureDialog;
    DBGridEh1: TDBGridEh;
    Panel11: TPanel;
    Label45: TLabel;
    cmbxSem: TDBComboBoxEh;
    eCellphone: TDBEditEh;
    dbcbeOrder: TDBLookupComboboxEh;
    Label47: TLabel;
    eAddInfo: TMemo;
    Label57: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    eDuty: TDBEditEh;
    Label54: TLabel;
    dbcbeEnterprise: TDBLookupComboboxEh;
    Label51: TLabel;
    eXpyear: TDBNumberEditEh;
    eXpMonth: TDBNumberEditEh;
    Label33: TLabel;
    Label46: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    gbProlongued: TGroupBox;
    DBGridEh6: TDBGridEh;
    KontExcel: TSpeedButton;
    ActionList1: TActionList;
    actApply: TAction;
    actUndo: TAction;
    actPrintSprav: TAction;
    actPrintPensSprav: TAction;
    ppmSpravToExcel: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    actObnovl: TAction;
    SpeedButton1: TSpeedButton;
    MenuItem3: TMenuItem;
    ScrollBox1: TScrollBox;
    TabSheet9: TTabSheet;
    Label39: TLabel;
    cmbxSemNapr: TDBComboBoxEh;
    Panel12: TPanel;
    dbgrNapr: TDBGridEh;
    btnPrintSmallUspev: TSpeedButton;
    tsUspevStat: TTabSheet;
    dbgUspevStat: TDBGridEh;
    ppmStudNapr: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    gbCatChange: TGroupBox;
    DBGridEh2: TDBGridEh;
    dbgeAddress: TDBGridEh;
    sbAddAddress: TSpeedButton;
    sbRemoveAddress: TSpeedButton;
    SpeedButton2: TSpeedButton;
    actEditAddress: TAction;
    actAddAddress: TAction;
    actDeleteAddress: TAction;
    Label8: TLabel;
    ePhone: TDBEditEh;
    SpeedButton3: TSpeedButton;
    actPropToFact: TAction;
    tsBRSBalls: TTabSheet;
    Panel10: TPanel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    sbRefresh: TSpeedButton;
    cbSemBRS: TDBComboBoxEh;
    cbModuleBRS: TDBComboBoxEh;
    Label9: TLabel;
    dbgeBalls: TDBGridEh;
    gbMoved: TGroupBox;
    DBGridEh4: TDBGridEh;
    bShot: TButton;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton13: TToolButton;
    ToolButton9: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    ToolButton5: TToolButton;
    ToolButton14: TToolButton;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    MenuItem4: TMenuItem;

    procedure BbSaveclick(Sender: TObject);
    procedure eFamExit(Sender: TObject);
    procedure eMidExit(Sender: TObject);
    procedure eNameExit(Sender: TObject);
    procedure dbcbeSexChange(Sender: TObject);
    procedure dbcbeSexDropDown(Sender: TObject);
    procedure eEmailExit(Sender: TObject);
    procedure eFamChange(Sender: TObject);
    procedure dbgeFamExit(Sender: TObject);
    procedure iPhotoClick(Sender: TObject);
    procedure cmbxSemChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);

    procedure bbUndoClick(Sender: TObject);
    procedure eAddInfoEnter(Sender: TObject);
    procedure eAddInfoExit(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure eNumExit(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure KontExcelClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure actPrintSpravExecute(Sender: TObject);
    procedure actPrintPensSpravExecute(Sender: TObject);
    procedure actObnovlExecute(Sender: TObject);
    procedure cmbxSemNaprChange(Sender: TObject);
    procedure dbgrNaprTitleClick(Column: TColumnEh);
    procedure btnPrintSmallUspevClick(Sender: TObject);
    procedure dbgUspevStatTitleClick(Column: TColumnEh);
    procedure eNumUpdateData(Sender: TObject; var Handled: Boolean);
    procedure actAddAddressExecute(Sender: TObject);
    procedure actEditAddressExecute(Sender: TObject);
    procedure actDeleteAddressExecute(Sender: TObject);
    procedure actPropToFactExecute(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
    procedure dbgeBallsTitleClick(Column: TColumnEh);
    procedure cbSemBRSChange(Sender: TObject);
    procedure cbModuleBRSChange(Sender: TObject);
    procedure bShotClick(Sender: TObject);
    procedure iPhotoMouseEnter(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);

  private
    Fik: integer;
    FLoaded: Boolean;
    Fobj: TDBNodeStudObject;
    procedure GetUspevStat(ik_zach: integer);

  protected
    procedure DoRefreshFrame; override;
    function DoApply: Boolean; override;
    function DoCancel: Boolean;
    procedure ExecuteError(Sender: TObject; E: Exception);

  public
    property ik: integer read Fik write Fik;
    property Loaded: Boolean write FLoaded;
    procedure Read;
    property obj: TDBNodeStudObject read Fobj write Fobj;
  end;

var
  fmStudent: TfmStudent;

implementation

uses uDM, ADODB, Umain, DBTVObj, DBTVGroupObj, uDipl, uDMStudentSelectionProcs,
  uDMStudentActions, uDMStudentData, uDMCauses, uDMAdress, uDMUspevaemost,
  ImageFullSizeShowFrm;

{$R *.dfm}

{ TfmStudent }
function ChangeMonthDayPlaces(date: TDateTime): string;
var
  s1: string;
begin
  result := DatetoStr(date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
  result[5] := s1[2];
end;

function TfmStudent.DoApply: Boolean;
var
  stream: TMemoryStream;
  // i:integer;
  ndGroup: TDBNodeGroupObject;
begin
  if obj.ID <> ik then // проверка nCode
  begin
    modified := false;
    RefreshFrame;
    exit;
  end;
  { должны быть заполнены имя, фамилия, дата рождения, номер зачетки,
    гражданство, медаль? }
  if (eName.Text = '') or (eFam.Text = '') or (eNum.Text = '      ') or
    (dbdteBirthDate.Text = '  .  .    ')
  { or(dbcbeCitizenship.Text='')or(dbcbeMedal.Text='') } then
  begin
    showmessage
      ('Одно или несколько обязательных для ввода полей не заполнены!');
    result := true;
    exit;
  end;
  result := true;
  try
    with dmStudentSelectionProcs.aspSelLanguage do
    // if dbgeLang.DataSource.DataSet.RecordCount > 0 then
    begin
      Edit;
      UpdateRecord;
      Post;
      Open;
    end;
  except
  end;
  try
    with dmStudentSelectionProcs.aspSelLanguage do
    begin
      Edit;
      UpdateRecord;
      Post;
      Open;
    end;
  except
  end;
  try
    with dmStudentSelectionProcs.aspSelDocuments do
    begin
      Edit;
      UpdateRecord;
      Post;
      Open;
    end;
  except
  end;
  with dmStudentActions.aspAppendStudent.Parameters do
  begin
    clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 0, 1);
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@clastn', ftString, pdInput, 40, eFam.Text);
    CreateParameter('@firstn', ftString, pdInput, 40, eName.Text);

    if not(eMid.Text = '') then
      CreateParameter('@otch', ftString, pdInput, 40, eMid.Text)
    else
      CreateParameter('@otch', ftString, pdInput, 40, null);

    if not(DatetoStr(dbdteBirthDate.Value) = '  .  .    ') then
      CreateParameter('@birth', ftDateTime, pdInput, 0, dbdteBirthDate.Value)
    else
      CreateParameter('@birth', ftDateTime, pdInput, 0, null);

    CreateParameter('@placebirth', ftString, pdInput, 300, eBirthPlace.Text);

    if cbInvalid.Checked then
      CreateParameter('@inval', ftBoolean, pdInput, 0, 1)
    else
      CreateParameter('@inval', ftBoolean, pdInput, 0, 0);
    if cbChildren.Checked then
      CreateParameter('@deti', ftBoolean, pdInput, 0, 1)
    else
      CreateParameter('@deti', ftBoolean, pdInput, 0, 0);
    if cbJob.Checked then
      CreateParameter('@rab', ftBoolean, pdInput, 0, 1)
    else
      CreateParameter('@rab', ftBoolean, pdInput, 0, 0);
    if dbcbeSex.Text = 'Мужской' then
      CreateParameter('@sex', ftBoolean, pdInput, 0, 1)
    else
      CreateParameter('@sex', ftBoolean, pdInput, 0, 0);
    if cbAppNeed.Checked then
      CreateParameter('@obchegit', ftBoolean, pdInput, 0, 1)
    else
      CreateParameter('@obchegit', ftBoolean, pdInput, 0, 0);

    CreateParameter('@ik_medal', ftInteger, pdInput, 0, dbcbeMedal.KeyValue);
    CreateParameter('@ik_voen_zvanie', ftInteger, pdInput, 0,
      dbcbeMilitaryState.KeyValue);
    CreateParameter('@Sottel', ftString, pdInput, 50, eCellphone.Text);
    CreateParameter('@telefon', ftString, pdInput, 20, ePhone.Text);
    CreateParameter('@Email', ftString, pdInput, 50, eEmail.Text);

    // сохранение фото---------------------------------------------------------------------------------
    if (iPhoto.Picture.Graphic <> nil) then
    begin
      if (odPhoto.FileName <> '') then
        CreateParameter('@Photo', ftVarBytes, pdInput, 2147483647,
          CreateVariantByFile(odPhoto.FileName))
      else
      begin
        stream := TMemoryStream.Create;
        iPhoto.Picture.Graphic.SaveToStream(stream);
        CreateParameter('@Photo', ftVarBytes, pdInput, 2147483647,
          CreateVariantByStream(stream))
      end;
    end
    else
      CreateParameter('@Photo', ftVarBytes, pdInput, 2147483647, null);
    // ------------------------------------------------------------------------------------------------

    CreateParameter('@Pens', ftInteger, pdInput, 0, null);
    CreateParameter('@grazd', ftInteger, pdInput, 0, dbcbeCitizenship.KeyValue);
    CreateParameter('@podg', ftInteger, pdInput, 0, dbcbePreparation.KeyValue);
    CreateParameter('@nac', ftInteger, pdInput, 0, null);
    CreateParameter('@ob_rab', ftInteger, pdInput, 0, dbcbeSocWork.KeyValue);
    CreateParameter('@sempol', ftInteger, pdInput, 0, dbcbeFamState.KeyValue);
    CreateParameter('@spec_uch', ftInteger, pdInput, 0,
      dbcbeSpecCount.KeyValue);
    CreateParameter('@zaved', ftInteger, pdInput, 0, dbcbeSchool.KeyValue);
    CreateParameter('@godokon', ftInteger, pdInput, 0, eYearFinished.Value);
    CreateParameter('@ind_f', ftString, pdInput, 10, '');
    CreateParameter('@street_f', ftInteger, pdInput, 0, null);
    CreateParameter('@Build_f', ftString, pdInput, 10, '');
    CreateParameter('@Stroen_f', ftString, pdInput, 10, null);
    CreateParameter('@Kvart_f', ftString, pdInput, 10, '');
    CreateParameter('@ind_pr', ftString, pdInput, 10, '');
    CreateParameter('@street_pr', ftInteger, pdInput, 0, null);
    CreateParameter('@Build_pr', ftString, pdInput, 10, '');
    CreateParameter('@Stroen_pr', ftString, pdInput, 10, null);
    CreateParameter('@Kvart_pr', ftString, pdInput, 10, '');
    CreateParameter('@dopsved', ftString, pdInput, 2000, eAddInfo.Text);
    CreateParameter('@code', ftInteger, pdInput, 0, Self.obj.ID);
    CreateParameter('@nzach', ftString, pdInput, 10, eNum.Text);
    CreateParameter('@ik_zach', ftInteger, pdInput, 0, obj.RecordbookKey);
    CreateParameter('@grup', ftInteger, pdInput, 0, hint);
    CreateParameter('@kat_zach', ftInteger, pdInput, 0, dbcbeCat.KeyValue);
    CreateParameter('@prikzach', ftInteger, pdInput, 0, dbcbeOrder.KeyValue);
    if (obj.CauseEnterID = 0) then
      CreateParameter('@priczach', ftInteger, pdInput, 0, null)
    else
      CreateParameter('@priczach', ftInteger, pdInput, 0, obj.CauseEnterID);
    if (obj.OrderExileID = 0) then
      CreateParameter('@prikOtch', ftInteger, pdInput, 0, null)
    else
      CreateParameter('@prikOtch', ftInteger, pdInput, 0, obj.OrderExileID);
    if (obj.CauseExileID = 0) then
      CreateParameter('@pricOtch', ftInteger, pdInput, 0, null)
    else
      CreateParameter('@pricOtch', ftInteger, pdInput, 0, obj.CauseExileID);

    CreateParameter('@cObosnZach', ftInteger, pdInput, 0, null);
    CreateParameter('@cObosnOtch', ftInteger, pdInput, 0, null);
    CreateParameter('@StazYear', ftInteger, pdInput, 0, eXpyear.Value);
    CreateParameter('@StazMonth', ftInteger, pdInput, 0, eXpMonth.Value);
    CreateParameter('@cDolgnost', ftString, pdInput, 150, eDuty.Text);
    if not(dbcbeEnterprise.KeyValue = -1) then
      CreateParameter('@ik_pred', ftInteger, pdInput, 0,
        dbcbeEnterprise.KeyValue)
    else
      CreateParameter('@ik_pred', ftInteger, pdInput, 0, null);
    CreateParameter('@CLgot', ftString, pdInput, 500, '');
    CreateParameter('@Ik_studGrup', ftInteger, pdInput, 0, obj.StudGrupKey);
  end;
  dmStudentActions.aspAppendStudent.ExecProc;
  modified := false;
  ndGroup := obj.Node.Parent.Data;
  obj.AdoDataset := ndGroup.SetADODataset(dm.DBConnect);
  obj.Refresh;
  RefreshFrame;
end;

function TfmStudent.DoCancel: Boolean;
begin
  DoRefreshFrame;
  result := true;
end;

procedure TfmStudent.DoRefreshFrame;
var
  dsDoc: TADODataSet;
begin
  if not(FrameObject is TDBNodeStudObject) then
    exit;

  FLoaded := false;
  obj := FrameObject as TDBNodeStudObject;
  ik := obj.ID;

  // получаем форму обучения
  dsDoc := TADODataSet.Create(nil);
  try
    dsDoc.CommandText := 'select * from StudInfoForDocs where Ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    if (dsDoc.FieldByName('Ik_form_ed').Value = 2) then // если заочная форма
      MenuItem4.Visible := true
    else
      MenuItem4.Visible := false;
  finally
    dsDoc.Free;
  end;

  // если приказ об отчислении есть
  // obj.State = ssExiled
  if (obj.BaseImageIndex = 12) then
  begin
    frmMain.actAcademRestore.enabled := false;
    frmMain.actPasspChg.enabled := true;
    frmMain.actFamChg.enabled := true;
    frmMain.actOtchisl.enabled := false;
    frmMain.actPerevod.enabled := false;
    frmMain.actAkadem.enabled := false;
    frmMain.actVypiska.enabled := true;
    frmMain.actVosst.enabled := true;
    // frmMain.actNapr.enabled:=false;
    frmMain.actExtendSession.enabled := false;
    actPrintSprav.enabled := false;
  end;
  // obj.State=ssGhost
  if (obj.BaseImageIndex = 25) then
  begin
    frmMain.actAcademRestore.enabled := false;
    frmMain.actPasspChg.enabled := true;
    frmMain.actFamChg.enabled := true;
    frmMain.actOtchisl.enabled := false;
    frmMain.actPerevod.enabled := false;
    frmMain.actAkadem.enabled := false;
    frmMain.actVypiska.enabled := true;
    frmMain.actVosst.enabled := false;
    // frmMain.actNapr.enabled:=false;
    frmMain.actExtendSession.enabled := false;
    actPrintSprav.enabled := false;
  end;

  if (obj.State = ssAcadem) then
  begin
    frmMain.actAcademRestore.enabled := true;
    frmMain.actPasspChg.enabled := true;
    frmMain.actFamChg.enabled := true;
    frmMain.actOtchisl.enabled := true;
    frmMain.actPerevod.enabled := false;
    frmMain.actAkadem.enabled := true;

    frmMain.actAkadem.Caption := 'Изменить академический отпуск...';

    frmMain.actVypiska.enabled := true;
    frmMain.actVosst.enabled := false;

    dmStudentData.adsIsOnVacation.Active := false;
    dmStudentData.adsIsOnVacation.CommandText := 'select [dbo].[IsInVacation]('
      + inttostr(obj.RecordbookKey) + ')';
    dmStudentData.adsIsOnVacation.Active := true;
    dmStudentData.adsIsOnVacation.First;
    // frmMain.actNapr.enabled:=dmStudentData.adsIsOnVacation.Fields[0].AsBoolean;

    frmMain.actExtendSession.enabled := false;
    actPrintSprav.enabled := true;
  end;

  if (obj.State = ssActual) then
  begin
    frmMain.actAcademRestore.enabled := false;
    frmMain.actPasspChg.enabled := true;
    frmMain.actFamChg.enabled := true;
    frmMain.actOtchisl.enabled := true;
    frmMain.actPerevod.enabled := true;
    frmMain.actAkadem.enabled := true;

    frmMain.actAkadem.Caption := 'Академический отпуск...';

    frmMain.actVypiska.enabled := true;
    frmMain.actVosst.enabled := false;
    // frmMain.actNapr.enabled:=true;
    frmMain.actExtendSession.enabled := true;
    actPrintSprav.enabled := true;
  end;

  PageControl1.ActivePageIndex := 0;
  with dmStudentData do
  begin
    adodsDocType.Active := true;
    adodsZaved_Stud.Active := true;
    adodsZaved_Stud.Sort := '[cName_zaved]';
    adodsMedal.Active := false;
    adodsKatZach.Active := false;
    adodsMilSt.Active := false;
    adodsMedal.Active := true;
    adodsKatZach.Active := true;
    adodsMilSt.Active := true;

    adodsNat.Active := false;
    adodsCitizen.Active := false;
    adodsCount.Active := false;
    adodsJob.Active := false;
    adodsPrep.Active := false;
    dmCauses.adodsExile.Active := false;
    adodsSempol.Active := false;
    adodsPrikaz.Active := false;
    adodsNat.Active := true;
    adodsCitizen.Active := true;
    adodsCount.Active := true;
    adodsJob.Active := true;
    adodsPrep.Active := true;
    dmCauses.adodsExile.Active := true;
    adodsSempol.Active := true;
    adodsPrikaz.Active := true;
    modified := false;
    bbSave.enabled := false;
    bbUndo.enabled := false;

    PageControl2.TabIndex := 0;
    adodsLang.Active := false;
    adodsStepVlad.Active := false;
    adodsEnterprise.Active := false;
    adodsRelative.Active := false;

    adodsLang.Active := true;
    adodsStepVlad.Active := true;
    adodsEnterprise.Active := true;
    adodsRelative.Active := true;
  end;
  with dmAdress do
  begin
    adodsStrana.Active := true;
    adodsSignStrana.Active := true;
  end;

  if not Assigned(obj) then
    exit;

  eName.Text := obj.FirstName;
  eMid.Text := obj.MiddleName;
  eFam.Text := obj.LastName;
  eYearFinished.Text := inttostr(obj.YearFinished);
  eBirthPlace.Text := obj.BirthPlace;
  eAddInfo.Text := obj.AddInform;
  eNum.Text := obj.RecordbookNum;
  eEmail.Text := obj.Email;

  ePhone.Text := obj.Phone;
  eCellphone.Text := obj.Cellphone;

  dbdteBirthDate.Value := obj.BirthDate;

  if obj.Sex then
    dbcbeSex.Text := 'Мужской'
  else
    dbcbeSex.Text := 'Женский';

  dbcbeSchool.Text := obj.Finished;
  dbcbeCat.Text := obj.Category;
  dbcbeCitizenship.Text := obj.Citizenship;
  dbcbeSocWork.Text := obj.SocJob;
  dbcbePreparation.Text := obj.Preparation;
  dbcbeSpecCount.Text := obj.SpecCount;
  dbcbeOrder.KeyValue := obj.OrderEnterID;
  dbcbeFamState.Text := obj.FamState;
  dbcbeMedal.Text := obj.Medal;
  dbcbeMilitaryState.KeyValue := obj.MilitaryStateKey;
  dbcbeEnterprise.Value := obj.EnterpriseID;
  eDuty.Text := obj.Duty;

  eXpyear.Value := obj.xpYears;
  eXpMonth.Value := obj.xpMonths;

  if obj.Photo <> nil then
  begin
    obj.Photo.Position := 0;
    // iPhoto.Picture.Graphic:=TBitmap.Create;
    iPhoto.Picture.Graphic := TJPEGImage.Create;
    try
      iPhoto.Picture.Graphic.LoadFromStream(obj.Photo);
    except
    end;
  end;

  cbJob.Checked := obj.Job;
  cbChildren.Checked := obj.Children;
  cbInvalid.Checked := obj.Invalid;
  cbAppNeed.Checked := obj.AppartmentNeed;

  with dmStudentSelectionProcs.aspSelLanguage do
  begin
    Active := false;
    dmStudentSelectionProcs.aspSelLanguagenCode.DefaultExpression :=
      inttostr(obj.ID);
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.ID;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelLastNames do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelExtendedSessions do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelMoves do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelDocuments do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.ID;
    ExecProc;
    Active := true;

  end;

  with dmStudentSelectionProcs.aspGetPersonAddress do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.ID;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelAcadem do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelExiles do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelVosst do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelFamily do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.ID;
    ExecProc;
    Active := true;
  end;

  with dmStudentSelectionProcs.aspSelKatChanges do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.RecordbookKey;
    ExecProc;
    Active := true;
  end;

  modified := false;
  bbSave.enabled := false;
  bbUndo.enabled := false;
  FLoaded := true;

  if (obj.Node.ImageIndex <> 9) and (obj.Node.ImageIndex <> 11) then
  begin
    TabSheet3.enabled := false;
    TabSheet4.enabled := false;
    TabSheet5.enabled := false;
    TabSheet6.enabled := false;
    TabSheet7.enabled := false;

  end
  else
  begin
    TabSheet3.enabled := true;
    TabSheet4.enabled := true;
    TabSheet5.enabled := true;
    TabSheet6.enabled := true;
    TabSheet7.enabled := true;
  end;

end;

procedure TfmStudent.Read;
begin

end;

procedure TfmStudent.sbRefreshClick(Sender: TObject);
begin

  with dmUspevaemost.adsSelAllBRSBallsForStudent do
  begin
    Active := false;
    dmUspevaemost.adsSelAllBRSBallsForStudentn_sem.Visible := true;
    dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible := true;

    CommandText :=
      'select n_module, n_sem,  c_disc, i_balls, PropCount, Uvag_propCount from GetALLBRSBallsForStud('
      + inttostr(obj.RecordbookKey) + ')';

    if cbSemBRS.Text <> 'все' then
    begin
      CommandText := CommandText + ' where (n_sem = ' + cbSemBRS.Text + ')';
      if (cbModuleBRS.Text <> 'все') and (cbModuleBRS.Text <> 'итог') then
      begin
        CommandText := CommandText + ' and (n_module = ' +
          cbModuleBRS.Text + ')';
        dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible := false;
      end;
      dmUspevaemost.adsSelAllBRSBallsForStudentn_sem.Visible := false;
    end
    else if (cbModuleBRS.Text <> 'все') and (cbModuleBRS.Text <> 'итог') then
    begin
      CommandText := CommandText + ' where (n_module = ' +
        cbModuleBRS.Text + ')';
      dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible := false;
    end;

    Active := true;
  end;
end;

procedure TfmStudent.actAddAddressExecute(Sender: TObject);
begin
  frmAddress := TfrmAddress.Create(Self);
  frmAddress.EditMode := false;
  frmAddress.IdStudent := obj.ID;
  frmAddress.ShowModal;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := true;
end;

procedure TfmStudent.actApplyExecute(Sender: TObject);
begin
  inherited;
  DoApply;
end;

procedure TfmStudent.actApplyUpdate(Sender: TObject);
begin
  inherited;
  if Self.modified then
    actApply.enabled := true
  else
    actApply.enabled := false;

end;

procedure TfmStudent.actDeleteAddressExecute(Sender: TObject);
begin
  if MessageBox(Handle, PWideChar('Вы действительно хотите удалить адрес?'),
    'ИС УГТУ', MB_YESNO) = IDYES then
  begin
    dmAdress.aspDelAddress.Parameters[1].Value :=
      dmStudentSelectionProcs.aspGetPersonAddress.FieldByName
      ('ik_personAddress').Value;
    dmAdress.aspDelAddress.ExecProc;
    dmStudentSelectionProcs.aspGetPersonAddress.Active := false;
    dmStudentSelectionProcs.aspGetPersonAddress.Active := true;
  end;
end;

procedure TfmStudent.actEditAddressExecute(Sender: TObject);
begin

  frmAddress := TfrmAddress.Create(Self);
  with dmStudentSelectionProcs.aspGetPersonAddress do
  begin
    frmAddress.EditMode := true;

    frmAddress.AddressKey := FieldByName('Ik_personAddress').Value;
    frmAddress.dbcbeAddressType.KeyValue := FieldByName('Ik_AddressType').Value;
    frmAddress.dbcbeCountry.KeyValue := FieldByName('Ik_strana').Value;
    frmAddress.dbcbeReg.KeyValue := FieldByName('Ik_region').Value;
    frmAddress.dbcbeDist.KeyValue := FieldByName('Ik_raion').Value;
    frmAddress.dbcbePoint.KeyValue := FieldByName('Ik_gorod').Value;
    frmAddress.dbcbeStreet.KeyValue := FieldByName('Ik_Street').Value;

    frmAddress.eFlat.Text := FieldByName('FlatNumber').AsString;
    frmAddress.eHouse.Text := FieldByName('BuildingNumber').AsString;
    frmAddress.eBuilding.Text := FieldByName('StructNumber').AsString;
    frmAddress.eIndex.Text := FieldByName('fIndex').AsString;
    frmAddress.dbdteBegin.Value := FieldByName('DateBegin').Value;
    frmAddress.dbdteEnd.Value := FieldByName('DateEnd').Value;

    frmAddress.ShowModal;
    frmAddress.Free;
  end;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := true;
end;

procedure TfmStudent.actObnovlExecute(Sender: TObject);
begin
  cmbxSemChange(Sender);
end;

// Возвращает месяц в род. падеже
function GetMonthR(month: integer): string;
var
  str: string;
begin
  case month of
    1:
      str := 'января';
    2:
      str := 'февраля';
    3:
      str := 'марта';
    4:
      str := 'апреля';
    5:
      str := 'мая';
    6:
      str := 'июня';
    7:
      str := 'июля';
    8:
      str := 'августа';
    9:
      str := 'сентября';
    10:
      str := 'октября';
    11:
      str := 'ноября';
    12:
      str := 'декабря';
  end;
  result := str;
end;

procedure TfmStudent.actPrintPensSpravExecute(Sender: TObject);
var // E: Variant;
  // str,dir_inst,copystr1,copystr2,dop:string;
  // posit:integer;
  // FindRange: Variant;
  // tempStoredProc: TADOStoredProc;
  tempDS: TADODataSet;
  Report: TReportBase;
  i, LastNum: integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  k: integer;
  editF: TfrmReviewDoc;
  dsDoc: TADODataSet;
begin
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  try
    // находим номер будущей справки

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      datebegin := '01.09.' + AYear.ToString()
    else
      datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + datebegin + '''' +
      ',' + '''' + DateTimeToStr(date()) + ''')';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;

    editF := TfrmReviewDoc.Create(Self);
    editF.dtUtv.Format := '';
    editF.dtUtv.date := date;
    editF.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    editF.eDest.Text := 'ПФ';
  //  editF.eNum.Text := LastNum.ToString();
    editF.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    editF.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    editF.ShowModal;
    if (editF.ModalResult = mrOk) or (editF.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // добавляем справку

        tempDS.CommandText := 'Select * from Document';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
        tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := 2;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value :=
          sp_depInd.FieldByName('Dep_Index').AsString;
        tempDS.Post;
        tempDS.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (editF.ModalResult = mrYes) then
    begin
      Report := TUspevGroupController.Instance.BuildSpravka2014(obj.StudGrupKey,
        1, LastNum);
      TWaitingController.GetInstance.Process(Report);
    end;
  finally
    tempDS.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
  // var E: Variant;
  // str, year_post,dop,dir_inst,copystr1,copystr2:string;
  // year, posit, i, first_step:integer;
  // FindRange: Variant;
  // tempStoredProc: TADOStoredProc;
  // histDS: TADODataSet;
  // begin
  // //вызываем процедуру, возвращающую ФИО в дат. падеж и иную нужную инфу
  // tempStoredProc:= TADOStoredProc.Create(nil);
  // histDS := TADODataSet.Create(nil);
  // try
  // try
  // tempStoredProc.ProcedureName:= 'StudGetInfForSprav;1';
  // tempStoredProc.Connection:= dm.DBConnect;
  // tempStoredProc.Parameters.CreateParameter('@Ik_studGrup', ftInteger, pdInput, 4, obj.StudGrupKey);
  // tempStoredProc.Open;
  // tempStoredProc.First;  //FIO
  // except
  // tempStoredProc.Free;
  // MessageBox(Handle, 'Произошла ошибка при получении информации по студенту.','ИС Деканат',MB_OK);
  // exit;
  // end;
  //
  // //возвращаем историю движения студента
  // try
  // histDS.CommandText:= 'select * from StudHistory('+IntToStr(obj.StudGrupKey)+')';
  // histDS.Connection:= dm.DBConnect;
  // histDS.Open;
  // histDS.First;
  // except
  // histDS.Free;
  // MessageBox(Handle, 'Произошла ошибка при получении истории движения студента.','ИС Деканат',MB_OK);
  // exit;
  // end;
  //
  // try
  // //экспорт в Excel
  // E := CreateOleObject('Excel.Application');
  // E.Visible := false;
  // E.DisplayAlerts:= false;
  // str := ExtractFilePath(Application.ExeName)+'reports\SprvPens.XLT';
  // E.WorkBooks.Add(str);
  // E.Sheets[1].Select;
  // FindRange := E.Cells.Replace(What := '#fio#',Replacement:=tempStoredProc.FieldByName('FIO').AsString);
  // //obj.y  .
  // case tempStoredProc.FieldByName('kurs').Value of
  // 1: str := 'первом';
  // 2: str := 'втором';
  // 3: str := 'третьем';
  // 4: str := 'четвертом';
  // 5: str := 'пятом';
  // 6: str := 'шестом';
  // end;
  // //  year_post:=tempStoredProc.FieldByName('zachYear').AsString ;
  // FindRange := E.Cells.Replace(What := '#kurs#',Replacement:=str);
  // FindRange := E.Cells.Replace(What := '#spec#',Replacement:=tempStoredProc.FieldByName('Cname_grup').AsString);
  // FindRange := E.Cells.Replace(What := '#fac#',Replacement:=tempStoredProc.FieldByName('Cname_fac_rod_pad').AsString);
  // FindRange := E.Cells.Replace(What := '#birth_y#',Replacement:=tempStoredProc.FieldByName('studBirthYear').AsString);
  // dop:=tempStoredProc.FieldByName('sprDate').AsString;
  // if (dop.Length=1) then  dop:='0'+dop;
  // FindRange := E.Cells.Replace(What := '#Date#',Replacement:=dop);
  // str:=GetMonthR(tempStoredProc.FieldByName('sprMonth').Value);
  // FindRange := E.Cells.Replace(What := '#Month#',Replacement:=str);
  // FindRange := E.Cells.Replace(What := '#Year#',Replacement:=tempStoredProc.FieldByName('sprYear').AsString);
  //
  // FindRange := E.Cells.Replace(What := '#PrNum#',Replacement:=dmStudentData.adodsPrikaz.FieldByName('Nn_prikaz').AsString);
  // dop:=tempStoredProc.FieldByName('zachDate').AsString;
  // if (dop.Length=1) then  dop:='0'+dop;
  // FindRange := E.Cells.Replace(What := '#DateZ#',Replacement:=dop);
  // str:=GetMonthR(tempStoredProc.FieldByName('zachMonth').Value);
  // FindRange := E.Cells.Replace(What := '#MonthZ#',Replacement:=str);
  // FindRange := E.Cells.Replace(What := '#YearZ#',Replacement:=tempStoredProc.FieldByName('YearPricZach').AsString);
  //
  // { first_step := 18;
  // for i := first_step to first_step + histDS.RecordCount - 1 do
  // begin
  // E.ActiveSheet.Range['F' + inttostr(I + 1), 'N' + inttostr(I + 1)].Insert(xlDown, xlFormatFromLeftOrAbove);
  // end;
  // }
  // dir_inst:=tempStoredProc.FieldByName('ManagerSmallName').AsString;
  // posit:=Pos(' ', dir_inst);
  // copystr1:=Copy(dir_inst,posit+1,Length(dir_inst));
  // copystr2:=Copy(dir_inst,1,posit-1);
  // copystr1:=copystr1+' '+copystr2;
  // FindRange := E.Cells.Replace(What := '#dir_inst#',Replacement:=copystr1);
  //
  // FindRange := E.Cells.Replace(What := '#otdel#',Replacement:=tempStoredProc.FieldByName('Cname_form_pril').AsString);
  // FindRange := E.Cells.Replace(What := '#phone_inst#',Replacement:=', ' + tempStoredProc.FieldByName('DepPhoneNumber').AsString);
  // FindRange := E.Cells.Replace(What := '#dep_ind#',Replacement:=tempStoredProc.FieldByName('Dep_Index').AsString);
  //
  // year:= tempStoredProc.FieldByName('sprYear').Value-
  // tempStoredProc.FieldByName('kurs').Value;
  // if tempStoredProc.FieldByName('sprMonth').Value>8 then
  // year:= year-1;
  //
  // //FindRange := E.Cells.Replace(What := '#YearZach#',Replacement:=IntToStr(zachYear));
  // FindRange := E.Cells.Replace(What := '#YearOtch#',Replacement:=IntToStr(tempStoredProc.FieldByName('YearGrupEnd').Value));
  //
  // //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  // E.DisplayAlerts:= true;
  // E.Visible := true;
  // except
  // E.Quit;
  // E:= UnAssigned;
  // MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
  // end;
  // finally
  // tempStoredProc.Free;
  // end;
end;

procedure TfmStudent.actPrintSpravExecute(Sender: TObject);
var // E: Variant;
  // str,dir_inst,copystr1,copystr2,dop:string;
  // posit:integer;
  // FindRange: Variant;
  // tempStoredProc: TADOStoredProc;
  tempDS: TADODataSet;
  Report: TReportBase;
  i, LastNum: integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  k: integer;
  editF: TfrmReviewDoc;
  dsDoc: TADODataSet;
begin
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  try
    // находим номер будущей справки

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      datebegin := '01.09.' + AYear.ToString()
    else
      datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + datebegin + '''' +
      ',' + '''' + DateTimeToStr(date()) + ''')';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;
    editF := TfrmReviewDoc.Create(Self);
    editF.dtUtv.Format := '';
    editF.dtUtv.date := date;
    editF.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    editF.eDest.Text := 'По месту требования';
 //   editF.eNum.Text := LastNum.ToString();
    editF.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    editF.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    editF.ShowModal;

    if (editF.ModalResult = mrOk) or (editF.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try // добавляем справку
        tempDS.CommandText := 'Select * from Document';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
        tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := 1;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value :=
          sp_depInd.FieldByName('Dep_Index').AsString;
        tempDS.Post;
        tempDS.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (editF.ModalResult = mrYes) then // печатаем
    begin
      Report := TUspevGroupController.Instance.BuildSpravka2014(obj.StudGrupKey,
        0, LastNum);
      TWaitingController.GetInstance.Process(Report);
    end;
  finally
    tempDS.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
  // вызываем процедуру, переводящую ФИО в дат. падеж
  // //и возвращающую иную нуную инфу
  // try
  // tempStoredProc:= TADOStoredProc.Create(nil);
  // try
  // tempStoredProc.ProcedureName:= 'StudGetInfForSprav;1';
  // tempStoredProc.Connection:= dm.DBConnect;
  // //tempStoredProc.Parameters.CreateParameter('@Clastname', ftString, pdInput, 50, obj.LastName);
  // //tempStoredProc.Parameters.CreateParameter('@Cfirstname', ftString, pdInput, 50, obj.FirstName);
  // //tempStoredProc.Parameters.CreateParameter('@Cotch', ftString, pdInput, 50, obj.MiddleName);
  // tempStoredProc.Parameters.CreateParameter('@Ik_studGrup', ftInteger, pdInput, 4, obj.StudGrupKey);
  // //tempStoredProc.Parameters.CreateParameter('@DateZach', ftDateTime, pdInput, 8, dmStudentData.adodsPrikaz.FieldByName('Dd_prikaz').Value);
  // //tempStoredProc.Parameters.CreateParameter('@Date', ftDateTime, pdInput, 8, Date);
  // //tempStoredProc.Parameters.CreateParameter('@DateBirth', ftDateTime, pdInput, 8, obj.BirthDate);
  // tempStoredProc.Open;
  // tempStoredProc.First;  //FIO
  // except
  // tempStoredProc.Free;
  // MessageBox(Handle, 'Произошла ошибка при обращении к серверу.','ИС Деканат',MB_OK);
  // exit;
  // end;
  //
  // //экспорт в Excel
  // try
  // E := CreateOleObject('Excel.Application');
  // E.Visible := false;
  // E.DisplayAlerts:= false;
  // str := ExtractFilePath(Application.ExeName)+'reports\Sprv.XLT';
  // E.WorkBooks.Add(str);
  // E.Sheets[1].Select;
  // FindRange := E.Cells.Replace(What := '#place#',Replacement:='По месту требования');
  //
  // FindRange := E.Cells.Replace(What := '#fio#',Replacement:=tempStoredProc.FieldByName('FIO').AsString);
  // //obj.y  .
  // case tempStoredProc.FieldByName('kurs').Value of
  // 1: str := 'первом';
  // 2: str := 'втором';
  // 3: str := 'третьем';
  // 4: str := 'четвертом';
  // 5: str := 'пятом';
  // 6: str := 'шестом';
  // end;
  // FindRange := E.Cells.Replace(What := '#kurs#',Replacement:=str);
  // FindRange := E.Cells.Replace(What := '#spec#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
  // FindRange := E.Cells.Replace(What := '#fac#',Replacement:=tempStoredProc.FieldByName('Cname_fac_rod_pad').AsString);
  // dop:=tempStoredProc.FieldByName('sprDate').AsString;
  // if (dop.Length=1) then  dop:='0'+dop;
  // FindRange := E.Cells.Replace(What := '#Date#',Replacement:=dop);
  //
  // str:= GetMonthR(tempStoredProc.FieldByName('sprMonth').Value);;
  // FindRange := E.Cells.Replace(What := '#Month#',Replacement:=str);
  // FindRange := E.Cells.Replace(What := '#Year#',Replacement:=tempStoredProc.FieldByName('sprYear').AsString);
  // FindRange := E.Cells.Replace(What := '#YearZ#',Replacement:=tempStoredProc.FieldByName('YearPricZach').AsString);
  // dir_inst:=tempStoredProc.FieldByName('ManagerSmallName').AsString;
  // posit:=Pos(' ', dir_inst);
  // copystr1:=Copy(dir_inst,posit+1,Length(dir_inst));
  // copystr2:=Copy(dir_inst,1,posit-1);
  // copystr1:=copystr1+' '+copystr2;
  // FindRange := E.Cells.Replace(What := '#dir_inst#',Replacement:=copystr1);
  // FindRange := E.Cells.Replace(What := '#dir_inst#',Replacement:=tempStoredProc.FieldByName('ManagerSmallName').AsString);
  // FindRange := E.Cells.Replace(What := '#dep_ind#',Replacement:=tempStoredProc.FieldByName('Dep_Index').AsString);
  // FindRange := E.Cells.Replace(What := '#podgot#',Replacement:=tempStoredProc.FieldByName('Podgot').AsString);
  // FindRange := E.Cells.Replace(What := '#phone_inst#',Replacement:= ', ' + tempStoredProc.FieldByName('DepPhoneNumber').AsString);
  // FindRange := E.Cells.Replace(What := '#otdel#',Replacement:=tempStoredProc.FieldByName('Cname_form_pril').AsString);
  // FindRange := E.Cells.Replace(What := '#YearOtch#',Replacement:=
  // IntToStr(tempStoredProc.FieldByName('YearGrupEnd').Value));
  //
  //
  // //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  // E.Visible := true;
  // E.DisplayAlerts:= true;
  // except
  // E.Quit;
  // E:= UnAssigned;
  // MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
  // end;
  // finally
  // tempStoredProc.Free;
  // end;
end;

procedure TfmStudent.actPropToFactExecute(Sender: TObject);
begin
  dmAdress.aspPropToFact.Parameters[1].Value := obj.ID;
  dmAdress.aspPropToFact.ExecProc;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active := true;
end;

procedure TfmStudent.actUndoExecute(Sender: TObject);
begin
  inherited;
  DoCancel;
end;

procedure TfmStudent.actUndoUpdate(Sender: TObject);
begin
  inherited;
  if Self.modified then
    actUndo.enabled := true
  else
    actUndo.enabled := false;
end;

procedure TfmStudent.BbSaveclick(Sender: TObject);
begin
  DoApply;
  bbSave.enabled := false;
  bbUndo.enabled := false;
end;

procedure TfmStudent.eFamExit(Sender: TObject);
var
  s, sm: string;
begin
  inherited;
  if eFam.Text <> '' then
  begin
    s := eFam.Text;
    sm := AnsiUpperCase(s);
    s[1] := sm[1];
    eFam.Text := s;
  end;
end;

procedure TfmStudent.eMidExit(Sender: TObject);
var
  s, sm: string;
begin
  inherited;
  if eMid.Text <> '' then
  begin
    s := eMid.Text;
    sm := AnsiUpperCase(s);
    s[1] := sm[1];
    eMid.Text := s;
  end;
end;

procedure TfmStudent.eNameExit(Sender: TObject);
var
  s, sm: string;
begin
  inherited;
  if eName.Text <> '' then
  begin
    s := eName.Text;
    sm := AnsiUpperCase(s);
    s[1] := sm[1];
    eName.Text := s;
  end;
end;

procedure TfmStudent.dbcbeSexChange(Sender: TObject);
begin
  dbcbeSex.ReadOnly := true;
  eFamChange(Sender);
end;

procedure TfmStudent.dbcbeSexDropDown(Sender: TObject);
begin

  dbcbeSex.ReadOnly := false;
end;

procedure TfmStudent.eEmailExit(Sender: TObject);
begin
  inherited;
  if eEmail.Text = '' then
    exit;
  if (Ansipos('@', eEmail.Text) = 0)
  // or(Ansipos('.',eEmail.text)=0) or(Ansipos('@',eEmail.text)>Ansipos('.',eEmail.text))
  then
  begin
    showmessage('Неверный e-mail!');
    eEmail.Text := '';
  end;
end;

procedure TfmStudent.eFamChange(Sender: TObject);
begin
  inherited;
  modified := true;
  bbSave.enabled := true;
  bbUndo.enabled := true;
end;

procedure TfmStudent.dbgeBallsTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adsSelAllBRSBallsForStudent.Sort :=
    '[' + Column.Field.FullName + ']';
end;

procedure TfmStudent.dbgeFamExit(Sender: TObject);
begin
  if modified then
  begin
    bbSave.enabled := true;
    bbUndo.enabled := true;
  end;

end;

procedure TfmStudent.iPhotoClick(Sender: TObject);
begin
  inherited;
  if odPhoto.Execute then
  begin
    iPhoto.Picture.LoadFromFile(odPhoto.FileName);
    { if (iphoto.Picture.Width>256)or(iphoto.Picture.Height>320) then
      begin
      showmessage('Максимальный размер фото: 256*320!');
      iphoto.Picture:=nil;
      end else begin }
    modified := true;
    bbSave.enabled := true;
    bbUndo.enabled := true;
    // end;
  end;
end;

procedure TfmStudent.iPhotoMouseEnter(Sender: TObject);
var
  pt: TPoint;
begin
  if not Assigned(iPhoto.Picture.Graphic) then
    exit;

  pt := iPhoto.ClientToScreen(Point(0, 0));

  ImageFullSizeShowForm.curControl := Self.iPhoto;
  ImageFullSizeShowForm.Height := iPhoto.Picture.Graphic.Height;
  ImageFullSizeShowForm.Width := iPhoto.Picture.Graphic.Width;
  ImageFullSizeShowForm.Top := pt.Y - (ImageFullSizeShowForm.Height div 2 -
    iPhoto.Height div 2);
  ImageFullSizeShowForm.Left := pt.X -
    (ImageFullSizeShowForm.Width div 2 - iPhoto.Width div 2);

  ImageFullSizeShowForm.Image := iPhoto.Picture.Graphic;
  ImageFullSizeShowForm.Show;
end;

procedure TfmStudent.cbModuleBRSChange(Sender: TObject);
begin
  sbRefreshClick(Sender);
end;

procedure TfmStudent.cbSemBRSChange(Sender: TObject);
begin
  sbRefreshClick(Sender);
end;

procedure TfmStudent.cmbxSemChange(Sender: TObject);
begin
  dmUspevaemost.adospSelUspevForStud.Active := false;
  with dmUspevaemost.adospSelUspevForStud.Parameters do
  begin
    clear;
    AddParameter;
    Items[0].Value := cmbxSem.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject
      (frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospSelUspevForStud.ExecProc;
  dmUspevaemost.adospSelUspevForStud.Active := true;
  DBGridEh1.Columns[0].Title.Caption := 'Дисциплина';
  DBGridEh1.Columns[1].Title.Caption := 'Вид занятий';
  DBGridEh1.Columns[2].Title.Caption := 'Оценка';
  DBGridEh1.Columns[3].Title.Caption := 'Дата';
  DBGridEh1.Columns[4].Title.Caption := 'Преподаватель';
  DBGridEh1.Columns[5].Title.Caption := 'Семестр';
  DBGridEh1.Columns[5].Width := 50;
  DBGridEh1.Columns[6].Title.Caption := 'Кол-во часов';
  DBGridEh1.Columns[6].Width := 100;
end;

procedure TfmStudent.cmbxSemNaprChange(Sender: TObject);
begin
  dmUspevaemost.adospGetAllNaprStud.Active := false;
  with dmUspevaemost.adospGetAllNaprStud.Parameters do
  begin
    clear;
    AddParameter;
    Items[0].Value := cmbxSemNapr.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject
      (frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospGetAllNaprStud.ExecProc;
  dmUspevaemost.adospGetAllNaprStud.Active := true;
end;

procedure TfmStudent.GetUspevStat(ik_zach: integer);
begin
  dmUspevaemost.adospUspevStatForStud.Close;
  with dmUspevaemost.adospUspevStatForStud.Parameters do
  begin
    clear;
    // AddParameter;
    // Items[0].Value := ik_zach;
    CreateParameter('@ik_zach', ftInteger, pdInput, 0, ik_zach);
  end;
  dmUspevaemost.adospUspevStatForStud.Open;

end;

procedure TfmStudent.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.TabIndex = 1 then
    cmbxSem.ItemIndex := 0;
  if PageControl1.TabIndex = 2 then
    cmbxSemNapr.ItemIndex := 0;

  if PageControl1.ActivePage = tsUspevStat then
  begin
    if (not dmUspevaemost.adospUspevStatForStud.Active) or
      (dmUspevaemost.adospUspevStatForStud.Parameters.ParamByName('@ik_zach')
      .Value <> TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject)
      .RecordbookKey) then
      GetUspevStat(TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject)
        .RecordbookKey);
  end;

  if PageControl1.ActivePage = tsBRSBalls then
    sbRefreshClick(Sender);

end;

procedure TfmStudent.bbUndoClick(Sender: TObject);
begin
  DoCancel;

  bbSave.enabled := false;
  bbUndo.enabled := false;
end;

procedure TfmStudent.bShotClick(Sender: TObject);
begin
  TApplicationController.GetInstance.GetPhotoBooth
    (ExtractFileDir(Application.ExeName), iPhoto);
  modified := true;
  bbSave.enabled := true;
  bbUndo.enabled := true;
end;

procedure TfmStudent.btnPrintSmallUspevClick(Sender: TObject);
var
  Report: TReportBase;
begin
  Report := TReportBase.CreateReport(TStudUspevExcelReport);
  Report.FreeOnComplete := true;
  Report.OnExecuteError := ExecuteError;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\StudUspev.XLT';
  TStudUspevExcelReport(Report).DataSet :=
    TADODataSet(dmUspevaemost.adospSelUspevForStud);
  TStudUspevExcelReport(Report).IsSmall := true;
  TWaitingController.GetInstance.Process(Report);
  // Report.BuildReport;
end;

procedure TfmStudent.eAddInfoEnter(Sender: TObject);
begin

  eAddInfo.BevelKind := bksoft;

end;

procedure TfmStudent.eAddInfoExit(Sender: TObject);
begin
  eAddInfo.BevelKind := bknone;
end;

procedure TfmStudent.ToolButton1Click(Sender: TObject);
begin
  inherited;
  frmDiplom := TfrmDiplom.Create(Self);
  frmDiplom.ik := obj.ik;
  frmDiplom.ShowModal;
  frmDiplom.Free;
end;

procedure TfmStudent.eNumExit(Sender: TObject);
begin
  if Length(eNum.Text) < 6 then
  begin
    showmessage('Неверный номер зачетной книжки!');
    RefreshFrame;
  end;
end;

procedure TfmStudent.eNumUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if Length(eNum.Text) < 6 then
  begin
    showmessage('Неверный номер зачетной книжки!');
    RefreshFrame;
  end;
end;

procedure TfmStudent.DBGridEh1TitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospSelUspevForStud.Sort := '[' + Column.Field.FullName + ']';
end;

procedure TfmStudent.dbgrNaprTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospGetAllNaprStud.Sort := '[' + Column.Field.FullName + ']';
end;

procedure TfmStudent.dbgUspevStatTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospUspevStatForStud.Sort := '[' + Column.Field.FullName + ']';

end;

procedure TfmStudent.KontExcelClick(Sender: TObject);
var
  Report: TReportBase;
begin
  Report := TReportBase.CreateReport(TStudUspevExcelReport);
  Report.FreeOnComplete := true;
  Report.OnExecuteError := ExecuteError;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\StudUspev.XLT';
  TStudUspevExcelReport(Report).DataSet :=
    TADODataSet(dmUspevaemost.adospSelUspevForStud);
  TStudUspevExcelReport(Report).IsSmall := false;
  TWaitingController.GetInstance.Process(Report);
  // Report.BuildReport;
end;

procedure TfmStudent.MenuItem4Click(Sender: TObject);
begin
  inherited;

end;

// справка вызов
procedure TfmStudent.ExecuteError(Sender: TObject; E: Exception);
begin
  showmessage('Произошла ошибка при экспорте успеваемости cтудента: ' +
    E.Message);
  (Sender as TReportBase).Quit;
end;

{ try
  ExAppl:=CreateOleObject('Excel.Application');
  ExAppl.WorkBooks.Add;
  wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];
  ExAppl.DisplayAlerts:= false;
  dmUspevaemost.adospSelUspevForStud.First;
  i := 1;
  wb.sheets[1].cells[i,1] := 'Предмет';
  wb.sheets[1].cells[i,2] := 'Вид отчётности';
  wb.sheets[1].cells[i,3] := 'Оценка';
  wb.sheets[1].cells[i,4] := 'Дата';
  wb.sheets[1].cells[i,5] := 'Преподаватель';
  wb.sheets[1].cells[i,6] := 'Семестр';
  Inc(i);
  while not dmUspevaemost.adospSelUspevForStud.Eof do
  begin
  wb.sheets[1].cells[i,1] := dmUspevaemost.adospSelUspevForStud.Fields[0].Value;
  wb.sheets[1].cells[i,2] := dmUspevaemost.adospSelUspevForStud.Fields[1].Value;
  wb.sheets[1].cells[i,3] := dmUspevaemost.adospSelUspevForStud.Fields[2].Value;
  wb.sheets[1].cells[i,4] := dmUspevaemost.adospSelUspevForStud.Fields[3].Value;
  wb.sheets[1].cells[i,5] := dmUspevaemost.adospSelUspevForStud.Fields[4].Value;
  wb.sheets[1].cells[i,6] := dmUspevaemost.adospSelUspevForStud.Fields[5].Value;
  dmUspevaemost.adospSelUspevForStud.Next;
  Inc(i);
  end;
  wb.sheets[1].Range['A1:F'+intToStr(i-1)].Borders.Weight:=2;
  wb.sheets[1].Range['A1'].ColumnWidth:=45;
  wb.sheets[1].Range['B1'].ColumnWidth:=13;     //фио
  wb.sheets[1].Range['C1'].ColumnWidth:=8;
  wb.sheets[1].Range['D1'].ColumnWidth:=9;
  wb.sheets[1].Range['E1'].ColumnWidth:=21;
  wb.sheets[1].Range['F1'].ColumnWidth:=7;

  ExAppl.DisplayAlerts:= true;
  ExAppl.Visible := true;
  except
  MessageBox(Handle, 'Произошла ошибка при экспорте успеваемости в Excel.','ИС "УГТУ"',
  MB_OK) ;
  ExAppl.Quit;
  ExAppl:= UnAssigned;
  end;
  end; }

end.
