unit NagruzkaClasses;
 {#Author villain@ist.ugtu.net}
interface

uses DBTVTeacherobj, Grids, ADODB, DB, Graphics, ComCtrls, Classes, Types, Contnrs,
    Messages, StdCtrls, Controls, Forms, SysUtils, Windows, Variants;

type
  TTeacherAttach = class;
  PTeacherAttach = ^TTeacherAttach;
  TConflictOnAutoBuildItemType = (cabiAvtoBuild, cabiNoCUContingent, cabiNoGroupContingent);
  TPotokTreeViewItemType = (ptvitPotok, ptvitSpec, ptvitPotokSheme, ptvitPotokSemShema, ptvitGroupUnion, ptvitPotokShemeUnion, ptvitCalcUnit, ptvitYearEnterUnion);
  TTeacherTreeViewItemType = (ttvitTeacher, ttvitWorkType);
  TPotokShemaDecomposeType = (psdtWithoutDecompose = 1, psdtDecomposeOnGroups = 2, psdtDecomposeOnSubgroups = 3);

  TSpecNode = class
  private
    fSpecIK: integer;
    fSpecShortName: string;
    fYearIK: integer;
    fYearName: string;
    fGroupIK: integer;
    fGroupName: string;
  public
    constructor Create(ASpecIK, AYearIK: integer; ASpecShortName, aYearName: string); overload;
    constructor Create(ASpecIK, AYearIK, aGroupIK: integer; ASpecShortName, aYearName, aGroupName: string); overload;
    property SpecIK: integer read fSpecIK write fSpecIK;
    property SpecShortName: string read fSpecShortName write fSpecShortName;
    property YearIK: integer read fYearIK write fYearIK;
    property YearName: string read fYearName write fYearName;
    property GroupIK: integer read fGroupIK write fGroupIK;
    property GroupName: string read fGroupName write fGroupName;
  end;

  TSpecNodes = class (TObjectList)
  private
    function GetItems(Index: Integer): TSpecNode;
  published
  public
    property Items[Index: Integer]: TSpecNode read GetItems;
    procedure RemoveItem(ASpecIK, AYearIK: integer);
  end;

  TPrepodTreeLoadThread = class(TThread)
  private
    teacherDS: TADODataSet;
    workTypesDS: TADODataSet;
    fKafedraIK, fYearIK, fSemTypeIK: integer;
    fTreeView: TTreeView;
    fTreeFilterType: TTeacherTreeViewFilter;
    procedure TerminateThread(Sender: TObject);
    function AddTeacherTreeNode(TabN: integer; TeacherFIO: string): TTreeNode;
  protected
    procedure LoadPrepodTreeView;
  public
    constructor Create(KafedraIK, YearIK, SemTypeIK: integer; ATreeView: TTreeView; treeFilterType: TTeacherTreeViewFilter);
    procedure Execute; override;
  end;


  TPotokTreeLoadThread = class(TThread)
  private
    fKafedraIK: integer;
    fSemIK: integer;
    fYearIK: integer;
    fTreeView: TTreeView;
    fFilterStr: string;
    fExpandYearIK: integer;
    fExpandPotokIK: integer;
    fExpandPotokFull: boolean;
    potokDS, potokYearsEnterDS: TADODataSet;
    procedure TerminateThread(Sender: TObject);
  protected
    procedure LoadPotokTreeView;
  public
    constructor Create(AKafedraIK, ASemIK, AYearIK: integer; ATreeView: TTreeView; AFilterStr: string; AExpandYearIK, AExpandPotokIK: integer; AExpandPotokFull: boolean);
    procedure Execute; override;
  end;


  TCalcUnitContingent = class
  private
    fCalcUnitName: string;
    fSpecIK: Variant;
    fGrupIK: Variant;
    fStudentBudget: integer;
    fStudentContract: integer;
  public
    constructor Create(ACalcUnitName: string; ASpecIK, AGrupIK: Variant; AStudentBudget, AStudentContract: integer);
    property CalcUnitName: string read fCalcUnitName write fCalcUnitName;
    property SpecIK: Variant read fSpecIK write fSpecIK;
    property GrupIK: Variant read fGrupIK write fGrupIK;
    property StudentBudget: integer read fStudentBudget write fStudentBudget;
    property StudentContract: integer read fStudentContract write fStudentContract;
  end;

  TPlanPotokInfo = class
  private
    fSpecFac: integer;
    fName: string;
    fYearEnter: integer;
    fGroups: integer;
    fSupGroups: integer;
    fBudget: integer;
    fContract: integer;
    fISGroup: Boolean;
  public
    constructor Create(aSpecFac: integer; aName: string; aYearEnter: integer);
    procedure FillPlan(aGroups,aSupGroups,aBudget,aContract: integer; aIsGroup: Boolean);
    property SpecFac: integer read fSpecFac;
    property Name: string read fName;
    property YearEnter: integer read fYearEnter;
    property Groups: integer read fGroups;
    property SupGroups: integer read fSupGroups;
    property Budget: integer read fBudget;
    property Contract: integer read fContract;
    property ISGroup: Boolean read fISGroup;
  end;

  TPlanPotokInfos = class(TObjectList)
  private
    function GetItem(Index: Integer): TPlanPotokInfo;
  public
    property Items[Index: Integer]: TPlanPotokInfo read GetItem;
    function ItemBySpecYear(aSpec: integer; aYear: integer): TPlanPotokInfo;
  end;


  TSemesterCalcUnit = class
  private
    fIK: integer;
    fName: string;
    fShemaIK: integer;
    fPotokSemesterIK: integer;
    fBudget, fContract: integer;
    fGroups: TObjectList;
    function GetGroupsName: string;
  public
    property IK: integer read fIK write fIK;
    property Name: string read fName write fName;
    property ShemaIK: integer read fShemaIK write fShemaIK;
    property PotokSemesterIK: integer read fPotokSemesterIK write fPotokSemesterIK;
    property Budget: integer read fBudget write fBudget;
    property Contract: integer read fContract write fContract;
    property Groups: TObjectList read fGroups;
    property GroupsName: string read GetGroupsName;
    constructor Create(aIK: integer; aName: string; aShemaIK, aPotSemIK, aBudget, aContract: integer);  overload;
    constructor Create(); overload;
    destructor Destroy; override;
    procedure AddGroup(AgroupIK: integer; aGroupName: string);
    procedure CopyGroups(aGroups: TObjectList);
    procedure Modify(aCalcUnit: TSemesterCalcUnit);
    procedure ClearGroup;
    function HasGroup(aGroupIk: integer): boolean;
  end;

  TSemesterCalcUnits = class(TObjectList)
  private
    function GetItem(Index: Integer): TSemesterCalcUnit;
  public
    property Items[Index: Integer]: TSemesterCalcUnit read GetItem;
    function ItemByID(aID: integer): TSemesterCalcUnit;
    function IndexByID(aID: integer): integer;
  end;

  TPotokSemesterShema = class
  private
    fIK: integer;
    fName: string;
    fDecomposeTypeIK: integer;
    fPotokSemesterIK: integer;
    fCalcUnitList: TSemesterCalcUnits;
    fIsModified: boolean;
    procedure SetCalcUnitList(const Value: TSemesterCalcUnits);
  public
    property IK: integer read fIK;
    property Name: string read fName;
    property DecomposeTypeIK: integer read fDecomposeTypeIK;
    property CalcUnitList: TSemesterCalcUnits read fCalcUnitList write SetCalcUnitList;
    property PotokSemesterIK: integer read fPotokSemesterIK;
    property IsModified: boolean read fIsModified write fIsModified;
    constructor Create(AIK, ADecomposeTypeIK, APotokSemIK: integer; AName: string);
    destructor Destroy; override;
    procedure addCalcUnit(aCalc: TSemesterCalcUnit);

    procedure ChangeName(aName: string);
  end;

  TPotokSemesterShemas = class(TObjectList)
  private
    function GetItem(Index: Integer): TPotokSemesterShema;
  published
  public
    property Items[Index: Integer]: TPotokSemesterShema read GetItem;
    function ItemByID(aID: integer): TPotokSemesterShema;
    function IndexByID(aID: integer): integer;
  end;

  TGroup = class
  private
    fIK: integer;
    fName: string;
  public
    property IK: integer read fIK;
    property Name: string read fName;
    constructor Create(aIK: integer; aNAme: string);
  end;


  TPotokShemaYearContingent = class
  private
    fYearIK: integer;
    fYearValue: integer;
    fYearName: string;
    fCalcUnitContingentList: TObjectList;
    function getCalcUnit(index: integer): TCalcUnitContingent;
    procedure setCalcUnit(index: integer; const Value: TCalcUnitContingent);
    function getAllCalcUnitBudget: integer;
    function getAllCalcUnitContract: integer;
    function getCalcUnitCount: integer;
  public
    constructor Create(AYearIK, AYearValue: integer; AYearName: string);
    destructor Destroy; override;
    procedure AssignCalcUnitContingentList(Value: TList);
    procedure AddCalcUnitContingent(Value: TCalcUnitContingent);
    procedure DeleteCalcUnitContingent(index: integer);
    procedure ClearList;
    property YearIK: integer read fYearIK write fYearIK;
    property YearValue: integer read fYearValue write fYearValue;
    property YearName: string read fYearName write fYearName;
    property CalcUnitCount: integer read getCalcUnitCount;
    property AllCalcUnitBudget: integer read getAllCalcUnitBudget;
    property AllCalcUnitContract: integer read getAllCalcUnitContract;
    property CalcUnitContingent[index: integer]: TCalcUnitContingent read getCalcUnit write setCalcUnit;
  end;



  TTeacherTreeViewTeacherItem = class
  protected
    fTabN: integer;
    fTeacherFIO: string;
    fItemType: TTeacherTreeViewItemType;
  public
    constructor Create(ATabN: integer; ATeacherFIO: string; AItemType: TTeacherTreeViewItemType);
    property TabN: integer read fTabN write fTabN;
    property TeacherFIO: string read fTeacherFIO write fTeacherFIO;
    property ItemType: TTeacherTreeViewItemType read fItemType write fItemType;
  end;



  TTeacherTreeViewWorkTypeItem = class(TTeacherTreeViewTeacherItem)
  private
    fTeacherIK: integer;
  public
    constructor Create(ATabN, ATeacherIK: integer; ATeacherFIO: string; AItemType: TTeacherTreeViewItemType);
    property TeacherIK: integer read fTeacherIK write fTeacherIK;
  end;



  TPotokTreeViewPotokItem = class
  protected
    fIK: integer;
    fPotokIK: integer;
    fPotokTreeViewItemType: TPotokTreeViewItemType;
    fPotokName: string;
    fIsLoad: boolean;
  public
    constructor Create(APotokTreeViewItemType: TPotokTreeViewItemType; AIK: integer; APotokName: string);
    property IK: integer read fIK write fIK;
    property PotokIK: integer read fPotokIK write fPotokIK;
    property PotokTreeViewItemType:TPotokTreeViewItemType read fPotokTreeViewItemType write fPotokTreeViewItemType;
    property PotokName: string read fPotokName write fPotokName;
    property IsLoad: boolean read fIsLoad write fIsLoad;
  end;



  TPotokTreeViewPotokShemeItem = class(TPotokTreeViewPotokItem)
  private
    fPotokShemeIK: integer;
  public
    constructor Create(APotokTreeViewItemType: TPotokTreeViewItemType; APotokIK, APotokShemeIK: integer; APotokName: string);
    property PotokShemeIK: integer read fPotokShemeIK write fPotokShemeIK;
  end;



  TFoundedPotok = class
  private
    fPotokIK: integer;
    fUchPlanIK: integer;
    fNormOfTimeIK: integer;
    fPotokName: string;
  public
    constructor Create(APotokIK, AUchPlanIK, ANormOfTimeIK: integer; APotokName: string);
    property PotokIK: integer read fPotokIK write fPotokIK;
    property UchPlanIK: integer read fUchPlanIK write fUchPlanIK;
    property NormOfTimeIK: integer read fNormOfTimeIK write fNormOfTimeIK;
    property PotokName: string read fPotokName write fPotokName;
  end;


  TConflictOnAutoBuildItem = class
  private
    fShemaTypeName: string;
    fPotokName: string;
    fItemType: TConflictOnAutoBuildItemType;
  public
    constructor Create(AShemaTypeName, APotokName: string; AItemType: TConflictOnAutoBuildItemType);
    property ShemaTypeName: string read fShemaTypeName;
    property PotokName: string read fPotokName;
    property ItemType: TConflictOnAutoBuildItemType read fItemType;
  end;



  TCalculationSchemeGrid = class(TStringGrid)
  protected
    procedure Paint; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
  public
    constructor Create(AOwner: TComponent); override;
  end;


  TContingentStringGrid = class(TStringGrid)
  protected
    procedure Paint; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;



  TPlanContingentItem = class(TObject)
  private
    fSpecIK: integer;
    fCourse: integer;
    fGroupCount: integer;
    fSubgroupCount: integer;
    fBudget: integer;
    fContract: integer;
  public
    constructor Create(ASpecIK: integer; ACourse, AGroupCount, ASubgroupCount, ABudget, AContract: integer);
    property SpecIK: integer read fSpecIK;
    property Course: integer read fCourse;
    property GroupCount: integer read fGroupCount write fGroupCount;
    property SubgroupCount: integer read fSubgroupCount write fSubgroupCount;
    property Budget: integer read fBudget write fBudget;
    property Contract: integer read fContract write fContract;
  end;



  TPlanContingentGrid = class(TStringGrid)
  private
    fYearIK: integer;
    fFacIK: integer;
    fIsModified: boolean;
    fPlanContingentItems: TObjectList;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    function getPlanContingentItem(index: integer): TPlanContingentItem;
    procedure setPlanContingentItem(index: integer;
      const Value: TPlanContingentItem);
    function getPlanContingentItemCount: integer;
    procedure AddItem(ASpecIK: integer; ASpecName, AShName: string; ACourse, AGroupCount, ASubgroupCount, ABudget, AContract: integer);
  protected
    procedure Paint; override;
    procedure KeyPress(var Key: Char); override;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearList;
    function SaveContingent: boolean;
    procedure ReadContingent(AFacIK, AYearIK: integer);
    property IsModified: boolean read fIsModified write fIsModified;
    property PlanContingentItemCount: integer read getPlanContingentItemCount;
    property PlanContingentItem[index: integer]: TPlanContingentItem read getPlanContingentItem write setPlanContingentItem;
  end;



  TCalcUnit = class
  private
    fChechBox: TCheckBox;
    fCalcUnitIK: integer;
    fRecordsInPlanCountForThisCalcUnit: word;
    fTasksInPlanCountForThisCalcUnit: word;
    fCalcUnitName: string;
    fByPlanNumber: word;
    fTaskCountForThisPlanNumber: word;
    fMemberNumber: word;
    fCurrentHourValue: double;
    fCurrentStudentValue: integer;
    fBusyHourValue: double;
    fBusyStudentValue: integer;
    fMaxStudentValue: integer;
    fMaxHourValue: double;
    fWeekInPlanCount: integer;
    fCalcStudentsOnly: boolean;
    function getCurrentHourValue: double;
    function getMaxHourValue: double;
    function getBusyHourValue: double;
  public
    constructor Create(AOwner: TComponent; isCheck: boolean; ACalcUnitIK: integer; ARecordsInPlanCountForThisCalcUnit, ATasksInPlanCountForThisCalcUnit, AByPlanNumber, ATaskCountForThisPlanNumber, AMemberNumber: word; ACalcUnitName: string; ACurrentHourValue, AMaxHourValue, ABusyHourValue: double; ACurrentStudentValue, AMaxStudentValue, ABusyStudentValue, AWeekInPlanCount: integer; ACalcStudentsOnly: boolean);
    destructor Destroy; override;
    function CalcAllHour(MinContingent: integer; NormPerStudent, NormPerStudentForMin, MaxNormPerStudent: double): double;
    property CheckBox: TCheckBox read fChechBox write fChechBox;
    property CalcUnitIK: integer read fCalcUnitIK write fCalcUnitIK;
    property RecordsInPlanCountForThisCalcUnit: word read fRecordsInPlanCountForThisCalcUnit write fRecordsInPlanCountForThisCalcUnit;
    property TasksInPlanCountForThisCalcUnit: word read fTasksInPlanCountForThisCalcUnit write fTasksInPlanCountForThisCalcUnit;
    property CalcUnitName: string read fCalcUnitName write fCalcUnitName;
    property ByPlanNumber: word read fByPlanNumber write fByPlanNumber;
    property TaskCountForThisPlanNumber: word read fTaskCountForThisPlanNumber write fTaskCountForThisPlanNumber;
    property MemberNumber: word read fMemberNumber write fMemberNumber;
    property CurrentHourValue: double read getCurrentHourValue write fCurrentHourValue;
    property CurrentStudentValue: integer read fCurrentStudentValue write fCurrentStudentValue;
    property MaxHourValue: double read getMaxHourValue;
    property MaxStudentValue: integer read fMaxStudentValue;
    property BusyHourValue: double read getBusyHourValue write fBusyHourValue;
    property BusyStudentValue: integer read fBusyStudentValue write fBusyStudentValue;
    property WeekInPlanCount: integer read fWeekInPlanCount write fWeekInPlanCount;
    property CalcStudentsOnly: boolean read fCalcStudentsOnly write fCalcStudentsOnly;
  end;



  TTeacherAttach = class(TStringGrid)
  private
    FOnCheckBoxChange: TNotifyEvent;
    fAllCheckBox: TCheckBox;
    fCalcUnits: TObjectList;
    fNormPerUnit: double;
    fNormPerStudent: double;
    fMaxNormPerStudent: double;
    fNormPerUnitForMin: double;
    fNormPerStudentForMin: double;
    fMinContingent: integer;
    fIsManyInPlan: byte;
    fIsManyInCommission: byte;
    isCellTextChange: boolean;
    curRow, curCol: integer;
    procedure AllCheckBoxClick(Sender: TObject);
    function getCalcUnit(index: integer): TCalcUnit;
    procedure setCalcUnit(index: integer; Value: TCalcUnit);
    procedure CalcUnitCheckBoxClick(Sender: TObject);
    procedure setIsManyInPlan(const Value: byte);
    procedure setIsManyInCommission(const Value: byte);
  protected
    procedure Paint; override;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    function GetEditText(ACol, ARow: Longint): string; override;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure UpdateAllCheckBox;
    procedure AddCalcUnit(ACalcUnit: TCalcUnit);
    procedure Clear();
    function GetCalcUnits: TObjectList;
    function getCalcUnitsCount: integer;
    procedure AssignCalcUnits(value: TObjectList);
    property AllCheckBox:TCheckBox read fAllCheckBox write fAllCheckBox;
    property NormPerUnit: double read fNormPerUnit write fNormPerUnit;
    property NormPerStudent: double read fNormPerStudent write fNormPerStudent;
    property MaxNormPerStudent: double read fMaxNormPerStudent write fMaxNormPerStudent;
    property MinContingent: integer read fMinContingent write fMinContingent;
    property NormPerUnitForMin: double read fNormPerUnitForMin write fNormPerUnitForMin;
    property NormPerStudentForMin: double read fNormPerStudentForMin write fNormPerStudentForMin;
    property CalcUnits[index: integer]: TCalcUnit read getCalcUnit write setCalcUnit;
    property IsManyInPlan: byte read fIsManyInPlan write setIsManyInPlan;
    property IsManyInCommission: byte read fIsManyInCommission write setIsManyInCommission;
  published
    property OnCheckBoxChange: TNotifyEvent read FOnCheckBoxChange write FOnCheckBoxChange;
  end;



  TTakeNagrUnit = class
  private
    fIsRemoved: boolean;
    fTakeCalcUnits: TObjectList;
    fContentPlanNagrIK: integer;
    fVidZanyatIK: integer;
    fVidNagruzkiIK: integer;
    fVidZanyatName: string;
    fVidNagruzkiName: string;
    fNormPerUnit: double;
    fNormPerStudent: double;
    fMinContingent: integer;
    fNormPerUnitForMin: double;
    fNormPerStudentForMin: double;
    fMaxNormPerStudent: double;
//    fInPlanCount: integer;
    function getTakeCalcUnit(index: integer): TCalcUnit;
    procedure setTakeCalcUnit(index: integer; const Value: TCalcUnit);
  public
    constructor Create(AContentPlanNagrIK, AVidZanyatIK, AVidNagruzkiIK: integer; AVidZanyatName, AVidNagruzkiName: string; ANormPerUnit, ANormPerStudent, AMaxNormPerStudent: double; AMinContingent: integer; ANormPerUnitForMin, ANormPerStudentForMin: double; ATakeCalcUnits: TList);
    destructor Destroy; override;
    procedure AssignTakeCalcUnits(Value: TList);
    function GetTakeCalcUnits: TObjectList;
    property IsRemoved: boolean read fIsRemoved write fIsRemoved;
    property TakeCalcUnits[index: integer]: TCalcUnit read getTakeCalcUnit write setTakeCalcUnit;
    property ContentPlanNagrIK: integer read fContentPlanNagrIK write fContentPlanNagrIK;
    property VidZanyatIK: integer read fVidZanyatIK write fVidZanyatIK;
    property VidNagruzkiIK: integer read fVidNagruzkiIK write fVidNagruzkiIK;
    property VidZanyatName: string read fVidZanyatName write fVidZanyatName;
    property VidNagruzkiName: string read fVidNagruzkiName write fVidNagruzkiName;
    property NormPerUnit: double read fNormPerUnit write fNormPerUnit;
    property NormPerStudent: double read fNormPerStudent write fNormPerStudent;
    property MinContingent: integer read fMinContingent write fMinContingent;
    property NormPerUnitForMin: double read fNormPerUnitForMin write fNormPerUnitForMin;
    property NormPerStudentForMin: double read fNormPerStudentForMin write fNormPerStudentForMin;
    property MaxNormPerStudent: double read fMaxNormPerStudent write fMaxNormPerStudent;
 //   property InPlanCount: integer read fInPlanCount write fInPlanCount;
  end;



  TFactEvent = class
  private
    fCheckBox: TCheckBox;
    fEventStart: TDateTime;
    fEventStop: TDateTime;
    fGroupHour: double;
    fStudentCount: integer;
  public
    constructor Create(AEventStart, AEventStop: TDateTime); overload;
    constructor Create(Value: TFactEvent); overload;
    destructor Destroy; override;
    procedure Assign(Value: TFactEvent);
    property EventStart: TDateTime read fEventStart write fEventStart;
    property EventStop: TDateTime read fEventStop write fEventStop;
    property GroupHour: double read fGroupHour write fGroupHour;
    property StudentCount: integer read fStudentCount write fStudentCount;
    property CheckBox: TCheckBox read fCheckBox write fCheckBox;
  end;



  TFactGrid = class(TStringGrid)
  private
    FOnCheckBoxChange: TNotifyEvent;
    fEventDates: TObjectList;
    fAllCheckBox: TCheckBox;
    fIsAuditor: boolean;
    fNormPerUnit: double;
    fNormPerStudent: double;
    fNormPerUnitForMin: double;
    fNormPerStudentForMin: double;
    fMinContingent: integer;
    isCellTextChange: boolean;
    curRow, curCol: integer;
    fTaskCount: integer;
    fWeekInPlanCount: integer;
    function getEventDate(index: integer): TFactEvent;
    procedure setEventDate(index: integer; Value: TFactEvent);
    procedure FactCheckBoxClick(Sender: TObject);
    procedure AllCheckBoxClick(Sender: TObject);
    function getEventDatesCount(): integer;
  protected
    procedure Paint; override;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    function GetEditText(ACol, ARow: Longint): string; override;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure UpdateAllCheckBox;
    procedure AddNewEvent(isAddLine: boolean; StartTime, StopTime: TDateTime; StudentCount: integer; GroupHour: double);
    procedure AddLine(EventNumber: integer);
    procedure DeleteLine(index: integer);
    procedure Clear();
    property AllCheckBox:TCheckBox read fAllCheckBox write fAllCheckBox;
    property NormPerUnit: double read fNormPerUnit write fNormPerUnit;
    property NormPerStudent: double read fNormPerStudent write fNormPerStudent;
    property MinContingent: integer read fMinContingent write fMinContingent;
    property NormPerUnitForMin: double read fNormPerUnitForMin write fNormPerUnitForMin;
    property NormPerStudentForMin: double read fNormPerStudentForMin write fNormPerStudentForMin;
    property EventDates[index: integer]: TFactEvent read getEventDate write setEventDate;
    property EventDatesCount: integer read getEventDatesCount;
    property TaskCount: integer read fTaskCount write fTaskCount;
    property WeekInPlanCount: integer read fWeekInPlanCount write fWeekInPlanCount;
    procedure AssignEventDates(value: TObjectList);
    function GetEventDates: TObjectList;
  published
    property OnCheckBoxChange: TNotifyEvent read FOnCheckBoxChange write FOnCheckBoxChange;
    property IsAuditor: boolean read fIsAuditor write fIsAuditor;
  end;



  TTakeFactNagrVZItem = class
  private
    fIsRemoved: boolean;
    fPrepodPlanNagrIK: integer;
    fEventList: TObjectList;
    fNormPerUnit: double;
    fNormPerStudent: double;
    fNormPerUnitForMin: double;
    fNormPerStudentForMin: double;
    fMinContingent: integer;
    fCalcUnitName: string;
    fByPlanNumber: integer;
    fTaskCount: integer;
    fDefStudentCount: integer;
    fWeekInPlanCount: integer;
    fCalcStudentsOnly: boolean;
    fCalcUnitIK: integer;
    function getEvent(index: integer): TFactEvent;
    procedure setEvent(index: integer; const Value: TFactEvent);
    function getNormPerUnit: double;
  public
    constructor Create(APrepodPlanNagrIK, ACalcUnitIK: integer; ACalcUnitName: string; AByPlanNumber, ATaskCount, ADefStudentCount: integer; AEventList: TObjectList; needDestroyList: boolean; AWeekInPlanCount: integer; ACalcStudentsOnly: boolean); overload;
    constructor Create(Value: TTakeFactNagrVZItem); overload;
    destructor Destroy; override;
    property IsRemoved: boolean read fIsRemoved write fIsRemoved;
    property PrepodPlanNagrIK: integer read fPrepodPlanNagrIK write fPrepodPlanNagrIK;
    property NormPerUnit: double read getNormPerUnit write fNormPerUnit;
    property NormPerStudent: double read fNormPerStudent write fNormPerStudent;
    property NormPerUnitForMin: double read fNormPerUnitForMin write fNormPerUnitForMin;
    property NormPerStudentForMin: double read fNormPerStudentForMin write fNormPerStudentForMin;
    property MinContingent: integer read fMinContingent write fMinContingent;
    property CalcUnitName: string read fCalcUnitName write fCalcUnitName;
    property CalcUnitIK: integer read fCalcUnitIK write fCalcUnitIK;
    property ByPlanNumber: integer read fByPlanNumber write fByPlanNumber;
    property TaskCount: integer read fTaskCount write fTaskCount;
    property DefStudentCount: integer read fDefStudentCount write fDefStudentCount;
    property WeekInPlanCount: integer read fWeekInPlanCount write fWeekInPlanCount;
    property CalcStudentsOnly: boolean read fCalcStudentsOnly write fCalcStudentsOnly;
    function GetEventList: TObjectList;
    property Events[index: integer]: TFactEvent read getEvent write setEvent;
    procedure AssingEventList(AEventList: TObjectList);
  end;

  TAdditionFactItem = class
  private
    FIK: integer;
    FPlanIK: integer;
    FTeacherIK: integer;
    fVidZanyatIK: integer;
    FVidNagrIK: integer;
    FDiscIK: integer;
    FAdditionReasonIK: integer;
    FHours: double;
    FStudentCount: integer;
  public
    property IK: integer read FIK; 
    property PlanIK: integer read FPlanIK write FPlanIK;
    property TeacherIK: integer read FTeacherIK write FTeacherIK;
    property VidZanyatIK: integer read fVidZanyatIK write fVidZanyatIK;
    property VidNagrIK: integer read FVidNagrIK write FVidNagrIK;
    property DiscIK: integer read FDiscIK write FDiscIK;
    property AdditionReasonIK: integer read FAdditionReasonIK write FAdditionReasonIK;
    property Hours: double read FHours write FHours;
    property StudentCount: integer read FStudentCount write FStudentCount;
    constructor Create(aPlanIK, aTeacherIK: integer); overload;
    constructor Create(aAditionIK: integer); overload;
  end;



  TTakeFactNagrItem = class
  private
    fIsRemoved: boolean;
    fTakeVZItems: TObjectList;
    fContentPlanNagrIK: integer;
    fVidZanyatIK: integer;
    fVidZanyatMustBeInUchPlan: boolean;
    fVidNagruzkiIK: integer;
  //  fInPlanCount: integer;
    fNormPerUnit: double;
    fNormPerStudent: double;
    fMaxNormPerStudent: double;
    fMinContingent: integer;
    fNormPerUnitForMin: double;
    fNormPerStudentForMin: double;
    fVidZanyatTypeIK: integer;
    fVidZanyatTypeByTimeIK: integer;
    fPlanItemIK, fPlanPrepodIK, fFactPrepodIK,fFactStudent: integer;
    fFactHours, fForeignHours: double;
    function getItem(index: integer): TTakeFactNagrVZItem;
    procedure setItem(index: integer; const Value: TTakeFactNagrVZItem);
    procedure setVidZanyatIK(const Value: integer);
   public
    constructor Create(AContentPlanNagrIK, AVidZanyatIK, AVidZanyatTypeIK, AVidZanyatTypeByTimeIK, AVidNagruzkiIK: integer); overload;
    constructor Create(Value: TTakeFactNagrItem); overload;
    constructor Create(aPlanItemIK, aPlanPrepodIK, aFactPrepodIK: integer;aFactHours, aForeignHour: double; aFactStudent: integer); overload;
    destructor Destroy; override;
    procedure Assign(Value: TTakeFactNagrItem);
    procedure AssignFactNagrVZItems(ItemList: TObjectList);
    function AddTakeFactNagrVZItem(Value: TTakeFactNagrVZItem): TTakeFactNagrVZItem;
    procedure DeleteTakeFactNagrVZItem(index: integer);
    function GetItemsList: TObjectList;
    property IsRemoved: boolean read fIsRemoved write fIsRemoved;
    property Items[index: integer]: TTakeFactNagrVZItem read getItem write setItem;
 //   property InPlanCount: integer read fInPlanCount write fInPlanCount;
    property VidZanyatIK: integer read fVidZanyatIK write setVidZanyatIK;
    property PlanItemIK: integer read fPlanItemIK;
    property FactHours: double read fFactHours write fFactHours;
    property ForeignHours: double read fForeignHours write fForeignHours;
    property FactStudent: integer read fFactStudent write fFactStudent;
    property VidZanyatMustBeInUchPlan: boolean read fVidZanyatMustBeInUchPlan;
    property VidNagruzkiIK: integer read fVidNagruzkiIK write fVidNagruzkiIK;
    property NormPerUnit: double read fNormPerUnit write fNormPerUnit;
    property NormPerStudent: double read fNormPerStudent write fNormPerStudent;
    property MinContingent: integer read fMinContingent write fMinContingent;
    property NormPerUnitForMin: double read fNormPerUnitForMin write fNormPerUnitForMin;
    property NormPerStudentForMin: double read fNormPerStudentForMin write fNormPerStudentForMin;
    property MaxNormPerStudent: double read fMaxNormPerStudent write fMaxNormPerStudent;
    property VidZanyatTypeIK: integer read fVidZanyatTypeIK write fVidZanyatTypeIK;
    property VidZanyatTypeByTimeIK: integer read fVidZanyatTypeByTimeIK write fVidZanyatTypeByTimeIK;
    property ContentPlanNagrIK: integer read fContentPlanNagrIK write fContentPlanNagrIK;
  end;


  PFactGrid = ^TFactGrid;
  PTakeFactNagrItem = ^TTakeFactNagrItem;

  function GetTaskCountFromList(ATaskCountList: TStringList; AByPlanNumber: integer): integer;

var
  TeacherTreeLoadMutex, PotokTreeLoadMutex: THandle;

const
    MonthNames: array[1..12] of string = ('января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря');

implementation

uses GeneralController, NagruzkaController;

const
  TAColNames: array[1..6] of string = ('Название расч. единицы', 'Часов на р.е.','Кол-во студентов', 'Всего часов', '№ в комиссии', '№ работы');

function GetTaskCountFromList(ATaskCountList: TStringList; AByPlanNumber: integer): integer;
begin
  if (AByPlanNumber-1 <= ATaskCountList.Count) and (AByPlanNumber-1 >= 0) then
    Result:= StrToInt(ATaskCountList[AByPlanNumber-1])
  else Result:= 1;
end;


{ TPrepodTreeLoadThread }

function TPrepodTreeLoadThread.AddTeacherTreeNode(TabN: integer; TeacherFIO: string): TTreeNode;
var
  wtTreeNode: TTreeNode;
  isWorkTypeReleased: boolean;
  releaseCount: integer;
begin
//  if Self.Terminated then exit;

  Result:= fTreeView.Items.AddChildObject(nil, TeacherFIO, TTeacherTreeViewTeacherItem.Create(TabN, TeacherFIO, ttvitTeacher));
  workTypesDS.CommandText:= 'SELECT Prepods.itab_n, PrepodRank.cName_rank, PrepodDegree.cName_degree FROM Prepods LEFT OUTER JOIN PrepodRank ON Prepods.ik_rank = PrepodRank.ik_rank ' +
    'LEFT OUTER JOIN PrepodDegree ON Prepods.ik_degree = PrepodDegree.ik_degree WHERE iTab_n = ' + IntToStr(TabN);
  workTypesDS.Open;

  fTreeView.Items.AddChild(Result, 'Табельный номер: ' + teacherDS.FieldByName('iTab_n').AsString).ImageIndex:= 2;
  if workTypesDS.FieldByName('cName_rank').Value <> NULL then
    fTreeView.Items.AddChild(Result, 'Научное звание: ' + workTypesDS.FieldByName('cName_rank').AsString).ImageIndex:= 2
  else fTreeView.Items.AddChild(Result, 'Научное звание: <нет>').ImageIndex:= 2;
  if workTypesDS.FieldByName('cName_degree').Value <> NULL then
    fTreeView.Items.AddChild(Result, 'Научная степень: ' + workTypesDS.FieldByName('cName_degree').AsString).ImageIndex:= 2
  else fTreeView.Items.AddChild(Result, 'Научная степень: <нет>').ImageIndex:= 2;
  workTypesDS.Close;

  case fTreeFilterType of
  ttvfShowAll: workTypesDS.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(0, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(TabN) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')';
  ttvfShowUnreleased: workTypesDS.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(1, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(TabN) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')';
  ttvfShowReleased: workTypesDS.CommandText:= 'SELECT * FROM GetTeacherWorkTypeList(2, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(TabN) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')';
  end;
  workTypesDS.Open;
  releaseCount:= 0;

  while not workTypesDS.Eof do
  begin
    wtTreeNode:= fTreeView.Items.AddChildObject(Result, 'Вид работы: ' + workTypesDS.FieldByName('cName_work_type').AsString, TTeacherTreeViewWorkTypeItem.Create(TabN, workTypesDS.FieldByName('ik_id_prepod').AsInteger, TeacherFIO, ttvitWorkType));

    isWorkTypeReleased:= false;
    if workTypesDS.FieldByName('release_date').Value <> NULL then
      case fSemTypeIK of
      1: isWorkTypeReleased:= workTypesDS.FieldByName('release_date').AsDateTime < EncodeDate(workTypesDS.FieldByName('year_value').AsInteger, 9, 1);
      2: isWorkTypeReleased:= workTypesDS.FieldByName('release_date').AsDateTime < EncodeDate(workTypesDS.FieldByName('year_value').AsInteger+1, 1, 1);
      end;

    if isWorkTypeReleased then
    begin
      wtTreeNode.ImageIndex:= 4;
      inc(releaseCount);
    end
    else wtTreeNode.ImageIndex:= 3;

    if workTypesDS.FieldByName('Cname_capacity').Value <> NULL then
      fTreeView.Items.AddChild(wtTreeNode, 'Должность: ' + workTypesDS.FieldByName('Cname_capacity').AsString).ImageIndex:= 2
    else fTreeView.Items.AddChild(wtTreeNode, 'Должность: <не указано>').ImageIndex:= 2;

    if workTypesDS.FieldByName('cName_defence_fund').Value <> NULL then
      fTreeView.Items.AddChild(wtTreeNode, 'Фонд оплаты: ' + workTypesDS.FieldByName('cName_defence_fund').AsString).ImageIndex:= 2
    else fTreeView.Items.AddChild(wtTreeNode, 'Фонд оплаты: <не указано>').ImageIndex:= 2;

    if workTypesDS.FieldByName('f_rates').Value <> NULL then
      fTreeView.Items.AddChild(wtTreeNode, 'Ставка: ' + workTypesDS.FieldByName('f_rates').AsString + ' ед.').ImageIndex:= 2
    else fTreeView.Items.AddChild(wtTreeNode, 'Ставка: <не указано>').ImageIndex:= 2;

    workTypesDS.Next;
    wtTreeNode.Expand(false);
  end;
  if releaseCount = workTypesDS.RecordCount then Result.ImageIndex:= 5
  else Result.ImageIndex:= 1;
  workTypesDS.Close;
end;

constructor TPrepodTreeLoadThread.Create(KafedraIK, YearIK, SemTypeIK: integer; ATreeView: TTreeView; treeFilterType: TTeacherTreeViewFilter);
begin
  inherited Create(true);
  if TeacherTreeLoadMutex = 0 then TeacherTreeLoadMutex:= CreateMutex(nil, false, nil);
  FreeOnTerminate:= true;
  fKafedraIK:= KafedraIK;
  fYearIK:= YearIK;
  fSemTypeIK:= SemTypeIK;
  fTreeView:= ATreeView;
  fTreeFilterType:= treeFilterType;
  workTypesDS:= TGeneralController.Instance.GetNewADODataSet(false);
  teacherDS:= TGeneralController.Instance.GetNewADODataSet(false);
  OnTerminate:= TerminateThread;
  Resume;
end;

procedure TPrepodTreeLoadThread.Execute;
begin
  Synchronize(LoadPrepodTreeView);
  Terminate;
end;

procedure TPrepodTreeLoadThread.LoadPrepodTreeView;
begin
  WaitForSingleObject(TeacherTreeLoadMutex, INFINITE);
  fTreeView.Items.Clear;
  case fTreeFilterType of
      ttvfShowAll: teacherDS.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(0, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')';
      ttvfShowUnreleased: teacherDS.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(1, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')';
      ttvfShowReleased: teacherDS.CommandText:= 'SELECT * FROM GetTeacherListForDepartment(2, ' + IntToStr(fKafedraIK) + ', ' + IntToStr(fYearIK) + ', ' + IntToStr(fSemTypeIK) + ')'
      else exit;
  end;
  teacherDS.Open;
  while not teacherDS.Eof do
  begin
 {   if Self.Terminated then
    begin
      ReleaseMutex(TeacherTreeLoadMutex);
      exit;
    end;}
    AddTeacherTreeNode(teacherDS.FieldByName('iTab_n').AsInteger, teacherDS.FieldByName('FIO').AsString);
    teacherDS.Next;
    Application.ProcessMessages;
  end;
  ReleaseMutex(TeacherTreeLoadMutex);
end;

procedure TPrepodTreeLoadThread.TerminateThread(Sender: TObject);
begin
  if Assigned(teacherDS) then
  begin
    if teacherDS.Active then teacherDS.Close;
    FreeAndNil(teacherDS);
  end;
  if Assigned(workTypesDS) then
  begin
    if workTypesDS.Active then workTypesDS.Close;
    FreeAndNil(workTypesDS);
  end;
end;

{ TPotokTreeLoadThread }

constructor TPotokTreeLoadThread.Create(AKafedraIK, ASemIK, AYearIK: integer; ATreeView: TTreeView; AFilterStr: string; AExpandYearIK, AExpandPotokIK: integer; AExpandPotokFull: boolean);
begin
  inherited Create(true);
  if PotokTreeLoadMutex = 0 then PotokTreeLoadMutex:= CreateMutex(nil, false, nil);
  FreeOnTerminate:= true;
  fKafedraIK:= AKafedraIK;
  fSemIK := ASemIK;
  fYearIK := AYearIK;
  fTreeView:= ATreeView;
  fFilterStr:= AFilterStr;
  fExpandYearIK:= AExpandYearIK;
  fExpandPotokIK:= AExpandPotokIK;
  fExpandPotokFull:= AExpandPotokFull;
  OnTerminate:= TerminateThread;
  potokDS:= TGeneralController.Instance.GetNewADODataSet(false);
  potokYearsEnterDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Resume;
end;

procedure TPotokTreeLoadThread.Execute;
begin
  Synchronize(LoadPotokTreeView);
  Terminate;
end;

procedure TPotokTreeLoadThread.LoadPotokTreeView;
var
  yearEnterNode, potokNode, expandPotokNode: TTreeNode;
  tempDS: TADODataSet;
begin
  WaitForSingleObject(PotokTreeLoadMutex, INFINITE);
  fTreeView.Items.Clear;
  if (fFilterStr = '') or (fFilterStr = 'Введите название потока') then
    potokYearsEnterDS.CommandText:= 'SELECT ik_year_uch_pl, year_value FROM Year_uch_pl WHERE (ik_year_uch_pl in (SELECT ik_year_enter From Potok Where ik_potok in (SELECT ik_potok FROM Relation_potok_kaf WHERE ik_kaf = ' + IntToStr(fKafedraIK) + '))) ORDER BY year_value'
  else potokYearsEnterDS.CommandText:= 'SELECT ik_year_uch_pl, year_value FROM Year_uch_pl WHERE (ik_year_uch_pl in (SELECT ik_year_enter From Potok Where (ik_potok in (SELECT ik_potok FROM Relation_potok_kaf WHERE ik_kaf = ' + IntToStr(fKafedraIK) + ')) and (Cname_potok like ''%' + fFilterStr + '%''))) ORDER BY year_value';
  potokYearsEnterDS.Open;

    if (fFilterStr = '') or (fFilterStr = 'Введите название потока') then
      potokDS.CommandText:= 'Select p.*, ps.ik_potok_semestr,ps.Cname_potok From Potok p, Potok_semestr ps Where p.ik_potok=ps.id_potok and (ik_potok in (SELECT ik_potok FROM Relation_potok_kaf WHERE ik_kaf = '
      + IntToStr(fKafedraIK) + ')) and ps.id_year='+IntToStr(fYearIK)+' and ps.id_sem_type='+IntToStr(fSemIK)+' Order By Cname_potok'   //and (ik_year_enter = ' + potokYearsEnterDS.FieldByName('ik_year_uch_pl').AsString + ')


    else potokDS.CommandText:= 'Select p.*, ps.ik_potok_semestr, ps.Cname_potok From Potok p, Potok_semestr ps Where p.ik_potok=ps.id_potok and (ik_potok in (SELECT ik_potok FROM Relation_potok_kaf WHERE ik_kaf = '
    + IntToStr(fKafedraIK) + ')) and (Cname_potok like ''%' + fFilterStr + '%'') and (ik_year_enter = '
    + potokYearsEnterDS.FieldByName('ik_year_uch_pl').AsString + ') and ps.id_year='+IntToStr(fYearIK)+' and ps.id_sem_type='+IntToStr(fSemIK)+' Order By Cname_potok';
    potokDS.Open;
    expandPotokNode:= nil;

    //запрос на проверку планового контингента
    tempDS := TGeneralController.Instance.GetNewADODataSet(true);
    tempDS.CommandText := 'select * from IsTrueContingent('+IntToStr(fKafedraIK)+',' + IntToStr(fYearIK)+','+IntToStr(fSemIK)+')';
    tempDS.Open;

    while not potokDS.Eof do
    begin
      tempDS.Filter:= 'ik_potok_semestr='+ potokDS.FieldByName('ik_potok_semestr').AsString;
      tempDS.Filtered := true;

      potokNode:= fTreeView.Items.AddChildObject({yearEnterNode}nil, potokDS.FieldByName('cName_potok').AsString, TPotokTreeViewPotokItem.Create(ptvitPotok, potokDS.FieldByName('ik_potok_semestr').AsInteger, potokDS.FieldByName('cName_potok').AsString));
      if tempDS.FieldByName('Correct').AsBoolean=true then potokNode.ImageIndex:= 2
        else potokNode.ImageIndex:= 6;
      potokNode.HasChildren:= true;
      if (potokDS.FieldByName('ik_potok_semestr').AsInteger = fExpandPotokIK) then
        expandPotokNode:= potokNode;
      potokDS.Next;
      Application.ProcessMessages;
    end;
    potokDS.Close;
    if (fExpandYearIK = potokYearsEnterDS.FieldByName('ik_year_uch_pl').AsInteger) then
    begin
      yearEnterNode.Expand(false);
      if expandPotokNode <> nil then
      begin
        fTreeView.Select(expandPotokNode);
        expandPotokNode.Expand(fExpandPotokFull);
      end
      else fTreeView.Select(yearEnterNode);
    end;
  {  potokYearsEnterDS.Next;
  end;}
  tempDS.Close;
  tempDS.Free;

  ReleaseMutex(PotokTreeLoadMutex);
end;

procedure TPotokTreeLoadThread.TerminateThread(Sender: TObject);
begin
  if Assigned(potokDS) then
  begin
    if potokDS.Active then potokDS.Close;
    potokDS.Free;
  end;
  if Assigned(potokYearsEnterDS) then
  begin
    if potokYearsEnterDS.Active then potokYearsEnterDS.Close;
    potokYearsEnterDS.Free;
  end;      
end;

{ TPotokTreeViewPotokItem }

constructor TPotokTreeViewPotokItem.Create(
  APotokTreeViewItemType: TPotokTreeViewItemType; AIK: integer;APotokName: string);
begin
  fPotokTreeViewItemType:= APotokTreeViewItemType;
  fIK:= AIK;
  fPotokName:= APotokName;
  fIsLoad:= false;
end;

{ TPotokTreeViewPotokShemeItem }

constructor TPotokTreeViewPotokShemeItem.Create(
  APotokTreeViewItemType: TPotokTreeViewItemType; APotokIK,
  APotokShemeIK: integer; APotokName: string);
begin
  inherited Create(APotokTreeViewItemType, APotokIK, APotokName);
  fPotokShemeIK:= APotokShemeIK;
end;

{ TCalcUnitContingent }

constructor TCalcUnitContingent.Create(ACalcUnitName: string; ASpecIK, AGrupIK: Variant; AStudentBudget,
  AStudentContract: integer);
begin
  fCalcUnitName:= ACalcUnitName;
  fSpecIK:= ASpecIK;
  fGrupIK:= AGrupIK;
  fStudentBudget:= AStudentBudget;
  fStudentContract:= AStudentContract;
end;

{ TPotokShemaYearContingent }

procedure TPotokShemaYearContingent.AddCalcUnitContingent(
  Value: TCalcUnitContingent);
begin
  fCalcUnitContingentList.Add(Value);
end;

procedure TPotokShemaYearContingent.AssignCalcUnitContingentList(Value: TList);
var
  i: integer;
  tempCUC: TCalcUnitContingent;
begin
  if Value <> nil then
  begin
    fCalcUnitContingentList.Clear;
    for I := 0 to Value.Count - 1 do
    begin
      tempCUC:= Value[i];
      fCalcUnitContingentList.Add(TCalcUnitContingent.Create(tempCUC.CalcUnitName, tempCUC.SpecIK, tempCUC.GrupIK, tempCUC.StudentBudget, tempCUC.StudentContract));
    end;
  end;
end;

procedure TPotokShemaYearContingent.ClearList;
begin
  fCalcUnitContingentList.Clear;
end;

constructor TPotokShemaYearContingent.Create(AYearIK, AYearValue: integer; AYearName: string);
begin
  fYearIK:= AYearIK;
  fYearValue:= AYearValue;
  fYearName:= AYearName;
  fCalcUnitContingentList:= TObjectList.Create;
end;

procedure TPotokShemaYearContingent.DeleteCalcUnitContingent(index: integer);
begin
  fCalcUnitContingentList.Delete(index);
end;

destructor TPotokShemaYearContingent.Destroy;
begin
  fCalcUnitContingentList.Clear;
  fCalcUnitContingentList.Free;
  inherited;
end;

function TPotokShemaYearContingent.getAllCalcUnitBudget: integer;
var
  i: integer;
begin
  Result:= 0;
  for I := 0 to fCalcUnitContingentList.Count - 1 do
    Result:= Result + CalcUnitContingent[i].StudentBudget;
end;

function TPotokShemaYearContingent.getAllCalcUnitContract: integer;
var
  i: integer;
begin
  Result:= 0;
  for I := 0 to fCalcUnitContingentList.Count - 1 do
    Result:= Result + CalcUnitContingent[i].StudentContract;
end;

function TPotokShemaYearContingent.getCalcUnit(
  index: integer): TCalcUnitContingent;
begin
  Result:= fCalcUnitContingentList[index] as TCalcUnitContingent;
end;

function TPotokShemaYearContingent.getCalcUnitCount: integer;
begin
  Result:= fCalcUnitContingentList.Count;
end;

procedure TPotokShemaYearContingent.setCalcUnit(index: integer;
  const Value: TCalcUnitContingent);
begin
  fCalcUnitContingentList[index]:= Value;
end;

{ TTeacherTreeViewWorkTypeItem }

constructor TTeacherTreeViewWorkTypeItem.Create(ATabN, ATeacherIK: integer;
  ATeacherFIO: string; AItemType: TTeacherTreeViewItemType);
begin
  inherited Create(ATabN, ATeacherFIO, AItemType);
  fTeacherIK:= ATeacherIK;
end;

{ TTeacherTreeViewTeacherItem }

constructor TTeacherTreeViewTeacherItem.Create(ATabN: integer;
  ATeacherFIO: string; AItemType: TTeacherTreeViewItemType);
begin
  fTabN:= ATabN;
  fTeacherFIO:= ATeacherFIO;
  fItemType:= AItemType;
end;

{ TFoundedPotok }

constructor TFoundedPotok.Create(APotokIK, AUchPlanIK, ANormOfTimeIK: integer; APotokName: string);
begin
  fPotokIK:= APotokIK;
  fPotokName:= APotokName;
  fUchPlanIK:= AUchPlanIK;
  fNormOfTimeIK:= ANormOfTimeIK;
end;

{ TConflictOnAutoBuildItem }

constructor TConflictOnAutoBuildItem.Create(AShemaTypeName, APotokName: string; AItemType: TConflictOnAutoBuildItemType);
begin
  fShemaTypeName:= AShemaTypeName;
  fItemType:= AItemType;
  fPotokName:= APotokName;
end;

{ TCalculationSchemeGrid }

constructor TCalculationSchemeGrid.Create(AOwner: TComponent);
var
  i: integer;
begin
  inherited Create(AOwner);
  Parent:= TWinControl(AOwner);
  FixedCols:= 0;
  FixedRows:= 0;
  ColCount:= 11;
  RowCount:= 1;
  FixedColor:= clWindow;
  Options:= Options - [goFixedHorzLine, goFixedVertLine, goRangeSelect, goEditing];
  DefaultRowHeight:= 18;
  RowHeights[0]:= 22;
  BorderStyle:= bsNone;
  Align:= alClient;
  Cells[0,0]:= 'Расчетная единица';
  Cells[1,0]:= 'Количество работ';
  Cells[2,0]:= 'Количество студентов';
  Cells[3,0]:= 'Норма на студента';
  Cells[4,0]:= 'Часов на студентов';
  Cells[5,0]:= 'Норма на расч. ед.';
  Cells[6,0]:= 'Кол-во недель';
  Cells[7,0]:= 'Часов в неделю';
  Cells[8,0]:= 'Часов на расч. ед.';
  Cells[9,0]:= 'Состав комиссии';
  Cells[10,0]:= 'Итого часов';
  for I:= 0 to 10 do
    ColWidths[i]:= Canvas.TextWidth(Cells[i,0]) + 10;
end;

procedure TCalculationSchemeGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  if RowCount <= 1 then
  begin
    inherited;
    if ARow = 0 then
      Canvas.FillRect(ARect);
    exit;
  end;

  Canvas.MoveTo(Arect.Left, ARect.Top);
  Canvas.Font.Color := clWindowText;
  if (ARow = 0) then
    Canvas.Brush.Color:= clBtnFace
  else Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);

  if (ARow = 0) and (ACol >= 0) then
  begin
    Canvas.Pen.Color:= clBtnHighlight;
    Canvas.MoveTo(ARect.Right-1, ARect.Top+1);
    if ACol = 0 then
    begin
       Canvas.LineTo(ARect.Left+1, ARect.Top+1);
       Canvas.LineTo(ARect.Left+1, ARect.Bottom);
    end
    else
    begin
       Canvas.LineTo(ARect.Left, ARect.Top+1);
       Canvas.LineTo(ARect.Left, ARect.Bottom);
    end;

    Canvas.Pen.Color:= clBtnShadow;
    Canvas.MoveTo(ARect.Right, ARect.Top);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Left, ARect.Bottom);
    Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(Cells[ACol, 0]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Cells[ACol, 0]))/2), Cells[ACol, 0]);
  end;
  if (ARow > 0) and (ACol = 0) then
    Canvas.TextOut(ARect.Left + 4, ARect.Top + round((DefaultRowHeight - Canvas.TextHeight(Cells[ACol, ARow]))/2), Cells[ACol, ARow]);

  if (ARow > 0) and (ACol > 0) then
    Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(Cells[ACol, ARow]))/2), ARect.Top + round((DefaultRowHeight - Canvas.TextHeight(Cells[ACol, ARow]))/2), Cells[ACol, ARow]);

//  if (ARow > 0) and (ACol >= 3) then
//    inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TCalculationSchemeGrid.Paint;
begin
  inherited;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width-1, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
end;

procedure TCalculationSchemeGrid.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  Invalidate;
end;

procedure TCalculationSchemeGrid.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  Invalidate;
end;

procedure TCalculationSchemeGrid.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  Invalidate;
end;

{ TContingetnStringGrid }

constructor TContingentStringGrid.Create(AOwner: TComponent);
begin
  inherited;
  Parent:= TWinControl(AOwner);
  FixedCols:= 0;
  FixedRows:= 0;
  ColCount:= 5;
  RowCount:= 1;
  DefaultRowHeight:= 18;
  RowHeights[0]:= 22;      
  BorderStyle:= bsNone;
  Align:= alClient;
  Cells[0,0]:= 'Учебный год';
  Cells[1,0]:= 'Групп';
  ColWidths[1]:= Canvas.TextWidth(Cells[1,0]) + 10;
  Cells[2,0]:= 'Подгрупп';
  ColWidths[2]:= Canvas.TextWidth(Cells[2,0]) + 10;
  Cells[3,0]:= 'Бюджет';
  ColWidths[3]:= Canvas.TextWidth(Cells[3,0]) + 10;
  Cells[4,0]:= 'Контракт';
  ColWidths[4]:= Canvas.TextWidth(Cells[4,0]) + 10;
end;

procedure TContingentStringGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  Canvas.MoveTo(Arect.Left, ARect.Top);
  Canvas.Font.Color := clWindowText;
  if (ARow = 0) then
    Canvas.Brush.Color:= clBtnFace
  else
    Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);

  ColWidths[0]:= ClientWidth - ColWidths[1] - ColWidths[2] - ColWidths[3] - ColWidths[4] - 5;
  if (ARow = 0) and (ACol >= 0) then
  begin
    Canvas.Pen.Color:= clBtnHighlight;
    Canvas.MoveTo(ARect.Right-1, ARect.Top+1);
    if ACol = 0 then
    begin
       Canvas.LineTo(ARect.Left+1, ARect.Top+1);
       Canvas.LineTo(ARect.Left+1, ARect.Bottom);
    end
    else
    begin
       Canvas.LineTo(ARect.Left, ARect.Top+1);
       Canvas.LineTo(ARect.Left, ARect.Bottom);
    end;

    Canvas.Pen.Color:= clBtnShadow;
    Canvas.MoveTo(ARect.Right, ARect.Top);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Left, ARect.Bottom);
    Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(Cells[ACol, 0]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Cells[ACol, 0]))/2), Cells[ACol, 0]);
  end;

  if (ARow > 0) then
    inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TContingentStringGrid.Paint;
begin
  inherited;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width-1, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
end;


{ TPlanContingentGrid }

procedure TPlanContingentGrid.AddItem(ASpecIK: integer; ASpecName, AShName: string;
  ACourse, AGroupCount, ASubgroupCount, ABudget, AContract: integer);
begin
  fPlanContingentItems.Add(TPlanContingentItem.Create(ASpecIK, ACourse, AGroupCount, ASubgroupCount, ABudget, AContract));
  RowCount:= RowCount + 1;
  Cells[0, RowCount-1]:= ASpecName;
  Cells[1, RowCount-1]:= AShName;
  Cells[2, RowCount-1]:= IntToStr(ACourse);
  Cells[3, RowCount-1]:= IntToStr(AGroupCount);
  Cells[4, RowCount-1]:= IntToStr(ASubgroupCount);
  Cells[5, RowCount-1]:= IntToStr(ABudget);
  Cells[6, RowCount-1]:= IntToStr(AContract);
end;

procedure TPlanContingentGrid.ClearList;
begin
  fYearIK:= -1;
  fFacIK:= -1;
  fPlanContingentItems.Clear;
  RowCount:= 1;
  FixedRows:= 0;
end;

constructor TPlanContingentGrid.Create(AOwner: TComponent);
var
  i: integer;
begin
  inherited;
  Parent:= TWinControl(AOwner);
  fIsModified:= false;
  FixedCols:= 0;
  FixedRows:= 0;
  ColCount:= 7;
  RowCount:= 1;
  FixedColor:= clWindow;
  Options:= Options - [goFixedHorzLine, goFixedVertLine, goRangeSelect];
  DefaultRowHeight:= 18;
  RowHeights[0]:= 22;
  BorderStyle:= bsNone;
  Align:= alClient;
  fPlanContingentItems:= TObjectList.Create;
  Cells[0,0]:= 'Специальность';
  Cells[1,0]:= 'Шифр';
  Cells[2,0]:= 'Курс';
  Cells[3,0]:= 'Количество групп';
  Cells[4,0]:= 'Количество подгрупп';
  Cells[5,0]:= 'Бюджет';
  Cells[6,0]:= 'Контракт';
  for I:= 2 to 5 do
    ColWidths[i]:= Canvas.TextWidth(Cells[i,0]) + 15;
  ColWidths[1]:= 70;
  ColWidths[0]:= ClientWidth - ColWidths[1] - ColWidths[2] - ColWidths[3] - ColWidths[4] - ColWidths[5] - ColWidths[6] - 7;

end;

destructor TPlanContingentGrid.Destroy;
begin
  fPlanContingentItems.Clear;
  fPlanContingentItems.Free;
  inherited;
end;

procedure TPlanContingentGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  if RowCount <= 1 then
  begin
    inherited;
    if ARow = 0 then
      Canvas.FillRect(ARect);
    exit;
  end;

  Canvas.MoveTo(Arect.Left, ARect.Top);
  Canvas.Font.Color := clWindowText;
  if (ARow = 0) then
    Canvas.Brush.Color:= clBtnFace
  else
    Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);

  if (ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] + ColWidths[5] + ColWidths[6] + Canvas.TextWidth('Специальность') + 17) < ClientWidth then
    ColWidths[0]:= ClientWidth - ColWidths[1] - ColWidths[2] - ColWidths[3] - ColWidths[4] - ColWidths[5] - ColWidths[6]- 7
  else ColWidths[0]:= Canvas.TextWidth('Специальность') + 10;
  if (ARow = 0) and (ACol >= 0) then
  begin
    Canvas.Pen.Color:= clBtnHighlight;
    Canvas.MoveTo(ARect.Right-1, ARect.Top+1);
    if ACol = 0 then
    begin
       Canvas.LineTo(ARect.Left+1, ARect.Top+1);
       Canvas.LineTo(ARect.Left+1, ARect.Bottom);
    end
    else
    begin
       Canvas.LineTo(ARect.Left, ARect.Top+1);
       Canvas.LineTo(ARect.Left, ARect.Bottom);
    end;

    Canvas.Pen.Color:= clBtnShadow;
    Canvas.MoveTo(ARect.Right, ARect.Top);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Left, ARect.Bottom);
    Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(Cells[ACol, 0]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(Cells[ACol, 0]))/2), Cells[ACol, 0]);
  end;
  if (ARow > 0) and (ACol = 0) then
    Canvas.TextOut(ARect.Left + 4, ARect.Top + round((DefaultRowHeight - Canvas.TextHeight(Cells[ACol, ARow]))/2), Cells[ACol, ARow]);

  if (ARow > 0) and (ACol > 0) and (ACol < 3) then
    Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(Cells[ACol, ARow]))/2), ARect.Top + round((DefaultRowHeight - Canvas.TextHeight(Cells[ACol, ARow]))/2), Cells[ACol, ARow]);

  if (ARow > 0) and (ACol >= 3) then
    inherited DrawCell(ACol, ARow, ARect, AState);
end;

function TPlanContingentGrid.getPlanContingentItem(
  index: integer): TPlanContingentItem;
begin
  Result:= fPlanContingentItems[index] as TPlanContingentItem;
end;

function TPlanContingentGrid.getPlanContingentItemCount: integer;
begin
  Result:= fPlanContingentItems.Count;
end;

procedure TPlanContingentGrid.KeyPress(var Key: Char);
const
  allow: set of char = ['0','1','2','3','4','5','6','7','8','9', chr(VK_BACK)];
begin
  if Col < 3 then Key:= #0
  else
  begin
    if not (Key in allow) then
      Key:= #0
    else fIsModified:= true;
  end;
  inherited KeyPress(Key);
end;

procedure TPlanContingentGrid.Paint;
begin
  inherited;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width-1, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
{  Canvas.LineTo(Width-1, Height-1);
  Canvas.LineTo(Width-1, 0);}
end;

procedure TPlanContingentGrid.ReadContingent(AFacIK, AYearIK: integer);
var
  tempDS, secTempDS: TADODataSet;
  i: integer;
begin
  ClearList;
  fYearIK:= AYearIK;
  fFacIK:= AFacIK;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  secTempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT ik_spec_fac, cName_direction, Cshort_spec, Sh_spec, YearObuch FROM Spec_stud LEFT JOIN Direction ON Spec_stud.ik_direction = Direction.ik_direction INNER JOIN Relation_spec_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec ' +
    'WHERE (ik_fac = ' + IntToStr(AFacIK) + ') and (YEAR(ISNULL(dDate_spec, (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(AYearIK) + '))) <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(AYearIK) + ')) ORDER BY Cshort_spec';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    for I:= 1 to tempDS.FieldByName('YearObuch').AsInteger do
    begin
      secTempDS.CommandText:= 'SELECT * FROM Plan_contingent WHERE (ik_spec_fac = ' + tempDS.FieldByName('ik_spec_fac').AsString + ') and (ik_year = ' + IntToStr(fYearIK) + ') and (course_number = ' + IntToStr(i) + ')';
      secTempDS.Open;
      if secTempDS.RecordCount > 0 then
        AddItem(tempDS.FieldByName('ik_spec_fac').AsInteger, tempDS.FieldByName('Cshort_spec').AsString + ' (' + tempDS.FieldByName('cName_direction').AsString + ')', tempDS.FieldByName('Sh_spec').AsString,
          i, secTempDS.FieldByName('group_count').AsInteger, secTempDS.FieldByName('subgroup_count').AsInteger, secTempDS.FieldByName('budget_count').AsInteger, secTempDS.FieldByName('contract_count').AsInteger)
      else
        AddItem(tempDS.FieldByName('ik_spec_fac').AsInteger, tempDS.FieldByName('Cshort_spec').AsString + ' (' + tempDS.FieldByName('cName_direction').AsString + ')', tempDS.FieldByName('Sh_spec').AsString, i, 0, 0, 0, 0);
      secTempDS.Close;    
    end;
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
  if RowCount > 1 then FixedRows:= 1;  
  secTempDS.Free;
  fIsModified:= false;
end;

function TPlanContingentGrid.SaveContingent: boolean;
var
  i: integer;
begin
  Result:= false;
  for I := 0 to fPlanContingentItems.Count - 1 do
    with TPlanContingentItem(fPlanContingentItems[i]) do
    begin
      if (Cells[3, i+1] = '') or (Cells[4, i+1] = '') or (Cells[5, i+1] = '') or (Cells[6, i+1] = '') then
      begin
        Application.MessageBox('Все поля в таблице "Ожидаемый контингент специальностей/направлений" обязательны для заполнения!',
          'Сохранение ожидаемого контингента не возможно', MB_ICONWARNING);
        exit;
      end;
      if ((StrToInt(Cells[3, i+1]) = 0) or (StrToInt(Cells[4, i+1]) = 0)) and
        ((StrToInt(Cells[5, i+1]) <> 0) or (StrToInt(Cells[6, i+1]) <> 0)) then
      begin
        Application.MessageBox('Значения в полях "Количество групп" и "Количество подгрупп" таблицы "Ожидаемый контингент специальностей/направлений" не могут равняться нулю!',
          'Сохранение ожидаемого контингента не возможно', MB_ICONWARNING);
        exit;
      end;
      if (StrToInt(Cells[3, i+1]) <> 0) and (StrToInt(Cells[4, i+1]) = 0) then
      begin
        Application.MessageBox('При заполнении значения "Количество групп" необходимо заполнить значение "Количество подгрупп" таблицы "Ожидаемый контингент специальностей/направлений"!',
          'Сохранение ожидаемого контингента не возможно', MB_ICONWARNING);
        exit;
      end;
      if (StrToInt(Cells[3, i+1]) = 0) and (StrToInt(Cells[4, i+1]) <> 0) then
      begin
        Application.MessageBox('При заполнении значения "Количество подгрупп" необходимо заполнить значение "Количество групп" таблицы "Ожидаемый контингент специальностей/направлений"!',
          'Сохранение ожидаемого контингента не возможно', MB_ICONWARNING);
        exit;
      end;
      if ((StrToInt(Cells[3, i+1]) <> 0) or (StrToInt(Cells[4, i+1]) <> 0)) and
        ((StrToInt(Cells[5, i+1]) = 0) and (StrToInt(Cells[6, i+1]) = 0)) then
      begin
        Application.MessageBox(PChar('Для ' + Cells[2, i+1] + '-го курса специальности "' + Cells[0, i+1] + '" не заполнена информация о количестве студентов!'),
          'Сохранение ожидаемого контингента не возможно', MB_ICONWARNING);
        exit;
      end;
      GroupCount:= StrToInt(Cells[3, i+1]);
      SubgroupCount:= StrToInt(Cells[4, i+1]);
      Budget:= StrToInt(Cells[5, i+1]);
      Contract:= StrToInt(Cells[6, i+1]);
    end;
  Result:= TNagruzkaController.PlanNagruzka.SaveContingient(fYearIK, fFacIK, fPlanContingentItems);
  fIsModified:= not Result;
end;

function TPlanContingentGrid.SelectCell(ACol, ARow: Integer): Boolean;
begin
  if (ACol < 3) or (ARow = 0) then
    Options:= Options - [goEditing]
  else Options:= Options + [goEditing];
  Result:= inherited SelectCell(ACol, ARow);
end;

procedure TPlanContingentGrid.setPlanContingentItem(index: integer;
  const Value: TPlanContingentItem);
begin
  fPlanContingentItems[index]:= Value;
end;

procedure TPlanContingentGrid.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  if (ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] + ColWidths[5] + ColWidths[6] + Canvas.TextWidth('Специальность') + 17) >= ClientWidth then
    if (Message.CharCode = VK_LEFT) or (Message.CharCode = VK_RIGHT) or (Message.CharCode = VK_HOME) or (Message.CharCode = VK_END) then
      Invalidate;
end;

procedure TPlanContingentGrid.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  Invalidate;
end;

{ TPlanContingentItem }

constructor TPlanContingentItem.Create(ASpecIK: integer; ACourse, AGroupCount, ASubgroupCount, ABudget, AContract: integer);
begin
  fSpecIK:= ASpecIK;
  fCourse:= ACourse;
  fGroupCount:= AGroupCount;
  fSubgroupCount:= ASubgroupCount;
  fBudget:= ABudget;
  fContract:= AContract;
end;

//---------------------------------------

function TCalcUnit.CalcAllHour(MinContingent: integer; NormPerStudent,
  NormPerStudentForMin, MaxNormPerStudent: double): double;
begin
  if CurrentStudentValue < MinContingent then
  begin
    if (MaxStudentValue * NormPerStudentForMin * TasksInPlanCountForThisCalcUnit > MaxStudentValue * MaxNormPerStudent) and (MaxNormPerStudent <> 0) then
      Result:= CurrentStudentValue * (MaxNormPerStudent/TasksInPlanCountForThisCalcUnit) * TaskCountForThisPlanNumber * WeekInPlanCount + CurrentHourValue
    else
      Result:= CurrentStudentValue * NormPerStudentForMin * TaskCountForThisPlanNumber * WeekInPlanCount + CurrentHourValue;
  end
  else
  begin
    if (MaxStudentValue * NormPerStudent * TasksInPlanCountForThisCalcUnit > MaxStudentValue * MaxNormPerStudent) and (MaxNormPerStudent <> 0) then
      Result:= CurrentStudentValue * (MaxNormPerStudent/TasksInPlanCountForThisCalcUnit) * TaskCountForThisPlanNumber * WeekInPlanCount + CurrentHourValue
    else
      Result:= CurrentStudentValue * NormPerStudent * TaskCountForThisPlanNumber * WeekInPlanCount + CurrentHourValue;
  end;
end;

constructor TCalcUnit.Create(AOwner: TComponent; isCheck: boolean; ACalcUnitIK: integer; ARecordsInPlanCountForThisCalcUnit, ATasksInPlanCountForThisCalcUnit,
  AByPlanNumber, ATaskCountForThisPlanNumber, AMemberNumber: word; ACalcUnitName: string; ACurrentHourValue, AMaxHourValue, ABusyHourValue: double;
  ACurrentStudentValue, AMaxStudentValue, ABusyStudentValue, AWeekInPlanCount: integer; ACalcStudentsOnly: boolean);
begin
  fChechBox:= TCheckBox.Create(AOwner);
  fChechBox.Parent:= AOwner as TWinControl;
  fChechBox.Width:= 15;
  fChechBox.Checked:= isCheck;
  fChechBox.Caption:= '';
  fChechBox.Color:= clWindow;
  fChechBox.Visible:= false;
  fCalcUnitIK:= ACalcUnitIK;
  fRecordsInPlanCountForThisCalcUnit:= ARecordsInPlanCountForThisCalcUnit;
  fTasksInPlanCountForThisCalcUnit:= ATasksInPlanCountForThisCalcUnit;
  fByPlanNumber:= AByPlanNumber;
  fTaskCountForThisPlanNumber:= ATaskCountForThisPlanNumber;
  fMemberNumber:= AMemberNumber;
  fCalcUnitName:= ACalcUnitName;
  if (ACurrentHourValue = 0) then
    fCurrentHourValue:= AMaxHourValue
  else
    fCurrentHourValue:= ACurrentHourValue;
  if ACurrentStudentValue = 0 then
    fCurrentStudentValue:= AMaxStudentValue
  else
    fCurrentStudentValue:= ACurrentStudentValue;
  fMaxHourValue:= AMaxHourValue;
  fMaxStudentValue:= AMaxStudentValue;
  fBusyHourValue:= ABusyHourValue;
  fBusyStudentValue:= ABusyStudentValue;
  fWeekInPlanCount:= AWeekInPlanCount;
  fCalcStudentsOnly:= ACalcStudentsOnly;
end;

destructor TCalcUnit.Destroy;
begin
  if fChechBox <> nil then
    fChechBox.Free;
  inherited;
end;

function TCalcUnit.getBusyHourValue: double;
begin
  if fCalcStudentsOnly then
    Result:= 0
  else Result := fBusyHourValue;
end;

function TCalcUnit.getCurrentHourValue: double;
begin
  if fCalcStudentsOnly then
    Result:= 0
  else Result:= fCurrentHourValue;
end;

function TCalcUnit.getMaxHourValue: double;
begin
  if fCalcStudentsOnly then
    Result:= 0
  else Result:= fMaxHourValue;
end;

//--------------------------------------------------

procedure TTeacherAttach.AddCalcUnit(ACalcUnit: TCalcUnit);
begin
  RowCount:= RowCount + 1;
  fCalcUnits.Add(TCalcUnit.Create(self.Parent, ACalcUnit.CheckBox.Checked, ACalcUnit.CalcUnitIK, ACalcUnit.RecordsInPlanCountForThisCalcUnit, ACalcUnit.TasksInPlanCountForThisCalcUnit, ACalcUnit.ByPlanNumber, ACalcUnit.TaskCountForThisPlanNumber, ACalcUnit.MemberNumber,
    ACalcUnit.CalcUnitName, ACalcUnit.CurrentHourValue, ACalcUnit.MaxHourValue, ACalcUnit.BusyHourValue, ACalcUnit.CurrentStudentValue, ACalcUnit.MaxStudentValue, ACalcUnit.BusyStudentValue, ACalcUnit.WeekInPlanCount, ACalcUnit.CalcStudentsOnly));
  CalcUnits[fCalcUnits.Count-1].CheckBox.OnClick:= CalcUnitCheckBoxClick;
  Cells[1, RowCount-1]:= CalcUnits[fCalcUnits.Count-1].CalcUnitName;
  if IsManyInPlan = 1 then
    Cells[2, RowCount-1]:= IntToStr(CalcUnits[fCalcUnits.Count-1].ByPlanNumber);
  if IsManyInCommission = 1 then
    Cells[2 + IsManyInPlan, RowCount-1]:= IntToStr(CalcUnits[fCalcUnits.Count-1].MemberNumber);
  Cells[2 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStr(CalcUnits[fCalcUnits.Count-1].CurrentHourValue);
  Cells[3 + IsManyInCommission + IsManyInPlan, RowCount-1]:= IntToStr(CalcUnits[fCalcUnits.Count-1].CurrentStudentValue);
  Cells[4 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStrF(CalcUnits[fCalcUnits.Count-1].CalcAllHour(fMinContingent, fNormPerStudent, fNormPerStudentForMin, fMaxNormPerStudent), ffFixed, 10, 2);

  {if CalcUnits[fCalcUnits.Count-1].CurrentStudentValue < fMinContingent then
  begin
    if (CalcUnits[fCalcUnits.Count-1].MaxStudentValue * fNormPerStudentForMin * CalcUnits[fCalcUnits.Count-1].InPlanCountForThisCalcUnit > CalcUnits[fCalcUnits.Count-1].MaxStudentValue * fMaxNormPerStudent) and (fMaxNormPerStudent <> 0) then
      Cells[4 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStrF(CalcUnits[fCalcUnits.Count-1].CurrentStudentValue * (fMaxNormPerStudent/CalcUnits[fCalcUnits.Count-1].InPlanCountForThisCalcUnit) + CalcUnits[fCalcUnits.Count-1].CurrentHourValue, ffFixed, 10, 2)
    else
      Cells[4 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStrF(CalcUnits[fCalcUnits.Count-1].CurrentStudentValue * fNormPerStudentForMin + CalcUnits[fCalcUnits.Count-1].CurrentHourValue, ffFixed, 10, 2);
  end
  else
  begin
    if (CalcUnits[fCalcUnits.Count-1].MaxStudentValue * fNormPerStudent * CalcUnits[fCalcUnits.Count-1].InPlanCountForThisCalcUnit > CalcUnits[fCalcUnits.Count-1].MaxStudentValue * fMaxNormPerStudent) and (fMaxNormPerStudent <> 0) then
      Cells[4 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStrF(CalcUnits[fCalcUnits.Count-1].CurrentStudentValue * (fMaxNormPerStudent/CalcUnits[fCalcUnits.Count-1].InPlanCountForThisCalcUnit) + CalcUnits[fCalcUnits.Count-1].CurrentHourValue, ffFixed, 10, 2)
    else
      Cells[4 + IsManyInCommission + IsManyInPlan, RowCount-1]:= FloatToStrF(CalcUnits[fCalcUnits.Count-1].CurrentStudentValue * fNormPerStudent + CalcUnits[fCalcUnits.Count-1].CurrentHourValue, ffFixed, 10, 2);
  end;   }
end;

procedure TTeacherAttach.AllCheckBoxClick(Sender: TObject);
var
  i: integer;
begin
  case fAllCheckBox.State of
  cbChecked:
    for i:= 0 to fCalcUnits.Count-1 do
      CalcUnits[i].CheckBox.Checked:= true;
  cbUnchecked:
    for i:= 0 to fCalcUnits.Count-1 do
      CalcUnits[i].CheckBox.Checked:= false;
  end;
end;

procedure TTeacherAttach.AssignCalcUnits(value: TObjectList);
var
  i: integer;
begin
  Clear;
  IsManyInPlan:= 0;
  IsManyInCommission:= 0;
  if (value <> nil) then
  begin
    for i:= 0 to value.Count-1 do
      if ((value[i] as TCalcUnit).MemberNumber > 1) and (IsManyInCommission = 0) then
      begin
        IsManyInCommission:= 1;  // т.е. если есть член с номером > 1, то значит и коммиссия имеет более 1 члена
        break;
      end;
    for i:= 0 to value.Count-1 do
      if ((value[i] as TCalcUnit).RecordsInPlanCountForThisCalcUnit > 1) and (IsManyInPlan = 0) then
      begin
        IsManyInPlan:= 1;
        break;
      end;
    for i:= 0 to value.Count-1 do
      AddCalcUnit(value[i] as TCalcUnit);
  end;
  UpdateAllCheckBox;
end;

procedure TTeacherAttach.CalcUnitCheckBoxClick(Sender: TObject);
begin
  if Assigned(FOnCheckBoxChange) then
    FOnCheckBoxChange((Sender as TCheckBox));
  UpdateAllCheckBox;
end;

procedure TTeacherAttach.UpdateAllCheckBox;
var
  i, n: integer;
begin
  n:= 0;
  for i:= 0 to fCalcUnits.Count-1 do
    if CalcUnits[i].CheckBox.Checked then inc(n);
  if n = 0 then fAllCheckBox.State:= cbUnchecked;
  if n = fCalcUnits.Count then fAllCheckBox.State:= cbChecked;
  if (n <> 0) and (n <> fCalcUnits.Count) then fAllCheckBox.State:= cbGrayed;
end;

procedure TTeacherAttach.Clear;
begin
  IsManyInPlan:= 1;
  IsManyInCommission:= 1;
  RowCount:= 1;
  if Assigned(fCalcUnits) then fCalcUnits.Clear;
  Invalidate;
end;

constructor TTeacherAttach.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle:= bsNone;
  Parent:= TWinControl(AOwner);
  Align:= alClient;
  fCalcUnits:= TObjectList.Create(true);
  FixedCols:= 0;
  FixedRows:= 0;
  ColCount:= 7;
  RowCount:= 1;
  DefaultRowHeight:= 20;
  fAllCheckBox:= TCheckBox.Create(self);
  fAllCheckBox.Width:= 15;
  fAllCheckBox.Checked:= false;
  fAllCheckBox.Caption:= '';
  fAllCheckBox.Parent:= self.Parent;
  fAllCheckBox.Color:= clWindow;
  fAllCheckBox.OnClick:= AllCheckBoxClick;
  fAllCheckBox.Visible:= false;
  RowHeights[0]:= 22;
  ColWidths[0]:= 30;
  IsManyInPlan:= 1;
  IsManyInCommission:= 1;
  Clear;
end;

destructor TTeacherAttach.Destroy;
begin
  Clear;
  if Assigned(fCalcUnits) then fCalcUnits.Free;
  inherited;
end;

procedure TTeacherAttach.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  DrawInfo: TGridDrawInfo;
  i, colWidthSum: integer;
begin
  Canvas.MoveTo(Arect.Left, ARect.Top);
  if (ARow = 0) then
    Canvas.Brush.Color:= clBtnFace
  else
    Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);

  colWidthSum:= 0;
  for I := 2 to ColCount - 1 do
    colWidthSum:= colWidthSum + ColWidths[i];
  ColWidths[1]:= ClientWidth - ColWidths[0] - colWidthSum - ColCount;

  fAllCheckBox.Color:= clBtnFace;

  if (ARow = 0) and (ACol >= 0) then
  begin
    Canvas.Pen.Color:= clBtnHighlight;
    Canvas.MoveTo(ARect.Right-1, ARect.Top+1);
    if ACol = 0 then
    begin
       Canvas.LineTo(ARect.Left+1, ARect.Top+1);
       Canvas.LineTo(ARect.Left+1, ARect.Bottom);
    end
    else
    begin
       Canvas.LineTo(ARect.Left, ARect.Top+1);
       Canvas.LineTo(ARect.Left, ARect.Bottom);
    end;

    Canvas.Pen.Color:= clBtnShadow;
    Canvas.MoveTo(ARect.Right, ARect.Top);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Left, ARect.Bottom);

    if ACol = 1 then Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[ACol]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[ACol]))/2), TAColNames[ACol]);
    if (ACol = 2) then      // проверям столбец "№ работы"
    begin
      if (IsManyInPlan = 1) then
        Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[6]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[6]))/2), TAColNames[6])
      else Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[2]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[2]))/2), TAColNames[2])
    end;
    if (ACol = 2 + IsManyInPlan) then     // проверям столбец "№ в комиссии"
    begin
      if (IsManyInCommission = 1) then
        Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[5]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[5]))/2), TAColNames[5])
      else Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[2]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[2]))/2), TAColNames[2])
    end;
    if (ACol > 2 + IsManyInPlan) then Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(TAColNames[ACol - IsManyInPlan - IsManyInCommission]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(TAColNames[ACol - IsManyInPlan - IsManyInCommission]))/2), TAColNames[ACol - IsManyInPlan - IsManyInCommission]);
  end;
  if (ARow = 0) and (ACol = 0) then
  begin
    fAllCheckBox.Top:= Top + CellRect(0, 0).Top + round((RowHeights[0] - fAllCheckBox.Height)/2) + 1;
    fAllCheckBox.Left:= Left + CellRect(0, 0).Left + round((ColWidths[0] - fAllCheckBox.Width)/2) + 1;
    fAllCheckBox.Visible:= fCalcUnits.Count > 0;
    fAllCheckBox.Color:= Color;
  end;
  if (ACol = 0) and (ARow > 0) then
  begin
    if (fCalcUnits.Count > 0) then
    begin
      CalcDrawInfo(DrawInfo);
      for i:= 0 to fCalcUnits.Count-1 do
        if ((i+1) >= DrawInfo.Vert.FirstGridCell) and ((i+1) <= DrawInfo.Vert.LastFullVisibleCell) then
        begin
          CalcUnits[i].CheckBox.Top:= Top + CellRect(ACol, i+1).Top + round((DefaultRowHeight - CalcUnits[i].CheckBox.Height)/2) + 1;
          CalcUnits[i].CheckBox.Left:= Left + CellRect(ACol, i+1).Left + round((ColWidths[0] - CalcUnits[i].CheckBox.Width)/2) + 1;
          CalcUnits[i].CheckBox.Visible:= true;
        end
        else CalcUnits[i].CheckBox.Visible:= false;
    end
    else RowCount:= 1;
  end;
  if (ACol > 0) and (ARow > 0) then
    inherited DrawCell(ACol, ARow, ARect, AState);
end;

function TTeacherAttach.getCalcUnit(index: integer): TCalcUnit;
begin
  Result:= fCalcUnits[index] as TCalcUnit;
end;

function TTeacherAttach.GetCalcUnits: TObjectList;
begin
  Result:= fCalcUnits;
end;

function TTeacherAttach.getCalcUnitsCount: integer;
begin
  Result:= fCalcUnits.Count;
end;

function TTeacherAttach.GetEditText(ACol, ARow: Integer): string;
begin
  Result:= inherited GetEditText(ACol, ARow);
  isCellTextChange:= true;
  curRow:= ARow;
  curCol:= ACol;
end;

procedure TTeacherAttach.Paint;
begin
  inherited Paint;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
  Canvas.Pen.Color:= clBtnHighlight;
  Canvas.MoveTo(0, Height);
  Canvas.LineTo(Width, Height);
  Canvas.LineTo(Width, 0);
end;

function TTeacherAttach.SelectCell(ACol, ARow: Integer): Boolean;
begin
  if (ACol = 0) then
  begin
    Result:= false;
    exit;
  end;
  if ARow = 0 then
  begin
    Result:= false;
    exit;
  end;
  if (ACol = 0) or (ACol = 1) or (ACol = 1 + IsManyInPlan) or (ACol = 1 + IsManyInCommission + IsManyInPlan) or (ACol = ColCount-1) then
    Options:= Options - [goEditing]
  else
    Options:= Options + [goEditing];

  if (ACol = 2 + IsManyInCommission + IsManyInPlan) and (fNormPerUnit = 0) then
    Options:= Options - [goEditing];
  // пересчитать
  if ((curCol = 2 + IsManyInCommission + IsManyInPlan) or (curCol = 3 + IsManyInCommission + IsManyInPlan)) and (curRow > 0) then
    if isCellTextChange then
    begin
      if (curCol = 2 + IsManyInCommission + IsManyInPlan) then
      begin
        if StrToFloat(Cells[curCol, curRow]) > CalcUnits[curRow-1].MaxHourValue then
          Cells[curCol, curRow]:= FloatToStr(CalcUnits[curRow-1].MaxHourValue);
        CalcUnits[curRow-1].CurrentHourValue:= StrToFloat(Cells[curCol, curRow]);
      end
      else
      begin
        if StrToInt(Cells[curCol, curRow]) > CalcUnits[curRow-1].MaxStudentValue then
          Cells[curCol, curRow]:= IntToStr(CalcUnits[curRow-1].MaxStudentValue);
        CalcUnits[curRow-1].CurrentStudentValue:= StrToInt(Cells[curCol, curRow]);
      end;
      Cells[4 + IsManyInCommission + IsManyInPlan, curRow]:= FloatToStrF(CalcUnits[curRow-1].CalcAllHour(fMinContingent, fNormPerStudent, fNormPerStudentForMin, fMaxNormPerStudent), ffFixed, 10, 2);

      {if CalcUnits[curRow-1].CurrentStudentValue < fMinContingent then
      begin
        if (CalcUnits[curRow-1].MaxStudentValue * fNormPerStudentForMin * CalcUnits[curRow-1].InPlanCountForThisCalcUnit > CalcUnits[curRow-1].MaxStudentValue * fMaxNormPerStudent) and (fMaxNormPerStudent <> 0) then
          Cells[4 + IsManyInCommission + IsManyInPlan, curRow]:= FloatToStrF(CalcUnits[curRow-1].CurrentStudentValue * (fMaxNormPerStudent/CalcUnits[curRow-1].InPlanCountForThisCalcUnit) + CalcUnits[curRow-1].CurrentHourValue, ffFixed, 10, 2)
        else
          Cells[4 + IsManyInCommission + IsManyInPlan, curRow]:= FloatToStrF(CalcUnits[curRow-1].CurrentStudentValue * fNormPerStudentForMin + CalcUnits[curRow-1].CurrentHourValue, ffFixed, 10, 2);
      end
      else
      begin
        if (CalcUnits[curRow-1].MaxStudentValue * fNormPerStudent * CalcUnits[curRow-1].InPlanCountForThisCalcUnit > CalcUnits[curRow-1].MaxStudentValue * fMaxNormPerStudent) and (fMaxNormPerStudent <> 0) then
          Cells[4 + IsManyInCommission + IsManyInPlan, curRow]:= FloatToStrF(CalcUnits[curRow-1].CurrentStudentValue * (fMaxNormPerStudent/CalcUnits[curRow-1].InPlanCountForThisCalcUnit) + CalcUnits[curRow-1].CurrentHourValue, ffFixed, 10, 2)
        else
          Cells[4 + IsManyInCommission + IsManyInPlan, curRow]:= FloatToStrF(CalcUnits[curRow-1].CurrentStudentValue * fNormPerStudent + CalcUnits[curRow-1].CurrentHourValue, ffFixed, 10, 2);
      end;   }

      CalcUnitCheckBoxClick(nil);
      isCellTextChange:= false;
      curRow:= -1;
      curCol:= -1;
    end;
  Result:= inherited SelectCell(ACol, ARow);
end;

procedure TTeacherAttach.setCalcUnit(index: integer; Value: TCalcUnit);
begin
  fCalcUnits[index]:= Value;
end;

procedure TTeacherAttach.setIsManyInCommission(const Value: byte);
var
  i: integer;
begin
  fIsManyInCommission := Value;
  ColCount:= 5 + fIsManyInPlan + fIsManyInCommission;
  for i := 1 to 4 do
    ColWidths[i + fIsManyInCommission + IsManyInPlan]:= Canvas.TextWidth(TAColNames[i]) + 10;
  if IsManyInPlan = 1 then
    ColWidths[2]:= Canvas.TextWidth(TAColNames[6]) + 10;
  if fIsManyInCommission = 1 then
    ColWidths[2 + IsManyInPlan]:= Canvas.TextWidth(TAColNames[5]) + 10;
end;

procedure TTeacherAttach.setIsManyInPlan(const Value: byte);
var
  i: integer;
begin
  fIsManyInPlan := Value;
  ColCount:= 5 + fIsManyInPlan + fIsManyInCommission;
  for i := 1 to 4 do
    ColWidths[i + fIsManyInCommission + IsManyInPlan]:= Canvas.TextWidth(TAColNames[i]) + 10;
  if IsManyInPlan = 1 then
    ColWidths[2]:= Canvas.TextWidth(TAColNames[6]) + 10;
  if fIsManyInCommission = 1 then
    ColWidths[2 + IsManyInPlan]:= Canvas.TextWidth(TAColNames[5]) + 10;
end;

procedure TTeacherAttach.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  Invalidate;
end;

procedure TTeacherAttach.WMLButtonDown(var Message: TWMLButtonDown);
var
  sCol, sRow: integer;
begin
  MouseToCell(Message.XPos,Message.YPos, sCol, sRow);
  if (sCol > -1) and (sRow > 0) then
  begin
    if (sCol > 0) then inherited
    else
    begin
      if (fCalcUnits.Count > 0) then
        CalcUnits[sRow-1].CheckBox.Checked:= not CalcUnits[sRow-1].CheckBox.Checked;
    end;
  end;
end;

procedure TTeacherAttach.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  Invalidate;
end;

procedure TTeacherAttach.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  Invalidate;
end;

{ TTakeNagrUnit }

procedure TTakeNagrUnit.AssignTakeCalcUnits(Value: TList);
var
  i: integer;
  tempCU: TCalcUnit;
begin
  fTakeCalcUnits.Clear;
  for I := 0 to Value.Count - 1 do
  begin
    tempCU:= Value[i];
    fTakeCalcUnits.Add(TCalcUnit.Create(nil, tempCU.CheckBox.Checked, tempCU.CalcUnitIK, tempCU.RecordsInPlanCountForThisCalcUnit, tempCU.TasksInPlanCountForThisCalcUnit, tempCU.ByPlanNumber, tempCU.TaskCountForThisPlanNumber, tempCU.MemberNumber, tempCU.CalcUnitName, tempCU.CurrentHourValue, tempCU.MaxHourValue, tempCU.BusyHourValue, tempCU.CurrentStudentValue, tempCU.MaxStudentValue, tempCU.BusyStudentValue, tempCU.WeekInPlanCount, tempCU.CalcStudentsOnly));
  end;
  inherited;
end;

constructor TTakeNagrUnit.Create(AContentPlanNagrIK, AVidZanyatIK, AVidNagruzkiIK: integer; AVidZanyatName, AVidNagruzkiName: string; ANormPerUnit, ANormPerStudent, AMaxNormPerStudent: double; AMinContingent: integer; ANormPerUnitForMin, ANormPerStudentForMin: double; ATakeCalcUnits: TList);
begin
  fTakeCalcUnits:= TObjectList.Create(true);
  fIsRemoved:= false;
  fContentPlanNagrIK:= AContentPlanNagrIK;
  fVidZanyatIK:= AVidZanyatIK;
  fVidNagruzkiIK:= AVidNagruzkiIK;
  fVidZanyatName:= AVidZanyatName;
  fVidNagruzkiName:= AVidNagruzkiName;
  fNormPerUnit:= ANormPerUnit;
  fNormPerStudent:= ANormPerStudent;
  fMaxNormPerStudent:= AMaxNormPerStudent;
  fMinContingent:= AMinContingent;
  fNormPerUnitForMin:= ANormPerUnitForMin;
  fNormPerStudentForMin:= ANormPerStudentForMin;
//  fInPlanCount:= AInPlanCount;
  if (ATakeCalcUnits <> nil) then
    AssignTakeCalcUnits(ATakeCalcUnits);
end;

destructor TTakeNagrUnit.Destroy;
begin
  if Assigned(fTakeCalcUnits) then FreeAndNil(fTakeCalcUnits);
end;

function TTakeNagrUnit.getTakeCalcUnit(index: integer): TCalcUnit;
begin
  Result:= fTakeCalcUnits[index] as TCalcUnit;
end;

function TTakeNagrUnit.GetTakeCalcUnits: TObjectList;
begin
  Result:= fTakeCalcUnits;
end;

procedure TTakeNagrUnit.setTakeCalcUnit(index: integer; const Value: TCalcUnit);
begin
  fTakeCalcUnits[index]:= Value;
end;

//---------------------

constructor TFactEvent.Create(AEventStart, AEventStop: TDateTime);
begin
  inherited Create;
  fEventStart:= AEventStart;
  fEventStop:= AEventStop;
  fCheckBox:= TCheckBox.Create(nil);
  fCheckBox.Visible:= false;
  fCheckBox.Width:= 15;
  fCheckBox.Caption:= '';
end;

//------------------------

procedure TFactGrid.AddLine(EventNumber: integer);
var
  y,m,d: word;
begin
  RowCount:= RowCount + 1;
  DecodeDate(EventDates[EventNumber].EventStart, y, m, d);
  if isAuditor then
    Cells[1, RowCount-1]:=  IntToStr(d) + ' ' + MonthNames[m] + ' ' + IntToStr(y) + ' (' + FormatDateTime('h:mm', EventDates[EventNumber].EventStart) + ' - ' + FormatDateTime('h:mm', EventDates[EventNumber].EventStop) + ')'
  else
    Cells[1, RowCount-1]:= IntToStr(d) + ' ' + MonthNames[m] + ' ' + IntToStr(y) + ' (' + FormatDateTime('h:mm', EventDates[EventNumber].EventStart) + ')';
  Cells[2, RowCount-1]:= IntToStr(EventDates[EventNumber].StudentCount);

 // EventDates[RowCount-2].GroupHour:= GroupHour;
 // EventDates[RowCount-2].StudentCount:= StudCount;

 // EventDates[EventNumber].CheckBox.Checked:= isCheck;
 { EventDates[EventNumber].CheckBox.Parent:= self.Parent;
  EventDates[EventNumber].CheckBox.Color:= clWindow;
  EventDates[EventNumber].CheckBox.OnClick:= FactCheckBoxClick;      }

  Cells[3, RowCount-1]:= FloatToStrF(EventDates[EventNumber].GroupHour, ffFixed, 10, 2);
  if EventDates[RowCount-2].StudentCount >= fMinContingent then
    Cells[4, RowCount-1]:= FloatToStrF((EventDates[EventNumber].StudentCount * fNormPerStudent + EventDates[EventNumber].GroupHour) * fTaskCount * fWeekInPlanCount, ffFixed, 10, 2)
  else
    Cells[4, RowCount-1]:= FloatToStrF((EventDates[EventNumber].StudentCount * fNormPerStudentForMin + EventDates[EventNumber].GroupHour) * fTaskCount * fWeekInPlanCount, ffFixed, 10, 2);

  Row:= RowCount-1;
  Col:= 1;
end;

procedure TFactGrid.AddNewEvent(isAddLine: boolean; StartTime, StopTime: TDateTime; StudentCount: integer; GroupHour: double);
var
  i: integer;
begin
  i:= fEventDates.Add(TFactEvent.Create(StartTime, StopTime));
  EventDates[i].StudentCount:= StudentCount;
  EventDates[i].GroupHour:= GroupHour;
  EventDates[i].CheckBox.Checked:= true;
  EventDates[i].CheckBox.Parent:= self.Parent;
  EventDates[i].CheckBox.Color:= clWindow;
  EventDates[i].CheckBox.OnClick:= FactCheckBoxClick;
  if isAddLine then AddLine(i);
end;

procedure TFactGrid.AllCheckBoxClick(Sender: TObject);
var
  i: integer;
begin
  case fAllCheckBox.State of
  cbChecked:
    for i:= 0 to fEventDates.Count-1 do
      EventDates[i].CheckBox.Checked:= true;
  cbUnchecked:
    for i:= 0 to fEventDates.Count-1 do
      EventDates[i].CheckBox.Checked:= false;
  end;
end;

procedure TFactGrid.AssignEventDates(value: TObjectList);
var
  i, n: integer;
begin
  fEventDates.Clear;
  if value <> nil then
    for i:= 0 to value.Count-1 do
    begin
      n:= fEventDates.Add(TFactEvent.Create(value[i] as TFactEvent));
      EventDates[n].CheckBox.Parent:= self.Parent;
      EventDates[n].CheckBox.Color:= clWindow;
      EventDates[n].CheckBox.OnClick:= FactCheckBoxClick;
    end;
end;

procedure TFactGrid.Clear;
var
  i: integer;
begin
  RowCount:= 1;
  if Assigned(fEventDates) then
  begin
//    for i:= 0 to fEventDates.Count-1 do
//      EventDates[i].CheckBox.Free;
    fEventDates.Clear;
  end;
  fNormPerUnit:= 0;
  fNormPerStudent:= 0;
  Invalidate;
  Parent.Invalidate;
end;

constructor TFactGrid.Create(AOwner: TComponent);
begin
  inherited;
  BorderStyle:= bsNone;
  isCellTextChange:= false;
  curRow:= -1;
  curCol:= -1;
  FixedCols:= 0;
  FixedRows:= 0;
  fEventDates:= TObjectList.Create(true);
  ColCount:= 5;
  RowCount:= 1;
  DefaultRowHeight:= 18;
  ColWidths[0]:= 30;
  ColWidths[1]:= 180;
  ColWidths[2]:= 100;
  ColWidths[3]:= 100;
  ColWidths[4]:= 80;
  RowHeights[0]:= 22;
  fAllCheckBox:= TCheckBox.Create(self);
  fAllCheckBox.Width:= 15;
  fAllCheckBox.Checked:= false;
  fAllCheckBox.Caption:= '';
  fAllCheckBox.Parent:= self.Parent;
  fAllCheckBox.Color:= clWindow;
  fAllCheckBox.OnClick:= AllCheckBoxClick;
  fAllCheckBox.Visible:= false;
end;

procedure TFactGrid.DeleteLine(index: integer);
begin
  DeleteRow(index);
//  EventDates[index-1].CheckBox.Free;
  fEventDates.Delete(index-1);
end;

destructor TFactGrid.Destroy;
begin
  Clear;
  if Assigned(fEventDates) then fEventDates.Free;
  inherited;
end;

procedure TFactGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
  DrawInfo: TGridDrawInfo;
  i: integer;
const
  colNames: array[1..4] of string = ('Дата события', 'Кол-во студентов','Часов на р.е.','Всего часов');
begin
  Canvas.MoveTo(Arect.Left, ARect.Top);
  if (ARow = 0) then
    Canvas.Brush.Color:= clBtnFace
  else Canvas.Brush.Color:= self.Color;
  Canvas.FillRect(ARect);

  ColWidths[1]:= ClientWidth - ColWidths[0] - ColWidths[2] - ColWidths[3] - ColWidths[4] - 5;

  if (ARow = 0) and (ACol >= 0) then
  begin
    Canvas.Pen.Color:= clBtnHighlight;
    Canvas.MoveTo(ARect.Right-1, ARect.Top+1);
    if ACol = 0 then
    begin
       Canvas.LineTo(ARect.Left+1, ARect.Top+1);
       Canvas.LineTo(ARect.Left+1, ARect.Bottom);
    end
    else
    begin
       Canvas.LineTo(ARect.Left, ARect.Top+1);
       Canvas.LineTo(ARect.Left, ARect.Bottom);
    end;

    Canvas.Pen.Color:= clBtnShadow;
    Canvas.MoveTo(ARect.Right, ARect.Top);
    Canvas.LineTo(ARect.Right, ARect.Bottom);
    Canvas.LineTo(ARect.Left, ARect.Bottom);
    Canvas.Font.Color:= clBlack;

    if (ACol <> 0) then
      Canvas.TextOut(ARect.Left + round((ColWidths[ACol] - Canvas.TextWidth(colNames[ACol]))/2), ARect.Top + round((RowHeights[0] - Canvas.TextHeight(colNames[ACol]))/2), colNames[ACol]);
  end;
  if (ARow = 0) and (ACol = 0) then
  begin
    fAllCheckBox.Top:= Top + CellRect(0, 0).Top + round((RowHeights[0] - fAllCheckBox.Height)/2) + 1;
    fAllCheckBox.Left:= Left + CellRect(0, 0).Left + round((ColWidths[0] - fAllCheckBox.Width)/2) + 1;
    fAllCheckBox.Visible:= fEventDates.Count > 0;
    fAllCheckBox.Color:= clBtnFace;
  end;
  if (ACol = 0) and (ARow > 0) then
  begin
    if (fEventDates.Count > 0) then
    begin
      CalcDrawInfo(DrawInfo);
      for i:= 0 to fEventDates.Count-1 do
        if ((i+1) >= DrawInfo.Vert.FirstGridCell) and ((i+1) <= DrawInfo.Vert.LastFullVisibleCell) then
        begin
          EventDates[i].CheckBox.Top:= Top + CellRect(ACol, i+1).Top + round((DefaultRowHeight - EventDates[i].CheckBox.Height)/2) + 1;
          EventDates[i].CheckBox.Left:= Left + CellRect(ACol, i+1).Left + round((ColWidths[0] - EventDates[i].CheckBox.Width)/2) + 1;
          EventDates[i].CheckBox.Visible:= true;
        end
        else EventDates[i].CheckBox.Visible:= false;
    end;
  end;
  if (ACol > 0) and (ARow > 0) then
    inherited DrawCell(ACol, ARow, ARect, AState);
end;

procedure TFactGrid.FactCheckBoxClick(Sender: TObject);
begin
  if Assigned(FOnCheckBoxChange) then
    FOnCheckBoxChange((Sender as TCheckBox));
  UpdateAllCheckBox;
end;

function TFactGrid.GetEditText(ACol, ARow: Integer): string;
begin
  Result:= inherited GetEditText(ACol, ARow);
  isCellTextChange:= true;
  curRow:= ARow;
  curCol:= ACol;
end;

function TFactGrid.getEventDate(index: integer): TFactEvent;
begin
  Result:= fEventDates[index] as TFactEvent;
end;

function TFactGrid.GetEventDates: TObjectList;
begin
  Result:= fEventDates;
end;

function TFactGrid.getEventDatesCount: integer;
begin
  Result:= fEventDates.Count;
end;

procedure TFactGrid.Paint;
begin
  inherited Paint;
  Canvas.Pen.Color:= clBtnShadow;
  Canvas.MoveTo(Width, 0);
  Canvas.LineTo(0, 0);
  Canvas.LineTo(0, Height-1);
  Canvas.Pen.Color:= clBtnHighlight;
  Canvas.MoveTo(0, Height);
  Canvas.LineTo(Width, Height);
  Canvas.LineTo(Width, 0);
end;

function TFactGrid.SelectCell(ACol, ARow: Integer): Boolean;
var
  isNotEdit: boolean;
begin
  if (ACol = 0) then
  begin
    Result:= false;
    exit;
  end;
  if ARow = 0 then
  begin
    Result:= false;
    exit;
  end;
  if IsAuditor then isNotEdit:= (ACol <> 2)
  else
  begin
    if NormPerUnit=0 then
      isNotEdit:= (ACol = 0) or (ACol = 1) or (ACol = 4)
    else
      isNotEdit:= (ACol <> 2);
  end;
  if isNotEdit then
    Options:= Options - [goEditing]
  else
    Options:= Options + [goEditing];
  if IsAuditor then isNotEdit:= (curCol = 2) and (curRow > -1)
  else isNotEdit:= ((curCol = 2) or ((curCol = 3))) and (curRow > -1);
  if isNotEdit then
    if isCellTextChange then
    begin
      if (curCol = 2) then
        EventDates[curRow-1].StudentCount:= StrToInt(Cells[curCol, curRow])
      else
        EventDates[curRow-1].GroupHour:= StrToFloat(Cells[curCol, curRow]);
      if EventDates[curRow-1].StudentCount < fMinContingent then
        Cells[4, curRow]:= FloatToStrF((EventDates[curRow-1].StudentCount * fNormPerStudentForMin + EventDates[curRow-1].GroupHour) * fTaskCount * fWeekInPlanCount, ffFixed, 10, 2)
      else
        Cells[4, curRow]:= FloatToStrF((EventDates[curRow-1].StudentCount * fNormPerStudent + EventDates[curRow-1].GroupHour) * fTaskCount * fWeekInPlanCount, ffFixed, 10, 2);
      isCellTextChange:= false;
      curRow:= -1;
      curCol:= -1;
    end;
  Result:= inherited SelectCell(ACol, ARow);
end;

procedure TFactGrid.setEventDate(index: integer; Value: TFactEvent);
begin
  if (index >= 0) and (index < fEventDates.Count) then
    fEventDates[index]:= Value;
end;

procedure TFactGrid.UpdateAllCheckBox;
var
  i, n: integer;
begin
  n:= 0;
  for i:= 0 to fEventDates.Count-1 do
    if EventDates[i].CheckBox.Checked then inc(n);
  if n = 0 then fAllCheckBox.State:= cbUnchecked;
  if n = fEventDates.Count then fAllCheckBox.State:= cbChecked;
  if (n <> 0) and (n <> fEventDates.Count) then fAllCheckBox.State:= cbGrayed;
end;

procedure TFactGrid.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  Invalidate;
end;

procedure TFactGrid.WMLButtonDown(var Message: TWMLButtonDown);
var
  sCol, sRow: integer;
begin
  MouseToCell(Message.XPos,Message.YPos, sCol, sRow);
  if (sCol > -1) and (sRow > 0) then
  begin
    if (sCol > 0) then inherited
    else
    begin
      if (fEventDates.Count > 0) then
        EventDates[sRow-1].CheckBox.Checked:= not EventDates[sRow-1].CheckBox.Checked;
    end;
  end;
end;

procedure TFactGrid.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  Invalidate;
end;

procedure TFactGrid.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  Invalidate;
end;

procedure TFactEvent.Assign(Value: TFactEvent);
begin
  fEventStart:= Value.EventStart;
  fEventStop:= Value.EventStop;
  fStudentCount:= Value.StudentCount;
  fGroupHour:= Value.GroupHour;
  fCheckBox.Checked:= Value.CheckBox.Checked;
end;

constructor TFactEvent.Create(Value: TFactEvent);
begin
  fCheckBox:= TCheckBox.Create(nil);
  fCheckBox.Visible:= false;
  fCheckBox.Width:= 15;
  fCheckBox.Caption:= '';
  Assign(Value);
end;

destructor TFactEvent.Destroy;
begin
  if Assigned(fCheckBox) then
    FreeAndNil(fCheckBox);
  inherited;
end;

{ TTakeFactNagrItem }

function TTakeFactNagrItem.AddTakeFactNagrVZItem(Value: TTakeFactNagrVZItem): TTakeFactNagrVZItem;
begin
  Result:= fTakeVZItems[fTakeVZItems.Add(TTakeFactNagrVZItem.Create(Value.PrepodPlanNagrIK, Value.CalcUnitIK, Value.CalcUnitName, Value.ByPlanNumber, Value.TaskCount, Value.DefStudentCount, Value.GetEventList, false, Value.WeekInPlanCount, Value.CalcStudentsOnly))] as TTakeFactNagrVZItem;
end;

procedure TTakeFactNagrVZItem.AssingEventList(AEventList: TObjectList);
var
  i: integer;
begin
  fEventList.Clear;
  if AEventList <> nil then
    for I := 0 to AEventList.Count - 1 do
      fEventList.Add(TFactEvent.Create(AEventList[i] as TFactEvent));
end;

constructor TTakeFactNagrVZItem.Create(APrepodPlanNagrIK, ACalcUnitIK: integer; ACalcUnitName: string; AByPlanNumber, ATaskCount, ADefStudentCount: integer; AEventList: TObjectList; needDestroyList: boolean; AWeekInPlanCount: integer; ACalcStudentsOnly: boolean);
begin
  fIsRemoved:= false;
  fEventList:= TObjectList.Create(true);
  fPrepodPlanNagrIK:= APrepodPlanNagrIK;
  fCalcUnitIK:= ACalcUnitIK;
  fCalcUnitName:= ACalcUnitName;
  fByPlanNumber:= AByPlanNumber;
  fTaskCount:= ATaskCount;
  fDefStudentCount:= ADefStudentCount;
  fWeekInPlanCount:= AWeekInPlanCount;
  fCalcStudentsOnly:= ACalcStudentsOnly;
  if AEventList <> nil then
  begin
    AssingEventList(AEventList);
    if needDestroyList then AEventList.Free;
  end;
end;

destructor TTakeFactNagrVZItem.Destroy;
begin
  if Assigned(fEventList) then FreeAndNil(fEventList);
  inherited;
end;

constructor TTakeFactNagrVZItem.Create(Value: TTakeFactNagrVZItem);
begin
  fEventList:= TObjectList.Create(true);
  fIsRemoved:= Value.IsRemoved;
  fPrepodPlanNagrIK:= Value.PrepodPlanNagrIK;
  fNormPerUnit:= Value.NormPerUnit;
  fNormPerStudent:= Value.NormPerStudent;
  fNormPerUnitForMin:= Value.NormPerUnitForMin;
  fNormPerStudentForMin:= Value.NormPerStudentForMin;
  fCalcUnitName:= Value.CalcUnitName;
  fTaskCount:= Value.TaskCount;
  fByPlanNumber:= Value.ByPlanNumber;
  fDefStudentCount:= Value.DefStudentCount;
  fCalcUnitIK:= Value.CalcUnitIK;
  fWeekInPlanCount:= Value.WeekInPlanCount;
  AssingEventList(Value.GetEventList);
end;

function TTakeFactNagrVZItem.getEvent(index: integer): TFactEvent;
begin
  Result:= fEventList[index] as TFactEvent;
end;

function TTakeFactNagrVZItem.GetEventList: TObjectList;
begin
  Result:= fEventList;
end;

function TTakeFactNagrVZItem.getNormPerUnit: double;
begin
  if fCalcStudentsOnly then
    Result:= 0
  else Result := fNormPerUnit;
end;

procedure TTakeFactNagrVZItem.setEvent(index: integer; const Value: TFactEvent);
begin
  fEventList[index]:= Value;
end;

constructor TTakeFactNagrItem.Create(AContentPlanNagrIK, AVidZanyatIK, AVidZanyatTypeIK, AVidZanyatTypeByTimeIK,
  AVidNagruzkiIK: integer);
begin
  fIsRemoved:= false;
  fTakeVZItems:= TObjectList.Create(true);
  fContentPlanNagrIK:= AContentPlanNagrIK;
  VidZanyatIK:= AVidZanyatIK;
  fVidNagruzkiIK:= AVidNagruzkiIK;
  fVidZanyatTypeIK:= AVidZanyatTypeIK;
  fVidZanyatTypeByTimeIK:= AVidZanyatTypeByTimeIK;
end;

constructor TTakeFactNagrItem.Create(Value: TTakeFactNagrItem);
begin
  fTakeVZItems:= TObjectList.Create(true);
  Assign(Value);
end;

procedure TTakeFactNagrItem.DeleteTakeFactNagrVZItem(index: integer);
begin
  fTakeVZItems.Delete(index);
end;

destructor TTakeFactNagrItem.Destroy;
begin
  if Assigned(fTakeVZItems) then
  begin
    fTakeVZItems.Clear;
    FreeAndNil(fTakeVZItems);
  end;
  inherited;
end;

function TTakeFactNagrItem.getItem(index: integer): TTakeFactNagrVZItem;
begin
  Result:= fTakeVZItems[index] as TTakeFactNagrVZItem;
end;

function TTakeFactNagrItem.GetItemsList: TObjectList;
begin
  Result:= fTakeVZItems;
end;

procedure TTakeFactNagrItem.setItem(index: integer;
  const Value: TTakeFactNagrVZItem);
begin
  fTakeVZItems[index]:= Value;
end;

procedure TTakeFactNagrItem.setVidZanyatIK(const Value: integer);
var
  tempDS: TADODataSet;
begin
  fVidZanyatIK := Value;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT bit_must_be_in_uch_plan FROM dbo.vid_zaniat WHERE iK_vid_zanyat = ' + IntToStr(Value);
    tempDS.Open;
    fVidZanyatMustBeInUchPlan:= tempDS.FieldByName('bit_must_be_in_uch_plan').AsBoolean;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TTakeFactNagrItem.Assign(Value: TTakeFactNagrItem);
begin
  fIsRemoved:= Value.IsRemoved;
  fContentPlanNagrIK:= Value.ContentPlanNagrIK;
  fVidZanyatIK:= Value.VidZanyatIK;
  fVidNagruzkiIK:= Value.VidNagruzkiIK;
  //fInPlanCount:= Value.InPlanCount;
  fNormPerUnit:= Value.NormPerUnit;
  fNormPerStudent:= Value.NormPerStudent;
  fMaxNormPerStudent:= Value.MaxNormPerStudent;
  fVidZanyatTypeIK:= Value.VidZanyatTypeIK;
  fVidZanyatMustBeInUchPlan:= Value.VidZanyatMustBeInUchPlan;
  fVidZanyatTypeByTimeIK:= Value.VidZanyatTypeByTimeIK;
  AssignFactNagrVZItems(Value.GetItemsList);
end;

procedure TTakeFactNagrItem.AssignFactNagrVZItems(ItemList: TObjectList);
var
  i: integer;
begin
  if Assigned(fTakeVZItems) then fTakeVZItems.Clear
  else fTakeVZItems:= TObjectList.Create(true);
  for I := 0 to ItemList.Count - 1 do
    fTakeVZItems.Add(TTakeFactNagrVZItem.Create(ItemList[i] as TTakeFactNagrVZItem));
end;

constructor TTakeFactNagrItem.Create(aPlanItemIK, aPlanPrepodIK,
  aFactPrepodIK: integer; aFactHours, aForeignHour: double; aFactStudent: integer);
begin
  fPlanItemIK := aPlanItemIK;
  fPlanPrepodIK := aPlanPrepodIK;
  fFactPrepodIK := aFactPrepodIK;
  fFactHours := aFactHours;
  fFactStudent :=  aFactStudent;
  fForeignHours := aForeignHour;
end;

{ TPotokSemesterShema }

procedure TPotokSemesterShema.addCalcUnit(aCalc: TSemesterCalcUnit);
begin
  fCalcUnitList.Add(TSemesterCalcUnit.Create(acalc.IK,acalc.Name,acalc.ShemaIK, aCalc.PotokSemesterIK, acalc.Budget,aCalc.Contract));
  fCalcUnitList.Items[fCalcUnitList.Count - 1].CopyGroups(aCalc.Groups);
  IsModified := true;
end;

procedure TPotokSemesterShema.ChangeName(aName: string);
begin
  fIsModified := true;
  fName := aName;
end;

constructor TPotokSemesterShema.Create(AIK, ADecomposeTypeIK,
  APotokSemIK: integer; AName: string);
begin
  fIK := AIK;
  fName := AName;
  fDecomposeTypeIK := ADecomposeTypeIK;
  fPotokSemesterIK := APotokSemIK;
  fCalcUnitList:= TSemesterCalcUnits.Create;
  fIsModified := false;
end;

destructor TPotokSemesterShema.Destroy;
begin
  fCalcUnitList.Clear;
  fCalcUnitList.Free;
  inherited;
end;

procedure TPotokSemesterShema.SetCalcUnitList(const Value: TSemesterCalcUnits);
var i,j: integer;
begin
  if fCalcUnitList.Count>0 then
  //если дописываем поверх
  begin
    //если расчетных единиц стало меньше
    if fCalcUnitList.Count>Value.Count then
    begin
      for I := 0 to fCalcUnitList.Count - Value.Count - 1 do
        fCalcUnitList.Delete(0);
    end;
    //если расчетных единиц стало больше
    if fCalcUnitList.Count<Value.Count then
    begin
      for I := 0 to Value.Count - fCalcUnitList.Count - 1 do
        fCalcUnitList.Add(TSemesterCalcUnit.Create(0,'',0,0,0,0));
    end;
    //обновляем данные
    for i := 0 to Value.Count - 1 do
    begin
      if fCalcUnitList.Items[i].IK=0 then
        fCalcUnitList.Items[i].IK := Value.Items[i].IK;
      fCalcUnitList.Items[i].Name := Value.Items[i].Name;
      fCalcUnitList.Items[i].ShemaIK := Value.Items[i].ShemaIK;
      fCalcUnitList.Items[i].PotokSemesterIK := Value.Items[i].PotokSemesterIK;
      fCalcUnitList.Items[i].Budget := Value.Items[i].Budget;
      fCalcUnitList.Items[i].Contract := Value.Items[i].Contract;
      fCalcUnitList.Items[i].Groups.Clear;
      for j := 0 to Value.Items[i].Groups.Count - 1 do
         fCalcUnitList.Items[i].Groups.Add(Value.Items[i].Groups.Items[j]);
    end;

  end else fCalcUnitList := Value;
end;

{ TSemesterCalcUnit }

procedure TSemesterCalcUnit.AddGroup(AgroupIK: integer; aGroupName: string);
begin
  fGroups.Add(TGroup.Create(AgroupIK, aGroupName));
end;

constructor TSemesterCalcUnit.Create(aIK: integer; aName: string; aShemaIK, aPotSemIK,
  aBudget, aContract: integer);
begin
  fGroups := TObjectList.Create;
  fIK := aIK;
  fName := aName;
  fShemaIK := aShemaIK;
  fPotokSemesterIK := aPotSemIK;
  fBudget := aBudget;
  fContract := aContract;
end;

procedure TSemesterCalcUnit.ClearGroup;
begin
  fGroups.Clear;
end;

procedure TSemesterCalcUnit.CopyGroups(aGroups: TObjectList);
var
  I: Integer;
begin
  for I := 0 to aGroups.Count - 1 do
  with aGroups.Items[i] as TGroup do
    fGroups.Add(TGroup.Create(IK,Name));
end;

constructor TSemesterCalcUnit.Create();
begin
  fGroups := TObjectList.Create;
  fIK := -1;
end;

destructor TSemesterCalcUnit.Destroy;
begin
  fGroups.Clear;
  fGroups.Free;
  inherited;
end;

function TSemesterCalcUnit.GetGroupsName: string;
var
  I: Integer;
begin
  Result  := '';
  for I := 0 to Groups.Count - 1 do
  begin
    Result := Result + (Groups.Items[i] as TGroup).Name;
    if i< Groups.Count - 1 then  Result := Result + ', ';
  end;
end;

function TSemesterCalcUnit.HasGroup(aGroupIk: integer): boolean;
var
  I: Integer;
begin
  Result := false;
  for I := 0 to Groups.Count - 1 do
    if (Groups.Items[i] as TGroup).IK = aGroupIk then
    begin
      Result := true;
      Break;
    end;
end;

procedure TSemesterCalcUnit.Modify(aCalcUnit: TSemesterCalcUnit);
var i: integer;
begin
  fName := aCalcUnit.Name;
  fBudget := aCalcUnit.Budget;
  fContract := aCalcUnit.Contract;
  ClearGroup;
  with aCalcUnit.Groups do
  for I := 0 to Count - 1 do
    fGroups.Add(TGroup.Create((Items[i] as TGroup).IK, (Items[i] as TGroup).Name));
end;

{ TSemesterCalcUnits }

function TSemesterCalcUnits.GetItem(Index: Integer): TSemesterCalcUnit;
begin
  result := inherited Items[Index] as TSemesterCalcUnit;
end;

function TSemesterCalcUnits.IndexByID(aID: integer): integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
     if Items[i].IK = aID then
     begin
       Result := i;
       break;
     end;
end;

function TSemesterCalcUnits.ItemByID(aID: integer): TSemesterCalcUnit;
var i: integer;
begin
  Result :=  nil;
  for  i := 0 to Count - 1 do
    if Items[i].IK = aID then
    begin
      Result := Items[i];
      Break;
    end;
end;

{ TGroup }

constructor TGroup.Create(aIK: integer; aNAme: string);
begin
  fIK := aIK;
  fName := aNAme;
end;

{ TPotokSemesterShemas }

function TPotokSemesterShemas.GetItem(Index: Integer): TPotokSemesterShema;
begin
  result := inherited Items[Index] as TPotokSemesterShema;
end;

function TPotokSemesterShemas.IndexByID(aID: integer): integer;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
     if Items[i].IK = aID then
     begin
       Result := i;
       break;
     end;
end;

function TPotokSemesterShemas.ItemByID(aID: integer): TPotokSemesterShema;
var i: integer;
begin
  Result :=  nil;
  for  i := 0 to Count - 1 do
    if Items[i].IK = aID then
    begin
      Result := Items[i];
      Break;
    end;
end;

{ TPlanPotokInfo }

constructor TPlanPotokInfo.Create(aSpecFac: integer; aName: string; aYearEnter: integer);
begin
  fSpecFac := aSpecFac;
  fName := aName;
  fYearEnter := aYearEnter;
end;

procedure TPlanPotokInfo.FillPlan(aGroups, aSupGroups, aBudget,
  aContract: integer; aIsGroup: Boolean);
begin
  fGroups := aGroups;
  fSupGroups := aSupGroups;
  fBudget := aBudget;
  fContract := aContract;
  fIsGroup := aIsGroup;
end;

{ TPlanPotokInfos }

function TPlanPotokInfos.GetItem(Index: Integer): TPlanPotokInfo;
begin
  result := inherited Items[Index] as TPlanPotokInfo;
end;

function TPlanPotokInfos.ItemBySpecYear(aSpec, aYear: integer): TPlanPotokInfo;
  var i: integer;
begin
  Result :=  nil;
  for  i := 0 to Count - 1 do
    if (Items[i].fSpecFac = aSpec)and(Items[i].fYearEnter = aYear) then
    begin
      Result := Items[i];
      Break;
    end;
end;

{ TAdditionFactItem }

constructor TAdditionFactItem.Create(aPlanIK, aTeacherIK: integer);
begin
  FIK := 0;
  FPlanIK := aPlanIK;
  FTeacherIK := aTeacherIK;
end;

constructor TAdditionFactItem.Create(aAditionIK: integer);
var tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'Select * from Addition_prepod_fact where ik_addition=' + IntToStr(aAditionIK);
  tempDS.Open;

     FIK := aAditionIK;
     FPlanIK := tempDS.FieldByName('ik_plan_nagr').AsInteger;
     FTeacherIK := tempDS.FieldByName('ik_id_prepod').AsInteger;
     fVidZanyatIK := tempDS.FieldByName('ik_vid_zanyat').AsInteger;
     FVidNagrIK := tempDS.FieldByName('ik_vid_nagruzki').AsInteger;
     FDiscIK := tempDS.FieldByName('ik_disc').AsInteger;
     FAdditionReasonIK := tempDS.FieldByName('ik_addition_reason').AsInteger;
     FHours := tempDS.FieldByName('f_all_fact_hour').AsFloat;
     FStudentCount := tempDS.FieldByName('i_fact_student').AsInteger;

  tempDS.Close;
  tempDS.Free;

end;

{ TSpecNodes }

function TSpecNodes.GetItems(Index: Integer): TSpecNode;
begin
  Result := inherited Items[Index] as TSpecNode;
end;

procedure TSpecNodes.RemoveItem(ASpecIK, AYearIK: integer);
var i: integer;
begin
  i:= 0;
  while i<Count do
  begin
    if (Items[i].SpecIK = ASpecIK)and(Items[i].YearIK = AYearIK) then
       Delete(i) else inc(i);
  end;

end;

{ TSpecNode }

constructor TSpecNode.Create(ASpecIK, AYearIK: integer; ASpecShortName, aYearName: string);
begin
  fGroupIK := 0;
  fGroupName := '';
  fSpecIK:= ASpecIK;
  fSpecShortName:= ASpecShortName;
  fYearIK :=  AYearIK;
  fYearName:= aYearName;
end;

constructor TSpecNode.Create(ASpecIK, AYearIK, aGroupIK: integer;
  ASpecShortName, aYearName, aGroupName: string);
begin
  fGroupIK := aGroupIK;
  fGroupName := aGroupName;
  fSpecIK:= ASpecIK;
  fSpecShortName:= ASpecShortName;
  fYearIK :=  AYearIK;
  fYearName:= aYearName;
end;

end.
