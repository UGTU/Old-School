(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет в дереве ABIT
*)
unit DBTVFacRecObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVSpecRecObj,
  DBTVGroupObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
  TDBNodeFacRecObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;
  FYear:integer;
  FDataSet: TADODataSet;

  protected

    function DoAddChildNodes: Boolean; override;

  public
  function SetADODataset(Connection:TAdoConnection):TAdodataset;

  procedure AddChild(Caption:string;Sname:string;ik:integer;NNrec:integer;NNyear:integer;direct:string;id_fe:integer; name_fe:string);

  property Name: string read FName write FName;
  property ik: integer read Fik write Fik;
  property Year: integer read FYear write FYear;
  property AdoDataset: TAdoDataSet read FDataSet write FDataSet;


  end;

implementation



function TDBNodeFacRecObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
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

procedure TDBNodeFacRecObject.AddChild(Caption:string;Sname:string;ik:integer;NNrec:integer;NNyear:integer;direct:string;id_fe:integer; name_fe:string);
var new:TTreeNode;
DBnode:TDBNodeSpecrecObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption+' ('+direct+')');
DBnode:=TDBNodeSpecRecObject.create(new,TreeView);
DBNode.ik:=ik;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption+' ('+direct+')';
DBNode.NNRecord:=NNrec;
DBNode.Year:=NNYear;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
DBnode.ShowCurrent:=true;
DBnode.ShowChecked:=true;

DBnode.EdFormKey:= id_fe;
DBnode.EdFormName:= name_fe;

new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;

//TreeView.Items.AddChild(new,'');

end;

function TDBNodeFacRecObject.DoAddChildNodes: Boolean;
var i:integer;
nfe, lfe:string;
begin
Node.DeleteChildren;

AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
  nfe:=AdoDataset.FieldValues['CName_form_ed'];
  if (AdoDataset.FieldValues['ik_form_ed']>1) then
  lfe:='('+nfe[1]+') ' else
  lfe:='';

AddChild(lfe+AdoDataset.FieldValues['CName_spec'],AdoDataset.FieldValues['Cshort_spec'],AdoDataset.FieldValues['ik_spec_fac'],AdoDataset.FieldValues['NNRecord'],AdoDataset.FieldValues['NNyear'],AdoDataset.FieldValues['cname_direction'],AdoDataset.FieldValues['ik_form_ed'], nfe);
AdoDataset.Prior;
end;
Result:=true;
end;

end.
 