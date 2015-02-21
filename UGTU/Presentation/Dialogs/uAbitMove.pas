unit uAbitMove;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Mask, adodb, ApplicationController, ExceptionBase,
  System.Actions;

type
  TfrmAbitMove = class(TfrmBaseDialog)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    dbcbeRecruit: TDBLookupComboboxEh;
    dbcbeCategory: TDBLookupComboboxEh;
    dbdteList: TDBDateTimeEditEh;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbcbeRecruitNew: TDBLookupComboboxEh;
    dbcbeCategoryNew: TDBLookupComboboxEh;
    dbdteListNew: TDBDateTimeEditEh;
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
     private
    { Private declarations }
  public
  IDStudent:integer;
  NNAbit:integer;
    { Public declarations }
  end;

var
  frmAbitMove: TfrmAbitMove;
  RegNumber: integer;

implementation

uses uDM, uDMStudentData, uDMAbiturientAction;
{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmAbitMove do
begin
if (RegNumber<1)
or(dbcbeRecruit.Text='')
or(dbcbeCategory.Text='')
 or(dbdteList.Text='  .  .    ') then result:=false;
end;
end;

procedure TfrmAbitMove.FormShow(Sender: TObject);
begin
{with dmStudentData do begin
  adodsKatZach.Active:=false;
  adodsKatZach.Active:=true;
end;}

dmStudentData.aspGetAbitCat.Active:=false;
dmStudentData.aspGetAbitCat.Parameters[1].Value:=strtoint(Hint);
dmStudentData.aspGetAbitCat.Active:=true;

  dm.adodsNabor.Active:=false;
  dm.adodsNabor.CommandType:=cmdText;
  dm.adodsNabor.CommandText:='select * from Tree_abit_Specialties where NNYear='''+Hint+''' order by Cshort_name_fac, Cname_spec';
  dm.adodsNabor.Active:=true;

dm.adodsPostupView.Active:=false;
dm.adodsPostupView.CommandType:=cmdText;
dm.adodsPostupView.CommandText:='select * from Abit_Postup_View where NN_Abit='''+inttostr(NNAbit)+'''';
dm.adodsPostupView.Active:=true;

if (dm.adodsPostupView.RecordCount>0) then begin
dm.adodsPostupView.First;

if dm.adodsPostupView.fieldvalues['RegNomer']<>Null then
begin
RegNumber:=dm.adodsPostupView.FieldValues['RegNomer'];
Text:= 'Перевод заявления абитуриента №'+IntToStr(RegNumber)+' на другую специальность';
end;
if dm.adodsPostupView.FieldValues['NNRecord']<>Null then
dbcbeRecruit.keyvalue:=dm.adodsPostupView.FieldValues['NNRecord'];
if dm.adodsPostupView.FieldValues['ik_kat_zach']<>Null then
dbcbeCategory.keyvalue:=dm.adodsPostupView.FieldValues['ik_kat_zach'];
if dm.adodsPostupView.FieldValues['dd_pod_zayav']<>Null then
dbdteList.value:=dm.adodsPostupView.FieldValues['dd_pod_zayav'];

//заполняем поля нового заявления

if dm.adodsPostupView.FieldValues['ik_kat_zach']<>Null then
dbcbeCategoryNew.keyvalue:=dm.adodsPostupView.FieldValues['ik_kat_zach'];
dbdteListNew.value:=Date;
end;
end;

procedure TfrmAbitMove.actOKExecute(Sender: TObject);
begin
dmAbiturientAction.aspAbitMove.Active:=false;

      with dmAbiturientAction.aspAbitMove.Parameters do
      begin
        items[1].Value:=NNAbit;
        items[2].Value:=dbcbeRecruitNew.KeyValue;
        items[3].Value:=RegNumber;
        items[4].Value:=dbcbeCategoryNew.KeyValue;
        items[5].Value:=dbdteListNew.Value;

      end;
try
      dmAbiturientAction.aspAbitMove.ExecProc;
      close;
except
      on E:Exception do
      raise EApplicationException.Create('Введены неверные данные',E);
end;
end;



end.
