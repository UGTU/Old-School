unit uVosstStud;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, dbtvStudobj,dbtvGroupobj;

type
  TfrmStudVosst = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbcbeNumPrik: TDBLookupComboboxEh;
    dbcbeCause: TDBLookupComboboxEh;
    Label57: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbcbeSpec: TDBLookupComboboxEh;
    Label9: TLabel;
    Label10: TLabel;
    dbcbeFac: TDBLookupComboboxEh;
    dbcbeGroup: TDBLookupComboboxEh;
    ezachObosn: TMemo;
    sbAddPrikaz: TSpeedButton;
    procedure dbcbeFacChange(Sender: TObject);
    procedure dbcbeSpecChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure ezachObosnEnter(Sender: TObject);
    procedure ezachObosnExit(Sender: TObject);
    procedure sbAddPrikazClick(Sender: TObject);
  private
    { Private declarations }
  public
  student:TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmStudVosst: TfrmStudVosst;

implementation

uses uDM, uDMCauses, uDMStudentActions, uDMUgtuStructure, uDMPrikaz, uMain;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmStudVosst do
begin
if (dbcbeNumPrik.Text='')
or(dbcbeCause.Text='')
or(dbcbeFac.Text='')
or(dbcbeSpec.Text='')
or(dbcbeGroup.Text='')
then result:=false
end;
end;

procedure TfrmStudVosst.dbcbeFacChange(Sender: TObject);
begin
  inherited;
 dmUgtuStructure.adodsSpec.Active:=false;
 dmUgtuStructure.adodsGroups.Active:=false;
 if dbcbeFac.KeyValue<>NULL then begin
 dmUgtuStructure.adodsSpec.CommandText:='select * from Tree_specialties where Ik_fac='''+string(dbcbeFac.KeyValue)+'''';
 dmUgtuStructure.adodsSpec.Active:=true;
  dmUgtuStructure.adodsSpec.Sort := 'CName_spec';
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

procedure TfrmStudVosst.dbcbeSpecChange(Sender: TObject);
begin
  inherited;
 dmUgtuStructure.adodsGroups.Active:=false;
 if dbcbeSpec.KeyValue<>NULL then begin
 dmUgtuStructure.adodsGroups.CommandText:='select * from Tree_groups where Ik_spec_fac='''+string(dbcbespec.KeyValue)+'''';
 dmUgtuStructure.adodsGroups.Active:=true;
 dmUgtuStructure.adodsGroups.Sort := 'CName_grup';
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

procedure TfrmStudVosst.FormShow(Sender: TObject);
begin
dmUgtuStructure.adodsFaculty.Active:=true;
dmUgtuStructure.adodsFaculty.Sort := 'CName_fac';
dmPrikaz.adodsPrikaz.active:=true;
dmCauses.adodsRestoreCause.Active:=true;
dbcbeCause.KeyValue:=116;
end;

procedure TfrmStudVosst.sbAddPrikazClick(Sender: TObject);
begin
  frmMain.actAddPrikaz.Execute;
end;

procedure TfrmStudVosst.actApplyExecute(Sender: TObject);
//vAR ndGroup:TDBNodeGroupObject;
begin

dmStudentActions.aspAppendStudGroup.Active:=false;

with dmStudentActions.aspAppendStudGroup.Parameters do begin
items[1].Value:=1;
//ndGroup:=(Student.Node.Parent.Data);
items[2].Value:=dbcbeGroup.KeyValue;
items[3].Value:=student.RecordbookKey;
items[4].Value:=student.CategoryID;
items[5].Value:=dbcbeNumPrik.KeyValue;//student.OrderEnterId;
items[6].Value:=dbcbeCause.KeyValue;//student.CauseEnterID;
items[7].Value:=Null;//dbcbeNumPrik.KeyValue;
items[8].Value:=Null;//dbcbeCause.KeyValue;
items[9].Value:=eZachObosn.Text;
items[10].Value:=Null;
end;

try
dmStudentActions.aspAppendStudGroup.ExecProc;
 close;
except
showmessage('Неверно заданы параметры!');
end;
end;

procedure TfrmStudVosst.actOKExecute(Sender: TObject);
begin
 actApply.Execute;

end;

procedure TfrmStudVosst.dbcbeNumPrikChange(Sender: TObject);
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

procedure TfrmStudVosst.ezachObosnEnter(Sender: TObject);
begin
ezachObosn.BevelKind:=bkSoft;
end;

procedure TfrmStudVosst.ezachObosnExit(Sender: TObject);
begin
ezachObosn.BevelKind:=bkNone;
end;

end.
