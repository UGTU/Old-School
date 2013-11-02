(*
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Этаж" ветки "Проживающие" в дереве
*)
unit DBTVHabitatsFloorObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
DBTVHabitatsRoomObj,
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
  TDBNodeHabitatsFloorObject = class (TDBNodeObject)
  private
  FName:string;
  //FShowAllYears: boolean;

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

function TDBNodeHabitatsFloorObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from Host_SpisokRoom_View Where NumEtazh = '+inttostr(ik);
 Dataset.Active:=true;
 Result := Dataset;
  Node.HasChildren:=Dataset.RecordCount>0;
end;


procedure TDBNodeHabitatsFloorObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBNode:TDBNodeHabitatsRoomObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeHabitatsRoomObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Actiongroup:='catHostelRoom';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.ik_hostel:=ik_hostel;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeHabitatsFloorObject.DoAddChildNodes: Boolean;
var
i:integer;
begin

Node.DeleteChildren;
SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['ik_address']=NULL)) then
AddChild('Комната №'+Dataset.FieldValues['FlatNumber'],Dataset.FieldValues['ik_address']);

Dataset.next;
end;
Result:=true;
end;

end.



