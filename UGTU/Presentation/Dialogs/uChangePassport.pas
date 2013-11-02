unit uChangePassport;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, uBaseDialog, DBGridEh, StdCtrls, DBLookupEh, Mask,
  DBCtrlsEh, ActnList, Buttons, ExtCtrls, dbtvstudobj;

type
  TfrmChangePassport = class(TfrmBaseDialog)
    eNum: TDBEditEh;
    dbcbeCause: TDBLookupComboboxEh;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label57: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    eSer: TDBEditEh;
    Label3: TLabel;
    Label6: TLabel;
    eWho: TDBEditEh;
    dbdteWhen: TDBDateTimeEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure eNumKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
  student:TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmChangePassport: TfrmChangePassport;

implementation

uses uDMStudentActions, uDMCauses, uDMPrikaz, uMain;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmChangePassport do
begin
if (dbcbeNumPrik.Text='')
or(dbcbeCause.Text='')
or(eNum.Text='      ')
or(eSer.Text='    ')
or(eWho.Text='')
or(dbdteWhen.Text='  .  .    ')
then result:=false
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

procedure TfrmChangePassport.actApplyExecute(Sender: TObject);
begin
dmStudentActions.aspChangePassport.Active:=false;
try
with dmStudentActions.aspChangePassport.Parameters do begin
items[1].Value:=0;
items[2].Value:=dbcbeNumPrik.KeyValue;
items[3].Value:=dbcbeCause.KeyValue;
items[4].Value:=student.RecordbookKey;

items[5].Value:=eNum.Text;
items[6].Value:=eSer.Text;
items[7].Value:={ChangeMonthDayPlaces}(dbdteWhen.Value);
items[8].Value:=eWho.Text;
items[9].Value:=Null;
end;

dmStudentActions.aspChangePassport.ExecProc;

except
showmessage('Неверно заданы параметры!');
end;
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

procedure TfrmChangePassport.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikaz.Active:=true;
dmCauses.adodsCauseChangePass.Active:=true;
dbcbeCause.KeyValue:=15;
end;

procedure TfrmChangePassport.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.execute;
end;

procedure TfrmChangePassport.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;

end;

procedure TfrmChangePassport.dbcbeNumPrikChange(Sender: TObject);
begin
if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;
end;

procedure TfrmChangePassport.eNumKeyPress(Sender: TObject; var Key: Char);
begin
if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

end;



end.
