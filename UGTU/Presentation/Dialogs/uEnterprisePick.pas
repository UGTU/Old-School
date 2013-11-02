unit uEnterprisePick;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons, ExtCtrls,
  uDMStudentData, uStudDlg;

type
  TfrmEnterprisePick = class(TfrmBaseDialog)
    DBGridEh1: TDBGridEh;
    procedure actOKExecute(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
  frmHost:TftmStudent;
    { Public declarations }
  end;

var
  frmEnterprisePick: TfrmEnterprisePick;

implementation

{$R *.dfm}

procedure TfrmEnterprisePick.actOKExecute(Sender: TObject);
begin
frmHost.dbcbeEnterprise.KeyValue:=dmStudentData.adodsEnterprise.FieldByName('ik_pred').Value;
close;
end;

procedure TfrmEnterprisePick.DBGridEh1DblClick(Sender: TObject);
begin
 actOKExecute(Sender);
end;

procedure TfrmEnterprisePick.DBGridEh1TitleClick(Column: TColumnEh);
begin
 dmStudentData.adodsEnterprise.Sort:='['+Column.FieldName+']';
end;

end.
