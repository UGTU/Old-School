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

  DBAxisGridsEh, uUspevGroupController, GeneralController, uReviewDoc,
  uReviewCallSpr, uReviewApplication, uDMDocuments, uReviewAkadem,
  uReviewNotify, Document, Destination,
  System.Generics.Collections, uDocController,
DocumentClass,
  Data.Win.ADODB,DBTVgroupobj;




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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Panel8: TPanel;
    Label1: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbgeLang: TDBGridEh;
    Panel5: TPanel;
    Label27: TLabel;
    Label29: TLabel;
    pnlDop: TPanel;
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
    Label33: TLabel;
    Label46: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label58: TLabel;
    gbProlongued: TGroupBox;
    DBGridEh6: TDBGridEh;
    KontExcel: TSpeedButton;
    alAct: TActionList;
    actApply: TAction;
    actUndo: TAction;
    actPrintSprav: TAction;
    actPrintPensSprav: TAction;
    ppmSpravToExcel: TPopupMenu;
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
    tbMagazine: TTabSheet;
    panelMagaz: TPanel;
    lPeriod: TLabel;
    tbAction: TToolBar;
    tbUtv: TToolButton;
    tbGot: TToolButton;
    tbPrint: TToolButton;
    bbReset: TBitBtn;
    dtpStart: TDateTimePicker;
    ilMain: TImageList;
    dbgehMagazineDocsStud: TDBGridEh;
    tbCreate: TToolButton;
    cbeDest: TDBLookupComboboxEh;
    lDef: TLabel;
    dtpEnd: TDateTimePicker;
    gridColumnSelectMenu: TPopupMenu;
    rgSex: TRadioGroup;
    Label50: TLabel;
    actAddDocument: TAction;
    actUpdateDocument: TAction;
    actDelDocument: TAction;
    pnlToolDoc: TPanel;
    sbAddDoc: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SbDelDoc: TSpeedButton;
    pnlWork: TPanel;
    Label51: TLabel;
    dbcbeEnterprise: TDBLookupComboboxEh;
    Label54: TLabel;
    eDuty: TDBEditEh;
    Label55: TLabel;
    eXpyear: TDBNumberEditEh;
    Label56: TLabel;
    eXpMonth: TDBNumberEditEh;
    Label57: TLabel;
    adoSelDocFiles: TADODataSet;
    adoSelDocFilesik_doc_file: TIntegerField;
    adoSelDocFilesIK_doc: TIntegerField;
    adoSelDocFilesdoc_file: TBlobField;

    procedure BbSaveclick(Sender: TObject);
    procedure eFamExit(Sender: TObject);
    procedure eMidExit(Sender: TObject);
    procedure eNameExit(Sender: TObject);
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
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure dtpStartCloseUp(Sender: TObject);
    procedure dtpEndCloseUp(Sender: TObject);
    procedure bbResetClick(Sender: TObject);
    procedure tbUtvClick(Sender: TObject);
    procedure tbGotClick(Sender: TObject);
    procedure tbCreateClick(Sender: TObject);
    procedure dbgehMagazineDocsStudDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure gridColumnSelectMenuPopup(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure rgSexClick(Sender: TObject);
    procedure actAddDocumentExecute(Sender: TObject);
    procedure actUpdateDocumentExecute(Sender: TObject);
    procedure actDelDocumentExecute(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure dbgeDocumentsCellClick(Column: TColumnEh);
    procedure dbgeDocumentsDblClick(Sender: TObject);
    procedure cbJobClick(Sender: TObject);
    procedure dbcbeCitizenshipChange(Sender: TObject);

  private
    Fik: integer;
    FTypeGrazd: integer;
    FLoaded: Boolean;
    Fobj: TDBNodeStudObject;
    FDocumentStateChanged : TNotifyEvent;
    fDebtList: TStringList;
    procedure GetUspevStat(ik_zach: Integer);
    procedure SetDebtList(const Value: TStringList);
    procedure OnMyMenuItemClick(Sender: TObject);

  protected
    FDocRecordList: TObjectList<TDocRecord>;
    procedure DoRefreshFrame; override;
    function DoApply: Boolean; override;
    function DoCancel: Boolean;
    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure DocumentChanged;virtual;

  public

    property DebtList: TStringList read fDebtList write SetDebtList;

    property DocRecordList: TObjectList<TDocRecord> read FDocRecordList write FDocRecordList;
    property ik: integer read Fik write Fik;
    property Loaded: Boolean write FLoaded;
    property obj: TDBNodeStudObject read Fobj write Fobj;
    // procedure FormSpr(ik_studGrup, ik_destination: Integer);
    procedure FormSpr(ik_studGrup, ik_destination: Integer);
    procedure FormCallSpr(ik_studGrup, ik_destination: Integer);

    procedure FormApplicationSpr(ik_studGrup, ik_destination: Integer);
    procedure FormAcademSpr(ik_studGrup, ik_destination: Integer);
    procedure FormNeuspSpr(ik_studGrup, ik_destination: Integer);
    procedure FormExtract(ik_studGrup, ik_destination: Integer);
      published
    property OnDocumentStateChanged: TNotifyEvent read FDocumentStateChanged write FDocumentStateChanged;
    // function CalculationLastNum(ik_studGrup: Integer; ik_dest: Integer)
    // : Integer;
    // function CalculationDepIndex(ik_studGrup: Integer): string;
    // function CalculationBeginYearLern(): string;
  end;

var
  fmStudent: TfmStudent;
  ik_stud, ik_grup: Integer;

implementation

uses uDMStudentSelectionProcs, uDMStudentActions, uDM, uMain, uDMStudentData,
  uDMCauses, uDMAdress, uDMUspevaemost,

  ImageFullSizeShowFrm, ExceptionBase, uAddDocument, PersonController,
  ConstantRepository, uDipl;

{$R *.dfm}

procedure TfmStudent.SetDebtList(const Value: TStringList);
var
  i: Integer;
begin
  fDebtList := TStringList.Create;
  fDebtList.Clear;
  for i := 0 to Value.Count - 1 do
    fDebtList.Add(Value[i]);
end;

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

  i:integer;
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

    if dbgeLang.DataSource.DataSet.RecordCount > 0 then
    begin
      Edit;
      UpdateRecord;
      Post;
      Open;
    end;
  except
    on E:Exception do
      begin
        raise EApplicationException.Create('Произошла ошибка при сохранении языка.',E);
        exit;
      end;
  end;

  try

    with FDocRecordList do
    for I := 0 to Count - 1 do
    begin

      if (Items[i].ikDoc <> 0) then
      begin
        if Items[i].isDeleted then
          TPersonController.Instance.DeleteDocument(Items[i].ikDoc) //удалить
        else TPersonController.Instance.UpdateDocument(Items[i]) // редактировать
      end
      else
        TPersonController.Instance.AddDocument(obj.ID, Items[i]);  //добавить
    end;
  except
    on E:Exception do
      begin
        raise EApplicationException.Create('Произошла ошибка при сохранении документов.',E);
        exit;
      end;
  end;

  FDocRecordList.Clear;

 { try
    with dmStudentSelectionProcs.aspSelDocuments do
   // if dbgeDocuments.DataSource.DataSet.RecordCount > 0 then
    begin
      Edit;
      UpdateRecord;
      Post;
      Open;
    end;
  except

    on E:Exception do
      begin
        raise EApplicationException.Create('Произошла ошибка при сохранении документов.',E);
        exit;
      end;
  end; }

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
    //if dbcbeSex.Text = 'Мужской' then
      CreateParameter('@sex', ftBoolean, pdInput, 0, rgSex.itemIndex);
    //else
      //CreateParameter('@sex', ftBoolean, pdInput, 0, 0);
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

    //если нет приказа, но человек в состоянии акадм. отпуска
    if (dbcbeOrder.KeyValue=0) and (obj.CauseEnterID = AcademReturn) then
      CreateParameter('@prikzach', ftInteger, pdInput, 0, null)
      else CreateParameter('@prikzach', ftInteger, pdInput, 0, dbcbeOrder.KeyValue);
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

procedure TfmStudent.DocumentChanged;
begin
  if Assigned(FDocumentStateChanged) then
     FDocumentStateChanged(Self);
end;

procedure TfmStudent.DoRefreshFrame;
var
  dsDoc: TADODataSet;
begin
  if not(FrameObject is TDBNodeStudObject) then
    exit;

  if not Assigned(FDocRecordList) then
      FDocRecordList := TObjectList<TDocRecord>.Create(True);

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
//    if (dsDoc.FieldByName('Ik_form_ed').Value = 2) then // если заочная форма
//      MenuItem4.Visible := true
//    else
//      MenuItem4.Visible := false;
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

    frmMain.actPerevod.enabled := true;
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


  if obj.Sex then rgSex.ItemIndex := 1 else rgSex.ItemIndex := 0;

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

    Parameters.Clear;
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


  with dmStudentSelectionProcs.adoSelDocuments do
  begin

    Active := false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value := obj.ID;
    Open;
    Active := true;
    Close;
    CommandText := 'select * from SelStudDocuments('+IntToStr(obj.ID)+')';
    Open;

    FieldByName('balls').Visible := false;
    FieldByName('сname_disc').Visible := false;
  end;

  with adoSelDocFiles do
    begin
    Close;
    CommandText := 'select * from SelDocumentsFiles('+IntToStr(obj.ID)+')';
    Open;
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
    tbMagazine.enabled := false;

  end
  else
  begin
    TabSheet3.enabled := true;
    TabSheet4.enabled := true;
    TabSheet5.enabled := true;
    TabSheet6.enabled := true;
    TabSheet7.enabled := true;
    tbMagazine.enabled := true;
  end;
end;

procedure TfmStudent.dtpEndCloseUp(Sender: TObject);
begin
  inherited;
  dtpStart.MaxDate := dtpEnd.date - 1;
  dmDocs.adodsDocs.Active := false;
  dmDocs.adodsDocStud.Active := false;
  dmDocs.adodsDocStud.CommandText :=
    ('select * from MagazineDocs where ((DateCreate>''' +
    DateTimeToStr(dtpStart.date) + '''and DateCreate <''' +
    DateTimeToStr(dtpEnd.date) + ''')or DateCreate IS NULL)' +
    ' and Ik_studGrup=' + obj.StudGrupKey.ToString() +'order by DatePod');
  dmDocs.adodsDocs.Active := true;
end;

procedure TfmStudent.dtpStartCloseUp(Sender: TObject);
begin
  inherited;
  dtpEnd.MinDate := dtpStart.date + 1;
  dmDocs.adodsDocStud.Active := false;
  dmDocs.adodsDocStud.CommandText :=
    ('select * from MagazineDocs where ((DateCreate>''' +
    DateTimeToStr(dtpStart.date) + '''and DateCreate <''' +
    DateTimeToStr(dtpEnd.date) + ''')or DateCreate IS NULL)' +
    ' and Ik_studGrup=' + obj.StudGrupKey.ToString() +'order by DatePod');
  dmDocs.adodsDocStud.Active := true;
end;


procedure TfmStudent.rgSexClick(Sender: TObject);begin
  inherited;
  eFamChange(Sender);
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

procedure TfmStudent.tbGotClick(Sender: TObject);
var
  i,k: Integer;
begin
  // for i:=0 to dbgehMagazineDocs.SelCount-1 do begin;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
  // end;

  inherited;
  with dbgehMagazineDocsStud.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
//      while not EOF do
//      begin
//        if (dbgehMagazineDocsStud.SelectedRows.CurrentRowSelected = true) then
//        begin
      For k := 0 to dbgehMagazineDocsStud.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocsStud.Datasource.Dataset.Bookmark:= dbgehMagazineDocsStud.SelectedRows.Items[k];
          if (uDMDocuments.dmDocs.adodsDocStud.FieldByName('DateReady')
            .Value = null) and
            (uDMDocuments.dmDocs.adodsDocStud.FieldByName('DateCreate').Value <>
            null) then
          begin
            dbgehMagazineDocsStud.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocStud.DataSet.FieldValues['DateReady']
              := date();
            dbgehMagazineDocsStud.DataSource.DataSet.Post;
          end;
        end;
//        Next;
//      end;
      DocumentChanged;
    finally
      EnableControls;
    end;
  end;

end;

procedure TfmStudent.tbPrintClick(Sender: TObject);
const
  n = 100;
var
  dsDoc: TADODataSet;
  idDest: Integer;
  j: Integer;

  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  i,k, ind: Integer;
  mass_doc: array [1 .. n] of Integer;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
  inherited;
  sp_doc := TADOStoredProc.Create(nil);
  sp_pers := TADOStoredProc.Create(nil);
  dsDoc := TADODataSet.Create(nil);
  ListDist := TObjectList<TDest>.Create;
  i := 0;
  ind := -1;
  // pt := dbgehMagazineDocsStud.ScreenToClient(Mouse.CursorPos);
  try
    // // if self.dbgehMagazineDocsStud.MouseCoord(pt.X, pt.Y).X <> -1 then
    // // begin
    with dbgehMagazineDocsStud.DataSource.DataSet do
    begin
//      First;
      // DisableControls;
//      while not EOF do
//      begin
//        if (dbgehMagazineDocsStud.SelectedRows.CurrentRowSelected = true) then
      For k := 0 to dbgehMagazineDocsStud.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocsStud.Datasource.Dataset.Bookmark:= dbgehMagazineDocsStud.SelectedRows.Items[k];
          if uDMDocuments.dmDocs.adodsDocStud.FieldByName('DateCreate')
            .AsString.Length <> 0 then
          begin
            i := i + 1;
            ListDist := TDocController.Instance.AddListDest(ListDist,
              uDMDocuments.dmDocs.adodsDocStud.FieldByName('ik_destination')
              .AsInteger, dmDocs.adodsDocStud.FieldByName('Ik_Document')
              .AsInteger);

          end;
       // Next;
      end;
    end;

    // TUspevGroupController.Instance.BuildTemplate(ListDoc, i);
    TDocController.Instance.PrintAllDoc(ListDist);

  finally
    dsDoc.Free;
    sp_doc.Free;
    sp_pers.Free;
  end;
end;

procedure TfmStudent.tbUtvClick(Sender: TObject);
var
  i,k, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
begin
  inherited;
  with dbgehMagazineDocsStud.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
//      while not EOF do
//      begin
//        if (dbgehMagazineDocsStud.SelectedRows.CurrentRowSelected = true) then
//        begin
      For k := 0 to dbgehMagazineDocsStud.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocsStud.Datasource.Dataset.Bookmark:= dbgehMagazineDocsStud.SelectedRows.Items[k];
          if (uDMDocuments.dmDocs.adodsDocStud.FieldByName('NumberDoc')
            .AsString = '') then
          begin
            dm.DBConnect.BeginTrans;
            sp_num := TADODataSet.Create(nil);
            // надо сделать проверку на уникальность
            try
              dbgehMagazineDocsStud.DataSource.DataSet.Edit;
              uDMDocuments.dmDocs.dsDocStud.DataSet.FieldValues['DateCreate']
                := date();
              dbgehMagazineDocsStud.DataSource.DataSet.Post;
              DecodeDate(Now, AYear, AMonth, ADay);

              if date() > StrToDateTime('01.09.' + AYear.ToString()) then
                datebegin := '01.09.' + AYear.ToString()
              else
                datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1)
                  .ToString();
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(date()) + '''' +
                ',' + '''' + uDMDocuments.dmDocs.adodsDocStud.FieldByName
                ('Ik_Document').AsString + ''',''' +
                uDMDocuments.dmDocs.adodsDocStud.FieldByName('Ik_destination')
                .AsString + ''')';
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(date()) + ''')';
              sp_num.Connection := dm.DBConnect;
              sp_num.Open;
              sp_num.First;
              LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
              dm.DBConnect.CommitTrans;
            except
              dm.DBConnect.RollbackTrans;
              sp_num.Free;
            end;
            dbgehMagazineDocsStud.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocStud.DataSet.FieldValues['NumberDoc']
              := LastNum;
            dbgehMagazineDocsStud.DataSource.DataSet.Post;
          end;
        end;

//        Next;
//      end;
      DocumentChanged;
    finally
      EnableControls;
     sp_num.Free;
    end;
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

procedure TfmStudent.actAddDocumentExecute(Sender: TObject);
begin
  frmAddDocument := TfrmAddDocument.Create(self);
  with frmAddDocument do
  begin
    isAbit := (self.Name = 'fmAbitCard');
    nCode := obj.ID;
    ShowModal;
    Free;
  end;
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

procedure TfmStudent.actDelDocumentExecute(Sender: TObject);
var doc: TDocRecord;
begin
  doc := TDocRecord.Create(dbgeDocuments.DataSource.DataSet.FieldByName('ik_doc').Value, True);
  DocRecordList.Add(doc);
  dbgeDocuments.DataSource.DataSet.Delete;
  modified := true;
  //TPersonController.Instance.DeleteDocument();
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
function GetMonthR(month: Integer): string;
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
  i, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  k: Integer;
  editF: TfrmReviewDoc;
  dsDoc: TADODataSet;
begin

  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  try

    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;
    // находим номер будущей справки

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      datebegin := '01.09.' + AYear.ToString()
    else
      datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + datebegin + '''' +
      ',' + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      sp_depInd.FieldByName('Dep_Index').AsString + ''',2)';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;

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
    // editF.eNum.Text := LastNum.ToString();
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
        tempDS.FieldByName('DatePod').Value := date;
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
//      Report := TUspevGroupController.Instance.BuildSpravka2014(obj.StudGrupKey,
//        1, LastNum);
//      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
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

//var // E: Variant;
//  // str,dir_inst,copystr1,copystr2,dop:string;
//  // posit:integer;
//  // FindRange: Variant;
//  // tempStoredProc: TADOStoredProc;
//  tempDS: TADODataSet;
//  Report: TReportBase;
//  i, LastNum: Integer;
//  datebegin: string;
//  AYear, AMonth, ADay: word;
//  sp_num: TADODataSet;
//  sp_depInd: TADODataSet;
//  k: Integer;
//  editF: TfrmReviewDoc;
//  dsDoc: TADODataSet;
begin

//  dsDoc := TADODataSet.Create(nil);
//  sp_num := TADODataSet.Create(nil);
//  sp_depInd := TADODataSet.Create(nil);
//  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
//  try
//    // находим номер будущей справки
//
//    DecodeDate(Now, AYear, AMonth, ADay);
//    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
//      datebegin := '01.09.' + AYear.ToString()
//    else
//      datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
//
//    sp_depInd.CommandText := 'select * from DepIndDoc(' +
//      obj.StudGrupKey.ToString() + ')';
//    sp_depInd.Connection := dm.DBConnect;
//    sp_depInd.Open;
//    sp_depInd.First;
//
//    sp_num.CommandText := 'select * from MaxNumDocument(''' + datebegin + '''' +
//      ',' + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
//      sp_depInd.FieldByName('Dep_Index').AsString + ''',1 )';
//    sp_num.Connection := dm.DBConnect;
//    sp_num.Open;
//    sp_num.First;
//    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
//    // берем индекс подразделения
//
//    editF := TfrmReviewDoc.Create(Self);
//    editF.dtUtv.Format := '';
//    editF.dtUtv.date := date;
//    editF.dtGot.Format := #32;
//    // ищем информацию о студенте
//    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
//      obj.StudGrupKey.ToString();
//    dsDoc.Connection := dm.DBConnect;
//    dsDoc.Open;
//    dsDoc.First;
//    editF.eDest.Text := 'По месту требования';
//    // editF.eNum.Text := LastNum.ToString();
//    editF.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
//    editF.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
//      dsDoc.FieldByName('Cname_grup').AsString + ')';
//    editF.ShowModal;
//
//    if (editF.ModalResult = mrOk) or (editF.ModalResult = mrYes) then
//    begin
//      dm.DBConnect.BeginTrans;
//      try // добавляем справку
//        tempDS.CommandText := 'Select * from Document';
//        tempDS.Open;
//        tempDS.Insert;
//        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
//        tempDS.FieldByName('Ik_Transfer').Value := 1;
//        tempDS.FieldByName('Ik_destination').Value := 1;
//        tempDS.FieldByName('NumberDoc').Value := LastNum;
//        tempDS.FieldByName('DatePod').Value := date;
//        tempDS.FieldByName('DateCreate').Value := date;
//        tempDS.FieldByName('Num_podrazd').Value :=
//          sp_depInd.FieldByName('Dep_Index').AsString;
//        tempDS.Post;
//        tempDS.UpdateBatch();
//        dm.DBConnect.CommitTrans;
//      except
//        dm.DBConnect.RollbackTrans;
//      end;
//    end;
//    if (editF.ModalResult = mrYes) then // печатаем
//    begin
//      Report := TUspevGroupController.Instance.BuildSpravka2014(obj.StudGrupKey,
//        0, LastNum);
//      TWaitingController.GetInstance.Process(Report);
//    end;
//    uDMDocuments.dmDocs.adodsDocStud.Close;
//    uDMDocuments.dmDocs.adodsDocStud.Open;
//  finally
//    tempDS.Free;
//    sp_num.Free;
//    sp_depInd.Free;
//    dsDoc.Free;
//    Report.Free;

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

procedure TfmStudent.actUpdateDocumentExecute(Sender: TObject);
var tempFilList: TList<TMemoryStream>;
    i, j: integer;
    iDoc: TMemoryStream;
    inEditList: boolean;
begin

  frmAddDocument := TfrmAddDocument.Create(self);
  with frmAddDocument do
  begin
    isAbit := (self.Name = 'fmAbitCard');
    isEdit := true;
    tempFilList :=  TList<TMemoryStream>.Create;

    inEditList := false;
    with dbgeDocuments.DataSource.DataSet do    //ищем его в списке документов
    for i := 0 to FDocRecordList.Count - 1  do
      if (FieldByName('ik_vid_doc').Value = FDocRecordList[i].ikDocVid) and
          (FieldByName('Np_number').Value = FDocRecordList[i].number) then
          begin
            DocID := 0;
            inEditList := true;
            if FDocRecordList[i].docs.Count > 0 then
            begin
              for j := 0 to FDocRecordList[i].docs.Count - 1 do
                tempFilList.Add(FDocRecordList[i].docs[j]);
              ImageFiles := tempFilList;
            end;
            break;
          end;
    if not inEditList then
    begin
      DocID := dbgeDocuments.DataSource.DataSet.FieldByName('ik_doc').Value;

      adoSelDocFiles.Filtered := false;
      adoSelDocFiles.Filter := 'ik_doc = ' + IntToStr(DocID);
      adoSelDocFiles.Filtered := true;

      if adoSelDocFiles.RecordCount > 0 then
      begin
        adoSelDocFiles.First;
        for i := 0 to adoSelDocFiles.RecordCount - 1 do
        begin
          iDoc:=TMemoryStream.Create;
          (adoSelDocFiles.FieldbyName('doc_file')as TBlobField).SaveToStream(iDoc);
          iDoc.Seek(0, soFromBeginning);
          tempFilList.Add(iDoc);
          adoSelDocFiles.Next;
        end;
        ImageFiles := tempFilList;
      end;
    end;

    ShowModal;
    Free;
    if Assigned(tempFilList) then tempFilList.Free;
  end;
end;

procedure TfmStudent.bbResetClick(Sender: TObject);
begin
  inherited;
  Self.dbgehMagazineDocsStud.ClearFilter;
  Self.dbgehMagazineDocsStud.DefaultApplyFilter;
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

procedure TfmStudent.eEmailExit(Sender: TObject);
begin
  inherited;
  if eEmail.Text = '' then
    exit;
  if (Ansipos('@', eEmail.Text) = 0)
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

procedure TfmStudent.dbcbeCitizenshipChange(Sender: TObject);
begin
  inherited;
  FTypeGrazd := dbcbeCitizenship.ListSource.DataSet.FieldByName('ik_type_grazd').AsInteger;
  eFamChange(Sender);
end;

procedure TfmStudent.dbgeBallsTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adsSelAllBRSBallsForStudent.Sort :=
    '[' + Column.Field.FullName + ']';
end;

procedure TfmStudent.dbgeDocumentsCellClick(Column: TColumnEh);
begin
  actUpdateDocument.Enabled := (dbgeDocuments.DataSource.DataSet.RecordCount > 0) ;
  actDelDocument.Enabled := (dbgeDocuments.DataSource.DataSet.RecordCount > 0);
end;

procedure TfmStudent.dbgeDocumentsDblClick(Sender: TObject);
begin
  actUpdateDocumentExecute(Sender);
end;

procedure TfmStudent.dbgeFamExit(Sender: TObject);
begin
  if modified then
  begin
    bbSave.enabled := true;
    bbUndo.enabled := true;
  end;

end;

procedure TfmStudent.dbgehMagazineDocsStudDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (dbgehMagazineDocsStud.DataSource.DataSet.FieldByName('DateCreate')
    .AsString = '') then
    Self.dbgehMagazineDocsStud.Canvas.Font.Style := [fsBold];
  dbgehMagazineDocsStud.DefaultDrawColumnCell(Rect, DataCol, Column, State);

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

procedure TfmStudent.cbJobClick(Sender: TObject);
begin
  inherited;
  pnlWork.Visible := cbJob.Checked;
  eFamChange(Sender);
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

    Clear;
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

    Clear;
    AddParameter;
    Items[0].Value := cmbxSemNapr.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject
      (frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospGetAllNaprStud.ExecProc;
  dmUspevaemost.adospGetAllNaprStud.Active := true;
end;


procedure TfmStudent.GetUspevStat(ik_zach: Integer);
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

procedure TfmStudent.gridColumnSelectMenuPopup(Sender: TObject);
var
  mi: TMenuItem;
  pm: TPopupMenu;
  col: TColumnEh;
  i: Integer;
begin
  inherited; // надо сделать освобождение памяти
  // if pm<>nil then
  // pm.CloseMenu;
  pm := Sender as TPopupMenu;
  pm.Items.Clear;
  for i := 0 to Self.dbgehMagazineDocsStud.Columns.Count - 3 do
  begin
    mi := TMenuItem.Create(pm);
    col := dbgehMagazineDocsStud.Columns.Items[i];
    mi.Caption := col.Title.Caption;
    mi.Tag := i;
    mi.OnClick := OnMyMenuItemClick;
    mi.Checked := col.Visible;
    pm.Items.Add(mi);
  end;

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

  if PageControl1.ActivePageIndex = 5 then
  begin
    dbgehMagazineDocsStud.SelectedRows.CurrentRowSelected := true;

    // dtpStart.Date := StrToDate('10.03.2015');
    dtpStart.date := date - 31; // "конкретная дата"
    dtpEnd.date := date; // текущая дата
          dtpEnd.Time:=StrToTime('23:59:59');
  dtpStart.Time:=StrToTime('00:00:00');
    dtpStart.MaxDate := dtpEnd.date - 1;
    dtpEnd.MinDate := dtpStart.date + 1;

    uDMDocuments.dmDocs.adodsDocStud.Active := false;
    dmDocs.adodsDocStud.CommandText :=
      ('select * from MagazineDocs where ((DateCreate>''' +
      DateTimeToStr(dtpStart.date) + '''and DateCreate <''' +
      DateTimeToStr(dtpEnd.date) + ''')or DateCreate IS NULL)' +
      ' and Ik_studGrup=' + obj.StudGrupKey.ToString());

    // фильтрация
    uDMDocuments.dmDocs.adodsDocStud.Active := true;
    // подключам базу
  //  uDMDocuments.dmDocs.adodsDestination.Active := true;
    uDMDocuments.dmDocs.adodsDocStud.Filtered := true; // фильтр
    DBGridEhCenter.FilterEditCloseUpApplyFilter := true;
    // сотрировка
    Self.dbgehMagazineDocsStud.OptionsEh := dbgehMagazineDocsStud.OptionsEh +
      [dghAutoSortMarking];
    dbgehMagazineDocsStud.SortLocal := true;
  end;
  dmDocs.spDest.Active := false;
  dmDocs.spDest.Parameters.Refresh;
  dmDocs.spDest.Parameters.ParamByName('@ik_stud').Value := obj.StudGrupKey;
  dmDocs.spDest.Active := true;
  cbeDest.ListField := 'cShortNameDestination';
  cbeDest.KeyField := 'ik_destination';

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

// function TfmStudent.CalculationBeginYearLern: string;
// var
// datebegin: string;
// AYear, AMonth, ADay: word;
// begin
// DecodeDate(Now, AYear, AMonth, ADay);
// if date() > StrToDateTime('01.09.' + AYear.ToString()) then
// datebegin := '01.09.' + AYear.ToString()
// else
// datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
// result := datebegin;
// end;
//
// function TfmStudent.CalculationDepIndex(ik_studGrup: Integer): string;
// var
// sp_depInd: TADODataSet;
//
// begin
// inherited;
// sp_depInd := TADODataSet.Create(nil);
//
// try
// // берем индекс подразделения
// sp_depInd.CommandText := 'select * from DepIndDoc(' +
// ik_studGrup.ToString() + ')';
// sp_depInd.Connection := dm.DBConnect;
// sp_depInd.Open;
// result := sp_depInd.FieldByName('Dep_Index').AsString;
// finally
// sp_depInd.Free;
// end;
//
// end;
//
// function TfmStudent.CalculationLastNum(ik_studGrup: Integer;
// ik_dest: Integer): Integer;
// var
// AYear, AMonth, ADay: word;
// dateb: string;
// sp_info: TADOStoredProc;
// sp_num: TADODataSet;
// // sp_depInd: TADODataSet;
//
// begin
// inherited;
// sp_num := TADODataSet.Create(nil);
// // sp_depInd := TADODataSet.Create(nil);
// try
// // берем индекс подразделения
//
// // sp_depInd.CommandText := 'select * from DepIndDoc(' +
// // obj.StudGrupKey.ToString() + ')';
// // sp_depInd.Connection := dm.DBConnect;
// // sp_depInd.Open;
// // находим номер
// DecodeDate(Now, AYear, AMonth, ADay);
// if date() > StrToDateTime('01.09.' + AYear.ToString()) then
// dateb := '01.09.' + AYear.ToString()
// else
// dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
// sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
// + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
// CalculationDepIndex(ik_studGrup) + ''',' + ik_dest.ToString() + ')';
// sp_num.Connection := dm.DBConnect;
// sp_num.Open;
// sp_num.First;
// result := sp_num.FieldByName('MaxNum').AsInteger + 1;
// finally
// // sp_depInd.Free;
// sp_num.Free;
// end;
// end;

procedure TfmStudent.eAddInfoEnter(Sender: TObject);
begin

  eAddInfo.BevelKind := bksoft;

end;

procedure TfmStudent.eAddInfoExit(Sender: TObject);
begin
  eAddInfo.BevelKind := bknone;
end;

procedure TfmStudent.tbCreateClick(Sender: TObject);
var
  ik_dest: Integer;
begin
  inherited;

  ik_dest := dmDocs.spDest.FieldByName('ik_destination').AsInteger;

  if ik_dest > 0 then
    case (ik_dest) of
      1:
        begin
          FormSpr(obj.StudGrupKey, ik_dest);
        end;
      2:
        begin
          FormSpr(obj.StudGrupKey, ik_dest);
        end;

      3:
        begin
          FormCallSpr(obj.StudGrupKey, ik_dest);
        end;

      4:
        begin
          FormApplicationSpr(obj.StudGrupKey, ik_dest);
        end;
      5:
        FormCallSpr(obj.StudGrupKey, ik_dest);

      6:
        begin
          FormNeuspSpr(obj.StudGrupKey, ik_dest);
        end;

     8:
        begin
          FormAcademSpr(obj.StudGrupKey, ik_dest);
        end;
      9:
        begin
          FormExtract(obj.StudGrupKey, ik_dest);
        end;

    end;
   DocumentChanged;
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
var
  datebegin, d1, z: TDateTime;
  fReview: TfmСhallengeSpr;
  AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, year, ik_doc: Integer;
  mask1, mask2, dateb, l: string;
  sp_vidz: TADODataSet;
  sp_info: TADOStoredProc;

  tempDS, tempDSchall, tempDSikdoc: TADODataSet;
  Report: TReportBase;
  LastNum: Integer;
  d3, d2: TDateTime;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
begin
  inherited;
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSchall := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  try
    // общая часть формы
    // -------------------------------------------

    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      dateb := '01.09.' + AYear.ToString()
    else
      dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
      + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      sp_depInd.FieldByName('Dep_Index').AsString + ''',3)';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;

    // --------------------------------------------------------------------------
    ik_stud := obj.StudGrupKey;
    DecodeDate(Now, AYear, AMonth, ADay);
    sp_info := TADOStoredProc.Create(nil);
    sp_info.ProcedureName := 'StudGetInfForSprav;1';
    sp_info.Connection := dm.DBConnect;
    sp_info.Parameters.CreateParameter('@Ik_studGrup', ftString, pdInput, 50,
      obj.StudGrupKey.ToString());
    sp_info.Open;
    sp_info.First;
    year := sp_info.FieldByName('nYear_post').AsInteger +
      sp_info.FieldByName('kurs').AsInteger;
    if year > AYear then
      sem := sp_info.FieldByName('kurs').AsInteger * 2 - 1
    else
      sem := sp_info.FieldByName('kurs').AsInteger * 2;
    fReview := TfmСhallengeSpr.Create(Self);
    // ---------------------
    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // fReview.dtpArrival.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    fReview.eDest.Text := 'Справка-вызов';
    // editF.eNum.Text := LastNum.ToString();
    fReview.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')' + ' ' + sem.ToString() +
      ' семестр';
    // ---------------------
    fReview.cbeSem.Clear;
    for i := 1 to sem do
      fReview.cbeSem.AddItem(i.ToString(), TObject(i));
    fReview.cbeSem.ItemIndex := sem - 1;
    fReview.ShowModal;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
        tempDS.FieldByName('Ik_Transfer').Value := 2;
        tempDS.FieldByName('Ik_destination').Value := 3;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value :=
          sp_depInd.FieldByName('Dep_Index').AsString;
        tempDS.Post;
        tempDS.UpdateBatch();

        // dm.DBConnect.CommitTrans;
        // except
        // dm.DBConnect.RollbackTrans;
        // end;
        // ik_doc:= 'SELECT LAST_INSERT_ID() FROM Document' ;

        k := 0;
        if (fReview.cbeReason.Text = 'Промежуточная аттестация') then
          k := 55;
        if (fReview.cbeReason.Text = 'Государственный экзамен') then
          k := 56;
        if (fReview.cbeReason.Text = 'Выпускная работа') then
          k := 31;

        sp_vidz := TADODataSet.Create(nil);
        sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_Grup='
          + uStudent.ik_stud.ToString() + 'and n_sem=' + sem.ToString() +
          ' and iK_vid_zanyat=' + k.ToString();
        // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
        sp_vidz.Connection := dm.DBConnect;
        sp_vidz.Open;
        sp_vidz.First;

        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          obj.StudGrupKey.ToString() + 'and Ik_destination= 3 and NumberDoc =' +
          LastNum.ToString() + 'and Num_podrazd=''' + sp_depInd.FieldByName
          ('Dep_Index').AsString + '''';
        tempDSikdoc.Connection := dm.DBConnect;
        tempDSikdoc.Open;
        tempDSikdoc.First;

        // добавляем сущность справка-вызов
        // dm.DBConnect.BeginTrans;
        // try
        tempDSchall.CommandText := 'Select * from CallSpr';
        tempDSchall.Open;
        tempDSchall.Insert;
        tempDSchall.FieldByName('Ik_Document').Value :=
          tempDSikdoc.FieldByName('maxid').AsInteger;
        tempDSchall.FieldByName('DateStartPeriod').Value :=
          FormatDateTime('dd.mm.yyyy', fReview.dtpBegin.date);
        tempDSchall.FieldByName('DateEndPeriod').Value :=
          FormatDateTime('dd.mm.yyyy', fReview.dtpEnd.date);;
        tempDSchall.FieldByName('ik_upContent').Value :=
          sp_vidz.FieldByName('ik_upContent').AsInteger;
        tempDSchall.Post;
        tempDSchall.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;

    if (fReview.ModalResult = mrYes) then
    begin
//      Report := TUspevGroupController.Instance.BuildCallSpr(obj.StudGrupKey,
//        sem, LastNum, tempDSikdoc.FieldByName('maxid').AsInteger,
//        fReview.dtpBegin.date, fReview.dtpEnd.date);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    sp_info.Free;
    sp_vidz.Free;
    tempDS.Free;
    tempDSchall.Free;
    tempDSikdoc.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;

end;

procedure TfmStudent.N3Click(Sender: TObject);
var
  // fReview: TfrmReviewNeusp;
  AYear, AMonth, ADay: word;
  dateb, l: string;
  tempDS, tempDSikdoc, dsAppli, tempDSsm, tempDStransf: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc: Integer;
  // d3, d2: TDateTime;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
  tempDStransf := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  dsAppli := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;
    // общая часть формы
    // -------------------------------------------

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      dateb := '01.09.' + AYear.ToString()
    else
      dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
      + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      sp_depInd.FieldByName('Dep_Index').AsString + ''',6)';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    // fReview := TfrmReviewNeusp.Create(Self);
    // ---------------------

    // fReview.dtUtv.Format := '';
    // fReview.dtUtv.date := date;
    // fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    // fReview.eDest.Text := 'Письмо об академической неуспеваемости';
    // fReview.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    // fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
    // dsDoc.FieldByName('Cname_grup').AsString + ')';
    // fReview.ShowModal;
  finally
    tempDStransf.Free;
    dsAppli.Free;
    tempDS.Free;
    tempDSikdoc.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
end;

procedure TfmStudent.N5Click(Sender: TObject);
var
  fReview: TfrmReviewAkadem;
  AYear, AMonth, ADay: word;
  dateb, l: string;
  tempDS, tempDSikdoc, dsAppli, tempDSsm, tempDStransf: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc: Integer;
  // d3, d2: TDateTime;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
  tempDStransf := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  dsAppli := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;
    // общая часть формы
    // -------------------------------------------

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      dateb := '01.09.' + AYear.ToString()
    else
      dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
      + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      sp_depInd.FieldByName('Dep_Index').AsString + ''',4)';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    fReview := TfrmReviewAkadem.Create(Self);
    // ---------------------

    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    fReview.eDest.Text := 'Академическая справка';
    fReview.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    // dmDocs.dsOsn..ListSource:=''
    dmDocs.spOsn.Active := false;
    dmDocs.spOsn.Parameters.Refresh;
    dmDocs.spOsn.Parameters.ParamByName('@Ik_destination').Value := 7;
    dmDocs.spOsn.Parameters.ParamByName('@Ik_StudGrup').Value :=
      obj.StudGrupKey;
    dmDocs.spOsn.Active := true;
    // dmDocs.spOsn.ExecProc;
    fReview.cbexOsnov.ListField := 'cNameOsn';
    fReview.cbexOsnov.KeyField := 'Ik_Document';
    fReview.ShowModal;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
        tempDS.FieldByName('Ik_destination').Value := 7;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value :=
          sp_depInd.FieldByName('Dep_Index').AsString;

        dsAppli.CommandText := 'select * from Document where ik_Document=' +
          inttostr(fReview.cbexOsnov.KeyValue);
        dsAppli.Connection := dm.DBConnect;
        dsAppli.Open;
        dsAppli.First;
        tempDS.FieldByName('Ik_Transfer').Value :=
          dsAppli.FieldByName('Ik_Transfer').Value;
        // спросить: надо ли дублировать для академ спр адреса передачи????
        tempDS.Post;
        tempDS.UpdateBatch();

        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          obj.StudGrupKey.ToString() + 'and Ik_destination= 7 and NumberDoc =' +
          LastNum.ToString() + 'and Num_podrazd=''' + sp_depInd.FieldByName
          ('Dep_Index').AsString + '''';
        tempDSikdoc.Connection := dm.DBConnect;
        tempDSikdoc.Open;
        tempDSikdoc.First;

        // добавляем основание
        tempDSsm.CommandText := 'Select * from DocumentBase';
        tempDSsm.Open;
        tempDSsm.Insert;
        tempDSsm.FieldByName('Ik_Document_base').Value :=
          tempDSikdoc.FieldByName('maxid').AsString;
        tempDSsm.FieldByName('Ik_Document_reference').Value :=
          dsAppli.FieldByName('Ik_Document').AsString;
        tempDSsm.Post;
        tempDSsm.UpdateBatch();

        // добавляем место назначения отправки
        tempDStransf.CommandText := 'Select * from Addressee_Doc';
        tempDStransf.Open;
        tempDStransf.Insert;
        tempDStransf.FieldByName('Ik_Document').Value :=
          tempDSikdoc.FieldByName('maxid').AsString;
        tempDStransf.FieldByName('ik_personAddress').Value :=
          dmDocs.spOsn.FieldByName('ik_personAddress').AsString;
        tempDStransf.Post;
        tempDStransf.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (fReview.ModalResult = mrYes) then
    begin
      ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
      // Report := TUspevGroupController.Instance.BuildSpr(ik_doc, 7, 1);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDStransf.Free;
    dsAppli.Free;
    tempDS.Free;
    tempDSikdoc.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
end;

procedure TfmStudent.N6Click(Sender: TObject);
var
  // datebegin, d1, z: TDateTime;
  fReview: TfrmReviewApplication;
  AYear, AMonth, ADay: word;
  dateb, l: string;
  // sp_vidz: TADODataSet;
  // sp_info: TADOStoredProc;

  tempDS, tempDSikdoc, tempDSsm: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc: Integer;
  // d3, d2: TDateTime;
  sp_num: TADODataSet;
  sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  sp_num := TADODataSet.Create(nil);
  sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    sp_depInd.CommandText := 'select * from DepIndDoc(' +
      obj.StudGrupKey.ToString() + ')';
    sp_depInd.Connection := dm.DBConnect;
    sp_depInd.Open;
    sp_depInd.First;
    // общая часть формы
    // -------------------------------------------

    DecodeDate(Now, AYear, AMonth, ADay);
    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      dateb := '01.09.' + AYear.ToString()
    else
      dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
      + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
      sp_depInd.FieldByName('Dep_Index').AsString + ''',4)';
    sp_num.Connection := dm.DBConnect;
    sp_num.Open;
    sp_num.First;
    LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    fReview := TfrmReviewApplication.Create(Self);
    // ---------------------

    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      obj.StudGrupKey.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    fReview.eDest.Text := 'Заявление на академическую справку';
    fReview.eInd.Text := sp_depInd.FieldByName('Dep_Index').AsString;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    fReview.ShowModal;

    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := obj.StudGrupKey;
        if fReview.rbP.Checked then
          tempDS.FieldByName('Ik_Transfer').Value := 2
        else
          tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := 4;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value :=
          sp_depInd.FieldByName('Dep_Index').AsString;

        dmDocs.adodsPricina.Open;
        dmDocs.adodsPricina.First;
        while not dmDocs.adodsPricina.EOF do
        begin
          with dmDocs.adodsPricina do
          begin
            if (FieldByName('ik_pric').Value = fReview.cbexReason.KeyValue) and
              (FieldByName('ik_destination').Value = 4) then
              tempDS.FieldByName('Ik_reason_issuing').Value :=
                FieldByName('Ik_reason_issuing').Value

          end;
          dmDocs.adodsPricina.Next;
        end;
        tempDS.Post;
        tempDS.UpdateBatch();
        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          obj.StudGrupKey.ToString() + 'and Ik_destination= 4 and NumberDoc =' +
          LastNum.ToString() + 'and Num_podrazd=''' + sp_depInd.FieldByName
          ('Dep_Index').AsString + '''';

        if fReview.rbP.Checked then // если пересылка почтой
        begin
          tempDSikdoc.Connection := dm.DBConnect;
          tempDSikdoc.Open;
          tempDSikdoc.First;

          // добавляем место назначения отправки
          tempDSsm.CommandText := 'Select * from Addressee_Doc';
          tempDSsm.Open;
          tempDSsm.Insert;
          tempDSsm.FieldByName('Ik_Document').Value :=
            tempDSikdoc.FieldByName('maxid').AsInteger;
          ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
          dmDocs.adodsStudAddres.Open;
          dmDocs.adodsStudAddres.First;
          while not dmDocs.adodsStudAddres.EOF do
          begin
            with dmDocs.adodsStudAddres do
            begin
              if (FieldByName('ik_AddressType')
                .Value = fReview.cbexTransp.KeyValue) then
                tempDSsm.FieldByName('ik_personAddress').Value :=
                  FieldByName('ik_personAddress').Value

            end;
            dmDocs.adodsStudAddres.Next;
          end;
          tempDSsm.Post;
          tempDSsm.UpdateBatch();
        end;
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (fReview.ModalResult = mrYes) then
    begin
      // Report := TUspevGroupController.Instance.BuildSpr(ik_doc, 4, 1);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDS.Free;
    tempDSikdoc.Free;
    sp_num.Free;
    sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
end;

procedure TfmStudent.OnMyMenuItemClick(Sender: TObject);
begin
  if Sender is TMenuItem Then
    with Sender as TMenuItem do
    // здесь Sender - пункт меню на который кликнули
    begin
      if Checked then
        Self.dbgehMagazineDocsStud.Columns.Items[Tag].Visible := false
      else
      begin
        Self.dbgehMagazineDocsStud.Columns.Items[Tag].Visible := true;
        Self.dbgehMagazineDocsStud.Columns.Items[Tag].Width := 130;
      end;
    end;
end;

// справка вызов
procedure TfmStudent.ExecuteError(Sender: TObject; E: Exception);
begin
  showmessage('Произошла ошибка при экспорте успеваемости cтудента: ' +
    E.Message);
  (Sender as TReportBase).Quit;
end;


procedure TfmStudent.FormAcademSpr(ik_studGrup, ik_destination: Integer);
var
  fReview: TfrmReviewAkadem;
  AYear, AMonth, ADay: word;
  dateb, l, depInd: string;
  tempDS, tempDSikdoc, dsAppli, tempDSsm, tempDStransf: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc: Integer;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
  // d3, d2: TDateTime;
  // sp_num: TADODataSet;
  // sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  // sp_num := TADODataSet.Create(nil);
  // sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
  tempDStransf := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  dsAppli := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    // sp_depInd.CommandText := 'select * from DepIndDoc(' +
    // ik_studGrup.ToString() + ')';
    // sp_depInd.Connection := dm.DBConnect;
    // sp_depInd.Open;
    // sp_depInd.First;
    // // общая часть формы
    // // -------------------------------------------
    //
    // DecodeDate(Now, AYear, AMonth, ADay);
    // if date() > StrToDateTime('01.09.' + AYear.ToString()) then
    // dateb := '01.09.' + AYear.ToString()
    // else
    // dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    // sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
    // + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
    // sp_depInd.FieldByName('Dep_Index').AsString + ''',4)';
    // sp_num.Connection := dm.DBConnect;
    // sp_num.Open;
    // sp_num.First;
    // LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    //
    // ---------------------

    fReview := TfrmReviewAkadem.Create(Self);
    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    dateb := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (dsDoc.FieldByName('Ik_grup').AsInteger);
    LastNum := TDocController.Instance.CalculationLastNum
      (dsDoc.FieldByName('Ik_grup').AsInteger, ik_destination);
    fReview.eDest.Text := 'Академическая справка';
    fReview.eInd.Text := depInd;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    // dmDocs.dsOsn..ListSource:=''
    dmDocs.spOsn.Active := false;
    dmDocs.spOsn.Parameters.Refresh;
    dmDocs.spOsn.Parameters.ParamByName('@Ik_destination').Value := ik_destination;
    dmDocs.spOsn.Parameters.ParamByName('@Ik_StudGrup').Value := ik_studGrup;
    dmDocs.spOsn.Active := true;
    // dmDocs.spOsn.ExecProc;
    fReview.cbexOsnov.ListField := 'cNameOsn';
    fReview.cbexOsnov.KeyField := 'Ik_Document';
    fReview.ShowModal;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
        tempDS.FieldByName('Ik_destination').Value := ik_destination;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value := depInd;

        dsAppli.CommandText := 'select * from Document where ik_Document=' +
          inttostr(fReview.cbexOsnov.KeyValue);
        dsAppli.Connection := dm.DBConnect;
        dsAppli.Open;
        dsAppli.First;
        tempDS.FieldByName('Ik_Transfer').Value :=
          dsAppli.FieldByName('Ik_Transfer').Value;
        // спросить: надо ли дублировать для академ спр адреса передачи????
        tempDS.Post;
        tempDS.UpdateBatch();

        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          ik_studGrup.ToString() + 'and Ik_destination='+ik_destination.ToString()+' and NumberDoc =' +
          LastNum.ToString() + 'and Num_podrazd=''' + depInd + '''';
        tempDSikdoc.Connection := dm.DBConnect;
        tempDSikdoc.Open;
        tempDSikdoc.First;

        // добавляем основание
        tempDSsm.CommandText := 'Select * from DocumentBase';
        tempDSsm.Open;
        tempDSsm.Insert;
        tempDSsm.FieldByName('Ik_Document_base').Value :=
          tempDSikdoc.FieldByName('maxid').AsString;
        tempDSsm.FieldByName('Ik_Document_reference').Value :=
          dsAppli.FieldByName('Ik_Document').AsString;
        tempDSsm.Post;
        tempDSsm.UpdateBatch();

        // добавляем место назначения отправки
        tempDStransf.CommandText := 'Select * from Addressee_Doc';
        tempDStransf.Open;
        tempDStransf.Insert;
        tempDStransf.FieldByName('Ik_Document').Value :=
          tempDSikdoc.FieldByName('maxid').AsString;
        tempDStransf.FieldByName('ik_personAddress').Value :=
          dmDocs.spOsn.FieldByName('ik_personAddress').AsString;
        tempDStransf.Post;
        tempDStransf.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (fReview.ModalResult = mrYes) then
    begin
      ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
      ListDist := TObjectList<TDest>.Create;
      ListDist := TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDStransf.Free;
    dsAppli.Free;
    tempDS.Free;
    tempDSikdoc.Free;
    // sp_num.Free;
    // sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;
  end;
procedure TfmStudent.FrameExit(Sender: TObject);
begin
  inherited;
 // FDocRecordList.Free;
end;



procedure TfmStudent.FormApplicationSpr(ik_studGrup, ik_destination: Integer);
var
  fReview: TfrmReviewApplication;
  AYear, AMonth, ADay: word;
  dateb, l, depInd: string;
  // sp_vidz: TADODataSet;
  // sp_info: TADOStoredProc;

  tempDS, tempDSikdoc, tempDSsm: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc: Integer;
  // d3, d2: TDateTime;
  // sp_num: TADODataSet;
  // sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  // sp_num := TADODataSet.Create(nil);
  // sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    // sp_depInd.CommandText := 'select * from DepIndDoc(' +
    // ik_studGrup.ToString() + ')';
    // sp_depInd.Connection := dm.DBConnect;
    // sp_depInd.Open;
    // sp_depInd.First;
    // // общая часть формы
    // // -------------------------------------------
    //
    // DecodeDate(Now, AYear, AMonth, ADay);
    // if date() > StrToDateTime('01.09.' + AYear.ToString()) then
    // dateb := '01.09.' + AYear.ToString()
    // else
    // dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    // sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
    // + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
    // sp_depInd.FieldByName('Dep_Index').AsString + ''',4)';
    // sp_num.Connection := dm.DBConnect;
    // sp_num.Open;
    // sp_num.First;
    // LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    DecodeDate(Now, AYear, AMonth, ADay);

    fReview := TfrmReviewApplication.Create(Self);
    // ---------------------

    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    dateb := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (dsDoc.FieldByName('Ik_grup').AsInteger);
    LastNum := TDocController.Instance.CalculationLastNum
      (dsDoc.FieldByName('Ik_grup').AsInteger, ik_destination);
    fReview.eDest.Text := 'Заявление на академическую справку';
    fReview.eInd.Text := depInd;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    dmDocs.spStudAddressProc.Active := false;
    dmDocs.spStudAddressProc.Parameters.Refresh;
    dmDocs.spStudAddressProc.Parameters.ParamByName('@Ik_StudGrup').Value :=
      ik_studGrup;
    dmDocs.spStudAddressProc.Active := true;
    fReview.ShowModal;

    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
        if fReview.rbP.Checked then
          tempDS.FieldByName('Ik_Transfer').Value := 2
        else
          tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := 4;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value := depInd;

        dmDocs.adodsPricina.Open;
        dmDocs.adodsPricina.First;
        while not dmDocs.adodsPricina.EOF do
        begin
          with dmDocs.adodsPricina do
          begin
            if (FieldByName('ik_pric').Value = fReview.cbexReason.KeyValue) and
              (FieldByName('ik_destination').Value = 4) then
              tempDS.FieldByName('Ik_reason_issuing').Value :=
                FieldByName('Ik_reason_issuing').Value

          end;
          dmDocs.adodsPricina.Next;
        end;
        tempDS.Post;
        tempDS.UpdateBatch();
        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          ik_studGrup.ToString() + 'and Ik_destination= 4 and NumberDoc =' +
          LastNum.ToString() + 'and Num_podrazd=''' + depInd + '''';

        if fReview.rbP.Checked then // если пересылка почтой
        begin
          tempDSikdoc.Connection := dm.DBConnect;
          tempDSikdoc.Open;
          tempDSikdoc.First;

          // добавляем место назначения отправки
          tempDSsm.CommandText := 'Select * from Addressee_Doc';
          tempDSsm.Open;
          tempDSsm.Insert;
          tempDSsm.FieldByName('Ik_Document').Value :=
            tempDSikdoc.FieldByName('maxid').AsInteger;
          ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
          dmDocs.adodsStudAddres.Open;
          dmDocs.adodsStudAddres.First;
          while not dmDocs.adodsStudAddres.EOF do
          begin
            with dmDocs.adodsStudAddres do
            begin
              if (FieldByName('ik_AddressType')
                .Value = fReview.cbexTransp.KeyValue) then
                tempDSsm.FieldByName('ik_personAddress').Value :=
                  FieldByName('ik_personAddress').Value

            end;
            dmDocs.adodsStudAddres.Next;
          end;
          tempDSsm.Post;
          tempDSsm.UpdateBatch();
        end;
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    if (fReview.ModalResult = mrYes) then
    begin
      ListDist := TObjectList<TDest>.Create;

      ListDist := TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDS.Free;
    tempDSikdoc.Free;
    // sp_num.Free;
    // sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
  end;

end;

procedure TfmStudent.FormCallSpr(ik_studGrup, ik_destination: Integer);
var
  datebegin, d1, z: TDateTime;
  fReview: TfmСhallengeSpr;
  AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, year, ik_doc: Integer;
  mask1, mask2, dateb, l, depInd: string;
  sp_vidz: TADODataSet;
  sp_info, sp_sem: TADOStoredProc;

  tempDS, tempDSchall, tempDSikdoc, tempDSsm: TADODataSet;
  Report: TReportBase;
  LastNum: Integer;
  d3, d2: TDateTime;
  // sp_num: TADODataSet;
  // sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
  Ik_Transfer:integer;

begin
  inherited;
  try
    dsDoc := TADODataSet.Create(nil);
    // sp_num := TADODataSet.Create(nil);
    // sp_depInd := TADODataSet.Create(nil);
    tempDS := TGeneralController.Instance.GetNewADODataSet(true);
    tempDSchall := TGeneralController.Instance.GetNewADODataSet(true);
    tempDSikdoc := TADODataSet.Create(nil);
    tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);
    // общая часть формы
    // -------------------------------------------

    // берем индекс подразделения

    // sp_depInd.CommandText := 'select * from DepIndDoc(' +
    // ik_studGrup.ToString() + ')';
    // sp_depInd.Connection := dm.DBConnect;
    // sp_depInd.Open;
    // sp_depInd.First;
    //
    // DecodeDate(Now, AYear, AMonth, ADay);
    // if date() > StrToDateTime('01.09.' + AYear.ToString()) then
    // dateb := '01.09.' + AYear.ToString()
    // else
    // dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    // sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
    // + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
    // sp_depInd.FieldByName('Dep_Index').AsString + ''',3)';
    // sp_num.Connection := dm.DBConnect;
    // sp_num.Open;
    // sp_num.First;
    // LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    TDocController.Create;

    ik_stud := obj.StudGrupKey;
    // --------------------------------------------------------------------------
    DecodeDate(Now, AYear, AMonth, ADay);
    sp_info := TADOStoredProc.Create(nil);
    sp_info.ProcedureName := 'StudGetInfForSprav;1';
    sp_info.Connection := dm.DBConnect;
    sp_info.Parameters.CreateParameter('@Ik_studGrup', ftString, pdInput, 50,
      ik_studGrup.ToString());
    sp_info.Open;
    sp_info.First;
    dateb := TDocController.Instance.CalculationBeginYearLern();
    ik_grup := sp_info.FieldByName('Ik_grup').AsInteger;
    depInd := TDocController.Instance.CalculationDepIndex
      (ik_grup);
    LastNum := TDocController.Instance.CalculationLastNum
      (ik_grup, ik_destination);

    sp_sem := TADOStoredProc.Create(nil);
    sp_sem.ProcedureName := 'InfForGrup;1';
    sp_sem.Connection := dm.DBConnect;
  sp_sem.Parameters.CreateParameter('@Ik_grup', ftString, pdInput, 50,
    ik_grup.ToString());
    sp_sem.Open;
    sp_sem.First;
    sem := sp_sem.FieldByName('dop_sem').AsInteger;
    fReview := TfmСhallengeSpr.Create(Self);
    // ---------------------
    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // fReview.dtpArrival.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    Case ik_destination of
      3:
        fReview.eDest.Text := 'Справка-вызов';
      5:
        fReview.eDest.Text := 'Письмо-уведомление';
    End;
    // editF.eNum.Text := LastNum.ToString();
    fReview.eInd.Text := depInd;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')' + ' ' + sem.ToString() +
      ' семестр';
    fReview.dtpBegin.date := Now;
    fReview.dtpEnd.date := Now;
    dmDocs.spStudAddressProc.Active := false;
    dmDocs.spStudAddressProc.Parameters.Refresh;
    dmDocs.spStudAddressProc.Parameters.ParamByName('@Ik_StudGrup').Value :=
      ik_studGrup;
    dmDocs.spStudAddressProc.Active := true;
    // ---------------------
    fReview.cbeSem.Clear;
    for i := 1 to sem do
      fReview.cbeSem.AddItem(i.ToString(), TObject(i));
    fReview.cbeSem.ItemIndex := sem - 1;
    fReview.ShowModal;
    if fReview.rbL.Checked then
    Ik_Transfer :=1
    else Ik_Transfer :=2;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dm.DBConnect.BeginTrans;
      try
        // // добавляем справку

        tempDS.CommandText := 'Select * from Document ';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
        tempDS.FieldByName('Ik_Transfer').Value := Ik_Transfer;
        tempDS.FieldByName('Ik_destination').Value := ik_destination;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value := depInd;
        tempDS.Post;
        tempDS.UpdateBatch();

        // dm.DBConnect.CommitTrans;
        // except
        // dm.DBConnect.RollbackTrans;
        // end;
        // ik_doc:= 'SELECT LAST_INSERT_ID() FROM Document' ;

        k := 0;
        if (fReview.cbeReason.Text = 'Промежуточная аттестация') then
          k := 55;
        if (fReview.cbeReason.Text = 'Государственный экзамен') then
          k := 56;
        if (fReview.cbeReason.Text = 'Выпускная работа') then
          k := 31;

        sp_vidz := TADODataSet.Create(nil);
        sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_Grup='
          + ik_grup.ToString() + 'and n_sem=' + sem.ToString() +
          ' and iK_vid_zanyat=' + k.ToString();
        // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
        sp_vidz.Connection := dm.DBConnect;
        sp_vidz.Open;
        sp_vidz.First;

        tempDSikdoc.CommandText :=
          'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
          ik_studGrup.ToString() + 'and Ik_destination=' +
          ik_destination.ToString() + 'and NumberDoc =' + LastNum.ToString() +
          'and Num_podrazd=''' + depInd + '''';
        tempDSikdoc.Connection := dm.DBConnect;
        tempDSikdoc.Open;
        tempDSikdoc.First;

        // добавляем сущность справка-вызов
        // dm.DBConnect.BeginTrans;
        // try
        tempDSchall.CommandText := 'Select * from CallSpr';
        tempDSchall.Open;
        tempDSchall.Insert;
        tempDSchall.FieldByName('Ik_Document').Value :=
          tempDSikdoc.FieldByName('maxid').AsInteger;
        tempDSchall.FieldByName('DateStartPeriod').Value :=
          FormatDateTime('dd.mm.yyyy', fReview.dtpBegin.date);
        tempDSchall.FieldByName('DateEndPeriod').Value :=
          FormatDateTime('dd.mm.yyyy', fReview.dtpEnd.date);;
        tempDSchall.FieldByName('ik_upContent').Value :=
          sp_vidz.FieldByName('ik_upContent').AsInteger;
        ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
        tempDSchall.Post;
        tempDSchall.UpdateBatch();
        if fReview.rbP.Checked then
        begin
          tempDSsm.CommandText := 'Select * from Addressee_Doc';
          tempDSsm.Open;
          tempDSsm.Insert;
          tempDSsm.FieldByName('Ik_Document').Value :=
            tempDSikdoc.FieldByName('maxid').AsInteger;
          ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
          dmDocs.adodsStudAddres.Open;
          dmDocs.adodsStudAddres.First;
          while not dmDocs.adodsStudAddres.EOF do
          begin
            with dmDocs.adodsStudAddres do
            begin
              if (FieldByName('ik_AddressType')
                .Value = fReview.cbexTransp.KeyValue) then
                tempDSsm.FieldByName('ik_personAddress').Value :=
                  FieldByName('ik_personAddress').Value

            end;
            dmDocs.adodsStudAddres.Next;
          end;
          tempDSsm.Post;
          tempDSsm.UpdateBatch();
        end;
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;

    if (fReview.ModalResult = mrYes) then
    begin
      // Report := TUspevGroupController.Instance.BuildCallSpr(ik_studGrup, sem,
      // LastNum, tempDSikdoc.FieldByName('maxid').AsInteger,
      // fReview.dtpBegin.date, fReview.dtpEnd.date);
      ListDist := TObjectList<TDest>.Create;
      ListDist := TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    sp_info.Free;
    sp_vidz.Free;
    tempDS.Free;
    tempDSchall.Free;
    tempDSikdoc.Free;
    sp_sem.Free;
    // sp_depInd.Free;
    dsDoc.Free;
    Report.Free;
    tempDSsm.Free;
  end;

end;

procedure TfmStudent.FormExtract(ik_studGrup, ik_destination: Integer);
var
  tempDS, tempDSikdoc: TADODataSet;
  Report: TReportBase;
  i: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  LastNum: Integer;
  depInd: string;
  k, ik_doc: Integer;
  editF: TfrmReviewDoc;
  dsDoc: TADODataSet;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
  dsDoc := TADODataSet.Create(nil);;
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  try
    DecodeDate(Now, AYear, AMonth, ADay);

    editF := TfrmReviewDoc.Create(Self);
    editF.dtUtv.Format := '';
    editF.dtUtv.date := date;
    editF.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    datebegin := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (dsDoc.FieldByName('Ik_grup').AsInteger);
    LastNum := TDocController.Instance.CalculationLastNum
      (dsDoc.FieldByName('Ik_grup').AsInteger, ik_destination);
    editF.eDest.Text := 'Выписка из зачетной ведомости';
    editF.eInd.Text := depInd;
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
        tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
        tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := ik_destination;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value := depInd;
        tempDS.Post;
        tempDS.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    tempDSikdoc.CommandText :=
      'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
      ik_studGrup.ToString() + 'and Ik_destination=' + ik_destination.ToString()
      + 'and NumberDoc =' + LastNum.ToString() + 'and Num_podrazd=''' +
      depInd + '''';
    tempDSikdoc.Connection := dm.DBConnect;
    tempDSikdoc.Open;
    tempDSikdoc.First;
    ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
    if (editF.ModalResult = mrYes) then // печатаем
    begin
      ListDist := TObjectList<TDest>.Create;
      ListDist := TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDS.Free;
    dsDoc.Free;
    Report.Free;

  end;
end;

procedure TfmStudent.FormNeuspSpr(ik_studGrup, ik_destination: Integer);
var
  fReview: TfrmReviewNeusp;
  AYear, AMonth, ADay: word;
  dateb, l, depInd: string;
  tempDS, tempDSikdoc, dsAppli, tempDSdebt, tempDSneusp: TADODataSet;
  Report: TReportBase;
  LastNum, ik_doc, i: Integer;
  // d3, d2: TDateTime;
  // sp_num: TADODataSet;
  // sp_depInd: TADODataSet;
  dsDoc: TADODataSet;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
  inherited;
  ik_stud := obj.StudGrupKey;
  dsDoc := TADODataSet.Create(nil);
  // sp_num := TADODataSet.Create(nil);
  // sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSdebt := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSneusp := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  dsAppli := TADODataSet.Create(nil);
  try

    // берем индекс подразделения

    // sp_depInd.CommandText := 'select * from DepIndDoc(' +
    // ik_studGrup.ToString() + ')';
    // sp_depInd.Connection := dm.DBConnect;
    // sp_depInd.Open;
    // sp_depInd.First;
    // // общая часть формы
    // // -------------------------------------------
    //
    // DecodeDate(Now, AYear, AMonth, ADay);
    // if date() > StrToDateTime('01.09.' + AYear.ToString()) then
    // dateb := '01.09.' + AYear.ToString()
    // else
    // dateb := '01.09.' + (StrToInt(AYear.ToString()) - 1).ToString();
    // sp_num.CommandText := 'select * from MaxNumDocument(''' + dateb + '''' + ','
    // + '''' + DateTimeToStr(date()) + '''' + ',' + '''' +
    // sp_depInd.FieldByName('Dep_Index').AsString + ''',6)';
    // sp_num.Connection := dm.DBConnect;
    // sp_num.Open;
    // sp_num.First;
    // LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
    DecodeDate(Now, AYear, AMonth, ADay);

    fReview := TfrmReviewNeusp.Create(Self);
    // ---------------------

    fReview.dtUtv.Format := '';
    fReview.dtUtv.date := date;
    fReview.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    dateb := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (dsDoc.FieldByName('Ik_grup').AsInteger);
    LastNum := TDocController.Instance.CalculationLastNum
      (dsDoc.FieldByName('Ik_grup').AsInteger, ik_destination);
    fReview.eDest.Text := 'Письмо об академической неуспеваемости';
    fReview.eInd.Text := depInd;
    fReview.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
      dsDoc.FieldByName('Cname_grup').AsString + ')';
    fReview.Read;
    fReview.ShowModal;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      DebtList := fReview.DebtList;
      if DebtList.Count > 0 then
      begin
        dm.DBConnect.BeginTrans;
        try // добавляем справку
          tempDS.CommandText := 'Select * from Document';
          tempDS.Open;
          tempDS.Insert;
          tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
          tempDS.FieldByName('Ik_Transfer').Value := 2;
          tempDS.FieldByName('Ik_destination').Value := 6;
          tempDS.FieldByName('NumberDoc').Value := LastNum;
          tempDS.FieldByName('DatePod').Value := date;
          tempDS.FieldByName('DateCreate').Value := date;
          tempDS.FieldByName('Num_podrazd').Value := depInd;
          tempDS.Post;
          tempDS.UpdateBatch();

          tempDSikdoc.CommandText :=
            'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
            ik_studGrup.ToString() + 'and Ik_destination=' +
            ik_destination.ToString() + 'and NumberDoc =' + LastNum.ToString() +
            'and Num_podrazd=''' + depInd + '''';
          tempDSikdoc.Connection := dm.DBConnect;
          tempDSikdoc.Open;
          tempDSikdoc.First;
          ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
          tempDSneusp.CommandText := 'Select * from AkademNeuspev';
          tempDSneusp.Open;
          tempDSneusp.Insert;
          tempDSneusp.FieldByName('Ik_Document').Value := ik_doc;
          tempDSneusp.FieldByName('Deduction').Value :=
            FormatDateTime('dd.mm.yyyy', fReview.dtOtch.date);
          tempDSneusp.FieldByName('NamePric').Value := fReview.mPric.Text;
          tempDSneusp.Post;
          tempDSneusp.UpdateBatch();

          for i := 0 to DebtList.Count - 1 do
          begin
            tempDSdebt.CommandText := 'Select * from Debt';
            tempDSdebt.Open;
            tempDSdebt.Insert;
            tempDSdebt.FieldByName('Ik_Document').Value := ik_doc;
            tempDSdebt.FieldByName('ik_upContent').Value :=
              StrToInt(DebtList[i]);
            tempDSdebt.Post;
            tempDSdebt.UpdateBatch();
          end;

          dm.DBConnect.CommitTrans;
        except
          dm.DBConnect.RollbackTrans;
        end;
      end;
    end;
    if (fReview.ModalResult = mrYes) then // печатаем
    begin
      ListDist := TObjectList<TDest>.Create;

      ListDist := TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDSneusp.Close;
    tempDSneusp.Free;
    dsAppli.Close;
    dsAppli.Free;
    tempDS.Close;
    tempDS.Free;
    tempDSdebt.Close;
    tempDSdebt.Free;
    tempDSikdoc.Close;
    tempDSikdoc.Free;
    // sp_num.Free;
    // sp_depInd.Free;
    dsDoc.Close;
    dsDoc.Free;
    Report.Free;
  end;
end;

// procedure TfmStudent.FormSpr(ik_studGrup, ik_destination: Integer);
// var // E: Variant;
// // str,dir_inst,copystr1,copystr2,dop:string;
// // posit:integer;
// // FindRange: Variant;
// // tempStoredProc: TADOStoredProc;
// tempDS: TADODataSet;
// Report: TReportBase;
// // i, LastNum: integer;
// i: Integer;
// datebegin: string;
// AYear, AMonth, ADay: word;
// // sp_num: TADODataSet;
// // sp_depInd: TADODataSet;
// LastNum: Integer;
// depInd: string;
// k: Integer;
// editF: TfrmReviewDoc;
// dsDoc: TADODataSet;
// begin
// dsDoc := TADODataSet.Create(nil);
// // sp_num := TADODataSet.Create(nil);
// // sp_depInd := TADODataSet.Create(nil);
// tempDS := TGeneralController.Instance.GetNewADODataSet(true);
// try
//
// DecodeDate(Now, AYear, AMonth, ADay);
// datebegin := CalculationBeginYearLern();
// depInd := CalculationDepIndex(ik_studGrup);
// LastNum := CalculationLastNum(ik_studGrup, ik_destination);
// editF := TfrmReviewDoc.Create(Self);
// editF.dtUtv.Format := '';
// editF.dtUtv.date := date;
// editF.dtGot.Format := #32;
// // ищем информацию о студенте
// dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
// ik_studGrup.ToString();
// dsDoc.Connection := dm.DBConnect;
// dsDoc.Open;
// dsDoc.First;
// editF.eDest.Text := 'По месту требования';
// // editF.eNum.Text := LastNum.ToString();
// editF.eInd.Text := depInd;
// editF.Caption := dsDoc.FieldByName('FIO').AsString + ' (' +
// dsDoc.FieldByName('Cname_grup').AsString + ')';
// editF.ShowModal;
//
// if (editF.ModalResult = mrOk) or (editF.ModalResult = mrYes) then
// begin
// dm.DBConnect.BeginTrans;
// try // добавляем справку
// tempDS.CommandText := 'Select * from Document';
// tempDS.Open;
// tempDS.Insert;
// tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
// tempDS.FieldByName('Ik_Transfer').Value := 1;
// tempDS.FieldByName('Ik_destination').Value := 1;
// tempDS.FieldByName('NumberDoc').Value := LastNum;
// tempDS.FieldByName('DatePod').Value := date;
// tempDS.FieldByName('DateCreate').Value := date;
// tempDS.FieldByName('Num_podrazd').Value := depInd;
// tempDS.Post;
// tempDS.UpdateBatch();
// dm.DBConnect.CommitTrans;
// except
// dm.DBConnect.RollbackTrans;
// end;
// end;
// if (editF.ModalResult = mrYes) then // печатаем
// begin
// Report := TUspevGroupController.Instance.BuildSpravka2014(ik_studGrup,
// 0, LastNum);
// TWaitingController.GetInstance.Process(Report);
// end;
// uDMDocuments.dmDocs.adodsDocStud.Close;
// uDMDocuments.dmDocs.adodsDocStud.Open;
// finally
// tempDS.Free;
// // sp_num.Free;
// // sp_depInd.Free;
// dsDoc.Free;
// Report.Free;
//
// end;
// end;

procedure TfmStudent.FormSpr(ik_studGrup, ik_destination: Integer);
var // E: Variant;
  // str,dir_inst,copystr1,copystr2,dop:string;
  // posit:integer;
  // FindRange: Variant;
  // tempStoredProc: TADOStoredProc;
  tempDS: TADODataSet;
  Report: TReportBase;
  i, LastNum, ik_doc: Integer;
  datebegin, depInd: string;
  AYear, AMonth, ADay: word;
  // sp_num: TADODataSet;
  // sp_depInd: TADODataSet;
  k: Integer;
  editF: TfrmReviewDoc;
  dsDoc, tempDSikdoc: TADODataSet;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
   dsDoc := TADODataSet.Create(nil);
  // sp_num := TADODataSet.Create(nil);
  // sp_depInd := TADODataSet.Create(nil);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDSikdoc := TADODataSet.Create(nil);
  try

    DecodeDate(Now, AYear, AMonth, ADay);

    editF := TfrmReviewDoc.Create(Self);
    editF.dtUtv.Format := '';
    editF.dtUtv.date := date;
    editF.dtGot.Format := #32;
    // ищем информацию о студенте
    dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
      ik_studGrup.ToString();
    dsDoc.Connection := dm.DBConnect;
    dsDoc.Open;
    dsDoc.First;
    datebegin := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (dsDoc.FieldByName('Ik_grup').AsInteger);
    LastNum := TDocController.Instance.CalculationLastNum
      (dsDoc.FieldByName('Ik_grup').AsInteger, ik_destination);
    case ik_destination of
      1:
        editF.eDest.Text := 'По месту требования';
      2:
        editF.eDest.Text := 'ПФ';
    end;
    // editF.eNum.Text := LastNum.ToString();
    editF.eInd.Text := depInd;
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
        tempDS.FieldByName('Ik_studGrup').Value := ik_studGrup;
        tempDS.FieldByName('Ik_Transfer').Value := 1;
        tempDS.FieldByName('Ik_destination').Value := ik_destination;
        tempDS.FieldByName('NumberDoc').Value := LastNum;
        tempDS.FieldByName('DatePod').Value := date;
        tempDS.FieldByName('DateCreate').Value := date;
        tempDS.FieldByName('Num_podrazd').Value := depInd;
        tempDS.Post;
        tempDS.UpdateBatch();
        dm.DBConnect.CommitTrans;
      except
        dm.DBConnect.RollbackTrans;
      end;
    end;
    tempDSikdoc.CommandText :=
      'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup=' +
      ik_studGrup.ToString() + 'and Ik_destination=' + ik_destination.ToString()
      + 'and NumberDoc =' + LastNum.ToString() + 'and Num_podrazd=''' +
      depInd + '''';
    tempDSikdoc.Connection := dm.DBConnect;
    tempDSikdoc.Open;
    tempDSikdoc.First;
    ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
    if (editF.ModalResult = mrYes) then
    begin
      ListDist := TObjectList<TDest>.Create;
      ListDist :=TDocController.Instance.AddListDest(ListDist,
        ik_destination, ik_doc);
      Report := TDocController.Instance.BuildSprReport(ListDist[0]);
      TWaitingController.GetInstance.Process(Report);
    end;
    uDMDocuments.dmDocs.adodsDocStud.Close;
    uDMDocuments.dmDocs.adodsDocStud.Open;
  finally
    tempDS.Free;
    tempDSikdoc.Free;
    dsDoc.Free;
    Report.Free;
  end;
end;


end.
