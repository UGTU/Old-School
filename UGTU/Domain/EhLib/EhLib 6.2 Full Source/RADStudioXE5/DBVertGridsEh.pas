{*******************************************************}
{                                                       }
{                        EhLib v6.2                     }
{                                                       }
{                  TDBVertGrid component                }
{                      Build 6.2.014                    }
{                                                       }
{       Copyright (c) 2012 by Dmitry V. Bolshakov       }
{                                                       }
{*******************************************************}

{$I EhLib.Inc}

unit DBVertGridsEh;

interface

uses Variants, Windows, SysUtils, Messages, Classes, Forms, Controls, StdCtrls,
{$IFDEF CIL}
  EhLibVCLNET,
  WinUtils,
{$ELSE}
  EhLibVCL,
{$ENDIF}
{$IFDEF EH_LIB_7} Themes, UxTheme, {$ENDIF}
{$IFDEF EH_LIB_16} System.UITypes, System.Types, {$ENDIF}
  DBAxisGridsEh, MemTreeEh, DynVarsEh,
  Graphics, GridsEh, DBCtrls, Db, Menus, ImgList, Contnrs, ToolCtrlsEh;

type
  TFieldRowEh = class;
  TCustomDBVertGridEh = class;
  TFieldRowDefValuesEh = class;
  TDBVertGridCategoryTreeListEh = class;
  TDBVertGridRowCategoriesEh = class;
  TDBVertGridRowsEh = class;
  TDBVertGridCategoryPropListEh = class;
  TDBVertGridCategoryPropEh = class;

  TPersistentAlignmentEh = (palNoSpecified, palLeftJustifyEh, palRightJustifyEh, palCenterEh);

{ TRowCellParamsEh }

  TRowCellParamsEh = class(TAxisColCellParamsEh)

  end;

  { TRowCaptionEh }

  TRowLabelEh = class(TAxisBarTitleEh)
  private
    FFitHeightToData: Boolean;
    FFitHeightToDataStored: Boolean;
    function GetRow: TFieldRowEh;
    function GetFitHeightToData: Boolean;
    function IsFitHeightToDataStored: Boolean;
    procedure SetFitHeightToData(const Value: Boolean);
    procedure SetFitHeightToDataStored(const Value: Boolean);
  protected
    function DefaultFitHeightToData: Boolean;
  public
    constructor Create(Row: TAxisBarEh);
    destructor Destroy; override;

    function GetOptimalWidth: Integer;
    procedure Assign(Source: TPersistent); override;
    property Row: TFieldRowEh read GetRow;
  published
    property Alignment;
    property Caption;
    property Color;
    property EndEllipsis;
    property FitHeightToData: Boolean read GetFitHeightToData write SetFitHeightToData stored IsFitHeightToDataStored;
    property FitHeightToDataStored: Boolean read IsFitHeightToDataStored write SetFitHeightToDataStored stored False;
    property Font;
    property Hint;
    property ImageIndex;
//    property Orientation;
//    property TitleButton;
    property ToolTips;
  end;

{ TRowLabelDefValuesEh }

  TRowLabelDefValuesEh = class(TAxisBarCaptionDefValuesEh)
  private
    FFitHeightToData: Boolean;
    FWordWrap: Boolean;
    procedure SetFitHeightToData(const Value: Boolean);
    function GetFieldRowDefValues: TFieldRowDefValuesEh;
    procedure SetWordWrap(const Value: Boolean);
  public
    constructor Create(AxisBarDefValues: TAxisBarDefValuesEh);
    property FieldRowDefValues: TFieldRowDefValuesEh read GetFieldRowDefValues;
  published
    property Alignment;
//    property Color;
    property EndEllipsis;
    property FitHeightToData: Boolean read FFitHeightToData write SetFitHeightToData default True;
    property ToolTips;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  end;

{ TFieldRowDefValuesEh }

  TFieldRowDefValuesEh = class(TAxisBarDefValuesEh)
  private
    FFitRowHeightToData: Boolean;
    function GetRowLabel: TRowLabelDefValuesEh;
    procedure SetFitRowHeightToData(const Value: Boolean);
    procedure SetRowLabel(const Value: TRowLabelDefValuesEh);
    function GetGrid: TCustomDBVertGridEh;
  protected
    function CreateAxisBarCaptionDefValues: TAxisBarCaptionDefValuesEh; override;
  public
    property Grid: TCustomDBVertGridEh read GetGrid;
  published
    property AlwaysShowEditButton;
    property AutoDropDown;
    property DblClickNextVal;
    property DropDownShowTitles;
    property DropDownSizing;
    property EndEllipsis;
    property FitRowHeightToData: Boolean read FFitRowHeightToData write SetFitRowHeightToData default False;
    property HighlightRequired;
    property Layout;
    property RowLabel: TRowLabelDefValuesEh read GetRowLabel write SetRowLabel;
//    property Title;
    property ToolTips;
  end;

{ TFieldRowEh }

  TDBVertGridEhDataHintParams = class(TDBAxisGridDataHintParamsEh)
  end;

  TDBVertGridEhHintShowPauseEvent = procedure(Sender: TCustomDBVertGridEh;
    CursorPos: TPoint; Cell: TGridCoord; InCellCursorPos: TPoint;
    Row: TFieldRowEh; var HintPause: Integer;
    var Processed: Boolean) of object;

  TDBVertGridEhDataHintShowEvent = procedure(Sender: TCustomDBVertGridEh;
    CursorPos: TPoint; Cell: TGridCoord; InCellCursorPos: TPoint;
    Row: TFieldRowEh; var Params: TDBVertGridEhDataHintParams;
    var Processed: Boolean) of object;

  TDBVertGridEhDropDownBoxDBGridSimpleTextApplyFilterEh = procedure (Sender: TCustomDBVertGridEh;
    Row: TFieldRowEh; DataSet: TDataSet; FieldName: String;
    Operation: TLSAutoFilterTypeEh; FilterText: String) of object;

  TDBVertGridEhAdvDrawRowDataEvent = procedure(Sender: TCustomDBVertGridEh;
    Cell, AreaCell: TGridCoord; Row: TFieldRowEh; const ARect: TRect;
    var Params: TRowCellParamsEh; var Processed: Boolean) of object;

  TOnRowCheckDrawRequiredStateEventEh = procedure(Sender: TObject;
    Text: String; var DrawState: Boolean) of object;

  TGetRowCellParamsEventEh = procedure(Sender: TObject; EditMode: Boolean;
    Params: TRowCellParamsEh) of object;

  TGetVertGridCellEhParamsEvent = procedure(Sender: TObject; Row: TFieldRowEh;
    AFont: TFont; var Background: TColor; State: TGridDrawState) of object;

  TDBVertGridShowDropDownFormEventEh = procedure(Grid: TCustomDBVertGridEh;
    Column: TFieldRowEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
    DynParams: TDynVarsEh) of object;

  TDBVertGridCloseDropDownFormEventEh = procedure(Grid: TCustomDBVertGridEh;
    Column: TFieldRowEh; Button: TEditButtonEh; Accept: Boolean;
    DropDownForm: TCustomForm; DynParams: TDynVarsEh) of object;

  TFieldRowEh = class(TAxisBarEh)
  private
    FRowHeight: Integer;
    FRowLines: Integer;
    FFitRowHeightToData: Boolean;
    FFitRowHeightToDataStored: Boolean;
    FFitRowHeightToTextLines: Boolean;
    FCategoryName: String;

    FOnHintShowPause: TDBVertGridEhHintShowPauseEvent;
    FOnDataHintShow: TDBVertGridEhDataHintShowEvent;
    FOnDropDownBoxApplyTextFilter: TDBVertGridEhDropDownBoxDBGridSimpleTextApplyFilterEh;
    FOnAdvDrawDataCell: TDBVertGridEhAdvDrawRowDataEvent;
    FOnGetCellParams: TGetRowCellParamsEventEh;
    FOnCheckDrawRequiredState: TOnRowCheckDrawRequiredStateEventEh;

    function GetFitRowHeightToData: Boolean;
    function GetRowLabel: TRowLabelEh;
    function GetRowsColection: TDBVertGridRowsEh;
    function GetWidth: Integer;
    function IsFitRowHeightToDataStored: Boolean;
    procedure SetCategoryName(const Value: String);
    procedure SetFitRowHeightToData(const Value: Boolean);
    procedure SetFitRowHeightToDataStored(const Value: Boolean);
    procedure SetFitRowHeightToTextLines(const Value: Boolean);
    procedure SetOnGetCellParams(const Value: TGetRowCellParamsEventEh);
    procedure SetRowHeight(const Value: Integer);
    procedure SetRowLabel(const Value: TRowLabelEh);
    procedure SetRowLines(const Value: Integer);
//    function GetHeight: Integer;
    function GetOnCloseDropDownForm: TDBVertGridCloseDropDownFormEventEh;
    function GetOnOpenDropDownForm: TDBVertGridShowDropDownFormEventEh;
    procedure SetOnCloseDropDownForm(
      const Value: TDBVertGridCloseDropDownFormEventEh);
    procedure SetOnOpenDropDownForm(
      const Value: TDBVertGridShowDropDownFormEventEh);
  protected
    FInplaceEditorButtonHeight: Integer;
    FSrcItemIndex: Integer;
    function CreateTitle: TAxisBarTitleEh; override;
    function DefaultFitRowHeightToData: Boolean;
    function GetGrid: TCustomDBVertGridEh;
    function InplaceEditorButtonHeight: Integer; override;
    function TextLineHeight: Integer;
    procedure FontChanged(Sender: TObject); override;
    procedure RowHeightChanged; virtual;
    procedure SetIndex(Value: Integer); override;
    procedure SetTextArea(var CellRect: TRect); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function CalcRowHeight: Integer; override;
    function DefaultAlignment: TAlignment; override;
    function DefaultFont: TFont; override;
    function DefaultColor: TColor; override;
    function PresetHeight: Integer; virtual;
    procedure Assign(Source: TPersistent); override;
    procedure DropDownBoxApplyTextFilter(DataSet: TDataSet; FieldName: String; Operation: TLSAutoFilterTypeEh; FilterText: String); override;
    procedure GetColCellParams(EditMode: Boolean; ColCellParamsEh: TAxisColCellParamsEh); override;
    procedure SafeSetNewHeight(NewHeight: Integer);
    property Grid: TCustomDBVertGridEh read GetGrid;
    property Width: Integer read GetWidth;
//    property Height: Integer read GetHeight;
    property RowsColection: TDBVertGridRowsEh read GetRowsColection;
  published
    property Alignment;
    property AlwaysShowEditButton;
    property AutoDropDown;
    property BiDiMode;
    property ButtonStyle;
    property Checkboxes;
    property Color;
    property DblClickNextVal;
    property DisplayFormat;
    property DynProps;
    property DropDownBox;
    property DropDownFormParams;
    property DropDownRows;
    property DropDownShowTitles;
    property DropDownSizing;
    property DropDownSpecRow;
    property DropDownWidth;
    property EditButtons;
    property EditMask;
    property EndEllipsis;
    property FieldName;
    property FitRowHeightToData: Boolean read GetFitRowHeightToData write SetFitRowHeightToData stored IsFitRowHeightToDataStored;
    property FitRowHeightToDataStored: Boolean read IsFitRowHeightToDataStored write SetFitRowHeightToDataStored stored False;
    property FitRowHeightToTextLines: Boolean read FFitRowHeightToTextLines write SetFitRowHeightToTextLines default True;
    property Font;
    property HighlightRequired;
    property ImageList;
    property ImeMode;
    property ImeName;
    property Increment;
    property KeyList;
    property Layout;
    property LookupDisplayFields;
    property MRUList;
    property NotInKeyListIndex;
    property PickList;
    property PopupMenu;
    property ReadOnly;
    property RowLabel: TRowLabelEh read GetRowLabel write SetRowLabel;
    property RowHeight: Integer read FRowHeight write SetRowHeight default 0;
    property RowLines: Integer read FRowLines write SetRowLines default 0;
    property ShowImageAndText;
    property Tag;
    property TextEditing;
    property ToolTips;
    property Visible;
    property WordWrap;

    property CategoryName: String read FCategoryName write SetCategoryName; 

//    property OnGetItemImageIndex;
//    property OnDropDownBoxApplyTextFilter;
    property OnAdvDrawDataCell: TDBVertGridEhAdvDrawRowDataEvent read FOnAdvDrawDataCell write FOnAdvDrawDataCell;
    property OnDropDownBoxApplyTextFilter: TDBVertGridEhDropDownBoxDBGridSimpleTextApplyFilterEh read FOnDropDownBoxApplyTextFilter write FOnDropDownBoxApplyTextFilter;
    property OnDropDownBoxCheckButton;
    property OnDropDownBoxDrawColumnCell;
    property OnDropDownBoxGetCellParams;
    property OnDropDownBoxSortMarkingChanged;
    property OnDropDownBoxTitleBtnClick;
    property OnEditButtonClick;
    property OnEditButtonDown;
    property OnNotInList;
    property OnUpdateData;
    property OnOpenDropDownForm: TDBVertGridShowDropDownFormEventEh read GetOnOpenDropDownForm write SetOnOpenDropDownForm;
    property OnCloseDropDownForm: TDBVertGridCloseDropDownFormEventEh read GetOnCloseDropDownForm write SetOnCloseDropDownForm;

    property OnHintShowPause: TDBVertGridEhHintShowPauseEvent read FOnHintShowPause write FOnHintShowPause;
    property OnDataHintShow: TDBVertGridEhDataHintShowEvent read FOnDataHintShow write FOnDataHintShow;
    property OnCheckDrawRequiredState: TOnRowCheckDrawRequiredStateEventEh read FOnCheckDrawRequiredState write FOnCheckDrawRequiredState;
    property OnGetCellParams: TGetRowCellParamsEventEh read FOnGetCellParams write SetOnGetCellParams;
  end;

  TFieldRowEhClass = class of TFieldRowEh;

  TDBVertGridRowsSortOrderEh = (vgsoByFieldRowIndexEh, vgsoByFieldRowCaptionAscEh,
    vgsoByFieldRowCaptionDescEh);

  TDBVertGridRowsEh = class(TGridAxisBarsEh)
  private
    FSortOrder: TDBVertGridRowsSortOrderEh;
    FOrderedList: TStringList;
    function GetFieldRow(Index: Integer): TFieldRowEh;
    function GetGrid: TCustomDBVertGridEh;
    procedure SetRow(Index: Integer; Value: TFieldRowEh);
    procedure SetSortOrder(const Value: TDBVertGridRowsSortOrderEh);
  protected
    FOrdersItemsObsolete: Boolean;
    FInternalUpdating: Boolean;
    function CheckAxisBarsToFieldsNoOrders: Boolean; override;
    function IndexSeenPassthrough: Boolean; override;
    procedure BarsNotify(Item: TAxisBarEh; Action: TGridAxisBarsNotificationEh); override;
    procedure CheckResortItems;
    procedure OrdersItemsObsolete;
    procedure ResortOrderedItems;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Grid: TCustomDBAxisGridEh; RowClass: TAxisBarEhClass);
    destructor Destroy; override;
    function Add: TFieldRowEh;
    function HaveDynamicRowHeight: Boolean;
    procedure AddAllRows(DeleteExisting: Boolean);
    property Grid: TCustomDBVertGridEh read GetGrid;
    property SortOrder: TDBVertGridRowsSortOrderEh read FSortOrder write SetSortOrder;
    property Items[Index: Integer]: TFieldRowEh read GetFieldRow write SetRow; default;
  end;

{ TVertGridDataLinkEh }

  TVertGridDataLinkEh = class(TAxisGridDataLinkEh)
  private
    function GetGrid: TCustomDBVertGridEh;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    constructor Create(AGrid: TCustomDBAxisGridEh);
    destructor Destroy; override;
    property Grid: TCustomDBVertGridEh read GetGrid;
  end;

{ TDBVertGridLineParamsEh }

  TDBVertGridLineParamsEh = class(TDBAxisGridLineParamsEh)
  private
    function GetGrid: TCustomDBVertGridEh;

  protected
    function DefaultDataHorzLines: Boolean; override;
    function DefaultDataVertLines: Boolean; override;

    property Grid: TCustomDBVertGridEh read GetGrid;

  public
    constructor Create(AGrid: TCustomGridEh);

    function GetVertAreaContraVertColor: TColor; override;
    function GetActualColorScheme: TDBGridLinesColorSchemeEh; override;

  published
    property DarkColor;
    property BrightColor;

    property DataVertColor;
    property DataVertLines;
    property DataVertLinesStored;

    property DataHorzColor;
    property DataHorzLines;
    property DataHorzLinesStored;

    property DataBoundaryColor;
    property GridBoundaries;

    property ColorScheme;

    property VertEmptySpaceStyle;

  end;

{ TDBVertGridLabelColParamEh }

  TDBVertGridLabelColParamEh = class(TPersistent)
  private
    FColor: TColor;
    FFillStyle: TGridCellFillStyleEh;
    FFont: TFont;
    FGrid: TCustomDBVertGridEh;
    FHorzLineColor: TColor;
    FHorzLines: Boolean;
    FHorzLinesStored: Boolean;
    FImages: TCustomImageList;
    FParentFont: Boolean;
    FSecondColor: TColor;
    FVertLineColor: TColor;
    FVertLines: Boolean;
    FVertLinesStored: Boolean;

    function DefaultHorzLines: Boolean;
    function DefaultVertLines: Boolean;
    function GetHorzLines: Boolean;
    function GetVertLines: Boolean;
    function IsFontStored: Boolean;
    function IsHorzLinesStored: Boolean;
    function IsVertLinesStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetColor(const Value: TColor);
    procedure SetFillStyle(const Value: TGridCellFillStyleEh);
    procedure SetFont(const Value: TFont);
    procedure SetHorzLineColor(const Value: TColor);
    procedure SetHorzLines(const Value: Boolean);
    procedure SetHorzLinesStored(const Value: Boolean);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetParentFont(const Value: Boolean);
    procedure SetSecondColor(const Value: TColor);
    procedure SetVertLineColor(const Value: TColor);
    procedure SetVertLines(const Value: Boolean);
    procedure SetVertLinesStored(const Value: Boolean);
  protected
    procedure RefreshDefaultFont;
    function DefaultFont: TFont;
  public
    constructor Create(AGrid: TCustomDBVertGridEh);
    destructor Destroy; override;
    function GetVertLineColor: TColor; virtual;
    function GetHorzLineColor: TColor; virtual;
    function DefaultHorzLineColor: TColor; virtual;
    function DefaultVertLineColor: TColor; virtual;
    function GetActualFillStyle: TGridCellFillStyleEh; virtual;
    function GetColor: TColor; virtual;
    function GetSecondColor: TColor; virtual;
    property Grid: TCustomDBVertGridEh read FGrid;
  published
    property Color: TColor read FColor write SetColor default clDefault;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;

    property SecondColor: TColor read FSecondColor write SetSecondColor default clDefault;

    property Images: TCustomImageList read FImages write SetImages;

    property VertLineColor: TColor read FVertLineColor write SetVertLineColor default clDefault;
    property VertLines: Boolean read GetVertLines write SetVertLines stored IsVertLinesStored;
    property VertLinesStored: Boolean read IsVertLinesStored write SetVertLinesStored stored False;

    property HorzLineColor: TColor read FHorzLineColor write SetHorzLineColor default clDefault;
    property HorzLines: Boolean read GetHorzLines write SetHorzLines stored IsHorzLinesStored;
    property HorzLinesStored: Boolean read IsHorzLinesStored write SetHorzLinesStored stored False;

    property FillStyle: TGridCellFillStyleEh read FFillStyle write SetFillStyle default cfstDefaultEh;
  end;

{ TDBVertGridDataColParamsEh }

  TDBVertGridDataColParamsEh = class(TPersistent)
  private
    FGrid: TCustomDBVertGridEh;
    FColor: TColor;
    FRowLines: Integer;
    FFont: TFont;
    FRowHeight: Integer;
    FParentFont: Boolean;
    FColWidth: Integer;
    FPersistentAlignment: TPersistentAlignmentEh;
    FMaxRowHeight: Integer;
    FMaxRowLines: Integer;

    function IsFontStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetParentFont(const Value: Boolean);
    procedure SetRowHeight(const Value: Integer);
    procedure SetRowLines(const Value: Integer);
    procedure SetColWidth(const Value: Integer);
    procedure SetPersistentDataAlignment(const Value: TPersistentAlignmentEh);
    procedure SetMaxRowHeight(const Value: Integer);
    procedure SetMaxRowLines(const Value: Integer);
  protected
    procedure RefreshDefaultFont;
    function DefaultFont: TFont;
  public
    constructor Create(AGrid: TCustomDBVertGridEh);
    destructor Destroy; override;
    function GetColor: TColor;
    property Grid: TCustomDBVertGridEh read FGrid;
  published
    property Color: TColor read FColor write SetColor default clDefault;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;

    property RowHeight: Integer read FRowHeight write SetRowHeight default 0;
    property RowLines: Integer read FRowLines write SetRowLines default 0;

    property MaxRowHeight: Integer read FMaxRowHeight write SetMaxRowHeight default 0;
    property MaxRowLines: Integer read FMaxRowLines write SetMaxRowLines default 0;

    property ColWidth: Integer read FColWidth write SetColWidth default 0;
    property PersistentAlignment: TPersistentAlignmentEh read FPersistentAlignment write SetPersistentDataAlignment default palLeftJustifyEh;

  end;

{ TDBVertGridCategoryTreeNodeEh }

  TDBVertGridCategoryRowTypeEh = (vgctFieldRowEh, vgctCategoryRowEh);

  TDBVertGridCategoryTreeNodeEh = class(TBaseTreeNodeEh)
  private
    FCategoryName: String;
    FFieldRow: TFieldRowEh;
    FRowType: TDBVertGridCategoryRowTypeEh;
    FCategoryDisplayText: String;
    function GetCount: Integer;
    function GetFieldRow: TFieldRowEh;
    function GetItem(const Index: Integer): TDBVertGridCategoryTreeNodeEh; reintroduce;
    function GetNodeOwner: TDBVertGridCategoryTreeListEh;
    function GetNodeParent: TDBVertGridCategoryTreeNodeEh;
    function GetRowType: TDBVertGridCategoryRowTypeEh;
    procedure SetCategoryName(const Value: String);
    procedure SetFieldRow(const Value: TFieldRowEh);
    procedure SetNodeParent(const Value: TDBVertGridCategoryTreeNodeEh);
    function GetIndex: Integer;
    procedure SetIndex(Value: Integer);
    function GetCategoryProp: TDBVertGridCategoryPropEh;
    procedure SetCategoryDisplayText(const Value: String);
    function GetCategoryDisplayText: String;

  protected
    FSortIndex: Integer;
    FCategoryProp: TDBVertGridCategoryPropEh;
    function CompareNodesBySortIndex(Node1, Node2: TBaseTreeNodeEh; ParamSort: TObject): Integer; virtual;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    function CalcRowHeight: Integer; virtual;

    procedure Collapse;
    procedure Expand;
    procedure SortBySortIndex;

    property Count;
    property Index: Integer read GetIndex write SetIndex;
    property Items[const Index: Integer]: TDBVertGridCategoryTreeNodeEh read GetItem; default;
    property Owner: TDBVertGridCategoryTreeListEh read GetNodeOwner;
    property Parent: TDBVertGridCategoryTreeNodeEh read GetNodeParent write SetNodeParent;
    property Expanded;
    property HasChildren;
    property ItemsCount: Integer read GetCount;

    property RowType: TDBVertGridCategoryRowTypeEh read GetRowType;
    property FieldRow: TFieldRowEh read GetFieldRow write SetFieldRow;
    property CategoryName: String read FCategoryName write SetCategoryName;
    property CategoryDisplayText: String read GetCategoryDisplayText write SetCategoryDisplayText;
    property CategoryProp: TDBVertGridCategoryPropEh read GetCategoryProp;
  end;

  TDBVertGridCategoryTreeNodeClassEh = class of TDBVertGridCategoryTreeNodeEh;

{ TDBVertGridCategoryTreeListEh }

  TDBVertGridCategoryTreeListEh = class(TTreeListEh)
  private
    FFlatList: TObjectList;
    FFlatListObsolete: Boolean;
    FRowCategories: TDBVertGridRowCategoriesEh;
    function GetFlatItem(const Index: Integer): TDBVertGridCategoryTreeNodeEh;
    function GetFlatItemsCount: Integer;
    function GetRoot: TDBVertGridCategoryTreeNodeEh;

  protected
    function AddChild(Parent: TDBVertGridCategoryTreeNodeEh; ARowType: TDBVertGridCategoryRowTypeEh): TDBVertGridCategoryTreeNodeEh;
    procedure DeleteNode(Node: TDBVertGridCategoryTreeNodeEh; ReIndex: Boolean);
    procedure ExpandedChanged(Node: TBaseTreeNodeEh); override;
    procedure TreeChanged(Node: TBaseTreeNodeEh; Operation: TTreeListNotificationEh; OldIndex: Integer; OldParentNode: TBaseTreeNodeEh); override;
    function CreateFieldRowNode(Parent: TDBVertGridCategoryTreeNodeEh; FieldRow: TFieldRowEh): TDBVertGridCategoryTreeNodeEh;

    property FlatList: TObjectList read FFlatList;
  public
    constructor Create(ItemClass: TDBVertGridCategoryTreeNodeClassEh; ARowCategories: TDBVertGridRowCategoriesEh);
    destructor Destroy; override;

    procedure InitTreeFromGridColumns;
    function CreateCategoryRow(Parent: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
    function FlatIndexOfFieldRow(FieldRow: TFieldRowEh): Integer;
    function FlatIndexOfNode(Node: TDBVertGridCategoryTreeNodeEh): Integer;
    function CategoryTreeNodeByName(CategoryName: String): TDBVertGridCategoryTreeNodeEh;
    procedure BuildFlatList;
    procedure CategoryNameChanged; virtual;
    procedure ExpandAll;
    procedure CollapseAll;

    function GetFirst: TDBVertGridCategoryTreeNodeEh;
    function GetLast(Node: TDBVertGridCategoryTreeNodeEh = nil): TDBVertGridCategoryTreeNodeEh;
    function GetNext(Node: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
    function GetPrevious(Node: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;

    property Root: TDBVertGridCategoryTreeNodeEh read GetRoot;
    property RowCategories: TDBVertGridRowCategoriesEh read FRowCategories;

    property FlatItemsCount: Integer read GetFlatItemsCount;
    property FlatItem[const Index: Integer]: TDBVertGridCategoryTreeNodeEh read GetFlatItem; default;

  end;

{ TDBVertGridCategoryPropEh }

  TDBVertGridCategoryPropEh = class(TCollectionItem)
  private
    FDefaultExpanded: Boolean;
    FDisplayText: String;
    FName: String;
    function GetCategoryPropList: TDBVertGridCategoryPropListEh;
    procedure SetDisplayText(const Value: String);
    procedure SetName(const Value: String);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property CategoryPropList: TDBVertGridCategoryPropListEh read GetCategoryPropList;

  published
    property Name: String read FName write SetName;
    property DisplayText: String read FDisplayText write SetDisplayText;
    property DefaultExpanded: Boolean read FDefaultExpanded write FDefaultExpanded default False;
  end;

  TDBVertGridCategoryPropEhClass = class of TDBVertGridCategoryPropEh;

{ TDBVertGridCategoryPropListEh }

  TDBVertGridCategoryPropListEh = class(TCollection)
  private
    FRowCategories: TDBVertGridRowCategoriesEh;
    function GetCategoryProp(Index: Integer): TDBVertGridCategoryPropEh;
    procedure SetCategoryProp(Index: Integer; Value: TDBVertGridCategoryPropEh);
  protected
    function GetOwner: TPersistent; override;
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(ARowCategories: TDBVertGridRowCategoriesEh; CategoryPropClass: TDBVertGridCategoryPropEhClass);
    function Add: TDBVertGridCategoryPropEh;
    function CategoryPropByName(APropName: String): TDBVertGridCategoryPropEh;
    procedure Assign(Source: TPersistent); override;
    property RowCategories: TDBVertGridRowCategoriesEh read FRowCategories;
    property Items[Index: Integer]: TDBVertGridCategoryPropEh read GetCategoryProp write SetCategoryProp; default;
  end;


{ TDBVertGridRowCategoriesEh }

  TCategoryGroupingTypeEh = (cgtFieldRowCategoryNameEh, cgtEmptyNotEmptyValueEh,
      cgtFieldDataTypeEh{, cgtCustomCategoryEh});

  TDBVGCategoriesRowMoveOptionEh = (crmoFieldRowMoveToOtherCategoryEh, crmoCategoryRowMove);
  TDBVGCategoriesRowMoveOptionsEh = set of TDBVGCategoriesRowMoveOptionEh;

  TDBVertGridRowCategoriesEh = class(TPersistent)
  private
    FActive: Boolean;
    FCategoryGroupingType: TCategoryGroupingTypeEh;
    FColor: TColor;
    FCurrentCategoryTree: TDBVertGridCategoryTreeListEh;
    FFont: TFont;
    FGrid: TCustomDBVertGridEh;
    FParentFont: Boolean;
    FCategoryProps: TDBVertGridCategoryPropListEh;
    FExpandingGlyphStyle: TTreeViewGlyphStyleEh;
    FRowMovingOptions: TDBVGCategoriesRowMoveOptionsEh;
    function GetCurNode: TDBVertGridCategoryTreeNodeEh;
    function GetCurrentCategoryTree: TDBVertGridCategoryTreeListEh;
    function IsFontStored: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetCategoryGroupingType(const Value: TCategoryGroupingTypeEh);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetParentFont(const Value: Boolean);
    procedure FontChanged(Sender: TObject);
    procedure SetCategoryProps(const Value: TDBVertGridCategoryPropListEh);
    procedure SetCurNode(const Value: TDBVertGridCategoryTreeNodeEh);
    procedure SetExpandingGlyphStyle(const Value: TTreeViewGlyphStyleEh);

  protected
    FCategoryStructureObsolete: Boolean;
    function GetOwner: TPersistent; override;
    procedure RefreshDefaultFont;
    procedure SetFontDefault(AFont: TFont);
  public
    constructor Create(AGrid: TCustomDBVertGridEh);
    destructor Destroy; override;
    function GetColor: TColor;
    procedure CheckRebuildRowCategories; virtual;
    procedure CategoryStructureObsolete;
    procedure CategoryPropsChanges(CategoryProp: TDBVertGridCategoryPropEh);

    property CurrentCategoryTree: TDBVertGridCategoryTreeListEh read GetCurrentCategoryTree;
    property Grid: TCustomDBVertGridEh read FGrid;
    property Node: TDBVertGridCategoryTreeNodeEh read GetCurNode write SetCurNode;
  published
    property Active: Boolean read FActive write SetActive default False;
    property CategoryGroupingType: TCategoryGroupingTypeEh read FCategoryGroupingType write SetCategoryGroupingType default cgtFieldRowCategoryNameEh;
    property Color: TColor read FColor write SetColor default clDefault;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;
    property CategoryProps: TDBVertGridCategoryPropListEh read FCategoryProps write SetCategoryProps;
    property ExpandingGlyphStyle: TTreeViewGlyphStyleEh read FExpandingGlyphStyle write SetExpandingGlyphStyle default tvgsDefaultEh;
    property RowMoveOptions: TDBVGCategoriesRowMoveOptionsEh read FRowMovingOptions write FRowMovingOptions default [];
  end;

{ TCustomDBVertGridEh }

  TDBVHGridOption = (dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol,
    dgvhRowResize, dgvhRowMove, dgvhColLines, dgvhRowLines, dgvhTabs,
//    dgvhAlwaysShowSelection,
    dgvhConfirmDelete, dgvhCancelOnExit
//  ,dgvhMultiSelect
    );

  TDBVHGridOptions = set of TDBVHGridOption;

  TOptimizeColWidthMethodEh = (ocmToFitCaptionsEh, ocmToMidleEh, ocmToFitDataEh);

  TDrawDataCellEvent = procedure (Sender: TObject; const Rect: TRect; Field: TField;
    State: TGridDrawState) of object;

  TDrawRowCellEvent = procedure (Sender: TObject; const Rect: TRect;
    DataRow: Integer; Row: TFieldRowEh; State: TGridDrawState) of object;
  TDBVertGridClickEvent = procedure (Row: TFieldRowEh) of object;
  TCheckRebuildRowCategoriesEvent = procedure (Sender: TCustomDBVertGridEh; RowGrouping: TDBVertGridCategoryTreeListEh) of object;

  TCustomDBVertGridEh = class(TCustomDBAxisGridEh)
  private
    FDataColOffset: Byte;
    FDataColParams: TDBVertGridDataColParamsEh;
    FEditText: string;
    FInColExit: Boolean;
    FIsESCKey: Boolean;
    FLabelColImageChangeLink: TChangeLink;
    FLabelColParams: TDBVertGridLabelColParamEh;
    FOnAdvDrawDataCell: TDBVertGridEhAdvDrawRowDataEvent;
    FOnCellClick: TDBVertGridClickEvent;
    FOnDataHintShow: TDBVertGridEhDataHintShowEvent;
//    FOnDrawDataCell: TDrawDataCellEvent;
    FOnDrawRowCell: TDrawRowCellEvent;
    FOnEditButtonClick: TNotifyEvent;
    FOnGetCellParams: TGetVertGridCellEhParamsEvent;
    FOnHintShowPause: TDBVertGridEhHintShowPauseEvent;
    FOnLabelColClick:TDBVertGridClickEvent;
    FOnRowEnter: TNotifyEvent;
    FOnRowExit: TNotifyEvent;
    FOnRowMoved: TMovedEvent;
    FOptions: TDBVHGridOptions;
    FSelecting: Boolean;
    FRowCategories: TDBVertGridRowCategoriesEh;
    FOnCheckRebuildRowCategories: TCheckRebuildRowCategoriesEvent;

    function GetDataColParams: TDBVertGridDataColParamsEh;
    function GetDataLink: TVertGridDataLinkEh;
    function GetFieldFieldRows(const FieldName: String): TFieldRowEh;
    function GetGridLineParams: TDBVertGridLineParamsEh;
    function GetLabelColWidth: Integer;
    function GetRowCategories: TDBVertGridRowCategoriesEh;
    function GetRows: TDBVertGridRowsEh;
    function GetRowsDefValues: TFieldRowDefValuesEh;
    function GetVisibleFieldRow(Index: Integer): TFieldRowEh;
    function GetVisibleFieldRowCount: Integer;
    procedure LabelColImageListChange(Sender: TObject);
    procedure MoveFieldRow(RawRow, Direction: Integer);
    procedure SetDataColParams(const Value: TDBVertGridDataColParamsEh);
    procedure SetGridLineParams(const Value: TDBVertGridLineParamsEh);
    procedure SetLabelColParams(const Value: TDBVertGridLabelColParamEh);
    procedure SetLabelColWidth(const Value: Integer);
    procedure SetOnGetCellParams(const Value: TGetVertGridCellEhParamsEvent);
    procedure SetOptions(Value: TDBVHGridOptions);
    procedure SetRowCategories(const Value: TDBVertGridRowCategoriesEh);
    procedure SetRows(Value: TDBVertGridRowsEh);
    procedure SetRowsDefValues(const Value: TFieldRowDefValuesEh);
    procedure UpdateRowCount;
    procedure UpdateRowHeights;

    procedure CMChanged(var Msg: TCMChanged); message CM_CHANGED;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMExit(var Message: TMessage); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure CMHintsShowPause(var Message: TCMHintShowPause); message CM_HINTSHOWPAUSE;

    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMIMEStartComp(var Message: TMessage); message WM_IME_STARTCOMPOSITION;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SetFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    function GetRowsSortOrder: TDBVertGridRowsSortOrderEh;
    procedure SetRowsSortOrder(const Value: TDBVertGridRowsSortOrderEh);

  protected
    FUpdateFields: Boolean;
    FAcquireFocus: Boolean;
    FLabelColWidth: Integer;
    FTracking: Boolean;
    FMoveMousePos: TPoint;
    FLastOptimizeColWidthMethodEh: TOptimizeColWidthMethodEh;
    FDrawnGroupList: TList;

    function AcquireFocus: Boolean; override;
    function CalcStdDefaultRowHeight: Integer;
    function CalcStdDefaultRowHeightForFont(AFont: TFont): Integer;
    function CalcDestinationRowDrag(Origin: Integer; var Destination: Integer; const MousePt: TPoint): Boolean; virtual;

    function CanEditAcceptKey(Key: Char): Boolean; override;
    function CanEditModify: Boolean; override;
    function CanEditorMode: Boolean; override;
    function CanEditShow: Boolean; override;
    function CheckBeginRowDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean; override;
    function CheckRowDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean; override;
    function CreateAxisBarDefValues: TAxisBarDefValuesEh; override;
    function CreateAxisBars: TGridAxisBarsEh; override;
    function CreateColCellParamsEh: TAxisColCellParamsEh; override;
    function CreateDataLink: TAxisGridDataLinkEh; override;
    function CreateEditor: TInplaceEdit; override;
    function CreateGridLineColors: TGridLineColorsEh; override;
    function DataToRawRow(ARow: Integer): Integer;
    function DefaultTitleColor: TColor; override;
    function DesignHitTestObject(XPos, YPos: Integer): TPersistent; override;
    function EndRowDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean; override;
    function GetColField(DataCol: Integer): TField;
    function GetEditLimit: Integer; override;
    function GetEditMask(ACol, ARow: Longint): string; override;
    function GetEditStyle(ACol, ARow: Longint): TEditStyle; override;
    function GetEditText(ACol, ARow: Longint): string; override;
    function GetFieldValue(ACol: Integer): string;
    function GetRowCellParamsEh: TRowCellParamsEh; virtual;
    function GetSelectedIndex: Integer; override;
    function GetSelectionInactiveColor: TColor; override;
    function GetTitleFont: TFont; override;
    function HighlightCell(DataCol, DataRow: Integer; const Value: string; AState: TGridDrawState): Boolean; virtual;
    function InstantReadRecordCount: Integer;
    function IsDrawCellByThemes(ACol, ARow: Longint; AreaCol, AreaRow: Longint; AState: TGridDrawState; Cell3D: Boolean): Boolean; virtual;
    function IsSmoothVertScroll: Boolean; override;
    function RawToDataRow(ARow: Integer): Integer;
    function WantInplaceEditorKey(Key: Word; Shift: TShiftState): Boolean; override;

    procedure CalcSizingState(X, Y: Integer; var State: TGridState; var Index: Longint; var SizingPos, SizingOfs: Integer; var FixedInfo: TGridDrawInfoEh); override;
    procedure CancelMode; override;
    procedure CellClick(Row: TFieldRowEh); virtual;
    procedure CheckDrawCellBorder(ACol, ARow: Integer; BorderType: TGridCellBorderTypeEh; var IsDraw: Boolean; var BorderColor: TColor; var IsExtent: Boolean); override;
    procedure ColWidthsChanged; override;
    procedure CreateWnd; override;
    procedure DataChanged; override;
    procedure DeferLayout;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure DrawDataCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState); virtual;
    procedure DrawFieldRowDataCell(FieldRow: TFieldRowEh; ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState); virtual;
    procedure DrawEmptySpace(ACol, ARow: Longint; StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh); override;
    procedure DrawLabelCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState); virtual;
    procedure DrawFieldRowLabelCell(FieldRow: TFieldRowEh; ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState); virtual;
    procedure DrawRowCell(const Rect: TRect; DataRow: Integer; FieldRow: TFieldRowEh; State: TGridDrawState); virtual;
    procedure EditingChanged; override;
    procedure FieldRowEnter; virtual;
    procedure FieldRowExit; virtual;
    procedure FlatChanged; override;
    procedure GetCellParams(AxisBar: TAxisBarEh; AFont: TFont; var Background: TColor; State: TGridDrawState); override;
    procedure InstantReadRecordEnter(DataRowNum: Integer);
    procedure InstantReadRecordLeave;
    procedure InternalLayout; override;
    procedure InvalidateLabelCol;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure LabelColClick(Row: TFieldRowEh); dynamic;
    procedure LinkActive(Value: Boolean); override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
//    procedure OldDrawDataCell(const Rect: TRect; Field: TField; State: TGridDrawState); dynamic; { obsolete }
    procedure Paint; override;
    procedure RecordChanged(Field: TField); override;
    procedure RowHeightsChanged; override;
    procedure RowLabelFontChanged(Sender: TObject);
    procedure RowMoved(FromIndex, ToIndex: Longint); override;
    procedure RowsSortOrderChanged; virtual;
    procedure Scroll(Distance: Integer); override;
    procedure ScrollBarMessage(ScrollBar, ScrollCode, Pos: Integer; UseRightToLeft: Boolean); override;
    procedure SetColumnAttributes; override;
    procedure SetIme; override;
    procedure SetSelectedIndex(Value: Integer); override;
    procedure SetTitleFont(Value: TFont); override;
    procedure StopTracking;
    procedure TimedScroll(Direction: TGridScrollDirection); override;
    procedure TimerScroll; virtual;
    procedure UpdateActive; override;
    procedure UpdateIme; override;
    procedure WndProc(var Message: TMessage); override;
    procedure RowCategoriesActiveChanged; virtual;

    property DataLink: TVertGridDataLinkEh read GetDataLink;
    property DataColOffset: Byte read FDataColOffset;
    property ParentColor default False;
    property RowCellParamsEh: TRowCellParamsEh read GetRowCellParamsEh;

    property OnCellClick: TDBVertGridClickEvent read FOnCellClick write FOnCellClick;
    property OnRowEnter: TNotifyEvent read FOnRowEnter write FOnRowEnter;
    property OnRowExit: TNotifyEvent read FOnRowExit write FOnRowExit;
    property OnDrawRowCell: TDrawRowCellEvent read FOnDrawRowCell write FOnDrawRowCell;
//    property OnDrawDataCell: TDrawDataCellEvent read FOnDrawDataCell write FOnDrawDataCell; { obsolete }
    property OnEditButtonClick: TNotifyEvent read FOnEditButtonClick write FOnEditButtonClick;
    property OnRowMoved: TMovedEvent read FOnRowMoved write FOnRowMoved;
    property OnLabelColClick: TDBVertGridClickEvent read FOnLabelColClick write FOnLabelColClick;
    property OnHintShowPause: TDBVertGridEhHintShowPauseEvent read FOnHintShowPause write FOnHintShowPause;
    property OnDataHintShow: TDBVertGridEhDataHintShowEvent read FOnDataHintShow write FOnDataHintShow;
    property OnAdvDrawDataCell: TDBVertGridEhAdvDrawRowDataEvent read FOnAdvDrawDataCell write FOnAdvDrawDataCell;
    property OnGetCellParams: TGetVertGridCellEhParamsEvent read FOnGetCellParams write SetOnGetCellParams;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AxisColumnsStorePropertyName: String; override;
    function ColClientWidths(ACol: Integer): Integer;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function FindFieldRow(const FieldName: String): TFieldRowEh;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function ValidFieldIndex(FieldIndex: Integer): Boolean;

    procedure CancelEditing; override;
    procedure DefaultCellMouseClick(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DefaultCellMouseDown(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DefaultDrawRowDataCell(Cell, AreaCell: TGridCoord; FieldRow: TFieldRowEh; AreaRect: TRect; Params: TRowCellParamsEh); virtual;
    procedure DefaultHandler(var Msg); override;
    procedure DefaultCheckRebuildRowCategories(RowCategoriesTree: TDBVertGridCategoryTreeListEh);

    procedure OptimizeColWidthAndPassToNext;
    procedure OptimizeColWidth(OptimizeMethod: TOptimizeColWidthMethodEh);
    procedure UpdateData; override;

    property DataColParams: TDBVertGridDataColParamsEh read GetDataColParams write SetDataColParams;
    property EditorMode;
    property FieldRows[const FieldName: String]: TFieldRowEh read GetFieldFieldRows; default;
    property GridLineParams: TDBVertGridLineParamsEh read GetGridLineParams write SetGridLineParams;
    property LabelColParams: TDBVertGridLabelColParamEh read FLabelColParams write SetLabelColParams;
    property LabelColWidth: Integer read GetLabelColWidth write SetLabelColWidth default 64;
    property Options: TDBVHGridOptions read FOptions write SetOptions default [dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol, dgvhColLines, dgvhRowLines, dgvhTabs, dgvhConfirmDelete, dgvhCancelOnExit];
    property Rows: TDBVertGridRowsEh read GetRows write SetRows;
    property RowsDefValues: TFieldRowDefValuesEh read GetRowsDefValues write SetRowsDefValues;
    property VisibleFieldRow[Index: Integer]: TFieldRowEh read GetVisibleFieldRow;
    property VisibleFieldRowCount: Integer read GetVisibleFieldRowCount;
    property RowsSortOrder: TDBVertGridRowsSortOrderEh read GetRowsSortOrder write SetRowsSortOrder default vgsoByFieldRowIndexEh;

    property RowCategories: TDBVertGridRowCategoriesEh read GetRowCategories write SetRowCategories;
    property OnCheckRebuildRowCategories: TCheckRebuildRowCategoriesEvent read FOnCheckRebuildRowCategories write FOnCheckRebuildRowCategories;
  end;

  TDBVertGridEh = class(TCustomDBVertGridEh)
  public
    property Canvas;
    property ColWidths;
    property ColCount;
    property RowCount;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Border;
    property BorderStyle;
    property Color;
    property Rows stored False; //StoreColumns;
    property RowCategories;
    property RowsSortOrder;
    property LabelColParams;
    property Constraints;
    property Ctl3D;
    property DataColParams;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DrawGraphicData;
    property DrawMemoText;
    property Enabled;
    property FixedColor;
    property Font;
    property Flat;
    property GridLineParams;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RowsDefValues;
    property ShowHint;
    property TabOrder;
    property TabStop;
//    property TitleFont;
    property LabelColWidth;
    property Visible;

    property OnAdvDrawDataCell;
    property OnCellClick;
    property OnDataHintShow;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
//    property OnDrawDataCell;  { obsolete }
    property OnDrawRowCell;
    property OnEditButtonClick;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetCellParams;
    property OnHintShowPause;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnLabelColClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnRowEnter;
    property OnRowExit;
    property OnRowMoved;
    property OnStartDock;
    property OnStartDrag;

    property OnCheckRebuildRowCategories;
  end;

implementation

uses Math, DBConsts, VDBConsts, Dialogs;

type
  THorzCellAreaTypeEh = (hcTRowLabelEh, hctDataEh);
  TVertCellAreaTypeEh = (vctDataEh);
  TCellAreaTypeEh = record
    HorzType: THorzCellAreaTypeEh;
    VertType: TVertCellAreaTypeEh;
  end;

function GetCellAreaType(AGrid: TCustomDBVertGridEh; ACol, ARow: Integer;
  var AreaCol, AreaRow: Integer): TCellAreaTypeEh;
begin
  Result.VertType := vctDataEh;
  if (ACol = 0) and (dgvhLabelCol in AGrid.Options)
    then Result.HorzType := hcTRowLabelEh
    else Result.HorzType := hctDataEh;
end;

{ Error reporting }

procedure RaiseGridError(const S: string);
begin
  raise EInvalidGridOperationEh.Create(S);
end;

function SendStructMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam): LRESULT;
begin
  Result := SendMessage(hWnd, Msg, wParam, Integer(@lParam));
end;

{ TDBGridInplaceEdit }

type

  TDBGridInplaceEdit = class(TDBAxisGridInplaceEdit)
  private
  protected
  public
    constructor Create(Owner: TComponent); override;
  end;

constructor TDBGridInplaceEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

{ TVertGridDataLinkEh }

constructor TVertGridDataLinkEh.Create(AGrid: TCustomDBAxisGridEh);
begin
  inherited Create(AGrid);
end;

destructor TVertGridDataLinkEh.Destroy;
begin
  inherited Destroy;
end;

procedure TVertGridDataLinkEh.ActiveChanged;
begin
  inherited ActiveChanged;
end;

procedure TVertGridDataLinkEh.DataSetChanged;
begin
  inherited DataSetChanged;
end;

procedure TVertGridDataLinkEh.DataSetScrolled(Distance: Integer);
begin
  inherited DataSetScrolled(Distance);
end;

procedure TVertGridDataLinkEh.LayoutChanged;
begin
  inherited LayoutChanged;
end;

procedure TVertGridDataLinkEh.FocusControl(Field: TFieldRef);
begin
  inherited FocusControl(Field);
end;

procedure TVertGridDataLinkEh.EditingChanged;
begin
  inherited EditingChanged;
end;

procedure TVertGridDataLinkEh.RecordChanged(Field: TField);
begin
  inherited RecordChanged(Field);
end;

procedure TVertGridDataLinkEh.UpdateData;
begin
  inherited UpdateData;
end;

function TVertGridDataLinkEh.GetGrid: TCustomDBVertGridEh;
begin
  Result := TCustomDBVertGridEh(inherited Grid);
end;

{ TRowLabelEh }

constructor TRowLabelEh.Create(Row: TAxisBarEh);
begin
  inherited Create(Row);
end;

destructor TRowLabelEh.Destroy;
begin
  inherited Destroy;
end;

procedure TRowLabelEh.Assign(Source: TPersistent);
begin
  if Source is TRowLabelEh then
  begin
    inherited Assign(Source);
  end else
    inherited Assign(Source);
end;

function TRowLabelEh.GetRow: TFieldRowEh;
begin
  Result := TFieldRowEh(AxisBar);
end;

function TRowLabelEh.GetFitHeightToData: Boolean;
begin
  if FitHeightToDataStored
    then Result := FFitHeightToData
    else Result := DefaultFitHeightToData;
end;

function TRowLabelEh.IsFitHeightToDataStored: Boolean;
begin
  Result := FFitHeightToDataStored;
end;

procedure TRowLabelEh.SetFitHeightToData(const Value: Boolean);
begin
  if FitHeightToDataStored and (Value = FFitHeightToData) then Exit;
  FitHeightToDataStored := True;
  FFitHeightToData := Value;
  Row.Changed(True);
end;

procedure TRowLabelEh.SetFitHeightToDataStored(const Value: Boolean);
begin
  if (Value = True) and (IsFitHeightToDataStored = False) then
  begin
    FFitHeightToDataStored := True;
    FFitHeightToData := DefaultFitHeightToData;
    Row.Changed(True);
  end else if (Value = False) and (IsFitHeightToDataStored = True) then
  begin
    FFitHeightToDataStored := False;
    FFitHeightToData := DefaultFitHeightToData;
    Row.Changed(True);
  end;
end;

function TRowLabelEh.DefaultFitHeightToData: Boolean;
begin
  Result := Row.Grid.RowsDefValues.RowLabel.FitHeightToData;
end;

function TRowLabelEh.GetOptimalWidth: Integer;
var
  CanvasHandleAllocated: Boolean;
begin
  CanvasHandleAllocated := True;
  if not Row.Grid.Canvas.HandleAllocated then
  begin
    Row.Grid.Canvas.Handle := GetDC(0);
    CanvasHandleAllocated := False;
  end;
  try

    Row.Grid.Canvas.Font := Font;
    Result := Row.Grid.Canvas.TextWidth(Caption) + 6;

  finally
    if not CanvasHandleAllocated then
    begin
      ReleaseDC(0, Row.Grid.Canvas.Handle);
      Row.Grid.Canvas.Handle := 0;
    end;
  end;
end;

{ TFieldRowEh }

constructor TFieldRowEh.Create(Collection: TCollection);
var
  Grid: TCustomDBVertGridEh;
begin
  Grid := nil;
  if Assigned(Collection) and (Collection is TDBVertGridRowsEh) then
    Grid := TDBVertGridRowsEh(Collection).Grid;
  if Assigned(Grid) then Grid.BeginLayout;
  try
    inherited Create(Collection);
    FFitRowHeightToTextLines := True;
  finally
    if Assigned(Grid) then Grid.EndLayout;
  end;
end;

destructor TFieldRowEh.Destroy;
begin
  inherited Destroy;
end;

procedure TFieldRowEh.DropDownBoxApplyTextFilter(DataSet: TDataSet;
  FieldName: String; Operation: TLSAutoFilterTypeEh; FilterText: String);
begin
  if Assigned(OnDropDownBoxApplyTextFilter) then
    OnDropDownBoxApplyTextFilter(Grid, Self, DataSet, FieldName, Operation, FilterText)
  else
    inherited DropDownBoxApplyTextFilter(DataSet, FieldName, Operation, FilterText);
end;

procedure TFieldRowEh.Assign(Source: TPersistent);
begin
  if Source is TFieldRowEh then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

function TFieldRowEh.CreateTitle: TAxisBarTitleEh;
begin
  Result := TRowLabelEh.Create(Self);
end;

function TFieldRowEh.GetGrid: TCustomDBVertGridEh;
begin
  if Assigned(Collection) and (Collection is TDBVertGridRowsEh) then
    Result := TDBVertGridRowsEh(Collection).Grid
  else
    Result := nil;
end;

{
function TFieldRowEh.GetHeight: Integer;
begin
  Result := Grid.RowHeights[Index];
end;
}

function TFieldRowEh.GetWidth: Integer;
begin
  Result := Grid.ColClientWidths(Grid.DataColOffset);
end;

procedure TFieldRowEh.GetColCellParams(EditMode: Boolean; ColCellParamsEh: TAxisColCellParamsEh);
begin
  if Assigned(OnGetCellParams) then
    OnGetCellParams(Self, EditMode, TRowCellParamsEh(ColCellParamsEh));
end;

function CalcHeightForTextLines(Canvas: TCanvas; Font: TFont; RowLines, RowHeight: Integer): Integer;
var
  tm: TTEXTMETRIC;
begin
  Canvas.Font := Font;
  GetTextMetrics(Canvas.Handle, tm);

  Result := (tm.tmExternalLeading + tm.tmHeight) * RowLines + RowHeight;
end;

function TFieldRowEh.TextLineHeight: Integer;
var
  CanvasHandleAllocated: Boolean;
begin
  CanvasHandleAllocated := True;
  if not Grid.Canvas.HandleAllocated then
  begin
    Grid.Canvas.Handle := GetDC(0);
    CanvasHandleAllocated := False;
  end;
  try
    Grid.Canvas.Font := Font;
    Result := Grid.Canvas.TextHeight('Wg');
  finally
    if not CanvasHandleAllocated then
    begin
      ReleaseDC(0, Grid.Canvas.Handle);
      Grid.Canvas.Handle := 0;
    end;
  end;
end;

function TFieldRowEh.PresetHeight: Integer;
var
  CanvasHandleAllocated: Boolean;
  LabelColHeight: Integer;
begin
  CanvasHandleAllocated := True;
  if not Grid.Canvas.HandleAllocated then
  begin
    Grid.Canvas.Handle := GetDC(0);
    CanvasHandleAllocated := False;
  end;
  try

    Grid.Canvas.Font := Font;
    if (RowHeight <> 0) or (RowLines <> 0) then
      Result := CalcHeightForTextLines(Grid.Canvas, Font, RowLines, RowHeight)
    else if (Grid.DataColParams.RowHeight <> 0) or (Grid.DataColParams.RowLines <> 0) then
      Result := CalcHeightForTextLines(Grid.Canvas, Font, Grid.DataColParams.RowLines, Grid.DataColParams.RowHeight)
    else
    begin
      Result := Grid.CalcStdDefaultRowHeight;
      Grid.Canvas.Font := Grid.Font;
      Result := Grid.Canvas.TextHeight('Wg');
      if Grid.Flat
        then Result := Result + 1
        else Result := Result + 3;
      if dgvhRowLines in Grid.Options then
        Inc(Result, Grid.GridLineWidth);
    end;

    if RowLabel.FitHeightToData then
    begin
      Grid.Canvas.Font := RowLabel.Font;
      LabelColHeight := Grid.Canvas.TextHeight('Wg');
      if Grid.Flat
        then LabelColHeight := LabelColHeight + 1
        else LabelColHeight := LabelColHeight + 3;
      if dgvhRowLines in Grid.Options then
        Inc(LabelColHeight, Grid.GridLineWidth);
      if LabelColHeight > Result then
        Result := LabelColHeight;
  end;

  finally
    if not CanvasHandleAllocated then
    begin
      ReleaseDC(0, Grid.Canvas.Handle);
      Grid.Canvas.Handle := 0;
    end;
  end;
end;

procedure TFieldRowEh.RowHeightChanged;
var
  AHeight: Integer;
begin
  AHeight := CalcRowHeight;
  if AHeight > Round(Grid.FInplaceEditorButtonWidth * 3 / 2)
    then FInplaceEditorButtonHeight := DefaultEditButtonHeight(Grid.FInplaceEditorButtonWidth,  Grid.Flat)
    else FInplaceEditorButtonHeight := AHeight;
end;

function TFieldRowEh.CalcRowHeight: Integer;
var
  uFormat: Integer;
  Rec: Trect;
  DefTextHeight: Integer;
  DrawPict: TPicture;
  MinAutoTextHeight: Integer;
  NewHeight: Integer;
  MaxDataHeight: Integer;
  TextRecWidth: Integer;
  CanvasHandleAllocated: Boolean;
begin
  CanvasHandleAllocated := True;

  if not Grid.Canvas.HandleAllocated then
  begin
    Grid.Canvas.Handle := GetDC(0);
    CanvasHandleAllocated := False;
  end;
  try

    DefTextHeight := PresetHeight;
    Result := DefTextHeight;

    if not FitRowHeightToData then
      Exit;
    if (GetColumnType = ctGraphicData) and Grid.DrawGraphicData then
    begin
      try
      DrawPict := Grid.GetPictureForField(Self);
      try
        uFormat := DT_CALCRECT;
        Result := DrawPict.Height;
        if DrawPict.Width > Width then
        begin
          if (Width <> 0) and (DrawPict.Width <> 0)
            then Result := Round(Result / (DrawPict.Width / Width))
            else Result := DefTextHeight;
        end;
        MinAutoTextHeight := DrawTextEh(Grid.Canvas.Handle, ' ', 1, Rec, uFormat);
        if MinAutoTextHeight > Result then
          Result := MinAutoTextHeight;
      finally
        DrawPict.Free;
      end;
      except
        on EInvalidGraphic do ;
        else raise;
      end;
    end else
    begin
      if RowLabel.FitHeightToData then
      begin
        TextRecWidth := Grid.LabelColWidth - 3;
        if Grid.RowCategories.Active then
          TextRecWidth := TextRecWidth - Grid.DefaultRowHeight - Grid.GridLineWidth;
        if (dgvhColLines in Grid.Options) and not Grid.LabelColParams.VertLines then
          Inc(TextRecWidth)
        else if not (dgvhColLines in Grid.Options) and Grid.LabelColParams.VertLines then
          Dec(TextRecWidth);
        if RowLabel.Alignment = taCenter then
          TextRecWidth := TextRecWidth - 2;
        Rec := Rect(0, 0, TextRecWidth, 1);
        uFormat := DT_CALCRECT;
        if Grid.RowsDefValues.RowLabel.WordWrap then
          uFormat := uFormat + DT_WORDBREAK;
        NewHeight := DrawTextEh(Grid.Canvas.Handle, RowLabel.Caption, Length(RowLabel.Caption), Rec, uFormat);
        MinAutoTextHeight := DrawTextEh(Grid.Canvas.Handle, ' ', 1, Rec, uFormat);
        if MinAutoTextHeight > NewHeight then
          NewHeight := MinAutoTextHeight;
        if Grid.Flat
          then NewHeight := NewHeight + 1
          else NewHeight := NewHeight + 3;
        if dgvhRowLines in Grid.Options then
          Inc(NewHeight, Grid.GridLineWidth);
        if NewHeight > Result then
          Result := NewHeight;
      end;

      if WordWrap and FitRowHeightToData then
      begin
        TextRecWidth := Width - 3 - EditButtonsWidth;
        if Alignment = taCenter then
          TextRecWidth := TextRecWidth - 2;
        Rec := Rect(0, 0, TextRecWidth, 1);
        uFormat := DT_CALCRECT;
        if WordWrap then
          uFormat := uFormat + DT_WORDBREAK;
        NewHeight := DrawTextEh(Grid.Canvas.Handle, DisplayText, Length(DisplayText), Rec, uFormat);
        MinAutoTextHeight := DrawTextEh(Grid.Canvas.Handle, ' ', 1, Rec, uFormat);
        if MinAutoTextHeight > NewHeight then
          NewHeight := MinAutoTextHeight;
        if not (dgvhRowLines in Grid.Options) and (NewHeight > MinAutoTextHeight) then
          Inc(NewHeight);
        if Grid.Flat
          then NewHeight := NewHeight + 1
          else NewHeight := NewHeight + 3;
        if dgvhRowLines in Grid.Options then
          Inc(NewHeight, Grid.GridLineWidth);
        if NewHeight > Result then
          Result := NewHeight;
  //      if dgRowLines in Grid.Options then
  //        Inc(Result, Grid.GridLineWidth);
      end else
      begin
//        Result := DefTextHeight;
  //      if dgRowLines in Grid.Options then
  //        Inc(Result, Grid.GridLineWidth);
      end;
    end;

    if (Grid.DataColParams.MaxRowHeight <> 0) or (Grid.DataColParams.MaxRowLines <> 0) then
    begin
      MaxDataHeight := CalcHeightForTextLines(Grid.Canvas, Font,
        Grid.DataColParams.MaxRowLines, Grid.DataColParams.MaxRowHeight);
      if Result > MaxDataHeight then
        Result := MaxDataHeight;
    end;
  finally
    if not CanvasHandleAllocated then
    begin
      ReleaseDC(0, Grid.Canvas.Handle);
      Grid.Canvas.Handle := 0;
    end;
  end;
end;

procedure TFieldRowEh.SafeSetNewHeight(NewHeight: Integer);
var
  DefRowExtraHeight, DefRowLines, DefLineHeight: Integer;
begin
  if FitRowHeightToTextLines then
  begin
    DefLineHeight := TextLineHeight;
    if (RowHeight = 0) and  (RowLines = 0) then
    begin
      if Grid.Flat
        then DefRowExtraHeight := 2
        else DefRowExtraHeight := 4;

      NewHeight := NewHeight - DefRowExtraHeight;
      if NewHeight < 0 then
      begin
        RowHeight := PresetHeight;
        Exit;
      end;

      DefRowLines := Round(NewHeight / DefLineHeight);
      if DefRowLines <= 0 then
        DefRowLines := 1;
    end else if RowLines = 0 then
    begin
      DefRowLines := Round(RowHeight / DefLineHeight);
      if DefRowLines <= 0 then
        DefRowLines := 1;
      if Grid.Flat
        then DefRowExtraHeight := 2
        else DefRowExtraHeight := 4;
    end else
    begin
      DefRowExtraHeight := RowHeight;
      NewHeight := NewHeight - DefRowExtraHeight;
      DefRowLines := Round(NewHeight / DefLineHeight);
      if DefRowLines <= 0 then
        DefRowLines := 1;
    end;

    FRowHeight := DefRowExtraHeight;
    FRowLines := DefRowLines;
    Changed(True);
  end else
  begin
    if NewHeight < 0 then NewHeight := 0;
    RowLines := 0;
    RowHeight := NewHeight;
  end;
end;

function TFieldRowEh.DefaultAlignment: TAlignment;
const
  PersAlignments: array [TPersistentAlignmentEh] of TAlignment =
    (taLeftJustify, taLeftJustify, taRightJustify, taCenter);
begin
  if Grid.DataColParams.PersistentAlignment = palNoSpecified
    then Result := inherited DefaultAlignment
    else Result := PersAlignments[Grid.DataColParams.PersistentAlignment];
end;

function TFieldRowEh.GetRowLabel: TRowLabelEh;
begin
  Result := TRowLabelEh(inherited Title);
end;

procedure TFieldRowEh.SetRowLabel(const Value: TRowLabelEh);
begin
  inherited Title := Value;
end;

procedure TFieldRowEh.SetRowHeight(const Value: Integer);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    Changed(True);
  end;
end;

procedure TFieldRowEh.SetRowLines(const Value: Integer);
begin
  if FRowLines <> Value then
  begin
    FRowLines := Value;
    Changed(True);
  end;
end;

procedure TFieldRowEh.FontChanged(Sender: TObject);
begin
  AssignedValues := AssignedValues + [cvFont];
  RowLabel.RefreshDefaultFont;
  Changed(True);
end;

function TFieldRowEh.GetFitRowHeightToData: Boolean;
begin
  if FitRowHeightToDataStored
    then Result := FFitRowHeightToData
    else Result := DefaultFitRowHeightToData;
end;

function TFieldRowEh.InplaceEditorButtonHeight: Integer;
begin
  Result := FInplaceEditorButtonHeight;
end;

function TFieldRowEh.IsFitRowHeightToDataStored: Boolean;
begin
  Result := FFitRowHeightToDataStored;
end;

procedure TFieldRowEh.SetFitRowHeightToData(const Value: Boolean);
begin
  if FitRowHeightToDataStored and (Value = FFitRowHeightToData) then Exit;
  FitRowHeightToDataStored := True;
  FFitRowHeightToData := Value;
  Changed(True);
end;

procedure TFieldRowEh.SetFitRowHeightToDataStored(const Value: Boolean);
begin
  if (Value = True) and (IsFitRowHeightToDataStored = False) then
  begin
    FFitRowHeightToDataStored := True;
    FFitRowHeightToData := DefaultFitRowHeightToData;
    Changed(True);
  end else if (Value = False) and (IsFitRowHeightToDataStored = True) then
  begin
    FFitRowHeightToDataStored := False;
    FFitRowHeightToData := DefaultFitRowHeightToData;
    Changed(True);
  end;
end;

function TFieldRowEh.DefaultFitRowHeightToData: Boolean;
begin
  Result := Grid.RowsDefValues.FitRowHeightToData;
end;

procedure TFieldRowEh.SetFitRowHeightToTextLines(const Value: Boolean);
begin
  if FFitRowHeightToTextLines <> Value then
  begin
    FFitRowHeightToTextLines := Value;
    Changed(True);
  end;
end;

procedure TFieldRowEh.SetTextArea(var CellRect: TRect);
begin
  if AlwaysShowEditButton then
  begin
    CellRect.Right := CellRect.Left + Width - EditButtonsWidth;
  end else
    CellRect.Right := CellRect.Left + Width;

  if (ImageList <> nil) and ShowImageAndText then
    Inc(CellRect.Left, ImageList.Width + 5);
end;

function TFieldRowEh.DefaultFont: TFont;
var
  Grid: TCustomDBVertGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid)
    then Result := Grid.DataColParams.Font
    else Result := Font;
end;

function TFieldRowEh.DefaultColor: TColor;
var
  Grid: TCustomDBVertGridEh;
begin
  Grid := GetGrid;
  if Assigned(Grid)
    then Result := Grid.DataColParams.GetColor
    else Result := Color;
end;

procedure TFieldRowEh.SetOnGetCellParams(const Value: TGetRowCellParamsEventEh);
begin
  FOnGetCellParams := Value;
end;

procedure TFieldRowEh.SetCategoryName(const Value: String);
begin
  if (FCategoryName <> Value) then
  begin
    FCategoryName := Value;
    if Grid <> nil then
      Grid.RowCategories.CategoryStructureObsolete;
    Changed(True);
  end;
end;

function TFieldRowEh.GetRowsColection: TDBVertGridRowsEh;
begin
  Result := TDBVertGridRowsEh(Collection);
end;

procedure TFieldRowEh.SetIndex(Value: Integer);
begin
  if RowsColection.SortOrder <> vgsoByFieldRowIndexEh then
  begin
    if not RowsColection.FInternalUpdating then
      Exit //Ignore expernal positioning with rows are sorted
    else
      inherited SetIndex(Value)
  end else
    inherited SetIndex(Value);
end;

function TFieldRowEh.GetOnCloseDropDownForm: TDBVertGridCloseDropDownFormEventEh;
begin
  Result := TDBVertGridCloseDropDownFormEventEh(inherited OnCloseDropDownForm);
end;

function TFieldRowEh.GetOnOpenDropDownForm: TDBVertGridShowDropDownFormEventEh;
begin
  Result := TDBVertGridShowDropDownFormEventEh(inherited OnOpenDropDownForm);
end;

procedure TFieldRowEh.SetOnCloseDropDownForm(const Value: TDBVertGridCloseDropDownFormEventEh);
begin
  inherited OnCloseDropDownForm := TDBAxisGridCloseDropDownFormEventEh(Value);
end;

procedure TFieldRowEh.SetOnOpenDropDownForm(const Value: TDBVertGridShowDropDownFormEventEh);
begin
  inherited OnOpenDropDownForm := TDBAxisGridShowDropDownFormEventEh(Value);
end;

{ TDBVertGridRowsEh }

constructor TDBVertGridRowsEh.Create(Grid: TCustomDBAxisGridEh; RowClass: TAxisBarEhClass);
begin
  inherited Create(Grid, RowClass);
  FOrderedList := TStringList.Create;
end;

destructor TDBVertGridRowsEh.Destroy;
begin
  FreeAndNil(FOrderedList);
  inherited Destroy;
end;

function TDBVertGridRowsEh.Add: TFieldRowEh;
begin
  Result := TFieldRowEh(inherited Add);
  if SortOrder <> vgsoByFieldRowIndexEh then
  begin
    Result.FSrcItemIndex := Result.Index;
    OrdersItemsObsolete;
  end;
end;

function TDBVertGridRowsEh.GetFieldRow(Index: Integer): TFieldRowEh;
begin
  if FOrdersItemsObsolete then
    CheckResortItems;
  Result := TFieldRowEh(inherited Items[Index]);
end;

procedure TDBVertGridRowsEh.SetRow(Index: Integer; Value: TFieldRowEh);
begin
  Items[Index].Assign(Value);
end;

procedure TDBVertGridRowsEh.Update(Item: TCollectionItem);
begin
  if (Grid = nil) or (csLoading in Grid.ComponentState) or FInternalUpdating then Exit;
  Grid.LayoutChanged;

  if SortOrder <> vgsoByFieldRowIndexEh then
    OrdersItemsObsolete;
end;

function TDBVertGridRowsEh.GetGrid: TCustomDBVertGridEh;
begin
  Result := TCustomDBVertGridEh(inherited Grid);
end;

procedure TDBVertGridRowsEh.AddAllRows(DeleteExisting: Boolean);
var
  I: Integer;
  FieldList: TObjectList;
begin
  FieldList := nil;
  if Assigned(Grid) and Assigned(Grid.DataSource) and
    Assigned(Grid.Datasource.Dataset) then
  begin
    Grid.BeginLayout;
    try
      if DeleteExisting then Clear;
      FieldList := TObjectList.Create(False);
      Grid.GetDatasetFieldList(FieldList);
      for I := 0 to FieldList.Count - 1 do
        Add.FieldName := TField(FieldList[I]).FieldName
    finally
      FieldList.Free;
      Grid.EndLayout;
    end
  end
  else
    if DeleteExisting then Clear;
end;

function TDBVertGridRowsEh.HaveDynamicRowHeight: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count-1 do
  begin
    if Items[i].FitRowHeightToData then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function ListSortCompareFunc(List: TStringList; Index1, Index2: Integer): Integer;
var
  FieldRow1, FieldRow2: TFieldRowEh;
begin
  FieldRow1 := TFieldRowEh(List.Objects[Index1]);
  FieldRow2 := TFieldRowEh(List.Objects[Index2]);
  if FieldRow2.RowsColection.SortOrder = vgsoByFieldRowIndexEh then
  begin
    if FieldRow1.FSrcItemIndex < FieldRow2.FSrcItemIndex then
      Result := -1
    else if FieldRow1.FSrcItemIndex > FieldRow2.FSrcItemIndex then
      Result := 1
    else
      Result := 0
  end else
  begin
    Result := CompareText(FieldRow1.RowLabel.Caption, FieldRow2.RowLabel.Caption);
    if FieldRow2.RowsColection.SortOrder = vgsoByFieldRowCaptionDescEh then
      Result := Result * -1;
  end;
end;

procedure TDBVertGridRowsEh.SetSortOrder(const Value: TDBVertGridRowsSortOrderEh);
var
  i: Integer;
begin
  if FSortOrder <> Value then
  begin
    FSortOrder := Value;
    BeginUpdate;
    OrdersItemsObsolete;
    try
      if FSortOrder = vgsoByFieldRowIndexEh then
      begin
        ResortOrderedItems;
        FOrdersItemsObsolete := False;
      end else
      begin
        for i := 0 to Count-1 do
          TFieldRowEh(inherited Items[i]).FSrcItemIndex := TFieldRowEh(inherited Items[i]).Index;
        ResortOrderedItems;
        FOrdersItemsObsolete := False;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TDBVertGridRowsEh.OrdersItemsObsolete;
begin
  FOrdersItemsObsolete := True;
end;

procedure TDBVertGridRowsEh.ResortOrderedItems;
var
  i: Integer;
  Item: TFieldRowEh;
begin
  FInternalUpdating := True;
  BeginUpdate;
  try
    FOrderedList.Clear;
    for i := 0 to Count-1 do
    begin
      Item := TFieldRowEh(inherited Items[i]);
      FOrderedList.AddObject(Item.RowLabel.Caption, Item);
    end;
    FOrderedList.CustomSort(ListSortCompareFunc);
    for i := 0 to Count-1 do
      TFieldRowEh(FOrderedList.Objects[i]).Index := i;
  finally
    EndUpdate;
    FInternalUpdating := False;
  end;
end;

procedure TDBVertGridRowsEh.CheckResortItems;
var
  i: Integer;
  Item: TFieldRowEh;
begin
  try
    if FOrderedList.Count <> Count then
    begin
      ResortOrderedItems;
      Exit;
    end;
    for i := 0 to Count-1 do
    begin
      Item := TFieldRowEh(inherited Items[i]);
      if Item.RowLabel.Caption <> FOrderedList[i] then
      begin
        ResortOrderedItems;
        Exit;
      end;
    end;
  finally
    FOrdersItemsObsolete := False;
  end;  
end;

function TDBVertGridRowsEh.IndexSeenPassthrough: Boolean;
begin
  Result :=  inherited IndexSeenPassthrough;
  if Result then
    Result := (SortOrder = vgsoByFieldRowIndexEh) and not FInternalUpdating;
end;

function TDBVertGridRowsEh.CheckAxisBarsToFieldsNoOrders: Boolean;
var
  i: Integer;
  SrcRowsField: array of TField;
begin
  Result := True;
  
  if Grid.Datalink.FieldCount <> Count then
  begin
    Result := False;
    Exit;
  end;

  SetLength(SrcRowsField, Count);
  for i := 0 to Count-1 do
    if (Items[i].FSrcItemIndex >= 0) and (Items[i].FSrcItemIndex < Count) then
      SrcRowsField[Items[i].FSrcItemIndex] := Items[i].Field;

  for i := 0 to Grid.Datalink.FieldCount-1 do
  begin
    if SrcRowsField[i] <> Grid.Datalink.Fields[i] then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure TDBVertGridRowsEh.BarsNotify(Item: TAxisBarEh;
  Action: TGridAxisBarsNotificationEh);
begin
  inherited BarsNotify(Item, Action);
  if not (csDestroying in Grid.ComponentState) then
  begin
    if Grid.RowCategories.Active then
      Grid.RowCategories.CategoryStructureObsolete;
    if (SortOrder <> vgsoByFieldRowIndexEh) and (Action in [gabnAddedEh, gabnExtractingEh]) then
      OrdersItemsObsolete;
  end;
end;

{ TCustomDBVertGridEh }

constructor TCustomDBVertGridEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDataColOffset := 1;
  DesignOptionsBoost := [goColSizing];
  FLabelColParams := TDBVertGridLabelColParamEh.Create(Self);
  FDataColParams := TDBVertGridDataColParamsEh.Create(Self);
  FDrawnGroupList := TList.Create;

  FLabelColImageChangeLink := TChangeLink.Create;
  FLabelColImageChangeLink.OnChange := LabelColImageListChange;

  BeginLayout;
  VirtualView := True;
  ScrollBars := ssBoth;
  inherited RowCount := 1;
  inherited ColCount := 2;
  Options := [dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol,
              dgvhColLines, dgvhRowLines,
              dgvhTabs, dgvhConfirmDelete, dgvhCancelOnExit];
  LabelColWidth := 64;
  DrawGraphicData := True;
  DrawMemoText := True;
  FRowCategories := TDBVertGridRowCategoriesEh.Create(Self);
  EndLayout;
end;

destructor TCustomDBVertGridEh.Destroy;
begin
  Destroying;
  FreeAndNil(FLabelColParams);
  FreeAndNil(FDataColParams);
  FreeAndNil(FLabelColImageChangeLink);
  FreeAndNil(FRowCategories);
  FreeAndNil(FDrawnGroupList);
  inherited Destroy;
end;

function TCustomDBVertGridEh.AcquireFocus: Boolean;
begin
  Result := inherited AcquireFocus;
end;

function TCustomDBVertGridEh.RawToDataRow(ARow: Integer): Integer;
var
  ANode: TDBVertGridCategoryTreeNodeEh;
begin
  if RowCategories.Active then
  begin
    ANode := RowCategories.CurrentCategoryTree.FlatItem[ARow];
    if (ANode <> nil) and
       (ANode.RowType = vgctFieldRowEh) and
       (ANode.FieldRow <> nil)
    then
      Result := ANode.FieldRow.Index
    else
      Result := -1;
  end else
    Result := ARow;
end;

function TCustomDBVertGridEh.DataToRawRow(ARow: Integer): Integer;
begin
  Result := ARow;
end;

function TCustomDBVertGridEh.CanEditAcceptKey(Key: Char): Boolean;
begin
  with Rows[SelectedIndex] do
    Result := Datalink.Active and Assigned(Field) and Field.IsValidChar(Key);
end;

function TCustomDBVertGridEh.CanEditModify: Boolean;
begin
  Result := False;
  if SelectedIndex < 0 then Exit;
  if Rows[SelectedIndex].GetColumnType in [{ctKeyPickList,} ctCheckboxes] then
    Exit
  else if not ReadOnly and Datalink.Active and not Datalink.Readonly then
    with Rows[SelectedIndex] do
      if (not ReadOnly) and Assigned(Field) and Field.CanModify
        and (not (Field.DataType in ftNonTextTypes) or Assigned(Field.OnSetText)) then
      begin
        Datalink.Edit;
        Result := Datalink.Editing;
        if Result then Datalink.Modified;
      end;
end;

function TCustomDBVertGridEh.CanEditShow: Boolean;
begin
  Result := (LayoutLock = 0) and inherited CanEditShow;
end;

function TCustomDBVertGridEh.CanEditorMode: Boolean;
begin
  Result := (dgvhAlwaysShowEditor in Options);
end;

procedure TCustomDBVertGridEh.RowMoved(FromIndex, ToIndex: Longint);
begin
  FromIndex := RawToDataRow(FromIndex);
  ToIndex := RawToDataRow(ToIndex);
  if (FromIndex < 0) or (ToIndex < 0) then Exit;
  Rows[FromIndex].Index := ToIndex;
  if Assigned(FOnRowMoved) then FOnRowMoved(Self, FromIndex, ToIndex);
end;

procedure TCustomDBVertGridEh.ColWidthsChanged;
begin
  inherited ColWidthsChanged;
  if (Datalink.Active or (Rows.State = csCustomized)) and AcquireLayoutLock then
  try
    if LabelColWidth <> ColWidths[0] then
    begin
      LabelColWidth := ColWidths[0];
      LayoutChanged;
    end;

    if (DataColParams.ColWidth <> 0) and (DataColParams.ColWidth <> ColWidths[1]) then
    begin
      if ColWidths[1] > 0 then
        DataColParams.ColWidth := ColWidths[1];
    end;

  finally
    EndLayout;
    UpdateEdit;
  end;
end;

function TCustomDBVertGridEh.CreateAxisBars: TGridAxisBarsEh;
begin
  Result := TDBVertGridRowsEh.Create(Self, TFieldRowEh);
end;

function TCustomDBVertGridEh.CreateAxisBarDefValues: TAxisBarDefValuesEh;
begin
  Result := TFieldRowDefValuesEh.Create(Self);
end;

function TCustomDBVertGridEh.CreateDataLink: TAxisGridDataLinkEh;
begin
  Result := TVertGridDataLinkEh.Create(Self);
end;

function TCustomDBVertGridEh.CreateEditor: TInplaceEdit;
begin
  Result := TDBGridInplaceEdit.Create(Self);
end;

function TCustomDBVertGridEh.WantInplaceEditorKey(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := inherited WantInplaceEditorKey(Key, Shift);
  case Key of
    VK_LEFT: Result := False;
    VK_RIGHT: Result := False;
    VK_HOME: Result := False;
    VK_END: Result := False;
  end;
end;

procedure TCustomDBVertGridEh.CreateWnd;
var
  AStdDefaultRowHeight: Integer;
begin
  BeginUpdate;   { prevent updates in WMSize message that follows WMCreate }
  try
    inherited CreateWnd;
  finally
    EndUpdate;
  end;

  AStdDefaultRowHeight := CalcStdDefaultRowHeight;
  if AStdDefaultRowHeight > Round(FInplaceEditorButtonWidth * 3 / 2)
    then FInplaceEditorButtonHeight := DefaultEditButtonHeight(FInplaceEditorButtonWidth,  Flat)
    else FInplaceEditorButtonHeight := AStdDefaultRowHeight;

  UpdateRowCount;
  UpdateActive;
end;

procedure TCustomDBVertGridEh.LinkActive(Value: Boolean);
begin
  inherited LinkActive(Value);
  if Value and RowCategories.Active then
    RowCategories.CheckRebuildRowCategories;
end;

procedure TCustomDBVertGridEh.DataChanged;
begin
  if not HandleAllocated then Exit;
  UpdateActive;
  ValidateRect(Handle, nil);
  Invalidate;
  if Rows.HaveDynamicRowHeight then
    LayoutChanged;
  InvalidateEditor;
  if RowCategories.Active then
    RowCategories.CheckRebuildRowCategories;
end;

procedure TCustomDBVertGridEh.DefaultHandler(var Msg);
var
  P: TPopupMenu;
  Cell: TGridCoord;
begin
  inherited DefaultHandler(Msg);
  if TMessage(Msg).Msg = wm_RButtonUp then
    with TWMRButtonUp(Msg) do
    begin
      Cell := MouseCoord(XPos, YPos);
      if (Cell.X < DataColOffset) or (Cell.Y < 0) then Exit;
      P := Rows[RawToDataRow(Cell.X)].PopupMenu;
      if (P <> nil) and P.AutoPopup then
      begin
        SendCancelMode(nil);
        P.PopupComponent := Self;
        with ClientToScreen(SmallPointToPoint(Pos)) do
          P.Popup(X, Y);
        Result := 1;
      end;
    end;
end;

procedure TCustomDBVertGridEh.DeferLayout;
var
  M: TMsg;
begin
  if HandleAllocated and
    not PeekMessage(M, Handle, cm_DeferLayout, cm_DeferLayout, pm_NoRemove) then
    PostMessage(Handle, cm_DeferLayout, 0, 0);
  CancelLayout;
end;

procedure TCustomDBVertGridEh.DefaultDrawRowDataCell(Cell, AreaCell: TGridCoord;
  FieldRow: TFieldRowEh; AreaRect: TRect; Params: TRowCellParamsEh);
begin
  DefaultDrawDataCell(Cell, AreaCell, FieldRow, AreaRect, Params);
  DrawRowCell(AreaRect, AreaCell.Y, FieldRow, Params.State);
end;

procedure TCustomDBVertGridEh.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
end;

function TCustomDBVertGridEh.AxisColumnsStorePropertyName: String;
begin
  Result := 'Rows';
end;

procedure TCustomDBVertGridEh.Paint;
begin
  inherited Paint;
  FDrawnGroupList.Clear;
end;

procedure TCustomDBVertGridEh.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
var
  AreaCol, AreaRow: Integer;
  FieldRow: TFieldRowEh;
  ANode: TDBVertGridCategoryTreeNodeEh;
  TreeSignRect: TRect;
  TextRect: TRect;
  TreeElement: TTreeElementEh;
  i: Integer;
  uFormat: Integer;
  FullRect: TRect;
  Text: String;
  ExpGlyph: TTreeViewGlyphStyleEh;
begin
  AreaCol := ACol;
  AreaRow := ARow;
  if RowCategories.Active then
  begin
    ANode := RowCategories.CurrentCategoryTree.FlatItem[AreaRow];
    if ANode.RowType = vgctFieldRowEh then
    begin
      FieldRow := ANode.FieldRow;
      if ACol = 0 then
      begin
        TreeSignRect := ARect;
        TreeSignRect.Right := ARect.Left;
        TreeSignRect.Left := TreeSignRect.Right - DefaultRowHeight;

        Canvas.Brush.Color := RowCategories.GetColor;
        for i := 0 to ANode.Level - 2 do
        begin
          OffsetRect(TreeSignRect, DefaultRowHeight, 0);
          if ANode = ANode.Parent[ANode.Parent.ItemsCount-1] then
          begin
            Canvas.Pen.Color := LabelColParams.GetHorzLineColor;
            Canvas.Polyline([Point(TreeSignRect.Left, TreeSignRect.Bottom-1),
                             Point(TreeSignRect.Right, TreeSignRect.Bottom-1)]);
            Dec(TreeSignRect.Bottom, 1);
          end;
          Canvas.FillRect(TreeSignRect);
        end;

        Inc(ARect.Left, DefaultRowHeight * (ANode.Level - 1));
//        if dgvhRowLines in Options then
        begin
          Canvas.Pen.Color := LabelColParams.GetHorzLineColor;
          if dgvhRowLines in Options then
          begin
            Canvas.Polyline([Point(ARect.Left, ARect.Bottom-1),
                             Point(ARect.Right, ARect.Bottom-1)]);
            Dec(ARect.Bottom);
          end;  
          Canvas.Polyline([Point(ARect.Left, ARect.Top),
                           Point(ARect.Left, ARect.Bottom)]);
          Inc(ARect.Left);
        end;
        DrawFieldRowLabelCell(FieldRow, ACol, ARow, AreaCol, AreaRow, ARect, AState)

      end else
      begin
        Dec(AreaCol);
        DrawFieldRowDataCell(FieldRow, ACol, ARow, AreaCol, AreaRow, ARect, AState);
      end;

    end else if ANode.RowType = vgctCategoryRowEh then
    begin
      if FDrawnGroupList.IndexOf(Pointer(AreaRow)) >= 0 then
        Exit;
      begin

        FullRect := ARect;
        if ACol = 0 then
        begin
          FullRect.Right := ARect.Right + ColWidths[1];
          if (dgvhColLines in Options) and not GridLineParams.DataVertLines then
            FullRect.Right := FullRect.Right + VertLineWidth;
        end else
          FullRect.Left := ARect.Left - ColWidths[0] - VertLineWidth;

        TextRect := FullRect;
        Canvas.Font := RowCategories.Font;
        Canvas.Brush.Color := RowCategories.GetColor;

        TreeSignRect := FullRect;
        TreeSignRect.Right := FullRect.Left;
        TreeSignRect.Left := TreeSignRect.Right - DefaultRowHeight;

        for i := 0 to ANode.Level - 1 do
        begin
          OffsetRect(TreeSignRect, DefaultRowHeight, 0);
          if (ANode.Expanded = False) or (ANode.Count = 0)
            then Canvas.Pen.Color := LabelColParams.GetHorzLineColor
            else Canvas.Pen.Color := Canvas.Brush.Color;

          Canvas.Polyline([Point(TreeSignRect.Left, TreeSignRect.Bottom-1),
                           Point(TreeSignRect.Right, TreeSignRect.Bottom-1)]);
          Dec(TreeSignRect.Bottom, 1);

          Canvas.FillRect(TreeSignRect);
          if ANode.Expanded
            then TreeElement := tehMinus
            else TreeElement := tehPlus;
          if ANode.HasChildren then
          begin
            Canvas.Pen.Color := clWindowText;
            ExpGlyph := RowCategories.ExpandingGlyphStyle;
            if ExpGlyph = tvgsDefaultEh then
              ExpGlyph := tvgsThemedEh;
            DrawTreeElement(Canvas, TreeSignRect, TreeElement, False, 1, 1,
              UseRightToLeftAlignment, True, ExpGlyph);
          end;
        end;

        Inc(FullRect.Left, DefaultRowHeight * (ANode.Level));
//        if dgvhRowLines in Options then
        begin
          Canvas.Pen.Color := LabelColParams.GetHorzLineColor;
          Canvas.Polyline([Point(FullRect.Left, FullRect.Bottom-1),
                           Point(FullRect.Right, FullRect.Bottom-1)]);
          Dec(FullRect.Bottom);
        end;

        TreeSignRect := TextRect;
        TreeSignRect.Right := TreeSignRect.Left;
        TreeSignRect.Left := TreeSignRect.Left - DefaultRowHeight;

        WriteTextEh(Canvas, FullRect, True, 2, 1,
          ANode.CategoryDisplayText, taLeftJustify, tlCenter, False,
          False, 0, 0, False, True);
        if (ANode = RowCategories.Node) and Focused then
        begin
          TextRect := Rect(FullRect.Left + 2, FullRect.Top + 1, FullRect.Left + 2, FullRect.Top + 1);
          uFormat := DT_CALCRECT;
          Text := ANode.CategoryDisplayText;
          if Text = '' then Text := ' ';
          DrawTextEh(Canvas.Handle, Text, Length(Text), TextRect, uFormat);
          InflateRect(TextRect, 2, 1);
          Canvas.Brush.Style := bsClear;
          Windows.DrawFocusRect(Canvas.Handle, TextRect);
        end;
      end;
      FDrawnGroupList.Add(Pointer(AreaRow));
    end;
  end else
  begin
    if ACol < FDataColOffset then
      DrawLabelCell(ACol, ARow, AreaCol, AreaRow, ARect, AState)
    else
    begin
      Dec(AreaCol, FDataColOffset);
      DrawDataCell(ACol, ARow, AreaCol, AreaRow, ARect, AState);
    end;
  end;
end;

procedure TCustomDBVertGridEh.DrawRowCell(const Rect: TRect; DataRow: Integer;
  FieldRow: TFieldRowEh; State: TGridDrawState);
begin
  if Assigned(OnDrawRowCell) then
    OnDrawRowCell(Self, Rect, DataRow, FieldRow, State);
end;

procedure TCustomDBVertGridEh.DrawDataCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState);
var
  FieldRow: TFieldRowEh;
begin
  FieldRow := Rows[ARow];
  DrawFieldRowDataCell(FieldRow, ACol, ARow, AreaCol, AreaRow, ARect, AState);
end;

procedure TCustomDBVertGridEh.DrawFieldRowDataCell(FieldRow: TFieldRowEh;
  ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState);
var
  Value: string;
  Processed: Boolean;
  Cell, AreaCell: TGridCoord;
  AReadOnly: Boolean;
  ARowCellParamsEh: TRowCellParamsEh;
begin

  Cell.X := ACol;
  Cell.Y := ARow;
  AreaCell.X := AreaCol;
  AreaCell.Y := AreaRow;

  Canvas.Font := FieldRow.Font;
  if CustomStyleActive and (FieldRow.Font.Color = clWindowText) then
    Canvas.Font.Color := FieldRow.Font.Color;
  Canvas.Brush.Color := FieldRow.Color;
  if CustomStyleActive and (FieldRow.Color = clWindow) then
    Canvas.Brush.Color := FInternalColor;

  Value := '';

  if (DataLink = nil) or not DataLink.Active or DataLink.DataSet.IsEmpty or
   (AreaCol < 0) or ((AreaCol >= InstantReadRecordCount) and not DataLink.DataSet.IsEmpty)  then
  begin
    if not GridBackgroundFilled then
      Canvas.FillRect(ARect);
    Exit;
  end;

  InstantReadRecordEnter(AreaCol);
  try

  Value := FieldRow.DisplayText;
  RowCellParamsEh.FThe3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
  RowCellParamsEh.DrawCellByThemes := IsDrawCellByThemes(Cell.X, Cell.Y,
    AreaCell.X, AreaCell.Y, AState, RowCellParamsEh.FThe3DRect);

  if RowCellParamsEh.FThe3DRect
    then RowCellParamsEh.FXFrameOffs := 1
    else RowCellParamsEh.FXFrameOffs := 2;
  RowCellParamsEh.FYFrameOffs := RowCellParamsEh.FXFrameOffs;
  if Flat then Dec(RowCellParamsEh.FYFrameOffs);

  if not DefaultDrawing and (csDesigning in ComponentState) then
  begin
    if not GridBackgroundFilled then
      Canvas.FillRect(ARect);
  end;

  AReadOnly := not FieldRow.CanModify(False);

  RowCellParamsEh.FState := AState;
  RowCellParamsEh.FFont := Canvas.Font;
  RowCellParamsEh.FAlignment := FieldRow.Alignment;
  RowCellParamsEh.FBackground := Canvas.Brush.Color;
  RowCellParamsEh.SuppressActiveCellColor := False;
  RowCellParamsEh.FText := Value;
  RowCellParamsEh.FImageIndex := FieldRow.GetImageIndex;
  RowCellParamsEh.FCheckboxState := FieldRow.CheckboxState;
  RowCellParamsEh.FBlankCell := False;
  RowCellParamsEh.FCol := ACol;
  RowCellParamsEh.FCellRect := ARect;
  RowCellParamsEh.FRow := ARow;
  RowCellParamsEh.FTextEditing := FieldRow.TextEditing;
  RowCellParamsEh.FReadOnly := AReadOnly;

  GetCellParams(FieldRow, Canvas.Font, RowCellParamsEh.FBackground, AState);
  FieldRow.GetColCellParams(False, RowCellParamsEh);


  Processed := False;
  ARowCellParamsEh := RowCellParamsEh;
  if Assigned(OnAdvDrawDataCell) then
    OnAdvDrawDataCell(Self, Cell, AreaCell, FieldRow, ARect,
      ARowCellParamsEh, Processed);

  if not Processed and Assigned(FieldRow.OnAdvDrawDataCell ) then
    FieldRow.OnAdvDrawDataCell(Self, Cell, AreaCell, FieldRow, ARect,
      ARowCellParamsEh, Processed);

  if not Processed then
    DefaultDrawRowDataCell(Cell, AreaCell, FieldRow, ARect, ARowCellParamsEh);

  if DefaultDrawing and (gdFocused in RowCellParamsEh.State)
    and ({(dgAlwaysShowSelection in Options) or }Focused)
    and not (csDesigning in ComponentState)
//    and not (dgRowSelect in Options)
    and (UpdateLock = 0)
    and (ValidParentForm(Self).ActiveControl = Self)
//    and Style.IsDrawFocusRect
//    and not Style.IsCustomStyleActive
  then
  begin
    Canvas.Brush.Style := bsClear;
    DrawFocusRect(Canvas.Handle, ARect);
  end;

  finally
    InstantReadRecordLeave;
  end;
end;

procedure TCustomDBVertGridEh.DrawLabelCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState);
var
  FieldRow: TFieldRowEh;
begin
  FieldRow := Rows[ARow];
  DrawFieldRowLabelCell(FieldRow, ACol, ARow, AreaCol, AreaRow, ARect, AState);
end;

procedure TCustomDBVertGridEh.DrawFieldRowLabelCell(FieldRow: TFieldRowEh; ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState);
const
  ScrollArrows: array [Boolean, Boolean] of Integer =
    ((DFCS_SCROLLRIGHT, DFCS_SCROLLLEFT), (DFCS_SCROLLLEFT, DFCS_SCROLLRIGHT));
var
  LabelRect, TextRect: TRect;
  GradientColor: TColor;
  HighlightColor, HighlightTextColor: TColor;
  VFrameOffs: Byte;
  HFrameOffs: Byte;
  AFillRect: TRect;

  procedure GetHighlightColor;
  begin
    HighlightColor := clHighlight;
    HighlightTextColor := clHighlightText;
{$IFDEF EH_LIB_16}
    if IsCustomStyleActive then
    begin
      StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecTextColor, HighlightTextColor);
      StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecFillColor, HighlightColor);
    end;
{$ENDIF}
  end;

begin
  LabelRect := ARect;

  GetHighlightColor;

  HFrameOffs := 3;
  if Flat
    then VFrameOffs := 1
    else VFrameOffs := 2;

  if FieldRow = nil then
  begin
    Canvas.FillRect(ARect);
    Exit;
  end;

  Canvas.Font := FieldRow.RowLabel.Font;
  if CustomStyleActive and (FieldRow.RowLabel.Font.Color = clWindowText) then
    Canvas.Font.Color := FInternalFixedFontColor;
  if CustomStyleActive and (FieldRow.Title.Color = clBtnFace)
    then Canvas.Brush.Color := FInternalFixedColor
    else Canvas.Brush.Color := FieldRow.Title.Color;
  if (ARow = Row) and (LabelColParams.GetActualFillStyle <> cfstThemedEh) then
  begin
    Canvas.Brush.Color := GetSelectionInactiveColor;
    Canvas.Font.Color := HighlightTextColor;
  end;
  TextRect := LabelRect;

  if ThemesEnabled then
  begin
    if LabelColParams.GetActualFillStyle = cfstThemedEh then
    begin
      AFillRect := ARect;
      Inc(AFillRect.Bottom, 2);
      Inc(AFillRect.Right, 2);

      FillCellRect(LabelColParams.GetActualFillStyle, AFillRect, False, False,
        ARect, False);
    end else
    begin
      if LabelColParams.GetActualFillStyle = cfstSolidEh then
        GradientColor := Canvas.Brush.Color
      else if ARow = Row
        then GradientColor := ApproximateColor(Canvas.Brush.Color, Self.Color, 64)
        else GradientColor := ColorToGray(ApproximateColor(Canvas.Brush.Color, Self.Color, 240));
      FillGradientEh(Canvas, ARect, GradientColor, Canvas.Brush.Color);
    end;
    WriteTextEh(Canvas, TextRect, False, HFrameOffs, VFrameOffs,
      FieldRow.RowLabel.Caption, FieldRow.RowLabel.Alignment, tlCenter,
      RowsDefValues.RowLabel.WordWrap, FieldRow.RowLabel.EndEllipsis, 0, 0,
      False, not RowsDefValues.RowLabel.WordWrap);
  end else
  begin
    WriteTextEh(Canvas, TextRect, True, HFrameOffs, VFrameOffs,
      FieldRow.RowLabel.Caption, FieldRow.RowLabel.Alignment, tlCenter,
      RowsDefValues.RowLabel.WordWrap, FieldRow.RowLabel.EndEllipsis, 0, 0,
      False, not RowsDefValues.RowLabel.WordWrap);
  end;

  if [dgvhRowLines, dgvhColLines] * Options = [dgvhRowLines, dgvhColLines] then
  begin
    InflateRect(LabelRect, 1, 1);
  end;
  AState := AState - [gdFixed];  // prevent box drawing later

  if (csDesigning in ComponentState) and
      Assigned(DBGridEhDesigntControler) and
      (FNoDesigntControler = False) and
     DBGridEhDesigntControler.ControlIsObjInspSelected(FieldRow)
  then
    DBGridEhDesigntControler.DrawDesignSelectedBorder(Canvas, ARect);
end;


procedure TCustomDBVertGridEh.DrawEmptySpace(ACol, ARow: Longint;
  StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh);
var
  i: Integer;
  HLinePos: Integer;
  StartPost, FinishPost: Integer;
  AFromColor: TColor;
  AToColor: TColor;
  IsExtent: Boolean;
  IsDrawBorder: Boolean;

  function CheckLine(ACol, ARow: Longint; IsVert: Boolean): Boolean;
  var
    BorderType: TGridCellBorderTypeEh;
    IsDraw: Boolean;
    BorderColor: TColor;
    IsExtent: Boolean;
  begin
    if IsVert
      then BorderType := cbtRightEh
      else BorderType := cbtBottomEh;
    BorderColor := 0;
    IsExtent := False;
    CheckDrawCellBorder(ACol, ARow, BorderType, IsDraw, BorderColor, IsExtent);
    Result := IsDraw;
  end;

  procedure DrawLine(AFromColor, AToColor: TColor; FromPoint, ToPoint: TPoint);
  var
    Points: array of TPoint;
  begin
    if GridLineParams.VertEmptySpaceStyle = dessGradiendEh then
      FillGradient(Canvas, Rect(FromPoint.X, FromPoint.Y, ToPoint.X+1, ToPoint.Y), AFromColor, AToColor)
    else
    begin
      Canvas.Pen.Color := AFromColor;
      SetLength(Points, 2);
      Points[0] := FromPoint;
      Points[1] := ToPoint;
      DrawPolyline(Points);
    end;
  end;
  
begin
  inherited DrawEmptySpace(ACol, ARow, StartX, StartY, StopX, StopY, DrawInfo);
  if LabelColParams.VertLines and (GridLineParams.VertEmptySpaceStyle <> dessNonEh) then
  begin
    HLinePos := -GridLineWidth;
    StartPost := DrawInfo.Vert.GridBoundary;
    FinishPost := DrawInfo.Vert.ContraExtent;
    if StartX <= DrawInfo.Horz.FixedBoundary then
    begin
      for i := 0 to DrawInfo.Horz.FixedCellCount-DrawInfo.Horz.FrozenCelCount-1 do
      begin
        Inc(HLinePos, ColWidths[i]+VertLineWidth);
        if not CheckLine(i, RowCount-1, True) then
          Continue;

        CheckDrawCellBorder(i, RowCount-1, cbtLeftEh, IsDrawBorder, AFromColor, IsExtent);
        if IsDrawBorder then
          DrawLine(AFromColor, FInternalColor, Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
      end;
      if DrawInfo.Horz.FrozenCelCount > 0 then
      begin
        for i := DrawInfo.Horz.FixedCellCount-DrawInfo.Horz.FrozenCelCount to DrawInfo.Horz.FixedCellCount-2 do
        begin
          Inc(HLinePos, ColWidths[i]+VertLineWidth);
          if not CheckLine(i, RowCount-1, True) then
            Continue;

          CheckDrawCellBorder(ACol, RowCount-1, cbtLeftEh, IsDrawBorder, AFromColor, IsExtent);
          if IsDrawBorder then
          begin
            AToColor := FInternalColor;

            DrawLine(AFromColor, AToColor,
              Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
           end;
        end;
        Inc(HLinePos, ColWidths[DrawInfo.Horz.FixedCellCount-1]+VertLineWidth);
        DrawLine(GridLineColors.GetDarkColor, FInternalColor,
          Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
      end;
    end;
  end;
end;

procedure TCustomDBVertGridEh.CheckDrawCellBorder(ACol, ARow: Integer;
  BorderType: TGridCellBorderTypeEh; var IsDraw: Boolean;
  var BorderColor: TColor; var IsExtent: Boolean);
var
  DrawGridBoundaryLine: Boolean;
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;

  function GetLastVisibleCol: Integer;
  var
    i: Integer;
  begin
    Result := ColCount-1;
    for i := ColCount-1 downto FixedCols do
    begin
      if ColWidths[i] <> EmptyColWidth then
      begin
        Result := i;
        Exit;
      end;
    end;
  end;

  function GetLastVisibleRow: Integer;
  var
    i: Integer;
  begin
    Result := ColCount-1;
    for i := RowCount-1 downto FixedRows do
    begin
      if RowHeights[i] <> EmptyRowHeight then
      begin
        Result := i;
        Exit;
      end;
    end;
  end;

  procedure CheckDrawGridBoundary;
  begin
    DrawGridBoundaryLine := False;
    if (BorderType in [cbtLeftEh, cbtRightEh]) and (GetLastVisibleCol = ACol) then
    begin
      if (CellAreaType.VertType = vctDataEh) and GridLineParams.GridBoundaries then
      begin
        if GridLineParams.DataBoundaryColor <> clDefault then
        begin
          BorderColor := GridLineParams.DataBoundaryColor;
          if GridLineParams.DataBoundaryColor = clNone
            then IsDraw := False
            else DrawGridBoundaryLine := True
        end else
        begin
          if (GridLineParams.GetDataVertColor = GridLineParams.GetDataHorzColor) and
             (GridLineParams.GetDataVertColor <> clNone)
          then
            BorderColor := GridLineParams.GetDarkColor
          else
            BorderColor := MightierColor(GridLineParams.GetDataVertColor, GridLineParams.GetDataHorzColor);
          DrawGridBoundaryLine := True;
        end;
      end;
      if DrawGridBoundaryLine then
        IsExtent := True;
    end else if GridLineParams.GridBoundaries and
                (BorderType in [cbtTopEh, cbtBottomEh]) and
                (GetLastVisibleRow = ARow) and
                (GridLineParams.VertEmptySpaceStyle = dessNonEh) then
    begin
      if CellAreaType.HorzType = hcTRowLabelEh then
      begin
        BorderColor := GridLineParams.GetDarkColor;
        DrawGridBoundaryLine := True;
        IsExtent := True;
      end else
      begin
        if GridLineParams.DataBoundaryColor <> clDefault then
        begin
          BorderColor := GridLineParams.DataBoundaryColor;
          if GridLineParams.DataBoundaryColor = clNone
            then IsDraw := False
            else DrawGridBoundaryLine := True
        end else
        begin
          if (GridLineParams.GetDataVertColor = GridLineParams.GetDataHorzColor) and
             (GridLineParams.GetDataVertColor <> clNone)
          then
            BorderColor := GridLineParams.GetDarkColor
          else
            BorderColor := MightierColor(GridLineParams.GetDataVertColor, GridLineParams.GetDataHorzColor);
          DrawGridBoundaryLine := True;
        end;
      end;
    end;

    if DrawGridBoundaryLine then
      IsDraw := True;
  end;

  procedure CheckRowLabelCellBorder;
  begin
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if not LabelColParams.VertLines then
        IsDraw := False
      else if LabelColParams.VertLines then
      begin
        BorderColor := LabelColParams.GetVertLineColor;
        IsDraw := True;
      end;
    end else
    begin
      if LabelColParams.HorzLines then
      begin
        BorderColor := LabelColParams.GetHorzLineColor;
        IsDraw := True;
      end else
        IsDraw := False;
    end;
  end;

  procedure CheckDrawDataCellBorder;
  begin
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if GridLineParams.DataVertLines
        then BorderColor := GridLineParams.GetDataVertColor
        else BorderColor := clNone;
      IsExtent := True;
      IsDraw := (BorderColor <> clNone);
    end else
    begin
      if GridLineParams.DataHorzLines
        then BorderColor := GridLineParams.GetDataHorzColor
        else BorderColor := clNone;
      IsExtent := True;
      IsDraw := (BorderColor <> clNone);
    end;
  end;

var
  ANode: TDBVertGridCategoryTreeNodeEh;
  ANextNode: TDBVertGridCategoryTreeNodeEh;
begin
  inherited CheckDrawCellBorder(ACol, ARow, BorderType, IsDraw, BorderColor, IsExtent);

  CellAreaType := GetCellAreaType(Self, ACol, ARow, AreaCol, AreaRow);

  if IsDraw then
    if (CellAreaType.HorzType = hcTRowLabelEh) then
      CheckRowLabelCellBorder
    else
      CheckDrawDataCellBorder;

  if RowCategories.Active and (ARow < RowCategories.CurrentCategoryTree.FlatItemsCount) then
  begin
    ANode := RowCategories.CurrentCategoryTree.FlatItem[ARow];
    if ARow < RowCategories.CurrentCategoryTree.FlatItemsCount - 1
      then ANextNode := RowCategories.CurrentCategoryTree.FlatItem[ARow+1]
      else ANextNode := nil;
      if (CellAreaType.HorzType = hcTRowLabelEh) and
         (BorderType in [cbtTopEh, cbtBottomEh]) then
      begin
        IsDraw := False;
      end else if
         (CellAreaType.HorzType = hctDataEh) and
         (ANode.RowType = vgctCategoryRowEh) and
         (BorderType in [cbtTopEh, cbtBottomEh]) then
      begin
        IsDraw := False;
      end else if
          (CellAreaType.HorzType = hcTRowLabelEh) and
          (ANode.RowType = vgctCategoryRowEh) and
          (BorderType = cbtRightEh) then
      begin
        IsDraw := False;
      end;
      if (ANextNode <> nil) and
         (CellAreaType.HorzType = hctDataEh) and
         (ANode.RowType = vgctFieldRowEh) and
         (ANextNode.RowType = vgctCategoryRowEh) and
         (BorderType in [cbtBottomEh]) then
      begin
        BorderColor := LabelColParams.GetHorzLineColor;
      end;
  end;

  CheckDrawGridBoundary;

  if IsDraw then
  begin
    if CellAreaType.HorzType = hcTRowLabelEh then
      if BorderType in [cbtLeftEh, cbtRightEh]
        then IsExtent := LabelColParams.VertLines
        else IsExtent := LabelColParams.HorzLines
    else
      if BorderType in [cbtLeftEh, cbtRightEh]
        then IsExtent := GridLineParams.DataVertLines
        else IsExtent := GridLineParams.DataHorzLines
  end;
end;

procedure TCustomDBVertGridEh.EditingChanged;
begin
  inherited EditingChanged;
end;

function TCustomDBVertGridEh.GetColField(DataCol: Integer): TField;
begin
  Result := nil;
  if (DataCol >= 0) and Datalink.Active and (DataCol < Rows.Count) then
    Result := Rows[DataCol].Field;
end;

function TCustomDBVertGridEh.GetEditLimit: Integer;
begin
  Result := 0;
  if Assigned(SelectedField) and (SelectedField.DataType in [ftString, ftWideString]) then
    Result := SelectedField.Size;
end;

function TCustomDBVertGridEh.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if Datalink.Active then
  with Rows[RawToDataRow(ACol)] do
    if Assigned(Field) then
      Result := Field.EditMask;
end;

function TCustomDBVertGridEh.GetEditStyle(ACol, ARow: Integer): TEditStyle;
var
  Row: TFieldRowEh;
  MasterField: TField;
begin
  Row := Rows[SelectedIndex];
  Result := esSimple;
  case Row.ButtonStyle of
   cbsEllipsis:
     Result := esEllipsis;
   cbsAuto:
     if Assigned(Row.Field) then
     with Row.Field do
     begin
       { Show the dropdown button only if the field is editable }
       if FieldKind = fkLookup then
       begin
         MasterField := Dataset.FieldByName(KeyFields);
         { Row.DefaultReadonly will always be True for a lookup field.
           Test if Row.ReadOnly has been assigned a value of True }
         if Assigned(MasterField) and MasterField.CanModify and
           not ((cvReadOnly in Row.AssignedValues) and Row.ReadOnly) then
           if not ReadOnly and DataLink.Active and not Datalink.ReadOnly then
           begin
             Result := esPickList;
           end;
       end
       else
       if Assigned(Row.Picklist) and (Row.PickList.Count > 0) and
         not Row.Readonly then
         Result := esPickList
       else if DataType in [ftDataset, ftReference] then
         Result := esEllipsis;
     end;
  end;
end;

function TCustomDBVertGridEh.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if Datalink.Active then
  with Rows[RawToDataRow(ARow)] do
    if Assigned(Field) then
      Result := Field.Text;
  FEditText := Result;
end;

function TCustomDBVertGridEh.GetFieldValue(ACol: Integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then Result := Field.DisplayText;
end;

function TCustomDBVertGridEh.GetSelectedIndex: Integer;
begin
  Result := RawToDataRow(Row);
end;

function TCustomDBVertGridEh.HighlightCell(DataCol, DataRow: Integer;
  const Value: string; AState: TGridDrawState): Boolean;
begin
  Result := False;
  if not Result then
    Result := (gdSelected in AState)
      and ({(dgvhAlwaysShowSelection in Options) or} Focused)
        { updatelock eliminates flicker when tabbing between rows }
      and ((UpdateLock = 0));
end;

procedure TCustomDBVertGridEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;

  procedure DoSelection(Select: Boolean; Direction: Integer);
  begin
    BeginUpdate;
    try
      if {(dgvhMultiSelect in Options) and} Datalink.Active then
        if Select and (ssShift in Shift) then
        begin
          if not FSelecting then
          begin
          end
        end;
      Datalink.MoveBy(Direction);
    finally
      EndUpdate;
    end;
  end;

  procedure NextRow(Select: Boolean);
  begin
    with Datalink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not Datalink.FModified then
        if Datalink.EOF then Exit else Cancel
      else
        DoSelection(Select, 1);
      if Datalink.EOF and CanModify and (not ReadOnly) and (dgvhEditing in Options) then
        Append;
    end;
  end;

  procedure PriorRow(Select: Boolean);
  begin
    with Datalink.Dataset do
      if (State = dsInsert) and not Modified and Datalink.EOF and
        not Datalink.FModified then
        Cancel
      else
        DoSelection(Select, -1);
  end;

  procedure Tab(GoForward: Boolean);
  var
    ACol, Original: Integer;
  begin
    ACol := Col;
    Original := ACol;
    BeginUpdate;    { Prevent highlight flicker on tab to next/prior row }
    try
      while True do
      begin
        if GoForward then
          Inc(ACol) else
          Dec(ACol);
        if ACol >= ColCount then
        begin
          NextRow(False);
          ACol := DataColOffset;
        end
        else if ACol < DataColOffset then
        begin
          PriorRow(False);
          ACol := ColCount - DataColOffset;
        end;
        if ACol = Original then Exit;
        if TabStops[ACol] then
        begin
          MoveFieldRow(ACol, 0);
          Exit;
        end;
      end;
    finally
      EndUpdate;
    end;
  end;

  function DeletePrompt: Boolean;
  var
    Msg: string;
  begin
    Msg := SDeleteRecordQuestion;
    Result := not (dgvhConfirmDelete in Options) or
      (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel);
  end;

const
  RowMovementKeys = [VK_UP, VK_PRIOR, VK_DOWN, VK_NEXT, VK_HOME, VK_END];

begin
  KeyDownEvent := OnKeyDown;
  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  if not Datalink.Active or not CanGridAcceptKey(Key, Shift) then Exit;
  if UseRightToLeftAlignment then
    if Key = VK_LEFT then
      Key := VK_RIGHT
    else if Key = VK_RIGHT then
      Key := VK_LEFT;
  with Datalink.DataSet do
    if ssCtrl in Shift then
    begin
      case Key of
        VK_UP, VK_PRIOR: inherited KeyDown(Key, Shift);
        VK_DOWN, VK_NEXT: inherited KeyDown(Key, Shift);
        VK_LEFT: First;
        VK_RIGHT: Last;
        VK_HOME: inherited KeyDown(Key, Shift);
        VK_END: inherited KeyDown(Key, Shift);
        VK_DELETE:
          if (not ReadOnly) and not IsEmpty
            and CanModify and DeletePrompt
          then
            Delete;
        VK_ADD:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.CurrentCategoryTree.ExpandAll;
        VK_SUBTRACT:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.CurrentCategoryTree.CollapseAll;
        VK_MULTIPLY:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            if RowCategories.Node.Expanded
              then RowCategories.CurrentCategoryTree.CollapseAll
              else RowCategories.CurrentCategoryTree.ExpandAll;
      end
    end
    else
      case Key of
        VK_UP: MoveFieldRow(Row - 1, -1);
        VK_DOWN: MoveFieldRow(Row + 1, 1);
        VK_LEFT:
          if RowCategories.Active and (RowCategories.Node <> nil) and (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.Node.Collapse
          else if not InplaceEditorVisible then
            PriorRow(True);
        VK_RIGHT:
          if RowCategories.Active and (RowCategories.Node <> nil) and (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.Node.Expand
          else if not InplaceEditorVisible then
            NextRow(True);
        VK_HOME: if not InplaceEditorVisible then First;
        VK_END: if not InplaceEditorVisible then Last;
        VK_NEXT: MoveFieldRow(Row + VisibleRowCount, -1);
        VK_PRIOR: MoveFieldRow(Row - VisibleRowCount, -1);
        VK_INSERT:
          if CanModify and (not ReadOnly) and (dgvhEditing in Options) then
          begin
            Insert;
          end;
        VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
        VK_ESCAPE:
          begin
            if SysLocale.PriLangID = LANG_KOREAN then
              FIsESCKey := True;
            Datalink.Reset;
            if not (dgvhAlwaysShowEditor in Options) then HideEditor;
          end;
        VK_F2: EditorMode := True;
        VK_ADD:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.Node.Expand;
        VK_SUBTRACT:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.Node.Collapse;
        VK_MULTIPLY:
          if RowCategories.Active and (RowCategories.Node <> nil) and
             (RowCategories.Node.RowType = vgctCategoryRowEh) then
            RowCategories.Node.Expanded := not RowCategories.Node.Expanded;
      end;
end;

procedure TCustomDBVertGridEh.KeyPress(var Key: Char);
begin
  FIsESCKey := False;
  if not (dgvhAlwaysShowEditor in Options) and (Key = #13) then
    Datalink.UpdateData;
  inherited KeyPress(Key);
end;

{ InternalLayout is called with layout locks and Row locks in effect }
procedure TCustomDBVertGridEh.InternalLayout;
var
  GridClientWidth: Integer;
  ALabelColWidth: Integer;
begin
  inherited InternalLayout;
  if ([csLoading, csDestroying] * ComponentState) <> [] then Exit;

  if RowCategories.Active and RowCategories.FCategoryStructureObsolete then
    RowCategories.CheckRebuildRowCategories;

  if HandleAllocated
    then GridClientWidth := ClientWidth
    else GridClientWidth := Width;

  if dgvhLabelCol in Options then
  begin
    FDataColOffset := 1;
    ColCount := 2;
    inherited FixedCols := 1;
    if DataColParams.ColWidth <> 0 then
      ColWidths[0] := LabelColWidth
    else
    begin
      if LabelColWidth > GridClientWidth - 5 then
        if GridClientWidth < 10 then
          ColWidths[0] := GridClientWidth div 2
        else
          ColWidths[0] := GridClientWidth - 5
      else
        ColWidths[0] := LabelColWidth;
    end;
    ALabelColWidth := ColWidths[0];
  end else
  begin
    FDataColOffset := 0;
    inherited FixedCols := 0;
    ColCount := 1;
    ALabelColWidth := 0;
  end;

  if DataColParams.ColWidth = 0
    then ColWidths[FDataColOffset] := GridClientWidth - ALabelColWidth - (FDataColOffset + 1) * VertLineWidth
    else ColWidths[FDataColOffset] := DataColParams.ColWidth;

  DefaultRowHeight := CalcStdDefaultRowHeight; 
  UpdateRowCount;
  UpdateRowHeights;

  SetColumnAttributes;
  UpdateActive;
  InvalidateEditor;
  Invalidate;
end;

procedure TCustomDBVertGridEh.Loaded;
begin
  inherited Loaded;
  if Rows.Count > 0 then
    RowCount := Rows.Count;
  LayoutChanged;
  if (FNoDesigntControler = False) and
      Assigned(DBGridEhDesigntControler) and
      (csDesigning in ComponentState)
  then
  begin
    DBGridEhDesigntControler.KeyProperyModified(Self);
  end;
end;

procedure TCustomDBVertGridEh.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TGridCoord;
  OldCol,OldRow: Integer;
  ANode: TDBVertGridCategoryTreeNodeEh;
  LeftTreeBorder, RightTreeBorder: Integer;
  TrackingRequest: Boolean;
begin
  if Assigned(DBGridEhDesigntControler) and
    DBGridEhDesigntControler.IsDesignHitTest(Self, X, Y, Shift)
  then
    DBGridEhDesigntControler.DesignMouseDown(Self, X, Y, Shift);

  if not AcquireFocus then Exit;
  if (ssDouble in Shift) and (Button = mbLeft) and not Sizing(X, Y) then
  begin
    DblClick;
    Exit;
  end;

  if Sizing(X, Y) then
  begin
    Datalink.UpdateData;
    if (Shift = [ssLeft, ssDouble]) and (CheckSizingState(X, Y) = gsColSizing) then
      OptimizeColWidthAndPassToNext
    else
      inherited MouseDown(Button, Shift, X, Y);
    Exit;
  end;

  Cell := MouseCoord(X, Y);
  if (Cell.X < 0) and (Cell.Y < 0) then
  begin
    inherited MouseDown(Button, Shift, X, Y);
    Exit;
  end;

  if (DragKind = dkDock) and (Cell.X < DataColOffset) and
    (Cell.Y < DataColOffset) and not (csDesigning in ComponentState) then
  begin
    BeginDrag(false);
    Exit;
  end;

  TrackingRequest := False;
  if not (csDesigning in ComponentState) and Datalink.Active then
  begin
    with Cell do
    begin
      BeginUpdate;   { eliminates highlight flicker when selection moves }
      try
        Datalink.UpdateData; // validate before moving
        HideEditor;
        OldCol := Col;
        OldRow := Row;
        MoveFieldRow(Y, 0);
        if (Button = mbLeft) and
          (((X = OldCol) and (Y = OldRow)) or (dgvhAlwaysShowEditor in Options)) then
          ShowEditor         { put grid in edit mode }
        else
          InvalidateEditor;  { draw editor, if needed }
        if (Button = mbLeft) and (X = DataColOffset-1) and
           MouseCapture and (FGridState = gsNormal)
        then
        begin
          TrackingRequest := True;
        end;
      finally
        EndUpdate;
      end;
    end;

    if RowCategories.Node <> nil then
    begin
      ANode := RowCategories.Node;
      if (Cell.X = DataColOffset-1) and (ANode.RowType = vgctCategoryRowEh) then
      begin
        LeftTreeBorder := DefaultRowHeight * (ANode.Level-1);
        RightTreeBorder := DefaultRowHeight * (ANode.Level);

        if (X > LeftTreeBorder) and (X < RightTreeBorder) then
          if ANode.Expanded
            then
              if ([ssShift, ssAlt, ssCtrl] * Shift = [ssCtrl])
                then ANode.Owner.CollapseAll
                else ANode.Collapse
            else
              if ([ssShift, ssAlt, ssCtrl] * Shift = [ssCtrl])
                then ANode.Owner.ExpandAll
                else ANode.Expand

      end;
    end;
  end;

  if ((csDesigning in ComponentState) or (dgvhRowMove in Options)) and
    (Cell.X < DataColOffset) then
  begin
    Datalink.UpdateData;
    inherited MouseDown(Button, Shift, X, Y);
//    Exit;
  end;

  if TrackingRequest and MouseCapture and (FGridState = gsNormal) then
  begin
    FTracking := True;
    TimerScroll;
  end;
end;

procedure TCustomDBVertGridEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
begin
  FMoveMousePos := Point(X, Y);
  inherited MouseMove(Shift, X, Y);
  Cell := MouseCoord(X, Y);
  if FTracking and (Cell.Y >= 0) and (Cell.Y <> Row) then
    MoveFieldRow(Cell.Y, 0);
end;

procedure TCustomDBVertGridEh.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  Cell: TGridCoord;
  NoClick: Boolean;
  FieldRowNum: Integer;
  IsInternalUpdating: Boolean;
begin
  IsInternalUpdating := False;
  NoClick := (FGridState in [gsRowSizing, gsColSizing]) or
    ((FGridState in [gsRowMoving, gsColMoving]) and (FMoveIndex <> FMovePos));
  if FGridState = gsRowMoving then
  begin
    BeginUpdate;
    IsInternalUpdating := True;
  end;
  inherited MouseUp(Button, Shift, X, Y);
  if IsInternalUpdating then
    EndUpdate;
  StopTracking;
  Cell := MouseCoord(X, Y);
  if not NoClick and (Cell.Y >= 0) and (Cell.X >= 0) then
  begin
    FieldRowNum := RawToDataRow(Cell.Y);
    if FieldRowNum >= 0 then
    begin
      if (Cell.X < DataColOffset) then
        LabelColClick(Rows[FieldRowNum])
      else
        CellClick(Rows[FieldRowNum]);
    end;
  end;
end;

procedure TCustomDBVertGridEh.OptimizeColWidth(OptimizeMethod: TOptimizeColWidthMethodEh);
var
  i: Integer;
  MaxWidth, CaptionRowWidth: Integer;
  AMinDataColwidth: Integer;
begin
  if OptimizeMethod = ocmToFitCaptionsEh then
  begin
    MaxWidth := 0;
    for i := 0 to Rows.Count-1 do
    begin
      CaptionRowWidth := Rows[i].RowLabel.GetOptimalWidth;
      if CaptionRowWidth > MaxWidth then
        MaxWidth := CaptionRowWidth;
    end;

    if Flat then
    begin
      AMinDataColwidth := FlatButtonWidth;
      if not ThemesEnabled then
        Inc(AMinDataColwidth);
    end else
      AMinDataColwidth := GetSystemMetrics(SM_CXVSCROLL);

    if MaxWidth > ClientWidth - AMinDataColwidth then
    begin
      OptimizeColWidthAndPassToNext;
    end else
    begin
      LabelColWidth := MaxWidth;
    end;
  end else if OptimizeMethod = ocmToMidleEh then
  begin
    LabelColWidth := ClientWidth div 2;
  end else if OptimizeMethod = ocmToFitDataEh then
  begin
//  TODO
  end;
end;

procedure TCustomDBVertGridEh.OptimizeColWidthAndPassToNext;
begin
  if FLastOptimizeColWidthMethodEh = ocmToFitCaptionsEh then
  begin
    OptimizeColWidth(ocmToFitCaptionsEh);
    FLastOptimizeColWidthMethodEh := ocmToMidleEh;
  end else if FLastOptimizeColWidthMethodEh = ocmToMidleEh then
  begin
    OptimizeColWidth(ocmToMidleEh);
    FLastOptimizeColWidthMethodEh := ocmToFitCaptionsEh;
  end else if FLastOptimizeColWidthMethodEh = ocmToFitDataEh then
  begin
    OptimizeColWidth(ocmToFitDataEh);
    FLastOptimizeColWidthMethodEh := ocmToFitCaptionsEh;
  end;
end;

procedure TCustomDBVertGridEh.TimerScroll;
var
  Distance, Interval: Integer;
begin
  Distance := 100;
  if FMoveMousePos.Y < 0 then
  begin
    MoveFieldRow(Row - 1, 0);
    Distance := - FMoveMousePos.Y;
  end else if FMoveMousePos.Y >= Height then
  begin
    MoveFieldRow(Row + 1, 0);
    Distance := FMoveMousePos.Y - Height;
  end;
  Interval := 200 - Distance * 5;
  if Interval < 0 then Interval := 0;
  ResetTimer(Interval);
end;

procedure TCustomDBVertGridEh.StopTracking;
begin
  if FTracking then
  begin
    StopTimer;
    FTracking := False;
  end;
end;

procedure TCustomDBVertGridEh.CancelMode;
begin
  inherited CancelMode;
  if FTracking then
    StopTracking;
end;

procedure TCustomDBVertGridEh.DefaultCellMouseClick(Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  FieldRow: TFieldRowEh;
  FieldRowIndex: Integer;
begin
  if (Button = mbLeft) and
     RowCategories.Active and
     (RowCategories.Node <> nil) and
     (RowCategories.Node.RowType = vgctCategoryRowEh) then
  begin
    if ssDouble in Shift then
      RowCategories.Node.Expanded := not RowCategories.Node.Expanded;
  end else
  begin
    FieldRowIndex := RawToDataRow(Cell.Y);
    if FieldRowIndex >= 0 then
    begin
      FieldRow := Rows[FieldRowIndex];
      if (mbLeft = Button) and (Cell.X > 0) and (FieldRow.GetColumnType in [ctKeyImageList..ctCheckboxes]) then
      begin
        if not FieldRow.DblClickNextVal and not (ssDouble in Shift) and FieldRow.CanModify(True) then
          if (ssShift in Shift)
            then FieldRow.SetNextFieldValue(-1)
            else FieldRow.SetNextFieldValue(1);
      end;
    end;
  end;
end;

procedure TCustomDBVertGridEh.DefaultCellMouseDown(Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  EditButtonsWidth: Integer;
  FieldRow: TFieldRowEh;
  ButtonRect: TRect;
  ARect: TRect;
  APointInRect: Boolean;
  TargetWC: TWinControl;
  ClientX, CLientY: Integer;
  ACellRect: TRect;
  FieldRowIndex: Integer;
begin
  if (Button = mbLeft) and (Cell.X > 0) and (Cell.Y >= 0) then
  begin
    FieldRowIndex := RawToDataRow(Cell.Y);
    if FieldRowIndex >= 0 then
    begin
    FieldRow := Rows[FieldRowIndex];
      EditButtonsWidth := FieldRow.EditButtonsWidth;
      ARect := Rect(0, 0, ColWidths[Cell.X], RowHeights[Cell.X]);
      if Self.UseRightToLeftAlignment
        then ButtonRect := Rect(ARect.Left, ARect.Top, ARect.Left + EditButtonsWidth, ARect.Bottom)
        else ButtonRect := Rect(ARect.Right - EditButtonsWidth, ARect.Top, ARect.Right, ARect.Bottom);
      APointInRect := PointInRect(Point(X, Y), ButtonRect);
      if  (dgvhAlwaysShowEditor in Options) or ((EditButtonsWidth > 0) and APointInRect)
  //        or
  //        ((X = OldCol) and (Y = OldRow))
      then
        ShowEditor;

      if (InplaceEditor <> nil) and InplaceEditor.Visible and APointInRect then
      begin
        if (Cell.X > DataColOffset - 1) and (EditButtonsWidth > 0) then
        begin
  //        StopTracking;
          ACellRect := CellRect(Cell.X, Cell.Y);
          ClientX := ACellRect.Left + X;
          CLientY := ACellRect.Top + Y;
          TargetWC := FindVCLWindow(ClientToScreen(Point(ClientX, CLientY)));
          if (TargetWC <> nil) and (TargetWC <> Self) then
            TargetWC.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
              SmallPointToInteger(PointToSmallPoint(TargetWC.ScreenToClient(ClientToScreen(Point(ClientX, CLientY))))));
        end;
      end;
    end; 
  end;
end;

procedure TCustomDBVertGridEh.MoveFieldRow(RawRow, Direction: Integer);
var
  OldRow: Integer;
begin
  Datalink.UpdateData;
  if RawRow >= RowCount then
    RawRow := RowCount - 1;
  if RawRow < 0 then RawRow := 0;
  if Direction <> 0 then
  begin
    while (RawRow < RowCount) and (RawRow >= 0) and (RowHeights[RawRow] <= 0) do
      Inc(RawRow, Direction);
    if (RawRow >= RowCount) or (RawRow < 0) then Exit;
  end;
  OldRow := Row;
  if RawRow <> OldRow then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
        FieldRowExit;
      finally
        FInColExit := False;
      end;
      if Row <> OldRow then Exit;
    end;
    if not (dgvhAlwaysShowEditor in Options) then HideEditor;
    Row := RawRow;
    FieldRowEnter;
    InvalidateRow(Row);
    InvalidateRow(OldRow);
  end;
end;

procedure TCustomDBVertGridEh.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
end;

procedure TCustomDBVertGridEh.RecordChanged(Field: TField);
begin
  inherited RecordChanged(Field);
  if not HandleAllocated then Exit;
  Invalidate;
end;

procedure TCustomDBVertGridEh.Scroll(Distance: Integer);
begin
  DataChanged;
end;

procedure TCustomDBVertGridEh.SetRows(Value: TDBVertGridRowsEh);
begin
  Rows.Assign(Value);
end;

function ReadOnlyField(Field: TField): Boolean;
var
  MasterField: TField;
begin
  Result := Field.ReadOnly;
  if not Result and (Field.FieldKind = fkLookup) then
  begin
    Result := True;
    if Field.DataSet = nil then Exit;
    MasterField := Field.Dataset.FindField(Field.KeyFields);
    if MasterField = nil then Exit;
    Result := MasterField.ReadOnly;
  end;
end;

procedure TCustomDBVertGridEh.SetColumnAttributes;
var
  I: Integer;
begin
  for I := 0 to Rows.Count-1 do
  with Rows[I] do
  begin
//    TabStops[I + IndicatorOffset] := Showing and not ReadOnly and DataLink.Active and
//      Assigned(Field) and not (Field.FieldKind = fkCalculated) and not ReadOnlyField(Field);
//    RowHeights[I + IndicatorOffset] := DefaultRowHeight;
  end;
end;

procedure TCustomDBVertGridEh.SetOptions(Value: TDBVHGridOptions);
const
  LayoutOptions = [dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol,
    dgvhColLines, dgvhRowLines
    {, dgvhAlwaysShowSelection}];
var
  NewGridOptions: TGridOptions;
  ChangedOptions: TDBVHGridOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [];
    if dgvhColLines in Value then
      NewGridOptions := NewGridOptions + [goFixedVertLine, goVertLine];
    if dgvhRowLines in Value then
      NewGridOptions := NewGridOptions + [goFixedHorzLine, goHorzLine];
    if dgvhRowResize in Value then
      NewGridOptions := NewGridOptions + [goRowSizing];
    if (dgvhRowMove in Value) {and (csDesigning in ComponentState)} then
      NewGridOptions := NewGridOptions + [goRowMoving];
    if dgvhTabs in Value then Include(NewGridOptions, goTabs);
    if dgvhEditing in Value then Include(NewGridOptions, goEditing);
    if dgvhAlwaysShowEditor in Value then Include(NewGridOptions, goAlwaysShowEditor);
    inherited Options := NewGridOptions;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    FOptions := Value;
    if ChangedOptions * LayoutOptions <> [] then LayoutChanged;
  end;
end;

procedure TCustomDBVertGridEh.SetSelectedIndex(Value: Integer);
begin
  MoveFieldRow(DataToRawRow(Value), 0);
end;

procedure TCustomDBVertGridEh.TimedScroll(Direction: TGridScrollDirection);
begin
  if Datalink.Active then
  begin
    with Datalink do
    begin
      if sdUp in Direction then
      begin
        Datalink.MoveBy(-ActiveRecord - 1);
        Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
        Datalink.MoveBy(RecordCount - ActiveRecord);
        Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then inherited TimedScroll(Direction);
  end;
end;

procedure TCustomDBVertGridEh.LabelColClick(Row: TFieldRowEh);
begin
  if Assigned(FOnLabelColClick) then FOnLabelColClick(Row);
end;

procedure TCustomDBVertGridEh.CellClick(Row: TFieldRowEh);
begin
  if Assigned(FOnCellClick) then FOnCellClick(Row);
end;

procedure TCustomDBVertGridEh.RowLabelFontChanged(Sender: TObject);
begin
  if dgvhLabelCol in Options then LayoutChanged;
end;

procedure TCustomDBVertGridEh.UpdateActive;
var
  NewCol: Integer;
  Field: TField;
begin
  if Datalink.Active and HandleAllocated and not (csLoading in ComponentState) then
  begin
    NewCol := DataColOffset;
    if Row <> NewCol then
    begin
      if not (dgvhAlwaysShowEditor in Options) then HideEditor;
      MoveColRow(NewCol, Row, False, False, True);
      InvalidateEditor;
    end;
    Field := SelectedField;
    if Assigned(Field) and (Field.Text <> FEditText) then
      InvalidateEditor;
  end;
end;

procedure TCustomDBVertGridEh.UpdateData;
begin
  inherited UpdateData;
end;

procedure TCustomDBVertGridEh.UpdateRowCount;
begin

  if RowCategories.Active then
  begin
    RowCategories.CurrentCategoryTree.BuildFlatList;
    RowCount := RowCategories.CurrentCategoryTree.FlatItemsCount;
  end else
  begin
    RowCount := Rows.Count;
  end;

end;

procedure TCustomDBVertGridEh.UpdateRowHeights;
var
  i: Integer;
begin
  try
    if RowCategories.Active then
    begin
      for i := 0 to RowCategories.CurrentCategoryTree.FlatItemsCount-1 do
      begin
        RowHeights[i] := RowCategories.CurrentCategoryTree[i].CalcRowHeight;
        if RowCategories.CurrentCategoryTree[i].RowType = vgctFieldRowEh then
          RowCategories.CurrentCategoryTree[i].FieldRow.RowHeightChanged;
      end;
    end else
      for i := 0 to Rows.Count-1 do
      begin
        if Rows[i].Visible then
        begin
          RowHeights[i] := Rows[i].CalcRowHeight;
          Rows[i].RowHeightChanged;
        end else
          RowHeights[i] := -1;
      end;
  finally
  end;
end;

function TCustomDBVertGridEh.ValidFieldIndex(FieldIndex: Integer): Boolean;
begin
  Result := DataLink.GetMappedIndex(FieldIndex) >= 0;
end;

procedure TCustomDBVertGridEh.CMExit(var Message: TMessage);
begin
  try
    if Datalink.Active then
      with Datalink.Dataset do
        if (dgvhCancelOnExit in Options) and (State = dsInsert) and
          not Modified and not Datalink.FModified then
          Cancel else
          Datalink.UpdateData;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TCustomDBVertGridEh.CMHintsShowPause(var Message: TCMHintShowPause);
var
  Cell: TGridCoord;
  FieldRow: TFieldRowEh;
  ACellRect: TRect;
  PauseLoc: Integer;
  Processed: Boolean;
  InCellCursorPos: TPoint;
  FieldRowIndex: Integer;
begin
  with Message do
  begin
    Cell := MouseCoord(HitTest.X, HitTest.Y);
    if (Cell.X < 0) or (Cell.Y < 0) then Exit;
    FieldRowIndex := RawToDataRow(Cell.Y);
    if FieldRowIndex < 0 then Exit;
    FieldRow := Rows[FieldRowIndex];
    ACellRect := CellRect(Cell.X, Cell.Y);
    InCellCursorPos :=
      Point(HitTest.X-ACellRect.TopLeft.X, HitTest.Y-ACellRect.TopLeft.Y);
    Processed := False;
    PauseLoc := Application.HintPause;
    if Assigned(FOnHintShowPause) then
      OnHintShowPause(Self, HitTest, Cell, InCellCursorPos, FieldRow, PauseLoc, Processed);
    if not Processed and Assigned(FieldRow) and Assigned(FieldRow.FOnHintShowPause) then
      FieldRow.OnHintShowPause(Self, HitTest, Cell, InCellCursorPos, FieldRow, PauseLoc, Processed);
    if not Processed  then
      if ((Cell.X >= DataColOffset) and DataLink.Active and FieldRow.ToolTips) or
        ((Cell.X = DataColOffset - 1) and FieldRow.RowLabel.ToolTips and (FieldRow.RowLabel.Hint = ''))
        then PauseLoc := 0
        else PauseLoc := Application.HintPause;

{$IFDEF CIL}
    Pause := PauseLoc;
{$ELSE}
    Pause^ := PauseLoc;
{$ENDIF}
  end;
end;

procedure TCustomDBVertGridEh.CMHintShow(var Message: TCMHintShow);
var
  Cell: TGridCoord;
  FieldRow: TFieldRowEh;
  TextWidth, DataRight, RightIndent, EmptyVar: Integer;
  s: String;
  ARect: TRect;
  WordWrap: Boolean;
  TextWider: Boolean;
  AAlignment: TAlignment;
  TopIndent: Integer;
  IsDataToolTips: Boolean;
{$IFDEF CIL}
  AHintInfo: THintInfo;
{$ENDIF}
  Params: TDBVertGridEhDataHintParams;
  Processed: Boolean;
  InCellCursorPos: TPoint;
  FieldRowIndex: Integer;

  function GetToolTipsFieldRowText(FieldRow: TFieldRowEh): String;
  var KeyIndex: Integer;
  begin
    Result := '';
    if FieldRow.GetColumnType in [ctKeyImageList, ctCheckboxes] then
    begin
      if FieldRow.GetColumnType = ctKeyImageList
        then KeyIndex := FieldRow.KeyList.IndexOf(FieldRow.Field.Text)
      else KeyIndex := Integer(FieldRow.CheckboxState);
      if (KeyIndex > -1) and (KeyIndex < FieldRow.PickList.Count)
        then Result := FieldRow.PickList.Strings[KeyIndex];
    end
    else if FieldRow.Field <> nil
      then Result := FieldRow.DisplayText;
  end;

begin
  inherited;
  Processed := False;
  if Message.Result = 0 then
  begin
{$IFDEF CIL}
    if Message.OriginalMessage.LParam = 0 then Exit;
    AHintInfo := Message.HintInfo;
{$ENDIF}
    IsDataToolTips := False;
    Cell := MouseCoord(HitTest.X, HitTest.Y);
    if (Cell.X < 0) or (Cell.Y < 0) then Exit;
    FieldRowIndex := RawToDataRow(Cell.Y);
    if FieldRowIndex < 0 then Exit;
    FieldRow := Rows[FieldRowIndex];

    if (Cell.X = DataColOffset-1) and (FieldRow.Title.Hint <> '') then
    begin // Label hint

{$IFDEF CIL}
      AHintInfo.HintStr := GetShortHint(FieldRow.Title.Hint);
      AHintInfo.CursorRect := CellRect(Cell.X, Cell.Y);
      Message.HintInfo := AHintInfo;
{$ELSE}
      Message.HintInfo^.HintStr := GetShortHint(FieldRow.Title.Hint);
      Message.HintInfo^.CursorRect := CellRect(Cell.X, Cell.Y);
{$ENDIF}
    end
    else if (Mouse.Capture = 0) and (GetKeyState(VK_CONTROL) >= 0) then
    begin // Tooltips
      ARect := CellRect(Cell.X, Cell.Y);
      InCellCursorPos := Point(HitTest.X-ARect.TopLeft.X, HitTest.Y-ARect.TopLeft.Y);
//      HitTestX1 := HitTest.X;
      WordWrap := False;
      AAlignment := taLeftJustify;
      if FHintFont = nil then
        FHintFont := TFont.Create;
      if FieldRow.UseRightToLeftAlignment then
      begin
        OffsetRect(ARect, ClientWidth - ARect.Right - ARect.Left, 0);
//        HitTestX1 := ClientWidth - HitTest.X;
      end;
      if (Cell.X = DataColOffset-1) and FieldRow.Title.ToolTips then
      begin  // Label tooltips
        DataRight := ARect.Left + ColWidths[0];
        s := FieldRow.Title.Caption;
        WordWrap := RowsDefValues.RowLabel.WordWrap;
        AAlignment := FieldRow.Title.Alignment;
        FHintFont.Assign(FieldRow.Title.Font);
        Canvas.Font.Assign(FHintFont);
      end
      else if (Cell.X >= DataColOffset) and DataLink.Active then
      begin // Data tooltips

        DataRight := ARect.Left + FieldRow.Width;
        IsDataToolTips := True;

        InstantReadRecordEnter(Cell.X - DataColOffset);
        Params := TDBVertGridEhDataHintParams.Create;
        try

          Processed := False;
    {$IFDEF CIL}
          with AHintInfo do
    {$ELSE}
          with PHintInfo(Message.HintInfo)^ do
    {$ENDIF}
          begin
            Params.HintPos := ScreenToClient(HintPos);
            Params.HintMaxWidth := HintMaxWidth;
            Params.HintColor := HintColor;
            Params.ReshowTimeout := ReshowTimeout;
            Params.HideTimeout := HideTimeout;
            Params.HintStr := '';
            Params.CursorRect := ARect;
            Params.HintFont := FHintFont;
            Params.HintFont.Assign(Screen.HintFont);
          end;

          if Assigned(FOnDataHintShow) then
            OnDataHintShow(Self, HitTest, Cell, InCellCursorPos, FieldRow, Params, Processed);
          if not Processed and Assigned(FieldRow) and Assigned(FieldRow.FOnDataHintShow) then
            FieldRow.OnDataHintShow(Self, HitTest, Cell, InCellCursorPos, FieldRow, Params, Processed);

          if not Processed and FieldRow.ToolTips then
            DefaultFillDataHintShowInfo(HitTest, Cell, FieldRow, Params);

    {$IFDEF CIL}
          with AHintInfo do
    {$ELSE}
          with PHintInfo(Message.HintInfo)^ do
    {$ENDIF}
          begin
            CursorRect := Params.CursorRect;
            HintPos := ClientToScreen(Params.HintPos);
            HintMaxWidth := Params.HintMaxWidth;
            HintColor := Params.HintColor;
            ReshowTimeout := Params.ReshowTimeout;
            HideTimeout := Params.HideTimeout;
            HintStr := Params.HintStr;
            Processed := True;
          end;

        finally
          InstantReadRecordLeave;
          FreeAndNil(Params);
        end;
      end else
        Exit;

      if not Processed then
      begin

        if WordWrap then RightIndent := 2 else RightIndent := 0;
        if IsDataToolTips and (FieldRow.GetColumnType in [ctKeyImageList, ctCheckboxes])
          then TextWider := True
          else TextWider := CheckHintTextRect(Self.DrawTextBiDiModeFlagsReadingOnly,
                              Self.Canvas, RightIndent, FInterlinear,
                              s, ARect, WordWrap, TextWidth, EmptyVar);

        if Flat then TopIndent := 2 else TopIndent := 1;

  {$IFDEF CIL}
        with AHintInfo do
  {$ELSE}
        with PHintInfo(Message.HintInfo)^ do
  {$ENDIF}
          if TextWider or ((AAlignment = taRightJustify) and (DataRight - 2 > ARect.Right)) then
          begin
            HintStr := s;
            CursorRect := ARect;
            case AAlignment of
              taLeftJustify:
                HintPos := Point(ARect.Left - 1, ARect.Top - TopIndent);
              taRightJustify:
                HintPos := Point(DataRight + 1 - TextWidth - 7, ARect.Top - TopIndent);
              taCenter:
                HintPos := Point(DataRight + 1 - TextWidth - 6 +
                  TextWidth div 2 - (DataRight - ARect.Left - 4) div 2, ARect.Top - TopIndent);
            end;
            HintPos.X := HintPos.X + (3 - 2); 
            if FieldRow.UseRightToLeftAlignment then
              HintPos.X := ClientWidth - HintPos.X;
            HintPos := ClientToScreen(HintPos);
            if WordWrap then
              HintMaxWidth := ARect.Right - ARect.Left - 4;
          end
          else
            HintStr := '';
      end;
  {$IFDEF CIL}
      with AHintInfo do
  {$ELSE}
      with PHintInfo(Message.HintInfo)^ do
  {$ENDIF}
      begin
        HintWindowClass := TGridToolTipsWindowEh;
        HintData := FHintFont;
      end;
    end;
{$IFDEF CIL}
    Message.HintInfo := AHintInfo;
{$ENDIF}
  end;
end;

procedure TCustomDBVertGridEh.CMFontChanged(var Message: TMessage);
begin
  BeginLayout;
  try
    DataColParams.RefreshDefaultFont;
    LabelColParams.RefreshDefaultFont;
    RowCategories.RefreshDefaultFont;
    inherited;
  finally
    EndLayout;
  end;
end;

procedure TCustomDBVertGridEh.CMDesignHitTest(var Msg: TCMDesignHitTest);
var
  Cell: TGridCoord;
begin
  inherited;
  if (Msg.Result = 1) and ((Datalink = nil) or
    ((Rows.State = csDefault) and
     (Datalink.DefaultFields or (not Datalink.Active)))) then
    Msg.Result := 0
  else
  begin
    Cell := MouseCoord(Msg.Pos.X, Msg.Pos.Y);
    if (Rows.State = csCustomized) and (dgvhLabelCol in Options) and (Cell.X = 0) then
      Msg.Result := 1; //Row moving
  end;

end;

procedure TCustomDBVertGridEh.CMChanged(var Msg: TCMChanged);
begin
{$IFDEF CIL}
{$ELSE}
  if (FNoDesigntControler = False) and
     Assigned(DBGridEhDesigntControler) and
    (csDesigning in ComponentState)
  then
    DBGridEhDesigntControler.KeyProperyModified(Msg.Child);
{$ENDIF}
end;

procedure TCustomDBVertGridEh.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (csDesigning in ComponentState) and
      ((Datalink = nil) or
       ((Rows.State = csDefault) and
        (Datalink.DefaultFields or not Datalink.Active))) then
    Windows.SetCursor(LoadCursor(0, IDC_ARROW))
  else inherited;
  if RowCategories.Active then
    InvalidateRow(Row);
end;

procedure TCustomDBVertGridEh.WMSize(var Message: TWMSize);
begin
  inherited;
  LayoutChanged;
  UpdateEdit;
  InvalidateLabelCol;
end;

procedure TCustomDBVertGridEh.WMVScroll(var Message: TWMVScroll);
begin
  inherited;
end;

procedure TCustomDBVertGridEh.WMTimer(var Message: TWMTimer);
begin
  inherited;
  if FTracking then
    TimerScroll;
end;

procedure TCustomDBVertGridEh.WMChar(var Message: TWMChar);
begin

  if (SelectedIndex >= 0) and
     (Rows[SelectedIndex].Field <> nil) and
     (Rows[SelectedIndex].Field is TNumericField) then
    if ((FormatSettings.DecimalSeparator <> '.') and (Char(Message.CharCode) = '.')) then
      Message.CharCode := Word(Copy(FormatSettings.DecimalSeparator, 1, 1)[1]);

  {Don't use KeyPress because KeyPress is invoked only after
  first showing of inplace editor}
  if (SelectedIndex >= 0) and
     (Rows[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]) and
     (Char(Message.CharCode) = ' ') then
  begin
    DoKeyPress(Message);
    if Char(Message.CharCode) = ' ' then
      if ssShift in KeyDataToShiftState(Message.KeyData)
        then Rows[SelectedIndex].SetNextFieldValue(-1)
        else Rows[SelectedIndex].SetNextFieldValue(1);
  end else
    inherited;

end;

procedure TCustomDBVertGridEh.SetIme;
begin
  inherited SetIme;
end;

procedure TCustomDBVertGridEh.UpdateIme;
begin
  inherited UpdateIme;
end;

procedure TCustomDBVertGridEh.WMIMEStartComp(var Message: TMessage);
begin
  inherited;
  ShowEditor;
end;

procedure TCustomDBVertGridEh.WMSetFocus(var Message: TWMSetFocus);
begin
  if not ((InplaceEditor <> nil) and
    (Message.FocusedWnd = InplaceEditor.Handle)) then SetIme;
  inherited;
  InvalidateRow(Row);
end;

procedure TCustomDBVertGridEh.WMKillFocus(var Message: TMessage);
begin
  if not SysLocale.FarEast then inherited
  else
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
    inherited;
    if not ((InplaceEditor <> nil) and
      (HWND(Message.WParam) = InplaceEditor.Handle)) then
      ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTIVATE);
  end;
  InvalidateRow(Row);
end;

procedure TCustomDBVertGridEh.WndProc(var Message: TMessage);
var
  AMouseMessage: TWMMouse;
begin
  if (Message.Msg = WM_LBUTTONDOWN) and (csDesigning in ComponentState) and (FNoDesigntControler = False) and
     Assigned(DBGridEhDesigntControler) and {not FTracking and} (FGridState = gsNormal)  then
  begin
  {$IFDEF CIL}
    AMouseMessage := TWMMouse.Create(Message);
  {$ELSE}
    AMouseMessage := TWMMouse(Message);
  {$ENDIF}
    if DBGridEhDesigntControler.IsDesignHitTest(Self, AMouseMessage.XPos, AMouseMessage.YPos,
        [ssLeft]) then
    begin
      if not IsControlMouseMsg(AMouseMessage) then
      begin
        ControlState := ControlState + [csLButtonDown];
        Dispatch(Message);
        ControlState := ControlState - [csLButtonDown];
      end;
      Exit;
    end;
  end;

  inherited WndProc(Message);

end;

//{ Defer action processing to datalink }

function TCustomDBVertGridEh.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.ExecuteAction(Action);
end;

function TCustomDBVertGridEh.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.UpdateAction(Action);
end;

procedure TCustomDBVertGridEh.CalcSizingState(X, Y: Integer;
  var State: TGridState; var Index, SizingPos, SizingOfs: Integer;
  var FixedInfo: TGridDrawInfoEh);
var
  Pos: Integer;
begin
  inherited CalcSizingState(X, Y, State, Index, SizingPos, SizingOfs, FixedInfo);
  if UseRightToLeftAlignment
    then Pos := ClientWidth - X
    else Pos := X;
  if (DataColOffset > 0) and
     (FixedInfo.Horz.FixedBoundary - 4 - VertLineWidth < Pos) and
     (FixedInfo.Horz.FixedBoundary + 4 > Pos) then
  begin
    State := gsColSizing;
    SizingPos := FixedInfo.Horz.FixedBoundary;
    SizingOfs := FixedInfo.Horz.FixedBoundary - Pos - 1;
    Index := 0;
  end else if (DataColParams.ColWidth <> 0) and (FixedInfo.Horz.GridBoundary - 3 < Pos) and (FixedInfo.Horz.GridBoundary + 3 > Pos) then
  begin
    State := gsColSizing;
    SizingPos := FixedInfo.Horz.GridBoundary;
    SizingOfs := FixedInfo.Horz.GridBoundary - Pos - 1;
    Index := 1;
  end;
end;

procedure TCustomDBVertGridEh.InvalidateLabelCol;
var
  R: TRect;
  DrawInfo: TGridDrawInfoEh;
begin
  if HandleAllocated and (dgvhLabelCol in Options) then
  begin
    CalcFixedInfo(DrawInfo);
    R := Rect(0, 0, DrawInfo.Horz.FixedBoundary, Height);
    InvalidateRect(Handle, @R, False);
  end;
end;

function TCustomDBVertGridEh.GetLabelColWidth: Integer;
begin
  Result := FLabelColWidth;
end;

procedure TCustomDBVertGridEh.SetLabelColWidth(const Value: Integer);
begin
  if Value <> FLabelColWidth then
  begin
    FLabelColWidth := Value;
    LayoutChanged;
  end;
end;

procedure TCustomDBVertGridEh.ScrollBarMessage(ScrollBar, ScrollCode,
  Pos: Integer; UseRightToLeft: Boolean);
begin
  if ScrollCode = SB_THUMBTRACK then
    ScrollCode := SB_THUMBPOSITION;
  inherited ScrollBarMessage(ScrollBar, ScrollCode, Pos, UseRightToLeft);
end;

function TCustomDBVertGridEh.IsSmoothVertScroll: Boolean;
begin
  Result := True;
end;

procedure TCustomDBVertGridEh.FlatChanged;
begin
  inherited FlatChanged;
  RecreateWnd;
end;

function TCustomDBVertGridEh.GetDataColParams: TDBVertGridDataColParamsEh;
begin
  Result := FDataColParams;
end;

procedure TCustomDBVertGridEh.SetDataColParams(const Value: TDBVertGridDataColParamsEh);
begin
  FDataColParams.Assign(Value);
end;

function TCustomDBVertGridEh.GetSelectionInactiveColor: TColor;
begin
  Result := inherited GetSelectionInactiveColor;
end;

function TCustomDBVertGridEh.GetDataLink: TVertGridDataLinkEh;
begin
  Result := TVertGridDataLinkEh(inherited Datalink);
end;

function TCustomDBVertGridEh.ColClientWidths(ACol: Integer): Integer;
begin
  Result := ColWidths[ACol];

  if CheckCellLine(ACol, 0, cbtRightEh) then
  begin
    if not (goVertLine in inherited Options) then
      if UseRightToLeftAlignment
        then Inc(Result, GridLineWidth)
        else Dec(Result, GridLineWidth)
  end else
  begin
    if goVertLine in inherited Options then
      if UseRightToLeftAlignment
        then Dec(Result, GridLineWidth)
        else Inc(Result, GridLineWidth)
  end;
end;

procedure TCustomDBVertGridEh.FieldRowEnter;
begin
  UpdateIme;
  if Assigned(FOnRowEnter) then FOnRowEnter(Self);
end;

procedure TCustomDBVertGridEh.FieldRowExit;
begin
  if Assigned(FOnRowExit) then FOnRowExit(Self);
end;

function TCustomDBVertGridEh.FindFieldRow(const FieldName: String): TFieldRowEh;
begin
  Result := TFieldRowEh(inherited FindFieldColumn(FieldName));
end;

function TCustomDBVertGridEh.GetRows: TDBVertGridRowsEh;
begin
  Result := TDBVertGridRowsEh(inherited AxisBars);
end;

procedure TCustomDBVertGridEh.SetTitleFont(Value: TFont);
begin
  LabelColParams.Font := Value;
end;

function TCustomDBVertGridEh.GetTitleFont: TFont;
begin
  Result := LabelColParams.Font;
end;

function TCustomDBVertGridEh.GetRowsDefValues: TFieldRowDefValuesEh;
begin
  Result := TFieldRowDefValuesEh(AxisBarDefValues);
end;

procedure TCustomDBVertGridEh.SetRowsDefValues(const Value: TFieldRowDefValuesEh);
begin
  AxisBarDefValues.Assign(Value);
end;

function TCustomDBVertGridEh.InstantReadRecordCount: Integer;
begin
  Result := DataLink.RecordCount;
end;

procedure TCustomDBVertGridEh.InstantReadRecordEnter(DataRowNum: Integer);
begin
  DataLink.ActiveRecord := DataRowNum;
end;

procedure TCustomDBVertGridEh.InstantReadRecordLeave;
begin
end;

function TCustomDBVertGridEh.GetRowCellParamsEh: TRowCellParamsEh;
begin
  Result := TRowCellParamsEh(inherited ColCellParamsEh);
end;

function TCustomDBVertGridEh.CreateColCellParamsEh: TAxisColCellParamsEh;
begin
  Result := TRowCellParamsEh.Create;
end;

function TCustomDBVertGridEh.IsDrawCellByThemes(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; AState: TGridDrawState; Cell3D: Boolean): Boolean;
begin
  if ACol = 0 then
  begin
    if IsCustomStyleActive then
      Result := True
    else if ThemesEnabled
      then Result := True
    else
      Result := False;
  end else
    Result := False;
end;

function TCustomDBVertGridEh.CalcStdDefaultRowHeight: Integer;
begin
  Result := CalcStdDefaultRowHeightForFont(Font);
end;

function TCustomDBVertGridEh.CalcStdDefaultRowHeightForFont(
  AFont: TFont): Integer;
var
  K: Integer;
  CanvasHandleAllocated: Boolean;
begin
  CanvasHandleAllocated := True;
  if not Canvas.HandleAllocated then
  begin
    Canvas.Handle := GetDC(0);
    CanvasHandleAllocated := False;
  end;
  try
    Canvas.Font := AFont;
    K := Canvas.TextHeight('Wg');
    if Flat
      then K := K + 1
      else K := K + 3;
    if dgvhRowLines in Options then
      Inc(K, GridLineWidth);
    Result := K;
  finally
    if not CanvasHandleAllocated then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;
end;

procedure TCustomDBVertGridEh.RowHeightsChanged;
var
  i: Integer;
  FieldRow: TFieldRowEh;
begin
  if (Datalink.Active or (Rows.State = csCustomized)) and AcquireLayoutLock then
  try
    inherited ColWidthsChanged;

    for I := 0 to Rows.Count-1 do
    begin
      FieldRow := Rows[I];

      if FieldRow.FitRowHeightToData then
      begin
        if RowHeights[I] <> FieldRow.CalcRowHeight then
          FieldRow.SafeSetNewHeight(RowHeights[I]);
      end else if RowHeights[I] <> FieldRow.PresetHeight then
        FieldRow.SafeSetNewHeight(RowHeights[I]);
    end;
  finally
    EndLayout;
  end else
    inherited ColWidthsChanged;
end;


function TCustomDBVertGridEh.DesignHitTestObject(XPos, YPos: Integer): TPersistent;
var
  Cell: TGridCoord;
  ANode: TDBVertGridCategoryTreeNodeEh;
begin
  Result := nil;
  Cell := MouseCoord(XPos, YPos);
  if (Rows.State = csCustomized) and (dgvhLabelCol in Options) and (Cell.X = 0) then
  begin
    if RowCategories.Active then
    begin
      ANode := RowCategories.CurrentCategoryTree.FlatItem[Cell.Y];
      if ANode.RowType = vgctFieldRowEh then
        Result := ANode.FieldRow
      else if ANode.CategoryProp <> nil then
        Result := ANode.CategoryProp;
    end else
      Result := Rows[Cell.Y];
  end;
end;

procedure TCustomDBVertGridEh.LabelColImageListChange(Sender: TObject);
begin
  if Sender = LabelColParams.Images then Invalidate;
end;

procedure TCustomDBVertGridEh.SetLabelColParams(const Value: TDBVertGridLabelColParamEh);
begin
  FLabelColParams.Assign(Value);
end;

function TCustomDBVertGridEh.CreateGridLineColors: TGridLineColorsEh;
begin
  Result := TDBVertGridLineParamsEh.Create(Self);
end;

function TCustomDBVertGridEh.GetGridLineParams: TDBVertGridLineParamsEh;
begin
  Result := TDBVertGridLineParamsEh(inherited GridLineColors);
end;

procedure TCustomDBVertGridEh.SetGridLineParams(const Value: TDBVertGridLineParamsEh);
begin
  inherited GridLineColors := Value;
end;

procedure TCustomDBVertGridEh.SetOnGetCellParams(const Value: TGetVertGridCellEhParamsEvent);
begin
  FOnGetCellParams := Value;
end;

procedure TCustomDBVertGridEh.CancelEditing;
begin
  DataLink.Dataset.Cancel;
end;

function TCustomDBVertGridEh.DefaultTitleColor: TColor;
begin
  Result := LabelColParams.GetColor;
end;

function TCustomDBVertGridEh.GetFieldFieldRows(
  const FieldName: String): TFieldRowEh;
begin
  Result := TFieldRowEh(inherited FieldAxisBars[FieldName]);
end;

function TCustomDBVertGridEh.GetVisibleFieldRow(
  Index: Integer): TFieldRowEh;
begin
  Result := TFieldRowEh(VisibleAxisBars[Index]);
end;

function TCustomDBVertGridEh.GetVisibleFieldRowCount: Integer;
begin
  Result := VisibleAxisBars.Count;
end;

procedure TCustomDBVertGridEh.GetCellParams(AxisBar: TAxisBarEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, TFieldRowEh(AxisBar), AFont, Background, State);
end;

function TCustomDBVertGridEh.GetRowCategories: TDBVertGridRowCategoriesEh;
begin
  Result := FRowCategories;
end;

procedure TCustomDBVertGridEh.SetRowCategories(const Value: TDBVertGridRowCategoriesEh);
begin
  FRowCategories.Assign(Value);
end;

procedure TCustomDBVertGridEh.RowCategoriesActiveChanged;
begin
  if csLoading in ComponentState then Exit;
  if RowCategories.Active
    then RowCategories.CheckRebuildRowCategories
    else RowCategories.CurrentCategoryTree.Clear;
  LayoutChanged;
end;

procedure TCustomDBVertGridEh.DefaultCheckRebuildRowCategories(RowCategoriesTree: TDBVertGridCategoryTreeListEh);
var
  i: Integer;
  CategoryNode: TDBVertGridCategoryTreeNodeEh;
  CurNode, DelNode: TDBVertGridCategoryTreeNodeEh;
  CategoryName: String;
  CategoryProp: TDBVertGridCategoryPropEh;
  SpecNode: TDBVertGridCategoryTreeNodeEh;
begin

  CurNode := RowCategoriesTree.GetLast;
  while CurNode <> nil do
  begin
    DelNode := CurNode;
    CurNode := RowCategoriesTree.GetPrevious(CurNode);
    if DelNode.RowType = vgctFieldRowEh then
      RowCategoriesTree.DeleteNode(DelNode, True);
  end;

  if RowCategoriesTree.RowCategories.CategoryGroupingType = cgtFieldRowCategoryNameEh then
  begin

    SpecNode := nil;
    for i := 0 to Rows.Count-1 do
    begin
      if Rows[i].Visible then
      begin
        CategoryName := Rows[i].CategoryName;
        CategoryNode := RowCategoriesTree.CategoryTreeNodeByName(CategoryName);
        if CategoryNode = nil then
        begin
          CategoryNode := RowCategoriesTree.CreateCategoryRow(nil);
          CategoryNode.FCategoryName := CategoryName;
          if CategoryNode.CategoryName = '' then
          begin
            CategoryNode.FCategoryDisplayText := '(Not assigned)';
            SpecNode := CategoryNode;
          end;
//          if csDesigning in RowCategories.Grid.ComponentState then
//            CategoryNode.Expanded := True;
        end;

        RowCategoriesTree.CreateFieldRowNode(CategoryNode, Rows[i]);
      end;
    end;

    if (SpecNode <> nil) and (SpecNode.CategoryProp = nil) then
      SpecNode.Index := RowCategoriesTree.Root.Count-1;

    CurNode := RowCategoriesTree.GetLast;
    while CurNode <> nil do
    begin
      DelNode := CurNode;
      CurNode := RowCategoriesTree.GetPrevious(CurNode);
      if (DelNode.RowType = vgctCategoryRowEh) and (DelNode.ItemsCount = 0) then
        RowCategoriesTree.DeleteNode(DelNode, True);
    end;

    for i := 0 to RowCategoriesTree.Root.Count-1 do
    begin
      CategoryNode := RowCategoriesTree.Root[i];
      CategoryProp := RowCategories.CategoryProps.CategoryPropByName(CategoryNode.CategoryName);
      if CategoryProp <> nil then
      begin
        CategoryNode.FCategoryProp := nil;
        CategoryNode.FSortIndex := CategoryProp.Index;
        if csDesigning in RowCategories.Grid.ComponentState
          then CategoryNode.Expanded := True
          else CategoryNode.Expanded := CategoryProp.DefaultExpanded;
        CategoryNode.FCategoryDisplayText := CategoryProp.DisplayText;
        CategoryNode.FCategoryProp := CategoryProp;
      end else
      begin
        CategoryNode.FCategoryProp := nil;
        CategoryNode.FSortIndex := MaxInt;
        if csDesigning in RowCategories.Grid.ComponentState
          then CategoryNode.Expanded := True
          else CategoryNode.Expanded := False;
        if CategoryNode.CategoryName <> '' then
          CategoryNode.FCategoryDisplayText := '';
      end;
    end;
    RowCategoriesTree.Root.SortBySortIndex;

  end else if RowCategoriesTree.RowCategories.CategoryGroupingType = cgtEmptyNotEmptyValueEh then
  begin
    for i := 0 to Rows.Count-1 do
    begin
      if Rows[i].Visible then
      begin
        if (Rows[i].Field <> nil) and (Rows[i].Field.AsString = '') then
        begin
          CategoryNode := RowCategoriesTree.CategoryTreeNodeByName('Empty values');
          if CategoryNode = nil then
          begin
            CategoryNode := RowCategoriesTree.CreateCategoryRow(nil);
            CategoryNode.FCategoryName := 'Empty values';
            if csDesigning in RowCategories.Grid.ComponentState then
              CategoryNode.Expanded := True;

          end;
        end else
        begin
          CategoryNode := RowCategoriesTree.CategoryTreeNodeByName('Filled values');
          if CategoryNode = nil then
          begin
            CategoryNode := RowCategoriesTree.CreateCategoryRow(nil);
            CategoryNode.FCategoryName := 'Filled values';
            CategoryNode.Expanded := True;
          end;
        end;

        RowCategoriesTree.CreateFieldRowNode(CategoryNode, Rows[i]);
      end;
    end;
  end else if RowCategoriesTree.RowCategories.CategoryGroupingType = cgtFieldDataTypeEh then
  begin
    for i := 0 to Rows.Count-1 do
    begin
      if Rows[i].Visible then
      begin
        if Rows[i].Field <> nil then
        begin
          case Rows[i].Field.DataType of
            ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString:
              CategoryName := 'Text';

            ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftAutoInc, ftLargeint, ftFMTBcd:
              CategoryName := 'Numeric';

            ftBoolean:
              CategoryName := 'Boolean';

            ftDate, ftTime, ftDateTime, ftTimeStamp:
              CategoryName := 'DateTime';

            ftBytes, ftVarBytes, ftBlob, ftGraphic, ftParadoxOle, ftDBaseOle:
              CategoryName := 'BLOB';

            ftUnknown:
              CategoryName := '(Unknown)';
          else
            CategoryName := '(Other)';
          end;
        end else
          CategoryName := '(Unknown)';

        CategoryNode := RowCategoriesTree.CategoryTreeNodeByName(CategoryName);
        if CategoryNode = nil then
        begin
          CategoryNode := RowCategoriesTree.CreateCategoryRow(nil);
          CategoryNode.FCategoryName := CategoryName;
          if csDesigning in RowCategories.Grid.ComponentState then
            CategoryNode.Expanded := True;
        end;

        RowCategoriesTree.CreateFieldRowNode(CategoryNode, Rows[i]);
      end;
    end;
  end;

end;

function TCustomDBVertGridEh.GetRowsSortOrder: TDBVertGridRowsSortOrderEh;
begin
  Result := Rows.SortOrder;
end;

procedure TCustomDBVertGridEh.SetRowsSortOrder(
  const Value: TDBVertGridRowsSortOrderEh);
begin
  Rows.SortOrder := Value;
end;

procedure TCustomDBVertGridEh.RowsSortOrderChanged;
begin
  LayoutChanged;
end;

function TCustomDBVertGridEh.CheckBeginRowDrag(var Origin,
  Destination: Integer; const MousePt: TPoint): Boolean;
var
  ANode: TDBVertGridCategoryTreeNodeEh;
  Cell: TGridCoord;
  RightTreeBorder: Integer;
begin
  if RowCategories.Active then
  begin
    Result := False;
    if RowCategories.Node <> nil then
    begin
      ANode := RowCategories.Node;
      Cell := MouseCoord(MousePt.X, MousePt.Y);
      if (ANode.RowType = vgctFieldRowEh) and (Cell.X = DataColOffset-1) and (Cell.Y >= 0) then
      begin
        RightTreeBorder := DefaultRowHeight * (ANode.Level-1);
        if MousePt.X < RightTreeBorder
          then Result := False
          else Result := True;
      end else if (ANode.RowType = vgctCategoryRowEh) and (Cell.Y >= 0) then
      begin
        if ANode.CategoryProp = nil then
          Result := False
        else
        begin
          RightTreeBorder := DefaultRowHeight * ANode.Level;
          if MousePt.X < RightTreeBorder
            then Result := False
            else Result := True;
        end;    
      end;
    end
  end else
    Result := inherited CheckBeginRowDrag(Origin, Destination, MousePt);
end;

function TCustomDBVertGridEh.CheckRowDrag(var Origin, Destination: Integer;
  const MousePt: TPoint): Boolean;
begin
  Result := inherited CheckRowDrag(Origin, Destination, MousePt);
  if Result and RowCategories.Active then
    Result := CalcDestinationRowDrag(Origin, Destination, MousePt);
end;

function TCustomDBVertGridEh.EndRowDrag(var Origin, Destination: Integer;
  const MousePt: TPoint): Boolean;
var
  OrgnNode, DestNode: TDBVertGridCategoryTreeNodeEh;
  OrgnFieldRow, DestFieldRow: TFieldRowEh;
  DestIndex: Integer;
  CategoryName: String;
begin
  Result := inherited EndRowDrag(Origin, Destination, MousePt);
  if RowCategories.Active then
  begin
    Result := CalcDestinationRowDrag(Origin, Destination, MousePt);
    OrgnNode := RowCategories.CurrentCategoryTree.FlatItem[Origin];
    DestNode := RowCategories.CurrentCategoryTree.FlatItem[Destination];
    if OrgnNode.RowType = vgctCategoryRowEh then
    begin
      if DestNode.RowType = vgctFieldRowEh then
        DestNode := DestNode.Parent;
      if DestNode.CategoryProp <> nil then
        OrgnNode.CategoryProp.Index := DestNode.CategoryProp.Index;
      Result := False;
    end else
    begin
//    vgctFieldRowEh
      if OrgnNode.Parent <> DestNode.Parent then
      begin
        if OrgnNode.Parent.Count = 1 then
        begin
//          ShowMessage('The row couldn''t be moved to the over category when the source category contains only one row.');
          Result := False;
          Exit;
        end;
        OrgnFieldRow := OrgnNode.FieldRow;
        if DestNode.RowType = vgctCategoryRowEh then
        begin
          if Destination > Origin then
          begin
            if DestNode.Count = 0 then
            begin
              DestIndex := OrgnFieldRow.Index;
              CategoryName := DestNode.CategoryName;
            end else
            begin
              if DestNode.Expanded then
                DestNode := RowCategories.CurrentCategoryTree.FlatItem[Destination+1]
              else
                DestNode := DestNode.Items[0];
              DestFieldRow := DestNode.FieldRow;
              if OrgnFieldRow.Index < DestFieldRow.Index then
                DestIndex := DestFieldRow.Index-1
              else
                DestIndex := DestFieldRow.Index;
              CategoryName := DestFieldRow.CategoryName;
            end;
          end else
          begin
            DestNode := RowCategories.CurrentCategoryTree.FlatItem[Destination-1];
            if (DestNode.RowType = vgctCategoryRowEh) then
            begin
              if (DestNode.Count = 0) then
              begin
                DestIndex := OrgnFieldRow.Index;
                CategoryName := DestNode.CategoryName;
              end else
              begin
                CategoryName := DestNode.CategoryName;
                DestNode := DestNode.Items[0];
                DestIndex := DestNode.FieldRow.Index;
                if OrgnFieldRow.Index < DestNode.FieldRow.Index then
                  DestIndex := DestIndex - 1;
              end;
            end else
            begin
              DestFieldRow := DestNode.FieldRow;
              if OrgnFieldRow.Index > DestFieldRow.Index then
                DestIndex := DestFieldRow.Index+1
              else
                DestIndex := DestFieldRow.Index;
              CategoryName := DestFieldRow.CategoryName;
            end;
          end;
        end else
        begin
          DestFieldRow := DestNode.FieldRow;
          DestIndex := DestFieldRow.Index;
          if Destination < Origin then
            if OrgnFieldRow.Index < DestFieldRow.Index then
              DestIndex := DestIndex - 1;
          CategoryName := DestFieldRow.CategoryName;
        end;

        OrgnFieldRow.Index := DestIndex;
        OrgnFieldRow.CategoryName := CategoryName;
        Result := False;
      end;
    end;
  end;
end;

function TCustomDBVertGridEh.CalcDestinationRowDrag(Origin: Integer;
  var Destination: Integer; const MousePt: TPoint): Boolean;
var
  OrgnNode, DestNode: TDBVertGridCategoryTreeNodeEh;
begin
  Result := inherited CheckRowDrag(Origin, Destination, MousePt);
  if Result and RowCategories.Active then
  begin
    OrgnNode := RowCategories.CurrentCategoryTree.FlatItem[Origin];
    DestNode := RowCategories.CurrentCategoryTree.FlatItem[Destination];
    if (OrgnNode.RowType = vgctFieldRowEh) and (OrgnNode.Parent <> DestNode.Parent) then
    begin
      if (crmoFieldRowMoveToOtherCategoryEh in RowCategories.RowMoveOptions) and
         (RowCategories.CategoryGroupingType = cgtFieldRowCategoryNameEh)
      then
      begin
        if OrgnNode.Parent <> DestNode.Parent then
        begin
          if DestNode.RowType = vgctCategoryRowEh then
            if Destination = 0 then
              Destination := 1;
        end;
      end else if OrgnNode.Parent <> DestNode.Parent then
      begin
        if Destination > Origin then
          Destination := RowCategories.CurrentCategoryTree.FlatIndexOfNode
            (OrgnNode.Parent.Items[OrgnNode.Parent.Count-1])
        else
          Destination := RowCategories.CurrentCategoryTree.FlatIndexOfNode
            (OrgnNode.Parent.Items[0]);
      end else
        Result := False;
    end else if OrgnNode.RowType = vgctCategoryRowEh then
    begin
      if DestNode.Parent = OrgnNode then
        Destination := Origin
      else if DestNode.RowType = vgctFieldRowEh then
      begin
        if Destination > Origin then
          Destination := RowCategories.CurrentCategoryTree.FlatIndexOfNode
            (DestNode.Parent.Items[DestNode.Parent.Count-1])
        else
          Destination := RowCategories.CurrentCategoryTree.FlatIndexOfNode
            (DestNode.Parent);
      end else if DestNode.RowType = vgctCategoryRowEh then
      begin
        if Destination > Origin then
          if DestNode.Expanded then
            Destination := RowCategories.CurrentCategoryTree.FlatIndexOfNode(DestNode.Items[DestNode.Count-1])
          else
            Destination := Destination; //Ok. leave it as it was
      end;
    end;
  end;
end;

{ TDBVertGridLineParamsEh }

constructor TDBVertGridLineParamsEh.Create(AGrid: TCustomGridEh);
begin
  inherited Create(AGrid);
end;

function TDBVertGridLineParamsEh.GetActualColorScheme: TDBGridLinesColorSchemeEh;
begin
  if ColorScheme = glcsDefaultEh then
  begin
    if Grid.LabelColParams.GetActualFillStyle = cfstThemedEh then
      Result := glcsThemedEh
    else if not ThemesEnabled and not Grid.Flat then
      Result := glcsClassicEh
    else
      Result := glcsFlatEh;
  end else
    Result := ColorScheme;
end;

function TDBVertGridLineParamsEh.DefaultDataHorzLines: Boolean;
begin
  Result := (dgvhRowLines in Grid.Options);
end;

function TDBVertGridLineParamsEh.DefaultDataVertLines: Boolean;
begin
  Result := (dgvhColLines in Grid.Options);
end;

function TDBVertGridLineParamsEh.GetGrid: TCustomDBVertGridEh;
begin
  Result := TCustomDBVertGridEh(inherited Grid);
end;

function TDBVertGridLineParamsEh.GetVertAreaContraVertColor: TColor;
begin
  Result := inherited GetVertAreaContraVertColor;
end;

{ TDBVertGridLabelColParamEh }

constructor TDBVertGridLabelColParamEh.Create(AGrid: TCustomDBVertGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  RefreshDefaultFont;
  FColor := clDefault;
  FSecondColor := clDefault;
  FHorzLineColor := clDefault;
  FVertLineColor := clDefault;
  FFillStyle := cfstDefaultEh;
  FParentFont := True;
end;

destructor TDBVertGridLabelColParamEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

procedure TDBVertGridLabelColParamEh.FontChanged(Sender: TObject);
begin
  ParentFont := False;
  if dgvhLabelCol in FGrid.Options then FGrid.LayoutChanged;
end;


procedure TDBVertGridLabelColParamEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

function TDBVertGridLabelColParamEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

function TDBVertGridLabelColParamEh.GetVertLineColor: TColor;
begin
  if FVertLineColor = clDefault
    then Result := DefaultVertLineColor
    else Result := FVertLineColor;
end;

procedure TDBVertGridLabelColParamEh.SetVertLineColor(const Value: TColor);
begin
  if FVertLineColor <> Value then
  begin
    FVertLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBVertGridLabelColParamEh.DefaultVertLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor;
end;

function TDBVertGridLabelColParamEh.GetVertLines: Boolean;
begin
  if VertLinesStored
    then Result := FVertLines
    else Result := DefaultVertLines;
end;

procedure TDBVertGridLabelColParamEh.SetVertLines(const Value: Boolean);
begin
  if VertLinesStored and (Value = FVertLines) then Exit;
  VertLinesStored := True;
  FVertLines := Value;
  if not (csLoading in Grid.ComponentState) then
    Grid.LayoutChanged;
end;

function TDBVertGridLabelColParamEh.IsVertLinesStored: Boolean;
begin
  Result := FVertLinesStored;
end;

procedure TDBVertGridLabelColParamEh.SetVertLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsVertLinesStored = False) then
  begin
    FVertLinesStored := True;
    FVertLines := DefaultVertLines;
    if not (csLoading in Grid.ComponentState) then
      Grid.LayoutChanged;
  end else if (Value = False) and (IsVertLinesStored = True) then
  begin
    FVertLinesStored := False;
    FVertLines := DefaultVertLines;
    if not (csLoading in Grid.ComponentState) then
      Grid.LayoutChanged;
  end;
end;

function TDBVertGridLabelColParamEh.DefaultVertLines: Boolean;
begin
  Result := (dgvhColLines in Grid.Options);
end;

function TDBVertGridLabelColParamEh.GetHorzLineColor: TColor;
begin
  if FHorzLineColor = clDefault
    then Result := DefaultHorzLineColor
    else Result := FHorzLineColor;
end;

procedure TDBVertGridLabelColParamEh.SetHorzLineColor(const Value: TColor);
begin
  if FHorzLineColor <> Value then
  begin
    FHorzLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBVertGridLabelColParamEh.DefaultHorzLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor;
end;

function TDBVertGridLabelColParamEh.GetHorzLines: Boolean;
begin
  if HorzLinesStored
    then Result := FHorzLines
    else Result := DefaultHorzLines;
end;

procedure TDBVertGridLabelColParamEh.SetHorzLines(const Value: Boolean);
begin
  if HorzLinesStored and (Value = FHorzLines) then Exit;
  HorzLinesStored := True;
  FHorzLines := Value;
  Grid.Invalidate;
end;

function TDBVertGridLabelColParamEh.IsHorzLinesStored: Boolean;
begin
  Result := FHorzLinesStored;
end;

procedure TDBVertGridLabelColParamEh.SetHorzLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsHorzLinesStored = False) then
  begin
    FHorzLinesStored := True;
    FHorzLines := DefaultHorzLines;
    Grid.Invalidate;
  end else if (Value = False) and (IsHorzLinesStored = True) then
  begin
    FHorzLinesStored := False;
    FHorzLines := DefaultHorzLines;
    Grid.Invalidate;
  end;
end;

function TDBVertGridLabelColParamEh.DefaultHorzLines: Boolean;
begin
  Result := (dgvhRowLines in Grid.Options);
end;

function TDBVertGridLabelColParamEh.GetActualFillStyle: TGridCellFillStyleEh;
begin
  if FillStyle <> cfstDefaultEh then
  begin
      Result := FillStyle;
  end else if FGrid.Flat then
      Result := cfstSolidEh
  else
      Result := cfstSolidEh;
end;

function TDBVertGridLabelColParamEh.GetColor: TColor;
begin
  if FColor = clDefault
    then Result := FGrid.FixedColor
    else Result := FColor;
end;

procedure TDBVertGridLabelColParamEh.SetColor(const Value: TColor);
begin
  if Value <> FColor then
  begin
    FColor := Value;
    FGrid.Invalidate;
  end;  
end;

procedure TDBVertGridLabelColParamEh.SetFillStyle(const Value: TGridCellFillStyleEh);
begin
  if FFillStyle <> Value then
  begin
    FFillStyle := Value;
    FGrid.Invalidate;
  end;
end;

procedure TDBVertGridLabelColParamEh.SetImages(const Value: TCustomImageList);
begin
  if FImages <> nil then FImages.UnRegisterChanges(FGrid.FLabelColImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FGrid.FLabelColImageChangeLink);
    FImages.FreeNotification(FGrid);
  end;
  FGrid.LayoutChanged;
end;

procedure TDBVertGridLabelColParamEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBVertGridLabelColParamEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if not FParentFont then Exit;

  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

function TDBVertGridLabelColParamEh.DefaultFont: TFont;
begin
  Result := FGrid.Font;
end;

function TDBVertGridLabelColParamEh.GetSecondColor: TColor;
begin
  if FSecondColor = clDefault
    then Result := FGrid.Color
    else Result := FSecondColor;
end;

procedure TDBVertGridLabelColParamEh.SetSecondColor(const Value: TColor);
begin
  if Value <> FSecondColor then
  begin
    FSecondColor := Value;
    FGrid.Invalidate;
  end;  
end;

{ TDBVertGridDataColParamsEh }

constructor TDBVertGridDataColParamsEh.Create(AGrid: TCustomDBVertGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  RefreshDefaultFont;
  FColor := clDefault;
  FParentFont := True;
  FPersistentAlignment := palLeftJustifyEh;
end;

destructor TDBVertGridDataColParamsEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

function TDBVertGridDataColParamsEh.DefaultFont: TFont;
begin
  Result := FGrid.Font;
end;

procedure TDBVertGridDataColParamsEh.FontChanged(Sender: TObject);
begin
  if not (csLoading in FGrid.ComponentState) then
  begin
    ParentFont := False;
    FGrid.LayoutChanged;
  end;
end;

function TDBVertGridDataColParamsEh.GetColor: TColor;
begin
  if FColor = clDefault
    then Result := Grid.Color
    else Result := FColor;
end;

function TDBVertGridDataColParamsEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

procedure TDBVertGridDataColParamsEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TDBVertGridDataColParamsEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if not FParentFont then Exit;

  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Grid.Invalidate;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetColWidth(const Value: Integer);
begin
  if FColWidth <> Value then
  begin
    FColWidth := Value;
    Grid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetPersistentDataAlignment(
  const Value: TPersistentAlignmentEh);
begin
  if FPersistentAlignment <> Value then
  begin
    FPersistentAlignment := Value;
    Grid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetRowHeight(const Value: Integer);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    Grid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetRowLines(const Value: Integer);
begin
  if FRowLines <> Value then
  begin
    FRowLines := Value;
    Grid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetMaxRowHeight(const Value: Integer);
begin
  if FMaxRowHeight <> Value then
  begin
    FMaxRowHeight := Value;
    Grid.LayoutChanged;
  end;
end;

procedure TDBVertGridDataColParamsEh.SetMaxRowLines(const Value: Integer);
begin
  if FMaxRowLines <> Value then
  begin
    FMaxRowLines := Value;
    Grid.LayoutChanged;
  end;
end;

{ TFieldRowDefValuesEh }

function TFieldRowDefValuesEh.GetGrid: TCustomDBVertGridEh;
begin
  Result := TCustomDBVertGridEh(inherited Grid);
end;

function TFieldRowDefValuesEh.CreateAxisBarCaptionDefValues: TAxisBarCaptionDefValuesEh;
begin
  Result := TRowLabelDefValuesEh.Create(Self);
end;

procedure TFieldRowDefValuesEh.SetFitRowHeightToData(const Value: Boolean);
begin
  if FFitRowHeightToData <> Value then
  begin
    FFitRowHeightToData := Value;
    Grid.LayoutChanged;
  end;
end;

function TFieldRowDefValuesEh.GetRowLabel: TRowLabelDefValuesEh;
begin
  Result := TRowLabelDefValuesEh(Title);
end;

procedure TFieldRowDefValuesEh.SetRowLabel(const Value: TRowLabelDefValuesEh);
begin
  Title.Assign(Value);
end;

{ TRowLabelDefValuesEh }

constructor TRowLabelDefValuesEh.Create(AxisBarDefValues: TAxisBarDefValuesEh);
begin
  inherited Create(AxisBarDefValues);
  FFitHeightToData := True;
end;

function TRowLabelDefValuesEh.GetFieldRowDefValues: TFieldRowDefValuesEh;
begin
  Result := TFieldRowDefValuesEh(ColumnDefValues);
end;

procedure TRowLabelDefValuesEh.SetFitHeightToData(const Value: Boolean);
begin
  if FFitHeightToData <> Value then
  begin
    FFitHeightToData := Value;
    FieldRowDefValues.Grid.LayoutChanged;
  end;
end;

procedure TRowLabelDefValuesEh.SetWordWrap(const Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    FieldRowDefValues.Grid.LayoutChanged;
  end;
end;

{ TDBVertGridCategoryTreeNodeEh }

constructor TDBVertGridCategoryTreeNodeEh.Create;
begin
  inherited Create;
end;

destructor TDBVertGridCategoryTreeNodeEh.Destroy;
begin
  inherited Destroy;
end;

function TDBVertGridCategoryTreeNodeEh.CalcRowHeight: Integer;
begin
  if RowType = vgctFieldRowEh then
  begin
    if FieldRow <> nil then
      Result := FieldRow.CalcRowHeight
    else
      Result := FieldRow.Grid.CalcStdDefaultRowHeight;
  end else
  begin
    Result := Owner.RowCategories.Grid.CalcStdDefaultRowHeightForFont(Owner.RowCategories.Font);
    if not (dgvhRowLines in Owner.RowCategories.Grid.Options) then
      Result := Result + Owner.RowCategories.Grid.GridLineWidth*2;
  end;
end;

procedure TDBVertGridCategoryTreeNodeEh.Expand;
begin
  Expanded := True;
end;

procedure TDBVertGridCategoryTreeNodeEh.Collapse;
begin
  Expanded := False;
end;

function TDBVertGridCategoryTreeNodeEh.GetFieldRow: TFieldRowEh;
begin
  Result := FFieldRow;
end;

procedure TDBVertGridCategoryTreeNodeEh.SetFieldRow(const Value: TFieldRowEh);
begin
  if FFieldRow <> Value then
  begin
    FFieldRow := Value;
  end;
end;

function TDBVertGridCategoryTreeNodeEh.GetItem(const Index: Integer): TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited Items[Index]);
end;

function TDBVertGridCategoryTreeNodeEh.GetNodeOwner: TDBVertGridCategoryTreeListEh;
begin
  Result := TDBVertGridCategoryTreeListEh(inherited Owner);
end;

function TDBVertGridCategoryTreeNodeEh.GetNodeParent: TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited Parent);
end;

function TDBVertGridCategoryTreeNodeEh.GetRowType: TDBVertGridCategoryRowTypeEh;
begin
  Result := FRowType;
end;

procedure TDBVertGridCategoryTreeNodeEh.SetNodeParent(const Value: TDBVertGridCategoryTreeNodeEh);
begin
  inherited Parent := Value;
end;

function TDBVertGridCategoryTreeNodeEh.GetCount: Integer;
begin
  Result := inherited Count;
end;

procedure TDBVertGridCategoryTreeNodeEh.SetCategoryName(
  const Value: String);
begin
  if Value <> FCategoryName then
  begin
    FCategoryName := Value;
    Owner.CategoryNameChanged;
  end;
end;

procedure TDBVertGridCategoryTreeNodeEh.SortBySortIndex;
begin
  SortData(CompareNodesBySortIndex, nil, False);
end;

function TDBVertGridCategoryTreeNodeEh.CompareNodesBySortIndex(Node1,
  Node2: TBaseTreeNodeEh; ParamSort: TObject): Integer;
var
  CatNode1, CatNode2: TDBVertGridCategoryTreeNodeEh;
begin
  CatNode1 := TDBVertGridCategoryTreeNodeEh(Node1);
  CatNode2 := TDBVertGridCategoryTreeNodeEh(Node2);
  if CatNode1.FSortIndex = CatNode2.FSortIndex
    then Result := CatNode1.Index - CatNode2.Index
    else Result := CatNode1.FSortIndex - CatNode2.FSortIndex;
end;

function TDBVertGridCategoryTreeNodeEh.GetIndex: Integer;
begin
  Result := inherited Index;
end;

procedure TDBVertGridCategoryTreeNodeEh.SetIndex(Value: Integer);
begin
  if Index <> Value then
  begin
    if Index < Value then
      Value := Value + 1;
    if Value = Parent.Count
      then Owner.MoveTo(Self, Parent.Items[Value-1], naAddAfterEh, True)
      else Owner.MoveTo(Self, Parent.Items[Value], naInsertEh, True);
  end;    
end;

function TDBVertGridCategoryTreeNodeEh.GetCategoryProp: TDBVertGridCategoryPropEh;
begin
  Result := FCategoryProp;
end;

procedure TDBVertGridCategoryTreeNodeEh.SetCategoryDisplayText(
  const Value: String);
begin
  if FCategoryDisplayText <> Value then
  begin
    FCategoryDisplayText := Value;
    Owner.CategoryNameChanged;
  end;  
end;

function TDBVertGridCategoryTreeNodeEh.GetCategoryDisplayText: String;
begin
  if FCategoryDisplayText = '' then
    Result := CategoryName
  else
    Result := FCategoryDisplayText;
end;

{ TDBVertGridCategoryTreeListEh }

constructor TDBVertGridCategoryTreeListEh.Create(
  ItemClass: TDBVertGridCategoryTreeNodeClassEh;
  ARowCategories: TDBVertGridRowCategoriesEh);
begin
  inherited Create(ItemClass);
  FRowCategories := ARowCategories;
  FFlatList := TObjectList.Create(False);
  FFlatListObsolete := True;
end;

destructor TDBVertGridCategoryTreeListEh.Destroy;
begin
  FreeAndNil(FFlatList);
  inherited Destroy;
end;

procedure TDBVertGridCategoryTreeListEh.BuildFlatList;
var
  CurNode: TBaseTreeNodeEh;
begin
  FFlatList.Clear;
  CurNode := GetFirstVisible;
  while CurNode <> nil do
  begin
    FFlatList.Add(CurNode);
    CurNode := GetNextVisible(CurNode, True);
  end;
  FFlatListObsolete := False;
end;

function TDBVertGridCategoryTreeListEh.GetRoot: TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited Root);
end;

procedure TDBVertGridCategoryTreeListEh.InitTreeFromGridColumns;
var
  i: Integer;
  Node: TDBVertGridCategoryTreeNodeEh;
begin
  Clear;
  for i := 0 to RowCategories.Grid.Rows.Count-1 do
  begin
    Node := AddChild(Root, vgctFieldRowEh);
    Node.FieldRow := RowCategories.Grid.Rows[i];
  end;
end;

function TDBVertGridCategoryTreeListEh.GetFlatItem(const Index: Integer): TDBVertGridCategoryTreeNodeEh;
begin
  if FFlatListObsolete then
    BuildFlatList;
  Result := TDBVertGridCategoryTreeNodeEh(FlatList[Index])
end;

function TDBVertGridCategoryTreeListEh.GetFlatItemsCount: Integer;
begin
  if FFlatListObsolete then
    BuildFlatList;
  Result := FlatList.Count;
end;

procedure TDBVertGridCategoryTreeListEh.ExpandedChanged(Node: TBaseTreeNodeEh);
var
  CatNode: TDBVertGridCategoryTreeNodeEh;
begin
  inherited ExpandedChanged(Node);
  CatNode := TDBVertGridCategoryTreeNodeEh(Node);
  FFlatListObsolete := True;
  if CatNode.CategoryProp <> nil then
    CatNode.CategoryProp.DefaultExpanded := CatNode.Expanded;
  RowCategories.Grid.LayoutChanged;
end;

procedure TDBVertGridCategoryTreeListEh.TreeChanged(Node: TBaseTreeNodeEh;
  Operation: TTreeListNotificationEh; OldIndex: Integer;
  OldParentNode: TBaseTreeNodeEh);
begin
  inherited TreeChanged(Node, Operation, OldIndex, OldParentNode);
  FFlatListObsolete := True;
  if (Root <> nil) and (Root.Owner <> nil) and (Root.Owner.RowCategories <> nil) then
    Root.Owner.RowCategories.Grid.Invalidate;
end;

function TDBVertGridCategoryTreeListEh.FlatIndexOfFieldRow(
  FieldRow: TFieldRowEh): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FlatItemsCount-1 do
  begin
    if (FlatItem[i].RowType = vgctFieldRowEh) and
       (FlatItem[i].FieldRow = FieldRow) then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TDBVertGridCategoryTreeListEh.FlatIndexOfNode(
  Node: TDBVertGridCategoryTreeNodeEh): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FlatItemsCount-1 do
  begin
    if FlatItem[i] = Node then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

procedure TDBVertGridCategoryTreeListEh.DeleteNode(
  Node: TDBVertGridCategoryTreeNodeEh; ReIndex: Boolean);
begin
  inherited DeleteNode(Node, ReIndex);
end;

function TDBVertGridCategoryTreeListEh.GetFirst: TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited GetFirst);
end;

function TDBVertGridCategoryTreeListEh.GetLast(
  Node: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited GetLast(Node));
end;

function TDBVertGridCategoryTreeListEh.GetNext(
  Node: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited GetNext(Node));
end;

function TDBVertGridCategoryTreeListEh.GetPrevious(
  Node: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited GetPrevious(Node));
end;

function TDBVertGridCategoryTreeListEh.CreateCategoryRow(
  Parent: TDBVertGridCategoryTreeNodeEh): TDBVertGridCategoryTreeNodeEh;
begin
  if (Parent <> nil) and (Parent.RowType = vgctFieldRowEh) then
    raise Exception.Create('FieldRow node can''t containt subnodes.');
  Result := AddChild(Parent, vgctCategoryRowEh);
end;

function TDBVertGridCategoryTreeListEh.CreateFieldRowNode(
  Parent: TDBVertGridCategoryTreeNodeEh; FieldRow: TFieldRowEh): TDBVertGridCategoryTreeNodeEh;
begin
  if (Parent <> nil) and (Parent.RowType = vgctFieldRowEh) then
    raise Exception.Create('FieldRow node can''t containt subnodes.');
  Result := AddChild(Parent, vgctFieldRowEh);
  Result.FieldRow := FieldRow;
end;

function TDBVertGridCategoryTreeListEh.AddChild(
  Parent: TDBVertGridCategoryTreeNodeEh;
  ARowType: TDBVertGridCategoryRowTypeEh): TDBVertGridCategoryTreeNodeEh;
begin
  Result := TDBVertGridCategoryTreeNodeEh(inherited AddChild('', Parent, nil));
  Result.FRowType := ARowType;
end;

procedure TDBVertGridCategoryTreeListEh.CategoryNameChanged;
begin
  RowCategories.CheckRebuildRowCategories;
end;

function TDBVertGridCategoryTreeListEh.CategoryTreeNodeByName(
  CategoryName: String): TDBVertGridCategoryTreeNodeEh;
var
  CurNode: TDBVertGridCategoryTreeNodeEh;
begin
  Result := nil;
  CurNode := GetFirst;
  while CurNode <> nil do
  begin
    if (CurNode.RowType = vgctCategoryRowEh) and (CurNode.CategoryName = CategoryName) then
    begin
      Result := CurNode;
      Exit;
    end;
    CurNode := GetNext(CurNode);
  end;
end;

procedure TDBVertGridCategoryTreeListEh.CollapseAll;
begin
  Collapse(Root, True);
end;

procedure TDBVertGridCategoryTreeListEh.ExpandAll;
begin
  Expand(Root, True);
end;

{ TDBVertGridRowCategoriesEh }

constructor TDBVertGridRowCategoriesEh.Create(AGrid: TCustomDBVertGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FCategoryProps := TDBVertGridCategoryPropListEh.Create(Self, TDBVertGridCategoryPropEh);
  FCurrentCategoryTree := TDBVertGridCategoryTreeListEh.Create(TDBVertGridCategoryTreeNodeEh, Self);
  FColor := clDefault;
  FParentFont := True;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  RefreshDefaultFont;
  RowMoveOptions := [];
end;

destructor TDBVertGridRowCategoriesEh.Destroy;
begin
  FreeAndNil(FCurrentCategoryTree);
  FreeAndNil(FFont);
  FreeAndNil(FCategoryProps);
  inherited Destroy;
end;

procedure TDBVertGridRowCategoriesEh.CheckRebuildRowCategories;
begin
  if Assigned(Grid.OnCheckRebuildRowCategories) then
    Grid.OnCheckRebuildRowCategories(Grid, CurrentCategoryTree)
  else
    Grid.DefaultCheckRebuildRowCategories(CurrentCategoryTree);
  FCategoryStructureObsolete := False;  
  Grid.LayoutChanged;
end;

function TDBVertGridRowCategoriesEh.GetCurrentCategoryTree: TDBVertGridCategoryTreeListEh;
begin
  Result := FCurrentCategoryTree;
end;

procedure TDBVertGridRowCategoriesEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    if FActive and (CurrentCategoryTree.Root.Count = 0) then
      CurrentCategoryTree.InitTreeFromGridColumns;
    Grid.RowCategoriesActiveChanged;
  end;
end;

function TDBVertGridRowCategoriesEh.GetCurNode: TDBVertGridCategoryTreeNodeEh;
begin
  Result := nil;
  if Active and (Grid.Row < CurrentCategoryTree.FlatItemsCount) then
    Result := CurrentCategoryTree.FlatItem[Grid.Row];
end;

procedure TDBVertGridRowCategoriesEh.SetCategoryGroupingType(const Value: TCategoryGroupingTypeEh);
begin
  if FCategoryGroupingType <> Value then
  begin
    Grid.Datalink.UpdateData;
    FCategoryGroupingType := Value;
    CurrentCategoryTree.Clear;
    CheckRebuildRowCategories;
  end;
end;

procedure TDBVertGridRowCategoriesEh.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Grid.Invalidate;
  end;
end;

procedure TDBVertGridRowCategoriesEh.SetFontDefault(AFont: TFont);
begin
  FFont.Assign(Grid.Font);
  FFont.Style := FFont.Style + [fsBold];
  FFont.Color := clWindow;
end;

procedure TDBVertGridRowCategoriesEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if not FParentFont then Exit;

  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    SetFontDefault(FFont);
  finally
    FFont.OnChange := Save;
  end;
end;

function TDBVertGridRowCategoriesEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

procedure TDBVertGridRowCategoriesEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TDBVertGridRowCategoriesEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.Invalidate;
  end;
end;

procedure TDBVertGridRowCategoriesEh.FontChanged(Sender: TObject);
begin
  if not (csLoading in FGrid.ComponentState) then
    ParentFont := False;
  if Active then
    Grid.LayoutChanged;
end;

function TDBVertGridRowCategoriesEh.GetColor: TColor;
begin
  if FColor = clDefault
    then Result := clMedGray
    else Result := FColor;
end;

procedure TDBVertGridRowCategoriesEh.CategoryStructureObsolete;
begin
  FCategoryStructureObsolete := True;
end;

procedure TDBVertGridRowCategoriesEh.SetCategoryProps(
  const Value: TDBVertGridCategoryPropListEh);
begin
  FCategoryProps.Assign(Value);
end;

procedure TDBVertGridRowCategoriesEh.CategoryPropsChanges(CategoryProp: TDBVertGridCategoryPropEh);
begin
  if csLoading in Grid.ComponentState then Exit;
  if Active
    then CheckRebuildRowCategories
    else CurrentCategoryTree.Clear;
end;

function TDBVertGridRowCategoriesEh.GetOwner: TPersistent;
begin
  Result := FGrid;
end;

procedure TDBVertGridRowCategoriesEh.SetCurNode(
  const Value: TDBVertGridCategoryTreeNodeEh);
var
  NewIndex: Integer;
begin
  NewIndex := CurrentCategoryTree.FlatIndexOfNode(Value);
  if NewIndex >= 0 then
    Grid.SelectedIndex := NewIndex;
end;

procedure TDBVertGridRowCategoriesEh.SetExpandingGlyphStyle(
  const Value: TTreeViewGlyphStyleEh);
begin
  if FExpandingGlyphStyle <> Value then
  begin
    FExpandingGlyphStyle := Value;
    Grid.Invalidate;
  end;
end;

{ TDBVertGridCategoryPropEh }

constructor TDBVertGridCategoryPropEh.Create(Collection: TCollection);
begin
  inherited Create(Collection);
end;

destructor TDBVertGridCategoryPropEh.Destroy;
begin
  inherited Destroy;
end;

function TDBVertGridCategoryPropEh.GetCategoryPropList: TDBVertGridCategoryPropListEh;
begin
  Result := TDBVertGridCategoryPropListEh(Collection);
end;

procedure TDBVertGridCategoryPropEh.SetDisplayText(const Value: String);
begin
  if FDisplayText <> Value then
  begin
    FDisplayText := Value;
    Changed(False);
  end;
end;

procedure TDBVertGridCategoryPropEh.SetName(const Value: String);
begin
  if FName <> Value then
  begin
    FName := Value;
    Changed(False);
  end;
end;

{ TDBVertGridCategoryPropListEh }

function TDBVertGridCategoryPropListEh.Add: TDBVertGridCategoryPropEh;
begin
  Result := TDBVertGridCategoryPropEh(inherited Add);
end;

procedure TDBVertGridCategoryPropListEh.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
end;

function TDBVertGridCategoryPropListEh.CategoryPropByName(
  APropName: String): TDBVertGridCategoryPropEh;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count-1 do
  begin
    if Items[i].Name = APropName then
    begin
      Result := Items[i];
      Exit;
    end;
  end;
end;

constructor TDBVertGridCategoryPropListEh.Create(
  ARowCategories: TDBVertGridRowCategoriesEh;
  CategoryPropClass: TDBVertGridCategoryPropEhClass);
begin
  inherited Create(CategoryPropClass);
  FRowCategories := ARowCategories;
end;

function TDBVertGridCategoryPropListEh.GetCategoryProp(Index: Integer): TDBVertGridCategoryPropEh;
begin
  Result := TDBVertGridCategoryPropEh(inherited Items[Index]);
end;

function TDBVertGridCategoryPropListEh.GetOwner: TPersistent;
begin
  Result := FRowCategories;
end;

procedure TDBVertGridCategoryPropListEh.Notify(Item: TCollectionItem; Action: TCollectionNotification);
begin
  inherited Notify(Item, Action);
end;

procedure TDBVertGridCategoryPropListEh.SetCategoryProp(Index: Integer; Value: TDBVertGridCategoryPropEh);
begin
  inherited Items[Index] := Value;
end;

procedure TDBVertGridCategoryPropListEh.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  RowCategories.CategoryPropsChanges(TDBVertGridCategoryPropEh(Item));
end;

end.
