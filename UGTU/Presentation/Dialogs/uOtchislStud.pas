unit uOtchislStud;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh,
  ActnList, Buttons, ExtCtrls, DBTVStudObj,DBTVGroupObj, ExceptionBase;

type
  TfrmOtchislStud = class(TfrmBaseDialog)
    Label2: TLabel;
    Label57: TLabel;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label1: TLabel;
    Label5: TLabel;
    dbcbeCause: TDBLookupComboboxEh;
    Label4: TLabel;
    eOtchObosn: TMemo;
    SpeedButton2: TSpeedButton;

    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure eOtchObosnEnter(Sender: TObject);
    procedure eOtchObosnExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

    { Private declarations }
  public
    Student:TDBNodeStudObject;{ Public declarations }
  end;

var
  frmOtchislStud: TfrmOtchislStud;

implementation

  uses uDM, uDMStudentActions, uDMCauses, uDMPrikaz, uMain;
{$R *.dfm}
function CheckFields:boolean;
begin
result:=true;
with frmOtchislStud do
begin
if (dbcbeNumPrik.Text='')
or(dbcbeCause.Text='')
then result:=false
end;
end;


procedure TfrmOtchislStud.actApplyExecute(Sender: TObject);
vAR ndGroup:TDBNodeGroupObject;
begin

dmStudentActions.aspAppendStudGroup.Active:=false;

with dmStudentActions.aspAppendStudGroup.Parameters do begin
items[1].Value:=3;
ndGroup:=(Student.Node.Parent.Data);
items[2].Value:=ndGroup.ik;
items[3].Value:=student.RecordbookKey;
if student.CategoryID>0 then
  items[4].Value:=student.CategoryID
else
  items[4].Value:=null;
if student.OrderEnterId>0 then
  items[5].Value:=student.OrderEnterId
else
  items[5].Value:=null;
items[6].Value:=student.CauseEnterID;
items[7].Value:=dbcbeNumPrik.KeyValue;
items[8].Value:=dbcbeCause.KeyValue;
items[9].Value:=Null;
items[10].Value:=eOtchObosn.Text;
items[11].Value:=student.StudGrupKey;
end;

try
dmStudentActions.aspAppendStudGroup.ExecProc;
except
on E:Exception do
raise EApplicationException.Create('Неверно заданы параметры!', E);
end;
end;

procedure TfrmOtchislStud.FormShow(Sender: TObject);
begin
 dmCauses.adodsExCause.Active:=true;
 dmPrikaz.adodsPrikaz.Active:=true;

end;

procedure TfrmOtchislStud.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.Execute;

end;

procedure TfrmOtchislStud.dbcbeNumPrikChange(Sender: TObject);
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

procedure TfrmOtchislStud.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;
end;

procedure TfrmOtchislStud.eOtchObosnEnter(Sender: TObject);
begin
eOtchObosn.BevelKind:=bkSoft;

end;

procedure TfrmOtchislStud.eOtchObosnExit(Sender: TObject);
begin
eOtchObosn.BevelKind:=bkNone;

end;


end.
