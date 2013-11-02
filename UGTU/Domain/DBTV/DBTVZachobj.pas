(*
  Модуль    : DBTVZachislObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Зачисление в дереве
*)
unit DBTVZachobj;
{#Author sergdev@ist.ugtu.net}
//{$DEFINE ALPHA}
interface
uses  Dialogs,
  DBTVFacZachObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeZachObject = class (TDBNodeObject)
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

function TDBNodeZachObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
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

procedure TDBNodeZachObject.AddChild(Caption:string;IK:integer;NNyear:integer);
var new:TTreeNode;
DBnode:TDBNodeFacZachObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeFacZachObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Year:=NNYear;
DBNode.Name:=Caption;
DBNode.Actiongroup:='none';
DBNode.BaseImageIndex:=3;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(Dataset.Connection);
new.Data:=DBnode;


end;

function TDBNodeZachObject.DoAddChildNodes: Boolean;
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


