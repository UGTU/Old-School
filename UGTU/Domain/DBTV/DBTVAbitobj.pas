(*
  Модуль    : DBTVAbitObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVAbitobj;
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
  DateUtils;


  type
  TDBNodeAbitObject = class (TDBNodeObject)
  private
  FName:string;
  FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
    property Name: string read FName write FName;
    property ShowAllYears:boolean read FShowAllYears write FShowAllYears;
  end;

implementation

function TDBNodeAbitObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;
 if ShowAllYears then
 Dataset.CommandText:='select * from TREE_ABIT_Recruit' else
 Dataset.CommandText:='select * from TREE_ABIT_Recruit where NNYear='''+inttostr(YearOf(Date))+'''';
 Dataset.Active:=true;
 Result := Dataset;
end;


procedure TDBNodeAbitObject.AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
var new:TTreeNode;
DBNode:TDBNodeAbitYearObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeAbitYearObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Actiongroup:='catAbitYear';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.HasAddSpec:=HasAddSpec;
DBNode.BaseImageIndex:=28;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeAbitObject.DoAddChildNodes: Boolean;
var 
i:integer;
begin
  Node.DeleteChildren;

SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['NNYear']=NULL)) then
AddChild('Год '+inttostr(Dataset.FieldValues['NNYear']),Dataset.FieldValues['NNYear'],Dataset.FieldValues['HasDopSpec']);
Dataset.next;
end;
Result:=true;

end;

end.



