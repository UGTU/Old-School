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
  Dialogs,Forms,Windows, Messages, SysUtils,comctrls, Variants, Classes, ADODB,DBTV,DBTVObj,DBTVrootObj,DBTVfacObj, db, ShEvent,
  DBTVDictObj,DBTVPrikObj,DBTVBusinessObj,DBTVAbitObj,DBTVAdminObj,DBTVStudObj,DBTVSpecObj,DBTVGroupObj, DBTVMethodWorkObj, DBTVFacDepobj,
  DBTVDepObj, DBTVTeacherObj, DBTVRootScheduleobj,DBTVRIOObj, DBTVOKObj, DBTVSemesterNagrObj, DBTVHostelRootobj;


type
TDBDekanatTreeView = class (TDBTreeView)
private
FConnection: TADOConnection;
FRoot:TTreeNode;
FSearchDS:TADODataset;
FElementDS:TADODataset;
FUserLogin:string;

protected
function AddElementNode:TTreeNode;
function GetObject: TDBNodeObject; override;
public
procedure RefreshNodeExecute(Node:TTreeNode);
procedure SelectNodeByNum(num:integer; IsFocused:boolean);
procedure RefreshAllExecute(Sender:TObject);
function FindAndSelectByValue(value:integer):boolean;
function FindAndSelectTeachByValue(value:integer):boolean;
function FindAndSelect:boolean;
function FindAndSelectTeach:boolean;
constructor Create(AOwner:TComponent); override;

function AddRoot : TTreeNode;
property Root : TTreeNode read FRoot write FRoot;
property SearchDataset : TADODataset read FSearchDs write FSearchDs;
property ElementDataset : TADODataset read FElementDS write FElementDS;
property UserLogin : string read FUserLogin write FUserLogin;

published

property Connection: TADOConnection read FConnection write FConnection;
end;


implementation

uses Controls;

procedure TDBDekanatTreeView.SelectNodeByNum(num:integer; IsFocused:boolean);
var DBNode:TDBNodeObject;
begin
DBNode:=Selected.data;
DBNode.AddChildNodes;
if Selected.Count>num then
Select(Selected.Item[num]);
if (IsFocused)and(Visible) then SetFocus;
end;


function TDBDekanatTreeView.FindAndSelect:boolean;
var
Node:TtreeNode;
i,j:integer;
begin
FRoot.Expand(false);
i:=0;
j:=searchDataset.fieldvalues['ik_fac'];
While (i<FRoot.Count)and(TDBNodeFacultyObject(Froot.Item[i].Data).ik<>j) do
inc(i);
if i=FRoot.Count then begin
result:=false;
exit;
end;

Node:=Froot.Item[i];
Node.Expand(false);
i:=0;
j:=searchDataset.FieldValues['ik_spec_fac'];
While (i<Node.Count)and(TDBNodeSpecObject(Node.Item[i].Data).ik<>j) do
inc(i);
if i=Node.Count then begin
result:=false;
exit;
end;
TDBNodeSpecObject(Node.Item[i].Data).showActual:=false;
Select(Node.Item[i]);
RefreshNodeExecute(TTreeNode(Node.Item[i]));
Node:=Node.Item[i];
Node.Expand(false);
i:=0;
j:=searchDataset.FieldValues['ik_grup'];
While (i<Node.Count)and(TDBNodeGroupObject(Node.Item[i].Data).ik<>j) do
inc(i);
if i=Node.Count then begin
result:=false;
exit;
end;
TDBNodeGroupObject(Node.Item[i].Data).ShowStudents:=ssShowAll;
Select(Node.Item[i]);
RefreshNodeExecute(Node.Item[i]);
Node:=Node.Item[i];
Node.Expand(false);
i:=0;
While (i<Node.Count)and(TDBNodeStudObject(Node.Item[i].Data).ik<>searchDataset.FieldValues['ik_zach']) do
inc(i);
if i=Node.Count then begin
result:=false;
exit;
end;

Select(Node.Item[i]);
result:=true;
end;


function TDBDekanatTreeView.FindAndSelectByValue(value:integer):boolean;
begin
searchDataset:=TAdodataset.Create(self);
searchDataset.Connection:=Connection;
searchDataset.Active:=false;
searchDataset.CommandText:='select * from TREE_Stud_Search where ik_zach='''+inttostr(value)+'''';
searchDataset.Active:=true;
searchDataset.First;
result:=FindAndSelect;
end;


function TDBDekanatTreeView.FindAndSelectTeach: boolean;
var
Node:TtreeNode;
i,j:integer;
begin
{Business:=nil;
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
end;}

Node:=self.Selected;

Node.Expand(false);
i:=0;
j:=searchDataset.fieldvalues['ik_fac'];
While (i<Node.Count)and(TDBNodeFacultyDepObject(Node.Item[i].Data).ik<>j) do
inc(i);
if (i=Node.Count) then begin
result:=false;
exit;
end;
Node:=Node.Item[i];
Node.Expand(false);
i:=0;
j:=searchDataset.FieldValues['ik_kaf'];
While (i<Node.Count)and(TDBNodeDepartmentObject(Node.Item[i].Data).ik<>j) do
inc(i);
if i=Node.Count then begin
result:=false;
exit;
end;

Node:=Node.Item[i];
Node.Expand(false);
i:=0;
While (i<Node.Count)and(TDBNodeTeacherObject(Node.Item[i].Data).ik<>searchDataset.FieldValues['itab_n']) do
inc(i);
if i=Node.Count then begin
result:=false;
exit;
end;

Select(Node.Item[i]);
result:=true;
end;

function TDBDekanatTreeView.FindAndSelectTeachByValue(value:integer):boolean;
begin
searchDataset:=TAdodataset.Create(self);
searchDataset.Connection:=Connection;
searchDataset.Active:=false;
searchDataset.CommandText:='select * from TREE_TeachSearch where itab_n='''+inttostr(value)+'''';
searchDataset.Active:=true;
searchDataset.First;
result:=FindAndSelectTeach;
end;


procedure TDBDekanatTreeView.RefreshNodeExecute(Node:TTreeNode);
var
  NodeObj: TDBNodeObject;
  NodeText: string;
  NodeIndex: Integer;
  Expanded: Boolean;
begin
    // Запомним текст и индекс обновляемого узла
    NodeText:=Node.Text;
    NodeIndex:=Node.Index;

    // Определяем, что будет обновляемым узлом: текущий или родительский
    //if (Node.expanded) or (Node.Parent = nil) then
      NodeObj:=Node.Data;
    if NodeObj.node=nil
    then NodeObj:=Node.Data;
    //else
    //  NodeObj:=Node.Parent.Data;

    // Запомним состояние узла до обновления
    Expanded:=Node.Expanded;
    NodeObj.Refresh;

    if Expanded then
    begin
      NodeObj.Node.Expand(false);
      // Переход к запомненному узлу (если он существует)
      if NodeObj.Node.Count > NodeIndex then
        if CompareStr(NodeObj.Node[NodeIndex].Text, NodeText) = 0 then
          NodeObj.Node[NodeIndex].Selected:=true;
    end;
    Self.Change(Node);
  end;


procedure TDBDekanatTreeView.RefreshAllExecute(Sender:TObject);
begin
// Not implemented yet

end;

function TDBDekanatTreeView.GetObject: TDBNodeObject;
begin
result:=Selected.Data;
end;

constructor TDBDekanatTreeView.Create(AOwner:TComponent);
begin

  inherited Create(AOwner);
  Connection:=nil;
end;

function TDBDekanatTreeView.AddElementNode:TTreeNode;
var Node:TTreeNode;
begin
result:=nil;
if ElementDataset.FieldValues['ik_element']=1 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeRootObject);
  TDBNodeRootObject(Node.Data).SetADODataset(Connection);
  TDBNodeRootObject(Node.Data).BaseImageIndex:=1;
  TDBNodeRootObject(Node.Data).Actiongroup:='catUniAct';
  Node.ImageIndex:=1;

end;

if ElementDataset.FieldValues['ik_element']=2 then
begin
   Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeBusinessObject);
      TDBNodeBusinessObject(Node.Data).ShowActual:=true;
      TDBNodeBusinessObject(Node.Data).SetADODataset(Connection);
       TDBNodeBusinessObject(Node.Data).BaseImageIndex:=16;
       TDBNodeBusinessObject(Node.Data).Actiongroup:='catNagruzka';
    Node.ImageIndex:=16;
end;

if ElementDataset.FieldValues['ik_element']=3 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeAbitObject);
   TDBNodeAbitObject(Node.Data).BaseImageIndex:=19;
   TDBNodeAbitObject(Node.Data).SetADODataset(Connection);
   TDBNodeAbitObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=19;
end;

if ElementDataset.FieldValues['ik_element']=4 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodePrikObject);
 Node.HasChildren:=false;
  TDBNodePrikObject(Node.Data).Actiongroup:='catPrikaz';
  Node.ImageIndex:=14;
end;

if ElementDataset.FieldValues['ik_element']=5 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeDictObject);
 Node.HasChildren:=false;
   TDBNodeAbitObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=13;
end;

if ElementDataset.FieldValues['ik_element']=6 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeAdminObject);
 Node.HasChildren:=false;
  TDBNodeAdminObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=30;
end;

if ElementDataset.FieldValues['ik_element']=7 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeMethodWorkObject);
  TDBNodeMethodWorkObject(Node.Data).SetADODataset(Connection);
  TDBNodeMethodWorkObject(Node.Data).Actiongroup:='none';
  TDBNodeMethodWorkObject(Node.Data).BaseImageIndex:=37;
  Node.ImageIndex:=37;
end;
if ElementDataset.FieldValues['ik_element']=8 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeRootScheduleObject);
  TDBNodeRootScheduleObject(Node.Data).SetADODataset(Connection);
  TDBNodeRootScheduleObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=35;
end;
if ElementDataset.FieldValues['ik_element']=9 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeRioObject);
  TDBNodeRioObject(Node.Data).SetADODataset(Connection);
  TDBNodeRioObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=35;
end;

if ElementDataset.FieldValues['ik_element']=10 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBNodeOKObject);
 Node.HasChildren:=false;
  TDBNodeRioObject(Node.Data).Actiongroup:='none';
  Node.ImageIndex:=39;
end;

if ElementDataset.FieldValues['ik_element']=11 then
begin
 Node:=CreateNewNode(nil, ElementDataset.FieldValues['Nameelement'], TDBHostelNodeRoot);
 Node.HasChildren:=true;
  TDBNodeRioObject(Node.Data).Actiongroup:='actHostel';
  TDBNodeRioObject(Node.Data).SetADODataset(Connection);
  Node.ImageIndex:=1;
end;
 result:=Node;
end;

function TDBDekanatTreeView.AddRoot : TTreeNode;
var Node:TTreeNode;
i:integer;
begin
Node:=nil;
ElementDataset:=TADODataSet.Create(self);
ElementDataset.Connection:=FConnection;
ElementDataset.Active:=false;
ElementDataset.CommandType:=cmdTable;
ElementDataset.CommandText:='VisualElementsForCurrentUser';
ElementDataset.Active:=true;
ElementDataset.First;
ElementDataset.Sort:='iOrder';

for i:=0 to (ElementDataset.RecordCount-1) do
begin
if (ElementDataset.FieldValues['ik_Element']=1) then Node:=AddElementNode else
AddElementNode;
ElementDataset.Next;
end;

result:=Node;

end;

end.


