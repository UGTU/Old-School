(*
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Заселение" в дереве
*)
unit DBTVInviteObj;
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
  DBTVInviteHostObj;


  type
  TDBNodeInviteObject = class (TDBNodeObject)
  private
  FName:string;
  ik:integer;
  //FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeInviteObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from Host_Hostel';
 Dataset.Active:=true;
 Node.HasChildren:=Dataset.RecordCount>0;

 Result := Dataset;
end;


procedure TDBNodeInviteObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBNode:TDBNodeInviteHostObject;
begin
new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeInviteHostObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Actiongroup:='catHOST';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeInviteObject.DoAddChildNodes: Boolean;
var 
i:integer;
begin

Node.DeleteChildren;
SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['NumHostel']=NULL)) then
AddChild('Общежитие №'+inttostr(Dataset.FieldValues['NumHostel']),Dataset.FieldValues['NumHostel']);
Dataset.next;
end;
Result:=true;

end;

end.



