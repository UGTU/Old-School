unit uAcadem;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh,
  ActnList, Buttons, ExtCtrls,dbtvStudobj,dbtvgroupobj;

type
  TfrmAcademStud = class(TfrmBaseDialog)
    dbcbeNumPrik: TDBLookupComboboxEh;
    dbcbeCause: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label57: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dbcbeSpec: TDBLookupComboboxEh;
    dbcbeGroup: TDBLookupComboboxEh;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbcbeFac: TDBLookupComboboxEh;
    eOtchObosn: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    dbdteBegin: TDBDateTimeEditEh;
    dbdteEnd: TDBDateTimeEditEh;
    dbdteLearn: TDBDateTimeEditEh;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    cbFreeAt: TCheckBox;
    sbAddPrikaz: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure dbcbeFacChange(Sender: TObject);
    procedure dbcbeSpecChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure eOtchObosnEnter(Sender: TObject);
    procedure eOtchObosnExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbdteEndChange(Sender: TObject);
    procedure dbdteEndExit(Sender: TObject);
    procedure dbdteLearnExit(Sender: TObject);
    procedure dbdteLearnChange(Sender: TObject);
    procedure sbAddPrikazClick(Sender: TObject);
  private
    { Private declarations }
  public
   RecordbookKey:integer;
   CategoryID:integer;
   ik_fac:integer;
   ik_spec:integer;
   ik_group:integer;
   EditMode : boolean;
    { Public declarations }
  end;

var
  frmAcademStud: TfrmAcademStud;

implementation
uses uDm, uDMCauses, uDMStudentActions, uDMPrikaz, uDMUgtuStructure, uMain;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmAcademStud do
begin
if (dbcbeNumPrik.Text='')
or(dbcbeCause.Text='')
or(dbcbeFac.Text='')
or(dbcbeSpec.Text='')
or(dbcbeGroup.Text='')
then result:=false;

if (dbdteBegin.text<>'  .  .    ')or(dbdteEnd.text<>'  .  .    ')or(dbdteLearn.text<>'  .  .    ') then
if (dbdteBegin.text='  .  .    ')or(dbdteEnd.text='  .  .    ')or(dbdteLearn.text='  .  .    ') then
result:=false;
end;
end;

procedure TfrmAcademStud.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikaz.Active:=true;
dmCauses.adodsAcademCause.Active:=true;
dmUgtuStructure.adodsFaculty.Active:=true;

if EditMode then Caption:='Академический отпуск';

end;

procedure TfrmAcademStud.sbAddPrikazClick(Sender: TObject);
begin
  frmMain.actAddPrikaz.Execute;
end;

procedure TfrmAcademStud.SpeedButton2Click(Sender: TObject);
begin
frmMain.actAddPrikaz.execute;

end;

procedure TfrmAcademStud.dbcbeFacChange(Sender: TObject);
begin
 dmUgtuStructure.adodsSpec.Active:=false;
 dmUgtuStructure.adodsGroups.Active:=false;
 if dbcbeFac.KeyValue<>NULL then begin
 dmUgtuStructure.adodsSpec.CommandText:='select * from Tree_specialties where Ik_fac='''+string(dbcbeFac.KeyValue)+'''';
  dmUgtuStructure.adodsSpec.Active:=true;
end;

if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;
end;

procedure TfrmAcademStud.dbcbeSpecChange(Sender: TObject);
begin
dmUgtuStructure.adodsGroups.Active:=false;
 if dbcbeSpec.KeyValue<>NULL then begin
 dmUgtuStructure.adodsGroups.CommandText:='select * from Tree_groups where Ik_spec_fac='''+string(dbcbespec.KeyValue)+'''';
 dmUgtuStructure.adodsGroups.Active:=true;
end;

if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;
end;

procedure TfrmAcademStud.dbdteEndChange(Sender: TObject);
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

procedure TfrmAcademStud.dbdteEndExit(Sender: TObject);
begin
if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

try
  if (dbdteEnd.Value <= dbdteBegin.Value)and(dbdteEnd.Text<>'  .  .    ') then
  dbdteEnd.Value := dbdteBegin.Value+1;
except
end;
end;

procedure TfrmAcademStud.dbdteLearnChange(Sender: TObject);
begin
  inherited;
if CheckFields then begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;
end;

procedure TfrmAcademStud.dbdteLearnExit(Sender: TObject);
begin
  try
  if (dbdteLearn.Value < dbdteEnd.Value)and(dbdteLearn.Text<>'  .  .    ') then
  dbdteLearn.Value := dbdteEnd.Value+1;
  except
  end;
end;

procedure TfrmAcademStud.actApplyExecute(Sender: TObject);
//vAR ndGroup:TDBNodeGroupObject;
var ikStudGroup:integer;
begin

dmStudentActions.aspAppendStudGroup.Active:=false;
  with dmStudentActions.aspAppendStudGroupAcadem.Parameters do begin

    items[1].Value:=ik_group;
    items[2].Value:=dbcbeGroup.KeyValue;
    items[3].Value:=RecordbookKey;
    items[4].Value:=CategoryID;
    items[5].Value:=13; // причина зачисления
    items[6].Value:=dbcbeNumPrik.KeyValue; // приказ отчисления
    items[7].Value:=dbcbeCause.KeyValue; // причина отчисления
    items[8].Value:=Null;
    items[9].Value:=eOtchObosn.Text;
    items[10].Value:=dbdteBegin.Value;
    items[11].Value:=dbdteEnd.Value;
    items[12].Value:=dbdteLearn.Value;
    if not EditMode then
    items[13].Value:=1
    else items[13].Value:=0;
    items[14].Value:=cbFreeAt.Checked;
  end;

  try
    dmStudentActions.aspAppendStudGroupAcadem.ExecProc;

  except
    showmessage('Неверно заданы параметры!');
  end;

end;

procedure TfrmAcademStud.dbcbeNumPrikChange(Sender: TObject);
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

procedure TfrmAcademStud.actOKExecute(Sender: TObject);
begin
actApplyExecute(sender);
close;

end;

procedure TfrmAcademStud.eOtchObosnEnter(Sender: TObject);
begin
 eOtchObosn.BevelKind:=bkSoft;

end;

procedure TfrmAcademStud.eOtchObosnExit(Sender: TObject);
begin

eOtchObosn.BevelKind:=bkNone;
end;


end.
