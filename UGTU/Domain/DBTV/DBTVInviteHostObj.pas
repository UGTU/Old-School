(*
  Модуль    : DBTVAbitObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVInviteHostObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVObj,
  DBTVHostelRequestObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DateUtils;


  type
  TDBNodeInviteHostObject = class (TDBNodeObject)
  private
  FName:string;
  //FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    ik:integer;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;ncode:integer);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeInviteHostObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from HOST_SpisokZayav_View where NumHostel = '+inttostr(ik);
 Dataset.Active:=true;
 Result := Dataset;
  Node.HasChildren:=Dataset.RecordCount>0;
end;


procedure TDBNodeInviteHostObject.AddChild(Caption:string;IK:integer;ncode:integer);
var new:TTreeNode;
DBNode:TDBNodeHostelRequestObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeHostelRequestObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.ncode:=ncode;
DBNode.Actiongroup:='catHostelRequest';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeInviteHostObject.DoAddChildNodes: Boolean;
var
i:integer;
begin

Node.DeleteChildren;
SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['IDZayavlenie']=NULL)) then
AddChild(Dataset.FieldValues['StudName'],Dataset.FieldValues['IDZayavlenie'], Dataset.FieldValues['nCode']);
Dataset.next;
end;
Result:=true;

end;

end.



