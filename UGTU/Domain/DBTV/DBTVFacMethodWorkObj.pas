(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет с кафедрами для методической работы в дереве
*)
unit DBTVFacMethodWorkObj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVSpecObj,
  DBTVGroupObj,
    DBTVMethodWorkdepobj,
  DBTVFacobj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
  TDBNodeMetodWorkFacultyObject = class (TDBNodeFacultyObject)
  private

  protected

    function DoAddChildNodes: Boolean; override;

  public
  constructor Create(new:TTreeNode;TreeView:TTreeView);
  function SetADODataset(Connection:TAdoConnection):TAdodataset;

  procedure AddChild(Caption:string;Sname:string;ik:integer);


  end;

implementation

constructor TDBNodeMetodWorkFacultyObject.Create(new:TTreeNode;TreeView:TTreeView);
begin
Self.TreeView:=TreeView;
self.Node:=new;
Actiongroup:='none';
end;

function TDBNodeMetodWorkFacultyObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Connection;
  AdoDataset.CommandType:=cmdText;
  AdoDataset.CommandText:='select * from TREE_MethodWork_dep where ik_fac='''+inttostr(IK)+''' order by CName_kaf';
  AdoDataset.Active:=true;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false else Node.HasChildren:=true;
  Result := AdoDataset;
end;

procedure TDBNodeMetodWorkFacultyObject.AddChild(Caption:string;Sname:string;ik:integer);
var new:TTreeNode;
DBnode:TDBNodeMethodWorkDepartmentObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBnode:=TDBNodeMethodWorkDepartmentObject.create(new,TreeView,false);
DBNode.ik:=ik;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption;
//DBnode.ShowActual:=true;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
//DBNode.ShowStudents:=ssShowAll;
new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;

//TreeView.Items.AddChild(new,'');

end;

function TDBNodeMetodWorkFacultyObject.DoAddChildNodes: Boolean;
var i:integer;
begin
Node.DeleteChildren;

AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
AddChild(AdoDataset.FieldValues['CName_kaf'],AdoDataset.FieldValues['Cshort_name_kaf'],AdoDataset.FieldValues['ik_kaf']);
AdoDataset.Prior;
end;   
Result:=true;
end;

end.

