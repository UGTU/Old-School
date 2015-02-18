(*
  Модуль    : DBTVDekanat
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: дерево БД Decanat
*)
unit DBTVDekanat;

interface

uses
  Dialogs, Forms, Windows, Messages, SysUtils, comctrls, Variants, Classes,
  ADODB, DBTV, DBTVObj, DBTVrootObj, DBTVfacObj, db, ShEvent,
  DBTVDictObj, DBTVPrikObj, DBTVBusinessObj, DBTVAbitObj, DBTVAdminObj,
  DBTVStudObj, DBTVSpecObj, DBTVGroupObj, DBTVMethodWorkObj, DBTVFacDepobj,
  DBTVDepObj, DBTVTeacherObj, DBTVRootScheduleobj, DBTVRIOObj, DBTVOKObj,
  DBTVSemesterNagrObj, DBTVHostelRootobj,DBTVSprObj;

type
  TDBDekanatTreeView = class(TDBTreeView)
  private
    FConnection: TADOConnection;
    FRoot: TTreeNode;
    FSearchDS: TADODataset;
    FElementDS: TADODataset;
    FUserLogin: string;

  protected
    function AddElementNode: TTreeNode;
    function GetObject: TDBNodeObject; override;
  public
    procedure RefreshNodeExecute(Node: TTreeNode);
    procedure SelectNodeByNum(num: integer; IsFocused: boolean);
    procedure RefreshAllExecute(Sender: TObject);
    function FindAndSelectByValue(value: integer): boolean;
    function FindAndSelectTeachByValue(value: integer): boolean;
    function FindAndSelect: boolean;
    function FindAndSelectTeach: boolean;
    constructor Create(AOwner: TComponent); override;

    function AddRoot: TTreeNode;
    property Root: TTreeNode read FRoot write FRoot;
    property SearchDataset: TADODataset read FSearchDS write FSearchDS;
    property ElementDataset: TADODataset read FElementDS write FElementDS;
    property UserLogin: string read FUserLogin write FUserLogin;

  published

    property Connection: TADOConnection read FConnection write FConnection;
  end;

implementation

uses Controls;

procedure TDBDekanatTreeView.SelectNodeByNum(num: integer; IsFocused: boolean);
var
  DBNode: TDBNodeObject;
begin
  DBNode := Selected.data;
  DBNode.AddChildNodes;
  if Selected.Count > num then
    Select(Selected.Item[num]);
  if (IsFocused) and (Visible) then
    SetFocus;
end;

function TDBDekanatTreeView.FindAndSelect: boolean;
var
  Node: TTreeNode;
  i, j: integer;
begin
  FRoot.Expand(false);
  i := 0;
  j := SearchDataset.fieldvalues['ik_fac'];
  While (i < FRoot.Count) and (TDBNodeFacultyObject(FRoot.Item[i].data)
    .ik <> j) do
    inc(i);
  if i = FRoot.Count then
  begin
    result := false;
    exit;
  end;

  Node := FRoot.Item[i];
  Node.Expand(false);
  i := 0;
  j := SearchDataset.fieldvalues['ik_spec_fac'];
  While (i < Node.Count) and (TDBNodeSpecObject(Node.Item[i].data).ik <> j) do
    inc(i);
  if i = Node.Count then
  begin
    result := false;
    exit;
  end;
  TDBNodeSpecObject(Node.Item[i].data).showActual := false;
  Select(Node.Item[i]);
  RefreshNodeExecute(TTreeNode(Node.Item[i]));
  Node := Node.Item[i];
  Node.Expand(false);
  i := 0;
  j := SearchDataset.fieldvalues['ik_grup'];
  While (i < Node.Count) and (TDBNodeGroupObject(Node.Item[i].data).ik <> j) do
    inc(i);
  if i = Node.Count then
  begin
    result := false;
    exit;
  end;
  TDBNodeGroupObject(Node.Item[i].data).ShowStudents := ssShowAll;
  Select(Node.Item[i]);
  RefreshNodeExecute(Node.Item[i]);
  Node := Node.Item[i];
  Node.Expand(false);
  i := 0;
  While (i < Node.Count) and (TDBNodeStudObject(Node.Item[i].data).ik <>
    SearchDataset.fieldvalues['ik_zach']) do
    inc(i);
  if i = Node.Count then
  begin
    result := false;
    exit;
  end;

  Select(Node.Item[i]);
  result := true;
end;

function TDBDekanatTreeView.FindAndSelectByValue(value: integer): boolean;
begin
  SearchDataset := TADODataset.Create(self);
  SearchDataset.Connection := Connection;
  SearchDataset.Active := false;
  SearchDataset.CommandText := 'select * from TREE_Stud_Search where ik_zach='''
    + inttostr(value) + '''';
  SearchDataset.Active := true;
  SearchDataset.First;
  result := FindAndSelect;
end;

function TDBDekanatTreeView.FindAndSelectTeach: boolean;
var
  Node: TTreeNode;
  i, j: integer;
begin
  { Business:=nil;
    for I := 0 to (self.Items.Count) - 1 do
    if self.Items[i].Text='Нагрузка' then
    Business:=self.Items[i];

    if Business=nil then
    begin
    result:=false;
    exit;
    end;

    Business.Expand(false);
    i:=0;
    j:=searchDataset.fieldvalues['ik_fac'];
    //While (i<Business.Count)and(TDBNodeSemesterNagrObject(Business.Item[i].Data).ik<>j) do
    inc(i);
    if i=Business.Count then begin
    result:=false;
    exit;
    end; }

  Node := self.Selected;

  Node.Expand(false);
  i := 0;
  j := SearchDataset.fieldvalues['ik_fac'];
  While (i < Node.Count) and (TDBNodeFacultyDepObject(Node.Item[i].data)
    .ik <> j) do
    inc(i);
  if (i = Node.Count) then
  begin
    result := false;
    exit;
  end;
  Node := Node.Item[i];
  Node.Expand(false);
  i := 0;
  j := SearchDataset.fieldvalues['ik_kaf'];
  While (i < Node.Count) and (TDBNodeDepartmentObject(Node.Item[i].data)
    .ik <> j) do
    inc(i);
  if i = Node.Count then
  begin
    result := false;
    exit;
  end;

  Node := Node.Item[i];
  Node.Expand(false);
  i := 0;
  While (i < Node.Count) and (TDBNodeTeacherObject(Node.Item[i].data).ik <>
    SearchDataset.fieldvalues['itab_n']) do
    inc(i);
  if i = Node.Count then
  begin
    result := false;
    exit;
  end;

  Select(Node.Item[i]);
  result := true;
end;

function TDBDekanatTreeView.FindAndSelectTeachByValue(value: integer): boolean;
begin
  SearchDataset := TADODataset.Create(self);
  SearchDataset.Connection := Connection;
  SearchDataset.Active := false;
  SearchDataset.CommandText := 'select * from TREE_TeachSearch where itab_n='''
    + inttostr(value) + '''';
  SearchDataset.Active := true;
  SearchDataset.First;
  result := FindAndSelectTeach;
end;

procedure TDBDekanatTreeView.RefreshNodeExecute(Node: TTreeNode);
var
  NodeObj: TDBNodeObject;
  NodeText: string;
  NodeIndex: integer;
  Expanded: boolean;
begin
  // Запомним текст и индекс обновляемого узла
  NodeText := Node.Text;
  NodeIndex := Node.Index;

  // Определяем, что будет обновляемым узлом: текущий или родительский
  // if (Node.expanded) or (Node.Parent = nil) then
  NodeObj := Node.data;
  if NodeObj.Node = nil then
    NodeObj := Node.data;
  // else
  // NodeObj:=Node.Parent.Data;

  // Запомним состояние узла до обновления
  Expanded := Node.Expanded;
  NodeObj.Refresh;

  if Expanded then
  begin
    NodeObj.Node.Expand(false);
    // Переход к запомненному узлу (если он существует)
    if NodeObj.Node.Count > NodeIndex then
      if CompareStr(NodeObj.Node[NodeIndex].Text, NodeText) = 0 then
        NodeObj.Node[NodeIndex].Selected := true;
  end;
  self.Change(Node);
end;

procedure TDBDekanatTreeView.RefreshAllExecute(Sender: TObject);
begin
  // Not implemented yet

end;

function TDBDekanatTreeView.GetObject: TDBNodeObject;
begin
  result := Selected.data;
end;

constructor TDBDekanatTreeView.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);
  Connection := nil;
end;

function TDBDekanatTreeView.AddElementNode: TTreeNode;
var
  Node: TTreeNode;
begin
  result := nil;
  if ElementDataset.fieldvalues['ik_element'] = 1 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeRootObject);
    TDBNodeRootObject(Node.data).SetADODataset(Connection);
    TDBNodeRootObject(Node.data).BaseImageIndex := 1;
    TDBNodeRootObject(Node.data).Actiongroup := 'catUniAct';
    Node.ImageIndex := 1;

  end;

  if ElementDataset.fieldvalues['ik_element'] = 2 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeBusinessObject);
    TDBNodeBusinessObject(Node.data).showActual := true;
    TDBNodeBusinessObject(Node.data).SetADODataset(Connection);
    TDBNodeBusinessObject(Node.data).BaseImageIndex := 16;
    TDBNodeBusinessObject(Node.data).Actiongroup := 'catNagruzka';
    Node.ImageIndex := 16;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 3 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeAbitObject);
    TDBNodeAbitObject(Node.data).BaseImageIndex := 19;
    TDBNodeAbitObject(Node.data).SetADODataset(Connection);
    TDBNodeAbitObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 19;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 4 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodePrikObject);
    Node.HasChildren := false;
    TDBNodePrikObject(Node.data).Actiongroup := 'catPrikaz';
    Node.ImageIndex := 14;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 5 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeDictObject);
    Node.HasChildren := false;
    TDBNodeAbitObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 13;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 6 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeAdminObject);
    Node.HasChildren := false;
    TDBNodeAdminObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 30;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 7 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeMethodWorkObject);
    TDBNodeMethodWorkObject(Node.data).SetADODataset(Connection);
    TDBNodeMethodWorkObject(Node.data).Actiongroup := 'none';
    TDBNodeMethodWorkObject(Node.data).BaseImageIndex := 37;
    Node.ImageIndex := 37;
  end;
  if ElementDataset.fieldvalues['ik_element'] = 8 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeRootScheduleObject);
    TDBNodeRootScheduleObject(Node.data).SetADODataset(Connection);
    TDBNodeRootScheduleObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 35;
  end;
  if ElementDataset.fieldvalues['ik_element'] = 9 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeRioObject);
    TDBNodeRioObject(Node.data).SetADODataset(Connection);
    TDBNodeRioObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 35;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 10 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeOKObject);
    Node.HasChildren := false;
    TDBNodeRioObject(Node.data).Actiongroup := 'none';
    Node.ImageIndex := 39;
  end;

  if ElementDataset.fieldvalues['ik_element'] = 11 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBHostelNodeRoot);
    Node.HasChildren := true;
    TDBNodeRioObject(Node.data).Actiongroup := 'actHostel';
    TDBNodeRioObject(Node.data).SetADODataset(Connection);
    Node.ImageIndex := 1;
  end;

  //журнал справок
   if ElementDataset.fieldvalues['ik_element'] = 12 then
  begin
    Node := CreateNewNode(nil, ElementDataset.fieldvalues['Nameelement'],
      TDBNodeSprObject);
    Node.HasChildren := false;
    TDBNodeRioObject(Node.data).Actiongroup := 'none';
    TDBNodeRioObject(Node.data).SetADODataset(Connection);
    Node.ImageIndex := 3;
  end;
  result := Node;
end;

function TDBDekanatTreeView.AddRoot: TTreeNode;
var
  Node: TTreeNode;
  i: integer;
begin
  Node := nil;
  ElementDataset := TADODataset.Create(self);
  ElementDataset.Connection := FConnection;
  ElementDataset.Active := false;
  ElementDataset.CommandType := cmdTable;
  ElementDataset.CommandText := 'VisualElementsForCurrentUser';
  ElementDataset.Active := true;
  ElementDataset.First;
  ElementDataset.Sort := 'iOrder';

  for i := 0 to (ElementDataset.RecordCount - 1) do
  begin
    if (ElementDataset.fieldvalues['ik_Element'] = 1) then
      Node := AddElementNode
    else
      AddElementNode;
    ElementDataset.Next;
  end;

  result := Node;

end;

end.
