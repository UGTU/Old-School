unit uNaprRegisterDialog;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
  ActnList, Buttons, ExtCtrls, uDMUspevaemost, uDM;

type
  TfrmNaprRegister = class(TfrmBaseDialog)
    eNum: TDBNumberEditEh;
    Label5: TLabel;
    Label4: TLabel;
    dbcbeVidExam: TDBLookupComboboxEh;
    Label15: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    dbdteOut: TDBDateTimeEditEh;
    dbcbeEx: TDBLookupComboboxEh;
    Label3: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    dbcbeMark: TDBLookupComboboxEh;
    Label16: TLabel;
    dbdteExam: TDBDateTimeEditEh;
    Label18: TLabel;
    eTema: TDBEditEh;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actBaseDialogUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    function CheckFields():boolean;
  public

  ik_sem :integer;
  ik_up_content: integer;
    { Public declarations }
  end;

var
  frmNaprRegister: TfrmNaprRegister;

implementation

{$R *.dfm}

procedure TfrmNaprRegister.actApplyExecute(Sender: TObject);
begin
dmUspevaemost.adospNaprRegister.Active:=false;

with dmUspevaemost.adospNaprRegister.Parameters do begin
clear;
AddParameter;
items[0].Value:=ik_sem;
AddParameter;
items[1].Value:=ik_up_content;
AddParameter;
items[2].Value:=dbcbeEx.KeyValue;
AddParameter;
items[3].Value:=Tag;
AddParameter;
items[4].Value:=dbcbeVidExam.KeyValue;
AddParameter;
if eNum.Text='' then items[5].Value:='' else
items[5].Value:=eNum.Value;
AddParameter;
items[6].Value:=Hint;
AddParameter;
items[7].Value:=dbcbeMark.KeyValue;
AddParameter;
items[8].Value:=eTema.text;
AddParameter;
items[9].Value:=dbdteOut.Value;
AddParameter;
items[10].Value:=dbdteExam.Value;
end;

dmUspevaemost.adospNaprRegister.ExecProc;

end;



procedure TfrmNaprRegister.actBaseDialogUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
if CheckFields then
begin
  actApply.Enabled:=true;
  actOK.Enabled:=true;
end
else
begin
  actApply.Enabled:=false;
  actOK.Enabled:=false;
end;

end;

procedure TfrmNaprRegister.actOKExecute(Sender: TObject);
begin
actApply.Execute;
close;
end;


procedure TfrmNaprRegister.bbCancelClick(Sender: TObject);
begin
close;
end;

function TfrmNaprRegister.CheckFields: boolean;
begin
result:=true;
if (dbcbeVidExam.Text='')
or(dbcbeMark.Text='')
or(dbdteOut.Text='  .  .    ')
or(dbdteExam.Text='  .  .    ')
or(dbcbeEx.Text='')
then result:=false

end;

procedure TfrmNaprRegister.FormShow(Sender: TObject);
begin
dbcbeVidExam.KeyValue:=1;
dbdteOut.Value:=Date;
dbdteExam.Value:=Date;

dmUspevaemost.adospPredmStud.Active:=false;
with dmUspevaemost.adospPrepodVed.Parameters do
clear;
dmUspevaemost.adospPrepodVed.ExecProc;
dmUspevaemost.adospPrepodVed.Active:=true;
dmUspevaemost.adodsmark.Active:=true;
dm.adodsVidExam.Active:=true;

end;

end.
