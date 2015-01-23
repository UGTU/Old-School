unit uQMAdminRelation;
    {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uQMDatamodule,
  DBGridEh, DB, Mask, DBCtrlsEh, DBLookupEh, adodb, udm, System.Actions;

type
  TfrmQMAdminRelation = class(TfrmBaseDialog)
    dbcbeTable1: TDBLookupComboboxEh;
    Label3: TLabel;
    dbcbeTable2: TDBLookupComboboxEh;
    Label1: TLabel;
    dbcbeField1: TDBLookupComboboxEh;
    Label2: TLabel;
    dbcbeField2: TDBLookupComboboxEh;
    Label4: TLabel;
    dsTable1: TDataSource;
    dsTable2: TDataSource;
    dsField2: TDataSource;
    dsField1: TDataSource;
    procedure dbcbeTable2Change(Sender: TObject);
    procedure dbcbeTable1Change(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQMAdminRelation: TfrmQMAdminRelation;

implementation

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmQMAdminRelation do
begin
if (dbcbeField1.Text='')or
(dbcbeField2.Text='')
then result:=false
end;
end;

procedure TfrmQMAdminRelation.actApplyExecute(Sender: TObject);
begin
QMDataModule.adospQMAddRelation.Active:=false;

with QMDataModule.adospQMAddRelation.Parameters do begin
items[1].Value:=dbcbeField1.KeyValue;
items[2].Value:=dbcbeField2.KeyValue;
end;

try
QMDataModule.adospQMAddRelation.ExecProc;
except
showmessage('Неверно заданы параметры!');
end;
end;

procedure TfrmQMAdminRelation.actApplyUpdate(Sender: TObject);
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

procedure TfrmQMAdminRelation.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
Close;
end;

procedure TfrmQMAdminRelation.dbcbeTable1Change(Sender: TObject);
begin
if dbcbeTable1.Text='' then exit;

if dsField1.DataSet=nil then begin
dsField1.DataSet:=TAdoDataset.Create(Self);
TAdodataset(dsField1.DataSet).Connection:=dm.DBConnect;

end;
TAdodataset(dsField1.DataSet).close;
TAdodataset(dsField1.DataSet).CommandText:='select * from QM_Fields where ik_table='''+inttostr(dbcbeTable1.KeyValue)+'''';
TAdodataset(dsField1.DataSet).Open;
end;

procedure TfrmQMAdminRelation.dbcbeTable2Change(Sender: TObject);
begin
if dbcbeTable2.Text='' then exit;

if dsField2.DataSet=nil then begin
dsField2.DataSet:=TAdoDataset.Create(Self);
TAdodataset(dsField2.DataSet).Connection:=dm.DBConnect;

end;
TAdodataset(dsField2.DataSet).close;
TAdodataset(dsField2.DataSet).CommandText:='select * from QM_Fields where ik_table='''+inttostr(dbcbeTable2.KeyValue)+'''';
TAdodataset(dsField2.DataSet).Open;
end;

end.
