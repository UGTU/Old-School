unit uStudDlg;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,
  DBCtrlsEh, Mask, ComCtrls, ActnList, DBLookupEh, ImgList, DBCtrls,
  ExtDlgs, Jpeg, VarfileUtils,uPrikdlg,ComObj, uError;

type
  TAddressRecord = class
    ikAddressType: integer;
	  Ik_street: integer;
	  Building: string;
	  Struct: string;
	  Flat : string;
	  Index : string;
	  DateBegin : string;
	  DateEnd : string;

    AddressTypeName :string;
    CountryName :string;
    RegionName :string;
    DistName :string;
    PointName :string;
    StreetName :string;

    constructor Create(ikAddressType: integer;Ik_street: integer;Building: string;Struct: string;Flat : string;Index : string;DateBegin : string;DateEnd : string;
    AddressTypeName :string; CountryName :string; RegionName :string;  DistName :string;  PointName :string;  StreetName :string);

  end;

  TftmStudent = class(TfrmBaseDialog)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label37: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    iPhoto: TImage;
    dbcbeSex: TDBComboBoxEh;
    dbdteBirthDate: TDBDateTimeEditEh;
    eFam: TDBEditEh;
    eName: TDBEditEh;
    eMid: TDBEditEh;
    eEmail: TDBEditEh;
    Panel8: TPanel;
    Label1: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbcbeCat: TDBLookupComboboxEh;
    Panel6: TPanel;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Panel5: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbcbeNationality: TDBLookupComboboxEh;
    dbcbeCitizenship: TDBLookupComboboxEh;
    eBirthPlace: TDBEditEh;
    Panel2: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    cbChildren: TCheckBox;
    cbJob: TCheckBox;
    cbInvalid: TCheckBox;
    cbAppNeed: TCheckBox;
    dbcbePreparation: TDBLookupComboboxEh;
    dbcbeSocWork: TDBLookupComboboxEh;
    dbcbeSpecCount: TDBLookupComboboxEh;
    Panel10: TPanel;
    TabSheet5: TTabSheet;
    dbcbeSchool: TDBLookupComboboxEh;
    Panel9: TPanel;
    Label38: TLabel;
    dbcbeFamState: TDBLookupComboboxEh;
    ilPages: TImageList;
    dbcbeMilitaryState: TDBLookupComboboxEh;
    Label43: TLabel;
    dbcbeMedal: TDBLookupComboboxEh;
    Label42: TLabel;
    odPhoto: TOpenPictureDialog;
    Bevel2: TBevel;
    Label44: TLabel;
    sbAddLang: TSpeedButton;
    sbDelLang: TSpeedButton;
    sgLang: TStringGrid;
    sgLangKeys: TStringGrid;
    sgRelatives: TStringGrid;
    sgRelKeys: TStringGrid;
    sbAddRel: TSpeedButton;
    sbDelRel: TSpeedButton;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    actCheckFields: TAction;
    actSAdresAutoFill: TAction;
    eCellphone: TDBEditEh;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label33: TLabel;
    Label58: TLabel;
    SpeedButton2: TSpeedButton;
    dbcbeCause: TDBLookupComboboxEh;
    Label59: TLabel;
    Label60: TLabel;
    eAddInfo: TMemo;
    dbcbeEnterprise: TDBLookupComboboxEh;
    Label51: TLabel;
    eDuty: TDBEditEh;
    Label54: TLabel;
    eXPyear: TDBNumberEditEh;
    Label55: TLabel;
    eXPMonth: TDBNumberEditEh;
    Label56: TLabel;
    Label57: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    eNum: TDBEditEh;
    actSelectOrder: TAction;
    eYearFinished: TDBNumberEditEh;
    actEnterprisePick: TAction;
    TabSheet2: TTabSheet;
    sgDocs: TStringGrid;
    sbAddDoc: TSpeedButton;
    SbDelDoc: TSpeedButton;
    sgDockeys: TStringGrid;
    Label8: TLabel;
    ePhone: TDBEditEh;
    sgAddress: TStringGrid;
    sbAddAddress: TSpeedButton;
    sbDelAddress: TSpeedButton;
    Label2: TLabel;
    actAddAddress: TAction;
    actDelAddress: TAction;
    procedure FormShow(Sender: TObject);

    procedure bbCancelClick(Sender: TObject);

   
    procedure eFamExit(Sender: TObject);
    procedure eNameExit(Sender: TObject);
    procedure eMidExit(Sender: TObject);
    procedure dbcbeSexChange(Sender: TObject);
    procedure dbcbeSexDropDown(Sender: TObject);
    procedure iPhotoClick(Sender: TObject);
    
    procedure eEmailExit(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure sbAddLangClick(Sender: TObject);
    procedure sbAddRelClick(Sender: TObject);
    procedure sbDelLangClick(Sender: TObject);
    procedure sbDelRelClick(Sender: TObject);
    procedure actCheckFieldsExecute(Sender: TObject);
    procedure sgLangSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgRelativesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure eAddInfoEnter(Sender: TObject);
    procedure eAddInfoExit(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure eNumClick(Sender: TObject);
    procedure actSelectOrderExecute(Sender: TObject);
    procedure actEnterprisePickExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbAddDocClick(Sender: TObject);
    procedure SbDelDocClick(Sender: TObject);
    procedure bbSpravMouseEnter(Sender: TObject);
    procedure sgAddressSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure actAddAddressExecute(Sender: TObject);
    procedure actDelAddressExecute(Sender: TObject);
   private
  Floaded:boolean;
  spravhint: string;

    { Private declarations }
  public
    AddressRecordList : TList;
    procedure SyncAddress;
    { Public declarations }
  end;

var
  ftmStudent: TftmStudent;
  inserted:boolean;

implementation
  uses udm,umain, ADODB,db, uLangDlg, uRelativeDlg, uGroup, uPostupdlg,
  Math, uSpravForm, uDMStudentSelectionProcs, uDMStudentData, uDMAdress, uDMCauses,
  uDMStudentActions, uDMPrikaz, uSelOrder, uEnterprisePick, uAddDocument, uAddress;
{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with ftmStudent do
begin
if eFam=nil then exit;
if (eFam.Text='')
or(eName.Text='')
or(eNum.Text='')
or(eNum.Text='      ')
or(dbdteBirthDate.Text='  .  .    ')
or(dbcbeSex.Text='')
or(dbcbeCitizenship.Text='')
or(dbcbeSchool.Text='')
or(dbcbeMedal.Text='')
or(dbcbeCause.Text='')
then result:=false;
end;
end;

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




procedure TftmStudent.FormShow(Sender: TObject);
//var    SF: TStringField;
//       ifd: TIntegerField;
begin
   floaded:=false;
  sgLang.Cells[0,0]:='Язык';
  sgLang.Cells[1,0]:='Степень владения';

  sgRelatives.Cells[0,0]:='ФИО';
  sgRelatives.Cells[1,0]:='Кем приходится';
  sgRelatives.Cells[2,0]:='Дата рождения';
  sgRelatives.Cells[3,0]:='Место работы';
  sgRelatives.Cells[4,0]:='Должность';
  sgRelatives.Cells[5,0]:='Телефон';
  sgRelatives.Cells[6,0]:='Адрес';
  sgRelatives.Cells[7,0]:='Рабочий телефон';

  sgDocs.Cells[0,0]:='Вид документа';
  sgDocs.Cells[1,0]:='Серия';
  sgDocs.Cells[2,0]:='Номер';
  sgDocs.Cells[3,0]:='Дата выдачи';
  sgDocs.Cells[4,0]:='Кем выдан';

  sgAddress.Cells[0,0]:='Тип адреса';
  sgAddress.Cells[1,0]:='Страна';
  sgAddress.Cells[2,0]:='Город';
  sgAddress.Cells[3,0]:='Улица';
  sgAddress.Cells[4,0]:='Дом';
  sgAddress.Cells[5,0]:='Квартира';

  AddressRecordList:= Tlist.Create;

  Pagecontrol2.ActivePageIndex:=0;
  dmStudentData.adodsLang.Open;
  dmStudentSelectionProcs.aspSelLanguage.Close;
  with dmStudentSelectionProcs.aspSelLanguage do
  begin
    Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=0;
    ExecProc;
    Active:=true;
  end;
  with dmStudentSelectionProcs.aspSelFamily do
  begin
    Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=0;
    ExecProc;
    Active:=true;
  end;

  with dmStudentData do
  begin
    adodsZaved_Stud.Active:=false;
    adodsKatZach.Active:=false;
    adodsEnterprise.Active:=false;
    adodsZaved_Stud.Active:=true;
    adodsZaved_Stud.sort:='[cName_zaved]';
    adodsKatZach.Active:=true;
    adodsEnterprise.Active:=true;
    adodsEnterprise.Sort:='Cname_pred';
  end;
   with dmAdress do
  begin
    adodsStrana.Active:=false;
    adodsStrana.Active:=true;
    adodsRegion.Active:=false;
  end;

  with dmStudentData do
  begin
     adodsMedal.Active:=false;

     adodsMilSt.Active:=false;
     adodsNat.Active:=false;
     adodsCitizen.Active:=false;
     adodsCount.Active:=false;
     adodsJob.Active:=false;
     adodsPrep.Active:=false;
     adodsSempol.Active:=false;

     adodsMedal.Active:=true;
     adodsMilSt.Active:=true;
     adodsNat.Active:=true;
     adodsCitizen.Active:=true;
     adodsCount.Active:=true;
     adodsJob.Active:=true;
     adodsPrep.Active:=true;
     adodsSempol.Active:=true;
  end;
   with dmCauses do
    begin
     adodsExile.Active:=false;
     adodsJoinCause.Active:=false;
     dmPrikaz.adodsPrikaz.Active:=false;
     adodsJoinCause.Active:=true;
     dmPrikaz.adodsPrikaz.Active:=true;
      dmPrikaz.adodsPrikaz.Sort:='[NN_Prikaz]';
     adodsExile.Active:=true;
    end;

     floaded:=true;
     // Установка параметров по умолчанию
     dbcbeCitizenship.KeyValue:=2;
     dbcbeNationality.KeyValue:=1;
     dbcbePreparation.KeyValue:=1;
     dbcbeSpecCount.KeyValue:=1;
     dbcbeSocWork.KeyValue:=4;
     dbcbeFamState.KeyValue:=9;
     dbcbeCat.KeyValue:=1;
     dbcbeSchool.KeyValue:=1;
     dbcbeMedal.KeyValue:=1;
     dbcbeMilitaryState.KeyValue:=1;
     SpeedButton2.Caption:='';
     eYearFinished.Text:=inttostr(CurrentYear);
end;


procedure TftmStudent.bbCancelClick(Sender: TObject);
begin
frmMain.ActiveFrame.Modified:=false;
close;
end;                      

  
procedure TftmStudent.bbSpravMouseEnter(Sender: TObject);
begin
  spravhint:=self.ActiveControl.Hint;
end;

procedure TftmStudent.eFamExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
 if eFam.Text<>'' then begin
s:=eFam.Text;
sm:=AnsiUpperCase(s);
s:=AnsiLowerCase(s);
s[1]:=sm[1];
eFam.Text:=s;
 end;
end;

procedure TftmStudent.eNameExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
 if eName.Text<>'' then begin
s:=eName.Text;
sm:=AnsiUpperCase(s);
s:=AnsiLowerCase(s);
s[1]:=sm[1];
eName.Text:=s;
 end;
end;

procedure TftmStudent.eNumClick(Sender: TObject);
begin
eNum.SelectAll;

end;

procedure TftmStudent.eMidExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
 if eMid.Text<>'' then begin
s:=eMid.Text;
sm:=AnsiUpperCase(s);
s:=AnsiLowerCase(s);
s[1]:=sm[1];
eMid.Text:=s;
 end;
end;


procedure TftmStudent.dbcbeSexChange(Sender: TObject);
begin
  inherited;
 dbcbeSex.ReadOnly:=true;
 if dbcbeSex.Text='Мужской' then
dbcbeFamState.KeyValue:=9 else
dbcbeFamState.KeyValue:=7;
 actCheckFieldsExecute(Sender);
end;

procedure TftmStudent.dbcbeSexDropDown(Sender: TObject);
begin
  inherited;
 dbcbeSex.ReadOnly:=false;

end;

procedure TftmStudent.iPhotoClick(Sender: TObject);

begin
  inherited;
  if odPhoto.Execute then begin
    iphoto.Picture.LoadFromFile(odPhoto.FileName);
  if (iphoto.Picture.Width>256)or(iphoto.Picture.Height>320) then
  begin
    showmessage('Максимальный размер фото: 256*320!');
    iphoto.Picture:=nil;
  end;
  end;
end;
                        


procedure TftmStudent.eEmailExit(Sender: TObject);
//var s:string;
begin
  inherited;
  if eEmail.text='' then exit;
  if (Ansipos('@',eEmail.text)=0){or(Ansipos('.',eEmail.text)=0) or(Ansipos('@',eEmail.text)>Ansipos('.',eEmail.text))    }
  then begin
    showmessage('Неверный e-mail!');
    eEmail.text:='';
  end;
end;

procedure TftmStudent.actAddAddressExecute(Sender: TObject);
begin
frmAddress :=TfrmAddress.Create(self);
frmAddress.EditMode:=false;
frmAddress.dlgOwner:=true;
frmAddress.ShowModal;
frmAddress.Free;
end;

procedure TftmStudent.actApplyExecute(Sender: TObject);
var i,code:integer;
//s:string;
begin
with dmStudentActions.aspAppendStudent.Parameters do begin
clear;
CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,1);
CreateParameter('@flag',ftInteger,pdInput,0,1);
CreateParameter('@clastn',ftString,pdInput,40,eFam.Text);
CreateParameter('@firstn',ftString,pdInput,40,eName.Text);

if not (eMid.Text='') then
CreateParameter('@otch',ftString,pdInput,40,eMid.Text)
else
CreateParameter('@otch',ftString,pdInput,40,'');

if not (DateToStr(dbdteBirthDate.Value)='  .  .    ') then
CreateParameter('@birth',ftDateTime,pdInput,0,ChangeMonthDayPlaces(dbdteBirthDate.Value))
else
CreateParameter('@birth',ftDateTime,pdInput,0,null);
CreateParameter('@placebirth',ftString,pdInput,50,ftmStudent.eBirthPlace.Text);
if  cbInvalid.Checked then
CreateParameter('@inval',ftBoolean,pdInput,0,1) else
CreateParameter('@inval',ftBoolean,pdInput,0,0);
if  cbChildren.Checked then
CreateParameter('@deti',ftBoolean,pdInput,0,1)  else
CreateParameter('@deti',ftBoolean,pdInput,0,0);
if  cbJob.Checked then
CreateParameter('@rab',ftBoolean,pdInput,0,1) else
CreateParameter('@rab',ftBoolean,pdInput,0,0);
if  dbcbeSex.text='Мужской' then
CreateParameter('@sex',ftBoolean,pdInput,0,1) else
CreateParameter('@sex',ftBoolean,pdInput,0,0);
if  cbAppNeed.Checked then
CreateParameter('@obchegit',ftBoolean,pdInput,0,1)else
CreateParameter('@obchegit',ftBoolean,pdInput,0,0);

CreateParameter('@ik_medal',ftInteger,pdInput,0,dbcbeMedal.KeyValue);
CreateParameter('@ik_voen_zvanie',ftInteger,pdInput,0,dbcbeMilitaryState.KeyValue);
CreateParameter('@Sottel',ftString,pdInput,50,eCellphone.Text);
CreateParameter('@telefon',ftString,pdInput,20,ePhone.text);
CreateParameter('@Email',ftString,pdInput,50,eEmail.Text);

if (iphoto.Picture.Graphic<>nil) and (odPhoto.FileName<>'') then
  CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByFile(odPhoto.FileName))
else
  CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,NULL);

CreateParameter('@Pens',ftInteger,pdInput,0,Null);
CreateParameter('@grazd',ftInteger,pdInput,0,dbcbeCitizenship.KeyValue);
CreateParameter('@podg',ftInteger,pdInput,0,dbcbePreparation.KeyValue);

if not (dbcbeNationality.KeyValue=-1) then
CreateParameter('@nac',ftInteger,pdInput,0,dbcbeNationality.KeyValue)
else CreateParameter('@nac',ftInteger,pdInput,0,Null);
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
CreateParameter('@code',ftInteger,pdInput,0,Null);
CreateParameter('@nzach',ftString,pdInput,10,eNum.text);
CreateParameter('@ik_zach',ftInteger,pdInput,0,Null);
CreateParameter('@grup',ftInteger,pdInput,0,tag);
CreateParameter('@kat_zach',ftInteger,pdInput,0,dbcbeCat.KeyValue);
CreateParameter('@prikzach',ftInteger,pdInput,0,dbcbeNumPrik.KeyValue);
CreateParameter('@priczach',ftInteger,pdInput,0,dbcbeCause.KeyValue);
CreateParameter('@prikOtch',ftInteger,pdInput,0,NULL);
CreateParameter('@pricOtch',ftInteger,pdInput,0,NULL);
CreateParameter('@cObosnZach',ftInteger,pdInput,0,NULL);
CreateParameter('@cObosnOtch',ftInteger,pdInput,0,NULL);
CreateParameter('@StazYear',ftInteger,pdInput,0,eXPYear.Value);
CreateParameter('@StazMonth',ftInteger,pdInput,0,eXPMonth.Value);
CreateParameter('@cDolgnost',ftString,pdInput,150,eDuty.Text);
if not(dbcbeEnterprise.KeyValue=-1) then
CreateParameter('@ik_pred',ftInteger,pdInput,0,dbcbeEnterprise.KeyValue) else
CreateParameter('@ik_pred',ftInteger,pdInput,0,NULL);
end;

//try

dmStudentActions.aspAppendStudent.ExecProc;

code:=dmStudentActions.aspAppendStudent.Parameters.ParamByName('@Return_Value').value;

for i:=0 to sgLangKeys.RowCount-2 do
begin

with dmStudentActions.aspAddLang.Parameters do
begin
clear;
AddParameter;
Items[0].Value:=strtoint(sgLangkeys.Cells[2,i]);
AddParameter;
Items[1].Value:=code;
AddParameter;
 Items[2].Value:=1;
AddParameter;
 Items[3].Value:=strtoint(sgLangkeys.Cells[1,i]);
end;
try
dmStudentActions.aspAddLang.ExecProc;
except
MessageBox(Handle, 'Язык не может быть добавлен', 'ИС Деканат', MB_ok);
end;

end;

for i:=0 to sgRelKeys.RowCount-2 do
begin

with dmStudentActions.aspAddRelative.Parameters do
begin
clear;
AddParameter;
Items[0].Value:=1;
AddParameter;
Items[1].Value:=code;
AddParameter;
Items[2].Value:=strtoint(sgRelkeys.Cells[1,i]);
AddParameter;
 Items[3].Value:=sgRelatives.Cells[4,i+1];
AddParameter;
 Items[4].Value:=strtoint(sgRelkeys.Cells[2,i]);
AddParameter;
 Items[5].Value:=sgRelatives.Cells[0,i+1];
AddParameter;
 Items[6].Value:=sgRelatives.Cells[6,i+1];
 AddParameter;
 Items[7].Value:=sgRelatives.Cells[5,i+1];
 AddParameter;
 if sgRelatives.Cells[2,i+1]='' then Items[8].Value:=Null else
 Items[8].Value:=ChangeMonthDayPlaces(StrtoDate(sgRelatives.Cells[2,i+1]));
 AddParameter;
 Items[9].Value:=sgRelatives.Cells[7,i+1];;
end;
dmStudentActions.aspAddRelative.ExecProc;
end;


for i:=0 to sgDocKeys.RowCount-2 do
begin
with dmStudentActions.aspAddDoc.Parameters do
begin
clear;
AddParameter;
Items[0].Value:=code;
AddParameter;
Items[1].Value:=strtoint(sgDockeys.Cells[1,i]);
AddParameter;
 Items[2].Value:=sgDocs.Cells[1,i+1];
AddParameter;
 Items[3].Value:=sgDocs.Cells[2,i+1];
AddParameter;
  if sgDocs.Cells[3,i+1]='' then
    Items[4].Value:=Null
  else
    Items[4].Value:=(StrtoDate(sgDocs.Cells[3,i+1]));
 AddParameter;
 Items[5].Value:=sgDocs.Cells[4,i+1];;
end;
dmStudentActions.aspAddDoc.ExecProc;
end;

for i:=0 to AddressRecordList.Count-1 do
begin
with dmAdress.aspAddAddress.Parameters do
begin

Items[1].Value:=code;
Items[2].Value:=TAddressRecord(AddressRecordList[i]).ikAddressType;
Items[3].Value:=TAddressRecord(AddressRecordList[i]).Ik_street;
Items[4].Value:=TAddressRecord(AddressRecordList[i]).Building;
Items[5].Value:=TAddressRecord(AddressRecordList[i]).Struct;
Items[6].Value:=TAddressRecord(AddressRecordList[i]).Flat;
Items[7].Value:=TAddressRecord(AddressRecordList[i]).Index;

if TAddressRecord(AddressRecordList[i]).DateBegin<>'  .  .    ' then
 Items[8].Value:=StrToDate(TAddressRecord(AddressRecordList[i]).DateBegin)
 else Items[8].Value:=null;
 if TAddressRecord(AddressRecordList[i]).DateEnd<>'  .  .    ' then
 Items[9].Value:=StrToDate(TAddressRecord(AddressRecordList[i]).DateEnd)
 else Items[9].Value:=null;
end;
dmAdress.aspAddAddress.ExecProc;
end;

inserted:=true;

frmMain.actTreeRefreshActionExecute(Sender);

end;

procedure TftmStudent.actOKExecute(Sender: TObject);
begin
 actApplyExecute(Sender);
 //--------
// with frmMain do
  //(ActiveFrame as TfmGroup).Read;
 //--------
 if inserted then
 Close;
end;


procedure TftmStudent.sbAddDocClick(Sender: TObject);
begin
  frmAddDocument:=TfrmAddDocument.Create(self);
  frmAddDocument.StudDlg:=self;
  frmAddDocument.showModal;
  frmAddDocument.Free;
  if sgDocs.Cells[0,sgDocs.Row]='' then
    sbDelDoc.Enabled:=false else
      sbDelDoc.Enabled:=true;
end;

procedure TftmStudent.sbAddLangClick(Sender: TObject);
begin
  inherited;
ftmLangDialog:=TftmLangDialog.Create(self);
ftmLangDialog.StudDlg:=self;
ftmLangDialog.showmodal;
ftmLangDialog.Free;
if sgLang.Cells[sgLang.Col,sgLang.Row]='' then
sbDelLang.Enabled:=false else
sbDelLang.Enabled:=true;
end;

procedure TftmStudent.sbAddRelClick(Sender: TObject);
begin
  inherited;
  ftmAddRelative:=TftmAddRelative.Create(self);
  ftmAddRelative.StudDlg:=self;
ftmAddRelative.showModal;
ftmAddRelative.Free;
 if sgRelatives.Cells[0,sgRelatives.Row]='' then
sbDelRel.Enabled:=false else
sbDelRel.Enabled:=true;
end;



procedure TftmStudent.SbDelDocClick(Sender: TObject);
begin

sgDocs.Cells[0,sgDocs.Row]:=sgDocs.Cells[0,sgDocs.RowCount-2];
sgDocs.Cells[1,sgDocs.Row]:=sgDocs.Cells[1,sgDocs.RowCount-2];
sgDocs.Cells[2,sgDocs.Row]:=sgDocs.Cells[2,sgDocs.RowCount-2];
sgDocs.Cells[3,sgDocs.Row]:=sgDocs.Cells[3,sgDocs.RowCount-2];
sgDocs.Cells[4,sgDocs.Row]:=sgDocs.Cells[4,sgDocs.RowCount-2];

sgDocs.Cells[0,sgDocs.RowCount-2]:='';
sgDocs.Cells[1,sgDocs.RowCount-2]:='';
sgDocs.Cells[2,sgDocs.RowCount-2]:='';
sgDocs.Cells[3,sgDocs.RowCount-2]:='';
sgDocs.Cells[4,sgDocs.RowCount-2]:='';



sgDocs.RowCount:=sgDocs.RowCount-1;

sgDocKeys.Cells[0,sgDocs.Row-1]:=sgDocKeys.Cells[0,sgDocKeys.RowCount-2];
sgDocKeys.Cells[1,sgDocs.Row-1]:=sgDocKeys.Cells[1,sgDocKeys.RowCount-2];
sgDocKeys.Cells[2,sgDocs.Row-1]:=sgDocKeys.Cells[2,sgDocKeys.RowCount-2];
sgDocKeys.Cells[0,sgDocKeys.RowCount-2]:='';
sgDocKeys.Cells[1,sgDocKeys.RowCount-2]:='';
sgDocKeys.Cells[2,sgDocKeys.RowCount-2]:='';
sgDocKeys.RowCount:=sgDocKeys.RowCount-1;
end;

procedure TftmStudent.sbDelLangClick(Sender: TObject);
begin
  inherited;
sgLang.Cells[0,sgLang.Row]:=sgLang.Cells[0,sgLang.RowCount-2];
sgLang.Cells[1,sgLang.Row]:=sgLang.Cells[1,sgLang.RowCount-2];
sgLang.Cells[0,sgLang.RowCount-2]:='';
sgLang.Cells[1,sgLang.RowCount-2]:='';
sgLang.RowCount:=sgLang.RowCount-1;

sgLangKeys.Cells[0,sgLang.Row-1]:=sgLangKeys.Cells[0,sgLangKeys.RowCount-2];
sgLangKeys.Cells[1,sgLang.Row-1]:=sgLangKeys.Cells[1,sgLangKeys.RowCount-2];
sgLangKeys.Cells[2,sgLang.Row-1]:=sgLangKeys.Cells[2,sgLangKeys.RowCount-2];
sgLangKeys.Cells[0,sgLangKeys.RowCount-2]:='';
sgLangKeys.Cells[1,sgLangKeys.RowCount-2]:='';
sgLangKeys.Cells[2,sgLangKeys.RowCount-2]:='';
sgLangKeys.RowCount:=sgLangKeys.RowCount-1;


end;

procedure TftmStudent.sbDelRelClick(Sender: TObject);
begin
  inherited;
sgRelatives.Cells[0,sgRelatives.Row]:=sgRelatives.Cells[0,sgRelatives.RowCount-2];
sgRelatives.Cells[1,sgRelatives.Row]:=sgRelatives.Cells[1,sgRelatives.RowCount-2];
sgRelatives.Cells[2,sgRelatives.Row]:=sgRelatives.Cells[2,sgRelatives.RowCount-2];
sgRelatives.Cells[3,sgRelatives.Row]:=sgRelatives.Cells[3,sgRelatives.RowCount-2];
sgRelatives.Cells[4,sgRelatives.Row]:=sgRelatives.Cells[4,sgRelatives.RowCount-2];
sgRelatives.Cells[5,sgRelatives.Row]:=sgRelatives.Cells[5,sgRelatives.RowCount-2];
sgRelatives.Cells[6,sgRelatives.Row]:=sgRelatives.Cells[6,sgRelatives.RowCount-2];

sgRelatives.Cells[0,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[1,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[2,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[3,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[4,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[5,sgRelatives.RowCount-2]:='';
sgRelatives.Cells[6,sgRelatives.RowCount-2]:='';


sgRelatives.RowCount:=sgRelatives.RowCount-1;

sgRelKeys.Cells[0,sgRelatives.Row-1]:=sgRelKeys.Cells[0,sgRelKeys.RowCount-2];
sgRelKeys.Cells[1,sgRelatives.Row-1]:=sgRelKeys.Cells[1,sgRelKeys.RowCount-2];
sgRelKeys.Cells[2,sgRelatives.Row-1]:=sgRelKeys.Cells[2,sgRelKeys.RowCount-2];
sgRelKeys.Cells[0,sgRelKeys.RowCount-2]:='';
sgRelKeys.Cells[1,sgRelKeys.RowCount-2]:='';
sgRelKeys.Cells[2,sgRelKeys.RowCount-2]:='';
sgRelKeys.RowCount:=sgRelKeys.RowCount-1;
end;

procedure TftmStudent.actCheckFieldsExecute(Sender: TObject);
begin
if (efam<>nil) then
if checkfields then
begin
bbOK.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOK.Enabled:=false;
bbApply.Enabled:=false;
end;

end;

procedure TftmStudent.actDelAddressExecute(Sender: TObject);
begin
 AddressRecordList.Delete(sgAddress.Row-1);
 SyncAddress;
end;

procedure TftmStudent.actEnterprisePickExecute(Sender: TObject);
begin
frmEnterprisePick:=TfrmEnterprisePick.Create(self);
frmEnterprisePick.frmHost:=Self;
frmEnterprisePick.ShowModal;
frmEnterprisePick.Free;
end;


procedure TftmStudent.actSelectOrderExecute(Sender: TObject);
begin
frmOrderPick:=TFrmOrderPick.Create(self);
frmOrderPick.ShowModal;
frmOrderPick.Free;
end;

procedure TftmStudent.sgAddressSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
if sgAddress.Cells[0,ARow]='' then
actDelAddress.Enabled:=false else
actDelAddress.Enabled:=true;
end;

procedure TftmStudent.sgLangSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
if sgLang.Cells[ACol,ARow]='' then
sbDelLang.Enabled:=false else
sbDelLang.Enabled:=true;
end;

procedure TftmStudent.sgRelativesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if sgRelatives.Cells[0,ARow]='' then
sbDelRel.Enabled:=false else
sbDelRel.Enabled:=true;
end;

procedure TftmStudent.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.execute;
end;

procedure TftmStudent.SyncAddress;
var i:integer;
begin
sgAddress.RowCount:=2;

for i := 0 to AddressRecordList.Count - 1 do
begin
  sgAddress.Cells[0,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).AddressTypeName;
  sgAddress.Cells[1,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).Countryname;
  sgAddress.Cells[2,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).Pointname;
  sgAddress.Cells[3,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).Streetname;
  sgAddress.Cells[4,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).Building;
  sgAddress.Cells[5,sgAddress.RowCount-1]:=TAddressRecord(AddressRecordList[i]).flat;
  sgAddress.RowCount:=sgAddress.RowCount+1;
end;
  sgAddress.RowCount:=sgAddress.RowCount-1;
end;

procedure TftmStudent.eAddInfoEnter(Sender: TObject);
begin
eAddInfo.BevelKind:=bksoft;
end;

procedure TftmStudent.eAddInfoExit(Sender: TObject);
begin
eAddInfo.BevelKind:=bknone;

end;

procedure TftmStudent.actSpravExecute(Sender: TObject);
begin
  //if frmSprav=nil then
    frmSprav:=TfrmSprav.Create(self);
      //CreateForm(TfrmSprav, frmSprav);
  frmSprav.Connection:=dm.DBConnect;
  frmsprav.predSprav:=spravhint;
  frmSprav.ShowModal;
  //ChangeSprav;
  frmSprav.FreeOnRelease;
  FormShow(Sender);
end;

{ TAddressRecord }

constructor TAddressRecord.Create(ikAddressType, Ik_street: integer; Building,
  Struct, Flat, Index: string; DateBegin, DateEnd: string; AddressTypeName,
  CountryName, RegionName, DistName, PointName, StreetName: string);
begin
    self.ikAddressType:= ikAddressType;
	  self.Ik_street:=Ik_street;
	  self.Building:=Building;
	  self.Struct:=Struct;
	  self.Flat :=Flat;
	  self.Index :=Index;
	  self.DateBegin :=DateBegin;
	  self.DateEnd :=DateEnd;
    self.AddressTypeName :=AddressTypeName;
    self.CountryName :=CountryName;
    self.RegionName :=RegionName;
    self.DistName :=DistName;
    self.PointName :=PointName;
    self.StreetName := StreetName;


end;

end.
