unit GridGrouppings;

{$I EhLib.Inc}

interface

uses Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
  EhLibVCL,
{$IFDEF EH_LIB_6} Variants, Types, {$ENDIF}
  Graphics, GridsEh, DBCtrls, Db, Menus, Registry, DBSumLst, DBCtrlsEh,
  IniFiles, ToolCtrlsEh, ImgList, StdActns, PropFilerEh, ActnList,
  MemTreeEh;

type
  TGroupDataTreeEh = class;
  
{ TGridDataGroupEh }

  TGridDataGroupEh = class(TCollectionItem)
  private
    FColumn: TPersistent;
//    FBandPositions: TIntegerDynArray;
    FOnGetKeyValue: TNotifyEvent;
    FOnGetTitleText: TNotifyEvent;
    FFont: TFont;
    procedure SetColumn(const Value: TPersistent);
    procedure SetOnGetKeyValue(const Value: TNotifyEvent);
    procedure SetOnGetTitleText(const Value: TNotifyEvent);
    procedure SetFont(const Value: TFont);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetKeyValue: Variant;
    property Column: TPersistent read FColumn write SetColumn;
    property Font: TFont read FFont write SetFont;
//    property BandPositions: TIntegerDynArray read FBandPositions;
    property OnGetKeyValue: TNotifyEvent read FOnGetKeyValue write SetOnGetKeyValue;
    property OnGetTitleText: TNotifyEvent read FOnGetTitleText write SetOnGetTitleText;
  end;

{ TGridDataGroupsListEh }

  TGridDataGroupsListEh = class(TCollection)
  private
    FGrid: TComponent;
    function GetDataGroup(Index: Integer): TGridDataGroupEh;
    procedure SetDataGroup(Index: Integer; const Value: TGridDataGroupEh);
  public
    constructor Create(Grid: TComponent; ItemClass: TCollectionItemClass);
    function Add: TGridDataGroupEh;
    property Grid: TComponent read FGrid;
    property Items[Index: Integer]: TGridDataGroupEh read GetDataGroup write SetDataGroup; default;
  end;

{ TGridDataGroupsEh }

  TGridDataGroupsEh = class(TPersistent)
  private
    FActive: Boolean;
    FGrid: TComponent;
    FGroupsList: TGridDataGroupsListEh;
    FGroupDataTree: TGroupDataTreeEh;
    procedure SetActive(const Value: Boolean);
  public
    constructor Create(AGrid: TComponent);
    destructor Destroy; override;
    property GroupDataTree: TGroupDataTreeEh read FGroupDataTree;
  published
    property Active: Boolean read FActive write SetActive default False;
    property GroupsList: TGridDataGroupsListEh read FGroupsList;
  end;

  TGroupDataTreeNodeTypeEh = (dntDataSetRecordEh, dntDataGroupEh);

{ TGroupDataTreeNodeEh }

  TGroupDataTreeNodeEh = class(TBaseTreeNodeEh)
  private
    FDataSetRecordViewNo: Integer;
    FDataGroup: TGridDataGroupEh;
    FGroupDataTreeNodeType: TGroupDataTreeNodeTypeEh;
    FKeyValue: Variant;
  public
    property NodeType: TGroupDataTreeNodeTypeEh read FGroupDataTreeNodeType;
    property DataGroup: TGridDataGroupEh read FDataGroup;
    property DataSetRecordViewNo: Integer read FDataSetRecordViewNo;
    property KeyValue: Variant read FKeyValue;
    property Expanded;
    property Level;
    property Count;
    property Parent;
  end;

{ TGroupDataTreeEh }

  TGroupDataTreeEh = class(TTreeListEh)
    FGridDataGroups: TGridDataGroupsEh;
    FlatVisibleList: TList;
  private
    function GetFlatVisibleItem(const Index: Integer): TGroupDataTreeNodeEh;
    function GetVisibleCount: Integer;
  protected
    procedure ExpandedChanged(Node: TBaseTreeNodeEh); override;
  public
    constructor Create(AGridDataGroups: TGridDataGroupsEh; ItemClass: TTreeNodeClassEh);
    destructor Destroy; override;
    function IndexOfVisibleNode(Node: TGroupDataTreeNodeEh): Integer;
    procedure RebuildDataTree(AIntMemTable: IMemTableEh);
    procedure RebuildFlatVisibleList;
    property FlatVisibleCount: Integer read GetVisibleCount;
    property FlatVisibleItem[const Index: Integer]: TGroupDataTreeNodeEh read GetFlatVisibleItem;
    property GridDataGroups: TGridDataGroupsEh read FGridDataGroups;
  end;


implementation

uses DBGridEh;

type
  TCustomDBGridEhCrack = class(TCustomDBGridEh) end;

{ TGridDataGroupsListEh }

function TGridDataGroupsListEh.Add: TGridDataGroupEh;
begin
  Result := TGridDataGroupEh(inherited Add);
end;

constructor TGridDataGroupsListEh.Create(Grid: TComponent; ItemClass: TCollectionItemClass);
begin
  inherited Create(ItemClass);
  FGrid := Grid;
end;

function TGridDataGroupsListEh.GetDataGroup(Index: Integer): TGridDataGroupEh;
begin
  Result := TGridDataGroupEh(inherited Items[Index]);
end;

procedure TGridDataGroupsListEh.SetDataGroup(Index: Integer; const Value: TGridDataGroupEh);
begin
  Items[Index].Assign(Value);
end;

{ TGridDataGroupsEh }

constructor TGridDataGroupsEh.Create(AGrid: TComponent);
begin
  inherited Create;
  FGrid := AGrid;
  FGroupsList := TGridDataGroupsListEh.Create(AGrid, TGridDataGroupEh);
  FGroupDataTree := TGroupDataTreeEh.Create(Self, TGroupDataTreeNodeEh);
end;

destructor TGridDataGroupsEh.Destroy;
begin
  FreeAndNil(FGroupsList);
  FreeAndNil(FGroupDataTree);
  inherited Destroy;
end;

procedure TGridDataGroupsEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    TCustomDBGridEhCrack(FGrid).LinkActive(TCustomDBGridEhCrack(FGrid).DataLink.Active);
  end;
end;

{ TGridDataGroupEh }

constructor TGridDataGroupEh.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FFont := TFont.Create;
end;

destructor TGridDataGroupEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

function TGridDataGroupEh.GetKeyValue: Variant;
begin
  if Assigned(FOnGetKeyValue) then
    OnGetKeyValue(Self)
  else if Assigned(Column) and Assigned(TColumnEh(Column).Field) and TColumnEh(Column).Field.DataSet.Active then
    Result := TColumnEh(Column).Field.Value;
end;

procedure TGridDataGroupEh.SetColumn(const Value: TPersistent);
begin
  if FColumn <> Value then
  begin
    FColumn := Value;
  end;
end;

procedure TGridDataGroupEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TGridDataGroupEh.SetOnGetKeyValue(const Value: TNotifyEvent);
begin
  FOnGetKeyValue := Value;
end;

procedure TGridDataGroupEh.SetOnGetTitleText(const Value: TNotifyEvent);
begin
  FOnGetTitleText := Value;
end;

{ TGroupDataTreeEh }

constructor TGroupDataTreeEh.Create(AGridDataGroups: TGridDataGroupsEh; ItemClass: TTreeNodeClassEh);
begin
  FGridDataGroups := AGridDataGroups;
  FlatVisibleList := TList.Create;
  inherited Create(ItemClass);
end;

destructor TGroupDataTreeEh.Destroy;
begin
  FreeAndNil(FlatVisibleList);
  inherited Destroy;
end;

procedure TGroupDataTreeEh.ExpandedChanged(Node: TBaseTreeNodeEh);
begin
  inherited ExpandedChanged(Node);
  RebuildFlatVisibleList;
end;

function TGroupDataTreeEh.GetFlatVisibleItem(const Index: Integer): TGroupDataTreeNodeEh;
begin
  Result := TGroupDataTreeNodeEh(FlatVisibleList[Index]);
end;

function TGroupDataTreeEh.GetVisibleCount: Integer;
begin
  Result := FlatVisibleList.Count;
end;

function TGroupDataTreeEh.IndexOfVisibleNode(Node: TGroupDataTreeNodeEh): Integer;
begin
  Result := FlatVisibleList.IndexOf(Node);
end;

procedure TGroupDataTreeEh.RebuildDataTree(AIntMemTable: IMemTableEh);
var
  i, j: Integer;
  Nodes: array of TGroupDataTreeNodeEh;
  Node: TGroupDataTreeNodeEh;
  ValueChanged: Boolean;
begin
  Clear;
  if AIntMemTable.InstantReadRowCount = 0 then Exit;

  AIntMemTable.InstantReadEnter(0);
  SetLength(Nodes, GridDataGroups.GroupsList.Count);
  Node := TGroupDataTreeNodeEh(Root);
  for i := 0 to GridDataGroups.GroupsList.Count-1 do
  begin
    Node := TGroupDataTreeNodeEh(AddChild('', Node, nil));
    Node.FDataGroup := GridDataGroups.GroupsList[i];
    Node.FGroupDataTreeNodeType := dntDataGroupEh;
    Node.FKeyValue := GridDataGroups.GroupsList[i].GetKeyValue;
    Nodes[i] := Node;
  end;

  for i := 0 to AIntMemTable.InstantReadRowCount-1 do
  begin
    AIntMemTable.InstantReadEnter(i);
    ValueChanged := False;
    for j := 0 to GridDataGroups.GroupsList.Count-1 do
    begin
      if not ValueChanged and
         not VarEquals(Nodes[j].KeyValue, GridDataGroups.GroupsList[j].GetKeyValue) then
      begin
        Node := TGroupDataTreeNodeEh(Nodes[j].Parent);
        ValueChanged := True;
      end;
      if ValueChanged then
      begin
        Node := TGroupDataTreeNodeEh(AddChild('', Node, nil));
        Node.FDataGroup := GridDataGroups.GroupsList[j];
        Node.FGroupDataTreeNodeType := dntDataGroupEh;
        Node.FKeyValue := GridDataGroups.GroupsList[j].GetKeyValue;
        Nodes[j] := Node;
      end;
    end;
    AIntMemTable.InstantReadLeave;
    //Data record
    Node := TGroupDataTreeNodeEh(AddChild('', Nodes[Length(Nodes)-1], nil));
    Node.FDataGroup := nil;
    Node.FGroupDataTreeNodeType := dntDataSetRecordEh;
    Node.FDataSetRecordViewNo := i;
    Node.FKeyValue := Null;
  end;
  RebuildFlatVisibleList;
end;

procedure TGroupDataTreeEh.RebuildFlatVisibleList;
var
  Node: TBaseTreeNodeEh;
begin
  FlatVisibleList.Clear;
  Node := GetFirstVisible;
  while Node <> nil do
  begin
    FlatVisibleList.Add(Node);
    Node := GetNextVisible(Node, True);
  end;
  TCustomDBGridEhCrack(FGridDataGroups.FGrid).DataGroupsVisibleChanged;
end;

end.
