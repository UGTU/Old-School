(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет в дереве
*)
unit DBTVFacobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVSpecObj,
  DBTVGroupObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
  TDBNodeFacultyObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;
  FDataSet: TADODataSet;

  protected

    function DoAddChildNodes: Boolean; override;

  public
  constructor Create;
  function SetADODataset(Connection:TAdoConnection):TAdodataset;
  procedure AddChild(Caption:string;Sname:string;ik:integer;years:integer;direct:string; id_fe:integer; name_fe:string);
  property Name: string read FName write FName;
  property ik: integer read Fik write Fik;
  property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
  end;

implementation

constructor TDBNodeFacultyObject.Create;
begin
inherited Create;
Actiongroup:='catFacAct';
end;

function TDBNodeFacultyObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Connection;
  AdoDataset.CommandType:=cmdText;
  AdoDataset.CommandText:='select * from TREE_specialties where ik_fac='''+inttostr(IK)+''' ORDER BY Ik_form_ed,sortorder,Cname_spec';    // order by Ik_form_ed, CName_spec
  AdoDataset.Active:=true;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false
    else  Node.HasChildren:=true;
  Result := AdoDataset;
end;

procedure TDBNodeFacultyObject.AddChild(Caption:string;Sname:string;ik:integer;years:integer;direct:string; id_fe:integer; name_fe:string);
var new:TTreeNode;
DBnode:TDBNodeSpecObject;
begin
//Node.Text:=Node.Text;
new:=TreeView.Items.AddChildFirst(Node,Caption{+' ('+direct+')'});
DBnode:=TDBNodeSpecObject.create(new,TreeView);
DBNode.ik:=ik;
DBNode.ShortName:=Sname;
DBNode.Name:=Caption+' ('+direct+')';
DBnode.StudyYears:=years;
DBnode.ShowActual:=true;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=5;
DBNode.ShowStudents:=ssShowActualOnly;

DBnode.EdFormKey:= id_fe;
DBnode.EdFormName:= name_fe;

new.Data:=DBnode;
new.ImageIndex:=DBNode.BaseImageIndex;

//TreeView.Items.AddChild(new,'');

end;

function TDBNodeFacultyObject.DoAddChildNodes: Boolean;
var i:integer;
   shSpec: string;
   nfe, lfe:string;
begin
Node.DeleteChildren;

AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
  if AdoDataset.FieldValues['Sh_spec']<>NULL then shSpec := AdoDataset.FieldValues['Sh_spec'] + ' - ' else shSpec := '';

  {nfe:=AdoDataset.FieldValues['CName_form_ed'];
  if (AdoDataset.FieldValues['ik_form_ed']>1) then
  lfe:='('+nfe[1]+') ' else}
  lfe:='';

AddChild(shSpec+lfe+AdoDataset.FieldValues['CName_spec'],AdoDataset.FieldValues['Cshort_spec'],AdoDataset.FieldValues['ik_spec_fac'],AdoDataset.FieldValues['nn_studyyears'],AdoDataset.FieldValues['cname_direction'], AdoDataset.FieldValues['ik_form_ed'], nfe);
AdoDataset.Prior;
end;
Result:=true;
end;

end.
