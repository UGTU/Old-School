unit uPrikDlg;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, uDM, DBGridEh, DBLookupEh;

type
  TftmPrikaz = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label1: TLabel;
    dbdtePrikDate: TDBDateTimeEditEh;
    Label2: TLabel;
    dbdteVstDate: TDBDateTimeEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eNum: TDBEditEh;
    Label7: TLabel;
    dbcbePrikType: TDBLookupComboboxEh;
    Label8: TLabel;

    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure eNumChange(Sender: TObject);
    procedure dbdtePrikDateChange(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  end;

var
  ftmPrikaz: TftmPrikaz;

implementation

uses ADODB, uStudDlg, uDMPrikaz;

function CheckFields:boolean;
begin
result:=true;
with ftmPrikaz do
begin
if (eNum.Text='')
or(dbdtePrikDate.Text='  .  .    ')
or(dbcbePrikType.Text='')
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

{$R *.dfm}


function TftmPrikaz.DoApply: boolean;
begin
  result:=true;
end;

function TftmPrikaz.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TftmPrikaz.actApplyExecute(Sender: TObject);
begin
try
   dmPrikaz.aspPrikaz.Active:=false;
  with dmPrikaz.aspPrikaz.Parameters do
  begin
  clear;
   AddParameter;
   if tag=0 then
  Items[0].Value:=1 else
  Items[0].Value:=0;
  AddParameter;
  Items[1].Value:=eNum.Value;
  AddParameter;
    if not (DateToStr(dbdtePrikDate.Value)='  .  .    ') then
  Items[2].Value:=(dbdtePrikDate.Value)else
  Items[2].Value:=NULL;
  AddParameter;
    if not (DateToStr(dbdteVstDate.Value)='  .  .    ') then
  Items[3].Value:=(dbdteVstDate.Value)else
  Items[3].Value:=NULL;
    AddParameter;
  Items[4].Value:=Tag;

   AddParameter;
  Items[5].Value:=dbcbePrikType.KeyValue;
   end;
  dmPrikaz.aspPrikaz.ExecProc;
  except
  ShowMessage('Неверно заданы параметры!');
  end;
   dmPrikaz.adodsPrikaz.Active:=false;
   dmPrikaz.adodsPrikaz.Active:=true;

end;

procedure TftmPrikaz.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikType.Active:=true;
end;

procedure TftmPrikaz.actOKExecute(Sender: TObject);
begin
actApplyExecute(Sender);
close;
end;

procedure TftmPrikaz.eNumChange(Sender: TObject);
begin
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


procedure TftmPrikaz.dbdtePrikDateChange(Sender: TObject);
begin
ENumChange(sender);
dbdteVstDate.Value:=dbdtePrikDate.Value;
end;

end.
