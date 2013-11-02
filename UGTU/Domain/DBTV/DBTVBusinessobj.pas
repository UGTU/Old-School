(*
  Модуль    : DBTVRootObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Нагрузка в дереве
*)
unit DBTVBusinessobj;
{#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVSemesterNagrObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeBusinessObject = class (TDBNodeObject)
  private
  FDataSet: TADODataSet;
  FName:string;
  FShowActual: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    procedure AddChild(Caption:string;IK:integer; semtype:integer);
    property Name: string read FName write FName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;

    property ShowActual: boolean read FShowActual write FShowActual;

  end;

implementation

function TDBNodeBusinessObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
 if ShowActual then
 begin
 AdoDataset.CommandType:=cmdText;
 AdoDataset.CommandText:='select * from TREE_NagrSemesters where (sem_name LIKE ''%'+InttoStr(CurrentYear)+'%'') order by ik_year_uch_pl';
 end
 else
 begin
 AdoDataset.CommandType:=cmdText;
 AdoDataset.CommandText:='select * from TREE_NagrSemesters order by ik_year_uch_pl';
 end;

 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then
   Node.HasChildren:=false;
 Result := AdoDataset;
end;

procedure TDBNodeBusinessObject.AddChild(Caption:string;IK:integer; semtype:integer);
var new:TTreeNode;
DBnode:TDBNodeSemesterNagrObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeSemesterNagrObject.create(new,TreeView);
DBNode.IK_Year:=IK;
DBnode.IK_Semtype:=semtype;
DBNode.Name:=Caption;
DBNode.BaseImageIndex:=16;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(AdoDataset.Connection);
new.Data:=DBnode;

end;

function TDBNodeBusinessObject.DoAddChildNodes: Boolean;
begin
  Node.DeleteChildren;
  SetADODataset(AdoDataset.Connection);
  AdoDataset.First;
  while not AdoDataset.Eof do
  begin
   AddChild(AdoDataset.FieldValues['sem_name'],AdoDataset.FieldValues['ik_year_uch_pl'],AdoDataset.FieldValues['ik_sem_type']);
     AdoDataset.Next;
end;
Result:=true;
end;

end.


