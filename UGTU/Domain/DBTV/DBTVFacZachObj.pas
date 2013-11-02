(*
  Модуль    : DBTVStudObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Факультет в дереве
*)
unit DBTVFacZachObj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants,
  Classes,
  DBTVFacRecObj,
  DBTVSpecZachObj;
  type
    TDBNodeFacZachObject = class (TDBNodeObject)
    private
    FName:string;
  FIK:integer;
  FYear:integer;
  FDataSet: TADODataSet;

     protected
      function DoAddChildNodes: Boolean; override;
     public
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;Sname:string;ik:integer;NNrec:integer;direct:string);
     property Name: string read FName write FName;
  property ik: integer read Fik write Fik;
  property Year: integer read FYear write FYear;
  property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    end;

implementation

function TDBNodeFacZachObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Connection;
  AdoDataset.CommandType:=cmdText;
  AdoDataset.CommandText:='select * from TREE_ABIT_specialties where ik_fac='''+inttostr(IK)+''' and nnyear='''+inttostr(year)+''' order by CName_spec';
  AdoDataset.Active:=true;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false;
  Result := AdoDataset;
end;

procedure TDBNodeFacZachObject.AddChild(Caption:string;Sname:string;ik:integer;NNrec:integer;direct:string);
var new:TTreeNode;
DBnode:TDBNodeSpeczachObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption+' ('+direct+')');
DBnode:=TDBNodeSpecZachObject.create(new,TreeView); // !!!!!!!!
DBNode.ik:=ik;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption+' ('+direct+')';
DBNode.NNRecord:=NNrec;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
DBnode.Node.HasChildren:=false;
DBNode.Actiongroup:='none';
new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;

//TreeView.Items.AddChild(new,'');

end;

function TDBNodeFacZachObject.DoAddChildNodes: Boolean;
var i:integer;
begin
Node.DeleteChildren;

AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
AddChild(AdoDataset.FieldValues['CName_spec'],AdoDataset.FieldValues['Cshort_spec'],AdoDataset.FieldValues['ik_spec_fac'],AdoDataset.FieldValues['NNRecord'],AdoDataset.FieldValues['cname_direction']);
AdoDataset.Prior;
end;
Result:=true;
end;
end.
