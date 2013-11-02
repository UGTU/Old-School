unit uQMAdminField;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, Mask, ActnList, Buttons, ExtCtrls, uQMDatamodule,
  DBGridEh, DBLookupEh, DB;

type
  TfrmQMAdminField = class(TfrmBaseDialog)
    eName: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    eCaption: TDBEditEh;
    Label3: TLabel;
    cbVisible: TCheckBox;
    dbcbeTable: TDBLookupComboboxEh;
    dsTable: TDataSource;
    procedure actApplyExecute(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQMAdminField: TfrmQMAdminField;

implementation

{$R *.dfm}
function CheckFields:boolean;
begin
result:=true;
with frmQMAdminField do
begin
if (eName.Text='')or
(dbcbeTable.Text='')
then result:=false
end;
end;

procedure TfrmQMAdminField.actApplyExecute(Sender: TObject);
begin
 if Tag=-1 then begin

QMDataModule.adospQMAddField.Active:=false;

with QMDataModule.adospQMAddField.Parameters do begin
items[1].Value:=dbcbeTable.KeyValue;
items[2].Value:=eName.Text;
if eCaption.Text='' then
items[3].Value:=eName.Text else
items[3].Value:=eCaption.Text;
items[4].Value:=cbVisible.Checked;
end;

try
QMDataModule.adospQMAddField.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;

end else
begin
QMDataModule.adospQMEditField.Active:=false;

with QMDataModule.adospQMEditField.Parameters do begin
items[1].Value:=Tag;
items[2].Value:=dbcbeTable.KeyValue;
items[3].Value:=eName.Text;
if eCaption.Text='' then
items[3].Value:=eName.Text else
items[4].Value:=eCaption.Text;
items[5].Value:=cbVisible.Checked;
end;

try
QMDataModule.adospQMEditField.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;
end;

end;

procedure TfrmQMAdminField.actApplyUpdate(Sender: TObject);
begin
 if Checkfields then
begin
 actApply.enabled:=true;
 actOk.enabled:=true;
end else begin
 actApply.enabled:=false;
 actOk.enabled:=false;
end;

end;

procedure TfrmQMAdminField.actOKExecute(Sender: TObject);
begin
actApply.execute;
close;
end;

end.
