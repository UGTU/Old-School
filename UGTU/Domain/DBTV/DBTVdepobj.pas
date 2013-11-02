(*
  Модуль    : DBTVDepObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект кафедра в дереве
*)
unit DBTVdepobj;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  Dialogs, DBTVObj, DBTVTeacherObj, SysUtils, comctrls, db, ADODB, graphics, Variants;

  type
    TDBNodedepartmentObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FIK:integer;
      FIK_semtype:integer;
      FIK_Year:integer;
      FFilterType: TTeacherTreeViewFilter;
      FDataSet: TADODataSet;
    protected
      function DoAddChildNodes: Boolean; override;
    public
      constructor Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string; ik:integer; f, m, l: string);
      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property IK_Semtype: integer read FIK_semtype write FIK_semtype;
      property IK_Year: integer read FIK_Year write FIK_Year;
      property FilterType: TTeacherTreeViewFilter read FFilterType write FFilterType;
    end;

implementation

uses  DBTVDekanat;

constructor TDBNodedepartmentObject.Create(new:TTreeNode;TreeView:TTreeView;terminate:boolean);
begin
  inherited Create(new,TreeView,terminate);
  Actiongroup:= 'catNagruzkaDep';
  fFilterType:= ttvfShowUnreleased;
end;

function TDBNodedepartmentObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
  if Assigned(fDataset) then
  begin
    if fDataset.Active then fDataset.Close;
    FreeAndNil(fDataset);
  end;
  fDataset:= TAdoDataSet.Create(TreeView);
  fDataset.Connection:= Connection;
//  AdoDataset.CommandType:=cmdText;
  case fFilterType of
  ttvfShowAll: fDataset.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(0, ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')';
  ttvfShowUnreleased: fDataset.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(1, ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')';
  ttvfShowReleased: fDataset.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(2, ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')'
  end;
//  AdoDataset.CommandText:='select * from TREE_prepods where iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep Where ik_kaf = '+inttostr(IK) + ') order by FIO';
  fDataset.Active:= true;
  if (fDataset.RecordCount = 0) then Node.HasChildren:=false;
  result:= fDataset;
end;

procedure TDBNodedepartmentObject.AddChild(Caption:string; ik:integer; f, m, l: string);
var
  new:TTreeNode;
  DBnode:TDBNodeTeacherObject;
begin
  new:=TreeView.Items.AddChildFirst(Node,Caption);
  DBnode:=TDBNodeTeacherObject.create(new,TreeView,false);
  DBnode.ik:=ik;
  DBnode.IK_Semtype:= IK_Semtype;
  DBnode.IK_Year:= IK_Year;
  DBnode.FilterType:= FFilterType;
  DBnode.KafIK:= fIK;
  DBnode.name:=Caption;
  DBnode.FirstName:=f;
  DBnode.MiddleName:=m;
  DBnode.LastName:=l;
  DBnode.MyLoadChilds(AdoDataset.Connection);
//  DBnode.BaseImageIndex:=33;
 // DBnode.SetAdoDataset(AdoDataset.Connection);
  new.Data:=DBnode;
  new.ImageIndex:=DBnode.BaseImageIndex;
//TreeView.Items.AddChild(new,'');

end;

function TDBNodedepartmentObject.DoAddChildNodes: Boolean;
var
  i:integer;
begin
  Node.DeleteChildren;
  SetADODataset(AdoDataSet.Connection);
  AdoDataset.Last;
  for i:=0 to (AdoDataset.RecordCount-1) do
  begin
    AddChild(AdoDataset.FieldValues['FIO'], AdoDataset.FieldValues['Itab_n'],
          AdoDataset.FieldValues['cfirstName'],AdoDataset.FieldValues['cotch'],AdoDataset.FieldValues['clastName']);
    AdoDataset.prior;
  end;
  Result:=true;
end;

end.
 