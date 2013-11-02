(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет с кафедрами в дереве для расписания
*)

unit DBTVFacScheduleobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVSpecObj,
  DBTVGroupObj,
    DBTVDepObj,
  DBTVFacobj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants,
  DBTVDepScheduleObj;

  type
  TDBNodeFacultyScheduleObject = class (TDBNodeFacultyObject)
  private
   FIK_Year:integer;
   FIK_SemesterType: integer;
   FIK: integer;
  protected

    function DoAddChildNodes: Boolean; override;

  public
    property  IK_SemesterType: integer read FIK_SemesterType write FIK_SemesterType;
    property  IK_Year:integer read FIK_Year write FIK_Year;
    property  IK:integer read FIK write FIK;
  constructor Create(new:TTreeNode;TreeView:TTreeView);

  function SetADODataset(Connection:TAdoConnection):TAdodataset;
  procedure AddChild(Caption:string;Sname:string;ik:integer);


  end;

implementation

constructor TDBNodeFacultyScheduleObject.Create(new:TTreeNode;TreeView:TTreeView);
begin
Self.TreeView:=TreeView;
self.Node:=new;
Actiongroup:='catScheduleFac';
end;

function TDBNodeFacultyScheduleObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Connection;
  AdoDataset.CommandType:=cmdText;
  AdoDataset.CommandText:='select * from TREE_schedule_departments where ik_fac='''+inttostr(IK)+''' order by CName_kaf';
  AdoDataset.Active:=true;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false else Node.HasChildren:=true;
  Result := AdoDataset;
end;

procedure TDBNodeFacultyScheduleObject.AddChild(Caption:string;Sname:string;ik:integer);
var new:TTreeNode;
DBnode:TDBNodeScheduledepartmentObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBnode:=TDBNodeScheduledepartmentObject.create(new,TreeView,false);
DBNode.ik:=ik;
DBnode.IK_SemesterType:=IK_Semestertype;
DBnode.IK_year:=IK_year;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption;
//DBnode.ShowActual:=true;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
//DBNode.ShowStudents:=ssShowAll;
new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;
new.HasChildren:= false;
//TreeView.Items.AddChild(new,'');

end;

function TDBNodeFacultyScheduleObject.DoAddChildNodes: Boolean;
var i:integer;
begin
Node.DeleteChildren;

AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
AddChild(AdoDataset.FieldValues['CName_kaf'],AdoDataset.FieldValues['Cshort_name_kaf'],AdoDataset.FieldValues['ik_kaf']);
AdoDataset.Prior;
end;   
Result:=true;
end;

end.

