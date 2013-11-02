(*
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Комната" ветки "Проживающие" в дереве
*)
unit DBTVHabitatsRoomObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
DBTVHabitatsPersonObj,
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
  TDBNodeHabitatsRoomObject = class (TDBNodeObject)
  private
  FName:string;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    ik:integer;
    ik_hostel:integer;

    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeHabitatsRoomObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from HOST_SpProzhInRoom_View Where ik_address = '+inttostr(ik);
 Dataset.Active:=true;
 Result := Dataset;
  Node.HasChildren:=Dataset.RecordCount>0;
end;


procedure TDBNodeHabitatsRoomObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBNode:TDBNodeHabitatsPersonObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeHabitatsPersonObject.create(new,TreeView);
DBNode.ncode:=IK;
DBNode.Actiongroup:='catHostelPerson';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;
end;

function TDBNodeHabitatsRoomObject.DoAddChildNodes: Boolean;
var
i:integer;
begin

Node.DeleteChildren;
SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['ncode']=NULL)) then
AddChild(Dataset.FieldValues['StudName'],Dataset.FieldValues['ncode']);
Dataset.next;
end;
Result:=true;
end;

end.



