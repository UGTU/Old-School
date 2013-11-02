unit uAcademReturn;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask,
  DBLookupEh, ActnList, Buttons, ExtCtrls,dbtvStudobj,dbtvgroupobj;

type
  TfrmAcademReturn = class(TfrmBaseDialog)
    Label2: TLabel;
    Label57: TLabel;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label4: TLabel;
    Label1: TLabel;
    ezachObosn: TMemo;
    sbAddPrikaz: TSpeedButton;
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure sbAddPrikazClick(Sender: TObject);
  private
    { Private declarations }
  public
  Student:TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmAcademReturn: TfrmAcademReturn;

implementation

uses uDMStudentActions, uDMPrikaz, uMain;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmAcademReturn do
begin
if (dbcbeNumPrik.Text='')
then result:=false
end;
end;

procedure TfrmAcademReturn.actApplyExecute(Sender: TObject);
begin
// not implemented yet
dmStudentActions.aspacademreturn.Active:=false;
with dmStudentActions.aspAcademreturn.Parameters do begin
items[1].Value:=Tag;
items[2].Value:=dbcbeNumprik.KeyValue;

end;

try
dmStudentActions.aspAcademreturn.ExecProc;


except
showmessage('Неверно заданы параметры!');
end;
end;


procedure TfrmAcademReturn.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikaz.Active:=false;
dmPrikaz.adodsPrikaz.Active:=true;
end;

procedure TfrmAcademReturn.sbAddPrikazClick(Sender: TObject);
begin
  frmMain.actAddPrikaz.Execute;
end;

procedure TfrmAcademReturn.dbcbeNumPrikChange(Sender: TObject);
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

procedure TfrmAcademReturn.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;

end;

end.
