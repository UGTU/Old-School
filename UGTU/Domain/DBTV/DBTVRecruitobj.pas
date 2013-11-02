(*
  Модуль    : DBTVRootObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Набор в дереве
*)
unit DBTVRecruitobj;
{#Author sergdev@ist.ugtu.net}
//{$DEFINE ALPHA}
interface
uses  Dialogs,
  DBTVFacRecObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeRecruitObject = class (TDBNodeObject)
  private
  Fik:integer;
  FName:string;


  protected
    function DoAddChildNodes: Boolean; override;
  public
    procedure AddChild(Caption:string;IK:integer;NNyear:integer);
    property Name: string read FName write FName;
  
    property ik:integer read Fik write Fik;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

function TDBNodeRecruitObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdtEXT;
 Dataset.CommandText:='select * from TREE_Abit_faculties where NNYear='''+inttostr(ik)+'''';
 Dataset.Active:=true;
 if (Dataset.RecordCount=0) then
   Node.HasChildren:=false else
   Node.HasChildren:=true;
 Result := Dataset;
end;

procedure TDBNodeRecruitObject.AddChild(Caption:string;IK:integer;NNyear:integer);
var new:TTreeNode;
DBnode:TDBNodeFacRecObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeFacRecObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Year:=NNYear;
DBNode.Name:=Caption;
DBNode.Actiongroup:='catFacRecruit';
DBNode.BaseImageIndex:=3;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(Dataset.Connection);
new.Data:=DBnode;


end;

function TDBNodeRecruitObject.DoAddChildNodes: Boolean;
begin
  Node.DeleteChildren;
  Dataset.First;
  while not Dataset.Eof do
  begin
    AddChild(Dataset.FieldValues['CName_fac'],Dataset.FieldValues['IK_fac'],Dataset.FieldValues['NNyear']);
    Dataset.Next;
end;
Result:=true;
end;

end.


