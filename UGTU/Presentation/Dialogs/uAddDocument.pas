unit uAddDocument;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uDMStudentData,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, uStuddlg;

type
  TfrmAddDocument = class(TfrmBaseDialog)
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    dbcbeKind: TDBLookupComboboxEh;
    Label3: TLabel;
    eSer: TDBEditEh;
    Label6: TLabel;
    eNum: TDBEditEh;
    Label11: TLabel;
    Label4: TLabel;
    eWho: TDBEditEh;
    dbdteGetDate: TDBDateTimeEditEh;
    actCheckFields: TAction;
    procedure FormShow(Sender: TObject);
    procedure actCheckFieldsUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeKindChange(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
  studDlg:TftmStudent;
    { Public declarations }
  end;

var
  frmAddDocument: TfrmAddDocument;

implementation

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmAddDocument do
begin
if (dbcbeKind.Text='')
or(eSer.Text='')
or(eNum.Text='')
then result:=false
end;
end;

procedure TfrmAddDocument.actApplyExecute(Sender: TObject);
var rowsc:integer;
begin

with StudDlg.sgDocs do
begin
rowsc:=RowCount-1;
cells[0,rowsc]:=dbcbeKind.Text;
Cells[1,rowsc]:=eSer.Text;
Cells[2,rowsc]:=eNum.Text;
if not (dbdteGetDate.value=Null) then
if not ((DateToStr(dbdteGetDate.value))='  .  .    ') then
Cells[3,rowsc]:=DateToStr(dbdteGetDate.value);

cells[4,rowsc]:=eWho.Text;

RowCount:=RowCount+1;
end;
with StudDlg.sgDocKeys do
begin
rowsc:=RowCount-1;

if not (dbcbeKind.KeyValue=NULL) then
Cells[1,rowsc]:=dbcbeKind.KeyValue;
RowCount:=RowCount+1;
end;
end;

procedure TfrmAddDocument.actCheckFieldsUpdate(Sender: TObject);
begin
  inherited;
if (eNum.Text='')
or (dbcbeKind.Text='')
or (eSer.Text='')
then begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end
else begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end;
end;

procedure TfrmAddDocument.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmAddDocument.bbApplyClick(Sender: TObject);
var rowsc:integer;
begin

with StudDlg.sgDocs do
begin
rowsc:=RowCount-1;
cells[0,rowsc]:=dbcbeKind.Text;
Cells[1,rowsc]:=eSer.Text;
Cells[2,rowsc]:=eNum.Text;
if not (dbdteGetDate.value=Null) then
if not ((DateToStr(dbdteGetDate.value))='  .  .    ') then
Cells[3,rowsc]:=DateToStr(dbdteGetDate.value);

cells[4,rowsc]:=eWho.Text;

RowCount:=RowCount+1;
end;
with StudDlg.sgDocKeys do
begin
rowsc:=RowCount-1;

if not (dbcbeKind.KeyValue=NULL) then
Cells[1,rowsc]:=dbcbeKind.KeyValue;
RowCount:=RowCount+1;
end;

dbcbeKind.value:=-1;
eSer.Text:='';
eWho.Text:='';
dbdteGetDate.text:='  .  .    ';
eNum.Text:='';
end;

procedure TfrmAddDocument.bbOKClick(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmAddDocument.dbcbeKindChange(Sender: TObject);
begin

if checkFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end
else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

end;

procedure TfrmAddDocument.FormShow(Sender: TObject);
begin
dmStudentData.adodsDocType.Active:=true;

end;

end.
