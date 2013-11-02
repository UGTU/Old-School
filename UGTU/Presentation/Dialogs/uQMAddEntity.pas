unit uQMAddEntity;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DB, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons,
  ExtCtrls, uQueryMaster, uQMDataModule, ComCtrls;

type
  TfrmQMAddEntity = class(TfrmBaseDialog)
    dbgeEntities: TDBGridEh;
    dsEntities: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgeFields: TDBGridEh;
    dsFields: TDataSource;
    procedure bbCancelClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
  hostForm: TfrmQueryMaster;
    { Public declarations }
  end;

var
  frmQMAddEntity: TfrmQMAddEntity;

implementation

{$R *.dfm}

procedure TfrmQMAddEntity.actApplyExecute(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  ik:integer;
begin
if PageControl1.ActivePageIndex=0 then begin

  SearchOptions := [loPartialKey];
ik:=QMDataModule.adodsQMAllFields.FieldByName('ik_table').Value;
QMDataModule.adodsQMTables.Locate('ik_table', ik, SearchOptions);
end;

if hostForm.QueryController<>nil then begin
hostForm.QueryController.DirectFieldsDataset;
hostForm.QueryController.CreateEntity(true);
end;
if PageControl1.ActivePageIndex=0 then
hostForm.QueryController.FieldByIK(QMDataModule.adodsQMAllFields.FieldByName('ik_field').Value).Check;
hostForm.imQuery.Repaint;
end;

procedure TfrmQMAddEntity.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;
end;

procedure TfrmQMAddEntity.bbCancelClick(Sender: TObject);
begin
  inherited;
close;
end;

end.
