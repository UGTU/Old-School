unit uUniteGroups;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  DBTV, DBTVDekanat, DBDekTreeView_TEST, DBTVSpecObj, uMain, DBTVGroupObj,
  DBTVStudObj,
  DBGridEh, Mask, DBCtrlsEh, DBLookupEh, uDm, DBTVObj, uDmPrikaz, System.Actions;

type
  TMoveStud = class(Tobject)
    stud: TDbNodeStudObject;
    newGroup: integer;
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
    procedure FormShow(Sender: Tobject);
    procedure SpeedButton1Click(Sender: Tobject);
    procedure SpeedButton2Click(Sender: Tobject);
    procedure dbcbeNewGroupChange(Sender: Tobject);
    procedure DBDekTreeView_TEST1DblClick(Sender: Tobject);
    procedure lbStudDblClick(Sender: Tobject);
    procedure DBDekTreeView_TEST1Change(Sender: Tobject; Node: TTreeNode);
    procedure lbStudClick(Sender: Tobject);
    procedure SpeedButton4Click(Sender: Tobject);
    procedure SpeedButton3Click(Sender: Tobject);
    procedure actApplyExecute(Sender: Tobject);
    procedure actOKExecute(Sender: Tobject);
    procedure actApplyUpdate(Sender: Tobject);

  private
    procedure Refreshlist;
    procedure RemovefromList();
    procedure AddCurrentToList;
    procedure AddGroupToList;
    procedure RemoveGroupFromList;
    { Private declarations }
  public

    MovedList: Tlist;
    spec: TDBNodeSpecObject;
    { Public declarations }
  end;

var
  frmGroupManager: TfrmGroupManager;

implementation

uses Math, uDMGroupActions, uDMUgtuStructure;

{$R *.dfm}

procedure TfrmGroupManager.Refreshlist;
var
  i: integer;
  cur: TMoveStud;
begin
  lbStud.Items.Clear;
  for i := 0 to (MovedList.Count - 1) do
  begin
    cur := MovedList.Items[i];
    if cur.newGroup = dbcbeNewGroup.KeyValue then
      lbStud.AddItem(cur.stud.LastName + ' ' + cur.stud.Name + ' ' +
        cur.stud.LastName, cur);
  end
end;

procedure TfrmGroupManager.AddCurrentToList;
var
  newMove: TMoveStud;
  i: integer;
begin
  if (dbcbeNewGroup.KeyValue <= 0) or
    (TDBNodeObject(DBDekTreeView_TEST1.Selected.Data) is TDbNodeGroupObject)
  then
    exit;

  if (DBDekTreeView_TEST1.Selected.ImageIndex = 31) then
  begin
    for i := 0 to (MovedList.Count - 1) do
    begin
      newMove := MovedList[i];
      if (newMove.stud = DBDekTreeView_TEST1.SelectedObject) then
      begin
        newMove.stud.Node.ImageIndex := newMove.stud.baseImageIndex;
        MovedList.Remove(newMove);
        Refreshlist;
        exit;
      end;
    end;
    Refreshlist;
    exit;
  end;

  newMove := TMoveStud.Create;
  newMove.stud := DBDekTreeView_TEST1.Selected.Data;
  newMove.newGroup := dbcbeNewGroup.KeyValue;
  MovedList.Add(newMove);
  DBDekTreeView_TEST1.Selected.ImageIndex := 31;
  Refreshlist;

end;

procedure TfrmGroupManager.RemovefromList;
var
  cur: TMoveStud;
begin
  if lbStud.ItemIndex < 0 then
    exit;
  cur := TMoveStud(lbStud.Items.Objects[lbStud.ItemIndex]);
  cur.stud.Node.ImageIndex := cur.stud.baseImageIndex;
  MovedList.Remove(cur);
  cur.Free;

  Refreshlist;
end;

procedure TfrmGroupManager.FormShow(Sender: Tobject);
var
  Node: TTreeNode;
  DBNode: TDBNodeSpecObject;
begin
  MovedList := Tlist.Create;
  dmUgtuStructure.adodsGroupsofspec.Active := false;
  dmUgtuStructure.adodsGroupsofspec.CommandText :=
    'select * from Tree_groups where ik_spec_fac=''' + inttostr(spec.ik) + '''';
  dmUgtuStructure.adodsGroupsofspec.Active := true;
  dmPrikaz.adodsPrikaz.Active := true;

  Node := DBDekTreeView_TEST1.CreateNewNode(nil, spec.Name, TDBNodeSpecObject);

  DBNode := TDBNodeSpecObject.Create(Node, DBDekTreeView_TEST1);
  DBNode.StudyYears := spec.StudyYears;
  DBNode.ik := spec.ik;
  DBNode.ShortName := spec.ShortName;
  DBNode.Name := spec.Name;
  DBNode.ShowActual := spec.ShowActual;
  DBNode.SetAdoDataset(spec.AdoDataset.Connection);
  DBNode.baseImageIndex := 5;
  DBNode.ShowStudents := ssShowActualOnly;
  Node.Data := DBNode;
  Node.ImageIndex := DBNode.baseImageIndex;
  DBNode.AddChildNodes;

end;

procedure TfrmGroupManager.SpeedButton1Click(Sender: Tobject);
begin
  AddCurrentToList;
end;

procedure TfrmGroupManager.SpeedButton2Click(Sender: Tobject);
begin
  RemovefromList;

end;

procedure TfrmGroupManager.dbcbeNewGroupChange(Sender: Tobject);
begin
  Refreshlist;
  if (dbcbeNewGroup.KeyValue <> Null) and
    (frmMain.DBDekTreeView_TEST1.SelectedObject is TDbNodeGroupObject) then
    SpeedButton4.Enabled := true;

  if (dbcbeNewGroup.KeyValue <> Null) and (lbStud.Items.Count > 0) then
    SpeedButton3.Enabled := true
  else
    SpeedButton3.Enabled := false;
end;

procedure TfrmGroupManager.DBDekTreeView_TEST1DblClick(Sender: Tobject);
begin
  AddCurrentToList;
end;

procedure TfrmGroupManager.lbStudDblClick(Sender: Tobject);
begin
  RemovefromList;
end;

procedure TfrmGroupManager.DBDekTreeView_TEST1Change(Sender: Tobject;
  Node: TTreeNode);
begin
  if (DBDekTreeView_TEST1.SelectedObject is TDbNodeStudObject) then
  begin
    SpeedButton4.Enabled := false;
    if dbcbeNewGroup.KeyValue <> Null then
      SpeedButton1.Enabled := true;
  end
  else
  begin
    SpeedButton1.Enabled := false;
    if dbcbeNewGroup.KeyValue <> Null then
      SpeedButton4.Enabled := true;
  end;

end;

procedure TfrmGroupManager.lbStudClick(Sender: Tobject);
begin
  if lbStud.ItemIndex < 0 then
    SpeedButton2.Enabled := false
  else
    SpeedButton2.Enabled := true;
  if lbStud.Items.Count > 0 then
    SpeedButton3.Enabled := true
  else
    SpeedButton3.Enabled := false;
end;

procedure TfrmGroupManager.AddGroupToList;
var
  i: integer;
  newMove: TMoveStud;
begin
  // if (dbcbeNewGroup.KeyValue<=0)or(DBDekTreeView_TEST1.Selected.ImageIndex=31)or(TDBNodeObject(DBDekTreeView_TEST1.Selected.Data) is TDbNodeGroupObject) then exit;

  For i := 0 to (DBDekTreeView_TEST1.Selected.Count - 1) do
  begin
    newMove := TMoveStud.Create;
    newMove.stud := DBDekTreeView_TEST1.Selected.Item[i].Data;
    newMove.newGroup := dbcbeNewGroup.KeyValue;
    if not(newMove.stud.Node.ImageIndex = 31) then
      MovedList.Add(newMove);
    newMove.stud.Node.ImageIndex := 31;
  end;

  Refreshlist;
end;

procedure TfrmGroupManager.RemoveGroupFromList;
var
  i: integer;
  cur: TMoveStud;
begin
  if lbStud.Items.Count = 0 then
    exit;

  for i := 0 to (lbStud.Items.Count - 1) do
  begin
    cur := TMoveStud(lbStud.Items.Objects[i]);
    cur.stud.Node.ImageIndex := cur.stud.baseImageIndex;
    MovedList.Remove(cur);
    cur.Free;
  end;

  Refreshlist;

end;

procedure TfrmGroupManager.SpeedButton4Click(Sender: Tobject);
begin
  AddGroupToList;

end;

procedure TfrmGroupManager.SpeedButton3Click(Sender: Tobject);
begin
  RemoveGroupFromList;

end;

procedure TfrmGroupManager.actApplyExecute(Sender: Tobject);
var
  i: integer;
  cur: TMoveStud;
begin
  for i := 0 to (MovedList.Count - 1) do
  begin
    cur := MovedList[i];
    dmGroupActions.aspGroupChange_withupdate.Active := false;
    dmGroupActions.aspGroupChange_withupdate.Parameters[1].Value :=
      cur.newGroup;
    dmGroupActions.aspGroupChange_withupdate.Parameters[2].Value :=
      cur.stud.RecordbookKey;
    dmGroupActions.aspGroupChange_withupdate.Parameters[3].Value :=
      dbcbeOrder.KeyValue;
    dmGroupActions.aspGroupChange_withupdate.ExecProc;
    Refreshlist;
  end;
  MovedList.Clear;
  Refreshlist;
end;

procedure TfrmGroupManager.actApplyUpdate(Sender: Tobject);
begin
  actApply.Enabled := not((dbcbeNewGroup.Text = ''));
  // or(dbcbeOrder.Text=''));
  actOk.Enabled := not((dbcbeNewGroup.Text = '')); // or(dbcbeOrder.Text=''));
end;

procedure TfrmGroupManager.actOKExecute(Sender: Tobject);
begin
  actApplyExecute(Sender);
  Close;
end;

end.
