unit uLevelUp;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, Buttons, StdCtrls, ActnList, ExtCtrls, DBTVGroupObj,
  DBGridEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmLevelUp = class(TfrmBaseDialog)
    lbAvail: TListBox;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    lbSel: TListBox;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label2: TLabel;
    Label57: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    eAddInfo: TMemo;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);

  private
    { Private declarations }
  public
  lSel,lAvail:TList;
  ndGroup:TDBNodeGroupObject;
  procedure Sync;

    { Public declarations }
  end;

var
  frmLevelUp: TfrmLevelUp;


implementation

uses DBTVStudObj, udm, Math, uDMPrikaz, uDMStudentActions, uMain;

{$R *.dfm}

{ TfrmLevelUp }
function CheckFields:boolean;
begin
result:=true;
with frmLevelUp do
begin
if (dbcbeNumPrik.Text='')
or(lbSel.count=0)
then result:=false;
end;
end;


procedure TfrmLevelUp.Sync;
var i:integer;
ndStud:TDBNodeStudObject;
begin
lbSel.Clear;
lbAvail.Clear;
for i:=0 to (lSel.Count-1) do
begin
ndStud:=TDBNodeStudObject(lSel.Items[i]);
lbSel.Items.Add(ndStud.Node.Text);
end;

for i:=0 to (lAvail.Count-1) do
begin
ndStud:=TDBNodeStudObject(lAvail.Items[i]);
lbAvail.Items.Add(ndStud.Node.Text);
end;
end;

procedure TfrmLevelUp.SpeedButton1Click(Sender: TObject);
begin
 if lbAvail.ItemIndex<0 then exit;
 lsel.Add(lAvail.Items[lbAvail.ItemIndex]);
 lAvail.Delete(lbAvail.ItemIndex);
 Sync;
 dbcbeNumPrikChange(Sender);
end;

procedure TfrmLevelUp.SpeedButton2Click(Sender: TObject);
begin
if lbsel.ItemIndex<0 then exit;
 lAvail.Add(lsel.Items[lbsel.ItemIndex]);
 lsel.Delete(lbsel.ItemIndex);
 Sync;
 dbcbeNumPrikChange(Sender);
end;

procedure TfrmLevelUp.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
for i:=0 to (lavail.count-1) do
begin
 lsel.Add(lAvail.Items[0]);
 lAvail.Delete(0);
end;
Sync;
 dbcbeNumPrikChange(Sender);
end;

procedure TfrmLevelUp.SpeedButton5Click(Sender: TObject);
begin
frmMain.actAddPrikaz.Execute;
end;

procedure TfrmLevelUp.SpeedButton3Click(Sender: TObject);
var i:integer;
begin

for i:=0 to (lsel.count-1) do
begin
 lAvail.Add(lsel.Items[0]);
 lsel.Delete(0);
end;
Sync;
dbcbeNumPrikChange(Sender);
end;

procedure TfrmLevelUp.actApplyExecute(Sender: TObject);
var i:integer;
ndStud:TDBNodeStudObject;
begin
for i:= 0 to (lSel.Count-1) do
  try
  ndStud:=TDBNodeStudObject(lsel.Items[i]);
  dmStudentActions.aspLevelUp.Active:=false;
  with dmStudentActions.aspLevelUp.Parameters do
  begin
  Items[1].Value:=1;
  Items[2].Value:=dbcbeNumPrik.KeyValue;
  Items[3].Value:=ndstud.RecordbookKey;
  Items[4].Value:=119;
  Items[5].Value:=(ndGroup.FoundYear);
  Items[6].Value:=0;//Null;
  Items[7].Value:=eAddInfo.text;
   end;
  dmStudentActions.aspLevelUp.ExecProc;
  except
  ShowMessage('Неверно заданы параметры!');
  end;

end;

procedure TfrmLevelUp.FormShow(Sender: TObject);
begin
dmPrikaz.adodsPrikaz.Active:=true;

end;

procedure TfrmLevelUp.actOKExecute(Sender: TObject);
begin
   actApplyExecute(sender);
   close;
end;

procedure TfrmLevelUp.dbcbeNumPrikChange(Sender: TObject);
begin
 if CheckFields then
  begin
    bbOK.Enabled:=true;
    bbApply.Enabled:=true;
  end
 else
  begin
    bbOK.Enabled:=false;
    bbApply.Enabled:=false;
  end;

end;

end.
