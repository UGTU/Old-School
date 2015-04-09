unit uAddress;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh,
  ActnList, Buttons, ExtCtrls, uDMAdress, DBTVStudObj, System.Actions;

type
  TfrmAddress = class(TfrmBaseDialog)
    dbcbeStreet: TDBLookupComboboxEh;
    Label14: TLabel;
    dbcbePoint: TDBLookupComboboxEh;
    eHouse: TDBEditEh;
    eFlat: TDBEditEh;
    eIndex: TDBEditEh;
    Label19: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dbcbeDist: TDBLookupComboboxEh;
    Label11: TLabel;
    dbcbeReg: TDBLookupComboboxEh;
    Label10: TLabel;
    dbcbeCountry: TDBLookupComboboxEh;
    Label9: TLabel;
    Label7: TLabel;
    dbcbeAddressType: TDBLookupComboboxEh;
    Label1: TLabel;
    eBuilding: TDBEditEh;
    Label2: TLabel;
    dbdteBegin: TDBDateTimeEditEh;
    dbdteEnd: TDBDateTimeEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label46: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbcbeCountryChange(Sender: TObject);
    procedure dbcbeRegChange(Sender: TObject);
    procedure dbcbeDistChange(Sender: TObject);
    procedure dbcbePointChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
  private
    { Private declarations }
  public
    EditMode:boolean;
    DlgOwner:boolean;
    IdStudent:integer;
    AddressKey:integer;
    { Public declarations }
  end;

var
  frmAddress: TfrmAddress;

implementation

uses uStudDlg, uAbitDialog, ConstantRepository;

{$R *.dfm}

procedure TfrmAddress.actApplyExecute(Sender: TObject);
var adr:TaddressRecord;
begin
if DlgOwner then
begin
adr:=TAddressRecord.Create(dbcbeAddressType.KeyValue, dbcbeStreet.KeyValue, eHouse.Text, eBuilding.Text, eFlat.Text, eIndex.Text,
dbdteBegin.text, dbdteEnd.text, dbcbeAddressType.Text, dbcbeCountry.Text, dbcbeReg.Text, dbcbeDist.Text, dbcbePoint.text, dbcbeStreet.Text);

    if (Owner is TftmStudent) then
    begin
      (Owner as TftmStudent).AddressRecordList.Add(adr);
      (Owner as TftmStudent).SyncAddress;
    end;

end
else
  if EditMode then begin
    with dmAdress.aspEditAddress do
    begin
      Parameters[1].Value := dbcbeAddressType.KeyValue;
      Parameters[2].Value := dbcbeStreet.KeyValue;
      Parameters[3].Value := eHouse.text;
      Parameters[4].Value := eBuilding.Text;
      Parameters[5].Value := eFlat.Text;
      Parameters[6].Value := eIndex.Text;
      Parameters[7].Value := dbdteBegin.value;
      Parameters[8].Value := dbdteEnd.value;
      Parameters[9].Value := AddressKey;
    end;
    dmAdress.aspEditAddress.ExecProc;
  end
  else
  begin
    with dmAdress.aspAddAddress do
    begin
      Parameters[1].value := IdStudent;
      Parameters[2].Value := dbcbeAddressType.KeyValue;
      Parameters[3].Value := dbcbeStreet.KeyValue;
      Parameters[4].Value := eHouse.text;
      Parameters[5].Value := eBuilding.Text;
      Parameters[6].Value := eFlat.Text;
      Parameters[7].Value := eIndex.Text;
      Parameters[8].Value := dbdteBegin.value;
      Parameters[9].Value := dbdteEnd.value;
    end;
      dmAdress.aspAddAddress.ExecProc;
  end;

end;

procedure TfrmAddress.actApplyUpdate(Sender: TObject);
begin
  actApply.Enabled := (dbcbeAddressType.Text<>'')and(dbcbeStreet.Text<>'');
end;

procedure TfrmAddress.actOKExecute(Sender: TObject);
begin
  inherited;
  actApplyExecute(Sender);
  Close;
end;

procedure TfrmAddress.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := (dbcbeAddressType.Text<>'')and(dbcbeStreet.Text<>'');
end;

procedure TfrmAddress.actSpravExecute(Sender: TObject);
begin
  inherited;
  with dmAdress do begin
  if adodsStrana.Active then
  begin
  adodsStrana.Active:=false;
  adodsStrana.Active:=true;
  end;
  if adodsRegion.Active then
  begin
  adodsRegion.Active:=false;
  adodsRegion.Active:=true;
  end;
  if adodsRaion.Active then
  begin
  adodsRaion.Active:=false;
  adodsRaion.Active:=true;
  end;
  if adodsGorod.Active then
  begin
  adodsGorod.Active:=false;
  adodsGorod.Active:=true;
  end;
  if adodsStreet.Active then
  begin
  adodsStreet.Active:=false;
  adodsStreet.Active:=true;
  end;
  end;
end;

procedure TfrmAddress.dbcbeCountryChange(Sender: TObject);
begin
 with dmAdress do begin
  adodsRegion.Active:=false;
  adodsRaion.Active:=false;
  adodsGorod.Active:=false;
  adodsStreet.Active:=false;
  if dbcbeCountry.KeyValue<>NULL then begin
  adodsRegion.CommandText:='select Region.Ik_strana,IK_Region,CRegion from Region  where Ik_strana='''+string(dbcbeCountry.KeyValue)+'''';
  adodsRegion.Active:=true;
  adodsRegion.Sort := 'CRegion';
  end;
  end;
end;

procedure TfrmAddress.dbcbeDistChange(Sender: TObject);
begin

 with dmAdress do begin
 adodsGorod.Active:=false;
 adodsStreet.Active:=false;
   if dbcbeDist.KeyValue<>NULL then begin
   adodsGorod.CommandText:='select Ik_raion,IK_gorod,CGorod,CIndex from Gorod  where Ik_raion='''+string(dbcbeDist.KeyValue)+'''';
   adodsGorod.Active:=true;
   adodsGorod.Sort := 'CGorod';
  end;
 end;

end;

procedure TfrmAddress.dbcbePointChange(Sender: TObject);
begin

 with dmAdress do begin
adodsStreet.Active:=false;
   if dbcbePoint.KeyValue<>NULL then begin
   adodsStreet.CommandText:='select Ik_street,IK_gorod,CStreet from Street where Ik_gorod='''+string(dbcbePoint.KeyValue)+'''';
   adodsStreet.Active:=true;
   adodsStreet.Sort := 'CStreet';
  end;
 end;

end;

procedure TfrmAddress.dbcbeRegChange(Sender: TObject);
begin

  with dmAdress do begin
  adodsRaion.Active:=false;
  adodsGorod.Active:=false;
  adodsStreet.Active:=false;
 if dbcbeReg.KeyValue<>NULL then begin
   adodsRaion.CommandText:='select Ik_raion,IK_Region,CRaion from Raion  where Ik_region='''+string(dbcbeReg.KeyValue)+'''';
   adodsRaion.Active:=true;
   adodsRaion.Sort:='CRaion';
 end;
  end;
end;

procedure TfrmAddress.FormShow(Sender: TObject);
begin
  dmAdress.adsAddressType.Active:=true;
  if not EditMode then
  begin
    dmAdress.adodsStrana.Active:=true;
    dmAdress.adodsStrana.Sort := 'CStrana';
    if dbcbeCountry.KeyValue<0 then dbcbeCountry.KeyValue:=2;
    if dbcbeReg.KeyValue<0 then dbcbeReg.KeyValue:=1;
    if dbcbeDist.KeyValue<0 then dbcbeDist.KeyValue:=45;
    if dbcbePoint.KeyValue<0 then dbcbePoint.KeyValue:=504;
    dbcbeAddressType.KeyValue := TypeAddressPropiska;
  end;

  if dlgOwner then
  begin
    bbApply.Visible:=true;
    bbOK.Visible:=false;
    bbApply.Caption:='Добавить';
    bbCancel.Caption:='Закрыть';
  end;

end;

end.
