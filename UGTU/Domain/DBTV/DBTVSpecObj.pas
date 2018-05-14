(*
  Модуль    : DBTVSpecObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект специальность в дереве
*)
unit DBTVSpecobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVGroupObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
    TDBNodeSpecObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FIK:integer;
      FStudyYears:integer;
      FDataSet: TADODataSet;
      FshowStudents: TShowstud;
      FshowActual:boolean;
      FEdFormKey:integer;
      FEdFormName:string;
    protected
      function DoAddChildNodes: Boolean; override;
    public
      constructor Create(Node:TTreeNode; TreeView:TTreeView); override;
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string;ik:integer;y:integer;uchIK:integer;
                          date_c:TDateTime;date_e:TDateTime);
      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property ShowStudents: TShowstud read FshowStudents write FshowStudents;
      property showActual: boolean  read fshowActual write fshowActual;
      property StudyYears: integer read FStudyYears write FStudyYears;
      property EdFormKey: integer read FEdFormKey write FEdFormKey;
      property EdFormName:string read FEdFormName write FEdFormName;
    end;

implementation

uses  DBTVDekanat;

constructor TDBNodeSpecObject.Create(Node:TTreeNode; TreeView:TTreeView);
begin
  inherited Create(Node,TreeView);
  Actiongroup:='catSpecAct';
end;

function TDBNodeSpecObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
var year, month, day: word;
per_year: integer;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
AdoDataset.CommandType:=cmdText;

decodedate(Now,year,month,day);
per_year:=0;
if month<9 then per_year:=1; //showmessage (inttostr(month));

if ShowActual then
AdoDataset.CommandText:='select * from TREE_groups where (ik_spec_fac='''+inttostr(IK)+''')and(('''+INTTOSTR(CurrentYear)+'''-NYear_post)<='''+inttostr(Studyyears+per_year)+''') and (dateExit >getdate()) order by NYear_post' else
AdoDataset.CommandText:='select * from TREE_groups where ik_spec_fac='''+inttostr(IK)+''' order by NYear_post';
 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then Node.HasChildren:=false;
 result:=AdoDataset;
end;

procedure TDBNodeSpecObject.AddChild(Caption:string;ik:integer;y:integer;
  uchIK:integer;date_c:TDateTime;date_e:TDateTime);
var new:TTreeNode;
DBnode:TDBNodeGroupObject;
begin

new:=TreeView.Items.AddChildFirst(Node,Caption);
DBnode:=TDBNodeGroupObject.create(new,TreeView);
DBnode.ik:=ik;
DBnode.name:=Caption;
DBnode.FoundYear:=y;
DBnode.UchPlanIK:=uchIK;
DBNode.ShowStudents:=ShowStudents;
DBnode.SetAdoDataset(AdoDataset.Connection);
DBnode.BaseImageIndex:=7;
DBnode.DateCreate:=date_c;
DBnode.DateExit:=date_e;
new.Data:=DBnode;
new.ImageIndex:=DBnode.BaseImageIndex;
//TreeView.Items.AddChild(new,'');

end;

function TDBNodeSpecObject.DoAddChildNodes: Boolean;
var i:integer;
    date_cr, date_ex: tDatetime;
begin
Node.DeleteChildren;
SetADODataset(AdoDataSet.Connection);
AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
if AdoDataset.FieldValues['dateCreate']<>NULL then
  date_cr:=AdoDataset.FieldValues['dateCreate']
else
  date_cr:=0;

if AdoDataset.FieldValues['dateexit']<>NULL then
  date_ex:=AdoDataset.FieldValues['dateexit']
else
  date_ex:=0;

if AdoDataset.FieldValues['Ik_uch_plan']<>Null then
AddChild(AdoDataset.FieldValues['CName_grup'],AdoDataset.FieldValues['IK_grup'],
AdoDataset.FieldValues['nYear_post'],AdoDataset.FieldValues['Ik_uch_plan'],
date_cr,date_ex)
else
AddChild(AdoDataset.FieldValues['CName_grup'],AdoDataset.FieldValues['IK_grup'],
AdoDataset.FieldValues['nYear_post'],-1,
date_cr,date_ex);
AdoDataset.prior;
end;
Result:=true;
end;

end.
