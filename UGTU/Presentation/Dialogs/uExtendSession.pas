unit uExtendSession;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, dbtvStudObj,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, System.Actions;

type
  TfrmExtendSession = class(TfrmBaseDialog)
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label2: TLabel;
    Label57: TLabel;
    Label1: TLabel;
    dbcbeCause: TDBLookupComboboxEh;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    dbdteTerm: TDBDateTimeEditEh;
    Label3: TLabel;
    Label4: TLabel;
    eDescription: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    procedure actApplyUpdate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    student:TDBNodeStudObject;
  end;

var
  frmExtendSession: TfrmExtendSession;


implementation

uses uDMCauses, uDMStudentActions, uDMPrikaz, uMain, uDMStudentSelectionProcs;
{$R *.dfm}

procedure TfrmExtendSession.actApplyUpdate(Sender: TObject);
begin
if (dbcbeNumPrik.KeyValue<0)or
(dbdteTerm.Text = '  .  .    ')or
(dbcbeCause.KeyValue<0) then
begin
actApply.Enabled:=false;
actOK.Enabled:=false;
end
else
begin
actApply.Enabled:=true;
actOK.Enabled:=true;
end;
end;

procedure TfrmExtendSession.actOKExecute(Sender: TObject);
begin
 dmStudentActions.aspExtendSession.Active:=false;

with dmStudentActions.aspExtendSession.Parameters do
begin
items[1].Value:=dbcbeNumPrik.KeyValue;
items[2].Value:=student.RecordbookKey;
items[3].Value:=dbcbeCause.KeyValue;
items[4].Value:=dbdteTerm.Text;
items[5].Value:=eDescription.Text;
end;
Close;
try
dmStudentActions.aspExtendSession.ExecProc;
dmStudentSelectionProcs.aspSelExtendedSessions.Active:=false;
dmStudentSelectionProcs.aspSelExtendedSessions.Active:=true;
except
showmessage('Неверно заданы параметры!');
end;

end;

procedure TfrmExtendSession.FormShow(Sender: TObject);
begin

dmPrikaz.adodsPrikaz.Active:=true;
dmCauses.adodsSessionExtendCauses.Active:=true;
end;

procedure TfrmExtendSession.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.execute;
end;

end.
