{*******************************************************}
{                                                       }
{                        EhLib v6.2                     }
{                                                       }
{      TDBGridEh component from DBAxisGridsEh           }
{               with support of IMemTableEh             }
{                      Build 6.2.062                    }
{                                                       }
{   Copyright (c) 1998-2013 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}

{$I EhLib.Inc}

unit DBGridEh;

//{$R-}

interface

uses
{$IFDEF EH_LIB_17} System.Generics.Collections, {$ENDIF}
  Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
{$IFDEF EH_LIB_5} Contnrs, {$ENDIF}
{$IFDEF EH_LIB_6} Variants, Types, {$ENDIF}
{$IFDEF EH_LIB_7} Themes, UxTheme, {$ENDIF}
{$IFDEF EH_LIB_17} System.UITypes, {$ENDIF}
{$IFDEF CIL}
  EhLibVCLNET,
  WinUtils,
{$ELSE}
  EhLibVCL,
{$ENDIF}
  Graphics, GridsEh, DBCtrls, Db, Menus, Registry, DBSumLst, DBCtrlsEh,
  DBAxisGridsEh,
  IniFiles, ToolCtrlsEh, ImgList, StdActns, PropFilerEh, ActnList,
  DBGridEhGrouping, ExtCtrls, DBGridEhToolCtrls, DynVarsEh, ToolWin;

type

  TDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect);
  TDBGridOptions = set of TDBGridOption;

  TColumnFooterEhValue = (cvFooterAlignment, cvFooterFont, cvFooterColor, cvFooterToolTips);
  TColumnFooterValues = set of TColumnFooterEhValue;

  TColumnEhRestoreParam = (crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh,
    crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh);
  TColumnEhRestoreParams = set of TColumnEhRestoreParam;

  TDBGridEhRestoreParam = (grpColIndexEh, grpColWidthsEh, grpSortMarkerEh, grpColVisibleEh,
    grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh, grpRowPanelColPlacementEh);
  TDBGridEhRestoreParams = set of TDBGridEhRestoreParam;

const
  ColumnEhFooterValues = [cvFooterAlignment..cvFooterColor];

type

  TColumnEh = class;
  TCustomDBGridEh = class;
  TDBGridEhStyle = class;
  TDBGridEhCenter = class;
  TDBGridEhScrollBar = class;
  TDBGridEhDataGroupLevelEh = class;
  TDBGridEhDataGroupsEh = class;

  TCheckTitleEhBtnEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TColumnEh; var Enabled: Boolean) of object;
  TDrawColumnEhCellEvent = procedure(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState) of object;
  TGetCellEhParamsEvent = procedure(Sender: TObject; Column: TColumnEh;
    AFont: TFont; var Background: TColor; State: TGridDrawState) of object;
  TTitleEhClickEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TColumnEh) of object;

  TOnColumnCheckDrawRequiredStateEventEh = procedure(Sender: TObject;
    Text: String; var DrawState: Boolean) of object;
  TGridMoveRecordsEventEh = function(Sender: TObject; BookmarkList: TBMListEh;
    ToRecNo: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean of object;
  TDBGridEhBuildIndicatorTitleMenu = procedure (Grid: TCustomDBGridEh;
    var PopupMenu: TPopupMenu) of object;
  TDBGridEhGetColorEvent = procedure (Grid: TCustomDBGridEh; var Color: TColor)
    of object;

  TGridDataGroupFooterItemAggregateValueEvent = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh;
    FooterColumnItem: TGridDataGroupFooterColumnItemEh;
    var AValue: Variant; Node: TGroupDataTreeNodeEh; var Processed: Boolean) of object;

  TGridDataGroupFooterItemFinalizeValueEvent = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh;
    FooterColumnItem: TGridDataGroupFooterColumnItemEh;
    var AValue: Variant; var Processed: Boolean) of object;

  TGridDataGroupFooterItemToDisplayTextEvent = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh;
    FooterColumnItem: TGridDataGroupFooterColumnItemEh;
    var AValue: Variant; var DisplayValue: String; var Processed: Boolean) of object;

  TDBGridSimpleTextApplyFilterEh = procedure (Sender: TCustomDBGridEh;
    Column: TColumnEh; DataSet: TDataSet; FieldName: String;
    Operation: TLSAutoFilterTypeEh; FilterText: String) of object;

{ TColCellParamsEh }

  TColCellParamsEh = class(TAxisColCellParamsEh)

  end;

{ TColumnTitleEh }

  TColumnTitleEh = class(TAxisBarTitleEh)
  private
    FSortIndex: Integer;
    procedure SetSortIndex(Value: Integer);
    function GetColumn: TColumnEh;
  protected
    FSortMarker: TSortMarkerEh;
    procedure SetSortMarker(Value: TSortMarkerEh);
  public
    constructor Create(Column: TColumnEh);
    destructor Destroy; override;
    function GetSortMarkingWidth: Integer;
    function GetFilterButtonAreaWidth: Integer;
    procedure Assign(Source: TPersistent); override;
    procedure RestoreDefaults; override;
    procedure SetNextSortMarkerValue(KeepMulti: Boolean);
    property Column: TColumnEh read GetColumn;
  published
    property Alignment;
    property Caption;
    property Color;
    property EndEllipsis;
    property Font;
    property Hint;
    property ImageIndex;
    property Orientation;
    property PopupMenu;
    property SortIndex: Integer read FSortIndex write SetSortIndex default 0;
    property SortMarker: TSortMarkerEh read FSortMarker write SetSortMarker default smNoneEh;
    property TitleButton;
    property ToolTips;
  end;

{ TColumnFooterEh }

  TFooterValueType = (fvtNon, fvtSum, fvtAvg, fvtCount, fvtFieldValue, fvtStaticText);

  TColumnFooterEh = class(TCollectionItem)
  private
    FAlignment: TAlignment;
    FAssignedValues: TColumnFooterValues;
    FColor: TColor;
    FColumn: TColumnEh;
    FDisplayFormat: String;
    FEndEllipsis: Boolean;
    FFieldName: string;
    FFont: TFont;
    FToolTips: Boolean;
    FValue: String;
    FValueType: TFooterValueType;
    FWordWrap: Boolean;
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetFont: TFont;
    function GetSumValue: Variant;
    function GetToolTips: Boolean;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsToolTipsStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetDisplayFormat(const Value: String);
    procedure SetEndEllipsis(const Value: Boolean);
    procedure SetFieldName(const Value: String);
    procedure SetFont(Value: TFont);
    procedure SetToolTips(const Value: Boolean);
    procedure SetValue(const Value: String);
    procedure SetValueType(const Value: TFooterValueType);
    procedure SetWordWrap(const Value: Boolean);
  protected
    FDBSum: TDBSum;
    procedure RefreshDefaultFont;
  public
    constructor Create(Collection: TCollection); override;
    constructor CreateApart(Column: TColumnEh);
    destructor Destroy; override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function DefaultToolTips: Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure EnsureSumValue;
    procedure RestoreDefaults; virtual;
    property AssignedValues: TColumnFooterValues read FAssignedValues;
    property Column: TColumnEh read FColumn;
    property SumValue: Variant read GetSumValue;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored IsAlignmentStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property DisplayFormat: String read FDisplayFormat write SetDisplayFormat;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis default False;
    property FieldName: String read FFieldName write SetFieldName;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    property ToolTips: Boolean read GetToolTips write SetToolTips stored IsToolTipsStored;
    property Value: String read FValue write SetValue;
    property ValueType: TFooterValueType read FValueType write SetValueType default fvtNon;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  end;

  TColumnFooterEhClass = class of TColumnFooterEh;

 { TColumnFootersEh }

  TColumnFootersEh = class(TCollection)
  private
    FColumn: TColumnEh;
    function GetFooter(Index: Integer): TColumnFooterEh;
    procedure SetFooter(Index: Integer; Value: TColumnFooterEh);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Column: TColumnEh; FooterClass: TColumnFooterEhClass);
    function Add: TColumnFooterEh;
    property Column: TColumnEh read FColumn;
    property Items[Index: Integer]: TColumnFooterEh read GetFooter write SetFooter; default;
  end;

{ TColumnTitleDefValuesEh }

  TColumnTitleDefValuesEh = class(TAxisBarCaptionDefValuesEh)
  published
    property Alignment;
    property Color;
    property EndEllipsis;
    property Orientation;
    property TitleButton;
    property ToolTips;
  end;

{ TColumnDefValuesEh }

  TColumnDefValuesEh = class(TCustomColumnDefValuesEh)
  private
    FFooter: TColumnFooterDefValuesEh;
    procedure SetFooter(const Value: TColumnFooterDefValuesEh);
    function GetTitle: TColumnTitleDefValuesEh;
    procedure SetTitle(const Value: TColumnTitleDefValuesEh);
  protected
    function CreateAxisBarCaptionDefValues: TAxisBarCaptionDefValuesEh; override;
  public
    constructor Create(Grid: TCustomDBGridEh);
    destructor Destroy; override;
  published
    property AlwaysShowEditButton;
    property AutoDropDown;
    property DblClickNextVal;
    property DropDownShowTitles;
    property DropDownSizing;
    property EndEllipsis;
    property Footer: TColumnFooterDefValuesEh read FFooter write SetFooter;
    property HighlightRequired;
    property Layout;
    property Title: TColumnTitleDefValuesEh read GetTitle write SetTitle;
    property ToolTips;
  end;

{ TSTColumnFilterEh }

  TSTFilterDefaultOperatorEh = (
    fdoAuto, fdoEqual, fdoNotEqual,
    fdoGreaterThan, fdoLessThan, fdoGreaterOrEqual, fdoLessOrEqual,
    fdoLike, fdoNotLike,
    fdoIn, fdoNotIn,
    fdoBeginsWith, fdoDoesntBeginWith,
    fdoEndsWith, fdoDoesntEndWith,
    fdoContains, fdoDoesntContain);

  TSTFilterOperatorEh = (
    foNon, foEqual, foNotEqual,
    foGreaterThan, foLessThan, foGreaterOrEqual, foLessOrEqual,
    foLike, foNotLike,
    foIn, foNotIn,
    foNull, foNotNull,
    foAND, foOR,
    foValue,
    foEqualToNull, foNotEqualToNull);

  TSTOperandTypeEh = (botNon, botString, botNumber, botDateTime, botBoolean);

  TSTFilterExpressionEh = record
    ExpressionType: TSTOperandTypeEh;
    Operator1: TSTFilterOperatorEh;
    Operand1: Variant;
    Relation: TSTFilterOperatorEh; // foAND, foOR, foNon
    Operator2: TSTFilterOperatorEh;
    Operand2: Variant;
  end;

  TSTColumnFilterEh = class(TPersistent)
  private
    FColumn: TColumnEh;
    FDataField: String;
    FKeyCommaText: String;
    FKeyField: String;
    FKeys: TStrings;
    FKeyValues: Variant;
    FList: TStrings;
    FListField: String;
    FListLink: TFieldDataLink;
    FVisible: Boolean;
    FDropDownListWidth: Integer;
    FDropDownListRows: Integer;
    FPopupListboxItemData: TObject;
    FPopupListboxDownIndex: Integer;
    FPopupFilterItems: TStrings;
    function GetExpression: TSTFilterExpressionEh;
    function GetGrid: TCustomDBGridEh;
    function GetListSource: TDataSource;
    function ParseExpression(const Exp: String): String;
    procedure ListLinkActiveChange(Sender: TObject);
    procedure SetExpression(const Value: TSTFilterExpressionEh);
    procedure SetExpressionStr(const Value: String);
    procedure SetListSource(const Value: TDataSource);
    procedure SetVisible(const Value: Boolean);
  protected
    FExpression: TSTFilterExpressionEh;
    FExpressionStr: String;
    FListValuesCheckingState: array of Boolean;
    FInFilterListBox: Boolean;
    FEnterNotClearData: Boolean;
    function GetExpressionAsString: String; virtual;
    function DropDownButtonVisible: Boolean; virtual;
    procedure InternalSetExpressionStr(const Value: String); virtual;
    procedure UpdateFilterFromValuesCheckingState(ss: TStrings);
    procedure UpdateValuesCheckingStateFromFilter(ss: TStrings);
  public
    constructor Create(AColumn: TColumnEh);
    destructor Destroy; override;
    function GetFieldValueList: IMemTableDataFieldValueListEh;
    function GetFilterFieldName: String; virtual;
    function GetOperand1: Variant; virtual;
    function GetOperand2: Variant; virtual;
    function CurrentKeyField: String;
    function CurrentDataField: String;
    function CurrentListDataSet: TDataSet;
    function CurrentListField: String;
    function GetOperandAsString(Operator: TSTFilterOperatorEh; v: Variant): String;
    procedure Assign(Source: TPersistent); override;
    procedure CheckRecodeKeyList(var FExpression: TSTFilterExpressionEh; DisplayToData: Boolean); virtual;
    procedure Clear;
    procedure SetKeyListValues(const AText: String; KeyVals: Variant);
    procedure SetKeysFromListValues(ss: TStrings);
    property DropDownListWidth: Integer read FDropDownListWidth write FDropDownListWidth default 0;
    property DropDownListRows: Integer read FDropDownListRows write FDropDownListRows default 0;
    property Column: TColumnEh read FColumn;
    property Expression: TSTFilterExpressionEh read GetExpression write SetExpression;
    property ExpressionStr: String read FExpressionStr write SetExpressionStr;
    property Grid: TCustomDBGridEh read GetGrid;
    property KeyCommaText: String read FKeyCommaText write FKeyCommaText;
  published
    property DataField: String read FDataField write FDataField;
    property KeyField: String read FKeyField write FKeyField;
    property ListField: String read FListField write FListField;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

{ TColumnEh }

  TDBGridEhDataHintParams = class(TDBAxisGridDataHintParamsEh)
  end;

  TDBGridEhHintShowPauseEvent = procedure(Sender: TCustomDBGridEh;
    CursorPos: TPoint; Cell: TGridCoord; InCellCursorPos: TPoint;
    Column: TColumnEh; var HintPause: Integer;
    var Processed: Boolean) of object;

  TDBGridEhDataHintShowEvent = procedure(Sender: TCustomDBGridEh;
    CursorPos: TPoint; Cell: TGridCoord; InCellCursorPos: TPoint;
    Column: TColumnEh; var Params: TDBGridEhDataHintParams;
    var Processed: Boolean) of object;

  TDBGridEhAdvDrawColumnDataEvent = procedure(Sender: TCustomDBGridEh;
    Cell, AreaCell: TGridCoord; Column: TColumnEh; const ARect: TRect;
    var Params: TColCellParamsEh; var Processed: Boolean) of object;

  TColumnEhInRowPanelPlacement = record
    Left: Integer;
    Top: Integer;
    Width: Integer;
    Height: Integer;
    DataCellLeft: Integer;
    DataCellWidth: Integer;
  end;

  TDBGridEhFillSTFilterListValuesEvent = procedure(Sender: TCustomDBGridEh;
    Column: TColumnEh; Items: TStrings; var Processed: Boolean) of object;

  TDBGridEhColumnGroupGetKeyValueEvent = procedure(Sender: TCustomDBGridEh;
    Column: TColumnEh; var KeyValue: Variant) of object;

  TDBGridEhDataGroupGetKeyValueAsTextEvent = procedure(Sender: TCustomDBGridEh;
    GroupDataTreeNode: TGroupDataTreeNodeEh; const KeyValue: Variant; var KeyValueAsText: String) of object;

  TGetColCellParamsEventEh = procedure(Sender: TObject; EditMode: Boolean;
    Params: TColCellParamsEh) of object;

  TDBGridEhDropDownBoxCheckTitleEhBtnEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TColumnEh; var Enabled: Boolean) of object;
  TDBGridEhDropDownBoxDrawColumnEhCellEvent = procedure(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumnEh; State: TGridDrawState) of object;
  TDBGridEhDropDownBoxGetCellEhParamsEvent = procedure(Sender: TObject; Column: TColumnEh;
    AFont: TFont; var Background: TColor; State: TGridDrawState) of object;
  TDBGridEhDropDownBoxTitleEhClickEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TColumnEh) of object;

  TDBGridEhDropDownBoxDBGridSimpleTextApplyFilterEh = procedure (Sender: TCustomDBGridEh;
    Column: TColumnEh; DataSet: TDataSet; FieldName: String;
    Operation: TLSAutoFilterTypeEh; FilterText: String) of object;

  TDBGridShowDropDownFormEventEh = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
    DynParams: TDynVarsEh) of object;

  TDBGridCloseDropDownFormEventEh = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; Button: TEditButtonEh; Accept: Boolean;
    DropDownForm: TCustomForm; DynParams: TDynVarsEh) of object;

  TColumnEh = class(TBaseColumnEh)
  private
    FCheckedDuplicates: array of Boolean;
    FFooter: TColumnFooterEh;
    FFooters: TColumnFootersEh;
    FHideDuplicates: Boolean;
    FMaxWidth: Integer;
    FMinWidth: Integer;
    FNotInWidthRange: Boolean;
    FOnGetCellParams: TGetColCellParamsEventEh;
    FWidth: Integer;
    FSTFilter: TSTColumnFilterEh;
    FFieldValueList: IMemTableDataFieldValueListEh;
    FOnAdvDrawDataCell: TDBGridEhAdvDrawColumnDataEvent;
    FOnCheckDrawRequiredState: TOnColumnCheckDrawRequiredStateEventEh;
    FOnHintShowPause: TDBGridEhHintShowPauseEvent;
    FOnDataHintShow: TDBGridEhDataHintShowEvent;
    FOnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent;

    FRowLine: Integer;
    FHeight: Integer;
    FInRowTabIndex: Integer;
    FOnGroupGetKeyValue: TDBGridEhColumnGroupGetKeyValueEvent;
    FOnGroupGetKeyValueAsText: TDBGridEhDataGroupGetKeyValueAsTextEvent;
    FOnGetHideDuplicatesValue: TDBGridEhColumnGroupGetKeyValueEvent;
    FOnDataGroupFooterFinalizeValue: TGridDataGroupFooterItemFinalizeValueEvent;
    FOnDataGroupFooterToDisplayText: TGridDataGroupFooterItemToDisplayTextEvent;
    FOnDataGroupFooterAggregateValue: TGridDataGroupFooterItemAggregateValueEvent;

    FOnDropDownBoxApplyTextFilter: TDBGridEhDropDownBoxDBGridSimpleTextApplyFilterEh;

    function GetGrid: TCustomDBGridEh;
    function IsWidthStored: Boolean;
    procedure SetFooter(const Value: TColumnFooterEh);
    procedure SetFooters(const Value: TColumnFootersEh);
    procedure SetOnGetCellParams(const Value: TGetColCellParamsEventEh);
    procedure SetSTFilter(const Value: TSTColumnFilterEh);
    function GetInRowLinePos: Integer;
    procedure SetInRowLinePos(const Value: Integer);
    function GetInRowLineHeight: Integer;
    procedure SetInRowLineHeight(const Value: Integer);
    function GetTitle: TColumnTitleEh;
    procedure SetTitle(const Value: TColumnTitleEh);
    function GetOnDropDownBoxCheckButton: TDBGridEhDropDownBoxCheckTitleEhBtnEvent;
    function GetOnDropDownBoxDrawColumnCell: TDBGridEhDropDownBoxDrawColumnEhCellEvent;
    function GetOnDropDownBoxGetCellParams: TDBGridEhDropDownBoxGetCellEhParamsEvent;
    function GetOnDropDownBoxTitleBtnClick: TDBGridEhDropDownBoxTitleEhClickEvent;
    procedure SetOnDropDownBoxCheckButton(const Value: TDBGridEhDropDownBoxCheckTitleEhBtnEvent);
    procedure SetOnDropDownBoxDrawColumnCell(const Value: TDBGridEhDropDownBoxDrawColumnEhCellEvent);
    procedure SetOnDropDownBoxGetCellParams(const Value: TDBGridEhDropDownBoxGetCellEhParamsEvent);
    procedure SetOnDropDownBoxTitleBtnClick(const Value: TDBGridEhDropDownBoxTitleEhClickEvent);
    function GetOnCloseDropDownForm: TDBGridCloseDropDownFormEventEh;
    function GetOnOpenDropDownForm: TDBGridShowDropDownFormEventEh;
    procedure SetOnCloseDropDownForm(const Value: TDBGridCloseDropDownFormEventEh);
    procedure SetOnOpenDropDownForm(const Value: TDBGridShowDropDownFormEventEh);
  protected
    FAutoFitColWidth: Boolean;
    FInitWidth: Integer;
    FRowPlacement: TColumnEhInRowPanelPlacement;
    function AllowableWidth(TryWidth: Integer): Integer;
    function CreateTitle: TAxisBarTitleEh; override;
    function CreateFooter: TColumnFooterEh; virtual;
    function CreateFooters: TColumnFootersEh; virtual;
    function CreateSTFilter: TSTColumnFilterEh; virtual;
    procedure Changed(AllItems: Boolean); override;
    procedure EnsureSumValue;
    procedure SetField(Value: TField); override;
    procedure SetHideDuplicates(Value: Boolean); virtual;

    procedure ReadInRowLinePos(Reader: TReader);
    procedure ReadInRowLineHeight(Reader: TReader);
    procedure WriteInRowLinePos(Writer: TWriter);
    procedure WriteInRowLineHeight(Writer: TWriter);
    function IsInRowLinePosStored: Boolean;
    function IsInRowLineHeightStored: Boolean;

    function GetWidth: Integer; override;
    function GetAutoFitColWidth: Boolean; override;
    procedure SetMaxWidth(const Value: Integer); override;
    procedure SetMinWidth(const Value: Integer); override;
    procedure SetAutoFitColWidth(const Value: Boolean); override;
    procedure SetWidth(const Value: Integer); override;

    property FieldValueList: IMemTableDataFieldValueListEh read FFieldValueList write FFieldValueList;
  protected
    { ILookupGridOwner }
  protected {new}
    function GetField: TField; override;
    procedure SetTextArea(var CellRect: TRect); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function DefaultWidth: Integer;
    function FullWidth: Integer;
    function UsedFooter(Index: Integer): TColumnFooterEh;
    function CalcRowHeight: Integer; override;

    function CurLineWordWrap(RowHeight: Integer): Boolean; override;
    function GetCurrentFieldValueList: IMemTableDataFieldValueListEh;
    function CanApplyAggregateFunction(FooterValueType: TGroupFooterValueTypeEh): Boolean;

    procedure Assign(Source: TPersistent); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure GetColCellParams(EditMode: Boolean; ColCellParamsEh: TAxisColCellParamsEh); override;
    procedure OptimizeWidth; virtual;
    procedure SetValueAsText(const StrVal: String);
    procedure SetValueAsVariant(VarVal: Variant);
    procedure DropDownBoxApplyTextFilter(DataSet: TDataSet; FieldName: String; Operation: TLSAutoFilterTypeEh; FilterText: String); override;

    property Grid: TCustomDBGridEh read GetGrid;
    property RowPlacement: TColumnEhInRowPanelPlacement read FRowPlacement;
  public

    property Alignment;
    property AlwaysShowEditButton;
    property AutoDropDown;
    property ButtonStyle;
    property Checkboxes;
    property Color;
    property BiDiMode;
    property DblClickNextVal;
    property DisplayFormat;
    property DynProps;
    property DropDownBox;
    property DropDownRows; // obsolete
    property DropDownShowTitles;
    property DropDownSizing;
    property DropDownSpecRow;
    property DropDownWidth;
    property DropDownFormParams;
    property EditButtons;
    property EditButtonPressed;
    property EditMask;
    property EndEllipsis;
    property FieldName;
    property Font;
    property HighlightRequired;
    property ImageList;
    property ImeMode;
    property ImeName;
    property Increment;
    property KeyList;
    property LookupDisplayFields;
    property Layout;
    property Name;
    property MRUList;
    property NotInKeyListIndex;
    property PickList;
    property PopupMenu;
    property ReadOnly;
    property ShowImageAndText;
    property Tag;
    property TextEditing;
//    property Title;
    property ToolTips;
    property Visible;
    property WordWrap;

    property OnDropDownBoxSortMarkingChanged;

    property OnDropDownBoxApplyTextFilter: TDBGridEhDropDownBoxDBGridSimpleTextApplyFilterEh read FOnDropDownBoxApplyTextFilter write FOnDropDownBoxApplyTextFilter;
    property OnDropDownBoxCheckButton: TDBGridEhDropDownBoxCheckTitleEhBtnEvent read GetOnDropDownBoxCheckButton write SetOnDropDownBoxCheckButton;
    property OnDropDownBoxDrawColumnCell: TDBGridEhDropDownBoxDrawColumnEhCellEvent read GetOnDropDownBoxDrawColumnCell write SetOnDropDownBoxDrawColumnCell;
    property OnDropDownBoxGetCellParams: TDBGridEhDropDownBoxGetCellEhParamsEvent read GetOnDropDownBoxGetCellParams write SetOnDropDownBoxGetCellParams;
    property OnDropDownBoxTitleBtnClick: TDBGridEhDropDownBoxTitleEhClickEvent read GetOnDropDownBoxTitleBtnClick write SetOnDropDownBoxTitleBtnClick;

    property OnEditButtonClick;
    property OnEditButtonDown;
    property OnNotInList;
    property OnUpdateData;

    property AutoFitColWidth: Boolean read GetAutoFitColWidth write SetAutoFitColWidth default True;
    property Footer: TColumnFooterEh read FFooter write SetFooter;
    property Footers: TColumnFootersEh read FFooters write SetFooters;
    property HideDuplicates: Boolean read FHideDuplicates write SetHideDuplicates default False;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth default 0;
    property MinWidth: Integer read FMinWidth write SetMinWidth default 0;
    property STFilter: TSTColumnFilterEh read FSTFilter write SetSTFilter;

    property Title: TColumnTitleEh read GetTitle write SetTitle;

    property Width: Integer read GetWidth write SetWidth stored IsWidthStored;

    property OnCheckDrawRequiredState: TOnColumnCheckDrawRequiredStateEventEh read FOnCheckDrawRequiredState write FOnCheckDrawRequiredState;
    property OnGetCellParams: TGetColCellParamsEventEh read FOnGetCellParams write SetOnGetCellParams;
    property OnHintShowPause: TDBGridEhHintShowPauseEvent read FOnHintShowPause write FOnHintShowPause;
    property OnDataHintShow: TDBGridEhDataHintShowEvent read FOnDataHintShow write FOnDataHintShow;
    property OnAdvDrawDataCell: TDBGridEhAdvDrawColumnDataEvent read FOnAdvDrawDataCell write FOnAdvDrawDataCell;
    property OnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent read FOnFillSTFilterListValues write FOnFillSTFilterListValues;
    property OnGroupGetKeyValue: TDBGridEhColumnGroupGetKeyValueEvent read FOnGroupGetKeyValue write FOnGroupGetKeyValue;
    property OnGroupGetKeyValueAsText: TDBGridEhDataGroupGetKeyValueAsTextEvent read FOnGroupGetKeyValueAsText write FOnGroupGetKeyValueAsText;
    property OnGetHideDuplicatesValue: TDBGridEhColumnGroupGetKeyValueEvent read FOnGetHideDuplicatesValue write FOnGetHideDuplicatesValue;
    property OnDataGroupFooterAggregateValue: TGridDataGroupFooterItemAggregateValueEvent read FOnDataGroupFooterAggregateValue write FOnDataGroupFooterAggregateValue;
    property OnDataGroupFooterFinalizeValue: TGridDataGroupFooterItemFinalizeValueEvent read FOnDataGroupFooterFinalizeValue write FOnDataGroupFooterFinalizeValue;
    property OnDataGroupFooterToDisplayText: TGridDataGroupFooterItemToDisplayTextEvent read FOnDataGroupFooterToDisplayText write FOnDataGroupFooterToDisplayText;

    property InRowLinePos: Integer read GetInRowLinePos write SetInRowLinePos;
    property InRowLineHeight: Integer read GetInRowLineHeight write SetInRowLineHeight;
    property InRowTabIndex: Integer read FInRowTabIndex;

    property OnOpenDropDownForm: TDBGridShowDropDownFormEventEh read GetOnOpenDropDownForm write SetOnOpenDropDownForm;
    property OnCloseDropDownForm: TDBGridCloseDropDownFormEventEh read GetOnCloseDropDownForm write SetOnCloseDropDownForm;
  end;

  TColumnEhClass = class of TColumnEh;

  TDBGridColumnEh = class(TColumnEh)
  published
    property Alignment;
    property AlwaysShowEditButton;
    property AutoDropDown;
    property AutoFitColWidth;
    property BiDiMode;
    property ButtonStyle;
    property Checkboxes;
    property Color;
    property DblClickNextVal;
    property DisplayFormat;
    property DynProps;
    property DropDownBox;
    property DropDownRows;
    property DropDownShowTitles;
    property DropDownSizing;
    property DropDownSpecRow;
    property DropDownWidth;
    property DropDownFormParams;
    property EditButtons;
    property EditMask;
    property EndEllipsis;
    property FieldName;
    property Font;
    property Footer;
    property Footers;
    property HideDuplicates;
    property HighlightRequired;
    property ImageList;
    property ImeMode;
    property ImeName;
    property Increment;
    property KeyList;
    property Layout;
    property LookupDisplayFields;
    property MaxWidth;
    property MinWidth;
    property MRUList;
    property NotInKeyListIndex;
    property PickList;
    property PopupMenu;
    property ReadOnly;
    property ShowImageAndText;
    property STFilter;
    property Tag;
    property TextEditing;
    property Title;
    property ToolTips;
    property Visible;
    property Width;
    property WordWrap;
//    property OnGetItemImageIndex;
    property OnAdvDrawDataCell;
    property OnCheckDrawRequiredState;
    property OnDataGroupFooterAggregateValue;
    property OnDataGroupFooterFinalizeValue;
    property OnDataGroupFooterToDisplayText;
    property OnDataHintShow;
    property OnDropDownBoxApplyTextFilter;
    property OnDropDownBoxCheckButton;
    property OnDropDownBoxDrawColumnCell;
    property OnDropDownBoxGetCellParams;
    property OnDropDownBoxSortMarkingChanged;
    property OnDropDownBoxTitleBtnClick;
    property OnEditButtonClick;
    property OnEditButtonDown;
    property OnFillSTFilterListValues;
    property OnGetCellParams;
    property OnGetHideDuplicatesValue;
    property OnGroupGetKeyValue;
    property OnGroupGetKeyValueAsText;
    property OnHintShowPause;
    property OnNotInList;
    property OnUpdateData;

    property OnOpenDropDownForm;
    property OnCloseDropDownForm;
  end;


 { TDBGridColumnsEh }

  TDBGridColumnsEh = class(TBaseColumnsEh)
  private

    FUpDownBaseColumn: TColumnEh;
    FFirstScrollVisibleColumn: TColumnEh;
    FFirstFrozenVisibleColumn: TColumnEh;
    FFirstContraVisibleColumn: TColumnEh;
    FLastScrollVisibleColumn: TColumnEh;
    FLastFrozenVisibleColumn: TColumnEh;
    FLastContraVisibleColumn: TColumnEh;

    function GetColumn(Index: Integer): TColumnEh;
    procedure SetColumn(Index: Integer; const Value: TColumnEh);
    function GetGrid: TCustomDBGridEh;
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Grid: TCustomDBGridEh; ColumnClass: TColumnEhClass);
    function Add: TColumnEh;
    function ExistFooterValueType(AFooterValueType: TFooterValueType): Boolean;
    function FindColumnByName(const ColumnName: String): TColumnEh;
    function GetNextTabColumn(ForColumn: TColumnEh; GoForward: Boolean): TColumnEh;
    function GetNextHorzColumn(ForColumn: TColumnEh; GoForward, TillTheLastCol, CheckTabStop: Boolean): TColumnEh;
    function GetNextVertColumn(ForColumn: TColumnEh; GoForward: Boolean): TColumnEh;
    function GetTopColumn(ForColumn: TColumnEh): TColumnEh;
    function GetBottomColumn(ForColumn: TColumnEh): TColumnEh;
    function GetFirstTabColumn: TColumnEh;
    function GetLastTabColumn: TColumnEh;
    function FirstScrollVisibleColumn: TColumnEh;
    function LastScrollVisibleColumn: TColumnEh;
    function FirstFrozenVisibleColumn: TColumnEh;
    function LastFrozenVisibleColumn: TColumnEh;
    function FirstContraVisibleColumn: TColumnEh;
    function LastContraVisibleColumn: TColumnEh;

    procedure AddAllColumns(DeleteExisting: Boolean);
    procedure ActiveChanged; override;
    procedure FixupAutoFitColWidths(GridWidth: Integer);
    procedure RebuildColumns;
    procedure GetColumnNames(List: TStrings);

    property Grid: TCustomDBGridEh read GetGrid;
    property Items[Index: Integer]: TColumnEh read GetColumn write SetColumn; default;

    procedure RelayoutCellsInRowPanel;
    procedure ScaleWidths(Divisor, Denominator: Integer);
  end;

{ TColumnsEhList }

  TColumnsEhList = class(TAxisBarsEhList)
  private
    function GetColumn(Index: Integer): TColumnEh;
    procedure SetColumn(Index: Integer; const Value: TColumnEh);
  public
    constructor Create; overload;
    property Items[Index: Integer]: TColumnEh read GetColumn write SetColumn; default;
  end;

{ TGridDataLinkEh }

  TGridDataLinkEh = class(TAxisGridDataLinkEh)
  protected
    procedure ActiveChanged; override;
  end;

{ TBookmarkListEh }

  TBookmarkListEh = class(TBMListEh)
  private
    FGrid: TCustomDBGridEh;
    FRowsRef: TObjectList;
  protected
    function GetDataSet: TDataSet; override;
    procedure Invalidate; override;
    procedure SetCurrentRowSelected(Value: Boolean); override;
    procedure UpdateState; override;
    procedure ListChanged(Sender: TObject); override;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function SelectionToGridRect: TGridRect;
    procedure Assign(Rows: TBookmarkListEh);
    procedure AssignAsBaseRef(Rows: TBookmarkListEh);
    procedure Clear; override;
  end;

{ THeadTreeNode }

  THeadTreeNode = class;

  LeafCol = record
    FLeaf: THeadTreeNode;
    FColumn: TColumnEh;
  end;

  PLeafCol = ^LeafCol;
  TLeafCol = array[0..MaxListSize - 1] of LeafCol;
//  PTLeafCol = ^TLeafCol;
  PTLeafCol = array of LeafCol;

  THeadTreeProc = procedure(node: THeadTreeNode) of object;

  THeadTreeNode = class(TObject)
  public
    Child: THeadTreeNode;
    Column: TColumnEh;
    Drawn: Boolean;
    Height: Integer;
    HeightPrn: Integer;
    Host: THeadTreeNode;
    Next: THeadTreeNode;
    Text: String;
    VLineWidth: Integer;
    Width: Integer;
    WidthPrn: Integer;
    WIndent: Integer;
    constructor Create;
    constructor CreateText(const AText: String; const AHeight, AWidth: Integer);
    destructor Destroy; override;
    function Add(AAfter: THeadTreeNode; AText: String; AHeight, AWidth: Integer): THeadTreeNode;
    function AddChild(ANode: THeadTreeNode; AText: String; AHeight, AWidth: Integer): THeadTreeNode;
    function Find(ANode: THeadTreeNode): Boolean;
    function GetLevel: Integer;
    function GetDepth(ANode: THeadTreeNode): Integer;
    procedure CreateFieldTree(AGrid: TCustomDBGridEh);
    procedure DoForAllNode(proc: THeadTreeProc);
    procedure FreeAllChild;
    procedure Union(AFrom, ATo: THeadTreeNode; AText: String; AHeight: Integer);

  end;

{ TDBGridEhSumList }

  TDBGridEhSumList = class(TDBSumListProducer)
  private
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
  protected
    procedure ReturnEvents; override;
  public
    constructor Create(AOwner: TComponent);
    procedure SetDataSetEvents; override;
    procedure RecalcAll; override;
  published
    property Active: Boolean read GetActive write SetActive default False;
    property ExternalRecalc default False;
    property OnRecalcAll;
    property OnAfterRecalcAll;
    property SumListChanged;
    property VirtualRecords default False;
  end;

{ TDBGridEhScrollBarPanel }

  TDBGridEhScrollBarPanel = class(TPersistent)
  private
    FScrollBar: TDBGridEhScrollBar;
    FVisible: Boolean;
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
    function GetNavigatorButtons: TNavButtonSetEh;
    procedure SetNavigatorButtons(const Value: TNavButtonSetEh);
    procedure SetVisibleItems(const Value: TGridSBItemsEh);
    function GetVisibleItems: TGridSBItemsEh;
  public
    constructor Create(ScrollBar: TDBGridEhScrollBar);
    function Grid: TCustomDBGridEh;
  published
    property Visible: Boolean read GetVisible write SetVisible default False;
    property NavigatorButtons: TNavButtonSetEh read GetNavigatorButtons write SetNavigatorButtons default
      [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbInsertEh, nbDeleteEh, nbEditEh, nbPostEh, nbCancelEh, nbRefreshEh];
    property VisibleItems: TGridSBItemsEh read GetVisibleItems write SetVisibleItems default [gsbiRecordsInfoEh, gsbiNavigator, gsbiSelAggregationInfoEh];
  end;

  {TDBGridEhScrollBar}

  TScrollBarVisibleModeEh = (sbAlwaysShowEh, sbNeverShowEh, sbAutoShowEh);

  TDBGridEhScrollBar = class(TPersistent)
  private
    FDBGridEh: TCustomDBGridEh;
    FExtScrollBar: TScrollBar;
    FKind: TScrollBarKind;
    FTracking: Boolean;
    FVisibleMode: TScrollBarVisibleModeEh;
    FSmoothStep: Boolean;
    function GetSmoothStep: Boolean;
    function GetVisible: Boolean;
    procedure ExtScrollWindowProc(var Message: TMessage);
    procedure SetExtScrollBar(const Value: TScrollBar);
    procedure SetSmoothStep(Value: Boolean);
    procedure SetVisible(Value: Boolean);
    procedure SetVisibleMode(const Value: TScrollBarVisibleModeEh);
  protected
    procedure SmoothStepChanged; virtual;
    procedure ScrollBarPanelChanged; virtual;
  public
    constructor Create(AGrid: TCustomDBGridEh; AKind: TScrollBarKind);
    destructor Destroy; override;
    function GetScrollInfo(var ScrollInfo: TScrollInfo): Boolean;
    function IsScrollBarVisible: Boolean;
    function IsScrollBarShowing: Boolean;
    function CheckHideScrollBar: Boolean;
    function CanIntScrollBarBeShown: Boolean;
    function Grid: TCustomDBGridEh;
    function ScrollBarPanel: Boolean; virtual;
    procedure Assign(Source: TPersistent); override;
    procedure UpdateExtScrollBar;
    property Kind: TScrollBarKind read FKind;
    property VisibleMode: TScrollBarVisibleModeEh read FVisibleMode write SetVisibleMode default sbAutoShowEh;
    property SmoothStep: Boolean read GetSmoothStep write SetSmoothStep default False;
  published
    property ExtScrollBar: TScrollBar read FExtScrollBar write SetExtScrollBar;
    property Tracking: Boolean read FTracking write FTracking default True;
    property Visible: Boolean read GetVisible write SetVisible default True;
  end;

{ THorzDBGridEhScrollBar }

  THorzDBGridEhScrollBar = class(TDBGridEhScrollBar)
  private
    FExtraPanel: TDBGridEhScrollBarPanel;
    procedure SetExtraPanel(const Value: TDBGridEhScrollBarPanel);
  protected
    procedure SmoothStepChanged; override;
  public
    constructor Create(AGrid: TCustomDBGridEh; AKind: TScrollBarKind);
    destructor Destroy; override;
    function ScrollBarPanel: Boolean; override;
  published
    property ExtraPanel: TDBGridEhScrollBarPanel read FExtraPanel write SetExtraPanel;
    property SmoothStep default True;
  end;

{ TVertDBGridEhScrollBar }

  TVertDBGridEhScrollBar = class(TDBGridEhScrollBar)
  protected
    FVertScrollBarVisibleMode: TScrollBarVisibleModeEh;
    FSysScrollBar: Boolean;
    procedure SmoothStepChanged; override;
    procedure SetParams(APosition, AMin, AMax, APageSize: Integer);
  public
    constructor Create(AGrid: TCustomDBGridEh; AKind: TScrollBarKind);
  published
    property SmoothStep;
    property Visible stored False;
    property VisibleMode;
  end;

  TDBGridEhSelectionType = (gstRecordBookmarks, gstRectangle, gstColumns, gstAll, gstNon);
  TDBGridEhAllowedSelection = gstRecordBookmarks..gstAll;
  TDBGridEhAllowedSelections = set of TDBGridEhAllowedSelection;

  TDBCell = record
    Col: Longint;
    Row: TUniBookmarkEh;
  end;


{ TDBGridEhIndicatorTitle }

  TDBGridEhIndicatorTitle = class(TPersistent)
  private
    FDown: Boolean;
    FDropdownMenu: TPopupMenu;
    FShowDropDownSign: Boolean;
    FTitleButton: Boolean;
    FUseGlobalMenu: Boolean;
    FGrid: TCustomDBGridEh;
    procedure SetShowDropDownSign(const Value: Boolean);
  public
    property Down: Boolean read FDown;
    constructor Create(AGrid: TCustomDBGridEh);
  published
    property DropdownMenu: TPopupMenu read FDropdownMenu write FDropdownMenu;
    property ShowDropDownSign: Boolean read FShowDropDownSign write SetShowDropDownSign default False;
    property TitleButton: Boolean read FTitleButton write FTitleButton default False;
    property UseGlobalMenu: Boolean read FUseGlobalMenu write FUseGlobalMenu default True;
  end;

{ TDBGridEhSelectionRect }

  TDBGridEhSelectionRect = class(TObject)
  private
    FAnchor: TDBCell;
    FGrid: TCustomDBGridEh;
    FShiftCell: TDBCell;
    function BoxRect(ALeft: Longint; ATop: TUniBookmarkEh; ARight: Longint; ABottom: TUniBookmarkEh): TRect;
    function CheckState: Boolean;
    function GetBottomRow: TUniBookmarkEh;
    function GetLeftCol: Longint;
    function GetRightCol: Longint;
    function GetTopRow: TUniBookmarkEh;
    function GetGrid: TCustomDBGridEh;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    function DataCellSelected(DataCol: Longint; DataRow: TUniBookmarkEh): Boolean;
    function SelectionToGridRect: TGridRect;
    procedure Assign(Rect: TDBGridEhSelectionRect);
    procedure Clear;
    procedure Select(ACol: Longint; ARow: TUniBookmarkEh; AddSel: Boolean);
    property Grid: TCustomDBGridEh read GetGrid;
    property BottomRow: TUniBookmarkEh read GetBottomRow;
    property LeftCol: Longint read GetLeftCol;
    property RightCol: Longint read GetRightCol;
    property TopRow: TUniBookmarkEh read GetTopRow;
  end;

{ TDBGridEhSelectionCols }

  TDBGridEhSelectionCols = class(TColumnsEhList)
  private
    FAnchor: TColumnEh;
    FGrid: TCustomDBGridEh;
    FShiftCol: TColumnEh;
    FShiftSelectedCols: TColumnsEhList;
    procedure Add(ACol: TColumnEh);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function SelectionToGridRect: TGridRect;
    procedure Clear; override;
    procedure InvertSelect(ACol: TColumnEh);
    procedure Refresh;
    procedure Select(ACol: TColumnEh; AddSel: Boolean);
    procedure SelectShift(ACol: TColumnEh {; Clear:Boolean});
  end;

{ TDBGridEhSelection }

  TDBGridEhSelection = class
  private
    FColumns: TDBGridEhSelectionCols;
    FGrid: TCustomDBGridEh;
    FRect: TDBGridEhSelectionRect;
    FSelectionType: TDBGridEhSelectionType;
    FBMList: TBookmarkListEh;
    function GetRows: TBookmarkListEh;
    procedure LinkActive(Value: Boolean);
    procedure SetSelectionType(ASelType: TDBGridEhSelectionType);
  protected
    procedure SelectionChanged; virtual;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function DataCellSelected(DataCol: Longint; DataRow: TUniBookmarkEh): Boolean;
    function SelectionToGridRect: TGridRect;
    procedure Clear;
    procedure Refresh;
    procedure SelectAll;
    procedure UpdateState;
    procedure Assign(Selection: TDBGridEhSelection);
    procedure AssignAsBaseRef(Selection: TDBGridEhSelection);
    property Columns: TDBGridEhSelectionCols read FColumns;
    property Rect: TDBGridEhSelectionRect read FRect;
    property Rows: TBookmarkListEh read GetRows;
    property SelectionType: TDBGridEhSelectionType read FSelectionType;
  end;

  TSTFilterLocationEh = (stflUnderTitleFilterEh, stflInTitleFilterEh);
  TDBGridFilterButtonDrawTimeEh = (fbdtAlwaysEh, fbdtWhenRowHotEh, fbdtWhenCellHotEh);

{ TSTDBGridEhFilter }

  TSTDBGridEhFilter = class(TPersistent)
  private
    FGrid: TCustomDBGridEh;
    FLocal: Boolean;
    FUpateCount: Integer;
    FVisible: Boolean;
    FIsInstantApplyStored: Boolean;
    FInstantApply: Boolean;
    FLocation: TSTFilterLocationEh;
    FParentFont: Boolean;
    FRowLines: Integer;
    FRowHeight: Integer;
    FColor: TColor;
    FHorzLineColor: TColor;
    FVertLineColor: TColor;
    FFont: TFont;
    FFilterButtonDrawTime: TDBGridFilterButtonDrawTimeEh;
    FInplaceEditorButtonHeight: Integer;
    function GetInstantApply: Boolean;
    function IsInstantApplyStored: Boolean;
    procedure SetInstantApply(const Value: Boolean);
    procedure SetLocal(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure SetLocation(const Value: TSTFilterLocationEh);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetHorzLineColor(const Value: TColor);
    procedure SetParentFont(const Value: Boolean);
    procedure SetRowHeight(const Value: Integer);
    procedure SetRowLines(const Value: Integer);
    procedure SetVertLineColor(const Value: TColor);
    procedure FontChanged(Sender: TObject);
    procedure RefreshDefaultFont;
    function IsFontStored: Boolean;
    procedure SetFilterButtonDrawTime(const Value: TDBGridFilterButtonDrawTimeEh);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function DefaultFont: TFont; virtual;
    function GetColor: TColor; virtual;
    function GetHorzLineColor: TColor; virtual;
    function GetVertLineColor: TColor; virtual;
    function RowFullRowHeight: Integer;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure UpdateInplaceEditorButtonHeight;
    property UpdateCount: Integer read FUpateCount;
  published
    property InstantApply: Boolean read GetInstantApply write SetInstantApply stored IsInstantApplyStored;
    property Local: Boolean read FLocal write SetLocal default False;
    property Location: TSTFilterLocationEh read FLocation write SetLocation default stflUnderTitleFilterEh;
    property Visible: Boolean read FVisible write SetVisible default False;

    property Color: TColor read FColor write SetColor default clDefault;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;

    property HorzLineColor: TColor read FHorzLineColor write SetHorzLineColor default clDefault;
    property RowHeight: Integer read FRowHeight write SetRowHeight default 0;
    property RowLines: Integer read FRowLines write SetRowLines default 0;
    property VertLineColor: TColor read FVertLineColor write SetVertLineColor default clDefault;
    property FilterButtonDrawTime: TDBGridFilterButtonDrawTimeEh read FFilterButtonDrawTime write SetFilterButtonDrawTime default fbdtAlwaysEh;

  end;

  TDBGridEhFillSTFilterListEvent = procedure(Grid: TCustomDBGridEh;
    Column: TColumnEh; List: TStrings; var Processed: Boolean) of object;

{ TRowDetailPanelEh }

  TRowDetailPanelEh = class(TPersistent)
  private
    FGrid: TCustomDBGridEh;
    FActive: Boolean;
    FVisible: Boolean;
    FWidth: Integer;
    FHeight: Integer;
    FActiveControl: TWinControl;
    FBevelEdges: TBevelEdges;
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FBorderStyle: TBorderStyle;
    FColor: TColor;
    FParentColor: Boolean;
    FVertSizing: Boolean;
    FMaxHeight: Integer;
    FMinHeight: Integer;
    FSizingBarHeight: Integer;
    FSizingBarBeveled: Boolean;
    function IsColorStored: Boolean;
    function GetColor: TColor;
    procedure SetActive(const Value: Boolean);
    procedure SetActiveControl(Control: TWinControl);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: Integer);
    procedure SetHeight(Value: Integer);
    procedure SetBevelEdges(const Value: TBevelEdges);
    procedure SetBevelKind(const Value: TBevelKind);
    procedure SetBevelWidth(const Value: TBevelWidth);
    procedure SetBevelInner(const Value: TBevelCut);
    procedure SetBevelOuter(const Value: TBevelCut);
    procedure SetBorderStyle(const Value: TBorderStyle);
    procedure SetColor(const Value: TColor);
    procedure SetParentColor(Value: Boolean);
    function GetParentPopupMenu: Boolean;
    procedure SetParentPopupMenu(const Value: Boolean);
    procedure SetVertSizing(const Value: Boolean);
    procedure SetMinHeight(const Value: Integer);
    procedure SetMaxHeight(const Value: Integer);
    procedure SetSizingBarHeight(const Value: Integer);
    procedure SetSizingBarBeveled(const Value: Boolean);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    procedure Assign(Source: TPersistent); override;
    property Visible: Boolean read FVisible write SetVisible;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Width: Integer read FWidth write SetWidth default 0;
    property Height: Integer read FHeight write SetHeight default 120;
    property ActiveControl: TWinControl read FActiveControl write SetActiveControl;

    property BevelEdges: TBevelEdges read FBevelEdges write SetBevelEdges default [beLeft, beTop, beRight, beBottom];
    property BevelInner: TBevelCut read FBevelInner write SetBevelInner default bvRaised;
    property BevelOuter: TBevelCut read FBevelOuter write SetBevelOuter default bvLowered;
    property BevelKind: TBevelKind read FBevelKind write SetBevelKind default bkNone;
    property BevelWidth: TBevelWidth read FBevelWidth write SetBevelWidth default 1;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property ParentColor: Boolean read FParentColor write SetParentColor default False;
    property ParentPopupMenu: Boolean read GetParentPopupMenu write SetParentPopupMenu default True;

    property VertSizing: Boolean read FVertSizing write SetVertSizing default False;
    property MinHeight: Integer read FMinHeight write SetMinHeight default 1;
    property MaxHeight: Integer read FMaxHeight write SetMaxHeight default 0;
    property SizingBarBeveled: Boolean read FSizingBarBeveled write SetSizingBarBeveled default True;
    property SizingBarHeight: Integer read FSizingBarHeight write SetSizingBarHeight default 8;

  end;

{ TRowDetailPanelControlEh }

  TRowDetailPanelControlEh = class(TScrollingWinControl)
  private
    FBorderStyle: TBorderStyle;
    FParentPopupMenu: Boolean;
    FVertSizing: Boolean;
    FDownGlobPos: TPoint;
    FRowDetailPanelHeight: Integer;
    FSizeArea: Boolean;
    FYDelta: Integer;
    FHitTest: TPoint;
    FCanvas: TCanvas;
    FSizingBarHeight: Integer;
    FSizingBarBeveled: Boolean;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;

    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Message: TWMNCLButtonUp); message WM_NCLBUTTONUP;
    procedure WMNCMouseMove(var Message: TWMNCMouseMove); message WM_NCMOUSEMOVE;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;

    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetVertSizing(const Value: Boolean);
    procedure SetSizingBarHeight(const Value: Integer);
    procedure SetSizingBarBeveled(const Value: Boolean);
  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DrawSizingBar;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DefaultHandler(var Message); override;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property ParentPopupMenu: Boolean read FParentPopupMenu write FParentPopupMenu default True;
    property VertSizing: Boolean read FVertSizing write SetVertSizing default False;
    property Canvas: TCanvas read FCanvas;
    property SizingBarHeight: Integer read FSizingBarHeight write SetSizingBarHeight default 8;
    property SizingBarBeveled: Boolean read FSizingBarBeveled write SetSizingBarBeveled default True;
  published
    property Left stored False;
    property Top stored False;
    property Width stored False;
    property Height stored False;
  end;

  TGridRowPanelTabNavigationTypeEh = (rpntUpToDownPriorityEh, rpntLeftToRightPriorityEh);
  TGridRowPanelNavKeysNavigationTypeEh = (rpntRowToRowEh, rpntCellToCellEh);

{ TGridRowPanelEh }

  TGridRowPanelEh = class(TPersistent)
  private
    FActive: Boolean;
    FGrid: TCustomDBGridEh;
    FNavKeysNavigationType: TGridRowPanelNavKeysNavigationTypeEh;
    FTabNavigationType: TGridRowPanelTabNavigationTypeEh;
    procedure SetActive(const Value: Boolean);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    procedure Assign(Source: TPersistent); override;
  published
    property Active: Boolean read FActive write SetActive default False;
    property NavKeysNavigationType: TGridRowPanelNavKeysNavigationTypeEh read FNavKeysNavigationType write FNavKeysNavigationType default rpntRowToRowEh;
    property TabNavigationType: TGridRowPanelTabNavigationTypeEh read FTabNavigationType write FTabNavigationType default rpntUpToDownPriorityEh;
  end;

{ TGroupRowParamsEh }

  TGroupRowParamsEh = class(TObject)
  private
    FColor: TColor;
    FFont: TFont;
    FImageIndex: Integer;
    FImageList: TCustomImageList;
    FGroupRowText: String;
    FState: TGridDrawState;
  public
    property Color: TColor read FColor write FColor;
    property Font: TFont read FFont;
    property Images: TCustomImageList read FImageList write FImageList;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
    property GroupRowText: String read FGroupRowText write FGroupRowText;
    property State: TGridDrawState read FState;
  end;

  TDBGridEhDataGroupGetGroupRowParamsEvent = procedure(Sender: TCustomDBGridEh;
    GroupDataTreeNode: TGroupDataTreeNodeEh; Params: TGroupRowParamsEh) of object;

{ TGroupFooterParamsEh }

  TGroupFooterParamsEh = class(TObject)
  private
    FColor: TColor;
    FFont: TFont;
    FText: String;
    FValue: Variant;
    FState: TGridDrawState;
  public
    property Color: TColor read FColor write FColor;
    property Font: TFont read FFont;
    property Value: Variant read FValue;
    property Text: String read FText write FText;
    property State: TGridDrawState read FState;
  end;

  TDBGridEhDataGroupGetGroupFooterParamsEvent = procedure(Sender: TCustomDBGridEh;
    GroupDataTreeNode: TGroupDataTreeNodeEh;
    FooterColumnItem: TGridDataGroupFooterColumnItemEh;
    Params: TGroupFooterParamsEh) of object;

  { TDBGridEhDataGroupLevelEh }

  TDBGridEhDataGroupGetKeyValueEvent = procedure(Sender: TCustomDBGridEh;
    GroupLevel: TDBGridEhDataGroupLevelEh; var KeyValue: Variant) of object;

  TDBGridEhDataGroupGetGroupRowTextEvent = procedure(Sender: TCustomDBGridEh;
    GroupDataTreeNode: TGroupDataTreeNodeEh; var GroupRowText: String) of object;

  TDBGridEhDataGroupLevelEh = class(TGridDataGroupLevelEh)
  private
    FLoadingColumnName: String;
    FOnGetKeyValue: TDBGridEhDataGroupGetKeyValueEvent;
    FOnGetGroupRowText: TDBGridEhDataGroupGetGroupRowTextEvent;
    FOnGetKeyValueAsText: TDBGridEhDataGroupGetKeyValueAsTextEvent;
    function GetColumn: TColumnEh;
    function GetColumnName: String;
    procedure SetColumn(const Value: TColumnEh);
    procedure SetColumnName(const Value: String);
  protected
    procedure DrawFormatChanged; override;
  public
    function GetKeyValue: Variant; override;
    function GetKeyValueAsText(GroupDataTreeNode: TGroupDataTreeNodeEh): String; override;
    function GetGroupRowText(GroupDataTreeNode: TGroupDataTreeNodeEh): String; override;
    procedure Assign(Source: TPersistent); override;
    property Column: TColumnEh read GetColumn write SetColumn;
  published
    property Color;
    property ColumnName: String read GetColumnName write SetColumnName;
    property Font;
    property ParentColor;
    property ParentFont;
    property SortOrder;

{    property Footers;
    property FooterInGroupRow;
    property FooterInGroupRowStored;
}
    property RowHeight;
    property RowHeightStored;
    property RowLines;
    property RowLinesStored;

    property OnGetKeyValue: TDBGridEhDataGroupGetKeyValueEvent read FOnGetKeyValue write FOnGetKeyValue;
    property OnGetKeyValueAsText: TDBGridEhDataGroupGetKeyValueAsTextEvent read FOnGetKeyValueAsText write FOnGetKeyValueAsText;
    property OnGetGroupRowText: TDBGridEhDataGroupGetGroupRowTextEvent read FOnGetGroupRowText write FOnGetGroupRowText;
  end;

{ TDBGridEhGroupingPanelEh }

  TDBGridEhGroupingPanelEh = class(TPersistent)
  private
    FDataGroups: TDBGridEhDataGroupsEh;
    FColor: TColor;
    procedure SetColor(const Value: TColor);
  public
    constructor Create(ADataGroups: TDBGridEhDataGroupsEh);
    function GetColor: TColor; virtual;
    property DataGroups: TDBGridEhDataGroupsEh read FDataGroups;
  published
    property Color: TColor read FColor write SetColor default clDefault;
  end;

{ TDBGridEhDataGroupsEh }

  TDBGridEhDataGroupsEh = class(TGridDataGroupsEh)
  private
    FGroupPanel: TDBGridEhGroupingPanelEh;
    FTop: Integer;
    function GetGrid: TCustomDBGridEh;
    procedure SetGroupPanel(const Value: TDBGridEhGroupingPanelEh);
    function GetCurDataNode: TGroupDataTreeNodeEh;
  protected
    FHotTrackGroupLevelIdx: Integer;
    function CreateGroupLevels: TGridDataGroupLevelsEh; override;
    function DefaultFooterColor: TColor; override;
    function DefaultFooterFont: TFont; override;
    procedure ActiveChanged; override;
    procedure ActiveGroupingStructChanged; override;
    procedure ColumnDeleting(Item: TColumnEh); virtual;
    procedure ResetGroupLevelNames;
    procedure RebuildActiveGroupLevels; override;
    procedure ResortActiveLevel(LevelIndex: Integer; SortOrder: TSortOrderEh); override;
    procedure DrawFormatChanged; override;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function IsGroupingWorks: Boolean; override;
    function IsGroupingWorksWithLevel: Boolean;
    property Grid: TCustomDBGridEh read GetGrid;
    property Top: Integer read FTop;
    property CurDataNode: TGroupDataTreeNodeEh read GetCurDataNode;
  published
    property GroupPanel: TDBGridEhGroupingPanelEh read FGroupPanel write SetGroupPanel;
  end;

{ TDBGridLineParamsEh }

  TDBGridLineParamsEh = class(TDBAxisGridLineParamsEh)
  private
    function GetGrid: TCustomDBGridEh;

  protected
    function DefaultDataHorzLines: Boolean; override;
    function DefaultDataVertLines: Boolean; override;
    procedure SetVertEmptySpaceStyle(const Value: TDrawEmptySpaceStyle); override;

    property Grid: TCustomDBGridEh read GetGrid;

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

{ TGridHighlightTextParamsEh }

  TGridHighlightTextParamsEh = class(TPersistent)
  private
    FCaseInsensitivity: Boolean;
    FText: String;
    FColor: TColor;
    FColumnsList: TColumnsEhList;
    procedure SetColumnsList(const Value: TColumnsEhList);
  public
    constructor Create;
    destructor Destroy; override;
    property Text: String read FText write FText;
    property CaseInsensitivity: Boolean read FCaseInsensitivity write FCaseInsensitivity;
    property ColumnsList: TColumnsEhList read FColumnsList write SetColumnsList; //Empty for All columns
    property Color: TColor read FColor write FColor;
  end;

  TDBGridEhRowIndicatorTypeEh =
   (giNormalArrowEh, giSelectedArrowEh, giEditEh, giInsertEh, giInplaceSearch);

  THorzCellAreaTypeEh = (hctIndicatorEh, hctDataEh);
//  THorzCellAreaTypeEh = (hctIndicatorEh, hctFrozenEh, hctDataEh, hctContraEh);
  TVertCellAreaTypeEh = (vctTitleEh, vctSubTitleEh, vctDataEh, vctAboveFooterEh, vctFooterEh);
  TCellAreaTypeEh = record
    HorzType: THorzCellAreaTypeEh;
    VertType: TVertCellAreaTypeEh;
  end;

  TDBGirdDrawFixedStateEh = record
    Pressed: Boolean;
    Selected: Boolean;
    HotTrack: Boolean;
    The3DRect: Boolean;
    FillStyle: TGridCellFillStyleEh;
    FillColor: TColor;
    StartGradientColor: TColor;
    EndGradientColor: TColor;
    DrawByThemesOverLines: Boolean;
    FontColor: TColor;
    VertBorderInFillStyle: Boolean;
    HorzBorderInFillStyle: Boolean;
    HorzLineColor: TColor;
    VertLineColor: TColor;
    ClipRect: TRect;
  end;

  TDBGirdDrawTitleStateEh = record
    Down: Boolean;
    MultyTitle: Boolean;
    WordWrap: Boolean;
    FilterButtonDown: Boolean;
    Highlight: Boolean;
    Orientation: TTextOrientationEh;
    The3DRect: Boolean;
    DrawByThemes: Boolean;
    DrawByThemesOverLines: Boolean;
    Caption: String;
    BackColor: TColor;
    DrawFilterButton: Boolean;
    CellMultiSelected: Boolean;
    SortMarker: TSortMarkerEh;
    DrawSortIndex: Boolean;
    FontCharset: TFontCharset;
    FontColor: TColor;
//    FontSize: Integer;
    FontHeight: Integer;
    FontName: TFontName;
    FontStyle: TFontStyles;
    VertBorderInFillStyle: Boolean;
    HorzBorderInFillStyle: Boolean;
  end;

  TDBGridEhOption = (dghFixed3D, dghFrozen3D, dghFooter3D, dghData3D,
    dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection,
    dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking,
    dghEnterAsTab, dghTraceColSizing, dghIncSearch, dghPreferIncSearch,
    dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghRecordMoving,
    dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight,
    dghHotTrack, dghExtendVertLines);
  TDBGridEhOptions = set of TDBGridEhOption;

  TDBGridEhIndicatorOption = (gioShowRowIndicatorEh,
    gioShowRecNoEh, gioShowRowselCheckboxesEh);
  TDBGridEhIndicatorOptions = set of TDBGridEhIndicatorOption;

  TDBGridEhState = (dgsNormal, dgsRowSelecting, dgsColSelecting, dgsRectSelecting,
    dgsPosTracing, dgsTitleDown, dgsColSizing, dgsRowMoving,
    dgsTitleFilterButtonDown, dgsGroupPanelTitleMoving, dgsGroupPanelTitleDown);

  TDBGridEhEditAction = (geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh);
  TDBGridEhEditActions = set of TDBGridEhEditAction;

  TEditButtonsShowOptionEh = (sebShowOnlyForCurCellEh,
    sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh);
  TEditButtonsShowOptionsEh = set of TEditButtonsShowOptionEh;

//  TInpsDirectionEh = (inpsFromFirstEh, inpsToNextEh, inpsToPriorEh);

  TDBGridEhClickEvent = procedure(Column: TColumnEh) of object;
  TDrawFooterCellEvent = procedure(Sender: TObject; DataCol, Row: Longint;
    Column: TColumnEh; Rect: TRect; State: TGridDrawState) of object;
  TGetFooterParamsEvent = procedure(Sender: TObject; DataCol, Row: Longint;
    Column: TColumnEh; AFont: TFont; var Background: TColor;
    var Alignment: TAlignment; State: TGridDrawState; var Text: String) of object;

  TGetBtnEhParamsEvent = procedure(Sender: TObject; Column: TColumnEh;
    AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
    IsDown: Boolean) of object;

  TGetDBGridEhRowHeightEvent = procedure(Sender: TObject;
    var RowHeight: Integer) of object;

  TDBGridEhRowDetailPanelHideEvent = procedure(Sender: TCustomDBGridEh; var CanHide: Boolean) of object;
  TDBGridEhRowDetailPanelShowEvent = procedure(Sender: TCustomDBGridEh; var CanShow: Boolean) of object;
  TDBGridEhCheckRowHaveDetailPanelEvent = procedure(Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean) of object;
  TDBGridEhNotifyEvent = procedure(Sender: TCustomDBGridEh) of object;

{ TDBGridFooterParamsEh }

  TDBGridFooterParamsEh = class(TPersistent)
  private
    FColor: TColor;
    FFillStyle: TGridCellFillStyleEh;
    FFont: TFont;
    FGrid: TCustomDBGridEh;
    FHorzLineColor: TColor;
    FParentFont: Boolean;
    FRowHeight: Integer;
    FRowLines: Integer;
    FVertLineColor: TColor;
    FHorzLines: Boolean;
    FHorzLinesStored: Boolean;
    FVertLines: Boolean;
    FVertLinesStored: Boolean;
    function DefaultFont: TFont;
    procedure FontChanged(Sender: TObject);
    procedure RefreshDefaultFont;
    procedure SetColor(const Value: TColor);
    procedure SetFillStyle(const Value: TGridCellFillStyleEh);
    procedure SetFont(const Value: TFont);
    procedure SetHorzLineColor(const Value: TColor);
    procedure SetParentFont(const Value: Boolean);
    procedure SetRowHeight(const Value: Integer);
    procedure SetRowLines(const Value: Integer);
    procedure SetVertLineColor(const Value: TColor);
    function IsFontStored: Boolean;
    function DefaultHorzLines: Boolean;
    function DefaultVertLines: Boolean;
    function GetHorzLines: Boolean;
    function GetVertLines: Boolean;
    function IsHorzLinesStored: Boolean;
    function IsVertLinesStored: Boolean;
    procedure SetHorzLines(const Value: Boolean);
    procedure SetHorzLinesStored(const Value: Boolean);
    procedure SetVertLines(const Value: Boolean);
    procedure SetVertLinesStored(const Value: Boolean);
  protected
    FCalculatedRowHeights: array of Integer;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function GetVertLineColor: TColor; virtual;
    function GetHorzLineColor: TColor; virtual;
    function DefaultHorzLineColor: TColor; virtual;
    function DefaultVertLineColor: TColor; virtual;
    function GetColor: TColor; virtual;
    function GetActualFillStyle: TGridCellFillStyleEh; virtual;
    property Grid: TCustomDBGridEh read FGrid;
  published
    property Color: TColor read FColor write SetColor default clDefault;
    property FillStyle: TGridCellFillStyleEh read FFillStyle write SetFillStyle default cfstDefaultEh;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;

    property RowHeight: Integer read FRowHeight write SetRowHeight default 0;
    property RowLines: Integer read FRowLines write SetRowLines default 0;

    property HorzLineColor: TColor read FHorzLineColor write SetHorzLineColor default clDefault;
    property HorzLines: Boolean read GetHorzLines write SetHorzLines stored IsHorzLinesStored;
    property HorzLinesStored: Boolean read IsHorzLinesStored write SetHorzLinesStored stored False;

    property VertLineColor: TColor read FVertLineColor write SetVertLineColor default clDefault;
    property VertLines: Boolean read GetVertLines write SetVertLines stored IsVertLinesStored;
    property VertLinesStored: Boolean read IsVertLinesStored write SetVertLinesStored stored False;

  end;

{ TDBGridIndicatorParamsEh }

  TDBGridIndicatorParamsEh = class(TPersistent)
  private
    FGrid: TCustomDBGridEh;
    FColor: TColor;
    FHorzLineColor: TColor;
    FVertLineColor: TColor;
    FFillStyle: TGridCellFillStyleEh;
    FColorStored:  Boolean;
    FHorzLines: Boolean;
    FHorzLinesStored: Boolean;
    FVertLines: Boolean;
    FVertLinesStored: Boolean;
    FRecNoShowStep: Integer;
    function GetColor: TColor;
    function DefaultColor: TColor;
    function IsColorStored: Boolean;
    procedure SetColor(const Value: TColor);
    procedure SetColorStored(const Value: Boolean);
    procedure SetHorzLineColor(const Value: TColor);
    procedure SetVertLineColor(const Value: TColor);
    procedure SetFillStyle(const Value: TGridCellFillStyleEh);
    function DefaultHorzLines: Boolean;
    function DefaultVertLines: Boolean;
    function GetHorzLines: Boolean;
    function GetVertLines: Boolean;
    function IsHorzLinesStored: Boolean;
    function IsVertLinesStored: Boolean;
    procedure SetHorzLines(const Value: Boolean);
    procedure SetHorzLinesStored(const Value: Boolean);
    procedure SetVertLines(const Value: Boolean);
    procedure SetVertLinesStored(const Value: Boolean);
    procedure SetRecNoShowStep(const Value: Integer);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function GetVertLineColor: TColor; virtual;
    function GetHorzLineColor: TColor; virtual;
    function DefaultHorzLineColor: TColor; virtual;
    function DefaultVertLineColor: TColor; virtual;
    function GetActualFillStyle: TGridCellFillStyleEh; virtual;
    property Grid: TCustomDBGridEh read FGrid;
  published
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property ColorStored: Boolean read IsColorStored write SetColorStored stored False;

    property HorzLineColor: TColor read FHorzLineColor write SetHorzLineColor default clDefault;
    property HorzLines: Boolean read GetHorzLines write SetHorzLines stored IsHorzLinesStored;
    property HorzLinesStored: Boolean read IsHorzLinesStored write SetHorzLinesStored stored False;

    property VertLineColor: TColor read FVertLineColor write SetVertLineColor default clDefault;
    property VertLines: Boolean read GetVertLines write SetVertLines stored IsVertLinesStored;
    property VertLinesStored: Boolean read IsVertLinesStored write SetVertLinesStored stored False;

    property FillStyle: TGridCellFillStyleEh read FFillStyle write SetFillStyle default cfstDefaultEh;
    property RecNoShowStep: Integer read FRecNoShowStep write SetRecNoShowStep default 1;
  end;

{ TDBGridTitleParamsEh }

  TDBGridTitleParamsEh = class(TPersistent)
  private
    FGrid: TCustomDBGridEh;
    FVTitleMargin: Integer;
    FImages: TCustomImageList;
    FColor: TColor;
    FSecondColor: TColor;
    FColorStored: Boolean;
    FSecondColorStored: Boolean;
    FRowLines: Integer;
    FFont: TFont;
    FRowHeight: Integer;
    FMultiTitle: Boolean;
    FParentFont: Boolean;
    FPopupMenu: TPopupMenu;
    FSortMarkerStyle: TSortMarkerStyleEh;
    FSortMarkerStyleStored: Boolean;
    FHorzLineColor: TColor;
    FVertLineColor: TColor;
    FFillStyle: TGridCellFillStyleEh;
    FBorderInFillStyle: Boolean;
    FHorzLines: Boolean;
    FHorzLinesStored: Boolean;
    FVertLines: Boolean;
    FVertLinesStored: Boolean;

    function DefaultColor: TColor;
    function DefaultSortMarkerStyle: TSortMarkerStyleEh;
    function GetColor: TColor;
    function GetSortMarkerStyle: TSortMarkerStyleEh;
    function IsColorStored: Boolean;
    function IsSortMarkerStyleStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetColor(const Value: TColor);
    procedure SetColorStored(const Value: Boolean);
    procedure SetFont(const Value: TFont);
    procedure SetImages(const Value: TCustomImageList);
//    procedure SetLineColor(const Value: TColor);
    procedure SetMultiTitle(const Value: Boolean);
    procedure SetParentFont(const Value: Boolean);
    procedure SetPopupMenu(Value: TPopupMenu);
    procedure SetRowHeight(const Value: Integer);
    procedure SetRowLines(const Value: Integer);
    procedure SetSortMarkerStyle(const Value: TSortMarkerStyleEh);
    procedure SetSortMarkerStyleStored(const Value: Boolean);
    procedure SetVTitleMargin(const Value: Integer);
    procedure SetVertLineColor(const Value: TColor);
    procedure SetHorzLineColor(const Value: TColor);
    procedure SetFillStyle(const Value: TGridCellFillStyleEh);
    function IsFontStored: Boolean;
    procedure SetBorderInFillStyle(const Value: Boolean);
    function DefaultHorzLines: Boolean;
    function GetHorzLines: Boolean;
    function GetVertLines: Boolean;
    function IsHorzLinesStored: Boolean;
    function IsVertLinesStored: Boolean;
    procedure SetHorzLines(const Value: Boolean);
    procedure SetHorzLinesStored(const Value: Boolean);
    procedure SetVertLines(const Value: Boolean);
    procedure SetVertLinesStored(const Value: Boolean);
    function DefaultVertLines: Boolean;
    function GetSecondColor: TColor;
    function IsSecondColorStored: Boolean;
    procedure SetSecondColor(const Value: TColor);
    procedure SetSecondColorStored(const Value: Boolean);
  protected
    procedure RefreshDefaultFont;
    function DefaultFont: TFont;
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
//    function GetLineColor: TColor; virtual;
    function GetVertLineColor: TColor; virtual;
    function GetHorzLineColor: TColor; virtual;
    function DefaultHorzLineColor: TColor; virtual;
    function DefaultVertLineColor: TColor; virtual;
    function GetActualFillStyle: TGridCellFillStyleEh; virtual;
    function DefaultSecondColor: TColor; virtual;
    property Grid: TCustomDBGridEh read FGrid;
  published
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property ColorStored: Boolean read IsColorStored write SetColorStored stored False;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;
    property PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;

    property SecondColor: TColor read GetSecondColor write SetSecondColor stored IsSecondColorStored;
    property SecondColorStored: Boolean read IsSecondColorStored write SetSecondColorStored stored False;

    property Images: TCustomImageList read FImages write SetImages;
    property MultiTitle: Boolean read FMultiTitle write SetMultiTitle default False;
    property RowHeight: Integer read FRowHeight write SetRowHeight default 0;
    property RowLines: Integer read FRowLines write SetRowLines default 0;
    property SortMarkerStyle: TSortMarkerStyleEh read GetSortMarkerStyle write SetSortMarkerStyle stored IsSortMarkerStyleStored;
    property SortMarkerStyleStored: Boolean read IsSortMarkerStyleStored write SetSortMarkerStyleStored stored False;
    property VTitleMargin: Integer read FVTitleMargin write SetVTitleMargin default 10;

    property VertLineColor: TColor read FVertLineColor write SetVertLineColor default clDefault;
    property VertLines: Boolean read GetVertLines write SetVertLines stored IsVertLinesStored;
    property VertLinesStored: Boolean read IsVertLinesStored write SetVertLinesStored stored False;

    property HorzLineColor: TColor read FHorzLineColor write SetHorzLineColor default clDefault;
    property HorzLines: Boolean read GetHorzLines write SetHorzLines stored IsHorzLinesStored;
    property HorzLinesStored: Boolean read IsHorzLinesStored write SetHorzLinesStored stored False;

    property FillStyle: TGridCellFillStyleEh read FFillStyle write SetFillStyle default cfstDefaultEh;
    property BorderInFillStyle: Boolean read FBorderInFillStyle write SetBorderInFillStyle default False;
  end;

{ TGridTreeViewParamsEh }

  TGridTreeViewParamsEh = class(TPersistent)
  private
    FGrid: TCustomDBGridEh;
    FGlyphStyle: TTreeViewGlyphStyleEh;
    FShowTreeLines: Boolean;
    procedure SetGlyphStyle(const Value: TTreeViewGlyphStyleEh);
    procedure SetShowTreeLines(const Value: Boolean);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function GetActualGlyphStyle: TTreeViewGlyphStyleEh;
    property Grid: TCustomDBGridEh read FGrid;
  published
    property GlyphStyle: TTreeViewGlyphStyleEh read FGlyphStyle write SetGlyphStyle default tvgsDefaultEh;
    property ShowTreeLines: Boolean read FShowTreeLines write SetShowTreeLines default True;
  end;

{ TGridEmptyDataInfoEh }

  TGridEmptyDataInfoEh = class(TPersistent)
  private
    FActive: Boolean;
    FFont: TFont;
    FGrid: TCustomDBGridEh;
    FParentFont: Boolean;
    FText: String;
    function DefaultFont: TFont;
    function GetText : String;
    function IsFontStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetActive(const Value: Boolean);
    procedure SetFont(const Value: TFont);
    procedure SetParentFont(const Value: Boolean);
    procedure SetText(const Value: String);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function Showing: Boolean;
    procedure PaintEmptyDataInfo;
    procedure RefreshDefaultFont;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Font: TFont read FFont write SetFont stored IsFontStored;
    property ParentFont: Boolean read FParentFont write SetParentFont default True;
    property Text: String read FText write SetText;
  end;

 { TDBGridBackgroundDataEh }

  TDBGridBackgroundDataEh = class(TGridBackgroundDataEh)
  private
    FExcludeIndicator: Boolean;
    FExcludeTitle: Boolean;
    FExcludeFooter: Boolean;
    procedure SetExcludeFooter(const Value: Boolean);
    procedure SetExcludeIndicator(const Value: Boolean);
    procedure SetExcludeTitle(const Value: Boolean);
  public
    function BoundRect(var DrawInfo: TGridDrawInfoEh): TRect; override;
  published
    property ExcludeTitle: Boolean read FExcludeTitle write SetExcludeTitle default False;
    property ExcludeIndicator: Boolean read FExcludeIndicator write SetExcludeIndicator default False;
    property ExcludeFooter: Boolean read FExcludeFooter write SetExcludeFooter default False;
  end;

{ TDBGridSearchPanelEh }

  TDBGridSearchPanelEh = class(TPersistent)
  private
    FVisible: Boolean;
    FGrid: TCustomDBGridEh;
    FShortCut: TShortCut;
    FEnabled: Boolean;
    FPersistentShowing: Boolean;
    FLocation: TSearchPanelLocationEh;
    FSearchingText: String;
    FActive: Boolean;
    FFilterOnTyping: Boolean;
    FFilterEnabled: Boolean;
    FFoundColumnIndex: Integer;
    procedure SetVisible(const Value: Boolean);
    function GetActive: Boolean;
    procedure SetPersistentShowing(const Value: Boolean);
    procedure SetLocation(const Value: TSearchPanelLocationEh);
    procedure SetEnabled(const Value: Boolean);
    procedure SetSearchingText(const Value: String);
    procedure SetFilterEnabled(const Value: Boolean);
    procedure SetFoundColumnIndex(const Value: Integer);
  protected
    procedure SetActive(const Value: Boolean);
    procedure InterSetSearchingText(const Value: String);
  public
    constructor Create(AGrid: TCustomDBGridEh);
    destructor Destroy; override;
    function InGridVertCaptureSize: Integer;
    property Active: Boolean read GetActive write SetActive default False;
    property Visible: Boolean read FVisible write SetVisible default False;
    property SearchingText: String read FSearchingText write SetSearchingText;
    property FoundColumnIndex: Integer read FFoundColumnIndex write SetFoundColumnIndex;
    property Grid: TCustomDBGridEh read FGrid;
    procedure FindNext;
    procedure FindPrev;
    procedure RestartFind;
    procedure ApplySearchFilter;
    procedure CancelSearchFilter;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property PersistentShowing: Boolean read FPersistentShowing write SetPersistentShowing default True;
    property ShortCut: TShortCut read FShortCut write FShortCut default 16454; // Ctrl+F
    property Location: TSearchPanelLocationEh read FLocation write SetLocation default splGridTopEh;
    property FilterOnTyping: Boolean read FFilterOnTyping write FFilterOnTyping default False;
    property FilterEnabled: Boolean read FFilterEnabled write SetFilterEnabled default True;
  end;


{ TCustomDBGridEh }

  TCustomDBGridEh = class(TCustomDBAxisGridEh, IMTEventReceiverEh)
  private
    FAllowedSelections: TDBGridEhAllowedSelections;
    FAutoDrag, FSelectedCellPressed: Boolean;
    FBookmarks: TBookmarkListEh;
    FCenter: TDBGridEhCenter;
    FCompleteKeyPress: String;
    FEditActions: TDBGridEhEditActions;
    FHorzScrollBar: THorzDBGridEhScrollBar;
    FInColExit: Boolean;
    FIndicatorTitle: TDBGridEhIndicatorTitle;
    FOnAdvDrawDataCell: TDBGridEhAdvDrawColumnDataEvent;
    FOnBuildIndicatorTitleMenu: TDBGridEhBuildIndicatorTitleMenu;
    FOnCellClick: TDBGridEhClickEvent;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnColumnMoved: TMovedEvent;
    FOnColWidthsChanged: TNotifyEvent;
    FOnDataGroupGetRowText: TDBGridEhDataGroupGetGroupRowTextEvent;
    FOnDataGroupGetRowParams: TDBGridEhDataGroupGetGroupRowParamsEvent;
    FOnDataGroupGetFooterParams: TDBGridEhDataGroupGetGroupFooterParamsEvent;
    FOnDataHintShow: TDBGridEhDataHintShowEvent;
    FOnDrawColumnCell: TDrawColumnEhCellEvent;
    FOnDrawDataCell: TDrawDataCellEvent;

    FOnGetCellParams: TGetCellEhParamsEvent;
    FOnGetFooterParams: TGetFooterParamsEvent;
    FOnHintShowPause: TDBGridEhHintShowPauseEvent;
    FOnIndicatorTitleMouseDown: TGridEhCellMouseEvent;
    FOnSelectionChanged: TNotifyEvent;
    FOnSortMarkingChanged: TNotifyEvent;
    FOnSumListAfterRecalcAll: TNotifyEvent;
    FOnSumListRecalcAll: TNotifyEvent;
    FOnTitleClick: TDBGridEhClickEvent;
    FOptions: TDBGridOptions;
    FOptionsEh: TDBGridEhOptions;
    FIndicatorOptions: TDBGridEhIndicatorOptions;
    FSelecting: Boolean;
    FSelection: TDBGridEhSelection;
    FSelectionAnchor: TUniBookmarkEh;
    FSelfChangingFooterFont: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelRow: Integer;
    FSortLocal: Boolean;
    FSortMarking: Boolean;
    FStyle: TDBGridEhStyle;
    FSumListRecalcing: Boolean;
    FThumbTracked: Boolean;
    FTitleImageChangeLink: TChangeLink;
    FTitleOffset: Byte;
    FIndicatorOffset: Byte;
    FTopLeftVisible: Boolean;
    FVertScrollBar: TVertDBGridEhScrollBar;

    FOldActiveRecord: Integer;
    FLockAutoShowCurCell: Boolean;
    FFetchingRecords: Boolean;
    FTryUseMemTableInt: Boolean;

    FSTFilter: TSTDBGridEhFilter;
    FFilterCol: Integer;
    FFilterEditMode: Boolean;
    FFilterEdit: TCustomDBEditEh;
    FOnApplyFilter: TNotifyEvent;
    FSizeChanged: Boolean;
    FEvenRowColorStored: Boolean;
    FOddRowColorStored: Boolean;
    FEvenRowColor: TColor;
    FOddRowColor: TColor;
    FContraColCount: Integer;
    FRecNoTextWidth: Integer;
    FOnGetRowHeight: TGetDBGridEhRowHeightEvent;
    FEditButtonsShowOptions: TEditButtonsShowOptionsEh;

    FGridRowPanel: TGridRowPanelEh;
    FInRowPanelCol: Integer;
    FDSMouseCapture: Boolean;

    FRowDetailPanel: TRowDetailPanelEh;
    FOnRowDetailPanelHide: TDBGridEhRowDetailPanelHideEvent;
    FOnRowDetailPanelShow: TDBGridEhRowDetailPanelShowEvent;
    FOnCheckRowHaveDetailPanel: TDBGridEhCheckRowHaveDetailPanelEvent;
    FOnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent;

    FDataGrouping: TDBGridEhDataGroupsEh;
    FInstantReadDataNodes: TList;
    FDrawnGroupList: TList;
    FCurGroupDataNode: TGroupDataTreeNodeEh;
    FCurGroupDataListEof: Boolean;
    FCurGroupDataListBof: Boolean;
    FOnActiveGroupingStructChanged: TDBGridEhNotifyEvent;

    FShowingLoadingMode : Boolean;
    FLoadingModeCallCount : Integer;
    FLoadingModeText : String;

    FEmptyDataInfo: TGridEmptyDataInfoEh;
    FTreeViewParams: TGridTreeViewParamsEh;
    FTitleParams: TDBGridTitleParamsEh;
    FIndicatorParams: TDBGridIndicatorParamsEh;
    FFooterParams: TDBGridFooterParamsEh;
    FOnDataGroupFooterFinalizeValue: TGridDataGroupFooterItemFinalizeValueEvent;
    FOnDataGroupFooterAggregateValue: TGridDataGroupFooterItemAggregateValueEvent;
    FOnDataGroupFooterToDisplayText: TGridDataGroupFooterItemToDisplayTextEvent;
    FHighlightTextParamsList: TList;

    FLoadingModeBitmap: TBitmap;

    procedure PaintLoadingMode(RenderDuration: Integer);
    procedure UnpaintLoadingMode(RenderDuration: Integer);

    procedure CheckIMemTable;
    procedure MTUpdateRowCount;
    procedure MTScroll(Distance: Integer);
    function IsCurrentRow(DataRowNum: Integer): Boolean;
    procedure FetchRecordsInView;
    procedure MTUpdateVertScrollBar;
    procedure MTUpdateTopRow;
    procedure MTWMVScroll(ScrollBar, ScrollCode, Pos: Cardinal);

    function GetCol: Longint;
    function GetContraColCount: Longint;
    function GetEvenRowColor: TColor;
    function GetFieldColumns(const FieldName: String): TColumnEh;
    function GetFooterColor: TColor;
    function GetFooterFont: TFont;
    function GetOddRowColor: TColor;
    function GetTopDataOffset: Byte;
    function GetTitleImages: TCustomImageList;
    function GetVTitleMargin: Integer;
    function GetUseMultiTitle: Boolean;
    function IsEvenRowColorStored: Boolean;
    function IsOddRowColorStored: Boolean;
    procedure ChangeGridOrientation(RightToLeftOrientation: Boolean);
    procedure ClearSelection;
    procedure CheckClearSelection;

    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CancelMode;
    procedure CMChanged(var Msg: TCMChanged); message CM_CHANGED;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure CMHintsShowPause(var Message: TCMHintShowPause); message CM_HINTSHOWPAUSE;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure DoSelection(Select: Boolean; Direction: Integer; MaxDirection, RowOnly: Boolean);

    procedure MoveCol(DataCol, Direction: Integer; Select: Boolean);

    procedure SetAllowedSelections(const Value: TDBGridEhAllowedSelections);
    procedure SetCenter(const Value: TDBGridEhCenter);
    procedure SetCol(Value: Longint);
    procedure SetColumnDefValues(const Value: TColumnDefValuesEh);

    procedure SetContraColCount(const Value: Longint);
    procedure SetDataGrouping(Value: TDBGridEhDataGroupsEh);

    procedure SetEmptyDataInfo(const Value: TGridEmptyDataInfoEh);
    procedure SetTreeViewParams(const Value: TGridTreeViewParamsEh);
    procedure SetEvenRowColor(const Value: TColor);
    procedure SetFilterEditMode(const Value: Boolean);
    procedure SetFooterColor(Value: TColor);
    procedure SetFooterFont(Value: TFont);
    procedure SetHorzScrollBar(const Value: THorzDBGridEhScrollBar);

    procedure SetOddRowColor(const Value: TColor);
    procedure SetOptions(Value: TDBGridOptions);
    procedure SetOptionsEh(const Value: TDBGridEhOptions);
    procedure SetIndicatorOptions(const Value: TDBGridEhIndicatorOptions);

    procedure SetEditButtonsShowOptions(Value: TEditButtonsShowOptionsEh);
    procedure SetSTFilter(const Value: TSTDBGridEhFilter);
    procedure SetStyle(const Value: TDBGridEhStyle);
    procedure SetSumList(const Value: TDBGridEhSumList);

    procedure SetTitleImages(const Value: TCustomImageList);
    procedure SetVertScrollBar(const Value: TVertDBGridEhScrollBar);
    procedure TitleImageListChange(Sender: TObject);
    procedure UpdateColumnResizeOptions(NewOptions: TDBGridOptions; NewOptionsEh: TDBGridEhOptions);
    procedure WMCancelMode(var Message: TWMCancelMode); message WM_CANCELMODE;
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KillFocus;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMRButtonDown(var Message: TWMRButtonDown); message WM_RBUTTONDOWN;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SetFOCUS;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMTimer(var Message: TWMTimer); message WM_TIMER;

    procedure SetRowPanel(const Value: TGridRowPanelEh);
    function GetOriginCol(): Integer;
    procedure SetOriginCol(const Value: Integer);
    procedure ResetTabIndexedColumns;

    procedure SetRowDetailPanel(const Value: TRowDetailPanelEh);
    function GetGridLineParams: TDBGridLineParamsEh;
    procedure SetGridLineParams(const Value: TDBGridLineParamsEh);
    procedure SetTitleParams(const Value: TDBGridTitleParamsEh);
    procedure SetIndicatorParams(const Value: TDBGridIndicatorParamsEh);
    procedure SetFooterParams(const Value: TDBGridFooterParamsEh);

    function GetCellColWidths(Index: Integer): Integer;
    procedure SetCellColWidths(Index: Integer; const Value: Integer);
    function GetCellRowHeights(Index: Integer): Integer;
    procedure SetCellRowHeights(Index: Integer; const Value: Integer);
    function GetDefaultRowHeight: Integer;
    procedure SetDefaultRowHeight(const Value: Integer);

    function GetVisibleColumns: TColumnsEhList;
    function GetColumns: TDBGridColumnsEh;
    procedure SetColumns(const Value: TDBGridColumnsEh);

//{$IFDEF EH_LIB_16}
//    class constructor Create;
//{$ENDIF}
  protected

    { IInplaceEditHolderEh }
    function InplaceEditCanModify(Control: TWinControl): Boolean; override;
    procedure GetMouseDownInfo(var Pos: TPoint; var Time: LongInt); override;
    procedure InplaceEditKeyDown(Control: TWinControl; var Key: Word; Shift: TShiftState); override;
    procedure InplaceEditKeyPress(Control: TWinControl; var Key: Char); override;
    procedure InplaceEditKeyUp(Control: TWinControl; var Key: Word; Shift: TShiftState); override;
    procedure InplaceEditWndProc(Control: TWinControl; var Message: TMessage); override;

  protected
    { IMTEventReceiverEh }
    procedure MTViewDataEvent(RowNum: Integer;
      Event: TMTViewEventTypeEh; OldRowNum: Integer);

  protected
    FGridMasterCellHeight: Integer;
    FGridMasterCellWidth: Integer;
    FAntiSelection: Boolean;
    FAutoFitColWidths: Boolean;
    FGroupRowParams: TGroupRowParamsEh;
    FGroupFooterParams: TGroupFooterParamsEh;
    FDataTracking: Boolean;
    FDBGridEhState: TDBGridEhState;
    FDefaultRowChanged: Boolean;
    FFooterRowCount: Integer;
    FFrozenCols: Integer;
    FHeadTree: THeadTreeNode;
    FHTitleMargin: Integer;
    FIndicatorPressed: Boolean;
    FInplaceSearching: Boolean;
    FInplaceSearchingInProcess: Boolean;
    FInplaceSearchText: String;
    FInplaceSearchTimeOut: Integer;
    FInplaceSearchTimerActive: Boolean;
    FLeafFieldArr: PTLeafCol;
    FLockedBookmark: TUniBookmarkEh;
    FLookedOffset: Integer;
    FMinAutoFitWidth: Integer;
    FMouseShift: TShiftState;
    FNewRowHeight: Integer;
    FOnCheckButton: TCheckTitleEhBtnEvent;
    FOnDrawFooterCell: TDrawFooterCellEvent;
    FOnGetBtnParams: TGetBtnEhParamsEvent;
    FOnMoveRecords: TGridMoveRecordsEventEh;
    FOnTitleBtnClick: TTitleEhClickEvent;
    FPressed: Boolean;
    FPressedCol: Longint;
    FPressedDataCol: Longint;
    FPressedDataGroupLevelIdx: Integer;
    FTrackingStateRect: TRect;
    FToMoveColumnIndex: Integer;
    FToMoveInRowLinePos: Integer;
    FDragCellRect: TRect;
    FTopLeftCellOffset: TPoint;
    FRowLines: Integer;
    FRowSizingAllowed: Boolean;
    FSelectionAnchorSelected: Boolean;
    FSortMarkedColumns: TColumnsEhList;
    FSumList: TDBGridEhSumList;
    FTitleHeightFull: Integer;
    FTracking: Boolean;
    FUpdateFields: Boolean;
    FVertScrollBarVisibleMode: TScrollBarVisibleModeEh;
    FMoveRowSour: Integer;  //Index
    FMoveBookmarkSour: TUniBookmarkEh;
    FMoveRowDest: Integer;     //Pos
    FMoveRowSourLevel: Integer;
    FMoveRowDestLevel: Integer;
    FMoveRowLeftBounds: Integer;
    FDataRowMoveLeftBoundary: Integer;
    FDataRowMoveRightBoundary: Integer;
    FDataRowMoveVisible: Boolean;
    FOldTopLeft: TGridCoord;
    FTitleRowHeight: Integer;
    FStdDefaultRowHeight: Integer;
    FStdDefaultTextHeight: Integer;
    FColWidthsChanged: Boolean;
    FInplaceColInRowPanel, FInplaceRow: Longint;
    FStartShiftState: TShiftState;
    FRowDetailControl: TRowDetailPanelControlEh;
    FHotTrackEditButton: Integer;
    FHotTrackMultiTitleOver: Boolean;
    FMouseInTrackRowRect: Boolean;
    FInTitleFilterListbox: TPopupListboxEh;
    FInTitleFilterListboxColumn: TColumnEh;
    FInTitleFilterListboxGroupLevel: TGridDataGroupLevelEh;
    FInTitleFilterListboxVisible: Boolean;
    FExtraFirstColumnWidth: Integer;
    FInternalUpdatingDatasetPos: Boolean;
    FGroupDataMovingIndex: Integer;
    FLastVisibleCol: Integer;
    FRowselCheckboxesWidth: Integer;

    FVertScrollBarPanelControl: TDBGridEhScrollBarPanelControl;
    FHorzScrollBarPanelControl: TDBGridEhScrollBarPanelControl;
    FCornerScrollBarPanelControl: TSizeGripPanelEh;
    FSearchPanelControl: TDBGridSearchPanelControlEh;
    FScrollBarMessage: Boolean;
    FSearchEditorMode: Boolean;
    FSearchFilter: String;
    FFilterObj: TObject;
    FSearchFilterSelection: TDBGridEhSelection;
    FGroupFooterPopupMenu: TPopupMenu;
    FSearchPanel: TDBGridSearchPanelEh;
    FLastDataSet: TDataSet;
    FLastFilterPanelEvent: TFilterRecordEvent;
    FWholeGridChanged: Boolean;
    FSuppressDataSetChanged: Boolean;
    
    function AcquireFocus: Boolean; override;
    function EffectiveGridOptions: TGridOptions;
    function AllowedOperationUpdate: Boolean; override;
    function BeginDataRowDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean; virtual;
    function CalcHeightForTextLines(Font: TFont; RowLines, RowHeight: Integer): Integer;
    function CalcHeightForGroupNode(ADrawGroupDataNode: TGroupDataTreeNodeEh): Integer;
    function CalcLeftMoveLine(ARow: Integer; const MousePt: TPoint; var TreeLevel: Integer): Integer; virtual;
    function CalcRectForGroupCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint): TRect;
    function CalcRowDataRowHeight(DataRowNum: Integer): Integer; virtual;
    function CalcRowForCurRecordHeight: Integer; virtual;
    function CanDrawFocusRowRect: Boolean; virtual;
    function CanEditModify: Boolean; override;
    function CanEditModifyColumn(Index: Integer): Boolean; override;
    function CanEditModifyText: Boolean; override;
    function CanEditorMode: Boolean; override;
    function CanEditShow: Boolean; override;
    function CanFilterCol(DCol: Longint): Boolean;
    function CanFilterEditShow: Boolean; virtual;
    function CanMouseTrackMode: Boolean;
    function CanHotTackCell(X, Y: Integer): Boolean; override;
    function CanSelectType(const Value: TDBGridEhSelectionType): Boolean;
    function CellHave3DRect(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState): Boolean; override;
    function ColumnWidthToCellColWidth(Column: TColumnEh; AWidth: Integer): Integer;
    function CellIsMultiSelected(ACol, ARow: Integer; DataCol: Integer; DataRowBkmrk: TUniBookmarkEh): Boolean; virtual;
    function CellTreeElementMouseDown(MouseX, MouseY: Integer; CheckInOnly: Boolean): Boolean; virtual;
    function CheckBeginRowMoving(MouseX, MouseY: Integer; CheckInOnly: Boolean): Boolean; virtual;
    function CheckCellCanSendDoubleClicks(CellHit: TGridCoord; Button: TMouseButton; ShiftState: TShiftState; MousePos, InCellMousePos: TPoint): Boolean; override;
    function CheckCellFilter(ACol, ARow: Integer; P: TPoint): Boolean;
    function CheckPersistentContraLine(LineType: TGridCellBorderTypeEh): Boolean; override;
    function CheckForDesigntTimeColMoving(X, Y: Integer): Boolean;
    function CheckTitleCellFilterButtonPos(MousePos: TPoint; CellRect: TRect; Column: TColumnEh; var StateRect: TRect): Boolean;
    function ColWidthToCellWidth(Column: TColumnEh; AWidth: Integer): Integer;
    function CreateAxisBarDefValues: TAxisBarDefValuesEh; override;
    function CreateAxisBars: TGridAxisBarsEh; override;
    function CreateEditor: TInplaceEdit; override;
    function CreateFilterEditor: TCustomDBEditEh; virtual;
    function CreateGridLineColors: TGridLineColorsEh; override;
    function CreateScrollBar(AKind: TScrollBarKind): TDBGridEhScrollBar; virtual;
    function DataGroupsMoveBy(Distance: Integer; NewOnEof: Boolean): Integer;
    function DataToRawColumn(ADataCol: Integer): Integer;
    function DataCellSelected(DataCol: Longint; DataRow: TUniBookmarkEh): Boolean;
    function DeletePrompt: Boolean; virtual;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DrawTitleByThemes: Boolean;
    function EndColumnDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean; override;
    function ExtendedScrolling: Boolean; virtual;
    function InstantReadRecordCount: Integer;
    function IsDrawCellByThemes(ACol, ARow: Longint; AreaCol, AreaRow: Longint; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh; Cell3D: Boolean): Boolean; virtual;
    function FrozenSizing(X, Y: Integer): Boolean;
    function GetAutoTitleHeight: Integer;
    function GetCellAreaType(ACol, ARow: Integer; var AreaCol, AreaRow: Integer): TCellAreaTypeEh;
    function GetColField(DataCol: Integer): TField;
    function GetColWidths(Index: Longint): Integer;
    function GetDefaultActualColumnFontColor(Column: TColumnEh; AState: TGridDrawState): TColor; virtual;
    function GetDefaultActualColumnColor(Column: TColumnEh): TColor; virtual;
    function GetEditMask(ACol, ARow: Longint): string; override;
    function GetEditText(ACol, ARow: Longint): string; override;
    function GetFieldValue(ACol: Integer): string;
    function GetDefaultFixedCellFillStyle: TGridCellFillStyleEh; override;
    function GetFilterValue(DCol: Longint): String;
    function GetFooterRowCount: Integer;
    function GetFullFooterRowCount: Integer; virtual;
    function GetInTitleFilterListbox: TPopupListboxEh;
    function GetEditButtonIndexAt(ACol, ARow: Longint; Column: TColumnEh; InCellX, InCellY: Integer): Integer;
    function GetRowHeight: Integer;
    function GetRowLines: Integer;
    function GetSortMarkerStyle: TSortMarkerStyleEh; override;
    function GetSubTitleRowHeights(ASubTitleRow: Integer): Integer;
    function GetSubTitleRows: Integer; virtual;
    function GetTitleRows: Integer; virtual;
    function HaveHideDuplicates: Boolean;
    function HighlightNoDataCellColor(ACol, ARow: Integer; DataCol, DataRow: Integer;
      CellType: TCellAreaTypeEh; AState: TGridDrawState; InMultiSelect: Boolean; var AColor: TColor;
      AFont: TFont): Boolean; virtual;
    function InstantReadCurDataNode: TGroupDataTreeNodeEh;
    function IndicatorColVisible: Boolean; virtual;
    function IsSmoothHorzScroll: Boolean; override;
    function IsSmoothVertScroll: Boolean; override;
    function MoveDataRows(BookmarkList: TBMListEh; ToIndex: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean; virtual;
    function MoveSelectedDataRows(ToIndex: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean; virtual;
    function RawToDataColumn(ACol: Integer): Integer;
    function GetTitleHeight: Integer;
    function GetTitleLines: Integer;
    function RecreateGroupFooterPopupMenu(ADataGroupFooterItem: TGridDataGroupFooterColumnItemEh): TPopupMenu; virtual;
    function ScrollBarOccupiedExtent(BarCode: Word): Integer; override;
    function SetChildTreeHeight(ANode: THeadTreeNode): Integer;
    function Sizing(X, Y: Integer): Boolean; override;
    function CalcStdDefaultRowHeight: Integer;
    function VisibleDataRowCount: Integer;
    procedure BuildIndicatorTitleMenu(var PopupMenu: TPopupMenu);
    procedure CalcFrozenSizingState(X, Y: Integer; var State: TDBGridEhState;
      var Index: Longint; var SizingPos, SizingOfs: Integer);
    procedure CalcSizingState(X, Y: Integer; var State: TGridState;
      var Index: Longint; var SizingPos, SizingOfs: Integer;
      var FixedInfo: TGridDrawInfoEh); override;
    procedure CalcSizingStateForRowPanel(X, Y: Integer; var State: TGridState;
      var Index: Longint; var SizingPos, SizingOfs: Integer;
      var FixedInfo: TGridDrawInfoEh);

    function UpdateOutBoundaryIndents: Boolean; virtual;

    procedure CancelMode; override;
    procedure CellClick(Column: TColumnEh); virtual;
    procedure ChangeScale(M, D: Integer); override;
    procedure CheckDrawCellBorder(ACol, ARow: Integer; BorderType: TGridCellBorderTypeEh; var IsDraw: Boolean; var BorderColor: TColor; var IsExtent: Boolean); override;
    procedure ClampInViewRowPanelCell(DataCol: Integer);
    procedure CheckTitleButton(ACol: Longint; var Enabled: Boolean); virtual;
    procedure CheckSetCurGroupDataNode(ACurGroupDataNode: TGroupDataTreeNodeEh; ShowInView: Boolean);
    procedure ClearPainted(Node: THeadTreeNode);
    procedure ColEnter; virtual;
    procedure ColExit; virtual;
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure ColumnDeleting(Item: TAxisBarEh); override;
    procedure ColWidthsChanged; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DataGroupsGotoRecordViewNo(RecViewNo: Integer; IsExpandToView: Boolean);
    procedure DataChanged; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DoAfterSizeChanged; virtual;
    procedure DoContextPopup(MousePos: TPoint; var Handled: Boolean); override;
    procedure DoSortMarkingChanged; virtual;
    procedure DoTitleClick(ACol: Longint; AColumn: TColumnEh); virtual;
    procedure DrawBorder; override;

    procedure DragGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer);
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure DrawTitleCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawTitleCellState(Column: TColumnEh; ARect: TRect; AState: TGridDrawState; var ATitleState: TDBGirdDrawTitleStateEh); virtual;
    procedure DrawIndicatorCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawDataCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawFooterCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DoDataGroupFooterItemAggregateValue(Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh; FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant; Node: TGroupDataTreeNodeEh; var Processed: Boolean);
    procedure DoDataGroupFooterItemFinalizeValue(Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh; FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant; var Processed: Boolean);
    procedure DoDataGroupFooterItemToDisplayText(Column: TColumnEh; GroupFooter: TGridDataGroupFooterEh; FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant; var DisplayValue: String; var Processed: Boolean);

    procedure DrawEmptySpace(ACol, ARow: Longint; StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh); override;
    procedure DrawEmptySubDataInfo(ACol: Longint; StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh); virtual;
    procedure DrawFocusRect(Canvas: TCanvas; ARect: TRect);
    procedure DrawGroupDataCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawGroupDataArea(ACol, ARow: Longint; DataCol, DataRow: Integer; NodeLevel: Integer; AState: TGridDrawState; var ARect: TRect; Draw3DRect: Boolean; CompleteBottomLines: Boolean); virtual;
    procedure DrawGroupFooterCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawGroupFooterArea(DataCol, DataRow: Integer; NodeLevel: Integer; AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean); virtual;
    procedure DrawCellTreeArea(DataCol, DataRow: Integer; AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean); virtual;
    procedure DrawDataRowMove(LeftBoundary, RightBoundary: Integer);
    procedure DrawTreeArea(Canvas: TCanvas; ARect: TRect; IsDrawEdge: Boolean; IsSubTreeArea: Boolean);
    procedure DrawGridTreeElement(Canvas: TCanvas; ARect: TRect; TreeElement: TTreeElementEh; BackDot: Boolean; ScaleX, ScaleY: Double; RightToLeft: Boolean; Coloured: Boolean; GlyphStyle: TTreeViewGlyphStyleEh);
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState); virtual;
    procedure OldDrawDataCell(const Rect: TRect; Field: TField; State: TGridDrawState); virtual; { obsolete }
    procedure DrawTopOutBoundaryData(ARect: TRect); override;
    procedure DrawTopOutBoundaryGroupCaption(ARect: TRect; GroupLevel: TGridDataGroupLevelEh); virtual;

    procedure DataGroupsVisibleChanged; virtual;
    procedure DrawSubTitleCell(ACol, ARow: Longint; DataCol, DataRow: Integer;
      CellType: TCellAreaTypeEh; ARect: TRect; AState: TGridDrawState; var Highlighted: Boolean); virtual;
    procedure DrawSizingLineEx(HorzGridBoundary, VertGridBoundary: Integer);
    procedure DrawRowIndicator(ACol, ARow: Longint; ARect: TRect; XOffset, YOffset: Integer; IndicatorType: TDBGridEhRowIndicatorTypeEh); virtual;
    procedure DrawIndicatorDropDownSign(ACol, ARow: Longint; ARect: TRect; Selected: Boolean); virtual;
    procedure DrawFilterSign(ARect: TRect; Selected: Boolean); virtual;
    procedure EndRowMoving(MouseX, MouseY: Integer; Accept: Boolean); virtual;
    procedure ExecuteFindDialog(Text, FieldName: String; Modal: Boolean);
    procedure ExpandCellWidthForEmptySpace(ColumnIndex: Integer);
    procedure FilterButtonClick(Sender: TObject; var Handled: Boolean);
    procedure FilterExit(Sender: TObject);
    procedure FlatChanged; override;
    procedure FocusCell(ACol, ARow: Longint; MoveAnchor: Boolean); override;
    procedure GetCellParams(Column: TAxisBarEh; AFont: TFont; var Background: TColor; State: TGridDrawState); override;
    procedure GetGroupMoveLineInfo(X, Y: Integer; var GroupMoveLinePos: TPoint; var GroupMoveLineSize: Integer; var InDataGroupIndex: Integer);

    procedure AncestorNotFound(Reader: TReader; const ComponentName: string; ComponentClass: TPersistentClass; var Component: TComponent);
    procedure CreateComponent(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
    procedure ReadState(Reader: TReader); override;

    procedure GetFooterParams(DataCol, Row: Longint; Column: TColumnEh; AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: String); virtual;
    procedure GetDrawSizingLineBound(const DrawInfo: TGridDrawInfoEh; var StartPos, FinishPos: Integer); override;
    procedure GetGridScrollBarInfo(BarFlag: Integer; var ScrollInfo: TScrollInfo); override;
    procedure GroupFooterPopupMenuClick(Sender: TObject); virtual;
    procedure GroupPanelVisibleChanged;
    procedure GroupPanelTitleUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure HideEditor; override;
    procedure InvalidateEditor; override;
    procedure HideFilterEdit;
    procedure HideDataRowMove;
    procedure IndicatorTitleMouseDown(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure InstantReadRecordEnter(DataRowNum: Integer);
    procedure InstantReadRecordLeave;

    procedure InvalidateSpot(HTSpot: TGridHotTrackSpotEh); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyDownInGroupDataNode(var Key: Word; Shift: TShiftState);
    procedure KeyDownInGroupFooterNode(var Key: Word; Shift: TShiftState);
    procedure LayoutChanged; override;
    procedure LinkActive(Value: Boolean); override;
    procedure Loaded; override;

    procedure ScrollBarMessage(ScrollBar, ScrollCode, Pos: Integer; UseRightToLeft: Boolean); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDownInDataRowPanel(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseDownInTitleRowPanel(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseDownInDataCell(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
    procedure MouseDownInTitleCell(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
    procedure MouseDownInGroupDataCell(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; ADrawGroupDataNode: TGroupDataTreeNodeEh); virtual;
    procedure MouseDownInOutBoundary(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUpInTitleCell(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
    procedure MouseUpInDataCell(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
    procedure MouseUpInTitleRowPanel(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUpInDataRowPanel(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MoveDataRowAndScroll(Mouse, CellHit: Integer; var DrawInfo: TGridDrawInfoEh; var Axis: TGridAxisDrawInfoEh; ScrollBar: Integer; const MousePt: TPoint); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure OnFilterChange(Sender: TObject);
    procedure OnFilterCloseUp(Sender: TObject; Accept: Boolean);
    procedure OnFilterClosingUp(Sender: TObject; var Accept: Boolean);
    procedure OnFilterEditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure OnFilterGetItemsList(Sender: TObject);
    procedure LoadInplaceFilterValues(ASTFilter: TSTColumnFilterEh; Items: TStrings; PopupListbox: TPopupListboxEh; var NewWidth: Integer);
    procedure OnFilterKeyPress(Sender: TObject; var Key: Char);
    procedure OptimizeSelectedColsWidth(WithColumn: TColumnEh);
    procedure OutBoundaryDataChanged; override;
    procedure OverlaySelectionByTheme(Cell, AreaCell: TGridCoord; Column: TColumnEh; AreaRect: TRect; var Params: TColCellParamsEh);
    procedure Paint; override;
    procedure PaintClippedImage(imList: TCustomImageList; Bitmap: TBitmap;
      ACanvas: TCanvas; ARect: TRect; Index,
      ALeftMarg: Integer; Align: TAlignment; ClipRect: TRect);
    procedure RegetDefaultStyle;
    procedure ResetGroupPanel;
    procedure RestoreColumnsLayoutProducer(ARegIni: TObject; Section: String;
      RestoreParams: TColumnEhRestoreParams);
    procedure RestoreGridLayoutProducer(ARegIni: TObject; Section: String;
      RestoreParams: TDBGridEhRestoreParams);
    procedure RowHeightsChanged; override;
    procedure SaveColumnsLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
    procedure SaveGridLayoutProducer(ARegIni: TObject; Section: String; DeleteSection: Boolean);
    procedure Scroll(Distance: Integer); override;
    procedure ScrollDataInfo(DX, DY: Integer; var DrawInfo: TGridDrawInfoEh); override;
    procedure SelectionChanged; virtual;
    procedure SelectionActiveChanged; virtual;
    procedure SetColumnAttributes; override;
    procedure SetColWidths(Index: Longint; Value: Integer);
    procedure SetCurGroupDataNode(ACurGroupDataNode: TGroupDataTreeNodeEh; ShowInView: Boolean);
    procedure SetExtraFirstColumnWidth;
    procedure SetDataFilter;
    procedure SetFilterValue(DCol: Longint); virtual;
    procedure SetFooterRowCount(Value: Integer);
    procedure SetFrozenCols(Value: Integer);
    procedure SetGridScrollBarInfo(BarFlag: Integer; SetProps: TScrollBarPropsEh; Min, Max, PageSize, Pos: Integer); override;
    procedure SetMaxSizeForCheckbox(var ARect: TRect);
    procedure SetRowCount(NewRowCount: Longint);
    procedure SetRowHeight(Value: Integer);
    procedure SetRowLines(Value: Integer);
    procedure SetRowSizingAllowed(Value: Boolean);
    procedure SetSearchEditorMode(Value: Boolean);
    procedure SetSearchFilter(const FilterStr: String);
    procedure ReturnSearchPanelFilter;
    procedure CheckReturnSearchPanelFilter;
    procedure ClearSearchFilter;
    procedure SearchFilterEvent(DataSet: TDataSet; var Accept: Boolean);
    procedure ShowEditor; override;
    procedure ShowFilterEditorChar(Ch: Char);
    procedure StartEditFilter(DCol: Longint);
    procedure StartInplaceSearchTimer;
    procedure StartRowPanelTitleCellDrag(Shift: TShiftState; X, Y, ColumnIndex: Integer); virtual;
    procedure StartRowPanelTitleCellDragBox(Shift: TShiftState; X, Y, ColumnIndex: Integer; TitleRect: TRect); virtual;
    procedure StartGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer); virtual;
    procedure GoRowPanelTitleCellDrag(Shift: TShiftState; X, Y: Integer); virtual;
    procedure StopRowPanelTitleCellDrag(Shift: TShiftState; X, Y: Integer; IsAccept: Boolean); virtual;
    procedure DrawMoveLineOrTitleCell(IsDrawLine: Boolean);
    procedure StopEditFilter;
    procedure StopGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer; IsAccept: Boolean);
    procedure StopInplaceSearchTimer;
    procedure StopTracking;
    procedure StyleEhChanged;
    procedure SumListAfterRecalcAll(Sender: TObject);
    procedure SumListChanged(Sender: TObject);
    procedure SumListRecalcAll(Sender: TObject);
    procedure TimedScroll(Direction: TGridScrollDirection); override;
    procedure TimerScroll; virtual;
    procedure TitleClick(Column: TColumnEh); virtual;
    procedure TopLeftChanged; override;
    procedure TrackButton(X, Y: Integer);
    procedure UpdateActive; override;
    procedure UpdateEdit; override;
    procedure UpdateText; override;
    procedure UpdateEditorMode;
    procedure UpdateFilterEdit(UpdateData: Boolean);
    procedure UpdateFilterEditProps(DataCol: Longint); virtual;
    procedure UpdateHorzExtScrollBar; virtual;
    procedure UpdateRowCount; virtual;
    procedure UpdateScrollBar; virtual;
    procedure UpdateScrollBarPanels; virtual;
    procedure UpdateDataRowHeight(DataRowNum: Integer); virtual;
    procedure UpdateDatasetPosFromRowPos;
    procedure UpdateDatasetPosFromGroupNode(GroupNode: TGroupDataTreeNodeEh);
    procedure UpdateHotTackInfo(X, Y: Integer); override;
    procedure WndProc(var Message: TMessage); override;
    procedure WriteAutoFitColWidths(Value: Boolean);
    procedure WriteHighlightedSubCellTextEh(Column: TColumnEh;
      C: TCanvas;
      AR: TRect;X, Y: Integer;
      T: string;A: TAlignment;La:TTextLayout;ML:Boolean;EE: Boolean;
      L, R: Integer;rlr: Boolean;S: String;CI: Boolean;HC: TColor;Pos: Integer;
      PosC: TColor);
    procedure WriteHTitleMargin(Value: Integer);
    procedure WriteMinAutoFitWidth(Value: Integer);
    procedure WriteTitleHeight(Value: Integer);
    procedure WriteTitleLines(Value: Integer);
    procedure WriteUseMultiTitle(Value: Boolean);
    procedure WriteVTitleMargin(Value: Integer);

    property CellColWidths[Index: Longint]: Integer read GetCellColWidths write SetCellColWidths;
    property FilterEdit: TCustomDBEditEh read FFilterEdit;
    property FilterEditMode: Boolean read FFilterEditMode write SetFilterEditMode;
    property FooterColor: TColor read GetFooterColor write SetFooterColor;
    property FooterFont: TFont read GetFooterFont write SetFooterFont stored False;
    property OnApplyFilter: TNotifyEvent read FOnApplyFilter write FOnApplyFilter;
    property OnCellClick: TDBGridEhClickEvent read FOnCellClick write FOnCellClick;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property OnColExit: TNotifyEvent read FOnColExit write FOnColExit;
    property OnColumnMoved: TMovedEvent read FOnColumnMoved write FOnColumnMoved;
    property OnDrawColumnCell: TDrawColumnEhCellEvent read FOnDrawColumnCell write FOnDrawColumnCell;
    property OnDrawDataCell: TDrawDataCellEvent read FOnDrawDataCell write FOnDrawDataCell; { obsolete }
    property OnTitleClick: TDBGridEhClickEvent read FOnTitleClick write FOnTitleClick;
    property CellRowHeights[Index: Longint]: Integer read GetCellRowHeights write SetCellRowHeights;
    property SelectedRows: TBookmarkListEh read FBookmarks;
    property ContraColCount: Longint read GetContraColCount write SetContraColCount default 0;
    property SearchEditorMode: Boolean read FSearchEditorMode write SetSearchEditorMode;

    procedure DrawTitleAsRowPanel(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawDataAsRowPanel(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure DrawFooterAsRowPanel(ACol, ARow: Longint; AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState; CellAreaType: TCellAreaTypeEh); virtual;
    procedure SetColInRowPanel(DataCol: Integer);
    function DrawDetailPanelSign(DataCol, DataRow: Integer; AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean): Integer; virtual;
    procedure UpdateRowDetailPanel;
    function CheckMouseDownInRowDetailSign(Button: TMouseButton; Shift: TShiftState; MouseX, MouseY: Integer): Boolean; virtual;
    function CheckDataCellMouseDownInRowDetailSign(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer): Boolean; virtual;
    function CellEditRect(ACol, ARow: Longint): TRect; override;
    function GetMouseHitCellState(Cell: TGridCoord; MousePos: TPoint; CellRect: TRect; Column: TColumnEh; var StateRect: TRect): TDBGridEhState;

    procedure InTitleFilterListboxDropDown(Column: TColumnEh);
    procedure InTitleFilterListboxDropDownForRect(Column: TColumnEh; ForRect: TRect);
    procedure InTitleFilterListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure InTitleFilterListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InTitleFilterListKeyPress(Sender: TObject; var Key: Char);
    procedure InTitleFilterListboxCloseUp(Accept: Boolean);

    procedure ReadVTitleMargin(Reader: TReader);
    procedure ReadUseMultiTitle(Reader: TReader);
    procedure ReadTitleHeight(Reader: TReader);
    procedure ReadTitleLines(Reader: TReader);
    procedure ReadFooterColor(Reader: TReader);
    function CreateBackgroundData: TGridBackgroundDataEh; override;
    function GetBackgroundData: TDBGridBackgroundDataEh;
    procedure SetBackgroundData(Value: TDBGridBackgroundDataEh);

    procedure AddHighlightSubstr(Params: TGridHighlightTextParamsEh);
    function AddHighlightSubstrParams(const Text: String; CaseInsensitivity: Boolean; Column: TColumnEh; Color: TColor): TGridHighlightTextParamsEh;
    procedure DrawHighlightSubstrs(ACanvas: TCanvas; Column: TColumnEh; ARect: TRect; DX, DY: Integer; MasterText: String; Alignment: TAlignment; Layout: TTextLayout; MultyL: Boolean; EndEllipsis: Boolean; LeftMarg, RightMarg: Integer; ARightToLeftReading: Boolean; HighlightColor: TColor);

    procedure RemoveHighlightSubstr(Params: TGridHighlightTextParamsEh);
    procedure UpdateSearchPanel;
    procedure SetSearchPanel(Value: TDBGridSearchPanelEh);
    function GetDataLink: TGridDataLinkEh;

    property DataLink: TGridDataLinkEh read GetDataLink;

  protected {new}
    function CreateDataLink: TAxisGridDataLinkEh; override;
    procedure EditingChanged; override;
    procedure InternalLayout; override;
    procedure RecordChanged(Field: TField); override;
    function GetColCellParamsEh: TColCellParamsEh; reintroduce; virtual;
    function CreateColCellParamsEh: TAxisColCellParamsEh; override;
    procedure GetColRowForAxisCol(Column: TAxisBarEh; var ACol, ARow: Integer); override;
    function GetSelectedIndex: Integer; override;
    procedure SetSelectedIndex(Value: Integer); override;
    procedure SetDataSource(Value: TDataSource); override;
    procedure SetTitleFont(Value: TFont); override;
    function GetTitleFont: TFont; override;
    function DefaultTitleAlignment: TAlignment; override;
    function DefaultTitleColor: TColor; override;
    function AxisColumnsStorePropertyName: String; override;
    function GetColumnDefValues: TColumnDefValuesEh;
    function IsFixed3D: Boolean; override;
    procedure GetThemeTitleFillRect(var AFillRect: TRect; IncVerBoundary, IncHorzBoundary: Boolean); override;
    function GetDataEditButtonTransparency(ACol, ARow: Longint; ARect: TRect; Params: TAxisColCellParamsEh): Integer; override;
    procedure FillBlankDataCellRect(ARect: TRect; IsSelected: Boolean; Cell3D: Boolean; Params: TAxisColCellParamsEh); override;
    function DesignHitTestObject(XPos, YPos: Integer): TPersistent; override;

    property ColCellParamsEh: TColCellParamsEh read GetColCellParamsEh;

  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;
    destructor Destroy; override;

    procedure StartLoadingStatus(const LoadingCaption : String = ''; RenderDuration: Integer = -1);
    procedure FinishLoadingStatus(RenderDuration: Integer = -1);

    function CalcIndicatorColWidth: Integer;
    function CheckColumnDuplicateValues(Column: TColumnEh; var s: String; CheckPrevRow: Boolean): Boolean;
    function CheckCopyAction: Boolean;
    function CheckCutAction: Boolean;
    function CheckDeleteAction: Boolean;
    function CheckIndicatorColWidthChanged: Boolean;
    function CheckFillDataCell(Cell, AreaCell: TGridCoord; AxisBar: TAxisBarEh; AreaRect: TRect; Params: TAxisColCellParamsEh): Boolean; override;
    function CheckPasteAction: Boolean;
    function CheckSelectAllAction: Boolean;
    function DataBox: TGridRect;
    function DataRect: TRect;
    function DataRowCount: Integer;
    function DataRowToRecNo(DataRow: Integer): Integer;
    function DefaultMoveDataRows(BookmarkList: TBMListEh; ToRecNo: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean; virtual;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function FindFieldColumn(const FieldName: String): TColumnEh;
    function GetCellTreeElmentsAreaWidth: Integer; override;
    function GetColumnInRowPanelAtPos(InCellPos: TPoint; IsTitleTypeCell: Boolean): TColumnEh;
    function GetCellRectInRowPanelAtPos(InCellPos: TPoint; var ACellRect: TRect; IncludeLines: Boolean): TColumnEh;
    function GetCompleteKeyPress: String;
    function GetBof: Boolean;
    function GetEof: Boolean;
    function GetFooterValue(Row: Integer; Column: TColumnEh): String; virtual;
    function GridClientWidth: Integer;
    function HighlightDataCellColor(DataCol, DataRow: Integer; const Value: string; AState: TGridDrawState; var AColor: TColor; AFont: TFont): Boolean; override;
    function HighlightGroupDataCellColor(DataCol, DataRow: Integer; const Value: string; AState: TGridDrawState; var AColor: TColor; AFont: TFont): Boolean; virtual;
    function InRowPanelLineHeight: Integer; virtual;
    function IsFindDialogShowAsModal: Boolean; virtual;
    function IsUseMultiTitle: Boolean; virtual;
    function IsSearchingState: Boolean;
    function GetSearchingText: String;
    function LocateText(AGrid: TCustomDBGridEh; const FieldName: string; const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh; Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean; virtual;
    function MoveBy(Distance: Integer): Integer;
    function SafeMoveTop(ATop: Integer; CheckOnly: Boolean = False): Integer; override;
    function ScrollBarPanel: Boolean; virtual;
    function UpdateAction(Action: TBasicAction): Boolean; override;

    procedure ApplyFilter;
    procedure ClearFilter;
    procedure CancelEditing; override;
    procedure DataInsert;
    procedure DataAppend;
    procedure DefaultApplyFilter; virtual;
    procedure DefaultApplySorting; virtual;
    procedure DefaultBuildIndicatorTitleMenu(var PopupMenu: TPopupMenu); virtual;
    procedure DefaultCellMouseClick(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DefaultDrawColumnDataCell(Cell, AreaCell: TGridCoord; Column: TColumnEh; AreaRect: TRect; var Params: TColCellParamsEh);
    procedure DefaultDrawDataCell(const Rect: TRect; Field: TField; State: TGridDrawState); { obsolete } reintroduce;
    procedure DefaultDrawFooterCell(const Rect: TRect; DataCol, Row: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DefaultFillSTFilterListValues(Column: TColumnEh; Items: TStrings);
    procedure DefaultFillSTFilterListCommandValues(Column: TColumnEh; Items: TStrings);
    procedure DefaultFillSTFilterListDataValues(Column: TColumnEh; Items: TStrings);
    procedure DefaultHandler(var Message); override;
    procedure DefaultIndicatorTitleMouseDown(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure InvalidateFooter;
    procedure InvalidateTitle;
    procedure OptimizeColsWidth(ColumnsList: TColumnsEhList; const CheckRowCount : Integer = -1);
    procedure OptimizeAllColsWidth(const CheckRowCount : Integer = -1);
    procedure RestoreBookmark;
    procedure RestoreColumnsLayout(ACustIni: TCustomIniFile; Section: String; RestoreParams: TColumnEhRestoreParams); overload;
    procedure RestoreColumnsLayout(ARegIni: TRegIniFile; RestoreParams: TColumnEhRestoreParams); overload;
    procedure RestoreColumnsLayoutIni(IniFileName: String; Section: String; RestoreParams: TColumnEhRestoreParams);
    procedure RestoreGridLayout(ARegIni: TCustomIniFile; Section: String; RestoreParams: TDBGridEhRestoreParams); overload;
    procedure RestoreGridLayout(ARegIni: TRegIniFile; RestoreParams: TDBGridEhRestoreParams); overload;
    procedure RestoreGridLayoutIni(IniFileName: String; Section: String; RestoreParams: TDBGridEhRestoreParams);
    procedure SaveBookmark;
    procedure SaveColumnsLayout(ACustIni: TCustomIniFile; Section: String); overload;
    procedure SaveColumnsLayout(ARegIni: TRegIniFile); overload;
    procedure SaveColumnsLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
    procedure SaveGridLayout(ACustIni: TCustomIniFile; Section: String); overload;
    procedure SaveGridLayout(ARegIni: TRegIniFile); overload;
    procedure SaveGridLayoutIni(IniFileName: String; Section: String; DeleteSection: Boolean);
    procedure SetSortMarkedColumns;
    procedure SetValueFromPrevRecord;
    procedure SetFocus; override;
    procedure StartInplaceSearch(const ss: String; TimeOut: Integer; InpsDirection: TLocateTextDirectionEh);
    procedure StopInplaceSearch;
    procedure UpdateAllGridDataRowHeights(); virtual;
    procedure UpdateAllDataRowHeights; virtual;
    procedure UpdateGroupFooterRowHeights; virtual;
    procedure UpdateFooterRowHeights; virtual;
    procedure UpdateData; override;

    property AllowedOperations;
    property AllowedSelections: TDBGridEhAllowedSelections read FAllowedSelections write SetAllowedSelections default [gstRecordBookmarks..gstAll];
    property AutoFitColWidths: Boolean read FAutoFitColWidths write WriteAutoFitColWidths default False;

    property Center: TDBGridEhCenter read FCenter write SetCenter;
    property Col read GetCol write SetCol;
    property ColumnDefValues: TColumnDefValuesEh read GetColumnDefValues write SetColumnDefValues;
    property Columns: TDBGridColumnsEh read GetColumns write SetColumns;

    property DefaultRowHeight: Integer read GetDefaultRowHeight write SetDefaultRowHeight default 24;
    property EditActions: TDBGridEhEditActions read FEditActions write FEditActions default [];
    property EditButtonsShowOptions: TEditButtonsShowOptionsEh read FEditButtonsShowOptions write SetEditButtonsShowOptions default [];
    property BOF: Boolean read GetBof;
    property EOF: Boolean read GetEof;
    property EvenRowColor: TColor read GetEvenRowColor write SetEvenRowColor stored IsEvenRowColorStored;

    property FieldColumns[const FieldName: String]: TColumnEh read GetFieldColumns; default;
    property FooterRowCount: Integer read GetFooterRowCount write SetFooterRowCount default 0;
    property FrozenCols: Integer read FFrozenCols write SetFrozenCols default 0;
    property FullFooterRowCount: Integer read GetFullFooterRowCount;
    property GridLineParams: TDBGridLineParamsEh read GetGridLineParams write SetGridLineParams;
    property HeadTree: THeadTreeNode read FHeadTree;
    property HorzScrollBar: THorzDBGridEhScrollBar read FHorzScrollBar write SetHorzScrollBar;
    property IndicatorOffset: Byte read FIndicatorOffset;
    property IndicatorTitle: TDBGridEhIndicatorTitle read FIndicatorTitle write FIndicatorTitle;
    property IndicatorOptions: TDBGridEhIndicatorOptions read FIndicatorOptions write SetIndicatorOptions;
    property InplaceSearching: Boolean read FInplaceSearching;
    property LeafFieldArr: PTLeafCol read FLeafFieldArr;
    property MinAutoFitWidth: Integer read FMinAutoFitWidth write WriteMinAutoFitWidth default 0;
    property EmptyDataInfo: TGridEmptyDataInfoEh read FEmptyDataInfo write SetEmptyDataInfo;
    property BackgroundData: TDBGridBackgroundDataEh read GetBackgroundData write SetBackgroundData;
    property TreeViewParams: TGridTreeViewParamsEh read FTreeViewParams write SetTreeViewParams;

    property OddRowColor: TColor read GetOddRowColor write SetOddRowColor stored IsOddRowColorStored;
    property Options: TDBGridOptions read FOptions write SetOptions default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
    property OptionsEh: TDBGridEhOptions read FOptionsEh write SetOptionsEh default [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines];
    property OriginCol: Integer read GetOriginCol write SetOriginCol;

    property RowDetailPanel: TRowDetailPanelEh read FRowDetailPanel write SetRowDetailPanel;
    property RowDetailPanelControl: TRowDetailPanelControlEh read FRowDetailControl;
    property RowHeight: Integer read GetRowHeight write SetRowHeight default 0;
    property RowLines: Integer read GetRowLines write SetRowLines default 0;

    property DataGrouping: TDBGridEhDataGroupsEh read FDataGrouping write SetDataGrouping;


    property RowPanel: TGridRowPanelEh read FGridRowPanel write SetRowPanel;

    property RowSizingAllowed: Boolean read FRowSizingAllowed write SetRowSizingAllowed default False;
    property Selection: TDBGridEhSelection read FSelection;
    property SortLocal: Boolean read FSortLocal write FSortLocal default False;
    property SortMarkedColumns: TColumnsEhList read FSortMarkedColumns write FSortMarkedColumns;
    property STFilter: TSTDBGridEhFilter read FSTFilter write SetSTFilter;
    property Style: TDBGridEhStyle read FStyle write SetStyle;
    property SumList: TDBGridEhSumList read FSumList write SetSumList;
    property TimerActive: Boolean read FTimerActive;
    property TitleFont;
    property TitleHeight: Integer read GetTitleHeight write WriteTitleHeight default 0;
    property TitleImages: TCustomImageList read GetTitleImages write SetTitleImages stored False;
    property TitleLines: Integer read GetTitleLines write WriteTitleLines default 0;
    property TitleOffset: Byte read FTitleOffset;
    property TitleParams: TDBGridTitleParamsEh read FTitleParams write SetTitleParams;
    property IndicatorParams: TDBGridIndicatorParamsEh read FIndicatorParams write SetIndicatorParams;
    property FooterParams: TDBGridFooterParamsEh read FFooterParams write SetFooterParams;

    property TopDataOffset: Byte read GetTopDataOffset;
    property TryUseMemTableInt: Boolean read FTryUseMemTableInt write FTryUseMemTableInt;
    property UseMultiTitle: Boolean read GetUseMultiTitle write WriteUseMultiTitle default False;
    property VertScrollBar: TVertDBGridEhScrollBar read FVertScrollBar write SetVertScrollBar;
    property VisibleColumns: TColumnsEhList read GetVisibleColumns;

    property VTitleMargin: Integer read GetVTitleMargin write WriteVTitleMargin default 10;
    property SearchPanel: TDBGridSearchPanelEh read FSearchPanel write SetSearchPanel;

    property OnAdvDrawDataCell: TDBGridEhAdvDrawColumnDataEvent read FOnAdvDrawDataCell write FOnAdvDrawDataCell;
    property OnBuildIndicatorTitleMenu: TDBGridEhBuildIndicatorTitleMenu read FOnBuildIndicatorTitleMenu write FOnBuildIndicatorTitleMenu;
    property OnCheckButton: TCheckTitleEhBtnEvent read FOnCheckButton write FOnCheckButton;
    property OnCheckRowHaveDetailPanel: TDBGridEhCheckRowHaveDetailPanelEvent read FOnCheckRowHaveDetailPanel write FOnCheckRowHaveDetailPanel;
    property OnColWidthsChanged: TNotifyEvent read FOnColWidthsChanged write FOnColWidthsChanged;
    property OnDataGroupGetRowText: TDBGridEhDataGroupGetGroupRowTextEvent read FOnDataGroupGetRowText write FOnDataGroupGetRowText;
    property OnDataGroupGetRowParams: TDBGridEhDataGroupGetGroupRowParamsEvent read FOnDataGroupGetRowParams write FOnDataGroupGetRowParams;
    property OnDataGroupGetFooterParams: TDBGridEhDataGroupGetGroupFooterParamsEvent read FOnDataGroupGetFooterParams write FOnDataGroupGetFooterParams;

    property OnActiveGroupingStructChanged: TDBGridEhNotifyEvent read FOnActiveGroupingStructChanged write FOnActiveGroupingStructChanged;

    property OnDataHintShow: TDBGridEhDataHintShowEvent read FOnDataHintShow write FOnDataHintShow;
    property OnDrawFooterCell: TDrawFooterCellEvent read FOnDrawFooterCell write FOnDrawFooterCell;
    property OnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent read FOnFillSTFilterListValues write FOnFillSTFilterListValues;
    property OnGetBtnParams: TGetBtnEhParamsEvent read FOnGetBtnParams write FOnGetBtnParams;
    property OnGetCellParams: TGetCellEhParamsEvent read FOnGetCellParams write FOnGetCellParams;
    property OnGetFooterParams: TGetFooterParamsEvent read FOnGetFooterParams write FOnGetFooterParams;
    property OnGetRowHeight: TGetDBGridEhRowHeightEvent read FOnGetRowHeight write FOnGetRowHeight;
    property OnHintShowPause: TDBGridEhHintShowPauseEvent read FOnHintShowPause write FOnHintShowPause;
    property OnIndicatorTitleMouseDown: TGridEhCellMouseEvent read FOnIndicatorTitleMouseDown write FOnIndicatorTitleMouseDown;
    property OnMoveRecords: TGridMoveRecordsEventEh read FOnMoveRecords write FOnMoveRecords;
    property OnRowDetailPanelHide: TDBGridEhRowDetailPanelHideEvent read FOnRowDetailPanelHide write FOnRowDetailPanelHide;
    property OnRowDetailPanelShow: TDBGridEhRowDetailPanelShowEvent read FOnRowDetailPanelShow write FOnRowDetailPanelShow;
    property OnSelectionChanged: TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
    property OnSortMarkingChanged: TNotifyEvent read FOnSortMarkingChanged write FOnSortMarkingChanged;
    property OnSumListAfterRecalcAll: TNotifyEvent read FOnSumListAfterRecalcAll write FOnSumListAfterRecalcAll;
    property OnSumListRecalcAll: TNotifyEvent read FOnSumListRecalcAll write FOnSumListRecalcAll;
    property OnTitleBtnClick: TTitleEhClickEvent read FOnTitleBtnClick write FOnTitleBtnClick;
    property OnTopLeftChanged: TNotifyEvent read FOnTopLeftChanged write FOnTopLeftChanged;
    property OnDataGroupFooterAggregateValue: TGridDataGroupFooterItemAggregateValueEvent read FOnDataGroupFooterAggregateValue write FOnDataGroupFooterAggregateValue;
    property OnDataGroupFooterFinalizeValue: TGridDataGroupFooterItemFinalizeValueEvent read FOnDataGroupFooterFinalizeValue write FOnDataGroupFooterFinalizeValue;
    property OnDataGroupFooterToDisplayText: TGridDataGroupFooterItemToDisplayTextEvent read FOnDataGroupFooterToDisplayText write FOnDataGroupFooterToDisplayText;

  end;

{ TDBGridEh }

  TDBGridEh = class(TCustomDBGridEh)
  public
    property Canvas;
    property GridHeight;
    property RowCount;
    property SelectedRows;
    property TopRow;
    property TopRowOffset;
    property LeftColOffset;
    property FooterColor;
  published
    property Align;
    property AllowedOperations;
    property AllowedSelections;
    property Anchors;
    property AutoFitColWidths;
    property Border;
    property BiDiMode;
    property BorderStyle;
    property IncludeImageModules;
    property Color;
    property ColumnDefValues;
    property Columns stored False; //StoreColumns;
    property Constraints;
    property ContraColCount;
    property Ctl3D;
    property DataGrouping;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DrawGraphicData;
    property DrawMemoText;
    property DynProps;
    property EditActions;
    property Enabled;
    property EvenRowColor;
    property FixedColor;
    property Flat;
    property Font;
//    property FooterColor;
    property FooterFont;
    property FooterRowCount;
    property FooterParams;
    property FrozenCols;
    property GridLineParams;
    property HorzScrollBar;
    property ImeMode;
    property ImeName;
    property IndicatorOptions;
    property IndicatorParams;
    property IndicatorTitle;
    property MinAutoFitWidth;
    property EmptyDataInfo;
    property BackgroundData;
    property OddRowColor;
    property Options;
    property OptionsEh;
    property ParentBiDiMode;
    property ParentCtl3D;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RowDetailPanel;
    property RowHeight;
    property RowLines;
    property RowSizingAllowed;
    property RowPanel;
    property SearchPanel;
    property ShowHint;
    property EditButtonsShowOptions;
    property SortLocal;
    property STFilter;
    property SumList;
    property TabOrder;
    property TabStop;
    property TitleFont;
//    property TitleHeight;
    property TitleImages;
//    property TitleLines;
    property TitleParams;
{$IFDEF EH_LIB_13}
    property Touch;
{$ENDIF}
    property TreeViewParams;
//    property UseMultiTitle;
    property VertScrollBar;
    property Visible;
//    property VTitleMargin;
//    property HTitleMargin;
    property OnActiveGroupingStructChanged;
    property OnAdvDrawDataCell;
    property OnApplyFilter;
    property OnBuildIndicatorTitleMenu;
    property OnCellClick;
    property OnCellMouseClick;
    property OnCheckButton;
    property OnCheckRowHaveDetailPanel;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnColWidthsChanged;
{$IFDEF EH_LIB_5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDataGroupFooterAggregateValue;
    property OnDataGroupFooterFinalizeValue;
    property OnDataGroupFooterToDisplayText;
    property OnDataGroupGetRowText;
    property OnDataGroupGetRowParams;
    property OnDataGroupGetFooterParams;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawColumnCell;
    property OnDrawDataCell; { obsolete }
    property OnDrawFooterCell;
    property OnDataHintShow;
    property OnEditButtonClick;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
{$IFDEF EH_LIB_13}
    property OnGesture;
{$ENDIF}
    property OnFillSTFilterListValues;
    property OnGetBtnParams;
    property OnGetCellParams;
    property OnGetFooterParams;
    property OnGetRowHeight;
    property OnIndicatorTitleMouseDown;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMoveRecords;
    property OnSelectionChanged;
    property OnHintShowPause;
    property OnRowDetailPanelHide;
    property OnRowDetailPanelShow;
    property OnSortMarkingChanged;
    property OnStartDock;
    property OnStartDrag;
    property OnSumListAfterRecalcAll;
    property OnSumListRecalcAll;
    property OnTitleBtnClick;
    property OnTitleClick;
  end;

  TDBGridEhStyleIndicatorTitleMenuEh = (itmVisibleColumnsEh, itmCut, itmCopy, itmPaste, itmDelete, itmSelectAll{, itmPreview});
  TDBGridEhStyleIndicatorTitleMenusEh =   set of TDBGridEhStyleIndicatorTitleMenuEh;

  TColumnEhMenuItem = class(TMenuItemEh)
  public
    ColumnEh: TColumnEh;
  end;

  TDBGridEhMenuItem = class(TMenuItem)
  public
    Grid: TCustomDBGridEh;
    TitleMenu: TDBGridEhStyleIndicatorTitleMenuEh;
    TagObject: TObject;
  end;

  TGridThemeTitleFillElementEh = (gtfeHeaderItemEh, gtfeSplitButtonEh);

{ TDBGridEhStyle }

  TDBGridEhStyle = class(TComponent)
  private
    FGrids: TObjectList;
    FLuminateSelection: Boolean;
    FWindowHandle: HWND;
    FIsDrawFocusRect: Boolean;
    FInTitleFitlerButtonStyle: TEditButtonStyleEh;
    FThemeTitleFillElement: TGridThemeTitleFillElementEh;
    FOnGetSubtitleRowColor: TDBGridEhGetColorEvent;
    FSelectionColor: TColor;
    FSelectionFontColor: TColor;
    FSelectionInactiveColor: TColor;
    FSortMarkerStyle: TSortMarkerStyleEh;
    FGradientEnabledInClassicTheme: Boolean;
    FDataCellHorzOffset: Integer;
    FDefaultSortMarkerStyle: TSortMarkerStyleEh;
    FFinishLoadingStatusRenderDuration: Integer;
    FStartLoadingStatusRenderDuration: Integer;
    procedure SetLuminateSelection(const Value: Boolean);
    procedure SetSelectionColor(const Value: TColor);
    procedure SetSelectionFontColor(const Value: TColor);
    procedure SetSelectionInactiveColor(const Value: TColor);
    procedure SetSortMarkerStyle(const Value: TSortMarkerStyleEh);
    procedure SetGradientEnabledInClassicTheme(const Value: Boolean);
    procedure SetDefaultSortMarkerStyle(const Value: TSortMarkerStyleEh);
  protected
    function HighlightDataCellColor(AGrid: TCustomDBGridEh; ACol, ARow: Integer;
      DataCol, DataRow: Integer; const Value: string; AState: TGridDrawState;
      InMultiSelect: Boolean; var AColor: TColor; AFont: TFont): Boolean; virtual;
    function HighlightNoDataCellColor(AGrid: TCustomDBGridEh; ACol, ARow: Integer;
      DataCol, DataRow: Integer; CellType: TCellAreaTypeEh; AState: TGridDrawState;
      InMultiSelect: Boolean; var AColor: TColor; AFont: TFont): Boolean; virtual;
    procedure RemoveAllChangeNotification;
    procedure StyleWndProc(var Msg: TMessage); virtual;
    procedure SysColorChanged; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GridInChangeNotification(Grid: TCustomDBGridEh): Boolean;
    function LightenColor(AColor: TColor; GlassColor: TColor; Ungray: Boolean): TColor; virtual;
    function GetColumnFontColor(Column: TColumnEh; AState: TGridDrawState): TColor; virtual;
    function GetColumnColor(Column: TColumnEh): TColor; virtual;
    function GetSubtitleRowColor(Grid: TCustomDBGridEh): TColor; virtual;
    function DefaultGetSubtitleRowColor(Grid: TCustomDBGridEh): TColor; virtual;
    function GetGroupPanelColor(Grid: TCustomDBGridEh): TColor; virtual;
    function GetSelectionColor: TColor; virtual;
    function GetSelectionFontColor: TColor; virtual;
    function GetSelectionInactiveColor: TColor; virtual;
    function GetSortMarkerSize(Canvas: TCanvas; SMStyle: TSortMarkerStyleEh): TSize; virtual;
    function GetDataCellHorzOffset(Grid: TCustomDBGridEh; Column: TColumnEh): Integer; virtual;
    function IsCustomStyleActive: Boolean;
    function GetActualTreeGlyphStyle: TTreeViewGlyphStyleEh; virtual;
{$IFDEF EH_LIB_7}
    function GetThemeTitleFillElement(AIsDown, AIsSelected: Boolean): TThemedElementDetails;
{$ENDIF}
    procedure GetThemeTitleFillRect(var AFillRect: TRect; IncVerBoundary, IncHorzBoundary: Boolean);
    procedure AddChangeNotification(Grid: TCustomDBGridEh);
    procedure DrawCustomStyleCellBackground(Grid: TCustomDBGridEh; Canvas: TCanvas;
      const ARect: TRect; FillStyle: TGridCellFillStyleEh;
      AColor: TColor; AState: TGridDrawState;
      ACol, ARow: Integer; CellPressed: Boolean; ClipRect: TRect); virtual;
    procedure DrawTitleCellBackground(Grid: TCustomDBGridEh; Column: TColumnEh;
      Canvas: TCanvas; const ARect: TRect;  FillInside: Boolean; var InsideRect: TRect;
      AState: TGridDrawState; var ATitleState: TDBGirdDrawTitleStateEh; ClipRect: TRect); virtual;
    procedure DrawFixedCellBackground(Grid: TCustomDBGridEh;
      Canvas: TCanvas; const ARect: TRect;  FillInside: Boolean; var InsideRect: TRect;
      AState: TGridDrawState; var AFixedState: TDBGirdDrawFixedStateEh); virtual;

    procedure DrawSortMarker(Canvas: TCanvas; SMStyle: TSortMarkerStyleEh; Column: TColumnEh; Direction: TSortMarkerEh; Selected: Boolean; ARect: TRect);
    procedure Changed;
    procedure RemoveChangeNotification(Grid: TCustomDBGridEh);
    procedure GetDefaultFixedGradientColor(var AStartColor, AEndColor: TColor; IsTrack, IsPressed: Boolean); virtual;
    procedure GetCustomStyleFixedColors(var AFillColor, ATextColor, AStartColor, AEndColor: TColor; FillStyle: TGridCellFillStyleEh; IsTrack, IsPressed: Boolean); virtual;
  published
    property LuminateSelection: Boolean read FLuminateSelection write SetLuminateSelection default True;
//    property FilterEditCloseUpApplyFilter: Boolean
//      read FFilterEditCloseUpApplyFilter write FFilterEditCloseUpApplyFilter default False;
    property IsDrawFocusRect: Boolean read FIsDrawFocusRect write FIsDrawFocusRect default True;
    property InTitleFitlerButtonStyle: TEditButtonStyleEh read FInTitleFitlerButtonStyle write FInTitleFitlerButtonStyle;
    property ThemeTitleFillElement: TGridThemeTitleFillElementEh read FThemeTitleFillElement write FThemeTitleFillElement;
    property OnGetSubtitleRowColor: TDBGridEhGetColorEvent read FOnGetSubtitleRowColor write FOnGetSubtitleRowColor;
    property SelectionColor: TColor read FSelectionColor write SetSelectionColor default clDefault;
    property SelectionFontColor: TColor read FSelectionFontColor write SetSelectionFontColor default clDefault;
    property SelectionInactiveColor: TColor read FSelectionInactiveColor write SetSelectionInactiveColor default clDefault;
    property SortMarkerStyle: TSortMarkerStyleEh read FSortMarkerStyle write SetSortMarkerStyle;
    property DataCellHorzOffset: Integer read FDataCellHorzOffset write FDataCellHorzOffset default -1;
    property GradientEnabledInClassicTheme: Boolean read FGradientEnabledInClassicTheme write SetGradientEnabledInClassicTheme default False;
    property DefaultSortMarkerStyle: TSortMarkerStyleEh read FDefaultSortMarkerStyle write SetDefaultSortMarkerStyle default smstFrameEh;
    property StartLoadingStatusRenderDuration: Integer read FStartLoadingStatusRenderDuration write FStartLoadingStatusRenderDuration;
    property FinishLoadingStatusRenderDuration: Integer read FFinishLoadingStatusRenderDuration write FFinishLoadingStatusRenderDuration;
  end;

{ TDBGridEhCenter }

  TDBGridEhCenter = class(TPersistent)
  private
    FFilterEditCloseUpApplyFilter: Boolean;
    FGrids: TObjectList;
    FIndicatorTitleMenus: TDBGridEhStyleIndicatorTitleMenusEh;
    FOnApplyFilter: TNotifyEvent;
    FOnApplySorting: TNotifyEvent;
    FOnBuildIndicatorTitleMenu: TDBGridEhBuildIndicatorTitleMenu;
    FOnCellMouseClick: TGridEhCellMouseEvent;
    FOnIndicatorTitleMouseDown: TGridEhCellMouseEvent;
    FOnLocateText: TLocateTextEventEh;
    FOnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent;
    FPreferEditFormatForNumberFields: Boolean;
    FSTFilterDefaultStringOperator: TSTFilterDefaultOperatorEh;
    FSTFilterDefaultNumberOperator: TSTFilterDefaultOperatorEh;
    FSTFilterDefaultBooleanOperator: TSTFilterDefaultOperatorEh;
    FSTFilterDefaultDateTimeOperator: TSTFilterDefaultOperatorEh;
    FUseExtendedScrollingForMemTable: Boolean;
  protected
    function DefaultLocateText(AGrid: TCustomDBGridEh; const FieldName: string;
      const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh;
      Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean; virtual;
    function DefaultMoveRecords(AGrid: TCustomDBGridEh; BookmarkList: TBMListEh; ToRecNo: Longint; CheckOnly: Boolean): Boolean; virtual;
    function LocateText(AGrid: TCustomDBGridEh; const FieldName: string;
      const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh;
      Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean; virtual;
    function MoveRecords(AGrid: TCustomDBGridEh; BookmarkList: TBMListEh; ToRecNo: Longint; CheckOnly: Boolean): Boolean; virtual;
    procedure ApplyFilter(AGrid: TCustomDBGridEh); virtual;
    procedure ApplySorting(AGrid: TCustomDBGridEh); virtual;
    procedure ApplySimpleTextFilter(AGrid: TCustomDBGridEh; FieldNames: String; Operation: TLSAutoFilterTypeEh; FilterText: String); virtual;
    procedure ExecuteFindDialog(AGrid: TCustomDBGridEh; Text, FieldName: String; Modal: Boolean); virtual;
    procedure MenuEditClick(Sender: TObject);
    procedure MenuVisibleColumnClick(Sender: TObject);
    procedure RemoveAllChangeNotification;
  public
    constructor Create;
    destructor Destroy; override;
    function GridInChangeNotification(Grid: TCustomDBGridEh): Boolean;
    function GetSTFilterDefaultOperator(Grid: TCustomDBGridEh; Column: TColumnEh; var FExpression: TSTFilterExpressionEh): TSTFilterDefaultOperatorEh; virtual;
    function GetSortOrderForSortMarker(Grid: TCustomDBGridEh; Column: TColumnEh; SortMarker: TSortMarkerEh): TSortOrderEh; virtual;
    function GetFirstSortMarkerState(Grid: TCustomDBGridEh; Column: TColumnEh): TSortMarkerEh; virtual;
    function CanColumnValueReadAsText(Grid: TCustomDBGridEh; Column: TColumnEh): Boolean; virtual;
    function ColumnValueTypeIsComparable(Grid: TCustomDBGridEh; Column: TColumnEh): Boolean; virtual;
    procedure AddChangeNotification(Grid: TCustomDBGridEh);
    procedure BuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu);
    procedure CellMouseClick(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure IndicatorTitleMouseDown(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure DefaultFillSTFilterListCommandValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings); virtual;
    procedure DefaultFillSTFilterListDataValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings); virtual;
    procedure StandardFillSTFilterListDataValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings); virtual;

    procedure Changed;
    procedure DefaultApplyFilter(AGrid: TCustomDBGridEh); virtual;
    procedure DefaultApplySorting(AGrid: TCustomDBGridEh); virtual;
    procedure DefaultBuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu); virtual;
    procedure DefaultCellMouseClick(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure DefaultIndicatorTitleMouseDown(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); virtual;
    procedure DefaultFillSTFilterListValues(Grid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings);
    procedure RemoveChangeNotification(Grid: TCustomDBGridEh);
    property FilterEditCloseUpApplyFilter: Boolean read FFilterEditCloseUpApplyFilter write FFilterEditCloseUpApplyFilter default False;
    property IndicatorTitleMenus: TDBGridEhStyleIndicatorTitleMenusEh read FIndicatorTitleMenus write FIndicatorTitleMenus;
    property PreferEditFormatForNumberFields: Boolean read FPreferEditFormatForNumberFields write FPreferEditFormatForNumberFields default False;
    property UseExtendedScrollingForMemTable: Boolean read FUseExtendedScrollingForMemTable write FUseExtendedScrollingForMemTable default True;

    property STFilterDefaultStringOperator: TSTFilterDefaultOperatorEh read FSTFilterDefaultStringOperator write FSTFilterDefaultStringOperator;
    property STFilterDefaultNumberOperator: TSTFilterDefaultOperatorEh read FSTFilterDefaultNumberOperator write FSTFilterDefaultNumberOperator;
    property STFilterDefaultDateTimeOperator: TSTFilterDefaultOperatorEh read FSTFilterDefaultDateTimeOperator write FSTFilterDefaultDateTimeOperator;
    property STFilterDefaultBooleanOperator: TSTFilterDefaultOperatorEh read FSTFilterDefaultBooleanOperator write FSTFilterDefaultBooleanOperator;

    property OnApplyFilter: TNotifyEvent read FOnApplyFilter write FOnApplyFilter;
    property OnApplySorting: TNotifyEvent read FOnApplySorting write FOnApplySorting;
    property OnBuildIndicatorTitleMenu: TDBGridEhBuildIndicatorTitleMenu read FOnBuildIndicatorTitleMenu write FOnBuildIndicatorTitleMenu;
    property OnCellMouseClick: TGridEhCellMouseEvent read FOnCellMouseClick write FOnCellMouseClick;
    property OnIndicatorTitleMouseDown: TGridEhCellMouseEvent read FOnIndicatorTitleMouseDown write FOnIndicatorTitleMouseDown;
    property OnLocateText: TLocateTextEventEh read FOnLocateText write FOnLocateText;
    property OnFillSTFilterListValues: TDBGridEhFillSTFilterListValuesEvent read FOnFillSTFilterListValues write FOnFillSTFilterListValues;
  end;

function SetDBGridEhDefaultStyle(NewGridDefaultStyle: TDBGridEhStyle): TDBGridEhStyle;
function DBGridEhDefaultStyle: TDBGridEhStyle;

function SetDBGridEhCenter(NewGridCenter: TDBGridEhCenter): TDBGridEhCenter;
function DBGridEhCenter: TDBGridEhCenter;

{ TDBGridFilterPopupListboxItemEh }

type
  TDBGridFilterPopupListboxItemEh = class(TPopupListboxItemEh)
  protected
    function GetColumn(Listbox: TPopupListboxEh): TColumnEh;
    function GetGroupLevel(Listbox: TPopupListboxEh): TGridDataGroupLevelEh;
  end;

{ TPopupListboxItemEhSort }

  TPopupListboxItemEhSort = class(TDBGridFilterPopupListboxItemEh)
  protected
    FSortState: TSortMarkerEh;
    function CanFocus(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
    procedure DrawItem(Sender: TPopupListboxEh; ItemIndex: Integer; ARect: TRect; State: TOwnerDrawState); override;
  public
    constructor Create(ASortState: TSortMarkerEh);
    procedure Execute(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState); override;
  end;

{ TPopupListboxItemEhLine }

  TPopupListboxItemEhLine = class(TDBGridFilterPopupListboxItemEh)
  protected
    function CanFocus(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
    procedure DrawItem(Sender: TPopupListboxEh; ItemIndex: Integer; ARect: TRect; State: TOwnerDrawState); override;
    procedure MouseUp(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton; Shift: TShiftState; var IsCloseListbox: Boolean); override;
  public
    function CloseOnExecute(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
  end;

{ TPopupListboxItemEhSpec }

  TPopupListboxItemEhSpecType = (ptFilterSpecItemClearFilter, ptFilterSpecItemAll,
    ptFilterSpecItemEmpties, ptFilterSpecItemNotEmties, ptFilterSpecItemDialog,
    ptFilterApply);

  TPopupListboxItemEhSpec = class(TDBGridFilterPopupListboxItemEh)
  protected
    FType: TPopupListboxItemEhSpecType;
    function CanFocus(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
    procedure DrawItem(Sender: TPopupListboxEh; ItemIndex: Integer; ARect: TRect; State: TOwnerDrawState); override;
  public
    constructor Create(AType: TPopupListboxItemEhSpecType);
    procedure Execute(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState); override;
  end;

{ TPopupListboxItemEhData }

  TPopupListboxItemEhData = class(TDBGridFilterPopupListboxItemEh)
  protected
    function CanFocus(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
    procedure DrawItem(Sender: TPopupListboxEh; ItemIndex: Integer; ARect: TRect; State: TOwnerDrawState); override;
    procedure MouseDown(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton; Shift: TShiftState); override;
    procedure MouseMove(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState); override;
    procedure MouseUp(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton; Shift: TShiftState; var IsCloseListbox: Boolean); override;
    procedure KeyPress(Sender: TPopupListboxEh; ItemIndex: Integer; var Key: Char; Shift: TShiftState; var IsCloseListbox: Boolean); override;
  public
    function CloseOnExecute(Sender: TPopupListboxEh; ItemIndex: Integer): Boolean; override;
    procedure Execute(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState); override;
  end;

const
  IndicatorWidth = 11;
  
var
  SortMarkerFont: TFont;
  DBGridEhIndicators: TImageList;
  DBGridEhSortMarkerImages: TImageList;

  DBGridEhInplaceSearchKey: TShortCut;
  DBGridEhInplaceSearchNextKey: TShortCut;
  DBGridEhInplaceSearchPriorKey: TShortCut;
  DBGridEhInplaceSearchTimeOut: Integer; // in millisecond
  DBGridEhInplaceSearchColor: TColor;
  DBGridEhInplaceSearchTextColor: TColor;
  DBGridEhSetValueFromPrevRecordKey: TShortCut;
  DBGridEhFindDialogKey: TShortCut;
  DBGridEhShowInTitleFilterBox: TShortCut;


  DBGridEhIndicatorTitlePopupMenu: TPopupMenu;
  DBGridEhVisibleColumnsIndicatorMenuItem: TDBGridEhMenuItem;
  DBGridEhCutIndicatorMenuItem: TDBGridEhMenuItem;
  DBGridEhCopyIndicatorMenuItem: TDBGridEhMenuItem;
  DBGridEhPasteIndicatorMenuItem: TDBGridEhMenuItem;
  DBGridEhDeleteIndicatorMenuItem: TDBGridEhMenuItem;
  DBGridEhSelectAllIndicatorMenuItem: TDBGridEhMenuItem;

  FScreenNumColors: Integer;

  PopupListboxItemEhSortAsc: TPopupListboxItemEhSort;
  PopupListboxItemEhSortDes: TPopupListboxItemEhSort;
  PopupListboxItemEhLine: TPopupListboxItemEhLine;

  PopupListboxItemEhClearFilter: TPopupListboxItemEhSpec;
  PopupListboxItemEhAll: TPopupListboxItemEhSpec;
  PopupListboxItemEhEmpties: TPopupListboxItemEhSpec;
  PopupListboxItemEhNotEmties: TPopupListboxItemEhSpec;
  PopupListboxItemEhDialog: TPopupListboxItemEhSpec;
  PopupListboxItemEhApplyFilter: TPopupListboxItemEhSpec;

  PopupListboxItemEhData: TPopupListboxItemEhData;

  DBGridEhEmptyDataInfoText: String = ''; // Use SNoDataEh if this var is ''

const
  ColSelectionAreaHeight: Integer = 7;

implementation

uses DBConsts, Dialogs, Comctrls, CommCtrl, DBGridEhImpExp, Clipbrd,
{$IFDEF EH_LIB_6} MaskUtils, {$ELSE} Mask, {$ENDIF}
{$ifdef eval}
  EhLibEvaluationForm,
{$endif}
  EhLibConsts, DBLookupGridsEh, CalculatorEh, DBGridEhFindDlgs, DBUtilsEh,
  DBLookupEh, Consts, DBGridEhSimpleFilterDlg, StrUtils, Math;

{$R DBGRIDEH.RES}

const
  bmArrow = 'DBGARROWEH';
  bmEdit = 'DBEDITEH';
  bmInsert = 'DBINSERTEH';
  bmMultiDot = 'DBMULTIDOTEH';
  bmMultiArrow = 'DBMULTIARROWEH';

  bmSmDown = 'DBSMDOWNEH';
  bmSmUp = 'DBSMUPEH';
  bmSmDown1 = 'DBSMDOWNEH_1';
  bmSmUp1 = 'DBSMUPEH_1';

  bmEditWhite = 'DBGARROWEHW';
  bmDropDown = 'DROPDOWNEH';
  MaxMapSize = (MaxInt div 2) div SizeOf(Integer); { 250 million }

var
  hcrDownCurEh: HCursor = 0;
  hcrRightCurEh: HCursor = 0;
  hcrLeftCurEh: HCursor = 0;

  VarColCellParamsEh: TColCellParamsEh;

type
  TDBGridEhNavigatorPanelCrack = class(TDBGridEhNavigatorPanel);
  TGridDataGroupFooterEhCrack = class(TGridDataGroupFooterEh);
  TNavFindEditEhCrack = class(TNavFindEditEh);

type
  TCharSet = Set of AnsiChar;
  TWinControlCracker = class(TWinControl) end;

function GetDefaultSection(Component: TComponent): string;
var
  Owner: TComponent;
begin
  if Component <> nil then
  begin
    if Component is TCustomForm then
      Result := Component.ClassName
    else
    begin
      Result := Component.Name;
      Owner := Component.Owner;
      while (Owner <> nil) and not (Owner is  TCustomForm) do
      begin
        Result := Owner.Name + '.' + Result;
        Owner := Owner.Owner;
      end;
      if Owner <> nil then
        Result := Owner.ClassName + Result;
    end;
  end else
    Result := '';
end;

procedure OverturnUpRect(var ARect: TRect);
var Bottom: Integer;
begin
  Bottom := ARect.Bottom;
  ARect.Bottom := ARect.Top + (ARect.Right - ARect.Left);
  ARect.Right := ARect.Left + (Bottom - ARect.Top);
end;

var
  WaitCount: Integer = 0;
  SaveCursor: TCursor = crDefault;
const
  WaitCursor: TCursor = crHourGlass;

procedure StartWait;
begin
  if WaitCount = 0 then
  begin
    SaveCursor := Screen.Cursor;
    Screen.Cursor := WaitCursor;
  end;
  Inc(WaitCount);
end;

procedure StopWait;
begin
  if WaitCount > 0 then
  begin
    Dec(WaitCount);
    if WaitCount = 0 then
      Screen.Cursor := SaveCursor;
  end;
end;

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string; forward;

var
  FDBGridEhDefaultStyle: TDBGridEhStyle = nil;

function SetDBGridEhDefaultStyle(NewGridDefaultStyle: TDBGridEhStyle): TDBGridEhStyle;
begin
  Result := FDBGridEhDefaultStyle;
  FDBGridEhDefaultStyle := NewGridDefaultStyle;
  FDBGridEhDefaultStyle.Changed;
end;

function DBGridEhDefaultStyle: TDBGridEhStyle;
begin
  Result := FDBGridEhDefaultStyle;
end;

{ TDBGridEhStyle }

constructor TDBGridEhStyle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FGrids := TObjectList.Create(False);
{$IFDEF CIL}
  FWindowHandle := WinUtils.AllocateHWnd(StyleWndProc);
{$ELSE}
  FWindowHandle := {$IFDEF EH_LIB_6}Classes.{$ENDIF}AllocateHWnd(StyleWndProc);
{$ENDIF}
  FLuminateSelection := True;
  FIsDrawFocusRect := True;
  SysColorChanged;
  FInTitleFitlerButtonStyle := ebsDropDownEh;
  FThemeTitleFillElement := gtfeHeaderItemEh;
  FSelectionColor := clDefault;
  FSelectionFontColor := clDefault;
  FSelectionInactiveColor := clDefault;
  FDataCellHorzOffset := -1;
  FDefaultSortMarkerStyle := smstFrameEh;
  StartLoadingStatusRenderDuration := 300;
  FinishLoadingStatusRenderDuration := 500;
end;

destructor TDBGridEhStyle.Destroy;
var
  i: Integer;
begin
{$IFDEF CIL}
  WinUtils.DeallocateHWnd(FWindowHandle);
{$ELSE}
  {$IFDEF EH_LIB_6}Classes.{$ENDIF}DeallocateHWnd(FWindowHandle);
{$ENDIF}
  if FDBGridEhDefaultStyle = Self then
    FDBGridEhDefaultStyle := nil;
  for i := FGrids.Count-1 downto 0 do
    TCustomDBGridEh(FGrids[i]).Style := nil;
  FreeAndNil(FGrids);
  inherited Destroy;
end;

procedure TDBGridEhStyle.DrawCustomStyleCellBackground(Grid: TCustomDBGridEh;
  Canvas: TCanvas; const ARect: TRect; FillStyle: TGridCellFillStyleEh;
  AColor: TColor; AState: TGridDrawState; ACol,
  ARow: Integer; CellPressed: Boolean; ClipRect: TRect);
{$IFDEF EH_LIB_16}
const
  CFixedStates: array[Boolean, Boolean] of TThemedGrid = (
    (tgFixedCellNormal, tgFixedCellPressed),
    (tgFixedCellHot, tgFixedCellPressed));
var
  LStyle: TCustomStyleServices;
  LRect: TRect;
  LDetails: TThemedElementDetails;
  LColor: TColor;
  SaveIndex: Integer;
  RecHandle: HRgn;
{$ENDIF}
begin
{$IFDEF EH_LIB_16}
  if not IsCustomStyleActive then
  begin
    Canvas.Brush.Color := AColor;
    Canvas.FillRect(ARect);
    Exit;
  end;

  LRect := ARect;
  LStyle := StyleServices;

  begin
    if ClipRect = EmptyRect then
      ClipRect := LRect;
    LDetails := LStyle.GetElementDetails(CFixedStates[(gdHotTrack in AState), CellPressed]);
    SaveIndex := SaveDC(Canvas.Handle);
    try
      if Grid.UseRightToLeftAlignment then
      begin
        ClipRect.Left := Grid.ClientWidth - ClipRect.Left;
        ClipRect.Right := Grid.ClientWidth - ClipRect.Right;
        SwapInt(ClipRect.Left, ClipRect.Right);
      end;
      RecHandle := SelectClipRectangleEh(Canvas, ClipRect);
      LStyle.DrawElement(Canvas.Handle, LDetails, LRect, ClipRect);
      RestoreClipRectangleEh(Canvas, RecHandle);
    finally
      RestoreDC(Canvas.Handle, SaveIndex);
    end;

    if LStyle.GetElementColor(LDetails, ecTextColor, LColor) and (LColor <> clNone) then
      Canvas.Font.Color := LColor;
  end;
{$ELSE}
  Grid.FillCellRect(cfstThemedEh, ARect, CellPressed, False, ClipRect, False);
{$ENDIF}
end;

procedure TDBGridEhStyle.Changed;
var
  i: Integer;
begin
  for i := 0 to FGrids.Count-1 do
    TCustomDBGridEh(FGrids[i]).StyleEhChanged;
end;

procedure TDBGridEhStyle.AddChangeNotification(Grid: TCustomDBGridEh);
begin
  if not GridInChangeNotification(Grid) then
    FGrids.Add(Grid);
end;

function TDBGridEhStyle.GetActualTreeGlyphStyle: TTreeViewGlyphStyleEh;
begin
  if ThemesEnabled
    then Result := tvgsThemedEh
    else Result := tvgsClassicEh;
end;

function TDBGridEhStyle.GetColumnColor(Column: TColumnEh): TColor;
begin
{$IFDEF EH_LIB_16}
  if IsCustomStyleActive then
  begin
    Result := StyleServices.GetStyleColor(scGrid);
    if Column.Color <> Column.Grid.Color then
      Result := ApproximateColor(Result, Column.Color, 85);
  end else
    Result := Column.Color;
{$ELSE}
  Result := Column.Color;
{$ENDIF}
end;

function TDBGridEhStyle.GetColumnFontColor(Column: TColumnEh; AState: TGridDrawState): TColor;
{$IFDEF EH_LIB_16}
const
  StyleFontColors: array[Boolean] of TStyleFont = (sfGridItemNormal, sfGridItemSelected);
{$ENDIF}
begin
{$IFDEF EH_LIB_16}
  if IsCustomStyleActive then
  begin
    Result := StyleServices.GetStyleFontColor(StyleFontColors[gdSelected in AState]);
    if Column.Font.Color <> Column.Grid.Font.Color then
      Result := ApproximateColor(Result, Column.Font.Color, 85);
  end else
    Result := Column.Font.Color;
{$ELSE}
  Result := Column.Font.Color;
{$ENDIF}
end;

procedure TDBGridEhStyle.GetDefaultFixedGradientColor(var AStartColor,
  AEndColor: TColor; IsTrack, IsPressed: Boolean);
var
  DummyFillColor, DummyTextColor: TColor;
begin
  GetCustomStyleFixedColors(DummyFillColor, DummyTextColor,
    AStartColor, AEndColor, cfstGradientEh, IsTrack, IsPressed);
end;

procedure TDBGridEhStyle.GetCustomStyleFixedColors(var AFillColor, ATextColor, AStartColor, AEndColor: TColor;
  FillStyle: TGridCellFillStyleEh; IsTrack, IsPressed: Boolean);
{$IFDEF EH_LIB_16}
const
  CFixedStates: array[Boolean, Boolean] of TThemedGrid = (
    (tgFixedCellNormal, tgFixedCellPressed),
    (tgFixedCellHot, tgFixedCellPressed));
  CFixedGradientStates: array[Boolean, Boolean] of TThemedGrid = (
    (tgGradientFixedCellNormal, tgGradientFixedCellPressed),
    (tgGradientFixedCellHot, tgGradientFixedCellPressed));
  CFixedClassicStates: array[Boolean, Boolean] of TThemedGrid = (
    (tgClassicFixedCellNormal, tgClassicFixedCellPressed),
    (tgClassicFixedCellHot, tgClassicFixedCellPressed));
var
  LDetails: TThemedElementDetails;
  LStyle: TCustomStyleServices;
{$ENDIF}
begin
  AFillColor := clNone;
  ATextColor := clNone;
  AStartColor := clNone;
  AEndColor := clNone;
  if not IsCustomStyleActive then
    Exit;
{$IFDEF EH_LIB_16}
  LStyle := StyleServices;
  if FillStyle = cfstThemedEh then
  begin
    LDetails := LStyle.GetElementDetails(CFixedStates[IsTrack, IsPressed]);
    LStyle.GetElementColor(LDetails, ecFillColor, AFillColor);
    LStyle.GetElementColor(LDetails, ecTextColor, ATextColor);
  end else if FillStyle = cfstGradientEh then
  begin
    LDetails := LStyle.GetElementDetails(CFixedGradientStates[IsTrack, IsPressed]);
    LStyle.GetElementColor(LDetails, ecFillColor, AFillColor);
    LStyle.GetElementColor(LDetails, ecTextColor, ATextColor);
    LStyle.GetElementColor(LDetails, ecGradientColor1, AStartColor);
    LStyle.GetElementColor(LDetails, ecGradientColor2, AEndColor);
  end else if FillStyle = cfstSolidEh  then
  begin
    LDetails := LStyle.GetElementDetails(CFixedClassicStates[IsTrack, IsPressed]);
    LStyle.GetElementColor(LDetails, ecFillColor, AFillColor);
    LStyle.GetElementColor(LDetails, ecTextColor, ATextColor);
  end;
{$ENDIF}
end;

{$IFDEF EH_LIB_7}
function TDBGridEhStyle.GetThemeTitleFillElement(AIsDown,
  AIsSelected: Boolean): TThemedElementDetails;
begin
  if ThemeTitleFillElement = gtfeHeaderItemEh then
    if AIsSelected or AIsDown
      then Result := ThemeServices.GetElementDetails(thHeaderItemPressed)
      else Result := ThemeServices.GetElementDetails(thHeaderItemNormal)
  else
    if AIsSelected or AIsDown
      then Result := ThemeServices.GetElementDetails(ttbSplitButtonPressed)
      else Result := ThemeServices.GetElementDetails(ttbSplitButtonHot);

end;
{$ENDIF}

procedure TDBGridEhStyle.GetThemeTitleFillRect(var AFillRect: TRect;
  IncVerBoundary, IncHorzBoundary: Boolean);
begin
  if ThemeTitleFillElement = gtfeHeaderItemEh then
  begin
    if IncHorzBoundary then
      Inc(AFillRect.Bottom, 2);
    if IncVerBoundary then
      Inc(AFillRect.Right, 2);
  end else
  begin
    InflateRect(AFillRect, 1, 1);
  end;
end;

function TDBGridEhStyle.GridInChangeNotification(Grid: TCustomDBGridEh): Boolean;
begin
  Result := (FGrids.IndexOf(Grid) >= 0);
end;

procedure TDBGridEhStyle.RemoveChangeNotification(Grid: TCustomDBGridEh);
begin
  FGrids.Remove(Grid);
end;

procedure TDBGridEhStyle.RemoveAllChangeNotification;
var
  i: Integer;
begin
  for i := 0 to FGrids.Count-1 do
    FGrids.Delete(i);
end;

function TDBGridEhStyle.HighlightDataCellColor(AGrid: TCustomDBGridEh;
  ACol, ARow, DataCol, DataRow: Integer; const Value: string;
  AState: TGridDrawState; InMultiSelect: Boolean; var AColor: TColor; AFont: TFont): Boolean;
var
  AFocused: Boolean;
  AOnplEditorFocused: Boolean;
  SrcColor: TColor;
  HighlightColor, HighlightTextColor: TColor;

  procedure GetHighlightColor;
  begin
    HighlightColor := GetSelectionColor;
    HighlightTextColor := GetSelectionFontColor;
{$IFDEF EH_LIB_16}
    if IsCustomStyleActive then
    begin
      StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecTextColor, HighlightTextColor);
      StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecFillColor, HighlightColor);
    end;
{$ENDIF}
  end;
begin
  SrcColor := AColor;
  Result := False;
  AFocused := False;
  if {(dgMultiSelect in AGrid.Options) and} AGrid.Datalink.Active then
    Result := InMultiSelect{(AGrid.Selection.SelectionType <> gstNon) and
      AGrid.DataCellSelected(DataCol, AGrid.Datalink.Datasource.Dataset.Bookmark)};
  if not Result then
  begin
    AFocused := AGrid.Focused and (dghHighlightFocus in AGrid.OptionsEh) and not AGrid.FilterEditMode;
    AOnplEditorFocused := (AGrid.InplaceEditor <> nil) and AGrid.InplaceEditor.Focused;
    if (dghRowHighlight in AGrid.OptionsEh) and (DataRow + AGrid.TopDataOffset = AGrid.Row) and
      (AGrid.Selection.SelectionType = gstNon) and not (DataCol = AGrid.SelectedIndex)
      and ((dgAlwaysShowSelection in AGrid.Options) or AFocused or AOnplEditorFocused) then
    begin
      AFocused := True;
      AState := AState + [gdSelected];
    end;
    Result := ((gdSelected in AState) or ((ARow) = AGrid.Row) and (dgRowSelect in AGrid.Options))
      and ((dgAlwaysShowSelection in AGrid.Options) or (AFocused))
        { updatelock eliminates flicker when tabbing between rows }
    and ((AGrid.UpdateLock = 0) or (dgRowSelect in AGrid.Options));
  end;
  if Result then
  begin
    GetHighlightColor;
    if AGrid.IsSelectionActive then
    begin
      if (ARow = AGrid.Row) and
         ((DataCol = AGrid.SelectedIndex) or (dgRowSelect in AGrid.Options)) and
         not AGrid.SearchPanel.Active then
      begin
{        if (FScreenNumColors = -1) and ThemeServices.ThemesEnabled then
        begin
          AColor := ApproximateColor(clHighlight, AColor, 128);
        end else}
        begin
          AColor := HighlightColor;
          AFont.Color := HighlightTextColor;
        end;
      end else if LuminateSelection and (FScreenNumColors = -1) then
      begin
        if not ((ARow = AGrid.Row) and ((DataCol = AGrid.SelectedIndex) or (dgRowSelect in AGrid.Options)))
        then
        begin
          AColor := GetNearestColor(AGrid.Canvas.Handle, LightenColor(AColor, HighlightColor, True));
          if dghHotTrack in AGrid.OptionsEh then
            if (dghRowHighlight in AGrid.OptionsEh) and
               (  ( (ACol = AGrid.FHotTrackCell.X) and (ACol <> AGrid.Col) ) or
                    (dgRowSelect in AGrid.Options)
               ) and
               (ARow = AGrid.FHotTrackCell.Y)
            then
              AColor := ApproximateColor(AColor, HighlightColor, 256/3)
        end else if (ARow = AGrid.FHotTrackCell.Y) and AGrid.CanHotTackCell(ACol, ARow) then
        begin
          AColor := GetNearestColor(AGrid.Canvas.Handle, LightenColor(AColor, HighlightColor, True));
        end;
        if AGrid.SearchPanel.Active then
          AColor := ApproximateColor(AColor, GetSelectionInactiveColor, 256/3);
      end;
    end else if (ARow = AGrid.Row) and
                ((ACol = AGrid.Col) or (dgRowSelect in AGrid.Options)) and
                ((dgAlwaysShowSelection in AGrid.Options) or AFocused) then
    begin
      AColor := GetSelectionInactiveColor;
      AFont.Color := HighlightTextColor;
      if dghHotTrack in AGrid.OptionsEh then
        if (ARow = AGrid.FHotTrackCell.Y) and
           ((ACol = AGrid.FHotTrackCell.X) or (dgRowSelect in AGrid.Options)) then
              AColor := ApproximateColor(AColor, LightenColor(AColor, HighlightColor, True), 256/3*2);
    end else if (FScreenNumColors = -1) then
    begin
      AColor := GetNearestColor(AGrid.Canvas.Handle, LightenColor(AColor, clBtnShadow, False));
      if dghHotTrack in AGrid.OptionsEh then
        if (ARow = AGrid.FHotTrackCell.Y) and
           ((ACol = AGrid.FHotTrackCell.X) or (dgRowSelect in AGrid.Options)) then
              AColor := ApproximateColor(AColor, LightenColor(AColor, HighlightColor, True), 256/3*2);
    end else
      AColor := clBtnFace;

    if AGrid.SearchPanel.Active and
       (AGrid.SearchPanel.FoundColumnIndex >= 0) and
       (ARow = AGrid.Row) and
       (DataCol = AGrid.SearchPanel.FoundColumnIndex)
    then
    begin
      AColor := HighlightColor;
      AColor := ApproximateColor(AColor, GetSelectionInactiveColor, 256/3*2);
      AFont.Color := HighlightTextColor;
    end;
  end else
  begin
    if FScreenNumColors = -1 then
      if dghHotTrack in AGrid.OptionsEh then
        if (ARow = AGrid.FHotTrackCell.Y) and AGrid.CanHotTackCell(ACol, ARow) and
          (AGrid.FHotTrackCell.X >= AGrid.IndicatorOffset) then
        begin
          GetHighlightColor;
          if (dghRowHighlight in AGrid.OptionsEh) or (dgRowSelect in AGrid.Options) then
          begin
            AColor := GetNearestColor(AGrid.Canvas.Handle, LightenColor(AColor, HighlightColor, True));
            if (ACol <> AGrid.FHotTrackCell.X) or (dgRowSelect in AGrid.Options) then
              AColor := ApproximateColor(AColor, SrcColor, 256/3*2);
          end else if ACol = AGrid.FHotTrackCell.X then
          begin
            AColor := GetNearestColor(AGrid.Canvas.Handle, LightenColor(AColor, HighlightColor, True));
          end;
      end;
  end;
end;

function TDBGridEhStyle.HighlightNoDataCellColor(AGrid: TCustomDBGridEh;
  ACol, ARow, DataCol, DataRow: Integer; CellType: TCellAreaTypeEh;
  AState: TGridDrawState; InMultiSelect: Boolean; var AColor: TColor;
  AFont: TFont): Boolean;
begin
  Result := False;
  if InMultiSelect then
  begin
    if ((CellType.HorzType = hctIndicatorEh) and
        (CellType.VertType <> vctAboveFooterEh))
      or
       ((CellType.HorzType <> hctIndicatorEh) and
        (CellType.VertType in [vctTitleEh, vctSubTitleEh]))
      or
       ((CellType.HorzType <> hctIndicatorEh) and
        (CellType.VertType = vctFooterEh) and
        (AGrid.FooterColor = AGrid.FixedColor)) then
    begin
//      AColor := RGB(64, 64, 64);
{$IFDEF EH_LIB_16}
      if TStyleManager.IsCustomStyleActive then
      begin
        AColor := ApproximateColor(RGB(64, 64, 64),
            AGrid.FInternalFixedColor, 255 div 4);
        AFont.Color := AGrid.FInternalFixedFontColor;
      end else
{$ENDIF}
      begin
        AColor := ApproximateColor(RGB(64, 64, 64), clHighlight, 255 div 4);
        AFont.Color := clWhite;
      end;
    end else if AGrid.IsSelectionActive then
    begin
      if LuminateSelection and (FScreenNumColors = -1) then
        AColor := LightenColor(AColor, clHighlight, True)
      else
      begin
        AColor := clHighlight;
        AFont.Color := clHighlightText;
      end;
    end else if (FScreenNumColors = -1) then
      AColor := LightenColor(AColor, clBtnShadow, False)
    else
      AColor := clBtnFace;
    Result := True;
  end;
end;

function TDBGridEhStyle.IsCustomStyleActive: Boolean;
begin
{$IFDEF EH_LIB_16}
  Result := TStyleManager.IsCustomStyleActive;
{$ELSE}
  Result := False;
{$ENDIF}
end;

procedure TDBGridEhStyle.SetDefaultSortMarkerStyle(
  const Value: TSortMarkerStyleEh);
begin
  FDefaultSortMarkerStyle := Value;
end;

procedure TDBGridEhStyle.SetGradientEnabledInClassicTheme(const Value: Boolean);
begin
  if FGradientEnabledInClassicTheme <> Value then
  begin
    FGradientEnabledInClassicTheme := Value;
    Changed;
  end;
end;

procedure TDBGridEhStyle.SetLuminateSelection(const Value: Boolean);
begin
  if FLuminateSelection = Value then Exit;
  FLuminateSelection := Value;
  Changed;
end;

procedure TDBGridEhStyle.StyleWndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_SYSCOLORCHANGE then
      try
        SysColorChanged;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;

function TDBGridEhStyle.LightenColor(AColor: TColor; GlassColor: TColor; Ungray: Boolean): TColor;
var
  r, g, b: Double;
  rgb: Longint;
  r_c, g_c, b_c: Double;
  rgb_c: Longint;
begin
  rgb := ColorToRGB(AColor);
  r := rgb and $FF;
  g := (rgb shr 8) and $FF;
  b := (rgb shr 16) and $FF;

  rgb_c := ColorToRGB(GlassColor);
  r_c := rgb_c and $FF;
  g_c := (rgb_c shr 8) and $FF;
  b_c := (rgb_c shr 16) and $FF;

  r := r + (r_c - r) * 0.5;
  g := g + (g_c - g) * 0.5;
  b := b + (b_c - b) * 0.5;

  r := r + (225 - r) * 0.6;
  g := g + (225 - g) * 0.6;
  b := b + (225 - b) * 0.6;

  if Ungray then
  begin
    r := r - (integer(122) - r) * 0.25;
    g := g - (integer(122) - g) * 0.25;
    b := b - (integer(122) - b) * 0.25;
  end;

  Result := TColor((Max(Min(Round(b), 255),0) shl 16)
                or (Max(Min(Round(g), 255),0) shl 8)
                or Max(Min(Round(r), 255),0));
end;

procedure TDBGridEhStyle.SysColorChanged;
var
  DC: HDC;
begin
  DC := GetDC(0);
  FScreenNumColors := GetDeviceCaps(DC, NUMCOLORS); // -1 if more then 256
  if (FScreenNumColors > 1) and (GetDeviceCaps(DC, BITSPIXEL) > 8) then
    FScreenNumColors := -1; // Double check with BITSPIXEL
  ReleaseDC(0, DC);
  ClearButtonsBitmapCache;
end;

function TDBGridEhStyle.GetSubtitleRowColor(Grid: TCustomDBGridEh): TColor;
begin
  Result := DefaultGetSubtitleRowColor(Grid);
  if Assigned(OnGetSubtitleRowColor) then
    OnGetSubtitleRowColor(Grid, Result);
end;

function TDBGridEhStyle.DefaultGetSubtitleRowColor(Grid: TCustomDBGridEh): TColor;
begin
  Result := ApproximateColor(Grid.Color, Grid.FixedColor, 8);
end;

function TDBGridEhStyle.GetGroupPanelColor(Grid: TCustomDBGridEh): TColor;
begin
  Result := ApproximateColor(Grid.FixedColor, Grid.GridLineParams.GetBrightColor, 128);
end;

procedure TDBGridEhStyle.SetSelectionColor(const Value: TColor);
begin
  if FSelectionColor <> Value then
  begin
    FSelectionColor := Value;
    Changed;
  end;
end;

procedure TDBGridEhStyle.SetSelectionFontColor(const Value: TColor);
begin
  if FSelectionFontColor <> Value then
  begin
    FSelectionFontColor := Value;
    Changed;
  end;
end;

function TDBGridEhStyle.GetSelectionColor: TColor;
begin
  if SelectionColor = clDefault
    then Result := clHighlight
    else Result := SelectionColor;
end;

function TDBGridEhStyle.GetSelectionFontColor: TColor;
begin
  if SelectionFontColor = clDefault
    then Result := clHighlightText
    else Result := SelectionFontColor;
end;

function TDBGridEhStyle.GetSelectionInactiveColor: TColor;
begin
  if SelectionInactiveColor = clDefault
    then Result := ColorToGray(GetSelectionColor)
    else Result := SelectionInactiveColor;
end;

procedure TDBGridEhStyle.SetSelectionInactiveColor(const Value: TColor);
begin
  FSelectionInactiveColor := Value;
end;

procedure TDBGridEhStyle.DrawSortMarker(Canvas: TCanvas;  SMStyle: TSortMarkerStyleEh;
  Column: TColumnEh; Direction: TSortMarkerEh; Selected: Boolean; ARect: TRect);
var
  SortMarkerIdx: Integer;
  Points: TPointArray;
{$IFDEF EH_LIB_7}
  thed: TThemedElementDetails;
{$ENDIF}
  OldPenColor: TColor;
begin
  if Direction = smNoneEh then Exit;
  OldPenColor := Canvas.Pen.Color;
  if SMStyle = smstDefaultEh then
    SMStyle := DefaultSortMarkerStyle;
  if SMStyle in [smstDefaultEh, smstClassicEh] then
  begin
    case Direction of
      smDownEh: SortMarkerIdx := 0;
      smUpEh: SortMarkerIdx := 1;
    else
      SortMarkerIdx := -1;
    end;
    if SortMarkerIdx >= 0 then
      SortMarkerIdx := SortMarkerIdx + 3;
    DBGridEhSortMarkerImages.Draw(Canvas, ARect.Left, ARect.Top, SortMarkerIdx);
  end
  else if SMStyle = smstFrameEh then
  begin
    SetLength(Points, 4);
{$IFDEF EH_LIB_16}
    if IsCustomStyleActive and not Selected then
    begin
      Canvas.Pen.Color :=
        ApproximateColor(Column.Grid.FInternalFixedFontColor,
          Column.Grid.FInternalFixedColor, 65);
    end else
{$ENDIF}
    if Selected
      then Canvas.Pen.Color := GetSelectionFontColor
      else Canvas.Pen.Color := //Column.Grid.GridLineParams.GetDarkColor;
              ApproximateColor(
                Column.Grid.GridLineParams.GetDarkColor, cl3DDkShadow, 50);
    if Direction = smDownEh then
    begin
      Points[0].X := (ARect.Right + ARect.Left) div 2;
      Points[0].Y := ARect.Bottom;
      Points[1].X := ARect.Left;
      Points[1].Y := ARect.Top;
      Points[2].X := ARect.Right;
      Points[2].Y := ARect.Top;
      Points[3].X := (ARect.Right + ARect.Left) div 2;
      Points[3].Y := ARect.Bottom;
    end else
    begin
      Points[0].X := (ARect.Right + ARect.Left) div 2;
      Points[0].Y := ARect.Top;
      Points[1].X := ARect.Right;
      Points[1].Y := ARect.Bottom;
      Points[2].X := ARect.Left;
      Points[2].Y := ARect.Bottom;
      Points[3].X := (ARect.Right + ARect.Left) div 2;
      Points[3].Y := ARect.Top;
    end;
    Canvas.Polyline(Points);
  end else if SMStyle = smst3DFrameEh then
  begin
    SetLength(Points, 3);
    if Direction = smDownEh then
    begin
      Canvas.Pen.Color := ApproximateColor(
        Column.Grid.GridLineParams.GetDarkColor, cl3DDkShadow, 85);
      Points[0].X := (ARect.Right + ARect.Left) div 2;
      Points[0].Y := ARect.Bottom;
      Points[1].X := ARect.Left;
      Points[1].Y := ARect.Top;
      Points[2].X := ARect.Right;
      Points[2].Y := ARect.Top;
    end else
    begin
      Canvas.Pen.Color := clWindow;
      Points[0].X := ARect.Left + 1;
      Points[0].Y := ARect.Bottom;
      Points[1].X := ARect.Right;
      Points[1].Y := ARect.Bottom;
      Points[2].X := (ARect.Right + ARect.Left) div 2 + 1;
      Points[2].Y := ARect.Top - 1;
    end;
    Canvas.Polyline(Points);

    Canvas.Pen.Color := clWindow;
    SetLength(Points, 2);
    if Direction = smDownEh then
    begin
      Canvas.Pen.Color := clWindow;
      Points[0].X := (ARect.Right + ARect.Left) div 2 + 1;
      Points[0].Y := ARect.Bottom;
      Points[1].X := ARect.Right + 1;
      Points[1].Y := ARect.Top - 1;
    end else
    begin
      Canvas.Pen.Color := ApproximateColor(
        Column.Grid.GridLineParams.GetDarkColor, cl3DDkShadow, 85);
      Points[0].X := ARect.Left;
      Points[0].Y := ARect.Bottom;
      Points[1].X := (ARect.Right + ARect.Left) div 2;
      Points[1].Y := ARect.Top - 1;
    end;
    Canvas.Polyline(Points);
  end else if SMStyle = smstSolidEh then
  begin
{$IFDEF EH_LIB_16}
    if IsCustomStyleActive and not Selected then
    begin
      Canvas.Pen.Color :=
        ApproximateColor(Column.Grid.FInternalFixedFontColor,
          Column.Grid.FInternalFixedColor, 128);
    end else
{$ENDIF}
    if Selected then
      Canvas.Pen.Color := GetSelectionFontColor
    else if (Column.Grid.TitleParams.GetActualFillStyle = cfstThemedEh) and
            (Column.Grid.GridLineParams.DarkColor = clDefault)
    then
      Canvas.Pen.Color := Column.Grid.GridLineParams.GetDarkColor
    else
      Canvas.Pen.Color := ApproximateColor(Column.Grid.GridLineParams.GetDarkColor,
        Column.Grid.GridLineParams.GetBrightColor, 128);
    if Direction = smDownEh then
      FillGradientEh(Canvas, ARect.TopLeft,
        [Point(0,0), Point(9,0),
         Point(1,1), Point(8,1),
         Point(2,2), Point(7,2),
         Point(3,3), Point(6,3),
         Point(4,4), Point(5,4)
        ],
        Canvas.Pen.Color, Canvas.Pen.Color)
     else
      FillGradientEh(Canvas, ARect.TopLeft,
        [Point(0,4), Point(9,4),
         Point(1,3), Point(8,3),
         Point(2,2), Point(7,2),
         Point(3,1), Point(6,1),
         Point(4,0), Point(5,0)
        ],
        Canvas.Pen.Color, Canvas.Pen.Color);
{$IFDEF EH_LIB_7}
  end else if SMStyle = smstThemeDefinedEh then
  begin
    if Direction = smUpEh
      then thed := ThemeServices.GetElementDetails(thHeaderSortArrowSortedUp)
      else thed := ThemeServices.GetElementDetails(thHeaderSortArrowSortedDown);
    ThemeServices.DrawElement(Canvas.Handle, thed, ARect, nil);
{$ENDIF}
  end;
  Canvas.Pen.Color := OldPenColor;
end;

procedure TDBGridEhStyle.DrawTitleCellBackground(Grid: TCustomDBGridEh;
  Column: TColumnEh; Canvas: TCanvas; const ARect: TRect; FillInside: Boolean;
  var InsideRect: TRect; AState: TGridDrawState;
  var ATitleState: TDBGirdDrawTitleStateEh; ClipRect: TRect);
var
  AFixedState: TDBGirdDrawFixedStateEh;
begin
  AFixedState.Pressed := ATitleState.Down;
  AFixedState.Selected := ATitleState.CellMultiSelected;
  AFixedState.HotTrack := gdHotTrack in AState;
  AFixedState.The3DRect := ATitleState.The3DRect;
  AFixedState.FillStyle := Grid.TitleParams.GetActualFillStyle;
  AFixedState.FillColor := ATitleState.BackColor;
  if Grid.TitleParams.SecondColorStored
    then AFixedState.StartGradientColor := Grid.TitleParams.SecondColor
    else AFixedState.StartGradientColor := clDefault;
  AFixedState.EndGradientColor := clDefault;
  AFixedState.DrawByThemesOverLines := ATitleState.DrawByThemesOverLines;
  AFixedState.FontColor := ATitleState.FontColor;
  AFixedState.HorzBorderInFillStyle := ATitleState.HorzBorderInFillStyle;
  AFixedState.VertBorderInFillStyle := ATitleState.VertBorderInFillStyle;
  AFixedState.HorzLineColor := Grid.TitleParams.GetHorzLineColor;
  AFixedState.VertLineColor := Grid.TitleParams.GetVertLineColor;
  AFixedState.ClipRect := ClipRect;
  DrawFixedCellBackground(Grid, Canvas, ARect, FillInside, InsideRect, AState, AFixedState);
  if IsCustomStyleActive then
    Canvas.Font.Color := AFixedState.FontColor;
end;

procedure TDBGridEhStyle.DrawFixedCellBackground(Grid: TCustomDBGridEh;
  Canvas: TCanvas; const ARect: TRect; FillInside: Boolean;
  var InsideRect: TRect; AState: TGridDrawState;
  var AFixedState: TDBGirdDrawFixedStateEh);
var
  AFillRect: TRect;
  AThemeRect: TRect;
  AClipRec: TRect;
  NeedRightBottomEdges: Boolean;
  AFillColor, ATextColor, AStartColor, AEndColor: TColor;
  RecHandle: HRgn;
begin

  AFillRect := ARect;
  InsideRect := ARect;

  RecHandle := 0;
  if not IsRectEmptyEh(AFixedState.ClipRect) then
    RecHandle := SelectClipRectangleEh(Canvas, AFixedState.ClipRect);
  try
  if IsCustomStyleActive then
    AFixedState.The3DRect := False;

  if AFixedState.FillStyle = cfstThemedEh then
  begin
    AThemeRect := AFillRect;
    if AFixedState.VertBorderInFillStyle and AFixedState.HorzBorderInFillStyle then
    begin
      AThemeRect := ARect;
      AClipRec := EmptyRect;
    end else if AFixedState.DrawByThemesOverLines then
    begin
      AClipRec := EmptyRect;
    end else
    begin
      AClipRec := ARect;
      if AFixedState.FillStyle = cfstThemedEh then
        GetThemeTitleFillRect(AThemeRect, not AFixedState.VertBorderInFillStyle, not AFixedState.HorzBorderInFillStyle);
    end;

    if IsCustomStyleActive then
      DrawCustomStyleCellBackground(Grid, Canvas, AThemeRect, AFixedState.FillStyle,
      Grid.FixedColor, AState, 0, 0, AFixedState.Pressed, AClipRec)
    else
      Grid.FillCellRect(cfstThemedEh, AThemeRect, AFixedState.Pressed,
      AFixedState.Selected, AClipRec, AFixedState.The3DRect, False, AFixedState.StartGradientColor);

    InflateRect(InsideRect, -1, -1);
//    if AFixedState.VertBorderInFillStyle then
      Inc(InsideRect.Left);
      Dec(InsideRect.Right);
    if AFixedState.HorzBorderInFillStyle then
      Dec(InsideRect.Bottom);
  end else
  begin

    if AFixedState.HorzBorderInFillStyle and
       (AFixedState.HorzLineColor <> clNone) then
    begin
      Canvas.Pen.Color := AFixedState.HorzLineColor;
      Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Bottom-1),
                         Point(InsideRect.Right, InsideRect.Bottom-1)]);
      Dec(InsideRect.Bottom);
    end;

    if AFixedState.The3DRect then
    begin

      if AFixedState.HorzBorderInFillStyle or AFixedState.VertBorderInFillStyle then
      begin
    //    InflateRect(ARect, 1, 1);
        NeedRightBottomEdges := not (Grid.Flat or (AFixedState.FillStyle = cfstGradientEh));
        Canvas.Brush.Color := AFixedState.FillColor;
        if not (AFixedState.FillStyle = cfstThemedEh) then
          Grid.DrawEdgeEh(Canvas, InsideRect, AFixedState.Pressed, AFixedState.Selected,
            False, False, not NeedRightBottomEdges);
        Inc(InsideRect.Top);
        Dec(InsideRect.Bottom);
      end else
      begin
    //    InflateRect(ARect, 1, 1);
        NeedRightBottomEdges := not (Grid.Flat or (AFixedState.FillStyle = cfstGradientEh));
        Canvas.Brush.Color := AFixedState.FillColor;
        if not (AFixedState.FillStyle = cfstThemedEh) then
          Grid.DrawEdgeEh(Canvas, InsideRect, AFixedState.Pressed, AFixedState.Selected,
            True, NeedRightBottomEdges, not NeedRightBottomEdges);
        Inc(InsideRect.Top);
        Dec(InsideRect.Bottom);
        Inc(InsideRect.Left);
        if NeedRightBottomEdges then
          Dec(InsideRect.Right)
        else if AFixedState.FillStyle = cfstSolidEh then
        begin
          Canvas.Pen.Color := AFixedState.FillColor;
          Grid.DrawPolyline([Point(InsideRect.Right-1, InsideRect.Top),
                             Point(InsideRect.Right-1, InsideRect.Bottom)]);
          Dec(InsideRect.Right)
        end;
      end;
    end;

    if FillInside then
    begin
      Grid.FillCellRect(AFixedState.FillStyle, InsideRect, AFixedState.Pressed,
        AFixedState.Selected, EmptyRect, False, False, AFixedState.StartGradientColor);

      if AFixedState.VertBorderInFillStyle then
      begin
        Canvas.Pen.Color := AFixedState.VertLineColor;
        Grid.DrawPolyline([Point(InsideRect.Right-1, InsideRect.Top+2),
                         Point(InsideRect.Right-1, InsideRect.Bottom-2)]);
        Dec(InsideRect.Right);
      end;

      if     (AFixedState.HorzBorderInFillStyle or AFixedState.VertBorderInFillStyle) and
             AFixedState.The3DRect and
         not IsCustomStyleActive and
         not Grid.Flat and
         not (AFixedState.FillStyle = cfstGradientEh) then
      begin
        Canvas.Pen.Color := clBtnHighlight;
        Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Top+2),
                           Point(InsideRect.Left, InsideRect.Bottom-2)]);
      end;
      Inc(InsideRect.Left);

      Dec(InsideRect.Right);
      NeedRightBottomEdges := not (Grid.Flat or (AFixedState.FillStyle = cfstGradientEh));
      if not NeedRightBottomEdges then
      begin
        Dec(InsideRect.Right);
        if not AFixedState.The3DRect then
          Inc(InsideRect.Left);
      end;    
    end else
    begin
      if AFixedState.VertBorderInFillStyle then
      begin

        Canvas.Pen.Color := AFixedState.FillColor;
        Grid.DrawPolyline([Point(InsideRect.Right-1, InsideRect.Top),
                           Point(InsideRect.Right-1, InsideRect.Top+2)
                           ]);
        Grid.DrawPolyline([Point(InsideRect.Right-1, InsideRect.Bottom-2),
                           Point(InsideRect.Right-1, InsideRect.Bottom)
                           ]);

        Canvas.Pen.Color := AFixedState.VertLineColor;
        Grid.DrawPolyline([Point(InsideRect.Right-1, InsideRect.Top+2),
                           Point(InsideRect.Right-1, InsideRect.Bottom-2)]);

        Dec(InsideRect.Right);
      end;

      if AFixedState.VertBorderInFillStyle or AFixedState.HorzBorderInFillStyle then
      begin
        if    AFixedState.The3DRect and
          not IsCustomStyleActive and
          not Grid.Flat and not
          (AFixedState.FillStyle = cfstGradientEh) then
        begin
          Canvas.Pen.Color := AFixedState.FillColor;
          Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Top),
                             Point(InsideRect.Left, InsideRect.Top+2)
                             ]);
          Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Bottom-2),
                             Point(InsideRect.Left, InsideRect.Bottom)
                             ]);

          Canvas.Pen.Color := clBtnHighlight;
          Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Top+2),
                             Point(InsideRect.Left, InsideRect.Bottom-2)]);
        end else
        begin
          Canvas.Pen.Color := AFixedState.FillColor;
          Grid.DrawPolyline([Point(InsideRect.Left, InsideRect.Top),
                             Point(InsideRect.Left, InsideRect.Bottom)
                             ]);
        end;
        Inc(InsideRect.Left);
      end;
    end;
  end;

  if IsCustomStyleActive then
  begin
    GetCustomStyleFixedColors(AFillColor, ATextColor, AStartColor, AEndColor,
      AFixedState.FillStyle, AFixedState.HotTrack, AFixedState.Pressed);
    if ATextColor <> clNone then
      AFixedState.FontColor := ATextColor;
  end;
  finally
    if not IsRectEmptyEh(AFixedState.ClipRect) then
      RestoreClipRectangleEh(Canvas, RecHandle);
  end;
end;

function TDBGridEhStyle.GetSortMarkerSize(Canvas: TCanvas; SMStyle: TSortMarkerStyleEh): TSize;
{$IFDEF EH_LIB_7}
var
  thed: TThemedElementDetails;
{$ENDIF}
begin
  Result.cx := -1;
  Result.cy := -1;
  if SMStyle = smstDefaultEh then
    SMStyle := DefaultSortMarkerStyle;
  if SMStyle in [smstDefaultEh, smstClassicEh] then
  begin
    Result.cx := 8;
    Result.cy := 7;
  end else if SMStyle = smstFrameEh then
  begin
    Result.cx := 7;
    Result.cy := 8;
  end else if SMStyle = smstSolidEh then
  begin
    Result.cx := 9;
    Result.cy := 5;
  end else if SMStyle = smst3DFrameEh then
  begin
    Result.cx := 8;
    Result.cy := 7;
  end else if SMStyle = smstThemeDefinedEh then
  begin
{$IFDEF EH_LIB_7}
    thed := ThemeServices.GetElementDetails(thHeaderSortArrowSortedUp);
    GetThemePartSize(ThemeServices.Theme[thed.Element], Canvas.Handle,
      thed.Part, thed.State, nil, TS_TRUE, Result);
    Dec(Result.cx, 2);
    Inc(Result.cy);
{$ENDIF}
  end;
end;

procedure TDBGridEhStyle.SetSortMarkerStyle(const Value: TSortMarkerStyleEh);
begin
  if FSortMarkerStyle <> Value then
  begin
    FSortMarkerStyle := Value;
    Changed;
  end;
end;

function TDBGridEhStyle.GetDataCellHorzOffset(Grid: TCustomDBGridEh; Column: TColumnEh): Integer;
begin
  if DataCellHorzOffset >= 0
    then Result := DataCellHorzOffset
    else Result := 3;
end;

{ TDBGridEhCenter }

var
  FDBGridEhCenter: TDBGridEhCenter = nil;

function SetDBGridEhCenter(NewGridCenter: TDBGridEhCenter): TDBGridEhCenter;
begin
  Result := FDBGridEhCenter;
  FDBGridEhCenter := NewGridCenter;
  FDBGridEhCenter.Changed;
end;

function DBGridEhCenter: TDBGridEhCenter;
begin
  Result := FDBGridEhCenter;
end;

constructor TDBGridEhCenter.Create;
begin
  inherited Create;
  FGrids := TObjectList.Create(False);
  FIndicatorTitleMenus := [itmVisibleColumnsEh, itmCut, itmCopy, itmPaste, itmDelete, itmSelectAll];
  STFilterDefaultStringOperator := fdoAuto;
  STFilterDefaultNumberOperator := fdoAuto;
  STFilterDefaultDateTimeOperator := fdoAuto;
  STFilterDefaultBooleanOperator := fdoAuto;
  FUseExtendedScrollingForMemTable := True;
end;

destructor TDBGridEhCenter.Destroy;
var
  i: Integer;
begin
  if FDBGridEhCenter = Self then
    FDBGridEhCenter := nil;
  for i := FGrids.Count-1 downto 0 do
    TCustomDBGridEh(FGrids[i]).Center := nil;
  FreeAndNil(FGrids);
  inherited Destroy;
end;

procedure TDBGridEhCenter.RemoveAllChangeNotification;
var
  i: Integer;
begin
  for i := 0 to FGrids.Count-1 do
    FGrids.Delete(i);
end;

procedure TDBGridEhCenter.MenuVisibleColumnClick(Sender: TObject);
var
  Column: TColumnEh;
begin
  if Sender is TColumnEhMenuItem then
  begin
    Column := TColumnEhMenuItem(Sender).ColumnEh;
    if Column.Visible and (Column.Grid.VisibleColumns.Count <= 1) then
//  do nothing
    else
      Column.Visible := not Column.Visible;
    TColumnEhMenuItem(Sender).Checked := not TColumnEhMenuItem(Sender).Checked;
  end;
end;

procedure TDBGridEhCenter.MenuEditClick(Sender: TObject);
begin
  if Sender is TDBGridEhMenuItem then
    with (Sender as TDBGridEhMenuItem) do
    begin
      case TitleMenu of
        itmVisibleColumnsEh: ;
        itmCut: DBGridEh_DoCutAction(Grid,False);
        itmCopy: DBGridEh_DoCopyAction(Grid,False);
        itmPaste: DBGridEh_DoPasteAction(Grid,False);
        itmDelete: DBGridEh_DoDeleteAction(Grid,False);
        itmSelectAll: Grid.Selection.SelectAll;
//        itmPreview: ;
      end;
    end;
end;

function TDBGridEhCenter.GridInChangeNotification(Grid: TCustomDBGridEh): Boolean;
begin
  Result := (FGrids.IndexOf(Grid) >= 0);
end;

procedure TDBGridEhCenter.AddChangeNotification(Grid: TCustomDBGridEh);
begin
  if not GridInChangeNotification(Grid) then
    FGrids.Add(Grid);
end;

procedure TDBGridEhCenter.RemoveChangeNotification(Grid: TCustomDBGridEh);
begin
  FGrids.Remove(Grid);
end;

procedure TDBGridEhCenter.BuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu);
begin
  if Assigned(OnBuildIndicatorTitleMenu)
    then OnBuildIndicatorTitleMenu(Grid, PopupMenu)
    else DefaultBuildIndicatorTitleMenu(Grid, PopupMenu);
end;

function TDBGridEhCenter.CanColumnValueReadAsText(Grid: TCustomDBGridEh;
  Column: TColumnEh): Boolean;
begin
  if Column.Field = nil then
    Result := True
  else if (Column.Field <> nil) and (Column.Field.DataType in
   [{ftUnknown,} ftString, ftSmallint, ftInteger, ftWord,
    ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
    {ftBytes,} {ftVarBytes,} ftAutoInc, {ftBlob,} ftMemo, {ftGraphic,} ftFmtMemo,
    {ftParadoxOle,} {ftDBaseOle,} {ftTypedBinary,} {ftCursor,} ftFixedChar, ftWideString,
    ftLargeint, ftADT, {ftArray,} {ftReference,} {ftDataSet,} {ftOraBlob,} {ftOraClob,}
    ftVariant, {ftInterface,} {ftIDispatch,} ftGuid, ftTimeStamp, ftFMTBcd
{$IFDEF EH_LIB_10}
    ,ftFixedWideChar, ftWideMemo, ftOraTimeStamp, ftOraInterval
{$ENDIF}
{$IFDEF EH_LIB_12}
    ,ftLongWord, ftShortint, ftByte, TFieldType.ftExtended
{$ENDIF}
   ]) then
    Result := True
  else
    Result := False;
end;

function TDBGridEhCenter.ColumnValueTypeIsComparable(Grid: TCustomDBGridEh;
  Column: TColumnEh): Boolean;
begin
  if Column.Field = nil then
    Result := True
  else if (Column.Field <> nil) and (Column.Field.DataType in
   [{ftUnknown,} ftString, ftSmallint, ftInteger, ftWord,
    ftBoolean, ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime,
    {ftBytes,} {ftVarBytes,} ftAutoInc, {ftBlob,} ftMemo, {ftGraphic,} ftFmtMemo,
    {ftParadoxOle,} {ftDBaseOle,} {ftTypedBinary,} {ftCursor,} ftFixedChar, ftWideString,
    ftLargeint, ftADT, {ftArray,} {ftReference,} {ftDataSet,} {ftOraBlob,} {ftOraClob,}
    ftVariant, {ftInterface,} {ftIDispatch,} ftGuid, ftTimeStamp, ftFMTBcd
{$IFDEF EH_LIB_10}
    ,ftFixedWideChar, ftWideMemo, ftOraTimeStamp, ftOraInterval
{$ENDIF}
{$IFDEF EH_LIB_12}
    ,ftLongWord, ftShortint, ftByte, TFieldType.ftExtended
{$ENDIF}
   ]) then
    Result := True
  else
    Result := False;
end;

procedure TDBGridEhCenter.CellMouseClick(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Processed: Boolean;
begin
  Processed := False;
  if Assigned(OnCellMouseClick) then
    OnCellMouseClick(Grid, Cell, Button, Shift, X, Y, Processed);
  if not Processed then
    DefaultCellMouseClick(Grid, Cell, Button, Shift, X, Y);
end;

procedure TDBGridEhCenter.IndicatorTitleMouseDown(Grid: TCustomDBGridEh; Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Processed: Boolean;
begin
  Processed := False;
  if Assigned(OnIndicatorTitleMouseDown) then
    OnIndicatorTitleMouseDown(Grid, Cell, Button, Shift, X, Y, Processed);
  if not Processed then
    DefaultIndicatorTitleMouseDown(Grid, Cell, Button, Shift, X, Y);
end;

procedure TDBGridEhCenter.Changed;
begin

end;

procedure TDBGridEhCenter.DefaultBuildIndicatorTitleMenu(Grid: TCustomDBGridEh; var PopupMenu: TPopupMenu);
var
  I: Integer;
  mi: TMenuItem;
  cmi: TColumnEhMenuItem;
//  gmi: TDBGridEhMenuItem;
begin
  if DBGridEhIndicatorTitlePopupMenu = nil then
  begin
    DBGridEhIndicatorTitlePopupMenu := TPopupMenuEh.Create(Screen);
    DBGridEhIndicatorTitlePopupMenu.Name := 'DBGridEhIndicatorTitlePopupMenu';
  end;
  while DBGridEhIndicatorTitlePopupMenu.Items.Count > 0 do
  begin
    mi := DBGridEhIndicatorTitlePopupMenu.Items[0];
    DBGridEhIndicatorTitlePopupMenu.Items.Delete(0);
    if mi.Owner = DBGridEhIndicatorTitlePopupMenu then
      mi.Free;
  end;

  PopupMenu := DBGridEhIndicatorTitlePopupMenu;

  if Grid.IndicatorTitle.UseGlobalMenu and (itmVisibleColumnsEh in IndicatorTitleMenus) then
  begin
    if DBGridEhVisibleColumnsIndicatorMenuItem = nil then
      DBGridEhVisibleColumnsIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
    DBGridEhVisibleColumnsIndicatorMenuItem.Clear;
    DBGridEhVisibleColumnsIndicatorMenuItem.Caption := SVisibleColumnsEh;
    PopupMenu.Items.Add(DBGridEhVisibleColumnsIndicatorMenuItem);

    for I := 0 to Grid.Columns.Count - 1 do
    begin
      if Grid.Columns[i].Title.Caption <> '' then
      begin
//        mi := PopupMenu.CreateMenuItem;
        cmi := TColumnEhMenuItem.Create(PopupMenu);
        cmi.ColumnEh := Grid.Columns[i];
        cmi.Caption := Grid.Columns[i].Title.Caption;
        cmi.Checked := Grid.Columns[i].Visible;
        cmi.OnClick := MenuVisibleColumnClick;
        cmi.CloseMenuOnClick := False;
        DBGridEhVisibleColumnsIndicatorMenuItem.Add(cmi);
      end;
    end;
  end;

// itmCut
  if Grid.IndicatorTitle.UseGlobalMenu and (itmCut in IndicatorTitleMenus) then
  begin
    if DBGridEhCutIndicatorMenuItem = nil then
      DBGridEhCutIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    DBGridEhCutIndicatorMenuItem := TDBGridEhMenuItem.Create(PopupMenu);
    DBGridEhCutIndicatorMenuItem.Caption := SCutEh;
    DBGridEhCutIndicatorMenuItem.OnClick := MenuEditClick;
    DBGridEhCutIndicatorMenuItem.Enabled := Grid.CheckCutAction and (geaCutEh in Grid.EditActions);
    DBGridEhCutIndicatorMenuItem.TitleMenu := itmCut;
    DBGridEhCutIndicatorMenuItem.ShortCut := ShortCut(Word('X'), [ssCtrl]);
    DBGridEhCutIndicatorMenuItem.Grid := Grid;
    PopupMenu.Items.Add(DBGridEhCutIndicatorMenuItem);
  end;

// itmCopy
  if Grid.IndicatorTitle.UseGlobalMenu and (itmCopy in IndicatorTitleMenus) then
  begin
    if DBGridEhCopyIndicatorMenuItem = nil then
      DBGridEhCopyIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    gmi := TDBGridEhMenuItem.Create(PopupMenu);
    DBGridEhCopyIndicatorMenuItem.Caption := SCopyEh;
    DBGridEhCopyIndicatorMenuItem.OnClick := MenuEditClick;
    DBGridEhCopyIndicatorMenuItem.Enabled := Grid.CheckCopyAction and (geaCopyEh in Grid.EditActions);
    DBGridEhCopyIndicatorMenuItem.TitleMenu := itmCopy;
    DBGridEhCopyIndicatorMenuItem.ShortCut := ShortCut(Word('C'), [ssCtrl]);
    DBGridEhCopyIndicatorMenuItem.Grid := Grid;
    PopupMenu.Items.Add(DBGridEhCopyIndicatorMenuItem);
  end;

// itmPaste
  if Grid.IndicatorTitle.UseGlobalMenu and (itmPaste in IndicatorTitleMenus) then
  begin
    if DBGridEhPasteIndicatorMenuItem = nil then
      DBGridEhPasteIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    gmi := TDBGridEhMenuItem.Create(PopupMenu);
    DBGridEhPasteIndicatorMenuItem.Caption := SPasteEh;
    DBGridEhPasteIndicatorMenuItem.OnClick := MenuEditClick;
    DBGridEhPasteIndicatorMenuItem.Enabled := Grid.CheckPasteAction and (geaPasteEh in Grid.EditActions);
    DBGridEhPasteIndicatorMenuItem.TitleMenu := itmPaste;
    DBGridEhPasteIndicatorMenuItem.ShortCut := ShortCut(Word('V'), [ssCtrl]);
    DBGridEhPasteIndicatorMenuItem.Grid := Grid;
    PopupMenu.Items.Add(DBGridEhPasteIndicatorMenuItem);
  end;

// itmDelete
  if Grid.IndicatorTitle.UseGlobalMenu and (itmDelete in IndicatorTitleMenus) then
  begin
    if DBGridEhDeleteIndicatorMenuItem = nil then
      DBGridEhDeleteIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    gmi := TDBGridEhMenuItem.Create(PopupMenu);
    DBGridEhDeleteIndicatorMenuItem.Caption := SDeleteEh;
    DBGridEhDeleteIndicatorMenuItem.OnClick := MenuEditClick;
    DBGridEhDeleteIndicatorMenuItem.Enabled := Grid.CheckDeleteAction and (geaDeleteEh in Grid.EditActions);
    DBGridEhDeleteIndicatorMenuItem.TitleMenu := itmDelete;
    DBGridEhDeleteIndicatorMenuItem.ShortCut := ShortCut(Word('D'), [ssCtrl]);
    DBGridEhDeleteIndicatorMenuItem.Grid := Grid;
    PopupMenu.Items.Add(DBGridEhDeleteIndicatorMenuItem);
  end;

//itmSelectAll
  if Grid.IndicatorTitle.UseGlobalMenu and (itmSelectAll in IndicatorTitleMenus) then
  begin
    if DBGridEhSelectAllIndicatorMenuItem = nil then
      DBGridEhSelectAllIndicatorMenuItem := TDBGridEhMenuItem.Create(Screen);
//    gmi := TDBGridEhMenuItem.Create(PopupMenu);
    DBGridEhSelectAllIndicatorMenuItem.Caption := SSelectAllEh;
    DBGridEhSelectAllIndicatorMenuItem.OnClick := MenuEditClick;
    DBGridEhSelectAllIndicatorMenuItem.Enabled := Grid.CheckSelectAllAction and (geaSelectAllEh in Grid.EditActions);
    DBGridEhSelectAllIndicatorMenuItem.TitleMenu := itmSelectAll;
    DBGridEhSelectAllIndicatorMenuItem.ShortCut := ShortCut(Word('A'), [ssCtrl]);
    DBGridEhSelectAllIndicatorMenuItem.Grid := Grid;
    PopupMenu.Items.Add(DBGridEhSelectAllIndicatorMenuItem);
  end;

{
//  itmPreview
  if itmPreview in IndicatorTitleMenus then
  begin
    gmi := TDBGridEhMenuItem.Create(PopupMenu);
    gmi.Caption := SPreviewEh;
    gmi.OnClick := MenuEditClick;
    gmi.Enabled := True;
    gmi.TitleMenu := itmPreview;
    gmi.Grid := Grid;
    PopupMenu.Items.Add(gmi);
  end;
}

// Grid.IndicatorTitle.DropdownMenu
  if Grid.IndicatorTitle.DropdownMenu <> nil then
  begin
    if PopupMenu.Items.Count > 0 then
    begin
      mi := TMenuItem.Create(PopupMenu);
      mi.Caption := cLineCaption;
      PopupMenu.Items.Add(mi);
    end;
//    PopupMenu.Assign(Grid.IndicatorTitle.DropdownMenu);
    for I := 0 to Grid.IndicatorTitle.DropdownMenu.Items.Count - 1 do
    begin
      mi := TMenuItem.Create(PopupMenu);
//      mi := TMenuItem.Create(Application);
      mi.Action := Grid.IndicatorTitle.DropdownMenu.Items[I].Action;
{$IFDEF EH_LIB_6}
      mi.AutoCheck := Grid.IndicatorTitle.DropdownMenu.Items[I].AutoCheck;
{$ENDIF}
      mi.AutoHotkeys := Grid.IndicatorTitle.DropdownMenu.Items[I].AutoHotkeys;
      mi.AutoLineReduction := Grid.IndicatorTitle.DropdownMenu.Items[I].AutoLineReduction;
      mi.Bitmap := Grid.IndicatorTitle.DropdownMenu.Items[I].Bitmap;
      mi.Break := Grid.IndicatorTitle.DropdownMenu.Items[I].Break;
      mi.Caption := Grid.IndicatorTitle.DropdownMenu.Items[I].Caption;
      mi.Checked := Grid.IndicatorTitle.DropdownMenu.Items[I].Checked;
      mi.SubMenuImages := Grid.IndicatorTitle.DropdownMenu.Items[I].SubMenuImages;
      mi.Default := Grid.IndicatorTitle.DropdownMenu.Items[I].Default;
      mi.Enabled := Grid.IndicatorTitle.DropdownMenu.Items[I].Enabled;
      mi.GroupIndex := Grid.IndicatorTitle.DropdownMenu.Items[I].GroupIndex;
      mi.HelpContext := Grid.IndicatorTitle.DropdownMenu.Items[I].HelpContext;
      mi.Hint := Grid.IndicatorTitle.DropdownMenu.Items[I].Hint;
      mi.ImageIndex := Grid.IndicatorTitle.DropdownMenu.Items[I].ImageIndex;
      mi.RadioItem := Grid.IndicatorTitle.DropdownMenu.Items[I].RadioItem;
      mi.ShortCut := Grid.IndicatorTitle.DropdownMenu.Items[I].ShortCut;
      mi.Visible := Grid.IndicatorTitle.DropdownMenu.Items[I].Visible;
      mi.OnClick := Grid.IndicatorTitle.DropdownMenu.Items[I].OnClick;
      mi.OnDrawItem := Grid.IndicatorTitle.DropdownMenu.Items[I].OnDrawItem;
      mi.OnAdvancedDrawItem := Grid.IndicatorTitle.DropdownMenu.Items[I].OnAdvancedDrawItem;
      mi.OnMeasureItem := Grid.IndicatorTitle.DropdownMenu.Items[I].OnMeasureItem;
      PopupMenu.Items.Add(mi);
      PopupMenu.Images := Grid.IndicatorTitle.DropdownMenu.Items[I].GetImageList;
    end;

  end;
end;

procedure TDBGridEhCenter.DefaultCellMouseClick(Grid: TCustomDBGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TDBGridEhCenter.DefaultIndicatorTitleMouseDown(Grid: TCustomDBGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Grid.IndicatorTitleMouseDown(Cell, Button, Shift, X, Y);
end;

procedure TDBGridEhCenter.ApplyFilter(AGrid: TCustomDBGridEh);
begin
  if Assigned(FOnApplyFilter)
    then FOnApplyFilter(AGrid)
    else DefaultApplyFilter(AGrid);
end;

procedure TDBGridEhCenter.DefaultApplyFilter(AGrid: TCustomDBGridEh);
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      DatasetFeatures.ApplyFilter(AGrid, AGrid.DataSource.DataSet, AGrid.DataSource.DataSet.Active);
  end;
end;

procedure TDBGridEhCenter.ApplySimpleTextFilter(AGrid: TCustomDBGridEh;
  FieldNames: String; Operation: TLSAutoFilterTypeEh; FilterText: String);
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      DatasetFeatures.ApplySimpleTextFilter(AGrid.DataSource.DataSet, FieldNames, Operation, FilterText);
  end;
end;

procedure TDBGridEhCenter.ApplySorting(AGrid: TCustomDBGridEh);
begin
  if Assigned(FOnApplySorting)
    then FOnApplySorting(AGrid)
    else DefaultApplySorting(AGrid);
end;

procedure TDBGridEhCenter.DefaultApplySorting(AGrid: TCustomDBGridEh);
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      DatasetFeatures.ApplySorting(AGrid, AGrid.DataSource.DataSet, AGrid.DataSource.DataSet.Active);
  end;
end;

function TDBGridEhCenter.MoveRecords(AGrid: TCustomDBGridEh;
  BookmarkList: TBMListEh; ToRecNo: Longint; CheckOnly: Boolean): Boolean;
begin
  Result := DefaultMoveRecords(AGrid, BookmarkList, ToRecNo, CheckOnly);
end;

function TDBGridEhCenter.DefaultMoveRecords(AGrid: TCustomDBGridEh;
  BookmarkList: TBMListEh; ToRecNo: Longint; CheckOnly: Boolean): Boolean;
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  Result := False;
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      Result := DatasetFeatures.MoveRecords(AGrid, BookmarkList, ToRecNo, CheckOnly);
  end;
end;

function TDBGridEhCenter.LocateText(AGrid: TCustomDBGridEh; const FieldName: string;
  const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh;
  Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean;
begin
  if Assigned(OnLocateText) then
    Result := OnLocateText(AGrid, FieldName, Text, Options, Direction, Matching, TreeFindRange)
  else
    Result := DefaultLocateText(AGrid, FieldName, Text, Options, Direction, Matching, TreeFindRange);
end;

function TDBGridEhCenter.DefaultLocateText(AGrid: TCustomDBGridEh; const FieldName: string;
  const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh;
  Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean;
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      Result := DatasetFeatures.LocateText(AGrid, FieldName, Text, Options, Direction, Matching, TreeFindRange)
    else
      Result := DefaultLocateDatasetTextEh(AGrid, FieldName, Text, Options, Direction, Matching);
  end else
    Result := DefaultLocateDatasetTextEh(AGrid, FieldName, Text, Options, Direction, Matching);
end;

procedure TDBGridEhCenter.ExecuteFindDialog(AGrid: TCustomDBGridEh; Text, FieldName: String; Modal: Boolean);
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      DatasetFeatures.ExecuteFindDialog(AGrid, Text, FieldName, Modal)
    else
      ExecuteDBGridEhFindDialogProc(AGrid, Text, '', nil, Modal);
  end else
    ExecuteDBGridEhFindDialogProc(AGrid, Text, '', nil, Modal);
end;

procedure TDBGridEhCenter.DefaultFillSTFilterListValues(Grid: TCustomDBGridEh;
  Column: TColumnEh; Items: TStrings);
begin
  Grid.DefaultFillSTFilterListValues(Column, Items);
end;

function TDBGridEhCenter.GetSTFilterDefaultOperator(Grid: TCustomDBGridEh;
  Column: TColumnEh; var FExpression: TSTFilterExpressionEh): TSTFilterDefaultOperatorEh;
begin
  if Column.STFilter.KeyField <> '' then
    Result := fdoEqual
  else
    case FExpression.ExpressionType of
      botNon      : Result := STFilterDefaultStringOperator;
      botString   : Result := STFilterDefaultStringOperator;
      botNumber   : Result := STFilterDefaultNumberOperator;
      botDateTime : Result := STFilterDefaultDateTimeOperator;
      botBoolean  : Result := STFilterDefaultBooleanOperator;
    else
      Result := STFilterDefaultStringOperator;
    end;
end;

procedure TDBGridEhCenter.DefaultFillSTFilterListCommandValues(
  AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings);
var
  ASTFilter: TSTColumnFilterEh;
begin
  ASTFilter := Column.STFilter;
  Items.BeginUpdate;
  try
    if (dghAutoSortMarking in AGrid.OptionsEh) and ASTFilter.Column.Title.TitleButton then
    begin
      Items.AddObject(SSTFilterListItem_SortingByAscend, PopupListboxItemEhSortAsc);
      Items.AddObject(SSTFilterListItem_SortingByDescend, PopupListboxItemEhSortDes);
      Items.AddObject('-', PopupListboxItemEhLine);
    end;
    Items.AddObject(SSTFilterListItem_ClearFilter, PopupListboxItemEhClearFilter);
    if not AGrid.STFilter.InstantApply then
      Items.AddObject(SSTFilterListItem_ApplyFilter, PopupListboxItemEhApplyFilter);
    Items.AddObject(SSTFilterListItem_CustomFilter, PopupListboxItemEhDialog);
    Items.AddObject(SSTFilterListItem_All, PopupListboxItemEhAll);
    Items.AddObject(SSTFilterListItem_NotEmpties, PopupListboxItemEhNotEmties);
    Items.AddObject(SSTFilterListItem_Empties, PopupListboxItemEhEmpties);
  finally
    Items.EndUpdate;
  end;
end;

procedure TDBGridEhCenter.DefaultFillSTFilterListDataValues(
  AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings);
var
  DatasetFeatures: TDatasetFeaturesEh;
begin
  if (AGrid.DataSource <> nil) and (AGrid.DataSource.DataSet <> nil) then
  begin
    DatasetFeatures := GetDatasetFeaturesForDataSet(AGrid.DataSource.DataSet);
    if DatasetFeatures <> nil then
      DatasetFeatures.FillSTFilterListDataValues(AGrid, Column, Items)
    else
      StandardFillSTFilterListDataValues(AGrid, Column, Items);
  end else
    StandardFillSTFilterListDataValues(AGrid, Column, Items);
end;

procedure TDBGridEhCenter.StandardFillSTFilterListDataValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings);
var
  ASTFilter: TSTColumnFilterEh;
  TmpExpression: TSTFilterExpressionEh;
  Filter: String;
  i, k: Integer;
  AGetValues: TStrings;
begin

  ASTFilter := Column.STFilter;
  if Column.FieldValueList = nil then
    if ASTFilter.ListSource <> nil then
      Column.FieldValueList := ASTFilter.GetFieldValueList
    else if AGrid.FIntMemTable <> nil then
    begin
      Column.FieldValueList := AGrid.FIntMemTable.GetFieldValueList(Column.FieldName);
    end;

  Items.BeginUpdate;
  try
    if Column.FieldValueList <> nil then
    begin
      TmpExpression := ASTFilter.Expression;
      ASTFilter.FExpression.Operator1 := foNon;
      ASTFilter.FExpression.Relation := foNon;
      try
        Filter := GetExpressionAsFilterString(AGrid,
          GetOneExpressionAsLocalFilterString, nil, False, True);
      finally
        ASTFilter.FExpression.Operator1 := TmpExpression.Operator1;
        ASTFilter.FExpression.Relation := TmpExpression.Relation;
      end;
      Column.FieldValueList.SetFilter(Filter);

      AGrid.FSuppressDataSetChanged := True;
      try
        AGetValues := Column.FieldValueList.GetValues;
      finally
        AGrid.FSuppressDataSetChanged := False;
      end;
      for i := 0 to AGetValues.Count - 1 do
        if AGetValues[i] <> '' then // ?
          Items.AddObject(AGetValues[i], PopupListboxItemEhData);
    end;

    if ASTFilter.ListSource = nil then
      if (Column.KeyList.Count > 0) and (Column.PickList.Count > 0) then
      begin
        for i := 0 to Items.Count - 1 do
        begin
          k := Column.KeyList.IndexOf(Items[i]);
          if k >= 0 then
            Items[i] := Column.PickList[k];
        end;
      end;

  finally
    Items.EndUpdate;
  end;
end;

function TDBGridEhCenter.GetFirstSortMarkerState(Grid: TCustomDBGridEh; Column: TColumnEh): TSortMarkerEh;
begin
  if (Column.Field <> nil) and
    ( (Column.Field is TStringField) or
      (Column.Field.DataType in [ftMemo, ftFmtMemo{$IFDEF EH_LIB_10}, ftWideMemo{$ENDIF}])
    ) then
    Result := smUpEh
  else
    Result := smDownEh;
end;

function TDBGridEhCenter.GetSortOrderForSortMarker(Grid: TCustomDBGridEh; Column: TColumnEh;
  SortMarker: TSortMarkerEh): TSortOrderEh;
begin
  if SortMarker = smDownEh then
    Result := soDescEh
  else if SortMarker = smUpEh then
    Result := soAscEh
  else
    raise Exception.Create('SortOrder for SortMarker None is not defined.');
end;

type

{ TInplaceFilterEditEh }

  TInplaceFilterEditEh = class(TDBComboBoxEh)
  private
    FColumn: TColumnEh;
  protected
    function GetGrid: TCustomDBGridEh;
    procedure CalcEditRect(var ARect: TRect); override;
    procedure SetKeyDisplayText(AValue: Variant; AText: String);
    procedure InternalSetValue(AValue: Variant); override;
    procedure InternalUpdatePostData; override;
    procedure SetVariantValue(const VariantValue: Variant); override;
    function GetPopupListboxColor: TColor; override;
    function SelfPopupListboxFont: TFont; override;
  public
    procedure CloseUp(Accept: Boolean); override;
    procedure SelectAll;
    procedure SelectNextValue(IsPrior: Boolean); override;
    property Column: TColumnEh read FColumn;
    property Grid: TCustomDBGridEh read GetGrid;
    property PopupListbox;
  end;

{ TDBGridInplaceEdit }

  TDBGridInplaceEdit = class(TDBAxisGridInplaceEdit)
  private
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KillFocus;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;

    function GetGrid: TCustomDBGridEh;
    function GetColumn: TColumnEh;
  protected
    procedure DropDown; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure PaintRequiredState(ACanvas: TCanvas); virtual;
    procedure PaintWindow(DC: HDC); override;
    property Column: TColumnEh read GetColumn;
    property Grid: TCustomDBGridEh read GetGrid;
  public
    procedure Invalidate; override;
  end;

{ TDBGridInplaceEdit }

procedure TDBGridInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);

  procedure SendToParent;
  begin
    Grid.KeyDown(Key, Shift);
    Key := 0;
  end;

begin
  if (Key = VK_RETURN) and not ((MRUList <> nil) and MRUList.DroppedDown) and (dghEnterAsTab in Grid.OptionsEh) then
    SendToParent
  else if (ShortCut(Key, Shift) = DBGridEhSetValueFromPrevRecordKey) then
    SendToParent
  else if (ShortCut(Key, Shift) = DBGridEhInplaceSearchKey) and (dghIncSearch in Grid.OptionsEh) then
    if Grid.InplaceSearching and (dghDialogFind in Grid.OptionsEh) and (DBGridEhFindDialogKey = DBGridEhInplaceSearchKey) then
    begin
      Grid.StopInplaceSearch;
      Grid.ExecuteFindDialog(SelText, '', Grid.IsFindDialogShowAsModal);
    end else
      Grid.StartInplaceSearch('', -1, ltdAllEh)
  else if (ShortCut(Key, Shift) = DBGridEhFindDialogKey) and (dghDialogFind in Grid.OptionsEh) then
      Grid.ExecuteFindDialog(SelText, '', Grid.IsFindDialogShowAsModal)
  else
    inherited KeyDown(Key, Shift);
end;

function TDBGridInplaceEdit.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(inherited Grid);
end;

procedure TDBGridInplaceEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Grid.FIntMemTable <> nil) and (Column = Grid.VisibleColumns[0]) and Grid.FIntMemTable.MemTableIsTreeList then
    if Grid.UseRightToLeftAlignment then
    begin
      if (ClientWidth >= X ) and (X > ClientWidth - Grid.GetCellTreeElmentsAreaWidth) then
        if (ClientWidth - (Grid.GetCellTreeElmentsAreaWidth - 18) >= X ) then
          Grid.FIntMemTable.SetTreeNodeExpanded(Grid.Row - Grid.TopDataOffset, not Grid.FIntMemTable.GetTreeNodeExpanded);
    end else
    if (0 <= X ) and (X < Grid.GetCellTreeElmentsAreaWidth) then
    begin
      if (Grid.GetCellTreeElmentsAreaWidth - 18 <= X ) then
        Grid.FIntMemTable.SetTreeNodeExpanded(Grid.Row - Grid.TopDataOffset, not Grid.FIntMemTable.GetTreeNodeExpanded);
    end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDBGridInplaceEdit.PaintWindow(DC: HDC);
begin
  FCanvas.Lock;
  try
    FCanvas.Handle := DC;
    try
      TControlCanvas(FCanvas).UpdateTextFlags;
      if (Grid.FIntMemTable <> nil) and (Column = Grid.VisibleColumns[0]) and Grid.FIntMemTable.MemTableIsTreeList then
      begin
        TControlCanvas(FCanvas).Brush.Color := Grid.FInternalColor;
        if Grid.UseRightToLeftAlignment then
          ChangeCanvasDrawOrientation(FCanvas, True, ClientWidth, ClientHeight);
        Grid.DrawTreeArea(FCanvas, Rect(0, 0, Width, Height), False, False);
        if Grid.UseRightToLeftAlignment then
          ChangeCanvasDrawOrientation(FCanvas, False, ClientWidth, ClientHeight);
      end;
      PaintRequiredState(FCanvas);
    finally
      FCanvas.Handle := 0;
    end;
  finally
    FCanvas.Unlock;
  end;
  if (Column <> nil) and (Column.ImageList <> nil) and Column.ShowImageAndText then
    DrawEditImage(DC);
  inherited PaintWindow(DC);
end;

procedure TDBGridInplaceEdit.PaintRequiredState(ACanvas: TCanvas);
var
  r: TRect;
  DrawState: Boolean;
begin
  DrawState := Column.HighlightRequired and Grid.DataLink.Active and
    (Grid.DataLink.DataSet.State in [dsInsert, dsEdit]) and (Column.Field <> nil) and
    Column.Field.Required and Column.Field.IsNull;
  if Assigned(Column.FOnCheckDrawRequiredState) then
    Column.FOnCheckDrawRequiredState(Self, Text, DrawState);
  if DrawState then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Pen.Style := psDot;
    CalcEditRect(r);
    ACanvas.MoveTo(r.Left+2, ClientHeight-1);
    ACanvas.LineTo(r.Right-3, ClientHeight-1);
  end;
end;


function TDBGridInplaceEdit.GetColumn: TColumnEh;
begin
  Result := TColumnEh(inherited AxisBar);
end;

procedure TDBGridInplaceEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if Grid.FSelectionActive <> Grid.IsSelectionActive then
    Grid.SelectionActiveChanged;
  if (Message.FocusedWnd <> Grid.Handle) and Grid.FInTitleFilterListboxVisible then
    Grid.InTitleFilterListboxCloseUp(False);
end;

procedure TDBGridInplaceEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  if Grid.FSelectionActive <> Grid.IsSelectionActive then
    Grid.SelectionActiveChanged;
  inherited;
end;

procedure TDBGridInplaceEdit.Invalidate;
begin
  if Grid.RowPanel.Active
    then  Perform(CM_INVALIDATE, 0, 0)
    else  inherited Invalidate;
end;

procedure TDBGridInplaceEdit.DropDown;
begin
  inherited DropDown;
end;

{ TGridDataLinkEh }

procedure TGridDataLinkEh.ActiveChanged;
begin
  inherited ActiveChanged;
  TCustomDBGridEh(Grid).UpdateScrollBarPanels;
end;

{ TColumnTitleEh }

constructor TColumnTitleEh.Create(Column: TColumnEh);
begin
  inherited Create(Column);
  SortMarker := smNoneEh;
end;

destructor TColumnTitleEh.Destroy;
begin
  inherited Destroy;
end;

procedure TColumnTitleEh.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TColumnTitleEh then
  begin
    SortIndex := TColumnTitleEh(Source).SortIndex;
    SortMarker := TColumnTitleEh(Source).SortMarker;
  end;
end;

function TColumnTitleEh.GetColumn: TColumnEh;
begin
  Result := TColumnEh(inherited  AxisBar);
end;


function TColumnTitleEh.GetSortMarkingWidth: Integer;
var
  SMTMarg: Integer;
  Canvas: TCanvas;
begin
  Result := 0;
  if SortIndex <> 0 then
  begin
    Inc(Result, 16);
    Canvas := Column.GetGrid.Canvas;
    if (Column.GetGrid.SortMarkedColumns.Count > 1) then
    begin
      Canvas.Font := SortMarkerFont;
      SMTMarg := Canvas.TextWidth(IntToStr(SortIndex));
      Inc(Result, SMTMarg);
    end else
      SMTMarg := 0;
    if Column.Width - 4 < Result then
      Dec(Result, 14);
    if Column.Width - 4 < Result then
      Dec(Result, 2 + SMTMarg);
  end;
end;

procedure TColumnTitleEh.RestoreDefaults;
begin
  inherited RestoreDefaults;
end;

procedure TColumnTitleEh.SetSortMarker(Value: TSortMarkerEh);
var
  AColumns: TDBGridColumnsEh;
  i, ASortIndex: Integer;
  Grid: TCustomDBGridEh;
begin
  if (Value = FSortMarker) then Exit;
  FSortMarker := Value;
  Grid := Column.GetGrid;
  if (Column.Collection <> nil) and (TDBGridColumnsEh(Column.Collection).UpdateCount > 0) then Exit;
  AColumns := TDBGridColumnsEh(Column.Collection);
  if not (dghMultiSortMarking in Grid.OptionsEh) then
  begin
    if FSortMarker = smNoneEh then
    begin
      FSortIndex := 0;
      Grid.FSortMarkedColumns.Clear;
    end else
    begin
      for i := 0 to AColumns.Count - 1 do
        if (AColumns[i].Title.SortMarker <> smNoneEh) and (AColumns[i] <> Column)
          then AColumns[i].Title.SortMarker := smNoneEh;
      FSortIndex := 1;
      Grid.FSortMarkedColumns.Clear;
      Grid.FSortMarkedColumns.Add(Column);
    end;
  end else if (FSortMarker <> smNoneEh) and (SortIndex = 0) then
  begin
    ASortIndex := 1;
    for i := 0 to AColumns.Count - 1 do
      if AColumns[i].Title.SortIndex <> 0 then Inc(ASortIndex);
    FSortIndex := ASortIndex;
    Grid.FSortMarkedColumns.Add(Column);
  end else if (FSortMarker = smNoneEh) and (SortIndex <> 0) then
  begin
    for i := 0 to AColumns.Count - 1 do
      if AColumns[i].Title.SortIndex > SortIndex then Dec(AColumns[i].Title.FSortIndex);
    Grid.FSortMarkedColumns.Remove(Column);
    FSortIndex := 0;
  end;
  Column.Changed(False);
end;

procedure TColumnTitleEh.SetSortIndex(Value: Integer);
var
  AColumns: TDBGridColumnsEh;
  i: Integer;
begin
  if (Value < 0) then Value := 0;
  if Value = FSortIndex then Exit;
  if (Column.Collection <> nil) and (TDBGridColumnsEh(Column.Collection).UpdateCount > 0) then
  begin
    FSortIndex := Value;
    Exit;
  end;
  if SortMarker = smNoneEh then Exit;
  AColumns := TDBGridColumnsEh(Column.Collection);
  for i := 0 to AColumns.Count - 1 do
  begin
    if (AColumns[i].Title.SortIndex <> 0) and
      (AColumns[i].Title.SortIndex = Value) and (AColumns[i] <> Column) then
    begin
      AColumns[i].Title.FSortIndex := FSortIndex;
      FSortIndex := Value;
      with Column.GetGrid.FSortMarkedColumns do
        Exchange(IndexOf(AColumns[i]), IndexOf(Column));
      Column.Changed(False);
      Exit;
    end;
  end;
end;

procedure TColumnTitleEh.SetNextSortMarkerValue(KeepMulti: Boolean);
var
  Grid: TCustomDBGridEh;
  i: Integer;
begin
  Grid := Column.GetGrid;
  if not KeepMulti then
  begin
    for i := 0 to Grid.Columns.Count - 1 do
      if (Grid.Columns[i].Title.SortMarker <> smNoneEh) and (Grid.Columns[i] <> Column)
        then Grid.Columns[i].Title.SortMarker := smNoneEh;
  end;
  case SortMarker of
    smNoneEh:
      SortMarker := Grid.Center.GetFirstSortMarkerState(Grid, Column);
    smDownEh:
      if KeepMulti then
        if Grid.Center.GetFirstSortMarkerState(Grid, Column) = smUpEh
          then SortMarker := smNoneEh
          else SortMarker := smUpEh
      else
        SortMarker := smUpEh;
    smUpEh:
      if KeepMulti then
        if Grid.Center.GetFirstSortMarkerState(Grid, Column) = smDownEh
          then SortMarker := smNoneEh
          else SortMarker := smDownEh
      else
        SortMarker := smDownEh;
  end;
end;

function TColumnTitleEh.GetFilterButtonAreaWidth: Integer;
begin
  Result := 0;
  if Column.GetGrid.STFilter.Visible and Column.STFilter.Visible and
    (Column.GetGrid.STFilter.Location = stflInTitleFilterEh) then
  begin
    if Column.GetGrid.Flat then
    begin
      Result := FlatButtonWidth;
      if not ThemesEnabled then
        Inc(Result);
    end else
      Result := GetSystemMetrics(SM_CXVSCROLL);
  end;
end;

{ TColumnEh }

constructor TColumnEh.Create(Collection: TCollection);
var
  Grid: TCustomDBGridEh;
  LayoutStarted: Boolean;
begin
  Grid := nil;
  LayoutStarted := False;
  if Assigned(Collection) and (Collection is TDBGridColumnsEh) then
    Grid := TDBGridColumnsEh(Collection).Grid;
  if Assigned(Grid) and (TDBGridColumnsEh(Collection).UpdateCount = 0) then
  begin
    Grid.BeginLayout;
    LayoutStarted := True;
  end;
  try
    inherited Create(Collection);
    FFooter := CreateFooter;
    FFooters := CreateFooters;
    FSTFilter := CreateSTFilter;
    FAutoFitColWidth := True;
    FInitWidth := Width;
  finally
    if Assigned(Grid) and LayoutStarted then
      Grid.EndLayout;
  end;
end;

destructor TColumnEh.Destroy;
var
  Form: TCustomForm;
  AGrid: TCustomDBGridEh;
begin
  if (Grid <> nil) then
    Grid.SortMarkedColumns.Remove(Self);
  if Assigned(Collection) and
     (Collection is TDBGridColumnsEh) and
     (TDBGridColumnsEh(Collection).FUpDownBaseColumn = Self)
  then
    TDBGridColumnsEh(Collection).FUpDownBaseColumn := nil;
  if (Grid <> nil) and Grid.FilterEditMode and
     (TInplaceFilterEditEh(Grid.FilterEdit).Column = Self)
  then
    Grid.StopEditFilter;
  Collection := nil;
  AGrid := Grid;
  FreeAndNil(FFooter);
{  Designer := FindRootDesigner(Self);
  if Designer <> nil then Designer.Notification(FFooters,opRemove);}
  Form := nil;
  if AGrid <> nil then
    Form := GetParentForm(AGrid);
  if (Form <> nil) and (Form.Designer <> nil)
    then Form.Designer.Notification(TPersistent(FFooters), opRemove);

  FreeAndNil(FFooters);
  FreeAndNil(FSTFilter);
  inherited Destroy;
end;

procedure TColumnEh.Assign(Source: TPersistent);
begin
  if Source is TColumnEh then
  begin
    if Assigned(Collection) then Collection.BeginUpdate;
    try
      inherited Assign(Source);
      RestoreDefaults;
      if Source is TColumnEh then
      begin
        if cvWidth in TColumnEh(Source).AssignedValues then
          Width := TColumnEh(Source).Width;
        FInitWidth := TColumnEh(Source).FInitWidth;
        AutoFitColWidth := TColumnEh(Source).AutoFitColWidth;
        Footer := TColumnEh(Source).Footer;
        Footers := TColumnEh(Source).Footers;
        MinWidth := TColumnEh(Source).MinWidth;
        MaxWidth := TColumnEh(Source).MaxWidth;
        OnGetCellParams := TColumnEh(Source).OnGetCellParams;
        HideDuplicates := TColumnEh(Source).HideDuplicates;
      end;  
    finally
      if Assigned(Collection) then Collection.EndUpdate;
    end;
  end else
    inherited Assign(Source);
end;

function TColumnEh.CreateTitle: TAxisBarTitleEh;
begin
  Result := TColumnTitleEh.Create(Self);
end;

function TColumnEh.GetField: TField;
var
  Grid: TCustomDBGridEh;
begin { Returns Nil if FieldName can't be found in dataset }
  if FField <> nil then
  begin
    Result := inherited GetField;
    Exit;
  end;  
  Grid := GetGrid;
  if (FField = nil) and (FieldName <> '') and Assigned(Grid) and
    Assigned(Grid.DataLink.DataSet)
  then
  begin
    Result := inherited GetField;
    EnsureSumValue;
  end else
    Result := inherited GetField;
end;

function TColumnEh.DefaultWidth: Integer;
var
  RestoreCanvas: Boolean;
  TM: TTextMetric;
begin
  if GetGrid = nil then
  begin
    Result := 64;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      RestoreCanvas := not HandleAllocated and not FCanvasHandleAllocated; //not Canvas.HandleAllocated;
      if RestoreCanvas then
      begin
        Canvas.Handle := GetDC(0);
        FCanvasHandleAllocated := True;
      end;
      try
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        Result := Field.DisplayWidth * (Canvas.TextWidth('0') - TM.tmOverhang) + TM.tmOverhang + 4;
      finally
        if RestoreCanvas then
        begin
          ReleaseDC(0, Canvas.Handle);
          Canvas.Handle := 0;
          FCanvasHandleAllocated := False;
        end;
      end;
    end else
      Result := DefaultColWidth;
  end;
end;

function TColumnEh.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(inherited GetGrid);
end;

function TColumnEh.GetWidth: Integer;
begin
  if cvWidth in AssignedValues
    then Result := FWidth
    else Result := DefaultWidth;
end;

function TColumnEh.IsWidthStored: Boolean;
begin
  Result := (cvWidth in AssignedValues) and (FWidth <> DefaultWidth);
end;

procedure TColumnEh.SetField(Value: TField);
begin
  if Field = Value then Exit;
  inherited SetField(Value);
  if SeenPassthrough then
  begin
    FInitWidth := Width;
  end;
  EnsureSumValue;
end;

procedure TColumnEh.SetWidth(const Value: Integer);
var
  Grid: TCustomDBGridEh;
  TM: TTextMetric;
  DoSetWidth: Boolean;
begin
  DoSetWidth := not SeenPassthrough;
  if not DoSetWidth then
  begin
    Grid := GetGrid;
    if Assigned(Grid) then
    begin
      if Grid.HandleAllocated and Assigned(Field) and Grid.FUpdateFields then
        with Grid do
        begin
          Canvas.Font := Self.Font;
          GetTextMetrics(Canvas.Handle, TM);
          Field.DisplayWidth := (Value + (TM.tmAveCharWidth div 2) - TM.tmOverhang - 3)
            div {VCL BUG TM.tmAveCharWidth}  Canvas.TextWidth('0');
        end;
      if (not Grid.FLayoutFromDataset) or (cvWidth in AssignedValues) then
        DoSetWidth := True;
    end
    else
      DoSetWidth := True;
  end;
  if DoSetWidth then
  begin
    if ((cvWidth in AssignedValues) or (Value <> DefaultWidth))
      and (Value <> -1) then
    begin
      FWidth := Value;
      AssignedValues := AssignedValues + [cvWidth];
      if (MaxWidth > 0) and (FWidth > MaxWidth) then FWidth := MaxWidth;
      if (FWidth < MinWidth) then FWidth := MinWidth;
    end;
    Grid := GetGrid;
    if Assigned(Grid) then
      if Grid.RowPanel.Active
        then Changed(True)
        else Changed(False);
  end;
end;

function TColumnEh.GetAutoFitColWidth: Boolean;
begin
  Result := FAutoFitColWidth;
end;

procedure TColumnEh.SetAutoFitColWidth(const Value: Boolean);
begin
  if FAutoFitColWidth <> Value then
  begin
    FAutoFitColWidth := Value;
    if Assigned(Grid) and (Grid.AutoFitColWidths = True) and
      not (csLoading in Grid.ComponentState) and not (csDesigning in Grid.ComponentState)
      then Width := FInitWidth;
    Changed(False);
  end;
end;

function TColumnEh.CreateFooter: TColumnFooterEh;
begin
  Result := TColumnFooterEh.CreateApart(Self);
end;

procedure TColumnEh.SetFooter(const Value: TColumnFooterEh);
begin
  FFooter.Assign(Value);
end;

procedure TColumnEh.SetMaxWidth(const Value: Integer);
begin
  FMaxWidth := Value;
  if (FMaxWidth > 0) and (Width > FMaxWidth) then
    Width := FMaxWidth;
end;

procedure TColumnEh.SetMinWidth(const Value: Integer);
begin
  FMinWidth := Value;
  if (FMinWidth > 0) and (Width < FMinWidth) then
    Width := FMinWidth;
end;

procedure TColumnEh.EnsureSumValue;
var i: Integer;
begin
  Footer.EnsureSumValue;
  for i := 0 to Footers.Count - 1 do
    Footers[i].EnsureSumValue;
end;

procedure TColumnEh.SetFooters(const Value: TColumnFootersEh);
begin
  FFooters.Assign(Value);
end;

function TColumnEh.CreateFooters: TColumnFootersEh;
begin
  Result := TColumnFootersEh.Create(Self, TColumnFooterEh);
end;

function TColumnEh.UsedFooter(Index: Integer): TColumnFooterEh;
begin
  if (Index >= 0) and (Index < Footers.Count)
    then Result := Footers[Index]
    else Result := Footer;
end;

procedure TColumnEh.SetOnGetCellParams(const Value: TGetColCellParamsEventEh);
begin
  if @FOnGetCellParams <> @Value then
  begin
    FOnGetCellParams := Value;
    if GetGrid <> nil then GetGrid.Invalidate;
  end;
end;

procedure TColumnEh.SetValueAsText(const StrVal: String);
begin
  UpdateDataValues(StrVal, Variant(StrVal), True);
end;

procedure TColumnEh.SetValueAsVariant(VarVal: Variant);
begin
  UpdateDataValues('', VarVal, False);
end;

procedure TColumnEh.GetColCellParams(EditMode: Boolean; ColCellParamsEh: TAxisColCellParamsEh);
begin
  if Assigned(OnGetCellParams) then
    OnGetCellParams(Self, EditMode, TColCellParamsEh(ColCellParamsEh));
end;

procedure TColumnEh.SetSTFilter(const Value: TSTColumnFilterEh);
begin
  FSTFilter.Assign(Value);
end;

function TColumnEh.CreateSTFilter: TSTColumnFilterEh;
begin
  Result := TSTColumnFilterEh.Create(Self);
end;

procedure TColumnEh.OptimizeWidth;
var
  List: TColumnsEhList;
begin
  if Assigned(Grid) then
  begin
    List := TColumnsEhList.Create;
    try
      List.Add(Self);
      Grid.OptimizeColsWidth(List);
    finally
      List.Free;
    end;
  end;
end;

procedure TColumnEh.Changed(AllItems: Boolean);
begin
  inherited Changed(AllItems);
end;

function TColumnEh.CalcRowHeight: Integer;
var
  K, Std: Integer;
  uFormat: Integer;
  Rec: Trect;
  FontData: TFontDataEh;
  NoDataWidth: Integer;
  IsTreeMode: Boolean;
  DrawPict: TPicture;
begin
  IsTreeMode := Grid.MemTableSupport and Grid.FIntMemTable.MemTableIsTreeList;
  Std := Grid.FStdDefaultRowHeight; //Future optimization
  if (dghAutoFitRowHeight in Grid.OptionsEh) and not IsTreeMode then
  begin
    Result := Std;
    if not Grid.HandleAllocated then
      Grid.Canvas.Handle := GetDC(0);
    try
      if (GetColumnType = ctGraphicData) and Grid.DrawGraphicData then
      begin
        try
        DrawPict := Grid.GetPictureForField(Self);
        try
          Result := DrawPict.Height;
          if DrawPict.Width > Width then
            Result := Round(Result / (DrawPict.Width / Width));
        finally
          DrawPict.Free;
        end;
        except
          on EInvalidGraphic do ;
          else raise;
        end;
      end else
      begin
        GetFontData(Grid.Canvas.Font, FontData);
        Grid.Canvas.Font := Font;
        if Assigned(Grid.OnGetCellParams) or Assigned(OnGetCellParams) then
        begin
          FillColCellParams(VarColCellParamsEh);
          VarColCellParamsEh.FFont := Grid.Canvas.Font;
          if Assigned(Grid.OnGetCellParams) then
            Grid.GetCellParams(Self, VarColCellParamsEh.FFont, VarColCellParamsEh.FBackground, VarColCellParamsEh.FState);
          if Assigned(OnGetCellParams) then
            GetColCellParams(False, VarColCellParamsEh);
        end;
        NoDataWidth := 4;
        if AlwaysShowEditButton then
          Inc(NoDataWidth, EditButtonsWidth);
        if (Grid.VisibleColumns.Count > 0) and (Self = Grid.VisibleColumns[0]) then
          Inc(NoDataWidth, Grid.GetCellTreeElmentsAreaWidth);
        if ShowImageAndText and Assigned(ImageList) then
          Inc(NoDataWidth, ImageList.Width + 4);
        Rec := Rect(0, 0, Width - NoDataWidth, Std);
        uFormat := DT_CALCRECT;
        if WordWrap then
          uFormat := uFormat + DT_WORDBREAK;
        K := DrawTextEh(Grid.Canvas.Handle, DisplayText, Length(DisplayText), Rec,
              uFormat);
        if K > Std then
        begin
          if Grid.Flat
            then K := K + 1
            else K := K + 3;
          if dgRowLines in Grid.Options then
            Inc(K, Grid.GridLineWidth);
        end else
          K := Std;
        Result := K;
      end;
    finally
      if not Grid.HandleAllocated then
      begin
        ReleaseDC(0, Grid.Canvas.Handle);
        Grid.Canvas.Handle := 0;
      end else
        SetFontData(FontData, Grid.Canvas.Font);
    end;
  end else
    Result := Std;
end;

function TColumnEh.CurLineWordWrap(RowHeight: Integer): Boolean;
begin
  Result := False;
  if not WordWrap then Exit;

  if Grid.RowPanel.Active then
    Result := (InRowLineHeight > 1)
  else
  begin
    Result := inherited CurLineWordWrap(RowHeight);
  end;
end;

procedure TColumnEh.SetHideDuplicates(Value: Boolean);
begin
  if Value <> FHideDuplicates then
  begin
    FHideDuplicates := Value;
    Changed(False);
  end;
end;

function TColumnEh.AllowableWidth(TryWidth: Integer): Integer;
begin
  Result := TryWidth;
  if (MaxWidth > 0) and (TryWidth > MaxWidth) then Result := MaxWidth;
  if (MinWidth > 0) and (TryWidth < MinWidth) then Result := MinWidth;
end;

procedure TColumnEh.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('InRowLinePos', ReadInRowLinePos, WriteInRowLinePos, IsInRowLinePosStored);
  Filer.DefineProperty('InRowLineHeight', ReadInRowLineHeight, WriteInRowLineHeight, IsInRowLineHeightStored);
end;

function TColumnEh.CanApplyAggregateFunction(FooterValueType: TGroupFooterValueTypeEh): Boolean;
begin
  Result := False;
  if Field = nil then Exit;
  case FooterValueType of
    gfvNonEh:
      Result := False;
    gfvSumEh:
      Result := (Field is TNumericField) or (Field is TBooleanField);
      {Field.DataType in [ftSmallint, ftInteger, ftWord,
        ftBoolean, ftFloat, ftCurrency, ftBCD, ftTime, ftAutoInc, ftVariant, ftFMTBcd];}
    gfvAvgEh:
      Result := (Field is TNumericField);
    gfvCountEh:
      Result := True;
    gfvMaxEh:
      Result := True;
    gfvMinEh:
      Result := True;
    gfvStaticTextEh:
      Result := True;
    gfvCustomEh:
      Result := True;
  end;
end;

procedure TColumnEh.ReadInRowLinePos(Reader: TReader);
begin
  InRowLinePos := Reader.ReadInteger;
end;

procedure TColumnEh.ReadInRowLineHeight(Reader: TReader);
begin
  InRowLineHeight := Reader.ReadInteger;
end;

procedure TColumnEh.WriteInRowLinePos(Writer: TWriter);
begin
  Writer.WriteInteger(InRowLinePos);
end;

procedure TColumnEh.WriteInRowLineHeight(Writer: TWriter);
begin
  Writer.WriteInteger(InRowLineHeight);
end;

function TColumnEh.IsInRowLinePosStored: Boolean;
begin
  Result := InRowLinePos <> 0;
end;

function TColumnEh.IsInRowLineHeightStored: Boolean;
begin
  Result := InRowLineHeight <> 1;
end;

function TColumnEh.GetCurrentFieldValueList: IMemTableDataFieldValueListEh;
begin
  if FieldValueList = nil then
    if STFilter.ListSource <> nil then
      FieldValueList := STFilter.GetFieldValueList
    else if Grid.FIntMemTable <> nil then
      FieldValueList := Grid.FIntMemTable.GetFieldValueList(STFilter.Column.FieldName);
  Result := FieldValueList;
end;

function TColumnEh.FullWidth: Integer;
begin
  Result := Width;
  if (Grid <> nil) and
     (Grid.VisibleColumns.Count > 0) and
     (Grid.VisibleColumns[0] = Self)
  then
    Inc(Result, Grid.FExtraFirstColumnWidth);
end;

function TColumnEh.GetTitle: TColumnTitleEh;
begin
  Result := TColumnTitleEh(inherited Title);
end;

procedure TColumnEh.SetTitle(const Value: TColumnTitleEh);
begin
  inherited Title := Value;
end;

procedure TColumnEh.SetTextArea(var CellRect: TRect);
begin
  if AlwaysShowEditButton then
  begin
    CellRect.Right := CellRect.Left + Width - EditButtonsWidth;
  end else
    CellRect.Right := CellRect.Left + Width;

  if Self = Grid.VisibleColumns[0] then
  begin
    Inc(CellRect.Left, Grid.GetCellTreeElmentsAreaWidth);
    if Grid.RowDetailPanel.Active then
      Inc(CellRect.Left, 18);
    if Grid.DataGrouping.IsGroupingWorksWithLevel then
      CellRect.Left := CellRect.Left + Grid.FExtraFirstColumnWidth;
  end;

  if (ImageList <> nil) and ShowImageAndText then
    Inc(CellRect.Left, ImageList.Width + 5);
end;

procedure TColumnEh.DropDownBoxApplyTextFilter(DataSet: TDataSet;
  FieldName: String; Operation: TLSAutoFilterTypeEh; FilterText: String);
begin
  if Assigned(OnDropDownBoxApplyTextFilter) then
    OnDropDownBoxApplyTextFilter(Grid, Self, DataSet, FieldName, Operation, FilterText)
  else
    inherited DropDownBoxApplyTextFilter(DataSet, FieldName, Operation, FilterText);
end;

function TColumnEh.GetOnDropDownBoxCheckButton: TDBGridEhDropDownBoxCheckTitleEhBtnEvent;
begin
  Result := TDBGridEhDropDownBoxCheckTitleEhBtnEvent(inherited OnDropDownBoxCheckButton);
end;

procedure TColumnEh.SetOnDropDownBoxCheckButton(const Value: TDBGridEhDropDownBoxCheckTitleEhBtnEvent);
begin
  inherited OnDropDownBoxCheckButton := TDropDownBoxCheckTitleEhBtnEvent(Value);
end;

function TColumnEh.GetOnDropDownBoxDrawColumnCell: TDBGridEhDropDownBoxDrawColumnEhCellEvent;
begin
  Result := TDBGridEhDropDownBoxDrawColumnEhCellEvent(inherited OnDropDownBoxDrawColumnCell);
end;

procedure TColumnEh.SetOnDropDownBoxDrawColumnCell(const Value: TDBGridEhDropDownBoxDrawColumnEhCellEvent);
begin
  inherited OnDropDownBoxDrawColumnCell := TDropDownBoxDrawColumnEhCellEvent(Value);
end;

function TColumnEh.GetOnDropDownBoxGetCellParams: TDBGridEhDropDownBoxGetCellEhParamsEvent;
begin
  Result := TDBGridEhDropDownBoxGetCellEhParamsEvent(inherited OnDropDownBoxGetCellParams);
end;

procedure TColumnEh.SetOnDropDownBoxGetCellParams(const Value: TDBGridEhDropDownBoxGetCellEhParamsEvent);
begin
  inherited OnDropDownBoxGetCellParams := TDropDownBoxGetCellEhParamsEvent(Value);
end;

function TColumnEh.GetOnDropDownBoxTitleBtnClick: TDBGridEhDropDownBoxTitleEhClickEvent;
begin
  Result := TDBGridEhDropDownBoxTitleEhClickEvent(inherited OnDropDownBoxTitleBtnClick);
end;

procedure TColumnEh.SetOnDropDownBoxTitleBtnClick(const Value: TDBGridEhDropDownBoxTitleEhClickEvent);
begin
  inherited OnDropDownBoxTitleBtnClick := TDropDownBoxTitleEhClickEvent(Value);
end;

function TColumnEh.GetOnCloseDropDownForm: TDBGridCloseDropDownFormEventEh;
begin
  Result := TDBGridCloseDropDownFormEventEh(inherited OnCloseDropDownForm);
end;

function TColumnEh.GetOnOpenDropDownForm: TDBGridShowDropDownFormEventEh;
begin
  Result := TDBGridShowDropDownFormEventEh(inherited OnOpenDropDownForm);
end;

procedure TColumnEh.SetOnCloseDropDownForm(const Value: TDBGridCloseDropDownFormEventEh);
begin
  inherited OnCloseDropDownForm := TDBAxisGridCloseDropDownFormEventEh(Value);
end;

procedure TColumnEh.SetOnOpenDropDownForm(const Value: TDBGridShowDropDownFormEventEh);
begin
  inherited OnOpenDropDownForm := TDBAxisGridShowDropDownFormEventEh(Value);
end;

{ TDBGridColumnsEh }

constructor TDBGridColumnsEh.Create(Grid: TCustomDBGridEh; ColumnClass: TColumnEhClass);
begin
  inherited Create(Grid, ColumnClass);
end;

function TDBGridColumnsEh.Add: TColumnEh;
begin
  Result := TColumnEh(inherited Add);
end;

procedure TDBGridColumnsEh.RebuildColumns;
begin
  AddAllColumns(True);
end;

procedure TDBGridColumnsEh.AddAllColumns(DeleteExisting: Boolean);
begin
  AddAllBars(DeleteExisting);
end;

procedure TDBGridColumnsEh.Update(Item: TCollectionItem);
var
  Raw: Integer;
  OldWidth: Integer;
  ItemColumn: TColumnEh;
  FullWidth, NewWidth: Integer;
  Denominator: Integer;
begin
  ItemColumn := TColumnEh(Item);
  if (Grid = nil) or (csLoading in Grid.ComponentState) then Exit;
  if (Item = nil) then
  begin
    Grid.SetSortMarkedColumns;
    Grid.LayoutChanged;
  end else
  begin
    Raw := Grid.DataToRawColumn(Item.Index);
    Grid.InvalidateCol(Raw);
    if (Grid.AutoFitColWidths = False) or (csDesigning in Grid.ComponentState) then
    begin
      FullWidth := ItemColumn.FullWidth;
      if (Grid.CellColWidths[Raw] <> FullWidth) and
       not Grid.RowPanel.Active then
      begin
        if ItemColumn.Visible then
        begin
          NewWidth := ItemColumn.Width;
          NewWidth := Grid.ColWidthToCellWidth(ItemColumn, NewWidth);
          Grid.CellColWidths[Raw] := NewWidth;
        end else
        begin
          Grid.ColWidths[Raw] := 0;
        end;
      end else if Grid.UseMultiTitle = True then
        Grid.LayoutChanged;
    end else if Grid.ColWidths[Raw] <> -1 then
    begin
      OldWidth := TColumnEh(Item).FInitWidth;
      Denominator := Grid.ColumnWidthToCellColWidth(TColumnEh(Item), Grid.CellColWidths[Raw]);
      if Denominator > 0 then
        TColumnEh(Item).FInitWidth :=
          MulDiv(TColumnEh(Item).FInitWidth,
                  TColumnEh(Item).Width,
                  Grid.ColumnWidthToCellColWidth(TColumnEh(Item), Grid.CellColWidths[Raw]))
      else
        TColumnEh(Item).FInitWidth := TColumnEh(Item).Width;
      if (Raw <> Grid.FullColCount - 1) then
      begin
        Inc(Grid.Columns[Raw - Grid.FIndicatorOffset + 1].FInitWidth,
          OldWIdth - Grid.Columns[Raw - Grid.FIndicatorOffset].FInitWidth);
        if (Grid.Columns[Raw - Grid.FIndicatorOffset + 1].FInitWidth < 0)
          then Grid.Columns[Raw - Grid.FIndicatorOffset + 1].FInitWidth := 0;
      end;
      Grid.LayoutChanged;
    end;
  end;
  if (Grid.SelectedIndex >= Count) or
     ((Count > 0) and (Grid.VisibleColumns.Count > 0) and (Items[Grid.SelectedIndex].Visible = False))
  then
    Grid.SelectedIndex := Grid.VisibleColumns[0].Index;
  if Grid.LayoutLock = 0 then
    Grid.InvalidateEditor; //Need to comment to avoid FInplaceCol = -1 in set AlwoseShowEditor;
//  if Grid.DataGrouping.IsGroupingWorks then
  if Grid.DataGrouping.Active then
    Grid.DataGrouping.ColumnsChanged;
// To frequently calls Grid.UpdateAllDataRowHeights;
// Users will call UpdateAllDataRowHeights manually;
end;

function TDBGridColumnsEh.ExistFooterValueType(AFooterValueType: TFooterValueType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Footer.ValueType = AFooterValueType) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TDBGridColumnsEh.ActiveChanged;
var
  i: Integer;
begin
  inherited ActiveChanged;
  for i := 0 to Count - 1 do
  begin
    Items[i].FieldValueList := nil;
  end;
end;

function TDBGridColumnsEh.GetNextTabColumn(
  ForColumn: TColumnEh; GoForward: Boolean): TColumnEh;
var
  ACol, Original: Integer;
begin
  Result := ForColumn;
  ACol := ForColumn.Index;
  Original := ACol;
  if Grid.RowPanel.Active and (Grid.RowPanel.TabNavigationType = rpntLeftToRightPriorityEh) then
    Result := GetNextHorzColumn(ForColumn, GoForward, True, True)
  else
    while True do
    begin
      if GoForward then
        Inc(ACol) else
        Dec(ACol);
      if ACol >= Count - Grid.ContraColCount then
        Exit
      else if ACol < 0 then
        Exit;
      if ACol = Original then Exit;
      if Items[ACol].IsTabStop then
      begin
        Result := Items[ACol];
        Exit;
      end;
    end;
end;

function TDBGridColumnsEh.GetNextHorzColumn(
  ForColumn: TColumnEh; GoForward, TillTheLastCol, CheckTabStop: Boolean): TColumnEh;
var
  i, j: Integer;
  Column, MinColumn: TColumnEh;
  IsTabStop: Boolean;
begin
  MinColumn := nil;
  for i := 0 to Count-1 do
  begin
    Column := Items[i];
    if CheckTabStop
      then IsTabStop := Column.IsTabStop
      else IsTabStop := True;
    if not Column.Visible or not IsTabStop then Continue;
    if (Column.FRowPlacement.Top = ForColumn.FRowPlacement.Top) then
      if GoForward then
      begin
        if (Column.FRowPlacement.DataCellLeft > ForColumn.FRowPlacement.DataCellLeft) and
        ((MinColumn = nil) or (MinColumn.FRowPlacement.Left > Column.FRowPlacement.Left)) then
          MinColumn := Column
      end else
        if (Column.FRowPlacement.Left < ForColumn.FRowPlacement.Left) and
        ((MinColumn = nil) or (MinColumn.FRowPlacement.Left < Column.FRowPlacement.Left)) then
          MinColumn := Column;
  end;
  if MinColumn <> nil then
  begin
    Result := MinColumn;
    Exit;
  end;
  if not TillTheLastCol then
  begin
    Result := ForColumn;
    Exit;
  end;
  for j := 0 to Count-1 do
  begin
    if CheckTabStop
      then IsTabStop := Items[j].IsTabStop
      else IsTabStop := True;
    if not Items[j].Visible or not IsTabStop then Continue;
    if GoForward then
    begin
      if (Items[j].FRowPlacement.Top > ForColumn.FRowPlacement.Top) and
         ( (MinColumn = nil) or
          ((Items[j].FRowPlacement.Top <= MinColumn.FRowPlacement.Top) and
           (Items[j].FRowPlacement.Left <= MinColumn.FRowPlacement.Left)))
      then
        MinColumn := Items[j];
    end else
      if (Items[j].FRowPlacement.Top < ForColumn.FRowPlacement.Top) and
         ((MinColumn = nil) or
          ((Items[j].FRowPlacement.Top >= MinColumn.FRowPlacement.Top) and
           (Items[j].FRowPlacement.Left >= MinColumn.FRowPlacement.Left)))
      then
        MinColumn := Items[j];
  end;
  if MinColumn <> nil
    then Result := MinColumn
    else Result := ForColumn;
end;

function TDBGridColumnsEh.GetNextVertColumn(ForColumn: TColumnEh;
  GoForward: Boolean): TColumnEh;
var
  i: Integer;
  Column, MinColumn, AUpDownBaseColumn: TColumnEh;

  function SegmentsIntersect(S1A, S1B, S2A, S2B: Integer): Boolean;
  begin
    Result := ((S1A >= S2A) and (S1A <= S2B)) or
              ((S1A <= S2A) and (S1B >= S2A));
  end;

begin
  Result := ForColumn;
  MinColumn := nil;
  if FUpDownBaseColumn = nil
    then AUpDownBaseColumn := ForColumn
    else AUpDownBaseColumn := FUpDownBaseColumn;
  for i := 0 to Count-1 do
  begin
    Column := Items[i];
    if not Column.Visible {or not Column.IsTabStop} then Continue;
    if GoForward then
    begin
      if (Column.FRowPlacement.Top > ForColumn.FRowPlacement.Top + ForColumn.FRowPlacement.Height) and
        SegmentsIntersect(AUpDownBaseColumn.FRowPlacement.Left, AUpDownBaseColumn.FRowPlacement.Left + AUpDownBaseColumn.FRowPlacement.Width,
                          Column.FRowPlacement.Left, Column.FRowPlacement.Left + Column.FRowPlacement.Width) then
        if MinColumn = nil then
          MinColumn := Column
        else if Column.FRowPlacement.Top < MinColumn.FRowPlacement.Top then
          MinColumn := Column
        else if (Column.FRowPlacement.Top = MinColumn.FRowPlacement.Top)
          and (Column.FRowPlacement.Left < MinColumn.FRowPlacement.Left)
        then
          MinColumn := Column
    end else
      if (Column.FRowPlacement.Top < ForColumn.FRowPlacement.Top) and
        SegmentsIntersect(AUpDownBaseColumn.FRowPlacement.Left, AUpDownBaseColumn.FRowPlacement.Left + AUpDownBaseColumn.FRowPlacement.Width,
                          Column.FRowPlacement.Left, Column.FRowPlacement.Left + Column.FRowPlacement.Width) then
        if MinColumn = nil then
          MinColumn := Column
        else if Column.FRowPlacement.Top > MinColumn.FRowPlacement.Top then
          MinColumn := Column
        else if (Column.FRowPlacement.Top = MinColumn.FRowPlacement.Top)
          and (Column.FRowPlacement.Left < MinColumn.FRowPlacement.Left)
        then
          MinColumn := Column;
  end;
  if MinColumn <> nil then
    Result := MinColumn;
end;

function TDBGridColumnsEh.GetTopColumn(ForColumn: TColumnEh): TColumnEh;
begin
  Result := GetNextVertColumn(ForColumn, False);
  while Result <> ForColumn do
  begin
    ForColumn := Result;
    Result := GetNextVertColumn(ForColumn, False);
  end;
end;

function TDBGridColumnsEh.GetBottomColumn(ForColumn: TColumnEh): TColumnEh;
begin
  Result := GetNextVertColumn(ForColumn, True);
  while Result <> ForColumn do
  begin
    ForColumn := Result;
    Result := GetNextVertColumn(ForColumn, True);
  end;
end;

function TDBGridColumnsEh.GetFirstTabColumn: TColumnEh;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count-1 do
  begin
    if not Items[i].Visible or not Items[i].IsTabStop then Continue;
    Result := Items[i];
    Exit;
  end;
end;

function TDBGridColumnsEh.GetLastTabColumn: TColumnEh;
var
  i: Integer;
  Column: TColumnEh;
  StartCol: Integer;
begin
  Result := nil;
  if Grid.RowPanel.Active and (Grid.RowPanel.TabNavigationType = rpntLeftToRightPriorityEh) then
  begin
    for i := 0 to Count-1 do
    begin
      Column := Items[i];
      if not Column.Visible or not Column.IsTabStop then Continue;
      if Result = nil then
        Result := Column
      else if Column.FRowPlacement.Top > Result.FRowPlacement.Top then
        Result := Column
      else if (Column.FRowPlacement.Top = Result.FRowPlacement.Top) and
              (Column.FRowPlacement.Left > Result.FRowPlacement.Left) then
        Result := Column;
    end;
  end else
  begin
    StartCol := Grid.ContraColCount - Count - 1;
    for i := StartCol downto 0 do
    begin
      if not Items[i].Visible or not Items[i].IsTabStop then Continue;
      Result := Items[i];
      Exit;
    end;
  end;
end;

function TDBGridColumnsEh.FindColumnByName(const ColumnName: String): TColumnEh;
begin
  Result := TColumnEh(inherited FindBarByName(ColumnName));
end;

procedure TDBGridColumnsEh.GetColumnNames(List: TStrings);
var
  i: Integer;
begin
  for i := 0 to Count-1 do
    List.Add(Items[i].Name);
end;

function TDBGridColumnsEh.FirstScrollVisibleColumn: TColumnEh;
begin
  Result := FFirstScrollVisibleColumn;
end;

function TDBGridColumnsEh.LastScrollVisibleColumn: TColumnEh;
begin
  Result := FLastScrollVisibleColumn;
end;

function TDBGridColumnsEh.FirstContraVisibleColumn: TColumnEh;
begin
  Result := FFirstContraVisibleColumn;
end;

function TDBGridColumnsEh.LastContraVisibleColumn: TColumnEh;
begin
  Result := FLastContraVisibleColumn;
end;

function TDBGridColumnsEh.FirstFrozenVisibleColumn: TColumnEh;
begin
  Result := FFirstFrozenVisibleColumn;
end;

function TDBGridColumnsEh.LastFrozenVisibleColumn: TColumnEh;
begin
  Result := FLastFrozenVisibleColumn;
end;

function TDBGridColumnsEh.GetColumn(Index: Integer): TColumnEh;
begin
  Result := TColumnEh(inherited Items[Index]);
end;

procedure TDBGridColumnsEh.SetColumn(Index: Integer; const Value: TColumnEh);
begin
  inherited Items[Index] := Value;
end;

function TDBGridColumnsEh.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(inherited Grid);
end;

{ TBookmarkListEh }

constructor TBookmarkListEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FRowsRef := TObjectList.Create(False);
end;

destructor TBookmarkListEh.Destroy;
begin
  FGrid := nil;
  inherited Destroy;
  FreeAndNil(FRowsRef);
end;

procedure TBookmarkListEh.Clear;
begin
  FRowsRef.Clear;
  if Count > 0 then
  begin
    inherited Clear;
  end;    
end;

procedure TBookmarkListEh.SetCurrentRowSelected(Value: Boolean);
begin
  if Value and FGrid.DataSource.DataSet.IsEmpty then Exit;
  inherited SetCurrentRowSelected(Value);
  GridInvalidateRow(FGrid, FGrid.Row); // FGrid.InvalidateRow(FGrid.Row); vcl bug??
end;

procedure TBookmarkListEh.ListChanged(Sender: TObject);
begin
  inherited ListChanged(Sender);
  if (FGrid.Selection.FSelectionType <> gstRecordBookmarks) and (Count > 0) then
  begin
    FGrid.Selection.Clear;
    FGrid.Selection.FSelectionType := gstRecordBookmarks;
  end;
  FGrid.Selection.UpdateState;
  FGrid.Selection.SelectionChanged;
end;

procedure TBookmarkListEh.UpdateState;
begin
  if FGrid <> nil then
    FGrid.Selection.UpdateState;
end;

procedure TBookmarkListEh.Invalidate;
begin
  if FGrid <> nil then
    FGrid.Invalidate;
end;

function TBookmarkListEh.GetDataSet: TDataSet;
begin
  if FGrid <> nil
    then Result := FGrid.DataSource.DataSet
    else Result := nil;
end;

function TBookmarkListEh.SelectionToGridRect: TGridRect;
var
  TopRow, BottomRow: Integer;
  i, OldActive, ViewRowCount: Integer;
begin
  TopRow := -1;
  BottomRow := -1;
  if FGrid.DataLink.Active then
  begin
    if FGrid.ViewScroll then
    begin
      OldActive := FGrid.TopRow - FGrid.TopDataOffset;
      ViewRowCount := Min(OldActive + FGrid.VisibleDataRowCount, FGrid.RowCount-FGrid.TopDataOffset-1);
      for i := OldActive to ViewRowCount do
      begin
        FGrid.InstantReadRecordEnter(i);
        if IndexOf(FGrid.DataLink.DataSet.Bookmark) >= 0 then
        begin
          if TopRow = -1 then TopRow := i;
          if i > BottomRow then BottomRow := i;
        end;
        FGrid.InstantReadRecordLeave;
      end;
    end else
    begin
      OldActive := FGrid.DataLink.ActiveRecord;
      for i := 0 to FGrid.DataLink.RecordCount-1 do
      begin
        FGrid.DataLink.ActiveRecord := i;
        if IndexOf(FGrid.DataLink.DataSet.Bookmark) >= 0 then
        begin
          if TopRow = -1 then TopRow := i;
          if i > BottomRow then BottomRow := i;
        end;
      end;
      FGrid.DataLink.ActiveRecord := OldActive;
    end;
  end;
  if TopRow > -1
    then Result := GridRect(0, FGrid.TopDataOffset + TopRow, FGrid.ColCount-1, FGrid.TopDataOffset + BottomRow)
    else Result := GridRect(-1, -1, -1, -1);
end;

procedure TBookmarkListEh.Assign(Rows: TBookmarkListEh);
var
  i: Integer;
begin
  Clear;
  for i := 0 to Rows.Count-1 do
    AppendItem(Rows[i]);
end;

procedure TBookmarkListEh.AssignAsBaseRef(Rows: TBookmarkListEh);
var
  i: Integer;
begin
  Clear;
  if Rows.FGrid.FIntMemTable = nil then Exit;

  for i := 0 to Rows.FGrid.FIntMemTable.InstantReadRowCount-1 do
  begin
    Rows.FGrid.InstantReadRecordEnter(i);
    try
      if Rows.CurrentRowSelected then
        FRowsRef.Add(Rows.FGrid.FIntMemTable.GetRecObject);
    finally
      Rows.FGrid.InstantReadRecordLeave;
    end;
  end;
end;

{ TInplaceFilterEditEh }

procedure TInplaceFilterEditEh.CalcEditRect(var ARect: TRect);
begin
  inherited CalcEditRect(ARect);
  Inc(ARect.Top);
  if Grid.UseRightToLeftAlignment
    then Inc(ARect.Left)
    else Dec(ARect.Right);
end;

procedure TInplaceFilterEditEh.InternalSetValue(AValue: Variant);
begin
  inherited;
end;

procedure TInplaceFilterEditEh.InternalUpdatePostData;
begin
  inherited;
end;

procedure TInplaceFilterEditEh.SelectAll;
begin
  SendMessage(Handle, EM_SETSEL, 0, -1);
end;

procedure TInplaceFilterEditEh.SetKeyDisplayText(AValue: Variant; AText: String);
begin
  Value := AValue;
  EditText := AText;
end;

procedure TInplaceFilterEditEh.SetVariantValue(const VariantValue: Variant);
begin
  inherited;
end;

procedure TInplaceFilterEditEh.CloseUp(Accept: Boolean);
begin
  if (Column <> nil) and Column.STFilter.FInFilterListBox
    then Exit
    else inherited CloseUp(Accept);
end;

function TInplaceFilterEditEh.GetPopupListboxColor: TColor;
begin
  Result := TCustomDBGridEh(FInplaceEditHolder).Color;
end;

function TInplaceFilterEditEh.SelfPopupListboxFont: TFont;
begin
  Result := TCustomDBGridEh(FInplaceEditHolder).Font;
end;

procedure TInplaceFilterEditEh.SelectNextValue(IsPrior: Boolean);
var
  OldItemIndex: Integer;
  Item: TPopupListboxItemEh;

  function NextIndexFor(AnIndex: Integer): Integer;
  var
    NewIndex: Integer;
  begin
    NewIndex := AnIndex;
    Inc(NewIndex);
    while NewIndex <= FItemsCount - 1 do
    begin
      Item := TPopupListboxItemEh(Items.Objects[NewIndex]);
      if (Item <> nil) and (Item is TPopupListboxItemEhData) then
      begin
        Result := NewIndex;
        Exit;
      end;
      Inc(NewIndex);
    end;
    Result := AnIndex;
  end;

  function PrevIndexFor(AnIndex: Integer): Integer;
  var
    NewIndex: Integer;
  begin
    if AnIndex < 0 then
      AnIndex := FItemsCount;
    NewIndex := AnIndex;
    Dec(NewIndex);
    while NewIndex > 0 do
    begin
      Item := TPopupListboxItemEh(Items.Objects[NewIndex]);
      if (Item <> nil) and (Item is TPopupListboxItemEhData) then
      begin
        Result := NewIndex;
        Exit;
      end;
      Dec(NewIndex);
    end;
    Result := AnIndex;
    if Result >= FItemsCount then
      Result := -1;
  end;

begin
  OldItemIndex := ItemIndex;
  if not EditCanModify then Exit;
  GetItemsList;
  if IsPrior
    then InternalSetItemIndex(PrevIndexFor(ItemIndex))
    else InternalSetItemIndex(NextIndexFor(ItemIndex));
  if OldItemIndex <> ItemIndex then
  begin
    SelectAll;
  end;
end;

{ TDBGridFilterPopupListboxItemEh }

function TDBGridFilterPopupListboxItemEh.GetColumn(Listbox: TPopupListboxEh): TColumnEh;
begin
  if Listbox.Owner is TCustomDBGridEh then
    Result := TCustomDBGridEh(Listbox.Owner).FInTitleFilterListboxColumn
  else
    Result := TInplaceFilterEditEh(Listbox.Owner).Column;
end;

function TDBGridFilterPopupListboxItemEh.GetGroupLevel(
  Listbox: TPopupListboxEh): TGridDataGroupLevelEh;
begin
  if Listbox.Owner is TCustomDBGridEh then
    Result := TCustomDBGridEh(Listbox.Owner).FInTitleFilterListboxGroupLevel
  else
    Result := nil;
end;

{ TPopupListboxItemEhLine }

procedure TPopupListboxItemEhLine.DrawItem(Sender: TPopupListboxEh; ItemIndex:
  Integer; ARect: TRect; State: TOwnerDrawState);
begin
  Sender.Canvas.Pen.Color := clSilver;
  Sender.Canvas.Polyline([Point(ARect.Left, (ARect.Bottom+ARect.Top) div 2),
                          Point(ARect.Right,(ARect.Bottom+ARect.Top) div 2)]);
end;

function TPopupListboxItemEhLine.CanFocus(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

function TPopupListboxItemEhLine.CloseOnExecute(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

procedure TPopupListboxItemEhLine.MouseUp(Sender: TPopupListboxEh;
  ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton;
  Shift: TShiftState; var IsCloseListbox: Boolean);
begin
  inherited;
end;

{ TPopupListboxItemEhSort }

constructor TPopupListboxItemEhSort.Create(ASortState: TSortMarkerEh);
begin
  inherited Create;
  FSortState := ASortState;
end;

procedure TPopupListboxItemEhSort.DrawItem(Sender: TPopupListboxEh; ItemIndex:
  Integer; ARect: TRect; State: TOwnerDrawState);
var
  SortMarkerIdx: Integer;
  Grid: TCustomDBGridEh;
  smSize: TSize;
  SMRect: TRect;
begin
  case FSortState of
    smDownEh: SortMarkerIdx := 0;
    smUpEh: SortMarkerIdx := 1;
  else SortMarkerIdx := -1;
  end;
  if (SortMarkerIdx >= 0) {and (ColorToRGB(Sender.Color) = ColorToRGB(clWindow))} then
    SortMarkerIdx := SortMarkerIdx + 3;
  if SortMarkerIdx <> -1 then
  begin
    Grid := GetColumn(Sender).Grid;
    smSize := Grid.Style.GetSortMarkerSize(Sender.Canvas, Grid.TitleParams.SortMarkerStyle);
    SMRect := Rect((ARect.Left  + (ARect.Left + DefaultCheckBoxWidth + 2) - smSize.cx) div 2,
                   (ARect.Bottom + ARect.Top - smSize.cy) div 2,
                   0, 0);
    SMRect.Right := SMRect.Left + smSize.cx - 1;
    SMRect.Bottom := SMRect.Top + smSize.cy - 1;
    Grid.Style.DrawSortMarker(Sender.Canvas, Grid.TitleParams.SortMarkerStyle, GetColumn(Sender),
      FSortState, False, SMRect);
  end;
  if Sender.UseRightToLeftAlignment
    then ARect.Right := ARect.Right - DefaultCheckBoxWidth - 2
    else ARect.Left := ARect.Left + DefaultCheckBoxWidth + 2;
  Sender.DefaultDrawItem(ItemIndex, ARect, State);
end;

function TPopupListboxItemEhSort.CanFocus(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

procedure TPopupListboxItemEhSort.Execute(Sender: TPopupListboxEh;
  ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState);
const
  SortMarkers: array[TSortOrderEh] of TSortMarkerEh = (smDownEh, smUpEh);
begin
  if GetGroupLevel(Sender) <> nil then
  begin
    if FSortState = smDownEh then
      GetGroupLevel(Sender).SortOrder := soAscEh
    else if FSortState = smUpEh then
      GetGroupLevel(Sender).SortOrder := soDescEh;
  end else
  begin
    GetColumn(Sender).Title.SortMarker := FSortState;
    GetColumn(Sender).Grid.DoSortMarkingChanged;
  end
end;

{ TPopupListboxItemEhSpec }

constructor TPopupListboxItemEhSpec.Create(AType: TPopupListboxItemEhSpecType);
begin
  inherited Create;
  FType := AType;
end;

procedure TPopupListboxItemEhSpec.DrawItem(Sender: TPopupListboxEh; ItemIndex:
  Integer; ARect: TRect; State: TOwnerDrawState);
var
  OldColor: TColor;
begin
  OldColor := Sender.Canvas.Brush.Color;
  Sender.Canvas.FillRect(Rect(ARect.Left, ARect.Top, ARect.Left + DefaultCheckBoxWidth + 2, ARect.Bottom));
  Sender.Canvas.Brush.Color := OldColor;
  ARect.Left := ARect.Left + DefaultCheckBoxWidth + 2;
  Sender.DefaultDrawItem(ItemIndex, ARect, State);
end;

function TPopupListboxItemEhSpec.CanFocus(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

procedure TPopupListboxItemEhSpec.Execute(Sender: TPopupListboxEh;
  ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState);
var
  Grid: TCustomDBGridEh;
begin
  Grid := GetColumn(Sender).Grid;
  case FType of
    ptFilterSpecItemClearFilter:
      GetColumn(Sender).Grid.ClearFilter;
    ptFilterSpecItemAll:
      GetColumn(Sender).STFilter.ExpressionStr := '';
    ptFilterSpecItemEmpties:
      GetColumn(Sender).STFilter.ExpressionStr := '=Null';
    ptFilterSpecItemNotEmties:
      GetColumn(Sender).STFilter.ExpressionStr := '<>Null';
    ptFilterSpecItemDialog:
      begin
        if (GetColumn(Sender).Grid.FFilterCol <> -1) and
            (GetColumn(Sender).Grid.FilterEdit <> nil) and
            GetColumn(Sender).Grid.FilterEdit.Visible
        then
          GetColumn(Sender).Grid.SetFilterValue(GetColumn(Sender).Grid.FFilterCol);
        if StartDBGridEhColumnFilterDialog(GetColumn(Sender)) then
        begin
          if GetColumn(Sender).Grid.STFilter.InstantApply then
            GetColumn(Sender).Grid.SetDataFilter;
        end;
        Exit;
      end;
    ptFilterApply:
      GetColumn(Sender).Grid.SetDataFilter;
  end;
  if Grid <> nil then
    if (FType = ptFilterSpecItemClearFilter) or
       Grid.Center.FilterEditCloseUpApplyFilter or
       Grid.STFilter.InstantApply
    then
      Grid.SetDataFilter;
end;

{ TPopupListboxItemEhData }

procedure TPopupListboxItemEhData.DrawItem(Sender: TPopupListboxEh;
  ItemIndex: Integer; ARect: TRect; State: TOwnerDrawState);
var
  CBRect: TRect;
  MouseIndex: Integer;
  IsDown, OldRigth: Integer;
  CBState: TCheckBoxState;
  IsActive: Boolean;
begin
  MouseIndex := Sender.ItemAtPos(Sender.ScreenToClient(SafeGetMouseCursorPos), True);
  if GetColumn(Sender).STFilter.FPopupListboxDownIndex = ItemIndex
    then IsDown := -1
    else IsDown := 0;
  if GetColumn(Sender).STFilter.FListValuesCheckingState[ItemIndex] = True
    then CBState := cbChecked
    else CBState := cbUnchecked;
  IsActive := (MouseIndex >= 0) and (MouseIndex = ItemIndex) and (Mouse.Capture = 0);
  CBRect := Rect(ARect.Left, ARect.Top, ARect.Left + DefaultCheckBoxWidth, ARect.Bottom);
  if Sender.UseRightToLeftAlignment then
  begin
    OldRigth := CBRect.Right;
    CBRect.Right := Sender.ClientWidth - CBRect.Left;
    CBRect.Left := Sender.ClientWidth - OldRigth;
  end;
  PaintButtonControlEh(Sender.Canvas, CBRect, Sender.Canvas.Brush.Color,
    bcsCheckboxEh, IsDown, True, IsActive {odFocused in State}, True, CBState);

  if Sender.UseRightToLeftAlignment
    then ARect.Right := ARect.Right - DefaultCheckBoxWidth - 2
    else ARect.Left := ARect.Left + DefaultCheckBoxWidth + 2;
  Sender.DefaultDrawItem(ItemIndex, ARect, State);
end;

function TPopupListboxItemEhData.CanFocus(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

procedure TPopupListboxItemEhData.MouseDown(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton; Shift: TShiftState);
begin
  GetColumn(Sender).STFilter.FPopupListboxDownIndex := ItemIndex;
  Sender.InvalidateIndex(ItemIndex);
end;

procedure TPopupListboxItemEhData.MouseMove(Sender: TPopupListboxEh; ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState);
begin
  if (GetColumn(Sender).STFilter.FPopupListboxDownIndex >= 0) and
     (GetColumn(Sender).STFilter.FPopupListboxDownIndex <> ItemIndex) then
  begin
    Sender.InvalidateIndex(GetColumn(Sender).STFilter.FPopupListboxDownIndex);
    GetColumn(Sender).STFilter.FPopupListboxDownIndex := -1;
  end;
end;

procedure TPopupListboxItemEhData.MouseUp(Sender: TPopupListboxEh;
  ItemIndex: Integer; InItemPos: TPoint; Button: TMouseButton;
  Shift: TShiftState; var IsCloseListbox: Boolean);
var
  MousePos: TPoint;
  Index: Integer;
begin
  if GetColumn(Sender).STFilter.FPopupListboxDownIndex = ItemIndex then
  begin
    GetColumn(Sender).STFilter.FEnterNotClearData := True;
    Execute(Sender, ItemIndex, InItemPos, Shift);
    MousePos := Sender.ScreenToClient(SafeGetMouseCursorPos);
    Index := Sender.ItemAtPos(MousePos, True);
    if Index < Sender.Items.Count then Sender.ItemIndex := Index;
  end;
  if GetColumn(Sender) <> nil then
    GetColumn(Sender).STFilter.FPopupListboxDownIndex := -1;
  Sender.InvalidateIndex(ItemIndex);
  IsCloseListbox := False;
end;

function TPopupListboxItemEhData.CloseOnExecute(Sender: TPopupListboxEh;
  ItemIndex: Integer): Boolean;
begin
  Result := False;
end;

procedure TPopupListboxItemEhData.Execute(Sender: TPopupListboxEh;
  ItemIndex: Integer; InItemPos: TPoint; Shift: TShiftState);
var
  i: Integer;
begin
  GetColumn(Sender).STFilter.FInFilterListBox := True;
  try
    if not GetColumn(Sender).STFilter.FEnterNotClearData then
      for i := 0 to Length(GetColumn(Sender).STFilter.FListValuesCheckingState)-1 do
      begin
        GetColumn(Sender).STFilter.FListValuesCheckingState[i] := False;
      end;
    GetColumn(Sender).STFilter.FListValuesCheckingState[ItemIndex] :=
      not GetColumn(Sender).STFilter.FListValuesCheckingState[ItemIndex];
    GetColumn(Sender).STFilter.UpdateFilterFromValuesCheckingState(Sender.Items);
  finally
    if GetColumn(Sender) <> nil then
      GetColumn(Sender).STFilter.FInFilterListBox := False;
  end;
  Sender.InvalidateIndex(ItemIndex);
end;

procedure TPopupListboxItemEhData.KeyPress(Sender: TPopupListboxEh;
  ItemIndex: Integer; var Key: Char; Shift: TShiftState; var IsCloseListbox: Boolean);
begin

end;

function TInplaceFilterEditEh.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(Owner);
end;

{ TCustomDBGridEh }


{ TGridEmptyDataInfoEh }

constructor TGridEmptyDataInfoEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.Color := clGray;
  FFont.OnChange := FontChanged;
  FParentFont := True;
end;

function TGridEmptyDataInfoEh.DefaultFont: TFont;
begin
  if Assigned(FGrid) and (FGrid is TControl)
{$IFDEF CIL}
    then Result := IControl(FGrid).GetFont
{$ELSE}
    then Result := FGrid.Font
{$ENDIF}
    else Result := FFont;
end;

procedure TGridEmptyDataInfoEh.FontChanged(Sender: TObject);
begin
  FParentFont := False;
  FGrid.Invalidate;
end;

procedure TGridEmptyDataInfoEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    FGrid.Invalidate;
  end;
end;

procedure TGridEmptyDataInfoEh.SetText(const Value: String);
begin
  if FText <> Value then
    begin
      FText := Value;
      FGrid.Invalidate;
    end;
end;

procedure TGridEmptyDataInfoEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

function TGridEmptyDataInfoEh.Showing: Boolean;
begin
  Result := Active and (GetText <> '');
  if Result then
  begin
    Result := Assigned(FGrid.DataSource) and
              Assigned(FGrid.DataSource.DataSet) and
              FGrid.DataSource.DataSet.Active and
              FGrid.DataSource.DataSet.IsEmpty;
  end;
end;

function TGridEmptyDataInfoEh.GetText : String;
begin
  if FText = '' then
    if DBGridEhEmptyDataInfoText = ''
      then Result := SNoDataEh
      else Result := DBGridEhEmptyDataInfoText
  else
    Result := FText;
end;

function TGridEmptyDataInfoEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

procedure TGridEmptyDataInfoEh.PaintEmptyDataInfo;
var
  w, h: Integer;
  ts: TSize;
  DrawInfo: TGridDrawInfoEh;
  AText: String;
  ADrawRect: TRect;
begin
  AText := GetText;

  FGrid.CalcDrawInfo(DrawInfo);
  w := DrawInfo.Horz.ContraExtent + DrawInfo.Horz.FixedBoundary; // width area with data
  h := DrawInfo.Vert.ContraExtent + DrawInfo.Vert.FixedBoundary; // heigth area with data

  FGrid.Canvas.Font := FFont;

  ts := FGrid.Canvas.TextExtent(AText);
  ts.cy := ts.cy + 2; // wihtout this patch symbol g sometimes cut buttom

  ADrawRect := Bounds((w shr 1) - (ts.cx shr 1), (h shr 1) - (ts.cy shr 1), ts.cx, ts.cy);

  InflateRect(ADrawRect, 5, 5);
  FGrid.Canvas.Brush.Color := FGrid.Color;
  WriteTextEh(FGrid.Canvas, ADrawRect, True, 6, 6, AText, taCenter, tlCenter, False, False, 0, 0, False, True);

  if dghExtendVertLines in FGrid.OptionsEh then
  begin
    FGrid.Canvas.Brush.Color := ApproximateColor(FGrid.Canvas.Font.Color, FGrid.Color, 192);
    InflateRect(ADrawRect, 1, 1);
    FGrid.Canvas.FrameRect(ADrawRect);
  end;
end;

procedure TGridEmptyDataInfoEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if not FParentFont then Exit;
  
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Size := DefaultFont.Size;
    FFont.Name := DefaultFont.Name;
    FFont.Charset := DefaultFont.Charset;
  finally
    FFont.OnChange := Save;
  end;
end;

destructor TGridEmptyDataInfoEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

constructor TCustomDBGridEh.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);
  RegetDefaultStyle;
  FCenter := DBGridEhCenter;
  FGridRowPanel := TGridRowPanelEh.Create(Self);
  FIndicatorOffset := 1;
  FUpdateFields := True;
  FOptions := [dgEditing, dgTitles, dgIndicator, dgColumnResize,
    dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
  DesignOptionsBoost := [goColSizing];
  ScrollBars := ssHorizontal;
  inherited Options := [
    goColSizing, goColMoving, goTabs, goEditing, goExtendVertLines,
    goThumbTracking];
  FTitleParams := TDBGridTitleParamsEh.Create(Self);
  FIndicatorParams := TDBGridIndicatorParamsEh.Create(Self);
  FFooterParams := TDBGridFooterParamsEh.Create(Self);

  FSaveCellExtents := False;
  FBookmarks := TBookmarkListEh.Create(Self);

  FTitleHeightFull := 0;
  SetLength(FLeafFieldArr, 0);
  FHeadTree := THeadTreeNode.CreateText('Root', 10, 0);
  FHTitleMargin := 0;
  FRowSizingAllowed := False;
  FDefaultRowChanged := False;
  FSumList := TDBGridEhSumList.Create(Self);
  FSumList.SumListChanged := SumListChanged;
  FSumList.OnRecalcAll := SumListRecalcAll;
  FSumList.OnAfterRecalcAll := SumListAfterRecalcAll;
  FHorzScrollBar := THorzDBGridEhScrollBar(CreateScrollBar(sbHorizontal));
  FVertScrollBar := TVertDBGridEhScrollBar(CreateScrollBar(sbVertical));
  FOptionsEh := [dghFixed3D, dghHighlightFocus, dghClearSelection,
    dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines];
  FIndicatorOptions := [gioShowRowIndicatorEh];
  FSortMarkedColumns := TColumnsEhList.Create;
  FPressedCol := -1;
  FPressedDataCol := -1;
  FTopLeftVisible := True;
  FSelection := TDBGridEhSelection.Create(Self);
  FSearchFilterSelection := TDBGridEhSelection.Create(nil);
  FAllowedSelections := [gstRecordBookmarks..gstAll];
  FGroupRowParams := TGroupRowParamsEh.Create;
  FGroupFooterParams := TGroupFooterParamsEh.Create;
  FTryUseMemTableInt := True;
  FSTFilter := TSTDBGridEhFilter.Create(Self);
  FTitleImageChangeLink := TChangeLink.Create;
  FTitleImageChangeLink.OnChange := TitleImageListChange;
  FEvenRowColorStored := False;
  FOddRowColorStored := False;
  FOldActiveRecord := -1;
  FIndicatorTitle := TDBGridEhIndicatorTitle.Create(Self);
  FRecNoTextWidth := CalcIndicatorColWidth;
  FOldTopLeft.X := LeftCol;
  FOldTopLeft.Y := TopRow;
  FStdDefaultRowHeight := CalcStdDefaultRowHeight;
  FDataGrouping := TDBGridEhDataGroupsEh.Create(Self);
  FDrawnGroupList := TList.Create;
  FInstantReadDataNodes := TList.Create;
  FRowDetailPanel := TRowDetailPanelEh.Create(Self);
  FRowDetailControl := TRowDetailPanelControlEh.Create(Self);
  FEmptyDataInfo := TGridEmptyDataInfoEh.Create(Self);
  FTreeViewParams := TGridTreeViewParamsEh.Create(Self);
  FHighlightTextParamsList := TList.Create;
  FSearchPanel := TDBGridSearchPanelEh.Create(Self);

  FLoadingModeCallCount := 0;
  FShowingLoadingMode := False;
  FLoadingModeText := 'Loading...';

  with FRowDetailControl do
  begin
    Name := 'RowDetailData';
    Visible := False;
    Parent := Self;
    SetBounds(0,0,0,0);
  end;

  FHorzScrollBarPanelControl := TDBGridEhScrollBarPanelControl.Create(Self, sbHorizontal);
  with FHorzScrollBarPanelControl do
  begin
    Name := 'HorzScrollBarPanelControl';
    Parent := Self;
    Visible := False;
    SetBounds(0,0,0,0);
    ParentBackground := False;
    Caption := '';
  end;

  FVertScrollBarPanelControl := TDBGridEhScrollBarPanelControl.Create(Self, sbVertical);
  with FVertScrollBarPanelControl do
  begin
    Name := 'VertScrollBarPanelControl';
    Parent := Self;
    Visible := False;
    SetBounds(0,0,0,0);
    ParentBackground := False;
    Caption := '';
  end;

  FCornerScrollBarPanelControl := TSizeGripPanelEh.Create(Self);
  with FCornerScrollBarPanelControl do
  begin
    Name := 'CornerScrollBarPanelControl';
    Parent := Self;
    Visible := False;
    SetBounds(0,0,0,0);
    ParentBackground := False;
  end;

  FSearchPanelControl := TDBGridSearchPanelControlEh.Create(Self);
  with FSearchPanelControl do
  begin
    Parent := Self;
    Name := 'FSearchPanelControl';
    Visible := False;
    SetBounds(0,0,0,0);
    ParentBackground := False;
    Text := '';
  end;

  UpdateGridDataWidth;
  UpdateGridDataHeight;
  HideEditor;
end;

constructor TCustomDBGridEh.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
begin
  FNoDesigntControler := True;
  Create(AOwner);
end;

destructor TCustomDBGridEh.Destroy;
begin
  Destroying;
  DataSource := nil;
  StopEditFilter;
  SearchEditorMode := False;
  FreeAndNil(FIndicatorTitle);
  if FStyle <> nil then
    FStyle.RemoveChangeNotification(Self);
  if FCenter <> nil then
    FCenter.RemoveChangeNotification(Self);
  FreeAndNil(FGroupRowParams);
  FreeAndNil(FGroupFooterParams);
  if Assigned(Selection) then
    Selection.Clear;
  FreeAndNil(FDataGrouping);
  FreeAndNil(FDrawnGroupList);
  FreeAndNil(FInstantReadDataNodes);
  FreeAndNil(FTitleParams);
  FreeAndNil(FIndicatorParams);
  FreeAndNil(FFooterParams);
  FreeAndNil(FHorzScrollBar);
  FreeAndNil(FVertScrollBar);
  FreeAndNil(FBookmarks);
  FreeAndNil(FTitleImageChangeLink);
  FreeAndNil(FHighlightTextParamsList);
  inherited Destroy;

  FreeAndNil(FLoadingModeBitmap);
  FreeAndNil(FSortMarkedColumns);
  SetLength(FLeafFieldArr, 0);
  FreeAndNil(FHeadTree);
  FreeAndNil(FSumList);
  FreeAndNil(FSelection);
  FreeAndNil(FSearchFilterSelection);
  FreeAndNil(FSTFilter);
  FreeAndNil(FRowDetailPanel);
  FreeAndNil(FGridRowPanel);
  FreeAndNil(FEmptyDataInfo);
  FreeAndNil(FTreeViewParams);
  FreeAndNil(FSearchPanel);
end;

function TCustomDBGridEh.AcquireFocus: Boolean;
begin
  Result := True;
  if Focused or
     ((InplaceEditor <> nil) and InplaceEditor.Focused) or
     ((FFilterEdit <> nil) and FilterEdit.Focused)
  then
    Exit;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
  begin
    SetFocus;
    Result := Focused or
             ((InplaceEditor <> nil) and InplaceEditor.Focused) or
             (SearchEditorMode and SearchPanel.Active);
    // VCL Bug is fixed
    if not Result and (Screen.ActiveForm <> nil) and
      (Screen.ActiveForm.FormStyle = fsMDIForm) then
    begin
      Windows.SetFocus(Handle);
      Result := Focused or
                ((InplaceEditor <> nil) and InplaceEditor.Focused)
//                or (SearchEditorMode and FHorzScrollBarPanelControl.ExtraPanel.FindEditor.Focused)
                ;
    end;
    // VCL Bug is fixed\\
  end;
  if not Result and (FFilterEdit <> nil) and FilterEdit.Focused then
    Result := True;
end;

function TCustomDBGridEh.RawToDataColumn(ACol: Integer): Integer;
begin
  Result := ACol - FIndicatorOffset;
end;

function TCustomDBGridEh.DataToRawColumn(ADataCol: Integer): Integer;
begin
  if RowPanel.Active
    then Result := FIndicatorOffset
    else Result := ADataCol + FIndicatorOffset;
end;

function TCustomDBGridEh.CanEditModifyColumn(Index: Integer): Boolean;
begin
  Result := Columns[Index].CanModify(False) and (dgEditing in Options);
end;

function TCustomDBGridEh.CanEditModifyText: Boolean;
begin
  Result := inherited CanEditModifyText;
end;

function TCustomDBGridEh.CanEditModify: Boolean;
begin
  if DataGrouping.IsGroupingWorks and
    (FCurGroupDataNode <> nil) and
    (FCurGroupDataNode.NodeType <> dntDataSetRecordEh)
  then
    Result := False
  else
    Result := not (Columns[SelectedIndex].GetColumnType in [{ctKeyPickList,} ctCheckboxes]) and
      not FInplaceSearching and CanEditModifyText;
end;

function TCustomDBGridEh.CanEditShow: Boolean;
begin
  Result := inherited CanEditShow;
  if Result then
  begin
    Result := Result and ((Selection.SelectionType = gstNon) or
      not (dghClearSelection in OptionsEh) or
      not (gstRectangle in AllowedSelections)
      );
    Result := Result and not FInplaceSearching;
    if Result and DataGrouping.IsGroupingWorks and (FCurGroupDataNode <> nil) and
      (FCurGroupDataNode.NodeType in [dntDataGroupEh, dntDataGroupFooterEh])
    then
      Result := False;
  end;
end;

function TCustomDBGridEh.CanEditorMode: Boolean;
begin
  Result := (dgAlwaysShowEditor in Options) and not FilterEditMode;
end;

procedure TCustomDBGridEh.CellClick(Column: TColumnEh);
begin
  if Assigned(FOnCellClick) then FOnCellClick(Column);
end;

procedure TCustomDBGridEh.ColEnter;
begin
  UpdateIme;
  if Assigned(FOnColEnter) then FOnColEnter(Self);
end;

procedure TCustomDBGridEh.ColExit;
begin
  if Assigned(FOnColExit) then FOnColExit(Self);
end;

procedure TCustomDBGridEh.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  STFilter.BeginUpdate;
  try
    FromIndex := RawToDataColumn(FromIndex);
    ToIndex := RawToDataColumn(ToIndex);
    Columns[FromIndex].Index := ToIndex;
    if Assigned(FOnColumnMoved) then FOnColumnMoved(Self, FromIndex, ToIndex);
  finally
    STFilter.EndUpdate;
  end;
  FFilterCol := SelectedIndex;
  UpdateFilterEdit(False);
end;

procedure TCustomDBGridEh.ColumnDeleting(Item: TAxisBarEh);
begin
  inherited ColumnDeleting(Item);
  if not (csDestroying in ComponentState) and (DataGrouping <> nil) then
  begin
    DataGrouping.ColumnDeleting(TColumnEh(Item));
  end;
end;

procedure TCustomDBGridEh.ColWidthsChanged;
var
  I, J, vi: Integer;
  OldWidth: Integer;
  Column: TColumnEh;

  procedure RecalcAutoFitRightCols(ForColumn: Integer);
  var
    i, RightWidth, Delta: Integer;
    ForColumnRef: TColumnEh;
  begin
    ForColumnRef := Columns[ForColumn];
    RightWidth := 0;
    Delta := ColumnWidthToCellColWidth(ForColumnRef, CellColWidths[ForColumn + FIndicatorOffset]) -
      ForColumnRef.Width;
    if (ForColumnRef.AutoFitColWidth) then
      ForColumnRef.FInitWidth :=
        MulDiv(CellColWidths[ForColumn + FIndicatorOffset],
                ForColumnRef.FInitWidth,
                ForColumnRef.Width)
    else
      ForColumnRef.Width := ColumnWidthToCellColWidth(ForColumnRef, CellColWidths[ForColumn + FIndicatorOffset]);
    for i := ForColumn + 1 to Columns.Count - 1 do
      if Columns[i].Visible and Columns[i].AutoFitColWidth
        then Inc(RightWidth, Columns[i].Width);

    for i := ForColumn + 1 to Columns.Count - 1 do
      if Columns[i].Visible and Columns[i].AutoFitColWidth then
      begin
        Columns[i].FInitWidth :=
          MulDiv(RightWidth - Delta, Columns[i].FInitWidth, RightWidth);
        if (Columns[i].FInitWidth <= 0) then Columns[i].FInitWidth := 1;
      end;
  end;
begin
  STFilter.BeginUpdate;
  if (Datalink.Active or (Columns.State = csCustomized)) and AcquireLayoutLock then
  try
    inherited ColWidthsChanged;

    for I := FIndicatorOffset to FullColCount - 1 do
    begin
      Column := Columns[I - FIndicatorOffset];
      CellColWidths[I] := ColWidthToCellWidth(Column,
        Column.AllowableWidth(ColumnWidthToCellColWidth(Column, CellColWidths[I])));
    end;
    for I := FIndicatorOffset to FullColCount - 1 do
    begin
      Column := Columns[I - FIndicatorOffset];
      // Columns[I - FIndicatorOffset].Width := ColWidths[I];
      if not Column.Visible then Continue;
      if (AutoFitColWidths = False) or (csDesigning in ComponentState) then
        Column.Width := ColumnWidthToCellColWidth(Column, CellColWidths[I])
      else
        if (Column.Width <> ColumnWidthToCellColWidth(Column, CellColWidths[I])) then
        begin
          if (dghResizeWholeRightPart in OptionsEh) then
          begin
            RecalcAutoFitRightCols(I - FIndicatorOffset);
          end else
          begin
            vi := -1;
            for j := 0 to VisibleColumns.Count - 1 do
              if (VisibleColumns[j] = Columns[I - FIndicatorOffset]) then
              begin
                vi := j; Break;
              end;
            if vi <> -1 then
            begin
              if VisibleColumns[vi].AutoFitColWidth then
              begin
                OldWidth := VisibleColumns[vi].FInitWidth;
                VisibleColumns[vi].FInitWidth :=
                  MulDiv(VisibleColumns[vi].FInitWidth,
                         ColumnWidthToCellColWidth(VisibleColumns[vi], CellColWidths[I]),
                         VisibleColumns[vi].Width);
                if (vi <> VisibleColumns.Count - 1) then
                begin
                  Inc(VisibleColumns[vi + 1].FInitWidth,
                       OldWIdth - VisibleColumns[vi].FInitWidth);
                  if (VisibleColumns[vi + 1].FInitWidth < 0) then
                    VisibleColumns[vi + 1].FInitWidth := 0;
                end;
              end
              else
                Column.Width := ColumnWidthToCellColWidth(Column, CellColWidths[I]);
            end;
          end;
        end;
    end;
  finally
    EndLayout;
  end else
    inherited ColWidthsChanged;
  InvalidateEditor;
  if DataLink.Active and MemTableSupport and AcquireLayoutLock then
    try
      UpdateAllDataRowHeights();
    finally
      EndLayout
    end
  else
    FColWidthsChanged := True;
  if Assigned(FOnColWidthsChanged) then FOnColWidthsChanged(Self);
  UpdateHorzExtScrollBar;

  STFilter.EndUpdate;
  UpdateFilterEdit(False);
end;

function TCustomDBGridEh.CreateAxisBars: TGridAxisBarsEh;
begin
  Result := TDBGridColumnsEh.Create(Self, TDBGridColumnEh);
end;

function TCustomDBGridEh.CreateAxisBarDefValues: TAxisBarDefValuesEh;
begin
  Result := TColumnDefValuesEh.Create(Self);
end;

function TCustomDBGridEh.CreateEditor: TInplaceEdit;
begin
  Result := TDBGridInplaceEdit.Create(Self);
end;

procedure TCustomDBGridEh.CreateWnd;
begin
  BeginUpdate; { prevent updates in WMSize message that follows WMCreate }
  try
    inherited CreateWnd;
  finally
    EndUpdate;
  end;

  if FStdDefaultRowHeight > Round(FInplaceEditorButtonWidth * 3 / 2)
    then FInplaceEditorButtonHeight := DefaultEditButtonHeight(FInplaceEditorButtonWidth,  Flat)
    else FInplaceEditorButtonHeight := FStdDefaultRowHeight;
  if AutoFitColWidths or RowPanel.Active then
    LayoutChanged
  else if (LayoutLock = 0) and not (csLoading in ComponentState) then
  begin
    SetColumnAttributes;
    UpdateRowCount;
    UpdateActive;
  end;
  UpdateScrollBar;
  GroupPanelVisibleChanged;
end;

procedure TCustomDBGridEh.DataChanged;
var
  VertSBVis: Boolean;
begin
  if FSuppressDataSetChanged then Exit;
  inherited DataChanged;

  if not HandleAllocated or FSumListRecalcing then
    Exit;
  if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.UpdateCount > 0) then
    Exit;
  if RowDetailPanel.Visible and
     DataLink.Active and
     ( (DataSetCompareBookmarks(DataLink.DataSet, DataLink.FLastBookmark, DataLink.DataSet.Bookmark) <> 0)
       or
        DataLink.DataSet.IsEmpty
     )
  then
    RowDetailPanel.Visible := False;

{  if DataGrouping.Active and
     DataLink.Active and
     (DataLink.DataSet.State = dsInsert)
   then
     DataGrouping.GroupDataTree.SetDataSetkeyValue;}
  if (csDesigning in ComponentState) and SumList.Active then
  begin
    FSumListRecalcing := True;
    try
      SumList.RecalcAll;
    finally
      FSumListRecalcing := False;
    end;
  end;
  if CheckIndicatorColWidthChanged
    then LayoutChanged
    else UpdateRowCount;
  VertSBVis := VertScrollBar.IsScrollBarVisible;
  UpdateScrollBar;
  if (VertSBVis <> VertScrollBar.IsScrollBarVisible) then
  begin
    if (FAutoFitColWidths = True) {and (UpdateLock = 0)} and
      not (csDesigning in ComponentState)
      then DeferLayout;
    //Update;
    //LayoutChanged;
  end;
  UpdateActive;
  if (SelectedRows.Count > 0) and
      DataLink.Active and
      not (DataLink.DataSet.State in dsEditModes)
  then
    SelectedRows.Refresh;
  InvalidateEditor;
  UpdateRowDetailPanel;
  ValidateRect(Handle, nil);
  Invalidate;
end;

procedure TCustomDBGridEh.DoContextPopup(MousePos: TPoint; var Handled: Boolean);
var
  Cell: TGridCoord;
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
  AbsMousePos: TPoint;
  ACellRect: TRect;
  P: TPopupMenu;
  pColumn : TColumnEh;
begin
  if InvalidPoint(MousePos) then
  begin
    Cell := GridCoord(Col, Row);
    ACellRect := CellRect(Cell.X, Cell.Y);
    MousePos.X := (ACellRect.Left + ACellRect.Right) div 2;
    MousePos.Y := (ACellRect.Top + ACellRect.Bottom) div 2;
  end else
    Cell := MouseCoord(MousePos.X, MousePos.Y);

  if (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
    if DataGrouping.IsGroupingWorks and
       (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctDataEh]) then
    begin
      InstantReadRecordEnter(AreaRow);
      ADrawGroupDataNode := InstantReadCurDataNode;
      InstantReadRecordLeave;
      if (ADrawGroupDataNode.NodeType = dntDataGroupFooterEh) and
         ADrawGroupDataNode.DataGroupFooter.ColumnItems[AreaCol].RunTimeCustomizable then
      begin
        FGroupFooterPopupMenu :=
          RecreateGroupFooterPopupMenu(ADrawGroupDataNode.DataGroupFooter.ColumnItems[AreaCol]);
        AbsMousePos := ClientToScreen(MousePos);
        FGroupFooterPopupMenu.Popup(AbsMousePos.X, AbsMousePos.Y);
        Handled := True;
      end;
    end;
    if (Cell.X >= FIndicatorOffset) and (Cell.Y >= 0) then
    begin
      pColumn := Columns[RawToDataColumn(Cell.X)];
      P := nil;

      if Cell.Y = 0 then
        begin
          if Assigned(pColumn.Title.PopupMenu) then
            P := pColumn.Title.PopupMenu
          else
            P := TitleParams.PopupMenu
        end;

      if P = nil then      
        P := pColumn.PopupMenu;

      if (P <> nil) and P.AutoPopup then
      begin
        SendCancelMode(nil);
        P.PopupComponent := Self;
        AbsMousePos := ClientToScreen(MousePos);
        P.Popup(AbsMousePos.X, AbsMousePos.Y);
        Handled := True;
      end;
    end;
  end;

  inherited DoContextPopup(MousePos, Handled);
end;

procedure TCustomDBGridEh.DoDataGroupFooterItemAggregateValue(Column: TColumnEh;
  GroupFooter: TGridDataGroupFooterEh;
  FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant;
  Node: TGroupDataTreeNodeEh; var Processed: Boolean);
begin
  if csLoading in ComponentState then Exit;
  if Assigned(Column.FOnDataGroupFooterAggregateValue) then
    Column.FOnDataGroupFooterAggregateValue(Self, Column, GroupFooter, FooterColumnItem, AValue, Node, Processed);
  if not Processed and Assigned(FOnDataGroupFooterAggregateValue) then
    FOnDataGroupFooterAggregateValue(Self, Column, GroupFooter, FooterColumnItem, AValue, Node, Processed);
end;

procedure TCustomDBGridEh.DoDataGroupFooterItemFinalizeValue(Column: TColumnEh;
  GroupFooter: TGridDataGroupFooterEh;
  FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant;
  var Processed: Boolean);
begin
  if csLoading in ComponentState then Exit;
  if Assigned(Column.FOnDataGroupFooterFinalizeValue) then
    Column.FOnDataGroupFooterFinalizeValue(Self, Column, GroupFooter, FooterColumnItem, AValue, Processed);
  if not Processed and Assigned(FOnDataGroupFooterFinalizeValue) then
    FOnDataGroupFooterFinalizeValue(Self, Column, GroupFooter, FooterColumnItem, AValue, Processed);
end;

procedure TCustomDBGridEh.DoDataGroupFooterItemToDisplayText(Column: TColumnEh;
  GroupFooter: TGridDataGroupFooterEh;
  FooterColumnItem: TGridDataGroupFooterColumnItemEh; var AValue: Variant;
  var DisplayValue: String; var Processed: Boolean);
begin
  if csLoading in ComponentState then Exit;
  if Assigned(Column.FOnDataGroupFooterToDisplayText) then
    Column.FOnDataGroupFooterToDisplayText(Self, Column, GroupFooter, FooterColumnItem, AValue, DisplayValue, Processed);
  if not Processed and Assigned(FOnDataGroupFooterToDisplayText) then
    FOnDataGroupFooterToDisplayText(Self, Column, GroupFooter, FooterColumnItem, AValue, DisplayValue, Processed);
end;

function TCustomDBGridEh.RecreateGroupFooterPopupMenu
  (ADataGroupFooterItem: TGridDataGroupFooterColumnItemEh): TPopupMenu;
var
  MenuItem: TDBGridEhMenuItem;
begin
  if FGroupFooterPopupMenu = nil then
    FGroupFooterPopupMenu := TPopupMenu.Create(Self);
  FGroupFooterPopupMenu.Items.Clear;

  if TColumnEh(ADataGroupFooterItem.Column).CanApplyAggregateFunction(gfvSumEh) then
  begin
    MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
    MenuItem.Caption := 'Sum';
    MenuItem.Grid := Self;
    MenuItem.TagObject := ADataGroupFooterItem;
    MenuItem.Tag := Ord(gfvSumEh);
    MenuItem.OnClick := GroupFooterPopupMenuClick;
    FGroupFooterPopupMenu.Items.Add(MenuItem);
  end;

  if TColumnEh(ADataGroupFooterItem.Column).CanApplyAggregateFunction(gfvMaxEh) then
  begin
    MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
    MenuItem.Caption := 'Max';
    MenuItem.Grid := Self;
    MenuItem.TagObject := ADataGroupFooterItem;
    MenuItem.Tag := Ord(gfvMaxEh);
    MenuItem.OnClick := GroupFooterPopupMenuClick;
    FGroupFooterPopupMenu.Items.Add(MenuItem);
  end;

  if TColumnEh(ADataGroupFooterItem.Column).CanApplyAggregateFunction(gfvMinEh) then
  begin
    MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
    MenuItem.Caption := 'Min';
    MenuItem.Grid := Self;
    MenuItem.TagObject := ADataGroupFooterItem;
    MenuItem.Tag := Ord(gfvMinEh);
    MenuItem.OnClick := GroupFooterPopupMenuClick;
    FGroupFooterPopupMenu.Items.Add(MenuItem);
  end;

  if TColumnEh(ADataGroupFooterItem.Column).CanApplyAggregateFunction(gfvCountEh) then
  begin
    MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
    MenuItem.Caption := 'Count';
    MenuItem.Grid := Self;
    MenuItem.TagObject := ADataGroupFooterItem;
    MenuItem.Tag := Ord(gfvCountEh);
    MenuItem.OnClick := GroupFooterPopupMenuClick;
    FGroupFooterPopupMenu.Items.Add(MenuItem);
  end;

  if TColumnEh(ADataGroupFooterItem.Column).CanApplyAggregateFunction(gfvAvgEh) then
  begin
    MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
    MenuItem.Caption := 'Average';
    MenuItem.Grid := Self;
    MenuItem.TagObject := ADataGroupFooterItem;
    MenuItem.Tag := Ord(gfvAvgEh);
    MenuItem.OnClick := GroupFooterPopupMenuClick;
    FGroupFooterPopupMenu.Items.Add(MenuItem);
  end;

  MenuItem := TDBGridEhMenuItem.Create(FGroupFooterPopupMenu);
  MenuItem.Caption := '(Empty)';
  MenuItem.Grid := Self;
  MenuItem.TagObject := ADataGroupFooterItem;
  MenuItem.Tag := Ord(gfvNonEh);
  MenuItem.OnClick := GroupFooterPopupMenuClick;
  FGroupFooterPopupMenu.Items.Add(MenuItem);

  Result := FGroupFooterPopupMenu;
end;

procedure TCustomDBGridEh.GroupFooterPopupMenuClick(Sender: TObject);
var
  ADataGroupFooterItem: TGridDataGroupFooterColumnItemEh;
begin
  if Sender is TDBGridEhMenuItem then
  begin
    ADataGroupFooterItem := TGridDataGroupFooterColumnItemEh(TDBGridEhMenuItem(Sender).TagObject);
    ADataGroupFooterItem.ValueType := TGroupFooterValueTypeEh(TDBGridEhMenuItem(Sender).Tag);
  end;
end;

procedure TCustomDBGridEh.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
end;

procedure TCustomDBGridEh.DefaultDrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
var
  Alignment: TAlignment;
  Value: string;
begin
  Alignment := taLeftJustify;
  Value := '';
  if Assigned(Field) then
  begin
    Alignment := Field.Alignment;
    Value := Field.DisplayText;
  end;
  WriteText(Canvas, Rect, 2, 2, Value, Alignment);
end;

procedure TCustomDBGridEh.DefaultDrawColumnCell(const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  Value: string;
  ARect, ARect1: TRect;
  XFrameOffs, YFrameOffs, KeyIndex: Integer;
  RowHeight: Integer;
  IsCellFilled: Boolean;
  MultiLine: Boolean;
begin
  ARect := Rect;
  if (dghFooter3D in OptionsEh) then
  begin
    XFrameOffs := 1;
    InflateRect(ARect, -1, -1);
  end else XFrameOffs := 2;
  YFrameOffs := XFrameOffs;
  if Flat then Dec(YFrameOffs);
  Value := Column.DisplayText;

  IsCellFilled := False;
  if GridBackgroundFilled and (Canvas.Brush.Color = FInternalColor) then
    IsCellFilled := True;
  if DataLink.Active and MemTableSupport
    then RowHeight := RowHeights[FIntMemTable.InstantReadCurRowNum + TopDataOffset]
    else RowHeight := FStdDefaultRowHeight;
  if Column.GetColumnType in [ctCommon..ctKeyPickList] then
  begin
    if Column.HideDuplicates and CheckColumnDuplicateValues(Column, Value, True) then
      Value := '';
    MultiLine := Column.WordWrap and Column.CurLineWordWrap(RowHeight);
    WriteCellText(Column, Canvas, ARect, True, XFrameOffs, YFrameOffs, Value,
       Column.Alignment, Column.Layout, MultiLine,
       Column.EndEllipsis, 0, 0, not MultiLine)
  end else if Column.GetColumnType = ctKeyImageList then
  begin
    Canvas.FillRect(ARect);
    if Column.Field = nil
      then KeyIndex := ColCellParamsEh.FImageIndex
      else KeyIndex := Column.KeyList.IndexOf(Column.Field.Text);
    if KeyIndex = -1
      then KeyIndex := Column.NotInKeyListIndex;
    DrawClipped(Column.ImageList, nil, Canvas, ARect, KeyIndex, 0, taCenter, ARect);
  end else if Column.GetColumnType = ctCheckboxes then
  begin
    Canvas.FillRect(ARect);
    ARect1.Left := ARect.Left + iif(ARect.Right - ARect.Left < DefaultCheckBoxWidth, 0,
      (ARect.Right - ARect.Left) shr 1 - DefaultCheckBoxWidth shr 1);
    ARect1.Right := iif(ARect.Right - ARect.Left < DefaultCheckBoxWidth, ARect.Right,
      ARect1.Left + DefaultCheckBoxWidth);
    ARect1.Top := ARect.Top + iif(ARect.Bottom - ARect.Top < DefaultCheckBoxHeight, 0,
      (ARect.Bottom - ARect.Top) shr 1 - DefaultCheckBoxHeight shr 1);
    ARect1.Bottom := iif(ARect.Bottom - ARect.Top < DefaultCheckBoxHeight, ARect.Bottom,
      ARect1.Top + DefaultCheckBoxHeight);

    PaintButtonControl(Canvas, ARect1, Canvas.Brush.Color, bcsCheckboxEh,
      0, Flat, False, True, Column.CheckboxState);
  end else if Column.GetColumnType = ctGraphicData then
    DrawGraphicCell(Column, ARect, Canvas.Brush.Color, IsCellFilled);

end;

procedure TCustomDBGridEh.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('VTitleMargin', ReadVTitleMargin, nil, False);
  Filer.DefineProperty('UseMultiTitle', ReadUseMultiTitle, nil, False);
  Filer.DefineProperty('TitleHeight', ReadTitleHeight, nil, False);
  Filer.DefineProperty('TitleLines', ReadTitleLines, nil, False);
  Filer.DefineProperty('FooterColor', ReadFooterColor, nil, False);

end;

function TCustomDBGridEh.DeletePrompt: Boolean;
var
  Msg: string;
  Handle: THandle;
begin
  if (FBookmarks.Count > 1)
    then Msg := SDeleteMultipleRecordsQuestion
    else Msg := SDeleteRecordQuestion;
  Handle := GetFocus;
  Result := not (dgConfirmDelete in Options) or
    (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel);
  if GetFocus <> Handle then
    Windows.SetFocus(Handle);
end;

function TCustomDBGridEh.DrawTitleByThemes: Boolean;
begin
{$IFDEF EH_LIB_7}
  Result := (TitleParams.GetActualFillStyle = cfstThemedEh) and ThemeServices.ThemesEnabled;
//  not Flat and ThemeServices.ThemesEnabled
//    and (dghFixed3D in OptionsEh);
//    and (([dgColLines, dgRowLines] * Options) = [dgColLines, dgRowLines]);
{$ELSE}
  Result := False;
{$ENDIF}
end;

function TCustomDBGridEh.IsDrawCellByThemes(ACol, ARow: Longint; AreaCol, AreaRow: Longint;
  AState: TGridDrawState; CellAreaType: TCellAreaTypeEh; Cell3D: Boolean): Boolean;
begin
  if ((CellAreaType.VertType = vctTitleEh) and (TitleParams.GetActualFillStyle = cfstThemedEh))
   or
     ((CellAreaType.HorzType = hctIndicatorEh) and (CellAreaType.VertType = vctTitleEh) and (TitleParams.GetActualFillStyle = cfstThemedEh))
   or
     ((CellAreaType.HorzType = hctIndicatorEh) and (CellAreaType.VertType <> vctTitleEh) and (IndicatorParams.GetActualFillStyle = cfstThemedEh))
   or
     ((CellAreaType.HorzType = hctDataEh) and (CellAreaType.VertType = vctFooterEh) and
      (FooterParams.GetActualFillStyle = cfstThemedEh)) then
  begin
    if Style.IsCustomStyleActive then
      Result := True
    else if ThemesEnabled {and not Flat and Cell3D}
      then Result := True
    else
      Result := False;
  end else
    Result := False;
end;

procedure TCustomDBGridEh.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
const
  CheckBoxFlags: array[TCheckBoxState] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED, DFCS_BUTTON3STATE or DFCS_CHECKED);
  EditToButtonStyle: array[TEditStyle] of TEditButtonStyleEh =
  (ebsDropDownEh, ebsEllipsisEh, ebsDropDownEh, ebsDropDownEh,
   ebsDropDownEh, ebsUpDownEh, ebsDropDownEh, ebsDropDownEh, ebsDropDownEh, ebsAltDropDownEh);
var
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  NewHeight: Integer;
  PanelRect: TRect;

begin
  CellAreaType := GetCellAreaType(ACol, ARow, AreaCol, AreaRow);
  if RowDetailPanel.Visible and (Row = ARow) then
  begin
    NewHeight := CalcRowDataRowHeight(ARow-TopDataOffset);
    if ARect.Bottom - ARect.Top > NewHeight then
    begin
      PanelRect := ARect;
      ARect.Bottom := ARect.Top + NewHeight;
      PanelRect.Top := ARect.Top + NewHeight;
      Canvas.Brush.Color := FInternalColor;
      Canvas.FillRect(PanelRect);
      if (FIntMemTable <> nil) and FIntMemTable.MemTableIsTreeList then
        if ACol = FixedCols - FrozenCols then
          DrawTreeArea(Canvas, PanelRect, True, True);
      if DataGrouping.IsGroupingWorks and
        (CellAreaType.HorzType = hctDataEh) and
        (AreaCol = VisibleColumns[0].Index)
      then
        DrawGroupDataArea(ACol, ARow, AreaCol, AreaRow,
          DataGrouping.ActiveGroupLevelsCount+1, AState, PanelRect,
          True, DataGrouping.ActiveGroupLevelsCount>0);
    end;
  end;

  if RowPanel.Active then
  begin
    if CellAreaType.HorzType = hctIndicatorEh then
      DrawIndicatorCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else if CellAreaType.VertType = vctFooterEh then
      DrawFooterAsRowPanel(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else if CellAreaType.VertType = vctDataEh then
      DrawDataAsRowPanel(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else
      DrawTitleAsRowPanel(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType);
  end else
  begin
    if CellAreaType.HorzType = hctIndicatorEh then
      DrawIndicatorCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else if CellAreaType.VertType = vctFooterEh then
      DrawFooterCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else if CellAreaType.VertType = vctDataEh then
      DrawDataCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType)
    else
      DrawTitleCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType);
  end;
end;

procedure TCustomDBGridEh.DrawIndicatorCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  MultiSelected: Boolean;
  BackColor: TColor;
  Highlight: Boolean;
  Down: Boolean;
  LeftMarg: Integer;
  IndicatorType: TDBGridEhRowIndicatorTypeEh;
  The3DRect: Boolean;
  AFillRect, IndicatorRect, TextRect: TRect;
  ARecNo: Integer;
  SRecNo: String;
  AIndicatorWidth, AIndicatorOffset: Integer;
  ADrawByThemes: Boolean;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
  CheckboxState: TCheckBoxState;
  IsCheckboxActive: Boolean;
  AClipRec: TRect;
  AThemeRect: TRect;
  AFixedState: TDBGirdDrawFixedStateEh;
  InsideRect: TRect;
  ARecordsCountShown: Boolean;

  function RowIsMultiSelected: Boolean;
  begin
    if DataGrouping.IsGroupingWorks and (InstantReadCurDataNode.NodeType in [dntDataGroupEh, dntDataGroupFooterEh]) then
      Result := (dgMultiSelect in Options) and Datalink.Active and (Selection.SelectionType in [gstAll])
    else
      Result := (dgMultiSelect in Options) and Datalink.Active and
        (Selection.SelectionType in [gstAll, gstRecordBookmarks]) and
        DataCellSelected(AreaCol, Datalink.Datasource.Dataset.Bookmark);
  end;

begin
  Canvas.Brush.Color := IndicatorParams.Color;
  ADrawGroupDataNode := nil;
  The3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
  ADrawByThemes := IsDrawCellByThemes(ACol, ARow, AreaCol, AreaRow, AState,
    CellAreaType, The3DRect);
  Down := False;
  Highlight := False;

  AFillRect := ARect;
  if The3DRect and not ADrawByThemes then
    {if ADrawByThemes then
    begin
      Style.GetThemeTitleFillRect(AFillRect);
    end else }
    if Flat or (IndicatorParams.GetActualFillStyle = cfstGradientEh) then
    begin
      Inc(AFillRect.Left, 1);
      Inc(AFillRect.Top, 1);
    end else
    begin
      InflateRect(AFillRect, -1, -1);
    end;

  if dgIndicator in Options
    then AIndicatorWidth := IndicatorWidth
    else AIndicatorWidth := 0;
  if dghShowRecNo in OptionsEh then
  begin
    if AIndicatorWidth <> 0 then
      AIndicatorWidth := AIndicatorWidth - 2;
    AIndicatorOffset := 0;
  end else
    AIndicatorOffset := 1;

  MultiSelected := (Selection.SelectionType = gstAll);
  AFixedState.Pressed := Down;
  AFixedState.Selected := MultiSelected;
  AFixedState.HotTrack := False;
  AFixedState.The3DRect := The3DRect;
  AFixedState.FillColor := Canvas.Brush.Color;
  AFixedState.StartGradientColor := clDefault;
  AFixedState.EndGradientColor := clDefault;
  AFixedState.DrawByThemesOverLines := ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh);
  AFixedState.FontColor := TitleParams.Font.Color;
  AFixedState.VertBorderInFillStyle := False;
  AFixedState.HorzLineColor := IndicatorParams.GetHorzLineColor;
  AFixedState.VertLineColor := IndicatorParams.GetVertLineColor;
  AFixedState.ClipRect := EmptyRect;

  if CellAreaType.VertType = vctTitleEh then
  begin

    Canvas.Brush.Color := TitleParams.Color;
    if Style.IsCustomStyleActive then
      Canvas.Brush.Color := FInternalFixedColor;
    if MultiSelected then
    begin
      BackColor := Canvas.Brush.Color;
      Highlight := HighlightNoDataCellColor(ACol, ARow,
        AreaCol, AreaRow, CellAreaType, AState, MultiSelected, BackColor,
        Canvas.Font);
      Canvas.Brush.Color := BackColor;
      AFixedState.FillColor := Canvas.Brush.Color;
    end;

    Down := IndicatorTitle.Down and FPressed;
    if Down
      then LeftMarg := 2
      else LeftMarg := 0;

    AFixedState.FillStyle := TitleParams.GetActualFillStyle;
    AFixedState.HorzBorderInFillStyle := TitleParams.BorderInFillStyle;
    if TitleParams.SecondColorStored then
      AFixedState.StartGradientColor := TitleParams.SecondColor;

    if ADrawByThemes then
    begin
      AThemeRect := AFillRect;
      if ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh) then
      begin
        AClipRec := EmptyRect;
      end else
      begin
        AClipRec := ARect;
        if ADrawByThemes and (TitleParams.GetActualFillStyle = cfstThemedEh) then
          Style.GetThemeTitleFillRect(AThemeRect, True, not TitleParams.BorderInFillStyle);
      end;

      if Style.IsCustomStyleActive then
        Style.DrawCustomStyleCellBackground(Self, Canvas, AThemeRect, TitleParams.GetActualFillStyle,
          TitleParams.Color, AState, 0, 0, Down, AClipRec)
      else
        FillCellRect(cfstThemedEh, AThemeRect, False, MultiSelected, AClipRec, The3DRect)
    end else
    begin
      Style.DrawFixedCellBackground(Self, Canvas, ARect, True, InsideRect, AState, AFixedState);
      if Style.IsCustomStyleActive then
        Canvas.Font.Color := AFixedState.FontColor;
    end;

    if IndicatorTitle.ShowDropDownSign then
    begin
      DrawIndicatorDropDownSign(ACol, ARow,
        Rect(ARect.Right-12+LeftMarg, ARect.Top+LeftMarg, ARect.Right, ARect.Bottom),
        Highlight);
    end;
  end else if (CellAreaType.VertType = vctDataEh) and
               Assigned(DataLink) and DataLink.Active then
  begin

    AFixedState.HorzBorderInFillStyle := False;
    AFixedState.FillStyle := IndicatorParams.GetActualFillStyle;
    if Style.IsCustomStyleActive then
      Canvas.Brush.Color := FInternalFixedColor;

    ARecNo := 0;
    if (AreaRow >= 0) and (AreaRow < InstantReadRecordCount) then // Indicator
    begin
      InstantReadRecordEnter(AreaRow);
      try
        MultiSelected := RowIsMultiselected;
        ARecNo := DataSource.DataSet.RecNo;
        ADrawGroupDataNode := InstantReadCurDataNode;
      finally
        InstantReadRecordLeave;
      end;
    end;
    Canvas.Font := Font;
    if IsCurrentRow(AreaRow) and ThemesEnabled then
      Canvas.Brush.Color := ApproachToColorEh(Canvas.Brush.Color, clBlack, 10);
    if MultiSelected then
    begin
      BackColor := Canvas.Brush.Color;
      {Highlight := }HighlightNoDataCellColor(ACol, ARow,
        AreaCol, AreaRow, CellAreaType, AState, MultiSelected, BackColor, Canvas.Font);
      Canvas.Brush.Color := BackColor;
      AFixedState.Selected := MultiSelected;
      AFixedState.FillColor := Canvas.Brush.Color;
    end;

    if ADrawByThemes then
    begin
      AThemeRect := AFillRect;
      if ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh) then
      begin
        AClipRec := EmptyRect;
      end else
      begin
        AClipRec := ARect;
        if ADrawByThemes and (IndicatorParams.GetActualFillStyle = cfstThemedEh) then
          Style.GetThemeTitleFillRect(AThemeRect, True, True);
      end;

      if Style.IsCustomStyleActive then
        Style.DrawCustomStyleCellBackground(Self, Canvas, AThemeRect, IndicatorParams.GetActualFillStyle,
          IndicatorParams.Color, AState, 0, 0, Down, AClipRec)
      else
        FillCellRect(cfstThemedEh, AThemeRect, False, MultiSelected, AClipRec, The3DRect)
    end else
    begin
      Style.DrawFixedCellBackground(Self, Canvas, ARect, True, InsideRect, AState, AFixedState);
      if Style.IsCustomStyleActive then
        Canvas.Font.Color := AFixedState.FontColor;
    end;
//      FillCellRect(IndicatorParams.GetActualFillStyle, AFillRect, False, MultiSelected, EmptyRect, The3DRect);

    if (dgIndicator in Options) and IsCurrentRow(AreaRow) then
    begin
      IndicatorType := giNormalArrowEh;
      //FIndicators.BkColor := FixedColor; //??? to avoid ImageListChange event
      if DataLink.DataSet <> nil then
        case DataLink.DataSet.State of
          dsEdit: IndicatorType := giEditEh;
          dsInsert: IndicatorType := giInsertEh;
          dsBrowse:
            if IsCurrentRow(AreaRow) then
              if MultiSelected then
                IndicatorType := giSelectedArrowEh
              else if FInplaceSearching then
                IndicatorType := giInplaceSearch
              else
                IndicatorType := giNormalArrowEh;
        else IndicatorType := giNormalArrowEh; // multiselected and current row
        end;
      IndicatorRect := ARect;
      IndicatorRect.Left := IndicatorRect.Right - AIndicatorWidth;
      DrawRowIndicator(ACol, ARow, IndicatorRect, AIndicatorOffset, 0, IndicatorType);
      if ARow = DataLink.ActiveRecord then
        FSelRow := ARow + TopDataOffset;
    end;

    if gioShowRowselCheckboxesEh in IndicatorOptions then
    begin
      if not DataGrouping.IsGroupingWorks
        or
         ( DataGrouping.IsGroupingWorks and
           (ADrawGroupDataNode <> nil) and
           (ADrawGroupDataNode.NodeType = dntDataSetRecordEh)
         ) then
      begin
        TextRect := ARect;
        Dec(TextRect.Right, AIndicatorWidth);
        TextRect.Left := TextRect.Right - FRowselCheckboxesWidth;
        if MultiSelected
          then CheckboxState := cbChecked
          else CheckboxState := cbUnchecked;
        IsCheckboxActive := (FHotTrackCell.X = ACol) and (FHotTrackCell.Y = ARow)
          and PtInRect(Rect(TextRect.Left, TextRect.Top,
                            TextRect.Right+GridLineWidth,
                            TextRect.Bottom+GridLineWidth), FMoveMousePos);
        SetMaxSizeForCheckbox(TextRect);
        PaintButtonControl(Canvas, TextRect, Canvas.Brush.Color, bcsCheckboxEh,
          0, Flat, IsCheckboxActive, True, CheckboxState);
      end;
    end;

    if dghShowRecNo in OptionsEh then
    begin
      TextRect := ARect;
      Dec(TextRect.Right, AIndicatorWidth + FRowselCheckboxesWidth);
      Canvas.Font.Size := Canvas.Font.Size - 1;

      if (ARecNo <= 0) or
         ((DataLink.DataSet.State = dsInsert) and IsCurrentRow(AreaRow)) or
         (DataGrouping.IsGroupingWorks and (ADrawGroupDataNode.NodeType in [dntDataGroupEh, dntDataGroupFooterEh]))
        then SRecNo := ''
        else
        begin
          if ((IndicatorParams.RecNoShowStep > 0) and (ARecNo mod IndicatorParams.RecNoShowStep = 0)) or
             (ARecNo = 1) or
             (ARecNo = DataLink.DataSet.RecordCount) or
             IsCurrentRow(AreaRow)
          then
            SRecNo := IntToStr(ARecNo)
          else if (IndicatorParams.RecNoShowStep mod 2 = 0) and
                  ((ARecNo mod IndicatorParams.RecNoShowStep) = (IndicatorParams.RecNoShowStep div 2)) then
            SRecNo := '-'
          else
            SRecNo := Char($B7);
        end;
      WriteCellText(nil, Canvas, TextRect, False, 0, 0, SRecNo, taCenter, tlCenter,
        True, False, 0, 0, False);
    end;
  end else
  begin  // Footer
    AFixedState.HorzBorderInFillStyle := False;
    AFixedState.FillStyle := IndicatorParams.GetActualFillStyle;
    if Style.IsCustomStyleActive then
      Canvas.Brush.Color := FInternalFixedColor;

    if MultiSelected then
    begin
      BackColor := Canvas.Brush.Color;
      {Highlight := }HighlightNoDataCellColor(ACol, ARow,
        AreaCol, AreaRow, CellAreaType, AState, MultiSelected, BackColor,
        Canvas.Font);
      Canvas.Brush.Color := BackColor;
      AFixedState.FillColor := Canvas.Brush.Color;
    end;

    if ADrawByThemes then
    begin
      AThemeRect := AFillRect;
      if ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh) then
      begin
        AClipRec := EmptyRect;
      end else
      begin
        AClipRec := ARect;
        if ADrawByThemes and (IndicatorParams.GetActualFillStyle = cfstThemedEh) then
          Style.GetThemeTitleFillRect(AThemeRect, True, True);
      end;

      if Style.IsCustomStyleActive then
          Style.DrawCustomStyleCellBackground(Self, Canvas, AThemeRect, IndicatorParams.GetActualFillStyle,
          IndicatorParams.Color, AState, 0, 0, Down, AClipRec)
      else
        FillCellRect(cfstThemedEh, AThemeRect, False, MultiSelected, AClipRec, The3DRect)
    end else
    begin
      Style.DrawFixedCellBackground(Self, Canvas, ARect, True, InsideRect, AState, AFixedState);
      if Style.IsCustomStyleActive then
        Canvas.Font.Color := AFixedState.FontColor;
    end;
//      FillCellRect(IndicatorParams.GetActualFillStyle, AFillRect, False, MultiSelected, AClipRec, The3DRect);

    if HorzScrollBar.ExtraPanel.Visible and (gsbiRecordsInfoEh in HorzScrollBar.ExtraPanel.VisibleItems)
      then ARecordsCountShown := True
      else ARecordsCountShown := False;

    if (ARecordsCountShown = False) and
       (dghShowRecNo in OptionsEh) and
       (CellAreaType.VertType = vctFooterEh) and
       (AreaRow = 0) then
    begin
      TextRect := ARect;
      Dec(TextRect.Right, AIndicatorWidth);
      Canvas.Font := Font;
      Canvas.Font.Size := Canvas.Font.Size - 1;

      ARecNo := 0;
      if Assigned(DataLink) and DataLink.Active then
        ARecNo := DataLink.DataSet.RecordCount;
      if (ARecNo <= 0) or
         ((DataLink.DataSet.State = dsInsert) and IsCurrentRow(AreaRow))
        then SRecNo := ''
        else SRecNo := IntToStr(ARecNo);

      WriteCellText(nil, Canvas, TextRect, False, 0, 0, SRecNo, taCenter, tlCenter,
        True, False, 0, 0, False);
    end;

  end;

end;


procedure TCustomDBGridEh.DrawTitleCellState(Column: TColumnEh;
  ARect: TRect; AState: TGridDrawState; var ATitleState: TDBGirdDrawTitleStateEh);
var
  Title: TColumnTitleEh;
  BackColor: TColor;
  ImageWidth: Integer;
  AFillRect, ATextRect, ARect1: TRect;
  XFrameOffs, YFrameOffs: Integer;
  FilterButtonWidth: Integer;
  FilterButtonRect, FilterButtonFillRect, FilterSignRect, FilterButtonClipRect: TRect;
  TitleText: String;
  LeftMarg, RightMarg: Integer;
  SortMarkerIdx: Integer;
  SMTMarg: Integer;
  SMImageFit: Boolean;
  FillTextRect: Boolean;
  Layout: TTextLayout;
  BrushStyle: TBrushStyle;
  ADownButton: Integer;
  ButtonActive: Boolean;
  EditButtonTransparency: Integer;
  SMRect: TRect;
  smSize: TSize;
  AThemeRect: TRect;
  FontData: TFontDataEh;
begin
  Title := Column.Title;

  Canvas.Font := Title.Font;
  Canvas.Brush.Color := ATitleState.BackColor;
  ImageWidth := 0;

  if ATitleState.DrawByThemes then
  begin
    Style.DrawTitleCellBackground(Self, Column, Canvas, ARect, True, AThemeRect, AState, ATitleState, EmptyRect);
  end else if (TitleParams.GetActualFillStyle = cfstGradientEh) and (ThemesEnabled or Style.GradientEnabledInClassicTheme) then
  begin
    Style.DrawTitleCellBackground(Self, Column, Canvas, ARect, True, AThemeRect, AState, ATitleState, EmptyRect);
  end else
  begin
    Style.DrawTitleCellBackground(Self, Column, Canvas, ARect, False, AThemeRect, AState, ATitleState, EmptyRect);
    AFillRect := AThemeRect;
    ATextRect := AThemeRect;
  end;

  AFillRect := AThemeRect;
  ATextRect := AThemeRect;

  if ATitleState.The3DRect and not ATitleState.DrawByThemes then
  begin
    XFrameOffs := 1;
    if ATitleState.DrawByThemes then
    begin
//      InflateRect(ATextRect, -1, -1);
    end else if Flat or (TitleParams.GetActualFillStyle = cfstGradientEh) then
    begin
//      InflateRect(ATextRect, -1, -1);
    end else
    begin
//      InflateRect(ATextRect, -1, -1);
    end;
  end else
    XFrameOffs := 2;

  YFrameOffs := XFrameOffs;
  {if Flat then }Dec(YFrameOffs, 2);
  if ATitleState.DrawByThemes or
    ((TitleParams.GetActualFillStyle = cfstGradientEh) and (ThemesEnabled or Style.GradientEnabledInClassicTheme))
  then
    XFrameOffs := 0;

  if ATitleState.DrawFilterButton then
  begin
    if Flat then
    begin
      FilterButtonWidth := FlatButtonWidth;
      if not ThemesEnabled then
        Inc(FilterButtonWidth);
    end else
      FilterButtonWidth := GetSystemMetrics(SM_CXVSCROLL);

    if (ATextRect.Right - ATextRect.Left) div 2 < FilterButtonWidth then
      FilterButtonWidth := (ATextRect.Right - ATextRect.Left) div 2;

    FilterButtonRect := ATextRect;
    FilterButtonRect.Right := ATextRect.Right;
    FilterButtonRect.Left := FilterButtonRect.Right - FilterButtonWidth;
    if not ATitleState.The3DRect then
    begin
      OffsetRect(FilterButtonRect, -1, 0);
      if FilterButtonRect.Top = ARect.Top then
        Inc(FilterButtonRect.Top);
      if FilterButtonRect.Bottom = ARect.Bottom then
        Dec(FilterButtonRect.Bottom);
    end;
    FilterButtonFillRect := FilterButtonRect;
    if FilterButtonRect.Bottom - FilterButtonRect.Top > FInplaceEditorButtonHeight then
    begin
      FilterButtonRect.Top := (FilterButtonRect.Bottom + FilterButtonRect.Top -
        FInplaceEditorButtonHeight) div 2;
      FilterButtonRect.Bottom := FilterButtonRect.Top + FInplaceEditorButtonHeight;
    end;

    Dec(ATextRect.Right, FilterButtonWidth);
  end;

  FilterSignRect.Top := ATextRect.Top;
  FilterSignRect.Left := ATextRect.Right - 6;
  FilterSignRect.Right := ATextRect.Right;
  FilterSignRect.Bottom := FilterSignRect.Top + 6;

  if (TitleImages <> nil) and (Title.ImageIndex <> -1) then
  begin
    TitleText := '';
    ImageWidth := TitleImages.Width;
  end else
    TitleText := ATitleState.Caption;

  ARect1 := ATextRect;

  if ATitleState.Down then
  begin
    if (IsUseMultiTitle = True) or (TitleHeight <> 0) or (TitleLines <> 0) then
    begin
      LeftMarg := 2; RightMarg := -2; Inc(ARect1.Top, 2);
    end else
    begin
      LeftMarg := 1; RightMarg := -1; Inc(ARect1.Top, 1);
    end;
  end else
  begin
    LeftMarg := 0;
    RightMarg := 0;
  end;
  case ATitleState.SortMarker of
    smDownEh: SortMarkerIdx := 0;
    smUpEh: SortMarkerIdx := 1;
    else SortMarkerIdx := -1;
  end;

  SMTMarg := 0; SMImageFit := True;
  if SortMarkerIdx <> -1 then
  begin
    Dec(ARect1.Right, 16);
    if ATitleState.DrawSortIndex and (SortMarkedColumns.Count > 1) then
    begin
      GetFontData(Canvas.Font, FontData);
      Canvas.Font := SortMarkerFont;
      SMTMarg := Canvas.TextWidth(IntToStr(Title.SortIndex));
      SetFontData(FontData, Canvas.Font);
    end else
      SMTMarg := 0;
    if ARect1.Right < ARect1.Left + ImageWidth then
    begin
      ARect1.Right := ARect1.Right + 14 - SMTMarg;
      SMImageFit := False;
    end;
    if ARect1.Right < ARect1.Left + ImageWidth then
    begin
      ARect1.Right := ARect1.Right + 2 + SMTMarg;
      SMTMarg := 0;
    end;
  end;
  Canvas.Font.Charset := ATitleState.FontCharset;
  if not ((ATitleState.FontColor = clWindowText) and Style.IsCustomStyleActive) then
    Canvas.Font.Color := ATitleState.FontColor;
  Canvas.Font.Height := ATitleState.FontHeight;
  Canvas.Font.Name := ATitleState.FontName;
  Canvas.Font.Style := ATitleState.FontStyle;

  if ATitleState.DrawByThemes then
  begin
    FillTextRect := False;
  end else if (TitleParams.GetActualFillStyle = cfstGradientEh) and (ThemesEnabled or Style.GradientEnabledInClassicTheme) then
  begin
    FillTextRect := False;
  end else
  begin
    Canvas.FillRect(Rect(ARect1.Right, AFillRect.Top, AFillRect.Right, AFillRect.Bottom));
    Canvas.FillRect(Rect(ARect1.Left, AFillRect.Top, ARect1.Right, ARect1.Top));
    FillTextRect := True;
  end;

  if ATitleState.WordWrap
    then Layout := tlCenter
    else Layout := tlTop;
  if ATitleState.Orientation = tohVertical then
    WriteTextVerticalEh(Canvas, ARect1, FillTextRect, XFrameOffs, YFrameOffs + 2,
      TitleText, taCenter{Title.Alignment}, tlBottom, Title.EndEllipsis, False)
  else
    WriteCellText(nil, Canvas, ARect1,
      FillTextRect, XFrameOffs, YFrameOffs, TitleText,
      Title.Alignment, Layout, ATitleState.WordWrap, Title.EndEllipsis,
      LeftMarg, RightMarg, not ATitleState.WordWrap);

  if (TitleImages <> nil) and (Title.ImageIndex <> -1) then
  begin
    with TitleImages do
    begin
      if UseMultiTitle
        then DrawClipped(TitleImages, nil, Canvas, ARect1, Title.ImageIndex, LeftMarg, taCenter, ARect1)
        else DrawClipped(TitleImages, nil, Canvas, ARect1, Title.ImageIndex, LeftMarg, Title.Alignment, ARect1);
    end;
  end;
  if SortMarkerIdx <> -1 then
  begin
    if SMImageFit <> False then
    begin
      smSize := Style.GetSortMarkerSize(Canvas, TitleParams.SortMarkerStyle);
      SMRect := Rect(ATextRect.Right - DBGridEhSortMarkerImages.Width - 2 - SMTMarg + LeftMarg,
                     (ATextRect.Bottom + ATextRect.Top - smSize.cy) div 2 + LeftMarg,
                     0, 0);
      SMRect.Right := SMRect.Left + smSize.cx - 1;
      SMRect.Bottom := SMRect.Top + smSize.cy - 1;
      Style.DrawSortMarker(Canvas, TitleParams.SortMarkerStyle, Column,
        ATitleState.SortMarker, ATitleState.CellMultiSelected, SMRect);
    end;
    if SMTMarg <> 0 then
    begin
      GetFontData(Canvas.Font, FontData);
      Canvas.Font := SortMarkerFont;
      Canvas.Font.Color := ApproximateColor(GridLineParams.GetDarkColor, cl3DDkShadow, 128);
      if ATitleState.Highlight = True
        then Canvas.Font.Color := clWhite;
      BrushStyle := Canvas.Brush.Style;
      BackColor := Canvas.Brush.Color;
      Canvas.Brush.Style := bsClear;
      Canvas.TextOut(ATextRect.Right - SMTMarg - 2 + LeftMarg,
        (ATextRect.Bottom + ATextRect.Top - DBGridEhSortMarkerImages.Height) div 2 + LeftMarg - 1,
        IntToStr(Title.SortIndex));
      Canvas.Brush.Style := BrushStyle;
      Canvas.Brush.Color := BackColor;
      {Canvas.Font := TitleFont;
      if ATitleState.Highlight = True
        then Canvas.Font.Color := clWhite;}
      SetFontData(FontData, Canvas.Font);
    end;
  end;

  if ATitleState.DrawFilterButton then
  begin
    if FillTextRect then
    begin
      Canvas.FillRect(FilterButtonFillRect);
    end;
    FilterButtonClipRect := FilterButtonRect;
    if ATitleState.Down then
      OffsetRect(FilterButtonRect, LeftMarg, LeftMarg);
    if FInTitleFilterListboxVisible and (FInTitleFilterListboxColumn = Column)
      then ADownButton := 1
      else ADownButton := 0;

    ButtonActive := False;

    if csDesigning in ComponentState then
      EditButtonTransparency := 30
    else if ((gdHotTrack in AState) and (FHotTrackEditButton = 0){IsMouseInRect(FilterButtonRect)} and CanMouseTrackMode)
        or (FInTitleFilterListboxVisible and (FInTitleFilterListboxColumn = Column))
    then
    begin
      EditButtonTransparency := 0;
      ButtonActive := True;
    end else if (gdHotTrack in AState) and not FHotTrackMultiTitleOver and CanMouseTrackMode then
      EditButtonTransparency := 30
    else
      EditButtonTransparency := 80;

    PaintInplaceButton(Column, Canvas, Style.InTitleFitlerButtonStyle,
      FilterButtonRect,  FilterButtonFillRect,
      ADownButton, ButtonActive, Flat, DataLink.Active, Canvas.Brush.Color, nil,
      EditButtonTransparency, nil, 0);

  end;

  if STFilter.Visible and
     (Column.STFilter.ExpressionStr <> '') and
     (STFilter.Location = stflInTitleFilterEh) then
  begin
    if ATitleState.Down then
      OffsetRect(FilterSignRect, LeftMarg, LeftMarg);
    DrawFilterSign(FilterSignRect, ATitleState.CellMultiSelected);
  end;

end;

procedure TCustomDBGridEh.DrawTitleCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  AFillRect: TRect;
  ASubtRect: TRect;
  DrawColumn: TColumnEh;
  YFrameOffs: Byte;
  Title: TColumnTitleEh;
  ATitleState: TDBGirdDrawTitleStateEh;
  AClipRec: TRect;
  TitleRowRect: TRect;

  function CalcTitleRect: TRect;
  var
    i, w: Integer;
  begin
    w := FPaintDrawInfo.Horz.OutViewVisCellStart;
    for i := FPaintDrawInfo.Horz.FirstGridCell to  FPaintDrawInfo.Horz.GridCellCount-1  do
    begin
      if w > FPaintDrawInfo.Horz.GridBoundary then
      begin
        w := FPaintDrawInfo.Horz.GridBoundary;
        Break;
      end;
      Inc(w, ColWidths[i] + FPaintDrawInfo.Horz.EffectiveLineWidth);
    end;
    Result := Rect(FPaintDrawInfo.Horz.FixedBoundary, ARect.Top, w, ARect.Bottom);
  end;

  procedure DrawHostEh(ALeaf: THeadTreeNode; DHRect: TRect; AEndEllipsis: Boolean);
  var
    curLeaf: THeadTreeNode;
    curW: Integer;
    drawRec, drawRec1: TRect;
  begin
    if ALeaf.Host.Drawn then Exit;

    DHRect.Bottom := DHRect.Top;
    Dec(DHRect.Top, ALeaf.Host.Height);

    curLeaf := ALeaf.Host.Child;
    curW := 0;
    while curLeaf <> ALeaf do
    begin
      Inc(curW, curLeaf.Width);
      if TitleParams.VertLines then
        Inc(curW, 1);
      curLeaf := curLeaf.Next;
    end;
    Dec(DHRect.Left, curW);
    DHRect.Right := DHRect.Left + ALeaf.Host.Width;

    drawRec := DHRect;
    drawRec.Left := ARect.Left;
    drawRec.Right := ARect.Right;

    if ATitleState.DrawByThemes then
    begin
      Style.DrawTitleCellBackground(Self, nil, Canvas, DHRect, True, drawRec1, AState, ATitleState, EmptyRect);
      WriteCellText(DrawColumn, Canvas, drawRec1, False, 0,
        YFrameOffs, ALeaf.Host.Text, taCenter, tlCenter, True, AEndEllipsis, 0, 0, False);
    end else if (TitleParams.GetActualFillStyle = cfstGradientEh) and (ThemesEnabled or Style.GradientEnabledInClassicTheme) then
    begin
      Style.DrawTitleCellBackground(Self, nil, Canvas, DHRect, True, drawRec1, AState, ATitleState, EmptyRect);
      WriteCellText(DrawColumn, Canvas, drawRec1, False, 0,
        YFrameOffs, ALeaf.Host.Text, taCenter, tlCenter, True, AEndEllipsis, 0, 0, False);
    end else
    begin
      Style.DrawTitleCellBackground(Self, nil, Canvas, DHRect, False, drawRec1, AState, ATitleState, EmptyRect);
      WriteCellText(DrawColumn, Canvas, drawRec1, True, 2-(drawRec1.Left-DHRect.Left),
        YFrameOffs, ALeaf.Host.Text, taCenter, tlCenter, True, AEndEllipsis, 0, 0, False);
    end;

    if TitleParams.VertLines and not TitleParams.BorderInFillStyle  then
    begin
      Canvas.Pen.Color := TitleParams.GetVertLineColor;
      DrawPolyline([Point(DHRect.Right, DHRect.Bottom-1),
                     Point(DHRect.Right,DHRect.Top-1)]);
    end;

    if TitleParams.HorzLines and not ATitleState.HorzBorderInFillStyle then
    begin
      Canvas.Pen.Color := TitleParams.GetHorzLineColor;
      DrawPolyline([Point(DHRect.Left, DHRect.Bottom-1),
                     Point(DHRect.Right,DHRect.Bottom-1)]);
    end;

    ALeaf.Host.Drawn := True;
    if (ALeaf.Host.Host <> nil) and (ALeaf.Host.Host <> FHeadTree) then
    begin
      DrawHostEh(ALeaf.Host, DHRect, AEndEllipsis);
    end;

  end;

begin

  ATitleState.The3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
  ATitleState.DrawByThemes := IsDrawCellByThemes(ACol, ARow, AreaCol, AreaRow, AState,
    CellAreaType, ATitleState.The3DRect);
  ATitleState.DrawByThemesOverLines := ATitleState.DrawByThemes and
    (Style.ThemeTitleFillElement = gtfeSplitButtonEh);

  ATitleState.Highlight := False;
  ATitleState.Down := False;

  DrawColumn := Columns[AreaCol];
  Title := DrawColumn.Title;

  ATitleState.BackColor := Title.Color;
  if Style.IsCustomStyleActive then
    ATitleState.BackColor := FInternalFixedColor;

  if ATitleState.The3DRect
    then YFrameOffs := 1
    else YFrameOffs := 2;

  if CellAreaType.VertType = vctTitleEh then
  begin
    ATitleState.Down := (FPressedDataCol = AreaCol) and FPressed and (FDBGridEhState = dgsNormal);
    if    (IsUseMultiTitle = True) and
          TitleParams.VertLines and
      not TitleParams.BorderInFillStyle and
          (  (DrawColumn <> Columns.LastScrollVisibleColumn) or
             (AutoFitColWidths and not GridLineParams.GridBoundaries){or
            ((DrawColumn = Columns.LastScrollVisibleColumn) and not GridLineParams.GridBoundaries)}
          )  
    then
    begin
      Dec(ARect.Right);
      Canvas.Pen.Color := TitleParams.GetVertLineColor;
      DrawPolyline([Point(ARect.Right, ARect.Bottom-1),
                     Point(ARect.Right,ARect.Bottom-FLeafFieldArr[AreaCol].FLeaf.Height)]);
    end;
    ASubtRect := ARect;
    if IsUseMultiTitle = True then
    begin
      ASubtRect.Top := ARect.Bottom - FLeafFieldArr[AreaCol].FLeaf.Height + 1;// + 3;
      ATitleState.Caption := FLeafFieldArr[AreaCol].FLeaf.Text;
    end else
      ATitleState.Caption := Title.Caption;

    ATitleState.DrawFilterButton := False;
    ATitleState.SortMarker := Title.SortMarker;
    ATitleState.DrawSortIndex := True;

    if STFilter.Visible and DrawColumn.STFilter.Visible and
      (STFilter.Location = stflInTitleFilterEh)
    then
    begin
      if (STFilter.FilterButtonDrawTime = fbdtAlwaysEh) or
         (csDesigning in ComponentState) then
        ATitleState.DrawFilterButton := True
      else if STFilter.FilterButtonDrawTime = fbdtWhenCellHotEh then
      begin
        if FInTitleFilterListboxVisible and (FInTitleFilterListboxColumn = DrawColumn) then
          ATitleState.DrawFilterButton := True
        else
          ATitleState.DrawFilterButton := ((gdHotTrack in AState) and CanMouseTrackMode);
      end else if STFilter.FilterButtonDrawTime = fbdtWhenRowHotEh then
      begin
        if FInTitleFilterListboxVisible then
          ATitleState.DrawFilterButton := True
        else
        begin
          TitleRowRect := CalcTitleRect;
          ATitleState.DrawFilterButton := FMouseInTrackRowRect and CanMouseTrackMode;
        end;
      end;
    end;

    if (TitleImages <> nil) and (Title.ImageIndex <> -1) then
      ATitleState.Caption := '';

    if (DrawColumn.Field <> nil) and Assigned(FOnGetBtnParams) then
      FOnGetBtnParams(Self, DrawColumn, Canvas.Font,
        ATitleState.BackColor, ATitleState.SortMarker, ATitleState.Down);

    Canvas.Font := Title.Font;
    if (DrawColumn.Field <> nil) and Assigned(FOnGetBtnParams) then // To restore changed in FOnGetBtnParams font
      FOnGetBtnParams(Self, DrawColumn, Canvas.Font, ATitleState.BackColor,
        ATitleState.SortMarker, ATitleState.Down);

    ATitleState.CellMultiSelected := CellIsMultiSelected(ACol, ARow, AreaCol, NilBookmarkEh);
    ATitleState.Highlight := HighlightNoDataCellColor(ACol, ARow, AreaCol, AreaRow,
      CellAreaType, AState, ATitleState.CellMultiSelected, ATitleState.BackColor, Canvas.Font);
    if (SelectedIndex = AreaCol) and ThemesEnabled and RowPanel.Active then
      ATitleState.BackColor := ApproachToColorEh(ATitleState.BackColor, clBlack, 10);

    ATitleState.FontCharset := Canvas.Font.Charset;
    ATitleState.FontColor := Canvas.Font.Color;
    ATitleState.FontHeight := Canvas.Font.Height;
    ATitleState.FontName := Canvas.Font.Name;
    ATitleState.FontStyle := Canvas.Font.Style;
    ATitleState.WordWrap := (UseMultiTitle = True) or (TitleHeight <> 0) or (TitleLines <> 0);
    ATitleState.Orientation := Title.Orientation;
    if (VisibleColumns[VisibleColumns.Count-1] = DrawColumn) {and GridLineParams.GridBoundaries}
      then ATitleState.VertBorderInFillStyle := False
      else ATitleState.VertBorderInFillStyle := TitleParams.BorderInFillStyle;
    ATitleState.HorzBorderInFillStyle := TitleParams.BorderInFillStyle;

    DrawTitleCellState(DrawColumn, ASubtRect, AState, ATitleState);
  end else // VertType = vctSubTitleEh
  begin
    if ATitleState.DrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh)
      then AClipRec := EmptyRect
      else AClipRec := ARect;
    AFillRect := ARect;

    ATitleState.CellMultiSelected := CellIsMultiSelected(ACol, ARow, AreaCol, NilBookmarkEh);
    if ATitleState.The3DRect and ATitleState.DrawByThemes then
    begin
      Style.GetThemeTitleFillRect(AFillRect, True, True);
      FillCellRect(cfstThemedEh, AFillRect, False, ATitleState.CellMultiSelected,
        AClipRec, ATitleState.The3DRect);
    end;
    DrawSubTitleCell(ACol, ARow, AreaCol, AreaRow, CellAreaType, AFillRect, AState, ATitleState.Highlight);

    if ATitleState.The3DRect then
    begin
  //    InflateRect(ARect, 1, 1);
      Canvas.Brush.Color := ATitleState.BackColor;
      if not ATitleState.DrawByThemes then
        DrawEdgeEh(Canvas, ASubtRect, False, ATitleState.Highlight, True, not (Flat and ThemesEnabled), Flat);
    end;
  end;

  if (CellAreaType.VertType = vctTitleEh) and (IsUseMultiTitle = True) then
    with DrawColumn.Title do
    begin // Draw mastertitle
      Canvas.Font := TitleFont;
      ATitleState.CellMultiSelected := (Selection.SelectionType = gstAll);
      if ATitleState.CellMultiSelected then
      begin
        ATitleState.Highlight := HighlightNoDataCellColor(ACol, ARow, AreaCol, AreaRow,
          CellAreaType, AState, ATitleState.CellMultiSelected, ATitleState.BackColor, Canvas.Font);
        Canvas.Brush.Color := ATitleState.BackColor;
        ATitleState.BackColor := Canvas.Brush.Color;
      end else
      begin
        Canvas.Brush.Color := ColumnDefValues.Title.Color;
        if Style.IsCustomStyleActive and (Canvas.Brush.Color = clBtnFace) then
          Canvas.Brush.Color := FInternalFixedColor;
        ATitleState.BackColor := Canvas.Brush.Color;
      end;
      if (FLeafFieldArr[AreaCol].FLeaf.Host <> nil) and (FLeafFieldArr[AreaCol].FLeaf.Host <> FHeadTree) then
      begin
        ATitleState.Down := False;
        DrawHostEh(FLeafFieldArr[AreaCol].FLeaf, ASubtRect, EndEllipsis);
      end;
    end;
{$IFDEF EH_LIB_6}
  if (csDesigning in ComponentState) and
      Assigned(DBGridEhDesigntControler) and
      (FNoDesigntControler = False) and
     DBGridEhDesigntControler.ControlIsObjInspSelected(DrawColumn) and
     (CellAreaType.VertType = vctTitleEh)
  then
    DBGridEhDesigntControler.DrawDesignSelectedBorder(Canvas, ARect);
{$ENDIF}
end;


procedure TCustomDBGridEh.DrawDataCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  Value: string;
  DrawColumn: TColumnEh;
  Processed: Boolean;
  Cell, AreaCell: TGridCoord;
  RowDetailPanelAvailable: Boolean;
  AReadOnly: Boolean;
  AColCellParamsEh: TColCellParamsEh;
begin
  DrawColumn := Columns[AreaCol];
  Cell.X := ACol;
  Cell.Y := ARow;
  AreaCell.X := AreaCol;
  AreaCell.Y := AreaRow;

  Canvas.Font := DrawColumn.Font;
  Canvas.Font.Color := GetDefaultActualColumnFontColor(DrawColumn, AState);
  Canvas.Brush.Color := GetDefaultActualColumnColor(DrawColumn);
  Value := '';

  if (DataLink = nil) or not DataLink.Active or not DataLink.DataSet.Active or
   (AreaRow < 0) or ((AreaRow >= InstantReadRecordCount) and not DataLink.DataSet.IsEmpty)  then
  begin
    if not GridBackgroundFilled then
      Canvas.FillRect(ARect);
    Exit;
  end;

  InstantReadRecordEnter(AreaRow);
  try

  Value := DrawColumn.DisplayText;
  ColCellParamsEh.FThe3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
  ColCellParamsEh.FDrawCellByThemes := IsDrawCellByThemes(Cell.X, Cell.Y,
    AreaCell.X, AreaCell.Y, AState, CellAreaType, ColCellParamsEh.FThe3DRect);

  if ColCellParamsEh.FThe3DRect
    then ColCellParamsEh.FXFrameOffs := 1
    else ColCellParamsEh.FXFrameOffs := 2;
  ColCellParamsEh.FYFrameOffs := ColCellParamsEh.FXFrameOffs;
  if Flat then Dec(ColCellParamsEh.FYFrameOffs);
  if (ColCellParamsEh.FYFrameOffs > 0) and (FStdDefaultTextHeight >= FStdDefaultRowHeight - 1) then
    Dec(ColCellParamsEh.FYFrameOffs);

  if DataGrouping.IsGroupingWorks and (DataGrouping.ActiveGroupLevelsCount > 0)
    and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
  begin
    if InstantReadCurDataNode.NodeType = dntDataGroupEh then
    begin
      DrawGroupDataCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType);
      Exit;
    end else if InstantReadCurDataNode.NodeType = dntDataGroupFooterEh then
    begin
      DrawGroupFooterCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType);
      Exit;
    end else if (DrawColumn = VisibleColumns[0]) and not RowPanel.Active then
    begin
      DrawGroupDataArea(ACol, ARow, AreaCol, AreaRow, InstantReadCurDataNode.Level, AState,
        ARect, ColCellParamsEh.FThe3DRect, not RowDetailPanel.Visible or (ARow <> Row));
      ARect.Left := ARect.Left + FExtraFirstColumnWidth;
    end;
  end;

  if not DefaultDrawing and (csDesigning in ComponentState) then
  begin
    if not GridBackgroundFilled then
      Canvas.FillRect(ARect);
  end;

  // Tree model elements
  if DrawColumn.Color = Self.Color then
  begin
    if (OddRowColor <> EvenRowColor) and
       DataLink.Active and
       (DataLink.DataSet.IsSequenced or
        (SumList.Active and SumList.VirtualRecords)) then
        if SumList.RecNo mod 2 = 1
          then Canvas.Brush.Color := OddRowColor
          else Canvas.Brush.Color := EvenRowColor
    else
      Canvas.Brush.Color := Style.GetColumnColor(DrawColumn);
  end else
    Canvas.Brush.Color := Style.GetColumnColor(DrawColumn);

  AReadOnly := not DrawColumn.CanModify(False);

  ColCellParamsEh.FState := AState;
  ColCellParamsEh.FFont := Canvas.Font;
  ColCellParamsEh.FAlignment := DrawColumn.Alignment;
  ColCellParamsEh.FBackground := Canvas.Brush.Color;
  ColCellParamsEh.SuppressActiveCellColor := False;
  ColCellParamsEh.FText := Value;
  ColCellParamsEh.FImageIndex := DrawColumn.GetImageIndex;
  ColCellParamsEh.FCheckboxState := DrawColumn.CheckboxState;
  ColCellParamsEh.FBlankCell := False;
  ColCellParamsEh.FCol := ACol;
  ColCellParamsEh.FCellRect := ARect;
  ColCellParamsEh.FRow := ARow;
  ColCellParamsEh.FTextEditing := DrawColumn.TextEditing;
  ColCellParamsEh.FReadOnly := AReadOnly;

  RowDetailPanelAvailable := RowDetailPanel.Active;

  GetCellParams(DrawColumn, Canvas.Font, ColCellParamsEh.FBackground, AState);
  DrawColumn.GetColCellParams(False, ColCellParamsEh);
  if Assigned(OnCheckRowHaveDetailPanel) then
    OnCheckRowHaveDetailPanel(Self, RowDetailPanelAvailable);

  if (FIntMemTable <> nil) and (DrawColumn = VisibleColumns[0]) and FIntMemTable.MemTableIsTreeList then
  begin
    DrawCellTreeArea(AreaCell.X, AreaCell.Y, AState, ARect, ColCellParamsEh.FThe3DRect);
    ARect.Left := ARect.Left + GetCellTreeElmentsAreaWidth;
  end;

  if RowDetailPanel.Active and (DrawColumn = VisibleColumns[0]) then
  begin
    if RowDetailPanelAvailable then
      ARect.Left := ARect.Left +
        DrawDetailPanelSign(AreaCell.X, AreaCell.Y, AState, ARect, ColCellParamsEh.FThe3DRect)
    else
    begin
      Canvas.FillRect(Rect(ARect.Left, ARect.Top, ARect.Left + 18, ARect.Bottom));
      ARect.Left := ARect.Left + 18;
    end;
  end;

  Processed := False;
  AColCellParamsEh := ColCellParamsEh;
  if Assigned(OnAdvDrawDataCell) then
    OnAdvDrawDataCell(Self, Cell, AreaCell, DrawColumn, ARect,
      AColCellParamsEh, Processed);

  if not Processed and Assigned(DrawColumn.OnAdvDrawDataCell) then
    DrawColumn.OnAdvDrawDataCell(Self, Cell, AreaCell, DrawColumn, ARect,
      AColCellParamsEh, Processed);

  if not Processed then
    DefaultDrawColumnDataCell(Cell, AreaCell, DrawColumn, ARect, AColCellParamsEh);

  if DefaultDrawing and (gdFocused in ColCellParamsEh.State)
    and ({(dgAlwaysShowSelection in Options) or }Focused)
    and not (csDesigning in ComponentState)
    and not (dgRowSelect in Options)
    and (UpdateLock = 0)
    and (ValidParentForm(Self).ActiveControl = Self)
    and Style.IsDrawFocusRect
    and not Style.IsCustomStyleActive
  then
  begin
    Canvas.Brush.Style := bsClear;
    DrawFocusRect(Canvas, ARect);
  end;

  finally
    InstantReadRecordLeave;
  end;
end;

procedure TCustomDBGridEh.DrawFocusRect(Canvas: TCanvas; ARect: TRect);
begin
  Windows.DrawFocusRect(Canvas.Handle, ARect);
end;

function TCustomDBGridEh.CheckColumnDuplicateValues(Column: TColumnEh;
  var s: String; CheckPrevRow: Boolean): Boolean;
var
  OldActive: Integer;
  sVal, sNextVal: Variant;

  function CheckColumnValue: Boolean;
  begin
    Result := False;
    Column.FillColCellParams(VarColCellParamsEh);
    with VarColCellParamsEh do
    begin
      FCol := Column.Index + IndicatorOffset;
       FRow := TopRow - 1 + TopDataOffset;
      GetCellParams(Column, FFont, FBackground, FState);
      Column.GetColCellParams(False, VarColCellParamsEh);
      if Assigned(Column.OnGetHideDuplicatesValue) then
      begin
        sNextVal := VarColCellParamsEh.FText;
        Column.OnGetHideDuplicatesValue(Self, Column, sNextVal);
      end;
    end;

    if Assigned(Column.OnGetHideDuplicatesValue) then
      Result := VarEquals(sVal, sNextVal)
    else if s = VarColCellParamsEh.FText then
      Result := True;
  end;

begin
  Result := False;
  if Assigned(Column.OnGetHideDuplicatesValue) then
  begin
    sVal := s;
    Column.OnGetHideDuplicatesValue(Self, Column, sVal);
  end;
  if CheckPrevRow then
  begin
    if ViewScroll and (FIntMemTable.InstantReadViewRow > TopRow - TopDataOffset) then
    begin
      InstantReadRecordEnter(FIntMemTable.InstantReadViewRow-1);
      try
        Result := CheckColumnValue;
      finally
        InstantReadRecordLeave;
      end;
    end else
    begin
      OldActive := DataLink.ActiveRecord;
      if OldActive > 0 then
      begin
        DataLink.ActiveRecord := OldActive-1;
        try
          Result := CheckColumnValue;
        finally
          DataLink.ActiveRecord := OldActive;
        end;
      end;
    end;
  end else
  begin
    if ViewScroll and (FIntMemTable.InstantReadViewRow < FIntMemTable.InstantReadRowCount-1) then
    begin
      InstantReadRecordEnter(FIntMemTable.InstantReadViewRow+1);
      try
        Result := CheckColumnValue;
      finally
        InstantReadRecordLeave;
      end;
    end else
    begin
      OldActive := DataLink.ActiveRecord;
      if OldActive < DataLink.RecordCount-1 then
      begin
        DataLink.ActiveRecord := OldActive+1;
        try
          Result := CheckColumnValue;
        finally
          DataLink.ActiveRecord := OldActive;
        end;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.DefaultDrawColumnDataCell(Cell, AreaCell: TGridCoord;
  Column: TColumnEh; AreaRect: TRect; var Params: TColCellParamsEh);
const
  CheckBoxFlags: array[TCheckBoxState] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED, DFCS_BUTTON3STATE or DFCS_CHECKED);
  EditToButtonStyle: array[TEditStyle] of TEditButtonStyleEh =
  (ebsDropDownEh, ebsEllipsisEh, ebsDropDownEh, ebsDropDownEh, ebsDropDownEh,
   ebsUpDownEh, ebsDropDownEh, ebsAltUpDownEh, ebsAltDropDownEh, ebsAltDropDownEh);
var
  The3DRect: Boolean;
  ClearOnLine: Boolean;
  ClearSubLine: Boolean;
  IsCellFilled: Boolean;
  ADrawByThemes: Boolean;
  CellAreaType: TCellAreaTypeEh;
  AFrameRect, ARect1, ACellRect: TRect;
  XFrameOffs, YFrameOffs: Integer;
  LeftMarg, RightMarg: Integer;
  AEditStyle: TEditStyle;
  AEditLineWidth, AButtonWidth, AButtonsWidth: Integer;
  Highlight: Boolean;
  i: Integer;
  IsWordWrap: Boolean;
  EditButtonTransparency: Byte;
  AClipRec: TRect;

  procedure DrawInplaceSearchText;
  const
    AlignFlags: array[TAlignment] of Integer =
    (DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX);
    RTL: array[Boolean] of Integer = (0, DT_RTLREADING);
  var
    rect1: TRect;
    SrcFlag, DrawFlag, CalcFlag: Integer;
    lpDTP: TDrawTextParams;
    Alignment: TAlignment;
  begin
    Canvas.Brush.Color := DBGridEhInplaceSearchColor;
    Canvas.Font.Color := DBGridEhInplaceSearchTextColor;
    Alignment := Column.Alignment;

    if Self.UseRightToLeftAlignment then
    begin
      WindowsLPtoDP(Canvas.Handle, AreaRect);
      SwapInt(AreaRect.Left, AreaRect.Right);
      ChangeGridOrientation(False);

      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
      SwapInt(LeftMarg, RightMarg);
    end;

    DrawFlag := AlignFlags[Alignment];
    SrcFlag := 0;
    IsWordWrap := Column.WordWrap and Column.CurLineWordWrap(AreaRect.Bottom-AreaRect.Top);
    if IsWordWrap then
      SrcFlag := DT_WORDBREAK or RTL[UseRightToLeftReading];

    rect1 := AreaRect;

    lpDTP.cbSize := SizeOf(lpDTP);
    lpDTP.uiLengthDrawn := Length(FInplaceSearchText);
    lpDTP.iLeftMargin := 0;
    lpDTP.iRightMargin := 0;

    InflateRect(rect1, -XFrameOffs, -YFrameOffs);

    if XFrameOffs > 0 then rect1.Bottom := rect1.Bottom + 1;
    if Alignment <> taLeftJustify then
      lpDTP.iRightMargin :=
        Canvas.TextWidth(Copy(ColCellParamsEh.Text, Length(FInplaceSearchText) + 1, Length(ColCellParamsEh.Text)));

    if CheckRightToLeftFirstCharEh(FInplaceSearchText, Self.UseRightToLeftReading) then
    begin
      CalcFlag := SrcFlag;
      CalcFlag := CalcFlag or DT_CALCRECT;
      WindowsDrawTextEx(Canvas.Handle, ColCellParamsEh.Text,
        Length(ColCellParamsEh.Text), rect1, CalcFlag, lpDTP);

      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
      DrawFlag := AlignFlags[Alignment];
      DrawFlag := DrawFlag or SrcFlag;

      WindowsDrawTextEx(Canvas.Handle, FInplaceSearchText,
        Length(FInplaceSearchText), rect1, DrawFlag, lpDTP);
    end else
    begin
      DrawFlag := DrawFlag or SrcFlag;
      WindowsDrawTextEx(Canvas.Handle, FInplaceSearchText,
        Length(FInplaceSearchText), rect1, DrawFlag, lpDTP);
    end;

    if Self.UseRightToLeftAlignment then
      ChangeGridOrientation(True);
  end;

  procedure PaintRequiredState(Column: TColumnEh; Text: String; DataRect: TRect);
  var
    OldPenColor: TColor;
    OldPenStyle: TPenStyle;
    DrawState: Boolean;
  begin
    DrawState := Column.HighlightRequired and IsCurrentRow(FOldActiveRecord) and
      (DataLink.DataSet.State in [dsInsert, dsEdit]) and (Column.Field <> nil) and
      Column.Field.Required and Column.Field.IsNull;
    if Assigned(Column.FOnCheckDrawRequiredState) then
      Column.FOnCheckDrawRequiredState(Self, Text, DrawState);
    if DrawState then
    begin
      OldPenColor := Canvas.Pen.Color;
      OldPenStyle := Canvas.Pen.Style;
      Canvas.Pen.Color := clRed;
      Canvas.Pen.Style := psDot;
      Canvas.MoveTo(DataRect.Left+2, DataRect.Bottom-1);
      Canvas.LineTo(DataRect.Right-3, DataRect.Bottom-1);
      Canvas.Pen.Color := OldPenColor;
      Canvas.Pen.Style := OldPenStyle;
    end;
  end;

  function IsDrawEditButton: Boolean;
  var
    IsCurCol, IsCurRow, IsEdit: Boolean;
  begin
    Result := False;
    IsCurCol := (SelectedIndex = AreaCell.X);
    IsCurRow := (Row = Cell.Y);
    IsEdit := DataLink.Active and (DataLink.DataSet.State in [dsEdit, dsInsert]);

    if Column.AlwaysShowEditButton then
      Result := True;
    if Result and (sebShowOnlyForCurCellEh in EditButtonsShowOptions) then
      if IsCurCol and IsCurRow
        then Result := True
        else Result := False;
    if Result and (sebShowOnlyForCurRowEh in EditButtonsShowOptions) then
      if IsCurRow
        then Result := True
        else Result := False;
    if Result and (sebShowOnlyWhenGridActiveEh in EditButtonsShowOptions) then
      if IsSelectionActive
        then Result := True
        else Result := False;
    if Result and (sebShowOnlyWhenDataEditingEh in EditButtonsShowOptions) then
      if IsEdit
        then Result := True
        else Result := False;
  end;

begin
  CellAreaType.HorzType := hctDataEh;
  CellAreaType.VertType := vctDataEh;
  The3DRect := CellHave3DRect(Cell.X, Cell.Y, AreaRect, Params.State);

  if ColCellParamsEh.BlankCell then
    if not The3DRect then
      The3DRect := (dghFixed3D in OptionsEh);

  ADrawByThemes := IsDrawCellByThemes(Cell.X, Cell.Y, AreaCell.X, AreaCell.Y,
    Params.State, CellAreaType, The3DRect);

  AFrameRect := AreaRect;
  if The3DRect then
  begin
    XFrameOffs := Style.GetDataCellHorzOffset(Self, Column) - 1;
    if ADrawByThemes then
    begin
      Style.GetThemeTitleFillRect(AreaRect, True, True);
    end else if Flat then
    begin
      Inc(AreaRect.Left, 1);
      Inc(AreaRect.Top, 1);
    end else
    begin
      InflateRect(AreaRect, -1, -1);
    end;
  end else
    XFrameOffs := Style.GetDataCellHorzOffset(Self, Column);
  YFrameOffs := XFrameOffs;
  if YFrameOffs > 2 then YFrameOffs := 2;
  if Flat and (YFrameOffs > 0) then Dec(YFrameOffs);
  if (YFrameOffs > 0) and (FStdDefaultTextHeight >= FStdDefaultRowHeight - 1) then
    Dec(YFrameOffs);

  AEditStyle := esSimple;
  if Flat and not ThemesEnabled
    then AEditLineWidth := 1
    else AEditLineWidth := 0;
  AButtonsWidth := 0;
  ACellRect := AreaRect;

  if IsDrawEditButton and not ColCellParamsEh.BlankCell then // Draw edit button
  begin
    AEditStyle := GetColumnEditStile(Column);
    AButtonsWidth := Column.EditButtonsWidth;
    AreaRect.Right := AreaRect.Right - AButtonsWidth;
  end;

  if not ColCellParamsEh.SuppressActiveCellColor and ColCellParamsEh.BlankCell then
    ColCellParamsEh.FBackground := FixedColor;
  if ColCellParamsEh.SuppressActiveCellColor and
   ((Cell.Y = Row) and ((Cell.X = Col) or (dgRowSelect in Options)))
   then Highlight := False
   else Highlight := HighlightDataCellColor(AreaCell.X, AreaCell.Y,
            ColCellParamsEh.Text, ColCellParamsEh.State, ColCellParamsEh.FBackground, Canvas.Font);
  if Highlight then
    ColCellParamsEh.State := ColCellParamsEh.State + [gdSelected];
  Canvas.Brush.Color := ColCellParamsEh.FBackground;

  ClearOnLine := False;
  ClearSubLine := False;
  if Column.HideDuplicates and not ColCellParamsEh.BlankCell then
  begin
    if (AreaCell.Y < InstantReadRecordCount) and
       (Column.FCheckedDuplicates[AreaCell.Y-TopRow+TopDataOffset+1] = False)
    then
      if CheckColumnDuplicateValues(Column, ColCellParamsEh.FText, False)
      then
        ClearSubLine := True;

    if CheckColumnDuplicateValues(Column, ColCellParamsEh.FText, True) then
    begin
      ColCellParamsEh.FText := '';
      ColCellParamsEh.FImageIndex := -1;
      if Column.FCheckedDuplicates[AreaCell.Y-TopRow+TopDataOffset] = False then
      begin
        ClearOnLine := True;
        Column.FCheckedDuplicates[AreaCell.Y-TopRow+TopDataOffset] := True;
      end;
    end;
  end;

  IsCellFilled := CheckFillDataCell(Cell, AreaCell, Column, AreaRect, Params);
  if GridBackgroundFilled and (Canvas.Brush.Color = FInternalColor) then
    IsCellFilled := True;
  if not ColCellParamsEh.BlankCell and DefaultDrawing and (AreaRect.Right > AreaRect.Left) then
  begin
    if (Column.ImageList <> nil) and Column.ShowImageAndText then
    begin
      ARect1 := AreaRect;
      ARect1.Right := ARect1.Left + Column.ImageList.Width + 4;
      Canvas.Brush.Color := StyleServices.GetSystemColor(Column.Color);
      if not IsCellFilled then
        Canvas.FillRect(AreaRect);
      PaintClippedImage(Column.ImageList, nil, Canvas, ARect1, ColCellParamsEh.FImageIndex, 0, taCenter, ARect1);
      Canvas.Brush.Color := ColCellParamsEh.FBackground;
      AreaRect.Left := ARect1.Right + 1;
    end;
    if Column.GetColumnType in [ctCommon..ctKeyPickList] then
    begin
      if ADrawByThemes
        then ARect1 := AFrameRect
        else ARect1 := AreaRect;
      IsWordWrap := Column.WordWrap and Column.CurLineWordWrap(AreaRect.Bottom-AreaRect.Top);
      with ColCellParamsEh do
        WriteCellText(Column, Canvas, ARect1, not IsCellFilled,
          XFrameOffs, YFrameOffs, FText, FAlignment, Column.Layout,
          IsWordWrap, Column.EndEllipsis, 0, 0, not IsWordWrap);

      if IsSearchingState and
        ( (Selection.SelectionType = gstNon) or
          ( (Selection.SelectionType <> gstNon) {and (gdSelected in ColCellParamsEh.State)} )
        )
      then
        with ColCellParamsEh do
          WriteHighlightedSubCellTextEh(Column, Canvas, ARect1, {not IsCellFilled,}
            XFrameOffs, YFrameOffs, FText, FAlignment, Column.Layout,
            IsWordWrap, Column.EndEllipsis, 0, 0,
            Column.UseRightToLeftAlignment, GetSearchingText, True, RGB(255,255,150),
            0, clYellow);

      with ColCellParamsEh do
        DrawHighlightSubstrs(Canvas, Column, ARect1, {not IsCellFilled,}
            XFrameOffs, YFrameOffs, FText, FAlignment, Column.Layout,
            IsWordWrap, Column.EndEllipsis, 0, 0,
            Column.UseRightToLeftAlignment, clYellow);
    end else if Column.GetColumnType = ctKeyImageList then
    begin
      if not IsCellFilled then
        Canvas.FillRect(AreaRect);
      DrawClipped(Column.ImageList, nil, Canvas, AreaRect, ColCellParamsEh.FImageIndex, 0, taCenter, AreaRect);
    end else if Column.GetColumnType = ctCheckboxes then
    begin
      if not IsCellFilled then
        Canvas.FillRect(AreaRect);
      ARect1.Left := AreaRect.Left + iif(AreaRect.Right - AreaRect.Left < DefaultCheckBoxWidth, 0,
        (AreaRect.Right - AreaRect.Left) shr 1 - DefaultCheckBoxWidth shr 1);
      ARect1.Right := iif(AreaRect.Right - AreaRect.Left < DefaultCheckBoxWidth, AreaRect.Right,
        ARect1.Left + DefaultCheckBoxWidth);
      ARect1.Top := AreaRect.Top + iif(AreaRect.Bottom - AreaRect.Top < DefaultCheckBoxHeight, 0,
        (AreaRect.Bottom - AreaRect.Top) shr 1 - DefaultCheckBoxHeight shr 1);
      ARect1.Bottom := iif(AreaRect.Bottom - AreaRect.Top < DefaultCheckBoxHeight, AreaRect.Bottom,
        ARect1.Top + DefaultCheckBoxHeight);
      PaintButtonControl(Canvas, ARect1, Canvas.Brush.Color, bcsCheckboxEh,
        0, Flat, False, True, ColCellParamsEh.FCheckboxState);
    end else if Column.GetColumnType = ctGraphicData then
      DrawGraphicCell(Column, AreaRect, Canvas.Brush.Color, not IsCellFilled);
  end;
  if not ColCellParamsEh.BlankCell and IsDrawEditButton then // Draw edit button
  begin
    if csDesigning in ComponentState then
      EditButtonTransparency := 30
    else if  not FilterEditMode and
         (
          (gdFocused in ColCellParamsEh.State) or
          ((dghRowHighlight in OptionsEh) and (Cell.Y = Row))
         )
    then
      EditButtonTransparency := 0
    else if gdHotTrack in ColCellParamsEh.State then
      EditButtonTransparency := 30
    else
      EditButtonTransparency := 80;
    SetRect(ARect1, AreaRect.Right, AreaRect.Top,
      AreaRect.Right + FInplaceEditorButtonWidth + AEditLineWidth, AreaRect.Top + FInplaceEditorButtonHeight);
    if ARect1.Bottom > ACellRect.Bottom then ARect1.Bottom := ACellRect.Bottom;
    if (AEditStyle <> esSimple) then
    begin
      if The3DRect then OffsetRect(ARect1, 1, -1);
      PaintInplaceButton(Column, Canvas, EditToButtonStyle[AEditStyle], ARect1, ACellRect,
        0, IsMouseInRect(ARect1), Flat, DataLink.Active,
        {ApproximateColor(Canvas.Brush.Color, clBlack, 10)} Canvas.Brush.Color
        , nil, EditButtonTransparency, nil, 0);
      if Flat and The3DRect and not ThemesEnabled then
        Canvas.FillRect(Rect(ARect1.Left - 1, ARect1.Top, ARect1.Left, AreaRect.Bottom));

      Inc(ARect1.Left, FInplaceEditorButtonWidth + AEditLineWidth);
    end;
    for i := 0 to Column.EditButtons.Count - 1 do
      if Column.EditButtons[i].Visible then
      begin
        if Column.EditButtons[i].Width > 0
          then AButtonWidth := Column.EditButtons[i].Width + AEditLineWidth
          else AButtonWidth := FInplaceEditorButtonWidth;
        ARect1.Right := ARect1.Left + AButtonWidth + AEditLineWidth;
        PaintInplaceButton(Column, Canvas, Column.EditButtons[i].Style,
          ARect1, ACellRect, 0, IsMouseInRect(ARect1), Flat, DataLink.Active,
          Canvas.Brush.Color,
//        ApproximateColor(Canvas.Brush.Color, clBlack, 10),
          Column.EditButtons[i].Glyph, EditButtonTransparency,
          Column.EditButtons[i].Images.NormalImages, Column.EditButtons[i].Images.NormalIndex);
        if Flat and The3DRect and not ThemesEnabled then
          Canvas.FillRect(Rect(ARect1.Left - 1, ARect1.Top, ARect1.Left, AreaRect.Bottom));
        Inc(ARect1.Left, AButtonWidth + AEditLineWidth);
      end;

    if FInplaceEditorButtonHeight < (AreaRect.Bottom - AreaRect.Top) then
      Canvas.FillRect(Rect(AreaRect.Right, ARect1.Bottom, AreaRect.Right + AButtonsWidth, AreaRect.Bottom));
  end;
  if not ColCellParamsEh.BlankCell then
    PaintRequiredState(Column, ColCellParamsEh.Text, AreaRect);
  if Columns.State = csDefault then
    OldDrawDataCell(AreaRect, Column.Field, ColCellParamsEh.State);
  DrawColumnCell(AreaRect, AreaCell.X, Column, ColCellParamsEh.State);
  if not ColCellParamsEh.BlankCell
    and FInplaceSearching
//    and (gdSelected in AState) KMV #12
    and (gdFocused in ColCellParamsEh.State)
    and (Cell.Y = Row) //IsCurrentRow(FOldActiveRecord)
    and (   ( not (dgRowSelect in Options) and (Cell.X = Col) )
          or ( (dgRowSelect in Options) and (VisibleColumns[0] = Column) ) )
    and ((dgAlwaysShowSelection in Options) or Focused)
    and not (csDesigning in ComponentState)
    and (UpdateLock = 0)
    and (ValidParentForm(Self).ActiveControl = Self)
    then DrawInplaceSearchText;

  if ClearOnLine and (dgRowLines in Options) then
  begin
    Canvas.Pen.Color := Column.Color;
    DrawPolyline([Point(AFrameRect.Left, AFrameRect.Top-1),
                     Point(AFrameRect.Right,AFrameRect.Top-1)]);
  end;
  if ClearSubLine and (dgRowLines in Options) then
  begin
    Canvas.Pen.Color := Column.Color;
    DrawPolyline([Point(AFrameRect.Left, AFrameRect.Bottom),
                     Point(AFrameRect.Right,AFrameRect.Bottom)]);
  end;

  AreaRect := ACellRect;
  if not ColCellParamsEh.BlankCell and
    (FIntMemTable <> nil) and
    (AreaCell.X = 0) and
    FIntMemTable.MemTableIsTreeList
  then
    AreaRect.Left := AreaRect.Left + 1;

  if not ColCellParamsEh.BlankCell and
         IsDrawEditButton and
         (AEditStyle <> esSimple) and
         Flat
  then AreaRect.Right := AreaRect.Right + AButtonsWidth;

  if ColCellParamsEh.BlankCell then
  begin
    if ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh)
      then AClipRec := EmptyRect
      else AClipRec := AFrameRect;

    if ADrawByThemes
      then FillCellRect(cfstThemedEh, AreaRect, False, Highlight, AClipRec, The3DRect)
      else FillCellRect(GetDefaultFixedCellFillStyle, AreaRect, False, Highlight, AClipRec, The3DRect);
  end;

  if The3DRect then
  begin
    if not ADrawByThemes then
      DrawEdgeEh(Canvas, AFrameRect, False, Highlight, True, not (Flat and ThemesEnabled), Flat);
  end;

end;

function TCustomDBGridEh.CheckFillDataCell(Cell, AreaCell: TGridCoord;
  AxisBar: TAxisBarEh; AreaRect: TRect; Params: TAxisColCellParamsEh): Boolean;
var
  The3DRect, ADrawByThemes: Boolean;
  CellAreaType: TCellAreaTypeEh;
  Highlight: Boolean;
  DefaultFillCellRect: Boolean;
  FillStyle: TGridCellFillStyleEh;
begin
  CellAreaType.HorzType := hctDataEh;
  CellAreaType.VertType := vctDataEh;
  The3DRect := CellHave3DRect(Cell.X, Cell.Y, AreaRect, Params.State);
  Highlight := gdSelected in ColCellParamsEh.State;
  ADrawByThemes := IsDrawCellByThemes(Cell.X, Cell.Y, AreaCell.X, AreaCell.Y,
    Params.State, CellAreaType, The3DRect);

  DefaultFillCellRect := False;

  if CanFillSelectionByTheme and
     ((dgAlwaysShowSelection in Options) or IsSelectionActive) and
     (
       ( (dghRowHighlight in OptionsEh) and (Cell.Y = Row) ) or
       (gdSelected in ColCellParamsEh.State)
     )
  then
    Result := True
  else if ThemesEnabled and (dghRowHighlight in OptionsEh) and
                       (Cell.Y = Row) and
                   not (gdCurrent in ColCellParamsEh.State) then
    Result := True
  else if ThemesEnabled and (gdHotTrack in ColCellParamsEh.State) then
    Result := True
  else if ThemesEnabled and
          (dghRowHighlight in OptionsEh) and
          (Cell.Y = FHotTrackCell.Y) then
    Result := True
  else
  begin
    Result := The3DRect and not (gdSelected in ColCellParamsEh.State) and
      (ADrawByThemes or (Flat and ThemesEnabled));
    DefaultFillCellRect := True;
  end;
  if Result and DefaultFillCellRect then
  begin
    if ADrawByThemes
      then FillStyle := cfstThemedEh
      else FillStyle := GetDefaultFixedCellFillStyle;
    FillCellRect(FillStyle, AreaRect, False, Highlight, EmptyRect,
      The3DRect, gdFocused in ColCellParamsEh.State);
  end else if Result then
  begin
    if (gdFocused in ColCellParamsEh.State)
    then
    begin
      Canvas.FillRect(AreaRect);
    end else
      FillGradientEh(Canvas, AreaRect,
      ApproximateColor(Canvas.Brush.Color, clBtnHighlight, 256 div 3),
      Canvas.Brush.Color);
  end;
  if Result and CanFillSelectionByTheme then
    OverlaySelectionByTheme(Cell, AreaCell, TColumnEh(AxisBar), AreaRect, TColCellParamsEh(Params));
end;

procedure TCustomDBGridEh.DrawFooterCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  Footer: TColumnFooterEh;
  Highlight: Boolean;
  Value: string;
  DrawColumn: TColumnEh;
  XFrameOffs, YFrameOffs: Byte;
  The3DRect: Boolean;
  NewAlignment: TAlignment;
  CellMultiSelected: Boolean;
  IsFillTextCell: Boolean;
  AFillRect: TRect;
  ADrawByThemes: Boolean;
//  AClipRec: TRect;
  FooterColumnItem: TGridDataGroupFooterColumnItemEh;
  FooterNode: TGroupDataTreeNodeEh;
  VarValue: Variant;
  AFixedState: TDBGirdDrawFixedStateEh;
  InsideRect: TRect;
  BackgroundColor: TColor;
  MultiLine: Boolean;
begin
  DrawColumn := Columns[AreaCol];

  The3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
  if The3DRect then
    AState := AState + [gdFixed];
  ADrawByThemes := IsDrawCellByThemes(ACol, ARow, AreaCol, AreaRow, AState,
    CellAreaType, The3DRect);

  AFillRect := ARect;
  if The3DRect and not (ADrawByThemes and (FooterParams.GetActualFillStyle = cfstGradientEh)) then
  begin
    XFrameOffs := 1;
    if ADrawByThemes then
    begin
      Style.GetThemeTitleFillRect(AFillRect, True, True);
      XFrameOffs := 1;
    end else if Flat then
    begin
      Inc(AFillRect.Left, 1);
      Inc(AFillRect.Top, 1);
    end else
    begin
      InflateRect(AFillRect, -1, -1);
    end
  end else
    XFrameOffs := 2;

  YFrameOffs := XFrameOffs;
  if Flat then Dec(YFrameOffs);

  if DataGrouping.Active and (AreaRow < DataGrouping.Footers.VisibleItemsCount) then
  begin
    FooterNode := DataGrouping.GroupDataTree.Root;
    FooterColumnItem :=
      FooterNode.FooterItems[AreaRow].DataGroupFooter.ColumnItems[DrawColumn.Index];
    Canvas.Brush.Color := FooterColumnItem.Color;
    Canvas.Font := FooterColumnItem.Font;
    VarValue := Null;
    if DataLink.Active then
      VarValue := FooterNode.FooterItems[AreaRow].FooterValues[DrawColumn.Index];
    Value := FooterColumnItem.ConvertToDisplayText(VarValue);

    FGroupFooterParams.FColor := Canvas.Brush.Color;
    FGroupFooterParams.FText := Value;
    FGroupFooterParams.FFont := Canvas.Font;
    FGroupFooterParams.FState := AState;
    FGroupFooterParams.FValue := VarValue;
    if Assigned(FOnDataGroupGetFooterParams) then
      FOnDataGroupGetFooterParams(Self, FooterNode, FooterColumnItem, FGroupFooterParams);
    Canvas.Brush.Color := FGroupFooterParams.Color;

    BackgroundColor := Canvas.Brush.Color;
    CellMultiSelected := CellIsMultiSelected(ACol, ARow, AreaCol, NilBookmarkEh);
    HighlightNoDataCellColor(ACol, ARow,
      AreaCol, AreaRow, CellAreaType, AState, CellMultiSelected,
      BackgroundColor, Canvas.Font);
    Canvas.Brush.Color := BackgroundColor;

    if Style.IsCustomStyleActive then
      if FooterParams.GetActualFillStyle <> cfstSolidEh then
      begin
        Canvas.Brush.Color := FInternalFixedColor;
        Canvas.Font.Color := FInternalFixedFontColor;
      end else if Canvas.Brush.Color = clWindow then
      begin
        Canvas.Brush.Color := FInternalColor;
        Canvas.Font.Color := FInternalFontColor;
      end;

    begin
      AFixedState.Pressed := False;
      AFixedState.Selected := CellMultiSelected;
      AFixedState.HotTrack := False;
      AFixedState.The3DRect := The3DRect;
      AFixedState.FillColor := Canvas.Brush.Color;
      AFixedState.StartGradientColor := clDefault;
      AFixedState.EndGradientColor := clDefault;
      AFixedState.DrawByThemesOverLines := ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh);
      AFixedState.FontColor := Canvas.Font.Color;
      AFixedState.VertBorderInFillStyle := False;
      AFixedState.HorzBorderInFillStyle := False;
      AFixedState.FillStyle := FooterParams.GetActualFillStyle;
      AFixedState.HorzLineColor := clNone;
      AFixedState.VertLineColor := clNone;
      AFixedState.ClipRect := EmptyRect;

      if Style.IsCustomStyleActive then
        if AFixedState.FillStyle <> cfstSolidEh then
        begin
          Canvas.Brush.Color := FInternalFixedColor;
          Canvas.Font.Color := FInternalFixedFontColor;
        end else if Canvas.Brush.Color = clWindow then
        begin
          Canvas.Brush.Color := FInternalColor;
          Canvas.Font.Color := FInternalFontColor;
        end;

      IsFillTextCell := FooterParams.GetActualFillStyle <> cfstSolidEh;
      Style.DrawFixedCellBackground(Self, Canvas, ARect, IsFillTextCell, InsideRect, AState, AFixedState);

      if (FooterParams.GetActualFillStyle = cfstSolidEh) and
         GridBackgroundFilled and
         (Canvas.Brush.Color = FInternalColor)
      then
        IsFillTextCell := False
      else
        IsFillTextCell := not IsFillTextCell;

      MultiLine := False; //Footer.WordWrap and FAllowWordWrap;
    end;

    WriteCellText(DrawColumn, Canvas, ARect, IsFillTextCell, XFrameOffs, YFrameOffs, Value,
      FooterColumnItem.Alignment, DrawColumn.Layout, MultiLine, DrawColumn.EndEllipsis, 0, 0, not MultiLine);
  end else
  begin
    Footer := DrawColumn.UsedFooter(AreaRow - DataGrouping.Footers.VisibleItemsCount);
    Canvas.Font := Footer.Font;
    Canvas.Brush.Color := Footer.Color;

    ColCellParamsEh.FBackground := Canvas.Brush.Color;
    NewAlignment := Footer.Alignment;
    Value := GetFooterValue(AreaRow, DrawColumn);

    GetFooterParams(AreaCol, AreaRow, DrawColumn, Canvas.Font,
      ColCellParamsEh.FBackground, NewAlignment, AState, Value);

    CellMultiSelected := CellIsMultiSelected(ACol, ARow, AreaCol, NilBookmarkEh);
    Highlight := HighlightNoDataCellColor(ACol, ARow,
      AreaCol, AreaRow, CellAreaType, AState, CellMultiSelected,
      ColCellParamsEh.FBackground, Canvas.Font);

    Canvas.Brush.Color := ColCellParamsEh.FBackground;

    if DefaultDrawing then
    begin
      AFixedState.Pressed := False;
      AFixedState.Selected := CellMultiSelected;
      AFixedState.HotTrack := False;
      AFixedState.The3DRect := The3DRect;
      AFixedState.FillColor := Canvas.Brush.Color;
      AFixedState.StartGradientColor := clDefault;
      AFixedState.EndGradientColor := clDefault;
      AFixedState.DrawByThemesOverLines := ADrawByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh);
      AFixedState.FontColor := Canvas.Font.Color;
      AFixedState.VertBorderInFillStyle := False;
      AFixedState.HorzBorderInFillStyle := False;
      AFixedState.FillStyle := FooterParams.GetActualFillStyle;
      AFixedState.HorzLineColor := clNone;
      AFixedState.VertLineColor := clNone;
      AFixedState.ClipRect := EmptyRect;

      if Style.IsCustomStyleActive then
        if AFixedState.FillStyle <> cfstSolidEh then
        begin
          Canvas.Brush.Color := FInternalFixedColor;
          Canvas.Font.Color := FInternalFixedFontColor;
        end else if Canvas.Brush.Color = clWindow then
        begin
          Canvas.Brush.Color := FInternalColor;
          Canvas.Font.Color := FInternalFontColor;
        end;

      IsFillTextCell := FooterParams.GetActualFillStyle <> cfstSolidEh;
      Style.DrawFixedCellBackground(Self, Canvas, ARect, IsFillTextCell, InsideRect, AState, AFixedState);

      if (FooterParams.GetActualFillStyle = cfstSolidEh) and
         GridBackgroundFilled and
         (Canvas.Brush.Color = FInternalColor)
      then
        IsFillTextCell := False
      else
        IsFillTextCell := not IsFillTextCell;

      MultiLine := Footer.WordWrap and FAllowWordWrap;
      WriteCellText(DrawColumn, Canvas, InsideRect,
        IsFillTextCell, XFrameOffs, YFrameOffs, Value,
        NewAlignment, DrawColumn.Layout,
        MultiLine, Footer.EndEllipsis, 0, 0, not MultiLine);
    end;

    if The3DRect then
    begin
      if not ADrawByThemes then
        DrawEdgeEh(Canvas, ARect, False, Highlight, True,
          not (Flat and ThemesEnabled), Flat);
    end;

    if Assigned(OnDrawFooterCell) then
      OnDrawFooterCell(Self, AreaCol, AreaRow, DrawColumn, ARect, AState);
  end;
end;

function TCustomDBGridEh.DataCellSelected(DataCol: Longint; DataRow: TUniBookmarkEh): Boolean;
begin
  Result := Selection.DataCellSelected(DataCol, DataRow);
end;

procedure TCustomDBGridEh.OldDrawDataCell(const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Assigned(FOnDrawDataCell) then FOnDrawDataCell(Self, Rect, Field, State);
end;

procedure TCustomDBGridEh.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumnEh; State: TGridDrawState);
begin
  if Assigned(OnDrawColumnCell)
    then OnDrawColumnCell(Self, Rect, DataCol, Column, State);
end;

function TCustomDBGridEh.CanMouseTrackMode: Boolean;
begin
  Result := (FGridState = gsNormal) and (FDBGridEhState = dgsNormal);
end;

function TCustomDBGridEh.CanHotTackCell(X, Y: Integer): Boolean;
begin
  if dghHotTrack in OptionsEh then
    if (X >= 0) and (Y >= 0)
      then Result := True
      else Result := False
  else if (STFilter.Location = stflInTitleFilterEh) and
          (Y = GetTopDataOffset-1)
    then
      Result := True
  else if IndicatorColVisible and (X = 0) then
      Result := True
  else
    Result := inherited CanHotTackCell(X, Y);
end;

procedure TCustomDBGridEh.UpdateHotTackInfo(X, Y: Integer);
var
  AHotTrackCell: TGridCoord;
  NewHotTrackCell: TGridCoord;
  NewHotTrackEditButton: Integer;
  Column: TColumnEh;
  Cell: TGridCoord;
  ARect: TRect;
  LowertTitleHeight: Integer;
  OutBRect: TRect;
  k: Integer;
  AHotTrackGroupLevelIdx: Integer;
  GroupRect, StateRect: TRect;
  ADataBox: TGridRect;
  IsDataCell: Boolean;
  InOutBRect: Boolean;
begin
  AHotTrackCell := FHotTrackCell;
  Cell := MouseCoord(X, Y);
  InOutBRect := OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtTopEh) and
                PtInRect(OutBRect, Point(X,Y));

  if RowPanel.Active and (Cell.X >= FIndicatorOffset) then
  begin
    ARect := CellRect(Cell.X, Cell.Y);
    ADataBox := DataBox;
    if (DataBox.Left <= Cell.X) and (DataBox.Right >= Cell.X) and
       (DataBox.Top <= Cell.Y) and (DataBox.Bottom >= Cell.X)
      then IsDataCell := True
      else IsDataCell := False;

    Column := GetColumnInRowPanelAtPos(
      Point(X-ARect.Left+FDataOffset.cx,
            Y-ARect.Top), IsDataCell);
    NewHotTrackCell := FHotTrackCell;
    if Column = nil
      then NewHotTrackCell.X := -1
      else NewHotTrackCell.X := Column.Index + IndicatorOffset;
    NewHotTrackCell.Y := Cell.Y;

    if (AHotTrackCell.X <> NewHotTrackCell.X) or (AHotTrackCell.Y <> NewHotTrackCell.Y) then
    begin
      InvalidateCell(Cell.X, FHotTrackCell.Y);
      FHotTrackCell := NewHotTrackCell;
      InvalidateCell(Cell.X, FHotTrackCell.Y);
    end;

  end else
    inherited UpdateHotTackInfo(X, Y);

  if (AHotTrackCell.X = FHotTrackCell.X) and
     (AHotTrackCell.Y = FHotTrackCell.Y) and
     (Cell.X >= FIndicatorOffset) then
  begin
    ARect := CellRect(Cell.X, Cell.Y);
    Column := Columns[RawToDataColumn(Cell.X)];
    if (IsUseMultiTitle = True) and (Cell.Y = GetTitleRows-1) then
    begin
      LowertTitleHeight :=
        ARect.Top - ARect.Bottom - FLeafFieldArr[RawToDataColumn(Cell.X)].FLeaf.Height + 1;// + 3;
      if LowertTitleHeight < FHotTrackInCellPos.Y then
      begin
        if FHotTrackMultiTitleOver then
          InvalidateCell(Cell.X, Cell.Y);
        FHotTrackMultiTitleOver := False;
      end else if LowertTitleHeight >= FHotTrackInCellPos.Y then
      begin
        if not FHotTrackMultiTitleOver then
          InvalidateCell(Cell.X, Cell.Y);
        FHotTrackMultiTitleOver := True;
      end;
    end;
//      EditButtonArea := Column.EditButtonsWidth;
    NewHotTrackEditButton := GetEditButtonIndexAt(Cell.X, Cell.Y, Column, X-ARect.Left, Y-ARect.Top);
    if (FHotTrackEditButton <> NewHotTrackEditButton) and (GetCursor = Screen.Cursors[crDefault]) then
    begin
      InvalidateCell(Cell.X, FHotTrackCell.Y);
      FHotTrackEditButton := NewHotTrackEditButton;
    end;
  end else if (AHotTrackCell.X = FHotTrackCell.X) and
              (AHotTrackCell.Y = FHotTrackCell.Y) and
             (Cell.X = 0) and (FIndicatorOffset > 0) then
  begin
    ARect := CellRect(Cell.X, Cell.Y);
    if gioShowRowIndicatorEh in IndicatorOptions then
      ARect.Right := ARect.Right - IndicatorWidth;
    ARect.Left := ARect.Right - FRowselCheckboxesWidth;
    if PtInRect(ARect, FMoveMousePos)
      then NewHotTrackEditButton := 1
      else NewHotTrackEditButton := -1;
    if FHotTrackEditButton <> NewHotTrackEditButton then
    begin
      InvalidateCell(Cell.X, FHotTrackCell.Y);
      FHotTrackEditButton := NewHotTrackEditButton;
    end;
  end
  else if not InOutBRect then
    FHotTrackEditButton := -1;

  if dghHotTrack in OptionsEh then
    if ( (AHotTrackCell.Y <> FHotTrackCell.Y) or
         ((AHotTrackCell.X >= IndicatorOffset) and (FHotTrackCell.X < IndicatorOffset)) or
         ((AHotTrackCell.X < IndicatorOffset) and (FHotTrackCell.X >= IndicatorOffset))
       ) and
       ((dghRowHighlight in OptionsEh) or (dgRowSelect in Options)) then
    begin
      if FHotTrackCell.Y >= 0 then
        GridInvalidateRow(Self, FHotTrackCell.Y);
      if AHotTrackCell.Y >= 0 then
        GridInvalidateRow(Self, AHotTrackCell.Y);
    end;

  AHotTrackGroupLevelIdx := -1;
  NewHotTrackEditButton := -1;
  if InOutBRect then
  begin
    for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
    begin
      if DataGrouping.ActiveGroupLevels[k].Column <> nil then
      begin
        GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
        OffsetRect(GroupRect, 0, DataGrouping.Top);
        InflateRect(GroupRect,-1,-1);
        if PtInRect(GroupRect, Point(X, Y)) then
        begin
          AHotTrackGroupLevelIdx := k;
          Column := TColumnEh(DataGrouping.ActiveGroupLevels[k].Column);
          if STFilter.Visible and (STFilter.Location = stflInTitleFilterEh) and
             CheckTitleCellFilterButtonPos(Point(X, Y), GroupRect, Column, StateRect)
          then
            NewHotTrackEditButton := 0;
        end;
      end;
    end;
  end;

  if (AHotTrackGroupLevelIdx <> DataGrouping.FHotTrackGroupLevelIdx) or
     ((DataGrouping.FHotTrackGroupLevelIdx >= 0) and
      (NewHotTrackEditButton <> FHotTrackEditButton)) then
  begin
    if DataGrouping.FHotTrackGroupLevelIdx >= 0 then
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[DataGrouping.FHotTrackGroupLevelIdx].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      WindowsInvalidateRect(Handle, GroupRect, False);
    end;
    DataGrouping.FHotTrackGroupLevelIdx := AHotTrackGroupLevelIdx;
    FHotTrackEditButton := NewHotTrackEditButton;
    if DataGrouping.FHotTrackGroupLevelIdx >= 0 then
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[DataGrouping.FHotTrackGroupLevelIdx].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      WindowsInvalidateRect(Handle, GroupRect, False);
    end;
  end;

  if (dgTitles in Options) and
     (STFilter.FilterButtonDrawTime = fbdtWhenRowHotEh) and
     ((AHotTrackCell.Y <> FHotTrackCell.Y) or (AHotTrackCell.X <> FHotTrackCell.X)) and
     ((AHotTrackCell.Y = 0) or (FHotTrackCell.Y = 0))
  then
  begin
    InvalidateRow(0);
    FMouseInTrackRowRect := (FHotTrackCell.Y = 0) and (FHotTrackCell.X >= IndicatorOffset);
  end;
end;

function TCustomDBGridEh.GetEditButtonIndexAt(ACol, ARow: Longint;
  Column: TColumnEh; InCellX, InCellY: Integer): Integer;
var
  ACellRect, ARect1: TRect;
  AEditLineWidth: Integer;
  i: Integer;
  AButtonWidth: Integer;
  Cell: TGridCoord;
  StateRect: TRect;
begin
  Result := -1;
  ACellRect := CellRect(ACol, ARow);
  if ARow < GetTitleRows then
  begin
    Cell.X := ACol;
    Cell.Y := ARow;
    if GetMouseHitCellState(Cell, Point(ACellRect.Left + InCellX, ACellRect.Top + InCellY),
         ACellRect, Column, StateRect) = dgsTitleFilterButtonDown
      then  Result := 0;
  end else
  begin
  // DataRows
    if Flat
      then AEditLineWidth := 1
      else AEditLineWidth := 0;

    SetRect(ARect1, ACellRect.Right - Column.EditButtonsWidth,
                    ACellRect.Top,
                    ACellRect.Right,
                    ACellRect.Top + FInplaceEditorButtonHeight);
    if (ACellRect.Top + InCellY > ARect1.Bottom) or (ACellRect.Left + InCellX < ARect1.Left) then
      Exit;

    if (GetColumnEditStile(Column) <> esSimple) then
    begin
      Inc(ARect1.Left, FInplaceEditorButtonWidth + AEditLineWidth);
      if ARect1.Left > ACellRect.Left + InCellX then
      begin
        Result := 0;
        Exit;
      end;
    end;
    for i := 0 to Column.EditButtons.Count - 1 do
    begin
      if Column.EditButtons[i].Visible then
      begin
        if Column.EditButtons[i].Width > 0
          then AButtonWidth := Column.EditButtons[i].Width + AEditLineWidth
          else AButtonWidth := FInplaceEditorButtonWidth;
        ARect1.Right := ARect1.Left + AButtonWidth + AEditLineWidth;
        Inc(ARect1.Left, AButtonWidth + AEditLineWidth);
        if ARect1.Left > ACellRect.Left + InCellX then
        begin
          Result := i+1;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.EditingChanged;
begin
  inherited EditingChanged;
  if dgIndicator in Options then InvalidateCell(0, FSelRow);
end;

function TCustomDBGridEh.GetColField(DataCol: Integer): TField;
begin
  Result := nil;
  if (DataCol >= 0) and DataLink.Active and (DataCol < Columns.Count)
    then Result := Columns[DataCol].Field;
end;

function TCustomDBGridEh.GetDefaultFixedCellFillStyle: TGridCellFillStyleEh;
begin
  if Flat then
    if dghFixed3D in OptionsEh
      then Result := cfstGradientEh
      else Result := cfstSolidEh
  else if ThemesEnabled then
    Result := cfstThemedEh
  else
    Result := cfstSolidEh;
end;

function TCustomDBGridEh.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := Columns[RawToDataColumn(ACol)].GetEditMask;
end;

function TCustomDBGridEh.GetEditText(ACol, ARow: Longint): string;
var
  Col: TColumnEh;
begin
  Result := '';
  if Datalink.Active then
  begin
    Col := Columns[RawToDataColumn(ACol)];
    Result := Col.GetEditText;
  end;
end;

function TCustomDBGridEh.GetFieldValue(ACol: Integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then Result := Field.DisplayText;
end;

function TCustomDBGridEh.GetSelectedIndex: Integer;
begin
  if RowPanel.Active
   then Result := FInRowPanelCol
   else Result := RawToDataColumn(Col);
end;

procedure TCustomDBGridEh.SetSelectedIndex(Value: Integer);
begin
  MoveCol(Value, 0, False);
end;

function TCustomDBGridEh.HighlightNoDataCellColor(ACol, ARow: Integer; DataCol, DataRow: Integer;
      CellType: TCellAreaTypeEh; AState: TGridDrawState; InMultiSelect: Boolean; var AColor: TColor;
      AFont: TFont): Boolean;
begin
  if Assigned(Style) then
    Result := Style.HighlightNoDataCellColor(Self, ACol, ARow, DataCol, DataRow,
      CellType, AState, InMultiSelect, AColor, AFont)
  else
  begin
    Result := False;
    if InMultiSelect then
    begin
      if ((CellType.HorzType = hctIndicatorEh) and (CellType.VertType <> vctAboveFooterEh)) or
         ((CellType.HorzType <> hctIndicatorEh) and (CellType.VertType in [vctTitleEh, vctSubTitleEh])) then
      begin
//        AColor := RGB(64, 64, 64);
        AColor := ApproximateColor(RGB(64, 64, 64), clHighlight, 255 div 4);
        AFont.Color := clWhite;
      end else if IsSelectionActive then
      begin
        AColor := clHighlight;
        AFont.Color := clHighlightText;
      end else
        AColor := clBtnFace;
      Result := True;
    end;
  end;
end;

function TCustomDBGridEh.HighlightDataCellColor(DataCol, DataRow: Integer; const Value: string;
   AState: TGridDrawState; var AColor: TColor; AFont: TFont): Boolean;
var
  Multiselected, AFocused: Boolean;
begin
  Multiselected := False;
  if {(dgMultiSelect in Options) and }Datalink.Active then
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
    begin
      if InstantReadCurDataNode.NodeType = dntDataGroupEh then
        Multiselected := (Selection.SelectionType = gstAll)
      else if InstantReadCurDataNode.NodeType = dntDataSetRecordEh then
        Multiselected := (Selection.SelectionType <> gstNon) and
          Selection.DataCellSelected(DataCol, Datalink.Datasource.Dataset.Bookmark)
      else if InstantReadCurDataNode.NodeType = dntDataGroupFooterEh then
        Multiselected := (Selection.SelectionType in [gstColumns, gstAll]) and
          Selection.DataCellSelected(DataCol, Datalink.Datasource.Dataset.Bookmark);
    end else
    begin
      Multiselected := (Selection.SelectionType <> gstNon) and
        Selection.DataCellSelected(DataCol, Datalink.Datasource.Dataset.Bookmark);
    end;
  if CanFillSelectionByTheme then
    Result := False
  else if Assigned(Style) then
    Result := Style.HighlightDataCellColor(Self, DataCol + IndicatorOffset, DataRow + TopDataOffset,
      DataCol, DataRow, Value, AState, Multiselected, AColor, AFont)
  else
  begin
    Result := Multiselected;
    AFocused := False;
    if not Result then
    begin
      AFocused := Focused and (dghHighlightFocus in OptionsEh);
      if (dghRowHighlight in OptionsEh) and (DataRow + TopDataOffset = Row) and
        (Selection.SelectionType = gstNon) and not (DataCol + FIndicatorOffset = Col) then
      begin
        AFocused := True;
        AState := AState + [gdSelected];
      end;
      Result := ((gdSelected in AState) or ((DataRow + TopDataOffset) = Row) and (dgRowSelect in Options))
        and ((dgAlwaysShowSelection in Options) or (AFocused))
          { updatelock eliminates flicker when tabbing between rows }
      and ((UpdateLock = 0) or (dgRowSelect in Options));
    end;
    if Result then
      if IsSelectionActive then
      begin
        AColor := clHighlight;
{$IFDEF EH_LIB_16}
        if Style.IsCustomStyleActive then
          StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecFillColor, AColor);
{$ENDIF}
        AFont.Color := clHighlightText;
      end else if (DataRow + TopDataOffset = Row) and
                  ((DataCol + FIndicatorOffset = Col) or (dgRowSelect in Options)) and
                  ((dgAlwaysShowSelection in Options) or AFocused) then
      begin
        AColor := clBtnShadow;
        AFont.Color := clHighlightText;
      end else
        AColor := clBtnFace;
  end;
end;

procedure TCustomDBGridEh.ClearSelection;
begin
  if dgMultiSelect in Options then
  begin
    FBookmarks.Clear;
    FSelecting := False;
  end
  else FSelecting := False;
  if Selection.SelectionType <> gstNon then
  begin
    Selection.Clear;
    Invalidate;
    InvalidateEditor;
  end;
end;

procedure TCustomDBGridEh.CheckClearSelection;
begin
  if (dghClearSelection in OptionsEh) then
    ClearSelection;
  FSelecting := False;
end;

procedure TCustomDBGridEh.DoSelection(Select: Boolean; Direction: Integer;
  MaxDirection, RowOnly: Boolean);
var
  AddAfter: Boolean;
  DisabledControls: Boolean;
begin
  if RowOnly or (dgRowSelect in Options) then
  begin
    AddAfter := False;
    Select := Select and CanSelectType(gstRecordBookmarks);
    begin
      DisabledControls := False;
      BeginUpdate;
      try
        if ((Abs(Direction) >= DataLink.RecordCount) or MaxDirection) and
          (((Direction > 0) and not DataSource.DataSet.EOF) or
          ((Direction < 0) and not DataSource.DataSet.BOF)) then
        begin
          //DisabledControls := True;
          //DataSource.DataSet.DisableControls;
        end;
        try
          while (Direction <> 0) {or (MaxDirection and not DataLink.EOF and not DataLink.BOF)} do
          begin
            if (dgMultiSelect in Options) and DataLink.Active then
              if Select {ddd and (ssShift in Shift)} then
              begin
                if not FSelecting then
                begin
                  FSelectionAnchor := FBookmarks.CurrentRow;
                  FSelectionAnchorSelected := FBookmarks.CurrentRowSelected;
                  if FAntiSelection then
                    FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
                  else
                    FBookmarks.CurrentRowSelected := True;
                  FSelecting := True;
                  AddAfter := True;
                end
                else
                  with FBookmarks do
                  begin
                    AddAfter := Compare(CurrentRow, FSelectionAnchor) <> -(Direction div Abs(Direction));
                    if not AddAfter then
                      if FAntiSelection
                        then CurrentRowSelected := FSelectionAnchorSelected
                        else CurrentRowSelected := False;
                  end
              end
              else
                CheckClearSelection;
            if MoveBy(Direction div Abs(Direction)) = 0 then Exit;
            if AddAfter then
              if FAntiSelection
                then FBookmarks.CurrentRowSelected := not FSelectionAnchorSelected
                else FBookmarks.CurrentRowSelected := True;
            if not MaxDirection then
              if (Direction > 0) then Dec(Direction) else Inc(Direction);
          end;
        finally
          if DisabledControls then DataSource.DataSet.EnableControls;
        end;
      finally
        EndUpdate;
        if (UpdateLock = 0) and FSizeChanged then
          DoAfterSizeChanged;
      end
    end;
  end else //Rectangle select
  begin
    Select := Select and CanSelectType(gstRectangle);
    if not Select then
      MoveBy(Direction)
    else
    begin
      BeginUpdate;
      try
        if Selection.FSelectionType <> gstRectangle then
        begin
          Selection.Rect.Clear;
          Selection.Rect.Select(RawToDataColumn(Col), Datalink.Datasource.Dataset.Bookmark, True);
        end;
        if MaxDirection then
          if Direction = 1
            then DataLink.Dataset.Last
            else DataLink.Dataset.First
        else
          MoveBy(Direction);
        Selection.Rect.Select(RawToDataColumn(Col), Datalink.Datasource.Dataset.Bookmark, True);
      finally
        EndUpdate;
        if (UpdateLock = 0) and FSizeChanged then
          DoAfterSizeChanged;
      end;
    end;
  end;
  if UpdateLock = 0 then Update;
end;


procedure TCustomDBGridEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;
  RowDetailPanelAvailable: Boolean;
  NextColumn, AUpDownBaseColumn: TColumnEh;

  procedure NextRow(Select: Boolean);
  begin
    with DataLink.Dataset do
    begin
      if (State = dsInsert) and not Modified and not DataLink.FModified then
        if EOF then Exit else Cancel
      else if ssShift in Shift then
        DoSelection(Select, 1, False, not (gstRectangle in AllowedSelections))
      else
        DoSelection(False, 1, False, True);

      if CanModify and (not ReadOnly) and (dgEditing in Options) and
         (alopAppendEh in AllowedOperations) and Self.EOF
      then
        if FDataGrouping.IsGroupingWorks then
          DataGroupsMoveBy(1, True)
        else
          Append;
    end;
  end;

  procedure PriorRow(Select: Boolean);
  begin
    with DataLink.Dataset do
      if (State = dsInsert) and not Modified and Self.EOF and
        not DataLink.FModified then
        Cancel
      else if ssShift in Shift then
        DoSelection(Select, -1, False, not (gstRectangle in AllowedSelections))
      else
        DoSelection(False, -1, False, True);
  end;

  procedure Tab(GoForward: Boolean);
  var
    NextCol: TColumnEh;
  begin
    CheckClearSelection;
    BeginUpdate; { Prevent highlight flicker on tab to next/prior row }
    try
      NextCol := Columns.GetNextTabColumn(Columns[SelectedIndex], GoForward);
      if NextCol = Columns[SelectedIndex] then
      begin
        if GoForward then
        begin
          NextRow(False);
          NextCol := Columns.GetFirstTabColumn;
        end else
        begin
          PriorRow(False);
          if DataGrouping.IsGroupingWorks and (FCurGroupDataNode.NodeType <> dntDataGroupEh) then
            NextCol := Columns.GetLastTabColumn;
        end;
        if NextCol <> nil then
          SelectedIndex := NextCol.Index;
      end else if NextCol <> nil then
        SelectedIndex := NextCol.Index;
    finally
      EndUpdate;
    end;
  end;

  function CheckIsFilterKey: Boolean;
  var
    LastFilterCol: Integer;
  begin
    Result := False;
    if (Key = VK_UP) and
        STFilter.Visible and
        (STFilter.Location = stflUnderTitleFilterEh) and
        DataLink.Active and
        (Bof or (ssCtrl in Shift)) then
    begin
      if (dgRowSelect in Options) then
      begin
        LastFilterCol := FFilterCol; //DataToRawColumn(SelectedIndex);
        while (LastFilterCol < Columns.Count) and not CanFilterCol(LastFilterCol) do
          Inc(LastFilterCol);
        if ((LastFilterCol >= FixedCols) and (LastFilterCol < LeftCol))
          or (LastFilterCol >= LeftCol + VisibleColCount) or (LastFilterCol < IndicatorOffset) then
        begin
          FFilterCol := RawToDataColumn(LeftCol);
          while (FFilterCol < Columns.Count) and not CanFilterCol(FFilterCol) do
            Inc(FFilterCol);
          StartEditFilter(FFilterCol);
        end
        else
          StartEditFilter(LastFilterCol);
      end
      else
        StartEditFilter(SelectedIndex);
      Key := 0;
      Result := True;
    end;
  end;

  procedure FocusToDetailPanel;
  var
    List: TList;
    Control: TWinControl;
    i: Integer;
  begin
    if not (csLoading in ComponentState) and
      not (csDesigning in ComponentState) and
      (RowDetailPanel.ActiveControl <> nil) then
    begin
      RowDetailPanel.ActiveControl.SetFocus;
      Exit;
    end;
    List := TList.Create;
    try
      FRowDetailControl.GetTabOrderList(List);
      if List.Count > 0 then
        for i := 0 to List.Count-1 do
        begin
          Control := TWinControl(List[i]);
          if Control.CanFocus and Control.TabStop then
          begin
            Control.SetFocus;
            Exit;
          end;
        end;
    finally
      List.Free;
    end;
  end;

const
  RowMovementKeys = [VK_UP, VK_PRIOR, VK_DOWN, VK_NEXT, VK_HOME, VK_END];

begin
  KeyDownEvent := OnKeyDown;
  FAntiSelection := (ssCtrl in Shift) or not (dghClearSelection in OptionsEh);
  if Assigned(KeyDownEvent) then KeyDownEvent(Self, Key, Shift);
  CheckIsFilterKey;
  if Self.UseRightToLeftAlignment then
    if Key = VK_LEFT then
      Key := VK_RIGHT
    else if Key = VK_RIGHT then
      Key := VK_LEFT;
  if not DataLink.Active or not CanGridAcceptKey(Key, Shift)
    then Exit;
  if DataGrouping.IsGroupingWorks and (FCurGroupDataNode <> nil) and
    (FCurGroupDataNode.NodeType = dntDataGroupEh) then
  begin
    KeyDownInGroupDataNode(Key, Shift);
    Exit;
  end;
  if DataGrouping.IsGroupingWorks and (FCurGroupDataNode <> nil) and
    (FCurGroupDataNode.NodeType = dntDataGroupFooterEh) then
  begin
    KeyDownInGroupFooterNode(Key, Shift);
    Exit;
  end;

  if STFilter.Visible and
    (SelectedIndex >= 0) and
    (STFilter.Location = stflInTitleFilterEh) and
    Columns[SelectedIndex].STFilter.Visible and
    (ShortCut(Key, Shift) = DBGridEhShowInTitleFilterBox)
  then
    InTitleFilterListboxDropDown(Columns[SelectedIndex])
  else if (ShortCut(Key, Shift) = SearchPanel.ShortCut) and SearchPanel.Enabled then
    SearchEditorMode := True
  else if (ShortCut(Key, Shift) = DBGridEhSetValueFromPrevRecordKey) then
    SetValueFromPrevRecord
  else if (ShortCut(Key, Shift) = DBGridEhInplaceSearchKey) and (dghIncSearch in OptionsEh) then
    if InplaceSearching and (dghDialogFind in OptionsEh) and (DBGridEhFindDialogKey = DBGridEhInplaceSearchKey) then
    begin
      StopInplaceSearch;
      ExecuteFindDialog('', '', IsFindDialogShowAsModal);
    end else
      StartInplaceSearch('', -1, ltdAllEh)
  else if (ShortCut(Key, Shift) = DBGridEhFindDialogKey) and (dghDialogFind in OptionsEh) then
    ExecuteFindDialog('', '', IsFindDialogShowAsModal)
  else if FInplaceSearching then
    if (Key in [VK_ESCAPE, VK_RETURN, VK_F2]) and (Shift = [])
      then StopInplaceSearch
    else if (Key = VK_BACK) and (Shift = []) then
    begin
{$IFNDEF CIL}
      if ByteType(FInplaceSearchText, Length(FInplaceSearchText)) = mbTrailByte then
        FInplaceSearchText := Copy(FInplaceSearchText, 1, Length(FInplaceSearchText) - 2)
      else
{$ENDIF}
        FInplaceSearchText := Copy(FInplaceSearchText, 1, Length(FInplaceSearchText) - 1);
      GridInvalidateRow(Self, Row);
      StartInplaceSearchTimer;
    end else if ShortCut(Key, Shift) = DBGridEhInplaceSearchNextKey
      then StartInplaceSearch('', FInplaceSearchTimeOut, ltdDownEh)
    else if ShortCut(Key, Shift) = DBGridEhInplaceSearchPriorKey
      then StartInplaceSearch('', FInplaceSearchTimeOut, ltdUpEh);
  with DataLink.DataSet do
    if ssCtrl in Shift then
    begin
      if (Key in RowMovementKeys) and not (ssShift in Shift) then CheckClearSelection;
      case Key of
        VK_UP, VK_PRIOR:
          if (ssShift in Shift) and (dgMultiSelect in Options)
            then DoSelection(True, -DataLink.ActiveRecord, False, False)
            else Self.MoveBy(-DataLink.ActiveRecord);
        VK_NEXT:
          if (ssShift in Shift) and (dgMultiSelect in Options)
            then DoSelection(True, DataLink.BufferCount - DataLink.ActiveRecord - 1, False, False)
            else Self.MoveBy(DataLink.BufferCount - DataLink.ActiveRecord - 1);
        VK_DOWN:
          if RowDetailPanel.Active then
          begin
            RowDetailPanelAvailable := RowDetailPanel.Active;
            if Assigned(OnCheckRowHaveDetailPanel) then
              OnCheckRowHaveDetailPanel(Self, RowDetailPanelAvailable);
            if RowDetailPanelAvailable then
            begin
              RowDetailPanel.Visible := True;
              FocusToDetailPanel;
            end;
          end else
          begin
            if (ssShift in Shift) and (dgMultiSelect in Options)
              then DoSelection(True, DataLink.BufferCount - DataLink.ActiveRecord - 1, False, False)
              else Self.MoveBy(DataLink.BufferCount - DataLink.ActiveRecord - 1);
          end;
        VK_LEFT: MoveCol(0, 1, False);
        VK_RIGHT: MoveCol(Columns.Count - 1, -1, False);
        VK_HOME: if (ssShift in Shift) and (dgMultiSelect in Options)
                  then DoSelection(True, -1, True, False)
                  else First;
        VK_END: if (ssShift in Shift) and (dgMultiSelect in Options)
                  then DoSelection(True, 1, True, False)
                  else Last;
        VK_DELETE:
          if (geaDeleteEh in EditActions) and (Selection.SelectionType <> gstNon) then
          begin
            if CheckDeleteAction then
              DBGridEh_DoDeleteAction(Self, False);
          end
          else if (not Self.ReadOnly) and (not ReadOnly) and not IsEmpty
            and CanModify and (alopDeleteEh in AllowedOperations) and DeletePrompt then
            if FBookmarks.Count > 0
              then FBookmarks.Delete
              else Delete;
        VK_INSERT, Word('C'):
          if CheckCopyAction and (geaCopyEh in EditActions) then
            DBGridEh_DoCopyAction(Self, False);
        Word('X'):
          if CheckCutAction and (geaCutEh in EditActions) then
            DBGridEh_DoCutAction(Self, False);
        Word('V'):
          if FInplaceSearching then
            StartInplaceSearch(ClipBoard.AsText, FInplaceSearchTimeOut, ltdAllEh)
          else if CheckPasteAction and (geaPasteEh in EditActions) then
            DBGridEh_DoPasteAction(Self, False);
        Word('A'):
          if CheckSelectAllAction and (geaSelectAllEh in EditActions) and ([ssCtrl] = Shift) then
            Selection.SelectAll
          else if DataLink.Active and (gstRecordBookmarks in AllowedSelections) and ([ssCtrl] = Shift) then
            Selection.Rows.SelectAll;
      end
    end
    else
      case Key of
        VK_UP:
          if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh) then
          begin
            if Columns.FUpDownBaseColumn = nil
              then AUpDownBaseColumn := Columns[SelectedIndex]
              else AUpDownBaseColumn := Columns.FUpDownBaseColumn;
            NextColumn := Columns.GetNextVertColumn(Columns[SelectedIndex], False);
            if (NextColumn = Columns[SelectedIndex]) and not DataLink.BOF then
            begin
              SelectedIndex := Columns.GetBottomColumn(NextColumn).Index;
              PriorRow(True);
              if DataLink.BOF then
                SelectedIndex := NextColumn.Index;
            end else
              SelectedIndex := NextColumn.Index;
            Columns.FUpDownBaseColumn := AUpDownBaseColumn;
          end else
            PriorRow(True);
        VK_DOWN:
          if RowDetailPanel.Visible then
            FocusToDetailPanel
          else if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh) then
          begin
            if Columns.FUpDownBaseColumn = nil
              then AUpDownBaseColumn := Columns[SelectedIndex]
              else AUpDownBaseColumn := Columns.FUpDownBaseColumn;
            NextColumn := Columns.GetNextVertColumn(Columns[SelectedIndex], True);
            if NextColumn = Columns[SelectedIndex] then
            begin
              if not DataLink.EOF then
              begin
                SelectedIndex := Columns.GetTopColumn(NextColumn).Index;
                FLockAutoShowCurCell := True;
                try
                  NextRow(True);
                finally
                  FLockAutoShowCurCell := False;
                end;
                if DataLink.EOF then
                  SelectedIndex := NextColumn.Index;
              end;
            end  else
              SelectedIndex := NextColumn.Index;
            Columns.FUpDownBaseColumn := AUpDownBaseColumn;
          end else
            NextRow(True);
        VK_LEFT:
          if dgRowSelect in Options then
          begin
            inherited KeyDown(Key, Shift);
          end
          {PriorRow(False)}else if (dgMultiSelect in Options) and (ssShift in Shift) then
            MoveCol(SelectedIndex - 1, -1, True)
          else
          begin
            CheckClearSelection;
            if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh)
              then SelectedIndex := Columns.GetNextHorzColumn(Columns[SelectedIndex], False, False, False).Index
              else MoveCol(SelectedIndex - 1, -1, False);
          end;
        VK_RIGHT:
          if dgRowSelect in Options then
          begin
            inherited KeyDown(Key, Shift);
          end else if (dgMultiSelect in Options) and (ssShift in Shift)
            then MoveCol(SelectedIndex + 1, 1, True)
          else
          begin
            CheckClearSelection;
            if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh)
              then SelectedIndex := Columns.GetNextHorzColumn(Columns[SelectedIndex], True, False, False).Index
              else MoveCol(SelectedIndex + 1, 1, False);
          end;
        VK_HOME:
          if (ColCount = FIndicatorOffset + 1) or (dgRowSelect in Options) then
          begin
            if (ssShift in Shift) and (dgMultiSelect in Options)
              then DoSelection(True, -1, True, False)
            else
            begin
              CheckClearSelection;
              First;
            end;
          end else if (dgMultiSelect in Options) and (ssShift in Shift) then
            MoveCol(0, 1, True)
          else
            MoveCol(0, 1, False);
        VK_END:
          if (ColCount = FIndicatorOffset + 1)
            or (dgRowSelect in Options) then
          begin
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True, 1, True, False)
            else
            begin
              CheckClearSelection;
              Last;
            end;
          end else if (dgMultiSelect in Options) and (ssShift in Shift) then
            MoveCol(Columns.Count - 1, -1, True)
          else
            MoveCol(Columns.Count - 1, -1, False);
        VK_NEXT:
          begin
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True, VisibleDataRowCount, False, not (gstRectangle in AllowedSelections))
            else
            begin
              CheckClearSelection;
              if MemTableSupport and (RowCount - TopRow - VisibleRowCount < VisibleRowCount) then
                FIntMemTable.FetchRecords(VisibleRowCount - (RowCount - TopRow - VisibleRowCount));
              Self.MoveBy(VisibleDataRowCount);
            end;
          end;
        VK_PRIOR:
          begin
            if (ssShift in Shift) and (dgMultiSelect in Options) then
              DoSelection(True, -VisibleDataRowCount, False, not (gstRectangle in AllowedSelections))
            else begin
              CheckClearSelection;
              Self.MoveBy(-VisibleDataRowCount);
            end;
          end;
        VK_INSERT:
          if (ssShift in Shift) then
          begin
            if FInplaceSearching then
              StartInplaceSearch(ClipBoard.AsText, FInplaceSearchTimeOut, ltdAllEh)
            else if CheckPasteAction and (geaPasteEh in EditActions) then
              DBGridEh_DoPasteAction(Self, False)
          end
          else if CanModify and (not ReadOnly) and (dgEditing in Options) then
          begin
            CheckClearSelection;
            if alopInsertEh in AllowedOperations then DataInsert
            else if alopAppendEh in AllowedOperations then DataAppend;
          end;
          VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
        VK_RETURN: if dghEnterAsTab in OptionsEh then Tab(not (ssShift in Shift));
        VK_ESCAPE:
          begin
            DataLink.Reset;
            ClearSelection;
            if not (dgAlwaysShowEditor in Options) then HideEditor;
            if (FGridState in [gsColMoving, gsRowSizing, gsColSizing]) or
              (FDBGridEhState in [dgsColSizing, dgsRowMoving, dgsGroupPanelTitleMoving] )
              then Perform(WM_CANCELMODE, 0, 0);
          end;
        VK_F2: EditorMode := True;
        VK_DELETE:
          if (ssShift in Shift) and CheckCutAction and (geaCutEh in EditActions) then
            DBGridEh_DoCutAction(Self, False);
        VK_ADD, VK_SUBTRACT, VK_MULTIPLY:
          if ViewScroll and FIntMemTable.MemTableIsTreeList then
            case Key of
              VK_ADD: FIntMemTable.SetTreeNodeExpanded(Row - TopDataOffset, True);
              VK_SUBTRACT: FIntMemTable.SetTreeNodeExpanded(Row - TopDataOffset, False);
              VK_MULTIPLY: FIntMemTable.SetTreeNodeExpanded(Row - TopDataOffset, not FIntMemTable.GetTreeNodeExpanded);
            end
          else if RowDetailPanel.Active then
          begin
            RowDetailPanelAvailable := RowDetailPanel.Active;
            if Assigned(OnCheckRowHaveDetailPanel) then
            OnCheckRowHaveDetailPanel(Self, RowDetailPanelAvailable);
            if RowDetailPanelAvailable then
              case Key of
                VK_ADD: RowDetailPanel.Visible := True;
                VK_SUBTRACT: RowDetailPanel.Visible := False;
                VK_MULTIPLY: RowDetailPanel.Visible := not RowDetailPanel.Visible;
              end
          end;
      end;
  if (SelectedIndex >= 0) and
     (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]) and
     ((Key = VK_DELETE) and not (ssCtrl in Shift)) and not (dgRowSelect in Options) then
    if Assigned(Columns[SelectedIndex].Field) and
      not Columns[SelectedIndex].Field.Required and
      Columns[SelectedIndex].CanModify(True)
    then
        Columns[SelectedIndex].UpdateDataValues('', Null, False);
end;

procedure TCustomDBGridEh.KeyPress(var Key: Char);
begin
  if (dghEnterAsTab in OptionsEh) and (Integer(Key) = VK_RETURN) then Key := #9;
  if not (dgAlwaysShowEditor in Options) and (Key = #13) then
    DataLink.UpdateData;
  inherited KeyPress(Key);
  if (  FInplaceSearching or
       ((dghPreferIncSearch in OptionsEh) and not (dgAlwaysShowEditor in Options) and not InplaceEditorVisible)
     ) and (Key >= #32) and DataLink.Active and not (DataLink.DataSet.State in dsEditModes)
    then
  begin
    if FInplaceSearching
      then StartInplaceSearch(GetCompleteKeyPress, FInplaceSearchTimeOut, ltdAllEh)
      else StartInplaceSearch(GetCompleteKeyPress, DBGridEhInplaceSearchTimeOut, ltdAllEh);
    Key := #0;
  end;
end;

function TCustomDBGridEh.GetCompleteKeyPress: String;
begin
  Result := FCompleteKeyPress;
end;

procedure TCustomDBGridEh.ShowFilterEditorChar(Ch: Char);
begin
  UpdateFilterEdit(True);
  if (FilterEdit <> nil) and (FilterEdit.Visible) then
    PostMessage(FilterEdit.Handle, WM_CHAR, Word(Ch), 0);
end;

procedure TCustomDBGridEh.WMChar(var Message: TWMChar);
var
  CharMsg: TMsg;
  DBC: Boolean;
begin
  if (Columns[SelectedIndex].Field <> nil) and
     (Columns[SelectedIndex].Field is TNumericField) then
    if ((FormatSettings.DecimalSeparator <> '.') and (Char(Message.CharCode) = '.')) then
      Message.CharCode := Word(Copy(FormatSettings.DecimalSeparator, 1, 1)[1]);
  FCompleteKeyPress := Char(Message.CharCode);
  try
    DBC := False;
    if FilterEditMode and (
      (Char(Message.CharCode) = ^H) or (Char(Message.CharCode) >= #32) ) then
      ShowFilterEditorChar(Char(Message.CharCode))
    else if CharInSetEh(Char(Message.CharCode), LeadBytes) then
      if PeekMessage(CharMsg, Handle, WM_CHAR, WM_CHAR, PM_NOREMOVE) then
        if CharMsg.Message <> WM_Quit then
        begin
{$IFDEF CIL}
//          FCompleteKeyPress := FCompleteKeyPress + Char(CharMsg.wParam);
{$ELSE}
          FCompleteKeyPress := FCompleteKeyPress + Char(CharMsg.wParam);
{$ENDIF}
          DBC := True;
        end;

    {Don't use KeyPress because KeyPress is invoked only after
    first showing of inplace editor}
    if (SelectedIndex >= 0) and
       (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes]) and
       ((Char(Message.CharCode) = ' ') and not (dgRowSelect in Options)) then
    begin
      DoKeyPress(Message);
      if Char(Message.CharCode) = ' ' then
        if ssShift in KeyDataToShiftState(Message.KeyData)
          then Columns[SelectedIndex].SetNextFieldValue(-1)
          else Columns[SelectedIndex].SetNextFieldValue(1);
    end
    else if ( FInplaceSearching
            or
             ((dghIncSearch in OptionsEh) and
             not CanEditModifyColumn(SelectedIndex))
            or
             ((dghPreferIncSearch in OptionsEh) and not (dgAlwaysShowEditor in Options) and not InplaceEditorVisible)
            ) and
            ((Char(Message.CharCode) >= #32) or (Char(Message.CharCode) = #8)) and
             DataLink.Active and not (DataLink.DataSet.State in dsEditModes)
            or
            ( ((ViewScroll and FIntMemTable.MemTableIsTreeList) or RowDetailPanel.Active)
              and
                CharInSetEh(Char(Message.CharCode), ['+', '-', '*']) )
      then
    begin
      DoKeyPress(Message);
    end else
      inherited;

    if DBC and (Char(Message.CharCode) = #0) then
      PeekMessage(CharMsg, Handle, WM_CHAR, WM_CHAR, PM_REMOVE);
  finally
    FCompleteKeyPress := '';
  end;
end;

function TCustomDBGridEh.IndicatorColVisible: Boolean;
begin
  Result := (dgIndicator in Options) or (dghShowRecNo in OptionsEh)
    or (gioShowRowselCheckboxesEh in IndicatorOptions);
end;

function TCustomDBGridEh.GetAutoTitleHeight: Integer;
var
  I, J: Integer;
begin
  Result := 0;
  for I := 0 to Columns.Count - 1 do
  begin
    Canvas.Font := Columns[I].Title.Font;
    J := Canvas.TextHeight('Wg') + FInterlinear;
    if J > Result then Result := J;
  end;
  if Result = 0 then
  begin
    Canvas.Font := TitleFont;
    Result := Canvas.TextHeight('Wg') + FInterlinear;
  end;
end;

procedure TCustomDBGridEh.InternalLayout;
var
  I, J, K, OldLeftCol: Integer;
  RestoreCanvas: Boolean;

  tm: TTEXTMETRIC;
  CW, CountedWidth, FirstInvisibleColumns, ColWidth: Integer;
  AFont: TFont;
  NotInWidthRange: Boolean;
  NewScrollStyle: TScrollStyle;
  AFixedCols: Integer;
  LeftRightOutBound: Integer;
begin
  if (csLoading in ComponentState) or
     (csDestroying in ComponentState)
  then
    Exit;

  LeftRightOutBound := OutBoundaryData.LeftIndent + OutBoundaryData.RightIndent;
  FColWidthsChanged := False;

  try
    LockPaint;

  UpdateScrollBarPanels;

  FIndicatorOffset := 0;
  if IndicatorColVisible then
    Inc(FIndicatorOffset);

  inherited InternalLayout;

  FirstInvisibleColumns := 0;
  for I := 0 to Columns.Count - 1 do
    if Columns[I].Visible = True then
    begin
      VisibleColumns.Add(Columns[I]);
    end
    else if (FrozenCols + FirstInvisibleColumns > I)
      then Inc(FirstInvisibleColumns);

  for I := FrozenCols + FirstInvisibleColumns to Columns.Count - 1 do
    if (Columns[I].Visible = False)
      then Inc(FirstInvisibleColumns)
      else Break;

  Columns.FFirstScrollVisibleColumn := nil;
  for I := FrozenCols to Columns.Count - 1 do
    if Columns[I].Visible = True then
    begin
      Columns.FFirstScrollVisibleColumn := Columns[I];
      Break;
    end;

  Columns.FLastScrollVisibleColumn := nil;
  for I := Columns.Count - 1 - ContraColCount downto FrozenCols do
    if Columns[I].Visible = True then
    begin
      Columns.FLastScrollVisibleColumn := Columns[I];
      Break;
    end;

  if VisibleColumns.Count = 0 then Dec(FirstInvisibleColumns);

  if HandleAllocated then
  begin
    Columns.RelayoutCellsInRowPanel;
    ResetTabIndexedColumns;
  end;

  AFixedCols := FIndicatorOffset + FrozenCols;
  if not (FrozenCols < VisibleColumns.Count) then
    AFixedCols := FIndicatorOffset + VisibleColumns.Count - 1;

  if not DataLink.Active and (Columns.State = csDefault) then
  begin
    FrozenColCount := 0;
    ColCount := Columns.Count + FIndicatorOffset;
    inherited ContraColCount := 0;
  end else
  begin
    if ContraColCount >= VisibleColumns.Count - AFixedCols
      then inherited ContraColCount := VisibleColumns.Count - AFixedCols
      else inherited ContraColCount := ContraColCount;
    ColCount := Columns.Count + FIndicatorOffset - inherited ContraColCount;
  end;

  if not DataLink.Active and (Columns.State = csDefault) then
    AFixedCols := FIndicatorOffset + FirstInvisibleColumns;
  if AFixedCols < 0 then AFixedCols := 0;
  if AFixedCols >= FrozenColCount then
    inherited FixedCols := AFixedCols;

  if not DataLink.Active and (Columns.State = csDefault)
    then FrozenColCount := 0
    else FrozenColCount := AFixedCols - FIndicatorOffset;

  if AFixedCols >= FrozenColCount then
    inherited FixedCols := AFixedCols;
    
  RestoreCanvas := not HandleAllocated and not FCanvasHandleAllocated; //not Canvas.HandleAllocated;
  if RestoreCanvas then
  begin
    Canvas.Handle := GetDC(0);
    FCanvasHandleAllocated := True;
  end;
  try
    Canvas.Font := Font;
    if Flat
      then J := 1
      else J := 3;
    if dgRowLines in Options then
      Inc(J, GridLineWidth);
    K := Canvas.TextHeight('Wg');
//    FStdDefaultRowHeight
    GetTextMetrics(Canvas.Handle, tm);
    if (FNewRowHeight > 0) or (FRowLines > 0) then
    begin
      FStdDefaultRowHeight := FNewRowHeight + (tm.tmExternalLeading + tm.tmHeight) * FRowLines;
      FStdDefaultTextHeight := tm.tmExternalLeading + tm.tmHeight;
    end else
    begin
      FStdDefaultRowHeight := K + J;
      FStdDefaultTextHeight := K;
    end;

    if (dghFitRowHeightToText in OptionsEh) then
    begin
      I := (FStdDefaultRowHeight - J) mod K;
      if (I > K div 2) or ((FStdDefaultRowHeight - J) div K = 0)
        then FStdDefaultRowHeight := ((FStdDefaultRowHeight - J) div K + 1) * K + J
        else FStdDefaultRowHeight := (FStdDefaultRowHeight - J) div K * K + J;
      FRowLines := (FStdDefaultRowHeight - J) div K;
      FNewRowHeight := J;
    end;
    if RowPanel.Active then
    begin
      if FGridMasterCellHeight > 0 then
        FStdDefaultRowHeight := FGridMasterCellHeight;
      FColWidthsChanged := True;
    end;

    if FStdDefaultRowHeight > Round(FInplaceEditorButtonWidth * 3 / 2)
      then FInplaceEditorButtonHeight := DefaultEditButtonHeight(FInplaceEditorButtonWidth,  Flat)
      else FInplaceEditorButtonHeight := FStdDefaultRowHeight;
    STFilter.UpdateInplaceEditorButtonHeight;

    if (tm.tmExternalLeading + tm.tmHeight + tm.tmInternalLeading + FInterlinear < FStdDefaultRowHeight)
      then FAllowWordWrap := True
      else FAllowWordWrap := False;

    if (dgTitles in Options) and not (IsUseMultiTitle = True) then
      FTitleRowHeight := GetAutoTitleHeight;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
      FCanvasHandleAllocated := False;
    end;
  end;

  if ({not AutoFitColWidths} True or  (csDesigning in ComponentState)) and
    HorzScrollBar.Visible and (HorzScrollBar.ExtScrollBar = nil)
  then NewScrollStyle := ssHorizontal
  else NewScrollStyle := ssNone;

  if VertScrollBar.Visible and (VertScrollBar.VisibleMode <> sbNeverShowEh) and
     ExtendedScrolling and VertScrollBar.SmoothStep
  then
    if NewScrollStyle = ssNone
      then NewScrollStyle := ssVertical
      else NewScrollStyle := ssBoth;

  if not ScrollRangeUpdating then
    if (ScrollBars <> NewScrollStyle) and HandleAllocated then
    begin
      ScrollBars := NewScrollStyle;
      HandleNeeded;
      UpdateScrollBar;
    end else if ScrollBars <> NewScrollStyle then
      ScrollBars := NewScrollStyle;

  // AutoFitColWidths
  SetColumnAttributes;
  if (FAutoFitColWidths = True) and not (csDesigning in ComponentState) and HandleAllocated then
  begin
    UpdateScrollBar;
    if RowPanel.Active then
    begin
      CW := GridClientWidth;
      if IndicatorColVisible then Dec(CW, CellColWidths[0]);
      if (dgColLines in Options) then Dec(CW, 1);
      Columns.ScaleWidths(FGridMasterCellWidth + GridLineWidth, CW);
//      Columns.FixupAutoFitColWidths(CW);
    end else
    begin

      for i := 0 to VisibleColumns.Count - 1
        do VisibleColumns[i].FNotInWidthRange := False;

      CountedWidth := 0;
      CW := 0;

      for j := 0 to VisibleColumns.Count - 1 do
      begin
        CW := 0;
        K := 0;

        for i := 0 to VisibleColumns.Count - 1 do
        begin
          if (VisibleColumns[i].AutoFitColWidth = False) or (VisibleColumns[i].FNotInWidthRange = True)
            then Inc(CW, VisibleColumns[i].Width)
            else Inc(K, VisibleColumns[i].FInitWidth);
        end;

        if (GridClientWidth > FMinAutoFitWidth)
          then CW := GridClientWidth - CW
          else CW := FMinAutoFitWidth - CW;
        if (CW < 0) then CW := 0;
        if IndicatorColVisible then Dec(CW, CellColWidths[0]);
        if (dgColLines in Options) then Dec(CW, VisibleColumns.Count);
        if IndicatorColVisible and (dgColLines in Options) then Dec(CW, 1);
        Dec(CW, FExtraFirstColumnWidth);

        CountedWidth := 0;
        NotInWidthRange := False;

        for i := 0 to VisibleColumns.Count - 1 do
        begin
          if (VisibleColumns[i].AutoFitColWidth = True) and (VisibleColumns[i].FNotInWidthRange = False) then
          begin
            ColWidth := MulDiv(VisibleColumns[i].FInitWidth, CW, K);
            VisibleColumns[i].Width := ColWidth;
            if (ColWidth <> VisibleColumns[i].Width) then
            begin
              NotInWidthRange := True;
              VisibleColumns[i].FNotInWidthRange := True;
            end;
            Inc(CountedWidth, VisibleColumns[i].Width);
          end;
        end;

        if (NotInWidthRange = False) then Break;
      end;

      if (CountedWidth <> CW) then // Correct last AutoFitColWidth column
      begin
        for i := VisibleColumns.Count - 1 downto 0 do
          if (VisibleColumns[i].AutoFitColWidth = True) and (VisibleColumns[i].FNotInWidthRange = False) then
          begin
            VisibleColumns[i].Width := VisibleColumns[i].Width + CW - CountedWidth;
            if (VisibleColumns[i].Width < 0)
              then VisibleColumns[i].Width := 0;
            Break;
          end;
      end;
    end;
  end;

  // Title and MultyTitle
  if (dgTitles in Options) then
  begin
    RestoreCanvas := not HandleAllocated and not FCanvasHandleAllocated; //not Canvas.HandleAllocated;
    if RestoreCanvas then
    begin
      Canvas.Handle := GetDC(0);
      FCanvasHandleAllocated := True;
    end;
    try
      if (TitleHeight <> 0) or (TitleLines <> 0) then
      begin
        K := 0;
        for I := 0 to Columns.Count - 1 do
        begin
          Canvas.Font := Columns[I].Title.Font;
          J := Canvas.TextHeight('Wg') + FInterlinear;
          if J > K then
          begin
            K := J;
            GetTextMetrics(Canvas.Handle, tm);
          end;
        end;
        if K = 0 then
        begin
          Canvas.Font := TitleFont;
          GetTextMetrics(Canvas.Handle, tm);
        end;

        FTitleHeightFull := 0;
        if TitleLines > 0 then
          FTitleHeightFull := tm.tmExternalLeading + tm.tmHeight * TitleLines + 2;

        FTitleHeightFull := FTitleHeightFull + TitleHeight;

        if dgRowLines in Options then
          FTitleHeightFull := FTitleHeightFull + 1;

        FTitleRowHeight := FTitleHeightFull;
      end;

      if (IsUseMultiTitle = True) {and HandleAllocated} then
      begin
        SetLength(FLeafFieldArr, Columns.Count);
        AFont := Canvas.Font;
        Canvas.Font := TitleFont;
        for i := 0 to Columns.Count - 1 do
          FLeafFieldArr[i].FColumn := Columns[i];
        FHeadTree.CreateFieldTree(Self);
        FTitleRowHeight := SetChildTreeHeight(FHeadTree) - 1; //- iif(dghFixed3D in OptionsEh, 1, 3); // +2;
//        if not (dgRowLines in Options) then Dec(FTitleRowHeight);
        if not (dgRowLines in Options) and TitleParams.HorzLines then
          Inc(FTitleRowHeight)
        else if (dgRowLines in Options) and not TitleParams.HorzLines then
          Dec(FTitleRowHeight);
        if TitleParams.BorderInFillStyle then
          Dec(FTitleRowHeight);
        Canvas.Font := AFont;
      end;

      if RowPanel.Active then
        FTitleRowHeight := FGridMasterCellHeight;
    finally
      if RestoreCanvas then
      begin
        ReleaseDC(0, Canvas.Handle);
        Canvas.Handle := 0;
        FCanvasHandleAllocated := False;
      end;
    end;
  end;

  if HandleAllocated then
    ResetGroupPanel;

  SetColumnAttributes;
  UpdateFooterRowHeights;

  if dgRowSelect in Options then
  begin
    OldLeftCol := LeftCol;
    try
      UpdateRowCount;
    finally
      LeftCol := OldLeftCol;
    end;
  end else
    UpdateRowCount;
  if RowDetailPanel.Active then
    UpdateRowDetailPanel;
  UpdateActive;
  Invalidate;
  if Selection.SelectionType = gstColumns
    then Selection.Columns.Refresh;

  UpdateFilterEdit(True);

  finally
    UnlockPaint;
    UpdateScrollRange;
  end;

  if LeftRightOutBound <> OutBoundaryData.LeftIndent + OutBoundaryData.RightIndent then
  begin
    DeferLayout;
  end;

  if FHorzScrollBarPanelControl.Visible then
    FHorzScrollBarPanelControl.DataSetChanged;
  if FVertScrollBarPanelControl.Visible then
    FVertScrollBarPanelControl.DataSetChanged;
end;

procedure TCustomDBGridEh.LayoutChanged;
begin
  inherited LayoutChanged;
end;

procedure TCustomDBGridEh.LinkActive(Value: Boolean);
begin
  if not Value and RowDetailPanel.Visible then RowDetailPanel.Visible := False;
  CheckIMemTable;
  Selection.LinkActive(Value);
  if (Assigned(DataSource))
    then SumList.DataSet := DataSource.DataSet
    else SumList.DataSet := nil;
  if ViewScroll then // Optimization
  begin
    if DataGrouping.IsGroupingWorks then
      DoSortMarkingChanged;
    if not (csLoading in ComponentState) then
{//tmp} MTViewDataEvent(-1, mtViewDataChangedEh, -1);
    UpdateRowCount;
  end;
  CheckReturnSearchPanelFilter;
  if csDestroying in ComponentState then
    Exit;

  inherited LinkActive(Value);

  UpdateScrollBar;
  CheckIMemTable;
  Columns.ActiveChanged;
  KeyProperyModified;
end;

procedure TCustomDBGridEh.Loaded;
var i: Integer;
begin
  UpdateColumnResizeOptions(Options, OptionsEh);
  if Columns.Count > 0 then
  begin
    ColCount := Columns.Count;
    if (FAutoFitColWidths = True) and not (csDesigning in ComponentState) then
    begin
      Columns.BeginUpdate;
      for i := 0 to Columns.Count - 1 do
      begin
        Columns[i].FInitWidth := Columns[i].Width;
      end;
      Columns.EndUpdate;
    end;
    SetSortMarkedColumns;
  end;

  inherited Loaded;
  DataGrouping.ResetGroupLevelNames;

  if Assigned(DataSource) then
    FSumList.Loaded;

  if (FNoDesigntControler = False) and
      Assigned(DBGridEhDesigntControler) and
      (csDesigning in ComponentState)
  then
  begin
    DBGridEhDesigntControler.KeyProperyModified(Self);
  end;
  if RowDetailPanel.Active and (csDesigning in ComponentState) then
  begin
    RowDetailPanel.Visible := True;
  end;

end;

procedure TCustomDBGridEh.ChangeScale(M, D: Integer);
var
  Flags: TScalingFlags;
  i, j: Integer;
  WidthInc, WidthIncScaled, OldWidthIncScaled: Integer;
begin
  if M <> D then
  begin
    if csLoading in ComponentState
      then Flags := ScalingFlags
      else Flags := [sfFont];
    if not ParentFont and (sfFont in Flags) then
    begin
      FooterFont.Size := MulDiv(FooterFont.Size, M, D);
    end;
    if sfFont in Flags then
    try
      WidthInc := 0;
      OldWidthIncScaled := 0;
      Columns.BeginUpdate;
      for i := 0 to Columns.Count - 1 do
        with Columns[i] do
        begin
          if cvFooterFont in Footer.AssignedValues
            then Footer.Font.Size := MulDiv(Footer.Font.Size, M, D);
          for j := 0 to Footers.Count - 1 do
            if cvFooterFont in Footers[j].AssignedValues then
              Footers[j].Font.Size := MulDiv(Footers[j].Font.Size, M, D);
          Inc(WidthInc, Width);
          WidthIncScaled := MulDiv(WidthInc, M, D);
          Width := WidthIncScaled - OldWidthIncScaled;
          OldWidthIncScaled := WidthIncScaled;
        end;

      if not DataGrouping.ParentFont then
        DataGrouping.Font.Size := MulDiv(DataGrouping.Font.Size, M, D);
      for i := 0 to DataGrouping.GroupLevels.Count - 1 do
        if not DataGrouping.GroupLevels[i].ParentFont then
          DataGrouping.GroupLevels[i].Font.Size := MulDiv(DataGrouping.GroupLevels[i].Font.Size, M, D);
      for i := 0 to DataGrouping.Footers.Count - 1 do
        if not DataGrouping.Footers[i].ParentFont then
          DataGrouping.Footers[i].Font.Size := MulDiv(DataGrouping.Footers[i].Font.Size, M, D);

    finally
      Columns.EndUpdate;
    end;
  end;
  inherited ChangeScale(M, D);
end;

procedure TCustomDBGridEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  OldCol, OldRow, Xm, Ym: Integer;
  EnableClick: Boolean;
  ARect, ButtonRect: TRect;
  Flag: Boolean;
  MouseDownEvent: TMouseEvent;
  APointInRect: Boolean;
  TargetWC: TWinControl;
  OldBM: TUniBookmarkEh;
  DrawInfo: TGridDrawInfoEh;
  EditButtonsWidth: Integer;
  AGridState: TGridState;
  ASizingIndex, ASizingPos, ASizingOfs: Integer;
  ADBGridEhState: TDBGridEhState;
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  StateRect: TRect;
  MouseDownInRowDetailSign: Boolean;
  Column: TColumnEh;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
  OutBRect: TRect;
begin
  if Assigned(DBGridEhDesigntControler) and
    DBGridEhDesigntControler.IsDesignHitTest(Self, X, Y, Shift)
  then
    DBGridEhDesigntControler.DesignMouseDown(Self, X, Y, Shift);
  if SearchEditorMode = True then
    SearchEditorMode := False;
  if Button = mbRight then MouseCapture := True;
  if csDesigning in ComponentState then
    FDSMouseCapture := True;
  FGroupDataMovingIndex := -1;
  FStartShiftState := Shift;
  Xm := X; Ym := Y;
  FPressedCell.X := -1; FPressedCell.Y := -1;
  FPressedDataCol := -1;
  FDownMousePos := Point(X, Y);
  MouseDownInRowDetailSign := False;
  if not AcquireFocus then Exit;
  Cell := MouseCoord(X, Y);
  FPressedCell := Cell;
  if (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
    if RowPanel.Active and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctTitleEh{, vctSubTitleEh, vctDataEh, vctFooterEh}]) then
    begin
      MouseDownInTitleRowPanel(Button, Shift, Xm, Ym);
      Exit;
    end else if DataGrouping.IsGroupingWorks and
       (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctDataEh]) then
    begin
      InstantReadRecordEnter(AreaRow);
      ADrawGroupDataNode := InstantReadCurDataNode;
      InstantReadRecordLeave;
      if ADrawGroupDataNode.NodeType = dntDataGroupEh then
      begin
        MouseDownInGroupDataCell(Button, Shift, Xm, Ym, ADrawGroupDataNode);
        Exit;
      end;
    end
  end;
  if OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtTopEh) and PtInRect(OutBRect, FDownMousePos) then
    MouseDownInOutBoundary(Button, Shift, X, Y)
  else if OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtLeftEh) and PtInRect(OutBRect, FDownMousePos) then
    MouseDownInOutBoundary(Button, Shift, X, Y)
  else if OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtBottomEh) and PtInRect(OutBRect, FDownMousePos) then
    MouseDownInOutBoundary(Button, Shift, X, Y)
  else if OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtRightEh) and PtInRect(OutBRect, FDownMousePos) then
    MouseDownInOutBoundary(Button, Shift, X, Y);

  if PtInRect(DataRect, Point(X, Y)) and FilterEditMode then
    StopEditFilter;
  if (ssDouble in Shift) and (Button = mbLeft) then
  begin
    Cell := MouseCoord(X, Y);
    CalcDrawInfo(DrawInfo);
    CalcSizingState(X, Y, AGridState, ASizingIndex, ASizingPos, ASizingOfs, DrawInfo);
    if (AGridState <> gsColSizing) then
    begin
      CalcFrozenSizingState(X, Y, ADBGridEhState, ASizingIndex, ASizingPos, ASizingOfs);
      if ADBGridEhState = dgsColSizing then
        AGridState := gsColSizing;
    end;
    if (AGridState = gsColSizing) and (dghDblClickOptimizeColWidth in OptionsEh) then
      OptimizeSelectedColsWidth(Columns[ASizingIndex - IndicatorOffset])
    else if (Cell.X > IndicatorOffset - 1) and (Cell.Y > TopDataOffset - 1) and
      (Cell.Y < RowCount) and
      (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes]) then
    begin
      if Columns[Cell.X - IndicatorOffset].DblClickNextVal and (ssDouble in Shift)
        then
        if (ssShift in Shift)
          then Columns[Cell.X - IndicatorOffset].SetNextFieldValue(-1)
          else Columns[Cell.X - IndicatorOffset].SetNextFieldValue(1);
    end;

    if not ((AGridState = gsColSizing) and (dghDblClickOptimizeColWidth in OptionsEh)) then
      DblClick;

    MouseDownEvent := OnMouseDown;
    if Assigned(MouseDownEvent)
      then MouseDownEvent(Self, Button, Shift, X, Y);
    Exit;
  end
  else if (Button = mbLeft) then
  begin
    {CalcFrozenSizingState(X, Y, FDBGridEhState, FSizingIndex, FSizingPos, FSizingOfs);
    if FDBGridEhState <> dgsNormal then
    begin
      if not (dghTraceColSizing in OptionsEh) then
        DrawSizingLine(GridWidth, GridHeight);
      Exit;
    end;}
  end;
  if Sizing(X, Y) then
  begin
    DataLink.UpdateData;

    if (dghTraceColSizing in OptionsEh) and (Button = mbLeft) then
    begin
      CalcDrawInfo(DrawInfo);
      { Check grid sizing }
      CalcSizingState(X, Y, FGridState, FSizingIndex, FSizingPos, FSizingOfs, DrawInfo);
      if FGridState = gsColSizing then
      begin
        LockGridHorzScotlling;
        if Self.UseRightToLeftAlignment then
          FSizingPos := ClientWidth - FSizingPos;
        Exit;
      end
      else
        inherited MouseDown(Button, Shift, X, Y);
    end else
      inherited MouseDown(Button, Shift, X, Y)
  end else
  begin
    Cell := MouseCoord(X, Y);
    ARect := CellRect(Cell.X, Cell.Y);

    if (IsUseMultiTitle = True) and (dgTitles in Options) then
    begin
      if (Cell.X > IndicatorOffset - 1) and
        (PtInRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X - IndicatorOffset].FLeaf.Height + 1),
        Point(X, Y)))
        then Flag := False
        else Flag := True;
    end
    else Flag := True;
    if GetCursor = hcrDownCurEh then //columns selection
    begin
      InvalidateCol(Cell.X);
      FDBGridEhState := dgsColSelecting;
      ResetTimer(60);
      if ssShift in Shift
        then Selection.Columns.SelectShift(Columns[Cell.X - IndicatorOffset] {,False})
      else if ssCtrl in Shift
        then Selection.Columns.InvertSelect(Columns[Cell.X - IndicatorOffset])
      else
      begin
        Invalidate;
        Selection.Columns.Select(Columns[Cell.X - IndicatorOffset], False);
      end;
      Exit;
    end
    else
      if {(Datalink <> nil) and Datalink.Active and}
        (Cell.Y < TopDataOffset) and (Cell.X >= IndicatorOffset) and
        not (csDesigning in ComponentState) and Flag then
      begin
        Column := Columns[Cell.X - IndicatorOffset];
        if GetMouseHitCellState(Cell, FDownMousePos, ARect, Column, StateRect) = dgsTitleFilterButtonDown then
        begin
          FTrackingStateRect := StateRect;
          if FInTitleFilterListboxVisible
            then InTitleFilterListboxCloseUp(False)
            else InTitleFilterListboxDropDown(Columns[Cell.X - IndicatorOffset]);
          InvalidateTitle;
          Exit;
        end else
(*        if (dghColumnMove in OptionsEh) and (Button = mbRight) then
        begin
          Button := mbLeft;
          FSwapButtons := True;
        //MouseCapture := True;
        end
        else*) if Button = mbLeft then
        begin
          EnableClick := Columns[Cell.X - IndicatorOffset].Title.TitleButton;
          CheckTitleButton(Cell.X - IndicatorOffset, EnableClick);
          if EnableClick then
          begin
          //MouseCapture := True;
            if not MouseCapture then Exit;
            FTracking := True;
            FPressedCol := Cell.X;
            FPressedDataCol := Cell.X - IndicatorOffset;
            TrackButton(X, Y);
            Exit;
          end;
        end;
      end;

    if {((csDesigning in ComponentState) or (dghColumnMove in OptionsEh)) and} (Cell.Y < TopDataOffset) then
    begin
      //d top-left cell
      if (Cell.X < FIndicatorOffset) and (Cell.Y  = 0)  then
      begin
        ARect := CellRect(Cell.X, Cell.Y);
        Center.IndicatorTitleMouseDown(Self, Cell, Button, Shift, Xm - ARect.Left, Ym - ARect.Top);
//        if IndicatorTitle.UseGlobalMenu or (IndicatorTitle.DropdownMenu <> nil) then
        InvalidateEditor;
      end;
      DataLink.UpdateData;
      Canvas.Pen.Color := clSilver; // Column move line fixup when no dgColLines
      inherited MouseDown(Button, Shift, X, Y)
    end
    else if (Cell.Y < RowCount) and (Cell.X < ColCount) then
    begin
      if DataLink.Active then
        with Cell do
        begin
          if CheckBeginRowMoving(Xm, Ym, False) then
            Exit;
          if CellTreeElementMouseDown(Xm, Ym, False) then
            Exit;
          if (X < FIndicatorOffset) and
             DataGrouping.IsGroupingWorksWithLevel then
          begin
            InstantReadRecordEnter(AreaRow);
            ADrawGroupDataNode := InstantReadCurDataNode;
            InstantReadRecordLeave;
            if (ADrawGroupDataNode <> nil) and (ADrawGroupDataNode.NodeType <> dntDataSetRecordEh) then
              Exit;
          end;
          BeginUpdate; { eliminates highlight flicker when selection moves }
          try
            if RowPanel.Active and (CellAreaType.HorzType = hctDataEh) then
              MouseDownInDataRowPanel(Button, Shift, Xm, Ym)
            else
            begin
            DataLink.UpdateData; // validate before moving
            HideEditor;
            OldCol := Col;
            OldRow := Row;
            OldBM := DataSource.DataSet.Bookmark;

            FLockAutoShowCurCell := True;
            if RowDetailPanel.Active and CheckMouseDownInRowDetailSign(Button, Shift, Xm, Ym) then
              MouseDownInRowDetailSign := True;
            if (Y >= TopDataOffset) and (Y - Row <> 0) then
              if not ((ssShift in Shift) and (dgMultiSelect in Options)
                and ((dgRowSelect in Options) or (X < FIndicatorOffset)))
              then
                MoveBy(Y - Row);
            FLockAutoShowCurCell := False;
            if MouseDownInRowDetailSign then
            begin
              RowDetailPanel.Visible := not RowDetailPanel.Visible;
              Exit;
            end;
            if (X >= FIndicatorOffset) and (X < ColCount) then
              MoveCol(RawToDataColumn(X), 0, False);
            if not MouseCapture then Exit;
            if FAutoDrag and not (ssShift in Shift) and (Button = mbLeft) and (X >= FIndicatorOffset) and
              Selection.DataCellSelected(Cell.X - IndicatorOffset, DataSource.DataSet.Bookmark) then
            begin
              FSelectedCellPressed := True;
              Exit;
            end;
            if PtInRect(DataRect, Point(Xm, Ym)) and
              (not (dgMultiSelect in Options) or
              ((dgMultiSelect in Options) and not (dgRowSelect in Options))) then
            begin
//              MouseCapture := True;
              if not MouseCapture then Exit;
              FTracking := True;
              FDataTracking := True;
              if not (ssCtrl in Shift) and not (ssShift in Shift) and (dghClearSelection in OptionsEh) and
                ((Button = mbLeft) or (not Selection.DataCellSelected(Cell.X - IndicatorOffset, DataSource.DataSet.Bookmark))) then {FBookmarks.Clear}
                CheckClearSelection;
              if (X >= FIndicatorOffset) and CanSelectType(gstRectangle) {(dgMultiSelect in Options)} and
                (Button = mbLeft) and not (DataSource.DataSet.Eof and DataSource.DataSet.Bof) then
              begin
                if ssShift in Shift then
                  if Selection.SelectionType = gstRectangle then
                    Selection.Rect.Select(Cell.X - IndicatorOffset, DataSource.DataSet.Bookmark, True)
                  else
                  begin
                    Selection.Rect.Select(OldCol - IndicatorOffset, OldBM, False);
                    Selection.Rect.Select(Cell.X - IndicatorOffset, DataSource.DataSet.Bookmark, True);
                  end
                else if dghClearSelection in OptionsEh then
                  Selection.Clear;
                FDBGridEhState := dgsRectSelecting;
              end;
            end;
            if CanSelectType(gstRecordBookmarks)
              and (((dgRowSelect in Options) and not (gioShowRowselCheckboxesEh in IndicatorOptions))
                or (X < FIndicatorOffset)
                or (not CanSelectType(gstRectangle) and not (gioShowRowselCheckboxesEh in IndicatorOptions))
                  ) then
              with FBookmarks do
              begin
                FSelecting := False;
                if (gioShowRowselCheckboxesEh in IndicatorOptions) then
                begin
                  ARect := CellRect(Cell.X, Cell.Y);
                  if UseRightToLeftAlignment then
                  begin
                    if gioShowRowIndicatorEh in IndicatorOptions then
                      ARect.Left := ARect.Left + IndicatorWidth;
                    ARect.Right := ARect.Left + FRowselCheckboxesWidth;
                  end else
                  begin
                    if gioShowRowIndicatorEh in IndicatorOptions then
                      ARect.Right := ARect.Right - IndicatorWidth;
                    ARect.Left := ARect.Right - FRowselCheckboxesWidth;
                  end;
                  if PtInRect(ARect, Point(Xm, Ym)) then
                    if (ssShift in Shift) and (Y - Row <> 0) then
                    begin
                      FSelecting := True;
                      FAntiSelection := True;
                      DoSelection(True, Y - Row, False, True);
                    end else
                      CurrentRowSelected := not CurrentRowSelected;
                  FSelectionAnchorSelected := not CurrentRowSelected;
                  FSelectionAnchor := FBookmarks.CurrentRow;
                end else
                begin
                  if (ssShift in Shift) and (Y - Row <> 0) then
                  begin
                    FSelecting := True;
                    FAntiSelection := True;
                    DoSelection(True, Y - Row, False, True);
                  end
                  else if ((ssCtrl in Shift) or not (dghClearSelection in OptionsEh)) and (Button = mbLeft)
                    then CurrentRowSelected := not CurrentRowSelected
                  else
                  begin
                    if (Button = mbLeft) then
                    begin
                      if dghClearSelection in OptionsEh then CheckClearSelection; //newClear;
                      CurrentRowSelected := True;
                    end;
                  end;
                  if (dgRowSelect in Options) or not CanSelectType(gstRectangle) or
                    ((X < FIndicatorOffset) and not (dgRowSelect in Options)) then
                  begin
                    FIndicatorPressed := True;
  //                  MouseCapture := True;
                    if not MouseCapture then Exit;
                    FTracking := True;
                    FSelecting := True;
                    FSelectionAnchorSelected := not CurrentRowSelected;
                    FSelectionAnchor := FBookmarks.CurrentRow;
                    FAntiSelection := (ssCtrl in Shift) or not (dghClearSelection in OptionsEh);
                    FDBGridEhState := dgsRowSelecting;
                  end;
                end;
              end;

            if (Button = mbLeft) and CanEditorMode and
              (((X = OldCol) and (Y = OldRow)) or (dgAlwaysShowEditor in Options)) then
              ShowEditor; { put grid in edit mode }

            if (Button = mbLeft) and (Cell.X > IndicatorOffset - 1) then
            begin

              EditButtonsWidth := Columns[Cell.X - IndicatorOffset].EditButtonsWidth;
              if Self.UseRightToLeftAlignment
                then ButtonRect := Rect(ARect.Left, ARect.Top, ARect.Left + EditButtonsWidth, ARect.Bottom)
                else ButtonRect := Rect(ARect.Right - EditButtonsWidth, ARect.Top, ARect.Right, ARect.Bottom);
              APointInRect := PointInRect(Point(Xm, Ym), ButtonRect);
              if (dgAlwaysShowEditor in Options) or ((EditButtonsWidth > 0) and APointInRect) or
                ((X = OldCol) and (Y = OldRow))
                then ShowEditor;

              if (InplaceEditor <> nil) and InplaceEditor.Visible and
                APointInRect and (Y >= TopDataOffset) and (X >= FIndicatorOffset) then
              begin
                if (Cell.X > IndicatorOffset - 1) and (EditButtonsWidth > 0) {(GetColumnEditStile(Columns[Cell.X - IndicatorOffset]) <> esSimple)} then
                begin
                  StopTracking;
                  TargetWC := FindVCLWindow(ClientToScreen(Point(Xm, Ym)));
                  if (TargetWC <> nil) and (TargetWC <> Self) then
                    TargetWC.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
                      SmallPointToInteger(PointToSmallPoint(TargetWC.ScreenToClient(ClientToScreen(Point(Xm, Ym))))));
                end;
              end;


              if (Cell.X > IndicatorOffset - 1) and
                (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes])
                then FPressedCell := Cell;

            end else
              InvalidateEditor; { draw editor, if needed }
            end;
          finally
            EndUpdate;
          end;
        end;
      MouseDownEvent := OnMouseDown;
      if Assigned(MouseDownEvent) then MouseDownEvent(Self, Button, Shift, X, Y);
    end else
    begin
      MouseDownEvent := OnMouseDown;
      if Assigned(MouseDownEvent) then
        MouseDownEvent(Self, Button, Shift, X, Y);
    end;
  end;
end;

procedure TCustomDBGridEh.MouseDownInDataRowPanel(Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  ARect: TRect;
  i, OldRigth: Integer;
  Column: TColumnEh;
  ACellRect: TRect;
begin
  Cell := MouseCoord(X, Y);
  if (Cell.X < 0) or (Cell.Y < 0) then Exit;
  ARect := CellRect(Cell.X, Cell.Y);

  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    ACellRect := Rect(Column.FRowPlacement.DataCellLeft, Column.FRowPlacement.Top,
      Column.FRowPlacement.DataCellLeft + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    if Self.UseRightToLeftAlignment then
    begin
      OldRigth := ACellRect.Right;
      ACellRect.Right := ARect.Right - ACellRect.Left;
      ACellRect.Left := ARect.Right - OldRigth;
      OffsetRect(ACellRect, FDataOffset.cx, 0);
      OffsetRect(ACellRect, 0, ARect.Top);
    end else
    begin
      OffsetRect(ACellRect, -FDataOffset.cx, 0);
      OffsetRect(ACellRect, ARect.Left, ARect.Top);
    end;

    if PointInRect(Point(X, Y), ACellRect) then
    begin
      MouseDownInDataCell(Button, Shift, X, Y, Cell, Column,
        ACellRect, X-ACellRect.Left, Y-ACellRect.Top);
      Exit;
    end;
  end;
end;

procedure TCustomDBGridEh.MouseDownInDataCell(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer; Cell: TGridCoord; Column: TColumnEh;
  ACellRect: TRect; InCellX, InCellY: Integer);
var
  OldCol, OldRow: Integer;
  ColIndex: Integer;
  EditButtonsWidth: Integer;
  ButtonRect: TRect;
  APointInRect: Boolean;
  TargetWC: TWinControl;
begin
  DataLink.UpdateData; // validate before moving
  HideEditor;
  ColIndex := Column.Index;
  FPressedDataCol := ColIndex;
  OldCol := SelectedIndex;
  OldRow := Row;
  if (Cell.Y >= FTitleOffset) and (Cell.Y - Row <> 0) then
  begin
    FLockAutoShowCurCell := True;
    try
      MoveBy(Cell.Y - Row);
    finally
      FLockAutoShowCurCell := False;
    end;
  end;
  if ColIndex >= 0 then
    MoveCol(ColIndex, 0, False);
  ColIndex := SelectedIndex;
  if (Button = mbLeft) and
     (dgMultiSelect in Options) and
     (dgRowSelect in Options) and
     DataLink.Active then
    with FBookmarks do
    begin
      FSelecting := False;
      if ssCtrl in Shift then
        CurrentRowSelected := not CurrentRowSelected
      else
      begin
        Clear;
        CurrentRowSelected := True;
      end;
    end;

  if (Button = mbLeft) and
      CheckDataCellMouseDownInRowDetailSign(Button, Shift, X, Y,
      Cell, Column, ACellRect, InCellX, InCellY) then
  begin
    RowDetailPanel.Visible := not RowDetailPanel.Visible;
    Exit;
  end;

  if (Button = mbLeft) and
    (((ColIndex = OldCol) and (Cell.Y = OldRow)) or (dgAlwaysShowEditor in Options)) then
    ShowEditor         { put grid in edit mode }
  else
    InvalidateEditor;  { draw editor, if needed }

  if Button = mbLeft then
  begin

    EditButtonsWidth := Column.EditButtonsWidth;
    if Column.UseRightToLeftAlignment
      then ButtonRect := Rect(ACellRect.Left, ACellRect.Top,
                              ACellRect.Left + EditButtonsWidth, ACellRect.Bottom)
      else ButtonRect := Rect(ACellRect.Right - EditButtonsWidth,
                              ACellRect.Top, ACellRect.Right, ACellRect.Bottom);
    APointInRect := PointInRect(Point(X, Y), ButtonRect);
    if (dgAlwaysShowEditor in Options) or ((EditButtonsWidth > 0) and APointInRect) or
      ((ColIndex = OldCol) and (Cell.Y = OldRow))
      then ShowEditor;

    if (InplaceEditor <> nil) and InplaceEditor.Visible and APointInRect then
    begin
      if EditButtonsWidth > 0 then
      begin
        StopTracking;
        TargetWC := FindVCLWindow(ClientToScreen(Point(X, Y)));
        if (TargetWC <> nil) and (TargetWC <> Self) then
          TargetWC.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
            SmallPointToInteger(PointToSmallPoint(TargetWC.ScreenToClient(ClientToScreen(Point(X, Y))))));
      end;
    end;


    if (Cell.X > IndicatorOffset - 1) and
      (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes])
      then FPressedCell := Cell;
  end;
end;

procedure TCustomDBGridEh.ExpandCellWidthForEmptySpace(ColumnIndex: Integer);
var
  i, k: Integer;
  Column: TColumnEh;
  ATargetRight: Integer;
  MaxLeft: Integer;
  TargetColumn: TColumnEh;
begin
  TargetColumn := Columns[ColumnIndex];
  ATargetRight := TargetColumn.FRowPlacement.Left + TargetColumn.FRowPlacement.Width;
  if dgColLines in Options then Inc(ATargetRight, GridLineWidth);
  MaxLeft := FGridMasterCellWidth;

  for k := TargetColumn.InRowLinePos
    to TargetColumn.InRowLinePos + TargetColumn.InRowLineHeight - 1 do
  begin
    for i := 0 to Columns.Count-1 do
    begin
      Column := Columns[i];
      if (Column.InRowLinePos <= k) and
         (Column.InRowLinePos + Column.InRowLineHeight - 1 >= k) and
         (Column.FRowPlacement.Left >= ATargetRight) and
         (Column.FRowPlacement.Left < MaxLeft)
      then
        MaxLeft := Column.FRowPlacement.Left;
    end;
  end;
  if MaxLeft > ATargetRight then
  begin
    if MaxLeft = FGridMasterCellWidth
      then TargetColumn.Width := TargetColumn.Width + (MaxLeft - ATargetRight) + 1
      else TargetColumn.Width := TargetColumn.Width + (MaxLeft - ATargetRight)
  end;
end;

procedure TCustomDBGridEh.MouseDownInTitleRowPanel(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  ARect: TRect;
  Column: TColumnEh;
  ACellRect: TRect;
  AState: TGridState;
  AIndex: Longint;
  ASizingPos, ASizingOfs: Integer;
  ADrawInfo: TGridDrawInfoEh;
  InCellPos: TPoint;
begin
  if Sizing(X,Y) then
  begin
    if ssDouble in Shift then
    begin
      CalcDrawInfo(ADrawInfo);
      CalcSizingStateForRowPanel(X, Y, AState, AIndex, ASizingPos, ASizingOfs, ADrawInfo);
      if AState = gsColSizing then
        ExpandCellWidthForEmptySpace(AIndex);
    end else
      inherited MouseDown(Button, Shift, X, Y);
    Exit;
  end;
  Cell := MouseCoord(X, Y);
  ARect := CellRect(Cell.X, Cell.Y);
  if (Cell.Y < TopDataOffset) and (Cell.X >= IndicatorOffset) then
  begin
    (*if (dghColumnMove in OptionsEh) and (Button = mbRight) then
    begin
//      Button := mbLeft;
      FSwapButtons := True;
    end
    else*) if Button = mbLeft then
    begin
      InCellPos := Point(X - ARect.Left + FDataOffset.cx, Y - ARect.Top);
      if UseRightToLeftAlignment then
        InCellPos.X := FGridMasterCellWidth - (ARect.Right - X) - FDataOffset.cx;
      Column := GetColumnInRowPanelAtPos(InCellPos, True);
      if Column <> nil then
        MouseDownInTitleCell(Button, Shift, X, Y, Cell, Column,
            ACellRect, X-ACellRect.Left, Y-ACellRect.Top);
    end;
  end;
end;

procedure TCustomDBGridEh.MouseDownInTitleCell(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Cell: TGridCoord;
  Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
var
  EnableClick: Boolean;
  StateRect: TRect;
  MasterCellRect: TRect;
begin
  FPressedDataCol := Column.Index;
  EnableClick := Column.Title.TitleButton;
  MasterCellRect := CellRect(Cell.X, Cell.Y);
  if (GetMouseHitCellState(Cell, FDownMousePos, MasterCellRect, Column, StateRect) = dgsTitleFilterButtonDown)
    and not (csDesigning in ComponentState) then
  begin
    FTrackingStateRect := StateRect;
    if FInTitleFilterListboxVisible
      then InTitleFilterListboxCloseUp(False)
      else InTitleFilterListboxDropDown(Column);
     InvalidateTitle;
  end else
  begin
    CheckTitleButton(Cell.X - IndicatorOffset, EnableClick);
  if EnableClick and not (csDesigning in ComponentState) then
  begin
      if not MouseCapture then Exit;
      FTracking := True;
      FPressedCol := Cell.X;
      TrackButton(X, Y);
      Exit;
    end;
  end;
end;

function TCustomDBGridEh.CalcRectForGroupCell(ACol, ARow: Longint; AreaCol, AreaRow: Longint): TRect;
var
  i: Integer;
  ARect1: TRect;
begin
  ARect1 := CellRect(ACol, ARow);
  for i := ACol - 1 downto FixedCols do
  begin
    if UseRightToLeftAlignment
      then Inc(ARect1.Right, ColWidths[i] + GridLineWidth)
      else Dec(ARect1.Left, ColWidths[i] + GridLineWidth);
  end;

  if UseRightToLeftAlignment then
  begin
    Inc(ARect1.Right, FDataOffset.cx);
    Inc(ARect1.Left, FDataOffset.cx);
  end else
  begin
    Dec(ARect1.Right, FDataOffset.cx);
    Dec(ARect1.Left, FDataOffset.cx);
  end;
  for i := ACol to LeftCol + VisibleColCount do
  begin
    if UseRightToLeftAlignment
      then Dec(ARect1.Left, ColWidths[i] + GridLineWidth)
      else Inc(ARect1.Right, ColWidths[i] + GridLineWidth);
  end;

  Result := ARect1;
end;

procedure TCustomDBGridEh.MouseDownInGroupDataCell(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; ADrawGroupDataNode: TGroupDataTreeNodeEh);
var
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  Cell: TGridCoord;
  GroupRect: TRect;
  RowDetailPanelWasVisible: Boolean;
  ACurGroupDataNode: TGroupDataTreeNodeEh;
begin
  if FilterEditMode then
    StopEditFilter;
  Cell := MouseCoord(X, Y);
  CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
  GroupRect := CalcRectForGroupCell(Cell.X, Cell.Y, AreaCol, AreaRow);
  if ADrawGroupDataNode.Level > 1 then
    if UseRightToLeftAlignment
      then GroupRect.Right := GroupRect.Right - (ADrawGroupDataNode.Level-1)*18
      else GroupRect.Left := GroupRect.Left + (ADrawGroupDataNode.Level-1)*18;
  if not UseRightToLeftAlignment and (GroupRect.Left <= X) and (GroupRect.Left + 18 >= X) or
         UseRightToLeftAlignment and (GroupRect.Right >= X) and (GroupRect.Right - 18 <= X) then
  begin
    RowDetailPanelWasVisible := RowDetailPanel.Visible;
    ACurGroupDataNode := FCurGroupDataNode;
    if RowDetailPanel.Visible then
      RowDetailPanel.Visible := False;
    if ssCtrl in Shift then
      if ADrawGroupDataNode.Expanded
        then ADrawGroupDataNode.DataGroupLevel.CollapseNodes
        else ADrawGroupDataNode.DataGroupLevel.ExtractNodes
      else ADrawGroupDataNode.Expanded := not ADrawGroupDataNode.Expanded;
    CheckSetCurGroupDataNode(FCurGroupDataNode, False);
    if RowDetailPanelWasVisible and (FCurGroupDataNode = ACurGroupDataNode) then
      RowDetailPanel.Visible := True;
  end else if X > GroupRect.Left + 18 then
    MoveBy(Cell.Y - Row);
end;

procedure TCustomDBGridEh.StartRowPanelTitleCellDragBox(Shift: TShiftState;
  X, Y, ColumnIndex: Integer; TitleRect: TRect);
var
  ACellRect: TRect;
  DragBoxTopLeft: TPoint;
  OldRigth: Integer;
  ADownMousePos, AMoveMousePos: TPoint;
begin
  ACellRect := CellRect(IndicatorOffset, 0);
  ADownMousePos := FDownMousePos;
  AMoveMousePos := FMoveMousePos;
  if Self.UseRightToLeftAlignment then
  begin
    OldRigth := ACellRect.Right;
    ACellRect.Right := ClientWidth - ACellRect.Left;
    ACellRect.Left := ClientWidth - OldRigth;
    ADownMousePos.X := ClientWidth - ADownMousePos.X;
    AMoveMousePos.X := ClientWidth - AMoveMousePos.X;
  end;
  if FTracking and (FPressedCol <> -1) then
  begin
    StopTracking;
    Update;
    MouseCapture := True;
    FPressedDataCol := ColumnIndex;
  end;
  FGridState := gsColMoving;
  FToMoveColumnIndex := ColumnIndex;
  FToMoveInRowLinePos := Columns[ColumnIndex].InRowLinePos;
  FTopLeftCellOffset :=
    Point(TitleRect.Left - ADownMousePos.X + ACellRect.Left - FDataOffset.cx,
          TitleRect.Top - ADownMousePos.Y + ACellRect.Top);
  DrawMoveLineOrTitleCell(True);

  FDragCellRect.Left := AMoveMousePos.X + FTopLeftCellOffset.X;
  FDragCellRect.Top := AMoveMousePos.Y + FTopLeftCellOffset.Y;
  FDragCellRect.Right := FDragCellRect.Left + TitleRect.Right - TitleRect.Left;
  FDragCellRect.Bottom := FDragCellRect.Top + TitleRect.Bottom - TitleRect.Top;

  DragBoxTopLeft := FDragCellRect.TopLeft;
  if Self.UseRightToLeftAlignment then
    DragBoxTopLeft.X := ClientWidth - DragBoxTopLeft.X - TitleRect.Right - TitleRect.Left;

  GetDragBoxEh.StartShow(Self, DragBoxTopLeft,
    TitleRect.Right - TitleRect.Left,
    TitleRect.Bottom - TitleRect.Top);
end;

procedure TCustomDBGridEh.StartRowPanelTitleCellDrag(Shift: TShiftState;
  X, Y, ColumnIndex: Integer);
var
  TitleRect: TRect;
begin
  TitleRect.Left := Columns[ColumnIndex].FRowPlacement.Left;
  TitleRect.Top := Columns[ColumnIndex].FRowPlacement.Top;
  TitleRect.Right := TitleRect.Left + Columns[ColumnIndex].FRowPlacement.Width;
  TitleRect.Bottom := TitleRect.Top + Columns[ColumnIndex].FRowPlacement.Height;
  StartRowPanelTitleCellDragBox(Shift, X, Y, ColumnIndex, TitleRect);
end;

procedure TCustomDBGridEh.GoRowPanelTitleCellDrag(Shift: TShiftState; X, Y: Integer);
var
  NewToMoveColumnIndex: Integer;
  NewToMoveInRowLinePos: Integer;
  ARect: TRect;
  i: Integer;
  Column: TColumnEh;
  ACellRect: TRect;
  MinRight: Integer;
  NewDragCellRect: TRect;
  OldColDataOffset: Integer;
  DragBoxTopLeft: TPoint;
  OldRigth: Integer;
  ADownMousePos, AMoveMousePos: TPoint;
  OutBRect: TRect;
  YTop: Integer;

  procedure DragAndMove;
  var
    P: TPoint;
  begin
    FDragCellRect := NewDragCellRect;
    OldColDataOffset := FDataOffset.cx;
    if AMoveMousePos.X > ADownMousePos.X
      then SafeSmoothScrollData(GetHorzScrollStep div 2, 0)
      else SafeSmoothScrollData(- GetHorzScrollStep div 2, 0);
    if OldColDataOffset <> FDataOffset.cx then
    begin
      Update;
      NewDragCellRect.Left := AMoveMousePos.X + FTopLeftCellOffset.X;
      P := Point(NewDragCellRect.Left, 0);
      ClientToScreen(P);
      NewDragCellRect.Left := P.X;
      NewDragCellRect.Right := NewDragCellRect.Left +
                               Columns[FPressedDataCol].FRowPlacement.Width;
      ResetTimer(60);
      DrawMoveLineOrTitleCell(True);
    end;
    DragBoxTopLeft := Point(FDragCellRect.Left, FDragCellRect.Top);
    if Self.UseRightToLeftAlignment then
      DragBoxTopLeft.X := ClientWidth - DragBoxTopLeft.X -
                          Columns[FPressedDataCol].FRowPlacement.Width;
    GetDragBoxEh.MoveToFor(Self, DragBoxTopLeft);
  end;
begin

  YTop := Y + FTopLeftCellOffset.Y;
  if YTop < 0 then
    YTop := 0;
  ARect := CellRect(IndicatorOffset, 0);
  ADownMousePos := FDownMousePos;
  AMoveMousePos := FMoveMousePos;

  if Self.UseRightToLeftAlignment then
  begin
    OldRigth := ARect.Right;
    ARect.Right := ClientWidth - ARect.Left;
    ARect.Left := ClientWidth - OldRigth;
    ADownMousePos.X := ClientWidth - ADownMousePos.X;
    AMoveMousePos.X := ClientWidth - AMoveMousePos.X;
    X := ClientWidth - X;
  end;

  if OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtTopEh) then
  begin
    if PtInRect(OutBRect, Point(X,Y)) then
    begin
      StartGroupPanelTitleMovingMode(Shift, X, Y);
      Exit;
    end;
  end;

  NewToMoveColumnIndex := -1;
  NewToMoveInRowLinePos := (YTop - ARect.Top) div InRowPanelLineHeight;
  if NewToMoveInRowLinePos > FGridMasterCellHeight div InRowPanelLineHeight then
    NewToMoveInRowLinePos := FGridMasterCellHeight  div InRowPanelLineHeight;
  MinRight := 0;
  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    ACellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
      Column.FRowPlacement.Left + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    OffsetRect(ACellRect, ARect.Left, ARect.Top);
    OffsetRect(ACellRect, -FDataOffset.cx, 0);

    if (YTop >= ACellRect.Top) and (YTop <= ACellRect.Bottom) and
       (ACellRect.Right < X) and (ACellRect.Right > MinRight) then
    begin
      MinRight := ACellRect.Right;
      NewToMoveColumnIndex := i;
      NewToMoveInRowLinePos := (YTop - ARect.Top) div InRowPanelLineHeight;
      if NewToMoveInRowLinePos > FGridMasterCellHeight div InRowPanelLineHeight then
        NewToMoveInRowLinePos := FGridMasterCellHeight div InRowPanelLineHeight;
    end;
  end;

  NewDragCellRect.Left := AMoveMousePos.X + FTopLeftCellOffset.X;
  NewDragCellRect.Top := AMoveMousePos.Y + FTopLeftCellOffset.Y;
  NewDragCellRect.Right := NewDragCellRect.Left + Columns[FPressedDataCol].FRowPlacement.Width;
  NewDragCellRect.Bottom := NewDragCellRect.Top + Columns[FPressedDataCol].FRowPlacement.Height;

  if (FDragCellRect.Left <> NewDragCellRect.Left) or
     (FDragCellRect.Top <> NewDragCellRect.Top) then
  begin
    if (NewDragCellRect.Left < 0) and (AMoveMousePos.X < ADownMousePos.X) then
    begin
      DragAndMove;
    end else if (NewDragCellRect.Right > ClientWidth) and
      (AMoveMousePos.X > ADownMousePos.X)  then
    begin
      DragAndMove;
    end else
    begin
      StopTimer;
      FDragCellRect := NewDragCellRect;

      DragBoxTopLeft := Point(FDragCellRect.Left, FDragCellRect.Top);
      if Self.UseRightToLeftAlignment then
        DragBoxTopLeft.X := ClientWidth - DragBoxTopLeft.X -
                            Columns[FPressedDataCol].FRowPlacement.Width;
      GetDragBoxEh.MoveToFor(Self, DragBoxTopLeft);
    end;
  end else if TimerActive then
  begin
    DragAndMove;
  end;

  if ((NewToMoveColumnIndex <> FToMoveColumnIndex) or (NewToMoveInRowLinePos <> FToMoveInRowLinePos))
    and (NewToMoveColumnIndex <> FPressedDataCol) then
  begin
    DrawMoveLineOrTitleCell(True);
    FToMoveColumnIndex := NewToMoveColumnIndex;
    FToMoveInRowLinePos := NewToMoveInRowLinePos;

    DrawMoveLineOrTitleCell(True);
  end;
end;

procedure TCustomDBGridEh.StopRowPanelTitleCellDrag(Shift: TShiftState; X, Y: Integer; IsAccept: Boolean);
var
  Column: TColumnEh;

  function GeLastIndexFor(AIndex: Integer): Integer;
  var
    i: Integer;
    LastRight: Integer;
  begin
    Result := AIndex;
    if Result < 0 then Exit;
    LastRight := Columns[AIndex].FRowPlacement.Left + Columns[AIndex].FRowPlacement.Width;
    for i := 0 to Columns.Count-1 do
    begin
      if (i <> AIndex) and
         (Columns[i].FRowPlacement.Left + Columns[i].FRowPlacement.Width <= LastRight) and
         (i > Result)
      then
        Result := i;
    end;
  end;
begin
  GetMoveLineEh.Hide;
  GetDragBoxEh.Hide;
  FGridState := gsNormal;
  if IsAccept and (FToMoveColumnIndex <> FPressedDataCol) then
  begin
    Columns.BeginUpdate;
    try
      Column := Columns[FPressedDataCol];
      Column.InRowLinePos := FToMoveInRowLinePos;
      FToMoveColumnIndex := GeLastIndexFor(FToMoveColumnIndex);
      if (FToMoveColumnIndex <= FPressedDataCol) and (FToMoveColumnIndex < Columns.Count-1)
        then Column.Index := FToMoveColumnIndex + 1
        else Column.Index := FToMoveColumnIndex;
      if FGroupDataMovingIndex >= 0 then
      begin
        Column.Visible := True;
        DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Destroy;
      end;
    finally
      Columns.EndUpdate;
    end;
  end;
end;

procedure TCustomDBGridEh.DrawMoveLineOrTitleCell(IsDrawLine: Boolean);
var
  OldPen: TPen;
  Pos: Integer;
  ACellRect: TRect;
  StartPos, FinishPos: Integer;
  OneLineHeight: Integer;
  DragBoxTopLeft: TPoint;
  OldRigth: Integer;
begin
  ACellRect := CellRect(IndicatorOffset, 0);
  if Self.UseRightToLeftAlignment then
  begin
    OldRigth := ACellRect.Right;
    ACellRect.Right := ClientWidth - ACellRect.Left;
    ACellRect.Left := ClientWidth - OldRigth;
  end;

  OneLineHeight := InRowPanelLineHeight;
  if dgColLines in Options then Inc(OneLineHeight, GridLineWidth);
  StartPos := OneLineHeight * FToMoveInRowLinePos;
  FinishPos := StartPos + Columns[FPressedDataCol].FRowPlacement.Height;

  if FToMoveColumnIndex = -1 then
    Pos := ACellRect.Left-1
  else
  begin
    Pos := Columns[FToMoveColumnIndex].FRowPlacement.Left +
           Columns[FToMoveColumnIndex].FRowPlacement.Width;
    Inc(Pos, ACellRect.Left);
    Inc(Pos, -FDataOffset.cx);
  end;

  Inc(StartPos, ACellRect.Top);
  Inc(FinishPos, ACellRect.Top);

  OldPen := TPen.Create;
  try
    with Canvas do
    begin
      OldPen.Assign(Pen);
      try
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Color := clGray;
        Brush.Color := clGray;
        if IsDrawLine then
        begin
          begin
            DragBoxTopLeft := Point(Pos, StartPos);
            if Self.UseRightToLeftAlignment then
              DragBoxTopLeft.X := ClientWidth - DragBoxTopLeft.X;
            if GetMoveLineEh.Visible then
              GetMoveLineEh.MoveToFor(Self, DragBoxTopLeft)
            else
              GetMoveLineEh.StartShow(Self, DragBoxTopLeft, True, FinishPos-StartPos);
          end;
        end else
        begin
          Pen.Width := 1;
          Pen.Style := psSolid;
          begin
            Rectangle(FDragCellRect);
          end;
        end;
      finally
        Canvas.Pen := OldPen;
      end;
    end;
  finally
    OldPen.Free;
  end;
end;


procedure TCustomDBGridEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  X1, Y1: Integer;
  WithSeleting: Boolean;
  OldMoveMousePos: TPoint;
  AddSel: Boolean;
  DrawInfo: TGridDrawInfoEh;
  NewSize: Integer;
  CellHit: TGridCoord;
  OutBRect: TRect;

  function ResizeLine(const AxisInfo: TGridAxisDrawInfoEh): Integer;
  var
    I: Integer;
  begin
    with AxisInfo do
    begin
      if FSizingIndex >= GridCellCount then
      begin
        Result := ContraExtent - EffectiveLineWidth;
        for I := GridCellCount to FSizingIndex do
          Inc(Result, AxisInfo.GetExtent(I) + EffectiveLineWidth);
        Result := Result - FSizingPos;
      end else
      begin
        if FSizingIndex < FixedCols then
        begin
          Result := 0;
          for I := 0 to FSizingIndex - 1 do
            Inc(Result, GetExtent(I) + EffectiveLineWidth);
          Result := FSizingPos - Result;
        end else
        begin
          Result := FixedBoundary - DataOffset;
          for I := FirstGridCell to FSizingIndex - 1 do
            Inc(Result, GetExtent(I) + EffectiveLineWidth);
          Result := FSizingPos - Result;
        end;
      end;
    end;
  end;

  function CanStartRowPanelTitleCellDrag: Boolean;
  begin
    if csDesigning in ComponentState then
    begin
      Result :=
        RowPanel.Active and FDSMouseCapture and (FPressedDataCol >= 0) and (FPressedCell.Y = 0)
        and (GetTitleRows > 0) and (FGridState = gsNormal) and (FDBGridEhState = dgsNormal)
        and ((Abs(FDownMousePos.Y - Y) > 3) or (Abs(FDownMousePos.X - X) > 3));
    end else
      Result :=
        RowPanel.Active and MouseCapture and (FPressedDataCol >= 0) and (FPressedCell.Y = 0)
        and (GetTitleRows > 0) and (dghColumnMove in OptionsEh) and (FGridState = gsNormal)
        and (FDBGridEhState = dgsNormal)
        and ((Abs(FDownMousePos.Y - Y) > 3) or (Abs(FDownMousePos.X - X) > 3));
  end;

  function CanTraceColSizing: Boolean;
  begin
    Result := (dghTraceColSizing in OptionsEh) and not RowPanel.Active;
  end;

begin
  X1 := X; Y1 := Y;
  OldMoveMousePos := FMoveMousePos;
  FMoveMousePos := Point(X, Y);
  Cell := MouseCoord(X1, Y1);
  if FSelectedCellPressed = True then
  begin
    FSelectedCellPressed := False;
    BeginDrag(Mouse.DragImmediate, Mouse.DragThreshold);
    BeginDrag(True);
    Exit;
  end;
  if CanStartRowPanelTitleCellDrag then
  begin
    StartRowPanelTitleCellDrag(Shift, X, Y, FPressedDataCol);
    Exit;
  end else if RowPanel.Active and MouseCapture and (FGridState = gsColMoving) then
  begin
    GoRowPanelTitleCellDrag(Shift, X, Y);
    Exit;
  end;

  if (FTracking) and (FPressedCol <> -1) then
  begin
    TrackButton(X, Y);
    if FDBGridEhState in [dgsTitleDown, dgsTitleFilterButtonDown] then
//    Nothing to do
    else if ((Abs(FDownMousePos.X - X) > 3) or (Abs(FDownMousePos.Y - Y) > 3))
        and (dghColumnMove in OptionsEh) then
    begin
      StopTracking;
 //     Perform(WM_LBUTTONDOWN,MK_LBUTTON,MakeWord(FMousePos.X,FMousePos.Y));
      if csCaptureMouse in ControlStyle then MouseCapture := True;
//      if csClickEvents in ControlStyle then Include(ControlState, csClicked);
      Canvas.Pen.Color := clSilver; // Column move line fixup when no dgColLines
      inherited MouseDown(mbLeft, Shift, FDownMousePos.X, FDownMousePos.Y);
    end;
  end;
  if (FIndicatorPressed or FDataTracking or (FDBGridEhState = dgsRectSelecting))
    {and not (FDBGridEhState = ghsRectSelecting)}then
  begin
    if UseRightToLeftAlignment then
    begin
      if X1 >= ClientWidth then
        X1 := ClientWidth-1;
      if (X1 < ClientWidth - GridWidth) then
        X1 := ClientWidth - GridWidth + 1;
    end else
    begin
      if X1 < 0 then X1 := 0;
      if X1 >= GridWidth then X1 := GridWidth - 1;
    end;
    if Y1 < 0 then Y1 := 0;
    if Y1 >= GridHeight then Y1 := GridHeight - 1;
    Cell := MouseCoord(X1, Y1);
    AddSel := (OldMoveMousePos.X <> FMoveMousePos.X) or (OldMoveMousePos.Y <> FMoveMousePos.Y);
    if (Y > DataRect.Top) and (Y < DataRect.Bottom) then
    begin
      WithSeleting := ssLeft in Shift;
      if (Cell.Y < Row)
        then DoSelection(WithSeleting and AddSel, Cell.Y - Row, False, not (FDBGridEhState = dgsRectSelecting))
      else if (Cell.Y > Row)
        then DoSelection(WithSeleting and AddSel, Cell.Y - Row, False, not (FDBGridEhState = dgsRectSelecting));
    end;
    if FDataTracking and (X > DataRect.Left) and (X < DataRect.Right) and (Cell.X <> Col) then
    begin
      if Cell.X > Col
        then MoveCol(RawToDataColumn(Cell.X), 1, CanSelectType(gstRectangle))
        else MoveCol(RawToDataColumn(Cell.X), -1, CanSelectType(gstRectangle));
      if (FDBGridEhState = dgsRectSelecting) then
        Selection.Rect.Select(RawToDataColumn(Cell.X), DataSource.DataSet.Bookmark, AddSel)
    end;
    FDownMousePos := Point(X, Y);
    FMouseShift := Shift;
    TimerScroll;
  end;
  if FDBGridEhState = dgsColSelecting then
  begin
    Cell := MouseCoord(X, Y);
    if (X > DataRect.Left) and (X < DataRect.Right) and (Cell.X <> -1) then
      if (ssCtrl in Shift) {and (Selection.Columns.IndexOf(Columns[RawToDataColumn(Cell.X)]) = -1)}
        then Selection.Columns.SelectShift(Columns[RawToDataColumn(Cell.X)] {,True})
      else Selection.Columns.SelectShift(Columns[RawToDataColumn(Cell.X)] {,False})
    else
      TimerScroll;
  end
  else if FDBGridEhState = dgsColSizing then //Frozen cols
  begin
    if CanTraceColSizing then
    begin
      FSizingPos := X + FSizingOfs;
      if Self.UseRightToLeftAlignment then
        FSizingPos := ClientWidth - FSizingPos;
      CalcDrawInfo(DrawInfo);
      NewSize := ResizeLine(DrawInfo.Horz);
      if NewSize < 1 then NewSize := 1;
      if not AutoFitColWidths or (csDesigning in ComponentState) or (AutoFitColWidths and
        (FSizingPos < DrawInfo.Horz.GridBoundary - (Columns.Count - FSizingIndex) -
        DrawInfo.Horz.EffectiveLineWidth * (Columns.Count - FSizingIndex)))
        then ColWidths[FSizingIndex] := NewSize;
      UpdateDesigner;
    end else
    begin
      DrawSizingLineEx(GridWidth, GridHeight); { XOR it out }
      FSizingPos := X + FSizingOfs;
      DrawSizingLineEx(GridWidth, GridHeight); { XOR it back in }
    end;
  end
  else if CanTraceColSizing and (FGridState = gsColSizing) then
  begin
    FSizingPos := X + FSizingOfs;
    if Self.UseRightToLeftAlignment then
      FSizingPos := ClientWidth - FSizingPos;
    CalcDrawInfo(DrawInfo);
    NewSize := ResizeLine(DrawInfo.Horz);
    if NewSize < 1 then NewSize := 1;
    if not AutoFitColWidths or (csDesigning in ComponentState) or (AutoFitColWidths and
      (FSizingPos < DrawInfo.Horz.FullGridBoundary - (Columns.Count - FSizingIndex) -
      DrawInfo.Horz.EffectiveLineWidth * (Columns.Count - FSizingIndex)))
      then ColWidths[FSizingIndex] := NewSize;
    UpdateDesigner;
    Exit;
  end
  else if FDBGridEhState = dgsRowMoving then
  begin
    CellHit := MouseCoord(X, Y);
    if (CellHit.Y >= FixedRows) and
      (CellHit.Y <= DrawInfo.Vert.LastFullVisibleCell+1) then
    begin
      CalcDrawInfo(DrawInfo);
      MoveDataRowAndScroll(Y, CellHit.Y, DrawInfo, DrawInfo.Vert, SB_VERT, Point(X,Y));
    end;
  end else if (FGridState = gsColMoving) and OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtTopEh) then
  begin
    Inc(OutBRect.Top, SearchPanel.InGridVertCaptureSize);
    if PtInRect(OutBRect, Point(X,Y)) then
      StartGroupPanelTitleMovingMode(Shift, X, Y);
  end else if FDBGridEhState = dgsGroupPanelTitleMoving then
  begin
    DragGroupPanelTitleMovingMode(Shift, X, Y);
  end else if FDBGridEhState = dgsGroupPanelTitleDown then
  begin
    TrackButton(X, Y);
    if (Abs(FDownMousePos.X - X) > 3) or (Abs(FDownMousePos.Y - Y) > 3) then
    begin
      StopTracking;
      if csCaptureMouse in ControlStyle then MouseCapture := True;
      FGroupDataMovingIndex := FPressedDataGroupLevelIdx;
      StartGroupPanelTitleMovingMode(Shift, X, Y);
    end;
  end;

  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDBGridEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  SaveState: TGridState;
  DoClick: Boolean;
  ACol: Longint;
  ARect: TRect;
  ADBGridEhState: TDBGridEhState;
  I, NewSize: Integer;
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
  Column: TColumnEh;
begin
  FDSMouseCapture := False;
  Cell := MouseCoord(X, Y);
  CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
  if RowPanel.Active and (FGridState in [gsColSizing, gsRowSizing]) then
  begin
    MouseUpInTitleRowPanel(Button, Shift, X, Y);
    Exit;
  end else if RowPanel.Active and (FGridState = gsColMoving) then
  begin
    StopRowPanelTitleCellDrag(Shift, X, Y, True);
    Exit;
  end else if (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    if RowPanel.Active and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctTitleEh{, vctSubTitleEh, vctDataEh, vctFooterEh}]) then
    begin
      MouseUpInTitleRowPanel(Button, Shift, X, Y);
      Exit;
    end else if DataGrouping.IsGroupingWorks and
       (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctDataEh]) and
       (FGridState = gsNormal) and
       (FDBGridEhState = dgsNormal) then
    begin
      InstantReadRecordEnter(AreaRow);
      ADrawGroupDataNode := InstantReadCurDataNode;
      InstantReadRecordLeave;
      if ADrawGroupDataNode.NodeType = dntDataGroupEh then
      begin
        if FDataTracking then
          StopTracking;
        Exit;
      end;
    end
  end;

  if (FDBGridEhState = dgsColSizing) and not (dghTraceColSizing in OptionsEh) then
  begin
    DrawSizingLineEx(GridWidth, GridHeight);
    NewSize := 0;
    for I := 0 to FSizingIndex - 1 do
      Inc(NewSize, ColWidths[I] + GridLineWidth);
    NewSize := FSizingPos - NewSize;
    if NewSize > 1 then
    begin
      ColWidths[FSizingIndex] := NewSize;
      UpdateDesigner;
    end;
  end
  else if FDBGridEhState = dgsRowMoving then
    EndRowMoving(X, Y, True)
  else if FDBGridEhState = dgsGroupPanelTitleMoving then
    StopGroupPanelTitleMovingMode(Shift, X, Y, True);
  if FSelectedCellPressed = True then
  begin
    FSelectedCellPressed := False;
    if (ssCtrl in Shift) and (dgRowSelect in Options)
      then FBookmarks.CurrentRowSelected := not FBookmarks.CurrentRowSelected
    else if (dghClearSelection in OptionsEh)
      then CheckClearSelection;
  end
  else if (dghTraceColSizing in OptionsEh) and (FGridState = gsColSizing) then
  begin
    UnlockGridHorzScotlling;
    if HorzScotllingLockCount = 0 then
      UpdateScrollRange;
    FGridState := gsNormal;
    Exit;
  end;
  ADBGridEhState := FDBGridEhState; //in any exception new state ghsNormal
  FDBGridEhState := dgsNormal;
  SaveState := FGridState;
  FSelecting := False;
  if (GetCursor = Screen.Cursors[crVSplit])
    then FDefaultRowChanged := True; // Released after line resized

  if FTracking and (FPressedCol >= 0) then
  begin
    Cell := MouseCoord(X, Y);
    DoClick := PtInRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
      and (Cell.Y = 0) and (Cell.X = FPressedCol);
    if (IsUseMultiTitle = True) and DoClick and (Cell.X - IndicatorOffset >= 0) then
    begin
      ARect := CellRect(Cell.X, Cell.Y);
      DoClick := not (PtInRect(Rect(ARect.Left, ARect.Top,
        ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X - IndicatorOffset].FLeaf.Height + 1),
        Point(X, Y)));
    end;
    StopTracking;
    if DoClick then
    begin
      ACol := Cell.X;
      if IndicatorColVisible then Dec(ACol);
      if {(DataLink <> nil) and DataLink.Active and}(ACol >= 0) and
        (ACol < Columns.Count) then
      begin
        DoTitleClick(ACol, Columns[ACol]);
        FSortMarking := ssCtrl in Shift;
        if not Center.ColumnValueTypeIsComparable(Self, Columns[ACol]) then
          raise Exception.Create(SSortingByThisColumnIsNotPossibleEh);
        if (dghAutoSortMarking in OptionsEh) then
          Columns[ACol].Title.SetNextSortMarkerValue(FSortMarking);
        if not FSortMarking then
          DoSortMarkingChanged;
      end;
    end;
  end
{  else if FSwapButtons then
  begin
    FSwapButtons := False;
    MouseCapture := False;
    if Button = mbRight then Button := mbLeft;
  end} else if ADBGridEhState = dgsGroupPanelTitleDown then
  begin
    GroupPanelTitleUp(Button, Shift, X, Y);
  end;

  if FIndicatorPressed or FDataTracking then StopTracking;
  if (ADBGridEhState <> dgsNormal) then StopTimer;

  inherited MouseUp(Button, Shift, X, Y);
  if (SaveState = gsRowSizing) or (SaveState = gsColSizing) or
    ((InplaceEditor <> nil) and (InplaceEditor.Visible) and
    (PtInRect(InplaceEditor.BoundsRect, Point(X, Y))))
    then Exit;
  Cell := MouseCoord(X, Y);
  if (Button = mbLeft) and (Cell.X >= FIndicatorOffset) and (Cell.Y >= 0) then
    if Cell.Y < TopDataOffset
      then TitleClick(Columns[RawToDataColumn(Cell.X)])
    else if (Cell.Y < DataRowCount + TopDataOffset) then
      if CellTreeElementMouseDown(X, Y, True) then
        Exit
      else
      begin
        if RowPanel.Active then
        begin
          ARect := CellRect(Cell.X, Cell.Y);
          Column := GetColumnInRowPanelAtPos(
            Point(X-ARect.Left+FDataOffset.cx, Y-ARect.Top), False)
        end else
          Column := Columns[RawToDataColumn(Cell.X)];
        CellClick(Column);
      end;

  FDefaultRowChanged := False;
  if not RowPanel.Active and
    (FPressedCell.X = Cell.X) and
    (FPressedCell.Y = Cell.Y) and
    (CellAreaType.HorzType = hctDataEh) and
    (CellAreaType.VertType = vctDataEh) and
    (Columns[Cell.X - IndicatorOffset].GetColumnType in [ctKeyImageList..ctCheckboxes])
  then
  begin
    if RowDetailPanel.Active and CheckMouseDownInRowDetailSign(Button, Shift, X, Y) then
      Exit;
    if not Columns[Cell.X - IndicatorOffset].DblClickNextVal and
      not (ssDouble in Shift) and Columns[Cell.X - IndicatorOffset].CanModify(True)
    then if (ssShift in Shift)
        then Columns[Cell.X - IndicatorOffset].SetNextFieldValue(-1)
        else Columns[Cell.X - IndicatorOffset].SetNextFieldValue(1)
  end else if RowPanel.Active and
     (CellAreaType.HorzType = hctDataEh) and
     (CellAreaType.VertType in [{vctTitleEh, vctSubTitleEh,} vctDataEh{, vctFooterEh}]) then
  begin
    MouseUpInDataRowPanel(Button, Shift, X, Y);
  end;
end;

procedure TCustomDBGridEh.MouseUpInTitleRowPanel(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  ARect: TRect;
  Column: TColumnEh;
  ACellRect: TRect;
begin
  Cell := MouseCoord(X, Y);
  ARect := CellRect(Cell.X, Cell.Y);
  if FGridState in [gsColSizing, gsRowSizing]
    then Column := Columns[FSizingIndex]
    else Column := GetColumnInRowPanelAtPos(
           Point(X-ARect.Left+FDataOffset.cx, Y-ARect.Top), True);
  if Column <> nil then
    MouseUpInTitleCell(Button, Shift, X, Y, Cell, Column,
        ACellRect, X-ARect.Left, Y-ARect.Top);
end;

procedure TCustomDBGridEh.MouseUpInDataRowPanel(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  ARect: TRect;
  Column: TColumnEh;
  ACellRect: TRect;
begin
  Cell := MouseCoord(X, Y);
  ARect := CellRect(Cell.X, Cell.Y);
  if FGridState in [gsColSizing, gsRowSizing]
    then Column := Columns[FSizingIndex]
    else Column := GetColumnInRowPanelAtPos(
            Point(X-ARect.Left+FDataOffset.cx, Y-ARect.Top), False);
  if Column <> nil then
    MouseUpInDataCell(Button, Shift, X, Y, Cell, Column,
        ACellRect, X-ARect.Left, Y-ARect.Top);
end;

procedure TCustomDBGridEh.MouseUpInTitleCell(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Cell: TGridCoord;
  Column: TColumnEh; ACellRect: TRect; InCellX, InCellY: Integer);
var
  ColumnIndex: Integer;
  DoClick: Boolean;
  DrawInfo: TGridDrawInfoEh;
  NewSize, NewSize1: Integer;
  InRowHeight: Integer;
  i: Integer;

  function TryFixSizeToNearestColumn(NewSize: Integer): Integer;
  var
    i: Integer;
    Column: TColumnEh;
    ACellInCellRect: TRect;
    AbsPost: Integer;
    ARect:TRect;
  begin
    Result := NewSize;
    if ssCtrl in Shift then Exit;
    ARect := CellRect(Cell.X, Cell.Y);
    for i := 0 to Columns.Count-1 do
    begin
      Column := Columns[i];
      if Column = Columns[FSizingIndex] then Continue;
      ACellInCellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
        Column.FRowPlacement.Left + Column.FRowPlacement.Width - 1,
        Column.FRowPlacement.Top + Column.FRowPlacement.Height - 1);
      if dgColLines in Options then Inc(ACellInCellRect.Right, GridLineWidth);
      if dgRowLines in Options then Inc(ACellInCellRect.Bottom, GridLineWidth);
      AbsPost := ARect.Left + ACellInCellRect.Right - FSizingOfs - FDataOffset.cx;
      if (Abs(AbsPost - X) < 4) then
      begin
        Result := Result + AbsPost - X;
        Exit;
      end;
    end;
  end;
begin
  ColumnIndex := Column.Index;

  if FGridState = gsRowSizing then
  begin
    CalcDrawInfo(DrawInfo);
    DrawSizingLine(DrawInfo);
    InRowHeight := InRowPanelLineHeight;
    NewSize :=
      Columns[FSizingIndex].InRowLineHeight * InRowHeight + (Y - FDownMousePos.Y);
    NewSize :=  Round(NewSize / InRowHeight);
    if NewSize >= 1 then
    begin
      Columns.BeginUpdate;
      try
      if not (ssShift in Shift) then
        for i := 0 to Columns.Count-1 do
        begin
          if (Columns[i] <> Columns[FSizingIndex]) and
             (Columns[i].InRowLinePos + Columns[i].InRowLineHeight =
              Columns[FSizingIndex].InRowLinePos + Columns[FSizingIndex].InRowLineHeight)
          then
          begin
            NewSize1 := Columns[i].InRowLineHeight + NewSize - Columns[FSizingIndex].InRowLineHeight;
            if NewSize1 >= 1 then
              Columns[i].InRowLineHeight := NewSize1;
          end;
        end;
      Columns[FSizingIndex].InRowLineHeight := NewSize;
      finally
      Columns.EndUpdate;
      end;
      if MemTableSupport then
        UpdateAllDataRowHeights;
      UpdateDesigner;
    end;
    FGridState := gsNormal;
  end else if FGridState = gsColSizing then
  begin
    CalcDrawInfo(DrawInfo);
    DrawSizingLineEx(GridWidth, GridHeight);
    if (FGridState = gsColSizing) and Self.UseRightToLeftAlignment then
    begin
      FSizingOfs := ClientWidth - FSizingOfs;
      NewSize := Columns[FSizingIndex].Width + (FDownMousePos.X - X);
    end else
      NewSize := Columns[FSizingIndex].Width + (X - FDownMousePos.X);
    NewSize :=  TryFixSizeToNearestColumn(NewSize);
    if NewSize > 1 then
    begin
      Columns.BeginUpdate;
      try
      if not (ssShift in Shift) then
        for i := 0 to Columns.Count-1 do
        begin
          if (Columns[i] <> Columns[FSizingIndex]) and
             (Columns[i].FRowPlacement.Left + Columns[i].FRowPlacement.Width =
              Columns[FSizingIndex].FRowPlacement.Left + Columns[FSizingIndex].FRowPlacement.Width)
          then
          begin
            NewSize1 := Columns[i].Width + NewSize - Columns[FSizingIndex].Width;
            if NewSize1 > 1 then
              Columns[i].Width := NewSize1;
          end;
        end;
      Columns[FSizingIndex].Width := NewSize;
      finally
      Columns.EndUpdate;
      end;
      UpdateDesigner;
    end;
    FGridState := gsNormal;
  end else if FTracking and (FPressedDataCol >= 0) then
  begin
    DoClick := (Cell.Y = 0) and (ColumnIndex = FPressedDataCol);
    StopTracking;
    if DoClick then
    begin
      DoTitleClick(ColumnIndex, Column);
      FSortMarking := ssCtrl in Shift;
      if (dghAutoSortMarking in OptionsEh)
        then Column.Title.SetNextSortMarkerValue(FSortMarking);
      if not FSortMarking
        then DoSortMarkingChanged;
    end;
  end;
end;

procedure TCustomDBGridEh.MouseUpInDataCell(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Cell: TGridCoord; Column: TColumnEh;
  ACellRect: TRect; InCellX, InCellY: Integer);
begin
  if CheckDataCellMouseDownInRowDetailSign(Button, Shift, X, Y,
      Cell, Column, ACellRect, InCellX, InCellY) then
    Exit;
  if (FPressedDataCol = Column.Index) and
    (FPressedCell.Y = Cell.Y) and
    (Column.GetColumnType in [ctKeyImageList..ctCheckboxes]) and
     not Column.DblClickNextVal and
     not (ssDouble in Shift) and
     Column.CanModify(True)
  then if (ssShift in Shift)
    then Column.SetNextFieldValue(-1)
    else Column.SetNextFieldValue(1);
end;

procedure TCustomDBGridEh.DefaultCellMouseClick(Cell: TGridCoord; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Center.CellMouseClick(Self, Cell, Button, Shift, X, Y);
end;

procedure TCustomDBGridEh.MoveCol(DataCol, Direction: Integer; Select: Boolean);
var
  OldCol: Integer;
begin
  if Select and not (dgRowSelect in Options) and CanSelectType(gstRectangle) then
    if Selection.FSelectionType <> gstRectangle then
    begin
      Selection.Rect.Clear;
      Selection.Rect.Select(RawToDataColumn(Col), Datalink.Datasource.Dataset.Bookmark, True);
    end;
  DataLink.UpdateData;
  if DataCol >= Columns.Count - ContraColCount then
    DataCol := Columns.Count - 1 - ContraColCount;
  if DataCol < 0 then
    DataCol := 0;
  if Direction <> 0 then
  begin
    while (DataCol < Columns.Count - ContraColCount) and (DataCol >= 0) and
        (not Columns[DataCol].Visible) do
      Inc(DataCol, Direction);
    if (DataCol >= Columns.Count - ContraColCount) or (DataCol < 0)
      then Exit;
  end;
  OldCol := SelectedIndex;
  if DataCol <> OldCol then
  begin
    if not FInColExit then
    begin
      FInColExit := True;
      try
        ColExit;
      finally
        FInColExit := False;
      end;
      if SelectedIndex <> OldCol then Exit;
    end;
    if not (dgAlwaysShowEditor in Options) then HideEditor;
    if RowPanel.Active then
    begin
      SetColInRowPanel(DataCol);
      if ThemesEnabled then InvalidateTitle;
    end else
      if not (dgRowSelect in Options) then
        Col := DataToRawColumn(DataCol);
    if (InplaceEditor <> nil) then
      TDBGridInplaceEdit(InplaceEditor).FReadOnlyStored := False;
    if not (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes])
      and (dgAlwaysShowEditor in Options) and not FilterEditMode
    then
      ShowEditor;
    ColEnter;
  end;
  if Select and not (dgRowSelect in Options) and CanSelectType(gstRectangle)
    then Selection.Rect.Select(RawToDataColumn(Col), Datalink.Datasource.Dataset.Bookmark, True);
  StopInplaceSearch;
  if Columns.Count > 0 then
    Columns.FUpDownBaseColumn := Columns[SelectedIndex];
end;

procedure TCustomDBGridEh.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent is TCustomImageList) then
    begin
      if TitleImages = AComponent then
        TitleImages := nil;
    end else if (AComponent is TScrollBar) then
    begin
      if VertScrollBar.ExtScrollBar = AComponent then
        VertScrollBar.ExtScrollBar := nil
      else if HorzScrollBar.ExtScrollBar = AComponent then
        HorzScrollBar.ExtScrollBar := nil
    end else if (AComponent is TDataSet) then
    begin
      CheckIMemTable;
      if SumList.DataSet = AComponent then
      begin
        if ViewScroll then
        begin
          UpdateRowCount;
          MTViewDataEvent(-1, mtViewDataChangedEh, -1);
        end;
        LayoutChanged;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.RecordChanged(Field: TField);
begin
  inherited;
end;

function TCustomDBGridEh.HaveHideDuplicates: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Columns.Count-1 do
    if Columns[i].HideDuplicates then
    begin
      Result := True;
      Break;
    end;
end;

procedure TCustomDBGridEh.InvalidateEditor;
begin
  FInplaceColInRowPanel := -1;
  FInplaceRow := -1;
  inherited InvalidateEditor;
  if FilterEditMode then
    UpdateFilterEdit(True);
end;

procedure TCustomDBGridEh.Scroll(Distance: Integer);
var
  OldRect, NewRect: TRect;
  RowHeight: Integer;
  VertSBVis: Boolean;
  MousePos: TPoint;
begin
  if RowDetailPanel.Visible then RowDetailPanel.Visible := False;
  if ViewScroll then
  begin
    MTScroll(Distance);
    Exit;
  end;
  if not HandleAllocated then Exit;
  OldRect := BoxRect(0, Row, ColCount - 1, Row);
  OldRect.Right := ClientWidth;
  if (DataLink.ActiveRecord >= RowCount - TopDataOffset) then
    UpdateRowCount;
  VertSBVis := VertScrollBar.IsScrollBarVisible;
  UpdateScrollBar;
  if (VertSBVis <> VertScrollBar.IsScrollBarVisible) then
  begin
    if (FAutoFitColWidths = True) {and (UpdateLock = 0)} and not (csDesigning in ComponentState)
      then DeferLayout;
  end;
  //UpdateScrollBar;
  UpdateActive;
  if (gioShowRecNoEh in IndicatorOptions) and CheckIndicatorColWidthChanged then
    LayoutChanged;
  if BackgroundData.Showing then
  begin
    Invalidate;
    Exit;
  end;
  NewRect := BoxRect(0, Row, ColCount - 1, Row);
  NewRect.Right := ClientWidth;
  WindowsValidateRect(Handle, OldRect);
  WindowsInvalidateRect(Handle, OldRect, False);
  WindowsInvalidateRect(Handle, NewRect, False);
  if Distance <> 0 then
  begin
    HideEditor;
    try
      if Abs(Distance) > VisibleDataRowCount then
      begin
        Invalidate;
        Exit;
      end else
      begin
        RowHeight := FStdDefaultRowHeight;
        if dgRowLines in Options then Inc(RowHeight, GridLineWidth);
        if IndicatorColVisible then
        begin
          if FSelRow >= TopDataOffset then
          begin
            OldRect := BoxRect(0, FSelRow, ColCount - 1, FSelRow);
            OldRect.Right := ClientWidth;
            WindowsInvalidateRect(Handle, OldRect, False);
          end;
        end;
        NewRect := BoxRect(0, TopDataOffset, ColCount - 1, RowCount-1);
        NewRect.Right := ClientWidth;
          WindowsScrollWindowEx(Handle, 0, -RowHeight * Distance, NewRect, NewRect,
            0, {nil,} SW_Invalidate);
        if IndicatorColVisible then
        begin
          NewRect := BoxRect(0, Row, ColCount - 1, Row);
          NewRect.Right := ClientWidth;
          WindowsInvalidateRect(Handle, NewRect, False);
        end;
        if dghHotTrack in OptionsEh then
        begin
          FHotTrackCell.Y := FHotTrackCell.Y - Distance;
          MousePos := ScreenToClient(SafeGetMouseCursorPos);
          UpdateHotTackInfo(MousePos.X, MousePos.Y);
        end;
      end;
    finally
      if dgAlwaysShowEditor in Options then ShowEditor;
    end;
    if HaveHideDuplicates then
      GridInvalidateRow(Self, TopDataOffset);
  end;
  {if Columns.ExistFooterValueType(fvtFieldValue) then } InvalidateFooter;
  if UpdateLock = 0 then Update;
end;

procedure TCustomDBGridEh.SetColumns(const Value: TDBGridColumnsEh);
begin
  inherited AxisBars := Value;
end;

procedure TCustomDBGridEh.SetColumnAttributes;
var
  I: Integer;
  NewWidth: Integer;
begin
  SetExtraFirstColumnWidth;
  if RowPanel.Active then
  begin
    CellColWidths[FIndicatorOffset] := FGridMasterCellWidth;
    for I := 1 to Columns.Count - 1 do
      CellColWidths[I + FIndicatorOffset] := -1;
  end else
    for I := 0 to Columns.Count - 1 do
      with Columns[I] do
      begin
        TabStops[I + FIndicatorOffset] := IsTabStop;
        NewWidth := ColWidthToCellWidth(Columns[I],
                      iif(Visible, Width, EmptyColWidth));
        if Visible then
        begin
          if NewWidth <> CellColWidths[I + FIndicatorOffset] then
            CellColWidths[I + FIndicatorOffset] := NewWidth;
        end else
          ColWidths[I + FIndicatorOffset] := 0;
      end;
  if IndicatorColVisible and HandleAllocated then
  begin
    CellColWidths[0] := CalcIndicatorColWidth;
    FRecNoTextWidth := CellColWidths[0];
  end;

  for I := ColCount-1 downto 0 do
  begin
    if CellColWidths[i] > 0 then
    begin
      FLastVisibleCol := I;
      Break;
    end;
  end;

end;

procedure TCustomDBGridEh.SetDataSource(Value: TDataSource);
begin
  if Value = Datalink.Datasource then Exit;
  ClearSelection;

  inherited SetDataSource(Value);
  if (Assigned(DataSource))
    then SumList.DataSet := DataSource.DataSet
    else SumList.DataSet := nil;

  KeyProperyModified;
end;

procedure TCustomDBGridEh.SetOptions(Value: TDBGridOptions);
const
  LayoutOptions = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection];
var
  NewGridOptions: TGridOptions;
  ChangedOptions, OldOptions: TDBGridOptions;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [goThumbTracking];
    if (RowSizingAllowed = True)
      then NewGridOptions := NewGridOptions + [goRowSizing];
    if (dghExtendVertLines in OptionsEh) then
      NewGridOptions := NewGridOptions + [goExtendVertLines];
    if dgColLines in Value then
    begin
    end;
    if dgTabs in Value
      then Include(NewGridOptions, goTabs);
    if dgRowSelect in Value then
    begin
      Include(NewGridOptions, goRowSelect);
      Exclude(Value, dgAlwaysShowEditor);
      Exclude(Value, dgEditing);
    end;
    if dgEditing in Value then Include(NewGridOptions, goEditing);
    if dgAlwaysShowEditor in Value
      then Include(NewGridOptions, goAlwaysShowEditor);
    inherited Options := NewGridOptions;
    if dgMultiSelect in (FOptions - Value) then ClearSelection;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    if not (csLoading in ComponentState) then
      UpdateColumnResizeOptions(Value, FOptionsEh);
    OldOptions := FOptions;
    FOptions := Value;
    if dgIndicator in Options
      then FIndicatorOptions := FIndicatorOptions + [gioShowRowIndicatorEh]
      else FIndicatorOptions := FIndicatorOptions - [gioShowRowIndicatorEh];
    if ChangedOptions * LayoutOptions <> [] then
      LayoutChanged;
    if (dgRowLines in OldOptions) xor (dgRowLines in Options) then
      UpdateAllDataRowHeights();

    if EditorMode then InvalidateEditor;
  end;
end;

procedure TCustomDBGridEh.SetOptionsEh(const Value: TDBGridEhOptions);
var
  I: Integer;
  OldPotionsEh: TDBGridEhOptions;
begin
  if (OptionsEh = Value) then Exit;
  if (dghMultiSortMarking in (FOptionsEh - Value)) then
    for i := FSortMarkedColumns.Count - 1 downto 1 do
      FSortMarkedColumns[i].Title.SortMarker := smNoneEh;
  if not (csLoading in ComponentState) then
    UpdateColumnResizeOptions(FOptions, Value);
  OldPotionsEh := FOptionsEh;

  FOptionsEh := Value;
  if dghShowRecNo in OptionsEh
    then FIndicatorOptions := FIndicatorOptions + [gioShowRecNoEh]
    else FIndicatorOptions := FIndicatorOptions - [gioShowRecNoEh];

  if not (csLoading in ComponentState) then
  begin
    if (dghExtendVertLines in FOptionsEh) and not (dghExtendVertLines in OldPotionsEh) then
    begin
      if GridLineParams.VertEmptySpaceStyle = dessNonEh then
        GridLineParams.VertEmptySpaceStyle := dessGradiendEh
    end else if not (dghExtendVertLines in FOptionsEh) and (dghExtendVertLines in OldPotionsEh) then
    begin
      if GridLineParams.VertEmptySpaceStyle <> dessNonEh then
        GridLineParams.VertEmptySpaceStyle := dessNonEh;
    end
  end else if csLoading in ComponentState then
    if not (dghExtendVertLines in FOptionsEh) and
           (dghExtendVertLines in OldPotionsEh) and
           (GridLineParams.VertEmptySpaceStyle = dessGradiendEh) then
    begin
      GridLineParams.VertEmptySpaceStyle := dessNonEh;
    end;

  if (     (dghAutoFitRowHeight in OldPotionsEh) and
       not (dghAutoFitRowHeight in FOptionsEh) )
     or
     ( not (dghAutoFitRowHeight in OldPotionsEh) and
              (dghAutoFitRowHeight in FOptionsEh) )
  then
    UpdateAllDataRowHeights();
  LayoutChanged;
end;

procedure TCustomDBGridEh.SetIndicatorOptions(const Value: TDBGridEhIndicatorOptions);
begin
  if (IndicatorOptions = Value) then Exit;
  FIndicatorOptions := Value;
  if gioShowRowIndicatorEh in IndicatorOptions
    then FOptions := FOptions + [dgIndicator]
    else FOptions := FOptions - [dgIndicator];
  if gioShowRecNoEh in IndicatorOptions
    then FOptionsEh := FOptionsEh + [dghShowRecNo]
    else FOptionsEh := FOptionsEh - [dghShowRecNo];
  CheckIndicatorColWidthChanged;  
  LayoutChanged;
end;

procedure TCustomDBGridEh.UpdateColumnResizeOptions(NewOptions: TDBGridOptions;
  NewOptionsEh: TDBGridEhOptions);
begin
  if (dgColumnResize in NewOptions) and not (dgColumnResize in FOptions) then
    FOptionsEh := FOptionsEh + [dghColumnResize, dghColumnMove]
  else if not (dgColumnResize in NewOptions) and (dgColumnResize in FOptions) then
    FOptionsEh := FOptionsEh - [dghColumnResize, dghColumnMove]

  else if ([dghColumnResize, dghColumnMove] * NewOptionsEh = [dghColumnResize, dghColumnMove])
   and ([dghColumnResize, dghColumnMove] * FOptionsEh <> [dghColumnResize, dghColumnMove]) then
    FOptions := FOptions + [dgColumnResize]
  else if ([dghColumnResize, dghColumnMove] * NewOptionsEh <> [dghColumnResize, dghColumnMove])
   and ([dghColumnResize, dghColumnMove] * FOptionsEh = [dghColumnResize, dghColumnMove]) then
    FOptions := FOptions - [dgColumnResize];

  if (FOptions = NewOptions) and (dgColumnResize in FOptions) and (FOptionsEh = NewOptionsEh) then
  begin
    FOptionsEh := FOptionsEh + [dghColumnResize, dghColumnMove];
    NewOptionsEh := NewOptionsEh + [dghColumnResize, dghColumnMove];
  end;

  if dghColumnResize in NewOptionsEh
    then inherited Options := inherited Options + [goColSizing]
    else inherited Options := inherited Options - [goColSizing];

  if dghColumnMove in NewOptionsEh
    then inherited Options := inherited Options + [goColMoving]
    else inherited Options := inherited Options - [goColMoving];

end;

procedure TCustomDBGridEh.SetSearchEditorMode(Value: Boolean);
begin
  if Value <> FSearchEditorMode then
  begin
    FSearchEditorMode := Value;
    if not FSearchEditorMode and SearchPanel.Active then
      SearchPanel.Active := False
    else if FSearchEditorMode and not SearchPanel.Active then
      SearchPanel.Active := True;
    if SearchPanel.Active then
      SearchPanel.FFoundColumnIndex := SelectedIndex;
  end;
end;

procedure TCustomDBGridEh.SetSearchFilter(const FilterStr: String);
var
  ASearchFilterEvent: TFilterRecordEvent;
begin
  FSearchFilter := FilterStr;
  FSearchFilterSelection.AssignAsBaseRef(Selection);
  if Selection.SelectionType in [gstRecordBookmarks, gstRectangle] then
    Selection.Clear;
  if Assigned(FIntMemTable) then
    if FFilterObj <> nil
      then FIntMemTable.ResetExtraFilter(FFilterObj, '', SearchFilterEvent)
      else FFilterObj := FIntMemTable.ApplyExtraFilter('', SearchFilterEvent)
  else
  begin
//    Center.ApplySimpleTextFilter(Self, '*', lsftContainsEh, FilterStr);
    if DataLink.Active then
    begin
      ASearchFilterEvent := SearchFilterEvent;
      if @DataLink.DataSet.OnFilterRecord <> @ASearchFilterEvent then
      begin
        FLastFilterPanelEvent := DataLink.DataSet.OnFilterRecord;
        DataLink.DataSet.OnFilterRecord := SearchFilterEvent;
        FLastDataSet := DataLink.DataSet;
      end;
      if not DataLink.DataSet.Filtered then
        DataLink.DataSet.Filtered := True
      else
      begin
        DataLink.DataSet.DisableControls;
        try
          DataLink.DataSet.Filtered := False;
          DataLink.DataSet.Filtered := True;
        finally
          DataLink.DataSet.EnableControls;
        end;  
      end;
    end;
  end;
  if SumList.Active then
    SumList.RecalcAll;
end;

procedure TCustomDBGridEh.ClearSearchFilter;
var
  Rec: TObject;
  ATopRowDelta: Integer;
begin
  ATopRowDelta := Row - TopRow;
  if Assigned(FIntMemTable) then
  begin
    if FFilterObj <> nil then
    begin
      LockPaint;
      try
      if FIntMemTable <> nil
        then Rec := FIntMemTable.GetRecObject
        else Rec := nil;
      FIntMemTable.RevokeExtraFilter(FFilterObj);
      FFilterObj := nil;
      if FIntMemTable <> nil
        then FIntMemTable.SetToRec(Rec);
      SafeMoveTop(Row - ATopRowDelta);
      Invalidate;
      finally
        UnlockPaint;
      end;
    end
  end else
  begin
    ReturnSearchPanelFilter;
//    Center.ApplySimpleTextFilter(Self, '', lsftContainsEh, '');
  end;
  if SumList.Active then
    SumList.RecalcAll;
end;

procedure TCustomDBGridEh.SearchFilterEvent(DataSet: TDataSet; var Accept: Boolean);
var
  i: Integer;
  S, SubStr: String;
  Pos: Integer;
  ColumnsList: TColumnsEhList;
  Field: TField;
begin
  if @FLastFilterPanelEvent <> nil then
  begin
    FLastFilterPanelEvent(DataSet, Accept);
    if not Accept then Exit;
  end;
  Accept := False;
  if FSearchFilterSelection.SelectionType = gstColumns
    then ColumnsList := FSearchFilterSelection.Columns
    else ColumnsList := VisibleColumns;
  if FSearchFilterSelection.SelectionType = gstRecordBookmarks then
  begin
    if (FIntMemTable <> nil) and (FSearchFilterSelection.Rows.FRowsRef.IndexOf(FIntMemTable.GetRecObject) >= 0) then
    // Ok
    else
      Exit;
  end;
  for i := 0 to ColumnsList.Count-1 do
  begin
    if (ColumnsList[i].Field <> nil) and  ColumnsList[i].Field.Lookup then
    begin
      Field := ColumnsList[i].Field;
      if Field.LookupDataSet.Active and
         Field.LookupDataSet.Locate(Field.LookupKeyFields, DataLink.DataSet[Field.KeyFields], [])
        then S := NlsUpperCase(Field.LookupDataSet.FieldByName(Field.LookupResultField).AsString)
        else S := '';
    end else
      S := NlsUpperCase(ColumnsList[i].DisplayText);
    SubStr := NlsUpperCase(FSearchFilter);
    if SubStr = '' then
    begin
      if S = '' then
      begin
        Accept := True;
        Exit;
      end;
    end else
    begin
      Pos := PosEx(SubStr, S);
      if Pos > 0 then
      begin
        Accept := True;
        Exit;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.ReturnSearchPanelFilter;
begin
  if FLastDataSet <> nil then
  begin
    FLastDataSet.OnFilterRecord := FLastFilterPanelEvent;
    if not (csDestroying in FLastDataSet.ComponentState) and FLastDataSet.Active then
    begin
      FLastDataSet.Filtered := False;
      FLastDataSet.Filtered := True;
    end;
    FLastDataSet := nil;
  end;
//    else raise Exception.Create('Logical error in the DBGridEh. Calling ReturnSearchPanelFilter is too late')
end;

procedure TCustomDBGridEh.CheckReturnSearchPanelFilter;
begin
  if   ((FLastDataSet <> nil) and (DataLink.DataSet <> FLastDataSet)
    or ((FLastDataSet <> nil) and (DataLink.DataSet = FLastDataSet) and not FLastDataSet.Active)) then
  begin
    ReturnSearchPanelFilter;
  end;
end;

procedure TCustomDBGridEh.SetTitleFont(Value: TFont);
begin
  TitleParams.Font := Value;
  if dgTitles in Options then LayoutChanged;
end;

function TCustomDBGridEh.GetTitleFont: TFont;
begin
  Result := TitleParams.Font;
end;

procedure TCustomDBGridEh.TimedScroll(Direction: TGridScrollDirection);
begin
  if DataLink.Active then
  begin
    with DataLink do
    begin
      if sdUp in Direction then
      begin
        MoveBy(-ActiveRecord - 1);
        Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
        MoveBy(RecordCount - ActiveRecord);
        Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then inherited TimedScroll(Direction);
  end;
end;

procedure TCustomDBGridEh.TitleClick(Column: TColumnEh);
begin
  if Assigned(FOnTitleClick) then FOnTitleClick(Column);
end;

procedure TCustomDBGridEh.UpdateActive;
var
  NewRow: Integer;
  Field: TField;
begin
  if not FInplaceSearchingInProcess then
    StopInplaceSearch;
  if ViewScroll then
    MTScroll(0)
  else if DataLink.Active and HandleAllocated and not (csLoading in ComponentState) then
  begin
    NewRow := DataLink.ActiveRecord + TopDataOffset;
    if Row <> NewRow then
    begin
      if not (dgAlwaysShowEditor in Options) then HideEditor;
      MoveColRow(Col, NewRow, False, False, False);
      InvalidateEditor;
    end;
    Field := SelectedField;
    if Assigned(Field) and DataLink.Active and (Field.Text <> FEditText) then
      InvalidateEditor;
  end;
end;

procedure TCustomDBGridEh.UpdateData;
begin
  inherited UpdateData;
end;

function TCustomDBGridEh.GetSubTitleRowHeights(ASubTitleRow: Integer): Integer;
begin
  Result := FStdDefaultRowHeight;
end;

function TCustomDBGridEh.CalcIndicatorColWidth: Integer;
var
  ARecordCount, i: Integer;
  WidthText: String;
begin
  Result := 0;

  if dgIndicator in Options then
    Inc(Result, IndicatorWidth);

  if (dghShowRecNo in OptionsEh) and
      Assigned(DataLink.DataSet) then
  begin
    if DataLink.Active and DataLink.DataSet.Active
      then ARecordCount := DataLink.DataSet.RecordCount
      else ARecordCount := 0;
    ARecordCount := ARecordCount div 10;
    WidthText := '0';
    for i := 0 to 100 do
    begin
      if ARecordCount = 0 then Break;
      ARecordCount := ARecordCount div 10;
      WidthText := WidthText + '0';
    end;
    Canvas.Font := Font;
    Canvas.Font.Size := Canvas.Font.Size - 1;
    if Result = 0 then Inc(Result, 2);
    Result := Result + Canvas.TextWidth(WidthText) + 2;
    if Result < IndicatorWidth then Result := IndicatorWidth;
  end;
  if gioShowRowselCheckboxesEh in IndicatorOptions then
  begin
    Canvas.Font := Font;
    Canvas.Font.Size := Canvas.Font.Size - 1;
    FRowselCheckboxesWidth := Canvas.TextWidth('0') + DefaultCheckBoxWidth;
    Result := Result + FRowselCheckboxesWidth;
  end else
    FRowselCheckboxesWidth := 0;
end;

function TCustomDBGridEh.CheckIndicatorColWidthChanged: Boolean;
var
  ARecNoTextWidth: Integer;
begin
  ARecNoTextWidth := CalcIndicatorColWidth;
  if ARecNoTextWidth <> FRecNoTextWidth then
  begin
    FRecNoTextWidth := ARecNoTextWidth;
    FSizeChanged := True;
    Result := True;
  end else
    Result := False;
end;

procedure TCustomDBGridEh.SetRowCount(NewRowCount: Longint);
begin
  if NewRowCount <= Row then
    MoveColRow(Col, NewRowCount - 1, False, False, False);
  RowCount := NewRowCount;
end;

procedure TCustomDBGridEh.UpdateRowCount;
var
  t: Integer;
  OldRowCount, OccupiedHeight, VisibleDataRowCount, NewRowCount: Integer;

  function LineHeight: Integer;
  begin
    if dgRowLines in Options
      then Result := GridLineWidth
      else Result := 0;
  end;

  function DefaultLineRowHeight: Integer;
  begin
    Result :=  FStdDefaultRowHeight + LineHeight;
  end;

  procedure SetSubTitleRowHeights;
  var I: Integer;
  begin
    for I := GetTitleRows to TopDataOffset - 1 do
      Inc(OccupiedHeight, STFilter.RowFullRowHeight + LineHeight);
  end;

  procedure CalcFooterHeight;
  var I: Integer;
  begin
    for I := 0 to FullFooterRowCount - 1 do
      Inc(OccupiedHeight, DefaultLineRowHeight);
    if (FullFooterRowCount > 0) then
      Inc(OccupiedHeight, LineHeight);
  end;

  procedure UpdateFooterRowHeights;
  var
    i: Integer;
  begin
    for i := 0 to FooterRowCount - 1 do
      if i < Length(FooterParams.FCalculatedRowHeights)
        then CellRowHeights[RowCount+i] := FooterParams.FCalculatedRowHeights[i]
        else CellRowHeights[RowCount+i] := FStdDefaultRowHeight;
    for i := 0 to DataGrouping.Footers.VisibleItemsCount-1-FooterRowCount do
      CellRowHeights[RowCount+FooterRowCount+i] := TGridDataGroupFooterEhCrack(DataGrouping.Footers.VisibleItems[i]).FAutoCalcHeight
  end;

begin
  if not Assigned(DataLink) then Exit;

  if ViewScroll then
  begin
    MTUpdateRowCount;
    Exit;
  end;

  OldRowCount := RowCount;
  if RowCount <= TopDataOffset then
    SetRowCount(TopDataOffset + 1);
  FixedRows := TopDataOffset;
  FrozenRowCount := GetSubTitleRows;
  FOldTopLeft.X := LeftCol;
  FOldTopLeft.Y := TopRow;
  OccupiedHeight := 0;
  if dgTitles in Options then
  begin
    CellRowHeights[0] := FTitleRowHeight;
    Inc(OccupiedHeight, CellRowHeights[0] + LineHeight);
  end;
  SetSubTitleRowHeights;
  CalcFooterHeight;

  LockEditor;
  try
    t := RowHeights[0];
    DefaultRowHeight := FStdDefaultRowHeight;
    if dgTitles in Options then
      RowHeights[0] := t;
    if GetSubTitleRows > 0 then
      CellRowHeights[GetTitleRows] := STFilter.RowFullRowHeight;
  finally
    UnlockEditor;
  end;

  TopRow := FixedRows;

  with DataLink do
    if not Active or (RecordCount = 0) or not HandleAllocated then
    begin

      SetRowCount(1 + TopDataOffset);
      ContraRowCount := FullFooterRowCount;

    end else
    begin
      VisibleDataRowCount :=
        (ClientHeight -
         OutBoundaryData.TopIndent -
         OutBoundaryData.BottomIndent -
         OccupiedHeight)
       div DefaultLineRowHeight;
      if VisibleDataRowCount <= 0 then VisibleDataRowCount := 1;

      DataLink.BufferCount := VisibleDataRowCount;
      VisibleDataRowCount := DataLink.RecordCount;
      Inc(OccupiedHeight, DefaultLineRowHeight * VisibleDataRowCount);
      NewRowCount := VisibleDataRowCount + TopDataOffset;

      if FullFooterRowCount > 0 then
      begin
        SetRowCount(NewRowCount);
        ContraRowCount := FullFooterRowCount;
        UpdateFooterRowHeights;
      end else
      begin
        SetRowCount(NewRowCount);
        ContraRowCount := 0;
      end;

      UpdateActive;
    end;
  UpdateScrollRange;
  if OldRowCount <> RowCount then Invalidate;
end;

procedure TCustomDBGridEh.UpdateScrollBar;
var
  SIOld, SINew: TScrollInfo;
begin
  if FShowingLoadingMode then
    Exit;

  if (DataLink = nil) or not HandleAllocated then Exit;
  if ExtendedScrolling then
  begin
    MTUpdateVertScrollBar;
    Exit;
  end;

  SIOld.cbSize := sizeof(SIOld);
  SIOld.fMask := SIF_ALL;
  VertScrollBar.GetScrollInfo(SIOld);
  SINew := SIOld;
  SINew.nMin := 0;
  SINew.nPage := 2;
  SINew.nMax := 1;
  SINew.nPos := 0;

  if DataLink.Active and DataLink.DataSet.Active then
    with DataLink.DataSet do
    begin
      if SumList.IsSequenced then
      begin
        SINew.nMin := 1;
        SINew.nPage := VisibleDataRowCount;
        SINew.nMax := Integer(DWORD(SumList.RecordCount) + SINew.nPage - 1);
        if State in [dsInactive, dsBrowse, dsEdit]
          then SINew.nPos := SumList.RecNo // else keep old pos
          else SINew.nPos := SIOld.nPos;
      end
      else
      begin
        SINew.nMin := 0;
        SINew.nPage := 0;
        SINew.nMax := 4;
        if BOF then SINew.nPos := 0
        else if EOF then SINew.nPos := 4
        else SINew.nPos := 2;
      end;
    end;

  VertScrollBar.SetParams(SINew.nPos, SINew.nMin, SINew.nMax, SINew.nPage);
  UpdateSearchPanel;
end;

procedure TCustomDBGridEh.UpdateHorzExtScrollBar;
var
  SIOld, SINew: TScrollInfo;
  DrawInfo: TGridDrawInfoEh;
  MaxTopLeft: TGridCoord;
  AnExtScrollBar: TScrollBar;
begin
  if HorzScrollBar.ExtScrollBar <> nil then
     AnExtScrollBar := HorzScrollBar.ExtScrollBar
  else
    AnExtScrollBar := nil;

  if AnExtScrollBar <> nil then
  begin
    SIOld.cbSize := sizeof(SIOld);
    SIOld.fMask := SIF_ALL;
    HorzScrollBar.GetScrollInfo(SIOld);
    SINew := SIOld;
    SINew.nMin := 0;
    SINew.nPage := VisibleColCount;
    if VisibleColCount + FixedCols = ColCount
      then SINew.nMax := 0
      else SINew.nMax := MaxShortIntEh;
    CalcDrawInfo(DrawInfo);
    MaxTopLeft.X := ColCount - 1;
    MaxTopLeft.Y := RowCount - 1;
    MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
    SINew.nPos := MulDiv(LeftCol - FixedCols, MaxShortIntEh, MaxTopLeft.X - FixedCols);
    if SINew.nMax < SINew.nMin then
      SINew.nMin := SINew.nMax;
    if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
      (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) then
    begin
      AnExtScrollBar.PageSize := SINew.nPage;
      AnExtScrollBar.SetParams(SINew.nPos, SINew.nMin, SINew.nMax);
    end;
  end;
end;

procedure TCustomDBGridEh.SetGridScrollBarInfo(BarFlag: Integer;
  SetProps: TScrollBarPropsEh; Min, Max, PageSize, Pos: Integer);
var
  SIOld, SINew: TScrollInfo;
  AnExtScrollBar: TScrollBar;

  procedure SetStdGridScrollBarInfo(BarFlag: Integer;
  SetProps: TScrollBarPropsEh; Min, Max, PageSize, Pos: Integer);
  var
    SIOld, SINew: TScrollInfo;
  begin
    SIOld.cbSize := SizeOf(SIOld);
    SIOld.fMask := SIF_ALL;
    if (BarFlag = SB_VERT) and (VertScrollBar.VisibleMode = sbAlwaysShowEh) then
      SIOld.fMask := SIOld.fMask or SIF_DISABLENOSCROLL;
    GetGridScrollBarInfo(BarFlag, SIOld);
    SINew := SIOld;
    if sbpRangeEh in SetProps then
    begin
      SINew.nMin := Min;
      SINew.nMax := Max;
    end;
    if sbpPageEh in SetProps then
      SINew.nPage := PageSize;
    if sbpPosEh in SetProps then
      SINew.nPos := Pos;
    if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
      (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) then
      SetScrollInfo(Self.Handle, BarFlag, SINew, True);
  end;

begin
  if FShowingLoadingMode then
    Exit;

  if BarFlag = SB_HORZ then
  begin
    if HorzScrollBar.ExtScrollBar <> nil then
      AnExtScrollBar := HorzScrollBar.ExtScrollBar
    else if ScrollBarPanel then
      AnExtScrollBar := FHorzScrollBarPanelControl.ScrollBar
    else
      AnExtScrollBar := nil;

    if AnExtScrollBar <> nil then
    begin
      SIOld.cbSize := SizeOf(SIOld);
      SIOld.fMask := SIF_ALL;
      GetScrollInfo(Self.Handle, BarFlag, SIOld);
      SINew := SIOld;
      SINew.nMin := Min;
      SINew.nPage := PageSize;
      SINew.nMax := Max;
      SINew.nPos := Pos;
      if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
        (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos)
      then
      begin
        if (SINew.nMax <= SINew.nMin) or (UINT(SINew.nMax - SINew.nMin) <= SINew.nPage) then
          AnExtScrollBar.Enabled := False
        else
        begin
          AnExtScrollBar.Enabled := True;
          AnExtScrollBar.PageSize := SINew.nPage;
          if AnExtScrollBar.PageSize > SINew.nMax then
            SINew.nMax := AnExtScrollBar.PageSize;
          if UseRightToLeftAlignment
            then AnExtScrollBar.SetParams(SINew.nMax - SINew.nPos, SINew.nMin, SINew.nMax)
            else AnExtScrollBar.SetParams(SINew.nPos, SINew.nMin, SINew.nMax);
        end;
        UpdateScrollBarPanels;
      end;
      ShowScrollBar(Handle, SB_HORZ, False);
    end else
      inherited SetGridScrollBarInfo(BarFlag, SetProps, Min, Max, PageSize, Pos);
  end else
  begin // BarFlag = SB_VERT
    if VertScrollBar.ExtScrollBar <> nil then
      AnExtScrollBar := VertScrollBar.ExtScrollBar
    else if ScrollBarPanel then
      AnExtScrollBar := FVertScrollBarPanelControl.ScrollBar
    else
      AnExtScrollBar := nil;

    if AnExtScrollBar <> nil then
      VertScrollBar.SetParams(Pos, Min, Max, PageSize)
    else if VertScrollBar.VisibleMode = sbAlwaysShowEh then
      SetStdGridScrollBarInfo(BarFlag, SetProps, Min, Max, PageSize, Pos)
    else
      inherited SetGridScrollBarInfo(BarFlag, SetProps, Min, Max, PageSize, Pos);
  end;
end;

procedure TCustomDBGridEh.GetGridScrollBarInfo(BarFlag: Integer; var ScrollInfo: TScrollInfo);
begin
  if BarFlag = SB_VERT
    then VertScrollBar.GetScrollInfo(ScrollInfo)
    else HorzScrollBar.GetScrollInfo(ScrollInfo);
end;

function TCustomDBGridEh.ScrollBarOccupiedExtent(BarCode: Word): Integer;
begin
  if BarCode = SB_VERT then
    if VertScrollBar.VisibleMode = sbAutoShowEh
      then Result := inherited ScrollBarOccupiedExtent(BarCode)
      else Result := 0
  else
    if HorzScrollBar.VisibleMode = sbAutoShowEh
      then Result := inherited ScrollBarOccupiedExtent(BarCode)
      else Result := 0
end;

function TCustomDBGridEh.ScrollBarPanel: Boolean;
begin
  Result := HorzScrollBar.ScrollBarPanel or VertScrollBar.ScrollBarPanel;
end;

procedure TCustomDBGridEh.UpdateScrollBarPanels;
var
  SHeight, SWidth: Integer;
begin
  if ScrollBarPanel then
  begin
    FHorzScrollBarPanelControl.ExtraPanel.DataSource := DataSource;

    if not HandleAllocated then Exit;

    if (VertScrollBar.VisibleMode = sbNeverShowEh) or
       ( (VertScrollBar.VisibleMode = sbAutoShowEh) and
          not FVertScrollBarPanelControl.ScrollBar.Enabled )
    then
      SWidth := 0
    else
      SWidth := GetSystemMetrics(SM_CXVSCROLL);

    SHeight := GetSystemMetrics(SM_CYHSCROLL);

    OutBoundaryData.RightIndent := SWidth;
    OutBoundaryData.BottomIndent := SHeight;

    if UseRightToLeftAlignment then
    begin
      FHorzScrollBarPanelControl.ExtraPanel.Align := alRight;

      FVertScrollBarPanelControl.SetBounds(0, 0,
        OutBoundaryData.RightIndent, ClientHeight - SHeight);
      FHorzScrollBarPanelControl.SetBounds(SWidth, ClientHeight - SHeight,
        ClientWidth - SWidth, OutBoundaryData.BottomIndent);
      FCornerScrollBarPanelControl.SetBounds(0, ClientHeight - SHeight, SWidth, SHeight);
    end else
    begin
      FHorzScrollBarPanelControl.ExtraPanel.Align := alLeft;

      FVertScrollBarPanelControl.SetBounds(ClientWidth - SWidth, 0,
        OutBoundaryData.RightIndent, ClientHeight - SHeight);
      FHorzScrollBarPanelControl.SetBounds(0, ClientHeight - SHeight,
        ClientWidth - SWidth, OutBoundaryData.BottomIndent);
      FCornerScrollBarPanelControl.SetBounds(ClientWidth - SWidth, ClientHeight - SHeight, SWidth, SHeight);
    end;

    FHorzScrollBarPanelControl.ExtraPanel.BorderColor := GridLineParams.GetBrightColor;

    FVertScrollBarPanelControl.Visible := True;
    FHorzScrollBarPanelControl.Visible := True;
    FHorzScrollBarPanelControl.ExtraPanel.ResetWidth;

    FCornerScrollBarPanelControl.Visible := True;

  end else
  begin
    OutBoundaryData.BottomIndent := 0;
    FHorzScrollBarPanelControl.SetBounds(0,0,0,0);
    FHorzScrollBarPanelControl.Visible := False;

    OutBoundaryData.RightIndent := 0;
    FVertScrollBarPanelControl.SetBounds(0,0,0,0);
    FVertScrollBarPanelControl.Visible := False;

    FCornerScrollBarPanelControl.SetBounds(0,0,0,0);
    FCornerScrollBarPanelControl.Visible := False;
  end;
end;

procedure TCustomDBGridEh.OutBoundaryDataChanged;
begin
  inherited OutBoundaryDataChanged;
  if (FNoDesigntControler = False) and
      Assigned(DBGridEhDesigntControler) and
      (csDesigning in ComponentState)
  then
    DBGridEhDesigntControler.KeyProperyModified(Self);
end;

function TCustomDBGridEh.GetFooterRowCount: Integer;
begin
  Result := FFooterRowCount;
end;

procedure TCustomDBGridEh.SetFooterRowCount(Value: Integer);
begin
  if (Value <> FFooterRowCount) and (Value >= 0) then
  begin
    FFooterRowCount := Value;
    CheckIMemTable;
    if DataGrouping.Active then
      UpdateGroupFooterRowHeights;
    LayoutChanged;
  end;
end;

function TCustomDBGridEh.GetTitleHeight: Integer;
begin
  Result := TitleParams.RowHeight;
end;

procedure TCustomDBGridEh.WriteTitleHeight(Value: Integer);
begin
  TitleParams.RowHeight := Value;
end;

procedure TCustomDBGridEh.ReadTitleHeight(Reader: TReader);
begin
  TitleHeight := Reader.ReadInteger;
end;

function TCustomDBGridEh.GetTitleLines: Integer;
begin
  Result := TitleParams.RowLines;
end;

procedure TCustomDBGridEh.WriteTitleLines(Value: Integer);
begin
  TitleParams.RowLines := Value;
end;

procedure TCustomDBGridEh.ReadTitleLines(Reader: TReader);
begin
  TitleLines := Reader.ReadInteger;
end;

procedure TCustomDBGridEh.Paint;
var
  I: Integer;
  VVisibleDataRowCount: Integer;
  J: Integer;
begin

  if FShowingLoadingMode then
    Canvas.Draw(0,0, FLoadingModeBitmap)
  else
  begin

    FDrawnGroupList.Clear;
    ClearPainted(FHeadTree);
    if HaveHideDuplicates then
    begin
      VVisibleDataRowCount := VisibleDataRowCount+2;
      for I := 0 to Columns.Count - 1 do
      begin
  {$IFNDEF CIL} //?
        SetLength(Columns[I].FCheckedDuplicates, VVisibleDataRowCount);
        for J := 0 to VVisibleDataRowCount - 1 do
          Columns[I].FCheckedDuplicates[J] := False;
  {$ENDIF}
      end;
    end;
    inherited Paint;

    if FEmptyDataInfo.Showing then
      FEmptyDataInfo.PaintEmptyDataInfo;
  end;
end;

procedure TCustomDBGridEh.StartLoadingStatus(const LoadingCaption : String = ''; RenderDuration: Integer = -1);
begin
  if LoadingCaption <> '' then
    FLoadingModeText := LoadingCaption
  else
    FLoadingModeText := 'Loading...';

  if FLoadingModeCallCount = 0 then
    FLoadingModeBitmap := TBitmap.Create;

  Inc(FLoadingModeCallCount);

  if RenderDuration = -1 then
    RenderDuration := Style.StartLoadingStatusRenderDuration;
  PaintLoadingMode(RenderDuration);

  FShowingLoadingMode := True;

  Repaint;
end;

procedure TCustomDBGridEh.FinishLoadingStatus(RenderDuration: Integer = -1);
begin
  Dec(FLoadingModeCallCount);

  if FLoadingModeCallCount = 0 then
  begin
    if RenderDuration = -1 then
      RenderDuration := Style.FinishLoadingStatusRenderDuration;

    UnpaintLoadingMode(RenderDuration);

    FShowingLoadingMode := False;

    FreeAndNil(FLoadingModeBitmap);

    Repaint;
    UpdateScrollBar;
  end;
end;

procedure TCustomDBGridEh.PaintLoadingMode(RenderDuration: Integer);
var
  w, h: Integer;
  ts: TSize;
  AText: String;
  ADrawRect: TRect;
  bf : BLENDFUNCTION;
  CurGridImage, TransGridImage, TmpLoadingModeBitmap: TBitmap;
  t, RenDur, Steps, StepSize, Step, i: Longword;

  procedure DrawAlphaBlend(Step, Leng: Integer);
  var
    Transp: Integer;
  begin
    Transp := Round(Step * 255 / Leng);
    TransGridImage.Canvas.Brush.Color := clWindow;
    TransGridImage.Canvas.FillRect(Rect(0,0,w, h));

    bf.SourceConstantAlpha := 255 - Transp;
    Windows.AlphaBlend(TransGridImage.Canvas.Handle, 0, 0, w, h,
                       CurGridImage.Canvas.Handle, 0, 0, w, h, bf);

    bf.SourceConstantAlpha := Transp;
    Windows.AlphaBlend(TransGridImage.Canvas.Handle, 0, 0, w, h,
                       TmpLoadingModeBitmap.Canvas.Handle, 0, 0, w, h, bf);

    Repaint;
   end;

begin
  AText := FLoadingModeText;

  w := ClientWidth;
  h := ClientHeight;

  CurGridImage := TBitmap.Create;
  CurGridImage.Width := w;
  CurGridImage.Height := h;

  TransGridImage := TBitmap.Create;
  TransGridImage.Width := w;
  TransGridImage.Height := h;

  FLoadingModeBitmap.Width := w;
  FLoadingModeBitmap.Height := h;

  FLoadingModeBitmap.Canvas.Brush.Color := clGray;
  FLoadingModeBitmap.Canvas.FillRect(Rect(0,0,w, h));

  // transparent
  bf.BlendOp := AC_SRC_OVER;
  bf.BlendFlags := 0;
  bf.SourceConstantAlpha := Trunc(255/100*40); // 40% transparency
  bf.AlphaFormat := 0;
  Windows.AlphaBlend(FLoadingModeBitmap.Canvas.Handle, 0, 0, w, h,
                     Canvas.Handle, 0, 0, w, h, bf);

  with FLoadingModeBitmap do
  begin
    Canvas.Font := Font;

    ts := Canvas.TextExtent(AText);
    ts.cy := ts.cy + 2; // wihtout this patch symbol g sometimes cut buttom

    ADrawRect := Bounds((w shr 1) - (ts.cx shr 1), (h shr 1) - (ts.cy shr 1), ts.cx, ts.cy);

    InflateRect(ADrawRect, 5, 5);

    Canvas.Brush.Color := Color;
    WriteTextEh(Canvas, ADrawRect, True, 6, 6, AText, taCenter, tlCenter, False, False, 0, 0, False, True);

    Canvas.Brush.Color := ApproximateColor(Canvas.Font.Color, Color, 128);
    InflateRect(ADrawRect, 1, 1);
    Canvas.FrameRect(ADrawRect);
  end;

  CurGridImage.Canvas.Brush.Color := clGray;
  CurGridImage.Canvas.FillRect(Rect(0,0,w, h));

  bf.SourceConstantAlpha := 255; // 0% transparency
  Windows.AlphaBlend(CurGridImage.Canvas.Handle, 0, 0, w, h,
                     Canvas.Handle, 0, 0, w, h, bf);

  FShowingLoadingMode := True;
  TmpLoadingModeBitmap := FLoadingModeBitmap;
  FLoadingModeBitmap := TransGridImage;

  t := GetTickCount;
  Steps := RenderDuration;
  i := 1;
  Step := 1;
  while i < Steps do
  begin
    DrawAlphaBlend(i, Steps);
    RenDur := GetTickCount - t;
    if RenDur > 0
      then StepSize := Round(RenDur / Step)
      else StepSize := 1;
    if StepSize = 0 then
      StepSize := 1;
    i := i + StepSize;
    Inc(Step);
//    Sleep(2); // It is necessary to calculate the sum time occurrence does not exceed 300 ms
  end;

//  FullDur := GetTickCount - t;
  if t <> 0 then Sleep(t div t);
  FLoadingModeBitmap := TmpLoadingModeBitmap;

  FreeAndNil(CurGridImage);
  FreeAndNil(TransGridImage);
end;

procedure TCustomDBGridEh.UnpaintLoadingMode(RenderDuration: Integer);
var
  w, h: Integer;
  AText: String;
  bf : BLENDFUNCTION;
  TransGridImage, NewGridImage, TmpLoadingModeBitmap: TBitmap;
  i, t, RenDur, Steps, StepSize, Step: Longword;

  procedure DrawAlphaBlend(Step, Leng: Integer);
  var
    Transp: Integer;
  begin
    Transp := Round(Step * 255 / Leng);

    TransGridImage.Canvas.Brush.Color := clWindow;
    TransGridImage.Canvas.FillRect(Rect(0,0,w, h));

    bf.SourceConstantAlpha := 255 - Transp;
    Windows.AlphaBlend(TransGridImage.Canvas.Handle, 0, 0, w, h,
                       TmpLoadingModeBitmap.Canvas.Handle, 0, 0, w, h, bf);

    bf.SourceConstantAlpha := Transp;
    Windows.AlphaBlend(TransGridImage.Canvas.Handle, 0, 0, w, h,
                       NewGridImage.Canvas.Handle, 0, 0, w, h, bf);

    Repaint;
   end;

begin
  AText := FLoadingModeText;

  w := ClientWidth;
  h := ClientHeight;

  bf.BlendOp := AC_SRC_OVER;
  bf.BlendFlags := 0;
  bf.AlphaFormat := 0;

  NewGridImage := TBitmap.Create;
  NewGridImage.Width := w;
  NewGridImage.Height := h;

  TransGridImage := TBitmap.Create;
  TransGridImage.Width := w;
  TransGridImage.Height := h;

  // no transparent
  FShowingLoadingMode := False;

  PaintWindow(NewGridImage.Canvas.Handle);

  FShowingLoadingMode := True;
  TmpLoadingModeBitmap := FLoadingModeBitmap;
  FLoadingModeBitmap := TransGridImage;

  t := GetTickCount;
  Steps := RenderDuration;
  i := 1;
  Step := 1;
  while i < Steps do
  begin
    DrawAlphaBlend(i, Steps);
    RenDur := GetTickCount - t;
    if RenDur > 0
      then StepSize := Round(RenDur / Step)
      else StepSize := 1;
    if StepSize = 0 then
      StepSize := 1;
    i := i + StepSize;
    Inc(Step);
//    Sleep(2); // It is necessary to calculate the sum time occurrence does not exceed 300 ms
  end;

//  FullDur := GetTickCount - t;

  FLoadingModeBitmap := TmpLoadingModeBitmap;

  FreeAndNil(NewGridImage);
  FreeAndNil(TransGridImage);
end;

procedure TCustomDBGridEh.ClearPainted(Node: THeadTreeNode);
var
  NextChild: THeadTreeNode;
begin
  if Node = nil then Exit;
  Node.Drawn := False;
  if Node.Child <> nil then
  begin
    NextChild := Node.Child;
    ClearPainted(NextChild);
    NextChild := NextChild.Next;
    while NextChild <> Node.Child do
    begin
      ClearPainted(NextChild);
      NextChild := NextChild.Next;
    end;
  end;
end;

procedure TCustomDBGridEh.WriteVTitleMargin(Value: Integer);
begin
  TitleParams.VTitleMargin := Value;
end;

function TCustomDBGridEh.GetVTitleMargin: Integer;
begin
  Result := TitleParams.VTitleMargin;
end;

procedure TCustomDBGridEh.ReadVTitleMargin(Reader: TReader);
begin
  VTitleMargin := Reader.ReadInteger;
end;

procedure TCustomDBGridEh.WritEhTitleMargin(Value: Integer);
begin
  FHTitleMargin := Value;
  LayoutChanged;
end;

procedure TCustomDBGridEh.WriteUseMultiTitle(Value: Boolean);
begin
  TitleParams.MultiTitle := Value;
end;

function TCustomDBGridEh.GetUseMultiTitle: Boolean;
begin
  Result := TitleParams.MultiTitle;
end;

function TCustomDBGridEh.IsUseMultiTitle: Boolean;
begin
  Result := UseMultiTitle and not RowPanel.Active;
end;

procedure TCustomDBGridEh.ReadUseMultiTitle(Reader: TReader);
begin
  UseMultiTitle := Reader.ReadBoolean;
end;


procedure TCustomDBGridEh.SetRowSizingAllowed(Value: Boolean);
begin
  if Value <> FRowSizingAllowed then
  begin
    FRowSizingAllowed := Value;
    if FRowSizingAllowed
      then inherited Options := inherited Options + [goRowSizing]
      else inherited Options := inherited Options - [goRowSizing];
  end;
end;

function TCustomDBGridEh.GetRowHeight: Integer;
begin
  Result := FNewRowHeight;
end;

procedure TCustomDBGridEh.SetRowHeight(Value: Integer);
begin
  if Value <> FNewRowHeight then
  begin
    FNewRowHeight := iif(Value < 0, 0, Value);
    LayoutChanged;
    UpdateAllDataRowHeights;
  end;
end;

function TCustomDBGridEh.GetRowLines: Integer;
begin
  Result := FRowLines;
end;

procedure TCustomDBGridEh.SetRowLines(Value: Integer);
begin
  if Value <> FRowLines then
  begin
    FRowLines := iif(Value < 0, 0, Value);
    LayoutChanged;
    UpdateAllDataRowHeights;
  end;
end;


procedure TCustomDBGridEh.RowHeightsChanged;
var
  I, ThisHasChanged, Def: Integer;
begin
  if not (dghAutoFitRowHeight in OptionsEh) and not Assigned(OnGetRowHeight) then
  if (FDefaultRowChanged = True) then
  begin
    FDefaultRowChanged := False;
    ThisHasChanged := -1;
    Def := FStdDefaultRowHeight;
    for I := Ord(dgTitles in Options) to RowCount-1 do
      if CellRowHeights[I] <> Def then
      begin
        ThisHasChanged := I;
        Break;
      end;
    if ThisHasChanged <> -1 then
    begin
      FRowLines := 0;
      SetRowHeight(CellRowHeights[ThisHasChanged]);
      UpdateScrollBar;
    end;
  end;
  inherited;
  if ViewScroll then
    UpdateScrollBar;
end;

function TCustomDBGridEh.CalcStdDefaultRowHeight: Integer;
var K: Integer;
begin
  if not HandleAllocated then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    K := Canvas.TextHeight('Wg');
    if Flat
      then K := K + 1
      else K := K + 3;
    if dgRowLines in Options then
      Inc(K, GridLineWidth);
    Result := K;
  finally
    if not HandleAllocated then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;
end;

procedure TCustomDBGridEh.StopTracking;
begin
  if FTracking then
  begin
    if FDBGridEhState = dgsRowMoving then
      EndRowMoving(-1, -1, False);
    StopTimer;
    FIndicatorPressed := False;
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
    FPressedCol := -1;
    FPressedDataCol := -1;
    FDataTracking := False;
    FDBGridEhState := dgsNormal;
    IndicatorTitle.FDown := False;
  end;
end;

procedure TCustomDBGridEh.TrackButton(X, Y: Integer);
var
  Cell: TGridCoord;
  NewPressed: Boolean;
  ARect: TRect;
  Column: TColumnEh;
  AStateRect, GroupRect: TRect;
  k: Integer;
begin
  Cell := MouseCoord(X, Y);
  Column := nil;
  if (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    ARect := CellRect(Cell.X, Cell.Y);
    if Cell.X >= IndicatorOffset then
      if RowPanel.Active then
        Column := GetColumnInRowPanelAtPos(
          Point(X-ARect.Left+FDataOffset.cx, Y-ARect.Top), False)
      else
        Column := Columns[Cell.X-IndicatorOffset];
  end;
  if FDBGridEhState = dgsGroupPanelTitleDown then
  begin
    GroupRect := EmptyRect;
    NewPressed := False;
    for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      if UseRightToLeftAlignment then
      begin
        GroupRect.Right := ClientWidth - DataGrouping.ActiveGroupLevels[k].GroupPanelRect.Left;
        GroupRect.Left := ClientWidth - DataGrouping.ActiveGroupLevels[k].GroupPanelRect.Right;
      end;
      if PtInRect(GroupRect, Point(X, Y)) then
      begin
        if k = FPressedDataGroupLevelIdx then
        begin
          NewPressed := True;
          Break;
        end;
      end;
    end;
    if FPressed <> NewPressed then
    begin
      FPressed := NewPressed;
      WindowsInvalidateRect(Handle, GroupRect, False);
    end;
  end else if FDBGridEhState = dgsTitleFilterButtonDown then
  begin
    ARect := CellRect(Cell.X, Cell.Y);
    if (GetMouseHitCellState(Cell, Point(X,Y), ARect, Column, AStateRect) = dgsTitleFilterButtonDown) and
      (FPressedCol = Cell.X)
      then NewPressed := True
      else NewPressed := False;
  end
  else if RowPanel.Active and (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    NewPressed := PtInRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
      and (FPressedCol = Cell.X) and (Cell.Y = 0);
    if Assigned(Column) and NewPressed and (Column.Index = FPressedDataCol)
      then NewPressed := True
      else NewPressed := False;
  end else
  begin
    NewPressed := PtInRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
      and (FPressedCol = Cell.X) and (Cell.Y = 0);
    if (IsUseMultiTitle = True) and NewPressed then
    begin
      ARect := CellRect(Cell.X, Cell.Y);
      if Cell.X - IndicatorOffset >= 0 then
        NewPressed := not (PtInRect(Rect(ARect.Left, ARect.Top,
          ARect.Right, ARect.Bottom - FLeafFieldArr[Cell.X - IndicatorOffset].FLeaf.Height + 1),
          Point(X, Y)));
    end;
  end;
  if FPressed <> NewPressed then
  begin
    FPressed := NewPressed;
    GridInvalidateRow(Self, 0);
  end;
end;

procedure TCustomDBGridEh.DoTitleClick(ACol: Longint; AColumn: TColumnEh);
begin
  if Assigned(FOnTitleBtnClick) then FOnTitleBtnClick(Self, ACol, AColumn);
end;

procedure TCustomDBGridEh.CheckTitleButton(ACol: Longint; var Enabled: Boolean);
begin
  if (ACol >= 0) and (ACol < Columns.Count) then
  begin
    if Assigned(FOnCheckButton) then FOnCheckButton(Self, ACol, Columns[ACol], Enabled);
  end
  else Enabled := False;
end;

procedure TCustomDBGridEh.CheckDrawCellBorder(ACol, ARow: Integer;
  BorderType: TGridCellBorderTypeEh; var IsDraw: Boolean;
  var BorderColor: TColor; var IsExtent: Boolean);
var
  AreaCol, AreaRow: Integer;
  CellAreaType: TCellAreaTypeEh;
  NextNode: TGroupDataTreeNodeEh;
  DrawGridBoundaryLine: Boolean;

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

  procedure CheckDrawDataCellBorder;
  begin
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if GridLineParams.DataVertLines
        then BorderColor := GridLineParams.GetDataVertColor
        else BorderColor := clNone;
      IsExtent := True;
      IsDraw := (BorderColor <> clNone);
      if (FrozenCols > 0) and
         (ACol = FixedCols-1) and
         (BorderType = cbtRightEh) and
         (GridLineParams.DataVertColor = clDefault)
      then
        BorderColor := GridLineParams.GetDarkColor;
    end else
    begin
      if GridLineParams.DataHorzLines
        then BorderColor := GridLineParams.GetDataHorzColor
        else BorderColor := clNone;
      IsExtent := True;
      IsDraw := (BorderColor <> clNone);
    end;
  end;

  procedure CheckDrawTitleCellBorder;
  begin
    if TitleParams.BorderInFillStyle then
      if (CellAreaType.HorzType = hctIndicatorEh) then
        if BorderType in [cbtLeftEh, cbtRightEh]
          then IsDraw := True
          else IsDraw := False
      else
        IsDraw := False
    else if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if not TitleParams.VertLines then
        IsDraw := False
      else if TitleParams.VertLines then
      begin
        BorderColor := TitleParams.GetVertLineColor;
        IsDraw := True;
      end;
      if (CellAreaType.HorzType = hctIndicatorEh) and
         (IndicatorParams.GetVertLineColor <> clNone) and
         (GetColorLuminance(TitleParams.GetVertLineColor) >
          GetColorLuminance(IndicatorParams.GetHorzLineColor)) then
      begin
        BorderColor := IndicatorParams.GetVertLineColor;
        IsDraw := True;
      end;
    end else
    begin
      BorderColor := TitleParams.GetHorzLineColor;
      IsDraw := TitleParams.HorzLines;
    end;
  end;

  procedure CheckDrawFooterCellBorder;
  begin
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if not FooterParams.VertLines then
      begin
        IsDraw := False;
        BorderColor := IndicatorParams.GetVertLineColor;
      end else if FooterParams.GetVertLineColor <> clNone then
      begin
        BorderColor := FooterParams.GetVertLineColor;
        IsDraw := True;
      end;
      if (CellAreaType.HorzType = hctIndicatorEh) and
         (IndicatorParams.GetVertLineColor <> clNone) and
         (GetColorLuminance(TitleParams.GetVertLineColor) >
          GetColorLuminance(IndicatorParams.GetHorzLineColor)) then
      begin
        BorderColor := IndicatorParams.GetVertLineColor;
        IsDraw := True;
      end;
    end else
    begin
      if BorderType = cbtTopEh then
      begin
        IsDraw := (dgRowLines in Options) or GridLineParams.GridBoundaries;
        BorderColor := FooterParams.GetHorzLineColor;
      end else if not FooterParams.HorzLines then
      begin
        BorderColor := FooterParams.GetHorzLineColor;
        IsDraw := False
      end else if FooterParams.GetHorzLineColor <> clNone then
      begin
        BorderColor := FooterParams.GetHorzLineColor;
        IsDraw := True;
      end;
      if ((ARow = RowCount) and (BorderType = cbtTopEh))
        or
         ((ARow = FullRowCount-1) and (BorderType = cbtBottomEh))
      then
        if GetColorLuminance(FooterParams.GetHorzLineColor) >
           GetColorLuminance(FooterParams.GetVertLineColor)
        then
        begin
          BorderColor := FooterParams.GetVertLineColor;
//          IsDraw := True;
        end;
    end;
  end;

  procedure CheckDrawSubtitleCellBorder;
  begin
    CheckDrawTitleCellBorder;
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if STFilter.GetVertLineColor <> clNone then
      begin
        BorderColor := STFilter.GetVertLineColor;
//        IsDraw := True;
      end;
    end else
    begin
      if STFilter.GetHorzLineColor <> clNone then
      begin
        BorderColor := STFilter.GetHorzLineColor;
//        IsDraw := True;
      end;
    end;
  end;

  procedure CheckDrawIndicatorCellBorder;
  begin
    if BorderType in [cbtLeftEh, cbtRightEh] then
    begin
      if not IndicatorParams.VertLines then
        IsDraw := False
      else if IndicatorParams.GetVertLineColor <> clNone then
      begin
        BorderColor := IndicatorParams.GetVertLineColor;
        IsDraw := True;
      end;
    end else
    begin
      if not IndicatorParams.HorzLines then
        IsDraw := False
      else if IndicatorParams.GetHorzLineColor <> clNone then
      begin
        BorderColor := IndicatorParams.GetHorzLineColor;
        IsDraw := True;
      end;
    end;
    if CellAreaType.VertType = vctFooterEh then
    begin
      if not IndicatorParams.HorzLines then
        CheckDrawFooterCellBorder
      else
      begin
        if (ARow = RowCount) and (BorderType = cbtTopEh) then
        begin
          IsDraw := (dgRowLines in Options) or GridLineParams.GridBoundaries;
          if IndicatorParams.HorzLines
            then BorderColor := IndicatorParams.GetHorzLineColor
            else BorderColor := FooterParams.GetHorzLineColor;
        end;
        if (ARow = FullRowCount-1) and (BorderType = cbtBottomEh)
        then
          if BorderType = cbtBottomEh then
            IsDraw := FooterParams.HorzLines;
          if GetColorLuminance(IndicatorParams.GetHorzLineColor) >
             GetColorLuminance(IndicatorParams.GetVertLineColor)
          then
          begin
            BorderColor := IndicatorParams.GetVertLineColor;
  //          IsDraw := True;
          end;
      end;
    end else if CellAreaType.VertType = vctSubTitleEh then
     CheckDrawTitleCellBorder;
  end;

  procedure CheckDrawGridBoundary;
  begin
    DrawGridBoundaryLine := False;
    if ((BorderType in [cbtLeftEh, cbtRightEh]) and (GetLastVisibleCol = ACol)) or
       ((BorderType in [cbtLeftEh]) and (ColCount = ACol)) // Contra line
    then
    begin
      if (CellAreaType.VertType = vctTitleEh) and
         (GridLineParams.GridBoundaries or
          (not AutoFitColWidths and TitleParams.VertLines) or
          ((BorderType in [cbtLeftEh]) and (ColCount = ACol) and (dgColLines in Options))
         ) then
      begin
        BorderColor := MightierColor(TitleParams.GetVertLineColor, TitleParams.GetHorzLineColor);
        if BorderColor = clNone then
          BorderColor := GridLineParams.GetDarkColor;
        DrawGridBoundaryLine := True;
      end else if (CellAreaType.VertType = vctDataEh) and
          (GridLineParams.GridBoundaries or
           ((BorderType in [cbtLeftEh]) and (ColCount = ACol) and (dgColLines in Options))
          ) then
      begin
        if GridLineParams.DataBoundaryColor <> clDefault then
        begin
          BorderColor := GridLineParams.DataBoundaryColor;
          if GridLineParams.DataBoundaryColor = clNone
            then IsDraw := False
            else DrawGridBoundaryLine := True
        end else
        begin
          if (GridLineParams.DataVertColor = clDefault) and
             (GridLineParams.DataHorzColor = clDefault) 
          then
            BorderColor := GridLineParams.GetDarkColor
          else if (GridLineParams.GetDataVertColor = GridLineParams.GetDataHorzColor) and
             (GridLineParams.GetDataVertColor <> clNone)
          then
            BorderColor := GridLineParams.GetDataVertColor
          else
            BorderColor := MightierColor(GridLineParams.GetDataVertColor, GridLineParams.GetDataHorzColor);
          DrawGridBoundaryLine := True;
        end;
      end else if (CellAreaType.VertType = vctFooterEh) and
         (GridLineParams.GridBoundaries or
          (not AutoFitColWidths and FooterParams.HorzLines and (GetLastVisibleCol = ACol))  or
          ((BorderType in [cbtLeftEh]) and (ColCount = ACol) and (dgColLines in Options))
         ) then
      begin
        BorderColor := MightierColor(FooterParams.GetVertLineColor, FooterParams.GetHorzLineColor);
        if BorderColor = clNone then
          BorderColor := GridLineParams.GetDarkColor;
        DrawGridBoundaryLine := True;
      end else if (CellAreaType.VertType = vctSubTitleEh) and
         (GridLineParams.GridBoundaries or
          (not AutoFitColWidths and TitleParams.VertLines) or
          ((BorderType in [cbtLeftEh]) and (ColCount = ACol) and (dgColLines in Options))
         ) then
      begin
        BorderColor := MightierColor(STFilter.GetVertLineColor, STFilter.GetHorzLineColor);
        if BorderColor = clNone then
          BorderColor := GridLineParams.GetDarkColor;
        DrawGridBoundaryLine := True;
      end else if GridLineParams.GridBoundaries and
            (dgRowLines in Options) and
         (  (GetColorLuminance(GridLineParams.GetDataVertColor) >
             GetColorLuminance(GridLineParams.GetDataHorzColor))
           or not (dgColLines in Options))
      then
      begin
        BorderColor := GridLineParams.GetDataHorzColor;
        DrawGridBoundaryLine := True;
      end;
      if DrawGridBoundaryLine then
        IsExtent := True;
    end else if GridLineParams.GridBoundaries and
                (BorderType in [cbtTopEh, cbtBottomEh]) and
                (GetLastVisibleRow = ARow) and
                (GridLineParams.VertEmptySpaceStyle = dessNonEh) then
    begin
      if CellAreaType.HorzType = hctIndicatorEh then
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

begin
//  inherited CheckDrawCellBorder(ACol, ARow, BorderType, IsDraw, BorderColor, IsExtent);
  if (ColWidths[ACol] = 0) and (BorderType in [cbtLeftEh, cbtRightEh]) then
  begin
    IsDraw := False;
    Exit;
  end;

  if BorderType in [cbtLeftEh, cbtRightEh] then
  begin
    IsDraw := dgColLines in Options;
    IsExtent := True;
  end else
  begin
    IsDraw := dgRowLines in Options;
    IsExtent := True;
  end;

  if (ACol < FixedCols) or (ARow < FixedRows)
    then BorderColor := GridLineParams.GetDarkColor
    else BorderColor := GridLineParams.GetBrightColor;

  CellAreaType := GetCellAreaType(ACol, ARow, AreaCol, AreaRow);
  if (CellAreaType.VertType = vctTitleEh) then
    CheckDrawTitleCellBorder
  else if (CellAreaType.VertType = vctSubTitleEh) then
    CheckDrawSubtitleCellBorder
  else if (CellAreaType.HorzType = hctIndicatorEh) then
    CheckDrawIndicatorCellBorder
  else if (CellAreaType.HorzType = hctDataEh) and (CellAreaType.VertType = vctDataEh) then
    CheckDrawDataCellBorder
  else if (CellAreaType.VertType = vctFooterEh) then
    CheckDrawFooterCellBorder;

  CheckDrawGridBoundary;

  if (ARow < GetTitleRows) and (ACol >= IndicatorOffset) and UseMultiTitle and
    (BorderType in [cbtLeftEh, cbtRightEh]) and not DrawGridBoundaryLine
  then
    IsDraw := False
  else if (CellAreaType.HorzType = hctDataEh) and
          (CellAreaType.VertType = vctDataEh) and
          DataGrouping.IsGroupingWorksWithLevel and
          (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
          DataLink.Active
  then
  begin
    if BorderType in [cbtLeftEh, cbtRightEh, cbtBottomEh] then
    begin
      InstantReadRecordEnter(AreaRow);
      if (InstantReadCurDataNode.NodeType = dntDataGroupEh) and
         (BorderType in [cbtLeftEh, cbtRightEh])
      then
      begin
        if BorderType = cbtRightEh then
          if ACol = FLastVisibleCol then
            IsDraw := GridLineParams.DataVertLines or GridLineParams.GridBoundaries
          else if ACol = FullColCount-1 then
            IsDraw := GridLineParams.DataVertLines
          else
            IsDraw := False;
      end else if (InstantReadCurDataNode.NodeType = dntDataGroupEh) and
              (BorderType in [cbtBottomEh]) {and
              (Columns[AreaCol] = VisibleColumns[0])}
      then
        IsDraw := False
      else if (InstantReadCurDataNode.NodeType = dntDataGroupFooterEh) then
      begin
        CheckDrawFooterCellBorder;
        CheckDrawGridBoundary;
        if not IsDraw then
          if BorderType in [cbtLeftEh, cbtRightEh]
            then
              IsDraw := (dgColLines in Options) or
                         GridLineParams.DataVertLines or
                         FooterParams.VertLines
            else
              IsDraw := (dgRowLines in Options) or
                           GridLineParams.DataHorzLines or
                           FooterParams.HorzLines;
        if (InstantReadCurDataNode.NodeType in [dntDataSetRecordEh, dntDataGroupFooterEh]) and
              (BorderType in [cbtBottomEh]) and
              (Columns[AreaCol] = VisibleColumns[0])
        then
          IsDraw := False
//        BorderColor := GridLineParams.GetDarkColor;
      end else if (InstantReadCurDataNode.NodeType = dntDataSetRecordEh) and
                  (BorderType in [cbtBottomEh]) then
      begin
        if AreaRow < InstantReadRecordCount-1 then
        begin
          InstantReadRecordEnter(AreaRow+1);
          NextNode := InstantReadCurDataNode;
          InstantReadRecordLeave;
          if NextNode.NodeType = dntDataGroupEh then
          begin
            IsDraw := True;
            BorderColor := GridLineParams.GetDataHorzColor;
          end else if NextNode.NodeType = dntDataGroupFooterEh then
          begin
            CheckDrawFooterCellBorder;
            IsDraw := (dgRowLines in Options) or GridLineParams.DataHorzLines or FooterParams.HorzLines;
          end;
        end else if not GridLineParams.GridBoundaries then
        begin
          IsDraw := True;
          BorderColor := GridLineParams.GetDataHorzColor;
        end;
        if (InstantReadCurDataNode.NodeType in [dntDataSetRecordEh, dntDataGroupFooterEh]) and
              (BorderType in [cbtBottomEh]) and
              (Columns[AreaCol] = VisibleColumns[0])
        then
          IsDraw := False
      end;
      InstantReadRecordLeave;
    end;
  end;
end;

function TCustomDBGridEh.SetChildTreeHeight(ANode: THeadTreeNode): Integer;
var htLast: THeadTreeNode;
  newh, maxh, th: Integer;
  rec: TRect;
  DefRowHeight: Integer;
  s: String;
  RestoreCanvas: Boolean;
  CellOffset: Integer;
begin
  RestoreCanvas := not HandleAllocated and not FCanvasHandleAllocated; //not Canvas.HandleAllocated;
{  if (TitleParams.GetActualFillStyle = cfstGradientEh) and (ThemesEnabled or Style.GradientEnabledInClassicTheme)
    then CellOffset := 4
    else CellOffset := 5;}
  CellOffset := 4;  
  if RestoreCanvas then
  begin
    Canvas.Handle := GetDC(0);
    FCanvasHandleAllocated := True;
  end;
  try
    DefRowHeight := 0;
    Result := 0;
    if (ANode.Child = nil) then Exit;
    htLast := ANode.Child;
    maxh := 0;
    if (htLast.Child <> nil) then
      maxh := SetChildTreeHeight(htLast);
    if htLast.Column <> nil
      then Canvas.Font := htLast.Column.Title.Font
      else Canvas.Font := TitleFont;

    rec := Rect(0, 0, htLast.Width - CellOffset - htLast.WIndent, DefRowHeight);
    if (rec.Left >= rec.Right) then rec.Right := rec.Left + 1; //?????
    s := htLast.Text;
    if s = '' then s := ' ';
    if (htLast.Column <> nil) and (htLast.Column.Title.Orientation = tohVertical) then
      th := iif(htLast.Width > 0,
        WriteTextVerticalEh(Canvas, rec, False, 0, 0, s, taLeftJustify, tlBottom, False, True) + 6
        , 0)
    else
      th := iif(htLast.Width > 0,
        DrawTextEh(Canvas.Handle, s,
        Length(s), rec, DT_WORDBREAK or DT_CALCRECT), 0) + VTitleMargin;

    if (th > DefRowHeight)
      then maxh := maxh + th
      else maxh := maxh + DefRowHeight;
    if TitleParams.BorderInFillStyle and (htLast.Host = FHeadTree) then
      Inc(maxh);

    while True do
    begin
      if (ANode.Child = htLast.Next) then begin break; end;
      htLast := htLast.Next;
      newh := 0;
      if (htLast.Child <> nil) then
        newh := SetChildTreEheight(htLast);
      rec := Rect(0, 0, htLast.Width - CellOffset - htLast.WIndent, DefRowHeight);
      if (rec.Left >= rec.Right) then
        rec.Right := rec.Left + 1; //?????
      s := htLast.Text;
      if s = '' then s := ' ';
      if htLast.Column <> nil then
        Canvas.Font := htLast.Column.Title.Font;
      if (htLast.Column <> nil) and (htLast.Column.Title.Orientation = tohVertical) then
        th := iif(htLast.Width > 0,
          WriteTextVerticalEh(Canvas, rec, False, 0, 0, s, taLeftJustify, tlBottom, False, True) + 6
          , 0)
      else
        th := iif(htLast.Width > 0,
          DrawTextEh(Canvas.Handle, s,
          Length(s), rec, DT_WORDBREAK or DT_CALCRECT), 0) + VTitleMargin;
      if (th > DefRowHeight)
        then newh := newh + th
        else newh := newh + DefRowHeight;
      if TitleParams.BorderInFillStyle and (htLast.Host = FHeadTree) then
        Inc(newh);
      if (maxh < newh) then
        maxh := newh;
    end;

    htLast := ANode.Child;
    while ANode.Child <> htLast.Next do
    begin
      if (htLast.Child = nil)
        then htLast.Height := maxh
        else htLast.Height := maxh - htLast.Height;
      htLast := htLast.Next;
    end;
    if (htLast.Child = nil)
      then htLast.Height := maxh
      else htLast.Height := maxh - htLast.Height;

    ANode.Height := maxh; //save ChildTree height in Host
    Result := maxh;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
      FCanvasHandleAllocated := False;
    end;
  end
end;

function TCustomDBGridEh.GetColWidths(Index: Longint): Integer;
begin
  Result := inherited ColWidths[Index];
end;

procedure TCustomDBGridEh.SetColWidths(Index: Longint; Value: Integer);
begin
  inherited ColWidths[Index] := Value;
  LayoutChanged;
end;


procedure TCustomDBGridEh.WriteAutoFitColWidths(Value: Boolean);
var i: Integer;
begin
  if (FAutoFitColWidths = Value) then Exit;
  FAutoFitColWidths := Value;
  if (csDesigning in ComponentState) then Exit;
  if (FAutoFitColWidths = True) then
  begin
    if not (csLoading in ComponentState) then
      for i := 0 to Columns.Count - 1 do Columns[i].FInitWidth := Columns[i].Width;
//    ScrollBars := ssNone;
    ScrollBars := ssHorizontal;
  end else
  begin
    Columns.BeginUpdate;
    try
      for i := 0 to Columns.Count - 1 do
        Columns[i].Width := Columns[i].FInitWidth;
    finally
      Columns.EndUpdate;
    end;
    ScrollBars := ssHorizontal;
  end;
  if FAutoFitColWidths then
    LeftCol := FixedCols;
  LayoutChanged;
end;

procedure TCustomDBGridEh.WriteMinAutoFitWidth(Value: Integer);
begin
  FMinAutoFitWidth := Value;
  LayoutChanged;
end;

procedure TCustomDBGridEh.SaveColumnsLayoutProducer(ARegIni: TObject; Section:
  String; DeleteSection: Boolean);
var
  I: Integer;
  S: String;
begin
  if (ARegIni is TRegIniFile) then
    TRegIniFile(ARegIni).EraseSection(Section)
  else if DeleteSection then
    TCustomIniFile(ARegIni).EraseSection(Section);

  with Columns do
  begin
    for I := 0 to Count - 1 do
    begin
      if ARegIni is TRegIniFile then
        TRegIniFile(ARegIni).WriteString(Section, Format('%s.%s', [Name, Items[I].FieldName]),
          Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index,
            Items[I].Width,
            Integer(Items[I].Title.SortMarker),
            Integer(Items[I].Visible),
            Items[I].Title.SortIndex,
            Items[I].DropDownRows,
            Items[I].DropDownWidth,
            Items[I].InRowLinePos,
            Items[I].InRowLineHeight
            ]))
      else
      begin
        S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index,
                Items[I].Width,
                Integer(Items[I].Title.SortMarker),
                Integer(Items[I].Visible),
                Items[I].Title.SortIndex,
                Items[I].DropDownRows,
                Items[I].DropDownWidth,
                Items[I].InRowLinePos,
                Items[I].InRowLineHeight
                ]);
        if S <> '' then
        begin
          if ((S[1] = '"') and (S[Length(S)] = '"')) or
          ((S[1] = '''') and (S[Length(S)] = '''')) then
            S := '"' + S + '"';
        end;
      end;
      if ARegIni is TCustomIniFile
        then TCustomIniFile(ARegIni).WriteString(Section, Format('%s.%s', [Name, Items[I].FieldName]), S);
    end;
  end;
end;

procedure TCustomDBGridEh.RestoreColumnsLayoutProducer(ARegIni: TObject;
  Section: String; RestoreParams: TColumnEhRestoreParams);
type
  TColumnInfo = record
    Column: TColumnEh;
    EndIndex: Integer;
    SortMarker: TSortMarkerEh;
    SortIndex: Integer;
  end;
  PColumnArray = ^TColumnArray;
  TColumnArray = array[0..0] of TColumnInfo;
const
  Delims = [' ', ','];
var
  I, J: Integer;
  S: string;
  ColumnArray: array of TColumnInfo;
  AAutoFitColWidth: Boolean;
begin
  AAutoFitColWidth := False;
  BeginUpdate;
  try
    if (AutoFitColWidths) then
    begin
      AutoFitColWidths := False;
      AAutoFitColWidth := True;
    end;
    with Columns do
    begin
      SetLength(ColumnArray, Count);
      try
        for I := 0 to Count - 1 do
        begin
          if (ARegIni is TRegIniFile)
            then S := TRegIniFile(ARegIni).ReadString(Section, Format('%s.%s', [Name, Items[I].FieldName]), '')
            else S := TCustomIniFile(ARegIni).ReadString(Section, Format('%s.%s', [Name, Items[I].FieldName]), '');
          ColumnArray[I].Column := Items[I];
          ColumnArray[I].EndIndex := Items[I].Index;
          if S <> '' then
          begin
            ColumnArray[I].EndIndex := StrToIntDef(ExtractWord(1, S, Delims),
              ColumnArray[I].EndIndex);
            if (crpColWidthsEh in RestoreParams) then
              Items[I].Width := StrToIntDef(ExtractWord(2, S, Delims),
                Items[I].Width);
            if (crpSortMarkerEh in RestoreParams) then
              Items[I].Title.SortMarker := TSortMarkerEh(StrToIntDef(ExtractWord(3, S, Delims),
                Integer(Items[I].Title.SortMarker)));
            if (crpColVisibleEh in RestoreParams) then
              Items[I].Visible := Boolean(StrToIntDef(ExtractWord(4, S, Delims), Integer(Items[I].Visible)));
            if (crpSortMarkerEh in RestoreParams) then
              ColumnArray[I].SortIndex := StrToIntDef(ExtractWord(5, S, Delims), 0);
            if (crpDropDownRowsEh in RestoreParams) then
              Items[I].DropDownRows := StrToIntDef(ExtractWord(6, S, Delims), Items[I].DropDownRows);
            if (crpDropDownWidthEh in RestoreParams) then
              Items[I].DropDownWidth := StrToIntDef(ExtractWord(7, S, Delims), Items[I].DropDownWidth);
            if (crpRowPanelColPlacementEh in RestoreParams) then
            begin
              Items[I].InRowLinePos := StrToIntDef(ExtractWord(8, S, Delims), Items[I].InRowLinePos);
              Items[I].InRowLineHeight := StrToIntDef(ExtractWord(9, S, Delims), Items[I].InRowLineHeight);
            end;
          end;
        end;
        if (crpSortMarkerEh in RestoreParams) then
          for I := 0 to Count - 1 do
            Items[I].Title.SortIndex := ColumnArray[I].SortIndex;
        if (crpColIndexEh in RestoreParams) then
          for I := 0 to Count - 1 do
            for J := 0 to Count - 1 do
              if ColumnArray[J].EndIndex = I then
              begin
                ColumnArray[J].Column.Index := ColumnArray[J].EndIndex;
                Break;
              end;

      finally
        SetLength(ColumnArray, 0);
      end;
    end;
  finally
    EndUpdate;
    if (AAutoFitColWidth = True)
      then AutoFitColWidths := True
      else LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.SaveColumnsLayoutIni(IniFileName: String;
  Section: String; DeleteSection: Boolean);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    SaveColumnsLayoutProducer(IniFile, Section, DeleteSection);
  finally
    IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.RestoreColumnsLayoutIni(IniFileName: String;
  Section: String; RestoreParams: TColumnEhRestoreParams);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    RestoreColumnsLayoutProducer(IniFile, Section, RestoreParams);
  finally
    IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.SaveColumnsLayout(ARegIni: TRegIniFile);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  SaveColumnsLayoutProducer(ARegIni, Section, True);
end;

procedure TCustomDBGridEh.SaveColumnsLayout(ACustIni: TCustomIniFile; Section: String);
begin
  SaveColumnsLayoutProducer(ACustIni, Section, False);
end;

procedure TCustomDBGridEh.RestoreColumnsLayout(ARegIni: TRegIniFile; RestoreParams: TColumnEhRestoreParams);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  RestoreColumnsLayoutProducer(ARegIni, Section, RestoreParams);
end;

procedure TCustomDBGridEh.RestoreColumnsLayout(ACustIni: TCustomIniFile;
  Section: String; RestoreParams: TColumnEhRestoreParams);
begin
  RestoreColumnsLayoutProducer(ACustIni, Section, RestoreParams);
end;

procedure TCustomDBGridEh.SaveGridLayoutProducer(ARegIni: TObject;
  Section: String; DeleteSection: Boolean);
begin
  SaveColumnsLayoutProducer(ARegIni, Section, DeleteSection);
  if ARegIni is TRegIniFile then
    TRegIniFile(ARegIni).WriteString(Section, '', Format('%d,%d', [RowHeight, RowLines]))
  else if ARegIni is TCustomIniFile then
    TCustomIniFile(ARegIni).WriteString(Section, '(Default)', Format('%d,%d', [RowHeight, RowLines]));
end;

procedure TCustomDBGridEh.RestoreGridLayoutProducer(ARegIni: TObject; Section: String; RestoreParams: TDBGridEhRestoreParams);
const
  Delims = [' ', ','];
var ColRestParams: TColumnEhRestoreParams;
  S: String;
begin
  ColRestParams := [];
  if grpColIndexEh in RestoreParams then Include(ColRestParams, crpColIndexEh);
  if grpColWidthsEh in RestoreParams then Include(ColRestParams, crpColWidthsEh);
  if grpSortMarkerEh in RestoreParams then Include(ColRestParams, crpSortMarkerEh);
  if grpColVisibleEh in RestoreParams then Include(ColRestParams, crpColVisibleEh);
  if grpDropDownRowsEh in RestoreParams then Include(ColRestParams, crpDropDownRowsEh);
  if grpDropDownWidthEh in RestoreParams then Include(ColRestParams, crpDropDownWidthEh);
  if grpRowPanelColPlacementEh in RestoreParams then Include(ColRestParams, crpRowPanelColPlacementEh);

  RestoreColumnsLayoutProducer(ARegIni, Section, ColRestParams);

  if (ARegIni is TRegIniFile)
    then S := TRegIniFile(ARegIni).ReadString(Section, '', '')
    else S := TCustomIniFile(ARegIni).ReadString(Section, '(Default)', '');

  if (grpRowHeightEh in RestoreParams) then
  begin
    RowHeight := StrToIntDef(ExtractWord(1, S, Delims), 0);
    RowLines := StrToIntDef(ExtractWord(2, S, Delims), 0);
  end;
end;

procedure TCustomDBGridEh.SaveGridLayout(ARegIni: TRegIniFile);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  SaveGridLayoutProducer(ARegIni, Section, True);
end;

procedure TCustomDBGridEh.SaveGridLayout(ACustIni: TCustomIniFile; Section: String);
begin
  SaveGridLayoutProducer(ACustIni, Section, False);
end;

procedure TCustomDBGridEh.RestoreGridLayout(ARegIni: TRegIniFile;
  RestoreParams: TDBGridEhRestoreParams);
var
  Section: String;
begin
  Section := GetDefaultSection(Self);
  RestoreGridLayoutProducer(ARegIni, Section, RestoreParams);
end;

procedure TCustomDBGridEh.RestoreGridLayout(ARegIni: TCustomIniFile;
  Section: String; RestoreParams: TDBGridEhRestoreParams);
begin
  RestoreGridLayoutProducer(ARegIni, Section, RestoreParams);
end;

procedure TCustomDBGridEh.SaveGridLayoutIni(IniFileName: String;
  Section: String; DeleteSection: Boolean);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    SaveGridLayoutProducer(IniFile, Section, DeleteSection);
  finally
    IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.RestoreGridLayoutIni(IniFileName: String;
  Section: String; RestoreParams: TDBGridEhRestoreParams);
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFileName);
  try
    RestoreGridLayoutProducer(IniFile, Section, RestoreParams);
  finally
    IniFile.Free;
  end;
end;

procedure TCustomDBGridEh.SetFrozenCols(Value: Integer);
begin
  if (Value = FFrozenCols) or (Value < 0) then Exit;
  if not (csLoading in ComponentState) then
  begin
    if Value < 0 then
      raise EInvalidGridOperationEh.Create(SIndexOutOfRange);
    if Value >= ColCount-IndicatorOffset then
      raise EInvalidGridOperationEh.Create('Frozen column count must be less than scrollable column count');
  end;    
  FFrozenCols := Value;
  LayoutChanged;
end;

function TCustomDBGridEh.GetFooterFont: TFont;
begin
  Result := FooterParams.Font;
end;

procedure TCustomDBGridEh.SetFooterFont(Value: TFont);
begin
  FooterParams.Font := Value;
end;

procedure TCustomDBGridEh.SetFooterColor(Value: TColor);
begin
  FooterParams.Color := Value;
end;

function TCustomDBGridEh.GetFooterColor: TColor;
begin
  Result := FooterParams.Color;
end;

procedure TCustomDBGridEh.ReadFooterColor(Reader: TReader);
begin
  if Reader.NextValue = vaIdent then
    FooterColor := StringToColor(Reader.ReadIdent)
  else
    FooterColor := TColor(Reader.ReadInteger);
end;

procedure TCustomDBGridEh.ChangeGridOrientation(RightToLeftOrientation: Boolean);
var
  Org: TPoint;
  Ext: TPoint;
begin
  if RightToLeftOrientation then
  begin
    Org := Point(ClientWidth, 0);
    Ext := Point(-1, 1);
    SetMapMode(Canvas.Handle, mm_Anisotropic);
    SetWindowOrgEx(Canvas.Handle, Org.X, Org.Y, nil);
    SetViewportExtEx(Canvas.Handle, ClientWidth, ClientHeight, nil);
    SetWindowExtEx(Canvas.Handle, Ext.X * ClientWidth, Ext.Y * ClientHeight, nil);
  end else
  begin
    Org := Point(0, 0);
    Ext := Point(1, 1);
    SetMapMode(Canvas.Handle, mm_Anisotropic);
    SetWindowOrgEx(Canvas.Handle, Org.X, Org.Y, nil);
    SetViewportExtEx(Canvas.Handle, ClientWidth, ClientHeight, nil);
    SetWindowExtEx(Canvas.Handle, Ext.X * ClientWidth, Ext.Y * ClientHeight, nil);
  end;
end;

procedure TCustomDBGridEh.WriteHighlightedSubCellTextEh(Column: TColumnEh;
  C: TCanvas;
  AR: TRect;X, Y: Integer;
  T: string;A: TAlignment;La:TTextLayout;ML:Boolean;EE: Boolean;
  L, R: Integer;rlr: Boolean;S: String;CI: Boolean;HC: TColor;Pos: Integer;
  PosC: TColor);
var
  IsUseRightToLeftAlignment: Boolean;
begin
  if Column <> nil
    then IsUseRightToLeftAlignment := Column.UseRightToLeftAlignment
    else IsUseRightToLeftAlignment := UseRightToLeftAlignment;
  if Self.UseRightToLeftAlignment then
  begin
    WindowsLPtoDP(Canvas.Handle, AR);
    SwapInt(AR.Left, AR.Right);
    ChangeGridOrientation(False);

    if IsUseRightToLeftAlignment then
      if A = taLeftJustify then
        A := taRightJustify
      else if A = taRightJustify then
        A := taLeftJustify;
  end;
  DrawHighlightedSubTextEh(C, AR, X, Y, T, A, La, ML, EE, L, R, rlr, S, CI, HC, Pos, PosC);
  if Self.UseRightToLeftAlignment then
    ChangeGridOrientation(True);
end;

procedure TCustomDBGridEh.PaintClippedImage(imList: TCustomImageList; Bitmap: TBitmap;
  ACanvas: TCanvas; ARect: TRect; Index,
  ALeftMarg: Integer; Align: TAlignment; ClipRect: TRect);
begin
  if Self.UseRightToLeftAlignment then
  begin
    WindowsLPtoDP(Canvas.Handle, ARect);
    SwapInt(ARect.Left, ARect.Right);
    WindowsLPtoDP(Canvas.Handle, ClipRect);
    SwapInt(ClipRect.Left, ClipRect.Right);
    ChangeGridOrientation(False);
  end;
  DrawClipped(imList, Bitmap, ACanvas, ARect, Index, ALeftMarg, Align, ClipRect);
  if Self.UseRightToLeftAlignment then
    ChangeGridOrientation(True);
end;

procedure TCustomDBGridEh.SetMaxSizeForCheckbox(var ARect: TRect);
begin
  ARect.Left := ARect.Left + iif(ARect.Right - ARect.Left < DefaultCheckBoxWidth, 0,
    (ARect.Right - ARect.Left) shr 1 - DefaultCheckBoxWidth shr 1);
  ARect.Right := iif(ARect.Right - ARect.Left < DefaultCheckBoxWidth, ARect.Right,
    ARect.Left + DefaultCheckBoxWidth);
  ARect.Top := ARect.Top + iif(ARect.Bottom - ARect.Top < DefaultCheckBoxHeight, 0,
    (ARect.Bottom - ARect.Top) shr 1 - DefaultCheckBoxHeight shr 1);
  ARect.Bottom := iif(ARect.Bottom - ARect.Top < DefaultCheckBoxHeight, ARect.Bottom,
    ARect.Top + DefaultCheckBoxHeight);
end;

function TCustomDBGridEh.CanDrawFocusRowRect: Boolean;
begin
  Result := not (csDesigning in ComponentState) and
    (dgRowSelect in Options) and DefaultDrawing and Focused;
end;

procedure TCustomDBGridEh.DrawBorder;
const
  Ctl3DStyles: array[Boolean] of UINT = (BF_MONO, 0);
var
  DC, OldDC: HDC;
  R, R1: TRect;
begin
  inherited DrawBorder;
  if FBorderWidth <> 0 then
  begin
    DC := GetWindowDC(Handle);
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);

      if not UseRightToLeftAlignment and
         HorzScrollBar.IsScrollBarShowing and (HorzScrollBar.ExtScrollBar = nil) and
         VertScrollBar.IsScrollBarShowing and (HorzScrollBar.ExtScrollBar = nil)
      then
      begin
        R1 := R;
        R1.Left := R1.Right;
        R1.Top := R1.Bottom;
        R1.Left := R1.Left - GetSystemMetrics(SM_CXVSCROLL);
        R1.Top := R1.Top - GetSystemMetrics(SM_CYHSCROLL);
        OffsetRect(R1,-1,-1);
        OldDC := Canvas.Handle;
        Canvas.Handle := DC;
        Canvas.Pen.Color := clBtnFace;
        DrawPolyline([Point(R1.Left, R1.Bottom-1),
                      Point(R1.Left, R1.Top),
                      Point(R1.Right, R1.Top)]);
        Canvas.Handle := OldDC;
      end;
    finally
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TCustomDBGridEh.OverlaySelectionByTheme(Cell, AreaCell: TGridCoord;
  Column: TColumnEh; AreaRect: TRect; var Params: TColCellParamsEh);
{$IFDEF EH_LIB_11}
var
  LRect: TRect;
  LTheme: HTHEME;
  iStateId, iPartId: Integer;
{$ENDIF}
begin
{$IFDEF EH_LIB_11}
  if CanFillSelectionByTheme then
  begin
    LTheme := ThemeServices.Theme[teMenu];
    LRect := AreaRect;
    if IsSelectionActive
      then iStateId := MPI_HOT
      else iStateId := MPI_NORMAL;

    iPartId := MENU_POPUPITEM;

    DrawThemeBackground(LTheme, Canvas.Handle, iPartId, iStateId,
      LRect, {$IFNDEF CLR}@{$ENDIF}AreaRect);
  end
{$ENDIF}
end;

procedure TCustomDBGridEh.DrawSubTitleCell(ACol, ARow: Integer;
  DataCol, DataRow: Integer; CellType: TCellAreaTypeEh; ARect: TRect;
  AState: TGridDrawState; var Highlighted: Boolean);
var
  ABackground: TColor;
  CellMultiSelected: Boolean;
  FilterRect: TRect;
  Column: TColumnEh;
  FlatLineWidth: Integer;
  FInplaceEditorButtonWidth: Integer;
  EditButtonTransparency: Byte;
  State: TDBGirdDrawFixedStateEh;
begin

  if (DataCol >= 0) and (DataCol < Columns.Count)
    then Column := Columns[DataCol]
    else Column := nil;
  if STFilter.Visible
    and (STFilter.Location = stflUnderTitleFilterEh)
    and (ARow = TopDataOffset-1)
    and ((not IndicatorColVisible) or (ACol > 0))
    and CanFilterCol(DataCol)
    and Column.STFilter.Visible then
  begin
    Canvas.Pen.Color := clBlack;
    FilterRect := ARect;

    FlatLineWidth := 0;
    if Flat then
    begin
      if (Column <> nil) and Column.STFilter.DropDownButtonVisible then
        Inc(FlatLineWidth);
    end;

    if Flat
      then FInplaceEditorButtonWidth := FlatButtonWidth
      else FInplaceEditorButtonWidth := GetSystemMetrics(SM_CXVSCROLL);

    if (Column <> nil) and Column.STFilter.DropDownButtonVisible then
      Dec(FilterRect.Right, FInplaceEditorButtonWidth + FlatLineWidth);

    Canvas.Font := STFilter.Font;
    Canvas.Brush.Color := STFilter.GetColor;//ApproximateColor(clWindow, FixedColor, 8); //FixedColor;

    ABackground := Canvas.Brush.Color;
    CellMultiSelected := CellIsMultiSelected(ACol, ARow , DataCol, NilBookmarkEh);
    Highlighted := HighlightNoDataCellColor(ACol, ARow, DataCol, DataRow, CellType, AState,
      CellMultiSelected, ABackground, Canvas.Font);
    Canvas.Brush.Color := ABackground;

    if FilterRect.Right > FilterRect.Left then
      WriteTextEh(Canvas, FilterRect, True, 1, 1, GetFilterValue(DataCol),
        taLeftJustify, Column.Layout, False, False, 0, 0, False, True);

    FilterRect := Rect(FilterRect.Left, FilterRect.Top, FilterRect.Right, FilterRect.Bottom);

    Canvas.Pen.Color := Canvas.Brush.Color;

    if (Column <> nil) and Column.STFilter.DropDownButtonVisible then
    begin
      if csDesigning in ComponentState then
        EditButtonTransparency := 30
      else if FilterEditMode then
        EditButtonTransparency := 0
      else if gdHotTrack in AState then
        EditButtonTransparency := 30
      else
        EditButtonTransparency := 80;

      if FlatLineWidth > 0 then
      begin
        if FilterRect.Right > FilterRect.Left then
          Canvas.Rectangle(FilterRect.Right, FilterRect.Top, FilterRect.Right + 1, FilterRect.Bottom);
        Inc(FilterRect.Right);
      end;
      FilterRect := Rect(FilterRect.Right, FilterRect.Top, FilterRect.Right
        + FInplaceEditorButtonWidth, FilterRect.Top + STFilter.FInplaceEditorButtonHeight);
      if FilterRect.Bottom > ARect.Bottom then
        FilterRect.Bottom := ARect.Bottom;
      if Flat and not ThemesEnabled then
        Dec(FilterRect.Left);
      PaintInplaceButton(Column, Canvas, ebsDropDownEh, FilterRect,  ARect,
        0, False, Flat, DataLink.Active, Canvas.Brush.Color, nil, EditButtonTransparency, nil, 0);
      if FilterRect.Bottom < ARect.Bottom then
        Canvas.FillRect(Rect(FilterRect.Left, FilterRect.Bottom, FilterRect.Right, ARect.Bottom ));
//      PaintButtonControlEh(Canvas.Handle, FilterRect, Canvas.Brush.Color,
//        bcsDropDownEh, 0, Flat, False, True, cbUnchecked);
    end;
  end else
  begin
    if CellType.HorzType = hctIndicatorEh
      then ABackground := FixedColor
      else ABackground := Columns[DataCol].Title.Color;
    CellMultiSelected := CellIsMultiSelected(ACol, ARow , DataCol, NilBookmarkEh);
    Highlighted := HighlightNoDataCellColor(ACol, ARow, DataCol, DataRow, CellType, AState,
      CellMultiSelected, ABackground, Canvas.Font);
    Canvas.Brush.Color := ABackground;
    if DrawTitleByThemes then
    begin
      State.Pressed := False;
      State.Selected := False;
      State.HotTrack := False;
      State.The3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
      State.FillStyle := TitleParams.GetActualFillStyle;
      if Style.IsCustomStyleActive
        then State.FillColor := FInternalFixedColor
        else State.FillColor := TitleParams.Color;
      State.StartGradientColor := clDefault;
      State.EndGradientColor := clDefault;
      State.DrawByThemesOverLines := (Style.ThemeTitleFillElement = gtfeSplitButtonEh);
      State.FontColor := clDefault;
      State.VertBorderInFillStyle := False;
      State.HorzBorderInFillStyle := False;
      State.HorzLineColor := STFilter.HorzLineColor;
      State.VertLineColor := STFilter.VertLineColor;
      State.ClipRect := EmptyRect;

      Style.DrawFixedCellBackground(Self, Canvas, ARect, True,
        ARect, AState, State);
    end else
      Canvas.FillRect(ARect);

  end;
end;

function TCustomDBGridEh.CellHave3DRect(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState): Boolean;
var
  Column: TColumnEh;
begin
  Dec(ARow, TopDataOffset);
  Dec(ACol, IndicatorOffset);

  Result := (gdFixed in AState) and (dghFixed3D in OptionsEh) and
    ((ACol < 0) or (ARow < 0));
  if not Result then
    Result := Result or ((dghFooter3D in OptionsEh) and not (gdFixed in AState) and
      (FullFooterRowCount > 0) and (ARow > RowCount - TopDataOffset - 1));
  if not Result then
    Result := Result or ((dghData3D in OptionsEh) and not (gdFixed in AState)
      and not ((FullFooterRowCount > 0) and (ARow > RowCount - TopDataOffset - 1)));
  if not Result then
    Result := Result or ((dghFrozen3D in OptionsEh)
      and (ACol >= 0) and (ARow >= 0) and (ACol < FrozenCols) and (ARow < RowCount));

  if (ACol >= 0) and (ACol < Columns.Count)
    then Column := Columns[ACol]
    else Column := nil;
  if STFilter.Visible and CanFilterCol(ACol) and (STFilter.Location = stflUnderTitleFilterEh) and
     Column.STFilter.Visible and
     (ARow = -1)
  then
    Result := False;
end;

procedure TCustomDBGridEh.DrawRowIndicator(ACol, ARow: Longint; ARect: TRect;
  XOffset, YOffset: Integer; IndicatorType: TDBGridEhRowIndicatorTypeEh);
const
  RowIndicatorIndex: array[TDBGridEhRowIndicatorTypeEh] of Integer =
    (0, 5, 1, 2, 6);
var
  IndicatorIndex, PicInd: Integer;
  FromColor, ToColor: TColor;
{$IFDEF EH_LIB_16}
  TmpColor: TColor;
{$ENDIF}
begin
  if ThemesEnabled then
  begin
    case IndicatorType of
      giNormalArrowEh, giSelectedArrowEh, giInplaceSearch:
        begin
          if IndicatorType = giNormalArrowEh then
          begin
{$IFDEF EH_LIB_16}
            if Style.IsCustomStyleActive then
            begin
              FromColor := ApproachToColorEh(FInternalFixedFontColor, FInternalFixedColor, 40);
              ToColor := ApproachToColorEh(FInternalFixedFontColor, FInternalFixedColor, 10);
              if MightierColor(FromColor, ToColor) = ToColor then
              begin
                TmpColor := FromColor;
                FromColor := ToColor;
                ToColor := TmpColor;
              end;
            end else
{$ENDIF}
            begin
              FromColor := ApproachToColorEh(cl3DDkShadow, clBlack, 30);
              ToColor := ApproachToColorEh(cl3DDkShadow, clWhite, 00);
            end;
          end else if IndicatorType = giSelectedArrowEh then
          begin
            FromColor := ApproachToColorEh(clWhite, clBlack, 7);
            ToColor := ApproachToColorEh(clWhite, clWhite, 0);
          end else
          begin
            FromColor := ApproachToColorEh(DBGridEhInplaceSearchColor, clBlack, 0);
            ToColor := ApproachToColorEh(DBGridEhInplaceSearchColor, clWhite, 0);
          end;
          FillGradientEh(Canvas,
            Point((ARect.Right + ARect.Left - DBGridEhIndicators.Width) div 2 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhIndicators.Height) div 2 + YOffset + 1),
            [Point(0,0), Point(1,0),
             Point(0,1), Point(2,1),
             Point(0,2), Point(3,2),
             Point(0,3), Point(4,3),
             Point(0,4), Point(5,4),
{             Point(0,5), Point(6,5),
             Point(0,6), Point(5,6),
             Point(0,7), Point(4,7),
             Point(0,8), Point(3,8),
             Point(0,9), Point(2,9),
             Point(0,10), Point(0,11)}
             Point(0,5), Point(4,5),
             Point(0,6), Point(3,6),
             Point(0,7), Point(2,7),
             Point(0,8), Point(0,9)
            ],
            FromColor, ToColor);
{          DBGridEhRes.IMList10.Draw(Canvas,
            (ARect.Right + ARect.Left - DBGridEhRes.IMList10.Width) shr 1 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhRes.IMList10.Height) shr 1 + YOffset + 1, 2);}
        end;
      giEditEh:          //GetColorLuminance
        begin
          PicInd := 6;
{$IFDEF EH_LIB_16}
          if Style.IsCustomStyleActive then
            if MightierColor(FInternalFixedFontColor, FInternalFixedColor) = FInternalFixedColor then
              PicInd := 16;
{$ENDIF}

//          IndicatorIndex := RowIndicatorIndex[IndicatorType];
          DBGridEhRes.IMList10.Draw(Canvas,
            (ARect.Right + ARect.Left - DBGridEhRes.IMList10.Width) shr 1 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhRes.IMList10.Height) shr 1 + YOffset + 1, PicInd);//iif(ABrightness > 180, 16, 6)); // 6 black
{       DBGridEhIndicators.Draw(Canvas,
            (ARect.Right + ARect.Left - DBGridEhIndicators.Width) shr 1 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhIndicators.Height) shr 1 + YOffset, IndicatorIndex);}
        end;
      giInsertEh:
        begin
          PicInd := 4;
{$IFDEF EH_LIB_16}
          if Style.IsCustomStyleActive then
            if MightierColor(FInternalFixedFontColor, FInternalFixedColor) = FInternalFixedColor then
              PicInd := 15;
{$ENDIF}

//          IndicatorIndex := RowIndicatorIndex[IndicatorType];
          DBGridEhRes.IMList10.Draw(Canvas,
            (ARect.Right + ARect.Left - DBGridEhRes.IMList10.Width) div 2 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhRes.IMList10.Height) div 2 + YOffset + 1, PicInd);// iif(ABrightness > 180 , 15, 4)); // 4 black
{          DBGridEhIndicators.Draw(Canvas,
            (ARect.Right + ARect.Left - DBGridEhIndicators.Width) shr 1 + XOffset,
            (ARect.Top + ARect.Bottom - DBGridEhIndicators.Height) shr 1 + YOffset, IndicatorIndex);}
        end;
    end
  end else
  begin
    IndicatorIndex := RowIndicatorIndex[IndicatorType];
    DBGridEhIndicators.Draw(Canvas,
      (ARect.Right + ARect.Left - DBGridEhIndicators.Width) div 2 + XOffset,
      (ARect.Top + ARect.Bottom - DBGridEhIndicators.Height) div 2 + YOffset, IndicatorIndex);
  end;
end;

procedure TCustomDBGridEh.DrawIndicatorDropDownSign(ACol, ARow: Longint;
  ARect: TRect; Selected: Boolean);
var
  FromColor, ToColor: TColor;
{$IFDEF EH_LIB_16}
  TmpColor: TColor;
{$ENDIF}
begin
  if ThemesEnabled then
  begin
    if not Selected then
    begin
{$IFDEF EH_LIB_16}
      if Style.IsCustomStyleActive then
      begin
        FromColor := ApproachToColorEh(FInternalFixedFontColor, FInternalFixedColor, 40);
        ToColor := ApproachToColorEh(FInternalFixedFontColor, FInternalFixedColor, 10);
        if MightierColor(FromColor, ToColor) = ToColor then
        begin
          TmpColor := FromColor;
          FromColor := ToColor;
          ToColor := TmpColor;
        end;
      end else
{$ENDIF}
      begin
        FromColor := ApproachToColorEh(cl3DDkShadow, clBlack, 30);
        ToColor := ApproachToColorEh(cl3DDkShadow, clWhite, 00);
      end;
    end else
    begin
      FromColor := ApproachToColorEh( clWhite, clBlack, 7);
      ToColor := ApproachToColorEh(clWhite, clWhite, 0);
    end;
    if (ARect.Bottom - ARect.Top) >= 7 then
    begin
      FillGradientEh(Canvas,
        Point((ARect.Right + ARect.Left - 7) shr 1 + 1,
        (ARect.Top + ARect.Bottom - 7) shr 1),
        [Point(0,0), Point(7,0),
         Point(1,1), Point(6,1),
         Point(2,2), Point(5,2),
         Point(3,3), Point(4,3)
        ],
        FromColor, ToColor);
    end;
  end else
  begin
    DBGridEhSortMarkerImages.Draw(Canvas,
      (ARect.Left + ARect.Right - DBGridEhSortMarkerImages.Width) shr 1,
      (ARect.Top + ARect.Bottom - DBGridEhSortMarkerImages.Height) shr 1, 2);
  end;
end;

procedure TCustomDBGridEh.DrawFilterSign(ARect: TRect; Selected: Boolean);
var
  FromColor, ToColor: TColor;
begin
  begin
    if not Selected then
    begin
      FromColor := ApproachToColorEh(GridLineParams.GetDarkColor, clBlack, 30);
      ToColor := ApproachToColorEh(GridLineParams.GetDarkColor, clWhite, 00);
    end else
    begin
      FromColor := ApproachToColorEh(clWhite, GridLineParams.GetDarkColor, 7);
      ToColor := ApproachToColorEh(clWhite, clWhite, 0);
    end;
    FillGradientEh(Canvas,
      Point((ARect.Right + ARect.Left - 6) div 2 + 1,
      (ARect.Top + ARect.Bottom - 6) div 2),
      [Point(0,0), Point(5,0),
       Point(1,1), Point(4,1),
       Point(2,2), Point(3,2),
       Point(2,3), Point(3,3),
       Point(2,4), Point(3,4),
       Point(3,5), Point(3,5)
      ],
      FromColor, ToColor);
  end;
end;

function TCustomDBGridEh.CreateScrollBar(AKind: TScrollBarKind): TDBGridEhScrollBar;
begin
  if AKind = sbVertical
    then Result := TVertDBGridEhScrollBar.Create(Self, AKind)
    else Result := THorzDBGridEhScrollBar.Create(Self, AKind);
end;

function TCustomDBGridEh.GetTopDataOffset: Byte;
begin
  Result := GetTitleRows + GetSubTitleRows;
end;

function TCustomDBGridEh.GetTitleRows: Integer;
begin
  if dgTitles in Options
    then Result := 1
    else Result := 0;
end;

function TCustomDBGridEh.GetSubTitleRows: Integer;
begin
  Result := 0;
  if (STFilter <> nil) and STFilter.Visible and (STFilter.Location = stflUnderTitleFilterEh) then
    Inc(Result);
end;

procedure TCustomDBGridEh.SelectionActiveChanged;
begin
  if Selection.SelectionType <> gstNon then
  begin
    if Selection.SelectionType = gstAll
      then Invalidate
      else InvalidateGridRect(Selection.SelectionToGridRect);
  end;
//  GridInvalidateRow(Self, Row);
  InvalidateRow(Row);
  FSelectionActive := IsSelectionActive;
end;

procedure TCustomDBGridEh.SelectionChanged;
begin
  if not (csDestroying in ComponentState) then
  begin
    if FVertScrollBarPanelControl.Visible then
      FVertScrollBarPanelControl.GridSelectionChanged;
    if FVertScrollBarPanelControl.Visible then
      FHorzScrollBarPanelControl.GridSelectionChanged;

    if Assigned(OnSelectionChanged) then
      OnSelectionChanged(Self);
  end;
end;

procedure TCustomDBGridEh.SetStyle(const Value: TDBGridEhStyle);
begin
  if FStyle = Value then Exit;
  if FStyle <> nil then
    FStyle.RemoveChangeNotification(Self);
  FStyle := Value;
  if Value <> nil
    then FStyle.AddChangeNotification(Self)
    else RegetDefaultStyle;
end;

function TCustomDBGridEh.GetCellColWidths(Index: Integer): Integer;
begin
  if dgColLines in Options
    then Result := ColWidths[Index] - GridLineWidth
    else Result := ColWidths[Index];
end;

procedure TCustomDBGridEh.SetCellColWidths(Index: Integer; const Value: Integer);
begin
  if dgColLines in Options
    then ColWidths[Index] := Value + GridLineWidth
    else ColWidths[Index] := Value;
end;

function TCustomDBGridEh.GetCellRowHeights(Index: Integer): Integer;
begin
  if dgRowLines in Options
    then Result := RowHeights[Index] - GridLineWidth
    else Result := RowHeights[Index];
end;

procedure TCustomDBGridEh.SetCellRowHeights(Index: Integer; const Value: Integer);
begin
  if dgRowLines in Options
    then RowHeights[Index] := Value + GridLineWidth
    else RowHeights[Index] := Value;
end;

function TCustomDBGridEh.GetDefaultRowHeight: Integer;
begin
  Result := inherited DefaultRowHeight;
  if dgRowLines in Options then
    Dec(Result, GridLineWidth)
end;

procedure TCustomDBGridEh.SetDefaultRowHeight(const Value: Integer);
begin
  if dgRowLines in Options
    then inherited DefaultRowHeight := Value + GridLineWidth
    else inherited DefaultRowHeight := Value;
end;

procedure TCustomDBGridEh.SetCenter(const Value: TDBGridEhCenter);
begin
  if FCenter = Value then Exit;
  if FCenter <> nil then
    FCenter.RemoveChangeNotification(Self);
  FCenter := Value;
  if Value <> nil then
    FCenter.AddChangeNotification(Self);
end;

procedure TCustomDBGridEh.StyleEhChanged;
begin
  LayoutChanged;
end;

procedure TCustomDBGridEh.RegetDefaultStyle;
begin
  if FStyle = DBGridEhDefaultStyle then Exit;
  FStyle := DBGridEhDefaultStyle;
  if FStyle <> nil
    then FStyle.AddChangeNotification(Self)
    else StyleEhChanged;
end;

function TCustomDBGridEh.CellIsMultiSelected(ACol, ARow: Integer;
  DataCol: Integer; DataRowBkmrk: TUniBookmarkEh): Boolean;
var
  ADataRect: TGridRect;
begin
  if (Selection.SelectionType = gstAll) then
    Result := True
  else
  begin
    Result := False;
    ADataRect := DataBox;
    if ACol < ADataRect.Left then
    begin // Indicator
      if (ARow >= ADataRect.Top) and (ARow <= ADataRect.Bottom)
        then Result := (Selection.SelectionType =  gstRecordBookmarks) and
                       (Selection.Rows.IndexOf(DataRowBkmrk) >= 0);
    end else if (ARow >= ADataRect.Top) and (ARow <= ADataRect.Bottom) then // Data
      Result := Selection.DataCellSelected(DataCol, DataRowBkmrk)
    else  // Title or footer
      Result := (Selection.SelectionType = gstColumns) and
                (Selection.Columns.IndexOf(Columns[DataCol]) >= 0);
  end;
end;

function TCustomDBGridEh.GetCellAreaType(ACol, ARow: Integer;
  var AreaCol, AreaRow: Integer): TCellAreaTypeEh;
var
  ADataRect: TGridRect;
begin
  ADataRect := DataBox;
  AreaCol := ACol;
  AreaRow := ARow;
  if ACol < ADataRect.Left then
    Result.HorzType := hctIndicatorEh
  else
  begin
    Dec(AreaCol, IndicatorOffset);
    Result.HorzType := hctDataEh;
  end;

  if (ARow < GetTitleRows) then
    Result.VertType := vctTitleEh
  else if (ARow < GetTitleRows + GetSubTitleRows) then
  begin
    Result.VertType := vctSubTitleEh;
    Dec(AreaRow, GetTitleRows);
  end else if (ARow >= ADataRect.Top) and (ARow <= ADataRect.Bottom) then
  begin
    Result.VertType := vctDataEh;
    Dec(AreaRow, TopDataOffset);
  end else if (ARow = ADataRect.Bottom + 1) then // We have footer row, it above footer row
  begin
    Result.VertType := vctFooterEh;//vctAboveFooterEh;
    AreaRow := 0;
  end else if (ARow > ADataRect.Bottom + 1) then // We have footer row, footer row
  begin
    Result.VertType := vctFooterEh;
    Dec(AreaRow, ADataRect.Bottom + 1);
  end else
    raise Exception.Create('Algorithm error in TCustomDBGridEh.GetCellType');
end;

procedure TCustomDBGridEh.DefaultApplySorting;
begin
  Center.ApplySorting(Self);
end;

function TCustomDBGridEh.FindFieldColumn(const FieldName: String): TColumnEh;
begin
  Result := TColumnEh(inherited FindFieldColumn(FieldName));
end;

function TCustomDBGridEh.GetFieldColumns(const FieldName: String): TColumnEh;
begin
  Result := TColumnEh(inherited FieldAxisBars[FieldName]);
end;

procedure TCustomDBGridEh.DoExit;
begin
  try
    if Datalink.Active then
      with Datalink.Dataset do
        if (dgCancelOnExit in Options) and (State = dsInsert) and
          not Modified and not Datalink.FModified then
          Cancel else
          DataLink.UpdateData;
  except
    SetFocus;
    raise;
  end;
  inherited DoExit;
  SelectionActiveChanged;
end;

procedure TCustomDBGridEh.DoEnter;
begin
  inherited DoEnter;
  SelectionActiveChanged;
end;

function TCustomDBGridEh.ExtendedScrolling: Boolean;
begin
  Result := MemTableSupport and
            Assigned(Center) and
            Center.UseExtendedScrollingForMemTable;
end;

procedure TCustomDBGridEh.CheckIMemTable;
var
  OldIntMemTable: IMemTableEh;
begin
  OldIntMemTable := FIntMemTable;
  if FTryUseMemTableInt and (DataLink <> nil) and DataLink.Active and
    (DataLink.DataSet <> nil) and not (csDestroying in DataLink.DataSet.ComponentState) {and (FooterRowCount = 0)}
    then Supports(DataLink.DataSet, IMemTableEh, FIntMemTable)
    else FIntMemTable := nil;
  if OldIntMemTable <> FIntMemTable then
  begin
{ TODO : Here is code because of which raise list out of bounds in RemoveNotification in Delphi 5}
//    if (FIntMemTable <> nil) and (DataLink.DataSet <> nil) then
//      DataLink.DataSet.FreeNotification(Self);

    if FIntMemTable <> nil then
      FIntMemTable.RegisterEventReceiver(Self);
    if OldIntMemTable <> nil then
    begin
      OldIntMemTable.UnregisterEventReceiver(Self);
      if FFilterObj <> nil then
      begin
        OldIntMemTable.RevokeExtraFilter(FFilterObj);
        FFilterObj := nil;
      end;
    end;
    if FIntMemTable <> nil then
      MTViewDataEvent(-1, mtViewDataChangedEh, -1)
    else if DataGrouping.Active then
    begin
      DataGrouping.GroupDataTree.DeleteRecordNodes;
      DataGrouping.GroupDataTree.DeleteEmptyNodes;
    end;
//    LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.MTUpdateRowCount;

  procedure ResetFixedRows;
  var
    i: Integer;
  begin
    if FixedRows > TopDataOffset then
    begin
      for i := TopDataOffset to FixedRows-1  do
        DeleteRow(i);
    end;
    FixedRows := TopDataOffset;
    FrozenRowCount := GetSubTitleRows;
  end;

  procedure SetRowCount(NewRowCount: Longint);
  begin
    if NewRowCount <= Row then
      MoveColRow(Col, NewRowCount - 1, False, False, False);
    RowCount := NewRowCount;
  end;

  procedure UpdateFooterRowHeights;
  var
    i, Grfc: Integer;
  begin
    Grfc := DataGrouping.Footers.VisibleItemsCount;
    for i := 0 to Grfc-1{-FooterRowCount} do
      CellRowHeights[RowCount+i] := TGridDataGroupFooterEhCrack(DataGrouping.Footers.VisibleItems[i]).FAutoCalcHeight;
    for i := 0 to FooterRowCount - 1 do
      if i < Length(FooterParams.FCalculatedRowHeights)
        then CellRowHeights[RowCount+Grfc+i] := FooterParams.FCalculatedRowHeights[i]
        else CellRowHeights[RowCount+Grfc+i] := FStdDefaultRowHeight;
  end;

var
 NewRowCount: Integer;
 NewCol, NewRow: Integer;
 t: Integer;
 ShowCol: Boolean;
begin
  if DataLink = nil then Exit;

  if RowCount <= TopDataOffset then
    SetRowCount(TopDataOffset + 1);
  ResetFixedRows;
  FOldTopLeft.X := LeftCol;
  FOldTopLeft.Y := TopRow;
  if dgTitles in Options then
    CellRowHeights[0] := FTitleRowHeight;
  if GetSubTitleRows > 0 then
    CellRowHeights[GetTitleRows] := STFilter.RowFullRowHeight;// FStdDefaultRowHeight;

  ContraRowCount := FullFooterRowCount;
  if FullFooterRowCount > 0 then
    UpdateFooterRowHeights;

{ TODO : Check this comment }
  if MemTableSupport and FIntMemTable.MemTableIsTreeList then
  begin
    t := RowHeights[0];
    DefaultRowHeight := FStdDefaultRowHeight;
    if dgTitles in Options then RowHeights[0] := t;

{ Do it in MTViewDataEvent }

    if (FIntMemTable <> nil) and DataLink.Active
      then NewRowCount := FIntMemTable.InstantReadRowCount
      else NewRowCount := 0;
    if NewRowCount <= 0 then NewRowCount := 1;
    SetRowCount(NewRowCount + TopDataOffset);
  end;

  if not HandleAllocated then Exit;
  MTUpdateTopRow;
  if (FColWidthsChanged = True) and (FIntMemTable <> nil) and
    DataLink.Active and (DataRowCount = InstantReadRecordCount) then
  begin
    UpdateAllDataRowHeights();
    FColWidthsChanged := False;
  end;

  if  (FIntMemTable <> nil) and
       DataLink.Active and
       not DataGrouping.IsGroupingWorks and
      (Row - TopDataOffset <> FIntMemTable.InstantReadCurRowNum) then
  begin
    GridInvalidateRow(Self, Row);

    if FIntMemTable.InstantReadCurRowNum = -1
      then NewRow := FixedRows
      else NewRow := FIntMemTable.InstantReadCurRowNum + TopDataOffset;
    if NewRow >= RowCount then
      NewRow := FixedRows;

    ShowCol := not FLockAutoShowCurCell and not RowPanel.Active;
    if Col < FixedCols then
    begin
      NewCol := Col;
      MoveColRow(FixedCols, NewRow, False, ShowCol, True);
      MoveColRow(NewCol, NewRow, False, False, False);
    end else
      MoveColRow(Col, NewRow, False, ShowCol, True);
    if RowPanel.Active then
      ClampInViewRowPanelCell(SelectedIndex);

    GridInvalidateRow(Self, Row);
  end;

  FetchRecordsInView;

  UpdateScrollRange;
  Invalidate;
end;

procedure TCustomDBGridEh.MTScroll(Distance: Integer);
var
  NewRow, NewCol, OldTopRow, OldRecRow: Integer;
  Field: TField;
  ShowCol: Boolean;
begin
  if not FInplaceSearchingInProcess then
    StopInplaceSearch;
  if DataLink = nil then Exit;

  if DataLink.Active and DataGrouping.IsGroupingWorks then
  begin
    if Distance <> 0 then
    begin
      NewRow := DataGrouping.GroupDataTree.IndexOfVisibleRecordViewNo(FIntMemTable.InstantReadCurRowNum);
      if NewRow > -1 then
        InvalidateRow(NewRow + TopDataOffset);
      OldRecRow := DataGrouping.GroupDataTree.IndexOfVisibleRecordViewNo(FIntMemTable.InstantReadCurRowNum-Distance);
      if OldRecRow > -1 then
        InvalidateRow(OldRecRow + TopDataOffset);
    end;
    if FInternalUpdatingDatasetPos then Exit;
    FInternalUpdatingDatasetPos := True;
    try
      DataGroupsGotoRecordViewNo(FIntMemTable.InstantReadCurRowNum, False);
    finally
      FInternalUpdatingDatasetPos := False;
    end;
  end else if (FIntMemTable <> nil) and DataLink.Active then
  begin
//    GridInvalidateRow(Self, Row);
    InvalidateRow(Row);
    if DataLink.Active and HandleAllocated and not (csLoading in ComponentState) then
    begin
      OldTopRow := TopRow;
      NewRow := FIntMemTable.InstantReadCurRowNum + TopDataOffset;
      if NewRow >= RowCount then
        NewRow := FixedRows;
      if Row <> NewRow then
      begin
        if not (dgAlwaysShowEditor in Options) then HideEditor;
        ShowCol := not FLockAutoShowCurCell and not RowPanel.Active;
        if (not FLockAutoShowCurCell) and (Col < FixedCols) then
        begin
          NewCol := Col;
          MoveColRow(FixedCols, NewRow, False, ShowCol, True);
          MoveColRow(NewCol, NewRow, False, False, False);
        end else
          MoveColRow(Col, NewRow, False, ShowCol, True);
        if RowPanel.Active then
          ClampInViewRowPanelCell(SelectedIndex);
        InvalidateEditor;
        InvalidateRow(NewRow);
//        GridInvalidateRow(Self, NewRow);
      end;
//      Columns[SelectedIndex].Field := nil; //Some time AV BUG
      if InplaceEditorVisible then
      begin
        Field := SelectedField;
        if Assigned(Field) and (Field.Text <> FEditText) then
          InvalidateEditor;
      end;
      if HaveHideDuplicates and (OldTopRow <> TopRow) then
      begin
        GridInvalidateRow(Self, TopRow);
        GridInvalidateRow(Self, OldTopRow);
      end;
    end;
  end;
  InvalidateFooter;
  UpdateScrollBar;
end;

procedure TCustomDBGridEh.FetchRecordsInView;
var
 DrawInfo: TGridDrawInfoEh;
begin
  if FFetchingRecords or not HandleAllocated then Exit;
  FFetchingRecords := True;
  try
    if FIntMemTable <> nil then
    begin
      CalcDrawInfo(DrawInfo);
      with DrawInfo.Vert do
        if GridBoundary < GridExtent then
          FIntMemTable.FetchRecords((GridExtent - GridBoundary) div FStdDefaultRowHeight + 1)
        else if (GridBoundary >= GridExtent) and (LastFullVisibleCell + 1 = RowCount) then
          FIntMemTable.FetchRecords(1);
    end;
  finally
    FFetchingRecords := False;
  end;
end;

procedure TCustomDBGridEh.InstantReadRecordEnter(DataRowNum: Integer);
begin
  if ViewScroll then
  begin
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
    begin
      if FInstantReadDataNodes.Count = 0 then
        FInstantReadDataNodes.Add(nil);
      if FInstantReadDataNodes[FInstantReadDataNodes.Count-1] <> nil then
        FInstantReadDataNodes.Add(nil);
      FInstantReadDataNodes[FInstantReadDataNodes.Count-1] := DataGrouping.GroupDataTree.FlatVisibleItem[DataRowNum];
//      if InstantReadCurDataNode.NodeType = dntDataSetRecordEh then
//      begin
        FOldActiveRecord := FIntMemTable.InstantReadCurRowNum;
        if InstantReadCurDataNode.NodeType <> dntDataGroupFooterEh then
          FIntMemTable.InstantReadEnter(InstantReadCurDataNode.DataSetRecordViewNo);
//      end;
    end else
    begin
      FOldActiveRecord := FIntMemTable.InstantReadCurRowNum;
      FIntMemTable.InstantReadEnter(DataRowNum);
    end;
  end else
  begin
    FOldActiveRecord := DataLink.ActiveRecord;
    DataLink.ActiveRecord := DataRowNum;
  end;
end;

procedure TCustomDBGridEh.InstantReadRecordLeave;
begin
  if ViewScroll then
  begin
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
    begin
      if InstantReadCurDataNode.NodeType <> dntDataGroupFooterEh then
        FIntMemTable.InstantReadLeave;
      if FInstantReadDataNodes.Count > 1
        then FInstantReadDataNodes.Count := FInstantReadDataNodes.Count - 1
        else FInstantReadDataNodes[0] := nil;
    end else
      FIntMemTable.InstantReadLeave;
  end else
    DataLink.ActiveRecord := FOldActiveRecord;
  FOldActiveRecord := -1;
end;

function TCustomDBGridEh.InstantReadRecordCount: Integer;
begin
  if MemTableSupport then
    if DataGrouping.IsGroupingWorks
      then Result := DataGrouping.GroupDataTree.FlatVisibleCount
      else Result := FIntMemTable.InstantReadRowCount
  else
    Result := DataLink.RecordCount;
end;

function TCustomDBGridEh.InstantReadCurDataNode: TGroupDataTreeNodeEh;
begin
  Result := nil;
  if FInstantReadDataNodes.Count <> 0 then
    Result := TGroupDataTreeNodeEh(FInstantReadDataNodes[FInstantReadDataNodes.Count-1]);
end;

function TCustomDBGridEh.IsCurrentRow(DataRowNum: Integer): Boolean;
var
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
begin
  if ViewScroll then
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
    begin
      Result := False;
      if DataRowNum < DataGrouping.GroupDataTree.FlatVisibleCount then
      begin
        ADrawGroupDataNode := DataGrouping.GroupDataTree.FlatVisibleItem[DataRowNum];
        Result := (ADrawGroupDataNode.NodeType = dntDataSetRecordEh) and
                (ADrawGroupDataNode.DataSetRecordViewNo = FIntMemTable.InstantReadCurRowNum) and
                (DataRowNum = Row - TopDataOffset);
      end;
    end else
      Result := (FIntMemTable.InstantReadCurRowNum = DataRowNum) and not DataLink.DataSet.IsEmpty
  else
    Result := (DataLink.ActiveRecord = DataRowNum) and not DataLink.DataSet.IsEmpty;
end;

procedure TCustomDBGridEh.MTUpdateVertScrollBar;
var
  DrawInfo: TGridDrawInfoEh;
  SIOld, SINew: TScrollInfo;
  MaxTopLeft: TGridCoord;
begin
  if VertScrollBar.SmoothStep then
  begin
    UpdateScrollRange;
    UpdateSearchPanel;
    Exit; // Inherited methods will do all need.
  end;
  CalcDrawInfo(DrawInfo);
  SIOld.cbSize := sizeof(SIOld);
  SIOld.fMask := SIF_ALL;
  VertScrollBar.GetScrollInfo(SIOld);
  SINew := SIOld;
  SINew.nMin := 1;
  if dghAutoFitRowHeight in OptionsEh then
  begin
    SINew.nPage := 0;
    MaxTopLeft.X := ColCount - 1;
    MaxTopLeft.Y := RowCount - 1;
    MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
    SINew.nMax := RowCount - FixedRows - (RowCount - MaxTopLeft.Y - 1);
  end else
  begin
    SINew.nPage := DrawInfo.Vert.LastFullVisibleCell - TopRow + 1;
    SINew.nMax := RowCount - FixedRows;
  end;

  SINew.nPos := TopRow - FixedRows + 1;

  VertScrollBar.SetParams(SINew.nPos, SINew.nMin, SINew.nMax, SINew.nPage);
  UpdateSearchPanel;
end;

function TCustomDBGridEh.SafeMoveTop(ATop: Integer; CheckOnly: Boolean = False): Integer;
var
  OldTopRow: Integer;
begin
  Result := inherited SafeMoveTop(ATop, CheckOnly);

  OldTopRow := TopRow;
  if not CheckOnly and (TopRow <> Result) then
  begin
    TopRow := Result;
    MTUpdateVertScrollBar;
    if HaveHideDuplicates then
    begin
      GridInvalidateRow(Self, TopRow);
      GridInvalidateRow(Self, OldTopRow);
    end;
  end;
end;

procedure TCustomDBGridEh.MTWMVScroll(ScrollBar, ScrollCode, Pos: Cardinal);
var
  SI: TScrollInfo;
  DrawInfo: TGridDrawInfoEh;

  function PageUp: Longint;
  var
    MaxTopLeft, TopLeft: TGridCoord;
  begin
    TopLeft.X := LeftCol;
    TopLeft.Y := TopRow;
    MaxTopLeft := CalcMaxTopLeft(TopLeft, DrawInfo);
      Result := TopRow - MaxTopLeft.Y;
    if Result < 1 then Result := 1;
  end;

  function PageDown: Longint;
  begin
    with DrawInfo do
      Result := Vert.LastFullVisibleCell - TopRow;
    if Result < 1 then Result := 1;
  end;

begin
  CalcDrawInfo(DrawInfo);
  if DataLink.Active then
    with DataLink.DataSet do
      case ScrollCode of
        SB_LINEUP: SafeMoveTop(TopRow - 1);
        SB_LINEDOWN: SafeMoveTop(TopRow + 1);
        SB_PAGEUP: SafeMoveTop(TopRow - PageUp);
        SB_PAGEDOWN: SafeMoveTop(TopRow + PageDown);
        SB_THUMBPOSITION ,SB_THUMBTRACK:
          if VertScrollBar.Tracking or (ScrollCode = SB_THUMBPOSITION) then
          begin
            SI.cbSize := sizeof(SI);
            SI.fMask := SIF_ALL;
            VertScrollBar.GetScrollInfo(SI);
            SafeMoveTop(SI.nTrackPos + FixedRows - 1);
          end;
        SB_BOTTOM: SafeMoveTop(RowCount);
        SB_TOP: SafeMoveTop(FixedRows);
      end;
  MTUpdateVertScrollBar;
end;

procedure TCustomDBGridEh.MTUpdateTopRow;
var
  MaxTopLeft, TopLeft: TGridCoord;
  DrawInfo: TGridDrawInfoEh;
begin
  CalcDrawInfo(DrawInfo);
  TopLeft.X := ColCount-1;
  TopLeft.Y := RowCount-1;
  MaxTopLeft := CalcMaxTopLeft(TopLeft, DrawInfo);
  if TopRow > MaxTopLeft.Y then
    TopRow := MaxTopLeft.Y;
end;

function TCustomDBGridEh.CreateGridLineColors: TGridLineColorsEh;
begin
  Result := TDBGridLineParamsEh.Create(Self);
end;

//\\ MemTable Supporting

{ Subtitle filter }

function TCustomDBGridEh.CreateFilterEditor: TCustomDBEditEh;
begin
  Result := TInplaceFilterEditEh.Create(Self);
end;

procedure TCustomDBGridEh.SetSTFilter(const Value: TSTDBGridEhFilter);
begin
  FSTFilter.Assign(Value);
end;

function TCustomDBGridEh.CanFilterCol(DCol: Longint): Boolean;
var
  Column: TColumnEh;
begin
  if (DCol >= 0) and (DCol < Columns.Count) then
    Column := Columns[DCol]
  else
    Column := nil;
  Result := (Column <> nil) and Column.Visible and
    Column.STFilter.Visible and (STFilter.Location = stflUnderTitleFilterEh);
end;

function TCustomDBGridEh.GetFilterValue(DCol: Longint): String;
begin
  Result := '';
  if (DCol < 0) or (DCol >= Columns.Count) then
    Exit;
  if Columns[DCol].FieldName <> '' then
    Result := Columns[DCol].STFilter.ExpressionStr
end;

procedure TCustomDBGridEh.SetFilterEditMode(const Value: Boolean);
begin
  if Value
    then StartEditFilter(RawToDataColumn(Col))
    else StopEditFilter;
end;

type
  TCustomDBEditEhCracker = class(TCustomDBEditEh);

procedure TCustomDBGridEh.StartEditFilter(DCol: Longint);
var
  AOldEditCol: Integer;
  DrawInfo: TGridDrawInfoEh;
  Coord: TGridCoord;
  ACol: Longint;
begin
  if not STFilter.Visible or not CanFilterCol(DCol) or (STFilter.Location <> stflUnderTitleFilterEh) then
    Exit;
  if DataLink.Active then
    DataLink.DataSet.CheckBrowseMode;
  if not Assigned(FilterEdit) then
  begin
    FFilterEdit := CreateFilterEditor; // TInplaceFilterEditEh.Create(Self);
    with FFilterEdit do
    begin
//      FilterEdit.FGrid := Self;
      IInplaceEditEh(FFilterEdit).SetInplaceEditHolder(Self);
      Visible := False;
      Parent := {Parent;//} Self;
      IInplaceEditEh(FFilterEdit).SetBorderStyle(bsNone);
      IInplaceEditEh(FFilterEdit).SetFont(Self.STFilter.Font);
      IInplaceEditEh(FFilterEdit).SetColor(STFilter.GetColor);//ApproximateColor(clWindow, FixedColor, 8)); //FixedColor;
      IInplaceEditEh(FFilterEdit).SetOnKeyPress(OnFilterKeyPress);
      IInplaceEditEh(FFilterEdit).SetOnExit(FilterExit);
      Flat := Self.Flat;
      TPopupListboxEh(TInplaceFilterEditEh(FilterEdit).PopupListbox).UseItemObjects := True;
    end;
  end;

  if (FFilterCol <> -1) and FilterEdit.Visible then
  begin
    HideFilterEdit;
  end;

  FFilterCol := DCol;
  FFilterEditMode := True;
  HideEditor;

  BeginUpdate; { Prevent highlight flicker on tab to next/prior row }
  LockPaint;
  try
    if Columns[DCol].STFilter.Visible then
    begin
      AOldEditCol := FFilterCol;
      ACol := DataToRawColumn(DCol);
      if (dgRowSelect in Options) then
      begin
        if (VisibleColCount + LeftCol <= ACol ) then
        begin
          CalcDrawInfo(DrawInfo);
          Coord.X := ACol;
          Coord.Y := Row;
          with DrawInfo, Coord do
          begin
            if (X > Horz.LastFullVisibleCell) or
              (Y > Vert.LastFullVisibleCell) or (X < LeftCol) or (Y < TopRow)
            then
              LeftCol := CalcMaxTopLeft(Coord, DrawInfo).X;
          end;
        end
        else if (ACol >= FixedCols) and (LeftCol > ACol) then
          LeftCol := ACol;
      end
      else
        MoveCol(DCol, 0, False);
      FFilterCol := AOldEditCol;
      InvalidateCell(FFilterCol+IndicatorOffset, TopDataOffset-1);
    end;
    GridInvalidateRow(Self, TopDataOffset-1);
    GridInvalidateRow(Self, Row);
  finally
    UnlockPaint;
    EndUpdate;
  end;
  UpdateFilterEdit(True);
end;

procedure TCustomDBGridEh.OnFilterClosingUp(Sender: TObject; var Accept: Boolean);
var
  Listbox: TPopupListboxEh;
  ItemIndex: Integer;
  Item: TPopupListboxItemEh;
begin
  Columns[FFilterCol].STFilter.FPopupListboxDownIndex := -1;
  if (FFilterCol <> -1) and (FilterEdit <> nil) and FilterEdit.Visible then
  begin
    Columns[FFilterCol].STFilter.DropDownListWidth := TInplaceFilterEditEh(FilterEdit).DropDownBox.Width;
    Columns[FFilterCol].STFilter.DropDownListRows := TInplaceFilterEditEh(FilterEdit).DropDownBox.Rows;
  end;
  if not Accept then Exit;
  Listbox := TPopupListboxEh(TInplaceFilterEditEh(FilterEdit).PopupListbox);
  ItemIndex := Listbox.ItemIndex;
  Item := nil;
  if Listbox.ItemIndex >= 0 then
{$IFDEF EH_LIB_6}
    Item := TPopupListboxItemEh(Listbox.ExtItems.Objects[Listbox.ItemIndex]);
{$ELSE}
    Item := TPopupListboxItemEh(Listbox.Items.Objects[Listbox.ItemIndex]);
{$ENDIF}
  if Item <> nil then
  begin
    Item.Execute(Listbox, ItemIndex, Point(-1,-1), []);
    Accept := False;
  end;
  Columns[FFilterCol].STFilter.FEnterNotClearData := False;
end;

procedure TCustomDBGridEh.OnFilterCloseUp(Sender: TObject; Accept: Boolean);
begin
  if Center.FilterEditCloseUpApplyFilter and Accept then
    SetDataFilter;
end;

procedure TCustomDBGridEh.LoadInplaceFilterValues(ASTFilter: TSTColumnFilterEh;
  Items: TStrings; PopupListbox: TPopupListboxEh; var NewWidth: Integer);
var
  i, tw, mtw: Integer;
  Processed: Boolean;
begin

  Processed := False;
  if Assigned(FOnFillSTFilterListValues) then
    OnFillSTFilterListValues(Self, ASTFilter.Column, Items, Processed);
  if Assigned(ASTFilter.Column.FOnFillSTFilterListValues) then
    ASTFilter.Column.OnFillSTFilterListValues(Self, ASTFilter.Column, Items, Processed);
  if Assigned(Center.FOnFillSTFilterListValues) then
    Center.OnFillSTFilterListValues(Self, ASTFilter.Column, Items, Processed);
  if not Processed then
    DefaultFillSTFilterListValues(ASTFilter.Column, Items);

  mtw := NewWidth;
  for i := 0 to Items.Count - 1 do
  begin
    if (Items.Objects[i] <> nil) and
      not (Items.Objects[i] is TPopupListboxItemEhData) then
    begin
      PopupListbox.Canvas.Font := PopupListbox.Font;
      tw := PopupListbox.Canvas.TextWidth(Items[i]) +
        + DefaultCheckBoxWidth + 2 + GetSystemMetrics(SM_CXVSCROLL) + TPopupListboxEh(PopupListbox).BorderWidth*2 + 2;
      if mtw < tw then mtw := tw;
    end;
  end;
  if mtw > NewWidth then
    NewWidth := mtw;

  ASTFilter.FPopupListboxDownIndex := -1;
  Items.BeginUpdate;
  try
    for i := 0 to Items.Count - 1 do
      if Items.Objects[i] = nil then
        Items.Objects[i] := PopupListboxItemEhData;
  finally
    Items.EndUpdate;
  end;

  SetLength(ASTFilter.FListValuesCheckingState, 0);
  SetLength(ASTFilter.FListValuesCheckingState, Items.Count);
end;

procedure TCustomDBGridEh.DefaultFillSTFilterListDataValues(Column: TColumnEh;
  Items: TStrings);
begin
  if Assigned(Center) then
    Center.DefaultFillSTFilterListDataValues(Self, Column, Items);
end;

procedure TCustomDBGridEh.DefaultFillSTFilterListCommandValues(Column: TColumnEh;
  Items: TStrings);
begin
  if Assigned(Center) then
    Center.DefaultFillSTFilterListCommandValues(Self, Column, Items);
end;

procedure TCustomDBGridEh.DefaultFillSTFilterListValues(Column: TColumnEh;
  Items: TStrings);
begin
  DefaultFillSTFilterListCommandValues(Column, Items);
  DefaultFillSTFilterListDataValues(Column, Items);
end;

procedure TCustomDBGridEh.OnFilterGetItemsList(Sender: TObject);
var
  InplaceFilterEdit: TInplaceFilterEditEh;
  DropDownBoxWidth: Integer;
begin
  InplaceFilterEdit := TInplaceFilterEditEh(FilterEdit);
  if (FFilterCol >= 0) and (FFilterCol < Columns.Count) then
  begin
    DropDownBoxWidth := InplaceFilterEdit.DropDownBox.Width;
    LoadInplaceFilterValues(Columns[FFilterCol].STFilter,
      InplaceFilterEdit.Items, TPopupListboxEh(InplaceFilterEdit.PopupListbox), DropDownBoxWidth);
    InplaceFilterEdit.DropDownBox.Width := DropDownBoxWidth;
    Columns[FFilterCol].STFilter.UpdateValuesCheckingStateFromFilter(InplaceFilterEdit.Items);
  end;
end;

procedure TCustomDBGridEh.InTitleFilterListboxDropDownForRect(Column: TColumnEh; ForRect: TRect);
var
  List: TPopupListboxEh;
  NewWidth: Integer;
  P: TPoint;
  ADropDownAlign: TDropDownAlign;
begin
  List := GetInTitleFilterListbox;
  NewWidth := Column.STFilter.DropDownListWidth;
  Column.STFilter.FEnterNotClearData := False;
  List.Items.Clear;
  LoadInplaceFilterValues(Column.STFilter, List.Items, List, NewWidth);
  if NewWidth > Column.Width
    then List.Width := NewWidth
    else List.Width := Column.Width;
  Column.STFilter.UpdateValuesCheckingStateFromFilter(List.Items);
  FInTitleFilterListboxColumn := Column;
  List.Color := Self.Color;
  List.Font := Self.Font;
  List.ItemHeight := List.GetTextHeight;
  List.RowCount := Column.STFilter.FDropDownListRows;
  ForRect.TopLeft := Self.ClientToScreen(ForRect.TopLeft);
  ForRect.BottomRight := Self.ClientToScreen(ForRect.BottomRight);
  if UseRightToLeftAlignment
    then ADropDownAlign := daRight
    else ADropDownAlign := daLeft;
  P := AlignDropDownWindowRect(ForRect, List, ADropDownAlign);

(*  SetWindowPos(List.Handle, HWND_TOP {MOST}, P.X, P.Y, 0, 0,
    SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
  List.Visible := True; //commment for Tab key
  List.SizeGrip.Visible := True;*)

  List.SetBounds(P.X, P.Y, List.Width, List.Height);
  List.SizeGrip.Visible := True;
  List.Visible := True;

  FInTitleFilterListboxVisible := True;
  List.SizeGripResized := False;
end;

procedure TCustomDBGridEh.InTitleFilterListboxDropDown(Column: TColumnEh);
var
  MasterAbsRect, ACellRect: TRect;
begin
  if FInTitleFilterListboxVisible then
    InTitleFilterListboxCloseUp(False);

  MasterAbsRect := CellRect(DataToRawColumn(Column.Index), 0);
  ACellRect := MasterAbsRect;
  if RowPanel.Active then
  begin
    ACellRect.Left := ACellRect.Left + Column.FRowPlacement.Left;
    ACellRect.Top := ACellRect.Top + Column.FRowPlacement.Top;
    ACellRect.Right := ACellRect.Left + Column.FRowPlacement.Width;
    ACellRect.Bottom := ACellRect.Top + Column.FRowPlacement.Height;
    if dgColLines in Options then Inc(ACellRect.Right, GridLineWidth);
    if dgRowLines in Options then Inc(ACellRect.Bottom, GridLineWidth);
    if RowPanel.Active then
    begin
      OffsetRect(ACellRect, -FDataOffset.cx, 0);
      if ACellRect.Left < MasterAbsRect.Left then
        ACellRect.Left := MasterAbsRect.Left;
    end;
  end;
  InTitleFilterListboxDropDownForRect(Column, ACellRect);
  InvalidateTitle;
end;

procedure TCustomDBGridEh.InTitleFilterListboxCloseUp(Accept: Boolean);
var
  List: TPopupListboxEh;
  Item: TPopupListboxItemEh;
begin
  if FInTitleFilterListboxColumn.STFilter.FInFilterListBox then Exit;
  if FInTitleFilterListboxVisible then
  begin
    List := FInTitleFilterListbox;
    if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    SetWindowPos(List.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    List.Visible := False;
    if List.SizeGripResized then
    begin
      FInTitleFilterListboxColumn.STFilter.FDropDownListRows := List.RowCount;
      FInTitleFilterListboxColumn.STFilter.FDropDownListWidth := List.Width;
    end;
    if (GetFocus = List.Handle) then
      SetFocus;
    FInTitleFilterListboxVisible := False;
    FTrackingStateRect := EmptyRect;
    InvalidateTitle;
    OutBoundaryData.InvalidateOutBoundary(cbtTopEh);
    if not Accept then Exit;

    Item := nil;
    if List.ItemIndex >= 0 then
      Item := TPopupListboxItemEh(List.Items.Objects[List.ItemIndex]);
    if Item <> nil then
      Item.Execute(List, List.ItemIndex, Point(-1,-1), []);
  end;
  FInTitleFilterListboxGroupLevel := nil;
end;

procedure TCustomDBGridEh.StopEditFilter;
begin
  if STFilter.UpdateCount > 0 then
    Exit;
  HideFilterEdit;
  if FFilterEditMode <> False then
  begin
    FFilterEditMode := False;
    GridInvalidateRow(Self, TopDataOffset-1);
    GridInvalidateRow(Self, Row);
  end;
  UpdateEditorMode;
end;

procedure TCustomDBGridEh.HideFilterEdit;
begin
  if Assigned(FilterEdit) then
    TInplaceFilterEditEh(FilterEdit).FColumn := nil;
  if Assigned(FilterEdit) and FilterEdit.Visible then
  begin
    if Visible and CanFocus and FilterEdit.Focused then
      Windows.SetFocus(Handle);
    FilterEdit.Visible := False;
    if FFilterCol <> -1 then
    begin
      SetFilterValue(FFilterCol);
      InvalidateCell(FFilterCol+IndicatorOffset, TopDataOffset-1);
    end;
  end;
end;

function TCustomDBGridEh.CanFilterEditShow: Boolean;
begin
  Result := FFilterEditMode and
   ((Selection.SelectionType = gstNon) or not (dghClearSelection in OptionsEh));
end;

procedure TCustomDBGridEh.OnFilterKeyPress(Sender: TObject; var Key: Char);
var
  ItemIndex: Integer;
  Item: TPopupListboxItemEh;
begin
  if Key = #13 then
  begin
    Key := #0;
    SetDataFilter;
  end;

  if (Key = ' ') and (GetShiftState = [ssCtrl]) then
  begin
    ItemIndex := TPopupListboxEh(TInplaceFilterEditEh(Sender).PopupListbox).ItemIndex;
    if (ItemIndex >= 0) and TInplaceFilterEditEh(Sender).ListVisible and
       (TInplaceFilterEditEh(Sender).Items.Objects[ItemIndex] is TPopupListboxItemEh)
    then
    begin
      Item := TPopupListboxItemEh(TInplaceFilterEditEh(Sender).Items.Objects[ItemIndex]);
      if Item.CloseOnExecute(TPopupListboxEh(TInplaceFilterEditEh(Sender).PopupListbox), ItemIndex)
      then
        InTitleFilterListboxCloseUp(True)
      else
        Item.Execute(TPopupListboxEh(TInplaceFilterEditEh(Sender).PopupListbox),
          ItemIndex, Point(-1,-1), GetShiftState);
      TInplaceFilterEditEh(Sender).Column.STFilter.FEnterNotClearData := True;
      TPopupListboxEh(TInplaceFilterEditEh(Sender).PopupListbox).ItemIndex := ItemIndex;
      Key := #0;
    end;
  end;
end;

procedure TCustomDBGridEh.OnFilterEditButtonClick(Sender: TObject; var Handled: Boolean);
begin

end;

procedure TCustomDBGridEh.FilterExit(Sender: TObject);
begin

end;

procedure TCustomDBGridEh.FilterButtonClick(Sender: TObject; var Handled: Boolean);
begin
  TInplaceFilterEditEh(TControl(Sender).Parent).Clear;
  TInplaceFilterEditEh(TControl(Sender).Parent).Text := '';
end;

procedure TCustomDBGridEh.SetFilterValue(DCol: Integer);
var
  Column: TColumnEh;
begin
  if (DCol < 0) or (DCol >= Columns.Count) then
    Exit;
  Column := Columns[DCol];
  if Column.FieldName <> '' then
    Column.STFilter.InternalSetExpressionStr(FilterEdit.Text);
end;

procedure TCustomDBGridEh.UpdateFilterEdit(UpdateData: Boolean);
var
  DCol: Integer;
  FilterRect: TRect;
  ACellRect: TRect;
  Column: TColumnEh;
begin
  if STFilter.UpdateCount > 0 then
    Exit;
  if not STFilter.Visible or (STFilter.Location <> stflUnderTitleFilterEh) or
    not CanFilterCol(FFilterCol) or not FilterEditMode then
  begin
    FilterEditMode := False;
    Exit;
  end;
  DCol := FFilterCol;
  Column := Columns[FFilterCol];

  if RowPanel.Active then
  begin
    ACellRect := CellRect(IndicatorOffset, TopDataOffset-1);
    FilterRect := Rect(Column.FRowPlacement.Left,
                       Column.FRowPlacement.Top,
                       Column.FRowPlacement.Left + Column.FRowPlacement.Width,
                       Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    OffsetRect(FilterRect, ACellRect.Left, ACellRect.Top);
    OffsetRect(FilterRect, -FDataOffset.cx, 0);
  end else
  begin
    FilterRect := CellEditRect(DataToRawColumn(FFilterCol), TopDataOffset-1);
    if (VisibleColumns.Count > 0) and (Column = VisibleColumns[0]) then
    begin
      if DataGrouping.IsGroupingWorksWithLevel and (InstantReadRecordCount > 0) then
        Dec(FilterRect.Left, FExtraFirstColumnWidth);
      if RowDetailPanel.Active then
        Dec(FilterRect.Left, 18);
    end;
  end;

  FilterRect.Left := FilterRect.Left + 1;

  if Column.STFilter.FInFilterListBox then
  begin
    FilterEdit.Move(FilterRect);
    Exit;
  end;

  FFilterCol := DCol;

  if not CanFilterEditShow then
  begin
    HideFilterEdit;
    Exit;
  end;

  if UpdateData then
    FilterEdit.Move(Rect(0,0,0,0)); // Hide but safe focuse
  if HandleAllocated then
    FilterEdit.SetFocus;
  if UpdateData and ((FFilterCol >= 0) and (FFilterCol < Columns.Count)) then
  begin
    UpdateFilterEditProps(DCol);
    if HandleAllocated then
      FilterEdit.SelectAll;
  end;
  if HandleAllocated then
  begin
    FilterEdit.Move(FilterRect);
    SendMessage(FilterEdit.Handle, EM_SCROLLCARET, 0, 0); //Sometime need
  end;
end;

type
  TStringsCrack = class(TStrings);

procedure TCustomDBGridEh.UpdateFilterEditProps(DataCol: Longint);
var
  Column: TColumnEh;
  InplaceFilterEdit: TInplaceFilterEditEh;
begin
  Column := Columns[DataCol];
  InplaceFilterEdit := TInplaceFilterEditEh(FilterEdit);
  if TStringsCrack(InplaceFilterEdit.Items).UpdateCount > 0 then Exit;

  InplaceFilterEdit.FColumn := Column;
  InplaceFilterEdit.Items.Clear;
  if True{(Column.STFilter.ListSource <> nil) or MemTableSupport} then
  begin
    InplaceFilterEdit.OnCloseUp := OnFilterCloseUp;
    InplaceFilterEdit.OnClosingUp := OnFilterClosingUp;
    InplaceFilterEdit.OnGetItemsList := OnFilterGetItemsList;
    InplaceFilterEdit.Clear; //Value := Null;
    InplaceFilterEdit.Value := Null;
    InplaceFilterEdit.OnButtonClick := nil;

    InplaceFilterEdit.EditButton.Visible := True;
    InplaceFilterEdit.DropDownBox.Sizable := True;
    if Column.STFilter.CurrentKeyField <> ''
      then InplaceFilterEdit.SetKeyDisplayText(Column.STFilter.FKeyValues, Column.STFilter.ExpressionStr)
      else InplaceFilterEdit.Text := Column.STFilter.ExpressionStr;
    if Column.STFilter.DropDownListWidth > 0
      then InplaceFilterEdit.DropDownBox.Width := Column.STFilter.DropDownListWidth
      else InplaceFilterEdit.DropDownBox.Width := 100;
    if Column.STFilter.DropDownListRows > 0
      then InplaceFilterEdit.DropDownBox.Rows := Column.STFilter.DropDownListRows
      else InplaceFilterEdit.DropDownBox.Rows := 17;
  end
  else
  begin
    InplaceFilterEdit.Value := Null;

    InplaceFilterEdit.OnGetItemsList := nil;
    InplaceFilterEdit.EditButton.Visible := False;
    InplaceFilterEdit.Text := GetFilterValue(DataCol);
  end;
end;

function TCustomDBGridEh.GetInTitleFilterListbox: TPopupListboxEh;
begin
  if FInTitleFilterListbox = nil then
  begin
    FInTitleFilterListbox := TPopupListboxEh.Create(Self);
    FInTitleFilterListbox.UseItemObjects := True;
    FInTitleFilterListbox.Visible := False;
    FInTitleFilterListbox.Ctl3D := True;
    FInTitleFilterListbox.Parent := Self; // Already set parent in TPopupListboxEh.CreateWnd
    ShowWindow(FInTitleFilterListbox.Handle, SW_HIDE); //For Delphi 5 design time
    FInTitleFilterListbox.OnMouseUp := InTitleFilterListMouseUp;
    FInTitleFilterListbox.OnKeyDown := InTitleFilterListKeyDown;
    FInTitleFilterListbox.OnKeyPress := InTitleFilterListKeyPress;
  end;
  Result := FInTitleFilterListbox;
end;

procedure TCustomDBGridEh.InTitleFilterListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    if TPopupListboxEh(Sender).IsMouseUpCloseListbox then
      InTitleFilterListboxCloseUp(PtInRect(TPopupListboxEh(Sender).ClientRect, Point(X, Y)));
  end;
end;

procedure TCustomDBGridEh.InTitleFilterListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    InTitleFilterListboxCloseUp(False);
end;

procedure TCustomDBGridEh.InTitleFilterListKeyPress(Sender: TObject; var Key: Char);
var
  ItemIndex: Integer;
  Item: TPopupListboxItemEh;
begin
  if Key = #13 then
    InTitleFilterListboxCloseUp(True);
  if Key = ' ' then
  begin
    ItemIndex := TPopupListboxEh(Sender).ItemIndex;
    if (ItemIndex >= 0) and
       (TPopupListboxEh(Sender).Items.Objects[ItemIndex] is TPopupListboxItemEh)
    then
    begin
      FInTitleFilterListboxColumn.STFilter.FEnterNotClearData := True;
      Item := TPopupListboxItemEh(TPopupListboxEh(Sender).Items.Objects[ItemIndex]);
      if Item.CloseOnExecute(TPopupListboxEh(Sender), ItemIndex) then
        InTitleFilterListboxCloseUp(True)
      else
        Item.Execute(TPopupListboxEh(Sender), ItemIndex, Point(-1,-1), GetShiftState);
    end;
    Key := #0;
  end;
end;

procedure TCustomDBGridEh.ShowEditor;
begin
  if FilterEditMode then
    StopEditFilter;
  if RowPanel.Active then
    ClampInViewRowPanelCell(SelectedIndex);
  inherited ShowEditor;
end;

procedure TCustomDBGridEh.HideEditor;
begin
  inherited HideEditor;
  if RowPanel.Active then
  begin
    InvalidateCell(Col, Row);
    FInplaceColInRowPanel := -1;
    FInplaceRow := -1;
  end;
end;

procedure TCustomDBGridEh.UpdateEditorMode;
begin
  if (dgAlwaysShowEditor in Options) and not FilterEditMode
    then ShowEditor
    else HideEditor;
end;

procedure TCustomDBGridEh.UpdateEdit;

  procedure UpdateEditorInRowPanel;
  begin
    FInplaceColInRowPanel := FInRowPanelCol;
    FInplaceRow := Row;
    TDBGridInplaceEdit(InplaceEditor).UpdateContents;
    InplaceEditor.SelectAll;
  end;

var
  Column: TColumnEh;
  AEditRect, ACellRect: TRect;
  OldRigth: Integer;
begin
  if FLockEditorCount > 0 then Exit;
  if RowPanel.Active then
  begin
    if CanEditShow then
    begin
      if EnsureInplaceEditCreated then
        UpdateEditorInRowPanel
      else
      begin
        if (FInRowPanelCol <> FInplaceColInRowPanel) or (Row <> FInplaceRow) then
        begin
          HideEdit;
          UpdateEditorInRowPanel;
        end;
      end;
      Column := Columns[FInRowPanelCol];
      ACellRect := CellRect(Col, Row);
      AEditRect := Rect(Column.FRowPlacement.DataCellLeft,
                        Column.FRowPlacement.Top,
                        Column.FRowPlacement.DataCellLeft + Column.FRowPlacement.DataCellWidth,
                        Column.FRowPlacement.Top + Column.FRowPlacement.Height);
      if Self.UseRightToLeftAlignment then
      begin
        OffsetRect(AEditRect, 0, ACellRect.Top);
        OldRigth := AEditRect.Right;
        AEditRect.Right := ACellRect.Right - AEditRect.Left;
        AEditRect.Left := ACellRect.Right - OldRigth;
        OffsetRect(AEditRect, FDataOffset.cx, 0);
      end else
      begin
        OffsetRect(AEditRect, ACellRect.Left, ACellRect.Top);
        OffsetRect(AEditRect, -FDataOffset.cx, 0);
      end;
      if RowDetailPanel.Active and (Column = VisibleColumns[0]) then
        if AEditRect.Left + 18 < AEditRect.Right then
          if UseRightToLeftAlignment
            then AEditRect.Right := AEditRect.Right - 18
            else AEditRect.Left := AEditRect.Left + 18;
      if CanEditShow then InplaceEditor.Move(AEditRect);
    end;
  end else
    inherited UpdateEdit;
end;

procedure TCustomDBGridEh.UpdateText;
begin
  if RowPanel.Active then
  begin
    if (FInRowPanelCol <> -1) and (FInplaceRow <> -1) then
      SetEditText(FInRowPanelCol, FInplaceRow, InplaceEditor.Text);
  end else
    inherited UpdateText;
end;

{ IInplaceEditHolderEh }

procedure TCustomDBGridEh.GetMouseDownInfo(var Pos: TPoint; var Time: Integer);
begin
  inherited GetMouseDownInfo(Pos, Time);
end;

function TCustomDBGridEh.InplaceEditCanModify(Control: TWinControl): Boolean;
begin
  Result := inherited InplaceEditCanModify(Control);
end;

procedure TCustomDBGridEh.InplaceEditKeyDown(Control: TWinControl; var Key: Word; Shift: TShiftState);

type
  TSelection = record
    StartPos, EndPos: Integer;
  end;

  procedure Tab(GoForward: Boolean; Side: Boolean);
  var
    ACol, Original: Integer;
  begin
    Key := 0;
    if Side then
    begin
      if GoForward then
        ACol := Columns.Count
      else
        ACol := -1;
      GoForward := not GoForward;
    end
    else
      ACol := FFilterCol;
    Original := ACol;
    if GoForward
      then Inc(ACol)
      else Dec(ACol);
    if ACol >= Columns.Count then
      ACol := 0
    else if ACol < 0 then
      ACol := Columns.Count-1;
    if ACol = Original then
      Exit;
    while not CanFilterCol(ACol) do
    begin
      if GoForward
        then Inc(ACol)
        else Dec(ACol);
      if (ACol < 0) or (ACol >= Columns.Count) then
        Exit;
    end;
    StartEditFilter(ACol);
  end;

  function Selection: TSelection;
  begin
    MessageSendGetSel(Control.Handle, Result.StartPos, Result.EndPos);
  end;

  function CaretPos: Integer;
  var
    P: TPoint;
  begin
    Windows.GetCaretPos(P);
    Result := SendMessage(Control.Handle, EM_CHARFROMPOS, 0, MakeLong(Word(P.X), Word(P.Y)));
  end;

  function RightSide: Boolean;
  begin
    with Selection do
      Result := ((CaretPos = Control.GetTextLen) and
        ((StartPos = 0) or (EndPos = StartPos)) and (EndPos = Control.GetTextLen));
  end;

  function LeftSide: Boolean;
  begin
    with Selection do
      Result := (CaretPos = -1) or
        ((CaretPos = 0) and (StartPos = 0) and
        ((EndPos = 0) or (EndPos = GetTextLen))
        );
  end;

  procedure Deselect;
  begin
    SendMessage(Control.Handle, EM_SETSEL, $7FFFFFFF, Longint($FFFFFFFF));
  end;

  function Ctrl: Boolean;
  begin
    Result := ssCtrl in Shift;
  end;

begin
  inherited InplaceEditKeyDown(Control, Key, Shift);
  { TODO : May be replace to CMWontSpecialKey? }
  if UseRightToLeftAlignment then
    if Key = VK_LEFT then
      Key := VK_RIGHT
    else if Key = VK_RIGHT then
      Key := VK_LEFT;
  if (Control is TInplaceFilterEditEh) and
     TInplaceFilterEditEh(Control).ListVisible
  then
    Exit;
  case Key of
    VK_LEFT: if Ctrl or LeftSide then
        Tab(False, Ctrl);
    VK_RIGHT: if Ctrl or RightSide then
        Tab(True, Ctrl);
    VK_HOME: if Ctrl or LeftSide then
        Tab(False, True);
    VK_END: if Ctrl or RightSide then
        Tab(True, True);
    VK_TAB: if dgTabs in Options then
        Tab(not (ssShift in Shift), False);
    VK_DOWN:
      if ((Shift = []) or (Shift = [ssCtrl])) and DataLink.Active then
      begin
        SelectedIndex := FFilterCol;
        if Shift = [] then MoveBy(-DataLink.ActiveRecord);
        StopEditFilter;
        Key := 0;
      end;
    VK_UP: if (Shift = []) then
        Key := 0;
    VK_F2:
      begin
        Deselect;
        Key := 0;
      end;
    VK_RETURN:
      if Shift = [ssAlt] then
      begin
//        ShowFilterDialog;
//        Key := 0;
      end;
  end;
end;

procedure TCustomDBGridEh.InplaceEditKeyPress(Control: TWinControl; var Key: Char);
begin
  inherited InplaceEditKeyPress(Control, Key);
  if (Control is TInplaceFilterEditEh) then
  case Key of
    #9{, #27}: Key := #0;
  end;
end;

procedure TCustomDBGridEh.InplaceEditKeyUp(Control: TWinControl; var Key: Word; Shift: TShiftState);
begin
  inherited InplaceEditKeyUp(Control, Key, Shift);
end;

procedure TCustomDBGridEh.InplaceEditWndProc(Control: TWinControl; var Message: TMessage);
begin
  inherited InplaceEditWndProc(Control, Message);
end;

procedure TCustomDBGridEh.SetDataFilter;
var
  OldLeftCol: Integer;
begin
  if (FFilterCol <> -1) and (FilterEdit <> nil) and FilterEdit.Visible then
    SetFilterValue(FFilterCol);
  OldLeftCol := LeftCol;
  try
    try
      if Assigned(FOnApplyFilter)
        then FOnApplyFilter(Self)
        else DefaultApplyFilter;
    except
//ddd      ReleaseDataFilter;
      raise;
    end;
  finally
    if OldLeftCol < ColCount then
      LeftCol := OldLeftCol;
    UpdateFilterEdit(True);
    if SumList.Active then
      SumList.RecalcAll;
    Invalidate;
  end;
end;

procedure TCustomDBGridEh.DefaultApplyFilter;
begin
  LockPaint;
  try
    Center.ApplyFilter(Self);
  finally
    UnlockPaint;
    UpdateScrollBar;
    Invalidate;
  end;
end;

procedure TCustomDBGridEh.OnFilterChange(Sender: TObject);
begin
  if FFilterCol <> -1 then
    SetFilterValue(FFilterCol);
end;

function TCustomDBGridEh.CheckCellFilter(ACol, ARow: Integer; P: TPoint): Boolean;
begin
  Result := False;
  if ARow = TopDataOffset - 1 then
    Result := True;
end;

procedure TCustomDBGridEh.ApplyFilter;
begin
  SetDataFilter;
end;

procedure TCustomDBGridEh.ClearFilter;
var
  i: Integer;
begin
  StopEditFilter;
  for i := 0 to Columns.Count - 1 do
    Columns[i].STFilter.Clear;
  Invalidate;
end;

procedure TCustomDBGridEh.SetValueFromPrevRecord;
var
  Col: TColumnEh;
  v: Variant;
  Text: String;
  CurDataRow: Integer;
begin
  if ViewScroll then
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0)
      then CurDataRow := FCurGroupDataNode.DataSetRecordViewNo
      else CurDataRow := FIntMemTable.InstantReadCurRowNum
  else
    CurDataRow := DataLink.ActiveRecord;

  if DataLink.Active and (CurDataRow > 0) and
    Columns[SelectedIndex].CanModify(True) then
  begin
    Col := Columns[SelectedIndex];
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0)
      then FIntMemTable.InstantReadEnter(CurDataRow-1)
      else InstantReadRecordEnter(CurDataRow-1);
    try
      if Col.Field.Lookup
        then v := Col.Field.DataSet.FieldValues[Col.Field.KeyFields]
        else v := Col.Field.Value;
      Text := VarToStr(Col.Field.Value);
    finally
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0)
      then FIntMemTable.InstantReadLeave
      else InstantReadRecordLeave;
    end;
    Selection.Clear;
    Col.UpdateDataValues(Text, v, False);
    ShowEditor;
    if InplaceEditorVisible then
      InplaceEditor.SelectAll;
  end;
end;

procedure TCustomDBGridEh.OptimizeSelectedColsWidth(WithColumn: TColumnEh);
var
  I: Integer;
  WithColumnOptimized: Boolean;
  ColumnsList: TColumnsEhList;
begin
  ColumnsList := TColumnsEhList.Create;
  try
    WithColumnOptimized := False;
    if Selection.SelectionType = gstColumns then
      for I := 0 to Selection.Columns.Count-1 do
      begin
        ColumnsList.Add(Selection.Columns[I]);
        if WithColumn = Selection.Columns[I] then
          WithColumnOptimized := True;
      end
    else if Selection.SelectionType = gstAll then
      for I := 0 to Columns.Count-1 do
      begin
        ColumnsList.Add(Columns[I]);
        if WithColumn = Columns[I] then
          WithColumnOptimized := True;
      end;
    if not WithColumnOptimized then
      ColumnsList.Add(WithColumn);

     OptimizeColsWidth(ColumnsList);
  finally
    ColumnsList.Free;
  end;
end;

procedure TCustomDBGridEh.OptimizeAllColsWidth(const CheckRowCount : Integer = -1);
var
  I: Integer;
  ColumnsList: TColumnsEhList;
begin
  ColumnsList := TColumnsEhList.Create;
  try
    for I := 0 to Columns.Count-1 do
      ColumnsList.Add(Columns[I]);
    OptimizeColsWidth(ColumnsList, CheckRowCount);
  finally
    ColumnsList.Free;
  end;
end;

procedure TCustomDBGridEh.OptimizeColsWidth(ColumnsList: TColumnsEhList; const CheckRowCount : Integer = -1);

  procedure CalcTitleWidth(Column: TColumnEh; var MaxColWidth: Integer);
  var
    ExtraWidth, RightIndent, MaxTextHeight: Integer;
    S: String;
    ARect: TRect;
    WordWrap: Boolean;
  begin
    ExtraWidth := 5;
    if Column.Title.GetSortMarkingWidth > 2 then
      Inc(ExtraWidth, Column.Title.GetSortMarkingWidth - 2);
    if STFilter.Visible and Column.STFilter.Visible and
      (STFilter.Location = stflInTitleFilterEh)
    then
      if Flat then
      begin
        Inc(ExtraWidth, FlatButtonWidth);
        if not ThemesEnabled then
          Inc(ExtraWidth);
      end else
        Inc(ExtraWidth, GetSystemMetrics(SM_CXVSCROLL));

    if (TitleImages <> nil) and (Column.Title.ImageIndex <> -1) then
      MaxColWidth := TitleImages.Width + ExtraWidth
    else
    begin
      ARect := CellRect(Column.Index + IndicatorOffset, 0);
      Dec(ARect.Right, ExtraWidth);
      if IsUseMultiTitle = True then
      begin
        S := FLeafFieldArr[Column.Index].FLeaf.Text;
        ARect.Top := ARect.Bottom - FLeafFieldArr[Column.Index].FLeaf.Height + 1;
      end else
        S := Column.Title.Caption;
      WordWrap := (IsUseMultiTitle = True) or (TitleHeight <> 0) or (TitleLines <> 0);
      Canvas.Font.Assign(Column.Title.Font);
      if Column.Title.Orientation = tohVertical then
      begin
        WordWrap := False;
        OverturnUpRect(ARect);
      end;
      if WordWrap then RightIndent := 2 else RightIndent := 0;
      CheckHintTextRect(Self.DrawTextBiDiModeFlagsReadingOnly, Self.Canvas,
        RightIndent, 0, S, ARect, WordWrap, MaxColWidth, MaxTextHeight);
      if Column.Title.Orientation = tohVertical
        then MaxColWidth := MaxTextHeight + ExtraWidth
        else MaxColWidth := MaxColWidth + ExtraWidth;
    end;
  end;

  procedure CalcDataWidth(Column: TColumnEh; var MaxColWidth: Integer);
  var
    ExtraWidth, CurColWidth, MaxTextHeight: Integer;
    S: String;
    ARect: TRect;
    WordWrap: Boolean;
  begin

    ExtraWidth := 5;
    if Column.AlwaysShowEditButton then
      Inc(ExtraWidth, Column.EditButtonsWidth);
    if Column = VisibleColumns[0] then
    begin
      Inc(ExtraWidth, GetCellTreeElmentsAreaWidth);
      if RowDetailPanel.Active then
        Inc(ExtraWidth, 18);
    end;
    if Column.ShowImageAndText and Assigned(Column.ImageList) then
      Inc(ExtraWidth, Column.ImageList.Width + 4);

    if Column.GetColumnType = ctKeyImageList then
      CurColWidth := Column.ImageList.Width + ExtraWidth
    else if Column.GetColumnType = ctCheckboxes then
      CurColWidth := DefaultCheckBoxWidth + ExtraWidth
    else
    begin
      ARect := Rect(0,0,0,FStdDefaultRowHeight);
      S := Column.DisplayText;
//      WordWrap := Column.WordWrap and Column.CurLineWordWrap(RowHeights[ARow]);
      WordWrap := False;
      Canvas.Font.Assign(Column.Font);

      Column.FillColCellParams(ColCellParamsEh);
      with ColCellParamsEh do
      begin
        FBackground := Canvas.Brush.Color;
        FFont := Canvas.Font;
        FState := [];
        FAlignment := Column.Alignment;
        FText := S;
        FCol := Column.Index + IndicatorOffset;
        FRow := 0;
        GetCellParams(Column, FFont, FBackground, FState);
        Column.GetColCellParams(False, ColCellParamsEh);
        S := FText;
      end;

      if S <> '' then
        CheckHintTextRect(Self.DrawTextBiDiModeFlagsReadingOnly, Self.Canvas,
          0, 0, S, ARect, WordWrap, CurColWidth, MaxTextHeight)
      else
        CurColWidth := 0;

      CurColWidth := CurColWidth + ExtraWidth;
    end;
    if CurColWidth > MaxColWidth then
      MaxColWidth := CurColWidth;
  end;

  procedure CalcFooterWidth(Column: TColumnEh; var MaxColWidth: Integer);
  var
    ExtraWidth, CurColWidth, MaxTextHeight, I: Integer;
    S: String;
    ARect: TRect;
    Footer: TColumnFooterEh;
  begin
    ExtraWidth := 5;
    for I := 0 to FooterRowCount-1 do
    begin
      Footer := Column.UsedFooter(I);
      Canvas.Font := Footer.Font;
      Brush.Color := Footer.Color;

      ColCellParamsEh.FBackground := Footer.Color;
      ColCellParamsEh.Alignment := Footer.Alignment;
      S := GetFooterValue(I, Column);

      GetFooterParams(Column.Index, I, Column, Canvas.Font,
        ColCellParamsEh.FBackground, ColCellParamsEh.FAlignment, [], S);

      ARect := Rect(0,0,0,FStdDefaultRowHeight);
      CheckHintTextRect(Self.DrawTextBiDiModeFlagsReadingOnly, Self.Canvas,
        0, 0, S, ARect, Footer.WordWrap and FAllowWordWrap,
        CurColWidth, MaxTextHeight);
      CurColWidth := CurColWidth + ExtraWidth;

      if CurColWidth > MaxColWidth then
        MaxColWidth := CurColWidth;
    end;
  end;

var
  AllColHaveMaxSize : Boolean;
  I, Rn, RCount: Integer;
  ColWidths: array of Integer;
begin
  SetLength(ColWidths, ColumnsList.Count);

  for I := 0 to ColumnsList.Count-1 do
    begin
      CalcTitleWidth(ColumnsList[i], ColWidths[i]);

      if (ColumnsList[i].MaxWidth <> 0) and (ColWidths[i] > ColumnsList[i].MaxWidth) then
        ColWidths[i] := ColumnsList[i].MaxWidth;
    end;

  if not DataLink.Active then Exit;

  DataSource.DataSet.DisableControls;
  try
    SaveBookmark;
    DataSource.DataSet.First;
    RCount := DataSource.DataSet.RecordCount;
    try
      while not DataSource.DataSet.Eof do
      begin
        Rn := DataSource.DataSet.RecNo;
        AllColHaveMaxSize := True;

        for I := 0 to ColumnsList.Count-1 do
          if (ColWidths[i] < ColumnsList[i].MaxWidth) or (ColumnsList[i].MaxWidth = 0) then
            begin
              CalcDataWidth(ColumnsList[i], ColWidths[i]);

              if (ColumnsList[i].MaxWidth <> 0) and (ColWidths[i] > ColumnsList[i].MaxWidth) then
                ColWidths[i] := ColumnsList[i].MaxWidth
              else
                AllColHaveMaxSize := False;
            end;

        if AllColHaveMaxSize then
          Break;

        if (CheckRowCount > -1) and (Rn >= CheckRowCount) then
          Break;

        if DataSource.DataSet.IsSequenced and (Rn >= RCount) then
          Break;

        DataSource.DataSet.Next;
      end;
    finally
      RestoreBookmark;
    end;

    if not AutoFitColWidths then BeginLayout;
    try
      for I := 0 to ColumnsList.Count-1 do
      begin
        CalcFooterWidth(ColumnsList[i], ColWidths[i]);
        ColumnsList[i].Width := ColWidths[i];
      end;
    finally
      if not AutoFitColWidths then EndLayout;
    end;
  finally
    DataSource.DataSet.EnableControls;
  end;
end;

function TCustomDBGridEh.IsFindDialogShowAsModal: Boolean;
begin
  Result := True;
end;

function TCustomDBGridEh.GetCellTreeElmentsAreaWidth: Integer;
begin
  Result := 0;
  if (FIntMemTable <> nil) and FIntMemTable.MemTableIsTreeList then
    Result := FIntMemTable.GetTreeNodeLevel * 18;
  if Result < 0 then
    Result := 0;
end;

procedure TCustomDBGridEh.DrawGridTreeElement(Canvas: TCanvas; ARect: TRect;
  TreeElement: TTreeElementEh; BackDot: Boolean;
  ScaleX, ScaleY: Double; RightToLeft: Boolean;
  Coloured: Boolean; GlyphStyle: TTreeViewGlyphStyleEh);
var
  RTLRect: TRect;
begin
  if UseRightToLeftAlignment then
  begin
    begin
      WindowsLPtoDP(Canvas.Handle, ARect);
      SwapInt(ARect.Left, ARect.Right);
      ChangeGridOrientation(False);
    end;
    SetLayout(Canvas.Handle, LAYOUT_RTL_EH);
    RTLRect := ARect;
    RTLRect.Left := ClientWidth - ARect.Right;
    RTLRect.Right := RTLRect.Left + ARect.Right - ARect.Left;
    DrawTreeElement(Canvas, RTLRect, TreeElement, BackDot, ScaleX, ScaleY,
      RightToLeft, Coloured, GlyphStyle);
    SetLayout(Canvas.Handle, 0);
    ChangeGridOrientation(True);
  end else
  begin
    DrawTreeElement(Canvas, ARect, TreeElement, BackDot, ScaleX, ScaleY,
      RightToLeft, Coloured, GlyphStyle);
  end;
end;

procedure TCustomDBGridEh.DrawTreeArea(Canvas: TCanvas; ARect: TRect;
  IsDrawEdge: Boolean; IsSubTreeArea: Boolean);
var
  ARect1: TRect;
  i: Integer;
  OneAdd: Integer;
  Element: TTreeElementEh;
  DrawElement: Boolean;
  LowBoundaryLine: Boolean;
  RecHandle: HRgn;
  DataClipped: Boolean;

  procedure DrawOneTreeElement(Canvas: TCanvas; ARect: TRect; TreeElement: TTreeElementEh);
  var
    ARectE: TRect;
  begin
    ARectE := ARect;
    Inc(ARectE.Bottom, OneAdd);
    Canvas.FillRect(ARectE);
    DrawGridTreeElement(Canvas, ARectE, TreeElement, //False);
     (FStdDefaultRowHeight mod 2 = 1) and (TopRow mod 2 = 1), 1, 1,
     UseRightToLeftAlignment, True, TreeViewParams.GetActualGlyphStyle);
  end;

  procedure ClipData;
  var
    ClipRect: TRect;
  begin
    ClipRect := ARect;
    Inc(ClipRect.Bottom);
    RecHandle := SelectClipRectangleEh(Canvas, ClipRect);
    DataClipped := True;
  end;

  procedure UnClipData;
  begin
    if DataClipped then
      RestoreClipRectangleEh(Canvas, RecHandle);
  end;

begin
  DataClipped := False;
  try
  RecHandle := 0;
  OneAdd := 0;
  ARect1 := ARect;
  ARect1.Right := ARect1.Left + 18;
  if ARect1.Right > ARect.Right then
    ClipData;
  LowBoundaryLine := GridLineParams.GridBoundaries and
    (FIntMemTable.InstantReadViewRow = FIntMemTable.InstantReadRowCount-1);
  if (dgRowLines in Options) and IsDrawEdge and not LowBoundaryLine {and
    (FIntMemTable.GetNextVisibleTreeNodeLevel < 0) or
    (FIntMemTable.GetNextVisibleTreeNodeLevel >= FIntMemTable.GetTreeNodeLevel)}
  then
  begin
    Canvas.Pen.Color := Canvas.Brush.Color;
    DrawPolyline([Point(ARect1.Left, ARect1.Bottom),
                     Point(ARect1.Right, ARect1.Bottom)]);
    OneAdd := 1;
  end;
  for i := 1 to FIntMemTable.GetTreeNodeLevel-1 do
  begin
    if FIntMemTable.ParentHasNextSibling(i) and TreeViewParams.ShowTreeLines
      then DrawOneTreeElement(Canvas, ARect1, tehVLine)
      else Canvas.FillRect(ARect1);
    ARect1.Left := ARect1.Left + 18;
    ARect1.Right := ARect1.Left + 18;
    if (ARect1.Right > ARect.Right) and not DataClipped then
      ClipData;
    if (dgRowLines in Options) and IsDrawEdge and not LowBoundaryLine and
       ((FIntMemTable.GetNextVisibleTreeNodeLevel < 0) or
       (FIntMemTable.GetNextVisibleTreeNodeLevel > i))
    then
    begin
      Canvas.Pen.Color := Canvas.Brush.Color;
      DrawPolyline([Point(ARect1.Left, ARect1.Bottom),
                       Point(ARect1.Right,ARect1.Bottom)]);
      OneAdd := 1;
    end else
      OneAdd := 0;
  end;

  if FIntMemTable.GetTreeNodeHasChields then
    if FIntMemTable.ParentHasNextSibling(FIntMemTable.GetTreeNodeLevel)
    then
      if FIntMemTable.GetTreeNodeExpanded
        then Element := tehMinusUpDown
        else Element := tehPlusUpDown
    else
      if FIntMemTable.GetTreeNodeExpanded
        then Element := tehMinusUp
        else Element := tehPlusUp
  else
    if FIntMemTable.ParentHasNextSibling(FIntMemTable.GetTreeNodeLevel)
      then Element := tehCrossUpDown
      else Element := tehCrossUp;

  DrawElement := True;
  if not TreeViewParams.ShowTreeLines then
    if Element in [tehMinusUpDown, tehMinusUp, tehMinusDown] then
      Element := tehMinus
    else if Element in [tehPlusUpDown, tehPlusUp, tehPlusDown, tehPlus] then
      Element := tehPlus
    else
      DrawElement := False;

  if DrawElement then
    if IsSubTreeArea then
    begin
      if Element in [tehMinusUpDown, tehPlusUpDown, tehCrossUpDown] then
      begin
        Element := tehVLine;
        if TreeViewParams.ShowTreeLines then
          DrawOneTreeElement(Canvas, ARect1, Element);
      end
    end else
      DrawOneTreeElement(Canvas, ARect1, Element)
  else
    Canvas.FillRect(ARect1);

  if GridLineParams.DataHorzLines and IsDrawEdge then
  begin
    Canvas.Pen.Color := GridLineParams.GetDataHorzColor;
    DrawPolyline([Point(ARect1.Right-1, ARect1.Bottom),
                     Point(ARect1.Right-1, ARect1.Top-2)]);
  end;
  ARect.Left := ARect1.Right;
  finally
    UnClipData;
  end;
end;

procedure TCustomDBGridEh.DrawCellTreeArea(DataCol, DataRow: Integer;
  AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean);
var
  Multiselected: Boolean;
  AColor, OldColor: TColor;
begin
  if (FIntMemTable <> nil) and FIntMemTable.MemTableIsTreeList then
  begin
    AColor := FInternalColor;
    Multiselected := DataCellSelected(DataCol, Datalink.Datasource.Dataset.Bookmark);
    if Multiselected and Assigned(Style) then
      Style.HighlightDataCellColor(Self, DataCol + IndicatorOffset, DataRow + TopDataOffset,
        DataCol, DataRow, '', AState, Multiselected, AColor, Canvas.Font);
    OldColor := Canvas.Brush.Color;
    Canvas.Brush.Color := AColor;

    DrawTreeArea(Canvas, ARect, True, False);
    Canvas.Brush.Color := OldColor;
  end;
end;

function TCustomDBGridEh.CellTreeElementMouseDown(MouseX, MouseY: Integer;
  CheckInOnly: Boolean): Boolean;
var
  Cell: TGridCoord;
  ARect: TRect;
  RowOffset, OldTopRow, FirstVisibleParentRecNo, TreeAreaWidth: Integer;
  TreeNodeExpanded: Boolean;
  Rec: TObject;
begin
  Result := False;
  FirstVisibleParentRecNo := -1;
  if not ((FIntMemTable <> nil) and FIntMemTable.MemTableIsTreeList) then Exit;
  Cell := MouseCoord(MouseX, MouseY);
  ARect := CellRect(Cell.X, Cell.Y);
  if (Cell.Y >= TopDataOffset) and (Cell.X >= IndicatorOffset) then
  begin
    if Columns[RawToDataColumn(Cell.X)] <> VisibleColumns[0] then
      Exit;
    RowOffset := Cell.Y - Row;
    OldTopRow := TopRow;
    Rec := FIntMemTable.GetRecObject;
    try
      if RowOffset <> 0 then
        FIntMemTable.InstantReadEnter(Cell.Y-TopDataOffset);
      TreeAreaWidth := GetCellTreeElmentsAreaWidth;
      TreeNodeExpanded := FIntMemTable.GetTreeNodeExpanded;
    finally
      if RowOffset <> 0 then
        FIntMemTable.InstantReadLeave;
    end;
    if Self.UseRightToLeftAlignment then
      MouseX := ARect.Right + ARect.Left - MouseX;
    if (ARect.Left <= MouseX ) and (MouseX < ARect.Left + TreeAreaWidth) then
    begin
      Result := True;
      if CheckInOnly then Exit;
      DataLink.UpdateData;
      DataLink.DataSet.CheckBrowseMode;
      DataSource.DataSet.DisableControls;
      if (ARect.Left + TreeAreaWidth - 18 <= MouseX ) then
        FirstVisibleParentRecNo := FIntMemTable.SetTreeNodeExpanded(Cell.Y-TopDataOffset, not TreeNodeExpanded);

      LockPaint;
      FLockAutoShowCurCell := True;
      try
        if (FirstVisibleParentRecNo > 0) and (FirstVisibleParentRecNo <> DataSource.DataSet.RecNo) then
          DataSource.DataSet.RecNo := FirstVisibleParentRecNo
        else
          FIntMemTable.SetToRec(Rec);
        DataSource.DataSet.EnableControls;
        SafeMoveTop(OldTopRow);
      finally
        UnlockPaint;
        FLockAutoShowCurCell := False;
      end;
      Invalidate;
      UpdateScrollBar;
    end;
  end;
end;

function TCustomDBGridEh.CheckCellCanSendDoubleClicks(CellHit: TGridCoord;
  Button: TMouseButton; ShiftState: TShiftState;
  MousePos, InCellMousePos: TPoint): Boolean;
begin
  Result := not CellTreeElementMouseDown(MousePos.X, MousePos.Y, True);
end;

function TCustomDBGridEh.CheckBeginRowMoving(MouseX, MouseY: Integer; CheckInOnly: Boolean): Boolean;
var
  Cell: TGridCoord;
  ARect: TRect;
  Bookmark: TUniBookmarkEh;
  DataRow: Integer;
  DrawInfo: TGridDrawInfoEh;
begin
  Result := False;
  if not DataLink.Active or not (dghRecordMoving in OptionsEh) then Exit;
  Cell := MouseCoord(MouseX, MouseY);
  Result := (Cell.X >= 0) and (Cell.X < FIndicatorOffset) and
    (Cell.Y > TopDataOffset - 1) and (Cell.Y < RowCount) and
    DataLink.Active and not (DataSource.DataSet.Eof and DataSource.DataSet.Bof);
  if Result then
  begin
    DataRow := Cell.Y - TopDataOffset;
    InstantReadRecordEnter(DataRow);
    try
      Bookmark := DataLink.DataSet.Bookmark;
      FMoveRowSourLevel := -1;
      if MemTableSupport then
        FMoveRowSourLevel := FIntMemTable.GetTreeNodeLevel;
      if CanSelectType(gstRecordBookmarks) then
        Result := FBookmarks.CurrentRowSelected and (GetShiftState * [ssShift, ssAlt, ssCtrl] = []);
    finally
      InstantReadRecordLeave;
    end;
    if not Result then Exit;
    ARect := CellRect(Cell.X, Cell.Y);
    Result := True;
    if CheckInOnly then Exit;
    FMoveRowSour := DataRow  + TopDataOffset;
    FMoveRowDest := FMoveRowSour;
    FMoveBookmarkSour := Bookmark;
    if BeginDataRowDrag(FMoveRowSour, FMoveRowDest, Point(MouseX, MouseY)) then
    begin
      FDBGridEhState := dgsRowMoving;
      Update;
      CalcDrawInfo(DrawInfo);
      FMoveRowLeftBounds := CalcLeftMoveLine(Cell.Y, Point(MouseX, MouseY), FMoveRowDestLevel);
      DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);
      SetTimer(Handle, 1, 60, nil);
      FTracking := True;
    end;
  end;
end;

procedure TCustomDBGridEh.EndRowMoving(MouseX, MouseY: Integer; Accept: Boolean);
begin
  KillTimer(Handle, 1);
  HideDataRowMove;
  FDBGridEhState := dgsNormal;
  if not Accept then Exit;
  if EndRowDrag(FMoveRowSour, FMoveRowDest, Point(MouseX, MouseY)) and
   ((FMoveRowSour <> FMoveRowDest) or (FMoveRowDestLevel <> FMoveRowSourLevel))
  then
    MoveSelectedDataRows(FMoveRowDest - TopDataOffset, FMoveRowDestLevel, False);
end;

function TCustomDBGridEh.EndColumnDrag(var Origin, Destination: Integer; const MousePt: TPoint): Boolean;
begin
  Result := inherited EndColumnDrag(Origin, Destination, MousePt);
  if FGroupDataMovingIndex >= 0 then
  begin
    LockPaint;
    try
      if RowDetailPanel.Visible then
        RowDetailPanel.Visible := False;
      TColumnEh(DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Column).Visible := True;
      DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Destroy;
    finally
      UnlockPaint;
      Invalidate;
    end;
  end;
end;

function TCustomDBGridEh.MoveSelectedDataRows(ToIndex: Longint;
  TreeLevel: Integer; CheckOnly: Boolean): Boolean;
var
  BookmarkList: TBMListEh;
begin
  if SelectedRows.Count = 0 then
  begin
    BookmarkList := TBMListEh.Create;
    BookmarkList.AppendItem(FMoveBookmarkSour);
    Result := MoveDataRows(BookmarkList, ToIndex, TreeLevel, CheckOnly);
    BookmarkList.Free;
  end else
    Result := MoveDataRows(SelectedRows, ToIndex, TreeLevel, CheckOnly);
end;

function TCustomDBGridEh.BeginDataRowDrag(var Origin, Destination: Integer;
      const MousePt: TPoint): Boolean;
begin
  Result := True;
end;

procedure TCustomDBGridEh.DrawDataRowMove(LeftBoundary, RightBoundary: Integer);
var
  OldPen: TPen;
  Pos: Integer;
  R: TRect;
begin
  OldPen := TPen.Create;
  try
    with Canvas do
    begin
      OldPen.Assign(Pen);
      try
        if FDBGridEhState = dgsRowMoving then
        begin
          R := CellRect(0, FMoveRowDest);
          if FMoveRowDest = FMoveRowSour then
            if FMoveRowSourLevel > FMoveRowDestLevel
              then Pos := R.Bottom
              else Pos := R.Top
          else if FMoveRowDest > FMoveRowSour then
            Pos := R.Bottom
          else
            Pos := R.Top;
          if GetMoveLineEh.Visible
           then GetMoveLineEh.MoveToFor(Self, Point(LeftBoundary, Pos))
           else GetMoveLineEh.StartShow(Self, Point(LeftBoundary, Pos), False, RightBoundary-LeftBoundary);

          FDataRowMoveLeftBoundary := LeftBoundary;
          FDataRowMoveRightBoundary := RightBoundary;
          FDataRowMoveVisible := not FDataRowMoveVisible;
        end;
      finally
      end;
    end;
  finally
    OldPen.Free;
  end;
end;

procedure TCustomDBGridEh.HideDataRowMove;
begin
  GetMoveLineEh.Hide;
  FDataRowMoveVisible := False;
end;

procedure TCustomDBGridEh.MoveDataRowAndScroll(Mouse, CellHit: Integer;
  var DrawInfo: TGridDrawInfoEh; var Axis: TGridAxisDrawInfoEh;
  ScrollBar: Integer; const MousePt: TPoint);
var
  TreeLevel, LeftBounds: Integer;
begin
  if Self.UseRightToLeftAlignment and (ScrollBar = SB_HORZ) then
    Mouse := ClientWidth - Mouse;
  LeftBounds := CalcLeftMoveLine(CellHit, MousePt, TreeLevel);
  if MemTableSupport then
  begin
    if (FMoveRowLeftBounds <> LeftBounds) or
      ((CellHit <> FMoveRowDest) and
        not((FMoveRowDest = Axis.FixedCellCount) and (Mouse < Axis.FixedBoundary)) and
        not((FMoveRowDest = Axis.GridCellCount-1) and (Mouse > Axis.GridBoundary))) then
    begin
      if (Mouse < Axis.FixedBoundary) then
      begin
        if (FMoveRowDest > Axis.FixedCellCount) and (SafeMoveTop(TopRow-1, True) <> TopRow) then
        begin
          SafeMoveTop(TopRow-1);
          Update;
          CalcDrawInfo(DrawInfo);    // this changes contents of Axis var
        end;
        CellHit := Axis.FirstGridCell;
      end
      else if (Mouse >= Axis.FullVisBoundary) then
      begin
        if (SafeMoveTop(TopRow+1, True) <> TopRow) then
        begin
          SafeMoveTop(TopRow+1);
          Update;
          CalcDrawInfo(DrawInfo);    // this changes contents of Axis var
        end;
        CellHit := Axis.LastFullVisibleCell;
      end
      else if CellHit < 0 then
        CellHit := FMoveRowDest;
      if MoveSelectedDataRows(CellHit - TopDataOffset, TreeLevel, True) then
      begin
        FMoveRowDest := CellHit;
        FMoveRowDestLevel := TreeLevel;
        DrawDataRowMove(LeftBounds, DrawInfo.Horz.FullVisBoundary);
        FMoveRowLeftBounds := LeftBounds;
      end;
    end
  end else if (CellHit <> FMoveRowDest) or
      (Mouse < Axis.FixedBoundary) or (Mouse > Axis.GridBoundary) then
    begin
      if (CellHit >= TopDataOffset + DataRowCount) or (Mouse > Axis.GridBoundary) then
      begin
        DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);   // hide the drag line
        MoveBy(DataLink.RecordCount - DataLink.ActiveRecord);
        MoveBy(1);
        DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);   // show the drag line
        CellHit := TopDataOffset + DataRowCount - 1;
        Update;
      end else if (CellHit < TopDataOffset) then
      begin
        DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);   // hide the drag line
        MoveBy(-DataLink.ActiveRecord);
        MoveBy(-1);
        DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);   // show the drag line
        CellHit := TopDataOffset;
        Update;
      end;

      if MoveSelectedDataRows(CellHit - TopDataOffset, TreeLevel, True) then
      begin
        DrawDataRowMove(FMoveRowLeftBounds, DrawInfo.Horz.FullVisBoundary);   // hide the drag line
        FMoveRowDest := CellHit;
        FMoveRowDestLevel := TreeLevel;
        DrawDataRowMove(LeftBounds, DrawInfo.Horz.FullVisBoundary);
        FMoveRowLeftBounds := LeftBounds;
      end;
    end;
end;

function TCustomDBGridEh.DefaultMoveDataRows(BookmarkList: TBMListEh;
  ToRecNo: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean;
var
  ActiveRecord, LookedOffset, LockedRecNo: Integer;
begin
  Result := False;
  if MemTableSupport then
    Result := FIntMemTable.MoveRecords(BookmarkList, ToRecNo, TreeLevel, CheckOnly)
  else if (DataSource <> nil) and (DataSource.DataSet <> nil) then
  begin
    LookedOffset := DataLink.ActiveRecord - (DataLink.RecordCount div 2) +
      ((DataLink.RecordCount + 1) mod 2) { - 1};
    ActiveRecord := DataLink.ActiveRecord;
    try
      DataLink.ActiveRecord := ActiveRecord - FLookedOffset;
      LockedRecNo := DataLink.DataSet.RecNo;
    finally
      DataLink.ActiveRecord := ActiveRecord;
    end;

    Result := Center.MoveRecords(Self, BookmarkList, ToRecNo, CheckOnly);
    if not CheckOnly then
    begin
      DataLink.DataSet.RecNo := LockedRecNo;
      MoveBy(LookedOffset);
    end;
  end;
end;

function TCustomDBGridEh.MoveDataRows(BookmarkList: TBMListEh;
  ToIndex: Longint; TreeLevel: Integer; CheckOnly: Boolean): Boolean;
var
  RecNo: Integer;
begin
  RecNo := DataRowToRecNo(ToIndex);
  if Assigned(OnMoveRecords)
    then Result := OnMoveRecords(Self, BookmarkList, RecNo, TreeLevel, CheckOnly)
    else Result := DefaultMoveDataRows(BookmarkList, RecNo, TreeLevel, CheckOnly);
end;

function TCustomDBGridEh.CalcLeftMoveLine(ARow: Integer; const MousePt: TPoint;
  var TreeLevel: Integer): Integer;
var
  ARect: TRect;
  PrevLevel, NextLevel, NextPos, CheckPos: Integer;
  FromDataRow, ToDataRow: Integer;
begin
  Result := 0;
  TreeLevel := -1;
  if not MemTableSupport or not FIntMemTable.MemTableIsTreeList then Exit;
  ARect := CellRect(IndicatorOffset, 0);
  FromDataRow := FMoveRowSour - TopDataOffset;
  ToDataRow := ARow - TopDataOffset;
  if (ToDataRow < 0) then ToDataRow := 0;
  if (ToDataRow >= DataRowCount) then ToDataRow := DataRowCount - 1;
  InstantReadRecordEnter(ToDataRow);
  try
    TreeLevel := FIntMemTable.GetTreeNodeLevel;
    PrevLevel := FIntMemTable.GetPrevVisibleTreeNodeLevel;
    NextLevel := FIntMemTable.GetNextVisibleTreeNodeLevel;
    if NextLevel <= 0 then NextLevel := 1;
    NextPos := ARect.Left + NextLevel * 18;
    Result := ARect.Left + TreeLevel * 18;
    if FromDataRow <= ToDataRow then
    begin
      if FromDataRow < ToDataRow then
      begin
        PrevLevel := TreeLevel;
        Result := NextPos;
        TreeLevel := NextLevel;
      end;
      CheckPos := NextPos;
    end else
      CheckPos := Result;
    if MousePt.X > CheckPos then
    begin
      TreeLevel := (MousePt.X - ARect.Left) div 18;
      if TreeLevel > PrevLevel + 1 then
        TreeLevel := PrevLevel + 1;
      Result := ARect.Left + TreeLevel * 18;
    end
  finally
    InstantReadRecordLeave;
  end;
end;

procedure TCustomDBGridEh.ExecuteFindDialog(Text, FieldName: String; Modal: Boolean);
begin
  if Center <> nil then
    Center.ExecuteFindDialog(Self, Text, FieldName, Modal)
  else
    ExecuteDBGridEhFindDialogProc(Self, Text, '', nil, Modal);
end;

procedure TCustomDBGridEh.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  Proc(FRowDetailControl);
end;

procedure TCustomDBGridEh.AncestorNotFound(Reader: TReader;
  const ComponentName: string; ComponentClass: TPersistentClass;
  var Component: TComponent);
begin
  if (ComponentName = 'RowDetailData') and (Reader.Root <> nil) then
    Component := FRowDetailControl;
end;

procedure TCustomDBGridEh.CreateComponent(Reader: TReader;
  ComponentClass: TComponentClass; var Component: TComponent);
begin
  if ComponentClass.InheritsFrom(TRowDetailPanelControlEh) then
//  if ComponentClass = TRowDetailPanelControlEh then
    Component := FRowDetailControl;
end;

procedure TCustomDBGridEh.ReadState(Reader: TReader);
var
  OldOnCreateComponent: TCreateComponentEvent;
  OldOnAncestorNotFound: TAncestorNotFoundEvent;
begin

  OldOnCreateComponent := Reader.OnCreateComponent;
  OldOnAncestorNotFound := Reader.OnAncestorNotFound;
  Reader.OnCreateComponent := CreateComponent;
  Reader.OnAncestorNotFound := AncestorNotFound;

  try
    inherited ReadState(Reader);
  finally
    Reader.OnCreateComponent := OldOnCreateComponent;
    Reader.OnAncestorNotFound := OldOnAncestorNotFound;
  end;
end;


procedure TGridEmptyDataInfoEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.Invalidate;
  end;
end;

{ THeadTreeNode }

function ExtractWordPos(N: Integer; const S: String; WordDelims: TCharSet;
  var Pos: Integer): String; forward;

constructor THeadTreeNode.Create;
begin
  inherited Create;
  Child := Nil; Next := Self; Host := nil; WIndent := 0;
end;

constructor THeadTreeNode.CreateText(const AText: String; const AHeight, AWidth: Integer);
begin
  Create;
  Text := AText;
  Height := AHeight;
  Width := AWidth;
end;

destructor THeadTreeNode.Destroy;
begin
  inherited;
  if (Host = nil) then
  begin
    FreeAllChild;
  end;
end;

function THeadTreeNode.Add(AAfter: THeadTreeNode; AText: String; AHeight, AWidth: Integer): THeadTreeNode;
var htLast, th: THeadTreeNode;
begin
  if (Find(AAfter) = false)
    then raise Exception.Create('Node not in Tree');
  htLast := AAfter.Next;
  th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
  th.Host := AAfter.Host;
  AAfter.Next := th;
  th.Next := htLast;
  Result := th;
end;

function THeadTreeNode.AddChild(ANode: THeadTreeNode; AText: String; AHeight, AWidth: Integer): THeadTreeNode;
var htLast, th: THeadTreeNode;
begin
  if (Find(ANode) = false) then raise Exception.Create('Node not in Tree');

  if (ANode.Child = nil) then
  begin
    th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
    th.Host := ANode;
    ANode.Child := th;
  end else
  begin
    htLast := ANode.Child;
    while ANode.Child <> htLast.Next
      do htLast := htLast.Next;
    th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
    th.Host := ANode;
    htLast.Next := th;
    th.Next := ANode.Child;
  end;
  Result := th;
end;

procedure THeadTreeNode.FreeAllChild;
var htLast, htm: THeadTreeNode;
begin
  if (Child = nil) then Exit;
  htLast := Child;

  while true do
  begin
    htLast.FreeAllChild;
    if (Child = htLast.Next)
      then begin htLast.Free; break; end;
    htm := htLast;
    htLast := htLast.Next;
    htm.Free;
  end;
  Child := nil;
end;

function THeadTreeNode.Find(ANode: THeadTreeNode): Boolean;
var
  htLast: THeadTreeNode;
begin
  htLast := Self;
  repeat
    if (htLast = ANode)
      then begin Result := true; break; end
{$IFDEF CPUX64}
{$ELSE}
      else Result := False
{$ENDIF}
    ;
    if (htLast.Child <> nil) and (htLast.Child.Find(ANode) = true)
      then begin Result := true; break; end;
    if (Self = htLast.Next)
      then begin Result := false; break; end;
    htLast := htLast.Next;
  until False = True;
end;

function THeadTreeNode.GetLevel: Integer;
var
  Node: THeadTreeNode;
begin
  Result := 0;
  Node := Self;
  while (Node.Host <> nil) do
  begin
    Node := Node.Host;
    Inc(Result);
  end;
end;

procedure THeadTreeNode.Union(AFrom, ATo: THeadTreeNode; AText: String; AHeight: Integer);
var
  th, tUn, TBeforFrom: THeadTreeNode;
  toFinded: Boolean;
  wid: Integer;
begin
  if (Find(AFrom) = false) then
    raise Exception.Create('Node not in Tree');
  toFinded := True;
  if (AFrom <> ATo) then //new
  begin
    th := AFrom; toFinded := false;
    while AFrom.HOst.Child <> th.Next do
    begin
      if (th.Next = ATo)
        then begin toFinded := true; break; end;
      th := th.Next;
    end;
  end;

  if (toFinded = false) then
    raise Exception.Create('ATo not in level');

  tUn := ATo.Add(ATo, AText, AHeight, 0);
  tUn.VLineWidth := ATo.VLineWidth;
  TBeforFrom := AFrom.Host.Child;
  while TBeforFrom.Next <> AFrom do
    TBeforFrom := TBeforFrom.Next;

  TBeforFrom.Next := tUn;

  th := AFrom; tUn.Child := AFrom;
  if (th = AFrom.Host.Child) then
    AFrom.Host.Child := tUn;
  Wid := 0;
  while th <> ATo.Next do
  begin
    Inc(Wid, th.Width);
    Inc(Wid, tUn.VLineWidth);
    Dec(th.Height, AHeight);
    th.Host := TUn;
    th := th.Next;
  end;
  if (tUn.VLineWidth > 0) then
    Dec(Wid, tUn.VLineWidth);
  ATo.Next := AFrom;
  tUn.Width := Wid;
end;

procedure THeadTreeNode.CreateFieldTree(AGrid: TCustomDBGridEh);
var
  i, apos, j, depth: Integer;
  node, nodeFrom, nodeTo: THeadTreeNode;
  ss, ss1: String;
  sameWord, GroupDid: Boolean;
begin
  FreeAllChild;

  for i := 0 to AGrid.Columns.Count - 1 do
  begin
    node := AddChild(Self, AGrid.Columns[i].Title.Caption,
      AGrid.RowHeights[0],
      iif(AGrid.Columns[i].Visible, AGrid.Columns[i].FullWidth, iif(dgColLines in AGrid.Options, -1, 0)));
    node.Column := AGrid.Columns[i];
    if (AGrid.Columns[i].Title.SortMarker <> smNoneEh) then
      node.WIndent := 16;
    if (AGrid.Columns[i].Title.GetFilterButtonAreaWidth > 0) and (AGrid.STFilter.FilterButtonDrawTime = fbdtAlwaysEh) then
      Inc(node.WIndent, AGrid.Columns[i].Title.GetFilterButtonAreaWidth);
    if AGrid.TitleParams.VertLines then
    begin
      node.VLineWidth := 1;
      if not (dgColLines in AGrid.Options) then
        Dec(node.Width);
    end else
    begin
      node.VLineWidth := 0;
      if (dgColLines in AGrid.Options) then
        Inc(node.Width);
    end;
    AGrid.FLeafFieldArr[i].FLeaf := node;
  end;

  nodeTo := nil;
  // Group
  while True do
  begin
    GroupDid := false;
    for i := 0 to AGrid.Columns.Count - 1 do
    begin
      ss1 := ExtractWordPos(2, AGrid.FLeafFieldArr[i].FLeaf.Text, ['|'], apos);
     //napos := Pos('|',AGrid.FLeafFieldArr[i].FLeaf.Text);
      if {napos <> 0}  ss1 <> '' then
      begin
       //nInc(apos);
        ss1 := ExtractWord(1, AGrid.FLeafFieldArr[i].FLeaf.Text, ['|']);
        nodeFrom := AGrid.FLeafFieldArr[i].FLeaf;
        sameWord := True;
        depth := GetDepth(nodeFrom);
        for j := i to AGrid.Columns.Count - 1 do
        begin
          if (AGrid.Columns.Count - 1 > j) and
            (ExtractWord(1, AGrid.FLeafFieldArr[j + 1].FLeaf.Text, ['|']) = ss1) and
            (depth = GetDepth(AGrid.FLeafFieldArr[j + 1].FLeaf)) then
          begin
            ss := AGrid.FLeafFieldArr[j].FLeaf.Text;
            Delete(ss, 1, apos - 1);
            AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
            sameWord := true;
            GroupDid := true;
          end else
          begin
            if (sameWord = true) then
            begin
              ss := AGrid.FLeafFieldArr[j].FLeaf.Text;
              Delete(ss, 1, apos - 1);
              AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
              nodeTo := AGrid.FLeafFieldArr[j].FLeaf;
              GroupDid := true;
            end;
            Break;
          end;
        end;
        if (sameWord = true) and (nodeFrom.GetLevel = nodeTo.GetLevel) then
        begin
          Union(nodeFrom, nodeTo, ss1, 20);
          Break;
        end;
      end;
    end; //i
    if (GroupDid = false) then break;
  end; //k
end;

procedure THeadTreeNode.DoForAllNode(proc: THeadTreeProc);
var
  htLast: THeadTreeNode;
begin
  if (Child = nil) then Exit;
  htLast := Child;
  while True do
  begin
    proc(htLast);
    if (htLast.Child <> nil)
      then htLast.DoForAllNode(proc);
    if (Child = htLast.Next)
      then begin break; end;
    htLast := htLast.Next;
  end;
end;

function THeadTreeNode.GetDepth(ANode: THeadTreeNode): Integer;
begin
  Result := 0;
  while ANode.Host <> nil do
  begin
    Inc(Result);
    ANode := ANode.Host;
  end;
end;

function WordPosition(const N: Integer; const S: string; WordDelims: TCharSet): Integer;
var
  Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do
  begin
    { skip over delimiters }
    while (I <= Length(S)) and (
{$IFNDEF CIL}
      (ByteType(S, I) = mbSingleByte) and
{$ENDIF}
      CharInSetEh(S[I], WordDelims)) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not (
{$IFNDEF CIL}
        (ByteType(S, I) = mbSingleByte) and
{$ENDIF}
        CharInSetEh(S[I], WordDelims)) do Inc(I)
    else Result := I;
  end;
end;

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string;
var
  I: Word;
  Len: Integer;
begin
  Result := '';
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not (
{$IFNDEF CIL}
      (ByteType(S, I) = mbSingleByte) and
{$ENDIF}
      CharInSetEh(S[I], WordDelims)) do
    begin
      { add the I'th character to result }
      Inc(Len);
      Result := Result + S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

function ExtractWordPos(N: Integer; const S: string; WordDelims: TCharSet; var Pos: Integer): string;
var
  I, Len: Integer;
begin
  Len := 0;
  I := WordPosition(N, S, WordDelims);
  Pos := I;
  Result := '';
  if I <> 0 then
    { find the end of the current word }
    while (I <= Length(S)) and not (
{$IFNDEF CIL}
    (ByteType(S, I) = mbSingleByte) and
{$ENDIF}
    CharInSetEh(S[I], WordDelims)) do
    begin
      { add the I'th character to result }
      Inc(Len);
      Result := Result + S[I];
      Inc(I);
    end;
  SetLength(Result, Len);
end;

procedure TCustomDBGridEh.GetCellParams(Column: TAxisBarEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, TColumnEh(Column), AFont, Background, State);
end;

procedure TCustomDBGridEh.InvalidateFooter;
var i: Integer;
begin
  for i := 0 to FullFooterRowCount - 1 do begin
    GridInvalidateRow(Self, FullRowCount - i - 1);
  end;
end;

procedure TCustomDBGridEh.InvalidateTitle;
var
  i: Integer;
begin
  for i := 0 to TopDataOffset - 1 do GridInvalidateRow(Self, i);
end;

procedure TCustomDBGridEh.SetSumList(const Value: TDBGridEhSumList);
begin
  FSumList.Assign(Value);
end;

procedure TCustomDBGridEh.SumListChanged(Sender: TObject);
begin
  if DataLink.Active and not DataLink.DataSet.ControlsDisabled then
    UpdateScrollBar;
  InvalidateFooter;
end;

procedure TCustomDBGridEh.GetFooterParams(DataCol, Row: Integer;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if Assigned(FOnGetFooterParams) then
    FOnGetFooterParams(Self, DataCol, Row, Column, AFont, Background, Alignment, State, Text);
end;

procedure TCustomDBGridEh.DefaultDrawFooterCell(const Rect: TRect; DataCol,
  Row: Integer; Column: TColumnEh; State: TGridDrawState);
var
  Value: string;
  NewBackgrnd: TColor;
  NewAlignment: TAlignment;
  XFrameOffs, YFrameOffs: Integer;
  ARect: TRect;
  MultiLine: Boolean;
begin
  ARect := Rect;
  if (dghFooter3D in OptionsEh) then
  begin
    XFrameOffs := 1;
    InflateRect(ARect, -1, -1);
  end
  else XFrameOffs := 2;
  YFrameOffs := XFrameOffs;
  if Flat then Dec(YFrameOffs);
  Value := GetFooterValue(Row, Column);
  NewBackgrnd := Canvas.Brush.Color;
  NewAlignment := Column.Footer.Alignment;

  GetFooterParams(DataCol, Row, Column, Font,
    NewBackgrnd, NewAlignment, State, Value);

  Canvas.Brush.Color := NewBackgrnd;

  MultiLine := Column.Footer.WordWrap and FAllowWordWrap;
   WriteCellText(Column, Canvas, ARect, True, XFrameOffs, YFrameOffs, Value,
    Column.Footer.Alignment, Column.Layout, MultiLine,
    Column.Footer.EndEllipsis, 0, 0, not MultiLine);
end;

function TCustomDBGridEh.GetFooterValue(Row: Integer; Column: TColumnEh): String;
const
  SumListArray: array[TFooterValueType] of TGroupOperation =
  (goSum, goSum, goAvg, goCount, goSum, goSum);
var
  FmtStr: string;
  Format: TFloatFormat;
  Digits: Integer;
  v: Variant;
  Field: TField;
  Footer: TColumnFooterEh;
begin
  Result := '';
  Field := nil;
  Footer := Column.UsedFooter(Row);
  case Footer.ValueType of
    //fgoNon: FillRect(ARect);
    fvtSum, fvtAvg:
      begin
        Result := '0';
        if Assigned(DataSource) and Assigned(DataSource.DataSet)
          then if Footer.FieldName <> ''
          then Field := DataSource.DataSet.FindField(Footer.FieldName)
          else Field := DataSource.DataSet.FindField(Column.FieldName);
        if Field = nil then Exit;
        with Field do
        begin
          v := SumList.SumCollection.GetSumByOpAndFName(SumListArray[Footer.ValueType], FieldName).SumValue;
          case DataType of
            ftSmallint, ftInteger, ftAutoInc, ftWord, ftLargeInt:
              if Footer.DisplayFormat <> '' then
                Result := FormatFloat(Footer.DisplayFormat, v)
              else with Field as TNumericField do
              begin
                FmtStr := DisplayFormat;
                if FmtStr = ''
                  then Result := IntToStr(Trunc(Double(v)))
                  else Result := FormatFloat(FmtStr, v);
              end;
            ftBCD:
              if Footer.DisplayFormat <> '' then
                Result := FormatFloat(Footer.DisplayFormat, v)
              else
              with Field as TBCDField do
              begin
              //if EditFormat = '' then FmtStr := DisplayFormat else FmtStr := EditFormat;
                FmtStr := DisplayFormat;
                if FmtStr = '' then
                begin
                  if Currency then
                  begin
                    Format := ffCurrency;
                    Digits := FormatSettings.CurrencyDecimals;
                  end
                  else begin
                    Format := ffGeneral;
                    Digits := 0;
                  end;
                  Result := CurrToStrF(v, Format, Digits);
                end else
                  Result := FormatCurr(FmtStr, v);
              end;
{$IFDEF EH_LIB_6}
            ftFMTBcd:
              if Footer.DisplayFormat <> '' then
                Result := FormatFloat(Footer.DisplayFormat, v)
              else
              with Field as TFMTBCDField do
              begin
              //if EditFormat = '' then FmtStr := DisplayFormat else FmtStr := EditFormat;
                FmtStr := DisplayFormat;
                if FmtStr = '' then
                begin
                  if Currency then
                  begin
                    Format := ffCurrency;
                    Digits := FormatSettings.CurrencyDecimals;
                  end
                  else begin
                    Format := ffGeneral;
                    Digits := 0;
                  end;
                  Result := CurrToStrF(v, Format, Digits);
                end else
                  Result := FormatCurr(FmtStr, v);
              end;
{$ENDIF}
            ftFloat, ftCurrency:
              if Footer.DisplayFormat <> '' then
                Result := FormatFloat(Footer.DisplayFormat, v)
              else
              with Field as TFloatField do
              begin
              //if EditFormat = '' then FmtStr := DisplayFormat else FmtStr := EditFormat;
                FmtStr := DisplayFormat;
                if FmtStr = '' then
                begin
                  if Currency then
                  begin
                    Format := ffCurrency;
                    Digits := FormatSettings.CurrencyDecimals;
                  end
                  else begin
                    Format := ffGeneral;
                    Digits := 0;
                  end;
                  Result := FloatToStrF(v, Format, Precision, Digits);
                end else
                  Result := FormatFloat(FmtStr, v);
              end;
{ SumList does not support TDateTime as SumValue is Currency }
{              ftDate, ftTime, ftDateTime:
              begin
                if Footer.DisplayFormat <> '' then
                  FmtStr := Footer.DisplayFormat
                else
                  case DataType of
                    ftDate: FmtStr := ShortDateFormat;
                    ftTime: FmtStr := LongTimeFormat;
                  end;
                DateTimeToString(Result, FmtStr, TDateTime(v));
              end;}
          end;
        end;
        {Result := FloatToStr(SumList.SumCollection.GetSumByOpAndFName(goSum,Column.FieldName).SumValue);}
      end;
    fvtCount:
      if Footer.DisplayFormat <> '' then
        Result := FormatFloat(Footer.DisplayFormat, SumList.SumCollection.GetSumByOpAndFName(goCount, '').SumValue)
      else
        Result := FloatToStr(SumList.SumCollection.GetSumByOpAndFName(goCount, '').SumValue);
    fvtFieldValue:
      if Assigned(DataSource) and Assigned(DataSource.DataSet) and
        DataSource.DataSet.Active and (Footer.FieldName <> '')
      then
        Result := FormatFieldDisplayValue(DataSource.DataSet.FieldByName(Footer.FieldName), Footer.DisplayFormat);
    fvtStaticText: Result := Footer.Value;
  end;
end;

function TCustomDBGridEh.GetFullFooterRowCount: Integer;
begin
  Result := FooterRowCount + DataGrouping.Footers.VisibleItemsCount;
end;

procedure TCustomDBGridEh.SumListRecalcAll(Sender: TObject);
begin
  if Assigned(FOnSumListRecalcAll) then
    FOnSumListRecalcAll(SumList);
end;

procedure TCustomDBGridEh.SumListAfterRecalcAll(Sender: TObject);
begin
  if Assigned(FOnSumListAfterRecalcAll) then
    FOnSumListAfterRecalcAll(SumList);
end;
procedure TCustomDBGridEh.SetHorzScrollBar(const Value: THorzDBGridEhScrollBar);
begin
  FHorzScrollBar.Assign(Value);
end;

procedure TCustomDBGridEh.SetVertScrollBar(const Value: TVertDBGridEhScrollBar);
begin
  FVertScrollBar.Assign(Value);
end;

function TCustomDBGridEh.VisibleDataRowCount: Integer;
begin
  Result := VisibleRowCount;
  if FullFooterRowCount <= 0 then Exit;
//  Result := Result - FooterRowCount - 1;
//  if Result < 1 then Result := 1;
end;

function TCustomDBGridEh.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.ExecuteAction(Action);
  if not Result and Focused then
  begin
    if (Action is TEditCopy) and (geaCopyEh in EditActions) and
      CheckCopyAction then
    begin
      DBGridEh_DoCopyAction(Self, False);
      Result := True;
    end
    else if (Action is TEditPaste) and (geaPasteEh in EditActions) and
      CheckPasteAction then
    begin
      DBGridEh_DoPasteAction(Self, False);
      Result := True;
    end
    else if (Action is TEditCut) and (geaCutEh in EditActions) and
      CheckCutAction then
    begin
      DBGridEh_DoCutAction(Self, False);
      Result := True;
    end
{$IFDEF EH_LIB_5}
    else if (Action is TEditSelectAll) and (geaSelectAllEh in EditActions) and
      CheckSelectAllAction then
    begin
      Selection.SelectAll;
      Result := True;
    end
    else if (Action is TEditDelete) and (geaDeleteEh in EditActions) and
      CheckDeleteAction then
    begin
      DBGridEh_DoDeleteAction(Self, False);
      Result := True;
    end;
{$ENDIF}
  end;
end;

function TCustomDBGridEh.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := (DataLink <> nil) and DataLink.UpdateAction(Action);
  if not Result and Focused then
  begin
    if (Action is TEditCopy) and (geaCopyEh in EditActions) then
    begin
      TEditCopy(Action).Enabled := CheckCopyAction;
      Result := True;
    end
    else if (Action is TEditPaste) and (geaPasteEh in EditActions) then
    begin
      TEditPaste(Action).Enabled := CheckPasteAction;
      Result := True;
    end
    else if (Action is TEditCut) and (geaCutEh in EditActions) then
    begin
      TEditCut(Action).Enabled := CheckCutAction;
      Result := True;
    end
{$IFDEF EH_LIB_5}
    else if (Action is TEditSelectAll) and (geaSelectAllEh in EditActions) then
    begin
      TEditSelectAll(Action).Enabled := CheckSelectAllAction;
      Result := True;
    end
    else if (Action is TEditDelete) and (geaDeleteEh in EditActions) then
    begin
      TEditDelete(Action).Enabled := CheckDeleteAction;
      Result := True;
    end;
{$ENDIF}
  end;
end;

function TCustomDBGridEh.CheckCopyAction: Boolean;
begin
  Result := DataLink.Active {and (Selection.SelectionType <> gstNon)};
end;

function TCustomDBGridEh.CheckPasteAction: Boolean;
begin
  Result := DataLink.Active and not ReadOnly and
    DataLink.DataSet.CanModify and (
    Clipboard.HasFormat(CF_VCLDBIF) or
    Clipboard.HasFormat(CF_TEXT));
  if Result then
    if (DataLink.DataSet.State <> dsInsert) and
      not (alopUpdateEh in AllowedOperations) then
      Result := False;
end;

function TCustomDBGridEh.CheckCutAction: Boolean;
begin
  Result := CheckCopyAction and CheckDeleteAction;
end;

function TCustomDBGridEh.CheckSelectAllAction: Boolean;
begin
  Result := DataLink.Active and not DataLink.DataSet.IsEmpty and (gstAll in AllowedSelections);
end;

function TCustomDBGridEh.CheckDeleteAction: Boolean;
begin
  Result := DataLink.Active and not ReadOnly and not DataLink.DataSet.IsEmpty and
    DataLink.DataSet.CanModify and
    (
    ((Selection.SelectionType in [gstRecordBookmarks, gstAll]) and
    (alopDeleteEh in AllowedOperations))
    or
    ((Selection.SelectionType in [gstRectangle, gstColumns]) and
    (alopUpdateEh in AllowedOperations))
    );
end;

procedure TCustomDBGridEh.TimerScroll;
var
  Delta, Distance, Interval, DeltaX, DistanceX: Integer;
  ADataRect: Trect;
  WithSeleting: Boolean;
  Point: TPoint;
begin
  if FDBGridEhState = dgsColSelecting then
  begin
    GetCursorPos(Point);
    Point := ScreenToClient(Point);
    ADataRect := DataRect;
    if Point.X > ADataRect.Right then
    begin
      if LeftCol + VisibleColCount < ColCount then
      begin
        LeftCol := LeftCol + 1;
        if LeftCol + VisibleColCount + FixedCols < ColCount
          then Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol + VisibleColCount + FixedCols)] {,True})
          else Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol + VisibleColCount - 1)] {,True});
      end
      else
        Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol + VisibleColCount - 1)] {,True});
      Interval := 200 - (Point.X - ADataRect.Right) * 10;
      if Interval < 0 then Interval := 0;
      ResetTimer(Interval);
    end
    else if Point.X < ADataRect.Left then
    begin
      if LeftCol > FixedCols then
      begin
        LeftCol := LeftCol - 1;
        if LeftCol > FixedCols
          then Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol - 1)] {,True})
          else Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol)] {,True});
      end
      else
        Selection.Columns.SelectShift(Columns[RawToDataColumn(LeftCol)] {,True});

      Interval := 200 - (ADataRect.Left - Point.X) * 10;
      if Interval < 0 then Interval := 0;
      ResetTimer(Interval);
    end
  end else
  begin
    Delta := 0;
    Distance := 0;
    ADataRect := DataRect;
    if FDownMousePos.Y < ADataRect.Top then
    begin
      Delta := -1;
      Distance := ADataRect.Top - FDownMousePos.Y;
    end;
    if FDownMousePos.Y >= ADataRect.Bottom then
    begin
      Delta := 1;
      Distance := FDownMousePos.Y - ADataRect.Bottom + 1;
    end;

    DeltaX := 0;
    DistanceX := 0;
    if not UseRightToLeftAlignment and (FDownMousePos.X < ADataRect.Left) or
           UseRightToLeftAlignment and (FDownMousePos.X >= ADataRect.Right) then
    begin
      DeltaX := -1;
      DistanceX := ADataRect.Left - FDownMousePos.X;
    end;
    if not UseRightToLeftAlignment and (FDownMousePos.X >= ADataRect.Right) or
           UseRightToLeftAlignment and (FDownMousePos.X < ADataRect.Left) then
    begin
      DeltaX := 1;
      DistanceX := FDownMousePos.X - ADataRect.Right;
    end;
    Distance := Max(Distance, DistanceX);
    WithSeleting := ssLeft in FMouseShift;

    if (Delta = 0) and (DeltaX = 0)
      then StopTimer
    else
    begin
      BeginUpdate;
      try
        if (Delta <> 0) and not (FDBGridEhState = dgsRectSelecting) then
        begin
           {if (dgMultiSelect in Options) then}
          DoSelection(WithSeleting, iif(Distance div 6 > 8, 8, Distance div 6) * Delta, False, True);
        end;
        if (DeltaX <> 0) and FDataTracking then
          if (DeltaX < 0) and (LeftCol > FixedCols) then
            LeftCol := LeftCol + DeltaX
          else if (DeltaX > 0) and (VisibleColCount + LeftCol < ColCount) then
            LeftCol := LeftCol + DeltaX;
        if FDBGridEhState <> dgsRowSelecting then
          if DeltaX > 0
            then MoveCol(RawToDataColumn(Col + DeltaX), 1, False)
            else MoveCol(RawToDataColumn(Col + DeltaX), -1, False);
        if (FDBGridEhState = dgsRectSelecting) then
        begin
          MoveBy(iif(Distance div 6 > 8, 8, Distance div 6) * Delta);
          if (DeltaX < 0) and (LeftCol = FixedCols)
            then Selection.Rect.Select(RawToDataColumn(IndicatorOffset), DataSource.DataSet.Bookmark, True)
            else Selection.Rect.Select(RawToDataColumn(Col), DataSource.DataSet.Bookmark, True)
        end;
      finally
        EndUpdate;
      end;
      if UpdateLock = 0 then Update;
      Interval := 200 - Distance * 15;
      if Interval < 0 then Interval := 0;
      ResetTimer(Interval);
    end;
  end;
end;

function TCustomDBGridEh.DataRect: TRect;
begin
  Result := BoxRect(IndicatorOffset, TopDataOffset, FullColCount - 1, RowCount-1);
end;

function TCustomDBGridEh.DataBox: TGridRect;
begin
  Result.Left := IndicatorOffset;
  Result.Top := TopDataOffset;
  Result.Right := FullColCount - 1;
  Result.Bottom := RowCount-1;
end;

procedure TCustomDBGridEh.DoSortMarkingChanged;
begin
  if (dghAutoSortMarking in OptionsEh) then
    if Assigned(FOnSortMarkingChanged)
      then FOnSortMarkingChanged(Self)
      else DefaultApplySorting;
end;

procedure TCustomDBGridEh.SetSortMarkedColumns;
var i: Integer;
begin
  SortMarkedColumns.Clear;
  for i := 0 to Columns.Count - 1 do
    if Columns[i].Title.SortIndex > 0 then
    begin
      if SortMarkedColumns.Count < Columns[i].Title.SortIndex then
        SortMarkedColumns.Count := Columns[i].Title.SortIndex;
      SortMarkedColumns[Columns[i].Title.SortIndex - 1] := Columns[i];
    end;
end;

procedure TCustomDBGridEh.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if FSortMarking and (Key = 17) then
  begin
    FSortMarking := False;
    DoSortMarkingChanged;
  end;
  inherited KeyUp(Key, Shift);
end;

procedure TCustomDBGridEh.TopLeftChanged;

  procedure InvalidateTitle;
  var i: Integer;
  begin
    for i := 0 to TopDataOffset - 1 do GridInvalidateRow(Self, i);
  end;

  function LastVisibleCellFor(ForTop: Integer): Integer;
  var
    DrawInfo: TGridDrawInfoEh;
    i: Integer;
    RowsHeight, DataHeight: Integer;
  begin
    CalcDrawInfo(DrawInfo);
    DataHeight := DrawInfo.Vert.GridExtent - DrawInfo.Vert.FixedBoundary;
    RowsHeight := 0;
    Result := 0;
    for i := ForTop to DrawInfo.Vert.GridCellCount - 1 do
    begin
      Inc(RowsHeight, DrawInfo.Vert.GetExtent(I) +
                        DrawInfo.Vert.EffectiveLineWidth);
      if RowsHeight > DataHeight then
      begin
        Result := i;
        Break;
      end;
    end;
  end;
var
  RowToInvalidate: Integer;
begin
  if FTopLeftVisible then
  begin
    if (LeftCol <> FixedCols) then
    begin
      InvalidateTitle;
      FTopLeftVisible := False;
    end;
  end
  else
    if (LeftCol = FixedCols) then
    begin
      InvalidateTitle;
      FTopLeftVisible := True;
    end;
  inherited TopLeftChanged;
  UpdateHorzExtScrollBar;
  if ViewScroll then
  begin
    FetchRecordsInView;
    UpdateScrollBar;
  end;
  UpdateFilterEdit(False);
  if (FIntMemTable <> nil) and FIntMemTable.MemTableIsTreeList and
    (TopRow > FOldTopLeft.Y) then
  begin
    RowToInvalidate := LastVisibleCellFor(FOldTopLeft.Y);
    GridInvalidateRow(Self, RowToInvalidate);
  end;

  if Assigned(FOnTopLeftChanged) then FOnTopLeftChanged(Self);
  if RowDetailPanel.Visible then
    UpdateRowDetailPanel;
  FOldTopLeft.X := LeftCol;
  FOldTopLeft.Y := TopRow;
end;

{CM messages processing}

procedure TCustomDBGridEh.CMMouseWheel(var Message: TCMMouseWheel);
var
{$IFDEF CIL}
  Temp: TMessage;
{$ENDIF}
  WheelControl: TControl;
begin
{$IFDEF CIL}
  // { TODO : TWinControlCracker().DoMouseWheel }
{$ELSE}
  if InplaceEditorVisible and TDBGridInplaceEdit(InplaceEditor).FListVisible then
    with Message do
      if TWinControlCracker(TDBGridInplaceEdit(InplaceEditor).ActiveList).
        DoMouseWheel(ShiftState, WheelDelta, SmallPointToPoint(Pos)) then
      begin
        Result := 1;
        Exit;
      end;
{$ENDIF}

  if FilterEditMode then
    WheelControl := FilterEdit
  else if FInTitleFilterListboxVisible then
    WheelControl := FInTitleFilterListbox
  else
    WheelControl := nil;

{$IFDEF CIL}
  Temp := UnwrapMessage(Message);
  if WheelControl <> nil
    then WheelControl.WindowProc(Temp)
{$ELSE}
  if WheelControl <> nil
    then WheelControl.WindowProc(TMessage(Message))
{$ENDIF}
  else
    inherited;
end;

procedure TCustomDBGridEh.CMMouseLeave(var Message: TMessage);
var
  AHotTrackCell: TGridCoord;
begin
  inherited;
  if dghHotTrack in OptionsEh then
    if FHotTrackCell.Y > 0 then
    begin
      AHotTrackCell := FHotTrackCell;
      FHotTrackCell.Y := -1;
      FHotTrackCell.X := -1;
      GridInvalidateRow(Self, AHotTrackCell.Y);
    end;
end;

procedure TCustomDBGridEh.CMHintsShowPause(var Message: TCMHintShowPause);
var
  Cell: TGridCoord;
  Column: TColumnEh;
  ACellRect: TRect;
  PauseLoc: Integer;
  Processed: Boolean;
  InCellCursorPos: TPoint;
begin
  with Message do
  begin
    Cell := MouseCoord(HitTest.X, HitTest.Y);
    if (Cell.X < IndicatorOffset) or (Cell.Y < 0) then Exit;
    Column := Columns[RawToDataColumn(Cell.X)];
    ACellRect := CellRect(Cell.X, Cell.Y);
    InCellCursorPos :=
      Point(HitTest.X-ACellRect.TopLeft.X, HitTest.Y-ACellRect.TopLeft.Y);
    Processed := False;
    PauseLoc := Application.HintPause;
    if Assigned(FOnHintShowPause) then
      OnHintShowPause(Self, HitTest, Cell, InCellCursorPos, Column, PauseLoc, Processed);
    if not Processed and Assigned(Column) and Assigned(Column.FOnHintShowPause) then
      Column.OnHintShowPause(Self, HitTest, Cell, InCellCursorPos, Column, PauseLoc, Processed);
    if not Processed  then
      if ((Cell.Y > RowCount - 1) and (FullFooterRowCount > 0) and Column.UsedFooter(Cell.Y - RowCount).ToolTips ) or
        ((Cell.Y >= TopDataOffset) and (Cell.Y < DataRowCount + TopDataOffset) and DataLink.Active and Column.ToolTips) or
        ((Cell.Y = GetTitleRows - 1) and Column.Title.ToolTips and (Column.Title.Hint = ''))
        then PauseLoc := 0
        else PauseLoc := Application.HintPause;

{$IFDEF CIL}
    Pause := PauseLoc;
{$ELSE}
    Pause^ := PauseLoc;
{$ENDIF}
  end;
end;

procedure TCustomDBGridEh.CMHintShow(var Message: TCMHintShow);
var
  Cell: TGridCoord;
  Column: TColumnEh;
  TextWidth, DataRight, RightIndent, EmptyVar: Integer;
  s: String;
  ARect: TRect;
  WordWrap: Boolean;
  TextWider: Boolean;
  AAlignment: TAlignment;
  TopIndent: Integer;
  IsDataToolTips: Boolean;
  Footer: TColumnFooterEh;
{$IFDEF CIL}
  AHintInfo: THintInfo;
{$ENDIF}
  Params: TDBGridEhDataHintParams;
  Processed: Boolean;
  InCellCursorPos: TPoint;
  DataRect: TRect;
  FBackground: TColor;
  IsTitleTypeCell: Boolean;
  NewHeight: Integer;
  FilterButtonWidth: Integer;
  XFrameOffs: Integer;

  function GetToolTipsColumnText(Column: TColumnEh): String;
  var KeyIndex: Integer;
  begin
    Result := '';
    if Column.GetColumnType in [ctKeyImageList, ctCheckboxes] then
    begin
      if Column.GetColumnType = ctKeyImageList
        then KeyIndex := Column.KeyList.IndexOf(Column.Field.Text)
      else KeyIndex := Integer(Column.CheckboxState);
      if (KeyIndex > -1) and (KeyIndex < Column.PickList.Count)
        then Result := Column.PickList.Strings[KeyIndex];
    end
    else if Column.Field <> nil
      then Result := Column.DisplayText;
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
    if (Cell.X < IndicatorOffset) or (Cell.Y < 0) then Exit;
    Column := Columns[RawToDataColumn(Cell.X)];

    if (Cell.Y = GetTitleRows - 1) and (Column.Title.Hint <> '') then
    begin // Title hint

{$IFDEF CIL}
      AHintInfo.HintStr := GetShortHint(Columns[RawToDataColumn(Cell.X)].Title.Hint);
      AHintInfo.CursorRect := CellRect(Cell.X, Cell.Y);
      Message.HintInfo := AHintInfo;
{$ELSE}
      Message.HintInfo^.HintStr := GetShortHint(Columns[RawToDataColumn(Cell.X)].Title.Hint);
      Message.HintInfo^.CursorRect := CellRect(Cell.X, Cell.Y);
{$ENDIF}
    end
    else if (Mouse.Capture = 0) and (GetKeyState(VK_CONTROL) >= 0) then
    begin
      ARect := CellRect(Cell.X, Cell.Y);
      if RowPanel.Active then
      begin
        if Cell.Y = GetTitleRows - 1
          then IsTitleTypeCell := True
          else IsTitleTypeCell := False;
        Column := GetColumnInRowPanelAtPos(
          Point(HitTest.X-ARect.Left+FDataOffset.cx,
                HitTest.Y-ARect.Top), IsTitleTypeCell);
        if Column = nil then Exit;
        if IsTitleTypeCell then
          DataRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
            Column.FRowPlacement.Left+Column.FRowPlacement.Width,
            Column.FRowPlacement.Top+Column.FRowPlacement.Height)
        else
          DataRect := Rect(Column.FRowPlacement.DataCellLeft, Column.FRowPlacement.Top,
            Column.FRowPlacement.DataCellLeft+Column.FRowPlacement.DataCellWidth,
            Column.FRowPlacement.Top+Column.FRowPlacement.Height);
        OffsetRect(DataRect, ARect.Left, ARect.Top);
        OffsetRect(DataRect, -FDataOffset.cx, 0);
        ARect := DataRect;
      end;
      InCellCursorPos := Point(HitTest.X-ARect.TopLeft.X, HitTest.Y-ARect.TopLeft.Y);
      WordWrap := False;
      AAlignment := taLeftJustify;
      if FHintFont = nil then
        FHintFont := TFont.Create;
      if Column.UseRightToLeftAlignment then
      begin
        OffsetRect(ARect, ClientWidth - ARect.Right - ARect.Left, 0);
      end;
      DataRight := ARect.Left + Column.Width;
      if (Cell.Y = GetTitleRows - 1) and Column.Title.ToolTips then
      begin  // Title tooltips
        if Column.Title.Alignment = taCenter then
          XFrameOffs := 0
        else if  (dghFixed3D in OptionsEh) and not (TitleParams.GetActualFillStyle = cfstThemedEh) then
          XFrameOffs := 2
        else
          XFrameOffs := 3;

        Dec(ARect.Right, XFrameOffs);
        Dec(DataRight, XFrameOffs);

        if Column.Title.GetSortMarkingWidth > 2 then
        begin
          Dec(ARect.Right, Column.Title.GetSortMarkingWidth - 2);
          Dec(DataRight, Column.Title.GetSortMarkingWidth - 2);
        end;
        if STFilter.Visible and
           Column.STFilter.Visible and
           (STFilter.Location = stflInTitleFilterEh) then
        begin
          if Flat then
          begin
            FilterButtonWidth := FlatButtonWidth;
            if not ThemesEnabled then
              Inc(FilterButtonWidth);
          end else
            FilterButtonWidth := GetSystemMetrics(SM_CXVSCROLL);

          if (ARect.Right - ARect.Left) div 2 < FilterButtonWidth then
            FilterButtonWidth := (ARect.Right - ARect.Left) div 2;

          Dec(ARect.Right, FilterButtonWidth);
          Dec(DataRight, FilterButtonWidth);
        end;
        
        if HitTest.X > ARect.Right then
          s := ''
        else if IsUseMultiTitle = True then
        begin
          s := FLeafFieldArr[RawToDataColumn(Cell.X)].FLeaf.Text;
          ARect.Top := ARect.Bottom - FLeafFieldArr[Cell.X - IndicatorOffset].FLeaf.Height + 1;
          if HitTest.Y < ARect.Top then Exit;
        end
        else
          s := Column.Title.Caption;
        WordWrap := (IsUseMultiTitle = True) or (TitleHeight <> 0) or (TitleLines <> 0);
        AAlignment := Column.Title.Alignment;
        FHintFont.Assign(Column.Title.Font);
        Canvas.Font.Assign(FHintFont);
        if Column.Title.Orientation = tohVertical then
        begin
          WordWrap := False;
          OverturnUpRect(ARect);
        end;
      end else if (Cell.Y >= TopDataOffset) and
        (Cell.Y < DataRowCount + TopDataOffset) and
        DataLink.Active then
      begin // Data tooltips

        IsDataToolTips := True;
        if RowDetailPanel.Visible and (Row = Cell.Y) then
        begin
          NewHeight := CalcRowDataRowHeight(Cell.Y-TopDataOffset);
          if ARect.Bottom - ARect.Top > NewHeight then
            ARect.Bottom := ARect.Top + NewHeight;
        end;

        InstantReadRecordEnter(Cell.Y - TopDataOffset);
        Params := TDBGridEhDataHintParams.Create;
        try

          if DataGrouping.IsGroupingWorks and
             (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
             (InstantReadCurDataNode.NodeType in [dntDataGroupEh, dntDataGroupFooterEh])
          then
            Exit;

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
            OnDataHintShow(Self, HitTest, Cell, InCellCursorPos, Column, Params, Processed);
          if not Processed and Assigned(Column) and Assigned(Column.FOnDataHintShow) then
            Column.OnDataHintShow(Self, HitTest, Cell, InCellCursorPos, Column, Params, Processed);

          if not Processed and Column.ToolTips then
            DefaultFillDataHintShowInfo(HitTest, Cell, Column, Params);

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
      end
      else if (FullFooterRowCount > 0) and
              (Cell.Y > RowCount - 1) then
      begin
        Footer := Column.UsedFooter(Cell.Y - RowCount);
        if not Footer.ToolTips then Exit;
        FHintFont.Assign(Footer.Font);
        Canvas.Font.Assign(FHintFont);
        WordWrap := Footer.WordWrap;
        AAlignment := Footer.Alignment;
        S := GetFooterValue(Cell.Y - RowCount, Column);
        FBackground := Footer.Color;
        GetFooterParams(RawToDataColumn(Cell.X), Cell.Y - RowCount, Column,
          Canvas.Font, FBackground, AAlignment, [], S);
      end else
        Exit;

      //if UseRightToLeftAlignment then
      //  ChangeBiDiModeAlignment(AAlignment);
      if not Processed then
      begin

        if WordWrap then RightIndent := 2 else RightIndent := 0;
        if IsDataToolTips and (Column.GetColumnType in [ctKeyImageList, ctCheckboxes])
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
            if Column.UseRightToLeftAlignment then
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

procedure TCustomDBGridEh.CMFontChanged(var Message: TMessage);
begin
  inherited;
  BeginLayout;
  try
    DataGrouping.RefreshDefaultFont;
    EmptyDataInfo.RefreshDefaultFont;
    TitleParams.RefreshDefaultFont;
    FooterParams.RefreshDefaultFont;
    STFilter.RefreshDefaultFont;
  finally
    EndLayout;
  end;
end;

procedure TCustomDBGridEh.CMDesignHitTest(var Msg: TCMDesignHitTest);
var
  OutBRect: TRect;
begin
  inherited;
  if Msg.Result = 0 then
    Msg.Result := Longint(BOOL(FrozenSizing(Msg.Pos.X, Msg.Pos.Y)));
  if (Msg.Result = 1) and ((DataLink = nil) or
    ((Columns.State = csDefault) and
    (DataLink.DefaultFields or (not DataLink.Active)))) then
    Msg.Result := 0
  else if (Msg.Result = 0) and RowPanel.Active and (Columns.State = csCustomized) {and
    (ssLeft in KeysToShiftState(Msg.Keys))} then
  begin
    Msg.Result := Longint(BOOL(CheckForDesigntTimeColMoving(Msg.Pos.X, Msg.Pos.Y)));
  end;
  if (Msg.Result = 0) and Assigned(DBGridEhDesigntControler)
  then
    Msg.Result := Longint(BOOL(DBGridEhDesigntControler.IsDesignHitTest(Self,
      Msg.Pos.X, Msg.Pos.Y, KeysToShiftState(Msg.Keys))));
  if (Msg.Result = 0) and
      OutBoundaryData.GetOutBoundaryRect(OutBRect, cbtTopEh) and
      PtInRect(OutBRect, Point(Msg.Pos.X, Msg.Pos.Y))
  then
    Msg.Result := Longint(BOOL(True));
end;

procedure TCustomDBGridEh.CMCancelMode(var Message: TCMCancelMode);
{$IFDEF CIL}
var
  Temp: TMessage;
{$ENDIF}

  function CheckDataListChilds: Boolean;
  var i: Integer;
  begin
    Result := False;
    if FInTitleFilterListbox <> nil then
      for i := 0 to FInTitleFilterListbox.ControlCount - 1 do
        if FInTitleFilterListbox.Controls[I] = Message.Sender then
        begin
          Result := True;
          Exit;
        end;
  end;

begin
  inherited;

{$IFDEF CIL}
  Temp := UnwrapMessage(Message);
  if FilterEdit <> nil then
    IControl(FilterEdit).WndProc(Temp);
{$ELSE}
  if FilterEdit <> nil then
    TCustomDBEditEhCracker(FilterEdit).WndProc(TMessage(Message));
{$ENDIF}
  if FInTitleFilterListboxVisible then
    if (Message.Sender = Self) then
    begin
      if not PtInRect(FTrackingStateRect, ScreenToClient(SafeGetMouseCursorPos)) then
        InTitleFilterListboxCloseUp(False);
    end else if (Message.Sender <> Self) and {not ContainsControl(Message.Sender) and}
      (Message.Sender <> FInTitleFilterListbox) and not CheckDataListChilds
    then
      InTitleFilterListboxCloseUp(False);
end;

procedure TCustomDBGridEh.CMChanged(var Msg: TCMChanged);
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

{WM messages processing}

procedure TCustomDBGridEh.WMRButtonDown(var Message: TWMRButtonDown);
var
  Coord: TGridCoord;
begin
  Coord := MouseCoord(Message.XPos, Message.YPos);

  if not (csDesigning in ComponentState) then
  begin
    if STFilter.Visible and (STFilter.Location = stflUnderTitleFilterEh) then
    begin
      if CheckCellFilter(Coord.X, Coord.Y, Point(Message.XPos, Message.YPos))
        and ((not IndicatorColVisible) or (Coord.X > 0))
        and CanFilterCol(RawToDataColumn(Coord.X)) then
      begin
        CheckClearSelection;
        StartEditFilter(RawToDataColumn(Coord.X));
        FDownMouseMessageTime := GetMessageTime;
        FDownMousePos := Point(Message.XPos, Message.YPos);
        Exit;
      end;
    end;
  end;
  inherited;
end;

procedure TCustomDBGridEh.WMLButtonDown(var Message: TWMLButtonDown);
var
  Coord: TGridCoord;
  ARect: TRect;
  Column: TColumnEh;
  ColumnIndex: Integer;
  MouseTarget: TControl;
  InFilterEditPos: TPoint;
begin
  Coord := MouseCoord(Message.XPos, Message.YPos);

  if not (csDesigning in ComponentState) then
  begin
    if STFilter.Visible and (STFilter.Location = stflUnderTitleFilterEh) then
    begin
      if CheckCellFilter(Coord.X, Coord.Y, Point(Message.XPos, Message.YPos))
        and ((not IndicatorColVisible) or (Coord.X > 0))
      then
      begin
        if RowPanel.Active then
        begin
          ARect := CellRect(Coord.X, Coord.Y);
          Column := GetColumnInRowPanelAtPos(Point(Message.XPos-ARect.Left+FDataOffset.cx,
            Message.YPos-ARect.Top), False);
          ColumnIndex := Column.Index;
        end else
          ColumnIndex := RawToDataColumn(Coord.X);

        if CanFilterCol(ColumnIndex) then
        begin
          CheckClearSelection;
          StartEditFilter(ColumnIndex);
          if FilterEdit.Visible then
          begin
            InFilterEditPos := FilterEdit.ScreenToClient(ClientToScreen(SmallPointToPoint(Message.Pos)));
            MouseTarget := FilterEdit.ControlAtPos(InFilterEditPos, False, True);
            if MouseTarget = nil then
              MouseTarget := FilterEdit;
            MouseTarget.Perform(WM_LBUTTONDOWN, Message.Keys,
              SmallPointToInteger(PointToSmallPoint(MouseTarget.ScreenToClient(ClientToScreen(SmallPointToPoint(Message.Pos))))));
          end;
          FDownMouseMessageTime := GetMessageTime;
          FDownMousePos := Point(Message.XPos, Message.YPos);
          Exit;
        end;
      end;
    end;
  end;
  inherited;
end;

procedure TCustomDBGridEh.WMTimer(var Message: TWMTimer);
var
  DrawInfo: TGridDrawInfoEh;
  Point: TPoint;
  CellHit: TGridCoord;
begin
{$IFDEF CIL}
  case Integer(Message.TimerID) of
{$ELSE}
  case Message.TimerID of
{$ENDIF}
    1: if FIndicatorPressed or FDataTracking or
      (FDBGridEhState = dgsColSelecting)
        then TimerScroll
       else if FDBGridEhState = dgsRowMoving then
       begin
         GetCursorPos(Point);
         Point := ScreenToClient(Point);
         CalcDrawInfo(DrawInfo);
         CellHit := MouseCoord(Point.X, Point.Y);
         MoveDataRowAndScroll(Point.Y, CellHit.Y, DrawInfo, DrawInfo.Vert, SB_VERT, Point);
       end
       else if (FGridState = gsColMoving) and RowPanel.Active then
       begin
         GetCursorPos(Point);
         Point := ScreenToClient(Point);
         GoRowPanelTitleCellDrag(GetShiftState, Point.X, Point.Y);
       end else
        inherited;
    2: StopInplaceSearch;
    else
     inherited;
  end;
end;

procedure TCustomDBGridEh.WMSize(var Message: TWMSize);
begin
  BeginScrollRangeUpdating;
  try
    inherited;
  finally
    EndScrollRangeUpdating;
  end;

  if UpdateLock = 0 then
    if ((FAutoFitColWidths = True) {or (FooterRowCount > 0)}) and
      not (csDesigning in ComponentState) then
    begin
      LayoutChanged;
      InvalidateEditor;
    end else
    begin
      UpdateScrollRange;
      UpdateRowCount;
      UpdateScrollBar;
      UpdateFilterEdit(False);
    end
  else
    FSizeChanged := True;
  UpdateHorzExtScrollBar;
  UpdateScrollBarPanels;
  UpdateSearchPanel;
  if RowDetailPanel.Visible then UpdateRowDetailPanel;
end;

procedure TCustomDBGridEh.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
end;

procedure TCustomDBGridEh.DoAfterSizeChanged;
var
  ALayoutChanged: Boolean;
begin
  FSizeChanged := False;
  ALayoutChanged := (FAutoFitColWidths = True)
   or (IndicatorColVisible and (ColWidths[0] <> CalcIndicatorColWidth));

  if ALayoutChanged and not (csDesigning in ComponentState) then
  begin
    LayoutChanged;
    InvalidateEditor;
  end else
  begin
    UpdateRowCount;
    UpdateScrollBar;
    UpdateFilterEdit(False);
  end;
end;

procedure TCustomDBGridEh.WMSetCursor(var Msg: TWMSetCursor);
var
  Cell: TGridCoord;
  ARect, AStateRect: TRect;
  State: TDBGridEhState;
  Cur: HCURSOR;
  Index: Longint;
  Pos, Ofs: Integer;
  Column: TColumnEh;
begin
  Column := nil;
  if (csDesigning in ComponentState) and ((DataLink = nil) or
    ((Columns.State = csDefault) and
    (DataLink.DefaultFields or (not DataLink.Active)))) then
  begin
    Windows.SetCursor(LoadCursor(0, IDC_ARROW));
    Exit;
  end;

  Cur := 0;
  if Msg.HitTest = HTCLIENT then
  begin
    if (FGridState = gsNormal) and (FDBGridEhState = dgsNormal) then
      CalcFrozenSizingState(HitTest.X, HitTest.Y, State, Index, Pos, Ofs)
    else State := FDBGridEhState;
    if State = dgsColSizing then
      Cur := Screen.Cursors[crHSplit];
  end;
  if Cur <> 0 then
  begin
    SetCursor(Cur);
    Exit;
  end;

  if not (csDesigning in ComponentState) and DataLink.Active and
    not Sizing(HitTest.X, HitTest.Y) and (dgMultiSelect in Options) and
    (Msg.HitTest = HTCLIENT) then
  begin
    Cell := MouseCoord(HitTest.X, HitTest.Y);
    if CheckBeginRowMoving(HitTest.X, HitTest.Y, True) then
      inherited
    else if (Cell.X >= 0) and (Cell.X < FIndicatorOffset) and
      (Cell.Y > TopDataOffset - 1) and (Cell.Y < RowCount) and
      DataLink.Active and not (DataSource.DataSet.Eof and DataSource.DataSet.Bof) and
      (gstRecordBookmarks in AllowedSelections) and
      not (gioShowRowselCheckboxesEh in IndicatorOptions)
      then
      if Self.UseRightToLeftAlignment
        then Windows.SetCursor(hcrLeftCurEh)
        else Windows.SetCursor(hcrRightCurEh)
    else
      if (dgTitles in Options) and (Cell.Y = 0) and (Cell.X > IndicatorOffset - 1) and
        not (dgRowSelect in Options) then
      begin
        ARect := CellRect(Cell.X, Cell.Y);
        if Cell.X >= IndicatorOffset then
          Column := Columns[Cell.X-IndicatorOffset];

        if (HitTest.Y <= ARect.Bottom) and
           (gstColumns in AllowedSelections) and
           (HitTest.Y >= iif((ARect.Bottom - ARect.Top) < ColSelectionAreaHeight, ARect.Top, ARect.Bottom - ColSelectionAreaHeight)) and
           (GetMouseHitCellState(Cell, HitTest, ARect, Column, AStateRect) = dgsNormal)
        then
          Windows.SetCursor(hcrDownCurEh)
        else
          inherited;
      end
      else inherited;
  end
  else inherited;
end;

function DoControlMsg(ControlHandle: HWnd; var Message): Boolean;
var
  Control: TWinControl;
{$IFDEF CIL}
  Msg: TMessage;
{$ENDIF}
begin
  DoControlMsg := False;
  Control := FindControl(ControlHandle);
  if Control <> nil then
  begin
{$IFDEF CIL}
    Msg := UnwrapMessage(TObject(Message));
    with Msg do
{$ELSE}
    with TMessage(Message) do
{$ENDIF}
    begin
      Result := Control.Perform(Msg + CN_BASE, WParam, LParam);
      DoControlMsg := True;
    end;
  end;  
end;

procedure TCustomDBGridEh.WMCommand(var Message: TWMCommand);
begin
  inherited;
  if Message.NotifyCode = EN_CHANGE then
    with Message do
    begin
      begin
        if DoControlMsg(Message.Ctl, Message) then
          Exit;
        if (FilterEdit <> nil) and (Ctl = FilterEdit.Handle) and (FFilterCol <> -1) then
        begin
          if GetFilterValue(FFilterCol) <> FilterEdit.Text then
            OnFilterChange(Self);
        end;
      end;
    end;
end;

procedure TCustomDBGridEh.WMSetFocus(var Message: TWMSetFocus);
var
  InvalidRect: TRect;
begin

  if HandleAllocated and (dgRowSelect in Options) then
  begin
    with inherited Selection do
      InvalidRect := BoxRect(Left - FrozenCols, Top, Right, Bottom);
    WindowsInvalidateRect(Handle, InvalidRect, False);
  end;

  inherited;

  if ((FilterEdit = nil) or (Message.FocusedWnd <> FilterEdit.Handle)) and FilterEditMode then
    FilterEdit.SetFocus;

  if FSelectionActive <> IsSelectionActive then
  begin
    SelectionActiveChanged;
    if (sebShowOnlyWhenGridActiveEh in EditButtonsShowOptions) and not
      (sebShowOnlyForCurCellEh in EditButtonsShowOptions) and not
      (sebShowOnlyForCurRowEh in EditButtonsShowOptions) then
      Invalidate;
  end;
end;

procedure TCustomDBGridEh.WMKillFocus(var Message: TWMKillFocus);
var
  InvalidRect: TRect;
begin
  if FSortMarking and
    not ((InplaceEditor <> nil) and (Message.FocusedWnd = InplaceEditor.Handle)) then
  begin
    FSortMarking := False;
    DoSortMarkingChanged;
  end;

  if HandleAllocated and (dgRowSelect in Options) then
  begin
    with inherited Selection do
      InvalidRect := BoxRect(Left - FrozenCols, Top, Right, Bottom);
    WindowsInvalidateRect(Handle, InvalidRect, False);
  end;

  if not SysLocale.FarEast
    then inherited
  else
  begin
{
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;}
    inherited;
{   This code switches layout to default language. This code is incorrect.
    if not ((InplaceEditor <> nil) and (Message.FocusedWnd = InplaceEditor.Handle))
      then ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTIVATE);}
  end;

  if FSelectionActive <> IsSelectionActive then
  begin
    SelectionActiveChanged;
    if (sebShowOnlyWhenGridActiveEh in EditButtonsShowOptions) and not
      (sebShowOnlyForCurCellEh in EditButtonsShowOptions) and not
      (sebShowOnlyForCurRowEh in EditButtonsShowOptions) then
      Invalidate;
  end;

  if FInTitleFilterListboxVisible then
    InTitleFilterListboxCloseUp(False);
end;

procedure TCustomDBGridEh.WMHScroll(var Message: TWMHScroll);
begin
  if HorzScrollBar.Tracking and (Message.ScrollCode = SB_THUMBTRACK) then
    Perform(Message.Msg, MakeLong(SB_THUMBPOSITION, Word(Message.Pos)), Message.ScrollBar)
  else
    inherited;
  UpdateHorzExtScrollBar;
  //(Commented to avoid bug of changing text and press on scrollbar) InvalidateEditor;
end;

procedure TCustomDBGridEh.ScrollBarMessage(ScrollBar, ScrollCode,
  Pos: Integer; UseRightToLeft: Boolean);
var
  SI: TScrollInfo;
begin
  FScrollBarMessage := True;
  try
  if (ScrollBar = SB_HORZ) and HorzScrollBar.Tracking and (ScrollCode = SB_THUMBTRACK) then
    ScrollCode := SB_THUMBPOSITION;

  if (ScrollBar = SB_VERT) and not (ScrollBars in [ssVertical, ssBoth]) then
  begin
    if not AcquireFocus then Exit;
    if ExtendedScrolling then
    begin
      if VertScrollBar.SmoothStep then
      begin
        if VertScrollBar.Tracking and (ScrollCode = SB_THUMBTRACK) then
        begin
          if Pos < 0 then Pos := 0;
          Perform(WM_VSCROLL, MakeLong(SB_THUMBPOSITION, Pos), ScrollBar)
        end else
          inherited;
      end else
        MTWMVScroll(ScrollBar, ScrollCode, Pos);
    end else if DataLink.Active then
    begin
      with DataLink.DataSet do
        case ScrollCode of
          SB_LINEUP: Self.MoveBy(-DataLink.ActiveRecord - 1);
          SB_LINEDOWN: Self.MoveBy(DataLink.RecordCount - DataLink.ActiveRecord);
          SB_PAGEUP: Self.MoveBy(-VisibleDataRowCount);
          SB_PAGEDOWN: Self.MoveBy(VisibleDataRowCount);
          SB_THUMBTRACK:
            if VertScrollBar.Tracking then
            begin
              SI.cbSize := sizeof(SI);
              SI.fMask := SIF_TRACKPOS;
              VertScrollBar.GetScrollInfo(SI);
              Self.MoveBy(SI.nTrackPos - SumList.RecNo);
              FThumbTracked := True;
              Exit;
            end;
          SB_THUMBPOSITION:
            begin
              if FThumbTracked then begin
                FThumbTracked := False;
                Exit;
              end;
              if ScrollCode = SB_THUMBTRACK then
                if not VertScrollBar.Tracking then Exit;
              if SumList.IsSequenced then
              begin
                SI.cbSize := sizeof(SI);
                SI.fMask := SIF_ALL;
                VertScrollBar.GetScrollInfo(SI);
                if SI.nTrackPos <= 1 then First
                else if SI.nTrackPos >= SumList.RecordCount then Last
                else SumList.RecNo := SI.nTrackPos;
              end
              else
                case Pos of
                  0: First;
                  1: Self.MoveBy(-VisibleDataRowCount);
                  2: Exit;
                  3: Self.MoveBy(VisibleDataRowCount);
                  4: Last;
                end;
            end;
          SB_BOTTOM: Last;
          SB_TOP: First;
        end;
    end
  end else
    inherited ScrollBarMessage(ScrollBar, ScrollCode, Pos, UseRightToLeft);
  finally
    FScrollBarMessage := False;
  end;
end;

procedure TCustomDBGridEh.SetFocus;
begin
  if SearchEditorMode and FSearchPanelControl.Visible
    then SearchPanel.Active := True
    else inherited SetFocus;
end;

procedure TCustomDBGridEh.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  inherited;
  if dghPreferIncSearch in OptionsEh then
    Msg.Result := Msg.Result or DLGC_WANTCHARS;
end;

procedure TCustomDBGridEh.WMCancelMode(var Message: TWMCancelMode);
begin
  inherited;
  if FInTitleFilterListboxVisible then
    InTitleFilterListboxCloseUp(False);
end;

procedure TCustomDBGridEh.CancelMode;
begin
  if RowPanel.Active and (FGridState = gsColMoving) then
    StopRowPanelTitleCellDrag([], 0, 0, False);
  inherited CancelMode;

  FDSMouseCapture := False;
  StopTracking;
  if FDBGridEhState = dgsColSizing then
    DrawSizingLineEx(GridWidth, GridHeight)
  else if FDBGridEhState = dgsGroupPanelTitleMoving then
    StopGroupPanelTitleMovingMode([], 0, 0, False)
  else if FDBGridEhState <> dgsNormal then
    StopTimer;
  FDBGridEhState := dgsNormal;
end;


procedure TCustomDBGridEh.WndProc(var Message: TMessage);
var
  AMouseMessage: TWMMouse;
begin
  if (Message.Msg = WM_LBUTTONDOWN) and (csDesigning in ComponentState) and (FNoDesigntControler = False) and
     Assigned(DBGridEhDesigntControler) and not FTracking and (FGridState = gsNormal)  then
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

  if FInTitleFilterListboxVisible then
  begin
    case Message.Msg of
      wm_KeyDown, wm_SysKeyDown, wm_Char:
{$IFDEF CIL}
        with TWMKey.Create(Message) do
{$ELSE}
        with TWMKey(Message) do
{$ENDIF}
        begin
          SendMessage(FInTitleFilterListbox.Handle, Msg, Message.WParam, Message.LParam);
          Exit;
        end;
    end;
  end;

  if (DragMode = dmAutomatic) and {(dgMultiSelect in Options) and}
    not (csDesigning in ComponentState) and
    ((Message.Msg = WM_LBUTTONDOWN) or (Message.Msg = WM_LBUTTONDBLCLK)) then
  begin
    DragMode := dmManual;
    FAutoDrag := True;
    try
      inherited WndProc(Message);
    finally
      FAutoDrag := False;
      DragMode := dmAutomatic;
    end;
  end
  else
    inherited WndProc(Message);

end;

procedure TCustomDBGridEh.SaveBookmark;
begin
  if ViewScroll then
    FLockedBookmark := DataLink.DataSet.Bookmark
  else
  begin
    FLookedOffset := DataLink.ActiveRecord - (DataLink.RecordCount div 2) +
      ((DataLink.RecordCount + 1) mod 2) { - 1};
    MoveBy(-FLookedOffset);
    FLockedBookmark := DataLink.DataSet.Bookmark;
    MoveBy(FLookedOffset);
  end;
end;

procedure TCustomDBGridEh.RestoreBookmark;
begin
  if ViewScroll then
    DataLink.DataSet.Bookmark := FLockedBookmark
  else
  begin
    DataLink.DataSet.Bookmark := FLockedBookmark;
    MoveBy(FLookedOffset);
  end;
end;

procedure TCustomDBGridEh.SetTitleImages(const Value: TCustomImageList);
begin
  TitleParams.Images := Value;
end;

function TCustomDBGridEh.GetTitleImages: TCustomImageList;
begin
  Result := TitleParams.Images;
end;

procedure TCustomDBGridEh.SetTitleParams(const Value: TDBGridTitleParamsEh);
begin
  FTitleParams.Assign(Value);
end;

procedure TCustomDBGridEh.SetTreeViewParams(const Value: TGridTreeViewParamsEh);
begin
  FTreeViewParams.Assign(Value);
end;

procedure TCustomDBGridEh.SetIndicatorParams(const Value: TDBGridIndicatorParamsEh);
begin
  FIndicatorParams.Assign(Value);
end;

procedure TCustomDBGridEh.SetFooterParams(const Value: TDBGridFooterParamsEh);
begin
  FFooterParams.Assign(Value);
end;

procedure TCustomDBGridEh.TitleImageListChange(Sender: TObject);
begin
  if Sender = TitleImages then Invalidate;
end;

function TCustomDBGridEh.AllowedOperationUpdate: Boolean;
begin
  Result := False;
  if not DataLink.Active then Exit;
  Result := (alopUpdateEh in AllowedOperations) or
   (  not (alopUpdateEh in AllowedOperations) and (DataLink.DataSet.State = dsInsert)  );
  Result := Result and not (DataLink.DataSet.IsEmpty and
    not (alopInsertEh in AllowedOperations) and not (alopAppendEh in AllowedOperations));
end;

function TCustomDBGridEh.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  if ViewScroll and DataLink.Active and ExtendedScrolling then
  begin
    Result := False;
    if Assigned(OnMouseWheelDown) then
      OnMouseWheelDown(Self, Shift, MousePos, Result);
    if not Result then
    begin
      if ssShift in Shift then
        if ssCtrl in Shift
          then MoveBy(VisibleRowCount)
          else DataLink.DataSet.Next
      else if ssCtrl in Shift then
      begin
        if (RowCount - TopRow - VisibleRowCount < VisibleRowCount) then
          FIntMemTable.FetchRecords(VisibleRowCount - (RowCount - TopRow - VisibleRowCount));
        SafeMoveTop(TopRow + VisibleRowCount);
      end else if IsSmoothVertScroll then
        inherited DoMouseWheelDown(Shift, MousePos)
      else
        SafeMoveTop(TopRow + 1);
      Result := True;
    end;
  end else
  begin
    if DataLink.Active then MoveBy(1 {Mouse.WheelScrollLines});
    Result := True;
  end;
end;

function TCustomDBGridEh.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  if ViewScroll and DataLink.Active and ExtendedScrolling then
  begin
    Result := False;
    if Assigned(OnMouseWheelDown) then
      OnMouseWheelUp(Self, Shift, MousePos, Result);
    if not Result then
    begin
      if ssShift in Shift then
        if ssCtrl in Shift
          then MoveBy(-VisibleRowCount)
          else DataLink.DataSet.Prior
      else if ssCtrl in Shift then
        SafeMoveTop(TopRow - VisibleRowCount)
      else if IsSmoothVertScroll then
        inherited DoMouseWheelUp(Shift, MousePos)
      else
        SafeMoveTop(TopRow - 1);
      Result := True;
    end;
  end else
  begin
    if DataLink.Active then MoveBy(-1 {Mouse.WheelScrollLines});
    Result := True;
  end;
end;

procedure TCustomDBGridEh.CalcSizingState(X, Y: Integer; var State: TGridState;
  var Index: Longint; var SizingPos, SizingOfs: Integer; var FixedInfo: TGridDrawInfoEh);
var
  I, IndicatorBoundary: Integer;
  TitleBoundary: Integer;
begin
  if ([goColSizing, goRowSizing] * EffectiveGridOptions <> [])
    and (X > FixedInfo.Horz.NoFrozenBoundary)
     and (Y <= FixedInfo.Vert.NoFrozenBoundary) and RowPanel.Active
  then
    CalcSizingStateForRowPanel(X, Y, State, Index, SizingPos, SizingOfs, FixedInfo)
  else
  begin
    inherited CalcSizingState(X, Y, State, Index, SizingPos, SizingOfs, FixedInfo);
    if (State = gsColSizing) then
    begin
      TitleBoundary := FixedInfo.Vert.FixedBoundary;
      if GetSubTitleRows > 0 then
        Dec(TitleBoundary, RowHeights[GetTitleRows]);
      if Y > TitleBoundary then
         State := gsNormal
      else
        with FixedInfo.Horz do
          if (Index >= FullGridCellCount) then
            Index := GridCellCount - 1
          else if (FirstGridCell = LastFullVisibleCell) and
            (ColWidths[FirstGridCell] + FixedBoundary > GridBoundary) and
            (Index > FirstGridCell) and (ContraCelCount = 0)
          then
            Index := FirstGridCell;
    end;
    if State = gsRowSizing then
    begin
      if RowPanel.Active then
        State := gsNormal
      else
      begin
        IndicatorBoundary := 0;
        for I := 0 to IndicatorOffset - 1 do
          Inc(IndicatorBoundary, ColWidths[I] + GridLineWidth);
        if X >= IndicatorBoundary then State := gsNormal;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.CalcSizingStateForRowPanel(X, Y: Integer; var State: TGridState;
  var Index: Longint; var SizingPos, SizingOfs: Integer; var FixedInfo: TGridDrawInfoEh);
var
  Cell: TGridCoord;
  ARect: TRect;
  i, OldRigth: Integer;
  Column: TColumnEh;
  ACellRect: TRect;
begin
  Cell := MouseCoord(X, Y);
  if (Cell.X < 0) or (Cell.Y <> 0) then Exit;
  ARect := CellRect(Cell.X, Cell.Y);
  if Self.UseRightToLeftAlignment then
  begin
    OldRigth := ARect.Right;
    ARect.Right := ClientWidth - ARect.Left;
    ARect.Left := ClientWidth - OldRigth;
    X := ClientWidth - X;
  end;

  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    ACellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
      Column.FRowPlacement.Left + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    {if UseRightToLeftAlignment then
    begin
      OldRigth := ACellRect.Right;
      ACellRect.Right := ARect.Right - ACellRect.Left;
      ACellRect.Left := ARect.Right - OldRigth;
      OffsetRect(ACellRect, FDataOffset.cx, 0);
      OffsetRect(ACellRect, 0, ARect.Top);
    end else}
    begin
      OffsetRect(ACellRect, -FDataOffset.cx, 0);
      OffsetRect(ACellRect, ARect.Left, ARect.Top);
    end;

    if (goColSizing in EffectiveGridOptions) and
       (ACellRect.Top <= Y) and (ACellRect.Bottom >= Y) and
       (ACellRect.Right - 3 <= X) and (ACellRect.Right + 3 >= X) then
    begin
      State := gsColSizing;
      SizingPos := ACellRect.Right;
      SizingOfs := ACellRect.Right - X;
      Index := i;
      Exit;
    end else if (goRowSizing in EffectiveGridOptions) and
       (ACellRect.Left <= X) and (ACellRect.Right >= X) and
       (ACellRect.Bottom - 3 <= Y) and (ACellRect.Bottom + 3 >= Y) then
    begin
      State := gsRowSizing;
      SizingPos := ACellRect.Bottom;
      SizingOfs := ACellRect.Bottom - Y;
      Index := i;
      Exit;
    end;
  end;
end;

procedure TCustomDBGridEh.CalcFrozenSizingState(X, Y: Integer;
  var State: TDBGridEhState; var Index: Longint; var SizingPos, SizingOfs: Integer);
var
  I, Line, Back, Range, VertFixedBoundary, HorzGridBoundary: Integer;
  EffectiveOptions: TGridOptions;
begin
  State := dgsNormal;
  Index := -1;
  EffectiveOptions := inherited Options;
  if csDesigning in ComponentState then
    EffectiveOptions := EffectiveOptions + DesignOptionsBoost;
  if not (goColSizing in EffectiveOptions) then Exit;
  if Self.UseRightToLeftAlignment then
    X := ClientWidth - X;
  Line := 0;
  VertFixedBoundary := OutBoundaryData.TopIndent;
  HorzGridBoundary := GridWidth;
  for I := 0 to TopDataOffset - 1 do
  begin
    Inc(VertFixedBoundary, RowHeights[I] + GridLineWidth);
  end;
  if Y >= VertFixedBoundary then Exit;
  for I := 0 to IndicatorOffset - 1 do
  begin
    Inc(Line, ColWidths[I] + GridLineWidth);
  end;
  Range := GridLineWidth;
  Back := 0;
  if Range < 7 then
  begin
    Range := 7;
    Back := (Range - GridLineWidth) shr 1;
  end;
  for I := IndicatorOffset to FixedCols - 1 do
  begin
    Inc(Line, ColWidths[I]);
    if ColWidths[I] > 0 then
    begin
      if Line > HorzGridBoundary then
      begin
        Index := I;
        Break;
      end;
      if (X >= Line - Back) and (X <= Line - Back + Range) then
      begin
        State := dgsColSizing;
        SizingPos := Line;
        SizingOfs := Line - X;
        Index := I;
        Exit;
      end;
    end;
    Inc(Line, GridLineWidth);
  end;
  if (Line > HorzGridBoundary) and (HorzGridBoundary = ClientWidth) and
    (X >= ClientWidth - Back) and (X <= ClientWidth) then
  begin
    State := dgsColSizing;
    SizingPos := ClientWidth;
    SizingOfs := ClientWidth - X;
  end;
end;

function TCustomDBGridEh.Sizing(X, Y: Integer): Boolean;
begin
  Result := inherited Sizing(X, Y);
  if not Result then
    Result := FrozenSizing(X, Y);
end;

function TCustomDBGridEh.FrozenSizing(X, Y: Integer): Boolean;
var
  State: TDBGridEhState;
  Index: Longint;
  Pos, Ofs: Integer;
begin
  State := FDBGridEhState;
  if State = dgsNormal then
  begin
    CalcFrozenSizingState(X, Y, State, Index, Pos, Ofs);
  end;
  Result := State <> dgsNormal;
end;

procedure TCustomDBGridEh.DrawSizingLineEx(HorzGridBoundary, VertGridBoundary: Integer);
var
  OldPen: TPen;
begin
  OldPen := TPen.Create;
  try
    with Canvas do
    begin
      OldPen.Assign(Pen);
      Pen.Style := psDot;
      Pen.Mode := pmXor;
      Pen.Width := 1;
      try
        if FGridState = gsRowSizing then
        begin
          MoveTo(0, FSizingPos);
          LineTo(HorzGridBoundary, FSizingPos);
        end else
        begin
          MoveTo(FSizingPos, 0);
          LineTo(FSizingPos, VertGridBoundary);
        end;
      finally
        Pen := OldPen;
      end;
    end;
  finally
    OldPen.Free;
  end;
end;

procedure TCustomDBGridEh.GetDrawSizingLineBound(const DrawInfo: TGridDrawInfoEh; var StartPos, FinishPos: Integer);
var
  ACellRect: TRect;
begin
  if RowPanel.Active and (FGridState = gsRowSizing) and (ssShift in FStartShiftState) then
  begin
    ACellRect := CellRect(IndicatorOffset, 0);
    StartPos := Columns[FSizingIndex].FRowPlacement.Left;
    FinishPos := Columns[FSizingIndex].FRowPlacement.Left +
                 Columns[FSizingIndex].FRowPlacement.Width;
    Inc(StartPos, ACellRect.Left);
    Inc(StartPos, -FDataOffset.cx);

    Inc(FinishPos, ACellRect.Left);
    Inc(FinishPos, -FDataOffset.cx);
  end else if RowPanel.Active and (FGridState = gsColSizing) and (ssShift in FStartShiftState) then
  begin
    ACellRect := CellRect(IndicatorOffset, 0);
    StartPos := Columns[FSizingIndex].FRowPlacement.Top;
    FinishPos := Columns[FSizingIndex].FRowPlacement.Top +
                 Columns[FSizingIndex].FRowPlacement.Height;
    Inc(StartPos, ACellRect.Top);
    Inc(FinishPos, ACellRect.Top);
  end else
    inherited GetDrawSizingLineBound(DrawInfo, StartPos, FinishPos);
end;

function TCustomDBGridEh.CheckForDesigntTimeColMoving(X, Y: Integer): Boolean;
var
  Cell: TGridCoord;
  AreaCol, AreaRow: Integer;
  CellAreaType: TCellAreaTypeEh;
begin
  Result := False;
  Cell := MouseCoord(X, Y);
  if (Cell.X >= 0) and (Cell.Y >= 0) then
  begin
    CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
    if RowPanel.Active and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctTitleEh{, vctSubTitleEh, vctDataEh, vctFooterEh}])
    then
      Result := True;
  end;
end;

function TCustomDBGridEh.GetCol: Longint;
begin
  Result := inherited Col;
end;

procedure TCustomDBGridEh.SetCol(Value: Longint);
begin
  if Value = Col then Exit;
  if (Value <= FixedCols - 1) and (Value >= IndicatorOffset) then
  begin
    MoveColRow(Value, Row, False, False, False);
  end else
  begin
    inherited Col := Value;
  end;
end;

function TCustomDBGridEh.DataRowCount: Integer;
begin
  if FullFooterRowCount > 0
    then Result := RowCount - TopDataOffset
    else Result := RowCount - TopDataOffset;
end;

procedure TCustomDBGridEh.FlatChanged;
begin
  inherited FlatChanged;
  FStdDefaultRowHeight := CalcStdDefaultRowHeight;
  FColWidthsChanged := True;
  RecreateWnd();
  LayoutChanged();
  UpdateAllDataRowHeights;
end;

procedure TCustomDBGridEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;

procedure TCustomDBGridEh.StartInplaceSearchTimer;
begin
  if FInplaceSearchTimerActive then StopTimer;
  if FInplaceSearchTimeOut > -1 then
  begin
    SetTimer(Handle, 2, FInplaceSearchTimeOut, nil);
    FInplaceSearchTimerActive := True;
  end;
end;

procedure TCustomDBGridEh.StopInplaceSearchTimer;
begin
  if FInplaceSearchTimerActive
    then KillTimer(Handle, 2);
  FInplaceSearchTimerActive := False;
end;

function TCustomDBGridEh.LocateText(AGrid: TCustomDBGridEh; const FieldName: string;
  const Text: String; Options: TLocateTextOptionsEh; Direction: TLocateTextDirectionEh;
  Matching: TLocateTextMatchingEh; TreeFindRange: TLocateTextTreeFindRangeEh): Boolean;
begin
  StartWait;
  try
    Result := Center.LocateText(Self, FieldName, Text,
      Options, Direction, Matching, TreeFindRange);
    if Result and DataGrouping.IsGroupingWorks then
      DataGroupsGotoRecordViewNo(FIntMemTable.InstantReadCurRowNum, True);
  finally
    StopWait;
  end;
end;

procedure TCustomDBGridEh.StartInplaceSearch(const ss: String;
  TimeOut: Integer; InpsDirection: TLocateTextDirectionEh);
var
  NesSs, OldSs: String;
  RecordFounded: Boolean;
  LTOptions: TLocateTextOptionsEh;
  Field: TField;
  SText: String;
  ColIndex: Integer;
begin
  if not DataLink.Active then Exit;
  NesSs := FInplaceSearchText + ss;
  OldSs := FInplaceSearchText;
  RecordFounded := False;
  if NesSs <> '' then
  begin
    LockPaint;
    try
      if dgRowSelect in Options
        then ColIndex := VisibleColumns[0].Index
        else ColIndex := SelectedIndex;
      Field := Columns[ColIndex].Field;
      if Assigned(Field) and
         (Field is TNumericField) and
         Center.PreferEditFormatForNumberFields
      then
        LTOptions := [ltoCaseInsensitiveEh, ltoStopOnEscape]
      else
        LTOptions := [ltoCaseInsensitiveEh, ltoMatchFormatEh, ltoStopOnEscape];
      RecordFounded := LocateText(Self, '', NesSs, LTOptions,
        InpsDirection, ltmFromBegingEh, lttInAllNodesEh);
      if RecordFounded then
      begin
        if ltoMatchFormatEh in LTOptions
          then SText := Columns[ColIndex].DisplayText
          else SText := Columns[ColIndex].EditText;
        NesSs := Copy(SText, 1, Length(NesSs));
        if DataGrouping.IsGroupingWorks then
          DataGroupsGotoRecordViewNo(FIntMemTable.InstantReadCurRowNum, True);
        if ViewScroll then
          SafeMoveTop(Row - VisibleRowCount div 2);
      end;
    finally
      UnlockPaint;
    end;
  end;
  HideEditor;
  FInplaceSearching := True;
  if RecordFounded
    then FInplaceSearchText := NesSs
    else FInplaceSearchText := OldSs;
  GridInvalidateRow(Self, Row);
  FInplaceSearchTimeOut := TimeOut;
  StartInplaceSearchTimer;
end;

procedure TCustomDBGridEh.StopInplaceSearch;
begin
  if not FInplaceSearching then Exit;
  StopInplaceSearchTimer;
  FInplaceSearching := False;
  FInplaceSearchText := '';
  GridInvalidateRow(Self, Row);
  if (dgAlwaysShowEditor in Options) and CanEditorMode then ShowEditor;
end;

function TCustomDBGridEh.IsSearchingState: Boolean;
begin
  Result := FSearchPanel.Active;
end;

function TCustomDBGridEh.GetSearchingText: String;
begin
  Result := SearchPanel.SearchingText;
end;

procedure TCustomDBGridEh.SetAllowedSelections(const Value: TDBGridEhAllowedSelections);
begin
  if FAllowedSelections <> Value then
  begin
    FAllowedSelections := Value;
    if (Selection.SelectionType <> gstNon) and
      not (Selection.SelectionType in FAllowedSelections)
      then Selection.Clear;
  end;
end;

function TCustomDBGridEh.CanSelectType(const Value: TDBGridEhSelectionType): Boolean;
begin
  Result := (Value = gstNon) or
    ((dgMultiSelect in Options) and (Value in AllowedSelections)
    and
    (((Value in [gstRectangle, gstColumns]) and not (dgRowSelect in Options))
    or
    (Value in [gstRecordBookmarks, gstAll])
    ));
end;

function TCustomDBGridEh.GetColumnDefValues: TColumnDefValuesEh;
begin
  Result := TColumnDefValuesEh(AxisBarDefValues);
end;

procedure TCustomDBGridEh.SetColumnDefValues(const Value: TColumnDefValuesEh);
begin
  AxisBarDefValues := Value;
end;

procedure TCustomDBGridEh.InvalidateSpot(HTSpot: TGridHotTrackSpotEh);
begin
  inherited InvalidateSpot(HTSpot);
  if {(HTSpot = FNewHotTrackSpot) and} (dgTitles in Options) and
    ( ((FNewHotTrackSpot.Row = 0) and (FOldHotTrackSpot.Row <> 0)) or
      ((FNewHotTrackSpot.Row <> 0) and (FOldHotTrackSpot.Row = 0)) )
  then
    InvalidateTitle;
end;

function TCustomDBGridEh.GetContraColCount: Longint;
begin
  Result := FContraColCount;
end;

procedure TCustomDBGridEh.SetContraColCount(const Value: Longint);
begin
  if FContraColCount <> Value then
  begin
    if not (csLoading in ComponentState) then
    begin
      if Value < 0 then
        raise EInvalidGridOperationEh.Create(SIndexOutOfRange);
      if Value >= ColCount-FixedRows then
        raise EInvalidGridOperationEh.Create('Contra column count must be less than scrollable column count');
    end;
    FContraColCount := Value;
    LayoutChanged;
    if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    begin
      if RowPanel.Active and (FContraColCount > 0) then
        ShowMessage('ContraColCount is not suppored when RowPanel mode is Activated (See RowPanel.Active property).');
    end;
  end;
end;

function TCustomDBGridEh.CheckPersistentContraLine(LineType: TGridCellBorderTypeEh): Boolean;
begin
  if LineType = cbtTopEh
    then Result := (dgRowLines in Options) or GridLineParams.GridBoundaries
    else Result := (dgColLines in Options) or GridLineParams.GridBoundaries
end;

function TCustomDBGridEh.GetEvenRowColor: TColor;
begin
  if FEvenRowColorStored
    then Result := FEvenRowColor
    else Result := Color;
end;

function TCustomDBGridEh.GetOddRowColor: TColor;
begin
  if FOddRowColorStored
    then Result := FOddRowColor
    else Result := Color;
end;

function TCustomDBGridEh.IsEvenRowColorStored: Boolean;
begin
  Result := FEvenRowColorStored;
end;

function TCustomDBGridEh.IsOddRowColorStored: Boolean;
begin
  Result := FOddRowColorStored;
end;

procedure TCustomDBGridEh.SetEvenRowColor(const Value: TColor);
begin
  FEvenRowColorStored := True;
  if FEvenRowColor <> Value then
  begin
    FEvenRowColor := Value;
    Invalidate;
  end;
end;

procedure TCustomDBGridEh.SetEmptyDataInfo(const Value: TGridEmptyDataInfoEh);
begin
  FEmptyDataInfo.Assign(Value);
end;

procedure TCustomDBGridEh.SetOddRowColor(const Value: TColor);
begin
  FOddRowColorStored := True;
  if FOddRowColor <> Value then
  begin
    FOddRowColor := Value;
    Invalidate;
  end;
end;

function TCustomDBGridEh.DataRowToRecNo(DataRow: Integer): Integer;
var
  ActiveRecord: Integer;
begin
  Result := 0;
  if not DataLink.Active then Exit;
  if ViewScroll then
    Result := DataRow + 1
  else
  begin
    ActiveRecord := DataLink.ActiveRecord;
    try
      DataLink.ActiveRecord := DataRow;
      Result := DataLink.DataSet.RecNo;
    finally
      DataLink.ActiveRecord := ActiveRecord;
    end;
  end;
end;

procedure TCustomDBGridEh.IndicatorTitleMouseDown(Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Processed: Boolean;
begin
  Processed := False;
  if Assigned(OnIndicatorTitleMouseDown) then
    OnIndicatorTitleMouseDown(Self, Cell, Button, Shift, X, Y, Processed);
  if not Processed then
    DefaultIndicatorTitleMouseDown(Cell, Button, Shift, X, Y);
end;

procedure TCustomDBGridEh.DefaultIndicatorTitleMouseDown(Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  DropdownMenu: TPopupMenu;
  P: TPoint;
  ARect: TRect;
begin
  if IndicatorTitle.TitleButton then
  begin
    IndicatorTitle.FDown := True;
    FPressed := True;
    InvalidateCell(0,0);
    DropdownMenu := nil;
    BuildIndicatorTitleMenu(DropdownMenu);
    ARect := CellRect(0,0);
    P := ClientToScreen(Point(ARect.Left, ARect.Bottom));
    if (DropdownMenu <> nil) and (DropdownMenu.Items.Count > 0) then
    begin
      DropdownMenu.Popup(P.X, P.Y);
      if DropdownMenu.Owner = nil then
        DropdownMenu.Free;
      IndicatorTitle.FDown := False;
      FPressed := False;
      InvalidateCell(0,0);
      KillMouseUp(Self, ARect);
    end else
    begin
      if not MouseCapture then Exit;
      FDBGridEhState := dgsTitleDown;
      FTracking := True;
      FPressedCol := Cell.X;
      TrackButton(X, Y);
      Exit;
    end;
  end else if (dgMultiSelect in Options) and
    DataLink.Active and ([gstRecordBookmarks, gstAll] * AllowedSelections <> []) then
  begin
    if Selection.SelectionType <> gstNon then
      Selection.Clear
    else if gstAll in AllowedSelections then
      Selection.SelectAll
    else if gstRecordBookmarks in AllowedSelections then
      Selection.Rows.SelectAll;
  end;
end;

procedure TCustomDBGridEh.BuildIndicatorTitleMenu(var PopupMenu: TPopupMenu);
begin
  if Assigned(OnBuildIndicatorTitleMenu)
    then OnBuildIndicatorTitleMenu(Self, PopupMenu)
    else DefaultBuildIndicatorTitleMenu(PopupMenu);
end;

procedure TCustomDBGridEh.DefaultBuildIndicatorTitleMenu(var PopupMenu: TPopupMenu);
begin
  Center.BuildIndicatorTitleMenu(Self, PopupMenu);
end;

procedure TCustomDBGridEh.MTViewDataEvent(RowNum: Integer;
      Event: TMTViewEventTypeEh; OldRowNum: Integer);
var
  NewRowCount: Integer;
begin
  if MemTableSupport and FIntMemTable.MemTableIsTreeList then
    Exit;
  case Event of
    mtRowInsertedEh:
      if DataGrouping.IsGroupingWorks then
      begin
        DataGrouping.GroupDataTree.RecordInserted(RowNum);
      end else begin
        if FIntMemTable.InstantReadRowCount > 1 then
          SetRowCount(RowCount + 1);
        MoveRow(RowCount-1, TopDataOffset + RowNum);
        UpdateDataRowHeight(RowNum);
      end;
    mtRowChangedEh:
      if DataGrouping.IsGroupingWorks then
      begin
        DataGrouping.GroupDataTree.RecordChanged(RowNum);
      end else
        UpdateDataRowHeight(RowNum);
    mtRowDeletedEh:
      begin
        if DataGrouping.IsGroupingWorks then
        begin
          DataGrouping.GroupDataTree.RecordDeleted(RowNum);
        end else if FIntMemTable.InstantReadRowCount > 0 then
          DeleteRow(TopDataOffset + RowNum);
      end;
    mtRowMovedEh:
      MoveRow(TopDataOffset + OldRowNum, TopDataOffset + RowNum);
    mtViewDataChangedEh:
      begin
        FWholeGridChanged := True;
        try
        if RowDetailPanel.Active then
          RowDetailPanel.Visible := False;

        if DataGrouping.IsGroupingWorks then
        begin
          if DataGrouping.GroupDataTree.UpdateCount = 0 then
          begin
            DataGrouping.GroupDataTree.RebuildDataTreeEx(FIntMemTable);
            if DataLink.Active then
            begin
              if FInternalUpdatingDatasetPos then Exit;
              FInternalUpdatingDatasetPos := True;
              try
                DataGroupsGotoRecordViewNo(FIntMemTable.InstantReadCurRowNum, False);
              finally
                FInternalUpdatingDatasetPos := False;
              end;
            end;
            UpdateAllDataRowHeights;
            UpdateScrollBar;
          end;
        end else
        begin
          if MemTableSupport then
          begin
            NewRowCount := TopDataOffset + FIntMemTable.InstantReadRowCount;
            if FIntMemTable.InstantReadRowCount = 0 then
              Inc(NewRowCount);
          end else
            NewRowCount := TopDataOffset + 1;
          RowCount := NewRowCount;
          UpdateAllDataRowHeights;
        end;
        finally
          FWholeGridChanged := False;
        end;
      end;
  end;
end;

procedure TCustomDBGridEh.UpdateDataRowHeight(DataRowNum: Integer);
var
  NewHeigth: Integer;
begin
  NewHeigth := CalcRowDataRowHeight(DataRowNum);
  if RowDetailPanel.Active and RowDetailPanel.Visible and (Row = DataRowNum + TopDataOffset) then
    NewHeigth := NewHeigth + RowDetailPanel.Height;
  CellRowHeights[DataRowNum + TopDataOffset] := NewHeigth;
end;

function TCustomDBGridEh.CalcRowForCurRecordHeight: Integer;
var
  i: Integer;
  ColHeight: Integer;
begin
  Result := 0;
  if not (dghAutoFitRowHeight in OptionsEh) then
    Result := FStdDefaultRowHeight
  else
    for i := 0 to Columns.Count-1 do
    begin
      if Columns[i].Visible then
      begin
         ColHeight := Columns[i].CalcRowHeight;
         if ColHeight > Result then
           Result := ColHeight;
      end;
    end;
  if Assigned(FOnGetRowHeight) then
    OnGetRowHeight(Self, Result);
end;

function TCustomDBGridEh.CalcRowDataRowHeight(DataRowNum: Integer): Integer;
var
  NewHeigth: Integer;
begin
  if not DataLink.Active or
   ( not (dghAutoFitRowHeight in OptionsEh) and not DataGrouping.IsGroupingWorks) then
  begin
    Result := FStdDefaultRowHeight;
    Exit;
  end;
  InstantReadRecordEnter(DataRowNum);
  try
    if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0)
      then NewHeigth := InstantReadCurDataNode.RowHeight
      else NewHeigth := CalcRowForCurRecordHeight;
    Result := NewHeigth;
  finally
    InstantReadRecordLeave;
  end;
end;

procedure TCustomDBGridEh.UpdateAllGridDataRowHeights();
var
  i: Integer;
  IsTreeMode: Boolean;
begin
  IsTreeMode := MemTableSupport and FIntMemTable.MemTableIsTreeList;
  if DataLink.Active and MemTableSupport and not IsTreeMode then
    try
      LockPaint;
      for i := 0 to InstantReadRecordCount-1 do
        UpdateDataRowHeight(i);
    finally
      UnlockPaint;
    end
  else
    CellRowHeights[TopDataOffset] := FStdDefaultRowHeight;
end;

procedure TCustomDBGridEh.UpdateAllDataRowHeights();
begin
  if csLoading in ComponentState then Exit;
  if not HandleAllocated then Exit;
  if DataGrouping.IsGroupingWorks then
    DataGrouping.GroupDataTree.UpdateAllDataRowHeights;
  UpdateAllGridDataRowHeights();
  UpdateGroupFooterRowHeights;
  UpdateFooterRowHeights;
end;

procedure TCustomDBGridEh.UpdateFooterRowHeights;
var
  i: Integer;
begin
  SetLength(FooterParams.FCalculatedRowHeights, FooterRowCount);
  for i := 0 to FooterRowCount-1 do
  begin
    if (FooterParams.RowLines <> 0) or (FooterParams.RowHeight <> 0) then
      FooterParams.FCalculatedRowHeights[i] :=
        CalcHeightForTextLines(FooterFont, FooterParams.RowLines, FooterParams.RowHeight)
    else if Font.Size = FooterFont.Size then
      FooterParams.FCalculatedRowHeights[i] := FStdDefaultRowHeight
    else
    begin
      Canvas.Font := FooterFont;
      FooterParams.FCalculatedRowHeights[i] := Canvas.TextHeight('Wg') + FInterlinear;
    end;
  end;
end;

procedure TCustomDBGridEh.UpdateGroupFooterRowHeights;
var
  i,j: Integer;
  NewHeight: Integer;
  DataGroupFooter: TGridDataGroupFooterEh;
begin
  for i := 0 to DataGrouping.Footers.VisibleItemsCount-1{-FooterRowCount} do
  begin
    TGridDataGroupFooterEhCrack(DataGrouping.Footers.VisibleItems[i]).FAutoCalcHeight := 1;
    DataGroupFooter := DataGrouping.Footers.VisibleItems[i];

    for j := 0 to DataGroupFooter.ColumnItems.Count-1 do
    begin
        Canvas.Font := DataGroupFooter.ColumnItems[j].Font;
        NewHeight := Canvas.TextHeight('Wg');
        if (FooterParams.RowLines <> 0) or (FooterParams.RowHeight <> 0) then
          NewHeight := NewHeight * FooterParams.RowLines + FooterParams.RowHeight
        else
        begin
          if Flat
            then NewHeight := NewHeight + 1
            else NewHeight := NewHeight + 3;
        end;
        if dgRowLines in Options then
          Inc(NewHeight, GridLineWidth);
      if  NewHeight > TGridDataGroupFooterEhCrack(DataGrouping.Footers.VisibleItems[i]).FAutoCalcHeight then
        TGridDataGroupFooterEhCrack(DataGrouping.Footers.VisibleItems[i]).FAutoCalcHeight := NewHeight;
    end;
  end;
end;

procedure TCustomDBGridEh.ScrollDataInfo(DX, DY: Integer;
  var DrawInfo: TGridDrawInfoEh);
begin
  if (DX <> 0) and EmptyDataInfo.Showing then
    InvalidateGrid
  else
    inherited ScrollDataInfo(DX, DY, DrawInfo);
end;

procedure TCustomDBGridEh.SetEditButtonsShowOptions(Value: TEditButtonsShowOptionsEh);
begin
  if Value <> FEditButtonsShowOptions then
  begin
    FEditButtonsShowOptions := Value;
    Invalidate;
  end;
end;

procedure TCustomDBGridEh.DataGroupsVisibleChanged;
var
  NewRowCount: Integer;
begin
  if (csLoading in ComponentState) or not DataGrouping.IsGroupingWorks then
    Exit;
  NewRowCount := TopDataOffset + DataGrouping.GroupDataTree.FlatVisibleCount;
  if FIntMemTable.InstantReadRowCount = 0 then
    Inc(NewRowCount);
  RowCount := NewRowCount;
  ContraRowCount := FullFooterRowCount;
  UpdateAllDataRowHeights;
  MTUpdateRowCount;
  UpdateScrollBar;
  Invalidate;
end;

function TCustomDBGridEh.ColWidthToCellWidth(Column: TColumnEh; AWidth: Integer): Integer;
begin
  Result := AWidth;
  if (VisibleColumns.Count > 0) and (Column = VisibleColumns[0]) then
    Inc(Result, FExtraFirstColumnWidth);
  if not Column.Visible then
    Result := EmptyColWidth;
end;

function TCustomDBGridEh.ColumnWidthToCellColWidth(Column: TColumnEh; AWidth: Integer): Integer;
begin
  Result := AWidth;
  if (VisibleColumns.Count > 0) and (Column = VisibleColumns[0]) then
    Dec(Result, FExtraFirstColumnWidth);
end;

procedure TCustomDBGridEh.SetExtraFirstColumnWidth;
begin
  if DataGrouping.IsGroupingWorks and (DataGrouping.ActiveGroupLevelsCount > 0) then
    if DataGrouping.ShiftFolldataGroupRow
      then FExtraFirstColumnWidth := DataGrouping.ActiveGroupLevelsCount * 18
      else FExtraFirstColumnWidth := (DataGrouping.ActiveGroupLevelsCount-1) * 18
  else
    FExtraFirstColumnWidth := 0;
end;

procedure TCustomDBGridEh.DrawGroupDataCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  Value: string;
  DrawInfo: TGridDrawInfoEh;
  i: Integer;
  DrawRect, ARect1, FocusRect, ImageRect, TextRect, ClipRect: TRect;
  TreeElement: TTreeElementEh;
  NextLevel: Integer;
  Focused: Boolean;
  AColor: TColor;
  LeftMarg, RightMarg: Integer;
  YFrameOffs, XFrameOffs: Integer;
  GroupLevel: TGridDataGroupLevelEh;
  Footer: TGridDataGroupFooterEh;
  ColIndex: Integer;
  TerminateRowLine: Boolean;
  FooterCellRect: TRect;
  NextRight: Integer;
  FontData: TFontDataEh;
  BaseStartPos: Integer;
  StartFooterIndent: Integer;
  FirstVisColIndex: Integer;
  TextLayout: TTextLayout;
  BottomLineColor: TColor;
  NextDataNode: TGroupDataTreeNodeEh;
  FillBackground: Boolean;

  procedure DrawFooterInfo(ACellRect: TRect);
  var
    FooterColumnItem: TGridDataGroupFooterColumnItemEh;
    Value: string;
    Column: TColumnEh;
    VarValue: Variant;
  begin
    Column := Columns[ColIndex];
    FooterColumnItem := Footer.ColumnItems[ColIndex];
    VarValue := InstantReadCurDataNode.FooterItems[0].FooterValues[ColIndex];
    Value := FooterColumnItem.ConvertToDisplayText(VarValue);
    AColor := FooterColumnItem.Color;
    Canvas.Font := FooterColumnItem.Font;
    HighlightGroupDataCellColor(AreaCol, AreaRow, Value, AState, AColor, Canvas.Font);
    Canvas.Brush.Color := AColor;

    FGroupFooterParams.FColor := AColor;
    FGroupFooterParams.FText := Value;
    FGroupFooterParams.FFont := Canvas.Font;
    FGroupFooterParams.FState := AState;
    FGroupFooterParams.FValue := VarValue;
    if Assigned(FOnDataGroupGetFooterParams) then
      FOnDataGroupGetFooterParams(Self, InstantReadCurDataNode.FooterItems[0], FooterColumnItem, FGroupFooterParams);
    Canvas.Brush.Color := FGroupFooterParams.Color;

    WriteCellText(Column, Canvas, ACellRect, True,
      ColCellParamsEh.FXFrameOffs, ColCellParamsEh.FYFrameOffs, Value,
      FooterColumnItem.Alignment, TextLayout, False, Column.EndEllipsis, 0, 0, True);
  end;

  procedure DrawGroupTreeElement(Canvas: TCanvas; ARect: TRect;
    TreeElement: TTreeElementEh; BackDot: Boolean; ScaleX, ScaleY: Double;
    RightToLeft: Boolean; Coloured: Boolean);
  var
    TextHeight: Integer;
  begin
    if TextLayout = tlBottom then
    begin
      TextHeight := Canvas.TextHeight('Wg');
      if ARect.Bottom - TextHeight - YFrameOffs > ARect.Top then
      begin
        ARect.Top := ARect.Bottom - TextHeight - YFrameOffs;
        ARect.Bottom := ARect.Top + TextHeight;
      end;
    end;

    DrawGridTreeElement(Canvas, ARect, TreeElement, BackDot, ScaleX, ScaleY,
      RightToLeft, Coloured, TreeViewParams.GetActualGlyphStyle);
  end;

  procedure DrawContralGroupRowArea;
  begin

    Canvas.Font := InstantReadCurDataNode.DataGroupLevel.Font;
    if Style.IsCustomStyleActive and (Canvas.Font.Color = clWindowText) then
      Canvas.Font.Color := FInternalFontColor;
    Canvas.Brush.Color := InstantReadCurDataNode.DataGroupLevel.Color;
    if Style.IsCustomStyleActive and (Canvas.Brush.Color = clWindow) then
      Canvas.Brush.Color := FInternalColor;
    AColor := Canvas.Brush.Color;

    HighlightGroupDataCellColor(AreaCol, AreaRow, Value, AState, AColor, Canvas.Font);

    if DataGrouping.GroupRowDefValues.BottomLine.Color = clDefault
      then BottomLineColor := GridLineParams.GetBrightColor
      else BottomLineColor := DataGrouping.GroupRowDefValues.BottomLine.Color;

    DrawRect := ARect;
    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
      DrawRect.Bottom := DrawRect.Bottom - DataGrouping.GroupRowDefValues.BottomLine.Width;

    Canvas.Brush.Color := AColor;
    Canvas.FillRect(DrawRect);

    Canvas.Pen.Color := BottomLineColor;
    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
      DrawWideLine(DrawRect.Left, DrawRect.Bottom, DrawRect.Right, DrawRect.Bottom,
        DataGrouping.GroupRowDefValues.BottomLine.Width);

  end;

begin
  if ACol >= ColCount then
  begin
    DrawContralGroupRowArea;
    Exit;
  end;

  if FDrawnGroupList.IndexOf(InstantReadCurDataNode) >= 0 then
    Exit;

  GroupLevel := InstantReadCurDataNode.DataGroupLevel;
  Value := GroupLevel.GetGroupRowText(InstantReadCurDataNode);

  if DataGrouping.GroupRowDefValues.BottomLine.Color = clDefault
    then BottomLineColor := GridLineParams.GetBrightColor
    else BottomLineColor := DataGrouping.GroupRowDefValues.BottomLine.Color;

  Focused := IsActiveControl;
  if Focused and (ARow = Row) then
    Include(AState, gdFocused);

//  if AreaCol = 0 then
  begin
    CalcDrawInfo(DrawInfo);
    ARect1 := ARect;

    if FrozenCols > 0 then
      ARect1.Left := DrawInfo.Horz.NoFrozenBoundary
    else
      for i := ACol - 1 downto FixedCols do
        Dec(ARect1.Left, ColWidths[i] + VertLineWidth);

    Canvas.Pen.Color := GridLineParams.GetBrightColor;
    DrawRect := ARect1;
    BaseStartPos := ARect1.Left;
    if InstantReadCurDataNode.Level > 1 then
    begin
      ARect1.Right := ARect1.Left + (InstantReadCurDataNode.Level-1) * 18;
//      Canvas.FillRect(ARect1);
      if DataGrouping.GroupDataTree.FlatVisibleCount - 1 > AreaRow then
      begin
        NextDataNode := DataGrouping.GroupDataTree.FlatVisibleItem[AreaRow+1];
        NextLevel := NextDataNode.Level
      end else
      begin
        NextDataNode := nil;
        NextLevel := 0;
      end;
      for i := 0 to InstantReadCurDataNode.Level - 2 do
      begin
        Canvas.Brush.Color := DataGrouping.ActiveGroupLevels[InstantReadCurDataNode.Level-2-i].Color;
        if Style.IsCustomStyleActive and (Canvas.Brush.Color = clWindow) then
          Canvas.Brush.Color := FInternalColor;
        Canvas.FillRect(Rect(ARect1.Right-i*18-18, ARect1.Top, ARect1.Right-i*18, ARect1.Bottom));
        if (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
        begin
          Canvas.Pen.Color := GridLineParams.GetDataVertColor;
          DrawPolyline([Point(ARect1.Right-1-i*18, ARect1.Top),
                        Point(ARect1.Right-1-i*18, ARect1.Bottom)]);
          Canvas.Pen.Color := GridLineParams.GetDataHorzColor;
          if NextLevel + i < InstantReadCurDataNode.Level then
          begin
            DrawPolyline([Point(ARect1.Right-1-i*18, ARect1.Bottom-1),
                          Point(ARect1.Right-1-i*18-18, ARect1.Bottom-1)]);
          end;
          if (NextDataNode <> nil) and
             (NextDataNode.NodeType = dntDataGroupFooterEh) and
             (NextLevel + i = InstantReadCurDataNode.Level) and
             not DataGrouping.ShiftFolldataGroupRow then
          begin
            DrawPolyline([Point(ARect1.Right-1-i*18, ARect1.Bottom-1),
                          Point(ARect1.Right-1-i*18-18, ARect1.Bottom-1)]);
          end;
        end;
      end;
      ARect1.Left := ARect1.Right;
    end;

    Canvas.Font := InstantReadCurDataNode.DataGroupLevel.Font;
    if Style.IsCustomStyleActive and (Canvas.Font.Color = clWindowText) then
      Canvas.Font.Color := FInternalFontColor;
    Canvas.Brush.Color := InstantReadCurDataNode.DataGroupLevel.Color;
    if Style.IsCustomStyleActive and (Canvas.Brush.Color = clWindow) then
      Canvas.Brush.Color := FInternalColor;
    AColor := Canvas.Brush.Color;

    HighlightGroupDataCellColor(AreaCol, AreaRow, Value, AState, AColor, Canvas.Font);

    Canvas.Brush.Color := AColor;

    FGroupRowParams.FColor := AColor;
    FGroupRowParams.FImageList := nil;
    FGroupRowParams.FImageIndex := 0;
    FGroupRowParams.FGroupRowText := Value;
    FGroupRowParams.FFont := Canvas.Font;
    FGroupRowParams.FState := AState;
    if Assigned(FOnDataGroupGetRowParams) then
      FOnDataGroupGetRowParams(Self, InstantReadCurDataNode, FGroupRowParams);
    Canvas.Brush.Color := FGroupRowParams.Color;
    Value := FGroupRowParams.FGroupRowText;

    if False{The3DRect}
      then XFrameOffs := 1
      else XFrameOffs := 2;
    YFrameOffs := XFrameOffs;
    if Flat then Dec(YFrameOffs);
    LeftMarg := 0;
    RightMarg := 0;

    if ((InstantReadCurDataNode.DataGroupLevel.RowHeight <> 0) or
        (InstantReadCurDataNode.DataGroupLevel.RowLines <> 0)) and
        not ((FGroupRowParams.Images <> nil) and
             (FGroupRowParams.ImageIndex >= 0))
    then
    begin
      TextLayout := tlBottom;
      YFrameOffs := YFrameOffs * 2;
    end else
      TextLayout := tlTop;

    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
      ARect1.Bottom := ARect1.Bottom - DataGrouping.GroupRowDefValues.BottomLine.Width;
    ARect1.Right := ARect1.Left + 18;
    DrawRect.Left := ARect1.Right;
    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
      DrawRect.Bottom := DrawRect.Bottom - DataGrouping.GroupRowDefValues.BottomLine.Width;
    Canvas.FillRect(ARect1);
    if InstantReadCurDataNode.Expanded
      then TreeElement := tehMinus
      else TreeElement := tehPlus;

    DrawGroupTreeElement(Canvas, ARect1, TreeElement, True, 1, 1, UseRightToLeftAlignment, True);
    if InstantReadCurDataNode.Expanded then
      if not DataGrouping.ShiftFolldataGroupRow {and
        (DataGrouping.ActiveGroupLevels[DataGrouping.ActiveGroupLevelsCount-1] = GroupLevel)}
      then
        Canvas.Pen.Color := BottomLineColor
      else
      begin
        Canvas.Pen.Color := InstantReadCurDataNode.DataGroupLevel.Color;
        if Style.IsCustomStyleActive and (InstantReadCurDataNode.DataGroupLevel.Color = clWindow) then
          Canvas.Pen.Color := FInternalColor;
      end
    else
      Canvas.Pen.Color := BottomLineColor;

    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
    begin
      DrawWideLine(ARect1.Left, ARect1.Bottom, ARect1.Right, ARect1.Bottom,
        DataGrouping.GroupRowDefValues.BottomLine.Width);
    end;

    if FrozenCols > 0 then
    begin
      DrawRect.Right := DrawInfo.Horz.FixedBoundary - DrawInfo.Horz.EffectiveLineWidth;
      LeftMarg := 0;
      RightMarg := 0;
      WriteCellText(nil, Canvas, DrawRect, True,
        XFrameOffs, YFrameOffs, Value, taLeftJustify, tlTop,
        False, False, LeftMarg, RightMarg, True);
      Canvas.Pen.Color := GridLineParams.GetBrightColor;
      if GridLineParams.DataHorzLines or (dgRowLines in Options) then
        DrawPolyline([Point(DrawRect.Left-1, DrawRect.Bottom),
                      Point(DrawRect.Right, DrawRect.Bottom)]);
      DrawRect.Left := ARect1.Right - LeftColOffset;
      if ACol >= FixedRows + FrozenCols then
        DrawRect.Right := ARect.Right
      else
        DrawRect.Right := DrawInfo.Horz.FixedBoundary;
    end;

    for i := ACol+1 to FixedCols-1 do
      Inc(DrawRect.Right, ColWidths[i] + VertLineWidth);
    if GroupLevel.FooterInGroupRow and (GroupLevel.VisibleFootersCount > 0) then
    begin
      Footer := GroupLevel.VisibleFooter[0];
    end else
    begin
      Footer := nil;
    end;

    NextRight := DrawRect.Right;
    TextRect := DrawRect;

    for i := ACol+1 to LeftCol + VisibleColCount do
    begin
      if i < ColCount then
      begin
        ColIndex := RawToDataColumn(i);
        begin
          if (i = FLastVisibleCol) then
          begin
            Inc(DrawRect.Right, ColWidths[i]);
            if IsDrawCellBorder(i, ARow, cbtRightEh) then
              Dec(DrawRect.Right, GridLineWidth);
          end else
            Inc(DrawRect.Right, ColWidths[i] + HorzLineWidth);
          NextRight := DrawRect.Right;
          TextRect := DrawRect;
        end;
      end;
    end;

    FocusRect := DrawRect;
    FocusRect.Left := ARect1.Left;

    if DrawRect.Left < DrawInfo.Horz.FixedBoundary then
    begin
      LeftMarg := DrawRect.Left - DrawInfo.Horz.FixedBoundary;
      DrawRect.Left := DrawInfo.Horz.FixedBoundary;
      TextRect.Left := DrawRect.Left;
      Inc(LeftMarg, XFrameOffs);
      XFrameOffs := 0;
    end;

    GetFontData(Canvas.Font, FontData);

    TextRect := DrawRect;
    StartFooterIndent := 0;
    if Footer <> nil then
    begin
      TerminateRowLine := False;
      if VisibleColumns.Count > 0
        then FirstVisColIndex := VisibleColumns[0].Index
        else FirstVisColIndex := 0;
      for i := 0 to Columns.Count-1 do
      begin
        if (not TerminateRowLine and (Footer.ColumnItems[i].ValueType = gfvNonEh)) or
           (i <= FirstVisColIndex) then
        begin
          Inc(StartFooterIndent, ColWidths[DataToRawColumn(i)] + VertLineWidth);
          NextRight := BaseStartPos + StartFooterIndent;
        end else
        begin
          TerminateRowLine := True;
          FooterCellRect := DrawRect;
          FooterCellRect.Left := NextRight;
          FooterCellRect.Right := FooterCellRect.Left + ColWidths[DataToRawColumn(i)] + VertLineWidth;
          ColIndex := i;
          DrawFooterInfo(FooterCellRect);
          NextRight := FooterCellRect.Right;
        end;
      end;
      if StartFooterIndent > 0 then
        TextRect.Right := BaseStartPos + StartFooterIndent;
    end;

    SetFontData(FontData, Canvas.Font);
    Canvas.Brush.Color := FGroupRowParams.Color;

    if (FGroupRowParams.Images <> nil) and (FGroupRowParams.ImageIndex >= 0) then
    begin
      ImageRect := TextRect;
      ImageRect.Right := ImageRect.Left + FGroupRowParams.Images.Width + 4;
      Canvas.FillRect(ImageRect);
      ClipRect := ImageRect;
      OffsetRect(ImageRect, LeftMarg, 0);

      DrawClipped(FGroupRowParams.Images, nil, Canvas, ImageRect,
        FGroupRowParams.ImageIndex, 0, taCenter, ClipRect);

      LeftMarg := LeftMarg + FGroupRowParams.Images.Width + 4;// + 1;
      if LeftMarg > 0 then
      begin
        TextRect.Left := DrawRect.Left + LeftMarg;
        LeftMarg := 0;
      end;
    end;

    if GridBackgroundFilled and (Canvas.Brush.Color = FInternalColor)
      then FillBackground := False
      else FillBackground := True;

    WriteCellText(nil, Canvas, TextRect, FillBackground,
      XFrameOffs, YFrameOffs, Value, taLeftJustify, TextLayout,
      False, False, LeftMarg, RightMarg, True);
    Canvas.Pen.Color := BottomLineColor;
    if GridLineParams.DataHorzLines or (dgRowLines in Options) or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
      DrawWideLine(DrawRect.Left-1, DrawRect.Bottom, DrawRect.Right, DrawRect.Bottom,
        DataGrouping.GroupRowDefValues.BottomLine.Width);

    if (gdFocused in AState)
      and ({(dgAlwaysShowSelection in Options) or }Focused)
      and not (csDesigning in ComponentState)
//      and not (dgRowSelect in Options)
      and (UpdateLock = 0)
      and (ValidParentForm(Self).ActiveControl = Self)
      and Style.IsDrawFocusRect
    then
      DrawFocusRect(Canvas, FocusRect);

  end;
  FDrawnGroupList.Add(InstantReadCurDataNode);
end;

procedure TCustomDBGridEh.DrawGroupDataArea(ACol, ARow: Longint; DataCol, DataRow: Integer;
  NodeLevel: Integer; AState: TGridDrawState; var ARect: TRect;
  Draw3DRect: Boolean; CompleteBottomLines: Boolean);
var
  NextLevel: Integer;
  i: Integer;
  FromLevel: Integer;
  AExtraFirstColumnWidth: Integer;
  NextNode: TGroupDataTreeNodeEh;
  RIsDraw, BIsDraw: Boolean;
  RBorderColor, BBorderColor: TColor;
  RIsExtent, BIsExtent: Boolean;
  AVertLineWidth: Integer;
  AButtonBit: Integer;

  procedure CheckDrawCellBorderHere(ACol, ARow: Integer;
    BorderType: TGridCellBorderTypeEh; var IsDraw: Boolean;
    var BorderColor: TColor; var IsExtent: Boolean);
  begin
    CheckDrawCellBorder(ACol, ARow, BorderType, IsDraw, BorderColor, IsExtent);
    if GridLineParams.DataHorzLines then
    begin
      IsDraw := CompleteBottomLines;
    end else if DataRow < InstantReadRecordCount-1 then
    begin
      InstantReadRecordEnter(DataRow+1);
      NextNode := InstantReadCurDataNode;
      InstantReadRecordLeave;
      if NextNode.NodeType = dntDataGroupEh then
      begin
        IsDraw := True;
        BorderColor := GridLineParams.GetDataHorzColor;
      end else if NextNode.NodeType = dntDataGroupFooterEh then
      begin
        if not FooterParams.HorzLines then
          IsDraw := False
        else if FooterParams.GetHorzLineColor <> clNone then
        begin
          BorderColor := FooterParams.GetHorzLineColor;
          IsDraw := True;
        end;
        if ((ARow = RowCount) and (BorderType = cbtTopEh))
          or
           ((ARow = FullRowCount-1) and (BorderType = cbtBottomEh))
        then
          if GetColorLuminance(FooterParams.GetHorzLineColor) >
             GetColorLuminance(FooterParams.GetVertLineColor)
          then
          begin
            BorderColor := FooterParams.GetVertLineColor;
  //          IsDraw := True;
          end;
      end;
    end else
    begin
      IsDraw := True;
      if GridLineParams.GridBoundaries then
      begin
        if GridLineParams.DataBoundaryColor <> clDefault then
          BorderColor := GridLineParams.DataBoundaryColor
        else if (GridLineParams.GetDataVertColor = GridLineParams.GetDataHorzColor) and
              (GridLineParams.GetDataVertColor <> clNone)
        then
          BorderColor := GridLineParams.GetDarkColor;
      end else
        BorderColor := MightierColor(GridLineParams.GetDataVertColor, GridLineParams.GetDataHorzColor);
    end;
  end;

begin
  Canvas.Brush.Color := Color;
  if Style.IsCustomStyleActive and (Color = clWindow) then
    Canvas.Brush.Color := FInternalColor;

  Canvas.FillRect(Rect(ARect.Left, ARect.Top,
                       ARect.Left + FExtraFirstColumnWidth,
                       ARect.Bottom));

  BBorderColor := GridLineParams.GetDataHorzColor;
  RBorderColor := GridLineParams.GetDataVertColor;
  CheckDrawCellBorderHere(ACol, ARow, cbtBottomEh, BIsDraw, BBorderColor, BIsExtent);
  CheckDrawCellBorder(ACol, ARow, cbtRightEh, RIsDraw, RBorderColor, RIsExtent);
  RIsDraw := (dgRowLines in Options) or GridLineParams.DataHorzLines or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault);
  if BBorderColor = clNone then
    BBorderColor := GridLineParams.GetBrightColor;
  if RBorderColor = clNone then
    RBorderColor := GridLineParams.GetBrightColor;

  if GridLineParams.DataVertLines and (MightierColor(BBorderColor, RBorderColor) = BBorderColor)
    then AVertLineWidth := 1
    else AVertLineWidth := 0;

  Canvas.Pen.Color := BBorderColor;

  if BIsDraw then
    DrawPolyline([Point(ARect.Left+FExtraFirstColumnWidth-1, ARect.Bottom-1),
                  Point(ARect.Right+AVertLineWidth, ARect.Bottom-1)]);

  if DataGrouping.GroupDataTree.FlatVisibleCount - 1 > DataRow
    then NextLevel := DataGrouping.GroupDataTree.FlatVisibleItem[DataRow+1].Level
    else NextLevel := 0;
  FromLevel := 0;
  AExtraFirstColumnWidth := FExtraFirstColumnWidth;
  if not DataGrouping.ShiftFolldataGroupRow then
  begin
    FromLevel := 1;
    AExtraFirstColumnWidth := AExtraFirstColumnWidth + 18;
  end;

  if BIsDraw
    then AButtonBit := 1
    else AButtonBit := 0;
  for i := FromLevel to NodeLevel-2 do
  begin
    Canvas.Brush.Color := DataGrouping.ActiveGroupLevels[NodeLevel-2-i].Color;
    if Style.IsCustomStyleActive and (Color = clWindow) then
      Canvas.Brush.Color := FInternalColor;
    Canvas.FillRect(Rect(ARect.Left+AExtraFirstColumnWidth-i*18-18, ARect.Top,
                         ARect.Left+AExtraFirstColumnWidth-i*18-1, ARect.Bottom));
    if RIsDraw or (DataGrouping.GroupRowDefValues.BottomLine.Color <> clDefault) then
    begin
      Canvas.Pen.Color := RBorderColor;
      DrawPolyline([Point(ARect.Left+AExtraFirstColumnWidth-1-i*18, ARect.Top),
                    Point(ARect.Left+AExtraFirstColumnWidth-1-i*18, ARect.Bottom-AButtonBit)]);
      if (NextLevel + i < NodeLevel) and (dgRowLines in Options) then
      begin
        Canvas.Pen.Color := BBorderColor;
        if BIsDraw then
          DrawPolyline([Point(ARect.Left+AExtraFirstColumnWidth-1-i*18, ARect.Bottom-1),
                        Point(ARect.Left+AExtraFirstColumnWidth-1-i*18-18, ARect.Bottom-1)]);
      end;
    end;
    AButtonBit := 0;
  end;

  if BIsDraw then
    ARect.Bottom := ARect.Bottom - 1;
end;

procedure TCustomDBGridEh.DrawGroupFooterCell(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  Value: string;
  VarValue: Variant;
  FooterColumnItem: TGridDataGroupFooterColumnItemEh;
  AColor: TColor;
  DrawColumn: TColumnEh;
  Focused: Boolean;
  ToFooterLevel: Integer;
begin

  Focused := IsActiveControl;
  if Focused and (ARow = Row) and (ACol = Col) then
    Include(AState, gdFocused);

  DrawColumn := Columns[AreaCol];
  if (DrawColumn = VisibleColumns[0]) and not RowPanel.Active then
  begin
    ToFooterLevel := InstantReadCurDataNode.Level;
    if not DataGrouping.ShiftFolldataGroupRow {and
      (InstantReadCurDataNode.Level = DataGrouping.ActiveGroupLevelsCount+1)}
    then
      ToFooterLevel := ToFooterLevel - 1;
    DrawGroupFooterArea(AreaCol, AreaRow, InstantReadCurDataNode.Level, AState,
      ARect, ColCellParamsEh.FThe3DRect);
    ARect.Left := ARect.Left + 18 * (ToFooterLevel - 1);
    if (dgRowLines in Options) or GridLineParams.DataHorzLines or FooterParams.HorzLines then
      ARect.Bottom := ARect.Bottom - 1;
  end;
  FooterColumnItem := InstantReadCurDataNode.DataGroupFooter.ColumnItems[DrawColumn.Index];
  VarValue := InstantReadCurDataNode.FooterValues[DrawColumn.Index];
  Value := FooterColumnItem.ConvertToDisplayText(
              InstantReadCurDataNode.FooterValues[DrawColumn.Index]);
  AColor := FooterColumnItem.Color;
  Canvas.Font := FooterColumnItem.Font;

  if Style.IsCustomStyleActive and (Canvas.Font.Color = clWindowText) then
    Canvas.Font.Color := FInternalFontColor;
  if Style.IsCustomStyleActive and (AColor = clWindow) then
    AColor := FInternalColor;

  HighlightDataCellColor(AreaCol, AreaRow, Value, AState, AColor, Canvas.Font);
  Canvas.Brush.Color := AColor;

  FGroupFooterParams.FColor := AColor;
  FGroupFooterParams.FText := Value;
  FGroupFooterParams.FFont := Canvas.Font;
  FGroupFooterParams.FState := AState;
  FGroupFooterParams.FValue := VarValue;
  if Assigned(FOnDataGroupGetFooterParams) then
    FOnDataGroupGetFooterParams(Self, InstantReadCurDataNode, FooterColumnItem, FGroupFooterParams);
  Canvas.Brush.Color := FGroupFooterParams.Color;

  WriteCellText(DrawColumn, Canvas, ARect, True,
    ColCellParamsEh.FXFrameOffs, ColCellParamsEh.FYFrameOffs, Value,
    FooterColumnItem.Alignment, DrawColumn.Layout, False, DrawColumn.EndEllipsis, 0, 0, False);
end;

procedure TCustomDBGridEh.DrawGroupFooterArea(DataCol, DataRow: Integer;
  NodeLevel: Integer; AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean);
var
  NextLevel: Integer;
  i: Integer;
  AExtraFirstColumnWidth: Integer;
  ToLevel, Extra: Integer;
  NextDataNode: TGroupDataTreeNodeEh;
  ExtraLineWidth: Integer;
//  CheckDrawVLine: Boolean;
  CheckDrawHLine: Boolean;

  procedure DrawLineInRect(X1,Y1,X2,Y2: Integer; ARect: TRect);
  begin
    if X1 < X2 then
    begin
      if ARect.Left > X1 then
        X1 := ARect.Left;
    end else
      if ARect.Left-1 > X2 then
        X2 := ARect.Left-1;
    DrawPolyline([Point(X1, Y1), Point(X2, Y2)]);
  end;

begin
  Canvas.Brush.Color := Color;
  if Style.IsCustomStyleActive and (Canvas.Brush.Color = clWindow) then
    Canvas.Brush.Color := FInternalColor;

  AExtraFirstColumnWidth := 18 * (NodeLevel - 1);
  ToLevel := NodeLevel;
  Extra := 0;
  if not DataGrouping.ShiftFolldataGroupRow {and
    (InstantReadCurDataNode.Level = DataGrouping.ActiveGroupLevelsCount+1)} then
  begin
    ToLevel := ToLevel - 1;
    AExtraFirstColumnWidth := AExtraFirstColumnWidth - 18;
  end;
  Canvas.FillRect(Rect(ARect.Left, ARect.Top,
                       ARect.Left + AExtraFirstColumnWidth,
                       ARect.Bottom));
  Canvas.Pen.Color := FooterParams.GetHorzLineColor;

//  CheckDrawVLine := (dgColLines in Options) or GridLineParams.DataVertLines or FooterParams.VertLines;
  CheckDrawHLine := (dgRowLines in Options) or GridLineParams.DataHorzLines or FooterParams.HorzLines;

  if CheckDrawHLine then
    DrawLineInRect(ARect.Left+AExtraFirstColumnWidth-1, ARect.Bottom-1,
                   ARect.Right, ARect.Bottom-1,
                   ARect);
  ExtraLineWidth := 0;
  if DataGrouping.GroupDataTree.FlatVisibleCount - 1 > DataRow then
  begin
    NextDataNode := DataGrouping.GroupDataTree.FlatVisibleItem[DataRow+1];
    NextLevel := NextDataNode.Level;
    if (NextDataNode.NodeType <> dntDataGroupFooterEh) and
       not DataGrouping.ShiftFolldataGroupRow
    then
      Extra := 1;
    if NextDataNode.NodeType <> dntDataGroupFooterEh then
      NextDataNode := nil;
  end else
  begin
    NextDataNode := nil;
    NextLevel := 0;
  end;

  for i := 0 to ToLevel - 2 do
  begin
    Canvas.Brush.Color := DataGrouping.ActiveGroupLevels[NodeLevel-2-i].Color;
    if Style.IsCustomStyleActive and (Canvas.Brush.Color = clWindow) then
      Canvas.Brush.Color := FInternalColor;

    Canvas.FillRect(Rect(ARect.Left+AExtraFirstColumnWidth-i*18-18, ARect.Top,
                         ARect.Left+AExtraFirstColumnWidth-i*18-1, ARect.Bottom));
    if CheckDrawHLine then
    begin
      DrawPolyline([Point(ARect.Left+AExtraFirstColumnWidth-1-i*18, ARect.Top),
                    Point(ARect.Left+AExtraFirstColumnWidth-1-i*18, ARect.Bottom - ExtraLineWidth)]);
      if NextLevel + i + Extra < NodeLevel then
      begin
        if NextDataNode = nil then
          Canvas.Pen.Color := GridLineParams.GetBrightColor;
        DrawLineInRect(ARect.Left+AExtraFirstColumnWidth-1-i*18-1, ARect.Bottom-1,
                       ARect.Left+AExtraFirstColumnWidth-1-i*18-18-1, ARect.Bottom-1,
                       ARect);
      end;
    end;
    if (NextDataNode <> nil) and (NextDataNode.NodeType = dntDataGroupFooterEh) then
      ExtraLineWidth := VertLineWidth;
    Canvas.Pen.Color := GridLineParams.GetBrightColor;
  end;
end;

procedure TCustomDBGridEh.DataGroupsGotoRecordViewNo(RecViewNo: Integer; IsExpandToView: Boolean);
var
  GroupNode: TGroupDataTreeNodeEh;
begin
  GroupNode := TGroupDataTreeNodeEh(DataGrouping.GroupDataTree.GetFirstVisible);
  while GroupNode <> nil do
  begin
    if (GroupNode.NodeType = dntDataSetRecordEh) and
       (GroupNode.DataSetRecordViewNo = RecViewNo) then
    begin
      if IsExpandToView
        then SetCurGroupDataNode(GroupNode, True)
        else CheckSetCurGroupDataNode(GroupNode, True);
      Exit;
    end;
    GroupNode := TGroupDataTreeNodeEh(DataGrouping.GroupDataTree.GetNextVisible(GroupNode, False));
  end;
  if IsExpandToView
    then SetCurGroupDataNode(nil, True)
    else CheckSetCurGroupDataNode(nil, True);
end;

function TCustomDBGridEh.DataGroupsMoveBy(Distance: Integer; NewOnEof: Boolean): Integer;
var
  GDTree: TGridGroupDataTreeEh;
  CurPos: Integer;
  KeyValue: Variant;
  HighBound: Integer;
begin
  FCurGroupDataListEof := False;
  Result := Distance;
  GDTree := DataGrouping.GroupDataTree;
  CurPos := GDTree.IndexOfVisibleNode(FCurGroupDataNode);
  DataLink.UpdateData;
  if (Result <> 0) and
     DataLink.Active and
     (DataLink.DataSet.State in dsEditModes)
//     and CheckRecordChanging(CurPos + Result)
     then
    if DataLink.DataSet.Modified
      then DataLink.DataSet.Post
      else DataLink.DataSet.Cancel;
  if GDTree.FlatVisibleCount > 0 then
  begin
    if Result > 0 then
    begin
      FCurGroupDataListBof := False;
      if CurPos + Result >= GDTree.FlatVisibleCount then
      begin
        FCurGroupDataListEof := True;
        if (FCurGroupDataNode.NodeType in [dntDataSetRecordEh{, dntDataGroupFooterEh}]) and
           (GDTree.FlatVisibleItem[GDTree.FlatVisibleCount-1] = FCurGroupDataNode) then
        begin
          Result := 0;
          KeyValue := DataGrouping.GetKeyValueForViewRecNo(FIntMemTable.InstantReadCurRowNum);
          HighBound := VarArrayHighBound(KeyValue, 1);
          KeyValue[HighBound] := KeyValue[HighBound] + 1; //Make appending, not inserting
          DataGrouping.SetInsertingKeyValue(KeyValue);
          if NewOnEof then
            if FIntMemTable.InstantReadCurRowNum = FIntMemTable.InstantReadRowCount-1 then
            begin
              DataLink.DataSet.Append;
            end else if NewOnEof then
            begin
              DataLink.DataSet.Next;
              DataLink.DataSet.Insert;
            end;
          Exit;
        end else
          Result := GDTree.FlatVisibleCount - CurPos - 1;
      end;
      SetCurGroupDataNode(GDTree.FlatVisibleItem[CurPos + Result], True);
    end else
    begin
      if CurPos + Result < 0 then
      begin
        Result := -CurPos;
        FCurGroupDataListBof := True;
      end;
      SetCurGroupDataNode(GDTree.FlatVisibleItem[CurPos + Result], True);
    end
  end else
  begin
    FCurGroupDataListBof := True;
    FCurGroupDataListEof := True;
  end;
  UpdateDatasetPosFromRowPos;
end;

procedure TCustomDBGridEh.UpdateDatasetPosFromRowPos;
var
  OldRecNo, NewRecNo: Integer;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
  FirstGroupDataNode: TGroupDataTreeNodeEh;
begin
  if not DataLink.Active then Exit;
  if FInternalUpdatingDatasetPos then Exit;
  OldRecNo := DataLink.DataSet.RecNo;
  if DataGrouping.IsGroupingWorks and (FCurGroupDataNode <> nil) then
  begin
    ADrawGroupDataNode := FCurGroupDataNode;
    FirstGroupDataNode := ADrawGroupDataNode;
    while not (ADrawGroupDataNode.NodeType = dntDataSetRecordEh) {and
      (ADrawGroupDataNode.Count > 0)} do
    begin
      if FirstGroupDataNode.NodeType = dntDataGroupFooterEh then
        ADrawGroupDataNode := TGroupDataTreeNodeEh(ADrawGroupDataNode.Owner.GetPrevious(ADrawGroupDataNode))
      else if ADrawGroupDataNode.Count > 0 then
        ADrawGroupDataNode := ADrawGroupDataNode.Items[0];
    end;
    NewRecNo := ADrawGroupDataNode.DataSetRecordViewNo + 1;
    FInternalUpdatingDatasetPos := True;
    try
      if OldRecNo > 0
        then DataLink.DataSet.MoveBy(NewRecNo-OldRecNo)
        else DataLink.DataSet.RecNo := NewRecNo;
    finally
      FInternalUpdatingDatasetPos := False;
    end;
  end;
end;

procedure TCustomDBGridEh.UpdateDatasetPosFromGroupNode(GroupNode: TGroupDataTreeNodeEh);
begin
end;

procedure TCustomDBGridEh.CheckSetCurGroupDataNode(
  ACurGroupDataNode: TGroupDataTreeNodeEh; ShowInView: Boolean);
var
  VisibleNode: TGroupDataTreeNodeEh;
begin
  if ACurGroupDataNode = nil then
  begin
    FCurGroupDataNode := nil;
    Exit;
  end;
  VisibleNode := ACurGroupDataNode;
  while (VisibleNode.Parent <> DataGrouping.GroupDataTree.Root) and
     not DataGrouping.GroupDataTree.GetPathVisible(VisibleNode, True) do
  begin
    VisibleNode := TGroupDataTreeNodeEh(VisibleNode.Parent);
  end;
  SetCurGroupDataNode(VisibleNode, ShowInView);
end;

procedure TCustomDBGridEh.SetCurGroupDataNode(
  ACurGroupDataNode: TGroupDataTreeNodeEh; ShowInView: Boolean);
var
  GroupNode, ParentNode, LastCurGroupDataNode: TGroupDataTreeNodeEh;
  DataRowNo: Integer;
  OldTopRow, NewRow: Integer;
  ShowCol: Boolean;
  Field: TField;
begin
//  if ACurGroupDataNode <> FCurGroupDataNode then
  begin
    LastCurGroupDataNode := FCurGroupDataNode;
    GroupNode := TGroupDataTreeNodeEh(DataGrouping.GroupDataTree.GetFirstVisible);
    while GroupNode <> nil do
    begin
      if GroupNode = ACurGroupDataNode then
      begin
        FCurGroupDataNode := GroupNode;
        ParentNode := GroupNode;
        while ParentNode.Parent <> DataGrouping.GroupDataTree.Root do
        begin
          ParentNode := TGroupDataTreeNodeEh(ParentNode.Parent);
          ParentNode.Expanded := True;
        end;
        Break;
      end;
      GroupNode := TGroupDataTreeNodeEh(DataGrouping.GroupDataTree.GetNextVisible(GroupNode, False));
    end;

    DataRowNo := DataGrouping.GroupDataTree.IndexOfVisibleNode(FCurGroupDataNode);

    OldTopRow := TopRow;
    NewRow := DataRowNo + TopDataOffset;
    if NewRow >= RowCount then
      NewRow := FixedRows;
    if Row <> NewRow then
    begin
      InvalidateRow(Row);
      if {not (dgAlwaysShowEditor in Options) and}
        ((ACurGroupDataNode <> nil) and (ACurGroupDataNode.NodeType <> dntDataSetRecordEh))
      then
        HideEditor;
      ShowCol := not FLockAutoShowCurCell and
                 not RowPanel.Active and
                 (ACurGroupDataNode.NodeType = dntDataSetRecordEh) and
                 ShowInView;
      MoveColRow(Col, NewRow, False, ShowCol, ShowInView);
      if RowPanel.Active then
        ClampInViewRowPanelCell(SelectedIndex);
      InvalidateEditor;
      InvalidateRow(NewRow);
      UpdateDatasetPosFromRowPos;      
    end;
  //      Columns[SelectedIndex].Field := nil; //Some time AV BUG
    if    (SelectedIndex >= 0)
      and not (Columns[SelectedIndex].GetColumnType in [ctKeyImageList..ctCheckboxes])
      and (dgAlwaysShowEditor in Options)
      and  not FilterEditMode
    then
      ShowEditor;

    if InplaceEditorVisible then
    begin
      Field := SelectedField;
      if Assigned(Field) and (Field.Text <> FEditText) then
        InvalidateEditor;
    end;
    if HaveHideDuplicates and (OldTopRow <> TopRow) then
    begin
      GridInvalidateRow(Self, TopRow);
      GridInvalidateRow(Self, OldTopRow);
    end;

    if LastCurGroupDataNode <> FCurGroupDataNode then
    begin
      if FHorzScrollBarPanelControl.Visible then
        FHorzScrollBarPanelControl.DataSetChanged;
      if FVertScrollBarPanelControl.Visible then
        FVertScrollBarPanelControl.DataSetChanged;
    end;
  end;
end;

function TCustomDBGridEh.CalcHeightForGroupNode(
  ADrawGroupDataNode: TGroupDataTreeNodeEh): Integer;
var
  DataGroup: TGridDataGroupLevelEh;
  ImageDataHeight: Integer;
  DataGroupFooter: TGridDataGroupFooterEh;
  i: Integer;
begin
  Result := 0;
  if not HandleAllocated then Exit;
  if ADrawGroupDataNode.NodeType = dntDataGroupEh then
  begin
    DataGroup := ADrawGroupDataNode.DataGroupLevel;
    if not HandleAllocated or
      ((DataGroup.RowHeight = 0) and
       (DataGroup.RowLines = 0)) then
    begin
  //    Result := CalcStdDefaultRowHeight;
      Canvas.Font := DataGroup.Font;
      Result := Canvas.TextHeight('Wg');
      if Flat
        then Result := Result + 1
        else Result := Result + 3;
      if (dgRowLines in Options) or GridLineParams.DataHorzLines then
        Inc(Result, GridLineWidth);
      Exit;
    end;
    if HandleAllocated and (DataGroup.RowLines > 0) then
    begin
      Canvas.Font := DataGroup.Font;
      Result := Canvas.TextHeight('Wg') * DataGroup.RowLines;
    end;
    Result := Result + DataGroup.RowHeight;
  end else if ADrawGroupDataNode.NodeType = dntDataGroupFooterEh then
  begin
    DataGroupFooter := ADrawGroupDataNode.DataGroupFooter;
    for i := 0 to DataGroupFooter.ColumnItems.Count-1 do
    begin
      Canvas.Font := DataGroupFooter.ColumnItems[i].Font;
      Result := Canvas.TextHeight('Wg');
      if (FooterParams.RowLines <> 0) or (FooterParams.RowHeight <> 0) then
        Result := Result * FooterParams.RowLines + FooterParams.RowHeight
      else
      begin
        if Flat
          then Result := Result + 1
          else Result := Result + 3;
        if dgRowLines in Options then
          Inc(Result, GridLineWidth);
      end;
    end;
  end;

  ImageDataHeight := 0;
  if ADrawGroupDataNode.NodeType = dntDataGroupEh then
    if Assigned(OnDataGroupGetRowParams) then
    begin
      FIntMemTable.InstantReadEnter(ADrawGroupDataNode.DataSetRecordViewNo);
      try
        FGroupRowParams.FColor := clBlack;
        FGroupRowParams.FImageList := nil;
        FGroupRowParams.FImageIndex := 0;
        FGroupRowParams.FGroupRowText := ADrawGroupDataNode.DataGroupLevel.GetGroupRowText(ADrawGroupDataNode);
        FGroupRowParams.FFont := Canvas.Font;
        FGroupRowParams.FState := [];
        if Assigned(FOnDataGroupGetRowParams) then
          FOnDataGroupGetRowParams(Self, ADrawGroupDataNode, FGroupRowParams);
        if FGroupRowParams.FImageList <> nil then
          ImageDataHeight := FGroupRowParams.FImageList.Height + 2;
      finally
        FIntMemTable.InstantReadLeave;
      end;
    end;

  if ImageDataHeight > Result then
    Result := ImageDataHeight;
end;

function TCustomDBGridEh.HighlightGroupDataCellColor(DataCol, DataRow: Integer;
  const Value: string; AState: TGridDrawState; var AColor: TColor;
  AFont: TFont): Boolean;
var
  AFocused: Boolean;
  HighlightTextColor: TColor;
begin
//  if not Result then
  begin
    AFocused := Focused and (dghHighlightFocus in OptionsEh);
    if DataRow + TopDataOffset = Row then
    begin
      AFocused := True;
      AState := AState + [gdSelected];
    end;
    Result := ( (gdSelected in AState) or (DataRow + TopDataOffset = Row) ) and
              ( (dgAlwaysShowSelection in Options) or (AFocused) )
        { updatelock eliminates flicker when tabbing between rows }
            and (UpdateLock = 0);
  end;
  if Result then
    if IsSelectionActive then
    begin
      AColor := Style.GetSelectionColor;
      HighlightTextColor := Style.GetSelectionFontColor;
{$IFDEF EH_LIB_16}
      if Style.IsCustomStyleActive then
      begin
        StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecTextColor, HighlightTextColor);
        StyleServices.GetElementColor(StyleServices.GetElementDetails(tgClassicCellSelected), ecFillColor, AColor);
      end;
{$ENDIF}
      AFont.Color := HighlightTextColor;
    end else if (DataRow + TopDataOffset = Row) and
                ( (dgAlwaysShowSelection in Options) or AFocused ) then
    begin
      AColor := Style.GetSelectionInactiveColor;
      AFont.Color := Style.GetSelectionFontColor;
    end else
      AColor := clBtnFace;
end;

procedure TCustomDBGridEh.KeyDownInGroupDataNode(var Key: Word; Shift: TShiftState);

  procedure Tab(GoForward: Boolean);
  var
    NextCol: TColumnEh;
  begin
    CheckClearSelection;
    BeginUpdate; { Prevent highlight flicker on tab to next/prior row }
    try
      NextCol := nil;
      if GoForward then
      begin
        MoveBy(1);
        if FCurGroupDataNode.NodeType <> dntDataGroupEh then
          NextCol := Columns.GetFirstTabColumn;
      end else
      begin
        MoveBy(-1);
        if FCurGroupDataNode.NodeType <> dntDataGroupEh then
          NextCol := Columns.GetLastTabColumn;
      end;
      if NextCol <> nil then
        SelectedIndex := NextCol.Index;
    finally
      EndUpdate;
    end;
  end;

begin
  if (Shift * [ssShift, ssAlt, ssCtrl]) = [] then
    case Key of
      VK_UP: MoveBy(-1);
      VK_DOWN: MoveBy(1);
      VK_LEFT: if FCurGroupDataNode.Expanded = True
                then FCurGroupDataNode.Expanded := False
                else SafeSmoothScrollData(-GetHorzScrollStep, 0);
      VK_SUBTRACT: FCurGroupDataNode.Expanded := False;
      VK_RIGHT: if FCurGroupDataNode.Expanded = False
                  then FCurGroupDataNode.Expanded := True
                  else SafeSmoothScrollData(GetHorzScrollStep, 0);
      VK_ADD: FCurGroupDataNode.Expanded := True;
      VK_HOME: ;
      VK_END: ;
      VK_NEXT: MoveBy(VisibleDataRowCount);
      VK_PRIOR: MoveBy(-VisibleDataRowCount);
      VK_INSERT:
        if DataLink.Active and DataLink.DataSet.CanModify and (not ReadOnly) and (dgEditing in Options) then
        begin
          CheckClearSelection;
          if FCurGroupDataNode.CanAppendDataRec then
            FCurGroupDataNode.AppendDataRec(FIntMemTable, DataLink.DataSet);
        end;
      VK_TAB: Tab(True);
      VK_RETURN: ;
      VK_ESCAPE:
        begin
          DataLink.Reset;
          ClearSelection;
          if not (dgAlwaysShowEditor in Options) then HideEditor;
          if (FGridState in [gsColMoving, gsRowSizing, gsColSizing]) or
            (FDBGridEhState in [dgsColSizing, dgsRowMoving, dgsGroupPanelTitleMoving] )
            then Perform(WM_CANCELMODE, 0, 0);
        end;
      VK_F2: ;
      VK_DELETE: ;
      VK_MULTIPLY: FCurGroupDataNode.Expanded := not FCurGroupDataNode.Expanded;
    end
  else if (Shift * [ssShift, ssAlt, ssCtrl]) = [ssCtrl] then
    case Key of
      VK_SUBTRACT:
        FCurGroupDataNode.DataGroupLevel.CollapseNodes;
      VK_ADD:
        FCurGroupDataNode.DataGroupLevel.ExtractNodes;
      VK_MULTIPLY:
        if FCurGroupDataNode.Expanded
          then FCurGroupDataNode.DataGroupLevel.CollapseNodes
          else FCurGroupDataNode.DataGroupLevel.ExtractNodes;
    end
  else
    case Key of
      VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
    end;
end;

procedure TCustomDBGridEh.KeyDownInGroupFooterNode(var Key: Word; Shift: TShiftState);
var
  TargetGroupDataNode: TGroupDataTreeNodeEh;

  procedure Tab(GoForward: Boolean);
  var
    NextCol: TColumnEh;
  begin
    CheckClearSelection;
    BeginUpdate; { Prevent highlight flicker on tab to next/prior row }
    try
      NextCol := Columns.GetNextTabColumn(Columns[SelectedIndex], GoForward);
      if NextCol = Columns[SelectedIndex] then
      begin
        if GoForward then
        begin
          MoveBy(1);
          NextCol := Columns.GetFirstTabColumn;
        end else
        begin
          MoveBy(-1);
          NextCol := Columns.GetLastTabColumn;
        end;
        if NextCol <> nil then
          SelectedIndex := NextCol.Index;
      end else if NextCol <> nil then
        SelectedIndex := NextCol.Index;
    finally
      EndUpdate;
    end;
  end;

begin
  if (Shift * [ssShift, ssAlt, ssCtrl]) = [] then
    case Key of
      VK_UP: MoveBy(-1);
      VK_DOWN: MoveBy(1);
      VK_LEFT:
          if dgRowSelect in Options then
          begin
//
          end else
          begin
            CheckClearSelection;
            if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh)
              then SelectedIndex := Columns.GetNextHorzColumn(Columns[SelectedIndex], False, False, False).Index
              else MoveCol(SelectedIndex - 1, -1, False);
          end;
      VK_RIGHT:
          if dgRowSelect in Options then
          begin
//            inherited KeyDown(Key, Shift);
          end else
          begin
            CheckClearSelection;
            if RowPanel.Active and (RowPanel.NavKeysNavigationType = rpntCellToCellEh)
              then SelectedIndex := Columns.GetNextHorzColumn(Columns[SelectedIndex], True, False, False).Index
              else MoveCol(SelectedIndex + 1, 1, False);
          end;
        VK_HOME:
          MoveCol(0, 1, False);
        VK_END:
          MoveCol(Columns.Count - 1, -1, False);
        VK_INSERT:
          if DataLink.Active and DataLink.DataSet.CanModify and (not ReadOnly) and (dgEditing in Options) then
          begin
            CheckClearSelection;
            if FCurGroupDataNode.CanAppendDataRec then
            begin
              TargetGroupDataNode := FCurGroupDataNode.Parent;
              TargetGroupDataNode.AppendDataRec(FIntMemTable, DataLink.DataSet);
            end;
          end;
      VK_NEXT: MoveBy(VisibleDataRowCount);
      VK_PRIOR: MoveBy(-VisibleDataRowCount);
      VK_TAB: Tab(True);
    end
  else
    case Key of
      VK_TAB: if not (ssAlt in Shift) then Tab(not (ssShift in Shift));
    end;
end;

procedure TCustomDBGridEh.DataInsert;
begin
  if DataGrouping.IsGroupingWorks then
  begin
    DataGrouping.SetInsertingKeyValue(DataGrouping.GetKeyValueForViewRecNo(FIntMemTable.InstantReadCurRowNum));
  end;
  DataLink.DataSet.Insert;
end;

procedure TCustomDBGridEh.DataAppend;
begin
  DataLink.DataSet.Append;
end;

procedure TCustomDBGridEh.GroupPanelVisibleChanged;
begin
  LayoutChanged;
  if DataGrouping.GroupPanelVisible then
  begin
    ResetGroupPanel;
    UpdateOutBoundaryIndents;
  end else
    UpdateOutBoundaryIndents;
  LayoutChanged;
end;

procedure TCustomDBGridEh.DrawTopOutBoundaryGroupCaption(
  ARect: TRect; GroupLevel: TGridDataGroupLevelEh);
const
  SortMarkers: array[TSortOrderEh] of TSortMarkerEh = (smUpEh, smDownEh);
var
  Column: TColumnEh;
  CaptionText: String;
  GroupRect, AFillRect: TRect;
  The3DRect: Boolean;
  ADrawByThemes: Boolean;
  ATitleState: TDBGirdDrawTitleStateEh;
  AState: TGridDrawState;
  AFrameRect: TRect;
begin
  The3DRect := dghFixed3D in OptionsEh;
  ADrawByThemes := ThemesEnabled and (TitleParams.GetActualFillStyle = cfstThemedEh);

  Column := TColumnEh(GroupLevel.Column);
  CaptionText := Column.Title.Caption;
  GroupRect := ARect;

  Canvas.Brush.Color := GridLineParams.GetDarkColor;
  AFrameRect := GroupRect;
  if UseRightToLeftAlignment then
    SwapInt(AFrameRect.Left, AFrameRect.Right);
  Canvas.FrameRect(AFrameRect);
  Canvas.Brush.Color := Color;

  AFillRect := GroupRect;
  InflateRect(AFillRect, -1, -1);

  ATitleState.Down := (FDBGridEhState = dgsGroupPanelTitleDown) and
                      (FPressedDataGroupLevelIdx = GroupLevel.Index) and
                       FPressed;
  ATitleState.MultyTitle := False;
  ATitleState.WordWrap := False;
  ATitleState.FilterButtonDown := False;
  ATitleState.Highlight := False;
  ATitleState.Orientation := tohHorizontal;
  ATitleState.The3DRect := The3DRect;
  ATitleState.DrawByThemes := ADrawByThemes;
  ATitleState.DrawByThemesOverLines := ATitleState.DrawByThemes and
    (Style.ThemeTitleFillElement = gtfeSplitButtonEh);
  ATitleState.Caption := Column.Title.Caption;
  ATitleState.BackColor := Column.Title.Color;
  ATitleState.DrawFilterButton := STFilter.Visible and (STFilter.Location = stflInTitleFilterEh);
  ATitleState.CellMultiSelected := False;
//  ATitleState.SortMarker := Column.Title.SortMarker;
  ATitleState.SortMarker := SortMarkers[GroupLevel.SortOrder];
  ATitleState.DrawSortIndex := False;
  ATitleState.FontCharset := {Column.Title.}Font.Charset;
  ATitleState.FontColor := {Column.Title.}Font.Color;
  ATitleState.FontHeight := {Column.Title.}Font.Height;
  ATitleState.FontName := {Column.Title.}Font.Name;
  ATitleState.FontStyle := {Column.Title.}Font.Style;
  ATitleState.VertBorderInFillStyle := False;
  ATitleState.HorzBorderInFillStyle := False;

  AState := [gdFixed];
  if IsMouseInRect(AFillRect) then
    Include(AState, gdHotTrack);

  DrawTitleCellState(Column, AFillRect, AState, ATitleState);

{$IFDEF EH_LIB_6}
  if (csDesigning in ComponentState) and
      Assigned(DBGridEhDesigntControler) and
      (FNoDesigntControler = False) and
     DBGridEhDesigntControler.ControlIsObjInspSelected(GroupLevel)
  then
    DBGridEhDesigntControler.DrawDesignSelectedBorder(Canvas, ARect);
{$ENDIF}
end;

procedure TCustomDBGridEh.DrawTopOutBoundaryData(ARect: TRect);
var
  k: Integer;
  GroupRect: TRect;
  OSize: TSize;
begin
  if SearchPanel.Visible then
    Inc(ARect.Top, SearchPanel.InGridVertCaptureSize);
  if not DataGrouping.GroupPanelVisible then Exit;  
  Canvas.Brush.Color := DataGrouping.GroupPanel.GetColor;
  Canvas.FillRect(ARect);
  Canvas.Pen.Color := TitleParams.GetHorzLineColor;
  DrawPolyline([Point(ARect.Left, ARect.Bottom-1), Point(ARect.Right, ARect.Bottom-1)]);

  Canvas.Font := Self.Font;
  OSize.cx := Canvas.TextWidth('o');
  OSize.cy := OSize.cx * 2 div 3;
  GroupRect.Top := OSize.cy;
  GroupRect.Left := OSize.cx;

  if DataGrouping.ActiveGroupLevelsCount = 0 then
  begin
    Canvas.Font.Color := ApproximateColor(GridLineParams.GetDarkColor, Font.Color, 128);
//    Canvas.Font.Color := cl3DDkShadow;
    Canvas.TextOut((ARect.Bottom - ARect.Top) div 6, ARect.Top + ((ARect.Bottom - ARect.Top) div 6), SGroupingPanelText);
    Exit;
  end;

  for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
  begin
    if DataGrouping.ActiveGroupLevels[k].Column <> nil then
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);

      DrawTopOutBoundaryGroupCaption(GroupRect, DataGrouping.ActiveGroupLevels[k]);
      if k <> DataGrouping.ActiveGroupLevelsCount-1 then
      begin
        Canvas.Pen.Color := GridLineParams.GetDarkColor;
        DrawPolyline([Point(GroupRect.Right - OSize.cx, GroupRect.Bottom),
                  Point(GroupRect.Right - OSize.cx, GroupRect.Bottom+OSize.cy),
                  Point(GroupRect.Right + OSize.cy, GroupRect.Bottom+OSize.cy)]);
      end;
      OffsetRect(GroupRect, GroupRect.Right - GroupRect.Left + OSize.cy, (GroupRect.Bottom - GroupRect.Top) div 2);
    end;
  end;
{$IFDEF EH_LIB_6}
  if (csDesigning in ComponentState) and
      Assigned(DBGridEhDesigntControler) and
      (FNoDesigntControler = False) and
     DBGridEhDesigntControler.ControlIsObjInspSelected(DataGrouping)
  then
    DBGridEhDesigntControler.DrawDesignSelectedBorder(Canvas, ARect);
{$ENDIF}
end;

procedure TCustomDBGridEh.DrawEmptySpace(ACol, ARow: Longint;
  StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh);
begin
  if not GridBackgroundFilled then
  begin
    Canvas.Brush.Color := FInternalColor;
    Canvas.FillRect(Rect(StartX, StartY, StopX+1, StopY+1));
  end;

  if (goExtendVertLines in (inherited Options)) and (ACol >= 0) then
    DrawEmptySubDataInfo(ACol, StartX, StartY, StopX, StopY, DrawInfo);
end;

procedure TCustomDBGridEh.DrawEmptySubDataInfo(ACol: Longint;
  StartX, StartY, StopX, StopY: Integer; DrawInfo: TGridDrawInfoEh);
var
  i: Integer;
  HLinePos, PrevHLinePos: Integer;
  StartPost, FinishPost: Integer;
  AFromColor: TColor;
  AToColor: TColor;
  Column: TColumnEh;
  LastDrawCell: Integer;
  IsExtent: Boolean;
  IsDrawBorder: Boolean;
  DataColumnIndex: Integer;

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

  procedure FillEmptyColumnData(AFromColor, AToColor: TColor; FromPoint, ToPoint: TPoint);
  begin
    if GridLineParams.VertEmptySpaceStyle = dessGradiendEh then
      FillGradient(Canvas, Rect(FromPoint.X, FromPoint.Y, ToPoint.X+1, ToPoint.Y), AFromColor, AToColor)
    else
    begin
      Canvas.Brush.Color := AFromColor;
      Canvas.FillRect(Rect(FromPoint.X, FromPoint.Y, ToPoint.X+1, ToPoint.Y+1));
    end;
  end;

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

        CheckDrawCellBorder(i, RowCount-1, cbtLeftEh, IsDrawBorder, AFromColor, IsExtent);
        if IsDrawBorder then
        begin
          AToColor := FInternalColor;

          DrawLine(AFromColor, AToColor,
            Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
         end;
      end;
      Inc(HLinePos, ColWidths[DrawInfo.Horz.FixedCellCount-1]+VertLineWidth);
      if CheckLine(FixedCols-1, RowCount-1, True) then
      begin
        CheckDrawCellBorder(FixedCols-1, RowCount-1, cbtRightEh, IsDrawBorder, AFromColor, IsExtent);
        DrawLine(AFromColor, FInternalColor,
          Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
      end;
    end;
  end;

  if (StopX > DrawInfo.Horz.FixedBoundary) and (StartX <= DrawInfo.Horz.FixedBoundary) then
  begin
    HLinePos := DrawInfo.Horz.OutViewVisCellStart-GridLineWidth;
    LastDrawCell := DrawInfo.Horz.LastFullVisibleCell;
    if LastDrawCell < DrawInfo.Horz.GridCellCount-1 then
      Inc(LastDrawCell);
    for i := DrawInfo.Horz.FirstGridCell to LastDrawCell do
    begin
      PrevHLinePos := HLinePos;
      Inc(HLinePos, ColWidths[i]+VertLineWidth);
      if HLinePos = PrevHLinePos then
        Continue;

      DataColumnIndex := RawToDataColumn(i);
      if DataColumnIndex >= 0 then
      begin
        Column := Columns[RawToDataColumn(i)];
        if (Column <> nil) and (Column.Color <> Color) then
          FillEmptyColumnData(Column.Color, FInternalColor,
            Point(PrevHLinePos+1, StartPost), Point(HLinePos-1, FinishPost));
      end;

      if not CheckLine(i, RowCount-1, True) then
          Continue;
      if GridLineParams.GridBoundaries and (i = ColCount-1)
        then AFromColor := GridLineParams.GetDataBoundaryColor
        else AFromColor := GridLineColors.GetBrightColor;

      CheckDrawCellBorder(i, RowCount-1, cbtLeftEh, IsDrawBorder, AFromColor, IsExtent);
      if IsDrawBorder then
        DrawLine(AFromColor, FInternalColor,
          Point(HLinePos, StartPost), Point(HLinePos, FinishPost));

    end;
  end;

  if StopX >= DrawInfo.Horz.ContraExtent then
  begin
    if DrawInfo.Horz.ContraCelCount > 0 then
    begin
      HLinePos := DrawInfo.Horz.ContraExtent-1;
      CheckDrawCellBorder(ColCount, RowCount-1, cbtLeftEh, IsDrawBorder, AFromColor, IsExtent);
      if IsDrawBorder then
        DrawLine(AFromColor, FInternalColor,
          Point(HLinePos+1, StartPost), Point(HLinePos+1, FinishPost));
      if CheckPersistentContraLine(cbtLeftEh) then
        Inc(HLinePos, GridLineWidth);
      for i := DrawInfo.Horz.GridCellCount to DrawInfo.Horz.FullGridCellCount-1 do
      begin
        Inc(HLinePos, ColWidths[i]+VertLineWidth);
        CheckDrawCellBorder(i, RowCount-1, cbtRightEh, IsDrawBorder, AFromColor, IsExtent);
        if IsDrawBorder then
          DrawLine(AFromColor, FInternalColor,
            Point(HLinePos, StartPost), Point(HLinePos, FinishPost));
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.MouseDownInOutBoundary(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  k: Integer;
  GroupRect, StateRect: TRect;
  Column: TColumnEh;
  EnableClick: Boolean;
begin
  if Button <> mbLeft then Exit;
  for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
  begin
    if DataGrouping.ActiveGroupLevels[k].Column <> nil then
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      if UseRightToLeftAlignment then
      begin
        GroupRect.Right := ClientWidth - DataGrouping.ActiveGroupLevels[k].GroupPanelRect.Left;
        GroupRect.Left := ClientWidth - DataGrouping.ActiveGroupLevels[k].GroupPanelRect.Right;
      end;
      InflateRect(GroupRect,-1,-1);
      if PtInRect(GroupRect, Point(X, Y)) then
      begin
        Column := TColumnEh(DataGrouping.ActiveGroupLevels[k].Column);
        if STFilter.Visible and (STFilter.Location = stflInTitleFilterEh) and
           CheckTitleCellFilterButtonPos(Point(X, Y), GroupRect, Column, StateRect) and
           not (csDesigning in ComponentState) then
        begin
          FTrackingStateRect := StateRect;
          if FInTitleFilterListboxVisible then
            InTitleFilterListboxCloseUp(False)
          else
          begin
            FInTitleFilterListboxGroupLevel := DataGrouping.ActiveGroupLevels[k];
            InTitleFilterListboxDropDownForRect(Column, GroupRect);
          end;
          WindowsInvalidateRect(Handle, GroupRect, False);
        end else
        begin
          EnableClick := Column.Title.TitleButton;
          CheckTitleButton(Column.Index, EnableClick);
          if EnableClick and not (csDesigning in ComponentState) then
          begin
            if not MouseCapture then Exit;
            FTracking := True;
            FPressedCol := -1;
            FPressedDataCol := Column.Index;
            FPressedDataGroupLevelIdx := k;
            FDBGridEhState := dgsGroupPanelTitleDown;
            TrackButton(X, Y);
          end else
          begin
            FGroupDataMovingIndex := k;
            StartGroupPanelTitleMovingMode(Shift, X, Y);

            if (csDesigning in ComponentState) and
               Assigned(DBGridEhDesigntControler) and
               (FNoDesigntControler = False)
            then
              DBGridEhDesigntControler.SelectComponent(Self, DataGrouping.ActiveGroupLevels[k]);

            Exit;
          end;
        end;
      end;
    end;
  end;
  if (csDesigning in ComponentState) and
     Assigned(DBGridEhDesigntControler) and
    (FNoDesigntControler = False)
  then
    DBGridEhDesigntControler.SelectComponent(Self, DataGrouping);
end;

function TCustomDBGridEh.CalcHeightForTextLines(Font: TFont; RowLines, RowHeight: Integer): Integer;
var
  tm: TTEXTMETRIC;
  RestoreCanvas: Boolean;
begin
  RestoreCanvas := not Canvas.HandleAllocated;

  if RestoreCanvas then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    GetTextMetrics(Canvas.Handle, tm);

    Result := (tm.tmExternalLeading + tm.tmHeight) * RowLines + RowHeight;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end
end;

procedure TCustomDBGridEh.ResetGroupPanel;
var
  k: Integer;
  TitleWidth, TitleHeight: Integer;
  CaptionText: String;
  GroupRect: TRect;
  Column: TColumnEh;
  OSize: TSize;
  ExtraWidth: Integer;
  MaxAcceptableHeight: Integer;
begin

  if not HandleAllocated then Exit;
  Canvas.Font := Self.Font;
  OSize.cx := Canvas.TextWidth('o');
  OSize.cy := OSize.cx * 2 div 3;
  GroupRect.Top := OSize.cy;
  GroupRect.Left := OSize.cx;

  TitleHeight := FTitleRowHeight;
  MaxAcceptableHeight := CalcHeightForTextLines(TitleFont, 1, 7);
  if TitleHeight > MaxAcceptableHeight then
    TitleHeight := MaxAcceptableHeight;

  for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
  begin
    if DataGrouping.ActiveGroupLevels[k].Column <> nil then
    begin
      Column := TColumnEh(DataGrouping.ActiveGroupLevels[k].Column);
      CaptionText := Column.Title.Caption;
      Canvas.Font := Self.Font;
      TitleWidth := Canvas.TextWidth(CaptionText);
      GroupRect.Bottom := GroupRect.Top + TitleHeight + 1 + 1; // + Top line + Low line
      GroupRect.Right := GroupRect.Left  + TitleWidth + FInterlinear + 6 + 1;
      ExtraWidth := 16;
      if ExtraWidth <> 0 then
        GroupRect.Right := GroupRect.Right + {2 + }ExtraWidth;
      ExtraWidth := Column.Title.GetFilterButtonAreaWidth;
      if ExtraWidth <> 0 then
        GroupRect.Right := GroupRect.Right + {2 + }ExtraWidth;

      DataGrouping.ActiveGroupLevels[k].GroupPanelRect := GroupRect;

      OffsetRect(GroupRect,
        GroupRect.Right - GroupRect.Left + OSize.cy,
        (GroupRect.Bottom - GroupRect.Top) div 2);
    end;
  end;
end;

procedure TCustomDBGridEh.GetGroupMoveLineInfo(X, Y: Integer;
  var GroupMoveLinePos: TPoint; var GroupMoveLineSize: Integer; var InDataGroupIndex: Integer);
var
  k: Integer;
  GroupRect: TRect;
  HalfSize: Integer;
  OSize: TSize;
begin
  if UseRightToLeftAlignment then
    X := ClientWidth - X;
  Canvas.Font := Self.Font;
  OSize.cx := Canvas.TextWidth('o');
  OSize.cy := OSize.cx * 2 div 3;

  GroupMoveLinePos.X := OSize.cx;
  GroupMoveLinePos.Y := OSize.cy  + DataGrouping.Top;

  GroupMoveLinePos.X := GroupMoveLinePos.X - (OSize.cx div 2);
  GroupMoveLineSize := Canvas.TextHeight('Wg') + FInterlinear + 2 + 1;
  InDataGroupIndex := 0;

  for k := 0 to DataGrouping.ActiveGroupLevelsCount-1 do
  begin
    GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
    OffsetRect(GroupRect, 0, DataGrouping.Top);
    HalfSize := (GroupRect.Right - GroupRect.Left) div 2;
    if GroupRect.Left + HalfSize > X then
      Break;
    if k < DataGrouping.ActiveGroupLevelsCount-1 then
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[k+1].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      GroupMoveLinePos := GroupRect.TopLeft;
      GroupMoveLinePos.X := GroupMoveLinePos.X - (OSize.cx div 2);
    end else
    begin
      GroupRect := DataGrouping.ActiveGroupLevels[k].GroupPanelRect;
      OffsetRect(GroupRect, 0, DataGrouping.Top);
      GroupMoveLinePos := GroupRect.TopLeft;
      GroupMoveLinePos.X := GroupRect.Right + (OSize.cx div 2);
    end;
    InDataGroupIndex := k+1;
  end;
  if UseRightToLeftAlignment then
    GroupMoveLinePos.X := ClientWidth - GroupMoveLinePos.X;
end;

procedure TCustomDBGridEh.StartGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer);
var
  GroupMoveLineSize: Integer;
  GroupMoveLinePos: TPoint;
  InDataGroupIndex: Integer;
begin
  if FGridState = gsColMoving then
  begin
    CancelMode;
    GetGroupMoveLineInfo(X, Y, GroupMoveLinePos, GroupMoveLineSize, InDataGroupIndex);
    GetMoveLineEh.StartShow(Self, GroupMoveLinePos, True, GroupMoveLineSize);
    FDBGridEhState := dgsGroupPanelTitleMoving;
  end else
  begin
    CancelMode;
    GetGroupMoveLineInfo(X, Y, GroupMoveLinePos, GroupMoveLineSize, InDataGroupIndex);
    GetMoveLineEh.StartShow(Self, GroupMoveLinePos, True, GroupMoveLineSize);
    FDBGridEhState := dgsGroupPanelTitleMoving;
  end;
end;

procedure TCustomDBGridEh.DragGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer);
var
  GroupMoveLineSize: Integer;
  GroupMoveLinePos: TPoint;
  InDataGroupIndex: Integer;
  ADrawInfo: TGridDrawInfoEh;
  AMoveIndex: Integer;
  TitleRect: TRect;
  ACellRect: TRect;
begin
  if Y > OutBoundaryData.TopIndent then
  begin
    StopGroupPanelTitleMovingMode(Shift, X, Y, False);
    if RowPanel.Active then
    begin
      if FGroupDataMovingIndex >= 0 then
        FPressedDataCol := TColumnEh(DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Column).Index;
//      FPressedDataCol := RawToDataColumn(AMoveIndex);
      FMoveIndex := FPressedDataCol;
      FDownMousePos := Point(X,Y);
      FMoveMousePos := Point(X,Y);
      ACellRect := CellRect(IndicatorOffset, 0);
      TitleRect.Left := X - Columns[FPressedDataCol].FRowPlacement.Width div 2 - ACellRect.Left;
      TitleRect.Top := Y - Columns[FPressedDataCol].FRowPlacement.Height div 2 - ACellRect.Top;
      TitleRect.Right := TitleRect.Left + Columns[FPressedDataCol].Width;
      TitleRect.Bottom := TitleRect.Top + Columns[FPressedDataCol].FRowPlacement.Height;
      StartRowPanelTitleCellDragBox(Shift, X, Y, FPressedDataCol, TitleRect);
    end else
    begin
      if FGroupDataMovingIndex >= 0 then
        AMoveIndex := DataToRawColumn(TColumnEh(DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Column).Index)
      else
        AMoveIndex := FMoveIndex;
      CalcDrawInfo(ADrawInfo);
      StartColMoving(AMoveIndex, X, Y, ADrawInfo);
    end;
  end else
  begin
    GetGroupMoveLineInfo(X, Y, GroupMoveLinePos, GroupMoveLineSize, InDataGroupIndex);
    GetMoveLineEh.MoveToFor(Self, GroupMoveLinePos);
  end;
end;

procedure TCustomDBGridEh.StopGroupPanelTitleMovingMode(Shift: TShiftState; X, Y: Integer; IsAccept: Boolean);
var
  GroupMoveLineSize: Integer;
  GroupMoveLinePos: TPoint;
  InDataGroupIndex: Integer;
  FromDataGroupIndex: Integer;
  AddingColumn: TColumnEh;
  i: Integer;
begin
  GetGroupMoveLineInfo(X, Y, GroupMoveLinePos, GroupMoveLineSize, InDataGroupIndex);
  GetMoveLineEh.Hide;
  FDBGridEhState := dgsNormal;
  if IsAccept then
  begin
    if FGroupDataMovingIndex >= 0 then
    begin
      if InDataGroupIndex > FGroupDataMovingIndex then
        Dec(InDataGroupIndex);
      if InDataGroupIndex <> FGroupDataMovingIndex then
      begin
        if RowDetailPanel.Visible then
          RowDetailPanel.Visible := False;
        DataGrouping.ActiveGroupLevels[FGroupDataMovingIndex].Index := InDataGroupIndex;
      end;
    end else
    begin
      if RowPanel.Active
        then AddingColumn := Columns[FPressedDataCol]
        else AddingColumn := Columns[RawToDataColumn(FMoveIndex)];
      FromDataGroupIndex := -1;
      for i := 0 to DataGrouping.GroupLevels.Count-1 do
        if DataGrouping.GroupLevels[i].Column = AddingColumn then
        begin
          FromDataGroupIndex := i;
          Break;
        end;

      if RowDetailPanel.Visible then
        RowDetailPanel.Visible := False;
      if FromDataGroupIndex >= 0 then
      begin
        if InDataGroupIndex > FromDataGroupIndex then
          Dec(InDataGroupIndex);
        DataGrouping.GroupLevels[FromDataGroupIndex].Index := InDataGroupIndex
      end else
      begin
        if not Center.ColumnValueTypeIsComparable(Self, AddingColumn) then
          raise Exception.Create(SGroupingByThisColumnIsNotPossibleEh);
        with DataGrouping.GroupLevels.Add do
        begin
          Index := InDataGroupIndex;
          Column := AddingColumn;
          if VisibleColumns.Count > 1 then
            TColumnEh(Column).Visible := False;
        end;
      end;
    end;
  end;
end;

procedure TCustomDBGridEh.SetDataGrouping(Value: TDBGridEhDataGroupsEh);
begin
  FDataGrouping.Assign(Value);
end;

procedure TCustomDBGridEh.GroupPanelTitleUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  DoClick: Boolean;
  Column: TColumnEh;
  GroupLevel: TGridDataGroupLevelEh;
  GroupRect: TRect;
begin
  DoClick := FPressed;
  GroupLevel := DataGrouping.GroupLevels[FPressedDataGroupLevelIdx];
  Column := Columns[FPressedDataCol];
  StopTracking;
  GroupRect := GroupLevel.GroupPanelRect;
  WindowsInvalidateRect(Handle, GroupRect, False);
  if DoClick then
  begin
    DoTitleClick(Column.Index, Column);
    if GroupLevel.SortOrder = soAscEh
      then GroupLevel.SortOrder := soDescEh
      else GroupLevel.SortOrder := soAscEh;
    CheckSetCurGroupDataNode(FCurGroupDataNode, False);
  end;
end;

function TCustomDBGridEh.GetGridLineParams: TDBGridLineParamsEh;
begin
  Result := TDBGridLineParamsEh(inherited GridLineColors);
end;

procedure TCustomDBGridEh.SetGridLineParams(const Value: TDBGridLineParamsEh);
begin
  inherited GridLineColors := Value;
end;

function TCustomDBGridEh.CreateBackgroundData: TGridBackgroundDataEh;
begin
  Result := TDBGridBackgroundDataEh.Create(Self);
end;

function TCustomDBGridEh.GetBackgroundData: TDBGridBackgroundDataEh;
begin
  Result := TDBGridBackgroundDataEh(inherited BackgroundData);
end;

procedure TCustomDBGridEh.SetBackgroundData(Value: TDBGridBackgroundDataEh);
begin
  BackgroundData.Assign(Value);
end;

procedure TCustomDBGridEh.AddHighlightSubstr(Params: TGridHighlightTextParamsEh);
begin
  if FHighlightTextParamsList.IndexOf(Params) = -1 then
  begin
    FHighlightTextParamsList.Add(Params);
    Invalidate;
  end;
end;

function TCustomDBGridEh.AddHighlightSubstrParams(const Text: String;
  CaseInsensitivity: Boolean; Column: TColumnEh; Color: TColor): TGridHighlightTextParamsEh;
begin
  Result := TGridHighlightTextParamsEh.Create;
  Result.Text := Text;
  Result.CaseInsensitivity := CaseInsensitivity;
  Result.ColumnsList.Add(Column);
  Result.Color := Color;
  AddHighlightSubstr(Result);
end;

procedure TCustomDBGridEh.RemoveHighlightSubstr(Params: TGridHighlightTextParamsEh);
begin
  if FHighlightTextParamsList.Remove(Params) >= 0 then
    Invalidate;
end;

procedure TCustomDBGridEh.DrawHighlightSubstrs(ACanvas: TCanvas; Column: TColumnEh;
  ARect: TRect; DX, DY: Integer; MasterText: String; Alignment: TAlignment;
  Layout: TTextLayout; MultyL: Boolean; EndEllipsis: Boolean;
  LeftMarg, RightMarg: Integer; ARightToLeftReading: Boolean; HighlightColor: TColor);
var
  i: Integer;
  AParams: TGridHighlightTextParamsEh;
begin
  for i := 0 to FHighlightTextParamsList.Count-1 do
  begin
    AParams := TGridHighlightTextParamsEh(FHighlightTextParamsList[i]);
    if AParams.ColumnsList.IndexOf(Column) >= 0 then
    begin
      DrawHighlightedSubTextEh(ACanvas, ARect,
        DX, DY, MasterText, Alignment, Layout,
        MultyL, EndEllipsis, LeftMarg, RightMarg,
        ARightToLeftReading, AParams.Text, True, RGB(255,255,150),
        -1, clYellow);
    end;
  end;
end;

procedure TCustomDBGridEh.UpdateSearchPanel;
var
  DoLayoutChanged: Boolean;
  SPRect: TRect;
begin
  if SearchPanel.Visible then
  begin
    if not HandleAllocated then Exit;

    FSearchPanelControl.Location := SearchPanel.Location;

    if SearchPanel.Location = splGridTopEh then
    begin
      if FHorzScrollBarPanelControl.ExtraPanel.SearchPanelControl <> nil then
      begin
        FHorzScrollBarPanelControl.ExtraPanel.SearchPanelControl := nil;
        FSearchPanelControl.Parent := Self;
      end;
      FSearchPanelControl.FindEditor.Font := Font;
      FSearchPanelControl.ResetVisibleControls;

      DoLayoutChanged := False;
      if UseRightToLeftAlignment then
        SPRect := Rect(OutBoundaryData.RightIndent, 0,
          ClientWidth-OutBoundaryData.RightIndent, FSearchPanelControl.CalcAutoHeight)
      else
        SPRect := Rect(0, 0,
          ClientWidth-OutBoundaryData.RightIndent, FSearchPanelControl.CalcAutoHeight);
      if not EqualRect(FSearchPanelControl.BoundsRect, SPRect) then
      begin
        FSearchPanelControl.SetBounds(SPRect.Left, SPRect.Top, SPRect.Right, SPRect.Bottom);
        DoLayoutChanged := True;
      end;
      if not FSearchPanelControl.Visible then
      begin
        FSearchPanelControl.Visible := True;
        DoLayoutChanged := True;
      end;
      if UpdateOutBoundaryIndents then
        DoLayoutChanged := True;
      if DoLayoutChanged then
        LayoutChanged;
    end else if SearchPanel.Location = splHorzScrollBarExtraPanelEh then
    begin
      if FHorzScrollBarPanelControl.ExtraPanel.SearchPanelControl = nil then
      begin
        FSearchPanelControl.Parent := nil;
        FHorzScrollBarPanelControl.ExtraPanel.SearchPanelControl := FSearchPanelControl;
      end;
      FSearchPanelControl.ResetVisibleControls;
      FSearchPanelControl.Visible := True;
      FHorzScrollBarPanelControl.ExtraPanel.ResetWidth;
      UpdateOutBoundaryIndents;
    end else
    begin
      DoLayoutChanged := False;
      if not EqualRect(FSearchPanelControl.BoundsRect, Rect(0,0,0,0)) then
      begin
        FSearchPanelControl.SetBounds(0, 0, 0, 0);
        DoLayoutChanged := True;
      end;
      if FSearchPanelControl.Visible then
      begin
        FSearchPanelControl.Visible := False;
        DoLayoutChanged := True;
      end;
      if UpdateOutBoundaryIndents then
        DoLayoutChanged := True;
      if DoLayoutChanged then
        LayoutChanged;
    end;

  end else
  begin
    DoLayoutChanged := False;
    if not EqualRect(FSearchPanelControl.BoundsRect, Rect(0,0,0,0)) then
    begin
      FSearchPanelControl.SetBounds(0, 0, 0, 0);
      DoLayoutChanged := True;
    end;
    if FSearchPanelControl.Visible then
    begin
      FSearchPanelControl.Visible := False;
      DoLayoutChanged := True;
    end;
    if UpdateOutBoundaryIndents then
      DoLayoutChanged := True;
    if DoLayoutChanged then
      LayoutChanged;
  end;
end;

procedure TCustomDBGridEh.SetSearchPanel(Value: TDBGridSearchPanelEh);
begin
  FSearchPanel.Assign(Value);
end;

function TCustomDBGridEh.UpdateOutBoundaryIndents: Boolean;
var
  TopIndent: Integer;
  LastGroup: TGridDataGroupLevelEh;

  function CalcDefTopOutBoundaryHieght: Integer;
  var
    OSize: TSize;
  begin
    Canvas.Font := Self.Font;
    OSize.cx := Canvas.TextWidth('o');
    OSize.cy := OSize.cx * 2 div 3;
    Result := OSize.cy + Canvas.TextHeight('Wg') + FInterlinear + 2 + 1 + 5;
  end;

begin
  Result := False;
  if not HandleAllocated then Exit;
  TopIndent := 0;
  if SearchPanel.Visible then
    TopIndent := TopIndent + SearchPanel.InGridVertCaptureSize;

  if DataGrouping.GroupPanelVisible then
  begin
    DataGrouping.FTop := TopIndent;
    if DataGrouping.ActiveGroupLevelsCount > 0
      then LastGroup := DataGrouping.ActiveGroupLevels[DataGrouping.ActiveGroupLevelsCount-1]
      else LastGroup := nil;
    if LastGroup <> nil then
      TopIndent := TopIndent + LastGroup.GroupPanelRect.Bottom + 5
    else
      TopIndent := TopIndent + CalcDefTopOutBoundaryHieght;
  end;

  if OutBoundaryData.TopIndent <> TopIndent then
  begin
    OutBoundaryData.TopIndent := TopIndent;
    Result := True;
  end;
end;

function TCustomDBGridEh.GridClientWidth: Integer;
begin
  Result := ClientWidth - OutBoundaryData.LeftIndent - OutBoundaryData.RightIndent;
end;

/// new functions

function TCustomDBGridEh.CreateDataLink: TAxisGridDataLinkEh;
begin
  Result := TGridDataLinkEh.Create(Self);
end;

function TCustomDBGridEh.GetColumns: TDBGridColumnsEh;
begin
  Result := TDBGridColumnsEh(inherited AxisBars);
end;

function TCustomDBGridEh.GetVisibleColumns: TColumnsEhList;
begin
  Result := TColumnsEhList(inherited VisibleAxisBars);
end;

function TCustomDBGridEh.GetColCellParamsEh: TColCellParamsEh;
begin
  Result := TColCellParamsEh(inherited ColCellParamsEh);
end;

procedure TCustomDBGridEh.GetColRowForAxisCol(Column: TAxisBarEh;
  var ACol, ARow: Integer);
begin
  ACol := DataToRawColumn(Column.Index);
  ARow := Row;
end;

function TCustomDBGridEh.DefaultTitleAlignment: TAlignment;
begin
  if UseMultiTitle
    then Result := taCenter
    else Result := taLeftJustify;
end;

function TCustomDBGridEh.DefaultTitleColor: TColor;
begin
  Result := TitleParams.Color;
end;

function TCustomDBGridEh.AxisColumnsStorePropertyName: String;
begin
  Result := 'Columns';
end;

function TCustomDBGridEh.CreateColCellParamsEh: TAxisColCellParamsEh;
begin
  Result := TColCellParamsEh.Create;
end;

function TCustomDBGridEh.IsFixed3D: Boolean;
begin
  Result := (dghFixed3D in OptionsEh);
end;

procedure TCustomDBGridEh.GetThemeTitleFillRect(var AFillRect: TRect;
  IncVerBoundary, IncHorzBoundary: Boolean);
begin
  Style.GetThemeTitleFillRect(AFillRect, IncVerBoundary, IncHorzBoundary);
end;

function TCustomDBGridEh.GetDataEditButtonTransparency(ACol, ARow: Longint;
  ARect: TRect; Params: TAxisColCellParamsEh): Integer;
begin
  if csDesigning in ComponentState then
    Result := 30
  else if  not FilterEditMode and
       (
        (gdFocused in Params.State) or
        ((dghRowHighlight in OptionsEh) and (ARow = Row))
       )
  then
    Result := 0
  else if gdHotTrack in ColCellParamsEh.State then
    Result := 30
  else 
    Result := 80;
end;

procedure TCustomDBGridEh.FillBlankDataCellRect(ARect: TRect;
  IsSelected: Boolean; Cell3D: Boolean; Params: TAxisColCellParamsEh);
var
  AClipRec: TRect;
begin
  if Params.DrawCellByThemes and (Style.ThemeTitleFillElement = gtfeSplitButtonEh)
    then AClipRec := EmptyRect
    else AClipRec := ARect;

  if Params.DrawCellByThemes
    then FillCellRect(cfstThemedEh, ARect, False, IsSelected, AClipRec, Cell3D)
    else FillCellRect(GetDefaultFixedCellFillStyle, ARect, False, IsSelected, AClipRec, Cell3D);
end;

function TCustomDBGridEh.DesignHitTestObject(XPos, YPos: Integer): TPersistent;
var
  Cell: TGridCoord;
  ARect: TRect;
begin
  Result := nil;
  Cell := MouseCoord(XPos, YPos);
  if (Columns.State = csCustomized) and (dgTitles in Options)
   and (Cell.Y = 0) and (Cell.X >= IndicatorOffset) then
  begin
    if RowPanel.Active then
    begin
      ARect := CellRect(Cell.X, Cell.Y);
      Result := GetColumnInRowPanelAtPos(Point(XPos-ARect.Left+FDataOffset.cx, YPos-ARect.Top), True);
    end else
      Result := Columns[Cell.X-IndicatorOffset];
  end;
end;

function TCustomDBGridEh.GetSortMarkerStyle: TSortMarkerStyleEh;
begin
  Result := TitleParams.SortMarkerStyle;
end;

function TCustomDBGridEh.GetDefaultActualColumnFontColor(Column: TColumnEh; AState: TGridDrawState): TColor;
begin
  Result := Style.GetColumnFontColor(Column, AState);
end;

function TCustomDBGridEh.GetDefaultActualColumnColor(Column: TColumnEh): TColor;
begin
  Result := Style.GetColumnColor(Column);
end;

// new functions

{ TColumnFooterEh }

constructor TColumnFooterEh.Create(Collection: TCollection);
var
  AFont: TFont;
begin
  inherited Create(Collection);
  if Assigned(Collection) and (Collection is TColumnFootersEh) then
    FColumn := TColumnFootersEh(Collection).Column;
  FFont := TFont.Create;
  AFont := DefaultFont;
  if Assigned(AFont) then
    FFont.Assign(AFont);
  FFont.OnChange := FontChanged;
  if Assigned(FColumn) and Assigned(FColumn.Grid) then
    FColumn.Grid.InvalidateFooter;
end;

constructor TColumnFooterEh.CreateApart(Column: TColumnEh);
begin
  inherited Create(nil);
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
end;

destructor TColumnFooterEh.Destroy;
begin
  if Assigned(FColumn) and Assigned(FColumn.Grid) then
    FColumn.Grid.InvalidateFooter;
  FreeAndNil(FFont);
  if FDBSum <> nil then FreeAndNil(FDBSum);
  inherited Destroy;
end;

procedure TColumnFooterEh.Assign(Source: TPersistent);
begin
  if Source is TColumnFooterEh then
  begin
    if cvFooterAlignment in TColumnFooterEh(Source).FAssignedValues then
      Alignment := TColumnFooterEh(Source).Alignment;
    if cvFooterColor in TColumnFooterEh(Source).FAssignedValues then
      Color := TColumnFooterEh(Source).Color;
    if cvFooterFont in TColumnFooterEh(Source).FAssignedValues then
      Font := TColumnFooterEh(Source).Font;
    EndEllipsis := TColumnFooterEh(Source).EndEllipsis;
    ValueType := TColumnFooterEh(Source).ValueType;
    FieldName := TColumnFooterEh(Source).FieldName;
    Value := TColumnFooterEh(Source).Value;
    WordWrap := TColumnFooterEh(Source).WordWrap;
    DisplayFormat := TColumnFooterEh(Source).DisplayFormat;
    ToolTips := TColumnFooterEh(Source).ToolTips;
  end
  else
    inherited Assign(Source);
end;

function TColumnFooterEh.DefaultAlignment: TAlignment;
var
  Field: TField;
begin
  Field := FColumn.Field;
  if Assigned(Field)
    then Result := Field.Alignment
    else Result := taLeftJustify;
end;

function TColumnFooterEh.DefaultColor: TColor;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid)
    then Result := Grid.FooterParams.GetColor
    else Result := clWindow;
end;

function TColumnFooterEh.DefaultFont: TFont;
var
  Grid: TCustomDBGridEh;
begin
  Result := nil;
  if Assigned(FColumn) then
  begin
    Grid := FColumn.GetGrid;
    if Assigned(Grid)
      then Result := Grid.FooterFont
      else Result := FColumn.Font;
  end;
end;

procedure TColumnFooterEh.FontChanged(Sender: TObject);
begin
  Include(FAssignedValues, cvFooterFont);
  FColumn.Changed(True);
end;

function TColumnFooterEh.GetAlignment: TAlignment;
begin
  if cvFooterAlignment in FAssignedValues
    then Result := FAlignment
    else Result := DefaultAlignment;
end;

function TColumnFooterEh.GetColor: TColor;
begin
  if cvFooterColor in FAssignedValues
    then Result := FColor
    else Result := DefaultColor;
end;

function TColumnFooterEh.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvFooterFont in FAssignedValues) then
  begin
    Def := DefaultFont;
    if Assigned(Def) and
      ((FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color)) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TColumnFooterEh.IsAlignmentStored: Boolean;
begin
  Result := (cvFooterAlignment in FAssignedValues) and
    (FAlignment <> DefaultAlignment);
end;

function TColumnFooterEh.IsColorStored: Boolean;
begin
  Result := (cvFooterColor in FAssignedValues) and
    (FColor <> DefaultColor);
end;

function TColumnFooterEh.IsToolTipsStored: Boolean;
begin
  Result := (cvFooterToolTips in FAssignedValues) and
    (FToolTips <> False);
end;

function TColumnFooterEh.IsFontStored: Boolean;
begin
  Result := (cvFooterFont in FAssignedValues);
end;

procedure TColumnFooterEh.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvFooterFont in FAssignedValues) then Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnFooterEh.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFooterFont in FAssignedValues;
  FAssignedValues := [];
  RefreshDefaultFont;
  { If font was assigned, changing it back to default may affect grid title
    height, and title height changes require layout and redraw of the grid. }
  FColumn.Changed(FontAssigned);
end;

procedure TColumnFooterEh.SetAlignment(Value: TAlignment);
begin
  if (cvFooterAlignment in FAssignedValues) and (Value = FAlignment)
    then Exit;
  FAlignment := Value;
  Include(FAssignedValues, cvFooterAlignment);
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetColor(Value: TColor);
begin
  if (cvFooterColor in FAssignedValues) and (Value = FColor)
    then Exit;
  FColor := Value;
  Include(FAssignedValues, cvFooterColor);
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetToolTips(const Value: Boolean);
begin
  if (cvFooterToolTips in FAssignedValues) and (Value = FToolTips)
    then Exit;
  FToolTips := Value;
  Include(FAssignedValues, cvFooterToolTips);
end;

function TColumnFooterEh.GetToolTips: Boolean;
begin
  if cvFooterToolTips in FAssignedValues
    then Result := FToolTips
    else Result := DefaultToolTips;
end;

function TColumnFooterEh.DefaultToolTips: Boolean;
var
  Grid: TCustomDBGridEh;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid)
    then Result := Grid.ColumnDefValues.Footer.ToolTips
    else Result := False;
end;

procedure TColumnFooterEh.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetFieldName(const Value: String);
begin
  FFieldName := Value;
  FColumn.EnsureSumValue;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TColumnFooterEh.SetValueType(const Value: TFooterValueType);
begin
  if (ValueType = Value) then Exit;
  FValueType := Value;
  FColumn.EnsureSumValue;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetValue(const Value: String);
begin
  FValue := Value;
  FColumn.Changed(False);
end;

procedure TColumnFooterEh.SetWordWrap(const Value: Boolean);
begin
  FWordWrap := Value;
  FColumn.Changed(False);
end;


procedure TColumnFooterEh.EnsureSumValue;
begin
  if not Assigned(FColumn) or not Assigned(FColumn.Grid) then
    Exit;
  if FDBSum = nil then
  begin
    if ValueType in [fvtSum..fvtCount] then
    begin
      FColumn.Grid.FSumList.SumCollection.BeginUpdate;
      FDBSum := (FColumn.Grid.FSumList.SumCollection.Add as TDBSum);
      case ValueType of
        fvtSum, fvtAvg:
          begin
            if ValueType = fvtSum
              then FDBSum.GroupOperation := goSum
              else FDBSum.GroupOperation := goAvg;
            if FieldName <> ''
              then FDBSum.FieldName := FieldName
              else FDBSum.FieldName := FColumn.FieldName;
          end;
        fvtCount: FDBSum.GroupOperation := goCount;
      end;
      FColumn.Grid.FSumList.SumCollection.EndUpdate;
    end;
  end else
  begin
    case ValueType of
      fvtSum, fvtAvg:
        begin
          if ValueType = fvtSum
            then FDBSum.GroupOperation := goSum
            else FDBSum.GroupOperation := goAvg;
          if FieldName <> ''
            then FDBSum.FieldName := FieldName
            else FDBSum.FieldName := FColumn.FieldName;
        end;
      fvtCount:
        begin
          FDBSum.GroupOperation := goCount;
          FDBSum.FieldName := '';
        end;
    else
      FreeAndNil(FDBSum);
//      FDBSum := nil;
    end;
  end;
end;

procedure TColumnFooterEh.SetDisplayFormat(const Value: String);
begin
  if FDisplayFormat <> Value then
  begin
    FDisplayFormat := Value;
    FColumn.Changed(False);
  end;
end;

function TColumnFooterEh.GetSumValue: Variant;
begin
  Result := Null;
  if FDBSum <> nil then
    Result := FDBSum.SumValue;
end;

{ TColumnFootersEh }

constructor TColumnFootersEh.Create(Column: TColumnEh; FooterClass: TColumnFooterEhClass);
begin
  inherited Create(FooterClass);
  FColumn := Column;
end;

function TColumnFootersEh.Add: TColumnFooterEh;
begin
  Result := TColumnFooterEh(inherited Add);
end;

function TColumnFootersEh.GetFooter(Index: Integer): TColumnFooterEh;
begin
  Result := TColumnFooterEh(inherited Items[Index]);
end;

function TColumnFootersEh.GetOwner: TPersistent;
begin
  Result := FColumn;
end;

procedure TColumnFootersEh.SetFooter(Index: Integer; Value: TColumnFooterEh);
begin
  Items[Index].Assign(Value);
end;

procedure TColumnFootersEh.Update(Item: TCollectionItem);
begin
  inherited;
end;

{ TColumnsEhList }

constructor TColumnsEhList.Create;
begin
  inherited Create;
  OwnsObjects := False;
end;

function TColumnsEhList.GetColumn(Index: Integer): TColumnEh;
begin
  Result := TColumnEh(Get(Index));
end;

procedure TColumnsEhList.SetColumn(Index: Integer; const Value: TColumnEh);
begin
  Put(Index, Value);
end;

{ TColumnDefValuesEh }

constructor TColumnDefValuesEh.Create(Grid: TCustomDBGridEh);
begin
  inherited Create(Grid);
  FFooter := TColumnFooterDefValuesEh.Create;
end;

destructor TColumnDefValuesEh.Destroy;
begin
  FreeAndNil(FFooter);
  inherited Destroy;
end;

procedure TColumnDefValuesEh.SetFooter(const Value: TColumnFooterDefValuesEh);
begin
  FFooter.Assign(Value);
end;

function TColumnDefValuesEh.GetTitle: TColumnTitleDefValuesEh;
begin
  Result := TColumnTitleDefValuesEh(inherited Title);
end;

procedure TColumnDefValuesEh.SetTitle(const Value: TColumnTitleDefValuesEh);
begin
  Title.Assign(Value);
end;

function TColumnDefValuesEh.CreateAxisBarCaptionDefValues: TAxisBarCaptionDefValuesEh;
begin
  Result := TColumnTitleDefValuesEh.Create(Self);
end;

{ TDBGridEhSumList }

constructor TDBGridEhSumList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDesignTimeWork := True;
  Active := False;
end;

function TDBGridEhSumList.GetActive: Boolean;
begin
  Result := inherited Active;
end;

procedure TDBGridEhSumList.SetActive(const Value: Boolean);
begin
  inherited Active := Value;
end;

procedure TDBGridEhSumList.SetDataSetEvents;
begin
  if not (csDesigning in (FOwner as TCustomDBGridEh).ComponentState)
    then inherited SetDataSetEvents
    else FEventsOverloaded := True;
end;

procedure TDBGridEhSumList.ReturnEvents;
begin
  if not (csDesigning in (FOwner as TCustomDBGridEh).ComponentState)
    then inherited ReturnEvents
    else FEventsOverloaded := False;
end;

procedure TDBGridEhSumList.RecalcAll;
begin
  if (csLoading in FOwner.ComponentState) then Exit;
  
  if GetOwner is TCustomDBGridEh then
  begin
//    TCustomDBGridEh(GetOwner).SaveBookmark;
    try
      inherited RecalcAll;
    finally
//    TCustomDBGridEh(GetOwner).RestoreBookmark;
// RestoreBookmark causes stack overflow in some cases
    end;
  end;
end;

{ TControlScrollBarEh }

constructor TDBGridEhScrollBar.Create(AGrid: TCustomDBGridEh;
  AKind: TScrollBarKind);
begin
  inherited Create;
  FDBGridEh := AGrid;
  FKind := AKind;
  FVisibleMode := sbAutoShowEh;
  FTracking := True;
end;

destructor TDBGridEhScrollBar.Destroy;
begin
  ExtScrollBar := nil;
  inherited Destroy;
end;

procedure TDBGridEhScrollBar.Assign(Source: TPersistent);
begin
  if Source is TDBGridEhScrollBar then
  begin
    Visible := TDBGridEhScrollBar(Source).Visible;
    Tracking := TDBGridEhScrollBar(Source).Tracking;
    ExtScrollBar := TDBGridEhScrollBar(Source).ExtScrollBar;
  end
  else inherited Assign(Source);
end;

procedure TDBGridEhScrollBar.SetVisible(Value: Boolean);
begin
  if Value
    then SetVisibleMode(sbAutoShowEh)
    else SetVisibleMode(sbNeverShowEh);
  UpdateExtScrollBar;
{  if (FVisible = Value) or FAlwaysShow then Exit;
  FVisible := Value;
  if Assigned(FDBGridEh) and (Kind = sbVertical) then FDBGridEh.UpdateScrollBar;
  if Assigned(FDBGridEh) then FDBGridEh.LayoutChanged;}
end;

function TDBGridEhScrollBar.GetVisible: Boolean;
begin
  if FVisibleMode = sbNeverShowEh
    then Result := False
    else Result := True;
end;

function TDBGridEhScrollBar.IsScrollBarVisible: Boolean;
var
  Style: Longint;
begin
  if Assigned(FExtScrollBar) then
    Result := FExtScrollBar.Visible
  else
  begin
    Style := WS_HSCROLL;
    if Kind = sbVertical then Style := WS_VSCROLL;
    Result := (Visible) and
      ((GetWindowLong(FDBGridEh.Handle, GWL_STYLE) and Style) <> 0);
  end;
end;

function TDBGridEhScrollBar.IsScrollBarShowing: Boolean;
var
  ScrollInfo: TScrollInfo;
begin
  if VisibleMode = sbAlwaysShowEh then
    Result := True
  else if VisibleMode = sbNeverShowEh then
    Result := False
  else //sbAutoShowEh
  begin
    ScrollInfo.cbSize := sizeof(ScrollInfo);
    ScrollInfo.fMask := SIF_ALL;
    GetScrollInfo(ScrollInfo);
    if (ScrollInfo.nMax <= ScrollInfo.nMin) or
       (UINT(ScrollInfo.nMax - ScrollInfo.nMin) < ScrollInfo.nPage)
    then
      Result := False
    else
      Result := True;
  end;
end;

function TDBGridEhScrollBar.CheckHideScrollBar: Boolean;
begin
  Result := not IsScrollBarShowing;
end;

function TDBGridEhScrollBar.CanIntScrollBarBeShown: Boolean;
begin
  if ExtScrollBar <> nil then
    Result := False
  else
    Result := IsScrollBarShowing;
end;

procedure TDBGridEhScrollBar.SetVisibleMode(const Value: TScrollBarVisibleModeEh);
begin
  if (FVisibleMode = Value) then Exit;
  FVisibleMode := Value;
  if Assigned(FDBGridEh) and (Kind = sbVertical) then FDBGridEh.UpdateScrollBar;
  if Assigned(FDBGridEh) then FDBGridEh.LayoutChanged;
end;

procedure TDBGridEhScrollBar.ScrollBarPanelChanged;
begin
  if Assigned(FDBGridEh) then
  begin
    FDBGridEh.UpdateScrollBar;
    FDBGridEh.LayoutChanged;
  end;
end;

procedure TDBGridEhScrollBar.SetExtScrollBar(const Value: TScrollBar);
var
  WinControlWndProc: TWndMethod;
begin
  if FExtScrollBar <> Value then
  begin
    if (Value <> nil) and not (csDesigning in FDBGridEh.ComponentState) then
    begin
{ TODO : ExtScrollBar }
{$IFDEF CIL}
//      WinControlWndProc := IControl(Value).WndProc;
{$ELSE}
      WinControlWndProc := TWinControlCracker(Value).WndProc;
      if @Value.WindowProc <> @WinControlWndProc then
        raise Exception.Create('Possible ' + Value.Name + ' already attached to the other control.');
{$ENDIF}
    end;
    if (FExtScrollBar <> nil) and not (csDesigning in FDBGridEh.ComponentState) then
{$IFDEF CIL}
      IControl(FExtScrollBar).RestoreWndProc;
{$ELSE}
      FExtScrollBar.WindowProc := TWinControlCracker(FExtScrollBar).WndProc;
{$ENDIF}
    FExtScrollBar := Value;
    if (Value <> nil) then
    begin
      Value.FreeNotification(FDBGridEh);
      if not (csDesigning in FDBGridEh.ComponentState) then
        Value.WindowProc := ExtScrollWindowProc;
    end;
    UpdateExtScrollBar;
    if (csDestroying in FDBGridEh.ComponentState) then Exit;
    if FDBGridEh.HandleAllocated and (Kind = sbVertical) then
      FDBGridEh.UpdateScrollBar;
    if FDBGridEh.HandleAllocated then
      FDBGridEh.LayoutChanged;
  end;
end;

procedure TDBGridEhScrollBar.UpdateExtScrollBar;
begin
  if FExtScrollBar <> nil then
    FExtScrollBar.Visible := Visible;
end;

procedure TDBGridEhScrollBar.ExtScrollWindowProc(var Message: TMessage);
const ScrollKindMessages: array[TScrollBarKind] of Integer = (WM_HSCROLL, WM_VSCROLL);
begin
  if (Message.Msg = CN_HSCROLL) or (Message.Msg = CN_VSCROLL) then
    FDBGridEh.Perform(ScrollKindMessages[Kind], Message.WParam, Message.LParam);
{$IFDEF CIL}
  IControl(FExtScrollBar).WndProc(Message);
{$ELSE}
  TWinControlCracker(FExtScrollBar).WndProc(Message);
{$ENDIF}
end;

function TDBGridEhScrollBar.GetScrollInfo(var ScrollInfo: TScrollInfo): Boolean;
const ScrollKindWinConsts: array[TScrollBarKind] of Integer = (SB_HORZ, SB_VERT);
var
  Handle: THandle;
begin
  if ExtScrollBar <> nil then
    Result := Windows.GetScrollInfo(ExtScrollBar.Handle, SB_CTL, ScrollInfo)
  else if Grid.ScrollBarPanel then
  begin
    if Kind = sbHorizontal
      then Handle := FDBGridEh.FHorzScrollBarPanelControl.ScrollBar.Handle
      else Handle := FDBGridEh.FVertScrollBarPanelControl.ScrollBar.Handle;
      Result := Windows.GetScrollInfo(Handle, SB_CTL, ScrollInfo);
  end else
    Result := Windows.GetScrollInfo(FDBGridEh.Handle, ScrollKindWinConsts[Kind], ScrollInfo)
end;

function TDBGridEhScrollBar.GetSmoothStep: Boolean;
begin
  Result := FSmoothStep;
end;

procedure TDBGridEhScrollBar.SetSmoothStep(Value: Boolean);
begin
  if FSmoothStep <> Value then
  begin
    FSmoothStep := Value;
    SmoothStepChanged;
  end;
end;

procedure TDBGridEhScrollBar.SmoothStepChanged;
begin
end;

function TDBGridEhScrollBar.Grid: TCustomDBGridEh;
begin
  Result := FDBGridEh;
end;

function TDBGridEhScrollBar.ScrollBarPanel: Boolean;
begin
  Result := False;
end;

{ THorzDBGridEhScrollBar  }

constructor THorzDBGridEhScrollBar.Create(AGrid: TCustomDBGridEh; AKind: TScrollBarKind);
begin
  inherited Create(AGrid, AKind);
  SmoothStep := True;
  FExtraPanel := TDBGridEhScrollBarPanel.Create(Self);
end;

destructor THorzDBGridEhScrollBar.Destroy;
begin
  FreeAndNil(FExtraPanel);
  inherited Destroy;
end;

procedure THorzDBGridEhScrollBar.SmoothStepChanged;
begin
  FDBGridEh.UpdateGridDataWidth;
  FDBGridEh.UpdateScrollRange;
end;

function THorzDBGridEhScrollBar.ScrollBarPanel: Boolean;
begin
  Result := ExtraPanel.Visible;
end;

procedure THorzDBGridEhScrollBar.SetExtraPanel(
  const Value: TDBGridEhScrollBarPanel);
begin
  FExtraPanel.Assign(Value);
end;

{ TVertDBGridEhScrollBar  }

constructor TVertDBGridEhScrollBar.Create(AGrid: TCustomDBGridEh;
  AKind: TScrollBarKind);
begin
  inherited Create(AGrid, AKind);
  FSysScrollBar := True;
end;

procedure TVertDBGridEhScrollBar.SetParams(APosition, AMin, AMax, APageSize: Integer);
var
  SIOld, SINew: TScrollInfo;
  SINewMax: Integer;
begin
  SIOld.cbSize := sizeof(SIOld);
  SIOld.fMask := SIF_ALL;
  if VisibleMode = sbAlwaysShowEh then
    SIOld.fMask := SIOld.fMask or SIF_DISABLENOSCROLL;
  GetScrollInfo(SIOld);
  SINew := SIOld;
  SINew.nMin := AMin;
  SINewMax := AMax;
  SINew.nPage := APageSize;
  SINew.nPos := APosition;

  if not Visible or (ExtScrollBar <> nil) then
  begin
    SINewMax := SINew.nMax;
    SINew.nMax := SINew.nMin;
  end else
    SINew.nMax := AMax;

  if ExtScrollBar <> nil then
  begin
    with ExtScrollBar do
    begin
      PageSize := 0;
      if SINewMax < SINew.nMin then
        SINew.nMin := SINewMax;
      SetParams(SINew.nPos, SINew.nMin, SINewMax);
      PageSize := SINew.nPage;
      if (SINew.nMax <= SINew.nMin) or (UINT(SINew.nMax - SINew.nMin) < SINew.nPage)
        then Enabled := False
        else Enabled := True;
    end;
    ShowScrollBar(Grid.Handle, SB_VERT, False);
    FSysScrollBar := False;
  end else if Grid.ScrollBarPanel then
  begin
    Grid.FVertScrollBarPanelControl.SetParams(APosition, AMin, AMax, APageSize);
    Grid.UpdateScrollBarPanels;
    ShowScrollBar(Grid.Handle, SB_VERT, False);
    FSysScrollBar := False;
  end else
  begin
    if not FSysScrollBar then
    begin
      if (SINew.nMax > SINew.nMin) and (UINT(SINew.nMax - SINew.nMin) > SINew.nPage) then
        ShowScrollBar(Grid.Handle, SB_VERT, True);
      FSysScrollBar := True;
    end;  
    if (SINew.nMin <> SIOld.nMin) or (SINew.nMax <> SIOld.nMax) or
      (SINew.nPage <> SIOld.nPage) or (SINew.nPos <> SIOld.nPos) or
      (FVertScrollBarVisibleMode <> VisibleMode)
    then
    begin
      if (VisibleMode = sbAlwaysShowEh) and (ExtScrollBar = nil) then
        begin
        if (SINew.nMax <= SINew.nMin) or (UINT(SINew.nMax - SINew.nMin) <= SINew.nPage) then
        begin
          EnableScrollBar(Grid.Handle, SB_VERT, ESB_DISABLE_BOTH);
        end;
        ShowScrollBar(Grid.Handle, SB_VERT, True);
      end else if FVertScrollBarVisibleMode <> VisibleMode then
      //if not (VertScrollBar.VisibleMode = sbAlwaysShowEh) then
      begin
        FVertScrollBarVisibleMode := VisibleMode;
        if (SINew.nMax <= SINew.nMin) or (UINT(SINew.nMax - SINew.nMin) <= SINew.nPage) then
        begin
          EnableScrollBar(Grid.Handle, SB_VERT, ESB_ENABLE_BOTH);
          ShowScrollBar(Grid.Handle, SB_VERT, False);
        end;
      end;
      SetScrollInfo(Grid.Handle, SB_VERT, SINew, True);
      FVertScrollBarVisibleMode := VisibleMode;
    end;
  end;
end;

procedure TVertDBGridEhScrollBar.SmoothStepChanged;
begin
  FDBGridEh.UpdateGridDataHeight;
  FDBGridEh.UpdateScrollRange;
  if FDBGridEh.HandleAllocated then
    FDBGridEh.LayoutChanged;
end;

{ TDBGridEhScrollBarPanel }

constructor TDBGridEhScrollBarPanel.Create(ScrollBar: TDBGridEhScrollBar);
begin
  inherited Create;
  FScrollBar := ScrollBar;
  FVisible := False;
end;

function TDBGridEhScrollBarPanel.GetNavigatorButtons: TNavButtonSetEh;
begin
  Result := Grid.FHorzScrollBarPanelControl.ExtraPanel.VisibleButtons;
end;

procedure TDBGridEhScrollBarPanel.SetNavigatorButtons(const Value: TNavButtonSetEh);
begin
  Grid.FHorzScrollBarPanelControl.ExtraPanel.VisibleButtons := Value;
end;

function TDBGridEhScrollBarPanel.GetVisible: Boolean;
begin
  Result := FVisible;
end;

procedure TDBGridEhScrollBarPanel.SetVisible(const Value: Boolean);
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    FScrollBar.ScrollBarPanelChanged;
  end;
end;

function TDBGridEhScrollBarPanel.Grid: TCustomDBGridEh;
begin
  Result := FScrollBar.Grid;
end;

procedure TDBGridEhScrollBarPanel.SetVisibleItems(const Value: TGridSBItemsEh);
begin
  Grid.FHorzScrollBarPanelControl.ExtraPanel.VisibleItems := Value;
end;

function TDBGridEhScrollBarPanel.GetVisibleItems: TGridSBItemsEh;
begin
  Result := Grid.FHorzScrollBarPanelControl.ExtraPanel.VisibleItems;
end;

var Bmp: TBitmap;

{ TDBGridEhSelection }

function TDBGridEhSelection.DataCellSelected(DataCol: Longint; DataRow: TUniBookmarkEh): Boolean;
var
  Index: Integer;
begin
  Result := False;
  case SelectionType of
    gstAll:
      Result := True;
    gstRecordBookmarks:
      Result := Rows.Find(DataRow, Index);
    gstRectangle:
      if DataCol >= 0 then
        Result := Rect.DataCellSelected(DataCol, DataRow);
    gstColumns:
      if DataCol >= 0 then
        Result := (Columns.IndexOf(FGrid.Columns[DataCol]) <> -1);
  end;
end;

procedure TDBGridEhSelection.Clear;
var
  ASelectionType: TDBGridEhSelectionType;
begin
  try
    ASelectionType := FSelectionType;
    FSelectionType := gstNon;
    case ASelectionType of
      gstRecordBookmarks:
        Rows.Clear;
      gstRectangle:
        FRect.Clear;
      gstColumns:
        Columns.Clear;
      gstAll:
        begin
          FGrid.SelectionChanged;
          FGrid.Invalidate;
        end;
    end;
  finally
    if (FGrid <> nil) and (dgAlwaysShowEditor in FGrid.Options) and FGrid.CanEditorMode then
      FGrid.ShowEditor;
  end;
end;

constructor TDBGridEhSelection.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FColumns := TDBGridEhSelectionCols.Create(AGrid);
  FRect := TDBGridEhSelectionRect.Create(AGrid);
  FBMList := TBookmarkListEh.Create(AGrid);
end;

destructor TDBGridEhSelection.Destroy;
begin
  FreeAndNil(FColumns);
  FreeAndNil(FRect);
  FreeAndNil(FBMList);
  inherited;
end;

function TDBGridEhSelection.GetRows: TBookmarkListEh;
begin
  if FGrid = nil
    then Result := FBMList
    else Result := FGrid.SelectedRows;
end;

procedure TDBGridEhSelection.LinkActive(Value: Boolean);
begin
  FGrid.SelectedRows.LinkActive(Value);
  Clear;
end;

procedure TDBGridEhSelection.Refresh;
begin
  case SelectionType of
    gstRecordBookmarks:
      FGrid.SelectedRows.Refresh;
    gstRectangle:
      begin
//      FRect := BlankRect;
      end;
    gstColumns:
      if Columns.Count = 0 then begin
        FSelectionType := gstNon;
        FGrid.Invalidate;
      end;
  end;
end;

procedure TDBGridEhSelection.SelectAll;
begin
  if SelectionType = gstAll then Exit;
  if SelectionType <> gstNon then Clear;
  FSelectionType := gstAll;
  FGrid.Invalidate;
  FGrid.SelectionChanged;
end;

procedure TDBGridEhSelection.SetSelectionType(ASelType: TDBGridEhSelectionType);
begin
  if FSelectionType = ASelType then Exit;
  FSelectionType := ASelType;
  FGrid.SelectionChanged;
  FGrid.InvalidateEditor;
end;

procedure TDBGridEhSelection.UpdateState;
begin
  case SelectionType of
    gstRecordBookmarks:
      if FGrid.SelectedRows.Count = 0 then
      begin
        FSelectionType := gstNon;
        FGrid.Invalidate;
      end;
    gstRectangle:
      begin
//      FRect := BlankRect;
      end;
    gstColumns:
      if Columns.Count = 0 then
      begin
        FSelectionType := gstNon;
        FGrid.Invalidate;
      end;
  end;
end;

function TDBGridEhSelection.SelectionToGridRect: TGridRect;
begin
  case SelectionType of
    gstRecordBookmarks:
      Result := Rows.SelectionToGridRect;
    gstRectangle:
      Result := Rect.SelectionToGridRect;
    gstColumns:
      Result := Columns.SelectionToGridRect;
    gstAll:
      Result := GridRect(0, 0, FGrid.RowCount, FGrid.ColCount);
    else
      Result := GridRect(-1, -1, -1, -1);
  end;
end;

procedure TDBGridEhSelection.SelectionChanged;
begin
  if FGrid <> nil then
    FGrid.SelectionChanged;
end;

procedure TDBGridEhSelection.Assign(Selection: TDBGridEhSelection);
begin
  if Selection.SelectionType <> SelectionType then
    Clear;
  case Selection.SelectionType of
    gstRecordBookmarks:
      Rows.Assign(Selection.Rows);
    gstRectangle:
      Rect.Assign(Selection.Rect);
    gstColumns:
      Columns.Assign(Selection.Columns);
    gstAll:
      SelectAll;
  end;
  FSelectionType := Selection.SelectionType;
end;

procedure TDBGridEhSelection.AssignAsBaseRef(Selection: TDBGridEhSelection);
begin
  if Selection.SelectionType <> SelectionType then
    Clear;
  case Selection.SelectionType of
    gstRecordBookmarks:
      Rows.AssignAsBaseRef(Selection.Rows);
    gstRectangle:
      begin
//        Rows.AssignAsBaseRef(Selection.Rect);
//        Columns.AssignAsBaseRef(Selection.Rect);
      end;
    gstColumns:
      Columns.Assign(Selection.Columns);
    gstAll:
      SelectAll;
  end;
  FSelectionType := Selection.SelectionType;
end;

{ TDBGridEhSelectionCols }

procedure TDBGridEhSelectionCols.Add(ACol: TColumnEh);
var i: Integer;
begin
  for i := 0 to Count - 1 do
    if ACol.Index < Items[i].Index then
    begin
      Insert(i, ACol);
      Exit;
    end;
  inherited Add(ACol);
  if FGrid <> nil then
    FGrid.Selection.SelectionChanged;
end;

procedure TDBGridEhSelectionCols.Clear;
var
  i: Integer;
  OldCount: Integer;
begin
//  Refresh;
  if FGrid <> nil then
    for i := 0 to Count - 1 do
      FGrid.InvalidateCol(FGrid.DataToRawColumn(Items[i].Index));
  OldCount := Count;     
  inherited Clear;
  FAnchor := nil;
  if (FGrid <> nil) and (FGrid.Selection.SelectionType <> gstNon) then
    FGrid.Selection.SetSelectionType(gstNon)
  else if (FGrid <> nil) and (OldCount > 0) then
    FGrid.Selection.SelectionChanged;
end;

constructor TDBGridEhSelectionCols.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FAnchor := nil;
  FGrid := AGrid;
  FShiftSelectedCols := TColumnsEhList.Create;
end;

destructor TDBGridEhSelectionCols.Destroy;
begin
  FreeAndNil(FShiftSelectedCols);
end;

procedure TDBGridEhSelectionCols.InvertSelect(ACol: TColumnEh);
begin
  if FGrid.Selection.SelectionType <> gstColumns
    then FGrid.Selection.Clear;
  if IndexOf(ACol) = -1 then
  begin
    Add(ACol);
    FAnchor := ACol;
    FShiftCol := ACol;
  end
  else
  begin
    Remove(ACol);
    FAnchor := ACol;
    FShiftCol := ACol;
  end;
  if Count = 0
    then FGrid.Selection.SetSelectionType(gstNon)
    else FGrid.Selection.SetSelectionType(gstColumns);
  FShiftSelectedCols.Clear;
end;

function CompareColums(Item1, Item2: TObject): Integer;
begin
  if TColumnEh(Item1).Index > TColumnEh(Item2).Index then
    Result := 1
  else if TColumnEh(Item1).Index < TColumnEh(Item2).Index then
    Result := -1
  else
    Result := 0;
end;

procedure TDBGridEhSelectionCols.Refresh;
var i, j: Integer;
  Found: Boolean;
begin
  for i := Count - 1 downto 0 do
  begin
    Found := False;
    for j := 0 to FGrid.Columns.Count - 1 do
      if FGrid.Columns[j] = Items[i] then
      begin
        Found := True;
        Break;
      end;
    if not Found then Delete(i);
  end;

{$IFDEF CIL}
  Sort(CompareColums);
{$ELSE}
  Sort(@CompareColums);
{$ENDIF}
end;

procedure TDBGridEhSelectionCols.Select(ACol: TColumnEh; AddSel: Boolean);
begin
  if FGrid.Selection.SelectionType <> gstColumns then FGrid.Selection.Clear;
  if not AddSel then Clear;
  if IndexOf(ACol) = -1 then Add(ACol);
  FAnchor := ACol;
  FShiftCol := ACol;
  FGrid.Selection.SetSelectionType(gstColumns);
  FShiftSelectedCols.Clear;
end;

function TDBGridEhSelectionCols.SelectionToGridRect: TGridRect;
var
  LeftCol, RightCol: Integer;
  i: Integer;
begin
  LeftCol := -1;
  RightCol := -1;
  if Count > 0 then
  begin
    LeftCol := Items[0].Index;
    RightCol := Items[0].Index;
    for i := 1 to Count-1 do
    begin
      if Items[i].Index < LeftCol then
        LeftCol := Items[i].Index;
      if Items[i].Index > RightCol then
        RightCol := Items[i].Index;
    end;
  end;
  Result := GridRect(FGrid.DataToRawColumn(LeftCol), 0, FGrid.DataToRawColumn(RightCol), FGrid.RowCount);
end;

procedure TDBGridEhSelectionCols.SelectShift(ACol: TColumnEh {; Clear:Boolean});
var i: Integer;
  Step: Integer;
  FromIndex, ToIndex, RemoveIndex: Integer;
  NeedAdd: Boolean;
begin
  if FGrid.Selection.SelectionType <> gstColumns then FGrid.Selection.Clear;
  RemoveIndex := -1;
  Step := 1;
  NeedAdd := True;
  FromIndex := ACol.Index; ToIndex := ACol.Index;
  if FAnchor = nil then
  begin
    Select(ACol, True);
    FAnchor := ACol;
  end else
  begin
    if (FAnchor.Index < FShiftCol.Index) then
    begin
      if (FShiftCol.Index < ACol.Index) then
      begin
        FromIndex := FShiftCol.Index;
        ToIndex := ACol.Index;
        NeedAdd := True;
      end else if (FShiftCol.Index > ACol.Index) then
      begin
        FromIndex := FShiftCol.Index;
        if FAnchor.Index > ACol.Index then
          RemoveIndex := FAnchor.Index;
        ToIndex := ACol.Index + iif(RemoveIndex <> -1, 0, 1);
        Step := -1;
        NeedAdd := False;
      end
    end
    else if (FAnchor.Index > FShiftCol.Index) then
    begin
      if (FShiftCol.Index > ACol.Index) then
      begin
        FromIndex := FShiftCol.Index;
        ToIndex := ACol.Index;
        Step := -1;
        NeedAdd := True;
      end else if (FShiftCol.Index < ACol.Index) then
      begin
        FromIndex := FShiftCol.Index;
        if FAnchor.Index < ACol.Index then
          RemoveIndex := FAnchor.Index;
        ToIndex := ACol.Index - iif(RemoveIndex <> -1, 0, 1);
        NeedAdd := False;
      end;
    end else
    begin
      FromIndex := FAnchor.Index;
      if FAnchor.Index > ACol.Index then
        Step := -1;
    end;
    i := FromIndex;
//    if Clear then Clear := IndexOf(FGrid.Columns[FAnchor.Index]) = -1;
    while True do
    begin
      if i = RemoveIndex then NeedAdd := not NeedAdd;
      if NeedAdd then
      begin
        if IndexOf(FGrid.Columns[FAnchor.Index]) <> -1 then
        begin
          if (IndexOf(FGrid.Columns[i]) = -1) and FGrid.Columns[i].Visible then
          begin
            Add(FGrid.Columns[i]);
            FGrid.InvalidateCol(FGrid.DataToRawColumn(FGrid.Columns[i].Index));
            FShiftSelectedCols.Add(FGrid.Columns[i]);
            FGrid.Selection.SelectionChanged;
          end;
        end else
        begin
          if (IndexOf(FGrid.Columns[i]) <> -1) and (i <> FAnchor.Index) then
          begin
            Remove(FGrid.Columns[i]);
            FGrid.InvalidateCol(FGrid.DataToRawColumn(FGrid.Columns[i].Index));
            FShiftSelectedCols.Add(FGrid.Columns[i]);
            FGrid.Selection.SelectionChanged;
          end;
        end
      end else
      begin
        if IndexOf(FGrid.Columns[FAnchor.Index]) <> -1 then
        begin
          if (IndexOf(FGrid.Columns[i]) <> -1) and (i <> FAnchor.Index) then
          begin
            if FShiftSelectedCols.IndexOf(FGrid.Columns[i]) <> -1 then
            begin
              Remove(FGrid.Columns[i]);
              FShiftSelectedCols.Remove(FGrid.Columns[i]);
            end;
            FGrid.InvalidateCol(FGrid.DataToRawColumn(FGrid.Columns[i].Index));
            FGrid.Selection.SelectionChanged;
          end;
        end else
        begin
          if (IndexOf(FGrid.Columns[i]) = -1) and FGrid.Columns[i].Visible then
          begin
            if FShiftSelectedCols.IndexOf(FGrid.Columns[i]) <> -1 then
            begin
              Add(FGrid.Columns[i]);
              FShiftSelectedCols.Remove(FGrid.Columns[i]);
            end;
            FGrid.InvalidateCol(FGrid.DataToRawColumn(FGrid.Columns[i].Index));
            FGrid.Selection.SelectionChanged;
          end;
        end
      end;
      if i = ToIndex then Break;
      Inc(i, Step);
    end;
  end;
  FShiftCol := ACol;
  if Count = 0
    then FGrid.Selection.SetSelectionType(gstNon)
    else FGrid.Selection.SetSelectionType(gstColumns);
end;

{ TDBGridEhSelectionRect }

function TDBGridEhSelectionRect.BoxRect(ALeft: Integer; ATop: TUniBookmarkEh;
  ARight: Integer; ABottom: TUniBookmarkEh): TRect;
var
  OldRec: Integer;
  TopGridBM, BottomGridBM: TUniBookmarkEh;
  TopRow, BottomRow: Integer;
  SwapCol: Integer;
  SwapBM: TUniBookmarkEh;

  function FindRecNumByBookmark(BM: TUniBookmarkEh): Integer;
  var
    i: Integer;
  begin
    Result := -1;
    for i := 0 to FGrid.DataLink.RecordCount - 1 do
    begin
      FGrid.DataLink.ActiveRecord := i;
      with FGrid.DataSource.DataSet do
        if DataSetCompareBookmarks(FGrid.DataSource.DataSet, BM, Bookmark) = 0 then
        begin
          Result := i;
          Break;
        end;
    end;
  end;

begin
  if ALeft > ARight then
  begin
    SwapCol := ALeft;
    ALeft := ARight;
    ARight := SwapCol;
  end;
  if DataSetCompareBookmarks(FGrid.DataSource.DataSet, ATop, ABottom) > 0 then
  begin
    SwapBM := ATop;
    ATop := ABottom;
    ABottom := SwapBM;
  end;

  if FGrid.ViewScroll then
  begin
    TopRow := FGrid.FIntMemTable.InstantReadIndexOfBookmark(ATop);
    BottomRow := FGrid.FIntMemTable.InstantReadIndexOfBookmark(ABottom);
    if FGrid.DataGrouping.IsGroupingWorks then
    begin
      TopRow := FGrid.DataGrouping.GroupDataTree.IndexOfVisibleRecordViewNo(TopRow);
      BottomRow := FGrid.DataGrouping.GroupDataTree.IndexOfVisibleRecordViewNo(BottomRow);
    end;
    TopRow := TopRow + FGrid.TopDataOffset;
    BottomRow := BottomRow + FGrid.TopDataOffset;
  end else
  begin
    OldRec := FGrid.DataLink.ActiveRecord;
    try
      FGrid.DataLink.ActiveRecord := 0;

      TopGridBM := FGrid.DataSource.DataSet.Bookmark;
      if DataSetCompareBookmarks(FGrid.DataSource.DataSet, ATop, TopGridBM) < 0 then
        TopRow := 0
      else begin
        TopRow := FindRecNumByBookmark(ATop);
      end;
      if TopRow = -1 then TopRow := FGrid.DataLink.RecordCount;
      TopRow := TopRow + FGrid.TopDataOffset;

      if FGrid.DataLink.RecordCount > 0 then 
        FGrid.DataLink.ActiveRecord := FGrid.DataLink.RecordCount - 1;
      BottomGridBM := FGrid.DataSource.DataSet.Bookmark;

      if DataSetCompareBookmarks(FGrid.DataSource.DataSet, ABottom, BottomGridBM) > 0 then
        BottomRow := FGrid.VisibleDataRowCount
      else begin
        BottomRow := FindRecNumByBookmark(ABottom);
      end;
      BottomRow := BottomRow + FGrid.TopDataOffset; // - 1;

    finally
      FGrid.DataLink.ActiveRecord := OldRec;
    end;

  end;

  Result := FGrid.BoxRect(FGrid.DataToRawColumn(ALeft), TopRow,
    FGrid.DataToRawColumn(ARight), BottomRow);
//
end;

function TDBGridEhSelectionRect.DataCellSelected(DataCol: Integer; DataRow: TUniBookmarkEh): Boolean;
begin
  Result := False;
  if CheckState then
    Result := (DataSetCompareBookmarks(FGrid.DataSource.DataSet, TopRow,
        DataRow) <= 0) and
      (DataSetCompareBookmarks(FGrid.DataSource.DataSet, BottomRow,
        DataRow) >= 0) and
      (RightCol >= DataCol) and (LeftCol <= DataCol)
  else
    RaiseGridError('Error in function TDBGridEhSelectionRect.CellSelected');
end;

function TDBGridEhSelectionRect.CheckState: Boolean;
begin
  Result :=
    Assigned(FGrid.DataSource) and
    Assigned(FGrid.DataSource.DataSet) and
    FGrid.DataLink.Active {and
     {(FAnchor.Row <> '') and (FShiftCell.Row <> '') and
     (FShiftCell.Row <> '') and (FShiftCell.Row <> '') ???};
end;

procedure TDBGridEhSelectionRect.Clear;
begin
  FAnchor.Col := -1;
  FAnchor.Row := NilBookmarkEh;
  FShiftCell.Col := -1;
  FShiftCell.Row := NilBookmarkEh;
  if FGrid <> nil then
  begin
    FGrid.Invalidate;
    FGrid.Selection.SelectionChanged;
  end;  
end;

constructor TDBGridEhSelectionRect.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FAnchor.Col := -1;
  FAnchor.Row := NilBookmarkEh;
  FShiftCell.Col := -1;
  FShiftCell.Row := NilBookmarkEh;
  FGrid := AGrid;
end;

function TDBGridEhSelectionRect.GetBottomRow: TUniBookmarkEh;
begin
  if CheckState then
    if DataSetCompareBookmarks(FGrid.DataSource.DataSet, FAnchor.Row,
      FShiftCell.Row) < 0
      then Result := FShiftCell.Row
      else Result := FAnchor.Row
  else
    RaiseGridError('Error in TDBGridEhSelectionRect.GetBottomRow');
end;

function TDBGridEhSelectionRect.GetLeftCol: Longint;
begin
  Result := -1;
  if CheckState then
    if FShiftCell.Col < FAnchor.Col
      then Result := FShiftCell.Col
      else Result := FAnchor.Col
  else
    RaiseGridError('Error in TDBGridEhSelectionRect.GetBottomRow');
end;

function TDBGridEhSelectionRect.GetRightCol: Longint;
begin
  Result := -1;
  if CheckState then
    if FShiftCell.Col > FAnchor.Col
      then Result := FShiftCell.Col
      else Result := FAnchor.Col
  else
    RaiseGridError('Error in TDBGridEhSelectionRect.GetBottomRow');
end;

function TDBGridEhSelectionRect.GetTopRow: TUniBookmarkEh;
begin
  if CheckState then
    if DataSetCompareBookmarks(FGrid.DataSource.DataSet, FAnchor.Row,
      FShiftCell.Row) > 0
      then Result := FShiftCell.Row
      else Result := FAnchor.Row
  else
    RaiseGridError('Error in TDBGridEhSelectionRect.GetBottomRow');
end;

type
  TXorRects = array[0..3] of TRect;

procedure XorRects(const R1, R2: TRect; var XorRects: TXorRects);
var
  Intersect, Union: TRect;

  function PtInRect(X, Y: Integer; const Rect: TRect): Boolean;
  begin
    with Rect do Result := (X >= Left) and (X <= Right) and (Y >= Top) and
      (Y <= Bottom);
  end;

  function Includes(const P1: TPoint; P2: TPoint): Boolean;
  begin
    with P1 do
      Result := PtInRect(X, Y, R1) or PtInRect(X, Y, R2);
  end;

  function Build(var R: TRect; const P1, P2, P3: TPoint): Boolean;
  begin
    Build := True;
    with R do
      if Includes(P1, R.TopLeft) then
      begin
        Left := P1.X;
        Top := P1.Y;
        if Includes(P3, R.BottomRight) then
        begin
          Right := P3.X;
          Bottom := P3.Y;
        end else
        begin
          Right := P2.X;
          Bottom := P2.Y;
        end
      end
      else if Includes(P2, R.TopLeft) then
      begin
        Left := P2.X;
        Top := P2.Y;
        Bottom := P3.Y;
        Right := P3.X;
      end
      else
        Build := False;
  end;

begin
  XorRects[0] := EmptyRect;
  XorRects[1] := EmptyRect;
  XorRects[2] := EmptyRect;
  XorRects[3] := EmptyRect;
//  FillChar(XorRects, SizeOf(XorRects), 0);
  if not Bool(IntersectRect(Intersect, R1, R2)) then
  begin
    { Don't intersect so its simple }
    XorRects[0] := R1;
    XorRects[1] := R2;
  end
  else
  begin
    UnionRect(Union, R1, R2);
    if Build(XorRects[0],
      Point(Union.Left, Union.Top),
      Point(Union.Left, Intersect.Top),
      Point(Union.Left, Intersect.Bottom)) then
      XorRects[0].Right := Intersect.Left;
    if Build(XorRects[1],
      Point(Intersect.Left, Union.Top),
      Point(Intersect.Right, Union.Top),
      Point(Union.Right, Union.Top)) then
      XorRects[1].Bottom := Intersect.Top;
    if Build(XorRects[2],
      Point(Union.Right, Intersect.Top),
      Point(Union.Right, Intersect.Bottom),
      Point(Union.Right, Union.Bottom)) then
      XorRects[2].Left := Intersect.Right;
    if Build(XorRects[3],
      Point(Union.Left, Union.Bottom),
      Point(Intersect.Left, Union.Bottom),
      Point(Intersect.Right, Union.Bottom)) then
      XorRects[3].Top := Intersect.Bottom;
  end;
end;

procedure TDBGridEhSelectionRect.Select(ACol: Longint; ARow: TUniBookmarkEh; AddSel: Boolean);
var
  OldAnchor, OldShiftCell: TDBCell;
  OldRect, NewRect: TRect;
  AXorRects: TXorRects;
  I: Integer;
begin
  if FGrid.Selection.SelectionType <> gstRectangle then
    FGrid.Selection.Clear;
  OldAnchor := FAnchor;
  OldShiftCell := FShiftCell;
  if (FAnchor.Col = -1) or not AddSel then
  begin
    FAnchor.Col := ACol;
    FAnchor.Row := ARow;
    FShiftCell.Col := ACol;
    FShiftCell.Row := ARow;
  end else
  begin
    FShiftCell.Col := ACol;
    FShiftCell.Row := ARow;
  end;
  if (FAnchor.Col <> FShiftCell.Col) or
    (DataSetCompareBookmarks(FGrid.DataSource.DataSet, FAnchor.Row,
      FShiftCell.Row) <> 0)
  then
    FGrid.Selection.SetSelectionType(gstRectangle)
  else if FGrid.Selection.SelectionType = gstRectangle then
  begin
    FGrid.Selection.SetSelectionType(gstNon);
//    FAnchor.Col := -1;
  end;

  if (OldAnchor.Col = OldShiftCell.Col) and (OldAnchor.Row = OldShiftCell.Row)
    and (FAnchor.Row = FShiftCell.Row) and (FAnchor.Col <> FShiftCell.Col) then
  begin
    OldAnchor.Col := 0;
    OldShiftCell.Col := FGrid.ColCount;
  end else if (OldAnchor.Col <> OldShiftCell.Col) and (OldAnchor.Row = OldShiftCell.Row)
    and (FAnchor.Row = FShiftCell.Row) and (FAnchor.Col = FShiftCell.Col) then
  begin
    OldAnchor.Col := 0;
    OldShiftCell.Col := FGrid.ColCount;
  end;

  if not FGrid.HandleAllocated then Exit;
  OldRect := BoxRect(OldAnchor.Col, OldAnchor.Row, OldShiftCell.Col, OldShiftCell.Row);
  NewRect := BoxRect(FAnchor.Col, FAnchor.Row, FShiftCell.Col, FShiftCell.Row);
  XorRects(OldRect, NewRect, AXorRects);
  for I := Low(AXorRects) to High(AXorRects) do
    WindowsInvalidateRect(FGrid.Handle, AXorRects[I], False);
  if (OldAnchor.Col <> FAnchor.Col) or
     (OldAnchor.Row <> FAnchor.Row) or
     (OldShiftCell.Col <> FShiftCell.Col) or
     (OldShiftCell.Row <> FShiftCell.Row)
  then
    FGrid.Selection.SelectionChanged;
end;

function TDBGridEhSelectionRect.SelectionToGridRect: TGridRect;
var
  TopRow, BottomRow: Integer;
  LeftCol, RightCol: Integer;
  i, OldActive: Integer;
begin
  Result := GridRect(-1,-1,-1,-1);
  LeftCol := FGrid.DataToRawColumn(Self.LeftCol);
  RightCol := FGrid.DataToRawColumn(Self.RightCol);
  if not FGrid.DataLink.Active then Exit;

  TopRow := -1;
  BottomRow := -1;

  if FGrid.ViewScroll then
  begin
    TopRow := FGrid.FIntMemTable.InstantReadIndexOfBookmark(Self.TopRow);
    BottomRow := FGrid.FIntMemTable.InstantReadIndexOfBookmark(Self.BottomRow);
  end else
  begin
    OldActive := FGrid.DataLink.ActiveRecord;
    for i := 0 to FGrid.DataLink.RecordCount-1 do
    begin
      FGrid.DataLink.ActiveRecord := i;
      if TopRow = -1 then
        if DataSetCompareBookmarks(FGrid.DataLink.DataSet,
          FGrid.DataLink.DataSet.Bookmark, Self.TopRow) >= 0
        then
          TopRow := i;
      if DataSetCompareBookmarks(FGrid.DataLink.DataSet,
        FGrid.DataLink.DataSet.Bookmark, Self.BottomRow) <= 0
      then
        BottomRow := i
    end;
    FGrid.DataLink.ActiveRecord := OldActive;
  end;

  if (TopRow >= 0) and (BottomRow >= 0) then
    Result := GridRect(LeftCol, TopRow + FGrid.TopDataOffset, RightCol, BottomRow + FGrid.TopDataOffset);
end;

procedure TDBGridEhSelectionRect.Assign(Rect: TDBGridEhSelectionRect);
begin
  Clear;
  FAnchor := Rect.FAnchor;
  FShiftCell := Rect.FShiftCell;
end;

function TDBGridEhSelectionRect.GetGrid: TCustomDBGridEh;
begin
  Result := FGrid;
end;

procedure RecreateInplaceSearchIndicator;
var
  Bmp: TBitmap;
  il: TImageList;
begin
  il := nil;
  Bmp := TBitmap.Create;
  try
    BitmapLoadFromResourceName(Bmp, HInstance, bmEditWhite);
    il := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    il.BkColor := DBGridEhInplaceSearchColor;
    if il.BkColor = clTeal then il.BkColor := TColor(RGB(0, 127, 127));
    il.AddMasked(Bmp, clWhite);
    il.GetBitmap(0, Bmp);
    if DBGridEhIndicators.Count = 7 then DBGridEhIndicators.Delete(6);
    DBGridEhIndicators.AddMasked(Bmp, clTeal);
  finally
    il.Free;
    Bmp.Free;
  end;
end;

procedure CreateIndicators;
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    BitmapLoadFromResourceName(Bmp, HInstance, bmArrow);
    DBGridEhIndicators := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    DBGridEhIndicators.AddMasked(Bmp, clWhite);
    BitmapLoadFromResourceName(Bmp, HInstance, bmEdit);
    DBGridEhIndicators.AddMasked(Bmp, clWhite);
    BitmapLoadFromResourceName(Bmp, HInstance, bmInsert);
    DBGridEhIndicators.AddMasked(Bmp, clWhite);
    BitmapLoadFromResourceName(Bmp, HInstance, bmMultiDot);
    DBGridEhIndicators.AddMasked(Bmp, clWhite);
    BitmapLoadFromResourceName(Bmp, HInstance, bmMultiArrow);
    DBGridEhIndicators.AddMasked(Bmp, clWhite);
    BitmapLoadFromResourceName(Bmp, HInstance, bmEditWhite);
    DBGridEhIndicators.AddMasked(Bmp, clTeal);

    RecreateInplaceSearchIndicator;
    BitmapLoadFromResourceName(Bmp, HInstance, bmSmDown);
    DBGridEhSortMarkerImages := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    DBGridEhSortMarkerImages.AddMasked(Bmp, clFuchsia);
    BitmapLoadFromResourceName(Bmp, HInstance, bmSmUp);
    DBGridEhSortMarkerImages.AddMasked(Bmp, clFuchsia);

    BitmapLoadFromResourceName(Bmp, HInstance, bmDropDown);
    DBGridEhSortMarkerImages.AddMasked(Bmp, clWhite);

    BitmapLoadFromResourceName(Bmp, HInstance, bmSmDown1);
    DBGridEhSortMarkerImages.AddMasked(Bmp, clFuchsia);
    BitmapLoadFromResourceName(Bmp, HInstance, bmSmUp1);
    DBGridEhSortMarkerImages.AddMasked(Bmp, clFuchsia);
    
  finally
    Bmp.Free;
  end;
end;

//The PropStorage
type

  TColumnEhPropertyInterceptor = class(TStoragePropertyInterceptor)
  private
    procedure SetWidth(const Value: Integer);
  published
    property Width: Integer write SetWidth;
  end;

  TColumnsEhPropertyInterceptor = class(TStoragePropertyInterceptor)
  private
    FColumnsIndex: String;
    procedure SetColumnsIndex(const Value: String);
    function GetColumnsIndex: String;
  public
    procedure Readed; override;
  published
    property ColumnsIndex: String read GetColumnsIndex write SetColumnsIndex;
  end;

{ TColumnEhPropertyInterceptor }

procedure TColumnEhPropertyInterceptor.SetWidth(const Value: Integer);
begin
  if (TColumnEh(Target).Grid <> nil) and TColumnEh(Target).Grid.AutoFitColWidths
    then TColumnEh(Target).FInitWidth := Value
    else TColumnEh(Target).Width := Value;
end;

{ TColumnsEhPropertyInterceptor }

function TColumnsEhPropertyInterceptor.GetColumnsIndex: String;
var
  i: Integer;
begin
  Result := '';
  with TDBGridColumnsEh(Target) do
  begin
    for i := 0 to Count - 1 do
      Result := Result + '"' + Items[i].FieldName + '",';
  end;
  Delete(Result, Length(Result), 1);
end;

procedure TColumnsEhPropertyInterceptor.SetColumnsIndex(const Value: String);
var
  fl: TStringList;
  i: Integer;
  Col: TColumnEh;

  function GetFieldColumns(const FieldName: String): TColumnEh;
  var
    i: Integer;
  begin
    Result := nil;
    with TDBGridColumnsEh(Target) do
      for i := 0 to Count - 1 do
        if NlsCompareStr(Items[i].FieldName, FieldName) = 0 then
        begin
          Result := Items[i];
          Break;
        end;
  end;

begin
  FColumnsIndex := Value;
  fl := TStringList.Create;
  fl.CommaText := FColumnsIndex;
  TDBGridColumnsEh(Target).BeginUpdate;
  try
    for i := 0 to fl.Count - 1 do
    begin
      Col := GetFieldColumns(fl[i]);
      if Col <> nil then
        Col.Index := i;
    end;
  finally
    TDBGridColumnsEh(Target).EndUpdate;
    fl.Free;
  end;
end;

procedure TColumnsEhPropertyInterceptor.Readed;
begin
end;

function VarArrayToCommaText(va: Variant): String;
var
  i: Integer;
begin
  Result := '';
  if VarIsArray(va) then
  begin
    for i := VarArrayLowBound(va, 1) to VarArrayHighBound(va, 1) do
      Result := Result + '''' + VarToStr(va[i]) + ''',';
    Delete(Result, Length(Result), 1);
  end
  else
    Result := VarToStr(va);
end;

{ TSTColumnFilterEh }

constructor TSTColumnFilterEh.Create(AColumn: TColumnEh);
begin
  inherited Create;
  FColumn := AColumn;
  ClearSTFilterExpression(FExpression);
  FVisible := True;

  FList := TStringList.Create;
  FKeys := TStringList.Create;
  FListLink := TFieldDataLink.Create;
  FListLink.OnActiveChange := ListLinkActiveChange;
  FKeyValues := Null;
  FPopupFilterItems := TStringList.Create;
  FDropDownListRows := 15;
end;

destructor TSTColumnFilterEh.Destroy;
begin
  FreeAndNil(FList);
  FreeAndNil(FKeys);
  FreeAndNil(FListLink);
  FreeAndNil(FPopupListboxItemData);
  FreeAndNil(FPopupFilterItems);
  inherited Destroy;
end;

procedure TSTColumnFilterEh.Assign(Source: TPersistent);
begin
  if Source is TSTColumnFilterEh then
  begin
    DataField := TSTColumnFilterEh(Source).DataField;
    Visible := TSTColumnFilterEh(Source).Visible;
    KeyField := TSTColumnFilterEh(Source).KeyField;
    ListField := TSTColumnFilterEh(Source).ListField;
    ListSource := TSTColumnFilterEh(Source).ListSource;
  end else
    inherited Assign(Source);
end;

procedure TSTColumnFilterEh.Clear;
begin
  FKeyValues := Null;
  ExpressionStr := '';
end;

function TSTColumnFilterEh.GetExpression: TSTFilterExpressionEh;
begin
  Result := FExpression;
end;

function TSTColumnFilterEh.GetExpressionAsString: String;

  function VarValueAsText(v: Variant): String;
  begin
    if VarType(v) = varDouble then
      Result := FloatToStr(v)
    else if VarType(v) = varDate then
      Result := FormatDateTime(FormatSettings.ShortDateFormat, v)
    else
      Result := '''' + VarToStr(v) + '''';
  end;

  function GetOneExpression(O: TSTFilterOperatorEh; v: Variant): String;
  var
    i: Integer;
  begin
    if O = foNull then
      Result := Result + '=' + STFilterOperatorsStrMapEh[O]
    else if O = foNotNull then
      Result := Result + '<>' + STFilterOperatorsStrMapEh[O]
    else
    begin
      Result := Result + STFilterOperatorsStrMapEh[O];
      if O in [foIn, foNotIn] then
      begin
        Result := Result + ' (';
        if VarIsArray(v) then
          for i := VarArrayLowBound(v, 1) to VarArrayHighBound(v, 1) do
            Result := Result + VarValueAsText(v[i]) + ','
        else
          Result := Result + VarValueAsText(v) + ',';
        Delete(Result, Length(Result), 1);
        Result := Result + ')';
      end
      else
        Result := Result + ' ' + VarValueAsText(v);
    end;
  end;

begin
  Result := '';
  if (Expression.ExpressionType = botNon) or (Expression.Operator1 = foNon) then
    Exit;
  if ListSource <> nil then
    Result := VarArrayToCommaText(Expression.Operand1)
  else
  begin
    Result := GetOneExpression(Expression.Operator1, Expression.Operand1);
    if Expression.Relation <> foNon then
    begin
      Result := Result + ' ' + STFilterOperatorsStrMapEh[Expression.Relation] + ' ';
      Result := Result + GetOneExpression(Expression.Operator2, Expression.Operand2);
    end;
  end;  
end;

function TSTColumnFilterEh.GetGrid: TCustomDBGridEh;
begin
  Result := FColumn.Grid;
end;

function TSTColumnFilterEh.ParseExpression(const Exp: String): String;
var
  DefaultOperator: TSTFilterDefaultOperatorEh;
begin
  if (Column.Field <> nil) then
    FExpression.ExpressionType := STFldTypeMapEh[Column.Field.DataType];
  if (Column.KeyList.Count > 0) and (Column.PickList.Count > 0) then
    FExpression.ExpressionType := botString;
  if (Column.Grid <> nil) and (Column.Grid.Center <> nil) then
    DefaultOperator := Column.Grid.Center.GetSTFilterDefaultOperator(
      Column.Grid, Column, FExpression)
  else
    DefaultOperator := fdoAuto;

  ParseSTFilterExpressionEh(Exp, FExpression, DefaultOperator);
  if ListSource = nil then
    CheckRecodeKeyList(FExpression, True);
  Result := GetExpressionAsString;
end;

procedure TSTColumnFilterEh.SetExpression(const Value: TSTFilterExpressionEh);
begin
  FExpression := Value;
  FExpressionStr := GetExpressionAsString;
  if Column.Grid <> nil then
    Column.Grid.InvalidateTitle;
end;

procedure TSTColumnFilterEh.SetExpressionStr(const Value: String);
begin
  InternalSetExpressionStr(Value);
  if Assigned(Column.Grid) then
  begin
    Column.Grid.Invalidate;
    if (Column.Grid.FilterEdit <> nil) and Column.Grid.FilterEdit.Visible then
      Column.Grid.UpdateFilterEdit(True);
  end;
end;

procedure TSTColumnFilterEh.InternalSetExpressionStr(const Value: String);

  procedure SetLookupKeyValues(var v: Variant);
  var
    i: Integer;
  begin
    if VarIsArray(Expression.Operand1) then
      for i := VarArrayLowBound(Expression.Operand1, 1) to VarArrayHighBound(Expression.Operand1, 1) do
        v[i] := CurrentListDataSet.Lookup(CurrentListField, v[i], CurrentKeyField)
    else
      v := CurrentListDataSet.Lookup(CurrentListField, v, CurrentKeyField)
  end;

begin
  ParseExpression(Value);
  FExpressionStr := Value;
  if Column.Grid <> nil then
    Column.Grid.InvalidateTitle;
  if (CurrentKeyField <> '') and (CurrentListDataSet <> nil) and (CurrentListField <> '') then
  begin
    if FExpression.Operator1 <> foNon then
      SetLookupKeyValues(FExpression.Operand1);
    if FExpression.Operator2 <> foNon then
      SetLookupKeyValues(FExpression.Operand2);
  end;
end;

procedure TSTColumnFilterEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Column.Changed(False);
  end;
end;

function TSTColumnFilterEh.DropDownButtonVisible: Boolean;
begin
  Result := True;
end;

function TSTColumnFilterEh.GetFilterFieldName: String;
begin
  Result := CurrentDataField;
end;

function TSTColumnFilterEh.GetOperand1: Variant;
begin
  if CurrentKeyField <> ''
    then Result := FKeyValues
    else Result := FExpression.Operand1;
end;

function TSTColumnFilterEh.GetOperand2: Variant;
begin
  Result := FExpression.Operand2;
end;

function TSTColumnFilterEh.GetListSource: TDataSource;
begin
  Result := FListLink.DataSource;
end;

procedure TSTColumnFilterEh.ListLinkActiveChange(Sender: TObject);
begin
  if FListLink.Active and (FListField <> '') and (FKeyField <> '') then
    with FListLink.DataSet do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          FList.Add(VarToStr(FieldValues[FListField]));
          FKeys.Add(VarToStr(FieldValues[FKeyField]));
          Next;
        end;
        First;
      finally
        EnableControls;
      end;
    end;
  Column.FieldValueList := nil;
end;

procedure TSTColumnFilterEh.SetKeyListValues(const AText: String; KeyVals: Variant);
begin
  ExpressionStr := '';
  if not VarIsNull(KeyVals) then
  begin
    FExpression.ExpressionType := botString;
    FExpression.Operator1 := foIn;
    FExpression.Operand1 := AText;
    Expression := FExpression;
    FKeyValues := KeyVals;
  end
  else
    FKeyValues := Null;
end;

procedure TSTColumnFilterEh.SetKeysFromListValues(ss: TStrings);
var
  i: Integer;
  ks: TStrings;
  AKeyField: String;

  function StringsAsCommaText(ss: TStrings): String;
  var i: Integer;
  begin
    Result := '';
    for i := 0 to ss.Count-1  do
      Result := Result + '''' + ss[i] + ''',';
    Delete(Result, Length(Result), 1);
  end;

  function StringsAsVarArray(ss: TStrings): Variant;
  var i: Integer;
  begin
    Result := Null;
    if ss.Count = 0 then
      Exit;
    Result := VarArrayCreate([0, ss.Count - 1], varVariant);
    for i := 0 to ss.Count - 1 do
      Result[i] := ss[i];
  end;

begin
  if (not FListLink.Active) or (ListField = '') {or (DataField = '')} then
    Exit;
  if KeyField = ''
    then AKeyField := ListField
    else AKeyField := KeyField;
  ks := TStringList.Create;
  for i := 0 to ss.Count - 1 do
    ks.Add(VarToStr(FListLink.DataSet.Lookup(ListField, ss[i], AKeyField)));
  SetKeyListValues(StringsAsCommaText(ss), StringsAsVarArray(ks));
  ks.Free;
end;

procedure TSTColumnFilterEh.SetListSource(const Value: TDataSource);
begin
  FListLink.DataSource := Value;
end;

function TSTColumnFilterEh.CurrentKeyField: String;
var
  Field: TField;
begin
  Result := '';
  if KeyField <> '' then
    Result := KeyField
  else if Grid.DataLink.Active then
  begin
    Field := Grid.DataLink.DataSet.FindField(Column.FieldName);
    if (Field <> nil) and (Field.FieldKind = fkLookup) then
      Result := Field.LookupKeyFields;
  end;
end;

function TSTColumnFilterEh.CurrentDataField: String;
var
  Field: TField;
begin
  Result := Column.FieldName;
  if DataField <> ''  then
    Result := DataField
  else if Grid.DataLink.Active then
  begin
    Field := Grid.DataLink.DataSet.FindField(Column.FieldName);
    if (Field <> nil) and (Field.FieldKind = fkLookup) then
      Result := Field.KeyFields;
  end;
end;

function TSTColumnFilterEh.CurrentListDataSet: TDataSet;
var
  Field: TField;
begin
  Result := nil;
  if ListSource <> nil then
    Result := ListSource.DataSet
  else if Grid.DataLink.Active then
  begin
    Field := Grid.DataLink.DataSet.FindField(Column.FieldName);
    if (Field <> nil) and (Field.FieldKind = fkLookup) then
      Result := Field.LookupDataSet;
  end;
end;

function TSTColumnFilterEh.CurrentListField: String;
var
  Field: TField;
begin
  Result := '';
  if ListField <> '' then
    Result := ListField
  else if Grid.DataLink.Active then
  begin
    Field := Grid.DataLink.DataSet.FindField(Column.FieldName);
    if (Field <> nil) and (Field.FieldKind = fkLookup) then
      Result := Field.LookupResultField;
  end;
end;

function TSTColumnFilterEh.GetFieldValueList: IMemTableDataFieldValueListEh;
var
  dsfv:  TDatasetFieldValueListEh;
  Field: TField;
begin
  Result := nil;
  if not Grid.DataLink.Active or (ListSource = nil) or
    (ListSource.DataSet = nil) or not ListSource.DataSet.Active
  then
    Exit;
  if ListField <> ''
    then Field := ListSource.DataSet.FindField(ListField)
    else Field := ListSource.DataSet.FindField(Column.FieldName);
  if Field = nil then
    Exit;
  dsfv := TDatasetFieldValueListEh.Create;
  dsfv.FieldName := Field.FieldName;
  dsfv.DataSource := ListSource;
  Result := dsfv;
end;

procedure TSTColumnFilterEh.CheckRecodeKeyList(var FExpression: TSTFilterExpressionEh; DisplayToData: Boolean);

  procedure ConvertPickListToKeyList(var v: Variant);
  var
    i, k: Integer;
    SourList, TargList: TStrings;
  begin
    if DisplayToData then
    begin
      SourList := Column.PickList;
      TargList := Column.KeyList;
    end else
    begin
      SourList := Column.KeyList;
      TargList := Column.PickList;
    end;
    if not VarIsNull(v) then
      if VarIsArray(v) then
        for i := VarArrayLowBound(v, 1) to VarArrayHighBound(v, 1) do
        begin
          k := SourList.IndexOf(VarToStr(v[i]));
          if k >= 0 then
            v[i] := TargList[k];
        end
      else
      begin
        k := SourList.IndexOf(VarToStr(v));
        if k >= 0 then
          v := TargList[k];
      end;
  end;

begin
  if (Column.KeyList.Count > 0) and (Column.PickList.Count > 0) then
  begin
    if FExpression.Operator1 in [foEqual..foNotIn] then
      ConvertPickListToKeyList(FExpression.Operand1);
    if FExpression.Operator2 in [foEqual..foNotIn] then
      ConvertPickListToKeyList(FExpression.Operand2);
  end;
end;

procedure TSTColumnFilterEh.UpdateFilterFromValuesCheckingState(ss: TStrings);
var
  FilterStr: String;
  i,k: Integer;
  DataOpType: TSTOperandTypeEh;
  sv: String;
  IncludeCheckNull: Boolean;
begin
  k := 0;
  IncludeCheckNull := False;
  if (Column.Field <> nil)
    then DataOpType := STFldTypeMapEh[Column.Field.DataType]
    else DataOpType := botNon;

  for i := 0 to Length(FListValuesCheckingState)-1 do
  begin
    if ss.Objects[i] is TPopupListboxItemEhData then
      if FListValuesCheckingState[i] = True then
      begin
        sv := StringReplace(ss[i], '''', '''''',[rfReplaceAll]);
        if (DataOpType in [botNumber, botDateTime, botBoolean]) and (sv = '') then
        begin
          IncludeCheckNull := True;
        end else
        begin
          if FilterStr <> '' then FilterStr := FilterStr + ',';
          FilterStr := FilterStr + '''' + sv + '''';
          Inc(k);
        end;
      end;
  end;
  if FilterStr <> '' then
    if k = 1
      then FilterStr := '=' + FilterStr
      else FilterStr := 'in (' + FilterStr + ')';
  if IncludeCheckNull then
    if FilterStr = ''
      then FilterStr := '=Null'
      else FilterStr := FilterStr + ' OR =Null ';
  InternalSetExpressionStr(FilterStr);
  if (Column.Grid.FilterEdit <> nil) and Column.Grid.FilterEdit.Visible then
     Column.Grid.FilterEdit.Text := FilterStr;
  if Column.Grid.STFilter.InstantApply then
    Column.Grid.SetDataFilter;
end;

procedure TSTColumnFilterEh.UpdateValuesCheckingStateFromFilter(ss: TStrings);
var
  i, si: Integer;
  v: Variant;
  vs, ssk: String;
begin
  if Expression.Operator1 = foIn then
    if VarIsArray(Expression.Operand1) then
    begin
      v := VarArrayCreate([0, VarArrayHighBound(Expression.Operand1, 1)], varVariant);
      for i := VarArrayLowBound(Expression.Operand1, 1) to VarArrayHighBound(Expression.Operand1, 1) do
        v[i] := Expression.Operand1[i];
    end else
    begin
      v := VarArrayCreate([0, 0], varVariant);
      v[0] := Expression.Operand1;
    end
  else if Expression.Operator1 = foEqual then
  begin
    if (Expression.Relation = foOR) and (Expression.Operator2 = foEqual) then
    begin
      v := VarArrayCreate([0, 1], varVariant);
      v[1] := Expression.Operand2;
    end else
      v := VarArrayCreate([0, 0], varVariant);
    v[0] := Expression.Operand1;
  end;

  if not VarIsArray(v) then Exit;

  if (CurrentKeyField <> '') and (CurrentListDataSet <> nil) and (CurrentListField <> '') then
    for i := 0 to VarArrayHighBound(v, 1) do
      v[i] := CurrentListDataSet.Lookup(CurrentKeyField, v[i], CurrentListField);

  for i := 0 to VarArrayHighBound(v, 1) do
  begin
    vs := VarToStr(v[i]);
    for si := 0 to Length(FListValuesCheckingState)-1 do
    begin
      if ss.Objects[si] is TPopupListboxItemEhData then
      begin
        if (Column.GetColumnType = ctKeyPickList) and (Column.PickList.IndexOf(ss[si]) >= 0)
          then ssk := Column.KeyList[ Column.PickList.IndexOf(ss[si]) ]
          else ssk := ss[si];
        if (si < ss.Count) and (ssk = vs) then
          FListValuesCheckingState[si] := True
      end;
    end;
  end;
end;

function TSTColumnFilterEh.GetOperandAsString(Operator: TSTFilterOperatorEh;
  v: Variant): String;
var
  i: Integer;

  function OperandVarToStr(v1: Variant): String;
  var
    DoQuote: Boolean;
  begin
    Result := VarToStr(v1);
    DoQuote := False;
    if (Operator in [foIn, foNotIn]) and (AnsiPos(',', Result) > 0) then
      DoQuote := True;
    if (CharAtPos(Result,1) = ' ') or (CharAtPos(Result,1) = '''') then
      DoQuote := True;
    if CharAtPos(Result, Length(Result)) = ' ' then
      DoQuote := True;
    if UpperCase(Copy(Result, Length(Result)-2, 3)) = ' OR' then
      DoQuote := True;
    if UpperCase(Copy(Result, Length(Result)-3, 4)) = ' AND' then
      DoQuote := True;
    if (UpperCase(Result) = 'OR') or (UpperCase(Result) = 'AND') then
      DoQuote := True;
    if DoQuote = True then  
    begin
      Result := StringReplace(Result, '''', '''''',[rfReplaceAll]);
      Result := '''' + Result + '''';
    end;
  end;

  function VarToFilterString(v1: Variant): String;
  begin
    if (CurrentKeyField <> '') and
       (CurrentListDataSet <> nil) and
       (CurrentListField <> '')
     then
       v1 := CurrentListDataSet.Lookup(CurrentKeyField, v1, CurrentListField);
    Result := OperandVarToStr(v1);
  end;

begin
  Result := '';
  if VarIsArray(v) then
    for i := 0 to VarArrayHighBound(v, 1) do
    begin
      if Result <> '' then Result := Result + ',';
      Result := Result + VarToFilterString(v[i]);
    end
  else
    Result := VarToFilterString(v);
end;

{ TSTDBGridEhFilter }

constructor TSTDBGridEhFilter.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FUpateCount := 0;
  FParentFont := True;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  RefreshDefaultFont;
  FColor := clDefault;
  FHorzLineColor := clDefault;
  FVertLineColor := clDefault;
end;

destructor TSTDBGridEhFilter.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

procedure TSTDBGridEhFilter.Assign(Source: TPersistent);
begin
  if Source is TSTDBGridEhFilter then
  begin
    Visible := TSTDBGridEhFilter(Source).Visible;
    Local := TSTDBGridEhFilter(Source).Local;
  end else
    inherited Assign(Source);
end;

procedure TSTDBGridEhFilter.BeginUpdate;
begin
  Inc(FUpateCount);
end;

procedure TSTDBGridEhFilter.EndUpdate;
begin
  Dec(FUpateCount);
end;

procedure TSTDBGridEhFilter.SetLocal(const Value: Boolean);
begin
  FLocal := Value;
end;

procedure TSTDBGridEhFilter.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    if not Value then
      FGrid.StopEditFilter;
    FGrid.LayoutChanged;
    if FGrid.EditorMode then
      FGrid.InvalidateEditor;
  end;
end;

function  TSTDBGridEhFilter.GetInstantApply: Boolean;
begin
  if FIsInstantApplyStored
    then Result := FInstantApply
    else Result := Local;
end;

procedure TSTDBGridEhFilter.SetInstantApply(const Value: Boolean);
begin
  FInstantApply := Value;
  FIsInstantApplyStored := True;
end;

function TSTDBGridEhFilter.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

function  TSTDBGridEhFilter.IsInstantApplyStored: Boolean;
begin
  Result := FIsInstantApplyStored;
end;

procedure TSTDBGridEhFilter.SetLocation(const Value: TSTFilterLocationEh);
begin
  if FLocation <> Value then
  begin
    FLocation := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TSTDBGridEhFilter.SetColor(const Value: TColor);
begin
  if Value <> FColor then
  begin
    FColor := Value;
    FGrid.Invalidate;
  end;
end;

procedure TSTDBGridEhFilter.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

function TSTDBGridEhFilter.DefaultFont: TFont;
begin
  Result := FGrid.Font;
end;

procedure TSTDBGridEhFilter.FontChanged(Sender: TObject);
begin
  if (not FGrid.FSelfChangingFooterFont) and not (csLoading in FGrid.ComponentState) then
    ParentFont := False;
  FGrid.LayoutChanged;
end;

procedure TSTDBGridEhFilter.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if not FParentFont then Exit;

  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
    FFont.Color := clBlue;
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TSTDBGridEhFilter.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.Invalidate;
  end;
end;

procedure TSTDBGridEhFilter.SetRowHeight(const Value: Integer);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TSTDBGridEhFilter.SetRowLines(const Value: Integer);
begin
  if FRowLines <> Value then
  begin
    FRowLines := Value;
    FGrid.LayoutChanged;
  end;
end;

function TSTDBGridEhFilter.GetHorzLineColor: TColor;
begin
  if HorzLineColor = clDefault
    then Result := FGrid.GridLineParams.GetDarkColor
    else Result := HorzLineColor;
end;

procedure TSTDBGridEhFilter.SetHorzLineColor(const Value: TColor);
begin
  if FHorzLineColor <> Value then
  begin
    FHorzLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TSTDBGridEhFilter.GetVertLineColor: TColor;
begin
  if VertLineColor = clDefault
    then Result := FGrid.GridLineParams.GetDarkColor
    else Result := VertLineColor;
end;

procedure TSTDBGridEhFilter.SetVertLineColor(const Value: TColor);
begin
  if FVertLineColor <> Value then
  begin
    FVertLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TSTDBGridEhFilter.GetColor: TColor;
begin
  if Color = clDefault
    then Result := ApproximateColor(clWindow, FGrid.FixedColor, 8)
    else Result := Color;
end;

function TSTDBGridEhFilter.RowFullRowHeight: Integer;
begin
  if (RowLines <> 0) or (RowHeight <> 0) then
    Result := FGrid.CalcHeightForTextLines(Font, RowLines, RowHeight)
  else if Font.Size = DefaultFont.Size then
    Result := FGrid.FStdDefaultRowHeight
  else
  begin
    FGrid.Canvas.Font := Font;
    Result := FGrid.Canvas.TextHeight('Wg') + FGrid.FInterlinear;
  end;
end;

procedure TSTDBGridEhFilter.SetFilterButtonDrawTime(
  const Value: TDBGridFilterButtonDrawTimeEh);
begin
  if FFilterButtonDrawTime <> Value then
  begin
    FFilterButtonDrawTime := Value;
    FGrid.Invalidate;
  end;
end;

procedure TSTDBGridEhFilter.UpdateInplaceEditorButtonHeight;
var
  ARowFullRowHeight: Integer;
begin
  ARowFullRowHeight := RowFullRowHeight;
  if ARowFullRowHeight > Round(FGrid.FInplaceEditorButtonWidth * 3 / 2)
    then FInplaceEditorButtonHeight := DefaultEditButtonHeight(FGrid.FInplaceEditorButtonWidth,  FGrid.Flat)
    else FInplaceEditorButtonHeight := ARowFullRowHeight;
end;

{ TDBGridEhIndicatorTitle }

constructor TDBGridEhIndicatorTitle.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  UseGlobalMenu := True;
end;

procedure TDBGridEhIndicatorTitle.SetShowDropDownSign(const Value: Boolean);
begin
  if Value <> FShowDropDownSign then
  begin
    FShowDropDownSign := Value;
    FGrid.InvalidateCell(0,0);
  end;
end;

{ TRowDetailPanelEh }

constructor TRowDetailPanelEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FWidth := 0;
  FHeight := 120;

  FBevelEdges := [beLeft, beTop, beRight, beBottom];
  FBevelInner := bvRaised;
  FBevelOuter := bvLowered;
  FBevelKind := bkNone;
  FBevelWidth := 1;
  FBorderStyle := bsSingle;
  FColor := AGrid.FixedColor;

  FMinHeight := 1;
  FSizingBarHeight := 8;
  FSizingBarBeveled := True;
end;

procedure TRowDetailPanelEh.Assign(Source: TPersistent);
begin
  if Source is TRowDetailPanelEh then
  begin
    Active := TRowDetailPanelEh(Source).Active;
  end else
    inherited Assign(Source);
end;

procedure TRowDetailPanelEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    if FActive then
    begin
      if (csDesigning in FGrid.ComponentState) and not (csLoading in FGrid.ComponentState) then
        Visible := True
    end else
      Visible := False;
    FGrid.UpdateRowDetailPanel;
    FGrid.LayoutChanged;
  end;
end;

procedure TRowDetailPanelEh.SetVisible(const Value: Boolean);
var
  CanProceed: Boolean;
  DrawInfo: TGridDrawInfoEh;
  MaxTopLeft: TGridCoord;
begin
  if FVisible <> Value then
  begin
    if Value
      then CanProceed := FGrid.DataLink.Active and not FGrid.DataLink.DataSet.IsEmpty
      else CanProceed := True;
    if not (csDestroying in FGrid.ComponentState) then
    begin
      if Value and Assigned(FGrid.OnRowDetailPanelShow) then
        FGrid.OnRowDetailPanelShow(FGrid, CanProceed);
      if not Value and Assigned(FGrid.OnRowDetailPanelHide) then
        FGrid.OnRowDetailPanelHide(FGrid, CanProceed);
    end;
    if not CanProceed then Exit;
    FVisible := Value;
    FGrid.UpdateRowDetailPanel;
    if Visible then
    begin
      FGrid.CalcDrawInfo(DrawInfo);
      MaxTopLeft.X := FGrid.Col;
      MaxTopLeft.Y := FGrid.Row;
      MaxTopLeft := CalcMaxTopLeft(MaxTopLeft, DrawInfo);
      if MaxTopLeft.Y > FGrid.TopRow then
        FGrid.TopRow := MaxTopLeft.Y;
    end
    else if not (csDestroying in FGrid.ComponentState) then
    begin
      FGrid.MTUpdateTopRow;
      FGrid.Invalidate;
    end;
    FGrid.UpdateScrollBar;
  end;
end;

procedure TRowDetailPanelEh.SetWidth(const Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetHeight(Value: Integer);
begin
  if FHeight <> Value then
  begin
    if Value < MinHeight then
      Value := MinHeight;
    if (MaxHeight > 0) and (Value > MaxHeight) then
      Value := MaxHeight;
    FHeight := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetActiveControl(Control: TWinControl);
begin
  if FActiveControl <> Control then
  begin
{    if not ((Control = nil) or
            (csLoading in FGrid.ComponentState) or
            (csDesigning in FGrid.ComponentState) or
            Control.CanFocus) then
      raise EInvalidOperation.Create(SCannotFocus);}
    FActiveControl := Control;
{    if not (csLoading in FGrid.ComponentState) and
       not (csDesigning in FGrid.ComponentState) then
    begin
      if FActive and (FActiveControl <> nil) then
        FActiveControl.SetFocus;
    end;}
  end;
end;

procedure TRowDetailPanelEh.SetBevelEdges(const Value: TBevelEdges);
begin
  if FBevelEdges <> Value then
  begin
    FBevelEdges := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetBevelKind(const Value: TBevelKind);
begin
  if FBevelKind <> Value then
  begin
    FBevelKind := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetBevelWidth(const Value: TBevelWidth);
begin
  if FBevelWidth <> Value then
  begin
    FBevelWidth := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetBevelInner(const Value: TBevelCut);
begin
  if FBevelInner <> Value then
  begin
    FBevelInner := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetBevelOuter(const Value: TBevelCut);
begin
  if FBevelOuter <> Value then
  begin
    FBevelOuter := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetBorderStyle(const Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FParentColor := False;
    FGrid.UpdateRowDetailPanel;
  end;
end;

function TRowDetailPanelEh.GetColor: TColor;
begin
  if ParentColor
    then Result := FGrid.Color
    else Result := FColor;
end;

function TRowDetailPanelEh.IsColorStored: Boolean;
begin
  Result := not ParentColor and (Color <> FGrid.FixedColor);
end;

procedure TRowDetailPanelEh.SetParentColor(Value: Boolean);
begin
  if FParentColor <> Value then
  begin
    FParentColor := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

function TRowDetailPanelEh.GetParentPopupMenu: Boolean;
begin
  Result := FGrid.FRowDetailControl.ParentPopupMenu;
end;

procedure TRowDetailPanelEh.SetParentPopupMenu(const Value: Boolean);
begin
  FGrid.FRowDetailControl.ParentPopupMenu := Value;
end;

procedure TRowDetailPanelEh.SetVertSizing(const Value: Boolean);
begin
  if FVertSizing <> Value then
  begin
    FVertSizing := Value;
    if (MaxHeight <> 0) and (Height > MaxHeight) then
      Height := MaxHeight;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetMinHeight(const Value: Integer);
begin
  if FMinHeight <> Value then
  begin
    FMinHeight := Value;
    if Height < MinHeight then
      Height := MinHeight;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetMaxHeight(const Value: Integer);
begin
  if FMaxHeight <> Value then
  begin
    FMaxHeight := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetSizingBarHeight(const Value: Integer);
begin
  if FSizingBarHeight <> Value then
  begin
    FSizingBarHeight := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

procedure TRowDetailPanelEh.SetSizingBarBeveled(const Value: Boolean);
begin
  if FSizingBarBeveled <> Value then
  begin
    FSizingBarBeveled := Value;
    FGrid.UpdateRowDetailPanel;
  end;
end;

{ TRowDetailPanelControlEh }

//{$IFDEF EH_LIB_16}
//class constructor TRowDetailPanelControlEh.Create;
//begin
//  TCustomStyleEngine.RegisterStyleHook(TRowDetailPanelControlEh, TScrollBoxStyleHook);
//end;
//
//class destructor TRowDetailPanelControlEh.Destroy;
//begin
//  TCustomStyleEngine.UnRegisterStyleHook(TRowDetailPanelControlEh, TScrollBoxStyleHook);
//end;
//{$ENDIF}

constructor TRowDetailPanelControlEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csReplicatable];
  Width := 185;
  Height := 41;
  FBorderStyle := bsSingle;
  FParentPopupMenu := True;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FSizingBarHeight := 8;
  FSizingBarBeveled := True;
end;

destructor TRowDetailPanelControlEh.Destroy;
begin
  FCanvas.Free;
  inherited Destroy;
end;

procedure TRowDetailPanelControlEh.CMChildKey(var Message: TCMChildKey);
begin
  inherited;
  if (Message.Result <> 1) and
     (Message.CharCode = VK_UP) and
     not (csDesigning in ComponentState) and
     (GetShiftState = [ssCtrl]) then
  begin
    TCustomDBGridEh(Parent).SetFocus;
    Message.Result := 1;
  end;
end;

procedure TRowDetailPanelControlEh.CreateParams(var Params: TCreateParams);
const
  BorderStyles: array[TBorderStyle] of DWORD = (0, WS_BORDER);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or BorderStyles[FBorderStyle];
{    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;}
  end;
end;

procedure TRowDetailPanelControlEh.DefaultHandler(var Message);
{$IFDEF CLR}
var
  Msg: TMessage;
{$ENDIF}
begin
{$IFDEF CLR}
  Msg := UnwrapMessage(TObject(Message));
  with Msg do
{$ELSE}
  with TMessage(Message) do
{$ENDIF}
  begin
    if (Msg = WM_CONTEXTMENU) then
      if ParentPopupMenu
        then inherited
        else //Nothing
    else
      inherited;
  end;
end;

procedure TRowDetailPanelControlEh.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TRowDetailPanelControlEh.WMNCHitTest(var Message: TWMNCHitTest);
var
  ClientTopLeft: TPoint;
  WinRect: TRect;
  YTopBorder: Integer;
begin
  FHitTest := ScreenToClient(SmallPointToPoint(Message.Pos));
  ClientTopLeft := ClientRect.TopLeft;
  GetWindowRect(Handle, WinRect);
  ClientTopLeft := ClientToScreen(Point(0,0));
  YTopBorder := ClientTopLeft.Y - WinRect.Top;
  FHitTest.X := FHitTest.X + ClientTopLeft.X - WinRect.Left;
  FHitTest.Y := FHitTest.Y + YTopBorder;
  DefaultHandler(Message);
  if not MouseCapture then
    if FHitTest.Y > YTopBorder + ClientHeight - SizingBarHeight then
    begin
      Message.Result := HTBORDER;
      FSizeArea := True;
    end else
      FSizeArea := False;
end;

procedure TRowDetailPanelControlEh.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  inherited;
  if VertSizing and (FHitTest.Y > ClientHeight) then
    Msg.Result := Longint(BOOL(True));
end;

procedure TRowDetailPanelControlEh.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then RecreateWnd;
  inherited;
end;

procedure TRowDetailPanelControlEh.SetVertSizing(const Value: Boolean);
begin
  if FVertSizing <> Value then
  begin
    FVertSizing := Value;
    RecreateWnd;
  end;
end;

procedure TRowDetailPanelControlEh.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if VertSizing then
  begin
    Message.CalcSize_Params^.rgrc[0].Bottom := Message.CalcSize_Params^.rgrc[0].Bottom - SizingBarHeight;
//    Message.Result := WVR_VALIDRECTS;
  end;
end;

procedure TRowDetailPanelControlEh.WMNCLButtonDown(var Message: TWMNCLButtonDown);
var
  YTopBorder: Integer;
  WinRect: TRect;
  ClientTopLeft: TPoint;
begin
  GetWindowRect(Handle, WinRect);
  ClientTopLeft := ClientToScreen(Point(0,0));
  YTopBorder := ClientTopLeft.Y - WinRect.Top;
  inherited;
  FDownGlobPos := ScreenToClient(Point(Message.XCursor, Message.YCursor));
  FYDelta := FDownGlobPos.Y - Height;
  if VertSizing and (FHitTest.Y > YTopBorder + ClientHeight) then
  begin
    MouseCapture := True;
  end;
end;

procedure TRowDetailPanelControlEh.WMNCMouseMove(var Message: TWMNCMouseMove);
var
  MovePoint: TPoint;
begin
  inherited;
  if VertSizing and MouseCapture and FSizeArea then
  begin
    MovePoint := Point(Message.XCursor, Message.YCursor);
    TCustomDBGridEh(Parent).RowDetailPanel.Height :=
      FRowDetailPanelHeight + (FDownGlobPos.Y - MovePoint.Y);
    TCustomDBGridEh(Parent).UpdateDesigner;
  end;
end;

procedure TRowDetailPanelControlEh.WMNCLButtonUp(var Message: TWMNCLButtonUp);
begin
  inherited;
  MouseCapture := False;
end;

procedure TRowDetailPanelControlEh.MouseMove(Shift: TShiftState; X,
  Y: Integer);
var
  MovePoint: TPoint;
begin
  inherited MouseMove(Shift, X, Y);
  if VertSizing and MouseCapture and FSizeArea then
  begin
    MovePoint := Point(X, Y);
    TCustomDBGridEh(Parent).RowDetailPanel.Height :=
      MovePoint.Y - FYDelta;
    TCustomDBGridEh(Parent).UpdateDesigner;
  end;
end;

procedure TRowDetailPanelControlEh.WMSetCursor(var Msg: TWMSetCursor);
var
  YTopBorder: Integer;
  WinRect: TRect;
  ClientTopLeft: TPoint;
begin
  GetWindowRect(Handle, WinRect);
  ClientTopLeft := ClientToScreen(Point(0,0));
  YTopBorder := ClientTopLeft.Y - WinRect.Top;

  if VertSizing and (Msg.HitTest = HTBORDER) and (FHitTest.Y > YTopBorder + ClientHeight) then
  begin
    SetCursor(Screen.Cursors[crVSplit]);
  end else
    inherited;
end;

procedure TRowDetailPanelControlEh.WMNCPaint(var Message: TWMNCPaint);
begin
  inherited;
  DrawSizingBar;
end;

procedure TRowDetailPanelControlEh.DrawSizingBar;
const
  Ctl3DStyles: array[Boolean] of UINT = (BF_MONO, 0);
var
  DC, OldDC: HDC;
  R: TRect;
  BR: TRect;
begin
  if VertSizing then
  begin
    DC := GetWindowDC(Handle);
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);
      begin
        OldDC := Canvas.Handle;
        Canvas.Handle := DC;
        BR := R;
        BR.Top := R.Bottom-SizingBarHeight-1;
        if SizingBarBeveled then
        begin
          Canvas.Pen.Color := clBtnShadow;
          Canvas.Polyline([Point(BR.Left+1, BR.Top), Point(BR.Right-1, BR.Top)]);
          BR.Top := BR.Top + 1;

          Canvas.Pen.Color := clBtnHighlight;
          Canvas.Polyline([Point(BR.Left+1, BR.Top), Point(BR.Right-1, BR.Top)]);
          BR.Top := BR.Top + 1;
        end;
        Canvas.Brush.Color := clBtnFace;
        Canvas.FillRect(Rect(BR.Left+1, BR.Top, BR.Right-1, BR.Bottom-1));

        Canvas.Handle := OldDC;
      end;

    finally
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TRowDetailPanelControlEh.SetSizingBarHeight(
  const Value: Integer);
begin
  if FSizingBarHeight <> Value then
  begin
    FSizingBarHeight := Value;
    RecreateWnd;
  end;
end;

procedure TRowDetailPanelControlEh.SetSizingBarBeveled(
  const Value: Boolean);
begin
  if Value <> FSizingBarBeveled then
  begin
    FSizingBarBeveled := Value;
    RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_INVALIDATE);
  end;
end;

{ TGridRowPanelEh }

constructor TGridRowPanelEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FActive := False;
end;

procedure TGridRowPanelEh.Assign(Source: TPersistent);
begin
  if Source is TGridRowPanelEh then
  begin
    Active := TGridRowPanelEh(Source).Active;
  end else
    inherited Assign(Source);
end;

procedure TGridRowPanelEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    if FActive then
      FGrid.Col := FGrid.IndicatorOffset;
    FGrid.LayoutChanged;
  end;
end;

function TColumnEh.GetInRowLinePos: Integer;
begin
  Result := FRowLine;
  if Result < 0 then Result := 0;
end;

procedure TColumnEh.SetInRowLinePos(const Value: Integer);
begin
  if FRowLine <> Value then
  begin
    FRowLine := Value;
    Changed(True);
  end;
end;

function TColumnEh.GetInRowLineHeight: Integer;
begin
  Result := FHeight;
  if Result <= 0 then Result := 1;
end;

procedure TColumnEh.SetInRowLineHeight(const Value: Integer);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    Changed(True);
  end;
end;

procedure TDBGridColumnsEh.RelayoutCellsInRowPanel;
var
  i, j: Integer;
  Col: TColumnEh;
  RowLinesExtend: array of Integer;
  InRowHeight: Integer;
  MinLeftPos: Integer;

  procedure EnsureRowLinesExtendSize(NewSize: Integer);
  begin
    if NewSize > Length(RowLinesExtend) then
      SetLength(RowLinesExtend, NewSize);
  end;

begin
  EnsureRowLinesExtendSize(1);
  InRowHeight := Grid.InRowPanelLineHeight;
  for i := 0 to Count-1 do
  begin
    Col := Items[i];
    EnsureRowLinesExtendSize(Col.InRowLinePos + Col.InRowLineHeight);
    MinLeftPos := 0;
    for j := Col.InRowLinePos  to Col.InRowLinePos + Col.InRowLineHeight - 1 do
      if RowLinesExtend[j] > MinLeftPos then
        MinLeftPos := RowLinesExtend[j];
    for j := Col.InRowLinePos  to Col.InRowLinePos + Col.InRowLineHeight - 1 do
    begin
      Col.FRowPlacement.Left := MinLeftPos;
      Col.FRowPlacement.Top := Col.InRowLinePos * (InRowHeight + Grid.GridLineWidth);
      if Col.Visible
        then Col.FRowPlacement.Width := Col.Width
        else Col.FRowPlacement.Width := 0;
      Col.FRowPlacement.Height := Col.InRowLineHeight * (InRowHeight + Grid.GridLineWidth) - 1;
      Col.FRowPlacement.DataCellLeft := Col.FRowPlacement.Left;
      Col.FRowPlacement.DataCellWidth := Col.FRowPlacement.Width;
      if Col.FRowPlacement.Left = 0 then
      begin
        Inc(Col.FRowPlacement.Width, Grid.FExtraFirstColumnWidth);
        Inc(Col.FRowPlacement.DataCellLeft, Grid.FExtraFirstColumnWidth);
      end;
      if Col.Visible
        then RowLinesExtend[j] := MinLeftPos + Col.FRowPlacement.Width + Grid.GridLineWidth
        else RowLinesExtend[j] := MinLeftPos;
    end;
  end;

  Grid.FGridMasterCellWidth := 0;
  Grid.FGridMasterCellHeight := InRowHeight;
  for i := 0 to Count-1 do
  begin
    if not Items[i].Visible then Continue;
    if Items[i].FRowPlacement.Left + Items[i].Width > Grid.FGridMasterCellWidth then
      Grid.FGridMasterCellWidth := Items[i].FRowPlacement.Left + Items[i].Width;
    if Items[i].FRowPlacement.Top + Items[i].FRowPlacement.Height > Grid.FGridMasterCellHeight then
      Grid.FGridMasterCellHeight := Items[i].FRowPlacement.Top + Items[i].FRowPlacement.Height;
  end;
end;

procedure TDBGridColumnsEh.ScaleWidths(Divisor, Denominator: Integer);
var
  i: Integer;
  Col: TColumnEh;
  NewLeft, NewRight, NewWidth: Integer;
begin
  for i := 0 to Count-1 do
  begin
    Col := Items[i];
    NewRight := Round((Col.FRowPlacement.Left + Col.Width + Grid.GridLineWidth) / Divisor * Denominator);
    NewLeft := Round(Col.FRowPlacement.Left / Divisor * Denominator);
    NewWidth := NewRight - NewLeft - Grid.GridLineWidth;
    Col.Width := NewWidth;
  end;
  RelayoutCellsInRowPanel;
end;

procedure TDBGridColumnsEh.FixupAutoFitColWidths(GridWidth: Integer);
var
  i, k, MaxInRowLinePos: Integer;
  RowLineWidth: Integer;
  LastWidth: Integer;
  GridWidthExtending, LeftBorder, RightBorder: Double;
  FixedGridWidth: Integer;
begin
  MaxInRowLinePos := 0;
  for i := 0 to Count-1 do
    if Items[i].InRowLinePos > MaxInRowLinePos then
      MaxInRowLinePos := Items[i].InRowLinePos;
  for k := 0 to MaxInRowLinePos do
  begin
    RowLineWidth := 0;
    FixedGridWidth := GridWidth;
    for i := 0 to Count-1 do
      if Items[i].InRowLinePos = k then
      begin
        if Items[i].AutoFitColWidth
          then RowLineWidth := RowLineWidth + Items[i].Width + Grid.GridLineWidth
          else Dec(FixedGridWidth, Items[i].Width + Grid.GridLineWidth);
      end;
    GridWidthExtending := 0;
    if RowLineWidth > 0 then
      for i := 0 to Count-1 do
        if (Items[i].InRowLinePos = k) and Items[i].AutoFitColWidth then
        begin
          LastWidth := Items[i].Width;
          LeftBorder := GridWidthExtending  * FixedGridWidth / RowLineWidth;
          RightBorder := (GridWidthExtending+Items[i].Width) * FixedGridWidth / RowLineWidth;
          Items[i].Width := Round(RightBorder) - Round(LeftBorder);
          if Items[i].Width = 0 then Items[i].Width := 1;
          GridWidthExtending := GridWidthExtending + LastWidth;
        end;
  end;
  RelayoutCellsInRowPanel;
end;

function TCustomDBGridEh.InRowPanelLineHeight: Integer;
begin
  Canvas.Font := TitleFont;
  Result := Canvas.TextHeight('Wg')+4;
  if not Flat then
    Inc(Result);
end;

procedure TCustomDBGridEh.SetRowPanel(const Value: TGridRowPanelEh);
begin
  if (Value = nil) and (csLoading in ComponentState) then
  begin
    // It is old style trying to assign RowPanel = True
    FGridRowPanel.Active := True;
    Exit;
  end;
  FGridRowPanel.Assign(Value);
end;

procedure TCustomDBGridEh.DrawTitleAsRowPanel(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  i: Integer;
  Col: TColumnEh;
  CellRect: TRect;
  LineRect: TRect;
begin
  Canvas.Brush.Color := ColumnDefValues.Title.Color;
  Canvas.FillRect(ARect);
  for i := 0 to Columns.Count-1 do
  begin
    Col := Columns[i];
    if not Col.Visible then Continue;
    CellRect := Rect(Col.FRowPlacement.Left, Col.FRowPlacement.Top,
      Col.FRowPlacement.Left + Col.FRowPlacement.Width,
      Col.FRowPlacement.Top + Col.FRowPlacement.Height);
    Inc(CellRect.Left, ARect.Left);
    Inc(CellRect.Right, ARect.Left);
    Inc(CellRect.Top, ARect.Top);
    Inc(CellRect.Bottom, ARect.Top);
    if CellRect.Bottom < ARect.Bottom then
    begin
      Canvas.Pen.Color := GridLineParams.GetDarkColor;
      Canvas.Polyline([Point(CellRect.Left, CellRect.Bottom),
                       Point(CellRect.Right+1, CellRect.Bottom)]);
    end;
    if CellRect.Right < ARect.Right then
    begin
      Canvas.Pen.Color := GridLineParams.GetDarkColor;
      LineRect := CellRect;
      if UseRightToLeftAlignment then
        OffsetRect(LineRect,1,0);
      Canvas.Polyline([Point(LineRect.Right, LineRect.Top),
                       Point(LineRect.Right, LineRect.Bottom+1)]);
    end;
    Exclude(AState, gdFocused);
    Exclude(AState, gdSelected);
    Exclude(AState, gdHotTrack);
    if IsActiveControl and (ARow = Row) and ((SelectedIndex = i) or (dgRowSelect in Options))  then
      Include(AState, gdFocused);
    if (ARow = Row) and (SelectedIndex = i) then
      Include(AState, gdSelected);
    if (ARow = FHotTrackCell.Y) and (FHotTrackCell.X = i + FIndicatorOffset) then
      Include(AState, gdHotTrack);
    DrawTitleCell(ACol, ARow, i, AreaRow, CellRect, AState, CellAreaType);
  end;
end;

procedure TCustomDBGridEh.DrawDataAsRowPanel(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  i: Integer;
  Column: TColumnEh;
  CellRect: TRect;
  The3DRect: Boolean;
  FillRect: TRect;
  LineRect: TRect;
begin

  FillRect := ARect;
  if DataGrouping.IsGroupingWorks and (DataGrouping.GroupDataTree.FlatVisibleCount > 0) then
  begin
    InstantReadRecordEnter(AreaRow);
    try
      The3DRect := CellHave3DRect(ACol, ARow, ARect, AState);
      if InstantReadCurDataNode.NodeType = dntDataGroupEh then
      begin
        DrawGroupDataCell(ACol, ARow, AreaCol, AreaRow, ARect, AState, CellAreaType);
        Exit;
      end else
      begin
        DrawGroupDataArea(ACol, ARow, AreaCol, AreaRow, InstantReadCurDataNode.Level, AState, ARect, The3DRect, True);
//        ARect.Bottom := ARect.Bottom - 1;
        FillRect := ARect;
        FillRect.Left := ARect.Left + FExtraFirstColumnWidth;
      end;
    finally
      InstantReadRecordLeave;
    end;
  end;

  Canvas.Brush.Color := Color;
  Canvas.FillRect(FillRect);
  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    if not Column.Visible then Continue;
    CellRect := Rect(Column.FRowPlacement.DataCellLeft, Column.FRowPlacement.Top,
      Column.FRowPlacement.DataCellLeft + Column.FRowPlacement.DataCellWidth,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    Inc(CellRect.Left, ARect.Left);
    Inc(CellRect.Right, ARect.Left);
    Inc(CellRect.Top, ARect.Top);
    Inc(CellRect.Bottom, ARect.Top);
    if CellRect.Bottom < ARect.Bottom then
    begin
      if (Row = ARow) or (FGridMasterCellHeight div InRowPanelLineHeight <= 1)
        then Canvas.Pen.Color := StyleServices.GetSystemColor(GridLineParams.GetBrightColor)
        else Canvas.Pen.Color := ApproachToColorEh(StyleServices.GetSystemColor(GridLineParams.GetBrightColor), StyleServices.GetSystemColor(clWindow), 66);
      Canvas.Polyline([Point(CellRect.Left, CellRect.Bottom),
                       Point(CellRect.Right+1, CellRect.Bottom)]);
    end;
    if CellRect.Right < ARect.Right then
    begin
      if (Row = ARow) or (FGridMasterCellHeight div InRowPanelLineHeight <= 1)
        then Canvas.Pen.Color := StyleServices.GetSystemColor(GridLineParams.GetBrightColor)
        else Canvas.Pen.Color := ApproachToColorEh(StyleServices.GetSystemColor(GridLineParams.GetBrightColor), StyleServices.GetSystemColor(clWindow), 66);

      LineRect := CellRect;
      if UseRightToLeftAlignment then
        OffsetRect(LineRect,1,0);
      Canvas.Polyline([Point(LineRect.Right, LineRect.Top),
                       Point(LineRect.Right, LineRect.Bottom+1)]);
    end;
    Exclude(AState, gdFocused);
    Exclude(AState, gdSelected);
    Exclude(AState, gdHotTrack);
    if IsActiveControl and (ARow = Row) and ((SelectedIndex = i) or (dgRowSelect in Options))  then
      Include(AState, gdFocused);
    if (ARow = Row) and (SelectedIndex = i) then
      Include(AState, gdSelected);
    if (ARow = FHotTrackCell.Y) and (FHotTrackCell.X = i + FIndicatorOffset) then
      Include(AState, gdHotTrack);
    DrawDataCell(ACol, ARow, i, AreaRow, CellRect, AState, CellAreaType);
  end;
end;

procedure TCustomDBGridEh.DrawFooterAsRowPanel(ACol, ARow: Longint;
  AreaCol, AreaRow: Longint; ARect: TRect; AState: TGridDrawState;
  CellAreaType: TCellAreaTypeEh);
var
  i: Integer;
  Column: TColumnEh;
  CellRect: TRect;
  LineRect: TRect;
begin
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ARect);
  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    if not Column.Visible then Continue;
    CellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
      Column.FRowPlacement.Left + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    Inc(CellRect.Left, ARect.Left);
    Inc(CellRect.Right, ARect.Left);
    Inc(CellRect.Top, ARect.Top);
    Inc(CellRect.Bottom, ARect.Top);
    if CellRect.Bottom < ARect.Bottom then
    begin
      Canvas.Pen.Color := GridLineParams.GetBrightColor;
      Canvas.Polyline([Point(CellRect.Left, CellRect.Bottom),
                       Point(CellRect.Right+1, CellRect.Bottom)]);
    end;
    if CellRect.Right < ARect.Right then
    begin
      Canvas.Pen.Color := GridLineParams.GetBrightColor;
      LineRect := CellRect;
      if UseRightToLeftAlignment then
        OffsetRect(LineRect,1,0);
      Canvas.Polyline([Point(LineRect.Right, LineRect.Top),
                       Point(LineRect.Right, LineRect.Bottom+1)]);
    end;
    DrawFooterCell(ACol, ARow, i, AreaRow, CellRect, AState, CellAreaType);
  end;
end;

function TCustomDBGridEh.IsSmoothHorzScroll: Boolean;
begin
//  Result := inherited IsSmoothHorzScroll or RowPanel.Active;
  if Assigned(HorzScrollBar)
    then Result := HorzScrollBar.SmoothStep or RowPanel.Active
    else Result := inherited IsSmoothHorzScroll;
end;

function TCustomDBGridEh.IsSmoothVertScroll: Boolean;
begin
  if Assigned(VertScrollBar)
    then Result := VertScrollBar.SmoothStep
    else Result := inherited IsSmoothHorzScroll;
end;

function TCustomDBGridEh.GetOriginCol(): Integer;
begin
  Result := inherited Col;
end;

procedure TCustomDBGridEh.SetOriginCol(const Value: Integer);
begin
  inherited Col := Value;
end;

function TabSort(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if TColumnEh(List.Objects[Index1]).FRowPlacement.Left =
     TColumnEh(List.Objects[Index2]).FRowPlacement.Left
  then
    if TColumnEh(List.Objects[Index1]).FRowPlacement.Top =
       TColumnEh(List.Objects[Index2]).FRowPlacement.Top
      then
        if not TColumnEh(List.Objects[Index1]).Visible and TColumnEh(List.Objects[Index2]).Visible then
          Result := -1
        else if TColumnEh(List.Objects[Index1]).Visible and not TColumnEh(List.Objects[Index2]).Visible then
          Result := 1
        else
          Result := 0
    else if TColumnEh(List.Objects[Index1]).FRowPlacement.Top <
            TColumnEh(List.Objects[Index2]).FRowPlacement.Top
      then
        Result := -1
      else
        Result := 1
   else if TColumnEh(List.Objects[Index1]).FRowPlacement.Left <
           TColumnEh(List.Objects[Index2]).FRowPlacement.Left
      then
        Result := -1
      else
        Result := 1;
end;

procedure TCustomDBGridEh.ResetTabIndexedColumns;
var
  FTabSortList: TStringList;
  i: Integer;
begin
  if not RowPanel.Active then Exit;
  FTabSortList := TStringList.Create;
  for i := 0 to Columns.Count-1 do
    FTabSortList.AddObject('',Columns.Items[i]);

  FTabSortList.CustomSort(TabSort);
  Columns.BeginUpdate;
  for i := 0 to FTabSortList.Count-1 do
    TColumnEh(FTabSortList.Objects[i]).Index := i;
  Columns.EndUpdate;
  FTabSortList.Free;
end;

procedure TCustomDBGridEh.FocusCell(ACol, ARow: Longint; MoveAnchor: Boolean);
begin
  if RowPanel.Active then
  begin
    MoveColRow(ACol, ARow, MoveAnchor, False, True);
    ClampInViewRowPanelCell(SelectedIndex);
    UpdateEdit;
    Click;
  end else
    inherited FocusCell(ACol, ARow, MoveAnchor);
end;

procedure TCustomDBGridEh.ClampInViewRowPanelCell(DataCol: Integer);
var
  NewGridOffset: Integer;
  SmoothFromPos: Integer;
begin
  if not HandleAllocated then Exit;
  SmoothFromPos := FSmoothPos.X;
  if UseRightToLeftAlignment then
    SmoothFromPos := FGridDataSize.cx - SmoothFromPos - FDataPageSize.cx;
  if SmoothFromPos + ClientWidth <
    Columns[DataCol].FRowPlacement.DataCellLeft + Columns[DataCol].FRowPlacement.DataCellWidth
  then
  begin
    NewGridOffset := Columns[DataCol].FRowPlacement.DataCellLeft +
                     Columns[DataCol].FRowPlacement.DataCellWidth -
                     FDataPageSize.cx;
    if dgColLines in Options then Inc(NewGridOffset, GridLineWidth);
    if Columns[DataCol].FRowPlacement.DataCellWidth > FDataPageSize.cx then
      NewGridOffset := Columns[DataCol].FRowPlacement.DataCellLeft;
    SafeSmoothScrollData(NewGridOffset-SmoothFromPos, 0);
  end;

  if Columns[DataCol].FRowPlacement.DataCellLeft < SmoothFromPos
  then
  begin
    NewGridOffset := Columns[DataCol].FRowPlacement.DataCellLeft;
    SafeSmoothScrollData(NewGridOffset-SmoothFromPos, 0);
  end;

end;

procedure TCustomDBGridEh.SetColInRowPanel(DataCol: Integer);
begin
  if FInRowPanelCol <> DataCol then
  begin
    ClampInViewRowPanelCell(DataCol);
    FInRowPanelCol := DataCol;
    UpdateEdit;
    GridInvalidateRow(Self, Row);
  end;
end;

function TCustomDBGridEh.GetColumnInRowPanelAtPos(InCellPos: TPoint; IsTitleTypeCell: Boolean): TColumnEh;
var
  i: Integer;
  Column: TColumnEh;
  ACellRect: TRect;
begin
  Result := nil;
  if Self.UseRightToLeftAlignment then
    InCellPos.X := FGridMasterCellWidth - InCellPos.X;
  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    if IsTitleTypeCell then
      ACellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
      Column.FRowPlacement.Left + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height)
    else
      ACellRect := Rect(Column.FRowPlacement.DataCellLeft, Column.FRowPlacement.Top,
      Column.FRowPlacement.DataCellLeft + Column.FRowPlacement.DataCellWidth,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    if dgColLines in Options then Inc(ACellRect.Right, GridLineWidth);
    if dgRowLines in Options then Inc(ACellRect.Bottom, GridLineWidth);

    if PointInRect(InCellPos, ACellRect) then
    begin
      Result := Column;
      Exit;
    end;
  end;
end;

function TCustomDBGridEh.GetCellRectInRowPanelAtPos(InCellPos: TPoint;
  var ACellRect: TRect; IncludeLines: Boolean): TColumnEh;
var
  i: Integer;
  Column: TColumnEh;
begin
  Result := nil;
  ACellRect := EmptyRect;
  for i := 0 to Columns.Count-1 do
  begin
    Column := Columns[i];
    ACellRect := Rect(Column.FRowPlacement.Left, Column.FRowPlacement.Top,
      Column.FRowPlacement.Left + Column.FRowPlacement.Width,
      Column.FRowPlacement.Top + Column.FRowPlacement.Height);
    if IncludeLines then
    begin
      if dgColLines in Options then Inc(ACellRect.Right, GridLineWidth);
      if dgRowLines in Options then Inc(ACellRect.Bottom, GridLineWidth);
    end;
    
    if PointInRect(InCellPos, ACellRect) then
    begin
      Result := Column;
      Exit;
    end;
  end;
end;

function TCustomDBGridEh.EffectiveGridOptions: TGridOptions;
begin
  Result := Result + inherited Options;
  if csDesigning in ComponentState then
  begin
    Result := [goColSizing];
    if (Columns.State = csCustomized) then
    begin
      Result := Result + [goColMoving];
      if RowPanel.Active then
        Result := Result + [goRowSizing];
    end;
  end;
end;

procedure TCustomDBGridEh.SetRowDetailPanel(const Value: TRowDetailPanelEh);
begin
  FRowDetailPanel.Assign(Value);
end;

function TCustomDBGridEh.DrawDetailPanelSign(DataCol, DataRow: Integer;
  AState: TGridDrawState; ARect: TRect; Draw3DRect: Boolean): Integer;
var
  Multiselected: Boolean;
  AColor, OldColor: TColor;
  ARect1: TRect;
  TreeElement: TTreeElementEh;
begin
  Result := 0;
  if RowDetailPanel.Active then
  begin
    AColor := FInternalColor;
    Multiselected := DataCellSelected(DataCol, Datalink.Datasource.Dataset.Bookmark);
    if Multiselected and Assigned(Style) then
      Style.HighlightDataCellColor(Self, DataCol + IndicatorOffset, DataRow + TopDataOffset,
        DataCol, DataRow, '', AState, Multiselected, AColor, Canvas.Font);
    OldColor := Canvas.Brush.Color;
    Canvas.Brush.Color := AColor;

    ARect1 := ARect;
    ARect1.Right := ARect1.Left + 18;
    Result := 18;
    Canvas.FillRect(ARect1);
    if RowDetailPanel.Visible and (DataRow = Row - TopDataOffset)
      then TreeElement := tehMinus
      else TreeElement := tehPlus;

    DrawGridTreeElement(Canvas, ARect1, TreeElement,
      (FStdDefaultRowHeight mod 2 = 1) and (TopRow mod 2 = 1), 1, 1,
      UseRightToLeftAlignment, True, TreeViewParams.GetActualGlyphStyle);

    Canvas.Brush.Color := OldColor;
  end;
end;

procedure TCustomDBGridEh.UpdateRowDetailPanel;
var
  ARect: TRect;
  DrawInfo: TGridDrawInfoEh;
  NewLeft: Integer;
begin
  if not HandleAllocated then Exit;
  if FrozenCols > 0
    then ARect := CellRect(IndicatorOffset, Row)
    else ARect := CellRect(LeftCol, Row);
  if not FWholeGridChanged then
    ARect.Bottom := ARect.Top + CalcRowDataRowHeight(Row-TopDataOffset);
  if RowDetailPanel.Active and (RowDetailPanel.Visible or (csDesigning in ComponentState)) then
  begin
    FRowDetailControl.VertSizing := RowDetailPanel.VertSizing;
    FRowDetailControl.SizingBarHeight := RowDetailPanel.SizingBarHeight;
    FRowDetailControl.SizingBarBeveled := RowDetailPanel.SizingBarBeveled;
    FRowDetailControl.Constraints.MinHeight := RowDetailPanel.MinHeight;
    FRowDetailControl.Constraints.MaxHeight := RowDetailPanel.MaxHeight;
    if (TopRow > Row) or (TopRow + VisibleRowCount < Row) then
      FRowDetailControl.Visible := False
    else
    begin
      CalcDrawInfo(DrawInfo);
      FRowDetailControl.Top := ARect.Bottom;// + 1;
      if Self.UseRightToLeftAlignment
        then NewLeft := ClientWidth - ARect.Right + 18 + GetCellTreeElmentsAreaWidth + FExtraFirstColumnWidth
        else NewLeft := ARect.Left + 18 + GetCellTreeElmentsAreaWidth + FExtraFirstColumnWidth;
      if (RowDetailPanel.Width = 0) or (RowDetailPanel.Width > ClientWidth - NewLeft) then
        if RowDetailPanel.Width = 0
          then FRowDetailControl.Width := DrawInfo.Horz.FullGridBoundary - NewLeft - GridLineWidth
          else FRowDetailControl.Width := ClientWidth - NewLeft
      else
        FRowDetailControl.Width := RowDetailPanel.Width;

      if Self.UseRightToLeftAlignment
        then FRowDetailControl.Left := ClientWidth - (NewLeft + FRowDetailControl.Width)
        else FRowDetailControl.Left := NewLeft;

      if (RowDetailPanel.Height = 0) or (RowDetailPanel.Height > ClientHeight - FRowDetailControl.Top)
        then FRowDetailControl.Height := ClientHeight - FRowDetailControl.Top
        else FRowDetailControl.Height := RowDetailPanel.Height;
      FRowDetailControl.Visible := True;
{$IFDEF CIL}
{$ELSE}
      FRowDetailControl.BevelEdges := RowDetailPanel.BevelEdges;
      FRowDetailControl.BevelInner := RowDetailPanel.BevelInner;
      FRowDetailControl.BevelOuter := RowDetailPanel.BevelOuter;
      FRowDetailControl.BevelKind := RowDetailPanel.BevelKind;
      FRowDetailControl.BevelWidth := RowDetailPanel.BevelWidth;
      FRowDetailControl.BorderStyle := RowDetailPanel.BorderStyle;
      FRowDetailControl.Color := RowDetailPanel.Color;
      FRowDetailControl.ParentColor := RowDetailPanel.ParentColor;
{$ENDIF}

    end;
  end else
    FRowDetailControl.Visible := False;

  if (csDesigning in ComponentState) and not RowDetailPanel.Active then
    FRowDetailControl.SetBounds(0,0,0,0);
  if not FWholeGridChanged then
    UpdateDataRowHeight(Row-TopDataOffset);
end;

function TCustomDBGridEh.CheckMouseDownInRowDetailSign(Button: TMouseButton;
  Shift: TShiftState; MouseX, MouseY: Integer): Boolean;
var
  Cell: TGridCoord;
  ARect: TRect;
  Column: TColumnEh;
  CellAreaType: TCellAreaTypeEh;
  AreaCol, AreaRow: Integer;
  ADrawGroupDataNode: TGroupDataTreeNodeEh;
begin
  Result := False;
  Cell := MouseCoord(MouseX, MouseY);
  ARect := CellRect(Cell.X, Cell.Y);
  if (Cell.Y >= TopDataOffset) and (Cell.X >= IndicatorOffset) then
  begin
    Column := Columns[RawToDataColumn(Cell.X)];
    CellAreaType := GetCellAreaType(Cell.X, Cell.Y, AreaCol, AreaRow);
    if DataGrouping.IsGroupingWorks and
       (DataGrouping.GroupDataTree.FlatVisibleCount > 0) and
       (CellAreaType.HorzType = hctDataEh) and
       (CellAreaType.VertType in [vctDataEh]) then
    begin
      InstantReadRecordEnter(AreaRow);
      ADrawGroupDataNode := InstantReadCurDataNode;
      InstantReadRecordLeave;
      if ADrawGroupDataNode.NodeType in [dntDataGroupEh, dntDataGroupFooterEh] then
      begin
        Result := False;
        Exit;
      end
    end;

    if CheckDataCellMouseDownInRowDetailSign(Button, Shift, MouseX, MouseY,
        Cell, Column, ARect, MouseX-ARect.Left, MouseY-ARect.Top) then
    begin
      Result := True;
    end;
  end;
end;

function TCustomDBGridEh.CheckDataCellMouseDownInRowDetailSign(
  Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer; Cell: TGridCoord; Column: TColumnEh;
  ACellRect: TRect; InCellX, InCellY: Integer): Boolean;
var
  TreeAreaWidth, TreeViewWidth: Integer;
  RowDetailPanelAvailable: Boolean;
begin
  TreeAreaWidth := 18;
  TreeViewWidth := GetCellTreeElmentsAreaWidth;
  if not RowPanel.Active then
    TreeViewWidth := TreeViewWidth + FExtraFirstColumnWidth;
  Result := False;
  RowDetailPanelAvailable := RowDetailPanel.Active;
  if Assigned(OnCheckRowHaveDetailPanel) then
    OnCheckRowHaveDetailPanel(Self, RowDetailPanelAvailable);
  if not RowDetailPanelAvailable then Exit;
  if Column <> VisibleColumns[0] then
    Exit;

  if {Column.}UseRightToLeftAlignment then
    InCellX := (ACellRect.Right - ACellRect.Left) - InCellX;
  if (InCellX >= TreeViewWidth ) and (InCellX < TreeAreaWidth + TreeViewWidth) then
      Result := True;
end;

function TCustomDBGridEh.CellEditRect(ACol, ARow: Longint): TRect;
var
  NewHeight: Integer;
begin
  Result := inherited CellEditRect(ACol, ARow);
  if DataGrouping.IsGroupingWorksWithLevel and
     (InstantReadRecordCount > 0) and
     (ACol = DataToRawColumn(VisibleColumns[0].Index)) then
  begin
    Result.Left := Result.Left + FExtraFirstColumnWidth;
    if (ARow >= TopDataOffset) and GridLineParams.DataHorzLines then
      Dec(Result.Bottom, GridLineWidth)
  end;
  if RowDetailPanel.Active and (ACol = FIndicatorOffset) then
    if UseRightToLeftAlignment then
    begin
      if Result.Right - 18 > Result.Left then
        Result.Right := Result.Right - 18;
    end else
    begin
      if Result.Left + 18 < Result.Right then
        Result.Left := Result.Left + 18;
    end;
  if RowDetailPanel.Visible and (Row = ARow) then
  begin
    NewHeight := CalcRowDataRowHeight(ARow-TopDataOffset);
    if Result.Bottom - Result.Top > NewHeight then
    begin
      Result.Bottom := Result.Top + NewHeight;
    end;
  end;
end;

function TCustomDBGridEh.MoveBy(Distance: Integer): Integer;
begin
  Result := 0;
  if RowDetailPanel.Visible and DataLink.Active then
    RowDetailPanel.Visible := False;
  if not RowDetailPanel.Visible then
    if FDataGrouping.IsGroupingWorks
      then Result := DataGroupsMoveBy(Distance, False)
      else Result := DataLink.MoveBy(Distance);
end;

procedure TCustomDBGridEh.CancelEditing;
var
  UseInternalUpdatingDatasetPos: Boolean;
begin
  if FDataGrouping.IsGroupingWorks and
    (DataLink.DataSet.State = dsInsert) and
    (FCurGroupDataNode <> nil) and
    FCurGroupDataNode.RecordNodeLastInGroup
  then
    if DataLink.Dataset.Eof then
      DataLink.Dataset.Cancel
    else
    begin
      UseInternalUpdatingDatasetPos := False;
      if not FInternalUpdatingDatasetPos then
      begin
        FInternalUpdatingDatasetPos := True;
        UseInternalUpdatingDatasetPos := True;
      end;
      try
        DataLink.Dataset.Prior
      finally
        if UseInternalUpdatingDatasetPos then
        begin
          FInternalUpdatingDatasetPos := False;
          DataGroupsGotoRecordViewNo(FIntMemTable.InstantReadCurRowNum, False);;
        end;
      end;
    end
  else
    DataLink.Dataset.Cancel;
end;

function TCustomDBGridEh.GetEof: Boolean;
begin
  if FDataGrouping.IsGroupingWorks
    then Result := FCurGroupDataListEof
    else Result := DataLink.Eof;
end;

function TCustomDBGridEh.GetBof: Boolean;
begin
  if FDataGrouping.IsGroupingWorks
    then Result := FCurGroupDataListBof
    else Result := DataLink.Bof;
end;

function TCustomDBGridEh.CheckTitleCellFilterButtonPos(MousePos: TPoint;
  CellRect: TRect; Column: TColumnEh; var StateRect: TRect): Boolean;
var
  FilterButtonWidth: Integer;
begin
  Result := False;
  if Flat then
  begin
    FilterButtonWidth := FlatButtonWidth;
    if not ThemesEnabled then
      Inc(FilterButtonWidth);
  end else
    FilterButtonWidth := GetSystemMetrics(SM_CXVSCROLL);

  if dghFixed3D in OptionsEh then
    InflateRect(CellRect, -1, -1);

  if (CellRect.Right - CellRect.Left) div 2 < FilterButtonWidth then
    FilterButtonWidth := (CellRect.Right - CellRect.Left) div 2;

  StateRect := CellRect;
  if UseRightToLeftAlignment then
  begin
    StateRect.Left := CellRect.Left;
    StateRect.Right := StateRect.Left + FilterButtonWidth;
  end else
  begin
    StateRect.Right := CellRect.Right;
    StateRect.Left := StateRect.Right - FilterButtonWidth;
  end;
  if StateRect.Bottom - StateRect.Top > FInplaceEditorButtonHeight then
  begin
    StateRect.Top := (StateRect.Bottom + StateRect.Top -
      FInplaceEditorButtonHeight) div 2;
    StateRect.Bottom := StateRect.Top + FInplaceEditorButtonHeight;
  end;

  if PtInRect(StateRect, MousePos) then
    Result := True;
end;

function TCustomDBGridEh.GetMouseHitCellState(Cell: TGridCoord; MousePos: TPoint;
  CellRect: TRect; Column: TColumnEh; var StateRect: TRect): TDBGridEhState;
var
  BaseCellRect: TRect;
  InCellPos: TPoint;
begin
  Result := dgsNormal;
  if (dgTitles in Options) and (Cell.Y = 0) and (Cell.X >= FIndicatorOffset) and
    STFilter.Visible and Column.STFilter.Visible and
    (STFilter.Location = stflInTitleFilterEh) then
  begin
    if IsUseMultiTitle then
      CellRect := Rect(CellRect.Left,
                       CellRect.Bottom - FLeafFieldArr[Cell.X - IndicatorOffset].FLeaf.Height,
                       CellRect.Right,
                       CellRect.Bottom)
    else if RowPanel.Active then
    begin
      BaseCellRect := CellRect;
      InCellPos := Point(MousePos.X-CellRect.Left+FDataOffset.cx, MousePos.Y-CellRect.Top);
      Column := GetCellRectInRowPanelAtPos(InCellPos, CellRect, False);
      OffsetRect(CellRect, BaseCellRect.Left, BaseCellRect.Top);
      OffsetRect(CellRect, -FDataOffset.cx, 0);
      if Column = nil then Exit;
    end;

    if CheckTitleCellFilterButtonPos(MousePos,  CellRect, Column, StateRect)
    then
      Result := dgsTitleFilterButtonDown;
  end;
end;

function TCustomDBGridEh.GetDataLink: TGridDataLinkEh;
begin
  Result := TGridDataLinkEh(inherited DataLink);
end;

{ TDBGridEhDataGroupLevelEh }

function TDBGridEhDataGroupLevelEh.GetColumn: TColumnEh;
begin
  Result := TColumnEh(inherited Column);
end;

function TDBGridEhDataGroupLevelEh.GetColumnName: String;
begin
  Result := '';
  if Column <> nil then
    Result := Column.Name;
end;

procedure TDBGridEhDataGroupLevelEh.SetColumnName(const Value: String);
var
  Grid: TCustomDBGridEh;
begin
  Grid := TCustomDBGridEh(TGridDataGroupLevelsEh(Collection).Grid);
  if csLoading in Grid.ComponentState
    then FLoadingColumnName := Value
    else Column := TCustomDBGridEh(TGridDataGroupLevelsEh(Collection).Grid).Columns.FindColumnByName(Value);
end;

procedure TDBGridEhDataGroupLevelEh.SetColumn(const Value: TColumnEh);
begin
  inherited Column := Value;
end;

function TDBGridEhDataGroupLevelEh.GetKeyValue: Variant;
begin
  Result := inherited GetKeyValue;
  if Assigned(Column) and Assigned(Column.OnGroupGetKeyValue) then
    Column.OnGroupGetKeyValue(Column.Grid, Column, Result);
  if Assigned(OnGetKeyValue) and Assigned(Column) then
    OnGetKeyValue(Column.Grid, Self, Result);
end;

function TDBGridEhDataGroupLevelEh.GetKeyValueAsText(GroupDataTreeNode: TGroupDataTreeNodeEh): String;
begin
  if Assigned(Column)
    then Result := Column.DisplayText
    else Result := VarToStr(GroupDataTreeNode.KeyValue);
  if Assigned(Column) and Assigned(Column.OnGroupGetKeyValueAsText) then
    Column.OnGroupGetKeyValueAsText(Column.Grid, GroupDataTreeNode, GroupDataTreeNode.KeyValue, Result);
  if Assigned(OnGetKeyValueAsText) and Assigned(Column) then
    OnGetKeyValueAsText(Column.Grid, GroupDataTreeNode, GroupDataTreeNode.KeyValue, Result);
end;

function TDBGridEhDataGroupLevelEh.GetGroupRowText(GroupDataTreeNode: TGroupDataTreeNodeEh): String;
begin
  if Assigned(GroupDataTreeNode.DataGroupLevel.Column) then
    Result := TColumnEh(GroupDataTreeNode.DataGroupLevel.Column).Title.Caption + ': ';
  Result := Result + GroupDataTreeNode.DisplayValue;
  Result := Result + ' ('+IntToStr(GroupDataTreeNode.Count)+')';
  if Assigned(Column) and Assigned(Column.Grid.OnDataGroupGetRowText) then
    Column.Grid.OnDataGroupGetRowText(Column.Grid, GroupDataTreeNode, Result);
  if Assigned(OnGetGroupRowText) and Assigned(Column) then
    OnGetGroupRowText(Column.Grid, GroupDataTreeNode, Result);
end;

procedure TDBGridEhDataGroupLevelEh.DrawFormatChanged;
begin
  if (Column <> nil) and (Column.Grid <> nil) then
  begin
    Column.Grid.Invalidate;
    Column.Grid.UpdateAllDataRowHeights;
  end;
end;

procedure TDBGridEhDataGroupLevelEh.Assign(Source: TPersistent);
var
  Src: TDBGridEhDataGroupLevelEh;
begin
  if Source is TDBGridEhDataGroupLevelEh then
  begin
    Src := Source as TDBGridEhDataGroupLevelEh;

    Color := Src.Color;
    ColumnName := Src.ColumnName;
    Font := Src.Font;
    ParentColor := Src.ParentColor;
    ParentFont := Src.ParentFont;
    SortOrder := Src.SortOrder;
    RowHeight := Src.RowHeight;
    RowHeightStored := Src.RowHeightStored;
    RowLines := Src.RowLines;
    RowLinesStored := Src.RowLinesStored;

    OnGetKeyValue := Src.OnGetKeyValue;
    OnGetKeyValueAsText := Src.OnGetKeyValueAsText;
    OnGetGroupRowText := Src.OnGetGroupRowText;
  end else
    inherited Assign(Source);
end;

{ TDBGridEhDataGroupsEh }

constructor TDBGridEhDataGroupsEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create(AGrid);
  FHotTrackGroupLevelIdx := -1;
  FGroupPanel := TDBGridEhGroupingPanelEh.Create(Self);
end;

destructor TDBGridEhDataGroupsEh.Destroy;
begin
  FreeAndNil(FGroupPanel);
  inherited Destroy;
end;

procedure TDBGridEhDataGroupsEh.ActiveChanged;
begin
  if Active and
        (csDesigning in Grid.ComponentState) and
    not (csLoading in Grid.ComponentState) and
        Grid.DataLink.Active and
    not Grid.MemTableSupport
  then
    ShowMessage('DataSet doesn''t support IMemTableEh interface. Grouping won''t work.');
  Grid.LinkActive(TCustomDBGridEh(GetOwner).DataLink.Active);
  Grid.GroupPanelVisibleChanged;
  if Assigned(Grid.OnActiveGroupingStructChanged) then
    Grid.OnActiveGroupingStructChanged(Grid);
end;

procedure TDBGridEhDataGroupsEh.ActiveGroupingStructChanged;
begin
//  if csDesigning in TCustomDBGridEh(GetOwner).ComponentState then
    TCustomDBGridEh(GetOwner).MTViewDataEvent(-1, mtViewDataChangedEh, -1);
  TCustomDBGridEh(GetOwner).GroupPanelVisibleChanged;
  if Assigned(Grid.OnActiveGroupingStructChanged) then
    Grid.OnActiveGroupingStructChanged(Grid);
end;

procedure TDBGridEhDataGroupsEh.ColumnDeleting(Item: TColumnEh);
var
  i: Integer;
begin
  for i := 0 to GroupLevels.Count-1 do
    if GroupLevels[i].Column = Item then
    begin
      GroupLevels[i].Column := nil;
    end;
end;

function TDBGridEhDataGroupsEh.CreateGroupLevels: TGridDataGroupLevelsEh;
begin
  Result := TGridDataGroupLevelsEh.Create(Self, TDBGridEhDataGroupLevelEh);
end;

procedure TDBGridEhDataGroupsEh.ResetGroupLevelNames;
var
  i: Integer;
begin
  for i := 0 to GroupLevels.Count-1 do
    TDBGridEhDataGroupLevelEh(GroupLevels[i]).ColumnName := TDBGridEhDataGroupLevelEh(GroupLevels[i]).FLoadingColumnName;
  ColumnsLoaded;
end;

function TDBGridEhDataGroupsEh.IsGroupingWorks: Boolean;
begin
  Result := Active and
            TCustomDBGridEh(GetOwner).MemTableSupport and
            TCustomDBGridEh(GetOwner).DataLink.Active;
//        and (ActiveGroupLevelsCount > 0);
end;

function TDBGridEhDataGroupsEh.IsGroupingWorksWithLevel: Boolean;
begin
  Result := IsGroupingWorks and (ActiveGroupLevelsCount > 0);
end;

procedure TDBGridEhDataGroupsEh.RebuildActiveGroupLevels;
begin
  inherited RebuildActiveGroupLevels;
  FHotTrackGroupLevelIdx := -1;
  if Grid.DataLink.Active then
    Grid.DoSortMarkingChanged;
end;

procedure TDBGridEhDataGroupsEh.ResortActiveLevel(LevelIndex: Integer;
  SortOrder: TSortOrderEh);
begin
  inherited ResortActiveLevel(LevelIndex, SortOrder);
  if Grid.DataLink.Active then
    Grid.DoSortMarkingChanged;
end;

function TDBGridEhDataGroupsEh.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(GetOwner);
end;

function TDBGridEhDataGroupsEh.DefaultFooterColor: TColor;
begin
  Result := Grid.FooterParams.GetColor;
end;

function TDBGridEhDataGroupsEh.DefaultFooterFont: TFont;
begin
  Result := Grid.FooterFont;
end;

procedure TDBGridEhDataGroupsEh.DrawFormatChanged;
begin
  Grid.Invalidate;
  Grid.UpdateAllDataRowHeights;
end;

procedure TDBGridEhDataGroupsEh.SetGroupPanel(const Value: TDBGridEhGroupingPanelEh);
begin
  FGroupPanel.Assign(Value);
end;

function TDBGridEhDataGroupsEh.GetCurDataNode: TGroupDataTreeNodeEh;
begin
  if (Grid <> nil)
    then Result := Grid.FCurGroupDataNode
    else Result := nil;
end;

{ TDBGridEhGroupingPanelEh }

constructor TDBGridEhGroupingPanelEh.Create(ADataGroups: TDBGridEhDataGroupsEh);
begin
  inherited Create;
  FDataGroups := ADataGroups;
  FColor := clDefault;
end;

function TDBGridEhGroupingPanelEh.GetColor: TColor;
begin
  if FColor = clDefault
    then Result := FDataGroups.Grid.Style.GetGroupPanelColor(FDataGroups.Grid)
    else Result := FColor;
end;

procedure TDBGridEhGroupingPanelEh.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FDataGroups.Grid.Invalidate;
  end;
end;

{ TDBGridLineParamsEh }

constructor TDBGridLineParamsEh.Create(AGrid: TCustomGridEh);
begin
  inherited Create(AGrid);
end;

function TDBGridLineParamsEh.GetActualColorScheme: TDBGridLinesColorSchemeEh;
begin
  if ColorScheme = glcsDefaultEh then
  begin
    if Grid.TitleParams.GetActualFillStyle = cfstThemedEh then
      Result := glcsThemedEh
    else if not ThemesEnabled and not Grid.Flat then
      Result := glcsClassicEh
    else
      Result := glcsFlatEh;
  end else
    Result := ColorScheme;
end;

function TDBGridLineParamsEh.DefaultDataHorzLines: Boolean;
begin
  Result := (dgRowLines in Grid.Options);
end;

function TDBGridLineParamsEh.DefaultDataVertLines: Boolean;
begin
  Result := (dgColLines in Grid.Options);
end;

function TDBGridLineParamsEh.GetGrid: TCustomDBGridEh;
begin
  Result := TCustomDBGridEh(inherited Grid);
end;

function TDBGridLineParamsEh.GetVertAreaContraVertColor: TColor;
begin
  if VertAreaContraVertColor = clDefault then
  begin
    if (dghFooter3D in Grid.OptionsEh) or (Grid.FooterParams.GetColor <> clWindow)
      then Result := GetDarkColor
      else Result := GetBrightColor;
  end else
    Result := VertAreaContraVertColor;
end;

procedure TDBGridLineParamsEh.SetVertEmptySpaceStyle(const Value: TDrawEmptySpaceStyle);
var
  OldValue: TDrawEmptySpaceStyle;
begin
  if Value <> VertEmptySpaceStyle then
  begin
    OldValue := VertEmptySpaceStyle;
    inherited SetVertEmptySpaceStyle(Value);
    if OldValue = dessNonEh then
      Grid.FOptionsEh := Grid.FOptionsEh + [dghExtendVertLines]
    else if VertEmptySpaceStyle = dessNonEh then
      Grid.FOptionsEh := Grid.FOptionsEh - [dghExtendVertLines];
    if dghExtendVertLines in Grid.FOptionsEh
      then Grid.SetBaseGridOptions(Grid.GetBaseGridOptions + [goExtendVertLines])
      else Grid.SetBaseGridOptions(Grid.GetBaseGridOptions - [goExtendVertLines]);
    Grid.Invalidate;
  end;
end;

{ TDBGridTitleParamsEh }

constructor TDBGridTitleParamsEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  RefreshDefaultFont;
  FColor := clDefault;
  FVTitleMargin := 10;
  FHorzLineColor := clDefault;
  FVertLineColor := clDefault;
  FFillStyle := cfstDefaultEh;
  FParentFont := True;
end;

destructor TDBGridTitleParamsEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited Destroy;
end;

procedure TDBGridTitleParamsEh.FontChanged(Sender: TObject);
begin
  if (not FGrid.FSelfChangingTitleFont) and not (csLoading in FGrid.ComponentState) then
    ParentFont := False;
  if dgTitles in FGrid.Options then FGrid.LayoutChanged;
end;


procedure TDBGridTitleParamsEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

function TDBGridTitleParamsEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

function TDBGridTitleParamsEh.GetVertLineColor: TColor;
begin
  if FVertLineColor = clDefault
    then Result := DefaultVertLineColor
    else Result := FVertLineColor;
end;

procedure TDBGridTitleParamsEh.SetVertLineColor(const Value: TColor);
begin
  if FVertLineColor <> Value then
  begin
    FVertLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.DefaultVertLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor;
end;

function TDBGridTitleParamsEh.GetVertLines: Boolean;
begin
  if VertLinesStored
    then Result := FVertLines
    else Result := DefaultVertLines;
end;

procedure TDBGridTitleParamsEh.SetVertLines(const Value: Boolean);
begin
  if VertLinesStored and (Value = FVertLines) then Exit;
  VertLinesStored := True;
  FVertLines := Value;
  if Grid.UseMultiTitle
    then Grid.LayoutChanged
    else Grid.Invalidate;
end;

function TDBGridTitleParamsEh.IsVertLinesStored: Boolean;
begin
  Result := FVertLinesStored;
end;

procedure TDBGridTitleParamsEh.SetVertLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsVertLinesStored = False) then
  begin
    FVertLinesStored := True;
    FVertLines := DefaultVertLines;
    if Grid.UseMultiTitle
      then Grid.LayoutChanged
      else Grid.Invalidate;
  end else if (Value = False) and (IsVertLinesStored = True) then
  begin
    FVertLinesStored := False;
    FVertLines := DefaultVertLines;
    if Grid.UseMultiTitle
      then Grid.LayoutChanged
      else Grid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.DefaultVertLines: Boolean;
begin
  Result := (dgColLines in Grid.Options);
end;

function TDBGridTitleParamsEh.GetHorzLineColor: TColor;
begin
  if FHorzLineColor = clDefault
    then Result := DefaultHorzLineColor
    else Result := FHorzLineColor;
end;

procedure TDBGridTitleParamsEh.SetHorzLineColor(const Value: TColor);
begin
  if FHorzLineColor <> Value then
  begin
    FHorzLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.DefaultHorzLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor;
end;

function TDBGridTitleParamsEh.GetHorzLines: Boolean;
begin
  if HorzLinesStored
    then Result := FHorzLines
    else Result := DefaultHorzLines;
end;

procedure TDBGridTitleParamsEh.SetHorzLines(const Value: Boolean);
begin
  if HorzLinesStored and (Value = FHorzLines) then Exit;
  HorzLinesStored := True;
  FHorzLines := Value;
  if Grid.UseMultiTitle
    then Grid.LayoutChanged
    else Grid.Invalidate;
end;

function TDBGridTitleParamsEh.IsHorzLinesStored: Boolean;
begin
  Result := FHorzLinesStored;
end;

procedure TDBGridTitleParamsEh.SetHorzLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsHorzLinesStored = False) then
  begin
    FHorzLinesStored := True;
    FHorzLines := DefaultHorzLines;
    if Grid.UseMultiTitle
      then Grid.LayoutChanged
      else Grid.Invalidate;
  end else if (Value = False) and (IsHorzLinesStored = True) then
  begin
    FHorzLinesStored := False;
    FHorzLines := DefaultHorzLines;
    if Grid.UseMultiTitle
      then Grid.LayoutChanged
      else Grid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.DefaultHorzLines: Boolean;
begin
  Result := (dgRowLines in Grid.Options);
end;

function TDBGridTitleParamsEh.DefaultColor: TColor;
begin
  Result := FGrid.FixedColor;
end;

function TDBGridTitleParamsEh.GetActualFillStyle: TGridCellFillStyleEh;
begin
  if FillStyle <> cfstDefaultEh then
  begin
    Result := FillStyle;
    if (Result = cfstThemedEh) and not ThemesEnabled  then
      if (dghFixed3D in FGrid.OptionsEh)
        then Result := cfstGradientEh
        else Result := cfstSolidEh;
    if (Result = cfstGradientEh) and not ThemesEnabled and not FGrid.Style.GradientEnabledInClassicTheme then
      Result := cfstSolidEh;
  end else if FGrid.Flat then
    if (dghFixed3D in FGrid.OptionsEh) and ThemesEnabled
      then Result := cfstGradientEh
      else Result := cfstSolidEh
  else
    if (dghFixed3D in FGrid.OptionsEh) and ThemesEnabled
      then Result := cfstThemedEh
      else Result := cfstSolidEh;
end;

function TDBGridTitleParamsEh.GetColor: TColor;
begin
  if ColorStored
    then Result := FColor
    else Result := DefaultColor;
end;

function TDBGridTitleParamsEh.IsColorStored: Boolean;
begin
  Result := FColorStored;
end;

procedure TDBGridTitleParamsEh.SetColor(const Value: TColor);
begin
  if ColorStored and (Value = FColor) then Exit;
  ColorStored := True;
  FColor := Value;
  FGrid.Invalidate;
end;

procedure TDBGridTitleParamsEh.SetColorStored(const Value: Boolean);
begin
  if (Value = True) and (IsColorStored = False) then
  begin
    FColorStored := True;
    FColor := DefaultColor;
    FGrid.Invalidate;
  end else if (Value = False) and (IsColorStored = True) then
  begin
    FColorStored := False;
    FColor := DefaultColor;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridTitleParamsEh.SetBorderInFillStyle(const Value: Boolean);
begin
  if FBorderInFillStyle <> Value then
  begin
    FBorderInFillStyle := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBGridTitleParamsEh.SetFillStyle(const Value: TGridCellFillStyleEh);
begin
  if FFillStyle <> Value then
  begin
    FFillStyle := Value;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridTitleParamsEh.SetImages(const Value: TCustomImageList);
begin
  if FImages <> nil then FImages.UnRegisterChanges(FGrid.FTitleImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FGrid.FTitleImageChangeLink);
    FImages.FreeNotification(FGrid);
  end;
  FGrid.LayoutChanged;
end;

procedure TDBGridTitleParamsEh.SetMultiTitle(const Value: Boolean);
begin
  if FMultiTitle <> Value then
  begin
    FMultiTitle := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBGridTitleParamsEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridTitleParamsEh.SetPopupMenu(Value: TPopupMenu);
begin
  if FPopupMenu <> Value then
    begin
      FPopupMenu := Value;
      if Value <> nil then Value.FreeNotification(Grid);
    end;
end;

procedure TDBGridTitleParamsEh.SetRowHeight(const Value: Integer);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    if FGrid.DataGrouping.GroupPanelVisible
      then FGrid.GroupPanelVisibleChanged
      else FGrid.LayoutChanged;
  end;
end;

procedure TDBGridTitleParamsEh.SetRowLines(const Value: Integer);
begin
  if FRowLines <> Value then
  begin
    FRowLines := Value;
    if FGrid.DataGrouping.GroupPanelVisible
      then FGrid.GroupPanelVisibleChanged
      else FGrid.LayoutChanged;
  end;
end;

procedure TDBGridTitleParamsEh.SetVTitleMargin(const Value: Integer);
begin
  if FVTitleMargin <> Value then
  begin
    FVTitleMargin := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBGridTitleParamsEh.RefreshDefaultFont;
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

function TDBGridTitleParamsEh.DefaultFont: TFont;
begin
  Result := FGrid.Font;
end;

function TDBGridTitleParamsEh.GetSortMarkerStyle: TSortMarkerStyleEh;
begin
  if SortMarkerStyleStored
    then Result := FSortMarkerStyle
    else Result := DefaultSortMarkerStyle;
end;

procedure TDBGridTitleParamsEh.SetSortMarkerStyle(const Value: TSortMarkerStyleEh);
begin
  if SortMarkerStyleStored and (Value = FSortMarkerStyle) then Exit;
  SortMarkerStyleStored := True;
  FSortMarkerStyle := Value;
  FGrid.Invalidate;
end;

function TDBGridTitleParamsEh.IsSortMarkerStyleStored: Boolean;
begin
  Result := FSortMarkerStyleStored;
end;

procedure TDBGridTitleParamsEh.SetSortMarkerStyleStored(const Value: Boolean);
begin
  if (Value = True) and (IsSortMarkerStyleStored = False) then
  begin
    FSortMarkerStyleStored := True;
    FSortMarkerStyle := DefaultSortMarkerStyle;
    FGrid.Invalidate;
  end else if (Value = False) and (IsSortMarkerStyleStored = True) then
  begin
    FSortMarkerStyleStored := False;
    FSortMarkerStyle := DefaultSortMarkerStyle;
    FGrid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.DefaultSortMarkerStyle: TSortMarkerStyleEh;
begin
  Result := FGrid.Style.SortMarkerStyle;
end;

function TDBGridTitleParamsEh.GetSecondColor: TColor;
begin
  if SecondColorStored
    then Result := FSecondColor
    else Result := DefaultSecondColor;
end;

procedure TDBGridTitleParamsEh.SetSecondColor(const Value: TColor);
begin
  if SecondColorStored and (Value = FSecondColor) then Exit;
  SecondColorStored := True;
  FSecondColor := Value;
  FGrid.Invalidate;
end;

procedure TDBGridTitleParamsEh.SetSecondColorStored(const Value: Boolean);
begin
  if (Value = True) and (IsSecondColorStored = False) then
  begin
    FSecondColorStored := True;
    FSecondColor := DefaultSecondColor;
    FGrid.Invalidate;
  end else if (Value = False) and (IsSecondColorStored = True) then
  begin
    FSecondColorStored := False;
    FSecondColor := DefaultSecondColor;
    FGrid.Invalidate;
  end;
end;

function TDBGridTitleParamsEh.IsSecondColorStored: Boolean;
begin
  Result := FSecondColorStored;
end;

function TDBGridTitleParamsEh.DefaultSecondColor: TColor;
begin
  Result := FGrid.Color;
end;

{ TDBGridIndicatorParamsEh }

constructor TDBGridIndicatorParamsEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FColor := clDefault;
  FHorzLineColor := clDefault;
  FVertLineColor := clDefault;
  FFillStyle := cfstDefaultEh;
  FRecNoShowStep := 1;
end;

destructor TDBGridIndicatorParamsEh.Destroy;
begin
  inherited Destroy;
end;

function TDBGridIndicatorParamsEh.GetColor: TColor;
begin
  if ColorStored
    then Result := FColor
    else Result := DefaultColor;
end;

function TDBGridIndicatorParamsEh.DefaultColor: TColor;
begin
  Result := FGrid.FixedColor;
end;

function TDBGridIndicatorParamsEh.IsColorStored: Boolean;
begin
  Result := FColorStored;
end;

procedure TDBGridIndicatorParamsEh.SetColor(const Value: TColor);
begin
  if ColorStored and (Value = FColor) then Exit;
  ColorStored := True;
  FColor := Value;
  FGrid.Invalidate;
end;

procedure TDBGridIndicatorParamsEh.SetColorStored(const Value: Boolean);
begin
  if (Value = True) and (IsColorStored = False) then
  begin
    FColorStored := True;
    FColor := DefaultColor;
    FGrid.Invalidate;
  end else if (Value = False) and (IsColorStored = True) then
  begin
    FColorStored := False;
    FColor := DefaultColor;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridIndicatorParamsEh.SetHorzLineColor(const Value: TColor);
begin
  if FHorzLineColor <> Value then
  begin
    FHorzLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridIndicatorParamsEh.GetHorzLineColor: TColor;
begin
  if FHorzLineColor = clDefault
    then Result := DefaultHorzLineColor
    else Result := FHorzLineColor;
end;

function TDBGridIndicatorParamsEh.DefaultHorzLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor
end;

function TDBGridIndicatorParamsEh.GetHorzLines: Boolean;
begin
  if HorzLinesStored
    then Result := FHorzLines
    else Result := DefaultHorzLines;
end;

procedure TDBGridIndicatorParamsEh.SetHorzLines(const Value: Boolean);
begin
  if HorzLinesStored and (Value = FHorzLines) then Exit;
  HorzLinesStored := True;
  FHorzLines := Value;
  Grid.Invalidate;
end;

function TDBGridIndicatorParamsEh.IsHorzLinesStored: Boolean;
begin
  Result := FHorzLinesStored;
end;

procedure TDBGridIndicatorParamsEh.SetHorzLinesStored(const Value: Boolean);
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

procedure TDBGridIndicatorParamsEh.SetRecNoShowStep(const Value: Integer);
begin
  if FRecNoShowStep <> Value then
  begin
    FRecNoShowStep := Value;
    Grid.Invalidate;
  end;
end;

function TDBGridIndicatorParamsEh.DefaultHorzLines: Boolean;
begin
  Result := (dgRowLines in Grid.Options);
end;

// VertLines and Color

procedure TDBGridIndicatorParamsEh.SetVertLineColor(const Value: TColor);
begin
  if FVertLineColor <> Value then
  begin
    FVertLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridIndicatorParamsEh.DefaultVertLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor
end;

function TDBGridIndicatorParamsEh.GetVertLineColor: TColor;
begin
  if FVertLineColor = clDefault
    then Result := DefaultVertLineColor
    else Result := FVertLineColor;
end;

function TDBGridIndicatorParamsEh.GetVertLines: Boolean;
begin
  if VertLinesStored
    then Result := FVertLines
    else Result := DefaultVertLines;
end;

procedure TDBGridIndicatorParamsEh.SetVertLines(const Value: Boolean);
begin
  if VertLinesStored and (Value = FVertLines) then Exit;
  VertLinesStored := True;
  FVertLines := Value;
  Grid.Invalidate;
end;

function TDBGridIndicatorParamsEh.IsVertLinesStored: Boolean;
begin
  Result := FVertLinesStored;
end;

procedure TDBGridIndicatorParamsEh.SetVertLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsVertLinesStored = False) then
  begin
    FVertLinesStored := True;
    FVertLines := DefaultVertLines;
    Grid.Invalidate;
  end else if (Value = False) and (IsVertLinesStored = True) then
  begin
    FVertLinesStored := False;
    FVertLines := DefaultVertLines;
    Grid.Invalidate;
  end;
end;

function TDBGridIndicatorParamsEh.DefaultVertLines: Boolean;
begin
  Result := (dgColLines in Grid.Options);
end;

function TDBGridIndicatorParamsEh.GetActualFillStyle: TGridCellFillStyleEh;
begin
  if FillStyle <> cfstDefaultEh then
  begin
    Result := FillStyle;
    if (Result = cfstGradientEh) and not ThemesEnabled and not FGrid.Style.GradientEnabledInClassicTheme
      then Result := cfstSolidEh;
  end else if FGrid.Flat then
    if (dghFixed3D in FGrid.OptionsEh) and ThemesEnabled
      then Result := cfstGradientEh
      else Result := cfstSolidEh
  else
    if (dghFixed3D in FGrid.OptionsEh) and ThemesEnabled
      then Result := cfstThemedEh
      else Result := cfstSolidEh;
end;

procedure TDBGridIndicatorParamsEh.SetFillStyle(const Value: TGridCellFillStyleEh);
begin
  if FFillStyle <> Value then
  begin
    FFillStyle := Value;
    FGrid.Invalidate;
  end;
end;

{ TDBGridFooterParamsEh }

constructor TDBGridFooterParamsEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FColor := clDefault;
  FHorzLineColor := clDefault;
  FVertLineColor := clDefault;
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  FParentFont := True;
  RefreshDefaultFont;
end;

destructor TDBGridFooterParamsEh.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

procedure TDBGridFooterParamsEh.RefreshDefaultFont;
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

function TDBGridFooterParamsEh.DefaultFont: TFont;
begin
  Result := FGrid.Font;
end;

procedure TDBGridFooterParamsEh.FontChanged(Sender: TObject);
begin
  if (not FGrid.FSelfChangingFooterFont) and not (csLoading in FGrid.ComponentState) then
    ParentFont := False;
  FGrid.LayoutChanged;
end;

procedure TDBGridFooterParamsEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TDBGridFooterParamsEh.SetParentFont(const Value: Boolean);
begin
  if FParentFont <> Value then
  begin
    FParentFont := Value;
    RefreshDefaultFont;
    FGrid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.IsFontStored: Boolean;
begin
  Result := not ParentFont;
end;

procedure TDBGridFooterParamsEh.SetColor(const Value: TColor);
begin
  if Value <> FColor then
  begin
    FColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.GetColor: TColor;
begin
  if Color = clDefault
    then Result := FGrid.Color
    else Result := Color;
end;

// HorzLines and Colors

function TDBGridFooterParamsEh.GetHorzLineColor: TColor;
begin
  if FHorzLineColor = clDefault
    then Result := DefaultHorzLineColor
    else Result := FHorzLineColor;
end;

procedure TDBGridFooterParamsEh.SetHorzLineColor(const Value: TColor);
begin
  if Value <> FHorzLineColor then
  begin
    FHorzLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.DefaultHorzLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor
end;

function TDBGridFooterParamsEh.GetHorzLines: Boolean;
begin
  if HorzLinesStored
    then Result := FHorzLines
    else Result := DefaultHorzLines;
end;

procedure TDBGridFooterParamsEh.SetHorzLines(const Value: Boolean);
begin
  if HorzLinesStored and (Value = FHorzLines) then Exit;
  HorzLinesStored := True;
  FHorzLines := Value;
  Grid.Invalidate;
end;

function TDBGridFooterParamsEh.IsHorzLinesStored: Boolean;
begin
  Result := FHorzLinesStored;
end;

procedure TDBGridFooterParamsEh.SetHorzLinesStored(const Value: Boolean);
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

function TDBGridFooterParamsEh.DefaultHorzLines: Boolean;
begin
  Result := (dgRowLines in Grid.Options);
end;

// VertLines and Color

function TDBGridFooterParamsEh.GetVertLineColor: TColor;
begin
  if FVertLineColor = clDefault
    then Result := DefaultVertLineColor
    else Result := FVertLineColor;
end;

function TDBGridFooterParamsEh.DefaultVertLineColor: TColor;
begin
  Result := FGrid.GridLineParams.GetDarkColor;
end;

procedure TDBGridFooterParamsEh.SetVertLineColor(const Value: TColor);
begin
  if FVertLineColor <> Value then
  begin
    FVertLineColor := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.GetVertLines: Boolean;
begin
  if VertLinesStored
    then Result := FVertLines
    else Result := DefaultVertLines;
end;

procedure TDBGridFooterParamsEh.SetVertLines(const Value: Boolean);
begin
  if VertLinesStored and (Value = FVertLines) then Exit;
  VertLinesStored := True;
  FVertLines := Value;
  Grid.Invalidate;
end;

function TDBGridFooterParamsEh.IsVertLinesStored: Boolean;
begin
  Result := FVertLinesStored;
end;

procedure TDBGridFooterParamsEh.SetVertLinesStored(const Value: Boolean);
begin
  if (Value = True) and (IsVertLinesStored = False) then
  begin
    FVertLinesStored := True;
    FVertLines := DefaultVertLines;
    Grid.Invalidate;
  end else if (Value = False) and (IsVertLinesStored = True) then
  begin
    FVertLinesStored := False;
    FVertLines := DefaultVertLines;
    Grid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.DefaultVertLines: Boolean;
begin
  Result := (dgColLines in Grid.Options);
end;

procedure TDBGridFooterParamsEh.SetRowHeight(const Value: Integer);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBGridFooterParamsEh.SetRowLines(const Value: Integer);
begin
  if FRowLines <> Value then
  begin
    FRowLines := Value;
    FGrid.LayoutChanged;
  end;
end;

procedure TDBGridFooterParamsEh.SetFillStyle(const Value: TGridCellFillStyleEh);
begin
  if FFillStyle <> Value then
  begin
    FFillStyle := Value;
    FGrid.Invalidate;
  end;
end;

function TDBGridFooterParamsEh.GetActualFillStyle: TGridCellFillStyleEh;
begin
  if FillStyle <> cfstDefaultEh then
  begin
    Result := FillStyle;
    if (Result = cfstGradientEh) and not ThemesEnabled and not FGrid.Style.GradientEnabledInClassicTheme
      then Result := cfstSolidEh;
  end else if FGrid.Flat then
    if dghFooter3D in FGrid.OptionsEh
      then Result := cfstGradientEh
      else Result := cfstSolidEh
  else
    if (dghFooter3D in FGrid.OptionsEh) and ThemesEnabled
      then Result := cfstThemedEh
      else Result := cfstSolidEh;
end;

{ TGridTreeViewParamsEh }

constructor TGridTreeViewParamsEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FGlyphStyle := tvgsDefaultEh;
  FShowTreeLines := True;
end;

destructor TGridTreeViewParamsEh.Destroy;
begin
  inherited Destroy;
end;

function TGridTreeViewParamsEh.GetActualGlyphStyle: TTreeViewGlyphStyleEh;
begin
  if GlyphStyle = tvgsDefaultEh
    then Result := FGrid.Style.GetActualTreeGlyphStyle
    else Result := GlyphStyle;
end;

procedure TGridTreeViewParamsEh.SetGlyphStyle(const Value: TTreeViewGlyphStyleEh);
begin
  if FGlyphStyle <> Value then
  begin
    FGlyphStyle := Value;
    Grid.Invalidate;
  end;
end;

procedure TGridTreeViewParamsEh.SetShowTreeLines(const Value: Boolean);
begin
  if FShowTreeLines <> Value then
  begin
    FShowTreeLines := Value;
    Grid.Invalidate;
  end;
end;

{ TDBGridBackgroundDataEh }

function TDBGridBackgroundDataEh.BoundRect(var DrawInfo: TGridDrawInfoEh): TRect;
begin
  Result := inherited BoundRect(DrawInfo);
  if ExcludeFooter then
    Result.Bottom := DrawInfo.Vert.GridExtent;
  if ExcludeIndicator then
    Result.Left := Result.Left + DrawInfo.Horz.NoFrozenBoundary;
  if ExcludeTitle then
    Result.Top := Result.Top + DrawInfo.Vert.FixedBoundary;
end;

procedure TDBGridBackgroundDataEh.SetExcludeFooter(const Value: Boolean);
begin
  if FExcludeFooter <> Value then
  begin
    FExcludeFooter := Value;
    PictureChanged(Self);
  end;  
end;

procedure TDBGridBackgroundDataEh.SetExcludeIndicator(const Value: Boolean);
begin
  if FExcludeIndicator <> Value then
  begin
    FExcludeIndicator := Value;
    PictureChanged(Self);
  end;
end;

procedure TDBGridBackgroundDataEh.SetExcludeTitle(const Value: Boolean);
begin
  if FExcludeTitle <> Value then
  begin
    FExcludeTitle := Value;
    PictureChanged(Self);
  end;
end;

{ TGridHighlightTextParamsEh }

constructor TGridHighlightTextParamsEh.Create;
begin
  inherited Create;
  FColumnsList := TColumnsEhList.Create;
end;

destructor TGridHighlightTextParamsEh.Destroy;
begin
  FreeAndNil(FColumnsList);
  inherited Destroy;
end;

procedure TGridHighlightTextParamsEh.SetColumnsList(const Value: TColumnsEhList);
begin
  FColumnsList.Assign(Value);
end;

{ TDBGridSearchPanelEh }

constructor TDBGridSearchPanelEh.Create(AGrid: TCustomDBGridEh);
begin
  inherited Create;
  FGrid := AGrid;
  FShortCut := 16454; //Ctrl+F
  FPersistentShowing := True;
  FFilterEnabled := True;
end;

destructor TDBGridSearchPanelEh.Destroy;
begin
  inherited Destroy;
end;

procedure TDBGridSearchPanelEh.FindNext;
var
  TextMatching: TLocateTextMatchingEh;
begin
  if SearchingText = ''
    then TextMatching := ltmWholeEh
    else TextMatching := ltmAnyPartEh;
  FGrid.LocateText(FGrid,
    '', SearchingText,
    [ltoCaseInsensitiveEh, ltoAllFieldsEh, ltoIgnoteCurrentPosEh, ltoInsideSelection, ltoRestartAfterLastHit],
     ltdDownEh, TextMatching, lttInAllNodesEh);
end;

procedure TDBGridSearchPanelEh.FindPrev;
var
  TextMatching: TLocateTextMatchingEh;
begin
  if SearchingText = ''
    then TextMatching := ltmWholeEh
    else TextMatching := ltmAnyPartEh;
  FGrid.LocateText(FGrid,
    '', SearchingText,
    [ltoCaseInsensitiveEh, ltoAllFieldsEh, ltoIgnoteCurrentPosEh, ltoInsideSelection, ltoRestartAfterLastHit],
     ltdUpEh, TextMatching, lttInAllNodesEh);
end;

procedure TDBGridSearchPanelEh.RestartFind;
var
  TextMatching: TLocateTextMatchingEh;
begin
  if SearchingText = ''
    then TextMatching := ltmWholeEh
    else TextMatching := ltmAnyPartEh;
  FGrid.LocateText(FGrid, '', SearchingText,
    [ltoCaseInsensitiveEh, ltoAllFieldsEh, ltoIgnoteCurrentPosEh, ltoInsideSelection, ltoRestartAfterLastHit],
     ltdAllEh, TextMatching, lttInAllNodesEh);
end;

function TDBGridSearchPanelEh.GetActive: Boolean;
begin
  if Location = splExternal then
    Result := FActive
  else if FGrid.FSearchPanelControl.FindEditor.Visible then
    Result := FGrid.FSearchPanelControl.FindEditor.Focused
  else
    Result := False;
end;

function TDBGridSearchPanelEh.InGridVertCaptureSize: Integer;
begin
  if Visible and (Location = splGridTopEh)
    then Result := FGrid.FSearchPanelControl.Height
    else Result := 0;
end;

procedure TDBGridSearchPanelEh.SetActive(const Value: Boolean);
begin
  if Value and not GetActive then
  begin
    if Location <> splExternal then
    begin
      if not Visible then
        Visible := True;
      if FGrid.FSearchPanelControl.Showing then
        FGrid.FSearchPanelControl.FindEditor.SetFocus;
    end;
    FActive := True;
    FGrid.Invalidate;
  end else if not Value and GetActive then
  begin
    if Location <> splExternal then
    begin
      FGrid.SetFocus;
      if not PersistentShowing and (SearchingText = '') then
        Visible := False;
    end;
    FActive := False;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridSearchPanelEh.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if (PersistentShowing or (SearchingText <> '')) and Enabled then
      Visible := True
    else
      Visible := False;
  end;
end;

procedure TDBGridSearchPanelEh.SetLocation(const Value: TSearchPanelLocationEh);
begin
  if FLocation <> Value then
  begin
    FLocation := Value;
    FGrid.UpdateSearchPanel;
  end;
end;

procedure TDBGridSearchPanelEh.SetPersistentShowing(const Value: Boolean);
begin
  if FPersistentShowing <> Value then
  begin
    FPersistentShowing := Value;
    if (FPersistentShowing or (SearchingText <> '')) and Enabled then
      Visible := True
    else if not FPersistentShowing and not Active then
      Visible := False;
  end;
end;

procedure TDBGridSearchPanelEh.SetSearchingText(const Value: String);
var
  FindEdit: TNavFindEditEhCrack;
begin
  if FSearchingText <> Value then
  begin
    FSearchingText := Value;
    if Location <> splExternal then
    begin
      FindEdit := TNavFindEditEhCrack(FGrid.FSearchPanelControl.FindEditor);
      FindEdit.Text := Value;
      if Value = ''
        then FindEdit.IsEmpty := True
        else FindEdit.IsEmpty := False;
    end;
    if PersistentShowing or (SearchingText <> '') then
      Visible := True;
    FGrid.Invalidate;
  end;
end;

procedure TDBGridSearchPanelEh.InterSetSearchingText(const Value: String);
begin
  FSearchingText := Value;
end;

procedure TDBGridSearchPanelEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    FGrid.UpdateSearchPanel;
  end;
end;

procedure TDBGridSearchPanelEh.ApplySearchFilter;
begin
  FGrid.SetSearchFilter(SearchingText);
end;

procedure TDBGridSearchPanelEh.CancelSearchFilter;
begin
  FGrid.ClearSearchFilter;
end;

procedure TDBGridSearchPanelEh.SetFilterEnabled(const Value: Boolean);
begin
  if FFilterEnabled <> Value then
  begin
    FFilterEnabled := Value;
    FGrid.UpdateSearchPanel;
  end;
end;

procedure TDBGridSearchPanelEh.SetFoundColumnIndex(const Value: Integer);
begin
  if FFoundColumnIndex <> Value then
  begin
    if not (dgRowSelect in Grid.Options) then
      Grid.SelectedIndex := Value
    else
      Grid.ClampInView(GridCoord(Grid.DataToRawColumn(Value), Grid.Row), True, False);
    FFoundColumnIndex := Value;
    Grid.InvalidateRow(Grid.Row);
  end;
end;

initialization

{$IFDEF EH_LIB_16}
  TCustomStyleEngine.RegisterStyleHook(TRowDetailPanelControlEh, TScrollBoxStyleHook);
{$ENDIF}

  RegisterReadPropertyInterceptor(TColumnEh, TColumnEhPropertyInterceptor);
  RegisterReadPropertyInterceptor(TDBGridColumnsEh, TColumnsEhPropertyInterceptor);

  FDBGridEhDefaultStyle := TDBGridEhStyle.Create(nil);
  FDBGridEhCenter := TDBGridEhCenter.Create;

  SortMarkerFont := TFont.Create;
  Bmp := TBitmap.Create;
  try
    BitmapLoadFromResourceName(Bmp, HInstance, bmSmDown);
    SortMarkerFont.Height := -Bmp.Height + 1;
    SortMarkerFont.Name := 'Arial';
  finally
    Bmp.Free;
  end;

{$IFDEF CIL}
//
{$ELSE}
  hcrDownCurEh := LoadCursor(hInstance, 'DOWNCUREH');
  if hcrDownCurEh = 0 then
    raise EOutOfResources.Create('Cannot load cursor resource');

  hcrRightCurEh := LoadCursor(hInstance, 'RIGHTCUREH');
  if hcrRightCurEh = 0 then
    raise EOutOfResources.Create('Cannot load cursor resource');

  hcrLeftCurEh := LoadCursor(hInstance, 'LEFTCUREH');
  if hcrLeftCurEh = 0 then
    raise EOutOfResources.Create('Cannot load cursor resource');
{$ENDIF}


  DBGridEhInplaceSearchKey := ShortCut(Word('F'), [ssCtrl]);
  DBGridEhInplaceSearchNextKey := ShortCut(VK_RETURN, [ssCtrl]);
  DBGridEhInplaceSearchPriorKey := ShortCut(VK_RETURN, [ssCtrl, ssShift]);
  DBGridEhSetValueFromPrevRecordKey := ShortCut(Word(222), [ssCtrl]); //'single-quote/double-quote'
  DBGridEhFindDialogKey := ShortCut(Word('F'), [ssCtrl]);
  DBGridEhShowInTitleFilterBox := ShortCut(Word('T'), [ssCtrl]);

  DBGridEhInplaceSearchTimeOut := 1500; // 1.5 sec
  DBGridEhInplaceSearchColor := clYellow;
  DBGridEhInplaceSearchTextColor := clBlack;

  CreateIndicators;

  VarColCellParamsEh := TColCellParamsEh.Create;

  RegisterClass(TRowDetailPanelControlEh);
  PopupListboxItemEhLine := TPopupListboxItemEhLine.Create;
  PopupListboxItemEhSortAsc := TPopupListboxItemEhSort.Create(smUpEh);
  PopupListboxItemEhSortDes := TPopupListboxItemEhSort.Create(smDownEh);

  PopupListboxItemEhClearFilter := TPopupListboxItemEhSpec.Create(ptFilterSpecItemClearFilter);
  PopupListboxItemEhAll := TPopupListboxItemEhSpec.Create(ptFilterSpecItemAll);
  PopupListboxItemEhEmpties  := TPopupListboxItemEhSpec.Create(ptFilterSpecItemEmpties);
  PopupListboxItemEhNotEmties  := TPopupListboxItemEhSpec.Create(ptFilterSpecItemNotEmties);
  PopupListboxItemEhDialog := TPopupListboxItemEhSpec.Create(ptFilterSpecItemDialog);
  PopupListboxItemEhApplyFilter := TPopupListboxItemEhSpec.Create(ptFilterApply);

  PopupListboxItemEhData := TPopupListboxItemEhData.Create;

finalization
  DestroyCursor(hcrDownCurEh);
  DestroyCursor(hcrRightCurEh);
  DestroyCursor(hcrLeftCurEh);

  FreeAndNil(DBGridEhIndicators);
  FreeAndNil(DBGridEhSortMarkerImages);
  FreeAndNil(SortMarkerFont);

  FreeAndNil(FDBGridEhDefaultStyle);
  FreeAndNil(FDBGridEhCenter);
  FreeAndNil(VarColCellParamsEh);

  FreeAndNil(DBGridEhVisibleColumnsIndicatorMenuItem);
  FreeAndNil(DBGridEhCutIndicatorMenuItem);
  FreeAndNil(DBGridEhCopyIndicatorMenuItem);
  FreeAndNil(DBGridEhPasteIndicatorMenuItem);
  FreeAndNil(DBGridEhDeleteIndicatorMenuItem);
  FreeAndNil(DBGridEhSelectAllIndicatorMenuItem);
  FreeAndNil(DBGridEhIndicatorTitlePopupMenu);

  FreeAndNil(PopupListboxItemEhLine);
  FreeAndNil(PopupListboxItemEhSortAsc);
  FreeAndNil(PopupListboxItemEhSortDes);
  FreeAndNil(PopupListboxItemEhClearFilter);
  FreeAndNil(PopupListboxItemEhAll);
  FreeAndNil(PopupListboxItemEhEmpties);
  FreeAndNil(PopupListboxItemEhNotEmties);
  FreeAndNil(PopupListboxItemEhDialog);
  FreeAndNil(PopupListboxItemEhApplyFilter);
  FreeAndNil(PopupListboxItemEhData);
end.
