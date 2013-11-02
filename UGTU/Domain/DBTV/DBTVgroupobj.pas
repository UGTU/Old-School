(*
  Модуль    : DBTVGroupObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект группа в дереве
*)
unit DBTVgroupobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVStudObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type TShowStud = (ssShowAll,ssShowExiledOnly,ssShowActualOnly,ssShowAcademOnly) ;
  type TShowStudSet = set of TShowStud;

  type
  TDBNodeGroupObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;
  FUchPlanIK:integer;
  FFoundYear:integer;
  FDataSet: TADODataSet;
  FShowStudents: TShowStud;
  FDateCreate: TDateTime;
  FDateExit: TDateTime;

  protected
    function DoAddChildNodes: Boolean; override;
  public
  constructor Create(Node:TTreeNode; TreeView:TTreeView); override;
    function SetADODataset(Conn:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;ik:integer);
    property Name: string read FName write FName;
    property ik: integer read Fik write Fik;
    property FoundYear: integer read FFoundYear write FFoundYear;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    property ShowStudents: TShowStud read FShowStudents write FShowStudents;
    property UchPlanIK: integer read FUchPlanIK write FUchPlanIK;
    property DateCreate: TDateTime read FDateCreate write FDateCreate;
    property DateExit: TDateTime read FDateExit write FDateExit;
  end;

implementation

constructor TDBNodeGroupObject.Create(Node:TTreeNode; TreeView:TTreeView);
begin
  inherited Create(Node,TreeView);
  Actiongroup:='catGroupAct';
end;

function TDBNodeGroupObject.SetADODataset(Conn:TAdoConnection):TAdodataset;
begin
  AdoDataset:= TAdoDataSet.Create(TreeView);
  AdoDataset.Connection:=Conn;
  AdoDataset.active:=false;
  AdoDataset.CommandType:=cmdText;
  AdoDataset.CommandText:='select * from Tree_student where (ik_grup='+inttostr(IK)+')';
  if ShowStudents=ssShowExiledOnly then
    AdoDataset.CommandText:=AdoDataset.CommandText+' and (ikTypePricOtch=''2'' )' else
  if ShowStudents=ssShowActualOnly then
    AdoDataset.CommandText:=AdoDataset.CommandText+' and (Ik_prikazOtch IS NULL)' else
  if ShowStudents=ssShowAcademOnly then
    AdoDataset.CommandText:=AdoDataset.CommandText+' and (ikTypePricZach=''3'')';
  AdoDataset.CommandText:=AdoDataset.CommandText+' Order by NameStud' ;
  AdoDataset.Open;
  if (AdoDataset.RecordCount=0) then
    Node.HasChildren:=false;
  Result := AdoDataset;
end;



procedure TDBNodeGroupObject.AddChild(Caption:string;ik:integer);
var new:TTreeNode;
DBnode:TDBNodeStudObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBNode:=TDBNodeStudObject.create(new,TreeView);
DBNode.ik:=ik;
DBNode.id:=ik;
DBNode.RecordbookKey:=ik;
DBNode.name:=Caption;
DBnode.BaseImageIndex:=9;
new.ImageIndex:=DBnode.BaseImageIndex;
DBNode.Node:=new;
//если приказа об отчислении есть
if (AdoDataSet.FieldValues['Ik_prikazOtch']<>NULL) then
begin
DBnode.State:=ssGhost;
  DBnode.BaseImageIndex:=25;
new.ImageIndex:=DBnode.BaseImageIndex;
end
else
begin
	//если причина зачисления в группу - восстановление из академки
	//и приказа о зачислении ещё нет, студент считается в академке
	if (AdoDataSet.FieldValues['ik_pricZach']='13')and((AdoDataSet.FieldValues['Ik_prikazZach']=NULL)) then
	begin
		DBNode.State:=ssAcadem;
		DBnode.BaseImageIndex:=11;
		new.ImageIndex:=DBnode.BaseImageIndex;
	end
//если не в академке и не отчислен, значит учится
	else
		DBNode.State:=ssActual;
	
end;


//если причина отчисления - отчисление
if (AdoDataSet.FieldValues['ikTypePricOtch']='2')and(AdoDataSet.FieldValues['Ik_prikazOtch']<>NULL) then
begin

DBnode.BaseImageIndex:=12;
new.ImageIndex:=DBnode.BaseImageIndex;
end;

DBNode.id:=AdoDataSet.FieldValues['ncode'];

DBNode.AdoDataSet:=AdoDataSet;
//if adoDataSet.FieldValues['Cvoen_zvanie']<>NULL then
//DBNode.MilitaryState:=AdoDataSet.FieldValues['Cvoen_zvanie'];


new.Data:=DBnode;


end;


function TDBNodeGroupObject.DoAddChildNodes: Boolean;
var i:integer;
s:string;
begin
Node.DeleteChildren;
SetADODataset(AdoDataSet.Connection);
AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
if (not (AdoDataset.FieldValues['NameStud']=NULL)) then
AddChild(AdoDataset.FieldValues['NameStud'],AdoDataset.FieldValues['ik_zach'])
else
begin
 s:=AdoDataset.FieldValues['Clastname']+' '+AdoDataset.FieldValues['Cfirstname'];
 AddChild(s,AdoDataset.FieldValues['ik_zach']);
end;

AdoDataset.prior;
end;
Result:=true;
end;

end.
