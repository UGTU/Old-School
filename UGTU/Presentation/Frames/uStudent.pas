unit uStudent;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls,
  Grids, DBGridEh, Mask, DBCtrlsEh, ImgList, DBTVStudObj, DBLookupEh, db, DBCtrls,
  ExtDlgs, jpeg, VarfileUtils, ComObj, GridsEh, ActnList, Menus, dbtvSpecobj, dbtvFacobj,
  ReportsBase, D_StudUspevRep, ApplicationController, uWaitingController, uAddress;

type
  TfmStudent = class(TfmBase)
    ToolBar1: TToolBar;
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
    ToolButton1: TToolButton;
    Label57: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    eDuty: TDBEditEh;
    Label54: TLabel;
    dbcbeEnterprise: TDBLookupComboboxEh;
    Label51: TLabel;
    eXpyear: TDBNumberEditEh;
    eXpMonth: TDBNumberEditEh;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
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
    ToolButton10: TToolButton;
    KontExcel: TSpeedButton;
    ToolButton11: TToolButton;
    ActionList1: TActionList;
    actApply: TAction;
    actUndo: TAction;
    actPrintSprav: TAction;
    actPrintPensSprav: TAction;
    ToolButton12: TToolButton;
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
    ToolButton13: TToolButton;
    ppmStudNapr: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ToolButton14: TToolButton;
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

  private
    Fik:integer;
    FLoaded: boolean;
    Fobj: TDBNodeStudObject;
    procedure GetUspevStat(ik_zach:integer);

  protected
     procedure DoRefreshFrame;override;
     function DoApply: Boolean;override;
     function DoCancel:boolean;
     procedure ExecuteError(Sender: TObject; E: Exception);

  public
    property ik: Integer read Fik write Fik;
    property Loaded: boolean write floaded;
    procedure Read;
    property obj:TDBNodeStudObject read Fobj write Fobj;
  end;

var
  fmStudent: TfmStudent;


implementation

uses uDM, ADODB, Umain, DBTVObj, DBTVGroupObj, uDipl, uDMStudentSelectionProcs,
  uDMStudentActions, uDMStudentData, uDMCauses, uDMAdress, uDMUspevaemost, uPhotoBooth,
  ImageFullSizeShowFrm;

{$R *.dfm}

{ TfmStudent }
function ChangeMonthDayPlaces(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];
end;


function TfmStudent.DoApply: Boolean;
var
  stream: TMemoryStream;
  //i:integer;
  ndGroup:TDBNodeGroupObject;
begin
  if obj.ID<>ik then      //проверка nCode
  begin
    modified:=false;
    RefreshFrame;
    exit;
  end;
  {должны быть заполнены имя, фамилия, дата рождения, номер зачетки,
   гражданство, медаль?}
  if (eName.Text='')or(eFam.Text='')or(eNum.Text='      ')
  or(dbdteBirthDate.Text='  .  .    '){or(dbcbeCitizenship.Text='')or(dbcbeMedal.Text='')} then
begin
  showmessage('Одно или несколько обязательных для ввода полей не заполнены!');
  Result:=true;
  exit;
end;
  Result := true;
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
    CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,1);
    CreateParameter('@flag',ftInteger,pdInput,0,0);
    CreateParameter('@clastn',ftString,pdInput,40,eFam.Text);
    CreateParameter('@firstn',ftString,pdInput,40,eName.Text);

    if not (eMid.Text='') then
      CreateParameter('@otch',ftString,pdInput,40,eMid.Text)
      else CreateParameter('@otch',ftString,pdInput,40,null);

    if not (DateToStr(dbdteBirthDate.Value)='  .  .    ') then
      CreateParameter('@birth',ftDateTime,pdInput,0,dbdteBirthDate.Value)
      else CreateParameter('@birth',ftDateTime,pdInput,0,null);

    CreateParameter('@placebirth',ftString,pdInput,300,eBirthPlace.Text);

    if cbInvalid.Checked then
      CreateParameter('@inval',ftBoolean,pdInput,0,1)
      else CreateParameter('@inval',ftBoolean,pdInput,0,0);
    if cbChildren.Checked then
      CreateParameter('@deti',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@deti',ftBoolean,pdInput,0,0);
    if  cbJob.Checked then
      CreateParameter('@rab',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@rab',ftBoolean,pdInput,0,0);
    if  dbcbeSex.text='Мужской' then
      CreateParameter('@sex',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@sex',ftBoolean,pdInput,0,0);
    if  cbAppNeed.Checked then
      CreateParameter('@obchegit',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@obchegit',ftBoolean,pdInput,0,0);

    CreateParameter('@ik_medal',ftInteger,pdInput,0,dbcbeMedal.KeyValue);
    CreateParameter('@ik_voen_zvanie',ftInteger,pdInput,0,dbcbeMilitaryState.KeyValue);
    CreateParameter('@Sottel',ftString,pdInput,50,eCellphone.Text);
    CreateParameter('@telefon',ftString,pdInput,20,ePhone.text);
    CreateParameter('@Email',ftString,pdInput,50,eEmail.Text);

    if (iphoto.Picture.Graphic<>nil) then
      if (odPhoto.FileName<>'') then
        CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByFile(odPhoto.FileName))
      else
      begin
        stream:=TMemoryStream.Create;
        iPhoto.Picture.Graphic.SaveToStream(stream);
        CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByStream(stream))
      end
    else
      CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,NULL);

    CreateParameter('@Pens',ftInteger,pdInput,0,Null);
    CreateParameter('@grazd',ftInteger,pdInput,0,dbcbeCitizenship.KeyValue);
    CreateParameter('@podg',ftInteger,pdInput,0,dbcbePreparation.KeyValue);
    CreateParameter('@nac',ftInteger,pdInput,0,Null);
    CreateParameter('@ob_rab',ftInteger,pdInput,0,dbcbeSocWork.KeyValue);
    CreateParameter('@sempol',ftInteger,pdInput,0,dbcbeFamState.KeyValue);
    CreateParameter('@spec_uch',ftInteger,pdInput,0,dbcbeSpecCount.KeyValue);
    CreateParameter('@zaved',ftInteger,pdInput,0,dbcbeSchool.KeyValue);
    CreateParameter('@godokon',ftInteger,pdInput,0,eYearFinished.Value);
    CreateParameter('@ind_f',ftString,pdInput,10,'');
    CreateParameter('@street_f',ftInteger,pdInput,0,null);
    CreateParameter('@Build_f',ftString,pdInput,10,'');
    CreateParameter('@Stroen_f',ftString,pdInput,10,Null);
    CreateParameter('@Kvart_f',ftString,pdInput,10,'');
    CreateParameter('@ind_pr',ftString,pdInput,10,'');
    CreateParameter('@street_pr',ftInteger,pdInput,0,null);
    CreateParameter('@Build_pr',ftString,pdInput,10,'');
    CreateParameter('@Stroen_pr',ftString,pdInput,10,Null);
    CreateParameter('@Kvart_pr',ftString,pdInput,10,'');
    CreateParameter('@dopsved',ftString,pdInput,2000,eAddInfo.text);
    CreateParameter('@code',ftInteger,pdInput,0,Self.obj.id);
    CreateParameter('@nzach',ftString,pdInput,10,eNum.text);
    CreateParameter('@ik_zach',ftInteger,pdInput,0,obj.RecordbookKey);
    CreateParameter('@grup',ftInteger,pdInput,0,hint);
    CreateParameter('@kat_zach',ftInteger,pdInput,0,dbcbeCat.KeyValue);
    CreateParameter('@prikzach',ftInteger,pdInput,0,dbcbeOrder.KeyValue);
    if (obj.CauseEnterID=0) then
      CreateParameter('@priczach',ftInteger,pdInput,0,null)
    else
      CreateParameter('@priczach',ftInteger,pdInput,0,obj.CauseEnterID);
    if (obj.OrderExileID=0) then
      CreateParameter('@prikOtch',ftInteger,pdInput,0,null)
    else
      CreateParameter('@prikOtch',ftInteger,pdInput,0,obj.OrderExileID);
    if (obj.CauseExileID=0) then
       CreateParameter('@pricOtch',ftInteger,pdInput,0,null)
    else
      CreateParameter('@pricOtch',ftInteger,pdInput,0,obj.CauseExileID);

    CreateParameter('@cObosnZach',ftInteger,pdInput,0,NULL);
    CreateParameter('@cObosnOtch',ftInteger,pdInput,0,NULL);
    CreateParameter('@StazYear',ftInteger,pdInput,0,eXpyear.Value);
    CreateParameter('@StazMonth',ftInteger,pdInput,0,eXpMonth.Value);
    CreateParameter('@cDolgnost',ftString,pdInput,150,eDuty.Text);
    if not(dbcbeEnterprise.KeyValue=-1) then
      CreateParameter('@ik_pred',ftInteger,pdInput,0,dbcbeEnterprise.KeyValue)
      else CreateParameter('@ik_pred',ftInteger,pdInput,0,NULL);
    CreateParameter('@Ik_studGrup',ftInteger,pdInput,0,obj.StudGrupKey);
  end;
  dmStudentActions.aspAppendStudent.ExecProc;
  Modified:=false;
  ndGroup:=obj.Node.Parent.Data;
  obj.AdoDataset:=ndGroup.SetADODataset(dm.DBConnect);
  obj.Refresh;
  RefreshFrame;
end;

function TfmStudent.DoCancel: Boolean;
begin
  DoRefreshFrame;
  Result := true;
end;

procedure TfmStudent.DoRefreshFrame;
begin
if not (FrameObject is TDBNodeStudObject) then
exit;

Floaded:=false;
obj:=FrameObject as TDBNodeStudObject;
ik:=obj.ID;
//если приказ об отчислении есть
//obj.State = ssExiled
if (obj.BaseImageIndex=12) then
begin
frmMain.actAcademRestore.enabled:=false;
frmMain.actPasspChg.enabled:=true;
frmMain.actFamChg.enabled:=true;
frmMain.actOtchisl.enabled:=false;
frmMain.actPerevod.enabled:=false;
frmMain.actAkadem.enabled:=false;
frmMain.actVypiska.enabled:=true;
frmMain.actVosst.enabled:=true;
//frmMain.actNapr.enabled:=false;
frmMain.actExtendSession.Enabled := false;
actPrintSprav.Enabled := false;
end;
// obj.State=ssGhost
if (obj.BaseImageIndex=25) then
begin
frmMain.actAcademRestore.enabled:=false;
frmMain.actPasspChg.enabled:=true;
frmMain.actFamChg.enabled:=true;
frmMain.actOtchisl.enabled:=false;
frmMain.actPerevod.enabled:=false;
frmMain.actAkadem.enabled:=false;
frmMain.actVypiska.enabled:=true;
frmMain.actVosst.enabled:=False;
//frmMain.actNapr.enabled:=false;
frmMain.actExtendSession.Enabled := false;
actPrintSprav.Enabled := false;
end;

if (obj.State=ssAcadem) then
begin
frmMain.actAcademRestore.enabled:=true;
frmMain.actPasspChg.enabled:=true;
frmMain.actFamChg.enabled:=true;
frmMain.actOtchisl.enabled:=true;
frmMain.actPerevod.enabled:=false;
frmMain.actAkadem.enabled:=true;

frmMain.actAkadem.Caption := 'Изменить академический отпуск...';

frmMain.actVypiska.enabled:=true;
frmMain.actVosst.enabled:=false;

dmStudentData.adsIsOnVacation.Active:=false;
dmStudentData.adsIsOnVacation.CommandText:='select [dbo].[IsInVacation]('+inttostr(obj.RecordbookKey)+')';
dmStudentData.adsIsOnVacation.Active:=true;
dmStudentData.adsIsOnVacation.First;
//frmMain.actNapr.enabled:=dmStudentData.adsIsOnVacation.Fields[0].AsBoolean;

frmMain.actExtendSession.Enabled := false;
actPrintSprav.Enabled := true;
end;

if (obj.State=ssActual) then
begin
frmMain.actAcademRestore.enabled:=false;
frmMain.actPasspChg.enabled:=true;
frmMain.actFamChg.enabled:=true;
frmMain.actOtchisl.enabled:=true;
frmMain.actPerevod.enabled:=true;
frmMain.actAkadem.enabled:=true;

frmMain.actAkadem.Caption := 'Академический отпуск...';

frmMain.actVypiska.enabled:=true;
frmMain.actVosst.enabled:=false;
//frmMain.actNapr.enabled:=true;
frmMain.actExtendSession.Enabled := true;
actPrintSprav.Enabled := true;
end;

  PageControl1.ActivePageIndex := 0;
   with dmStudentData do begin
    adodsDocType.Active:=true;
    adodsZaved_Stud.Active:=true;
    adodsZaved_Stud.Sort:='[cName_zaved]';
    adodsMedal.Active:=false;
    adodsKatZach.Active:=false;
    adodsMilSt.Active:=false;
    adodsMedal.Active:=true;
    adodsKatZach.Active:=true;
    adodsMilSt.Active:=true;

     adodsNat.Active:=false;
     adodsCitizen.Active:=false;
     adodsCount.Active:=false;
     adodsJob.Active:=false;
     adodsPrep.Active:=false;
     dmCauses.adodsExile.Active:=false;
     adodsSempol.Active:=false;
     adodsPrikaz.Active:=false;
     adodsNat.Active:=true;
     adodsCitizen.Active:=true;
     adodsCount.Active:=true;
     adodsJob.Active:=true;
     adodsPrep.Active:=true;
     dmCauses.adodsExile.Active:=true;
     adodsSempol.Active:=true;
     adodsPrikaz.Active:=true;
     Modified:=false;
     bbSave.Enabled:=false;
     bbUndo.Enabled:=false;

   PageControl2.TabIndex:=0;
   adodsLang.Active:=false;
   adodsStepVlad.Active:=false;
   adodsEnterprise.Active:=false;
   adodsRelative.Active:=false;

   adodsLang.Active:=true;
   adodsStepVlad.Active:=true;
   adodsEnterprise.Active:=true;
   adodsRelative.Active:=true;
     end;
   with dmAdress do begin
   adodsStrana.Active:=true;
   adodsSignStrana.Active:=true;
   end;

  if not Assigned(obj) then exit;

  eName.Text:=obj.FirstName;
  eMid.Text:=obj.MiddleName;
  eFam.Text:=obj.LastName;
  eYearFinished.Text:=inttostr(obj.YearFinished);
  eBirthPlace.Text:=obj.BirthPlace;
  eAddInfo.Text:=obj.AddInform;
  eNum.Text:=obj.RecordbookNum;
  eEmail.Text:=obj.Email;

  ePhone.Text:=obj.Phone;
  eCellPhone.Text:=obj.Cellphone;

  dbdteBirthDate.Value:=obj.BirthDate;

  if obj.Sex then  dbcbeSex.Text:='Мужской' else
  dbcbeSex.Text:='Женский';

  dbcbeSchool.Text:=obj.Finished;
  dbcbeCat.Text:=obj.Category;
  dbcbeCitizenship.Text:=obj.Citizenship;
  dbcbeSocWork.Text:=obj.SocJob;
  dbcbePreparation.Text:=obj.Preparation;
  dbcbeSpecCount.Text:=obj.SpecCount;
  dbcbeOrder.KeyValue:=obj.OrderEnterID;
  dbcbeFamState.Text:=obj.FamState;
  dbcbeMedal.Text:=obj.Medal;
  dbcbeMilitaryState.KeyValue:=obj.MilitaryStateKey;
  dbcbeEnterprise.Value:=obj.EnterpriseID;
  eDuty.text:=obj.Duty;

  eXpYear.Value:=obj.xpYears;
  eXpMonth.Value:=obj.xpMonths;

if obj.Photo<>nil then begin
    obj.photo.Position:=0;
    //iPhoto.Picture.Graphic:=TBitmap.Create;
    iPhoto.Picture.Graphic:=TJPEGImage.Create;
    try
      iPhoto.Picture.Graphic.LoadFromStream(obj.photo);
    except
    end;
  end;

  cbJob.Checked:=obj.Job;
  cbChildren.Checked:=obj.Children;
  cbInvalid.Checked:=obj.Invalid;
  cbAppNeed.Checked:=obj.AppartmentNeed;

  with   dmStudentSelectionProcs.aspSelLanguage do
  begin
    Active:=false;
   dmStudentSelectionProcs.aspSelLanguagenCode.DefaultExpression:=inttostr(obj.ID);
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.ID;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelLastNames do
  begin
   Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelExtendedSessions do
  begin
   Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

   with dmStudentSelectionProcs.aspSelMoves do
  begin
   Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelDocuments do
  begin
  Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.ID;
   ExecProc;
   Active:=true;

  end;

  with dmStudentSelectionProcs.aspGetPersonAddress do
  begin
    Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=obj.ID;
    ExecProc;
    Active:=true;
  end;

    with dmStudentSelectionProcs.aspSelAcadem do
  begin
  Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelExiles do
  begin
  Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelVosst do
  begin
   Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;


  with dmStudentSelectionProcs.aspSelFamily do
  begin
   Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=obj.ID;
    ExecProc;
    Active:=true;
  end;     

  with   dmStudentSelectionProcs.aspSelKatChanges do
  begin
   Active:=false;
  Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.RecordbookKey;
   ExecProc;
   Active:=true;
  end;

  Modified:=false;
  bbSave.Enabled:=false;
 bbUndo.Enabled:=false;
Floaded:=true;

 if (obj.Node.ImageIndex<>9)and(obj.Node.ImageIndex<>11) then
 begin
  TabSheet3.Enabled:=false;
  TabSheet4.Enabled:=false;
  TabSheet5.Enabled:=false;
  TabSheet6.Enabled:=false;
  TabSheet7.Enabled:=false;

 end
 else
 begin
  TabSheet3.Enabled:=true;
  TabSheet4.Enabled:=true;
  TabSheet5.Enabled:=true;
  TabSheet6.Enabled:=true;
  TabSheet7.Enabled:=true;
 end;
end;

procedure TfmStudent.Read;
begin

end;



procedure TfmStudent.sbRefreshClick(Sender: TObject);
begin

  with dmUspevaemost.adsSelAllBRSBallsForStudent do
  begin
  Active:=false;
  dmUspevaemost.adsSelAllBRSBallsForStudentn_sem.Visible:=true;
  dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible:=true;

  CommandText:='select n_module, n_sem,  c_disc, i_balls, PropCount, Uvag_propCount from GetALLBRSBallsForStud('+inttostr(obj.RecordbookKey)+')';

  if cbSemBRS.Text<>'все' then
  begin
    CommandText:=CommandText+' where (n_sem = '+cbSemBRS.Text+')';
    if (cbModuleBRS.Text<>'все')and(cbModuleBRS.Text<>'итог') then
    begin
      CommandText:=CommandText+' and (n_module = '+cbModuleBRS.Text+')';
      dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible:=false;
    end;
    dmUspevaemost.adsSelAllBRSBallsForStudentn_sem.Visible:=false;
  end
  else
    if (cbModuleBRS.Text<>'все')and(cbModuleBRS.Text<>'итог') then
    begin
      CommandText:=CommandText+' where (n_module = '+cbModuleBRS.Text+')';
      dmUspevaemost.adsSelAllBRSBallsForStudentn_module.Visible:=false;
    end;

  Active:=true;
  end;
end;

procedure TfmStudent.actAddAddressExecute(Sender: TObject);
begin
  frmAddress := TfrmAddress.Create(Self);
  frmAddress.EditMode := false;
  frmAddress.IdStudent := obj.Id;
  frmAddress.ShowModal;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
end;

procedure TfmStudent.actApplyExecute(Sender: TObject);
begin
  inherited;
DoApply;
end;

procedure TfmStudent.actApplyUpdate(Sender: TObject);
begin
  inherited;
if Self.Modified then
actApply.Enabled:=true else
actApply.Enabled:=false;

end;

procedure TfmStudent.actDeleteAddressExecute(Sender: TObject);
begin
  if MessageBox(Handle, PAnsiChar('Вы действительно хотите удалить адрес?'), 'ИС УГТУ', MB_YESNO)=IDYES then
  begin
  dmAdress.aspDelAddress.Parameters[1].value := dmStudentSelectionProcs.aspGetPersonAddress.FieldByName('ik_personAddress').Value;
  dmAdress.aspDelAddress.ExecProc;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
  end;
end;

procedure TfmStudent.actEditAddressExecute(Sender: TObject);
begin

  frmAddress := TfrmAddress.Create(Self);
  with dmStudentSelectionProcs.aspGetPersonAddress do begin
  frmAddress.EditMode := true;

  frmAddress.AddressKey :=FieldByName('Ik_personAddress').Value;
  frmAddress.dbcbeAddressType.KeyValue := FieldByName('Ik_AddressType').Value;
  frmAddress.dbcbeCountry.KeyValue := FieldByName('Ik_strana').Value;
  frmAddress.dbcbeReg.KeyValue := FieldByName('Ik_region').Value;
  frmAddress.dbcbeDist.KeyValue := FieldByName('Ik_raion').Value;
  frmAddress.dbcbePoint.KeyValue := FieldByName('Ik_gorod').Value;
  frmAddress.dbcbeStreet.KeyValue := FieldByName('Ik_Street').Value;

  frmAddress.eFlat.Text:=FieldByName('FlatNumber').AsString;
  frmAddress.eHouse.Text:=FieldByName('BuildingNumber').AsString;
  frmAddress.eBuilding.Text:=FieldByName('StructNumber').AsString;
  frmAddress.eIndex.Text:=FieldByName('fIndex').AsString;
  frmAddress.dbdteBegin.value:=FieldByName('DateBegin').Value;
  frmAddress.dbdteEnd.value:=FieldByName('DateEnd').Value;

  frmAddress.ShowModal;
  frmAddress.Free;
  end;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
end;

procedure TfmStudent.actObnovlExecute(Sender: TObject);
begin
  cmbxSemChange(Sender);
end;

//Возвращает месяц в род. падеже
function GetMonthR(month:integer):string;
var str:string;
begin
    case month of
      1: str := 'января';
      2: str := 'февраля';
      3: str := 'марта';
      4: str := 'апреля';
      5: str := 'мая';
      6: str := 'июня';
      7: str := 'июля';
      8: str := 'августа';
      9: str := 'сентября';
      10: str := 'октября';
      11: str := 'ноября';
      12: str := 'декабря';
    end;
    result:= str;
end;

procedure TfmStudent.actPrintPensSpravExecute(Sender: TObject);
var E: Variant;
    str:string;
    year:integer;
    FindRange: Variant;
    tempStoredProc: TADOStoredProc;
begin
  //вызываем процедуру, переводящую ФИО в дат. падеж
  //и возвращающую иную нуную инфу
    tempStoredProc:= TADOStoredProc.Create(nil);
  try
   try
    tempStoredProc.ProcedureName:= 'StudGetInfForSprav;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Clastname', ftString, pdInput, 50, obj.LastName);
    tempStoredProc.Parameters.CreateParameter('@Cfirstname', ftString, pdInput, 50, obj.FirstName);
    tempStoredProc.Parameters.CreateParameter('@Cotch', ftString, pdInput, 50, obj.MiddleName);
    tempStoredProc.Parameters.CreateParameter('@ik_zach', ftInteger, pdInput, 4, obj.StudGrupKey);
    tempStoredProc.Parameters.CreateParameter('@DateZach', ftDateTime, pdInput, 8, dmStudentData.adodsPrikaz.FieldByName('Dd_prikaz').Value);
    tempStoredProc.Parameters.CreateParameter('@Date', ftDateTime, pdInput, 8, Date);
    tempStoredProc.Open;
    tempStoredProc.First;  //FIO
  except
    tempStoredProc.Free;
    MessageBox(Handle, 'Произошла ошибка при обращении к серверу.','ИС Деканат',MB_OK);
    exit;
  end;
  try
  //экспорт в Excel
    E := CreateOleObject('Excel.Application');
    E.Visible := false;
    E.DisplayAlerts:= false;
    str := ExtractFilePath(Application.ExeName)+'reports\SprvPens.XLT';
    E.WorkBooks.Add(str);
    E.Sheets[1].Select;
    FindRange := E.Cells.Replace(What := '#fio#',Replacement:=tempStoredProc.FieldByName('FIO').AsString);
    //obj.y  .
    case tempStoredProc.FieldByName('kurs').Value of
      1: str := 'первого';
      2: str := 'второго';
      3: str := 'третьего';
      4: str := 'четвертого';
      5: str := 'пятого';
      6: str := 'шестого';
    end;
    FindRange := E.Cells.Replace(What := '#kurs#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#spec#',Replacement:=tempStoredProc.FieldByName('Cshort_spec').AsString);
    FindRange := E.Cells.Replace(What := '#fac#',Replacement:=tempStoredProc.FieldByName('Cname_fac').AsString);
    FindRange := E.Cells.Replace(What := '#Date#',Replacement:=tempStoredProc.FieldByName('sprDate').AsString);
    str:=GetMonthR(tempStoredProc.FieldByName('sprMonth').Value);
    FindRange := E.Cells.Replace(What := '#Month#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#Year#',Replacement:=tempStoredProc.FieldByName('sprYear').AsString);
    FindRange := E.Cells.Replace(What := '#PrNum#',Replacement:=dmStudentData.adodsPrikaz.FieldByName('Nn_prikaz').AsString);
    FindRange := E.Cells.Replace(What := '#DateZ#',Replacement:=tempStoredProc.FieldByName('zachDate').AsString);
    str:=GetMonthR(tempStoredProc.FieldByName('zachMonth').Value);
    FindRange := E.Cells.Replace(What := '#MonthZ#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#YearZ#',Replacement:=tempStoredProc.FieldByName('zachYear').AsString);
    year:= tempStoredProc.FieldByName('sprYear').Value-
           tempStoredProc.FieldByName('kurs').Value;
    if tempStoredProc.FieldByName('sprMonth').Value>8 then
       year:= year-1;

    //FindRange := E.Cells.Replace(What := '#YearZach#',Replacement:=IntToStr(zachYear));
    FindRange := E.Cells.Replace(What := '#YearOtch#',Replacement:=IntToStr(tempStoredProc.FieldByName('zachYear').Value+tempStoredProc.FieldByName('YearObuch').Value));
    if tempStoredProc.FieldByName('ik_fac').Value<>6 then
      FindRange := E.Cells.Replace(What := '#otdel#',Replacement:='дневного отделения (очного)')
    else
      FindRange := E.Cells.Replace(What := '#otdel#',Replacement:=' отделения (заочного)');

    //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.DisplayAlerts:= true;
    E.Visible := true;
  except
    E.Quit;
    E:= UnAssigned;
    MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
  end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure TfmStudent.actPrintSpravExecute(Sender: TObject);
var E: Variant;
    str:string;
    FindRange: Variant;
    tempStoredProc: TADOStoredProc;
begin
  //вызываем процедуру, переводящую ФИО в дат. падеж
  //и возвращающую иную нуную инфу
  try
    tempStoredProc:= TADOStoredProc.Create(nil);
   try
    tempStoredProc.ProcedureName:= 'StudGetInfForSprav;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Clastname', ftString, pdInput, 50, obj.LastName);
    tempStoredProc.Parameters.CreateParameter('@Cfirstname', ftString, pdInput, 50, obj.FirstName);
    tempStoredProc.Parameters.CreateParameter('@Cotch', ftString, pdInput, 50, obj.MiddleName);
    tempStoredProc.Parameters.CreateParameter('@ik_zach', ftInteger, pdInput, 4, obj.StudGrupKey);
    tempStoredProc.Parameters.CreateParameter('@DateZach', ftDateTime, pdInput, 8, dmStudentData.adodsPrikaz.FieldByName('Dd_prikaz').Value);
    tempStoredProc.Parameters.CreateParameter('@Date', ftDateTime, pdInput, 8, Date);
    tempStoredProc.Open;
    tempStoredProc.First;  //FIO
  except
    tempStoredProc.Free;
    MessageBox(Handle, 'Произошла ошибка при обращении к серверу.','ИС Деканат',MB_OK);
    exit;
  end;

  //экспорт в Excel
  try
    E := CreateOleObject('Excel.Application');
    E.Visible := false;
    E.DisplayAlerts:= false;
    str := ExtractFilePath(Application.ExeName)+'reports\Sprv.XLT';
    E.WorkBooks.Add(str);
    E.Sheets[1].Select;
    FindRange := E.Cells.Replace(What := '#place#',Replacement:='По месту требования');

    FindRange := E.Cells.Replace(What := '#fio#',Replacement:=tempStoredProc.FieldByName('FIO').AsString);
    //obj.y  .
    case tempStoredProc.FieldByName('kurs').Value of
      1: str := 'первого';
      2: str := 'второго';
      3: str := 'третьего';
      4: str := 'четвертого';
      5: str := 'пятого';
      6: str := 'шестого';
    end;
    FindRange := E.Cells.Replace(What := '#kurs#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#spec#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
    FindRange := E.Cells.Replace(What := '#fac#',Replacement:=tempStoredProc.FieldByName('Cname_fac').AsString);
    FindRange := E.Cells.Replace(What := '#Date#',Replacement:=tempStoredProc.FieldByName('sprDate').AsString);
    str:= GetMonthR(tempStoredProc.FieldByName('sprMonth').Value);
    FindRange := E.Cells.Replace(What := '#Month#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#Month#',Replacement:=str);
    FindRange := E.Cells.Replace(What := '#Year#',Replacement:=tempStoredProc.FieldByName('sprYear').AsString);
    FindRange := E.Cells.Replace(What := '#YearZ#',Replacement:=tempStoredProc.FieldByName('zachYear').AsString);
    FindRange := E.Cells.Replace(What := '#YearOtch#',Replacement:=
      IntToStr(tempStoredProc.FieldByName('zachYear').Value+
      tempStoredProc.FieldByName('YearObuch').Value));
    //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true; 
  except
    E.Quit;
    E:= UnAssigned;
    MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
  end;
  finally
   tempStoredProc.Free;
  end;
end;

procedure TfmStudent.actPropToFactExecute(Sender: TObject);
begin
  dmAdress.aspPropToFact.Parameters[1].Value := obj.ID;
  dmAdress.aspPropToFact.ExecProc;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
end;

procedure TfmStudent.actUndoExecute(Sender: TObject);
begin
  inherited;
DoCancel;
end;

procedure TfmStudent.actUndoUpdate(Sender: TObject);
begin
  inherited;
if Self.Modified then
actUndo.Enabled:=true else
actUndo.Enabled:=false;
end;

procedure TfmStudent.BbSaveClick(Sender: TObject);
begin
  Doapply;
  bbSave.Enabled:=false;
  bbUndo.Enabled:=false;
end;

procedure TfmStudent.eFamExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
 if eFam.Text<>'' then begin
s:=eFam.Text;
sm:=AnsiUpperCase(s);
s[1]:=sm[1];
eFam.Text:=s;
 end;
end;

procedure TfmStudent.eMidExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
 if eMid.Text<>'' then begin
s:=eMid.Text;
sm:=AnsiUpperCase(s);
s[1]:=sm[1];
eMid.Text:=s;
 end;
end;

procedure TfmStudent.eNameExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
  if eName.Text<>'' then begin
    s:=eName.Text;
    sm:=AnsiUpperCase(s);
    s[1]:=sm[1];
    eName.Text:=s;
  end;
end;

procedure TfmStudent.dbcbeSexChange(Sender: TObject);
begin
dbcbeSex.ReadOnly:=true;
eFamChange(sender);
end;

procedure TfmStudent.dbcbeSexDropDown(Sender: TObject);
begin

 dbcbeSex.ReadOnly:=false;
end;

procedure TfmStudent.eEmailExit(Sender: TObject);
begin
  inherited;
  if eEmail.text='' then exit;
  if (Ansipos('@',eEmail.text)=0)//or(Ansipos('.',eEmail.text)=0) or(Ansipos('@',eEmail.text)>Ansipos('.',eEmail.text))
  then begin
        showmessage('Неверный e-mail!');
        eEmail.text:='';
       end;
end;

procedure TfmStudent.eFamChange(Sender: TObject);
begin
  inherited;
Modified:=true;
bbSave.Enabled:=true;
bbUndo.Enabled:=true;
end;

procedure TfmStudent.dbgeBallsTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adsSelAllBRSBallsForStudent.Sort:='['+Column.Field.FullName+']';
end;

procedure TfmStudent.dbgeFamExit(Sender: TObject);
begin
if Modified then
begin bbSave.Enabled:=true;
bbUndo.Enabled:=true;
end;

end;

procedure TfmStudent.iPhotoClick(Sender: TObject);
begin
  inherited;
if odPhoto.Execute then begin
iphoto.Picture.LoadFromFile(odPhoto.FileName);
{if (iphoto.Picture.Width>256)or(iphoto.Picture.Height>320) then
  begin
    showmessage('Максимальный размер фото: 256*320!');
    iphoto.Picture:=nil;
  end else begin  }
    Modified:=true;
    bbSave.Enabled:=true;
    bbUndo.Enabled:=true;
  //end;
end;
end;

procedure TfmStudent.iPhotoMouseEnter(Sender: TObject);
var pt :TPoint;
begin
   if not Assigned(iphoto.Picture.Graphic) then Exit;

   pt:=iphoto.ClientToScreen(Point(0,0));

   ImageFullSizeShowForm.curControl := self.iPhoto;
   ImageFullSizeShowForm.Height := iphoto.Picture.Graphic.Height;
   ImageFullSizeShowForm.Width := iphoto.Picture.Graphic.Width;
   ImageFullSizeShowForm.Top := pt.Y - (ImageFullSizeShowForm.Height div 2 - iphoto.Height div 2);
   ImageFullSizeShowForm.Left := pt.X - (ImageFullSizeShowForm.Width div 2 - iphoto.Width div 2);

   ImageFullSizeShowForm.Image := iphoto.Picture.Graphic;
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
    Clear;
    AddParameter;
    Items[0].Value := cmbxSem.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospSelUspevForStud.ExecProc;
  dmUspevaemost.adospSelUspevForStud.Active := true;  
  DBGridEh1.Columns[0].Title.Caption := 'Дисциплина';
  DBGridEh1.Columns[1].Title.Caption := 'Вид занятий';
  DBGridEh1.Columns[2].Title.Caption := 'Оценка';
  DBGridEh1.Columns[3].Title.Caption := 'Дата';
  DBGridEh1.Columns[4].Title.Caption := 'Преподаватель';   
  DBGridEh1.Columns[5].Title.Caption := 'Семестр';
  DBGridEh1.Columns[5].Width:=50;
  DBGridEh1.Columns[6].Title.Caption := 'Кол-во часов';
  DBGridEh1.Columns[6].Width:=100;
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
    Items[1].Value := TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospGetAllNaprStud.ExecProc;
  dmUspevaemost.adospGetAllNaprStud.Active := true;
end;

procedure TfmStudent.GetUspevStat(ik_zach:integer);
begin
  dmUspevaemost.adospUspevStatForStud.Close;
  with dmUspevaemost.adospUspevStatForStud.Parameters do
  begin
    Clear;
//    AddParameter;
//    Items[0].Value := ik_zach;
    CreateParameter('@ik_zach', ftInteger, pdInput, 0, ik_zach);
  end;
  dmUspevaemost.adospUspevStatForStud.Open;

end;

procedure TfmStudent.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.TabIndex=1 then
    cmbxSem.ItemIndex := 0;
  if PageControl1.TabIndex=2 then
    cmbxSemNapr.ItemIndex := 0;

  if PageControl1.ActivePage=tsUspevStat then
  begin
    if (not dmUspevaemost.adospUspevStatForStud.Active) or
       (dmUspevaemost.adospUspevStatForStud.Parameters.ParamByName('@ik_zach').Value<>
          TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey)  then
      GetUspevStat(TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey);
  end;

  if PageControl1.ActivePage=tsBRSBalls then
  sbRefreshClick(Sender);

end;



procedure TfmStudent.bbUndoClick(Sender: TObject);
begin
     DoCancel;

  bbSave.Enabled:=false;
  bbUndo.Enabled:=false;
end;

procedure TfmStudent.bShotClick(Sender: TObject);
  var phbooth:TPhotoBooth;
begin
  //phbooth:=TPhotoBooth.Create('Enter - make photo, Esc - cancel',ExtractFileDir(Application.ExeName),iPhoto);
  //phbooth.MakePhoto();
  phbooth := TApplicationController.GetInstance.GetPhotoBooth(ExtractFileDir(Application.ExeName),iPhoto);
  odPhoto.FileName:=phbooth.FileName;
  Modified:=true;
  bbSave.Enabled:=true;
  bbUndo.Enabled:=true;
end;

procedure TfmStudent.btnPrintSmallUspevClick(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TStudUspevExcelReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\StudUspev.XLT';
    TStudUspevExcelReport(Report).DataSet:= TADODataSet(dmUspevaemost.adospSelUspevForStud);
    TStudUspevExcelReport(Report).IsSmall:= true;
    TWaitingController.GetInstance.Process(Report);
    //Report.BuildReport;
end;

procedure TfmStudent.eAddInfoEnter(Sender: TObject);
begin

eAddInfo.BevelKind:=bksoft;

end;

procedure TfmStudent.eAddInfoExit(Sender: TObject);
begin
eAddInfo.BevelKind:=bknone;
end;

procedure TfmStudent.ToolButton1Click(Sender: TObject);
begin
  inherited;
  frmDiplom := TfrmDiplom.Create(self);
  frmDiplom.ik := obj.ik;
  frmDiplom.ShowModal;
  frmDiplom.Free;
end;


procedure TfmStudent.eNumExit(Sender: TObject);
begin
  if Length(eNum.Text)<6 then begin
  ShowMessage('Неверный номер зачетной книжки!');
  RefreshFrame;
  end;
end;

procedure TfmStudent.eNumUpdateData(Sender: TObject; var Handled: Boolean);
begin
if Length(eNum.Text)<6 then begin
  ShowMessage('Неверный номер зачетной книжки!');
  RefreshFrame;
  end;
end;

procedure TfmStudent.DBGridEh1TitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospSelUspevForStud.Sort:='['+Column.Field.FullName+']';
end;

procedure TfmStudent.dbgrNaprTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospGetAllNaprStud.Sort:='['+Column.Field.FullName+']';
end;

procedure TfmStudent.dbgUspevStatTitleClick(Column: TColumnEh);
begin
  inherited;
  dmUspevaemost.adospUspevStatForStud.Sort:='['+Column.Field.FullName+']';

end;

procedure TfmStudent.KontExcelClick(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TStudUspevExcelReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\StudUspev.XLT';
    TStudUspevExcelReport(Report).DataSet:= TADODataSet(dmUspevaemost.adospSelUspevForStud);
    TStudUspevExcelReport(Report).IsSmall:= false;
    TWaitingController.GetInstance.Process(Report);
    //Report.BuildReport;
end;

procedure TfmStudent.ExecuteError(Sender: TObject; E: Exception);
begin
  ShowMessage('Произошла ошибка при экспорте успеваемости cтудента: ' + E.Message);
  (Sender as TReportBase).Quit;
end;

{  try
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
end;}

end.
