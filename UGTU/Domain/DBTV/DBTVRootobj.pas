(*
  Модуль    : DBTVRootObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект корень в дереве
*)
unit DBTVRootobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeRootObject = class (TDBNodeObject)
  private
  FDataSet: TADODataSet;
  RootName:string;


  protected
    function DoAddChildNodes: Boolean; override;
  public
   constructor Create;
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read RootName write RootName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

constructor TDBNodeRootObject.Create();
begin
  inherited Create;
  Actiongroup:='catUniAct';
end;


function TDBNodeRootObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
 AdoDataset.CommandType:=cmdTable;
 AdoDataset.CommandText:='TREE_faculties';
 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then
   Node.HasChildren:=false;
 Result := AdoDataset;
end;

procedure TDBNodeRootObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBnode:TDBNodeFacultyObject;
begin
new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeFacultyObject.create;
DBNode.ik:=IK;
DBNode.Name:=Caption;
DBNode.node:=new;
DBNode.TreeView:=TreeView;
DBNode.BaseImageIndex:=3;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBNode.node:=new;
end;

function TDBNodeRootObject.DoAddChildNodes: Boolean;
begin
  Node.DeleteChildren;
  AdoDataset.First;
  while not AdoDataset.Eof do
  begin
    AddChild(AdoDataset.FieldValues['CName_fac'],AdoDataset.FieldValues['IK_fac']);
    AdoDataset.Next;
end;
Result:=true;
end;

end.


