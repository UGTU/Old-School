(*
  Модуль    : DBTVTeacherObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект преподаватель в дереве
*)
unit DBTVTeacherobj;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Dialogs, DBTVObj, SysUtils, comctrls, DBTVWorkTypeObj, db, ADODB, graphics, Variants, Classes;

type
  TTeacherTreeViewFilter = (ttvfShowAll = 0, ttvfShowUnreleased = 1, ttvfShowReleased = 2);

  TDBNodeTeacherObject = class (TDBNodeObject)
  private
      FName:string;
      FOrderID:integer;
      FFirstName,FLastName,FMiddleName:string;
      FIK:integer;
      FIK_semtype:integer;
      FIK_Year:integer;
      fKafIK: integer;
      FDataSet: TADODataSet;
      fDegreeName: string;
      fCapacityName: string;
      fRankName: string;
      fFilterType: TTeacherTreeViewFilter;
  protected
      function DoAddChildNodes: Boolean; override;
  public
      constructor Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
      procedure LoadData;
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      function MyLoadChilds(Connection:TAdoConnection): boolean;
      procedure AddChild(Caption:string; AIK:integer; ShortName: string; isWorkTypeReleased: boolean);
      property Name: string read FName write FName;
      property FirstName: string read FFirstName write FFirstName;
      property LastName: string read FLastName write FLastName;
      property MiddleName: string read FMiddleName write FMiddleName;
      property IK: integer read Fik write Fik;
      property IK_Semtype: integer read FIK_semtype write FIK_semtype;
      property IK_Year: integer read FIK_Year write FIK_Year;
      property KafIK: integer read fKafIK write fKafIK;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property OrderID: integer read FOrderID write FOrderID;
      property DegreeName: string read fDegreeName write fDegreeName;
      property CapacityName: string read fCapacityName write fCapacityName;
      property RankName: string read fRankName write fRankName;
      property FilterType: TTeacherTreeViewFilter read FFilterType write FFilterType;
  end;

implementation

procedure TDBNodeTeacherObject.LoadData;
begin
 // not implemented
end;

function TDBNodeTeacherObject.MyLoadChilds(Connection: TAdoConnection): boolean;
var
  i: integer;
  releaseCount: integer;
  isWorkTypeReleased: boolean;
begin
  Result:= false;
  Node.DeleteChildren;
  SetADODataset(Connection);
  AdoDataset.First;
  while not AdoDataset.Eof do
  begin
    isWorkTypeReleased:= false;
    if AdoDataset.FieldByName('release_date').Value <> NULL then
      case IK_Semtype of
      1: isWorkTypeReleased:= AdoDataset.FieldByName('release_date').AsDateTime < EncodeDate(AdoDataset.FieldByName('year_value').AsInteger, 9, 1);
      2: isWorkTypeReleased:= AdoDataset.FieldByName('release_date').AsDateTime < EncodeDate(AdoDataset.FieldByName('year_value').AsInteger + 1, 1, 1);
      end;
    AddChild(AdoDataset.FieldValues['full_work_type_name'], AdoDataset.FieldValues['ik_id_prepod'], AdoDataset.FieldValues['cName_work_type'], isWorkTypeReleased);
    if isWorkTypeReleased then inc(releaseCount);
    AdoDataset.Next;
  end;
  if (releaseCount = AdoDataset.RecordCount) then Self.BaseImageIndex:= 44
  else Self.BaseImageIndex:= 33;
  Result:=true;
end;

procedure TDBNodeTeacherObject.AddChild(Caption: string; AIK: integer; ShortName: string; isWorkTypeReleased: boolean);
var
  new:TTreeNode;
  DBnode:TDBNodeWorkTypeObject;
begin
  new:= TreeView.Items.AddChildFirst(Node,Caption);
  DBnode:=TDBNodeWorkTypeObject.create(new,TreeView,true);
  DBnode.ik:= AIK;
  DBnode.iTab_n:= fIK;
  DBnode.KafIK:= fKafIK;
  DBnode.IK_Semtype:= IK_Semtype;
  DBnode.IK_Year:= IK_Year;
  DBnode.name:=Caption;
  DBnode.ShortName:= ShortName;
  if isWorkTypeReleased then
    DBnode.BaseImageIndex:= 42
  else DBnode.BaseImageIndex:=32;
  new.Data:=DBnode;
  new.ImageIndex:=DBnode.BaseImageIndex;
end;

function TDBNodeTeacherObject.SetADODataset(Connection: TAdoConnection): TAdodataset;
begin
  if Assigned(fDataset) then
  begin
    if fDataset.Active then fDataset.Close;
    FreeAndNil(fDataset);
  end;
  fDataset:= TAdoDataSet.Create(TreeView);
  fDataset.Connection:= Connection;
//  AdoDataset.CommandType:=cmdText;
  case filterType of
  ttvfShowAll: fDataset.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(0, ' + IntToStr(fKafIK) + ', ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')';
  ttvfShowUnreleased: fDataset.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(1, ' + IntToStr(fKafIK) + ', ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')';
  ttvfShowReleased: fDataset.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(2, ' + IntToStr(fKafIK) + ', ' + IntToStr(IK) + ', ' + IntToStr(IK_Year) + ', ' + IntToStr(IK_Semtype) + ')';
  end;
 // AdoDataset.CommandText:='select * from TREE_Prepod_work_type where (ik_kaf = ' + inttostr(fKafIK) + ') and (iTab_n = ' + IntToStr(IK) + ') order by full_work_type_name';
  fDataset.Active:=true;
  Node.HasChildren:=(fDataset.RecordCount<>0);
  result:=fDataset;
end;

constructor TDBNodeTeacherObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create(Node,TreeView,IsTerminal);
  Actiongroup:='catNagruzkaPrepAll';
end;

function TDBNodeTeacherObject.DoAddChildNodes: Boolean;
begin
  Result:= MyLoadChilds(AdoDataset.Connection);
end;

end.
 