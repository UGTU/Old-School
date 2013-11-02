unit SheduleGrids;
{#Author villain@ist.ugtu.net}
interface

uses SysUtils, Classes, Controls, Grids, Dialogs, ExtCtrls, StdCtrls, Forms, Contnrs,
    Messages, Windows, Graphics, ADODB, DB, Variants, GeneralController, DateUtils, SheduleClasses;

type
  TCampusDistanceInfo = class
  private
    fCampusIK: integer;
    fCampusName: string;
    fDistanceArray: array of integer;
    function getDistance(index: integer): integer;
    function getDistanceCount: integer;
    procedure setDistance(index: integer; const Value: integer);
  public
    constructor Create(ACampusIK: integer; ACampusName: string; ADistanceArraySize: integer);
    property CampusIK: integer read fCampusIK write fCampusIK;
    property CampusName: string read fCampusName write fCampusName;
    property DistanceCount: integer read getDistanceCount;
    property Distance[index: integer]: integer read getDistance write setDistance;
  end;

  TCustomSheduleGrid = class(TCustomDrawGrid)
  private
    function getDayAllow(ADayIndex: integer): boolean;
  protected
    fSheduleIK: integer;
    fIsDayAllow: array of boolean;
    fIsLoad: boolean;
    fDefaultSemLengthInfo: TDefaultSemLengthInfo;
    procedure Paint; override;
    function GetDayIndex: integer; virtual; abstract;
    function GetElementIndex: integer; virtual;
  public
    constructor Create(ASheduleIK: integer; AParrent: TWinControl);
    procedure ReadShedule(); virtual;
    function DeleteAllItems: boolean; virtual; abstract;
    function GenerateShedule(): boolean; virtual; abstract;
    property IsLoad: boolean read fIsLoad write fIsLoad;
    function IsCurrentDayAllow: boolean;
    property IsDayAllow[ADayIndex: integer]: boolean read getDayAllow;
    property DefaultSemLengthInfo: TDefaultSemLengthInfo read fDefaultSemLengthInfo;
    property SheduleIK: integer read fSheduleIK write fSheduleIK;
    property ElementIndex: integer read GetElementIndex;
    property DayIndex: integer read GetDayIndex;
  published
    property Align;
    property Anchors;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property DefaultColWidth;
    property DefaultRowHeight;
    property DefaultDrawing;
    property Enabled;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property Visible;
    property VisibleColCount;
    property VisibleRowCount;
    property OnContextPopup;
    property OnDblClick;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnSelectCell;
  end;

  TLessonVisibleEventList = class(TList)
  private
    fSelectedItemIndex: integer;
    function GetVisibleEvent(Index: Integer): TSheduleEvent;
    procedure SetVisibleEvent(Index: Integer; const Value: TSheduleEvent);
    function getSelectedEvent: TSheduleEvent;
  public
    constructor Create;
    procedure DeleteEvent(AEventIK: integer);
    property Items[Index: Integer]: TSheduleEvent read GetVisibleEvent write SetVisibleEvent; default;
    property SelectedItemIndex: integer read fSelectedItemIndex write fSelectedItemIndex;
    property SelectedEvent: TSheduleEvent read getSelectedEvent;
  end;

  TCustomLessonSheduleGrid = class(TCustomSheduleGrid)
  private
    function GetPart(index: integer): TSPartInfo;
    procedure SetPart(index: integer; const Value: TSPartInfo);
    function GetPartCount: integer;
    function getCurrentWeekTypeName: string;
  protected
    fParts: TObjectList;
    fPeriodStart: TDate;
    fVisibleEvents: array of array of TLessonVisibleEventList;
  //  procedure CheckAndDeleteFromVisibleEvents(EventIK: integer); virtual; abstract;
    function GetPartIndex: integer; virtual; abstract;
    function GetSelectedEvent: TSheduleEvent; virtual; abstract;
    function GetVisibleEvents(ACol, ARow: integer): TLessonVisibleEventList; virtual;
    procedure SetVisibleEvents(ACol, ARow: integer; const Value: TLessonVisibleEventList); virtual;
  public
    destructor Destroy; override;
    function AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
    function DeleteEvent(AEventIK: integer): boolean;
    function DeleteException(AEventIK: integer): boolean; virtual; abstract;
    function GoToNextPeriod():string; virtual; abstract;    // если не смог перейти, то вернуть пустую строку, иначе название периода
    function GoToPrevPeriod():string; virtual; abstract;
    function GoToDate(Date: TDate):string; virtual; abstract;
    procedure ReadShedule(); override;
    property PartCount: integer read GetPartCount;
    property Parts[index: integer]: TSPartInfo read GetPart write SetPart;
    property PeriodStart: TDate read fPeriodStart write fPeriodStart;  // дата начала текущего периода просмотра (например, дата начала недели, которую сейчас смотрим)
    property SelectedEvent: TSheduleEvent read GetSelectedEvent;
    property PartIndex: integer read GetPartIndex;
    property CurrentWeekTypeName: string read getCurrentWeekTypeName;
    property VisibleEvents[ACol, ARow: integer]: TLessonVisibleEventList read GetVisibleEvents write SetVisibleEvents;
  end;

  TDepLessonSheduleTeacher = class (TSheduleTeacher)
  private
    fRecordInEventStorage: TSheduleEventStorageStructureItem;
    function GetEvent(index: integer): TSheduleEvent;
    procedure SetEvent(index: integer; const Value: TSheduleEvent);
    function GetEventCount: integer;
  public
    constructor Create(ASheduleIK, ATabN: integer; AFirstName, ALastName, ACotch: string);
//    function AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
//    function DeleteEvent(index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteAllItems: boolean;
    property EventCount: integer read GetEventCount;
    property Events[index: integer]: TSheduleEvent read GetEvent write SetEvent;
  end;

  TDepLessonSheduleGrid = class(TCustomLessonSheduleGrid)
  private
    fKafedraIK: integer;
    function GetTeacher(index: integer): TDepLessonSheduleTeacher;
    procedure SetTeacher(index: integer; const Value: TDepLessonSheduleTeacher);
  protected
    fTeachers: TObjectList;
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl); virtual;
    destructor Destroy; override;
    function GenerateShedule(): boolean; override;
 //   function AddEvent(AEvent: TSheduleEvent): TSheduleEvent; override;
 //   function DeleteEvent(AEventIK: integer): boolean; override;
    function DeleteException(AEventIK: integer): boolean; override;
    function DeleteAllItems: boolean; override;
    procedure ReadShedule(); override;  //заполняет fTeachers и их события
    property KafedraIK: integer read fKafedraIK write fKafedraIK;
    property Teachers[index: integer]: TDepLessonSheduleTeacher read GetTeacher write SetTeacher;
  end;

  TDayDepLessonSheduleGrid = class(TDepLessonSheduleGrid)
  private
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
  //  procedure CheckAndDeleteFromVisibleEvents(EventIK: integer); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
  end;

  TWeekDepLessonSheduleGrid = class(TDepLessonSheduleGrid)
  private
    curRow, curCol: integer;
    fOnDayNameClick: TNotifyEvent;
    procedure InvalidateDayName;
    function GetCurrentHighlightDay: integer;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure DrawDayName(ADayNumber: integer; ARect: TRect; bFirst, bLast: integer);
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
    function GetElementIndex: integer; override;
 //   procedure CheckAndDeleteFromVisibleEvents(EventIK: integer); override;
    function GetVisibleEvents(ACol, ARow: integer): TLessonVisibleEventList; override;
    procedure SetVisibleEvents(ACol, ARow: integer; const Value: TLessonVisibleEventList); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
    property CurrentHighlightDay: integer read GetCurrentHighlightDay;
    property OnDayNameClick: TNotifyEvent read fOnDayNameClick write fOnDayNameClick;
  end;

 { TMonthDepLessonSheduleGrid = class(TDepLessonSheduleGrid)
  private
    fVisibleEvents: array of array of array of TSheduleEvent;
    function GetEvents(ACol, ARow, APart: integer): TSheduleEvent;
    procedure SetEvents(ACol, ARow, APart: integer; const Value: TSheduleEvent);
    function GetCurrentHighlightDay: integer;
    function GetOnDayNameClick: TNotifyEvent;
    procedure SetOnDayNameClick(const Value: TNotifyEvent);
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
    property CurrentHighlightDay: integer read GetCurrentHighlightDay;
    property OnDayNameClick: TNotifyEvent read GetOnDayNameClick write SetOnDayNameClick;
    property VisibleEvents[ACol, ARow, APart: integer]: TSheduleEvent read GetEvents write SetEvents;
  end;       }

  TFacLessonSheduleGroup = class(TSheduleGroup)
  private
    fRecordInEventStorage: TSheduleEventStorageStructureItem;
    function GetEvent(index: integer): TSheduleEvent;
    function GetEventCount: integer;
    procedure SetEvent(index: integer; const Value: TSheduleEvent);
  public
    constructor Create(ASheduleIK, AGroupIK: integer; AName: string);
//    function AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
//    function DeleteEvent(index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteAllItems: boolean;
    property EventCount: integer read GetEventCount;
    property Events[index: integer]: TSheduleEvent read GetEvent write SetEvent;
  end;

  TFacLessonSheduleGrid = class(TCustomLessonSheduleGrid)
  private
    fFacultyIK: integer;
    function GetGroup(index: integer): TFacLessonSheduleGroup;
    procedure SetGroup(index: integer; const Value: TFacLessonSheduleGroup);
  protected
    fGroups: TObjectList;
  public
    constructor Create(AFacIK, ASheduleIK: integer; AParrent: TWinControl); virtual;
    destructor Destroy; override;
    function GenerateShedule(): boolean; override;
    procedure ReadShedule(); override;  //заполняет fGroups и их события
 //   function AddEvent(AEvent: TSheduleEvent): TSheduleEvent; override;
//    function DeleteEvent(AEventIK: integer): boolean; override;
    function DeleteException(AEventIK: integer): boolean; override;
    function DeleteAllItems: boolean; override;
    function GroupCount: integer;
    property Groups[index: integer]: TFacLessonSheduleGroup read GetGroup write SetGroup;
    property FacultyIK: integer read fFacultyIK write fFacultyIK;
  end;

  TDayFacLessonSheduleGrid = class(TFacLessonSheduleGrid)
  private
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
 //   procedure CheckAndDeleteFromVisibleEvents(EventIK: integer); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AFacultyIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
  end;

  TWeekFacLessonSheduleGrid = class(TFacLessonSheduleGrid)
  private
    curRow, curCol: integer;
    fOnDayNameClick: TNotifyEvent;
    function GetCurrentHighlightDay: integer;
    procedure InvalidateDayName;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure DrawDayName(ADayNumber: integer; ARect: TRect; bFirst, bLast: integer);
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
    function GetElementIndex: integer; override;
//    procedure CheckAndDeleteFromVisibleEvents(EventIK: integer); override;
    function GetVisibleEvents(ACol, ARow: integer): TLessonVisibleEventList; override;
    procedure SetVisibleEvents(ACol, ARow: integer; const Value: TLessonVisibleEventList); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AFacultyIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
    property CurrentHighlightDay: integer read GetCurrentHighlightDay;
    property OnDayNameClick: TNotifyEvent read fOnDayNameClick write fOnDayNameClick;
  end;

 { TMonthFacLessonSheduleGrid = class(TFacLessonSheduleGrid)
  private
//    fVisibleEvents: array of array of array of TSheduleEvent;
    function GetEvents(ACol, ARow, APart: integer): TSheduleEvent;
    procedure SetEvents(ACol, ARow, APart: integer; const Value: TSheduleEvent);
    function GetCurrentHighlightDay: integer;
    function GetOnDayNameClick: TNotifyEvent;
    procedure SetOnDayNameClick(const Value: TNotifyEvent);
  protected
    function GetDayIndex: integer; override;
    function GetPartIndex: integer; override;
    function GetSelectedEvent: TSheduleEvent; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl); override;
    function GoToNextPeriod():string; override;
    function GoToPrevPeriod():string; override;
    function GoToDate(Date: TDate):string; override;
    procedure ReadShedule(); override;
    property CurrentHighlightDay: integer read GetCurrentHighlightDay;
    property OnDayNameClick: TNotifyEvent read GetOnDayNameClick write SetOnDayNameClick;
    property VisibleEvents[ACol, ARow, APart: integer]: TSheduleEvent read GetEvents write SetEvents;
  end;      }

  TExamVisibleEventList = class(TList)
  private
    fSelectedItemIndex: integer;
    function GetVisibleEvent(Index: Integer): TSheduleExamination;
    procedure SetVisibleEvent(Index: Integer; const Value: TSheduleExamination);
  public
    constructor Create;
    procedure DeleteExam(AExamIK: integer);
    property Items[Index: Integer]: TSheduleExamination read GetVisibleEvent write SetVisibleEvent; default;
    property SelectedItemIndex: integer read fSelectedItemIndex write fSelectedItemIndex;
  end;

  TCustomExamSheduleGrid = class(TCustomSheduleGrid)
  private
    function GetSelectedExam: TSheduleExamination;
    function getVisibleEventList(ACol, ARow: integer): TExamVisibleEventList;
    procedure setVisibleEventList(ACol, ARow: integer; const Value: TExamVisibleEventList);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  protected
    fVisibleEvents: array of array of TExamVisibleEventList;
    function GetDayIndex: integer; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(ASheduleIK: integer; AParrent: TWinControl);
    destructor Destroy; override;
    function AddExam(AExam: TSheduleExamination): TSheduleExamination;
    function DeleteExam(AExamIK: integer): boolean;
    procedure ReadShedule(); override;
    procedure UpdateVisibleEvents(); virtual; abstract;
    property SelectedExam: TSheduleExamination read GetSelectedExam;
    property VisibleEvents[ACol, ARow: integer]: TExamVisibleEventList read getVisibleEventList write setVisibleEventList;
  end;

  TDepExamSheduleGrid = class;

  TDepExamSheduleTeacher = class(TSheduleTeacher)
  private
    fRecordInExamList: TExaminationStorageStructureItem;
    fOwner: TDepExamSheduleGrid;
    function GetExamCount: integer;
    function GetExam(index: integer): TSheduleExamination;
    procedure SetExam(index: integer; const Value: TSheduleExamination);
  public
    constructor Create(ASheduleIK, ATabN: integer; AFirstName, ALastName, ACotch: string);
//    function AddExam(Value: TSheduleExamination): TSheduleExamination;
//    function DeleteExam(index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteAllItems: boolean;
    property ExamCount: integer read GetExamCount;
    property Exams[index: integer]: TSheduleExamination read GetExam write SetExam;
  end;

  TDepExamSheduleGrid = class(TCustomExamSheduleGrid)
  private
    fKafedraIK: integer;
    fTeachers: TObjectList;
    function GetTeacher(index: integer): TDepExamSheduleTeacher;
    procedure SetTeacher(index: integer; const Value: TDepExamSheduleTeacher);
  public
    constructor Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl);
//    procedure AddExam(AExam: TSheduleExamination); override;
//    function DeleteExam(AExamIK: integer): boolean; override;
    function DeleteAllItems: boolean; override;
    function GenerateShedule(): boolean; override;
    procedure ReadShedule(); override;
    procedure UpdateVisibleEvents(); override;
    destructor Destroy; override;
    property KafedraIK: integer read fKafedraIK write fKafedraIK;
    property Teachers[index: integer]: TDepExamSheduleTeacher read GetTeacher write SetTeacher;
  end;

  TFacExamSheduleGrid = class;

  TFacExamSheduleGroup = class (TSheduleGroup)
  private
    fOwner: TFacExamSheduleGrid;
    fRecordInExamList: TExaminationStorageStructureItem;
    function GetExam(index: integer): TSheduleExamination;
    function GetExamCount: integer;
    procedure SetExam(index: integer; const Value: TSheduleExamination);
  public
    constructor Create(ASheduleIK, AGroupIK: integer; AName: string);
//    function AddExam(Value: TSheduleExamination): TSheduleExamination;
//    function DeleteExam(index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteAllItems: boolean;
    property ExamCount: integer read GetExamCount;
    property Exams[index: integer]: TSheduleExamination read GetExam write SetExam;
  end;

  TFacExamSheduleGrid = class(TCustomExamSheduleGrid)
  private
    fFacultyIK: integer;
    fGroups: TObjectList;
    function GetGroup(index: integer): TFacExamSheduleGroup;
    procedure SetGroup(index: integer; const Value: TFacExamSheduleGroup);
  public
    constructor Create(AFacultyIK, ASheduleIK: integer; AParrent: TWinControl);
//    procedure AddExam(AExam: TSheduleExamination); override;
//    function DeleteExam(AExamIK: integer): boolean; override;
    function DeleteAllItems: boolean; override;
    function GenerateShedule(): boolean; override;
    procedure ReadShedule(); override;
    procedure UpdateVisibleEvents(); override;
    destructor Destroy; override;
    function GroupCount: integer;
    property Groups[index: integer]: TFacExamSheduleGroup read GetGroup write SetGroup;
    property FacultyIK: integer read fFacultyIK write fFacultyIK;
  end;

  TRoomConstraintItemType = (rcitDisc, rcitPotok, rcitVZandVN, rcitCalcUnit, rcitPrepodName, rcitRoom, rcitAllRoomInKaf);

  TRoomConstraintItem = class
  protected
    fIK: integer;
    fItemType: TRoomConstraintItemType;
  public
    constructor Create(AIK: integer; AItemType: TRoomConstraintItemType); overload; virtual;
    property IK: integer read fIK write fIK;
    property ItemType: TRoomConstraintItemType read fItemType write fItemType;
  end;

  TRoomConstraintDiscItem = class(TRoomConstraintItem)
  private
    fIsNodeLoad: boolean;
  public
    constructor Create(AIK: integer; AItemType: TRoomConstraintItemType); override;
    property IsNodeLoad: boolean read fIsNodeLoad write fIsNodeLoad;
  end;

  TRoomConstraintVZandVNItem = class(TRoomConstraintItem)
  private
    fVidNagruzkiIK: integer;
    fContentPlanNagrIKList: TStringList;
    function getContentPlanNagrIKList: string;
  public
    constructor Create(AVidZanyatIK, AVidNagruzkiIK: integer; AItemType: TRoomConstraintItemType);
    destructor Destroy; override;
    property VidZanyatIK: integer read fIK write fIK;
    property VidNagruzkiIK: integer read fVidNagruzkiIK write fVidNagruzkiIK;
    property ContentPlanNagrIKList: string read getContentPlanNagrIKList;
    procedure AddContentPlanNagrIK(AContentPlanNagrIK: integer);
  end;

  TRoomConstraintPrepodItem = class(TRoomConstraintItem)
  private
    fCommissionNumber: integer;
    fPrepodPlanNagrIKList: TStringList;
    function getPrepodPlanNagrIKList: string;
    function getPrepodPlanNagrIKAsList: TStringList;
  public
    constructor Create(APrepodIK, ACommissionNumber: integer; AItemType: TRoomConstraintItemType);
    destructor Destroy; override;
    property PrepodIK: integer read fIK write fIK;
    property CommissionNumber: integer read fCommissionNumber write fCommissionNumber;
    property PrepodPlanNagrIKList: string read getPrepodPlanNagrIKList;
    property PrepodPlanNagrIKAsList: TStringList read getPrepodPlanNagrIKAsList;
    procedure AddPrepodPlanNagrIK(APrepodPlanNagrIK: integer);
  end;

  TTeacherSemesterConstraintItem = class
  private
    fPartNumber: integer;
    fDayNumber: integer;
    fIsDenumerator: boolean;
    fCheckBox: TCheckBox;
  public
    constructor Create(APartNumber, ADayNumber: integer; AIsDenumerator, AIsSetup: boolean; AOwner: TWinControl);
    destructor Destroy; override;
    property PartNumber: integer read fPartNumber write fPartNumber;
    property DayNumber: integer read fDayNumber write fDayNumber;
    property IsDenumerator: boolean read fIsDenumerator write fIsDenumerator;
    property CheckBox: TCheckBox read fCheckBox write fCheckBox;
  end;

  TTeacherSemesterConstraintsGrid = class (TStringGrid)
  private
    fIsLoad: boolean;
    fTeacherConstraints: TObjectList;
    FOnCheckBoxChange: TNotifyEvent;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    function GetTeacherConstraint(Index: Integer): TTeacherSemesterConstraintItem;
    procedure SetTeacherConstraint(Index: Integer; const Value: TTeacherSemesterConstraintItem);
    function GetTeacherConstraintForGrid(ACol, ARow: Integer): TTeacherSemesterConstraintItem;
    procedure SetTeacherConstraintForGrid(ACol, ARow: Integer; const Value: TTeacherSemesterConstraintItem);
    function getItemsCount: integer;
  protected
    procedure Paint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddItem(Value: TTeacherSemesterConstraintItem);
    procedure ClearItems;
    property TCItemsCount: integer read getItemsCount;
    property IsLoad: boolean read fIsLoad write fIsLoad;
    property OnCheckBoxChange: TNotifyEvent read FOnCheckBoxChange write FOnCheckBoxChange;
    property TeacherConstraints[Index: Integer]: TTeacherSemesterConstraintItem read GetTeacherConstraint write SetTeacherConstraint;
    property TeacherConstraintsForGrid[ACol, ARow: Integer]: TTeacherSemesterConstraintItem read GetTeacherConstraintForGrid write SetTeacherConstraintForGrid;
  end;

implementation

uses SheduleController, ExceptionBase, NagruzkaClasses;

const
  DayColumnWidth:integer = 300;
  WeekColumnWidth: integer = 300;
  MonthColumnWidth: integer = 300;
  DayPartColumnWidth:integer = 90;
  ExamDateColumnWidth: integer = 80;
//  WeekPartColumnWidth: integer = 60;
  TeacherRowHeight:integer = 30;
  InWeekDayNameColWidth: integer = 50;
  inMonthDayNameColWidth: integer = 100;

var
  OneExamInRowHeight: integer = 45;
  OneEventInDepDayColumnHeight:integer = 55;
  OneEventInDepWeekColumnHeight: integer = 55;
  OneEventInFacDayColumnHeight:integer = 54;
  OneEventInFacWeekColumnHeight: integer = 54;
  //MonthColumnHeight: integer = 25;

  { TCustomSheduleGrid }

constructor TCustomSheduleGrid.Create(ASheduleIK: integer; AParrent: TWinControl);
begin
  inherited Create(AParrent);
  FixedCols:= 0;
  FixedRows:= 0;
  ColCount:= 1;
  RowCount:= 1;
  fIsLoad:= false;
  fSheduleIK:= ASheduleIK;
  FixedColor:= clWindow;
  Options:= Options - [goFixedHorzLine, goFixedVertLine, goRangeSelect];
  if AParrent <> nil then Parent:= AParrent;
  BorderStyle:= bsNone;
  Align:= alClient;
  Visible:= false;
end;

function TCustomSheduleGrid.getDayAllow(ADayIndex: integer): boolean;
begin
  if (Length(fIsDayAllow) > ADayIndex) and (ADayIndex >= 0) then
    Result:= fIsDayAllow[ADayIndex]
  else Result:= false;
end;

function TCustomSheduleGrid.GetElementIndex: integer;
begin
  Result:= Col-1;
end;

procedure TCustomSheduleGrid.Paint;
begin
  inherited Paint;
  Canvas.Pen.Color:= clSilver;
  Canvas.MoveTo(0, 0);
  Canvas.LineTo(0, ClientHeight-1);
  Canvas.MoveTo(0, 0);
  Canvas.LineTo(ClientWidth-1, 0);
//  Canvas.LineTo(ClientWidth-1, ClientHeight-1);
 // fHorizontalCaption.Invalidate;
end;

procedure TCustomSheduleGrid.ReadShedule;
var
  chokeDS: PDataSet;
begin
  fDefaultSemLengthInfo:= TSheduleController.AccountFunctions.GetSemesterLength(fSheduleIK, false, chokeDS);
  if (fDefaultSemLengthInfo.MinSemStart = 0) or (fDefaultSemLengthInfo.MinSessionStart = 0) or (fDefaultSemLengthInfo.WorkTimeStart = 0) or (fDefaultSemLengthInfo.WorkTimeEnd = 0) then
    raise EApplicationException.Create('Не заполнена информация о продолжительности учебного семестра! Перед началом работы с расписанием необходимо заполнить информацию о продолжительности данного учебного семестра');
end;

function TCustomSheduleGrid.IsCurrentDayAllow: boolean;
begin
  if (Length(fIsDayAllow) > DayIndex) and (DayIndex >= 0) then
    Result:= fIsDayAllow[DayIndex]
  else Result:= false;
end;

{ TDepLessonSheduleGrid }

{
function TDepLessonSheduleGrid.AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
//var
//  i: integer;
begin
  Result:= nil;
  for i := 0 to fTeachers.Count - 1 do
    if Teachers[i].TabN = AEvent.TabN then
    begin
      Result:= Teachers[i].AddEvent(AEvent);
      exit;
    end;
end;     }

constructor TDepLessonSheduleGrid.Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl);
begin
  inherited Create(ASheduleIK, AParrent);
  fTeachers:= TObjectList.Create;
  fKafedraIK:= AKafIK;
{  fHorizontalCaption:= TDepSheduleHorizCaption.Create(false, self, fHorizCapLocate);
  fHorizontalCaption.ScrollBars:= ssNone;
  fHorizontalCaption.DefaultRowHeight:= TeacherRowHeight;
  fHorizCapLocate.Height:= fHorizontalCaption.DefaultRowHeight + 1;
  fHorizCapLocate.Visible:= false;     }
end;

function TDepLessonSheduleGrid.DeleteAllItems: boolean;
var
  i: integer;
begin
  for I := 0 to fTeachers.Count - 1 do
    Teachers[i].DeleteAllItems;
  Result:= TSheduleController.MainFunctions.DeleteDepLessonShedule(fSheduleIK, fKafedraIK);
end;

{
function TDepLessonSheduleGrid.DeleteEvent(AEventIK: integer): boolean;
//var
//  i, j: integer;
begin
    Result:= false;
  for i:= 0 to fTeachers.Count-1 do
    for j:= 0 to Teachers[i].EventCount-1 do
      if Teachers[i].Events[j].EventIK = AEventIK then
      begin
        if Teachers[i].DeleteEvent(j, true) then
        begin
          CheckAndDeleteFromVisibleEvents(AEventIK);
          Result:= true;
          exit;
        end;
      end;
end; }

function TDepLessonSheduleGrid.DeleteException(AEventIK: integer): boolean;
var
  i, j, k: integer;
begin
  Result:= false;
  for i:= 0 to fTeachers.Count-1 do
    for j:= 0 to Teachers[i].EventCount-1 do
      for k:= 0 to Teachers[i].Events[j].ExceptionCount-1 do
        if Teachers[i].Events[j].Exceptions[k].EventIK = AEventIK then
        begin
          Teachers[i].Events[j].DeleteException(k);
          Result:= true;
          exit;
        end;
end;

destructor TDepLessonSheduleGrid.Destroy;
begin
  FreeAndNil(fTeachers);
  inherited;
end;

function TDepLessonSheduleGrid.GenerateShedule: boolean;
begin
  Result:= true;
end;

function TDepLessonSheduleGrid.GetTeacher(index: integer): TDepLessonSheduleTeacher;
begin
  Result:= TDepLessonSheduleTeacher(fTeachers[index]);
end;

procedure TDepLessonSheduleGrid.ReadShedule;
var
  tempDS: TADODataSet;
begin
  inherited ReadShedule;
  fTeachers.Clear;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'Select * From GetTeacherListForDepartment(1, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(DefaultSemLengthInfo.YearIK) + ', ' + IntToStr(DefaultSemLengthInfo.SemIK) + ')';
  tempDS.Open;
  while (not tempDS.Eof) do
  begin
    fTeachers.Add(TDepLessonSheduleTeacher.Create(fSheduleIK, tempDS.FieldByName('iTab_n').AsInteger, tempDS.FieldByName('cfirstname').AsString, tempDS.FieldByName('clastname').AsString, tempDS.FieldByName('cotch').AsString));
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
//  fHorizontalCaption.ColCount:= fTeachers.Count;
end;

procedure TDepLessonSheduleGrid.SetTeacher(index: integer;
  const Value: TDepLessonSheduleTeacher);
begin
  fTeachers[index]:= Value;
end;

{ TDayDepLessonSheduleGrid }

{
procedure TDayDepLessonSheduleGrid.CheckAndDeleteFromVisibleEvents(
  EventIK: integer);
begin
  if (Col >= 1) and (Row >= 1) then
    fVisibleEvents[Col-1, Row-1].DeleteEvent(EventIK);
end;  }

constructor TDayDepLessonSheduleGrid.Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl);
begin
  inherited Create(AKafIK, ASheduleIK, AParrent);
  SetLength(fIsDayAllow, 1);
  fIsDayAllow[0]:= true;
end;

procedure TDayDepLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  textLeft, i: integer;
  tempStr: string;
  curRect: TRect;
begin
  if (ARow = 0) and (ACol < 1) then exit;

  if (ARow = 0) or (ACol = 0) then
  begin
    Canvas.Pen.Color:= clSilver;
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
  end;

  if (ARow = 0) and (ACol > 0) then
  begin
    Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(Teachers[ACol-1].FIO))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Teachers[ACol-1].FIO))/2), Teachers[ACol-1].FIO);
    exit;
  end;

  if (ARow > 0) and (ACol = 0) then
  begin
    Canvas.Font.Color:= clBlack;
    tempStr:= IntToStr(Parts[ARow-1].PartNumber) + '-я пара';
    textLeft:= Canvas.TextHeight(tempStr);
    Canvas.TextOut(ARect.Left + round((ColWidths[0] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    Canvas.Font.Color:= clGray;
    tempStr:= '(' + FormatDateTime('h:nn', Parts[ARow-1].StartTime) + ' - ' + FormatDateTime('h:nn', Parts[ARow-1].StopTime) + ')';
    Canvas.TextOut(ARect.Left + round((ColWidths[0] - Canvas.TextWidth(tempStr))/2), ARect.Top + 4 + textLeft + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    exit;
  end;

  if fIsLoad then
    if (fVisibleEvents[ACol-1][ARow-1] <> nil) then
    if (fVisibleEvents[ACol-1][ARow-1].Count > 0) then
    for I := 0 to fVisibleEvents[ACol-1, ARow-1].Count - 1 do
    begin
      if fVisibleEvents[ACol-1][ARow-1].Count = 1 then
      begin
        curRect.Left:= ARect.Left;
        curRect.Top:= ARect.Top + round((ARect.Bottom - ARect.Top - OneEventInDepDayColumnHeight)/2);
        curRect.Right:= ARect.Right;
        curRect.Bottom:= curRect.Top + OneEventInDepDayColumnHeight;
      end
      else
      begin
        curRect.Left:= ARect.Left + 2;
        curRect.Top:= ARect.Top + 2 + (OneEventInDepDayColumnHeight + 2)*i;
        curRect.Right:= ARect.Left + ColWidths[ACol] - 2;
        curRect.Bottom:= ARect.Top + OneEventInDepDayColumnHeight + 2 + (OneEventInDepDayColumnHeight + 2)*i;
        if (fVisibleEvents[ACol-1, ARow-1].SelectedItemIndex = i) and (Col = ACol) and (Row = ARow) then
          Canvas.Pen.Color:= clMaroon
        else Canvas.Pen.Color:= clSilver;
        Canvas.RoundRect(curRect.Left, curRect.Top, curRect.Right, curRect.Bottom, 5, 5);
      end;

      Canvas.Font.Color:= clBlack;
      tempStr:= fVisibleEvents[ACol-1][ARow-1].Items[i].DiscName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr))/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 3, tempStr);

      tempStr:= fVisibleEvents[ACol-1][ARow-1].Items[i].CalcUnitName + ', ' + fVisibleEvents[ACol-1][ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-1][ARow-1].Items[i].VidZanyatName + ' (' + fVisibleEvents[ACol-1][ARow-1].Items[i].VidNagruzkiName + ')';
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 6 + Canvas.TextHeight('И'), tempStr);

      textLeft:= DayColumnWidth - Canvas.TextWidth(fVisibleEvents[ACol-1][ARow-1].Items[i].WorkTypeName) - 7;
      Canvas.Font.Color:= clSilver;
      Canvas.TextOut(curRect.Left + textLeft, curRect.Bottom - 2 - Canvas.TextHeight('осн'), fVisibleEvents[ACol-1][ARow-1].Items[i].WorkTypeName);
    end;
end;

function TDayDepLessonSheduleGrid.GetDayIndex: integer;
begin
  Result:= 0;
end;

function TDayDepLessonSheduleGrid.GetPartIndex: integer;
begin
  Result:= Row-1;
end;

function TDayDepLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  if (Col > 0) and (Row > 0) then
    Result:= fVisibleEvents[Col-1][Row-1].SelectedEvent
  else Result:= nil;
end;

function TDayDepLessonSheduleGrid.GoToDate(Date: TDate): string;
var
  y, m, d, h, min, s, ms: word;
  i,j,k: integer;
  startDate, stopDate: TDateTime;
  tempEvent: TSheduleEvent;
begin
  Result:= '';
  if fIsLoad then
  begin
    if not fDefaultSemLengthInfo.IsAudDateAllow(Date) then exit;
    fPeriodStart:= Date;
    DecodeDate(Date, y, m, d);
    Result:= IntToStr(d) + ' ' + MonthNames[m] + ' ' + IntToStr(y) + ' года (' + FormatDateTime('dddd', Date) + ')';
    for j:= 0 to fParts.Count - 1 do
      RowHeights[j+1]:= OneEventInDepDayColumnHeight;

    for i:= 0 to fTeachers.Count-1 do
    begin
      for j:= 0 to fParts.Count - 1 do
      begin
        fVisibleEvents[i][j].SelectedItemIndex:= -1;
        fVisibleEvents[i][j].Clear;
      end;

      if TDepLessonSheduleTeacher(fTeachers[i]).EventCount > 0 then
      for j:= 0 to fParts.Count - 1 do
      begin
        DecodeTime(Parts[j mod fParts.Count].StartTime, h, min, s, ms);
        startDate:= EncodeDateTime(y, m, d, h, min, s, ms);
        DecodeTime(Parts[j mod fParts.Count].StopTime, h, min, s, ms);
        stopDate:= EncodeDateTime(y, m, d, h, min, s, ms);
        for k:= 0 to TDepLessonSheduleTeacher(fTeachers[i]).EventCount-1 do
          if Assigned(TDepLessonSheduleTeacher(fTeachers[i]).Events[k]) then
            if ((TDepLessonSheduleTeacher(fTeachers[i]).Events[k].Start - 12 <= stopDate) and (startDate >= fDefaultSemLengthInfo.SemStart)) then
            begin
              tempEvent:= TDepLessonSheduleTeacher(fTeachers[i]).Events[k].IsOccured(startDate, stopDate);
              if tempEvent <> nil then
                fVisibleEvents[i][j].Add(tempEvent);
            end;

        if fVisibleEvents[i][j].Count > 1 then
          if RowHeights[j+1] < fVisibleEvents[i][j].Count*(OneEventInDepDayColumnHeight + 2) + 2 then
            RowHeights[j+1]:= fVisibleEvents[i][j].Count*(OneEventInDepDayColumnHeight + 2) + 2;
      end;
    end;
  end;
end;

function TDayDepLessonSheduleGrid.GoToNextPeriod: string;
var
  togoDate, maxSemStop: TDate;
begin
  togoDate:= fPeriodStart+1;
  maxSemStop:= DefaultSemLengthInfo.MaxSemStop;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate <= maxSemStop) do
    togoDate:= togoDate + 1;
  Result:= GoToDate(togoDate);
end;

function TDayDepLessonSheduleGrid.GoToPrevPeriod: string;
var
  togoDate, minSemStart: TDate;
begin
  togoDate:= fPeriodStart - 1;
  minSemStart:= DefaultSemLengthInfo.MinSemStart;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate >= minSemStart) do
    togoDate:= togoDate - 1;
  Result:= GoToDate(togoDate);
end;

procedure TDayDepLessonSheduleGrid.ReadShedule;
var
  i, j: integer;
begin
  inherited ReadShedule;
  SetLength(fVisibleEvents, fTeachers.Count);
  for i:= 0 to fTeachers.Count - 1 do
  begin
    SetLength(fVisibleEvents[i], fParts.Count);
    for j:= 0 to fParts.Count - 1 do
      fVisibleEvents[i][j]:= TLessonVisibleEventList.Create;
  end;
  RowCount:= fParts.Count + 1;
  ColCount:= fTeachers.Count + 1;
  if ColCount > 1 then FixedCols:= 1
  else FixedCols:= 0;
  if RowCount > 1 then FixedRows:= 1
  else FixedRows:= 0;
  if Assigned(Parent) then
  begin
    DefaultColWidth:= DayColumnWidth;
    DefaultRowHeight:= OneEventInDepDayColumnHeight + 4;
    ColWidths[0]:= DayPartColumnWidth;
    RowHeights[0]:= TeacherRowHeight;
  end;
  fIsLoad:= true;
end;

procedure TDayDepLessonSheduleGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  curCol, curRow, i: integer;
begin
  if (Col > 0) and (Row > 0) then
  begin
    fVisibleEvents[Col-1][Row-1].SelectedItemIndex:= -1;
    InvalidateCell(Col, Row);
  end;
  MouseToCell(Message.XPos, Message.YPos, curCol, curRow);
  curCol:= curCol-1;
  curRow:= curRow-1;
  if (curCol >= 0) and (curRow >= 0) then
  begin
    if Length(fVisibleEvents) > curCol then
      if Length(fVisibleEvents[curCol]) > curRow then
        if fVisibleEvents[curCol][curRow].Count > 0 then
        begin
          if fVisibleEvents[curCol][curRow].Count = 1 then
            fVisibleEvents[curCol][curRow].SelectedItemIndex:= 0
          else
          begin
            fVisibleEvents[curCol][curRow].SelectedItemIndex:= -1;
            for I := 0 to fVisibleEvents[curCol][curRow].Count - 1 do
              if (Message.YPos >= CellRect(curCol+1, curRow+1).Top + 2 + (OneEventInDepDayColumnHeight + 2)*i) and
                (Message.YPos <= CellRect(curCol+1, curRow+1).Top + OneEventInDepDayColumnHeight + 2 + (OneEventInDepDayColumnHeight + 2)*i) then
              begin
                fVisibleEvents[curCol][curRow].SelectedItemIndex:= i;
                break;
              end;
          end;
          InvalidateCell(curCol+1, curRow+1);
        end
        else fVisibleEvents[curCol][curRow].SelectedItemIndex:= -1;
  end;
  inherited;
end;

{ TWeekDepLessonSheduleGrid }

{
procedure TWeekDepLessonSheduleGrid.CheckAndDeleteFromVisibleEvents(
  EventIK: integer);
begin
  if (Col >= 2) and (Row >= 1) then
    fVisibleEvents[Col-2, Row-1].DeleteEvent(EventIK);
end;
}

procedure TWeekDepLessonSheduleGrid.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  curRow:= -1;
  curCol:= -1;
  InvalidateDayName;
end;

constructor TWeekDepLessonSheduleGrid.Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl);
var
  i: integer;
begin
  inherited Create(AKafIK, ASheduleIK, AParrent);
  SetLength(fIsDayAllow, 6);
  for I := 0 to Length(fIsDayAllow) - 1 do
    fIsDayAllow[i]:= false;
  {fVerticalCaption:= TWeekLessonSheduleVertCaption.Create(self, fVertCapLocate);
  fVerticalCaption.ScrollBars:= ssNone;
  fVerticalCaption.ColCount:= 2;
  fHorizontalCaption.ColCount:= 3;
  fVertCapLocate.Width:= fVerticalCaption.ColWidths[0] + fVerticalCaption.ColWidths[1] + 1;}
end;

procedure TWeekDepLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  tempStr: string;
  textLeft, i: integer;
  tempRect: tRect;
  j, bFirst, bLast: integer;
  DrawInfo: TGridDrawInfo;
  curRect: TRect;
begin
  if (ARow = 0) and (ACol < 2) then exit;

  Canvas.Pen.Color:= clSilver;
  if (ARow = 0) and (ACol > 1) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(Teachers[ACol-2].FIO))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Teachers[ACol-2].FIO))/2), Teachers[ACol-2].FIO);
    exit;
  end;

  if (ACol = 0) and (ARow > 0) then
  begin
    i:= ((ARow-1) div PartCount) + 1;    //текущий день
    CalcDrawInfo(DrawInfo);
    bFirst:= -1;
    bLast:= -1;
    for j:= (i-1)*PartCount to i*PartCount - 1 do
    begin
      if (j+1 >= DrawInfo.Vert.FirstGridCell) and (bFirst = -1) then bFirst:= j+1;
      if (j+1 <= DrawInfo.Vert.LastFullVisibleCell) and (bFirst <> -1) then bLast:= j+1;
    end;
    if bLast = -1 then bLast:= bFirst;
    tempRect.Left:= 0;
    tempRect.Right:= ColWidths[0];
    tempRect.Top:= CellRect(0, bFirst).Top;
    tempRect.Bottom:= CellRect(0, bLast).Bottom;
    DrawDayName(i, tempRect, bFirst, bLast);
    exit;
  end;

  if (ACol = 1) and (ARow > 0) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    Canvas.Font.Color:= clBlack;
    i:= (ARow-1) mod PartCount;
    tempStr:= IntToStr(Parts[i].PartNumber) + '-я пара';
    textLeft:= Canvas.TextHeight(tempStr);
    Canvas.TextOut(ARect.Left + round((ColWidths[1] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    Canvas.Font.Color:= clGray;
    tempStr:= '(' + FormatDateTime('h:nn', Parts[i].StartTime) + ' - ' + FormatDateTime('h:nn', Parts[i].StopTime) + ')';
    Canvas.TextOut(ARect.Left + round((ColWidths[1] - Canvas.TextWidth(tempStr))/2), ARect.Top + 4 + textLeft + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    exit;
  end;

  if fIsLoad then
    if fVisibleEvents[ACol-2][ARow-1] <> nil then
    if (fVisibleEvents[ACol-2][ARow-1].Count > 0) then
    for I := 0 to fVisibleEvents[ACol-2, ARow-1].Count - 1 do
    begin
      if fVisibleEvents[ACol-2][ARow-1].Count = 1 then
      begin
        curRect.Left:= ARect.Left;
        curRect.Top:= ARect.Top + round((ARect.Bottom - ARect.Top - OneEventInDepWeekColumnHeight)/2);
        curRect.Right:= ARect.Right;
        curRect.Bottom:= curRect.Top + OneEventInDepWeekColumnHeight;
      end
      else
      begin
        curRect.Left:= ARect.Left + 2;
        curRect.Top:= ARect.Top + 2 + (OneEventInDepWeekColumnHeight + 2)*i;
        curRect.Right:= ARect.Left + ColWidths[ACol] - 2;
        curRect.Bottom:= ARect.Top + OneEventInDepWeekColumnHeight + 2 + (OneEventInDepWeekColumnHeight + 2)*i;
        if (fVisibleEvents[ACol-2, ARow-1].SelectedItemIndex = i) and (Col = ACol) and (Row = ARow) then
          Canvas.Pen.Color:= clMaroon
        else Canvas.Pen.Color:= clSilver;
        Canvas.RoundRect(curRect.Left, curRect.Top, curRect.Right, curRect.Bottom, 5, 5);
      end;

      Canvas.Font.Color:= clBlack;
      tempStr:= fVisibleEvents[ACol-2][ARow-1].Items[i].DiscName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr))/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 3, tempStr);

      tempStr:= fVisibleEvents[ACol-2][ARow-1].Items[i].CalcUnitName + ', ' + fVisibleEvents[ACol-2][ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-2][ARow-1].Items[i].VidZanyatName + ' (' + fVisibleEvents[ACol-2][ARow-1].Items[i].VidNagruzkiName + ')';
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 6 + Canvas.TextHeight('И'), tempStr);
      textLeft:= DayColumnWidth - Canvas.TextWidth(fVisibleEvents[ACol-2][ARow-1].Items[i].WorkTypeName) - 7;
      Canvas.Font.Color:= clSilver;
      Canvas.TextOut(curRect.Left + textLeft, curRect.Bottom - 2 - Canvas.TextHeight('осн'), fVisibleEvents[ACol-2][ARow-1].Items[i].WorkTypeName);
    end;
end;

procedure TWeekDepLessonSheduleGrid.DrawDayName(ADayNumber: integer;
  ARect: TRect; bFirst, bLast: integer);
var
  i, textTop, textLeft, litHeight, mustFirst:integer;
  drawType: TShedulerDrawType;
begin
  if (curCol = 0) and (fIsDayAllow[(curRow-1) div PartCount]) and (CurrentHighlightDay = ADayNumber) then
  begin
    Canvas.Brush.Color:= clHighlight;
    Canvas.Font.Color:= clHighlightText;
  end
  else
  begin
    Canvas.Brush.Color:= self.Color;
    Canvas.Font.Color:= clBlack;
  end;
  litHeight:= Canvas.TextHeight('И') + 2;
  textLeft:= round((ColWidths[0] - Canvas.TextWidth('Щ'))/2);
  textTop:= round(((OneEventInDepWeekColumnHeight + 4)*PartCount - (litHeight * Length(DayNames[ADayNumber])))/2);
 // else textTop:= round((FacWeekColumnHeight*TCustomLessonSheduleGrid(fOwnerGrid).GetPartCount - (litHeight * Length(DayNames[ADayNumber])))/2);
  mustFirst:= (ADayNumber - 1)*PartCount + 1;
  drawType:= sdtNormal;
  if (mustFirst = bFirst) and (mustFirst + PartCount - 1 = bLast) then
    drawType:= sdtNormal;
  if (mustFirst < bFirst) then
    drawType:= sdtBackward;
  if (mustFirst + PartCount - 1 > bLast) then
    drawType:= sdtForward;
  if drawType = sdtForward then
    ARect.Bottom:= ClientHeight;
  Canvas.FillRect(ARect);
  Canvas.Rectangle(ARect.Left, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
  case drawType of
  sdtNormal:
    for i:= 1 to Length(DayNames[ADayNumber]) do
      Canvas.TextOut(ARect.Left + textLeft, ARect.Top + TextTop + (i-1)*litHeight, DayNames[ADayNumber][i]);
  sdtForward:
    for i:= 1 to Length(DayNames[ADayNumber]) do
      if (ARect.Top + TextTop + i*litHeight < ARect.Bottom) then
        Canvas.TextOut(ARect.Left + textLeft, ARect.Top + TextTop + (i-1)*litHeight, DayNames[ADayNumber][i])
      else break;
  sdtBackward:
    for i:= Length(DayNames[ADayNumber]) downto 1 do
      if (ARect.Bottom - TextTop - (Length(DayNames[ADayNumber]) - i + 1)*litHeight > ARect.Top) then
        Canvas.TextOut(ARect.Left + textLeft, ARect.Bottom - TextTop - (Length(DayNames[ADayNumber]) - i + 1)*litHeight, DayNames[ADayNumber][i])
      else break;
  end;
end;

function TWeekDepLessonSheduleGrid.GetCurrentHighlightDay: integer;
begin
  if curRow > 0 then
    Result:= ((curRow-1) div PartCount) + 1
  else Result:= -1;
end;

function TWeekDepLessonSheduleGrid.GetDayIndex: integer;
begin
  if Row > 0 then
    Result:= (Row-1) div fParts.Count
  else
    Result:= -1;
end;

function TWeekDepLessonSheduleGrid.GetElementIndex: integer;
begin
  Result:= Col-2;
end;

function TWeekDepLessonSheduleGrid.GetPartIndex: integer;
begin
  if Row > 0 then
    Result:= (Row-1) mod fParts.Count
  else
    Result:= -1;
end;

function TWeekDepLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  if (Col > 1) and (Row > 0) then
    Result:= fVisibleEvents[Col-2][Row-1].SelectedEvent
  else Result:= nil;
end;

function TWeekDepLessonSheduleGrid.GetVisibleEvents(ACol,
  ARow: integer): TLessonVisibleEventList;
begin
  if (ACol > 1) and (ARow > 0) then
    Result:= fVisibleEvents[ACol-2, ARow-1]
  else Result:= nil;
end;

function TWeekDepLessonSheduleGrid.GoToDate(Date: TDate): string;
var
  y1, m1, d1, y2, m2, d2, h, min, s, ms: word;
  i, j, k: integer;
  startDate, stopDate: TDateTime;
  tempEvent: TSheduleEvent;
begin
  Result:= '';
  if (fIsLoad) then
  begin
    if not fDefaultSemLengthInfo.IsAudDateAllow(Date) then exit;
    fPeriodStart:= Date - DayOfWeek(Date) + 2;
    for i:= 0 to 5 do
      fIsDayAllow[i]:= fDefaultSemLengthInfo.IsAudDateAllow(fPeriodStart + i);
       
    DecodeDate(fPeriodStart, y1, m1, d1);
    DecodeDate(fPeriodStart + 6, y2, m2, d2);
    if (m2 <> m1) then
    begin
      if (y2 <> y1) then
        Result:= IntToStr(d1) + ' ' + MonthNames[m1] + ' ' + IntToStr(y1) + ' - ' + IntToStr(d2) + ' ' + MonthNames[m2] + ' ' + IntToStr(y2)
      else
        Result:= IntToStr(d1) + ' ' + MonthNames[m1] + ' - ' + IntToStr(d2) + ' ' + MonthNames[m2] + ' ' + IntToStr(y1);
    end
    else Result:= IntToStr(d1) + ' - ' + IntToStr(d2) + ' ' + MonthNames[m1] + ' ' + IntToStr(y1);

    for j:= 0 to fParts.Count*6 - 1 do
      RowHeights[j+1]:= OneEventInDepWeekColumnHeight;

    for i:= 0 to fTeachers.Count-1 do
    begin
      for j:= 0 to fParts.Count*6 - 1 do
      begin
        fVisibleEvents[i][j].SelectedItemIndex:= -1;
        fVisibleEvents[i][j].Clear;
      end;

      if TDepLessonSheduleTeacher(fTeachers[i]).EventCount > 0 then
      for j:= 0 to fParts.Count*6 - 1 do
      begin
        DecodeDate(fPeriodStart + (j div fParts.Count), y1, m1, d1);
        DecodeTime(Parts[j mod fParts.Count].StartTime, h, min, s, ms);
        startDate:= EncodeDateTime(y1, m1, d1, h, min, s, ms);
        DecodeTime(Parts[j mod fParts.Count].StopTime, h, min, s, ms);
        stopDate:= EncodeDateTime(y1, m1, d1, h, min, s, ms);
        for k:= 0 to TDepLessonSheduleTeacher(fTeachers[i]).EventCount-1 do
          if Assigned(TDepLessonSheduleTeacher(fTeachers[i]).Events[k]) then
            if ((TDepLessonSheduleTeacher(fTeachers[i]).Events[k].Start - 12 <= stopDate) and (startDate >= fDefaultSemLengthInfo.SemStart)) then
            begin
              tempEvent:= TDepLessonSheduleTeacher(fTeachers[i]).Events[k].IsOccured(startDate, stopDate);
              if tempEvent <> nil then
                fVisibleEvents[i][j].Add(tempEvent);
            end;

        if fVisibleEvents[i][j].Count > 1 then
          if RowHeights[j+1] < fVisibleEvents[i][j].Count*(OneEventInDepWeekColumnHeight + 2) + 2 then
            RowHeights[j+1]:= fVisibleEvents[i][j].Count*(OneEventInDepWeekColumnHeight + 2) + 2;
      end;
    end;
    Row:= (DayOfWeek(Date)-2)*fParts.Count + 1;
  end;
end;

function TWeekDepLessonSheduleGrid.GoToNextPeriod: string;
var
  togoDate, maxSemStop: TDate;
begin
  togoDate:= fPeriodStart + 7;
  maxSemStop:= DefaultSemLengthInfo.MaxSemStop;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate <= maxSemStop) do
    togoDate:= togoDate + 1;
  Result:= GoToDate(togoDate);
end;

function TWeekDepLessonSheduleGrid.GoToPrevPeriod: string;
var
  togoDate, minSemStart: TDate;
begin
  togoDate:= fPeriodStart - 1;
  minSemStart:= DefaultSemLengthInfo.MinSemStart;
  while (DefaultSemLengthInfo.IsAudDateAllow(togoDate-1)) and (togoDate-1 > fPeriodStart-7) and (togoDate-1 >= minSemStart) do
    togoDate:= togoDate - 1;
  Result:= GoToDate(togoDate);
end;

procedure TWeekDepLessonSheduleGrid.MouseMove(Shift: TShiftState; X,
  Y: Integer);
var
  prevCol, prevRow: integer;
begin
  prevCol:= curCol;
  prevRow:= curRow;
  inherited MouseMove(Shift, X, Y);
  MouseToCell(X, Y, curCol, curRow);
  if (curCol = 0) and (prevCol = 0) and ((curRow-1) div PartCount = (prevRow-1) div PartCount) then exit;
  if (curCol = 0) or (prevCol = 0) then
  begin
    if (curCol = 0) then
    begin
      if not fIsDayAllow[(curRow-1) div PartCount] then
        Cursor:= crDefault
      else Cursor:= crHandPoint;
    end;
    InvalidateDayName;
  end
  else Cursor:= crDefault;
end;

procedure TWeekDepLessonSheduleGrid.ReadShedule;
var
  i, j: integer;
begin
  inherited ReadShedule;
  SetLength(fVisibleEvents, fTeachers.Count);
  for I := 0 to fTeachers.Count - 1 do
  begin
    SetLength(fVisibleEvents[i], fParts.Count*6);
    for j:= 0 to fParts.Count*6 - 1 do
      fVisibleEvents[i][j]:= TLessonVisibleEventList.Create;
  end;
  RowCount:= fParts.Count*6 + 1;
  ColCount:= fTeachers.Count + 2;
  if ColCount > 2 then FixedCols:= 2
  else FixedCols:= 0;
  if RowCount > 1 then FixedRows:= 1
  else FixedRows:= 0;
  if Assigned(Parent) then
  begin
    DefaultColWidth:= WeekColumnWidth;
    DefaultRowHeight:= OneEventInDepWeekColumnHeight + 4;
    ColWidths[0]:= InWeekDayNameColWidth;
    ColWidths[1]:= DayPartColumnWidth;
    RowHeights[0]:= TeacherRowHeight;
  end;
  fIsLoad:= true;
end;

procedure TWeekDepLessonSheduleGrid.SetVisibleEvents(ACol, ARow: integer;
  const Value: TLessonVisibleEventList);
begin
  if (ACol > 1) and (ARow > 0) then
    fVisibleEvents[ACol-2, ARow-1]:= Value;
end;

procedure TWeekDepLessonSheduleGrid.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  if (Message.CharCode = VK_UP) or (Message.CharCode = VK_DOWN) or (Message.CharCode = VK_NEXT) or (Message.CharCode = VK_PRIOR) then
  begin
    InvalidateCol(0);
    InvalidateDayName;
  end;
end;

procedure TWeekDepLessonSheduleGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  curColAlt, curRowAlt, i: integer;
begin
  if (curCol = 0) then
  begin
    if fIsDayAllow[(curRow-1) div PartCount] then
      if Assigned(fOnDayNameClick) then
        fOnDayNameClick(self);
  end
  else
  begin
    if (Col > 1) and (Row > 0) then
    begin
      fVisibleEvents[Col-2][Row-1].SelectedItemIndex:= -1;
      InvalidateCell(Col, Row);
    end;
    MouseToCell(Message.XPos, Message.YPos, curColAlt, curRowAlt);
    curColAlt:= curColAlt-2;
    curRowAlt:= curRowAlt-1;
    if (curColAlt >= 0) and (curRowAlt >= 0) then
    begin
      if Length(fVisibleEvents) > curColAlt then
        if Length(fVisibleEvents[curColAlt]) > curRow then
          if fVisibleEvents[curColAlt][curRowAlt].Count > 0 then
          begin
            if fVisibleEvents[curColAlt][curRowAlt].Count = 1 then
              fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= 0
            else
            begin
              fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= -1;
              for I := 0 to fVisibleEvents[curColAlt][curRowAlt].Count - 1 do
                if (Message.YPos >= CellRect(curColAlt+2, curRowAlt+1).Top + 2 + (OneEventInDepWeekColumnHeight + 2)*i) and
                  (Message.YPos <= CellRect(curColAlt+2, curRowAlt+1).Top + OneEventInDepWeekColumnHeight + 2 + (OneEventInDepWeekColumnHeight + 2)*i) then
                begin
                  fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= i;
                  break;
                end;
            end;
            InvalidateCell(curColAlt+2, curRowAlt+1);
          end
          else fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= -1;
    end;
    inherited;
  end;
end;

procedure TWeekDepLessonSheduleGrid.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  InvalidateDayName;
end;

procedure TWeekDepLessonSheduleGrid.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  InvalidateDayName;
end;

procedure TWeekDepLessonSheduleGrid.InvalidateDayName;
var
  tempRect: TRect;
  DrawInfo: TGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  tempRect.Top := 0;
  tempRect.Left := 0;
  tempRect.Bottom := ClientHeight;
  tempRect.Right := InWeekDayNameColWidth;
  InvalidateRect(self.Handle, @tempRect, true);
end;

{ TMonthDepLessonSheduleGrid }

(*
constructor TMonthDepLessonSheduleGrid.Create(AKafIK, ASheduleIK: integer; AParrent: TWinControl);
begin
  inherited Create(AKafIK, ASheduleIK, AParrent);
end;

procedure TMonthDepLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  tempStr: string;
  i: integer;
begin
  if fIsLoad then
  begin
    if not IsDayAllow[ARow] then
    begin
      Canvas.Brush.Color:= clSilver;
      Canvas.FillRect(ARect);
      exit;
    end;
    tempStr:= '';
    for i := 0 to fParts.Count - 1 do
      if fVisibleEvents[ACol][ARow][i] <> nil then
        tempStr:= tempStr + fVisibleEvents[ACol][ARow][i].ShortDiscName + ', ';
    if tempStr <> '' then
      Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - Canvas.TextHeight('И'))/2), tempStr);
  end;
  inherited;
end;

function TMonthDepLessonSheduleGrid.GetCurrentHighlightDay: integer;
begin
  Result:= -1;
//  Result:= TMonthLessonSheduleVertCaption(fVerticalCaption).CurrentHighlightDay;
end;

function TMonthDepLessonSheduleGrid.GetDayIndex: integer;
begin
  Result:= Row;
end;

function TMonthDepLessonSheduleGrid.GetEvents(ACol, ARow,
  APart: integer): TSheduleEvent;
begin
  Result:= fVisibleEvents[ACol][ARow][APart];
end;

function TMonthDepLessonSheduleGrid.GetOnDayNameClick: TNotifyEvent;
begin
 // Result:= fVerticalCaption.OnClick;
end;

function TMonthDepLessonSheduleGrid.GetPartIndex: integer;
begin
  Result:= -1;
end;

function TMonthDepLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  Result:= nil;
end;

function TMonthDepLessonSheduleGrid.GoToDate(Date: TDate): string;
var
  d,m,y, h, min, s, ms: word;
  i, j, g, k: integer;
  startDate, stopDate: TDateTime;
begin
  Result:= '';
  if fIsLoad then
  begin
    if not fDefaultSemLengthInfo.IsAudDateAllow(Date) then exit;
    fPeriodStart:= StartOfTheMonth(Date);
  //  fVerticalCaption.RowCount:= DaysInMonth(fPeriodStart);
    RowCount:= DaysInMonth(fPeriodStart);
    Result:= FormatDateTime('mmmm yyyy г.', Date);
    for i:= 0 to fTeachers.Count-1 do
    begin
      if TDepLessonSheduleTeacher(fTeachers[i]).EventCount > 0 then
      for j:= 0 to RowCount - 1 do
      begin
        DecodeDate(fPeriodStart + j, y, m, d);
        for g:= 0 to fParts.Count - 1 do
        begin
          fVisibleEvents[i][j][g]:= nil;
          DecodeTime(Parts[g].StartTime, h, min, s, ms);
          startDate:= EncodeDateTime(y, m, d, h, min, s, ms);
          DecodeTime(Parts[g].StopTime, h, min, s, ms);
          stopDate:= EncodeDateTime(y, m, d, h, min, s, ms);
          for k:= 0 to TDepLessonSheduleTeacher(fTeachers[i]).EventCount-1 do
            if Assigned(TDepLessonSheduleTeacher(fTeachers[i]).Events[k]) then
            begin
              if ((TDepLessonSheduleTeacher(fTeachers[i]).Events[k].Start - 12 <= stopDate) and (startDate >= fDefaultSemLengthInfo.SemStart)) then
                fVisibleEvents[i][j][g]:= TDepLessonSheduleTeacher(fTeachers[i]).Events[k].IsOccured(startDate, stopDate);
              if (fVisibleEvents[i][j][g] <> nil) then break;
            end;
        end;
      end;
    end; 
  end;
 // fMonthStop:= EncodeDate(y, m, d);
  //переходим по дате и устанавливаем выбранный день тот, который был в Date

end;

function TMonthDepLessonSheduleGrid.GoToNextPeriod: string;
begin
//  GoToDate(fMonthStop+7);
end;

function TMonthDepLessonSheduleGrid.GoToPrevPeriod: string;
begin
 // GoToDate(fPeriodStart-2);
end;

procedure TMonthDepLessonSheduleGrid.ReadShedule;
var
  i, j: integer;
begin
  inherited ReadShedule;
  SetLength(fIsDayAllow, DaysInMonth(fPeriodStart));
  SetLength(fVisibleEvents, fTeachers.Count);
  for I := 0 to fTeachers.Count - 1 do
  begin
    SetLength(fVisibleEvents[i], 31);
    for j := 0 to 31 do
      SetLength(fVisibleEvents[i][j], fParts.Count);
  end;
  DefaultColWidth:= MonthColumnWidth;
  DefaultRowHeight:= MonthColumnHeight;
 { fHorizontalCaption.DefaultColWidth:= WeekColumnWidth;
  fHorizCaptionLeftSpacer.Width:= inMonthDayNameColWidth + 1;
  fVerticalCaption.ColWidths[0]:= inMonthDayNameColWidth;
  fVertCapLocate.Width:= inMonthDayNameColWidth + 1;

// косяк fPeriodStart в этот момент еще не установлен
  fVerticalCaption.RowCount:= DaysInMonth(fPeriodStart);
  fVerticalCaption.DefaultRowHeight:= MonthColumnHeight;
  RowCount:= DaysInMonth(fPeriodStart);       }
  fIsLoad:= true;
end;

procedure TMonthDepLessonSheduleGrid.SetEvents(ACol, ARow, APart: integer;
  const Value: TSheduleEvent);
begin
  fVisibleEvents[ACol][ARow][APart]:= Value;
end;

procedure TMonthDepLessonSheduleGrid.SetOnDayNameClick(
  const Value: TNotifyEvent);
begin
  //fVerticalCaption.OnClick:= Value;
end;
*)

{ TDepSheduleTeacher }

{
function TDepLessonSheduleTeacher.AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
begin
  Result:= fRecordInEventStorage.AddEvent(AEvent);
end;
}

constructor TDepLessonSheduleTeacher.Create(ASheduleIK, ATabN: integer; AFirstName, ALastName, ACotch: string);
begin
  inherited Create(ATabN, AFirstName, ALastName, ACotch);
  fRecordInEventStorage:= TSheduleRegistry.Functions.GetTeacherEvents(ASheduleIK, ATabN, false);
end;

function TDepLessonSheduleTeacher.DeleteAllItems: boolean;
begin
  Result:= fRecordInEventStorage.DeleteAllWithoutDeleteFromDB;
end;

{
function TDepLessonSheduleTeacher.DeleteEvent(index: integer; IsDeleteFromDB: boolean): boolean;
begin
  Result:= fRecordInEventStorage.DeleteEventByIndex(index, IsDeleteFromDB);
end;
}

function TDepLessonSheduleTeacher.GetEvent(index: integer): TSheduleEvent;
begin
  Result:= fRecordInEventStorage.Events[index];
end;

function TDepLessonSheduleTeacher.GetEventCount: integer;
begin
  Result:= fRecordInEventStorage.GetEventCount;
end;

procedure TDepLessonSheduleTeacher.SetEvent(index: integer;
  const Value: TSheduleEvent);
begin
  fRecordInEventStorage.Events[index]:= Value;
end;

{ TFacLessonSheduleGrid }

{
function TFacLessonSheduleGrid.AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
//var
//  i: integer;
begin
  Result:= nil;
  for i := 0 to fGroups.Count - 1 do
    if AEvent.GroupIKList.IndexOf(IntToStr(Groups[i].GroupIK)) >= 0 then
    begin
      Result:= Groups[i].AddEvent(AEvent);
      exit; // можем выйти, т.к. хранилище само добавило события для остальных групп
    end;
  if Result = nil then raise EApplicationException.Create('Событие группы не было добавлено в расписание!');

end;    }

constructor TFacLessonSheduleGrid.Create(AFacIK, ASheduleIK: integer;
  AParrent: TWinControl);
begin
  inherited Create(ASheduleIK, AParrent);
  fFacultyIK:= AFacIK;
  fGroups:= TObjectList.Create;
end;

function TFacLessonSheduleGrid.DeleteAllItems: boolean;
var
  i: integer;
begin
  for I := 0 to fGroups.Count - 1 do
    Groups[i].DeleteAllItems;
  Result:= TSheduleController.MainFunctions.DeleteFacLessonShedule(fSheduleIK, fFacultyIK);
end;

{
function TFacLessonSheduleGrid.DeleteEvent(AEventIK: integer): boolean;
var
  i, j: integer;
begin
  Result:= false;
  for i:= 0 to fGroups.Count-1 do
    for j:= 0 to Groups[i].EventCount-1 do
      if Groups[i].Events[j].EventIK = AEventIK then
        if Groups[i].DeleteEvent(j, true) then
        begin
          CheckAndDeleteFromVisibleEvents(AEventIK);
          Result:= true;
          exit;
        end;
end;               }

function TFacLessonSheduleGrid.DeleteException(AEventIK: integer): boolean;
var
  i, j, k: integer;
begin
  Result:= false;
  for i:= 0 to fGroups.Count-1 do
    for j:= 0 to Groups[i].EventCount-1 do
      for k:= 0 to Groups[i].Events[j].ExceptionCount-1 do
        if Groups[i].Events[j].Exceptions[k].EventIK = AEventIK then
        begin
          Groups[i].Events[j].DeleteException(k);
          Result:= true;
          exit;
        end;
end;

destructor TFacLessonSheduleGrid.Destroy;
begin
  FreeAndNil(fGroups);
  inherited;
end;

function TFacLessonSheduleGrid.GenerateShedule: boolean;
begin
  Result:= true;
end;

function TFacLessonSheduleGrid.GetGroup(index: integer): TFacLessonSheduleGroup;
begin
  Result:= TFacLessonSheduleGroup(fGroups[index]);
end;

function TFacLessonSheduleGrid.GroupCount: integer;
begin
  Result:= fGroups.Count;
end;

procedure TFacLessonSheduleGrid.ReadShedule;
var
  curYearValue: string;
  tempDS: TADODataSet;
begin
  inherited ReadShedule;
  fGroups.Clear;
 { tempDS.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(DefaultSemLengthInfo.YearIK);
  tempDS.Open;
  curYearValue:= tempDS.FieldByName('year_value').AsString;
  tempDS.Close;
  case DefaultSemLengthInfo.SemIK of
  1: tempDS.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = ' + IntToStr(fFacultyIK) +
      ') and (nYear_post <= ' + curYearValue + ') and (nYear_post + YearObuch > ' + curYearValue + ') ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + curYearValue + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + curYearValue + ') ORDER BY nYear_post, cName_grup';
  2: tempDS.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = ' + IntToStr(fFacultyIK) +
      ') and (nYear_post <= ' + curYearValue + ') and (nYear_post + YearObuch > ' + curYearValue + ') ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + curYearValue + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + curYearValue + ') ORDER BY nYear_post, cName_grup';
  end;       }

  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM GetGroupsForFaculty(' + IntToStr(fFacultyIK) + ', ' + IntToStr(DefaultSemLengthInfo.YearIK) + ', ' + IntToStr(DefaultSemLengthInfo.SemIK) + ')';
  tempDS.Open;
  while (not tempDS.Eof) do
  begin
    fGroups.Add(TFacLessonSheduleGroup.Create(fSheduleIK, tempDS.FieldByName('ik_grup').AsInteger, tempDS.FieldByName('cName_grup').AsString));
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

procedure TFacLessonSheduleGrid.SetGroup(index: integer;
  const Value: TFacLessonSheduleGroup);
begin
  fGroups[index]:= Value;
end;

{ TCustomLessonSheduleGrid }

function TCustomLessonSheduleGrid.AddEvent(
  AEvent: TSheduleEvent): TSheduleEvent;
begin
  Result:= TSheduleRegistry.EventStorage.AddEvent(AEvent);
//  if Result <> nil then GoToDate(PeriodStart + DayIndex);
end;

function TCustomLessonSheduleGrid.DeleteEvent(AEventIK: integer): boolean;
begin
  Result:= TSheduleRegistry.EventStorage.DeleteEvent(AEventIK, true);
  if Result then GoToDate(PeriodStart + DayIndex);
end;

destructor TCustomLessonSheduleGrid.Destroy;
begin
  if Assigned(fParts) then FreeAndNil(fParts);
  inherited;
end;

function TCustomLessonSheduleGrid.getCurrentWeekTypeName: string;
begin
  if (WeeksBetween(fPeriodStart - DayOfTheWeek(fPeriodStart), DefaultSemLengthInfo.SemStart - DayOfTheWeek(DefaultSemLengthInfo.SemStart)) mod 2 = 0) then
    Result:= 'числитель'
  else Result:= 'знаменатель';
end;

function TCustomLessonSheduleGrid.GetPart(index: integer): TSPartInfo;
begin
  Result:= TSPartInfo(fParts[index]);
end;

function TCustomLessonSheduleGrid.GetPartCount: integer;
begin
  Result:= fParts.Count;
end;

function TCustomLessonSheduleGrid.GetVisibleEvents(ACol,
  ARow: integer): TLessonVisibleEventList;
begin
  if (ACol > 0) and (ARow > 0) then
    Result:= fVisibleEvents[ACol-1, ARow-1]
  else Result:= nil;
end;

procedure TCustomLessonSheduleGrid.ReadShedule;
begin
  inherited ReadShedule;
  fPeriodStart:= DefaultSemLengthInfo.MinSemStart;
  TSheduleRegistry.Functions.GetParts(fParts);
  if Assigned(Parent) then
  begin
    OneEventInDepDayColumnHeight:= Canvas.TextHeight('И')*2 + Canvas.TextHeight('осн') + 5;
    OneEventInFacDayColumnHeight:= Canvas.TextHeight('И')*3 + 9;
    OneEventInDepWeekColumnHeight:= OneEventInDepDayColumnHeight;
    OneEventInFacWeekColumnHeight:= OneEventInFacDayColumnHeight;
   // MonthColumnHeight:= Canvas.TextHeight('И') + 6;
  end;
end;

procedure TCustomLessonSheduleGrid.SetPart(index: integer;
  const Value: TSPartInfo);
begin
  fParts[index]:= Value;
end;

procedure TCustomLessonSheduleGrid.SetVisibleEvents(ACol, ARow: integer;
  const Value: TLessonVisibleEventList);
begin
  if (ACol > 0) and (ARow > 0) then
    fVisibleEvents[ACol-1, ARow-1]:= Value;
end;

{ TDayFacLessonSheduleGrid }

{
procedure TDayFacLessonSheduleGrid.CheckAndDeleteFromVisibleEvents(
  EventIK: integer);
begin
  if (Col >= 1) and (Row >= 1) then
    fVisibleEvents[Col-1, Row-1].DeleteEvent(EventIK);
end;
 }

constructor TDayFacLessonSheduleGrid.Create(AFacultyIK, ASheduleIK: integer;
  AParrent: TWinControl);
begin
  inherited Create(AFacultyIK, ASheduleIK, AParrent);
  SetLength(fIsDayAllow, 1);
  fIsDayAllow[0]:= true;
  {fVerticalCaption:= TDayLessonSheduleVertCaption.Create(self, fVertCapLocate);
  fVerticalCaption.ScrollBars:= ssNone;
  fVertCapLocate.Width:= fVerticalCaption.ColWidths[0] + 1;  }
end;

procedure TDayFacLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  textLeft, i: integer;
  tempStr: string;
  curRect: TRect;
begin
  if (ARow = 0) and (ACol < 1) then exit;

  if (ARow = 0) or (ACol = 0) then
  begin
    Canvas.Pen.Color:= clSilver;
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
  end;

  if (ARow = 0) and (ACol > 0) then
  begin
    Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(Groups[ACol-1].GroupName))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Groups[ACol-1].GroupName))/2), Groups[ACol-1].GroupName);
    exit;
  end;

  if (ARow > 0) and (ACol = 0) then
  begin
    Canvas.Font.Color:= clBlack;
    tempStr:= IntToStr(Parts[ARow-1].PartNumber) + '-я пара';
    textLeft:= Canvas.TextHeight(tempStr);
    Canvas.TextOut(ARect.Left + round((ColWidths[0] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    Canvas.Font.Color:= clGray;
    tempStr:= '(' + FormatDateTime('h:nn', Parts[ARow-1].StartTime) + ' - ' + FormatDateTime('h:nn', Parts[ARow-1].StopTime) + ')';
    Canvas.TextOut(ARect.Left + round((ColWidths[0] - Canvas.TextWidth(tempStr))/2), ARect.Top + 4 + textLeft + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    exit;
  end;

  if fIsLoad then
    if (fVisibleEvents[ACol-1][ARow-1] <> nil) then
    if (fVisibleEvents[ACol-1][ARow-1].Count > 0) then
    for I := 0 to fVisibleEvents[ACol-1, ARow-1].Count - 1 do
    begin
      if fVisibleEvents[ACol-1][ARow-1].Count = 1 then
      begin
        curRect.Left:= ARect.Left;
        curRect.Top:= ARect.Top + round((ARect.Bottom - ARect.Top - OneEventInFacDayColumnHeight)/2);
        curRect.Right:= ARect.Right;
        curRect.Bottom:= curRect.Top + OneEventInFacDayColumnHeight;
      end
      else
      begin
        curRect.Left:= ARect.Left + 2;
        curRect.Top:= ARect.Top + 2 + (OneEventInFacDayColumnHeight + 2)*i;
        curRect.Right:= ARect.Left + ColWidths[ACol] - 2;
        curRect.Bottom:= ARect.Top + OneEventInFacDayColumnHeight + 2 + (OneEventInFacDayColumnHeight + 2)*i;
        if (fVisibleEvents[ACol-1, ARow-1].SelectedItemIndex = i) and (Col = ACol) and (Row = ARow) then
          Canvas.Pen.Color:= clMaroon
        else Canvas.Pen.Color:= clSilver;
        Canvas.RoundRect(curRect.Left, curRect.Top, curRect.Right, curRect.Bottom, 5, 5);
      end;

      Canvas.Font.Color:= clBlack;

      tempStr:= fVisibleEvents[ACol-1][ARow-1].Items[i].DiscName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 2, tempStr);

      tempStr:= fVisibleEvents[ACol-1][ARow-1].Items[i].TeacherWithWTName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 4 + Canvas.TextHeight('И'), tempStr);

      tempStr:= fVisibleEvents[ACol-1][ARow-1].Items[i].CalcUnitName + ', ' + fVisibleEvents[ACol-1][ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-1][ARow-1].Items[i].VidZanyatName + ' (' + fVisibleEvents[ACol-1][ARow-1].Items[i].VidNagruzkiName + ')';
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 6 + Canvas.TextHeight('И')*2, tempStr);
    end;
end;

function TDayFacLessonSheduleGrid.GetDayIndex: integer;
begin
  Result:= 0;
end;

function TDayFacLessonSheduleGrid.GetPartIndex: integer;
begin
  Result:= Row-1;
end;

function TDayFacLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  if (Col > 0) and (Row > 0) then
    Result:= fVisibleEvents[Col-1][Row-1].SelectedEvent
  else Result:= nil;
end;

function TDayFacLessonSheduleGrid.GoToDate(Date: TDate): string;
var
  y, m, d, h, min, s, ms: word;
  i,j,k: integer;
  startDate, stopDate: TDateTime;
  tempEvent: TSheduleEvent;
begin
  Result:= '';
  if fIsLoad then
  begin
    if not fDefaultSemLengthInfo.IsAudDateAllow(Date) then exit;
    fPeriodStart:= Date;
    DecodeDate(Date, y, m, d);
    Result:= IntToStr(d) + ' ' + MonthNames[m] + ' ' + IntToStr(y) + ' года (' + FormatDateTime('dddd', Date) + ')';
    for j:= 0 to fParts.Count - 1 do
      RowHeights[j+1]:= OneEventInFacDayColumnHeight;

    for i:= 0 to fGroups.Count-1 do
    begin
      for j:= 0 to fParts.Count - 1 do
      begin
        fVisibleEvents[i][j].SelectedItemIndex:= -1;
        fVisibleEvents[i][j].Clear;
      end;

      if TFacLessonSheduleGroup(fGroups[i]).EventCount > 0 then
      for j:= 0 to fParts.Count - 1 do
      begin
        DecodeTime(Parts[j mod fParts.Count].StartTime, h, min, s, ms);
        startDate:= EncodeDateTime(y, m, d, h, min, s, ms);
        DecodeTime(Parts[j mod fParts.Count].StopTime, h, min, s, ms);
        stopDate:= EncodeDateTime(y, m, d, h, min, s, ms);
        for k:= 0 to TFacLessonSheduleGroup(fGroups[i]).EventCount-1 do
          if Assigned(TFacLessonSheduleGroup(fGroups[i]).Events[k]) then
            if ((TFacLessonSheduleGroup(fGroups[i]).Events[k].Start - 12 <= stopDate) and (startDate >= fDefaultSemLengthInfo.SemStart)) then
            begin
              tempEvent:= TFacLessonSheduleGroup(fGroups[i]).Events[k].IsOccured(startDate, stopDate);
              if tempEvent <> nil then
                fVisibleEvents[i][j].Add(tempEvent);
            end;

        if fVisibleEvents[i][j].Count > 1 then
          if RowHeights[j+1] < fVisibleEvents[i][j].Count*(OneEventInFacDayColumnHeight + 2) + 2 then
            RowHeights[j+1]:= fVisibleEvents[i][j].Count*(OneEventInFacDayColumnHeight + 2) + 2;
      end;
    end;
  end;
end;

function TDayFacLessonSheduleGrid.GoToNextPeriod: string;
var
  togoDate, maxSemStop: TDate;
begin
  togoDate:= fPeriodStart+1;
  maxSemStop:= DefaultSemLengthInfo.MaxSemStop;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate <= maxSemStop) do
    togoDate:= togoDate + 1;
  Result:= GoToDate(togoDate);
end;

function TDayFacLessonSheduleGrid.GoToPrevPeriod: string;
var
  togoDate, minSemStart: TDate;
begin
  togoDate:= fPeriodStart - 1;
  minSemStart:= DefaultSemLengthInfo.MinSemStart;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate >= minSemStart) do
    togoDate:= togoDate - 1;
  Result:= GoToDate(togoDate);
end;

procedure TDayFacLessonSheduleGrid.ReadShedule;
var
  i, j: integer;
begin
  inherited ReadShedule;
  SetLength(fVisibleEvents, fGroups.Count);
  for I := 0 to fGroups.Count - 1 do
  begin
    SetLength(fVisibleEvents[i], fParts.Count);
    for j:= 0 to fParts.Count - 1 do
      fVisibleEvents[i][j]:= TLessonVisibleEventList.Create;
  end;
  RowCount:= fParts.Count + 1;
  ColCount:= fGroups.Count + 1;
  if ColCount > 1 then FixedCols:= 1
  else FixedCols:= 0;
  if RowCount > 1 then FixedRows:= 1
  else FixedRows:= 0;
  if Parent <> nil then
  begin
    DefaultColWidth:= DayColumnWidth;
    DefaultRowHeight:= OneEventInFacDayColumnHeight + 4;
    RowHeights[0]:= TeacherRowHeight;
    ColWidths[0]:= DayPartColumnWidth;
  end;

 { fHorizontalCaption.DefaultColWidth:= DayColumnWidth;
  fHorizCaptionLeftSpacer.Width:= DayPartColumnWidth+1;
  fVerticalCaption.DefaultColWidth:= DayPartColumnWidth;
  fVertCapLocate.Width:= fVerticalCaption.DefaultColWidth + 1;
  fVerticalCaption.RowCount:= fParts.Count;
  fVerticalCaption.DefaultRowHeight:= FacDayColumnHeight;
  RowCount:= fParts.Count;}
  fIsLoad:= true;
end;

procedure TDayFacLessonSheduleGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  curCol, curRow, i: integer;
begin
  if (Col > 0) and (Row > 0) then
  begin
    fVisibleEvents[Col-1][Row-1].SelectedItemIndex:= -1;
    InvalidateCell(Col, Row);
  end;
  MouseToCell(Message.XPos, Message.YPos, curCol, curRow);
  curCol:= curCol-1;
  curRow:= curRow-1;
  if (curCol >= 0) and (curRow >= 0) then
  begin
    if Length(fVisibleEvents) > curCol then
      if Length(fVisibleEvents[curCol]) > curRow then
        if fVisibleEvents[curCol][curRow].Count > 0 then
        begin
          if fVisibleEvents[curCol][curRow].Count = 1 then
            fVisibleEvents[curCol][curRow].SelectedItemIndex:= 0
          else
          begin
            fVisibleEvents[curCol][curRow].SelectedItemIndex:= -1;
            for I := 0 to fVisibleEvents[curCol][curRow].Count - 1 do
              if (Message.YPos >= CellRect(curCol+1, curRow+1).Top + 2 + (OneEventInFacDayColumnHeight + 2)*i) and
                (Message.YPos <= CellRect(curCol+1, curRow+1).Top + OneEventInFacDayColumnHeight + 2 + (OneEventInFacDayColumnHeight + 2)*i) then
              begin
                fVisibleEvents[curCol][curRow].SelectedItemIndex:= i;
                break;
              end;
          end;
          InvalidateCell(curCol+1, curRow+1);
        end
        else fVisibleEvents[curCol][curRow].SelectedItemIndex:= -1;
  end;
  inherited;
end;

{ TWeekFacLessonSheduleGrid }
{
procedure TWeekFacLessonSheduleGrid.CheckAndDeleteFromVisibleEvents(
  EventIK: integer);
begin
  if (Col >= 2) and (Row >= 1) then
    fVisibleEvents[Col-2, Row-1].DeleteEvent(EventIK);
end;
 }

procedure TWeekFacLessonSheduleGrid.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  curRow:= -1;
  curCol:= -1;
  InvalidateDayName;
end;

constructor TWeekFacLessonSheduleGrid.Create(AFacultyIK, ASheduleIK: integer;
  AParrent: TWinControl);
var
  I: integer;
begin
  inherited Create(AFacultyIK, ASheduleIK, AParrent);
  SetLength(fIsDayAllow, 6);
  for I := 0 to Length(fIsDayAllow) - 1 do fIsDayAllow[i]:= false;
 { fVerticalCaption:= TWeekLessonSheduleVertCaption.Create(self, fVertCapLocate);
  fVerticalCaption.ScrollBars:= ssNone;
  fVerticalCaption.ColCount:= 2;
  fHorizontalCaption.ColCount:= 3;
  fVertCapLocate.Width:= fVerticalCaption.ColWidths[0] + fVerticalCaption.ColWidths[1] + 1;}
end;

procedure TWeekFacLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  tempStr: string;
  textLeft, i: integer;
  tempRect: tRect;
  j, bFirst, bLast: integer;
  DrawInfo: TGridDrawInfo;
  curRect: TRect;
begin
  if (ARow = 0) and (ACol < 2) then exit;

  Canvas.Pen.Color:= clSilver;
  if (ARow = 0) and (ACol > 1) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(Groups[ACol-2].GroupName))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Groups[ACol-2].GroupName))/2), Groups[ACol-2].GroupName);
    exit;
  end;

  if (ACol = 0) and (ARow > 0) then
  begin
    i:= ((ARow-1) div PartCount) + 1;    //текущий день
    CalcDrawInfo(DrawInfo);
    bFirst:= -1;
    bLast:= -1;
    for j:= (i-1)*PartCount to i*PartCount - 1 do
    begin
      if (j+1 >= DrawInfo.Vert.FirstGridCell) and (bFirst = -1) then bFirst:= j+1;
      if (j+1 <= DrawInfo.Vert.LastFullVisibleCell) and (bFirst <> -1) then bLast:= j+1;
    end;
    if bLast = -1 then bLast:= bFirst;
    tempRect.Left:= 0;
    tempRect.Right:= ColWidths[0];
    tempRect.Top:= CellRect(0, bFirst).Top;
    tempRect.Bottom:= CellRect(0, bLast).Bottom;
    DrawDayName(i, tempRect, bFirst, bLast);
    exit;
  end;

  if (ACol = 1) and (ARow > 0) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    Canvas.Font.Color:= clBlack;
    i:= (ARow-1) mod PartCount;
    tempStr:= IntToStr(Parts[i].PartNumber) + '-я пара';
    textLeft:= Canvas.TextHeight(tempStr);
    Canvas.TextOut(ARect.Left + round((ColWidths[1] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    Canvas.Font.Color:= clGray;
    tempStr:= '(' + FormatDateTime('h:nn', Parts[i].StartTime) + ' - ' + FormatDateTime('h:nn', Parts[i].StopTime) + ')';
    Canvas.TextOut(ARect.Left + round((ColWidths[1] - Canvas.TextWidth(tempStr))/2), ARect.Top + 4 + textLeft + round((RowHeights[ARow] - textLeft*2 - 4)/2), tempStr);
    exit;
  end;

  if fIsLoad then
    if fVisibleEvents[ACol-2][ARow-1] <> nil then
    if (fVisibleEvents[ACol-2][ARow-1].Count > 0) then
    for I := 0 to fVisibleEvents[ACol-2, ARow-1].Count - 1 do
    begin
      if fVisibleEvents[ACol-2][ARow-1].Count = 1 then
      begin
        curRect.Left:= ARect.Left;
        curRect.Top:= ARect.Top + round((ARect.Bottom - ARect.Top - OneEventInFacWeekColumnHeight)/2);
        curRect.Right:= ARect.Right;
        curRect.Bottom:= curRect.Top + OneEventInFacWeekColumnHeight;
      end
      else
      begin
        curRect.Left:= ARect.Left + 2;
        curRect.Top:= ARect.Top + 2 + (OneEventInFacWeekColumnHeight + 2)*i;
        curRect.Right:= ARect.Left + ColWidths[ACol] - 2;
        curRect.Bottom:= ARect.Top + OneEventInFacWeekColumnHeight + 2 + (OneEventInFacWeekColumnHeight + 2)*i;
        if (fVisibleEvents[ACol-2, ARow-1].SelectedItemIndex = i) and (Col = ACol) and (Row = ARow) then
          Canvas.Pen.Color:= clMaroon
        else Canvas.Pen.Color:= clSilver;
        Canvas.RoundRect(curRect.Left, curRect.Top, curRect.Right, curRect.Bottom, 5, 5);
      end;

      Canvas.Font.Color:= clBlack;
      tempStr:= fVisibleEvents[ACol-2][ARow-1].Items[i].DiscName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 2, tempStr);

      tempStr:= fVisibleEvents[ACol-2][ARow-1].Items[i].TeacherWithWTName;
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 4 + Canvas.TextHeight('И'), tempStr);

      tempStr:= fVisibleEvents[ACol-2][ARow-1].Items[i].CalcUnitName + ', ' + fVisibleEvents[ACol-2][ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-2][ARow-1].Items[i].VidZanyatName + ' (' + fVisibleEvents[ACol-2][ARow-1].Items[i].VidNagruzkiName + ')';
      if Canvas.TextWidth(tempStr) > DayColumnWidth-9 then
      begin
        tempStr:= tempStr + '...';
        while Canvas.TextWidth(tempStr) > DayColumnWidth-9 do
        begin
          tempStr:= Copy(tempStr, 0, length(tempStr)-4);
          tempStr:= tempStr + '...';
        end;
      end;
      textLeft:= round((DayColumnWidth - Canvas.TextWidth(tempStr) - 4)/2);
      Canvas.TextOut(curRect.Left + textLeft, curRect.Top + 6 + Canvas.TextHeight('И')*2, tempStr);
    end;
end;

procedure TWeekFacLessonSheduleGrid.DrawDayName(ADayNumber: integer;
  ARect: TRect; bFirst, bLast: integer);
var
  i, textTop, textLeft, litHeight, mustFirst:integer;
  drawType: TShedulerDrawType;
begin
  if (curCol = 0) and (fIsDayAllow[(curRow-1) div PartCount]) and (CurrentHighlightDay = ADayNumber) then
  begin
    Canvas.Brush.Color:= clHighlight;
    Canvas.Font.Color:= clHighlightText;
  end
  else
  begin
    Canvas.Brush.Color:= self.Color;
    Canvas.Font.Color:= clBlack;
  end;
  litHeight:= Canvas.TextHeight('И') + 2;
  textLeft:= round((ColWidths[0] - Canvas.TextWidth('Щ'))/2);
  textTop:= round(((OneEventInFacWeekColumnHeight + 4)*PartCount - (litHeight * Length(DayNames[ADayNumber])))/2);
  mustFirst:= (ADayNumber - 1)*PartCount + 1;
  drawType:= sdtNormal;
  if (mustFirst = bFirst) and (mustFirst + PartCount - 1 = bLast) then
    drawType:= sdtNormal;
  if (mustFirst < bFirst) then
    drawType:= sdtBackward;
  if (mustFirst + PartCount - 1 > bLast) then
    drawType:= sdtForward;
  if drawType = sdtForward then
    ARect.Bottom:= ClientHeight;
  Canvas.FillRect(ARect);
  Canvas.Rectangle(ARect.Left, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
  case drawType of
  sdtNormal:
    for i:= 1 to Length(DayNames[ADayNumber]) do
      Canvas.TextOut(ARect.Left + textLeft, ARect.Top + TextTop + (i-1)*litHeight, DayNames[ADayNumber][i]);
  sdtForward:
    for i:= 1 to Length(DayNames[ADayNumber]) do
      if (ARect.Top + TextTop + i*litHeight < ARect.Bottom) then
        Canvas.TextOut(ARect.Left + textLeft, ARect.Top + TextTop + (i-1)*litHeight, DayNames[ADayNumber][i])
      else break;
  sdtBackward:
    for i:= Length(DayNames[ADayNumber]) downto 1 do
      if (ARect.Bottom - TextTop - (Length(DayNames[ADayNumber]) - i + 1)*litHeight > ARect.Top) then
        Canvas.TextOut(ARect.Left + textLeft, ARect.Bottom - TextTop - (Length(DayNames[ADayNumber]) - i + 1)*litHeight, DayNames[ADayNumber][i])
      else break;
  end;
end;

function TWeekFacLessonSheduleGrid.GetCurrentHighlightDay: integer;
begin
  if curRow > 0 then
    Result:= ((curRow-1) div PartCount) + 1
  else Result:= -1;
end;

function TWeekFacLessonSheduleGrid.GetDayIndex: integer;
begin
  if Row > 0 then
    Result:= (Row-1) div fParts.Count
  else
    Result:= -1;
end;

function TWeekFacLessonSheduleGrid.GetElementIndex: integer;
begin
  Result:= Col-2;
end;

function TWeekFacLessonSheduleGrid.GetPartIndex: integer;
begin
  if Row > 0 then
    Result:= (Row-1) mod fParts.Count
  else
    Result:= -1;
end;

function TWeekFacLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  if (Col > 1) and (Row > 0) then
    Result:= fVisibleEvents[Col-2][Row-1].SelectedEvent
  else Result:= nil;
end;

function TWeekFacLessonSheduleGrid.GetVisibleEvents(ACol,
  ARow: integer): TLessonVisibleEventList;
begin
  if (ACol > 1) and (ARow > 0) then
    Result:= fVisibleEvents[ACol-2, ARow-1]
  else Result:= nil;
end;

function TWeekFacLessonSheduleGrid.GoToDate(Date: TDate): string;
var
  y1, m1, d1, y2, m2, d2, h, min, s, ms: word;
  i, j, k: integer;
  startDate, stopDate: TDateTime;
  tempEvent: TSheduleEvent;
begin
  Result:= '';
  if (fIsLoad) then
  begin
    if not fDefaultSemLengthInfo.IsAudDateAllow(Date) then exit;
    fPeriodStart:= Date - DayOfWeek(Date) + 2;
    for i:= 0 to 5 do
      fIsDayAllow[i]:= fDefaultSemLengthInfo.IsAudDateAllow(fPeriodStart + i);
    DecodeDate(fPeriodStart, y1, m1, d1);
    DecodeDate(fPeriodStart + 6, y2, m2, d2);
    if (m2 <> m1) then
    begin
      if (y2 <> y1) then
        Result:= IntToStr(d1) + ' ' + MonthNames[m1] + ' ' + IntToStr(y1) + ' - ' + IntToStr(d2) + ' ' + MonthNames[m2] + ' ' + IntToStr(y2)
      else
        Result:= IntToStr(d1) + ' ' + MonthNames[m1] + ' - ' + IntToStr(d2) + ' ' + MonthNames[m2] + ' ' + IntToStr(y1);
    end
    else Result:= IntToStr(d1) + ' - ' + IntToStr(d2) + ' ' + MonthNames[m1] + ' ' + IntToStr(y1);

    for j:= 0 to fParts.Count*6 - 1 do
      RowHeights[j+1]:= OneEventInFacWeekColumnHeight;

    for i:= 0 to fGroups.Count-1 do
    begin
      for j:= 0 to fParts.Count*6 - 1 do
      begin
        fVisibleEvents[i][j].SelectedItemIndex:= -1;
        fVisibleEvents[i][j].Clear;
      end;

      if TFacLessonSheduleGroup(fGroups[i]).EventCount > 0 then
      for j:= 0 to fParts.Count*6 - 1 do
      begin
        DecodeDate(fPeriodStart + (j div fParts.Count), y1, m1, d1);
        DecodeTime(Parts[j mod fParts.Count].StartTime, h, min, s, ms);
        startDate:= EncodeDateTime(y1, m1, d1, h, min, s, ms);
        DecodeTime(Parts[j mod fParts.Count].StopTime, h, min, s, ms);
        stopDate:= EncodeDateTime(y1, m1, d1, h, min, s, ms);
        for k:= 0 to TFacLessonSheduleGroup(fGroups[i]).EventCount-1 do
          if Assigned(TFacLessonSheduleGroup(fGroups[i]).Events[k]) then
            if ((TFacLessonSheduleGroup(fGroups[i]).Events[k].Start - 12 <= stopDate) and (startDate >= fDefaultSemLengthInfo.SemStart)) then
            begin
              tempEvent:= TFacLessonSheduleGroup(fGroups[i]).Events[k].IsOccured(startDate, stopDate);
              if tempEvent <> nil then
                fVisibleEvents[i][j].Add(tempEvent);
            end;

        if fVisibleEvents[i][j].Count > 1 then
          if RowHeights[j+1] < fVisibleEvents[i][j].Count*(OneEventInFacWeekColumnHeight + 2) + 2 then
            RowHeights[j+1]:= fVisibleEvents[i][j].Count*(OneEventInFacWeekColumnHeight + 2) + 2;
      end;
    end;
    Row:= (DayOfWeek(Date)-2)*fParts.Count + 1;
  end;
end;

function TWeekFacLessonSheduleGrid.GoToNextPeriod: string;
var
  togoDate, maxSemStop: TDate;
begin
  togoDate:= fPeriodStart + 7;
  maxSemStop:= DefaultSemLengthInfo.MaxSemStop;
  while (not DefaultSemLengthInfo.IsAudDateAllow(togoDate)) and (togoDate <= maxSemStop) do
    togoDate:= togoDate + 1;
  Result:= GoToDate(togoDate);
end;

function TWeekFacLessonSheduleGrid.GoToPrevPeriod: string;
var
  togoDate, minSemStart: TDate;
begin
  togoDate:= fPeriodStart - 1;
  minSemStart:= DefaultSemLengthInfo.MinSemStart;
  while (DefaultSemLengthInfo.IsAudDateAllow(togoDate-1)) and (togoDate-1 > fPeriodStart-7) and (togoDate-1 >= minSemStart) do
    togoDate:= togoDate - 1;
  Result:= GoToDate(togoDate);
end;

procedure TWeekFacLessonSheduleGrid.InvalidateDayName;
var
  tempRect: TRect;
  DrawInfo: TGridDrawInfo;
begin
  CalcDrawInfo(DrawInfo);
  tempRect.Top := 0;
  tempRect.Left := 0;
  tempRect.Bottom := ClientHeight;
  tempRect.Right := InWeekDayNameColWidth;
  InvalidateRect(self.Handle, @tempRect, true);
end;

procedure TWeekFacLessonSheduleGrid.MouseMove(Shift: TShiftState; X,
  Y: Integer);
var
  prevCol, prevRow: integer;
begin
  prevCol:= curCol;
  prevRow:= curRow;
  inherited MouseMove(Shift, X, Y);
  MouseToCell(X, Y, curCol, curRow);
  if (curCol = 0) and (prevCol = 0) and ((curRow-1) div PartCount = (prevRow-1) div PartCount) then exit;
  if (curCol = 0) or (prevCol = 0) then
  begin
    if (curCol = 0) then
    begin
      if not fIsDayAllow[(curRow-1) div PartCount] then
        Cursor:= crDefault
      else Cursor:= crHandPoint;
    end;
    InvalidateDayName;
  end
  else Cursor:= crDefault;
end;

procedure TWeekFacLessonSheduleGrid.ReadShedule;
var
  i, j: integer;
begin
  inherited ReadShedule;
  SetLength(fVisibleEvents, fGroups.Count);
  for I := 0 to fGroups.Count - 1 do
  begin
    SetLength(fVisibleEvents[i], fParts.Count*6);
    for j:= 0 to fParts.Count*6 - 1 do
      fVisibleEvents[i][j]:= TLessonVisibleEventList.Create;
  end;
  RowCount:= fParts.Count*6 + 1;
  ColCount:= fGroups.Count + 2;
  if ColCount > 2 then FixedCols:= 2
  else FixedCols:= 0;
  if RowCount > 1 then FixedRows:= 1
  else FixedRows:= 0;
  if Parent <> nil then
  begin
    DefaultColWidth:= WeekColumnWidth;
    DefaultRowHeight:= OneEventInFacWeekColumnHeight + 4;
    ColWidths[0]:= InWeekDayNameColWidth;
    ColWidths[1]:= DayPartColumnWidth;
    RowHeights[0]:= TeacherRowHeight;
  end;
  fIsLoad:= true;
end;

procedure TWeekFacLessonSheduleGrid.SetVisibleEvents(ACol, ARow: integer;
  const Value: TLessonVisibleEventList);
begin
  if (ACol > 1) and (ARow > 0) then
    fVisibleEvents[ACol-2, ARow-1]:= Value;
end;

procedure TWeekFacLessonSheduleGrid.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  if (Message.CharCode = VK_UP) or (Message.CharCode = VK_DOWN) or (Message.CharCode = VK_NEXT) or (Message.CharCode = VK_PRIOR) then
  begin
    InvalidateCol(0);
    InvalidateDayName;
  end;
end;

procedure TWeekFacLessonSheduleGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  curColAlt, curRowAlt, i: integer;
begin
  if (curCol = 0) then
  begin
    if fIsDayAllow[(curRow-1) div PartCount] then
      if Assigned(fOnDayNameClick) then
        fOnDayNameClick(self);
  end
  else
  begin
    if (Col > 1) and (Row > 0) then
    begin
      fVisibleEvents[Col-2][Row-1].SelectedItemIndex:= -1;
      InvalidateCell(Col, Row);
    end;
    MouseToCell(Message.XPos, Message.YPos, curColAlt, curRowAlt);
    curColAlt:= curColAlt-2;
    curRowAlt:= curRowAlt-1;
    if (curColAlt >= 0) and (curRowAlt >= 0) then
    begin
      if Length(fVisibleEvents) > curColAlt then
        if Length(fVisibleEvents[curColAlt]) > curRow then
          if fVisibleEvents[curColAlt][curRowAlt].Count > 0 then
          begin
            if fVisibleEvents[curColAlt][curRowAlt].Count = 1 then
              fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= 0
            else
            begin
              fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= -1;
              for I := 0 to fVisibleEvents[curColAlt][curRowAlt].Count - 1 do
                if (Message.YPos >= CellRect(curColAlt+2, curRowAlt+1).Top + 2 + (OneEventInFacWeekColumnHeight + 2)*i) and
                  (Message.YPos <= CellRect(curColAlt+2, curRowAlt+1).Top + OneEventInFacWeekColumnHeight + 2 + (OneEventInFacWeekColumnHeight + 2)*i) then
                begin
                  fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= i;
                  break;
                end;
            end;
            InvalidateCell(curColAlt+2, curRowAlt+1);
          end
          else fVisibleEvents[curColAlt][curRowAlt].SelectedItemIndex:= -1;
    end;
    inherited;
  end;
end;

procedure TWeekFacLessonSheduleGrid.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  InvalidateDayName;
end;

procedure TWeekFacLessonSheduleGrid.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  InvalidateDayName;
end;

{ TFacLessonSheduleGroup }

{
function TFacLessonSheduleGroup.AddEvent(AEvent: TSheduleEvent): TSheduleEvent;
begin
  Result:= fRecordInEventStorage.AddEvent(AEvent);
end;   }

constructor TFacLessonSheduleGroup.Create(ASheduleIK, AGroupIK: integer; AName: string);
begin
  inherited Create(AGroupIK, AName);
  fRecordInEventStorage:= TSheduleRegistry.Functions.GetGroupEvents(ASheduleIK, AGroupIK, false);
end;

function TFacLessonSheduleGroup.DeleteAllItems: boolean;
begin
  Result:= fRecordInEventStorage.DeleteAllWithoutDeleteFromDB;
end;

{
function TFacLessonSheduleGroup.DeleteEvent(index: integer; IsDeleteFromDB: boolean): boolean;
begin
  Result:= fRecordInEventStorage.DeleteEventByIndex(index, IsDeleteFromDB);
end;
}

function TFacLessonSheduleGroup.GetEvent(index: integer): TSheduleEvent;
begin
  Result:= fRecordInEventStorage.Events[index];
end;

function TFacLessonSheduleGroup.GetEventCount: integer;
begin
  Result:= fRecordInEventStorage.GetEventCount;
end;

procedure TFacLessonSheduleGroup.SetEvent(index: integer;
  const Value: TSheduleEvent);
begin
  fRecordInEventStorage.Events[index]:= Value;
end;

{ TMonthFacLessonSheduleGrid }

(*
constructor TMonthFacLessonSheduleGrid.Create(AKafIK, ASheduleIK: integer;
  AParrent: TWinControl);
begin
  inherited;

end;

procedure TMonthFacLessonSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  inherited;

end;

function TMonthFacLessonSheduleGrid.GetCurrentHighlightDay: integer;
begin
  Result:= -1;
end;

function TMonthFacLessonSheduleGrid.GetDayIndex: integer;
begin
  Result:= -1;
end;

function TMonthFacLessonSheduleGrid.GetEvents(ACol, ARow,
  APart: integer): TSheduleEvent;
begin
  Result:= nil;
end;

function TMonthFacLessonSheduleGrid.GetOnDayNameClick: TNotifyEvent;
begin
//  Result:= fVerticalCaption.OnClick;
end;

function TMonthFacLessonSheduleGrid.GetPartIndex: integer;
begin
  Result:= -1;
end;

function TMonthFacLessonSheduleGrid.GetSelectedEvent: TSheduleEvent;
begin
  Result:= nil;
end;

function TMonthFacLessonSheduleGrid.GoToDate(Date: TDate): string;
begin

end;

function TMonthFacLessonSheduleGrid.GoToNextPeriod: string;
begin

end;

function TMonthFacLessonSheduleGrid.GoToPrevPeriod: string;
begin

end;

procedure TMonthFacLessonSheduleGrid.ReadShedule;
begin
  inherited;

end;

procedure TMonthFacLessonSheduleGrid.SetEvents(ACol, ARow, APart: integer;
  const Value: TSheduleEvent);
begin

end;

procedure TMonthFacLessonSheduleGrid.SetOnDayNameClick(
  const Value: TNotifyEvent);
begin
  //fVerticalCaption.OnClick:= Value;
end;

*)

{ TFacExamSheduleGrid }

{
procedure TFacExamSheduleGrid.AddExam(AExam: TSheduleExamination);
var
  i, rowNumber: integer;
begin
  for i := 0 to fGroups.Count - 1 do
    if AExam.GroupIKList.IndexOf(IntToStr(Groups[i].GroupIK)) >= 0 then
    begin
      Groups[i].AddExam(AExam);
      UpdateVisibleEvents;
      exit;
      {
      rowNumber:= DaysBetween(AExam.ExamDate, fDefaultSemLengthInfo.SessionStart);
      fVisibleEvents[i][rowNumber].Add(Groups[i].AddExam(AExam));
      if RowHeights[rowNumber+1] < fVisibleEvents[i][rowNumber].Count*(OneExamInRowHeight + 2) + 2 then
      begin
        RowHeights[rowNumber+1]:= fVisibleEvents[i][rowNumber].Count*(OneExamInRowHeight + 2) + 2;
      //  fVerticalCaption.RowHeights[rowNumber]:= RowHeights[rowNumber];
      end;   }
//    end;
//end;

constructor TFacExamSheduleGrid.Create(AFacultyIK, ASheduleIK: integer;
  AParrent: TWinControl);
begin
  inherited Create(ASheduleIK, AParrent);
  fFacultyIK:= AFacultyIK;
  fGroups:= TObjectList.Create;
end;

function TFacExamSheduleGrid.DeleteAllItems: boolean;
var
  i, j: integer;
begin
  for I := 0 to fGroups.Count - 1 do
  begin
    for j := 0 to RowCount-1 do
      fVisibleEvents[i, j].Clear;
    Groups[i].DeleteAllItems;
  end;
  Result:= TSheduleController.MainFunctions.DeleteFacExamShedule(fSheduleIK, fFacultyIK);
end;

{
function TFacExamSheduleGrid.DeleteExam(AExamIK: integer): boolean;
var
  i, j: integer;
begin
  for i:= 0 to fGroups.Count-1 do
    for j:= 0 to Groups[i].ExamCount-1 do
      if Groups[i].Exams[j].ExamIK = AExamIK then
        if Groups[i].DeleteExam(j, true) then
        begin
          UpdateVisibleEvents;
          Result:= true;
          exit;
        end;
end;     }

destructor TFacExamSheduleGrid.Destroy;
begin
  fGroups.Clear;
  fGroups.Free;
  inherited;
end;

function TFacExamSheduleGrid.GenerateShedule: boolean;
begin
  Result:= false;

end;

function TFacExamSheduleGrid.GetGroup(index: integer): TFacExamSheduleGroup;
begin
  Result:= fGroups[index] as TFacExamSheduleGroup;
end;

function TFacExamSheduleGrid.GroupCount: integer;
begin
  Result:= fGroups.Count;
end;

procedure TFacExamSheduleGrid.ReadShedule;
var
  i, j, k: integer;
  tempDS: TADODataSet;
begin
  inherited ReadShedule;
  fGroups.Clear;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM GetGroupsForFaculty(' + IntToStr(fFacultyIK) + ', ' + IntToStr(DefaultSemLengthInfo.YearIK) + ', ' + IntToStr(DefaultSemLengthInfo.SemIK) + ')';
  tempDS.Open;
  while (not tempDS.Eof) do
  begin
    fGroups.Add(TFacExamSheduleGroup.Create(fSheduleIK, tempDS.FieldByName('ik_grup').AsInteger, tempDS.FieldByName('cName_grup').AsString));
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
  ColCount:= fGroups.Count + 1;
  if ColCount > 1 then FixedCols:= 1
  else FixedCols:= 0;
  SetLength(fVisibleEvents, ColCount);
  for I := 1 to ColCount - 1 do
  begin
    SetLength(fVisibleEvents[i-1], RowCount);
    for j := 1 to RowCount - 1 do
      fVisibleEvents[i-1][j-1]:= TExamVisibleEventList.Create;
  end;
  UpdateVisibleEvents;
  fIsLoad:= true;
end;

procedure TFacExamSheduleGrid.SetGroup(index: integer;
  const Value: TFacExamSheduleGroup);
begin
  fGroups[index]:= Value;
end;

procedure TFacExamSheduleGrid.UpdateVisibleEvents;
var
  i, j, k: integer;
begin
  for I := 1 to ColCount - 1 do
    for j := 1 to RowCount - 1 do
    begin
      fVisibleEvents[i-1][j-1].SelectedItemIndex:= -1;
      fVisibleEvents[i-1][j-1].Clear;
      for k := 0 to Groups[i-1].GetExamCount - 1 do
        if Groups[i-1].Exams[k].ExamDate = fDefaultSemLengthInfo.SessionStart + j - 1 then
          fVisibleEvents[i-1][j-1].Add(Groups[i-1].Exams[k]);
      if fVisibleEvents[i-1][j-1].Count > 1 then
      begin
        if RowHeights[j] < fVisibleEvents[i-1][j-1].Count*(OneExamInRowHeight + 2) + 2 then
          RowHeights[j]:= fVisibleEvents[i-1][j-1].Count*(OneExamInRowHeight + 2) + 2;
      end
      else RowHeights[j]:= OneExamInRowHeight + 4;
    end;
end;

{ TDepExamSheduleGrid }

{
procedure TDepExamSheduleGrid.AddExam(AExam: TSheduleExamination);
var
  i, rowNumber: integer;
begin
  for i := 0 to fTeachers.Count - 1 do
    if Teachers[i].TabN = AExam.TabN then
    begin
      rowNumber:= DaysBetween(AExam.ExamDate, fDefaultSemLengthInfo.SessionStart);
      fVisibleEvents[i][rowNumber].Add(Teachers[i].AddExam(AExam));
      if RowHeights[rowNumber+1] < fVisibleEvents[i][rowNumber].Count*(OneExamInRowHeight + 2) + 2 then
      begin
        RowHeights[rowNumber+1]:= fVisibleEvents[i][rowNumber].Count*(OneExamInRowHeight + 2) + 2;
        //fVerticalCaption.RowHeights[rowNumber]:= RowHeights[rowNumber];
      end;
      exit;
    end;
end; }

constructor TDepExamSheduleGrid.Create(AKafIK, ASheduleIK: integer;
  AParrent: TWinControl);
begin
  inherited Create(ASheduleIK, AParrent);
  fKafedraIK:= AKafIK;
  fTeachers:= TObjectList.Create;
end;

function TDepExamSheduleGrid.DeleteAllItems: boolean;
var
  i, j: integer;
begin
  for I := 0 to fTeachers.Count - 1 do
  begin
    for j := 0 to RowCount-1 do
      fVisibleEvents[i, j].Clear;
    Teachers[i].DeleteAllItems;
  end;
  Result:= TSheduleController.MainFunctions.DeleteDepExamShedule(fSheduleIK, fKafedraIK);
end;

{
function TDepExamSheduleGrid.DeleteExam(AExamIK: integer): boolean;
var
  i, j, rowNumber: integer;
begin
  for i:= 0 to fTeachers.Count-1 do
    for j:= 0 to Teachers[i].ExamCount-1 do
      if Teachers[i].Exams[j].ExamIK = AExamIK then
        if Teachers[i].DeleteExam(j, true) then
        begin
          UpdateVisibleEvents;
          Result:= true;
          exit;
        end;
end;          }

destructor TDepExamSheduleGrid.Destroy;
begin
  fTeachers.Clear;
  fTeachers.Free;
  inherited;
end;

function TDepExamSheduleGrid.GenerateShedule: boolean;
begin
  Result:= false;
end;

function TDepExamSheduleGrid.GetTeacher(index: integer): TDepExamSheduleTeacher;
begin
  Result:= fTeachers[index] as TDepExamSheduleTeacher;
end;

procedure TDepExamSheduleGrid.ReadShedule;
var
  tempDS: TADODataSet;
  i, j, k: integer;
begin
  inherited ReadShedule;
  fTeachers.Clear;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'Select * From GetTeacherListForDepartment(1, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(DefaultSemLengthInfo.YearIK) + ', ' + IntToStr(DefaultSemLengthInfo.SemIK) + ')';
  tempDS.Open;
  while (not tempDS.Eof) do
  begin
    fTeachers.Add(TDepExamSheduleTeacher.Create(fSheduleIK, tempDS.FieldByName('iTab_n').AsInteger, tempDS.FieldByName('cfirstname').AsString, tempDS.FieldByName('clastname').AsString, tempDS.FieldByName('cotch').AsString));
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
  ColCount:= fTeachers.Count + 1;
  if ColCount > 1 then FixedCols:= 1
  else FixedCols:= 0;

  SetLength(fVisibleEvents, ColCount);
  for I := 1 to ColCount - 1 do
  begin
    SetLength(fVisibleEvents[i-1], RowCount);
    for j := 1 to RowCount - 1 do
      fVisibleEvents[i-1][j-1]:= TExamVisibleEventList.Create;
  end;
  UpdateVisibleEvents;
  fIsLoad:= true;
end;



procedure TDepExamSheduleGrid.SetTeacher(index: integer;
  const Value: TDepExamSheduleTeacher);
begin
  fTeachers[index]:= Value;
end;

procedure TDepExamSheduleGrid.UpdateVisibleEvents;
var
  i, j, k: integer;
begin
  for I := 1 to ColCount - 1 do
    for j := 1 to RowCount - 1 do
    begin
      fVisibleEvents[i-1][j-1].SelectedItemIndex:= -1;
      fVisibleEvents[i-1][j-1].Clear;
      for k := 0 to Teachers[i-1].GetExamCount - 1 do
        if Teachers[i-1].Exams[k].ExamDate = fDefaultSemLengthInfo.SessionStart + j-1 then
          fVisibleEvents[i-1][j-1].Add(Teachers[i-1].Exams[k]);
      if fVisibleEvents[i-1][j-1].Count > 1 then
      begin
        if RowHeights[j-1] < fVisibleEvents[i-1][j-1].Count*(OneExamInRowHeight + 2) + 2 then
          RowHeights[j-1]:= fVisibleEvents[i-1][j-1].Count*(OneExamInRowHeight + 2) + 2;
      end
      else RowHeights[j]:= OneExamInRowHeight + 4;
    end;
end;

{ TDepExamSheduleTeahcer }

{
function TDepExamSheduleTeahcer.AddExam(Value: TSheduleExamination): TSheduleExamination;
begin
  Result:= fRecordInExamList.AddExam(Value);
end;
 }

constructor TDepExamSheduleTeacher.Create(ASheduleIK, ATabN: integer; AFirstName, ALastName,
  ACotch: string);
begin
  inherited Create(ATabN, AFirstName, ALastName, ACotch);
  fRecordInExamList:= TSheduleRegistry.Functions.GetTeacherExams(ASheduleIK, ATabN, false);
end;

function TDepExamSheduleTeacher.DeleteAllItems: boolean;
begin
  Result:= fRecordInExamList.DeleteAllWithoutDeleteFromDB;
end;

{
function TDepExamSheduleTeahcer.DeleteExam(index: integer; IsDeleteFromDB: boolean): boolean;
begin
  Result:= fRecordInExamList.DeleteExamByIndex(index, IsDeleteFromDB);
end;
 }

function TDepExamSheduleTeacher.GetExam(index: integer): TSheduleExamination;
begin
  Result:= fRecordInExamList.Exams[index];
end;

function TDepExamSheduleTeacher.GetExamCount: integer;
begin
  Result:= fRecordInExamList.GetExamCount;
end;

procedure TDepExamSheduleTeacher.SetExam(index: integer;
  const Value: TSheduleExamination);
begin
  fRecordInExamList.Exams[index]:= Value;
end;

{ TFacExamSheduleGroup }

{
function TFacExamSheduleGroup.AddExam(Value: TSheduleExamination): TSheduleExamination;
begin
  Result:= fRecordInExamList.AddExam(Value);
end;     }

constructor TFacExamSheduleGroup.Create(ASheduleIK, AGroupIK: integer; AName: string);
begin
  inherited Create(AGroupIK, AName);
  fRecordInExamList:= TSheduleRegistry.Functions.GetGroupExams(ASheduleIK, AGroupIK, false);
end;

function TFacExamSheduleGroup.DeleteAllItems: boolean;
begin
  Result:= fRecordInExamList.DeleteAllWithoutDeleteFromDB;
end;

{
function TFacExamSheduleGroup.DeleteExam(index: integer; IsDeleteFromDB: boolean): boolean;
begin
  Result:= fRecordInExamList.DeleteExamByIndex(index, IsDeleteFromDB);
end;       }

function TFacExamSheduleGroup.GetExam(index: integer): TSheduleExamination;
begin
  Result:= fRecordInExamList.Exams[index];
end;

function TFacExamSheduleGroup.GetExamCount: integer;
begin
  Result:= fRecordInExamList.GetExamCount;
end;

procedure TFacExamSheduleGroup.SetExam(index: integer;
  const Value: TSheduleExamination);
begin
  fRecordInExamList.Exams[index]:= Value;
end;

{ TCustomExamSheduleGrid }

function TCustomExamSheduleGrid.AddExam(AExam: TSheduleExamination): TSheduleExamination;
begin
  Result:= TSheduleRegistry.ExamStorage.AddExam(AExam);
  if Result <> nil then UpdateVisibleEvents;
end;

constructor TCustomExamSheduleGrid.Create(ASheduleIK: integer; AParrent: TWinControl);
begin
  inherited Create(ASheduleIK, AParrent);
end;

function TCustomExamSheduleGrid.DeleteExam(AExamIK: integer): boolean;
begin
  Result:= TSheduleRegistry.ExamStorage.DeleteExam(AExamIK, true);
  if Result then UpdateVisibleEvents;
end;

destructor TCustomExamSheduleGrid.Destroy;
var
  i, j: integer;
begin
  for i := 0 to Length(fVisibleEvents) - 1 do
    for j := 0 to Length(fVisibleEvents[i]) - 1 do
      fVisibleEvents[i][j].Free;
  inherited;
end;

procedure TCustomExamSheduleGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  i: integer;
  delta: Extended;
  curRect: TRect;
  tempStr: string;
begin
  if (ARow = 0) and (ACol = 0) then exit;

  delta := DefaultSemLengthInfo.SessionStart ;
  delta:= delta - DefaultSemLengthInfo.MinSessionStart;

  if (ARow > 0) then
    if not IsDayAllow[ARow-1+Round(delta)] then
    begin
      Canvas.Brush.Color:= clSilver;
      Canvas.FillRect(ARect);
      exit;
    end;

  if (ACol = 0) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    tempStr:= FormatDateTime('dd.mm.yy', DefaultSemLengthInfo.SessionStart + ARow-1);
    Canvas.TextOut(ARect.Left + round((ColWidths[0] - Canvas.TextWidth(tempStr))/2), ARect.Top + round((RowHeights[ARow] - Canvas.TextHeight(tempStr))/2), tempStr);
    exit;
  end;

  if (ARow = 0) then
  begin
    Canvas.Rectangle(ARect.Left-1, ARect.Top-1, ARect.Right+1, ARect.Bottom+1);
    if Self is TDepExamSheduleGrid then
      Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(TDepExamSheduleGrid(self).Teachers[ACol-1].FIO))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TDepExamSheduleGrid(self).Teachers[ACol-1].FIO))/2), TDepExamSheduleGrid(self).Teachers[ACol-1].FIO)
    else
      Canvas.TextOut(ARect.Left + round(((ARect.Right - ARect.Left) - Canvas.TextWidth(TFacExamSheduleGrid(self).Groups[ACol-1].GroupName))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TFacExamSheduleGrid(self).Groups[ACol-1].GroupName))/2), TFacExamSheduleGrid(self).Groups[ACol-1].GroupName);
    exit;
  end;

  if fIsLoad then
  begin
    {if AState <> [gdFixed] then
    begin
        Canvas.Font.Color := clWindowText;
        Canvas.Brush.Color := clWindow;
        Canvas.FillRect(ARect);
    end; }
    if fVisibleEvents[ACol-1, ARow-1].Count > 0 then
      for I := 0 to fVisibleEvents[ACol-1, ARow-1].Count - 1 do
      begin
        curRect.Left:= ARect.Left + 2;
        curRect.Top:= ARect.Top + 2 + (OneExamInRowHeight + 2)*i;
        curRect.Right:= ARect.Left + ColWidths[ACol] - 2;
        curRect.Bottom:= ARect.Top + OneExamInRowHeight + 2 + (OneExamInRowHeight + 2)*i;
        if (fVisibleEvents[ACol-1, ARow-1].SelectedItemIndex = i) and (Col = ACol) and (Row = ARow) then
          Canvas.Pen.Color:= clMaroon
        else  Canvas.Pen.Color:= clSilver;
        Canvas.RoundRect(curRect.Left, curRect.Top, curRect.Right, curRect.Bottom, 5, 5);

        Canvas.Font.Color:= clWindowText;
        tempStr:= fVisibleEvents[ACol-1, ARow-1].Items[i].DiscName;
        if Canvas.TextWidth(tempStr) + 14 > ColWidths[ACol] then
        begin
          tempStr:= tempStr + '...';
          while Canvas.TextWidth(tempStr) + 14 > ColWidths[ACol] do
          begin
            tempStr:= Copy(tempStr, 0, length(tempStr)-4);
            tempStr:= tempStr + '...';
          end;
        end;
        Canvas.TextOut(curRect.Left + round((curRect.Right - curRect.Left - Canvas.TextWidth(tempStr))/2), curRect.Top + 3, tempStr);

        if Self is TDepExamSheduleGrid then
          tempStr:= fVisibleEvents[ACol-1, ARow-1].Items[i].CalcUnitName + ', ' +  fVisibleEvents[ACol-1, ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-1, ARow-1].Items[i].VidNagruzkiName
        else
          tempStr:= fVisibleEvents[ACol-1, ARow-1].Items[i].TeacherWithWTName + ', ' +  fVisibleEvents[ACol-1, ARow-1].Items[i].FullRoomName + ', ' + fVisibleEvents[ACol-1, ARow-1].Items[i].VidNagruzkiName;
        if Canvas.TextWidth(tempStr) + 14 > ColWidths[ACol] then
          ColWidths[ACol]:= Canvas.TextWidth(tempStr) + 14;
        Canvas.TextOut(curRect.Left + round((curRect.Right - curRect.Left - Canvas.TextWidth(tempStr))/2), curRect.Top + 6 + Canvas.TextHeight(tempStr), tempStr);

        Canvas.Font.Color:= clSilver;
        tempStr:= FormatDateTime('hh:nn', fVisibleEvents[ACol-1, ARow-1].Items[i].Start) + ' - ' + FormatDateTime('hh:nn', fVisibleEvents[ACol-1, ARow-1].Items[i].Stop);
        Canvas.TextOut(curRect.Left + 2, curRect.Bottom - Canvas.TextHeight(tempStr) - 2, tempStr);
        if Self is TDepExamSheduleGrid then
        begin
          tempStr:= fVisibleEvents[ACol-1, ARow-1].Items[i].WorkTypeName;
          Canvas.Font.Color:= clSilver;
          Canvas.TextOut(curRect.Right - Canvas.TextWidth(tempStr) - 4, curRect.Bottom - Canvas.TextHeight(tempStr) - 2, tempStr);
        end;
      end;
  end;
end;

function TCustomExamSheduleGrid.GetDayIndex: integer;
begin
  if Row > 0 then
  begin
    if not fIsDayAllow[Row-1] then
      Result:= -1
    else Result:= Row-1;
  end
  else Result:= -1;
end;

function TCustomExamSheduleGrid.GetSelectedExam: TSheduleExamination;
begin
  if (Col > 0) and (Row > 0) then
  begin
    if fVisibleEvents[Col-1, Row-1].SelectedItemIndex >= 0 then
      Result:= fVisibleEvents[Col-1, Row-1].Items[fVisibleEvents[Col-1, Row-1].SelectedItemIndex]
    else Result:= nil;
  end
  else Result:= nil;
end;

function TCustomExamSheduleGrid.getVisibleEventList(ACol,
  ARow: integer): TExamVisibleEventList;
begin
  Result:= fVisibleEvents[ACol-1, ARow-1];
end;

procedure TCustomExamSheduleGrid.ReadShedule;
var
  i: integer;
begin
  inherited ReadShedule;
  // !Здесь необходимо учитывать исключения сессии!

  if round(fDefaultSemLengthInfo.MaxSessionStop) - round(fDefaultSemLengthInfo.MinSessionStart) + 1 >= 0 then
    SetLength(fIsDayAllow, round(fDefaultSemLengthInfo.MaxSessionStop) - round(fDefaultSemLengthInfo.MinSessionStart) + 1);
  RowCount:= Length(fIsDayAllow) + 1;
  if RowCount > 1 then FixedRows:= 1
  else FixedRows:= 0;
  if Assigned(Parent) then
  begin
    OneExamInRowHeight:= Canvas.TextHeight('И')*3 + 9;
    DefaultRowHeight:= OneExamInRowHeight + 4;
    DefaultColWidth:= DayColumnWidth;
    ColWidths[0]:= ExamDateColumnWidth;
    RowHeights[0]:= TeacherRowHeight;
  end;
  for I := 0 to Length(fIsDayAllow) - 1 do
  begin
    fIsDayAllow[i]:= fDefaultSemLengthInfo.IsSessionDateAllow(fDefaultSemLengthInfo.MinSessionStart + i);
    if Assigned(Parent) and (not fIsDayAllow[i]) then
      RowHeights[i+1]:= 20;
  end;
end;

procedure TCustomExamSheduleGrid.setVisibleEventList(ACol, ARow: integer;
  const Value: TExamVisibleEventList);
begin
  if (ARow > 0) and (ACol > 0) then
    fVisibleEvents[ACol-1, ARow-1]:= Value;
end;

procedure TCustomExamSheduleGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  curCol, curRow, i: integer;
begin
  if (Col > 0) and (Row > 0) then
  begin
    fVisibleEvents[Col-1][Row-1].SelectedItemIndex:= -1;
    InvalidateCell(Col, Row);
  end;
  MouseToCell(Message.XPos, Message.YPos, curCol, curRow);
  if (curCol > 0) and (curRow > 0) then
  begin
    if Length(fVisibleEvents) > curCol-1 then
      if Length(fVisibleEvents[curCol-1]) > curRow-1 then
        if fVisibleEvents[curCol-1][curRow-1].Count > 0 then
        begin
          if fVisibleEvents[curCol-1][curRow-1].Count = 1 then
            fVisibleEvents[curCol-1][curRow-1].SelectedItemIndex:= 0
          else
          begin
            fVisibleEvents[curCol-1][curRow-1].SelectedItemIndex:= -1;
            for I := 0 to fVisibleEvents[curCol-1][curRow-1].Count - 1 do
              if (Message.YPos >= CellRect(curCol, curRow).Top + 2 + (OneExamInRowHeight + 2)*i) and
                (Message.YPos <= CellRect(curCol, curRow).Top + OneExamInRowHeight + 2 + (OneExamInRowHeight + 2)*i) then
              begin
                fVisibleEvents[curCol-1][curRow-1].SelectedItemIndex:= i;
                break;
              end;
          end;
          InvalidateCell(curCol, curRow);
        end
        else fVisibleEvents[curCol-1][curRow-1].SelectedItemIndex:= -1;
  end;
  if fIsDayAllow[curRow-1] then
    inherited;
end;


{ TRoomConstraintDiscItem }

constructor TRoomConstraintDiscItem.Create(AIK: integer;
  AItemType: TRoomConstraintItemType);
begin
  inherited;
  fIsNodeLoad:= false;
end;

{ TConstraintTreeViewItem }

constructor TRoomConstraintItem.Create(AIK: integer; AItemType: TRoomConstraintItemType);
begin
  fIK:= AIK;
  fItemType:= AItemType;
end;

{ TTeacherSemesterConstraintItem }

constructor TTeacherSemesterConstraintItem.Create(APartNumber, ADayNumber: integer;
  AIsDenumerator, AIsSetup: boolean; AOwner: TWinControl);
begin
  fPartNumber:= APartNumber;
  fDayNumber:= ADayNumber;
  fIsDenumerator:= AIsDenumerator;
  fCheckBox:= TCheckBox.Create(AOwner);
  fCheckBox.Visible:= false;
  fCheckBox.Parent:= AOwner;
  fCheckBox.Color:= clWindow;
  fCheckBox.Caption:= '';
  fCheckBox.Width:= 13;
  fCheckBox.Height:= 15;
  fCheckBox.Checked:= AIsSetup;
end;

destructor TTeacherSemesterConstraintItem.Destroy;
begin
  if Assigned(fCheckBox) then
    fCheckBox.Free;
  inherited;
end;

{ TTeacherSemesterConstraintsGrid }

procedure TTeacherSemesterConstraintsGrid.AddItem(Value: TTeacherSemesterConstraintItem);
begin
  fTeacherConstraints.Add(Value);
  Value.CheckBox.OnClick:= FOnCheckBoxChange;
end;

procedure TTeacherSemesterConstraintsGrid.ClearItems;
begin
  fTeacherConstraints.Clear;
  RowCount:= 1;
  ColCount:= 1;
end;

constructor TTeacherSemesterConstraintsGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Parent:= TWinControl(AOwner);
  BorderStyle:= bsNone;
  Align:= alClient;
  ColCount:= 1;
  RowCount:= 1;
  FixedCols:= 0;
  FixedRows:= 0;
  DefaultColWidth:= Canvas.TextWidth('20:00 - 22:20') + 10;
  DefaultRowHeight:= 22;
  RowHeights[0]:= 22;
  ColWidths[0]:= Canvas.TextWidth('Понедельник, знам.') + 15;
  fIsLoad:= false;
  fTeacherConstraints:= TObjectList.Create;
  Options:= Options - [goRangeSelect];
end;

destructor TTeacherSemesterConstraintsGrid.Destroy;
begin
  fTeacherConstraints.Clear;
  fTeacherConstraints.Free;
  inherited;
end;

procedure TTeacherSemesterConstraintsGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  i: integer;
  DrawInfo: TGridDrawInfo;
begin
  inherited;
  Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);
  if ARow = 1 then
    Canvas.Font.Color:= clGray;
  if (ACol = 0) or (ARow < 2) then
    Canvas.TextRect(ARect, ARect.Left + round((ARect.Right - ARect.Left - Canvas.TextWidth(Cells[Acol, ARow]))/2 ), ARect.Top + 4, Cells[Acol, ARow]);
  if (ACol > 0) and (ARow > 1) then
    if fIsLoad then
    begin
      CalcDrawInfo(DrawInfo);
      if (ACol >= DrawInfo.Horz.FirstGridCell) and (ACol <= DrawInfo.Horz.LastFullVisibleCell) and
              (ARow >= DrawInfo.Vert.FirstGridCell) and (ARow <= DrawInfo.Vert.LastFullVisibleCell) then
      begin
        TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Left:= Left + ARect.Left + round((ARect.Right - ARect.Left - TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Width)/2);
        TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Top:= Top + ARect.Top + round((DefaultRowHeight - TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Height)/2);
        if DrawInfo.Horz.FirstGridCell > 0 then
          for i:= 1 to DrawInfo.Horz.FirstGridCell-1 do
            TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[i, ARow]).CheckBox.Visible:= false;
        if DrawInfo.Horz.LastFullVisibleCell < ColCount-1 then
          for I := DrawInfo.Horz.LastFullVisibleCell + 1 to ColCount-1 do
            TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[i, ARow]).CheckBox.Visible:= false;
        if DrawInfo.Vert.FirstGridCell > 0 then
          for i:= 2 to DrawInfo.Vert.FirstGridCell-1 do
            TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, i]).CheckBox.Visible:= false;
        if DrawInfo.Vert.LastFullVisibleCell < RowCount-1 then
          for I := DrawInfo.Vert.LastFullVisibleCell + 1 to RowCount-1 do
            TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, i]).CheckBox.Visible:= false;
        TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Visible:= true;
      end
      else TTeacherSemesterConstraintItem(TeacherConstraintsForGrid[ACol, ARow]).CheckBox.Visible:= false;
    end;
{    Canvas.Pen.Color:= clBlack;
    Canvas.MoveTo(ARect.Left, ARect.Bottom);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Right, ARect.Top-1);
    Canvas.LineTo(ARect.Left-1, ARect.Top-1);
    Canvas.LineTo(ARect.Left-1, ARect.Bottom);     }

end;

function TTeacherSemesterConstraintsGrid.getItemsCount: integer;
begin
  Result:= fTeacherConstraints.Count;
end;

function TTeacherSemesterConstraintsGrid.GetTeacherConstraint(
  Index: Integer): TTeacherSemesterConstraintItem;
begin
  Result:= fTeacherConstraints[index] as TTeacherSemesterConstraintItem;
end;

function TTeacherSemesterConstraintsGrid.GetTeacherConstraintForGrid(ACol,
  ARow: Integer): TTeacherSemesterConstraintItem;
var
  i: integer;
begin
  Result:= nil;
  i:= (ARow-2)*(ColCount-1) + ACol-1;
  if (i >= 0) and (i < fTeacherConstraints.Count) then
    Result:= TTeacherSemesterConstraintItem(fTeacherConstraints[i]);
 { for I := 0 to fTeacherConstraints.Count - 1 do
  begin
    isNeed:= false;
    if TTeacherSemesterConstraintItem(fTeacherConstraints[i]).IsDenumerator then
      isNeed:= (TTeacherSemesterConstraintItem(fTeacherConstraints[i]).PartNumber = ACol) and (TTeacherSemesterConstraintItem(fTeacherConstraints[i]).DayNumber+5 = ARow - 2)
    else
      isNeed:= (TTeacherSemesterConstraintItem(fTeacherConstraints[i]).PartNumber = ACol) and (TTeacherSemesterConstraintItem(fTeacherConstraints[i]).DayNumber-1 = ARow - 2);
    if isNeed then
    begin
      Result:= TTeacherSemesterConstraintItem(fTeacherConstraints[i]);
      break;
    end;
  end;              }
  if Result = nil then
    raise EApplicationException.Create('Запись соответсвующая данной ячейке не найдена');
end;

procedure TTeacherSemesterConstraintsGrid.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Col > 0) and (Row > 1) and (Key = VK_SPACE) then
    TeacherConstraintsForGrid[Col, Row].CheckBox.Checked:= not TeacherConstraintsForGrid[Col, Row].CheckBox.Checked;
end;

procedure TTeacherSemesterConstraintsGrid.Paint;
begin
  inherited;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width-1, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
  //Canvas.LineTo(Width-1, Height-1);
  //Canvas.LineTo(Width-1, 0);
end;

procedure TTeacherSemesterConstraintsGrid.SetTeacherConstraint(Index: Integer;
  const Value: TTeacherSemesterConstraintItem);
begin
  fTeacherConstraints[index]:= Value;
end;

procedure TTeacherSemesterConstraintsGrid.SetTeacherConstraintForGrid(ACol,
  ARow: Integer; const Value: TTeacherSemesterConstraintItem);
var
  i: integer;
begin
  i:= (ARow-2)*(ColCount-1) + ACol-1;
  if (i >= 0) and (i < fTeacherConstraints.Count) then
    fTeacherConstraints[i]:= Value;
end;

procedure TTeacherSemesterConstraintsGrid.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  Invalidate;
end;

procedure TTeacherSemesterConstraintsGrid.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  Invalidate;
end;

procedure TTeacherSemesterConstraintsGrid.WMSize(var Msg: TWMSize);
begin
  inherited;
  Invalidate;
end;

procedure TTeacherSemesterConstraintsGrid.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  Invalidate;
end;

{ TConflictItem

constructor TEventConflictItem.Create(APartNumber: integer; AConflictDate: TDate;
  AStartTime, AStopTime: TTime; ATeacherIK, ACalcUnitIK, AAudIK: integer;
  AVidZanyatName, ACalcUnitName, ADiscName, AAudName, ATeacherName: string);
begin
  inherited Create(AConflictDate, AStartTime, AStopTime, ATeacherIK, ACalcUnitIK, AAudIK, AVidZanyatName, ACalcUnitName, ADiscName, AAudName, ATeacherName);
  fPartNumber:= APartNumber;
end;

constructor TConflictItem.Create(AConflictDate: TDate; AStartTime, AStopTime: TTime; ATeacherIK, ACalcUnitIK,
  AAudIK: integer; AVidZanyatName, ACalcUnitName, ADiscName, AAudName,
  ATeacherName: string);
begin
  fConflictDate:= AConflictDate;
  fConflictStartTime:= AStartTime;
  fConflictStopTime:= AStopTime;
  fVidZanyatName:= AVidZanyatName;
  fCalcUnitName:= ACalcUnitName;
  fCalcUnitIK:= ACalcUnitIK;
  fTeacherIK:= ATeacherIK;
  fAudIK:= AAudIK;
  fDiscName:= ADiscName;
  fAudName:= AAudName;
  fTeacherName:= ATeacherName;
end;                }

{ TCampusDistanceInfo }

constructor TCampusDistanceInfo.Create(ACampusIK: integer; ACampusName: string;
  ADistanceArraySize: integer);
begin
  fCampusIK:= ACampusIK;
  fCampusName:= ACampusName;
  SetLength(fDistanceArray, ADistanceArraySize);
end;

function TCampusDistanceInfo.getDistance(index: integer): integer;
begin
  Result:= fDistanceArray[index];
end;

function TCampusDistanceInfo.getDistanceCount: integer;
begin
  Result:= Length(fDistanceArray);
end;

procedure TCampusDistanceInfo.setDistance(index: integer; const Value: integer);
begin
  fDistanceArray[index]:= Value;
end;

{ TLessonVisibleEventList }

constructor TLessonVisibleEventList.Create;
begin
  inherited Create;
  fSelectedItemIndex:= -1;
end;

procedure TLessonVisibleEventList.DeleteEvent(AEventIK: integer);
var
  i: integer;
begin
  i:= 0;
  while i < Count do
  begin
    if Assigned(Items[i]) then
    begin
      if Items[i].EventIK = AEventIK then
      begin
        Delete(i);
        fSelectedItemIndex:= -1;
        exit;
      end;
    end
    else
    begin
      Delete(i);
      fSelectedItemIndex:= -1;
      continue;
    end;
    inc(i);
  end;
end;

function TLessonVisibleEventList.getSelectedEvent: TSheduleEvent;
begin
  if (fSelectedItemIndex >= 0) and (fSelectedItemIndex < Count) then
    Result:= Items[fSelectedItemIndex]
  else Result:= nil;
end;

function TLessonVisibleEventList.GetVisibleEvent(Index: Integer): TSheduleEvent;
begin
  Result:= TSheduleEvent(inherited Items[index]);
end;

procedure TLessonVisibleEventList.SetVisibleEvent(Index: Integer;
  const Value: TSheduleEvent);
begin
  inherited Items[index]:= Value;
end;

{ TExamVisibleEventList }

constructor TExamVisibleEventList.Create;
begin
  inherited Create;
  fSelectedItemIndex:= -1;
end;

procedure TExamVisibleEventList.DeleteExam(AExamIK: integer);
var
  i: integer;
begin
  i:= 0;
  while i < Count do
  begin
    if Assigned(Items[i]) then
    begin
      if Items[i].ExamIK = AExamIK then
      begin
        Delete(i);
        fSelectedItemIndex:= -1;
        exit;
      end;
    end
    else
    begin
      Delete(i);
      fSelectedItemIndex:= -1;
      continue;
    end;
    inc(i);
  end;
end;

function TExamVisibleEventList.GetVisibleEvent(
  Index: Integer): TSheduleExamination;
begin
  Result:= TSheduleExamination(inherited Items[index]);
end;

procedure TExamVisibleEventList.SetVisibleEvent(Index: Integer;
  const Value: TSheduleExamination);
begin
  inherited Items[index]:= Value;
end;

{ TRoomConstraintVZandVNItem }

procedure TRoomConstraintVZandVNItem.AddContentPlanNagrIK(
  AContentPlanNagrIK: integer);
begin
  fContentPlanNagrIKList.Add(IntToStr(AContentPlanNagrIK));
end;

constructor TRoomConstraintVZandVNItem.Create(AVidZanyatIK,
  AVidNagruzkiIK: integer; AItemType: TRoomConstraintItemType);
begin
  inherited Create(AVidZanyatIK, AItemType);
  fVidNagruzkiIK:= AVidNagruzkiIK;
  fContentPlanNagrIKList:= TStringList.Create;
end;

destructor TRoomConstraintVZandVNItem.Destroy;
begin
  if Assigned(fContentPlanNagrIKList) then FreeAndNil(fContentPlanNagrIKList);
  inherited;
end;

function TRoomConstraintVZandVNItem.getContentPlanNagrIKList: string;
var
  i: integer;
begin
  Result:= '';
  for I := 0 to fContentPlanNagrIKList.Count - 1 do
    if i <> fContentPlanNagrIKList.Count - 1 then Result:= Result + fContentPlanNagrIKList[i] + ', '
    else Result:= Result + fContentPlanNagrIKList[i];
end;

{ TRoomConstraintPrepodItem }

procedure TRoomConstraintPrepodItem.AddPrepodPlanNagrIK(
  APrepodPlanNagrIK: integer);
begin
  fPrepodPlanNagrIKList.Add(IntToStr(APrepodPlanNagrIK));
end;

constructor TRoomConstraintPrepodItem.Create(APrepodIK,
  ACommissionNumber: integer; AItemType: TRoomConstraintItemType);
begin
  inherited Create(APrepodIK, AItemType);
  fCommissionNumber:= ACommissionNumber;
  fPrepodPlanNagrIKList:= TStringList.Create;
end;

destructor TRoomConstraintPrepodItem.Destroy;
begin
  if Assigned(fPrepodPlanNagrIKList) then FreeAndNil(fPrepodPlanNagrIKList);
  inherited;
end;


function TRoomConstraintPrepodItem.getPrepodPlanNagrIKAsList: TStringList;
begin
  Result:= fPrepodPlanNagrIKList;
end;

function TRoomConstraintPrepodItem.getPrepodPlanNagrIKList: string;
var
  i: integer;
begin
  Result:= '';
  for I := 0 to fPrepodPlanNagrIKList.Count - 1 do
    if i <> fPrepodPlanNagrIKList.Count - 1 then Result:= Result + fPrepodPlanNagrIKList[i] + ', '
    else Result:= Result + fPrepodPlanNagrIKList[i];
end;

end.
