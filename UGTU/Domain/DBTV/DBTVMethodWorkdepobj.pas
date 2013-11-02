(*
  Модуль    : DBTVMethodWorkdepobj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект кафедра для методической работыв дереве
*)
unit DBTVMethodWorkdepobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVGroupObj,
  DBTVMethodWorkTeacherobj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
    TDBNodeMethodWorkDepartmentObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FIK:integer;
      FDataSet: TADODataSet;

    protected
      function DoAddChildNodes: Boolean; override;
    public
    constructor Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string;ik:integer; Firstname, middlename, lastname: string; kaf:integer);
      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;

    end;

implementation

uses  DBTVDekanat;

constructor TDBNodeMethodWorkDepartmentObject.Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
begin
inherited Create(new,TreeView,terminate);
Actiongroup:='none';
end;

function TDBNodeMethodWorkDepartmentObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
AdoDataset.CommandType:=cmdText;
AdoDataset.CommandText:='select * from TREE_GetMWTeachers('''+TDBDekanatTreeView(Self.TreeView).UserLogin+''') where (ik_kaf = '+inttostr(IK) + ') and iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep Where ik_kaf = '+inttostr(IK) + ') order by FIO';
 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then Node.HasChildren:=false;
 result:=AdoDataset;
end;

procedure TDBNodeMethodWorkDepartmentObject.AddChild(Caption:string;ik:integer; Firstname, middlename, lastname: string; kaf:integer);
var new:TTreeNode;
DBnode:TDBNodeMethodWorkTeacherObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBnode:=TDBNodeMethodWorkTeacherObject.create(new,TreeView,false);
DBnode.ik:=ik;
DBnode.KafIK:= kaf;
DBnode.name:=Caption;
DBnode.FirstName:=Firstname;
DBnode.MiddleName:=middlename;
DBnode.LastName:=lastname;
//DBnode.DegreeName:= degree;
//DBnode.RankName:= rank;
//DBnode.CapacityName:= capacity;
  //DBnode.BaseImageIndex:=33;
  //DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=18;
new.Data:=DBnode;
new.ImageIndex:=DBnode.BaseImageIndex;
//TreeView.Items.AddChild(new,'');

end;

function TDBNodeMethodWorkDepartmentObject.DoAddChildNodes: Boolean;
var i:integer;
begin
Node.DeleteChildren;
SetADODataset(AdoDataSet.Connection);
AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
AddChild(AdoDataset.FieldValues['FIO'], AdoDataset.FieldValues['Itab_n'],
AdoDataset.FieldValues['cfirstName'],AdoDataset.FieldValues['cotch'],AdoDataset.FieldValues['clastName'],AdoDataset.FieldValues['ik_kaf']);
AdoDataset.prior;
end;
Result:=true;
end;

end.

