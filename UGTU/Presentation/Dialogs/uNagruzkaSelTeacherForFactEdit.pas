unit uNagruzkaSelTeacherForFactEdit;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DBLookupEh, ActnList, Buttons, ADODB, GeneralController, DB;

type
  TfrmNagruzkaSelTeacherForFactEdit = class(TfrmBaseDialog)
    dbcbPrep: TDBLookupComboboxEh;
    Image2: TImage;
    StaticText1: TStaticText;
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  protected  
    function DoApply:boolean; override;
    function DoCancel:boolean; override;
  public
    procedure Read(ATeacherList: TADODataSet; DefaultTeacherIK: integer);
  end;

var
  frmNagruzkaSelTeacherForFactEdit: TfrmNagruzkaSelTeacherForFactEdit;

implementation

{$R *.dfm}

{ TfrmNagruzkaSelTeacherForFactEdit }

procedure TfrmNagruzkaSelTeacherForFactEdit.actOKExecute(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrmNagruzkaSelTeacherForFactEdit.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled:= dbcbPrep.KeyValue <> NULL;
end;

function TfrmNagruzkaSelTeacherForFactEdit.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaSelTeacherForFactEdit.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaSelTeacherForFactEdit.Read(ATeacherList: TADODataSet; DefaultTeacherIK: integer);
begin
  dbcbPrep.KeyField:= 'ik_id_prepod';
  dbcbPrep.ListField:= 'FIO';
  dbcbPrep.ListSource:= TDataSource.Create(nil);
  dbcbPrep.ListSource.DataSet:= ATeacherList;
  if ATeacherList.Locate('ik_id_prepod', DefaultTeacherIK, [loPartialKey]) then
    dbcbPrep.KeyValue:= DefaultTeacherIK;
end;

end.
