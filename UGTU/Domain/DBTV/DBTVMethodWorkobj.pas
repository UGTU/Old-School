(*
  Модуль    : DBTVMetodWorkobj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Учебно-методическая работа в дереве
*)
unit DBTVMethodWorkobj;
{#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacMethodWorkObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeMethodWorkObject = class (TDBNodeObject)
  private
  FDataSet: TADODataSet;
  FName:string;
  protected
    function DoAddChildNodes: Boolean; override;
  public
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

function TDBNodeMethodWorkObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
 AdoDataset.CommandType:=cmdTable;
 AdoDataset.CommandText:='TREE_MethodWork_faculties';

 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then
   Node.HasChildren:=false;
 Result := AdoDataset;
end;

procedure TDBNodeMethodWorkObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBnode:TDBNodeMetodWorkFacultyObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeMetodWorkFacultyObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=3;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(AdoDataset.Connection);
new.Data:=DBnode;


end;

function TDBNodeMethodWorkObject.DoAddChildNodes: Boolean;
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



