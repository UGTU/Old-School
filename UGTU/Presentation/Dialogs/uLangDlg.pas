unit uLangDlg;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, uDM, udmStudentData, uStudDlg;

type
  TftmLangDialog = class(TfrmBaseDialog)
    dbcbeLang: TDBLookupComboboxEh;
    Label1: TLabel;
    dbcbeStepVlad: TDBLookupComboboxEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    actCheckFields: TAction;
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actCheckFieldsExecute(Sender: TObject);
  private
    { Private declarations }
  public
  StudDlg:TftmStudent;
    { Public declarations }
  end;

var
  ftmLangDialog: TftmLangDialog;


implementation

{$R *.dfm}

procedure TftmLangDialog.actApplyExecute(Sender: TObject);
var rowsc:integer;
begin
 // inherited;
with StudDlg.sgLang do
begin
rowsc:=RowCount-1;
cells[0,rowsc]:=dbcbeLang.Text;
Cells[1,rowsc]:=dbcbeStepVlad.Text;
RowCount:=RowCount+1;
end;
with StudDlg.sgLangKeys do
begin
rowsc:=RowCount-1;

Cells[1,rowsc]:=dbcbeLang.KeyValue;
Cells[2,rowsc]:=dbcbeStepVlad.KeyValue;

RowCount:=RowCount+1;
end;


end;

procedure TftmLangDialog.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  Close;
end;

procedure TftmLangDialog.actCheckFieldsExecute(Sender: TObject);
begin
if (dbcbeStepVlad.Text='')
or (dbcbeLang.Text='')
then begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end
else begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end;
end;

end.
