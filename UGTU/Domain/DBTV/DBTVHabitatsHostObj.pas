(*
  Модуль    : DBTVHabitatsHostObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Общежитие" ветки "Проживающие" в дереве
*)
unit DBTVHabitatsHostObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVHabitatsFloorObj,
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
  TDBNodeHabitatsHostObject = class (TDBNodeObject)
  private
  FName:string;
  //FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    ik:integer;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;numhostel:integer);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeHabitatsHostObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from Host_Floors Where NumHostel = '+inttostr(ik);
 Dataset.Active:=true;
 Result := Dataset;
 Node.HasChildren:=Dataset.RecordCount>0;
end;


procedure TDBNodeHabitatsHostObject.AddChild(Caption:string;IK:integer;numhostel:integer);
var new:TTreeNode;
DBNode:TDBNodeHabitatsFloorObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeHabitatsFloorObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.ik_hostel:=numhostel;
DBNode.Actiongroup:='catFloor';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeHabitatsHostObject.DoAddChildNodes: Boolean;
var
i:integer;
begin
Node.DeleteChildren;
SetADODataset(DataSet.Connection);
Dataset.First;
for i:=0 to (Dataset.RecordCount-1) do
begin
if (not (Dataset.FieldValues['NumEtazh']=NULL)) then
AddChild('Этаж №'+inttostr(Dataset.FieldValues['NumEtazh']),Dataset.FieldValues['NumEtazh'],Dataset.FieldValues['NumHostel']);
Dataset.next;
end;
Result:=true;
end;

end.



