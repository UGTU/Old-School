(*
  Модуль    : DBTVRIOObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект РИО в дереве
*)
unit DBTVRIOObj;
{#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVAbitYearObj,
   DBTVZachObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DateUtils,
  DBTVRIOYearObj;


  type
  TDBNodeRioObject = class (TDBNodeObject)
  private
  FName:string;
  FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;
    property ShowAllYears:boolean read FShowAllYears write FShowAllYears;
  end;

implementation

function TDBNodeRioObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;
 Dataset.CommandText:='select * from TREE_RIOYears';
  Dataset.Active:=true;
 Result := Dataset;
end;


procedure TDBNodeRioObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBNode:TDBNodeRIOYearObject;  
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeRIOYearObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Actiongroup:='catRIOYear';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=28;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;


end;

function TDBNodeRioObject.DoAddChildNodes: Boolean;
var 
i:integer;
begin
  Node.DeleteChildren;

SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
AddChild('Год '+inttostr(Dataset.FieldValues['year']),Dataset.FieldValues['id']);
Dataset.next;
end;
Result:=true;

end;

end.



