(*
  Модуль    : DBTVHabitatsObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Проживающие" в дереве
*)
unit DBTVHabitatsObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVHabitatsHostObj,
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
  TDBNodeHabitatsObject = class (TDBNodeObject)
  private
  FName:string;
  //FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;

  end;

implementation

function TDBNodeHabitatsObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
 Dataset.CommandType:=cmdText;

 Dataset.CommandText:='select * from Host_Hostel';
 Dataset.Active:=true;
 Result := Dataset;
 Node.HasChildren:=Dataset.RecordCount>0;
end;


procedure TDBNodeHabitatsObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBNode:TDBNodeHabitatsHostObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeHabitatsHostObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Actiongroup:='catHabitatHost';
DBNode.DataSet:=dataset;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=1;
new.ImageIndex:=DBNode.BaseImageIndex;
new.Data:=DBnode;

end;

function TDBNodeHabitatsObject.DoAddChildNodes: Boolean;
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



