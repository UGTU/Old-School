unit uabitDialog;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uStudDlg, DBGridEh, ExtDlgs, ImgList, ActnList, StdCtrls, Grids,
  DBCtrlsEh, DBLookupEh, Buttons, Mask, ExtCtrls, ComCtrls, adodb, jpeg, VarfileUtils,
  DateUtils, System.Actions, System.Generics.Collections;

type
  TfrmAbitCardDialog = class(TftmStudent)
    eBenefits: TDBEditEh;
    dbcbeSchoolCountry: TDBLookupComboboxEh;
    dbcbeSchoolDist: TDBLookupComboboxEh;
    dbcbeSchoolRegion: TDBLookupComboboxEh;
    Label64: TLabel;
    Label65: TLabel;
    dbcbeSchoolPoint: TDBLookupComboboxEh;
    Label66: TLabel;
    Label68: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label3: TLabel;
    btnBack: TButton;
    Label9: TLabel;
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);

    procedure bbCancelClick(Sender: TObject);
    procedure dbcbeSchoolCountryChange(Sender: TObject);
    procedure dbcbeSchoolDistChange(Sender: TObject);
    procedure dbcbeSchoolRegionChange(Sender: TObject);
    procedure dbcbeSchoolPointChange(Sender: TObject);
    procedure dbcbeSchoolChange(Sender: TObject);
    procedure dbcbeSchoolEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dbcbeEnterpriseChange(Sender: TObject);
    procedure bbSpravMouseEnter(Sender: TObject);
    procedure dbdteBirthDateExit(Sender: TObject);
    procedure eEmailExit(Sender: TObject);
    procedure eFamExit(Sender: TObject);
    procedure eNameExit(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure eBirthPlaceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   // procedure actCheckFieldsExecute(Sender: TObject);
    procedure eFamKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnBackClick(Sender: TObject);
    procedure actAddAddressExecute(Sender: TObject);
    procedure actDelAddressExecute(Sender: TObject);

  private
  floaded:boolean;
  fupmoving:boolean;
  spravhint: string;
  fNeedEmail: boolean;
    procedure SetVisiblePage;
    { Private declarations }
  public
  HasAddSpec : boolean;
  Year: integer;
  function checkDataAbit :boolean;
    { Public declarations }
  end;

var
  frmAbitCardDialog: TfrmAbitCardDialog;

implementation

uses udm,umain,db, uLangDlg, uRelativeDlg, uGroup, uPostupdlg, uSpravForm,
  uDMStudentSelectionProcs, uDMStudentData, uDMAbiturientAction, uDMAdress,
  uDMCauses, uDMPrikaz, DocumentClass;


procedure CheckFields;
begin
  with frmAbitCardDialog do
  case PageControl2.ActivePageIndex of
  0: bbOK.Enabled := (eFam.Text <> '')and(Length(eFam.Text) > 1)and(eName.Text<>'')and(Length(eName.Text)>1)
                  and(dbcbeSchool.KeyValue >= 0)and (dbdteBirthDate.Text <> '  .  .    ')
                  and (sgAddress.RowCount>1);
  1: bbOK.Enabled := (dbcbeCitizenship.KeyValue >= 0)and(eBirthPlace.Text <> '');
  end;
end;

{$R *.dfm}
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

procedure TfrmAbitCardDialog.actAddAddressExecute(Sender: TObject);
begin
  inherited;
  CheckFields;
end;

procedure TfrmAbitCardDialog.actApplyExecute(Sender: TObject);
begin

  if not checkDataAbit then
    exit;

  try
    with dmAbiturientAction.adospInsertPredpr do
    begin
      Active:=false;
      Parameters[1].Value:=dbcbeEnterprise.Text;
      ExecProc;
      if (Parameters[0].value<>(-1)) then
      begin
        dmStudentData.adodsEnterprise.Active:=false;
        dmStudentData.adodsEnterprise.Active:=true;
        dbcbeEnterprise.KeyValue:=Parameters[0].Value;
      end;
    end;
  finally

  end;

frmPostupDlg:=TfrmpostupDlg.create(self);
frmPostupDlg.Tag:=self.Tag;
frmPostupDlg.HostForm:=self;
frmPostupDlg.Year:=self.Year;
frmPostupDlg.HasAddSpec:=HasAddSpec;
frmPostupDlg.IDpostup:=-1;
frmPostupDlg.Showmodal;
frmpostupDlg.Free;
AddressRecordList.Free;
DocRecordList.Free;

frmMain.actTreeRefreshActionExecute(Sender);

end;

procedure TfrmAbitCardDialog.actDelAddressExecute(Sender: TObject);
begin
  inherited;
  CheckFields;
end;

procedure TfrmAbitCardDialog.actOKExecute(Sender: TObject);
begin
  if PageControl2.ActivePageIndex<PageControl2.PageCount-1 then
    PageControl2.SelectNextPage(True, False)
  else actApplyExecute(Sender);

end;

procedure TfrmAbitCardDialog.FormShow(Sender: TObject);
begin
  floaded:=false;
  dbcbeSchool.ListSource := dmAdress.dsSchool;

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
  sgDocs.Cells[5, 0] := 'Оригинал';
  sgDocs.Cells[6, 0] := 'Баллов';
  sgDocs.Cells[7, 0] := 'Дисциплина';

  sgAddress.Cells[0,0]:='Тип адреса';
  sgAddress.Cells[1,0]:='Страна';
  sgAddress.Cells[2,0]:='Город';
  sgAddress.Cells[3,0]:='Улица';
  sgAddress.Cells[4,0]:='Дом';
  sgAddress.Cells[5,0]:='Квартира';

  AddressRecordList:= Tlist.Create;
  DocRecordList := TObjectList<TDocRecord>.Create;

  with dmAdress do
  begin
   adodsSchoolStrana.Active:=false;
   adodsSchoolRegion.Active:=false;
   adodsSchoolRaion.Active:=false;
   adodsSchoolGorod.Active:=false;
   adodsSchool.Active:=false;

   adodsSchoolStrana.Active:=true;
   adodsSchoolStrana.Sort:='Cstrana';
   adodsSchoolRegion.Active:=true;
   adodsSchoolRegion.Sort:='Cregion';
   adodsSchoolRaion.Active:=true;
   adodsSchoolRaion.Sort:='Craion';
   adodsSchoolGorod.Active:=true;
   adodsSchoolGorod.Sort:='Cgorod';
   adodsSchool.Active:=true;
   adodsSchool.Sort:='Cname_zaved';
  end;

  //считываем, какие параметры необходимы для указанного направления
  with dmStudentSelectionProcs.adsGetParamNeedness do
  begin
    Active:=true;
    Locate('NNrecord',Self.Tag,[]);
    fNeedEmail := (FieldByName('needEmail').Value = true);
    Active := false;
  end;

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
  with dmStudentData do begin
    adodsZaved_Stud.Active:=false;
    adodsKatZach.Active:=false;
    adodsEnterprise.Active:=false;
    adodsKatZach.Active:=true;
    adodsEnterprise.Active:=true;
    adodsZaved_Stud.Active:=true;
  end;
  with dmAdress do begin
    adodsStrana.Active:=false;
    adodsRegion.Active:=false;
    adodsStrana.Active:=true;
    adodsStrana.Sort:='[cStrana]';
  end;

  
  with dmStudentData do begin
  dmStudentData.adodsMedal.Active:=false;

     dmPrikaz.adodsPrikaz.Active:=false;
     adodsMilSt.Active:=false;
     adodsNat.Active:=false;
     adodsCitizen.Active:=false;
     adodsCount.Active:=false;
     adodsJob.Active:=false;
     adodsPrep.Active:=false;
     adodsSempol.Active:=false;
     adodsEnterprise.Active:=false;
     adodsMedal.Active:=true;
     dmPrikaz.adodsPrikaz.Active:=true;
     adodsMilSt.Active:=true;
     adodsNat.Active:=true;
     adodsCitizen.Active:=true;
     adodsCount.Active:=true;
     adodsJob.Active:=true;
     adodsPrep.Active:=true;
     adodsSempol.Active:=true;
     adodsEnterprise.Active:=true;
     adodsEnterprise.Sort:='Cname_pred';
   end;
   with dmCauses do
   begin
     adodsExile.Active:=false;
     adodsJoinCause.Active:=false;
     adodsExile.Active:=true;
     adodsJoinCause.Active:=true;
   end;



     // Установка параметров по умолчанию

      if dbcbeCitizenship.KeyValue<0 then dbcbeCitizenship.KeyValue:=2;
      if dbcbeNationality.KeyValue<0 then dbcbeNationality.KeyValue:=1;
       if dbcbePreparation.KeyValue<0 then dbcbePreparation.KeyValue:=1;
      if dbcbeSpecCount.KeyValue<0 then dbcbeSpecCount.KeyValue:=1;
      if dbcbeSocWork.KeyValue<0 then dbcbeSocWork.KeyValue:=4;
      if dbcbeFamState.KeyValue<0 then dbcbeFamState.KeyValue:=9;
      if dbcbeCat.KeyValue<0 then dbcbeCat.KeyValue:=1;
      // if dbcbeSchool.KeyValue<0 then dbcbeSchool.KeyValue:=1;
      if dbcbeMedal.KeyValue<0 then dbcbeMedal.KeyValue:=1;
      if eYearFinished.text='' then eYearFinished.Value:=CurrentYear;
      if dbcbeMilitaryState.text='' then dbcbeMilitaryState.KeyValue:=1;
      floaded:=true;
      fupmoving:=false;

      if dbcbeSchoolPoint.KeyValue<0 then dbcbeSchoolPoint.KeyValue:=504;
       dbcbeSchoolPointChange(Sender);

      //lblNeedEmail.Visible := fNeedEmail;

      eFam.SetFocus;
  SetVisiblePage;
end;



procedure TfrmAbitCardDialog.PageControl2Change(Sender: TObject);
begin
  SetVisiblePage;
  CheckFields;
end;

procedure TfrmAbitCardDialog.dbcbeEnterpriseChange(Sender: TObject);
begin
if dbcbeEnterprise.Text<>'' then cbJob.Checked:=true else cbJob.Checked:=false;
end;

procedure TfrmAbitCardDialog.dbcbeSchoolChange(Sender: TObject);
begin
  fupmoving:=true;
  dbcbeSchoolPoint.KeyValue:=dmAdress.adodsSchool.FieldByName('ik_gorod').Value;
  fupmoving:=false;
  CheckFields;
end;

procedure TfrmAbitCardDialog.dbcbeSchoolCountryChange(Sender: TObject);
begin
 If not Floaded then exit;

 if not fupmoving then

  with dmAdress do begin
    adodsSchoolRegion.Active:=false;
    adodsSchoolRaion.Active:=false;
    adodsSchoolGorod.Active:=false;
    adodsSchool.Active:=false;

    if dbcbeSchoolCountry.KeyValue<>NULL then begin
     adodsSchoolRegion.CommandText:='select distinct ik_region, cregion, ik_strana from SchoolAdressView  where (Ik_strana='''+string(dbcbeSchoolCountry.KeyValue)+''')and (ik_region is not NULL)';
     adodsSchoolRaion.CommandText:='select distinct ik_region,  ik_strana, ik_raion, craion from SchoolAdressView where (Ik_strana='''+string(dbcbeSchoolCountry.KeyValue)+''')and (ik_raion is not NULL)';
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where (Ik_strana='''+string(dbcbeSchoolCountry.KeyValue)+''')and (ik_gorod is not NULL)';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod,  ik_zaved, cname_zaved from SchoolAdressView where (Ik_strana='''+string(dbcbeSchoolCountry.KeyValue)+''')and (ik_zaved is not NULL)';
    end
    else begin
     adodsSchoolRegion.CommandText:='select distinct ik_region, cregion, ik_strana from SchoolAdressView where ik_region is not null';
     adodsSchoolRaion.CommandText:='select distinct ik_region,  ik_strana, ik_raion, craion from SchoolAdressView where ik_raion is not null';
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where ik_gorod is not null';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where ik_zaved is not null';
    end;
     adodsSchoolRegion.Active:=true;
      adodsSchoolRegion.Sort:='Cregion';
     adodsSchoolRaion.Active:=true;
      adodsSchoolRaion.Sort:='Craion';
     adodsSchoolGorod.Active:=true;
      adodsSchoolGorod.Sort:='Cgorod';
     adodsSchool.Active:=true;
      adodsSchool.Sort:='Cname_zaved';
  end;
  fupmoving:=false;
  end;

procedure TfrmAbitCardDialog.dbcbeSchoolDistChange(Sender: TObject);
begin
 If not Floaded then exit;
if fupmoving then begin dbcbeSchoolCountry.KeyValue:=dmAdress.adodsSchoolRegion.FieldByName('ik_strana').Value;
 fupmoving:=false end else

  with dmAdress do begin
    adodsSchoolRaion.Active:=false;
    adodsSchoolGorod.Active:=false;
    adodsSchool.Active:=false;

    if dbcbeSchoolDist.KeyValue<>NULL then begin
     adodsSchoolRaion.CommandText:='select distinct ik_region,  ik_strana, ik_raion, craion from SchoolAdressView where (Ik_region='''+string(dbcbeSchoolDist.KeyValue)+''') and (ik_raion is not null)';
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where (Ik_region='''+string(dbcbeSchoolDist.KeyValue)+''') and (ik_gorod is not null)';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where (Ik_region='''+string(dbcbeSchoolDist.KeyValue)+''') and (ik_zaved is not null)';

    end
    else begin
     adodsSchoolRaion.CommandText:='select distinct ik_region,  ik_strana, ik_raion, craion from SchoolAdressView where ik_raion is not null';
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where ik_gorod is not null';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where ik_zaved is not null';
    end;
     adodsSchoolRaion.Active:=true;
      adodsSchoolRaion.Sort:='Craion';
     adodsSchoolGorod.Active:=true;
      adodsSchoolGorod.Sort:='Cgorod';
     adodsSchool.Active:=true;
      adodsSchool.Sort:='Cname_zaved';
  end;

end;

procedure TfrmAbitCardDialog.dbcbeSchoolEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  frmSprav:=TfrmSprav.Create(self);
  frmSprav.Connection:=dm.DBConnect;
  frmsprav.predSprav:='Учебное заведение';
  frmSprav.ShowModal;
  frmSprav.Free;
  FormShow(Sender);
end;

procedure TfrmAbitCardDialog.dbcbeSchoolPointChange(Sender: TObject);
begin
If not Floaded then exit;

  if fupmoving then begin dbcbeSchoolRegion.KeyValue:=dmAdress.ADODSsChoolGorod.FieldByName('ik_raion').Value;
   fupmoving:=false;
   end
   else

  with dmAdress do begin
        adodsSchool.Active:=false;

    if dbcbeSchoolPoint.KeyValue<>NULL then
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where (Ik_gorod='''+string(dbcbeSchoolPoint.KeyValue)+''')and(ik_zaved is not null)'

    else
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where ik_zaved is not null';
      adodsSchool.Active:=true;
      adodsSchool.Sort:='Cname_zaved';
  end;
  CheckFields;
end;

procedure TfrmAbitCardDialog.dbcbeSchoolRegionChange(Sender: TObject);
begin
If not Floaded then exit;
if fupmoving then dbcbeSchoolDist.KeyValue:=dmAdress.adodsSchoolRaion.FieldByName('ik_region').Value else
  with dmAdress do begin
    adodsSchoolGorod.Active:=false;
        adodsSchool.Active:=false;

    if dbcbeSchoolRegion.KeyValue<>NULL then begin
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where (Ik_raion='''+string(dbcbeSchoolRegion.KeyValue)+''')and(ik_gorod is not null)';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where (Ik_raion='''+string(dbcbeSchoolRegion.KeyValue)+''')and(ik_zaved is not null)';

    end
    else begin
     adodsSchoolGorod.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgorod from SchoolAdressView where ik_gorod is not null';
     adodsSchool.CommandText:='select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_zaved, cname_zaved from SchoolAdressView where ik_zaved is not null';
    end;
    adodsSchoolGorod.Active:=true;
      adodsSchoolGorod.Sort:='Cgorod';
     adodsSchool.Active:=true;
      adodsSchool.Sort:='Cname_zaved';
  end;
end;

procedure TfrmAbitCardDialog.dbdteBirthDateExit(Sender: TObject);
var doubles:integer;
begin
  CheckFields;
{if (eFam.Text<>'') and (eName.Text<>'') and (dbdteBirthDate.Text<>'  .  .    ') then

  with dmAbiturientAction.aspdoubles do
  begin
    Active:=false;
    Parameters[1].Value:=eName.Text;
    Parameters[2].Value:=eFam.Text;
    Parameters[3].Value:=dbdteBirthDate.Value;

    Active:=true;
    doubles:=Fields[0].Value;
  end;

  if doubles>0 then showmessage('Внимание! В базе системы уже присутствует человек с таким именем, фамилией и датой рождения!');
 }
end;

procedure TfrmAbitCardDialog.eBirthPlaceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  CheckFields
end;

procedure TfrmAbitCardDialog.eEmailExit(Sender: TObject);
begin
  inherited;
  CheckFields;
end;

procedure TfrmAbitCardDialog.eFamExit(Sender: TObject);
begin
  inherited;
  CheckFields;
end;

procedure TfrmAbitCardDialog.eFamKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckFields;
end;

procedure TfrmAbitCardDialog.eNameExit(Sender: TObject);
begin
  inherited;
  CheckFields;
end;

procedure TfrmAbitCardDialog.actSpravExecute(Sender: TObject);
begin    
  frmSprav:=TfrmSprav.Create(self);
  frmSprav.Connection:=dm.DBConnect;
  frmsprav.predSprav:=spravhint;
  frmSprav.ShowModal;
  frmSprav.Free;
  FormShow(Sender);
end;

procedure TfrmAbitCardDialog.bbCancelClick(Sender: TObject);
begin
  frmMain.ActiveFrame.Modified:=false;
  close;
end;

procedure TfrmAbitCardDialog.bbSpravMouseEnter(Sender: TObject);
begin
    spravhint:=self.ActiveControl.Hint;
end;

procedure TfrmAbitCardDialog.btnBackClick(Sender: TObject);
begin
  PageControl2.SelectNextPage(False, False);
end;

function TfrmAbitCardDialog.checkDataAbit: boolean;
begin
  result:=true;

  if (Date-StrToDate(dbdteBirthDate.Text))< 14 then
  begin
    result:=false;
    showmessage('Проверьте поле "Дата рождения"!');
    exit;
  end;

  {if length(eCellphone.Text)>50 then
  begin
    result:=false;
    showmessage('Проверьте поле "Сотовый телефон"! Введите не более 50 символов');
    exit;
  end;   }

if (StrToint(eYearFinished.text)-YearOf(dbdteBirthDate.value))< 14 then
begin
  result:=false;
  showmessage('Проверьте поля "Год окончания" и "Дата рождения"!');
  exit;
end;

if length(ePhone.text)>20 then
begin
  result:=false;
  showmessage('Проверьте поле "Телефон"! Введите не более 20 символов');
  exit;
end;

end;

procedure TfrmAbitCardDialog.SetVisiblePage;
begin
  PageControl2.ActivePage.TabVisible := true;
  TabSheet3.TabVisible := PageControl2.ActivePage = TabSheet3;
  TabSheet2.TabVisible := PageControl2.ActivePage = TabSheet2;
  TabSheet4.TabVisible := PageControl2.ActivePage = TabSheet4;
  TabSheet5.TabVisible := PageControl2.ActivePage = TabSheet5;
  btnBack.Enabled := (PageControl2.ActivePageIndex <> 0);
end;

end.
