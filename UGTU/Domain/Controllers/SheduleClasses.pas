unit SheduleClasses;
  {#Author villain@ist.ugtu.net}
interface

uses SysUtils, Classes, Controls, Grids, Dialogs, ExtCtrls, StdCtrls, Forms, Contnrs,
    Messages, Windows, Graphics, ADODB, DB, Variants, GeneralController, DateUtils, DBCtrlsEh, DBLookupEh;

type
  TSPartInfo = class
  private
    fPartNumber: integer;
    fStartTime: TTime;
    fStopTime: TTime;
  public
    constructor Create(APartNumber: integer; AStartTime, AStopTime: TTime);
    property PartNumber: integer read fPartNumber write fPartNumber;
    property StartTime: TTime read fStartTime write fStartTime;
    property StopTime: TTime read fStopTime write fStopTime;
  end;

  TSemLengthInfo = class
  private
    fGroupIKList: TStringList;
    fSpecFacultyIK: integer;
    fCourseNumber: integer;
    fSemStart: TDate;
    fSemStop: TDate;
    fSessionStart: TDate;
    fSessionStop: TDate;
  public
    constructor Create(AYearIK, ASpecFacultyIK, ACourseNumber: integer; ASemStart, ASemStop, ASessionStart, ASessionStop: Variant);
    destructor Destroy; override;
    procedure UpdateValues(AYearIK: integer; ASemStart, ASemStop, ASessionStart, ASessionStop: Variant);
    function IsAudDateAllow(ADate: TDate): boolean; virtual;
    function IsSessionDateAllow(ADate: TDate): boolean; virtual;
    property GroupIKList: TStringList read fGroupIKList;
    property SpecFacultyIK: integer read fSpecFacultyIK;
    property CourseNumber: integer read fCourseNumber;
    property SemStart: TDate read fSemStart;
    property SemStop: TDate read fSemStop;
    property SessionStart: TDate read fSessionStart;
    property SessionStop: TDate read fSessionStop;
  end;

  TDefaultSemLengthInfo = class(TSemLengthInfo)
  private
    fExceptions: TObjectList;
    fSheduleIK: integer;
    fYearIK: integer;
    fSemIK: integer;
    fWorkTimeStart: TTime;
    fWorkTimeEnd: TTime;
    function GetException(ASpecFacIK, ACourseNumber: integer): TSemLengthInfo;
    procedure SetException(ASpecFacIK, ACourseNumber: integer; const Value: TSemLengthInfo);
    function GetExceptionByIndex(index: integer): TSemLengthInfo;
    procedure SetExceptionByIndex(index: integer; const Value: TSemLengthInfo);
  public
    constructor Create(ASheduleIK, AYearIK, ASemIK: integer; ASemStart, ASemStop, ASessionStart, ASessionStop, AWorkTimeStart, AWorkTimeEnd: Variant);
    destructor Destroy; override;
    procedure UpdateValues(AYearIK, ASemIK: integer; ASemStart, ASemStop, ASessionStart, ASessionStop, AWorkTimeStart, AWorkTimeEnd: Variant);
    function AddException(AValue: TSemLengthInfo): integer;
    procedure DeleteException(index: integer);
    function IsAudDateAllow(ADate: TDate): boolean; override;
    function IsSessionDateAllow(ADate: TDate): boolean; override;
    function GetSemesterLengthForGrup(AGroupIK: integer): TSemLengthInfo;
    function MinSemStart: TDate;
    function MaxSemStop: TDate;
    function MinSessionStart: TDate;
    function MaxSessionStop: TDate;
    function ExceptionCount: integer;
    property SheduleIK: integer read fSheduleIK;
    property YearIK: integer read fYearIK;
    property SemIK: integer read fSemIK;
    property WorkTimeStart: TTime read fWorkTimeStart;
    property WorkTimeEnd: TTime read fWorkTimeEnd;
    property Exceptions[ASpecFacIK, ACourseNumber: integer]: TSemLengthInfo read GetException write SetException;
    property ExceptionsByIndex[index: integer]: TSemLengthInfo read GetExceptionByIndex write SetExceptionByIndex;
  end;

  TSheduleTeacher = class
  private
    fTabN: integer;
    fLastName: string;
    fFirstName: string;
    fCotch: string;
    function GetFIO(): string;
  public
    constructor Create(ATabN: integer; AFirstName, ALastName, ACotch: string);
    property TabN: integer read fTabN write fTabN;
    property FIO: string read GetFIO;
    property LastName: string read fLastName;
    property FirstName: string read fFirstName;
    property Cotch: string read fCotch;
  end;

  TSheduleGroup = class
  private
    fGroupIK: integer;
    fGroupName: string;
  public
    constructor Create(AGroupIK: integer; AName: string);
    property GroupIK: integer read fGroupIK write fGroupIK;
    property GroupName: string read fGroupName write fGroupName;
  end;

  TSheduleEvent = class;
  
  TShedulerDrawType = (sdtNormal, sdtForward, sdtBackward);
  
  TRepeatPattern = class(TObject)
  private
    fRepeatPattenIK: integer;
    fRepeatType: integer;
    fRepeatFrequency: integer;
    fRepeatMask: ShortString;
    fRepeatLimitType: integer;
    fRepeatCount: integer;
    fEndDateOfRepeat: TDate;
  public
    procedure Assing(ARepeatPattern:TRepeatPattern);
    property RepeatPattenIK: integer read fRepeatPattenIK write fRepeatPattenIK;
    property RepeatType: integer read fRepeatType write fRepeatType;
    property RepeatFrequency: integer read fRepeatFrequency write fRepeatFrequency;
    property RepeatMask: ShortString read fRepeatMask write fRepeatMask;
    property RepeatLimitType: integer read fRepeatLimitType write fRepeatLimitType;
    property RepeatCount: integer read fRepeatCount write fRepeatCount;
    property EndDateOfRepeat: TDate read fEndDateOfRepeat write fEndDateOfRepeat;
    function GetEventMaxDate(BeginDate: TDate): TDate; virtual; abstract;
    function IsOccured(eventBeginTime, eventEndTime, AStart, AStop: TDateTime):boolean; virtual; abstract;
    function GetAllEventsBetween(beginEvent, endEvent: TDateTime; startDate, stopDate: TDate; exceptionList: TStringList; EventType: integer): TList; virtual; abstract;
  end;

  TDayRepeatPattern = class(TRepeatPattern)
  public
    function GetEventMaxDate(BeginDate: TDate): TDate; override;
    function IsOccured(eventBeginTime, eventEndTime, AStart, AStop: TDateTime):boolean; override;
    function GetAllEventsBetween(beginEvent, endEvent: TDateTime; startDate, stopDate: TDate; exceptionList: TStringList; EventType: integer): TList; override;
  end;

  TWeekRepeatPattern = class(TRepeatPattern)
  public
    function GetEventMaxDate(BeginDate: TDate): TDate; override;
    function IsOccured(eventBeginTime, eventEndTime, AStart, AStop: TDateTime):boolean; override;
    function GetAllEventsBetween(beginEvent, endEvent: TDateTime; startDate, stopDate: TDate; exceptionList: TStringList; EventType: integer): TList; override;
  end;

  TMonthRepeatPattern = class(TRepeatPattern)
  public
    function IsOccured(eventBeginTime, eventEndTime, AStart, AStop: TDateTime):boolean; override;
    function GetAllEventsBetween(beginEvent, endEvent: TDateTime; startDate, stopDate: TDate; exceptionList: TStringList; EventType: integer): TList; override;
  end;

  TSheduleItem = class
  private
    procedure SetCalcUnitIK(value: integer);
    function GetDiscName: string;
    function GetRoomName: string;
  //  function GetShortDiscName: string;
    function GetTeacherName: string;
    function GetTeacherNameWithoutTabN: string;
    function GetTeacherWithWTName: string;
    function GetVidNagruzkiName: string;
    function GetVidZanyatName: string;
    procedure LoadTeacherNames;
    procedure LoadCalcUnitSchemeInfo;
    procedure LoadGroupIKList;
  //  procedure LoadDiscNames;
    function GetWorkTypeName: string;
    function GetTabN: integer;
    procedure SetDiscIK(const Value: integer);
    procedure SetRoomIK(const Value: integer);
    procedure SetTeacherIK(const Value: integer);
    procedure SetVidNagruzkiIK(const Value: integer);
    procedure SetVidZanyatIK(const Value: integer);
    function GetCalcUnitName: string;
    function GetCalcUnitPotokIK: integer;
    function GetCalcUnitSchemeDecomposeType: integer;
    function GetFacultyIKList: TStringList;
    function GetGroupIKList: TStringList;
  protected
    fSheduleIK: integer;
    fStart: TDateTime;
    fStop: TDateTime;
    fGroupIKListIsLoaded: boolean;
    fGroupIKList: TStringList;
    fFacultyIKList: TStringList;
    fKafedraIK: integer;
    fFormEdIK: integer;
    fCalcUnitIK: integer;
    fCalcUnitPotokIK: integer;
    fCalcUnitSchemeDecomposeType: integer;
    fDiscIK: integer;
    fVidZanyatIK: integer;
    fVidNagruzkiIK: integer;
    fRoomIK: integer;
    fTeacherIK: integer;
    fPlanTeacherIK: integer;
    fTabN: integer;
    fTeacherLastName: string;
    fTeacherFirstName: string;
    fTeacherCoatch: string;
  //  fTeacherName: string;
  //  fTeacherWithWTName: string;
  //  fTeacherNameWithoutTabN: string;
    fCalcUnitName: string;
    fDiscName: string;
//    fShortDiscName: string;
    fRoomName: string;
    fCampusName: string;
    fVidZanyatName: string;
    fVidNagruzkiName: string;
    fWorkTypeName: string;
    fVersion: integer;
  public
    constructor Create; virtual;
//    constructor Create(ASourceDataSet: TDataSet); overload; virtual;
  {  constructor Create(AStart, AStop: TDateTime; AKafedraIK, AFormEdIK, ASheduleIK, ATeacherIK,
      APlanTeacherIK, ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK: integer;
      AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string); overload; virtual;
  }
    destructor Destroy; override;
    procedure Assign(AItem: TSheduleItem); overload;
    procedure Assign(ASourceDataSet: TDataSet); overload; virtual;
    property Start: TDateTime read fStart write fStart;
    property Stop: TDateTime read fStop write fStop;
    property PlanTeacherIK: integer read fPlanTeacherIK write fPlanTeacherIK;
    property TeacherIK: integer read fTeacherIK write SetTeacherIK;
    property SheduleIK: integer read fSheduleIK write fSheduleIK;
    property TabN: integer read GetTabN;
    property GroupIKList: TStringList read GetGroupIKList;
    property FacultyIKList: TStringList read GetFacultyIKList;
    property CalcUnitPotokIK: integer read GetCalcUnitPotokIK;
    property CalcUnitSchemeDecomposeType: integer read GetCalcUnitSchemeDecomposeType;
    property CalcUnitIK: integer read fCalcUnitIK write SetCalcUnitIK;
    property DiscIK: integer read fDiscIK write SetDiscIK;
    property RoomIK: integer read fRoomIK write SetRoomIK;
    property KafedraIK: integer read fKafedraIK write fKafedraIK;
    property FormEdIK: integer read fFormEdIK write fFormEdIK;
    property VidZanyatIK: integer read fVidZanyatIK write SetVidZanyatIK;
    property VidNagruzkiIK: integer read fVidNagruzkiIK write SetVidNagruzkiIK;
    property CalcUnitName: string read GetCalcUnitName;
    property DiscName: string read GetDiscName;
//    property ShortDiscName: string read GetShortDiscName;
    property FullRoomName: string read GetRoomName;
    property RoomName: string read fRoomName;
    property CampusName: string read fCampusName;
    property TeacherName: string read GetTeacherName;
    property TeacherWithWTName: string read GetTeacherWithWTName;
    property TeacherNameWithoutTabN: string read GetTeacherNameWithoutTabN;
    property VidZanyatName: string read GetVidZanyatName;
    property VidNagruzkiName: string read GetVidNagruzkiName;
    property WorkTypeName: string read GetWorkTypeName;
    property Version: integer read fVersion write fVersion;
  end;

  TSheduleItemList = class(TList)
  private
    function GetItem(Index: Integer): TSheduleItem;
    procedure SetItem(Index: Integer; const Value: TSheduleItem);
  public
    property Items[Index: Integer]: TSheduleItem read GetItem write SetItem; default;
  end;

  TSheduleEvent = class(TSheduleItem)
  private
    fEventIK: integer;
    fParrentEventIK: integer;
    fEventType: integer;
    fRepeatPattern: TRepeatPattern;
    fExceptions: TObjectList;
    fIsException: boolean;
    fBeginDate: TDate;
    fExceptionDate: TDate;
    procedure SetException(index: integer; Value: TSheduleEvent);
    function GetException(index: integer): TSheduleEvent;
    function GetExceptionCount():integer;
  public
    constructor Create; overload; override;
    constructor Create(ASourceDataSet: TDataSet; AIsException: boolean); overload;
 //   constructor Create(ASheduleIK, AEventIK: integer); overload;
    constructor Create(AEvent: TSheduleEvent); overload;

 {   constructor Create(ABeginDate, AStart, AStop: TDateTime; AKafedraIK, AFormEdIK, ASheduleIK, AEventIK, AEventType, ARepeatPatternIK, ATeacherIK,
      APlanTeacherIK, ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK: integer;
      AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string; AIsExeption: boolean); overload;
 }
    destructor Destroy; override;
    procedure Assign(AEvent: TSheduleEvent); overload;
    procedure Assign(ASourceDataSet: TDataSet; AIsException: boolean); overload;
    procedure LoadExceptions;
    procedure AddException(value: TSheduleEvent);
    function DeleteException(index: integer):boolean;
    function GetEventMaxDate(): TDate;
    function IsOccured(AStart: TDateTime; AStop: TDateTime): TSheduleEvent;
    function IsOccuredWithoutException(AStart: TDateTime; AStop: TDateTime): TSheduleEvent;
    function GetAllEventsBetween(startDate, stopDate: TDate): TObjectList;
    property EventIK: integer read fEventIK write fEventIK;
    property ParrentEventIK: integer read fParrentEventIK write fParrentEventIK;
    property EventType: integer read fEventType write fEventType;
    property Exceptions[index: integer]: TSheduleEvent read GetException write SetException;
    property ExceptionCount: integer read GetExceptionCount;
    property RepeatPattern: TRepeatPattern read fRepeatPattern write fRepeatPattern;
    property IsException: boolean read fIsException write fIsException;
    property ExceptionDate: TDate read fExceptionDate write fExceptionDate;
    property BeginDate: TDate read fBeginDate write fBeginDate;
  end;

  TSheduleEventList = class(TSheduleItemList)
  private
    function GetEvent(Index: Integer): TSheduleEvent;
    procedure SetEvent(Index: Integer; const Value: TSheduleEvent);
  public
    property Items[Index: Integer]: TSheduleEvent read GetEvent write SetEvent; default;
  end;

  TSheduleExamination = class(TSheduleItem)
  private
    fExamIK: integer;
    fExamDate: TDate;
  public
    constructor Create(AExam: TSheduleExamination); overload;
    constructor Create(ASourceDataSet: TDataSet); overload;
  //  constructor Create(ASheduleIK, AExamIK: integer); overload;
 {   constructor Create(AStart, AStop: TDateTime; AKafedraIK, AFormEdIK, ASheduleIK, AExamIK, ATeacherIK,
      APlanTeacherIK, ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK: integer;
      AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string); overload;
  }
    procedure Assign(AExam: TSheduleExamination); overload;
    procedure Assign(ASourceDataSet: TDataSet); overload; override;
    property ExamDate: TDate read fExamDate write fExamDate;
    property ExamIK: integer read fExamIK write fExamIK;
    function IsOccured(AStart: TDateTime; AStop: TDateTime): TSheduleExamination;
  end;

  TSheduleExaminationList = class(TSheduleItemList)
  private
    function GetExam(Index: Integer): TSheduleExamination;
    procedure SetExam(Index: Integer; const Value: TSheduleExamination);
  public
    property Items[Index: Integer]: TSheduleExamination read GetExam write SetExam; default;
  end;

  TSheduleEventStorage = class;

  TStructureItemType = (selsiGroup, selsiTeacher);

  TSheduleEventStorageStructureItem = class
  private
    fIK: integer;
    fSheduleIK: integer;
    fEvents: TList;
    fOwner: TSheduleEventStorage;
    fItemType: TStructureItemType;
    function GetEvent(Index: Integer): TSheduleEvent;
    procedure SetEvent(Index: Integer; const Value: TSheduleEvent);
  public
    constructor Create(ASheduleIK, AIK: integer; MyOwner: TSheduleEventStorage; AItemType: TStructureItemType);
    destructor Destroy; override;
    function AddEvent(AValue: TSheduleEvent): TSheduleEvent;
 //   function DeleteEvent(AEventIK: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteEventByIndex(Index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteEventWithoutTouchStorege(AEventIK: integer): boolean;
    function DeleteAllWithoutDeleteFromDB: boolean;
    function GetEventByIK(AEventIK: integer): TSheduleEvent;
    function GetEventCount: integer;
    procedure RefreshEventList;
    property IK: integer read fIK;
    property SheduleIK: integer read fSheduleIK;
    property Events[Index: Integer]: TSheduleEvent read GetEvent write SetEvent;
  end;

  TSheduleEventStorage = class(TObjectList)
  private
    fGroupList: TObjectList;
    fTeacherList: TObjectList;
    function GetGroup(ASheduleIK, AGroupIK: Integer): TSheduleEventStorageStructureItem;
    function GetTeacher(ASheduleIK, ATabN: Integer): TSheduleEventStorageStructureItem;
    procedure SetGroup(ASheduleIK, AGroupIK: Integer;
      const Value: TSheduleEventStorageStructureItem);
    procedure SetTeacher(ASheduleIK, ATabN: Integer;
      const Value: TSheduleEventStorageStructureItem);
    function GetEvent(Index: Integer): TSheduleEvent;
    procedure SetEvent(Index: Integer; const Value: TSheduleEvent);
  public
    constructor Create;
    destructor Destroy; override;
    function CreateTeacher(ASheduleIK, ATabN: integer): TSheduleEventStorageStructureItem;
    function CreateGroup(ASheduleIK, AGroupIK: integer): TSheduleEventStorageStructureItem;
    function GetEventByIK(AEventIK: integer): TSheduleEvent;
    function AddEvent(AValue: TSheduleEvent): TSheduleEvent;
    function DeleteEvent(AEventIK: integer; isDeleteFromDB: boolean): boolean;
    function Remove(AObject: TSheduleEvent; isDeleteFromDB: boolean): Integer;
    property Groups[ASheduleIK, AGroupIK: Integer]: TSheduleEventStorageStructureItem read GetGroup write SetGroup;
    property Teachers[ASheduleIK, ATabN: Integer]: TSheduleEventStorageStructureItem read GetTeacher write SetTeacher;
    property Items[Index: Integer]: TSheduleEvent read GetEvent write SetEvent; default;
  end;

  TExaminationStorage = class;

  TExaminationStorageStructureItem = class
  private
    fIK: integer;
    fSheduleIK: integer;
    fExaminations: TList;
    fOwner: TExaminationStorage;
    fItemType: TStructureItemType;
    function GetExam(Index: Integer): TSheduleExamination;
    procedure SetExam(Index: Integer; const Value: TSheduleExamination);
  public
    constructor Create(ASheduleIK, AIK: integer; MyOwner: TExaminationStorage; AItemType: TStructureItemType);
    destructor Destroy; override;
    function AddExam(AValue: TSheduleExamination): TSheduleExamination;
//    function DeleteExam(AExamIK: integer): boolean;
    function DeleteExamByIndex(Index: integer; IsDeleteFromDB: boolean): boolean;
    function DeleteExamWithoutTouchStorege(AExamIK: integer): boolean;
    function DeleteAllWithoutDeleteFromDB: boolean;
    function GetExamByIK(AExamIK: integer): TSheduleExamination;
    function GetExamCount: integer;
    procedure RefreshExamList;
    property IK: integer read fIK write fIK;
    property SheduleIK: integer read fSheduleIK;
    property Exams[Index: Integer]: TSheduleExamination read GetExam write SetExam;
  end;

  TExaminationStorage = class(TObjectList)
  private
    fGroupList: TObjectList;
    fTeacherList: TObjectList;
    function GetGroup(ASheduleIK, AGroupIK: Integer): TExaminationStorageStructureItem;
    function GetTeacher(ASheduleIK, ATabN: Integer): TExaminationStorageStructureItem;
    procedure SetGroup(ASheduleIK, AGroupIK: Integer;
      const Value: TExaminationStorageStructureItem);
    procedure SetTeacher(ASheduleIK, ATabN: Integer;
      const Value: TExaminationStorageStructureItem);
    function GetExam(Index: Integer): TSheduleExamination;
    procedure SetExam(Index: Integer; const Value: TSheduleExamination);
    function CreateTeacher(ASheduleIK, ATabN: integer): TExaminationStorageStructureItem;
    function CreateGroup(ASheduleIK, AGroupIK: integer): TExaminationStorageStructureItem;
  public
    constructor Create;
    destructor Destroy; override;
    function Remove(AObject: TSheduleExamination; isDeleteFromDB: boolean): Integer;
    function GetExamByIK(AExamIK: integer): TSheduleExamination;
    function AddExam(AValue: TSheduleExamination): TSheduleExamination;
    function DeleteExam(AExamIK: integer; isDeleteFromDB: boolean): boolean;
    property Groups[ASheduleIK, AGroupIK: Integer]: TExaminationStorageStructureItem read GetGroup write SetGroup;
    property Teachers[ASheduleIK, ATabN: Integer]: TExaminationStorageStructureItem read GetTeacher write SetTeacher;
    property Items[Index: Integer]: TSheduleExamination read GetExam write SetExam; default;
  end;

  TPotokGroups = class
  private
    fPotokIK: integer;
    fGroupIKList: TStringList;
    fFacultyIKList: TStringList;
  public
    constructor Create(APotokIK: integer);
    destructor Destroy; override;
    property PotokIK: integer read fPotokIK;
    property GroupIKList: TStringList read fGroupIKList;
    property FacultyIKList: TStringList read fFacultyIKList;
  end;

  TPotokGroupsStorage = class(TObjectList)
  private
    function getPotok(PotokIK: integer): TPotokGroups;
    function getPotokItem(index: integer): TPotokGroups;
    procedure setPotokItem(index: integer; const Value: TPotokGroups);
  public
    constructor Create;
    property Items[index: integer]: TPotokGroups read getPotokItem write setPotokItem;
    property Potoks[PotokIK: integer]: TPotokGroups read getPotok;
  end;

  TSheduleRegistry = class
  private
    class var fEventStorage: TSheduleEventStorage;
    class var fExamStorage: TExaminationStorage;
    class var fInstance: TSheduleRegistry;
    class var fPotokGroupsStorage: TPotokGroupsStorage;
  public
    class function EventStorage: TSheduleEventStorage;
    class function ExamStorage: TExaminationStorage;
    class function PotokGroupsStorage: TPotokGroupsStorage;
    class function Functions: TSheduleRegistry;
    class procedure ReleaseInstance;

    function GetTeacherEvents(SheduleIK, TabN: integer; needLoadFromDB: boolean): TSheduleEventStorageStructureItem;
    function GetGroupEvents(SheduleIK, GroupIK: integer; needLoadFromDB: boolean): TSheduleEventStorageStructureItem;
    function GetFacultyEvents(SheduleIK, FacultyIK: integer): boolean;
    function GetDepartmentEvents(SheduleIK, KafedraIK: integer): boolean;
    function GetFacultyExams(SheduleIK, FacultyIK: integer): boolean;
    function GetDepartmentExams(SheduleIK, KafedraIK: integer): boolean;
    function GetTeacherExams(SheduleIK, TabN: integer; needLoadFromDB: boolean): TExaminationStorageStructureItem;
    function GetGroupExams(SheduleIK, GroupIK: integer; needLoadFromDB: boolean): TExaminationStorageStructureItem;

    procedure SearchEventsForPrep(SourceEventsDS: TADODataSet; ASheduleIK, ATabN: integer; StartTime, StopTime: TDateTime);
    procedure SearchEventsForGroup(SourceEventsDS: TADODataSet; ASheduleIK, AGroupIK: integer; StartTime, StopTime: TDateTime);
    procedure SearchEventsForRoom(SourceEventsDS: TADODataSet; ASheduleIK, ARoomIK: integer; StartTime, StopTime: TDateTime);

    procedure SearchExamsForPrep(SourceExamDS: TADODataSet; ASheduleIK, ATabN: integer; StartTime, StopTime: TDateTime);
    procedure SearchExamsForGroup(SourceExamDS: TADODataSet; ASheduleIK, AGroupIK: integer; StartTime, StopTime: TDateTime);
    procedure SearchExamsForRoom(SourceExamDS: TADODataSet; ASheduleIK, ARoomIK: integer; StartTime, StopTime: TDateTime);

    procedure GetParts(var Parts:TObjectList); overload;
    procedure GetParts(SourseDS: PDataSet); overload;
    function GetExceptions(EventIK: integer): TObjectList;
    function GetRepeatPattern(PatternIK: integer): TRepeatPattern; overload;
    function GetRepeatPattern(ASourceDataSet: TDataSet): TRepeatPattern; overload;
  end;

implementation

uses uDM, SheduleController, NagruzkaClasses, NagruzkaController,
  ExceptionBase;

{ TSPartInfo }

constructor TSPartInfo.Create(APartNumber: integer; AStartTime, AStopTime: TTime);
begin
  inherited Create;
  fPartNumber:= APartNumber;
  fStartTime:= AStartTime;
  fStopTime:= AStopTime;
end;

{ TTSDayRepeatPattern }

function TDayRepeatPattern.GetAllEventsBetween(beginEvent,
  endEvent: TDateTime; startDate, stopDate: TDate;
  exceptionList: TStringList; EventType: integer): TList;
var
  y, m, d, h, min, s, ms, hs, mins, ss, mss: word;
  c: integer;
  temp: TDate;

  procedure MainCalculation();
  begin
    if (temp >= startDate) and (exceptionList.IndexOf(DateToStr(temp)) = -1) then
      begin
        DecodeDate(temp, y, m, d);
        Result.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
      end;
    temp:= temp + fRepeatFrequency;
  end;

begin
  Result:= TList.Create;
  DecodeDateTime(endEvent, y,m,d,hs, mins, ss, mss);
  DecodeDateTime(beginEvent, y, m, d, h, min, s, ms);
  temp:= EncodeDate(y, m, d);
  c:= 1;
  case RepeatLimitType of
  1:
    while (temp <= stopDate) do
      MainCalculation;
  2:
    while (temp <= stopDate) and (c <= fRepeatCount) do
      begin
        MainCalculation;
        inc(c);
      end;
  3:
    while (temp <= stopDate) and (temp <= fEndDateOfRepeat) do
      MainCalculation;
  end;
end;

function TDayRepeatPattern.GetEventMaxDate(BeginDate: TDate): TDate;
begin
  case RepeatLimitType of
  1, 3: Result:= EndDateOfRepeat;
  2: Result:= BeginDate + fRepeatFrequency*fRepeatCount;
  end;
end;

function TDayRepeatPattern.IsOccured(eventBeginTime, eventEndTime: TDateTime; AStart, AStop: TDateTime): boolean;
var
  y,m,d,h,min,s, ms, hs, mins, ss, mss: word;
  temp: TDate;
  function CalcSundayBetween(): integer;
  begin
    Result:= 0;
    temp:= EncodeDate(y, m, d);
    while (temp < AStop) do
    begin
      if (DayOfWeek(temp) = 1) then inc(Result);
      temp:= temp + fRepeatFrequency;
    end;
  end;

 { function MainCalculation(): boolean;
  begin
    if (tempTime >= AStart) and (tempTime <= AStop) then
      begin
        AStart:= tempTime;
        Result:= true;
        exit;
      end;
    if DayOfWeek(temp) <> 1 then inc(c);
    temp:= temp + fRepeatFrequency;
    DecodeDate(temp, y,m,d);
    temptime:= EncodeDateTime(y,m,d,h,min,s,ms);
    Result:= false;
  end;    }

begin
  Result:= false;
  if TDate(AStart) < TDate(eventBeginTime) then exit;
  DecodeDateTime(AStart, y,m,d,hs,mins,ss,mss);
  DecodeDateTime(eventBeginTime, y, m, d, h, min, s, ms);
  case RepeatLimitType of
  1:
    if ((DaysBetween(AStart, eventBeginTime) mod fRepeatFrequency) = 0) and
      (h = hs) and (min = mins) and (s = ss) then
    begin
      Result:= true;
      exit;
    end;
  2:
    if ((DaysBetween(AStart, eventBeginTime) mod fRepeatFrequency) = 0) and
      (h = hs) and (min = mins) and (s = ss) and
      ((DaysBetween(AStart, eventBeginTime) div fRepeatFrequency) <= fRepeatCount-1+CalcSundayBetween) then
    begin
      Result:= true;
      exit;
    end;
  3:
    if ((DaysBetween(AStart, eventBeginTime) mod fRepeatFrequency) = 0) and
      (h = hs) and (min = mins) and (s = ss) and
      (AStop <= fEndDateOfRepeat) then
    begin
      Result:= true;
      exit;
    end;
  end;
{  temp:= EncodeDate(y, m, d);
  c:= 1;
  case RepeatLimitType of
  1:
    while (tempTime <= AStop) do
      if MainCalculation then
      begin
        Result:= true;
        exit;
      end;
  2:
    while (tempTime <= AStop) and (c <= fRepeatCount) do
      begin
        if MainCalculation then
        begin
          Result:= true;
          exit;
        end;       
      end;
  3:
    while (tempTime <= AStop) and (temp <= fEndDateOfRepeat) do
      if MainCalculation then
      begin
        Result:= true;
        exit;
      end;
  end;                 }
  //Result:= false;
end;

{ TTSWeekRepeatPattern }

function TWeekRepeatPattern.GetAllEventsBetween(beginEvent,
  endEvent: TDateTime; startDate, stopDate: TDate;
  exceptionList: TStringList; EventType: integer): TList;
var
  temp, wStart, wStop: TDate;
  needdays: set of byte;
  c: integer;
  i, y, m, d, h, min, s, ms, hs, mins, ss, mss: word;

  procedure MainCalculation();
  begin
    wStart:= temp - DayOfWeek(temp) + 2;
    wStop:= temp + 7 - DayOfWeek(temp);
    temp:= wStart;
    while temp <= wStop do
    begin
      if DayOfWeek(temp) in needdays then
      begin
        DecodeDate(temp, y,m,d);
        if (temp >= startDate) and (exceptionList.IndexOf(DateToStr(temp)) = -1) then
        begin
          case fRepeatLimitType of
          2:
            begin
              inc(c);
              if (c > fRepeatCount) then break;
            end;
          3: if (temp > fEndDateOfRepeat) then break;
          end;
          Result.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
        end;
      end;
      temp:= temp + 1;
    end;     
    temp:= wStart + 7 * fRepeatFrequency;
  end;

begin
  Result:= TList.Create;
  needdays:= [];
  DecodeDateTime(endEvent, y,m,d,hs,mins,ss,mss);
  DecodeDateTime(beginEvent, y,m,d,h,min,s,ms);
  for i:= 1 to 6 do
    if RepeatMask[i] <> '_' then
      Include(needdays, i+1);
  temp:= EncodeDate(y, m, d);
  c:= 0;
  case (fRepeatLimitType) of
  1:
    while (temp <= stopDate) do
      MainCalculation;
  2:
    while (temp <= stopDate) and (c < fRepeatCount) do
      MainCalculation;
  3:
    while (temp <= stopDate) and (temp <= fEndDateOfRepeat) do
      MainCalculation;
  end;
end;

function TWeekRepeatPattern.GetEventMaxDate(BeginDate: TDate): TDate;
begin
  case RepeatLimitType of
  1, 3: Result:= EndDateOfRepeat;
  2: Result:= BeginDate + fRepeatFrequency*7*fRepeatCount;
  end;
end;

function TWeekRepeatPattern.IsOccured(eventBeginTime, eventEndTime, AStart, AStop: TDateTime): boolean;
var
  checkStartTime, checkStopTime: TDateTime;
  needdays: set of byte;
  i, y, m, d, h, min, s, ms: word;

  function CalcRepeatCount(): integer;
  var
    temp: TDate;
  begin
    Result:= 0;
    temp:= EncodeDate(y, m, d);
    while (temp <= AStop) do
    begin
      if DayOfWeek(temp) in needdays then inc(Result);
      temp:= temp + 1;
    end;
  end;

begin
  Result:= false;
  if TDate(AStart) < TDate(eventBeginTime) then exit;  
  needdays:= [];
  DecodeDate(AStart, y,m,d);
  DecodeTime(eventBeginTime, h, min, s, ms);
  checkStartTime:= EncodeDateTime(y,m,d, h, min, s, ms);
  DecodeDate(AStop, y,m,d);
  DecodeTime(eventEndTime, h, min, s, ms);
  checkStopTime:= EncodeDateTime(y,m,d, h, min, s, ms);
  for i:= 1 to 6 do
    if RepeatMask[i] <> '_' then
      Include(needdays, i+1);
  case (fRepeatLimitType) of
  1:
    if ((WeeksBetween(eventBeginTime, AStart) mod fRepeatFrequency) = 0) and
      (((checkStartTime >= AStart) and (checkStartTime <= AStop)) or ((checkStopTime >= AStart) and (checkStopTime < AStop)) or ((checkStartTime <= AStart) and (checkStopTime >= AStop))) and (DayOfWeek(AStart) in needdays) then
    begin
      Result:= true;
      exit;
    end;
  2:
    if ((WeeksBetween(eventBeginTime, AStart) mod fRepeatFrequency) = 0) and
      (((checkStartTime >= AStart) and (checkStartTime <= AStop)) or ((checkStopTime >= AStart) and (checkStopTime < AStop)) or ((checkStartTime <= AStart) and (checkStopTime >= AStop)))
      and (DayOfWeek(AStart) in needdays) and (CalcRepeatCount <= fRepeatCount) then
    begin
      Result:= true;
      exit;
    end;
  3:
    if ((WeeksBetween(eventBeginTime, AStart) mod fRepeatFrequency) = 0) and
      (((checkStartTime >= AStart) and (checkStartTime <= AStop)) or ((checkStopTime >= AStart) and (checkStopTime < AStop)) or ((checkStartTime <= AStart) and (checkStopTime >= AStop)))
      and (DayOfWeek(AStart) in needdays) and (AStop <= fEndDateOfRepeat) then
    begin
      Result:= true;
      exit;
    end;
  end;

end;

{ TTSMonthRepeatPattern }

function TMonthRepeatPattern.GetAllEventsBetween(beginEvent,
  endEvent: TDateTime; startDate, stopDate: TDate;
  exceptionList: TStringList; EventType: integer): TList;
begin
  Result:= TList.Create;
    
end;

function TMonthRepeatPattern.IsOccured(eventBeginTime, eventEndTime: TDateTime; AStart, AStop: TDateTime): boolean;
var
  y, m, d, h, min, s, ms: word;
  tempTime: TDateTime;
  temp: TDate;
  c: integer;

  function FirstMainCalculation(): boolean;
  begin
    if (d < DaysInMonth(EncodeDate(y,m,1))) then
    begin
      tempTime:= EncodeDateTime(y,m,d,h,min,s,ms);
      if (tempTime >= AStart) and (AStop <= AStop) then
      begin
        Result:= true;
        AStart:= tempTime;
        exit;
      end;
    end;
    m:= m + fRepeatFrequency;
    if (m > 12) then
    begin
      inc(y);
      m:= 1;
    end;
    temp:= EncodeDate(y,m,d);
    Result:= false;
  end;

  function SecondMainCalculation(): boolean;
  var
    i: integer;
  begin
    temp:= EncodeDate(y, m, 1);
    for i:= 1 to 7 do
    begin
      if (DayOfWeek(temp) = StrToInt(Copy(fRepeatMask, 3, 1))) then
      begin
        DecodeDate(temp, y, m, d);
        break;
      end
      else temp:= temp + 1;
    end;
    if fRepeatMask[3] = 'п' then
    begin
      while (d <= DaysInMonth(temp)) do
      begin
        temp:= temp + 7;
        DecodeDate(temp, y, m, d);
      end;
    end
    else temp:= temp + 7*(StrToInt(Copy(fRepeatMask, 2, 1))-1);
    DecodeDate(temp, y,m,d);
    tempTime:= EncodeDateTime(y,m,d,h,min,s,ms);
    if (tempTime >= AStart) and (tempTime <= AStop) then
    begin
      Result:= true;
      AStart:= tempTime;
      exit;
    end;
    m:= m + fRepeatFrequency;
    if (m > 12) then
    begin
      inc(y);
      m:= 1;
    end;
    temp:= EncodeDate(y,m,d);
    Result:= false;
  end;
begin
  DecodeDateTime(eventBeginTime, y, m, d, h, min, s, ms);
  temp:= EncodeDate(y,m,d);
  c:= 1;
  case RepeatMask[1] of
  '1':
    begin
      d:= StrToInt(Copy(fRepeatMask, 2, 2));
      case (fRepeatLimitType) of
      1:
        while (temp <= AStop) do
          if FirstMainCalculation then
          begin
            Result:= true;
            exit;
          end;
       2:
        while (temp <= AStop) and (c <= fRepeatCount) do
        begin
          if FirstMainCalculation then
          begin
            Result:= true;
            exit;
          end;
          inc(c);
        end;
       3:
        while (temp <= AStop) and (temp <= fEndDateOfRepeat) do
          if FirstMainCalculation then
          begin
            Result:= true;
            exit;
          end;
       end;
    end;
  '2':
    begin
      case (fRepeatLimitType) of
      1:
        while (temp <= AStop) do
          if SecondMainCalculation then
          begin
            Result:= true;
            exit;
          end;
       2:
        while (temp <= AStop) and (c <= fRepeatCount) do
        begin
          if SecondMainCalculation then
          begin
            Result:= true;
            exit;
          end;
          inc(c);
        end;
       3:
        while (temp <= AStop) and (temp <= fEndDateOfRepeat) do
          if SecondMainCalculation then
          begin
            Result:= true;
            exit;
          end;
       end;
    end;
  end;
  Result:= false;
end;

{ TSheduleEvent }

procedure TSheduleEvent.AddException(value: TSheduleEvent);
begin
  if not Self.IsException then
  begin
    fExceptions.Add(value);
    Exceptions[fExceptions.Count-1].ParrentEventIK:= self.EventIK;
  end
  else EApplicationException.Create('Выбранное событие является исключением. Для исключений нельзя создавать дочерние исключения');
end;

procedure TSheduleEvent.Assign(AEvent: TSheduleEvent);
var
  i: integer;
begin
  inherited Assign(AEvent);
  fEventIK:= AEvent.EventIK;
  fEventType:= AEvent.EventType;

  {
  fStart:= AEvent.Start;
  fStop:= AEvent.Stop;
  fKafedraIK:= AEvent.KafedraIK;
  fFormEdIK:= AEvent.FormEdIK;
  fPlanTeacherIK:= AEvent.PlanTeacherIK;
  fCalcUnitIK:= AEvent.CalcUnitIK;
  fCalcUnitPotokIK:= AEvent.CalcUnitPotokIK;
  fCalcUnitSchemeDecomposeType:= AEvent.CalcUnitSchemeDecomposeType;
  if not Assigned(fGroupIKList) then fGroupIKList:= TStringList.Create;
  fGroupIKList.Assign(AEvent.GroupIKList);
  if not Assigned(fFacultyIKList) then fFacultyIKList:= TStringList.Create;
  fFacultyIKList.Assign(AEvent.FacultyIKList);
  fGroupIKListIsLoaded:= true;
  fDiscIK:= AEvent.DiscIK;
  fVidZanyatIK:= AEvent.VidZanyatIK;
  fVidNagruzkiIK:= AEvent.VidNagruzkiIK;
  fRoomIK:= AEvent.RoomIK;
  TeacherIK:= AEvent.TeacherIK;
  fCalcUnitName:= AEvent.CalcUnitName;
  fDiscName:= AEvent.DiscName;
//  fShortDiscName:= AEvent.ShortDiscName;
  fRoomName:= AEvent.RoomName;
  fVidZanyatName:= AEvent.VidZanyatName;
  fVidNagruzkiName:= AEvent.VidNagruzkiName;      }

  fIsException:= AEvent.IsException;
  fBeginDate:= AEvent.BeginDate;
  fExceptionDate:= AEvent.ExceptionDate;
  if fRepeatPattern <> nil then FreeAndNil(fRepeatPattern);
  if fExceptions <> nil then
  begin
    fExceptions.Clear;
    FreeAndNil(fExceptions);
  end;
  if not fIsException then
  begin
    if AEvent.RepeatPattern <> nil then
    begin
      case AEvent.RepeatPattern.RepeatType of
      1: fRepeatPattern:= TDayRepeatPattern.Create;
      2: fRepeatPattern:= TWeekRepeatPattern.Create;
      3: fRepeatPattern:= TMonthRepeatPattern.Create;
      end;
      fRepeatPattern.Assing(AEvent.RepeatPattern);
    end;
    fExceptions:= TObjectList.Create;
    if AEvent.GetExceptionCount > 0 then
      for I := 0 to AEvent.GetExceptionCount - 1 do
        fExceptions.Add(TSheduleEvent.Create(TSheduleEvent(AEvent.Exceptions[i])));
  end;
end;

constructor TSheduleEvent.Create(ASourceDataSet: TDataSet;
  AIsException: boolean);
begin
  inherited Create;
  fExceptions:= TObjectList.Create;
  Assign(ASourceDataSet, AIsException);
end;

{
constructor TSheduleEvent.Create(ABeginDate, AStart,
  AStop: TDateTime; AKafedraIK, AFormEdIK, ASheduleIK, AEventIK, AEventType, ARepeatPatternIK, ATeacherIK, APlanTeacherIK,
  ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK: integer; AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string; AIsExeption: boolean);
var
  y,m,d,h,min,s,ms: word;
begin
  DecodeDate(ABeginDate, y,m,d);
  DecodeTime(AStart, h, min, s, ms);
  AStart:= EncodeDateTime(y,m,d,h,min,s,ms);
  DecodeTime(AStop, h, min, s, ms);
  AStop:= EncodeDateTime(y,m,d,h,min,s,ms);
  self.Create;
  inherited Create(AStart, AStop, AKafedraIK, AFormEdIK, ASheduleIK, ATeacherIK, APlanTeacherIK,
    ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK, AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName);
  fEventIK:= AEventIK;
  fEventType:= AEventType;
  fBeginDate:= ABeginDate;
  fIsException:= AIsExeption;
  if not fIsException then
    ReadInfo(ARepeatPatternIK)
  else
    fRepeatPattern:= nil;
end;       }

{
constructor TSheduleEvent.Create(ASheduleIK, AEventIK: integer);
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'Select * FROM GetSheduleItemsForObject(1, -1, ' + IntToStr(AEventIK) + ')';
  tempDataSet.Open;
  if tempDataSet.RecordCount = 0 then
  begin
    tempDataSet.Close;
    tempDataSet.Free;
    raise Exception.Create('Ошибка при чтении события из базы данных. Запись в базе данных некорректна!');
  end;
  self.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, ASheduleIK, AEventIK, tempDataSet.FieldByName('ik_event_type').AsInteger, tempDataSet.FieldByName('ik_repeat_pattern').AsInteger,
        tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean);
  tempDataSet.Close;
  tempDataSet.Free;
end;        }

constructor TSheduleEvent.Create;
begin
  inherited Create;
  fExceptions:= TObjectList.Create;
end;

procedure TSheduleEvent.Assign(ASourceDataSet: TDataSet; AIsException: boolean);
var
  y,m,d,h,min,s,ms: word;
begin
  inherited Assign(ASourceDataSet);
  DecodeDate(ASourceDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
  DecodeTime(ASourceDataSet.FieldByName('dt_time_start').AsDateTime, h, min, s, ms);
  fStart:= EncodeDateTime(y,m,d,h,min,s,ms);
  DecodeTime(ASourceDataSet.FieldByName('dt_time_stop').AsDateTime, h, min, s, ms);
  fStop:= EncodeDateTime(y,m,d,h,min,s,ms);
  fEventIK:= ASourceDataSet.FieldByName('ik_event').AsInteger;
  fEventType:= ASourceDataSet.FieldByName('ik_event_type').AsInteger;
  fBeginDate:= ASourceDataSet.FieldByName('dBegin_date').AsDateTime;
  fIsException:= AIsException;
  if Assigned(fRepeatPattern) then FreeAndNil(fRepeatPattern);
  if not fIsException then
  begin
    if (ASourceDataSet.FieldByName('except_count').AsInteger > 0) then LoadExceptions;
    fRepeatPattern:= TSheduleRegistry.Functions.GetRepeatPattern(ASourceDataSet);
  end
  else
  begin
    fExceptionDate:= ASourceDataSet.FieldByName('dExceptionDate').AsDateTime;
    fParrentEventIK:= ASourceDataSet.FieldByName('ik_old_event').AsInteger;
  end;
end;

constructor TSheduleEvent.Create(AEvent: TSheduleEvent);
begin
  Create;
  self.Assign(AEvent);
end;

function TSheduleEvent.DeleteException(index: integer): boolean;
begin
  Result:= false;
  if not Self.IsException then
  begin
    if (index < fExceptions.Count) and (index >= 0) then
    begin
      TSheduleController.MainFunctions.DeleteException(Exceptions[index].EventIK);
      fExceptions.Delete(index);
      Result:= true;
    end;
  end
  else EApplicationException.Create('Выбранное событие является исключением. Исключения не могут иметь дочерних исключений.');
end;

destructor TSheduleEvent.Destroy;
begin
  if Assigned(fExceptions) then FreeAndNil(fExceptions);
  if Assigned(fRepeatPattern) then FreeAndNil(fRepeatPattern);
  inherited;
end;

function TSheduleEvent.GetAllEventsBetween(startDate, stopDate: TDate): TObjectList;
var
  i: integer;
  y,m,d: word;
  tempList: TList;
  exceptionDateList: TStringList;
begin
  Result:= TObjectList.Create;
  exceptionDateList:= TStringList.Create;
  if (not self.IsException) then
  begin
    if (fExceptions.Count > 0) then
    begin
      for i:= 0 to fExceptions.Count-1 do
      begin
        DecodeDate(TSheduleEvent(fExceptions[i]).Start, y, m,d);
        if (EncodeDate(y,m,d) >= startDate) and (EncodeDate(y,m,d) <= stopDate) then
        begin
          Result.Add(TFactEvent.Create(TSheduleEvent(fExceptions[i]).Start, TSheduleEvent(fExceptions[i]).Stop));
          exceptionDateList.Add(DateToStr(TSheduleEvent(fExceptions[i]).ExceptionDate));
        end;
      end;
    end;
    tempList:= fRepeatPattern.GetAllEventsBetween(Start, Stop, startDate, stopDate, exceptionDateList, EventType);
    for i:= 0 to tempList.Count-1 do
      Result.Add(tempList[i]);
    tempList.Free;
  end
  else Result.Add(TFactEvent.Create(Start, Stop));
end;

function TSheduleEvent.GetEventMaxDate: TDate;
begin
  if fIsException then Result:= fBeginDate
  else
  begin
    if fRepeatPattern <> nil then Result:= fRepeatPattern.GetEventMaxDate(fBeginDate)
    else Result:= fBeginDate;
  end;
end;

function TSheduleEvent.GetException(index: integer): TSheduleEvent;
begin
  Result:= nil;
  if Assigned(fExceptions) then
    if not ((index >= fExceptions.Count) and (index < 0)) then
      Result:= TSheduleEvent(fExceptions[index]);
end;

function TSheduleEvent.GetExceptionCount: integer;
begin
  Result:= 0;
  if not Self.IsException then
    if Assigned(fExceptions) then
      Result:= fExceptions.Count;
end;

function TSheduleEvent.IsOccured(AStart, AStop: TDateTime): TSheduleEvent;
var
  i: integer;
  y,m,d, y1, m1, d1: word;
  isExceptionOccured: boolean;
begin
  if (not self.IsException) then
  begin
    DecodeDate(AStart, y1, m1,d1);
    isExceptionOccured:= false;
    if Assigned(fExceptions) then
      if (fExceptions.Count > 0) then
      begin
        for i:= 0 to fExceptions.Count-1 do
        begin
          DecodeDate(TSheduleEvent(fExceptions[i]).Start, y, m,d);
          if (y = y1) and (m = m1) and (d = d1) then
          begin
            if (TSheduleEvent(fExceptions[i]).Start >= AStart) and (TSheduleEvent(fExceptions[i]).Start <= AStop) then
            begin
                Result:= TSheduleEvent(fExceptions[i]);
                exit;
            end
            else
            begin
              DecodeDate(TSheduleEvent(fExceptions[i]).ExceptionDate, y, m,d);
              if (y = y1) and (m = m1) and (d = d1) then
                isExceptionOccured:= true
              else
                isExceptionOccured:= false;
         //   break;
            end;
          end
          else
          begin
            DecodeDate(TSheduleEvent(fExceptions[i]).ExceptionDate, y, m,d);
            if (y = y1) and (m = m1) and (d = d1) then
            begin
              Result:= nil;
              exit;
            end;
          end;
        end;
      end;
      if (not isExceptionOccured) and (Assigned(fRepeatPattern)) then
        if RepeatPattern.IsOccured(self.Start, self.Stop, AStart, AStop) then
        begin
          Result:= self;
          exit;
        end;
    end;
  Result:= nil;
end;

function TSheduleEvent.IsOccuredWithoutException(AStart,
  AStop: TDateTime): TSheduleEvent;
begin
  Result:= nil;
  if Assigned(fRepeatPattern) then
    if RepeatPattern.IsOccured(self.Start, self.Stop, AStart, AStop) then
    begin
      Result:= self;
      exit;
    end;
end;

procedure TSheduleEvent.LoadExceptions;
begin
  if not self.IsException then
  begin
    if Assigned(fExceptions) then FreeAndNil(fExceptions);
    fExceptions:= TSheduleRegistry.Functions.GetExceptions(fEventIK);
  end;
end;

{
constructor TSheduleItem.Create(AStart, AStop: TDateTime; AKafedraIK, AFormEdIK, ASheduleIK,
  ATeacherIK, APlanTeacherIK, ACalcUnitIK, ADiscIK, AVidZanyatIK,
  AVidNagruzkiIK, ARoomIK: integer; AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string);
begin
  Create;
  fSheduleIK:= ASheduleIK;
  fKafedraIK:= AKafedraIK;
  fFormEdIK:= AFormEdIK;
  fStart:= AStart;
  fStop:= AStop;

  CalcUnitIK:= ACalcUnitIK;       // присвоим свойству, чтоб загрузить инфу
  fCalcUnitName:= ACalcUnitName;
  TeacherIK:= ATeacherIK;
  fPlanTeacherIK:= APlanTeacherIK;
  DiscIK:= ADiscIK;
  fDiscName:= ADiscName;
  //fShortDiscName:= ADiscShortName;
  VidZanyatIK:= AVidZanyatIK;
  fVidZanyatName:= AVidZanyatName;
  VidNagruzkiIK:= AVidNagruzkiIK;
  fVidNagruzkiName:= AVidNagruzkiName;
  RoomIK:= ARoomIK;
end;    }

procedure TSheduleItem.Assign(AItem: TSheduleItem);
begin
  fVersion:= AItem.Version;
  fStart:= AItem.Start;
  fStop:= AItem.Stop;
  fSheduleIK:= AItem.SheduleIK;
  fKafedraIK:= AItem.KafedraIK;
  fFormEdIK:= AItem.FormEdIK;
  fPlanTeacherIK:= AItem.PlanTeacherIK;
  fCalcUnitIK:= AItem.CalcUnitIK;
  fCalcUnitPotokIK:= AItem.CalcUnitPotokIK;
  fCalcUnitSchemeDecomposeType:= AItem.CalcUnitSchemeDecomposeType;
  if not Assigned(fGroupIKList) then fGroupIKList:= TStringList.Create;
  fGroupIKList.Assign(AItem.GroupIKList);
  if not Assigned(fFacultyIKList) then fFacultyIKList:= TStringList.Create;
  fFacultyIKList.Assign(AItem.FacultyIKList);
  fGroupIKListIsLoaded:= true;
  fDiscIK:= AItem.DiscIK;
  fVidZanyatIK:= AItem.VidZanyatIK;
  fVidNagruzkiIK:= AItem.VidNagruzkiIK;
  fRoomIK:= AItem.RoomIK;
  TeacherIK:= AItem.TeacherIK;
  fCalcUnitName:= AItem.CalcUnitName;
  fDiscName:= AItem.DiscName;
//  fShortDiscName:= AEvent.ShortDiscName;
  fRoomName:= AItem.RoomName;
  fCampusName:= AItem.CampusName;
  fVidZanyatName:= AItem.VidZanyatName;
  fVidNagruzkiName:= AItem.VidNagruzkiName;
end;

procedure TSheduleItem.Assign(ASourceDataSet: TDataSet);
begin
  fSheduleIK:= ASourceDataSet.FieldByName('ik_shedule').AsInteger;
  fKafedraIK:= ASourceDataSet.FieldByName('ik_kaf').AsInteger;
  fFormEdIK:= ASourceDataSet.FieldByName('ik_form_ed').AsInteger;
  fStart:= ASourceDataSet.FieldByName('dt_time_start').AsDateTime;
  fStop:= ASourceDataSet.FieldByName('dt_time_stop').AsDateTime;

  CalcUnitIK:= ASourceDataSet.FieldByName('ik_calc_unit').AsInteger;       // присвоим свойству, чтоб загрузить инфу
  fCalcUnitName:= ASourceDataSet.FieldByName('cName_calc_unit').AsString;
  fCalcUnitPotokIK:= ASourceDataSet.FieldByName('ik_potok_semestr').AsInteger;
  fCalcUnitSchemeDecomposeType:= ASourceDataSet.FieldByName('ik_decompose_type').AsInteger;
  TeacherIK:= ASourceDataSet.FieldByName('ik_id_prepod').AsInteger;
  fWorkTypeName:= ASourceDataSet.FieldByName('cName_work_type_short').AsString;
  fTeacherLastName:= ASourceDataSet.FieldByName('clastname').AsString;
  fTeacherFirstName:= ASourceDataSet.FieldByName('cfirstname').AsString;
  fTeacherCoatch:= ASourceDataSet.FieldByName('cotch').AsString;
  fTabN:= ASourceDataSet.FieldByName('iTab_n').AsInteger;
  fPlanTeacherIK:= ASourceDataSet.FieldByName('ik_id_plan_prepod').AsInteger;
  DiscIK:= ASourceDataSet.FieldByName('ik_disc').AsInteger;
  fDiscName:= ASourceDataSet.FieldByName('cName_disc').AsString;
  //fShortDiscName:= ADiscShortName;
  VidZanyatIK:= ASourceDataSet.FieldByName('ik_vid_zanyat').AsInteger;
  fVidZanyatName:= ASourceDataSet.FieldByName('cName_vid_zanyat').AsString;
  VidNagruzkiIK:= ASourceDataSet.FieldByName('ik_vid_nagruzki').AsInteger;
  fVidNagruzkiName:= AnsiLowerCase(ASourceDataSet.FieldByName('Сname_vid_nagruzki_short').AsString);
  RoomIK:= ASourceDataSet.FieldByName('ik_room').AsInteger;
  fRoomName:= ASourceDataSet.FieldByName('Cname_room').AsString;
  fCampusName:= ASourceDataSet.FieldByName('CName_campus').AsString;
  fVersion:= ASourceDataSet.FieldByName('i_version').AsInteger;

  if ASourceDataSet.FieldByName('ik_grup').Value <> NULL then
  begin
    fGroupIKList.Add(ASourceDataSet.FieldByName('ik_grup').AsString);
    fFacultyIKList.Add(ASourceDataSet.FieldByName('ik_fac').AsString);
    fGroupIKListIsLoaded:= true;
  end;
end;

destructor TSheduleItem.Destroy;
begin
  if Assigned(fGroupIKList) then FreeAndNil(fGroupIKList);
  if Assigned(fFacultyIKList) then FreeAndNil(fFacultyIKList);
  inherited;
end;

function TSheduleItem.GetCalcUnitName: string;
var
  fDataSet: TADODataSet;
begin
  Result:= '';
  if fCalcUnitName = '<not_loaded>' then
  begin
    fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fDataSet.CommandText:= 'Select Cname_calc_unit From Calc_unit_semestr Where ik_calc_unit = ' + IntToStr(fCalcUnitIK);
      fDataSet.Open;
      if fDataSet.RecordCount = 0 then
        raise EApplicationException.Create('Расчетная единица с указанным ID не найдена в базе данных!');
      fCalcUnitName:= fDataSet.FieldByName('Cname_calc_unit').AsString;
    finally
      if fDataSet.Active then fDataSet.Close;
      fDataSet.Free;
    end;
  end;
  Result:= fCalcUnitName;
end;

function TSheduleItem.GetCalcUnitPotokIK: integer;
begin
  if fCalcUnitPotokIK = -1 then LoadCalcUnitSchemeInfo;
  Result:= fCalcUnitPotokIK;
end;

function TSheduleItem.GetCalcUnitSchemeDecomposeType: integer;
begin
  if fCalcUnitSchemeDecomposeType = -1 then LoadCalcUnitSchemeInfo;
  Result:= fCalcUnitSchemeDecomposeType;
end;

function TSheduleItem.GetDiscName: string;
var
  fDataSet: TADODataSet;
begin
  Result:= '';
  if fDiscName = '<not_loaded>' then
  begin
    fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fDataSet.CommandText:= 'Select * From Discpln Where ik_disc = ' + IntToStr(fDiscIK);
      fDataSet.Open;
      if fDataSet.RecordCount = 0 then
        raise EApplicationException.Create('Дисциплина с указанным ID не найдена в базе данных!');
      fDiscName:= fDataSet.FieldByName('cName_disc').AsString;
    finally
      if fDataSet.Active then fDataSet.Close;
      fDataSet.Free;
    end;
  end;
  Result:= fDiscName;
end;

function TSheduleItem.GetFacultyIKList: TStringList;
begin
  if not fGroupIKListIsLoaded then LoadGroupIKList;
  Result:= fFacultyIKList;
end;

function TSheduleItem.GetGroupIKList: TStringList;
begin
  if not fGroupIKListIsLoaded then LoadGroupIKList;
  Result:= fGroupIKList;
end;

function TSheduleItem.GetRoomName: string;
var
  fDataSet: TADODataSet;
begin
  Result:= '';
  if (fRoomName = '<not_loaded>') or (fCampusName = '<not_loaded>') then
  begin
    fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fDataSet.CommandText:= 'Select cName_room, cName_campus FROM Room INNER JOIN Campus ON Room.ik_campus = Campus.ik_campus Where ik_room = ' + IntToStr(fRoomIK);
      fDataSet.Open;
      if fDataSet.RecordCount = 0 then
        raise EApplicationException.Create('Аудитория с указанным ID не найдена в базе данных!');
      fRoomName:= fDataSet.FieldByName('cName_room').AsString;
      fCampusName:= fDataSet.FieldByName('cName_campus').AsString;
    finally
      if fDataSet.Active then fDataSet.Close;
      fDataSet.Free;
    end;
  end;
  if Length(fRoomName) > 3 then
    Result:= fRoomName + ' ' + fCampusName
  else Result:= fRoomName + fCampusName;
end;

function TSheduleItem.GetTabN: integer;
begin
  Result:= -1;
  if fTabN = -1 then LoadTeacherNames;
  Result:= fTabN;
end;

function TSheduleItem.GetTeacherName: string;
begin
  Result:= '';
  if (fTeacherLastName = '<not_loaded>') or (fTeacherFirstName = '<not_loaded>') or (fTeacherCoatch = '<not_loaded>') or (fTabN = -1) then LoadTeacherNames;
  Result:= fTeacherLastName + ' ' + Copy(fTeacherFirstName, 1, 1) + '. ' + Copy(fTeacherCoatch, 1, 1) + '. (таб. №' + IntToStr(fTabN) + ')';
end;

function TSheduleItem.GetTeacherNameWithoutTabN: string;
begin
  Result:= '';
  if (fTeacherLastName = '<not_loaded>') or (fTeacherFirstName = '<not_loaded>') or (fTeacherCoatch = '<not_loaded>') then LoadTeacherNames;
  Result:= fTeacherLastName + ' ' + Copy(fTeacherFirstName, 1, 1) + '. ' + Copy(fTeacherCoatch, 1, 1) + '.';
end;

function TSheduleItem.GetTeacherWithWTName: string;
begin
  Result:= '';
  if (fTeacherLastName = '<not_loaded>') or (fTeacherFirstName = '<not_loaded>') or (fTeacherCoatch = '<not_loaded>') or (fTabN = -1) or (fWorkTypeName = '<not_loaded>') then LoadTeacherNames;
  Result:= fTeacherLastName + ' ' + Copy(fTeacherFirstName, 1, 1) + '. ' + Copy(fTeacherCoatch, 1, 1) + '. (таб. №' + IntToStr(TabN) + ', ' + fWorkTypeName + ')';
end;

function TSheduleItem.GetVidNagruzkiName: string;
var
  fDataSet: TADODataSet;
begin
  Result:= '';
  if fVidNagruzkiName = '<not_loaded>' then
  begin
    fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fDataSet.CommandText:= 'Select * From Vid_nagruzki Where ik_vid_nagruzki = ' + IntToStr(fVidNagruzkiIK);
      fDataSet.Open;
      if fDataSet.RecordCount = 0 then
        raise EApplicationException.Create('Вид нагрузки с указанным ID не найден в базе данных!');
      fVidNagruzkiName:= AnsiLowerCase(fDataSet.FieldByName('Сname_vid_nagruzki_short').AsString);
    finally
      if fDataSet.Active then fDataSet.Close;
      fDataSet.Free;
    end;
  end;
  Result:= fVidNagruzkiName;
end;

function TSheduleItem.GetVidZanyatName: string;
var
  fDataSet: TADODataSet;
begin
  Result:= '';
  if fVidZanyatName = '<not_loaded>' then
  begin
    fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      fDataSet.CommandText:= 'Select * From vid_zaniat Where iK_vid_zanyat = ' + IntToStr(fVidZanyatIK);
      fDataSet.Open;
      if fDataSet.RecordCount = 0 then
        raise EApplicationException.Create('Вид занятий с указанным ID не найден в базе данных!');
      fVidZanyatName:= AnsiLowerCase(fDataSet.FieldByName('cshort_vid_zanyat').AsString);
    finally
      if fDataSet.Active then fDataSet.Close;
      fDataSet.Free;
    end;
  end;
  Result:= fVidZanyatName;
end;

function TSheduleItem.GetWorkTypeName: string;
begin
  Result:= '';
  if fWorkTypeName = '<not_loaded>' then LoadTeacherNames;
  Result:= fWorkTypeName;
end;

procedure TSheduleItem.LoadCalcUnitSchemeInfo;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_decompose_type, ik_potok_semestr FROM Potok_semestr_shema WHERE ik_shema = (SELECT ik_shema FROM Calc_unit_semestr WHERE ik_calc_unit = ' + IntToStr(fCalcUnitIK) + ')';
    tempDS.Open;
    if tempDS.RecordCount = 0 then
        raise EApplicationException.Create('Схема деления с указанным ID не найдена в базе данных!');

    fCalcUnitPotokIK:= tempDS.FieldByName('ik_potok_semestr').AsInteger;
    fCalcUnitSchemeDecomposeType:= tempDS.FieldByName('ik_decompose_type').AsInteger;
    tempDS.Close;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;


procedure TSheduleItem.LoadGroupIKList;
var
  tempDS: TADODataSet;
  findedPotokGroups: TPotokGroups;
begin
  fGroupIKList.Clear;
  fFacultyIKList.Clear;
  case CalcUnitSchemeDecomposeType of
    1:
      begin
        //TNagruzkaController.Preparation.GetAllGroupsFromPotok(@tempDS, CalcUnitPotokIK, false);
        findedPotokGroups:= TSheduleRegistry.PotokGroupsStorage.Potoks[CalcUnitPotokIK];
        if findedPotokGroups <> nil then
        begin
          fGroupIKList.Assign(findedPotokGroups.GroupIKList);
          fFacultyIKList.Assign(findedPotokGroups.FacultyIKList);
        end;
      end;
    2,3:
      begin
        tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
        try
          tempDS.CommandText:= 'SELECT rcug.ik_grup, rsf.ik_fac FROM Calc_unit_grup rcug INNER JOIN Grup ON rcug.ik_grup = Grup.ik_grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE ik_calc_unit = ' + IntToStr(fCalcUnitIK);
          tempDS.Open;
          if tempDS.RecordCount = 0 then
               raise EApplicationException.Create('Данная группа не закреплена за разделением потоков в подсистеме "Нагрузка".');
          while not tempDS.Eof do
          begin
            fGroupIKList.Add(tempDS.FieldByName('ik_grup').AsString);
            fFacultyIKList.Add(tempDS.FieldByName('ik_fac').AsString);
            tempDS.Next;
          end;
        finally
          if tempDS.Active then tempDS.Close;
          tempDS.Free;
        end;
      end;
  end;
  fGroupIKListIsLoaded:= true;
end;

procedure TSheduleItem.LoadTeacherNames;
var
  fDataSet: TADODataSet;
begin
  fDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    fDataSet.CommandText:= 'Select clastname, cfirstname, cotch, Prepods.iTab_n, cName_work_type_short ' +
      'FROM Relation_kafedra_prep rkp INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type INNER JOIN Prepods ON rkp.iTab_n = Prepods.iTab_n Where ik_id_prepod = ' + IntToStr(fTeacherIK);
    fDataSet.Open;
    if fDataSet.RecordCount = 0 then
      raise EApplicationException.Create('Преподаватель с ID = ' + IntToStr(fTeacherIK) + ' не найден в базе данных!');
    fWorkTypeName:= fDataSet.FieldByName('cName_work_type_short').AsString;
    fTeacherLastName:= fDataSet.FieldByName('clastname').AsString;
    fTeacherFirstName:= fDataSet.FieldByName('cfirstname').AsString;
    fTeacherCoatch:= fDataSet.FieldByName('cotch').AsString;
    fTabN:= fDataSet.FieldByName('iTab_n').AsInteger;
  finally
    if fDataSet.Active then fDataSet.Close;
    fDataSet.Free;
  end;
end;

constructor TSheduleItem.Create;
begin
  fVersion:= 0;
  fGroupIKList:= TStringList.Create;
  fFacultyIKList:= TStringList.Create;
  fGroupIKListIsLoaded:= false;
end;

procedure TSheduleItem.SetCalcUnitIK(value: integer);
var
  tempDS: TADODataSet;
begin
  if fCalcUnitIK <> value then
  begin
    fCalcUnitIK:= value;
    fCalcUnitName:= '<not_loaded>';
    fCalcUnitPotokIK:= -1;
    fCalcUnitSchemeDecomposeType:= -1;
    fGroupIKListIsLoaded:= false;
  {  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
    try

      tempDS.CommandText:= 'SELECT ik_decompose_type, ik_potok FROM Potok_shema WHERE ik_shema_of_potok = (SELECT ik_shema_of_potok FROM Calc_unit WHERE ik_calc_unit = ' + IntToStr(fCalcUnitIK) + ')';
      tempDS.Open;
      if tempDS.RecordCount = 0 then
        raise EApplicationException.Create('Схема деления с указанным ID не найдена в базе данных!');
      decType:= tempDS.FieldByName('ik_decompose_type').AsInteger;
      tempPotokIK:= tempDS.FieldByName('ik_potok').AsInteger;
      tempDS.Close;

      case decType of
      1: TNagruzkaController.Preparation.GetAllGroupsFromPotok(@tempDS, tempPotokIK, false);
      2,3:
        begin
          tempDS.CommandText:= 'SELECT rcug.ik_grup, rsf.ik_fac FROM Relation_calc_unit_grup rcug INNER JOIN Grup ON rcug.ik_grup = Grup.ik_grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE ik_calc_unit = ' + IntToStr(fCalcUnitIK);
          tempDS.Open;
        end;
      end;
      fGroupIKList.Clear;
      fFacultyIKList.Clear;
      while not tempDS.Eof do
      begin
        fGroupIKList.Add(tempDS.FieldByName('ik_grup').AsString);
        fFacultyIKList.Add(tempDS.FieldByName('ik_fac').AsString);
        tempDS.Next;
      end;
    finally
      if tempDS.Active then tempDS.Close;
      tempDS.Free;
    end;    }
  end;
end;

procedure TSheduleItem.SetDiscIK(const Value: integer);
begin
  if fDiscIK <> Value then  fDiscName:= '<not_loaded>';
  fDiscIK := Value;
end;

procedure TSheduleItem.SetRoomIK(const Value: integer);
begin
  if fRoomIK <> Value then
  begin
    fRoomName:= '<not_loaded>';
    fCampusName:= '<not_loaded>';
  end;
  fRoomIK := Value;
end;

procedure TSheduleItem.SetTeacherIK(const Value: integer);
begin
  if fTeacherIK <> Value then
  begin
    fTeacherLastName:= '<not_loaded>';
    fTeacherFirstName:= '<not_loaded>';
    fTeacherCoatch:= '<not_loaded>';
    fWorkTypeName:= '<not_loaded>';
    fTabN:= -1;
  end;
  fTeacherIK := Value;
end;

procedure TSheduleItem.SetVidNagruzkiIK(const Value: integer);
begin
  if fVidNagruzkiIK <> Value then fVidNagruzkiName:= '<not_loaded>';
  fVidNagruzkiIK := Value;
end;

procedure TSheduleItem.SetVidZanyatIK(const Value: integer);
begin
  if fVidZanyatIK <> Value then fVidZanyatName:= '<not_loaded>';
  fVidZanyatIK := Value;
end;

procedure TSheduleEvent.SetException(index: integer; Value: TSheduleEvent);
begin
  if Assigned(fExceptions) then
  begin
    if (index <= fExceptions.Count-1) and (index >= 0) then
      fExceptions[index]:= Value
    else EApplicationException.Create('Недопустимый номер исключающего события...');
  end;
end;

{ TRepeatPattern }

procedure TRepeatPattern.Assing(ARepeatPattern: TRepeatPattern);
begin
  fRepeatPattenIK:= ARepeatPattern.RepeatPattenIK;
  fRepeatType:= ARepeatPattern.RepeatType;
  fRepeatFrequency:= ARepeatPattern.RepeatFrequency;
  fRepeatMask:= ARepeatPattern.RepeatMask;
  fRepeatLimitType:= ARepeatPattern.RepeatLimitType;
  fRepeatCount:= ARepeatPattern.RepeatCount;
  fEndDateOfRepeat:= ARepeatPattern.EndDateOfRepeat;
end;

{ TSheduleEventStorageStructureItem }

function TSheduleEventStorageStructureItem.AddEvent(
  AValue: TSheduleEvent): TSheduleEvent;
begin
  Result:= fOwner.AddEvent(AValue);
//  Result:= fOwner.Items[fOwner.Add(AValue)];
//  fEvents.Add(Result);
end;

constructor TSheduleEventStorageStructureItem.Create(ASheduleIK, AIK: integer;
  MyOwner: TSheduleEventStorage; AItemType: TStructureItemType);
begin
  fIK:= AIK;
  fSheduleIK:= ASheduleIK;
  fOwner:= MyOwner;
  fEvents:= TList.Create;
  fItemType:= AItemType;
end;

function TSheduleEventStorageStructureItem.DeleteAllWithoutDeleteFromDB: boolean;
var
  i: integer;
begin
  if Assigned(fEvents) then
  begin
    for I := 0 to fEvents.Count - 1 do
      if fOwner.Remove(fEvents[i], false) < 0 then raise EApplicationException.Create('События, хранящееся в списке записи хранилища, не найдено в самом хранилище объекто');
    fEvents.Clear;
  end;
  Result:= true;
end;

{
function TSheduleEventStorageStructureItem.DeleteEvent(AEventIK: integer; IsDeleteFromDB: boolean): boolean;
var
  i: integer;
begin
  Result:= false;
  if Assigned(fEvents) then
  begin
    for i:= 0 to fEvents.Count - 1 do
      if Events[i].EventIK = AEventIK then
      begin
        fOwner.Remove(fEvents[i], IsDeleteFromDB);
        fEvents.Delete(i);
        Result:= true;
      end;
  end;
  if not Result then raise EApplicationException.Create('Событие не было удалено из хранилища событий');
end;
}

function TSheduleEventStorageStructureItem.DeleteEventByIndex(
  Index: integer; IsDeleteFromDB: boolean): boolean;
begin
//  Result:= false;
  Result:= fOwner.Remove(fEvents[Index], IsDeleteFromDB) >= 0;
{  begin
    fEvents.Delete(Index);
    Result:= true;
  end;       }
  if not Result then raise EApplicationException.Create('Событие не было удалено из хранилища событий');
end;

function TSheduleEventStorageStructureItem.DeleteEventWithoutTouchStorege(
  AEventIK: integer): boolean;
var
  i: integer;
begin
  Result:= false;
  if Assigned(fEvents) then
  begin
    for i:= 0 to fEvents.Count - 1 do
      if Events[i].EventIK = AEventIK then
      begin
        fEvents.Delete(i);
        Result:= true;
        break;
      end;
  end;
end;

destructor TSheduleEventStorageStructureItem.Destroy;
begin
  FreeAndNil(fEvents);
  inherited;
end;

function TSheduleEventStorageStructureItem.GetEvent(Index: Integer): TSheduleEvent;
begin
  Result:= nil;
  if (Index < fEvents.Count) and (Index >= 0) then
    Result:= fEvents[Index];
//  if Result = nil then raise Exception.Create('Событие с указаным индексом не обнаружено');
end;

function TSheduleEventStorageStructureItem.GetEventByIK(
  AEventIK: integer): TSheduleEvent;
var
  i: integer;
begin
  Result:= nil;
  for i:= 0 to fEvents.Count - 1 do
    if Events[i].EventIK = AEventIK then
    begin
      Result:= fEvents[i];
      break;
    end;
end;

function TSheduleEventStorageStructureItem.GetEventCount: integer;
begin
  Result:= 0;
  if Assigned(fEvents) then
    Result:= fEvents.Count;
end;

procedure TSheduleEventStorageStructureItem.RefreshEventList;
var
  i: integer;
begin
  if Assigned(fEvents) then
    fEvents.Clear
  else raise EApplicationException.Create('Список событий не инстанцирован');
  case fItemType of
  selsiGroup:
    for i := 0 to fOwner.Count - 1 do
      if (TSheduleEvent(fOwner.Items[i]).SheduleIK = fSheduleIK) and
        (TSheduleEvent(fOwner.Items[i]).GroupIKList.IndexOf(IntToStr(fIK)) >= 0) then
        fEvents.Add(fOwner.Items[i]);
  selsiTeacher:
    for i := 0 to fOwner.Count - 1 do
      if (TSheduleEvent(fOwner.Items[i]).SheduleIK = fSheduleIK) and
        (TSheduleEvent(fOwner.Items[i]).TabN = fIK) then
        fEvents.Add(fOwner.Items[i]);
  end;
end;

procedure TSheduleEventStorageStructureItem.SetEvent(Index: Integer;
  const Value: TSheduleEvent);
begin
  if (Index >= 0) and (Index < fEvents.Count) then
    fEvents[Index]:= Value
  else raise EApplicationException.Create('Событие с указанным индексом не обнаружено');
end;


{ TSheduleEventStorage }

function TSheduleEventStorage.AddEvent(AValue: TSheduleEvent): TSheduleEvent;
var
  i: integer;
begin
  i:= IndexOf(AValue);
  if i < 0 then
    Result:= Items[Add(AValue)]
  else Result:= Items[i];
  Teachers[AValue.SheduleIK, AValue.TabN].RefreshEventList;
  for i := 0 to AValue.GroupIKList.Count - 1 do
    Groups[AValue.SheduleIK, StrToInt(AValue.GroupIKList[i])].RefreshEventList;
end;

constructor TSheduleEventStorage.Create;
begin
  inherited Create(true);
  fGroupList:= TObjectList.Create;
  fTeacherList:= TObjectList.Create;
end;

function TSheduleEventStorage.CreateGroup(
  ASheduleIK, AGroupIK: integer): TSheduleEventStorageStructureItem;
begin
  Result:= TSheduleEventStorageStructureItem(fGroupList[fGroupList.Add(TSheduleEventStorageStructureItem.Create(ASheduleIK, AGroupIK, self, selsiGroup))]);
end;

function TSheduleEventStorage.CreateTeacher(
  ASheduleIK, ATabN: integer): TSheduleEventStorageStructureItem;
begin
  Result:= TSheduleEventStorageStructureItem(fTeacherList[fTeacherList.Add(TSheduleEventStorageStructureItem.Create(ASheduleIK, ATabN, self, selsiTeacher))]);
end;

function TSheduleEventStorage.DeleteEvent(AEventIK: integer;
  isDeleteFromDB: boolean): boolean;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if Items[i].EventIK = AEventIK then
    begin
      Result:= Remove(Items[i], isDeleteFromDB) >= 0;
      exit;
    end;
end;

destructor TSheduleEventStorage.Destroy;
begin
  FreeAndNil(fTeacherList);
  FreeAndNil(fGroupList);
  inherited Destroy;
end;

function TSheduleEventStorage.GetEvent(Index: Integer): TSheduleEvent;
begin
  Result:= TSheduleEvent(inherited Items[Index]);
end;

function TSheduleEventStorage.GetEventByIK(AEventIK: integer): TSheduleEvent;
var
  i: integer;
begin
  Result:= nil;
  for I := 0 to Count - 1 do
    if Items[i].EventIK = AEventIK then
    begin
      Result:= Items[i];
      break;
    end;
end;

function TSheduleEventStorage.GetGroup(
  ASheduleIK, AGroupIK: Integer): TSheduleEventStorageStructureItem;
var
  i: integer;
begin
  Result:= nil;
  for i := 0 to fGroupList.Count - 1 do
    if (TSheduleEventStorageStructureItem(fGroupList[i]).SheduleIK = ASheduleIK) and
      (TSheduleEventStorageStructureItem(fGroupList[i]).IK = AGroupIK) then
    begin
      Result:= TSheduleEventStorageStructureItem(fGroupList[i]);
      break;
    end;
  if Result = nil then Result:= CreateGroup(ASheduleIK, AGroupIK);
end;

function TSheduleEventStorage.GetTeacher(
  ASheduleIK, ATabN: Integer): TSheduleEventStorageStructureItem;
var
  i: integer;
begin
  Result:= nil;
  for i := 0 to fTeacherList.Count - 1 do
    if (TSheduleEventStorageStructureItem(fTeacherList[i]).SheduleIK = ASheduleIK) and
      (TSheduleEventStorageStructureItem(fTeacherList[i]).IK = ATabN) then
    begin
      Result:= TSheduleEventStorageStructureItem(fTeacherList[i]);
      break;
    end;
  if Result = nil then Result:= CreateTeacher(ASheduleIK, ATabN);
end;

function TSheduleEventStorage.Remove(AObject: TSheduleEvent; isDeleteFromDB: boolean): Integer;
var
  i: integer;
begin
  if isDeleteFromDB then
    TSheduleController.MainFunctions.DeleteEvent(AObject.EventIK);
  for I := 0 to AObject.GroupIKList.Count - 1 do
    Groups[AObject.SheduleIK, StrToInt(AObject.GroupIKList[i])].DeleteEventWithoutTouchStorege(AObject.EventIK);
  Teachers[AObject.SheduleIK, AObject.TabN].DeleteEventWithoutTouchStorege(AObject.EventIK);
  Result:= inherited Remove(AObject);
end;

procedure TSheduleEventStorage.SetEvent(Index: Integer;
  const Value: TSheduleEvent);
begin
  inherited Items[Index]:= Value;
end;

procedure TSheduleEventStorage.SetGroup(ASheduleIK, AGroupIK: Integer;
  const Value: TSheduleEventStorageStructureItem);
var
  i: integer;
begin
  for i := 0 to fGroupList.Count - 1 do
    if (TSheduleEventStorageStructureItem(fGroupList[i]).SheduleIK = ASheduleIK) and
      (TSheduleEventStorageStructureItem(fGroupList[i]).IK = AGroupIK) then
    begin
      fGroupList[i]:= Value;
      break;
    end;
end;

procedure TSheduleEventStorage.SetTeacher(ASheduleIK, ATabN: Integer;
  const Value: TSheduleEventStorageStructureItem);
var
  i: integer;
begin
  for i := 0 to fTeacherList.Count - 1 do
    if (TSheduleEventStorageStructureItem(fTeacherList[i]).SheduleIK = ASheduleIK) and
      (TSheduleEventStorageStructureItem(fTeacherList[i]).IK = ATabN) then
    begin
      fTeacherList[i]:= Value;
      break;
    end;
end;

{ TExaminationStorageStructureItem }

function TExaminationStorageStructureItem.AddExam(
  AValue: TSheduleExamination): TSheduleExamination;
begin
  Result:= fOwner.AddExam(AValue);
end;

constructor TExaminationStorageStructureItem.Create(ASheduleIK, AIK: integer;
  MyOwner: TExaminationStorage; AItemType: TStructureItemType);
begin
  fIK:= AIK;
  fSheduleIK:= ASheduleIK;
  fOwner:= MyOwner;
  fExaminations:= TList.Create;
  fItemType:= AItemType;
end;

function TExaminationStorageStructureItem.DeleteAllWithoutDeleteFromDB: boolean;
var
  i: integer;
begin
  for I := 0 to fExaminations.Count - 1 do
    fOwner.Remove(fExaminations[i], false);
  fExaminations.Clear;
  Result:= true;
end;

{
function TExaminationStorageStructureItem.DeleteExam(AExamIK: integer): boolean;
var
  i: integer;
begin
  Result:= false;
  for i:= 0 to fExaminations.Count - 1 do
    if Exams[i].ExamIK = AExamIK then
    begin
      fOwner.Remove(fExaminations[i], true);
      fExaminations.Delete(i);
      Result:= true;
    end;
  if not Result then raise EApplicationException.Create('Экзамен не был удален из хранилища экзаменов');
end;
}

function TExaminationStorageStructureItem.DeleteExamByIndex(
  Index: integer; IsDeleteFromDB: boolean): boolean;
begin
  Result:= fOwner.Remove(fExaminations[Index], IsDeleteFromDB) >= 0;
  if not Result then raise EApplicationException.Create('Экзамен не был удален из хранилища экзаменов');
end;


function TExaminationStorageStructureItem.DeleteExamWithoutTouchStorege(
  AExamIK: integer): boolean;
var
  i: integer;
begin
  Result:= false;
  if Assigned(fExaminations) then
  begin
    for i:= 0 to fExaminations.Count - 1 do
      if Exams[i].ExamIK = AExamIK then
      begin
        fExaminations.Delete(i);
        Result:= true;
        break;
      end;
  end;
end;

destructor TExaminationStorageStructureItem.Destroy;
begin
  fExaminations.Free;
  inherited;
end;

function TExaminationStorageStructureItem.GetExam(
  Index: Integer): TSheduleExamination;
begin
  Result:= fExaminations[Index];
end;

function TExaminationStorageStructureItem.GetExamByIK(
  AExamIK: integer): TSheduleExamination;
var
  i: integer;
begin
  Result:= nil;
  for i:= 0 to fExaminations.Count - 1 do
    if Exams[i].ExamIK = AExamIK then
    begin
      Result:= fExaminations[i];
      break;
    end;
end;

function TExaminationStorageStructureItem.GetExamCount: integer;
begin
  Result:= fExaminations.Count;
end;

procedure TExaminationStorageStructureItem.RefreshExamList;
var
  i: integer;
begin
  fExaminations.Clear;
  case fItemType of
  selsiGroup:
    for i := 0 to fOwner.Count - 1 do
      if (TSheduleExamination(fOwner.Items[i]).SheduleIK = fSheduleIK) and
        (TSheduleExamination(fOwner.Items[i]).GroupIKList.IndexOf(IntToStr(fIK)) >= 0) then
          fExaminations.Add(fOwner.Items[i]);
  selsiTeacher:
    for i := 0 to fOwner.Count - 1 do
      if (TSheduleExamination(fOwner.Items[i]).SheduleIK = fSheduleIK) and
        (TSheduleExamination(fOwner.Items[i]).TabN = fIK) then
          fExaminations.Add(fOwner.Items[i]);
  end;
end;

procedure TExaminationStorageStructureItem.SetExam(Index: Integer;
  const Value: TSheduleExamination);
begin
  fExaminations[Index]:= Value;
end;

{ TExaminationStorage }

function TExaminationStorage.AddExam(
  AValue: TSheduleExamination): TSheduleExamination;
var
  i: integer;
begin
  i:= IndexOf(AValue);
  if i < 0 then
    Result:= Items[Add(AValue)]
  else Result:= Items[i];
  Teachers[AValue.SheduleIK, AValue.TabN].RefreshExamList;
  for i := 0 to AValue.GroupIKList.Count - 1 do
    Groups[AValue.SheduleIK, StrToInt(AValue.GroupIKList[i])].RefreshExamList;
end;

constructor TExaminationStorage.Create;
begin
  inherited Create(true);
  fGroupList:= TObjectList.Create;
  fTeacherList:= TObjectList.Create;
end;

function TExaminationStorage.CreateGroup(
  ASheduleIK, AGroupIK: integer): TExaminationStorageStructureItem;
begin
  Result:= TExaminationStorageStructureItem(fGroupList[fGroupList.Add(TExaminationStorageStructureItem.Create(ASheduleIK, AGroupIK, self, selsiGroup))]);
end;

function TExaminationStorage.CreateTeacher(
  ASheduleIK, ATabN: integer): TExaminationStorageStructureItem;
begin
  Result:= TExaminationStorageStructureItem(fTeacherList[fTeacherList.Add(TExaminationStorageStructureItem.Create(ASheduleIK, ATabN, self, selsiTeacher))]);
end;

function TExaminationStorage.DeleteExam(AExamIK: integer;
  isDeleteFromDB: boolean): boolean;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if Items[i].ExamIK = AExamIK then
    begin
      Result:= Remove(Items[i], isDeleteFromDB) >= 0;
      exit;
    end;
end;

destructor TExaminationStorage.Destroy;
begin
  fTeacherList.Clear;
  FreeAndNil(fTeacherList);
  fGroupList.Clear;
  FreeAndNil(fGroupList);
  inherited;
end;

function TExaminationStorage.GetExam(Index: Integer): TSheduleExamination;
begin
  Result:= TSheduleExamination(inherited Items[Index]);
end;

function TExaminationStorage.GetExamByIK(AExamIK: integer): TSheduleExamination;
var
  i: integer;
begin
  Result:= nil;
  for I := 0 to Count - 1 do
    if Items[i].ExamIK = AExamIK then
    begin
      Result:= Items[i];
      break;
    end;
end;

function TExaminationStorage.GetGroup(
  ASheduleIK, AGroupIK: Integer): TExaminationStorageStructureItem;
var
  i: integer;
begin
  Result:= nil;
  for i := 0 to fGroupList.Count - 1 do
    if (TExaminationStorageStructureItem(fGroupList[i]).SheduleIK = ASheduleIK) and
      (TExaminationStorageStructureItem(fGroupList[i]).IK = AGroupIK) then
    begin
      Result:= TExaminationStorageStructureItem(fGroupList[i]);
      break;
    end;
  if Result = nil then Result:= CreateGroup(ASheduleIK, AGroupIK);
end;

function TExaminationStorage.GetTeacher(
  ASheduleIK, ATabN: Integer): TExaminationStorageStructureItem;
var
  i: integer;
begin
  Result:= nil;
  for i := 0 to fTeacherList.Count - 1 do
    if (TExaminationStorageStructureItem(fTeacherList[i]).SheduleIK = ASheduleIK) and
      (TExaminationStorageStructureItem(fTeacherList[i]).IK = ATabN) then
    begin
      Result:= TExaminationStorageStructureItem(fTeacherList[i]);
      break;
    end;
  if Result = nil then Result:= CreateTeacher(ASheduleIK, ATabN);
end;

function TExaminationStorage.Remove(AObject: TSheduleExamination; isDeleteFromDB: boolean): Integer;
var
  i: integer;
begin
  if isDeleteFromDB then
    TSheduleController.MainFunctions.DeleteExam(AObject.ExamIK);
  for I := 0 to AObject.GroupIKList.Count - 1 do
    Groups[AObject.SheduleIK, StrToInt(AObject.GroupIKList[i])].DeleteExamWithoutTouchStorege(AObject.ExamIK);
  Teachers[AObject.SheduleIK, AObject.TabN].DeleteExamWithoutTouchStorege(AObject.ExamIK);
  Result:= inherited Remove(AObject);
end;

procedure TExaminationStorage.SetExam(Index: Integer;
  const Value: TSheduleExamination);
begin
  inherited Items[Index]:= Value;  
end;

procedure TExaminationStorage.SetGroup(ASheduleIK, AGroupIK: Integer;
  const Value: TExaminationStorageStructureItem);
var
  i: integer;
begin
  for i := 0 to fGroupList.Count - 1 do
    if (TExaminationStorageStructureItem(fGroupList[i]).SheduleIK = ASheduleIK) and
      (TExaminationStorageStructureItem(fGroupList[i]).IK = AGroupIK) then
    begin
      fGroupList[i]:= Value;
      break;
    end;
end;

procedure TExaminationStorage.SetTeacher(ASheduleIK, ATabN: Integer;
  const Value: TExaminationStorageStructureItem);
var
  i: integer;
begin
  for i := 0 to fTeacherList.Count - 1 do
    if (TExaminationStorageStructureItem(fTeacherList[i]).SheduleIK = ASheduleIK) and
      (TExaminationStorageStructureItem(fTeacherList[i]).IK = ATabN) then
    begin
      fTeacherList[i]:= Value;
      break;
    end;
end;

{ TSheduleExamination }

procedure TSheduleExamination.Assign(AExam: TSheduleExamination);
begin
  inherited Assign(AExam);
  fExamIK:= AExam.ExamIK;

  {fStart:= AExam.Start;
  fStop:= AExam.Stop;
  fKafedraIK:= AExam.KafedraIK;
  fFormEdIK:= AExam.FormEdIK;
  fPlanTeacherIK:= AExam.PlanTeacherIK;
  fCalcUnitIK:= AExam.CalcUnitIK;
  if not Assigned(fGroupIKList) then fGroupIKList:= TStringList.Create;
  fGroupIKList.Assign(AExam.GroupIKList);
  if not Assigned(fFacultyIKList) then fFacultyIKList:= TStringList.Create;
  fFacultyIKList.Assign(AExam.GroupIKList);
  fDiscIK:= AExam.DiscIK;
  fVidZanyatIK:= AExam.VidZanyatIK;
  fVidNagruzkiIK:= AExam.VidNagruzkiIK;
  fRoomIK:= AExam.RoomIK;
  TeacherIK:= AExam.TeacherIK;
  fCalcUnitName:= AExam.CalcUnitName;
  fDiscName:= AExam.DiscName;
//  fShortDiscName:= AExam.ShortDiscName;
  fRoomName:= AExam.FullRoomName;
  fVidZanyatName:= AExam.VidZanyatName;
  fVidNagruzkiName:= AExam.VidNagruzkiName;  }

  fExamDate:= AExam.ExamDate;
end;

{
constructor TSheduleExamination.Create(AStart, AStop: TDateTime;
  AKafedraIK, AFormEdIK, ASheduleIK, AExamIK, ATeacherIK, APlanTeacherIK, ACalcUnitIK, ADiscIK,
  AVidZanyatIK, AVidNagruzkiIK, ARoomIK: integer; AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName: string);
var
  y,m,d,h,min,s,ms: word;
begin
  inherited Create(AStart, AStop, AKafedraIK, AFormEdIK, ASheduleIK, ATeacherIK, APlanTeacherIK,
    ACalcUnitIK, ADiscIK, AVidZanyatIK, AVidNagruzkiIK, ARoomIK, AVidZanyatName, AVidNagruzkiName, ADiscName, ACalcUnitName);
  fExamIK:= AExamIK;
  DecodeDateTime(AStart, y,m,d, h, min, s, ms);
  fExamDate:= EncodeDate(y,m,d);
end;      }

constructor TSheduleExamination.Create(AExam: TSheduleExamination);
begin
  Create;
  Assign(AExam);
end;

procedure TSheduleExamination.Assign(ASourceDataSet: TDataSet);
var
  y,m,d,h,min,s,ms: word;
begin
  inherited Assign(ASourceDataSet);
  fExamIK:= ASourceDataSet.FieldByName('ik_examination').AsInteger;
  DecodeDateTime(ASourceDataSet.FieldByName('dt_time_start').AsDateTime, y,m,d, h, min, s, ms);
  fExamDate:= EncodeDate(y,m,d);
end;

constructor TSheduleExamination.Create(ASourceDataSet: TDataSet);
begin
  inherited Create;
  Self.Assign(ASourceDataSet);
end;

function TSheduleExamination.IsOccured(AStart,
  AStop: TDateTime): TSheduleExamination;
begin
  if ((fStart >= AStart) and (fStart <= AStop)) or ((fStop >= AStart) and (fStop <= AStop)) then
    Result:= self
  else Result:= nil;
end;

{
constructor TSheduleExamination.Create(ASheduleIK, AExamIK: integer);
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'Select * FROM GetSheduleItemsForObject(2, -1, ' + IntToStr(AExamIK) + ')';
  tempDataSet.Open;
  if tempDataSet.RecordCount = 0 then
  begin
    tempDataSet.Close;
    tempDataSet.Free;
    raise Exception.Create('Ошибка при чтении события из базы данных. Запись в базе данных некорректна!');
  end;
  self.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, ASheduleIK, AExamIK, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString);
  tempDataSet.Close;
  tempDataSet.Free;
end;        }


{ TSheduleTeacher }

constructor TSheduleTeacher.Create(ATabN: integer; AFirstName, ALastName,
  ACotch: string);
begin
  fTabN:= ATabN;
  fLastName:= ALastName;
  fFirstName:= AFirstName;
  fCotch:= ACotch;  
end;

function TSheduleTeacher.GetFIO: string;
begin
  Result:= fLastName + ' ' + Copy(fFirstName, 0, 1) + '. ' + Copy(fCotch, 0, 1) + '. (таб. № ' + IntToStr(TabN) + ')';
end;

{ TSheduleGroup }

constructor TSheduleGroup.Create(AGroupIK: integer; AName: string);
begin
  fGroupIK:= AGroupIK;
  fGroupName:= AName;
end;


{ TSheduleEventList }

function TSheduleEventList.GetEvent(Index: Integer): TSheduleEvent;
begin
  Result := TSheduleEvent(inherited Items[Index]);
end;

procedure TSheduleEventList.SetEvent(Index: Integer; const Value: TSheduleEvent);
begin
  inherited Items[Index]:= Value;
end;

{ TSheduleExaminationList }

function TSheduleExaminationList.GetExam(Index: Integer): TSheduleExamination;
begin
  Result := TSheduleExamination(inherited Items[Index]);
end;

procedure TSheduleExaminationList.SetExam(Index: Integer;
  const Value: TSheduleExamination);
begin
  inherited Items[Index]:= Value;
end;

{ TSheduleItemList }

function TSheduleItemList.GetItem(Index: Integer): TSheduleItem;
begin
  Result := inherited Items[Index];
end;

procedure TSheduleItemList.SetItem(Index: Integer; const Value: TSheduleItem);
begin
  inherited Items[Index]:= Value;
end;

{ TSemesterLengthInfo }

function TDefaultSemLengthInfo.AddException(AValue: TSemLengthInfo): integer;
begin
  Result:= fExceptions.Add(AValue);
end;

constructor TDefaultSemLengthInfo.Create(ASheduleIK, AYearIK, ASemIK: integer;
  ASemStart, ASemStop, ASessionStart, ASessionStop, AWorkTimeStart, AWorkTimeEnd: Variant);
begin
  fSheduleIK:= ASheduleIK;
  fYearIK:= AYearIK;
  fSemIK:= ASemIK;
  fExceptions:= TObjectList.Create;
  UpdateValues(AYearIK, ASemIK, ASemStart, ASemStop, ASessionStart, ASessionStop, AWorkTimeStart, AWorkTimeEnd);
end;

procedure TDefaultSemLengthInfo.DeleteException(index: integer);
begin
  fExceptions.Delete(index);
end;

destructor TDefaultSemLengthInfo.Destroy;
begin
  if Assigned(fExceptions) then FreeAndNil(fExceptions);  
  inherited;
end;

function TDefaultSemLengthInfo.ExceptionCount: integer;
begin
  if Assigned(fExceptions) then
    Result:= fExceptions.Count
  else Result:= 0;
end;

function TDefaultSemLengthInfo.GetException(ASpecFacIK,
  ACourseNumber: integer): TSemLengthInfo;
var
  i: integer;
begin
  Result:= nil;
  for I := 0 to fExceptions.Count - 1 do
    if (TSemLengthInfo(fExceptions).SpecFacultyIK = ASpecFacIK) and (TSemLengthInfo(fExceptions).CourseNumber = ACourseNumber) then
    begin
      Result:= TSemLengthInfo(fExceptions[i]);
      break;
    end;
end;

function TDefaultSemLengthInfo.GetExceptionByIndex(
  index: integer): TSemLengthInfo;
begin
  Result:= nil;
  if (index >= 0) and (index < fExceptions.Count) then
    Result:= TSemLengthInfo(fExceptions[index]);
  if Result = nil then
    raise EApplicationException.Create('Исключение с указаным индексом не найдено');
end;

function TDefaultSemLengthInfo.GetSemesterLengthForGrup(
  AGroupIK: integer): TSemLengthInfo;
var
  i: integer;
begin
  Result:= nil;
  for I := 0 to fExceptions.Count - 1 do
    if Assigned(TSemLengthInfo(fExceptions[i]).GroupIKList) then
      if TSemLengthInfo(fExceptions[i]).GroupIKList.IndexOf(IntToStr(AGroupIK)) >= 0 then
      begin
        Result:= TSemLengthInfo(fExceptions[i]);
        break;
      end;
  if Result = nil then Result:= self;
end;

function TDefaultSemLengthInfo.IsAudDateAllow(ADate: TDate): boolean;
var
  i: integer;
begin
  Result:= inherited IsAudDateAllow(ADate);
  if (not Result) and Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
    begin
      Result:= TSemLengthInfo(fExceptions[i]).IsAudDateAllow(ADate);
      if Result then break;
    end;
end;

function TDefaultSemLengthInfo.IsSessionDateAllow(ADate: TDate): boolean;
var
  i: integer;
begin
  Result:= inherited IsSessionDateAllow(ADate);
  if (not Result) and Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
    begin
      Result:= TSemLengthInfo(fExceptions[i]).IsSessionDateAllow(ADate);
      if Result then exit;
    end;
end;

function TDefaultSemLengthInfo.MaxSemStop: TDate;
var
  i: integer;
begin
  Result:= fSemStop;
  if Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
      if TSemLengthInfo(fExceptions[i]).SemStop > Result then
        Result:= TSemLengthInfo(fExceptions[i]).SemStop;
end;

function TDefaultSemLengthInfo.MaxSessionStop: TDate;
var
  i: integer;
begin
  Result:= fSessionStop;
  if Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
      if TSemLengthInfo(fExceptions[i]).SessionStop > Result then
        Result:= TSemLengthInfo(fExceptions[i]).SessionStop;
end;

function TDefaultSemLengthInfo.MinSemStart: TDate;
var
  i: integer;
begin
  Result:= fSemStart;
  if Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
      if TSemLengthInfo(fExceptions[i]).SemStart < Result then
        Result:= TSemLengthInfo(fExceptions[i]).SemStart;
end;

function TDefaultSemLengthInfo.MinSessionStart: TDate;
var
  i: integer;
begin
  Result:= fSessionStart;
  if Assigned(fExceptions) then
    for I := 0 to fExceptions.Count - 1 do
      if TSemLengthInfo(fExceptions[i]).SessionStart < Result then
        Result:= TSemLengthInfo(fExceptions[i]).SessionStart;
end;

procedure TDefaultSemLengthInfo.SetException(ASpecFacIK, ACourseNumber: integer;
  const Value: TSemLengthInfo);
var
  i: integer;
begin
  for I := 0 to fExceptions.Count - 1 do
    if (TSemLengthInfo(fExceptions).SpecFacultyIK = ASpecFacIK) and (TSemLengthInfo(fExceptions).CourseNumber = ACourseNumber) then
    begin
      fExceptions[i]:= Value;
      break;
    end;
end;

procedure TDefaultSemLengthInfo.SetExceptionByIndex(index: integer;
  const Value: TSemLengthInfo);
begin
  if (index >= 0) and (index < fExceptions.Count) then
  begin
    fExceptions[index]:= Value;
    exit;
  end;
  raise EApplicationException.Create('Исключение с указаным индексом не найдено');
end;

procedure TDefaultSemLengthInfo.UpdateValues(AYearIK, ASemIK: integer; ASemStart,
  ASemStop, ASessionStart, ASessionStop, AWorkTimeStart, AWorkTimeEnd: Variant);
begin
  inherited UpdateValues(AYearIK, ASemStart, ASemStop, ASessionStart, ASessionStop);
  fYearIK:= AYearIK;
  fSemIK:= ASemIK;
  if AWorkTimeStart <> NULL then
    fWorkTimeStart:= AWorkTimeStart
  else fWorkTimeStart:= 0;
  if AWorkTimeEnd <> NULL then
    fWorkTimeEnd:= AWorkTimeEnd
  else fWorkTimeEnd:= 0;
end;

{ TSemLengthInfo }

constructor TSemLengthInfo.Create(AYearIK, ASpecFacultyIK, ACourseNumber: integer;
  ASemStart, ASemStop, ASessionStart, ASessionStop: Variant);
begin
  fSpecFacultyIK:= ASpecFacultyIK;
  fCourseNumber:= ACourseNumber;
  fGroupIKList:= TStringList.Create;
  UpdateValues(AYearIK, ASemStart, ASemStop, ASessionStart, ASessionStop);
end;

destructor TSemLengthInfo.Destroy;
begin
  if Assigned(fGroupIKList) then FreeAndNil(fGroupIKList);  
  inherited;
end;

function TSemLengthInfo.IsAudDateAllow(ADate: TDate): boolean;
begin
  Result:= (ADate <= SemStop) and (ADate >= SemStart) and (DayOfWeek(ADate) <> 1);
end;

function TSemLengthInfo.IsSessionDateAllow(ADate: TDate): boolean;
var
i:integer;
begin
  Result:= (ADate <= SessionStop) and (ADate >= SessionStart) and (DayOfWeek(ADate) <> 1);
  {if (ADate>=SessionStart) then
  begin
  i:=DayOfWeek(ADate);
  showmessage(DateToStr(ADate)+' '+IntToStr(i));
  showmessage(DateToStr(fSessionStart)+'-'+DateToStr(fSessionStop));
  end;}
end;

procedure TSemLengthInfo.UpdateValues(AYearIK: integer; ASemStart, ASemStop, ASessionStart,
  ASessionStop: Variant);
var
  tempDS: TADODataSet;
begin
  if ASemStart <> NULL then
    fSemStart:= ASemStart
  else fSemStart:= 0;
  if ASemStop <> NULL then
    fSemStop:= ASemStop
  else fSemStop:= 0;
  if ASessionStart <> NULL then
    fSessionStart:= ASessionStart
  else fSessionStart:= 0;
  if ASessionStop <> NULL then
    fSessionStop:= ASessionStop
  else fSessionStop:= 0;
  if Assigned(fGroupIKList) then    //т.е. это исключение
  begin
    fGroupIKList.Clear;
    tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDS.CommandText:= 'SELECT ik_grup FROM Grup WHERE (ik_spec_fac = ' + IntToStr(fSpecFacultyIK) + ') and (nYear_post = (SELECT year_value - ' + IntToStr(fCourseNumber) + ' + 1 FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(AYearIK) + '))';
      tempDS.Open;
      while not tempDS.Eof do
      begin
        fGroupIKList.Add(tempDS.FieldByName('ik_grup').AsString);
        tempDS.Next;
      end;
      tempDS.Close;
      FreeAndNil(tempDS);
    except
      if Assigned(tempDS) then
      begin
        if tempDS.Active then tempDS.Close;
        tempDS.Free;
      end;
    end;
  end;
end;

{ TSheduleRegistry }

class function TSheduleRegistry.EventStorage: TSheduleEventStorage;
begin
  if not Assigned(fEventStorage) then
    fEventStorage:= TSheduleEventStorage.Create;
  Result:= fEventStorage;
end;

class function TSheduleRegistry.ExamStorage: TExaminationStorage;
begin
  if not Assigned(fExamStorage) then
    fExamStorage:= TExaminationStorage.Create;
  Result:= fExamStorage;
end;

class function TSheduleRegistry.Functions: TSheduleRegistry;
begin
  if not Assigned(fInstance) then
    fInstance:= TSheduleRegistry.Create;
  Result:= fInstance;
end;

class procedure TSheduleRegistry.ReleaseInstance;
begin
  if fEventStorage <> nil then
  begin
    fEventStorage.Clear;
    FreeAndNil(fEventStorage);
  end;
  if fExamStorage <> nil then
  begin
    fExamStorage.Clear;
    FreeAndNil(fExamStorage);
  end;
  if fPotokGroupsStorage <> nil then
  begin
    fPotokGroupsStorage.Clear;
    FreeAndNil(fPotokGroupsStorage);
  end;
  if Assigned(fInstance) then FreeAndNil(fInstance);
end;

function TSheduleRegistry.GetDepartmentEvents(SheduleIK,
  KafedraIK: integer): boolean;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(2, ' + IntToStr(SheduleIK) + ', ' + IntToStr(KafedraIK) + ')';
    tempDataSet.Open;
    i:= 0;
    while i < EventStorage.Count do
    begin
      if (EventStorage.Items[i].SheduleIK = SheduleIK) and (EventStorage.Items[i].KafedraIK = KafedraIK) then
      begin
        if not tempDataSet.Locate('itab_n', EventStorage.Items[i].EventIK, [loPartialKey]) then
          EventStorage.Remove(EventStorage.Items[i], false)
        else inc(i);
      end
      else inc(i);
    end;
    tempDataSet.First;
    while (not tempDataSet.Eof) do
    begin
      if EventStorage.GetEventByIK(tempDataSet.FieldByName('itab_n').AsInteger) = nil then
         EventStorage.AddEvent(TSheduleEvent.Create(tempDataSet, false));
{        fEventStorage.AddEvent(TSheduleEvent.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_event_type').AsInteger,
        tempDataSet.FieldByName('ik_repeat_pattern').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString,
        AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString), tempDataSet.FieldByName('cName_disc').AsString,
        tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean));
      }
      tempDataSet.Next;
    end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TSheduleRegistry.GetDepartmentExams(SheduleIK,
  KafedraIK: integer): boolean;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(2, ' + IntToStr(SheduleIK) + ', ' + IntToStr(KafedraIK) + ')';
    tempDataSet.Open;
    i:= 0;
    while i < ExamStorage.Count do
    begin
      if (ExamStorage.Items[i].SheduleIK = SheduleIK) and (ExamStorage.Items[i].KafedraIK = KafedraIK) then
      begin
        if not tempDataSet.Locate('ik_examination', ExamStorage.Items[i].ExamIK, [loPartialKey]) then
          ExamStorage.Remove(ExamStorage.Items[i], false)
        else inc(i);
      end
      else inc(i);
    end;
    tempDataSet.First;
    while (not tempDataSet.Eof) do
    begin
      if ExamStorage.GetExamByIK(tempDataSet.FieldByName('ik_examination').AsInteger) = nil then
        ExamStorage.AddExam(TSheduleExamination.Create(tempDataSet));
      {  fExamStorage.AddExam(TSheduleExamination.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString));
      }
      tempDataSet.Next;
    end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TSheduleRegistry.GetTeacherEvents(SheduleIK, TabN: integer; needLoadFromDB: boolean): TSheduleEventStorageStructureItem;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  Result:= EventStorage.Teachers[SheduleIK, TabN];
  Result.RefreshEventList;

  if needLoadFromDB then
  begin
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDataSet.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(6, ' + IntToStr(SheduleIK) + ', ' + IntToStr(TabN) + ')';
      tempDataSet.Open;
      i:= 0;
      while i < Result.GetEventCount do
      begin
        if Result.Events[i] <> nil then
        begin
          if not tempDataSet.Locate('ik_event', Result.Events[i].EventIK, [loPartialKey]) then
            Result.DeleteEventByIndex(i, false)
          else inc(i);
        end
        else inc(i);
      end;
      tempDataSet.First;
      while (not tempDataSet.Eof) do
      begin
        if Result.GetEventByIK(tempDataSet.FieldByName('ik_event').AsInteger) = nil then
           Result.AddEvent(TSheduleEvent.Create(tempDataSet, false));
    {      Result.AddEvent(TSheduleEvent.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
            tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_event_type').AsInteger,
            tempDataSet.FieldByName('ik_repeat_pattern').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
            tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
            tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString,
            AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString), tempDataSet.FieldByName('cName_disc').AsString,
            tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean));
        }
        tempDataSet.Next;
      end;
    finally
      if tempDataSet.Active then tempDataSet.Close;
      tempDataSet.Free;
    end;
  end;
end;

function TSheduleRegistry.GetTeacherExams(SheduleIK, TabN: integer; needLoadFromDB: boolean): TExaminationStorageStructureItem;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  Result:= ExamStorage.Teachers[SheduleIK, TabN];
  Result.RefreshExamList;

  if needLoadFromDB then
  begin
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDataSet.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(6, ' + IntToStr(SheduleIK) + ', ' + IntToStr(TabN) + ')';
      tempDataSet.Open;
      i:= 0;
      while i < Result.GetExamCount do
      begin
        if Result.Exams[i] <> nil then
        begin
          if not tempDataSet.Locate('ik_examination', Result.Exams[i].ExamIK, [loPartialKey]) then
            Result.DeleteExamByIndex(i, false)
          else inc(i);
        end
        else inc(i);
      end;
      tempDataSet.First;
      while (not tempDataSet.Eof) do
      begin
        if Result.GetExamByIK(tempDataSet.FieldByName('ik_examination').AsInteger) = nil then
          Result.AddExam(TSheduleExamination.Create(tempDataSet));
   {       Result.AddExam(TSheduleExamination.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
          tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
          tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
          tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
          tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString));
     }
        tempDataSet.Next;
      end;
    finally
      if tempDataSet.Active then tempDataSet.Close;
      tempDataSet.Free;
    end;
  end;
end;

class function TSheduleRegistry.PotokGroupsStorage: TPotokGroupsStorage;
begin
  if not Assigned(fPotokGroupsStorage) then
    fPotokGroupsStorage:= TPotokGroupsStorage.Create;
  Result:= fPotokGroupsStorage;
end;

function TSheduleRegistry.GetFacultyEvents(SheduleIK,
  FacultyIK: integer): boolean;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  try
    tempDataSet.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(3, ' + IntToStr(SheduleIK) + ', ' + IntToStr(FacultyIK) + ')';
    tempDataSet.Open;
    i:= 0;
    while i < EventStorage.Count do
    begin
      if (EventStorage.Items[i].SheduleIK = SheduleIK) and (EventStorage.Items[i].FacultyIKList.IndexOf(IntToStr(FacultyIK)) >= 0) then
      begin
        if not tempDataSet.Locate('ik_grup', EventStorage.Items[i].EventIK, [loPartialKey]) then
          EventStorage.Remove(EventStorage.Items[i], false)
        else inc(i);
      end
      else inc(i);
    end;
    tempDataSet.First;
    while (not tempDataSet.Eof) do
    begin
      if EventStorage.GetEventByIK(tempDataSet.FieldByName('ik_grup').AsInteger) = nil then
         EventStorage.AddEvent(TSheduleEvent.Create(tempDataSet, false));
      {  fEventStorage.AddEvent(TSheduleEvent.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_event_type').AsInteger,
        tempDataSet.FieldByName('ik_repeat_pattern').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString,
        AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString), tempDataSet.FieldByName('cName_disc').AsString,
        tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean));
     }
      tempDataSet.Next;
    end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TSheduleRegistry.GetFacultyExams(SheduleIK,
  FacultyIK: integer): boolean;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(3, ' + IntToStr(SheduleIK) + ', ' + IntToStr(FacultyIK) + ')';
    tempDataSet.Open;
    i:= 0;
    while i < ExamStorage.Count do
    begin
      if (ExamStorage.Items[i].SheduleIK = SheduleIK) and (ExamStorage.Items[i].FacultyIKList.IndexOf(IntToStr(FacultyIK)) >= 0) then
      begin
        if not tempDataSet.Locate('ik_examination', ExamStorage.Items[i].ExamIK, [loPartialKey]) then
          ExamStorage.Remove(ExamStorage.Items[i], false)
        else inc(i);
      end
      else inc(i);
    end;
    tempDataSet.First;
    while (not tempDataSet.Eof) do
    begin
      if ExamStorage.GetExamByIK(tempDataSet.FieldByName('ik_examination').AsInteger) = nil then
        ExamStorage.AddExam(TSheduleExamination.Create(tempDataSet));
      {  fExamStorage.AddExam(TSheduleExamination.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString));
      }
      tempDataSet.Next;
    end;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TSheduleRegistry.GetGroupEvents(SheduleIK, GroupIK: integer; needLoadFromDB: boolean): TSheduleEventStorageStructureItem;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  Result:= EventStorage.Groups[SheduleIK, GroupIK];
  Result.RefreshEventList;

  if needLoadFromDB then
  begin
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDataSet.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(7, ' + IntToStr(SheduleIK) + ', ' + IntToStr(GroupIK) + ')';
      tempDataSet.Open;
      i:= 0;
      while i < Result.GetEventCount do
      begin
        if Result.Events[i] <> nil then
        begin
          if not tempDataSet.Locate('ik_event', Result.Events[i].EventIK, [loPartialKey]) then
            Result.DeleteEventByIndex(i, false)
          else inc(i);
        end
        else inc(i);
      end;
      tempDataSet.First;
      while (not tempDataSet.Eof) do
      begin
        if Result.GetEventByIK(tempDataSet.FieldByName('ik_event').AsInteger) = nil then
           Result.AddEvent(TSheduleEvent.Create(tempDataSet, false));
       {   Result.AddEvent(TSheduleEvent.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
            tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_event_type').AsInteger,
            tempDataSet.FieldByName('ik_repeat_pattern').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
            tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
            tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString,
            AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString), tempDataSet.FieldByName('cName_disc').AsString,
            tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean));
        }
        tempDataSet.Next;
      end;
    finally
      if tempDataSet.Active then tempDataSet.Close;
      tempDataSet.Free;
    end;
  end;
end;

function TSheduleRegistry.GetGroupExams(SheduleIK,
  GroupIK: integer; needLoadFromDB: boolean): TExaminationStorageStructureItem;
var
  tempDataSet: TADODataSet;
  i: integer;
begin
  Result:= ExamStorage.Groups[SheduleIK, GroupIK];
  Result.RefreshExamList;

  if needLoadFromDB then
  begin
    tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDataSet.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(7, ' + IntToStr(SheduleIK) + ', ' + IntToStr(GroupIK) + ')';
      tempDataSet.Open;
      i:= 0;
      while i < Result.GetExamCount do
      begin
        if Result.Exams[i] <> nil then
        begin
          if not tempDataSet.Locate('ik_examination', Result.Exams[i].ExamIK, [loPartialKey]) then
            Result.DeleteExamByIndex(i, false)
          else inc(i);
        end
        else inc(i);
      end;
      tempDataSet.First;
      while (not tempDataSet.Eof) do
      begin
        if Result.GetExamByIK(tempDataSet.FieldByName('ik_examination').AsInteger) = nil then
          Result.AddExam(TSheduleExamination.Create(tempDataSet));
       {   Result.AddExam(TSheduleExamination.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
          tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
          tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
          tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
          tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString));
        }
        tempDataSet.Next;
      end;
    finally
      if tempDataSet.Active then tempDataSet.Close;
      tempDataSet.Free;
    end;
  end;
end;

procedure TSheduleRegistry.SearchEventsForGroup(SourceEventsDS: TADODataSet; ASheduleIK, AGroupIK: integer;
  StartTime, StopTime: TDateTime);
var
  ikList: string;
  tempGroupEvents: TSheduleEventStorageStructureItem;
  i: integer;
  tempEvent: TSheduleEvent;
begin
  if not Assigned(SourceEventsDS) then
    raise EApplicationException.Create('Переданный SourceEventsDS не инстанцирован');

  ikList:= '';
  tempGroupEvents:= GetGroupEvents(ASheduleIK, AGroupIK, true);
  if not Assigned(tempGroupEvents) then
    raise EApplicationException.Create('Не удалось получить из хранилища событий запись, соответсвующую указанной группе');
  for I := 0 to tempGroupEvents.GetEventCount - 1 do
  begin
    tempEvent:= tempGroupEvents.Events[i].IsOccured(StartTime, StopTime);
    if tempEvent <> nil then
      ikList:= ikList + IntToStr(tempEvent.EventIK) + ', ';
  end;
  if ikList <> '' then
    Delete(ikList, Length(ikList)-1, 2)
  else ikList:= '-1';
  if SourceEventsDS.Active then SourceEventsDS.Close;
  SourceEventsDS.CommandText:= 'SELECT ik_event_type, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, cName_vid_zanyat, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
      'FROM GetSheduleEventsForObject(7, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(AGroupIK) + ') WHERE ik_event in (' + ikList + ')';
  SourceEventsDS.Open;
end;

procedure TSheduleRegistry.SearchEventsForPrep(SourceEventsDS: TADODataSet; ASheduleIK, ATabN: integer; StartTime, StopTime: TDateTime);
var
  ikList: string;
  tempTeacherEvents: TSheduleEventStorageStructureItem;
  i: integer;
  tempEvent: TSheduleEvent;
begin
  if not Assigned(SourceEventsDS) then
    raise EApplicationException.Create('Переданный SourceEventsDS не инстанцирован');

  ikList:= '';
  tempTeacherEvents:= GetTeacherEvents(ASheduleIK, ATabN, true);
  if not Assigned(tempTeacherEvents) then
    raise EApplicationException.Create('Не удалось получить из хранилища событий запись, соответсвующую указанному преподавателю');
  for I := 0 to tempTeacherEvents.GetEventCount - 1 do
  begin
    tempEvent:= tempTeacherEvents.Events[i].IsOccured(StartTime, StopTime);
    if tempEvent <> nil then
      ikList:= ikList + IntToStr(tempEvent.EventIK) + ', ';
  end;
  if ikList <> '' then
    Delete(ikList, Length(ikList)-1, 2)
  else ikList:= '-1';
  if SourceEventsDS.Active then SourceEventsDS.Close;
  SourceEventsDS.CommandText:= 'SELECT ik_event_type, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, cName_vid_zanyat, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
      'FROM GetSheduleEventsForObject(6, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ATabN) + ') WHERE ik_event in (' + ikList + ')';
  SourceEventsDS.Open;
end;

procedure TSheduleRegistry.SearchEventsForRoom(SourceEventsDS: TADODataSet; ASheduleIK, ARoomIK: integer;
  StartTime, StopTime: TDateTime);
var
  tempDS: TADODataSet;
  tempEvent, findEvent: TSheduleEvent;
  ikList: string;
begin
  if not Assigned(SourceEventsDS) then
    raise EApplicationException.Create('Переданный SourceEventsDS не инстанцирован');

  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(5, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ARoomIK) + ')';
    tempDS.Open;
    ikList:= '';
    tempDS.First;
    while not tempDS.Eof do
    begin
      tempEvent:= EventStorage.GetEventByIK(tempDS.FieldByName('ik_event').AsInteger);
      if tempEvent = nil then
        tempEvent:= EventStorage.AddEvent(TSheduleEvent.Create(tempDS, false));
        {tempEvent:= fEventStorage.AddEvent(TSheduleEvent.Create(tempDS.FieldByName('dBegin_date').AsDateTime, tempDS.FieldByName('dt_time_start').AsDateTime, tempDS.FieldByName('dt_time_stop').AsDateTime,
          tempDS.FieldByName('ik_kaf').AsInteger, tempDS.FieldByName('ik_form_ed').AsInteger, ASheduleIK, tempDS.FieldByName('ik_object').AsInteger, tempDS.FieldByName('ik_event_type').AsInteger, tempDS.FieldByName('ik_repeat_pattern').AsInteger,
          tempDS.FieldByName('ik_id_prepod').AsInteger, tempDS.FieldByName('ik_id_plan_prepod').AsInteger,
          tempDS.FieldByName('ik_calc_unit').AsInteger, tempDS.FieldByName('ik_disc').AsInteger, tempDS.FieldByName('ik_vid_zanyat').AsInteger,
          tempDS.FieldByName('ik_vid_nagruzki').AsInteger, tempDS.FieldByName('ik_room').AsInteger, tempDS.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDS.FieldByName('Сname_vid_nagruzki_short').AsString),
          tempDS.FieldByName('cName_disc').AsString, tempDS.FieldByName('cName_calc_unit').AsString, tempDS.FieldByName('bit_exception').AsBoolean));
      }
      findEvent:= tempEvent.IsOccured(StartTime, StopTime);
      if findEvent <> nil then
        ikList:= ikList + IntToStr(findEvent.EventIK) + ', ';
//      tempEvent.Free;
      tempDS.Next;
    end;
    tempDS.Close;
    if ikList <> '' then
      Delete(ikList, Length(ikList)-1, 2)
    else ikList:= '-1';
    if SourceEventsDS.Active then SourceEventsDS.Close;
    SourceEventsDS.CommandText:= 'SELECT ik_event_type, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, cName_vid_zanyat, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
      'FROM GetSheduleEventsForObject(5, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ARoomIK) + ') WHERE ik_event in (' + ikList + ')';
    SourceEventsDS.Open;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TSheduleRegistry.SearchExamsForGroup(SourceExamDS: TADODataSet;
  ASheduleIK, AGroupIK: integer; StartTime, StopTime: TDateTime);
var
  tempGroupExams: TExaminationStorageStructureItem;
  tempExam: TSheduleExamination;
  ikList: string;
  i: integer;
begin
  if not Assigned(SourceExamDS) then
    raise EApplicationException.Create('Переданный SourceExamDS не инстанцирован');

  ikList:= '';
  tempGroupExams:= GetGroupExams(ASheduleIK, AGroupIK, true);
  if not Assigned(tempGroupExams) then
    raise EApplicationException.Create('Не удалось получить из хранилища экзаменов запись, соответсвующую указанной группе');
  for i := 0 to tempGroupExams.GetExamCount - 1 do
  begin
    tempExam:= tempGroupExams.Exams[i].IsOccured(StartTime, StopTime);
    if tempExam <> nil then
      ikList:= ikList + IntToStr(tempExam.ExamIK) + ', ';
  end;
  if ikList <> '' then
    Delete(ikList, Length(ikList)-1, 2)
  else ikList:= '-1';
  if SourceExamDS.Active then SourceExamDS.Close;
  SourceExamDS.CommandText:= 'SELECT dt_time_start, dt_time_stop, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
      'FROM GetSheduleExamsForObject(7, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(AGroupIK) + ') WHERE ik_examination in (' + ikList + ')';
  SourceExamDS.Open;
end;

procedure TSheduleRegistry.SearchExamsForPrep(SourceExamDS: TADODataSet;
  ASheduleIK, ATabN: integer; StartTime, StopTime: TDateTime);
var
  tempTeacherExams: TExaminationStorageStructureItem;
  tempExam: TSheduleExamination;
  ikList: string;
  i: integer;
begin
  if not Assigned(SourceExamDS) then
    raise EApplicationException.Create('Переданный SourceExamDS не инстанцирован');

  ikList:= '';
  tempTeacherExams:= GetTeacherExams(ASheduleIK, ATabN, true);
  if not Assigned(tempTeacherExams) then
    raise EApplicationException.Create('Не удалось получить из хранилища экзаменов запись, соответсвующую указанному преподавателю');
  for i := 0 to tempTeacherExams.GetExamCount - 1 do
  begin
    tempExam:= tempTeacherExams.Exams[i].IsOccured(StartTime, StopTime);
    if tempExam <> nil then
      ikList:= ikList + IntToStr(tempExam.ExamIK) + ', ';
  end;
  if ikList <> '' then
    Delete(ikList, Length(ikList)-1, 2)
  else ikList:= '-1';
  if SourceExamDS.Active then SourceExamDS.Close;
  SourceExamDS.CommandText:= 'SELECT dt_time_start, dt_time_stop, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
    'FROM GetSheduleExamsForObject(6, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ATabN) + ') WHERE ik_examination in (' + ikList + ')';
  SourceExamDS.Open;
end;

procedure TSheduleRegistry.SearchExamsForRoom(SourceExamDS: TADODataSet;
  ASheduleIK, ARoomIK: integer; StartTime, StopTime: TDateTime);
var
  tempExam, findExam: TSheduleExamination;
  tempDS: TADODataSet;
  ikList: string;
begin
  if not Assigned(SourceExamDS) then
    raise EApplicationException.Create('Переданный SourceExamDS не инстанцирован');

  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(5, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ARoomIK) + ')';
    tempDS.Open;
    ikList:= '';
    while not tempDS.Eof do
    begin
      tempExam:= ExamStorage.GetExamByIK(tempDS.FieldByName('ik_examination').AsInteger);
      if tempExam = nil then
        tempExam:= ExamStorage.AddExam(TSheduleExamination.Create(tempDS));
       { tempExam:= fExamStorage.AddExam(TSheduleExamination.Create(tempDS.FieldByName('dt_time_start').AsDateTime, tempDS.FieldByName('dt_time_stop').AsDateTime,
          tempDS.FieldByName('ik_kaf').AsInteger, tempDS.FieldByName('ik_form_ed').AsInteger, ASheduleIK, tempDS.FieldByName('ik_object').AsInteger, tempDS.FieldByName('ik_id_prepod').AsInteger, tempDS.FieldByName('ik_id_plan_prepod').AsInteger,
          tempDS.FieldByName('ik_calc_unit').AsInteger, tempDS.FieldByName('ik_disc').AsInteger, tempDS.FieldByName('ik_vid_zanyat').AsInteger,
          tempDS.FieldByName('ik_vid_nagruzki').AsInteger, tempDS.FieldByName('ik_room').AsInteger, tempDS.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDS.FieldByName('Сname_vid_nagruzki_short').AsString),
          tempDS.FieldByName('cName_disc').AsString, tempDS.FieldByName('cName_calc_unit').AsString));
      }
      findExam:= tempExam.IsOccured(StartTime, StopTime);
      if findExam <> nil then
        ikList:= ikList + IntToStr(findExam.ExamIK) + ', ';
  //    tempExam.Free;
      tempDS.Next;
    end;
    tempDS.Close;
    if ikList <> '' then
      Delete(ikList, Length(ikList)-1, 2)
    else ikList:= '-1';
    if SourceExamDS.Active then SourceExamDS.Close;
    SourceExamDS.CommandText:= 'SELECT dt_time_start, dt_time_stop, (RTRIM(clastname) + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''.'') as FIO, cName_disc, Сname_vid_nagruzki_short, cName_calc_unit, (Cname_room + '' '' + CName_campus) as full_room_name ' +
      'FROM GetSheduleExamsForObject(5, ' + IntToStr(ASheduleIK) + ', ' + IntToStr(ARoomIK) + ') WHERE ik_examination in (' + ikList + ')';
    SourceExamDS.Open;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TSheduleRegistry.GetParts(var Parts: TObjectList);
var
  tempDataSet: TADODataSet;
begin
  if Assigned(Parts) then Parts.Free;
  Parts:= TObjectList.Create;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'Select * From SheduleEventType ORDER BY dEvent_start';
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    Parts.Add(TSPartInfo.Create(tempDataSet.FieldByName('ik_event_type').AsInteger, tempDataSet.FieldByName('dEvent_start').AsDateTime, tempDataSet.FieldByName('dEvent_stop').AsDateTime));
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

procedure TSheduleRegistry.GetParts(SourseDS: PDataSet);
begin
  TGeneralController.Instance.getDataSetValues(SourseDS, 'Select * FROM SheduleEventType ORDER BY cName_event', 'ik_event_type', false, NULL);
end;

function TSheduleRegistry.GetExceptions(EventIK: integer): TObjectList;
var
  tempDataSet: TADODataSet;
  tempEvent: TSheduleEvent;
  y,m,d,h,min,s,ms: word;
begin
  Result:= TObjectList.Create;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
 { tempDataSet.CommandText:= 'Select DISTINCT SheduleEvent.*, SheduleEventException.*, dEvent_start, dEvent_stop, ik_vid_nagruzki, ik_disc, ik_calc_unit, ik_vid_zanyat, Prepod_plan_nagr.ik_id_prepod as plan_ik_id_prepod ' +
      'From SheduleEventException INNER JOIN SheduleEvent ON SheduleEventException.ik_new_event = SheduleEvent.ik_event INNER JOIN SheduleEventType ON SheduleEvent.ik_event_type = SheduleEventType.ik_event_type '+
      'INNER JOIN Relation_event_plan_nagr repn ON SheduleEvent.ik_event = repn.ik_event INNER JOIN Prepod_plan_nagr ON repn.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan INNER JOIN Content_plan_nagr ' +
      'ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr Where SheduleEventException.ik_old_event = ' + IntToStr(EventIK);
  }
  tempDataSet.CommandText:= 'SELECT * FROM SheduleExceptionWithPlanNagr WHERE ik_old_event = ' + IntToStr(EventIK);
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    {tempEvent:= TSheduleEvent.Create;
    DecodeDate(tempDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
    DecodeTime(tempDataSet.FieldByName('dEvent_start').AsDateTime, h, min, s, ms);
    tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(tempDataSet.FieldByName('dEvent_stop').AsDateTime, h, min, s, ms);
    tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
    tempEvent.EventType:= tempDataSet.FieldByName('ik_event_type').AsInteger;
    //tempEvent.TabN:= TNagruzkaController.Instance.GetTabNFromTeacherIK(tempDataSet.FieldByName('ik_id_prepod').AsInteger);
    tempEvent.TeacherIK:= tempDataSet.FieldByName('ik_id_prepod').AsInteger;
    tempEvent.PlanTeacherIK:= tempDataSet.FieldByName('plan_ik_id_prepod').AsInteger;
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_new_event').AsInteger;
    tempEvent.ParrentEventIK:= EventIK;
    tempEvent.EventType:= tempDataSet.FieldByName('ik_event_type').AsInteger;
    tempEvent.CalcUnitIK:= tempDataSet.FieldByName('ik_calc_unit').AsInteger;
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_event').AsInteger;
    tempEvent.DiscIK:= tempDataSet.FieldByName('ik_disc').AsInteger;
    tempEvent.VidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempEvent.VidNagruzkiIK:= tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger;
    tempEvent.RoomIK:= tempDataSet.FieldByName('ik_room').AsInteger;
    tempEvent.ExceptionDate:= tempDataSet.FieldByName('dExceptionDate').AsDateTime;
    tempEvent.BeginDate:= tempDataSet.FieldByName('dBegin_date').AsDateTime;
    tempEvent.IsException:= true;
    tempEvent.RepeatPattern:= nil;}

    Result.Add(TSheduleEvent.Create(tempDataSet, true));
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TSheduleRegistry.GetRepeatPattern(
  PatternIK: integer): TRepeatPattern;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'Select * From RepeatPattern Where ik_repeat_pattern = ' + IntToStr(PatternIK);
  try
    tempDataSet.Open;
    Result:= GetRepeatPattern(tempDataSet);
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TSheduleRegistry.GetRepeatPattern(
  ASourceDataSet: TDataSet): TRepeatPattern;
begin
  case (ASourceDataSet.FieldByName('ik_repeat_type').AsInteger) of
    1: Result:= TDayRepeatPattern.Create;
    2: Result:= TWeekRepeatPattern.Create;
    3: Result:= TMonthRepeatPattern.Create;
    else Result:= nil;
  end;
  if (Result = nil) then
    EApplicationException.Create('Неизвестный шаблон повторения...');
  Result.RepeatPattenIK:= ASourceDataSet.FieldByName('ik_repeat_pattern').AsInteger;
  Result.RepeatType:= ASourceDataSet.FieldByName('ik_repeat_type').AsInteger;
  Result.RepeatFrequency:= ASourceDataSet.FieldByName('iRepeat_frequency').AsInteger;
  Result.RepeatMask:= ASourceDataSet.FieldByName('cRepeat_mask').AsString;
  Result.RepeatLimitType:= ASourceDataSet.FieldByName('ik_repeat_limit').AsInteger;
  if (ASourceDataSet.FieldByName('iRepeat_count').Value <> NULL) then
      Result.RepeatCount:= ASourceDataSet.FieldByName('iRepeat_count').AsInteger
  else Result.RepeatCount:= -1;
  if (ASourceDataSet.FieldByName('dFinal_date').Value <> NULL) then
      Result.EndDateOfRepeat:= ASourceDataSet.FieldByName('dFinal_date').AsDateTime
  else Result.EndDateOfRepeat:= now;
end;

{ TPotokGroups }

constructor TPotokGroups.Create(APotokIK: integer);
var
  tempDS: TADODataSet;
begin
  fPotokIK:= APotokIK;
  fGroupIKList:= TStringList.Create;
  fFacultyIKList:= TStringList.Create;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:=  'SELECT Grup.ik_grup, rsf.ik_fac FROM Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac '+
      'INNER JOIN Relation_potok_spec rps ON rsf.ik_spec_fac = rps.ik_spec_fac INNER JOIN Potok ON rps.ik_potok = Potok.ik_potok INNER JOIN Potok_semestr ps ON rps.ik_potok = ps.id_potok '+
      'WHERE ik_potok_semestr  = ' + IntToStr(APotokIK) + ' and (nYear_post = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok INNER JOIN Potok_semestr ps ON Potok.ik_potok =ps.id_potok  WHERE ik_potok_semestr  = ' + IntToStr(APotokIK) + ')))';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      fGroupIKList.Add(tempDS.FieldByName('ik_grup').AsString);
      fFacultyIKList.Add(tempDS.FieldByName('ik_fac').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

destructor TPotokGroups.Destroy;
begin
  if Assigned(fGroupIKList) then FreeAndNil(fGroupIKList);
  if Assigned(fFacultyIKList) then FreeAndNil(fFacultyIKList);
  inherited Destroy;
end;

{ TPotokGroupsStorage }

constructor TPotokGroupsStorage.Create;
begin
  inherited Create(true);
end;

function TPotokGroupsStorage.getPotok(PotokIK: integer): TPotokGroups;
var
  i: integer;
begin
  Result:= nil;
  for i := 0 to Count - 1 do
    if Items[i].PotokIK = PotokIK then
    begin
      Result:= Items[i];
      exit;
    end;
  if Result = nil then Result:= Items[Add(TPotokGroups.Create(PotokIK))];   
end;

function TPotokGroupsStorage.getPotokItem(index: integer): TPotokGroups;
begin
  Result:= TPotokGroups(inherited Items[index]);
end;

procedure TPotokGroupsStorage.setPotokItem(index: integer;
  const Value: TPotokGroups);
begin
  inherited Items[index]:= Value;
end;

end.
