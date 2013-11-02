unit uChangeLastName;
    {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh, uDm, dbtvStudObj;

type
  TfrmChangeLastName = class(TfrmBaseDialog)
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label2: TLabel;
    Label57: TLabel;
    dbcbeCause: TDBLookupComboboxEh;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    eLastName: TDBEditEh;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure eLastNameExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
  student:TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmChangeLastName: TfrmChangeLastName;

implementation

uses uDMCauses, uDMStudentActions, uDMPrikaz, uMain;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmChangeLastName do
begin
if (dbcbeNumPrik.Text='')
or(dbcbeCause.Text='')
or(eLastName.Text='')
then result:=false
end;
end;

procedure TfrmChangeLastName.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikaz.Active:=true;
dmCauses.adodsCauseLastName.Active:=true;
dbcbeCause.KeyValue:=14;

end;

procedure TfrmChangeLastName.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.execute;
end;

procedure TfrmChangeLastName.actApplyExecute(Sender: TObject);
begin
dmStudentActions.aspChangeLastName.Active:=false;

with dmStudentActions.aspChangeLastName.Parameters do begin
items[1].Value:=0;
items[2].Value:=dbcbeNumPrik.KeyValue;
items[3].Value:=student.RecordbookKey;
items[4].Value:=dbcbeCause.KeyValue;
items[5].Value:=eLastName.Text;
end;

try
dmStudentActions.aspChangeLastName.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

procedure TfrmChangeLastName.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;

end;

procedure TfrmChangeLastName.dbcbeNumPrikChange(Sender: TObject);
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

procedure TfrmChangeLastName.eLastNameExit(Sender: TObject);
var s,sm:string;
begin
  inherited;
  if eLastName.Text<>'' then
 begin
s:=eLastName.Text;
sm:=AnsiUpperCase(s);
s:=AnsiLowerCase(s);
s[1]:=sm[1];
eLastName.Text:=s;
 end;
end;

end.
