(*
  Модуль    : DBTVMetodWorkInNormobj
  Категория : ..
  Версия: 1.0
  Автор : Николенко Н. А.

  Назначение: Объект Виды учебно-методических работ (в нормах) в виде дереве
*)
unit DBTVMethodWorkInNormobj;
{#Author nnikolenko@.ugtu.net}
interface
uses  Dialogs,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  uDM,
  Variants;


  type
  TDBNodeMethodsWorkNodeObject = class(TDBNodeObject)
  private
    //class var FIDWarrant: Variant;
    FCountYear: Variant;
    FNormIK: Variant;
    class function GetDataSet:TADODataSet;
    class function CreateNodes(treeView : TDBTreeView; Parent : TTreeNode; ParentID : Integer) : TDBNodeObject;
    class function SelectImage(Value : Variant) : Integer;
  public
    class procedure CreateRootNodeObjects(treeView : TDBTreeView);
    function DoAddChildNodes:Boolean;override;
    constructor Create(Node:TTreeNode; TreeView:TTreeView);override;
    class procedure UpdateDataSet;
    class procedure FilteredDataSet(IDWarrant, IDNorm: Variant);
    class procedure FilteredDataSetFalse;
    //property CountYear: Variant read FCountYear write FCountYear;
    property NormIK: Variant read FNormIK write FNormIK;
  end;

implementation

var
  FIDWarrant, FIDNorm: Variant;
  Filter: boolean;

{ TDBNodeMethodsWorkNodeObject }

constructor TDBNodeMethodsWorkNodeObject.Create(Node: TTreeNode;
  TreeView: TTreeView);
begin
  inherited Create(Node, TreeView);
end;

class function TDBNodeMethodsWorkNodeObject.CreateNodes(treeView : TDBTreeView;
  Parent : TTreeNode; ParentID : Integer): TDBNodeObject;
var
  nodeObj : TDBNodeObject;
  I : integer;
begin

  GetDataSet.First;

  if ParentID = -1 then
    GetDataSet.Filter := 'IDMethodWorkParent = NULL'
  else
    GetDataSet.Filter := 'IDMethodWorkParent = ' + IntToStr(ParentID);

  GetDataSet.Filtered := true;

  for I := 0 to GetDataSet.RecordCount - 1 do
  begin
    if (not Filter) or (((GetDataSet.FieldValues['IDWarrant'] = FIDWarrant) or (GetDataSet.FieldValues['IDWarrant'] = NULL))
       and ((GetDataSet.FieldValues['IDNormOfTime'] = FIDNorm) or (GetDataSet.FieldValues['IDNormOfTime'] = NULL))) then
    begin

    nodeObj := treeView.CreateNewNodeObject(Parent,
          GetDataSet.FieldByName('NameWork').AsString,
          TDBNodeMethodsWorkNodeObject);
    nodeObj.ID := GetDataSet.FieldValues['IDMethodWork'];
    nodeObj.Value := GetDataSet.FieldValues['IDWarrant'];
    //TDBNodeMethodsWorkNodeObject(nodeObj).CountYear := GetDataSet.FieldValues['CountYear'];
    TDBNodeMethodsWorkNodeObject(nodeObj).NormIK:= GetDataSet.FieldValues['IDContentNorm'];
    if Parent = nil then
      nodeObj.Node.ImageIndex := 20
    else
      nodeObj.Node.ImageIndex := SelectImage(GetDataSet.FieldByName('BitEdition').Value);

    end;
    GetDataSet.Next;
  end;

end;

class procedure TDBNodeMethodsWorkNodeObject.CreateRootNodeObjects(
  treeView: TDBTreeView);
begin
  assert(Assigned(treeView));
  treeView.Items.Clear;
  CreateNodes(treeView, nil, -1);
  //Filter:= false;
end;

function TDBNodeMethodsWorkNodeObject.DoAddChildNodes: Boolean;
begin
  CreateNodes(TDBTreeView(TreeView), Node, ID);
  Result := true;
end;

class procedure TDBNodeMethodsWorkNodeObject.FilteredDataSet(
  IDWarrant, IDNorm: Variant);
begin
  Filter:= true;
  FIDWarrant:= IDWarrant;
  FIDNorm:= IDNorm;
end;

class procedure TDBNodeMethodsWorkNodeObject.FilteredDataSetFalse;
begin
  Filter:= false;
end;

class function TDBNodeMethodsWorkNodeObject.GetDataSet: TADODataSet;
begin
  if Filter then
    Result := dm.MethodWorkInNormDataSet
  else Result := dm.MethodWorkDataSet;
end;

class function TDBNodeMethodsWorkNodeObject.SelectImage(
  Value: Variant): Integer;
begin
  if Value = NULL then Result:= 2
  else if Value then Result:= 16
       else Result:= 1;
end;

class procedure TDBNodeMethodsWorkNodeObject.UpdateDataSet;
begin
  if GetDataSet.Active then GetDataSet.Close;
  GetDataSet.Open;
end;

end.



