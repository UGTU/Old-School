unit uQMAdminTable;
    {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Mask, DBCtrlsEh, ActnList, Buttons, ExtCtrls, uQMDatamodule,
  System.Actions;

type
  TfrmQMAdminTable = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    eName: TDBEditEh;
    eCaption: TDBEditEh;
    procedure actApplyExecute(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQMAdminTable: TfrmQMAdminTable;

implementation

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmQMAdminTable do
begin
if (eName.Text='')
then result:=false
end;
end;

procedure TfrmQMAdminTable.actApplyExecute(Sender: TObject);
begin
if Tag=-1 then begin

QMDataModule.adospQMAddTable.Active:=false;

with QMDataModule.adospQMAddTable.Parameters do begin
items[1].Value:=eName.Text;
if eCaption.Text='' then
items[2].Value:=eName.Text else
items[2].Value:=eCaption.Text;
end;

try
QMDataModule.adospQMAddTable.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;

end else
begin
QMDataModule.adospQMEditTable.Active:=false;

with QMDataModule.adospQMEditTable.Parameters do begin
items[1].Value:=Tag;
items[2].Value:=eName.Text;
if eCaption.Text='' then
items[3].Value:=eName.Text else
items[3].Value:=eCaption.Text;
end;

try
QMDataModule.adospQMEditTable.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;
end;
end;


procedure TfrmQMAdminTable.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
Close;
end;

procedure TfrmQMAdminTable.eNameChange(Sender: TObject);
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
