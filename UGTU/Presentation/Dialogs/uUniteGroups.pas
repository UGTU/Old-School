unit uUniteGroups;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  DBTV, DBTVDekanat, DBDekTreeView_TEST,DBTVSpecObj, uMain, DBTVGroupObj,DBTVStudObj,
  DBGridEh, Mask, DBCtrlsEh, DBLookupEh,uDm, DBTVObj, uDmPrikaz;

type
  TMoveStud = class(Tobject)
  stud:TDbNodeStudObject;
  newGroup:integer;
  end;


type
  TfrmGroupManager = class(TfrmBaseDialog)
    DBDekTreeView_TEST1: TDBDekTreeView_TEST;
    dbcbeNewGroup: TDBLookupComboboxEh;
    lbStud: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    dbcbeOrder: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbcbeNewGroupChange(Sender: TObject);
    procedure DBDekTreeView_TEST1DblClick(Sender: TObject);
    procedure lbStudDblClick(Sender: TObject);
    procedure DBDekTreeView_TEST1Change(Sender: TObject; Node: TTreeNode);
    procedure lbStudClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);

  private
  procedure Refreshlist;
   procedure RemovefromList();
    procedure AddCurrentToList;
    procedure AddGroupToList;
    procedure RemoveGroupFromList;
    { Private declarations }
  public

  MovedList:Tlist;
  spec:TDBNodeSpecObject;
    { Public declarations }
  end;

var
  frmGroupManager: TfrmGroupManager;

implementation

uses Math, uDMGroupActions, uDMUgtuStructure;

{$R *.dfm}


procedure TfrmGroupManager.Refreshlist;
var i:integer;
cur:TMoveStud;
begin
lbStud.Items.Clear;
for i:=0 to (MovedList.Count-1) do
begin
  cur:=MovedList.items[i];
  if cur.newGroup=dbcbeNewGroup.KeyValue then
  lbStud.AddItem(cur.stud.LastName+' '+cur.stud.Name+' '+cur.stud.LastName,cur);
end
end;


procedure TfrmGroupManager.AddCurrentToList;
var newMove:TMoveStud;
i:integer;
begin
if (dbcbeNewGroup.KeyValue<=0)or(TDBNodeObject(DBDekTreeView_TEST1.Selected.Data) is TDbNodeGroupObject) then exit;

if (DBDekTreeView_TEST1.Selected.ImageIndex=31) then
begin
  for i:= 0 to (MovedList.Count-1) do
  begin
    newMove:=MovedList[i];
    if (newMove.stud=DBDekTreeView_TEST1.SelectedObject) then
    begin
      newMove.stud.Node.ImageIndex:=newMove.stud.baseImageIndex;
      MovedList.Remove(newMove);
      RefreshList;
      exit;
    end;
  end;
RefreshList;
exit;
end;

newMove:=TMoveStud.Create;
newMove.stud:=DBDekTreeView_TEST1.Selected.Data;
newMove.newGroup:=dbcbeNewGroup.KeyValue;
MovedList.Add(newMove);
DBDekTreeView_TEST1.Selected.ImageIndex:=31;
RefreshList;

end;

procedure TfrmGroupManager.RemovefromList;
var cur:TMoveStud;
begin
if lbStud.ItemIndex<0 then exit;
cur:=TMoveStud(lbStud.items.Objects[lbStud.ItemIndex]);
cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
MovedList.Remove(cur);
cur.Free;

RefreshList;
end;


procedure TfrmGroupManager.FormShow(Sender: TObject);
var Node:TTreeNode;
DBNode:TDBNodeSpecObject;
begin
MovedList:=TList.create;
dmUgtuStructure.adodsGroupsofspec.Active:=false;
dmUgtuStructure.adodsGroupsofspec.CommandText:='select * from Tree_groups where ik_spec_fac='''+inttostr(spec.ik)+'''';
dmUgtuStructure.adodsGroupsofspec.Active:=true;
dmPrikaz.adodsPrikaz.active:=true;

Node:=DBDekTreeView_TEST1.CreateNewNode(nil, spec.Name, TDBNodeSpecObject);

DBnode:=TDBNodeSpecObject.create(Node,DBDekTreeView_TEST1);
DbNode.StudyYears:=spec.StudyYears;
DBNode.ik:=spec.ik;
DBNode.ShortName:=spec.ShortName;
DBNode.Name:=spec.Name;
DBnode.ShowActual:=spec.showActual;
DBnode.SetAdoDataset(spec.AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
DBNode.ShowStudents:=ssShowActualOnly;
Node.Data:=DBnode;
Node.ImageIndex:=DBNode.BaseImageIndex;
DBNode.AddChildNodes;

end;


procedure TfrmGroupManager.SpeedButton1Click(Sender: TObject);
begin
AddCurrenttolist;
end;

procedure TfrmGroupManager.SpeedButton2Click(Sender: TObject);
begin
RemovefromList;

end;

procedure TfrmGroupManager.dbcbeNewGroupChange(Sender: TObject);
begin
Refreshlist;
if (dbcbeNewGroup.KeyValue<>Null)and(frmMain.DBDekTreeView_TEST1.Selectedobject is TDBNodeGroupObject) then
SpeedButton4.Enabled:=true;

if (dbcbeNewGroup.KeyValue<>Null)and(lbStud.Items.Count>0) then
SpeedButton3.Enabled:=true else
SpeedButton3.Enabled:=false;
end;

procedure TfrmGroupManager.DBDekTreeView_TEST1DblClick(Sender: TObject);
begin
AddCurrenttolist;
end;

procedure TfrmGroupManager.lbStudDblClick(Sender: TObject);
begin
RemovefromList

end;

procedure TfrmGroupManager.DBDekTreeView_TEST1Change(Sender: TObject;
  Node: TTreeNode);
begin
if (DBDekTreeView_TEST1.SelectedObject is TDBNodeStudObject) then
begin
SpeedButton4.Enabled:=false;
if dbcbeNewGroup.KeyValue<>Null then SpeedButton1.Enabled:=true;
end else
begin
SpeedButton1.Enabled:=false;
if dbcbeNewGroup.KeyValue<>Null then SpeedButton4.Enabled:=true;
end;

end;

procedure TfrmGroupManager.lbStudClick(Sender: TObject);
begin
 if lbStud.ItemIndex<0 then
 SpeedButton2.Enabled:=false else
 SpeedButton2.Enabled:=true;
 if lbStud.Items.count>0 then
 SpeedButton3.Enabled:=true else
 SpeedButton3.Enabled:=false;
end;

procedure TfrmGroupManager.AddGroupToList;
var i:integer;
newMove:TMoveStud;
begin
//if (dbcbeNewGroup.KeyValue<=0)or(DBDekTreeView_TEST1.Selected.ImageIndex=31)or(TDBNodeObject(DBDekTreeView_TEST1.Selected.Data) is TDbNodeGroupObject) then exit;

For i:=0 to (DBDekTreeView_TEST1.Selected.Count-1) do begin
newMove:=TMoveStud.Create;
newMove.stud:=DBDekTreeView_TEST1.Selected.Item[i].data;
newMove.newGroup:=dbcbeNewGroup.KeyValue;
if not (newMove.stud.Node.ImageIndex=31) then
MovedList.Add(newMove);
newMove.stud.Node.ImageIndex:=31;
end;

RefreshList;
end;

procedure TfrmGroupManager.RemoveGroupFromList;
var i:integer;
cur:TMoveStud;
begin
if lbStud.items.count=0 then exit;

for i:= 0 to (lbStud.items.count-1) do
begin
cur:=TMoveStud(lbStud.items.Objects[i]);
cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
MovedList.Remove(cur);
cur.Free;
end;

RefreshList;

end;

procedure TfrmGroupManager.SpeedButton4Click(Sender: TObject);
begin
AddGroupToList;

end;

procedure TfrmGroupManager.SpeedButton3Click(Sender: TObject);
begin
RemoveGroupFromList;

end;

procedure TfrmGroupManager.actApplyExecute(Sender: TObject);
var i:integer;
cur:TMoveStud;
begin
for i:=0 to (MovedList.Count-1) do begin
   cur:=MovedList[i];
   dmGroupActions.aspGroupChange_withupdate.Active:=false;
   dmGroupActions.aspGroupChange_withupdate.Parameters[1].Value:=cur.newGroup;
   dmGroupActions.aspGroupChange_withupdate.Parameters[2].Value:=cur.stud.RecordbookKey;
   dmGroupActions.aspGroupChange_withupdate.Parameters[3].Value:=dbcbeOrder.KeyValue;
   dmGroupActions.aspGroupChange_withupdate.ExecProc;
   Refreshlist;
end;
MovedList.Clear;
Refreshlist;
end;

procedure TfrmGroupManager.actApplyUpdate(Sender: TObject);
begin
actApply.Enabled:=not ((dbcbeNewGroup.Text=''));//or(dbcbeOrder.Text=''));
actOk.Enabled:=not ((dbcbeNewGroup.Text=''));//or(dbcbeOrder.Text=''));
end;

procedure TfrmGroupManager.actOKExecute(Sender: TObject);
begin
actApplyExecute(Sender);
Close;
end;

end.
