(*
  Модуль    : DBTVRootObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Расписание в дереве
*)
unit DBTVRootScheduleobj;
interface
uses  Dialogs,
  DBTVFacDepObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DBTVSemesterScheduleobj;


  type
  TDBNodeRootScheduleObject = class (TDBNodeObject)
  private
  FDataSet: TADODataSet;
  FName:string;


  protected
    function DoAddChildNodes: Boolean; override;
  public
    procedure AddChild(Caption:string;IK:integer;semtype:integer);
    property Name: string read FName write FName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

function TDBNodeRootScheduleObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
 //AdoDataset.CommandType:=cmdTable;
 AdoDataset.CommandText:='SELECT * FROM TREE_ScheduleSemesters order by ik_year_uch_pl';
 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then
   Node.HasChildren:=false;
 Result := AdoDataset;
end;

procedure TDBNodeRootScheduleObject.AddChild(Caption:string;IK:integer; semtype:integer);
var new:TTreeNode;
DBnode:TDBNodeSemesterScheduleObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeSemesterScheduleObject.create(new,TreeView);
DBNode.IK_Year:=IK;
DBnode.IK_Semtype:=semtype;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=16;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(AdoDataset.Connection);
new.Data:=DBnode;

end;

function TDBNodeRootScheduleObject.DoAddChildNodes: Boolean;
begin
  Node.DeleteChildren;
  AdoDataset.First;
  while not AdoDataset.Eof do
  begin
    AddChild(AdoDataset.FieldValues['sem_name'],AdoDataset.FieldValues['ik_year_uch_pl'],AdoDataset.FieldValues['ik_sem_type']);
    AdoDataset.Next;
end;
Result:=true;
end;

end.


