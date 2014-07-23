unit uRelativeDlg;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask,
  DBLookupEh, ActnList, Buttons, ExtCtrls, uStudDlg, System.Actions;

type
  TftmAddRelative = class(TfrmBaseDialog)
    dbcbeKind: TDBLookupComboboxEh;
    dbcbePlace: TDBLookupComboboxEh;
    eFIO: TDBEditEh;
    ePost: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbdteBirth: TDBDateTimeEditEh;
    eAdress: TDBEditEh;
    actCheckFields: TAction;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    ePhone: TDBEditEh;
    eWorkPhone: TDBEditEh;
    procedure FormShow(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actCheckFieldsExecute(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);


  private
    { Private declarations }
  public
  StudDlg:TftmStudent;  { Public declarations }
  end;

var
  ftmAddRelative: TftmAddRelative;

implementation

uses uDMStudentData;

{$R *.dfm}

procedure TftmAddRelative.FormShow(Sender: TObject);
begin
  inherited;
dmStudentData.adodsEnterprise.Active:=false;
dmStudentData.adodsRelative.Active:=false;
dmStudentData.adodsEnterprise.Active:=true;
dmStudentData.adodsRelative.Active:=true;

end;

procedure TftmAddRelative.actApplyExecute(Sender: TObject);
var rowsc:integer;
begin
 // inherited;
  with StudDlg.sgRelatives do
  begin
    rowsc:=RowCount-1;
    cells[0,rowsc]:=eFio.Text;
    Cells[1,rowsc]:=dbcbeKind.Text;
    if not (dbdteBirth.value=Null) then
      if not ((DateToStr(dbdteBirth.value))='  .  .    ') then
        Cells[2,rowsc]:=DateToStr(dbdteBirth.value);

    cells[3,rowsc]:=dbcbePlace.Text;
    Cells[4,rowsc]:=ePost.Text;
    Cells[5,rowsc]:=ePhone.Text;
    Cells[6,rowsc]:=eAdress.Text;
    Cells[7,rowsc]:=eWorkPhone.Text;
    RowCount:=RowCount+1;
  end;
  with StudDlg.sgRelKeys do
  begin
    rowsc:=RowCount-1;
    if not (dbcbeKind.KeyValue=NULL) then
      Cells[1,rowsc]:=dbcbeKind.KeyValue;
    if not (dbcbePlace.KeyValue=NULL) then
      Cells[2,rowsc]:=dbcbePlace.KeyValue;
    RowCount:=RowCount+1;
  end;

  //очистить поля
  eFIO.Text := '';
  dbcbeKind.value:=-1;
  dbdteBirth.text:='  .  .    ';
  dbcbePlace.value:=-1;
  ePost.Text := '';
  ePhone.Text := '';
  eWorkPhone.Text := '';
  eAdress.Text := '';

end;

procedure TftmAddRelative.actOKExecute(Sender: TObject);
begin
//  actApplyExecute(Sender);
  close;
end;



procedure TftmAddRelative.actOKUpdate(Sender: TObject);
begin
  inherited;
  //оставить
end;

procedure TftmAddRelative.actSpravExecute(Sender: TObject);
begin
  inherited;
 FormShow(Sender);
end;


procedure TftmAddRelative.actApplyUpdate(Sender: TObject);
begin
  inherited;
  //оставить
end;

procedure TftmAddRelative.actCheckFieldsExecute(Sender: TObject);
begin
if (eFio.Text='')
or (dbcbeKind.Text='')
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
