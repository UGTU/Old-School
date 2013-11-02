(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет с кафедрами в дереве
*)

unit DBTVFacDepobj;
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
  Variants;

  type
  TDBNodeFacultyDepObject = class (TDBNodeFacultyObject)
  private
  FIK_semtype:integer;
  FIK_Year:integer;
  FShowAllKaf:boolean;
  protected

    function DoAddChildNodes: Boolean; override;

  public
  constructor Create(new:TTreeNode;TreeView:TTreeView);
  function SetADODataset(Connection:TAdoConnection):TAdodataset;

  procedure AddChild(Caption:string;Sname:string;ik:integer);
  property IK_Semtype: integer read FIK_semtype write FIK_semtype;
  property IK_Year: integer read FIK_Year write FIK_Year;
  property ShowAllKaf: boolean read FShowAllKaf write FShowAllKaf;

  end;

implementation

constructor TDBNodeFacultyDepObject.Create(new:TTreeNode;TreeView:TTreeView);
begin
Self.TreeView:=TreeView;
self.Node:=new;
Actiongroup:='catNagruzkaFac';
end;

function TDBNodeFacultyDepObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
var CurrentYear:integer;
begin
  //showmessage('departments dataset setup');

  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Connection;
  AdoDataset.CommandType:=cmdText;
  if ShowAllKaf then
  begin
  AdoDataset.CommandText:='select * from TREE_nagr_departments where ik_fac='''+inttostr(IK)+''' order by CName_kaf'
  end
  else
  begin
  AdoDataset.CommandText := 'select * from Year_uch_pl where (ik_year_uch_pl = '''+inttostr(FIK_Year)+''')';
  AdoDataset.Active:=true;
  AdoDataset.First;

  CurrentYear := AdoDataset.FieldByName('year_value').Value;
  //showmessage(inttostr(CurrentYear));
  AdoDataset.Active:=false;
  AdoDataset.CommandText:='select * from TREE_nagr_departments where (ik_fac='''+inttostr(IK)+''') and ((YearExit is Null) or (YearExit >'''+inttostr(CurrentYear)+''')) order by CName_kaf'
  end;

  AdoDataset.Active:=true;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false else Node.HasChildren:=true;
  Result := AdoDataset;
end;

procedure TDBNodeFacultyDepObject.AddChild(Caption:string;Sname:string;ik:integer);
var new:TTreeNode;
DBnode:TDBNodeDepartmentObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBnode:=TDBNodeDepartmentObject.create(new,TreeView,false);
DBNode.ik:=ik;
DBnode.IK_Semtype:= IK_Semtype;
DBnode.IK_Year:= IK_Year;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption;
//DBnode.ShowActual:=true;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
//DBNode.ShowStudents:=ssShowAll;
new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;

//TreeView.Items.AddChild(new,'');

end;

function TDBNodeFacultyDepObject.DoAddChildNodes: Boolean;
var i:integer;
begin
Node.DeleteChildren;
SetADODataset(AdoDataSet.Connection);
AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
AddChild(AdoDataset.FieldValues['CName_kaf'],AdoDataset.FieldValues['Cshort_name_kaf'],AdoDataset.FieldValues['ik_kaf']);
AdoDataset.Prior;
end;   
Result:=true;
end;

end.
 