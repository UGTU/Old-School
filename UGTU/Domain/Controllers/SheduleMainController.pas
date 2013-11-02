unit SheduleMainController;
  {#Author villain@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Classes, Controls, ADODB, DB, ComCtrls, Contnrs, DateUtils,
  Variants, StdCtrls, GeneralController, SheduleClasses, SheduleGrids, SheduleController;

type
  TSheduleMainController = class(TInterfacedObject, ISheduleMainController)
  private
    function GetSubsetOfCalcUnit(CalcUnitIK: integer): string;
  public
    constructor Create;
    destructor Destroy; override;
    function GetStudyPeriodName(SheduleIK: integer): string;
    procedure GetAllCampusRooms(SourceDataSet: PDataSet; CampusIK: integer);
    procedure GetFreedomCampusRooms(SourceDataSet: PDataSet; CampusIK: integer; ScheduleIK, KafedraIK: integer);
    function GetSheduleIK(YearIK, SemIK: integer): integer;
    function GetRoomsForPrepodPlanIKList(SourceDataSet: PDataSet; PrepodPlanIKList: TStringList): integer;
    function GetRoomsForPrepodPlanIK(SourceDataSet: PDataSet; CampusIK, SheduleIK: integer; PrepodPlanIKList, dopConditions: string; defValue: Variant): Variant;
    function GetCampusForPrepodPlanIK(SourceDataSet: PDataSet; CalcUnitIK, SheduleIK: integer; ContentPlanNagrIKList: string; var PrepodPlanIKList: string; defValue: Variant): Variant;
    function GetCampusFromRoom(RoomIK: integer):integer;
    function GetAllCampus(SourceDataSet: PDataSet; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetAllRooms(SourceDataSet: PDataSet; CampusIK: integer; isShowFirst: boolean; dopConditions: string; defaultValue: Variant): Variant;
    function GetSheduleName(SheduleIK: integer): string;
    procedure GetEventConflictList(AEvent: TSheduleEvent; ASheduleIK: integer; AConflictList: TSheduleEventList;
      ATeacherIK, ARoomIK, ACalcUnitIK: integer);
    procedure GetExamConflictList(AExam: TSheduleExamination; ASheduleIK: integer; AConflictList: TSheduleExaminationList;
      ATeacherIK, ARoomIK, ACalcUnitIK: integer);
    function CheckEventForConflict(AEvent: TSheduleEvent; AConflictList: TSheduleEventList): boolean;
    function CheckExamForConflict(AExam: TSheduleExamination; AConflictList: TSheduleExaminationList): boolean;

    function LoadFacultyEvents(SheduleIK, FacultyIK: integer): boolean;
    function LoadDepartmentEvents(SheduleIK, KafedraIK: integer): boolean;
    function LoadFacultyExams(SheduleIK, FacultyIK: integer): boolean;
    function LoadDepartmentExams(SheduleIK, KafedraIK: integer): boolean;

    function DeleteDepLessonShedule(SheduleIK, KafIK: integer): boolean;
    function DeleteFacLessonShedule(SheduleIK, FacIK: integer): boolean;
    function DeleteDepExamShedule(SheduleIK, KafIK: integer): boolean;
    function DeleteFacExamShedule(SheduleIK, FacIK: integer): boolean;

    function CheckEventForDelete(AEventIK: integer): boolean;
    function CheckEventVersion(AEvent: TSheduleEvent): boolean;
    function CheckExamForDelete(AExamIK: integer): boolean;
    function CheckExamVersion(AExam: TSheduleExamination): boolean;

    // вызываются в AddAudEvent
    function GetDepartmentListForAddEvent(SourceDataSet: PDataSet; IK, SheduleIK: integer; IsDepProcess, IsAudEvent, IsShowFirst: boolean): Variant;
    function GetFormEdListForAddEvent(SourceDataSet: PDataSet; IK, SheduleIK, KafIK: integer; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetTeacherListForAddEvent(SourceDataSet: PDataSet; IK, SheduleIK, KafIK, FormEdIK: integer; var PlanNagrIKList: string;  IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetTeacherWorkTypeListForAddEvent(SourceDataSet: PDataSet; IK, TabN: integer; PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetDiscListForAddEvent(SourceDataSet: PDataSet; IK, TeacherIK: integer; PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetPotokListForAddEvent(SourceDataSet: PDataSet; IK, TeacherIK, DiscIK: integer;  PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetVidZanyatListForAddEvent(SourceDataSet: PDataSet; IK, TeacherIK, DiscIK, PotokIK: integer; PlanNagrIKList: string; IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetVidNagruzkiListForAddEvent(SourceDataSet: PDataSet; IK, TeacherIK, DiscIK, PotokIK, VidZanyatIK: integer; PlanNagrIKList: string; IsShowFirst: boolean; defValue: Variant): Variant;
    function GetCalcUnitListForAddEvent(SourceDataSet: PDataSet; IK, TeacherIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK, PotokShemaDecomposeType: integer; PlanNagrIKList, dopConditions: string; var ContentPlanNagrIKList: string; IsDepProcess, IsShowFirst: boolean; defValue: Variant): Variant;
    function GetRepeatTypeList(SourceDataSet: PDataSet): Variant;
    function CheckPrepodSemseterTimeConstraint(ASheduleIK: integer; SemLengthInfo: TSemLengthInfo; temp: TSheduleEvent): boolean;
    function CheckPrepodSessionTimeConstraint(ASheduleIK: integer; temp: TSheduleExamination): boolean;
    function CheckRoomUseConstraint(PrepodPlanIKList: string; ASheduleIK, AKafIK, ARoomIK: integer): boolean;

    function GetDepartmentListForAddEventFromPrefetch(KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetFormEdListForAddEventFromPrefetch(KafedraIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetDiscListForAddEventFromPrefetch(KafedraIK, FormEdIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetVidZanyatListForAddEventFromPrefetch(KafedraIK, FormEdIK, DiscIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetVidNagruzkiListForAddEventFromPrefetch(KafedraIK, FormEdIK, DiscIK, VidZanyatIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetCalcUnitListForAddEventFromPrefetch(KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetTeacherListForAddEventFromPrefetch(KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK, CalcUnitIK: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetTeacherWorkTypeListForAddEventFromPrefetch(KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK, CalcUnitIK, TabN: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
    function GetCampusForPrepodPlanIKFromPrefetch(SourceDataSet: PDataSet; SheduleIK, KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK, CalcUnitIK, TeacherIK: integer; var PrepodPlanIKList: string; defValue: Variant): Variant;
    procedure ClearPrefetchPlanNagr();
    procedure LoadPlanNagrForTeacherToPrefetch(AKafedraIK, ASheduleIK: integer; isAudEvent: boolean);
    procedure LoadPlanNagrForGroupToPrefetch(AGroupIK, ASheduleIK: integer; isAudEvent: boolean);

    procedure SearchEventsForPrep(SourceEventsDS: TADODataSet; ASheduleIK, ATabN: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);
    procedure SearchEventsForGroup(SourceEventsDS: TADODataSet; ASheduleIK, AGroupIK: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);
    procedure SearchEventsForRoom(SourceEventsDS: TADODataSet; ASheduleIK, ARoomIK: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);

    procedure SearchExamsForPrep(SourceExamDS: TADODataSet; ASheduleIK, ATabN: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);
    procedure SearchExamsForGroup(SourceExamDS: TADODataSet; ASheduleIK, AGroupIK: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);
    procedure SearchExamsForRoom(SourceExamDS: TADODataSet; ASheduleIK, ARoomIK: integer; SearchDate: TDate; StartTime, StopTime: TDateTime);

    function MakeScheduleBookmark(ATypeIK: TScheduleBookmarkType; ASheduleIK, AObjectIK: integer): integer;
    function GetScheduleBookmarkName(ABookmarkIK: integer): string;
    function GetAllBookmarks(): TStringList;
    procedure GetScheduleBookmarkInfo(ABookmarkIK: integer; var ABookmarkType: TScheduleBookmarkType; var ABookmarkSheduleYearIK, ABookmarkSheduleSemIK, ABookmarkObjectIK: integer);
    function GetFacultyForDep(KafIK: integer): integer;
    
    {
        GetAllEventsInInterval - загружает список событий попадающих в интервал [startDate, stopDate]
    }
    function GetAllEventsInInterval(startDate, stopDate: TDate; TeacherPlanNagrIK, TeacherIK: integer): TObjectList;
    function GetAllExamsInInterval(startDate, stopDate: TDate; TeacherPlanNagrIK, TeacherIK: integer): TObjectList;

    procedure GetParts(SourseDS: PDataSet);
    {
        GetPlanNagrFromShedule - возвращает планы нарузки, которые по времени соотвествуют расписанию SheduleIK кафедры KafedraIK
    }
//    function GetPlanNagrFromShedule(SourceDataSet: PDataSet; SheduleIK, KafedraIK: integer; isShowFirst: boolean): Variant;

    procedure DeleteExam(ExamIK: integer);
    {
        DeleteEvent - удалаяет событие EventIK
    }
    procedure DeleteEvent(EventIK: integer);

    {
        DeleteException - удалаяет исключение ExceptionIK
    }
    procedure DeleteException(ExceptionIK: integer);

    procedure ExportGroupLessonShedule(SheduleIK, DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar; numeratorStart: TDate);
    procedure ExportTeacherLessonShedule(SheduleIK, KafIK: integer; ProgressBar: TProgressBar; numeratorStart: TDate);
    procedure ExportGroupExamShedule(SheduleIK, DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar);
    procedure ExportTeacherExamShedule(SheduleIK, KafIK: integer; ProgressBar: TProgressBar);

    function SaveEvent(var newEvent: TSheduleEvent; sourceEvent: TSheduleEvent; isException: boolean; sheduleGrid: TCustomLessonSheduleGrid; PrepodPlanNagrIKList: string): boolean;
    function SaveExam(var newExam: TSheduleExamination; sourceExam: TSheduleExamination; sheduleGrid: TCustomExamSheduleGrid; PrepodPlanNagrIKList: string): boolean;

    procedure UnionDateAndTime(ADate: TDate; var AStartTime, AStopTime: TDateTime);
  end;

implementation

uses NagruzkaClasses, NagruzkaController, ExcelXP, ComObj, uDM,
  ExceptionBase;

type
  TPrepodInPlanNagr = class
  private
    fTabN: integer;
    fTeacherIK: integer;
    fWorkTypeName: string;
    fFIO: string;
    fPrepodPlanIKList: TStringList;
  public
    constructor Create(ATeacherIK: integer);
    destructor Destroy; override;
    procedure AddPrepodPlanIK(APrepodPlanIK: string);
    function GetPrepodPlanIKListAsString(): string;
    property TeacherIK: integer read fTeacherIK;
    property TabN: integer read fTabN write fTabN;
    property WorkTypeName: string read fWorkTypeName write fWorkTypeName;
    property FIO: string read fFIO write fFIO;
  end;

  TCalcUnitInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fCalcUnitIK: integer;
    fCalcUnitName: string;
    procedure LoadItemNames;
    function getTeacher(TeacherIK: Integer): TPrepodInPlanNagr;
    procedure setTeacher(TeacherIK: Integer; const Value: TPrepodInPlanNagr);
  public
    constructor Create(ACalcUnitIK: integer);
    function GetTeachersFIOList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    function GetTeacherWorkTypesList(ATabN: integer; KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property CalcUnitIK: integer read fCalcUnitIK;
    property CalcUnitName: string read fCalcUnitName write fCalcUnitName;
    property Items[TeacherIK: Integer]: TPrepodInPlanNagr read getTeacher write setTeacher;
  end;

  TVidNagruzkiInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fVidNagruzkiIK: integer;
    fVidNagruzkiName: string;
    procedure LoadItemNames;
    function getCalcUnit(CalcUnitIK: Integer): TCalcUnitInPlanNagr;
    procedure setCalcUnit(CalcUnitIK: Integer;
      const Value: TCalcUnitInPlanNagr);
  public
    constructor Create(AVidNagruzkiIK: integer);
    function GetCalcUnitsList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property Items[CalcUnitIK: Integer]: TCalcUnitInPlanNagr read getCalcUnit write setCalcUnit;
    property VidNagruzkiIK: integer read fVidNagruzkiIK;
    property VidNagruzkiName: string read fVidNagruzkiName write fVidNagruzkiName;
  end;

  TVidZanyatInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fVidZanyatIK: integer;
    fVidZanyatName: string;
    procedure LoadItemNames;
    function getVidNagruzki(VidNagruzkiIK: Integer): TVidNagruzkiInPlanNagr;
    procedure setVidNagruzki(VidNagruzkiIK: Integer;
      const Value: TVidNagruzkiInPlanNagr);
  public
    constructor Create(AVidZanyatIK: integer);
    function GetVidNagruzkiList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property Items[VidNagruzkiIK: Integer]: TVidNagruzkiInPlanNagr read getVidNagruzki write setVidNagruzki;
    property VidZanyatIK: integer read fVidZanyatIK;
    property VidZanyatName: string read fVidZanyatName write fVidZanyatName;
  end;

  TDiscInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fDiscIK: integer;
    fDiscName: string;
    procedure LoadItemNames;
    function getVidZanyat(VidZanyatIK: Integer): TVidZanyatInPlanNagr;
    procedure setVidZanyat(VidZanyatIK: Integer;
      const Value: TVidZanyatInPlanNagr);
  public
    constructor Create(ADiscIK: integer);
    function GetVidZanyatList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property Items[VidZanyatIK: Integer]: TVidZanyatInPlanNagr read getVidZanyat write setVidZanyat;
    property DiscIK: integer read fDiscIK;
    property DiscName: string read fDiscName write fDiscName;
  end;

  TFormEdInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fFormEdIK: integer;
    fFormEdName: string;
    procedure LoadItemNames;
    function getDisc(DiscIK: Integer): TDiscInPlanNagr;
    procedure setDisc(DiscIK: Integer; const Value: TDiscInPlanNagr);
  public
    constructor Create(AFormEdIK: integer);
    function GetDiscList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property Items[DiscIK: Integer]: TDiscInPlanNagr read getDisc write setDisc;
    property FormEdIK: integer read fFormEdIK;
    property FormEdName: string read fFormEdName write fFormEdName;
  end;

  TDepartmentInPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    fKafedraIK: integer;
    fKafedraName: string;
    procedure LoadItemNames;
    function getFormEd(FormEdIK: Integer): TFormEdInPlanNagr;
    procedure setFormEd(FormEdIK: Integer; const Value: TFormEdInPlanNagr);
  public
    constructor Create(AKafedraIK: integer);
    function GetFormEdList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    property Items[FormEdIK: Integer]: TFormEdInPlanNagr read getFormEd write setFormEd;
    property KafedraIK: integer read fKafedraIK;
    property KafedraName: string read fKafedraName write fKafedraName;
  end;

  TPlanNagr = class(TObjectList)
  private
    fItemNamesHaveBeenLoaded: boolean;
    procedure LoadItemNames;
    function getDepartment(KafedraIK: Integer): TDepartmentInPlanNagr;
    procedure setDepartment(KafedraIK: Integer;  const Value: TDepartmentInPlanNagr);
  public
    constructor Create;
    function GetDepartmentList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
    function LoadPlanNagrForTeacher(AKafedraIK, ASheduleIK: integer; isAudEvent: boolean): boolean;
    function LoadPlanNagrForGroup(AGroupIK, ASheduleIK: integer; isAudEvent: boolean): boolean;
    property Items[KafedraIK: Integer]: TDepartmentInPlanNagr read getDepartment write setDepartment;
  end;

var
  fPlanNagrForAddSheduleItem: TPlanNagr;

function TSheduleMainController.CheckEventForConflict(AEvent: TSheduleEvent;
  AConflictList: TSheduleEventList): boolean;
var
  dateList: TObjectList;
  tempEvent: TSheduleEvent;
  i, j: integer;
  y,m,d,h, min, s, ms, hs, mins,ss, mss: word;
begin
  Result:= false;
  try
    if not AEvent.IsException then
      dateList:= AEvent.GetAllEventsBetween(AEvent.BeginDate, AEvent.GetEventMaxDate)
    else
    begin
      dateList:= TObjectList.Create;
      DecodeDate(AEvent.BeginDate, y, m, d);
      DecodeTime(AEvent.Start, h, min, s, ms);
      DecodeTime(AEvent.Stop, hs, mins,ss, mss);
      dateList.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
    end;
    for j:= 0 to AConflictList.Count-1 do
      for i:= 0 to dateList.Count-1 do
      begin
        tempEvent:= AConflictList[j].IsOccured(TFactEvent(dateList[i]).EventStart, TFactEvent(dateList[i]).EventStop);
        if tempEvent <> nil then
        begin
          Result:= true;
          exit;
        end;
      end;
  finally
    if Assigned(dateList) then dateList.Free;
  end;
end;

function TSheduleMainController.CheckEventForDelete(AEventIK: integer): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_event FROM SheduleEvent WHERE ik_event = ' + IntToStr(AEventIK);
    tempDS.Open;
    Result:= tempDS.RecordCount = 0;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.CheckEventVersion(
  AEvent: TSheduleEvent): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= true;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT i_version FROM SheduleEvent WHERE ik_event = ' + IntToStr(AEvent.EventIK);
    tempDS.Open;
    if tempDS.RecordCount > 0 then
      if tempDS.FieldByName('i_version').AsInteger <> AEvent.Version then
      begin
        Result:= false;
        tempDS.Close;
        tempDS.CommandText:= 'SELECT * FROM GetSheduleEventsForObject(1, ' + IntToStr(AEvent.SheduleIK) + ', ' + IntToStr(AEvent.EventIK) + ')';
        tempDS.Open;
        if tempDS.RecordCount > 0 then AEvent.Assign(tempDS, AEvent.IsException);
      end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.CheckExamForConflict(AExam: TSheduleExamination;
  AConflictList: TSheduleExaminationList): boolean;
var
  i: integer;
begin
  Result:= false;
  for I := 0 to AConflictList.Count - 1 do
    if (AConflictList[i].IsOccured(AExam.Start, AExam.Stop) <> nil) and (AExam.VidZanyatIK<>31) then
    begin
      Result:= true;
      exit;
    end;
end;

function TSheduleMainController.CheckExamForDelete(AExamIK: integer): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_examination FROM SheduleExamination WHERE ik_examination = ' + IntToStr(AExamIK);
    tempDS.Open;
    Result:= tempDS.RecordCount = 0;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.CheckExamVersion(
  AExam: TSheduleExamination): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= true;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT i_version FROM SheduleExamination WHERE ik_examination = ' + IntToStr(AExam.ExamIK);
    tempDS.Open;
    if tempDS.RecordCount > 0 then
      if tempDS.FieldByName('i_version').AsInteger <> AExam.Version then
      begin
        Result:= false;
        tempDS.Close;
        tempDS.CommandText:= 'SELECT * FROM GetSheduleExamsForObject(1, ' + IntToStr(AExam.SheduleIK) + ', ' + IntToStr(AExam.ExamIK) + ')';
        tempDS.Open;
        if tempDS.RecordCount > 0 then AExam.Assign(tempDS);
      end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.CheckPrepodSemseterTimeConstraint(ASheduleIK: integer; SemLengthInfo: TSemLengthInfo; temp: TSheduleEvent): boolean;
var
  tempDS: TADODataSet;
  eventDayMatrix: array[0..1] of array[0..5] of boolean;
  tempEventList: TObjectList;
  i, j: integer;
begin
  tempEventList:= temp.GetAllEventsBetween(temp.BeginDate, SemLengthInfo.SemStop);
  if tempEventList.Count > 0 then
    for I := 0 to tempEventList.Count - 1 do
      eventDayMatrix[WeeksBetween(TFactEvent(tempEventList[i]).EventStart, SemLengthInfo.SemStart) mod 2][DayOfWeek(TFactEvent(tempEventList[i]).EventStart) - 2]:= true;
  tempEventList.Clear;
  tempEventList.Free;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Prepod_semester_time_constraint WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and (ik_kaf = ' + IntToStr(TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(temp.TeacherIK)) +
    ') and (iTab_n = ' + IntToStr(TNagruzkaController.Preparation.GetTabNFromTeacherIK(temp.TeacherIK)) + ') and (ik_event_type = ' + IntToStr(temp.EventType) + ')';
  tempDS.Open;
  for I := 0 to 1 do
    for j := 0 to 5 do
      if eventDayMatrix[i][j] then
        if not tempDS.Locate('bit_denumerator; ti_day_number', VarArrayOf([i, j+1]), [loPartialKey]) then
        begin
          tempDS.Close;
          tempDS.Free;
          Result:= false;
          exit;
        end;        
  Result:= true;
end;

function TSheduleMainController.CheckPrepodSessionTimeConstraint(
  ASheduleIK: integer; temp: TSheduleExamination): boolean;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Prepod_session_time_constraint WHERE (ik_kaf = ' + IntToStr(TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(temp.TeacherIK)) +
    ') and (iTab_n = ' + IntToStr(TNagruzkaController.Preparation.GetTabNFromTeacherIK(temp.TeacherIK)) + ') and (d_session_date = Convert(datetime, ''' + FormatDateTime('mm.dd.yyyy', temp.ExamDate) + ''')) and (d_work_time_start <= Convert(datetime, ''' + TimeToStr(temp.Start) + ''')) and (d_work_time_end >= Convert(datetime, ''' + TimeToStr(temp.Stop) + '''))';
  tempDS.Open;
  Result:= tempDS.RecordCount > 0;
  tempDS.Close;
  tempDS.Free; 
end;

function TSheduleMainController.CheckRoomUseConstraint(PrepodPlanIKList: string;
  ASheduleIK, AKafIK, ARoomIK: integer): boolean;
var
  tempDS, roomFondDS: TADODataSet;
  tempPrepodPlanIKList: TStringList;
  i: integer;
  isRoomNotFound: boolean;
begin
  tempPrepodPlanIKList:= TGeneralController.Instance.getStringListFromStr(PrepodPlanIKList);
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  roomFondDS:= TGeneralController.Instance.GetNewADODataSet(false);
  roomFondDS.CommandText:= 'SELECT * FROM Relation_kafedra_room WHERE (ik_kaf = ' + IntToStr(AKafIK) + ') and (ik_shedule = ' + IntToStr(ASheduleIK) + ')';
  roomFondDS.Open;
  isRoomNotFound:= false;
  for i := 0 to tempPrepodPlanIKList.Count - 1 do
  begin
    tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan = ' + tempPrepodPlanIKList[i];
    tempDS.Open;
    if tempDS.RecordCount > 0 then
    begin
      if tempDS.FieldByName('ik_kaf').Value = NULL then
      begin
        if not tempDS.Locate('ik_room', ARoomIK, [loPartialKey]) then
        begin
          isRoomNotFound:= true;
          break;
        end;
      end
      else
      begin
        if not roomFondDS.Locate('ik_room', ARoomIK, [loPartialKey]) then
        begin
          isRoomNotFound:= true;
          break;
        end;
      end;
    end;
    tempDS.Close;
  end;
  tempDS.Free;
  roomFondDS.Close;
  roomFondDS.Free;
  Result:= not isRoomNotFound;
end;

procedure TSheduleMainController.ClearPrefetchPlanNagr;
begin
  if fPlanNagrForAddSheduleItem <> nil then
    fPlanNagrForAddSheduleItem.Clear;
end;

constructor TSheduleMainController.Create;
begin
  fPlanNagrForAddSheduleItem:= TPlanNagr.Create;
end;

function TSheduleMainController.DeleteDepExamShedule(SheduleIK,
  KafIK: integer): boolean;
begin
  Result:= false;

end;

function TSheduleMainController.DeleteDepLessonShedule(SheduleIK,
  KafIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateShedule', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, SheduleIK);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
  except
    if Assigned(tempStoredProc) then tempStoredProc.Free;
    raise;
  end;
  Result:= true;
end;

procedure TSheduleMainController.DeleteEvent(EventIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSheduleEvent', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, EventIK);

  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

procedure TSheduleMainController.DeleteExam(ExamIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSheduleExam', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_exam', ftInteger, pdInput, 0, ExamIK);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

procedure TSheduleMainController.DeleteException(ExceptionIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSheduleException', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, 0);
  tempStoredProc.Parameters.CreateParameter('@ik_exception', ftInteger, pdInput, 0, ExceptionIK);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TSheduleMainController.DeleteFacExamShedule(SheduleIK,
  FacIK: integer): boolean;
begin
  Result:= false;
end;

function TSheduleMainController.DeleteFacLessonShedule(SheduleIK,
  FacIK: integer): boolean;
begin
  Result:= false;
end;

destructor TSheduleMainController.Destroy;
begin
  if fPlanNagrForAddSheduleItem <> nil then
  begin
    fPlanNagrForAddSheduleItem.Clear;
    FreeAndNil(fPlanNagrForAddSheduleItem);
  end;
  inherited;
end;

procedure TSheduleMainController.ExportGroupExamShedule(SheduleIK,
  DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  tempDataSet: TADODataSet;
  tempExam: TSheduleExamination;
  tempStr: string;
  i, g, k, sessionDayCount, colNumber, rowNumber: integer;
  semLengthInfo: TDefaultSemLengthInfo;
  chokeDS: PDataSet;
  GroupsList: TObjectList;
//const
//  cols: array[0..29] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z','AA', 'AB','AC','AD');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
  end;
  IExcelApp.ActiveWindow.SplitColumn:= 1;
  IExcelApp.ActiveWindow.SplitRow:= 2;
  IExcelApp.ActiveWindow.FreezePanes:= true;

  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  GroupsList:= TObjectList.Create;

  // грузим даты сессии
  colNumber:= 1;
  RangeE:= IExcelApp.Range['A2', 'A2'];
  RangeE.Value2:= 'Дата';
  RangeE.Font.Bold:= true;
  semLengthInfo:= TSheduleController.AccountFunctions.GetSemesterLength(SheduleIK, false, chokeDS);
  sessionDayCount:= round(semLengthInfo.MaxSessionStop) - round(semLengthInfo.MinSessionStart);

  for I:= 0 to sessionDayCount do
  begin
    RangeE:= IExcelApp.Range['A' + IntToStr(3 + i), 'A' + IntToStr(3 + i)];
    RangeE.Value2:= FormatDateTime('dd.mm.yyyy', semLengthInfo.MinSessionStart + i);
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 12;
  end;

  //грузим группы
  tempDataSet.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(semLengthInfo.YearIK);
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('year_value').AsString;
  tempDataSet.Close;
  if not AIsDepShedule then
  begin                     // выборка для факультета
    case semLengthInfo.SemIK of
    1: tempDataSet.CommandText:= 'SELECT * FROM GetGroupsForFaculty('+IntToStr(DepartmentID)+ ',' + tempStr + ',1)';
    2: tempDataSet.CommandText:= 'SELECT * FROM GetGroupsForFaculty('+IntToStr(DepartmentID)+ ',' + tempStr + ',2)';
    end;
  end
  else
  begin
    case semLengthInfo.SemIK of
    1: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = (SELECT ik_fac FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID) + ')) ' +
      'and (nYear_post <= ' + tempStr + ') and (nYear_post + YearObuch > ' + tempStr + ') and (rsf.ik_spec in (SELECT ik_spec FROM Spec_stud WHERE Ik_vip_dep = ' + IntToStr(DepartmentID) + ')) ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') ORDER BY nYear_post, cName_grup';
    2: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = (SELECT ik_fac FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID) + ')) ' +
      'and (nYear_post < ' + tempStr + ') and (nYear_post + YearObuch >= ' + tempStr + ') and (rsf.ik_spec in (SELECT ik_spec FROM Spec_stud WHERE Ik_vip_dep = ' + IntToStr(DepartmentID) + ')) ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') ORDER BY nYear_post, cName_grup';
    end;
  end;
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    GroupsList.Add(TFacExamSheduleGroup.Create(SheduleIK, tempDataSet.FieldByName('ik_grup').AsInteger, tempDataSet.FieldByName('cName_grup').AsString));
    tempDataSet.Next;
  end;
  tempDataSet.Close;

  //грузим название расписания
  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(2.0, 0);
  RangeE.Font.Bold:= true;
  RangeE.Font.Size:= 42;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT Cname_sem_type, (Convert(nvarchar, year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar, year_value+1)) as Big_year FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type ' +
      'INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDataSet.Open;
  tempStr:= ' на ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_sem_type').AsString) + ' семестр ' + tempDataSet.FieldByName('Big_year').AsString + ' уч. года';
  tempDataSet.Close;
  if AIsDepShedule then
  begin
    tempDataSet.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID);
    tempDataSet.Open;
    RangeE.Value2:= 'Расписание экзаменов кафедры ' + tempDataSet.FieldByName('cshort_name_kaf').AsString + tempStr;
    tempDataSet.Close;
  end
  else
  begin
    tempDataSet.CommandText:= 'SELECT Cshort_name_fac FROM Fac WHERE ik_fac = ' + IntToStr(DepartmentID);
    tempDataSet.Open;
    RangeE.Value2:= 'Расписание экзаменов факультета ' + tempDataSet.FieldByName('Cshort_name_fac').AsString + tempStr;
    tempDataSet.Close;
  end;

  //настраиваем ячейки всего расписания
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count) + IntToStr(sessionDayCount + 3)];
  RangeE.Columns.AutoFit;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Borders.Item[xlEdgeTop].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeLeft].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeRight].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideVertical].Weight:= xlMedium;

  RangeE:= IExcelApp.Range['C2', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count+1) + '2'];
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
  RangeE.Font.Size:= 12;
  RangeE.Font.Bold:= true;

  // настраиваем ячейки всего расписания за исключением заголовков
  RangeE:= IExcelApp.Range['B3', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count) + IntToStr(sessionDayCount + 3)];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(1.5, 0);
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.4, 0);
  RangeE.WrapText:= true;
  RangeE.Font.Size:= 10;

  ProgressBar.Max:= GroupsList.Count+1;
  ProgressBar.Position:= 1;
  for g:= 0 to GroupsList.Count - 1 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2', TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2'];
    RangeE.Font.Bold:= true;
    RangeE.Value2:= TFacExamSheduleGroup(GroupsList[g]).GroupName;
    if TFacExamSheduleGroup(GroupsList[g]).ExamCount > 0 then
      for i := 0 to TFacExamSheduleGroup(GroupsList[g]).ExamCount-1 do
      begin
        tempExam:= TFacExamSheduleGroup(GroupsList[g]).Exams[i];
        rowNumber:= round(tempExam.ExamDate) - round(semLengthInfo.MinSessionStart);
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(rowNumber + 3), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(rowNumber + 3)];
        tempStr:= FormatDateTime('hh:nn', tempExam.Start) + ' - ' + FormatDateTime('hh:nn', tempExam.Stop) + ', ' + tempExam.DiscName + ', ' + tempExam.VidNagruzkiName + ', ' + tempExam.TeacherNameWithoutTabN + ', ' + tempExam.FullRoomName;
        if TFacExamSheduleGroup(GroupsList[g]).GroupName <> tempExam.CalcUnitName then tempStr:= tempStr + ', ' + tempExam.CalcUnitName;
        if RangeE.Value2 <> EmptyStr then
          RangeE.Value2:= RangeE.Value2 + #10 + tempStr
        else RangeE.Value2:= tempStr;
      end;
    inc(colNumber);
    ProgressBar.Position:= ProgressBar.Position + 1;
  end;

  tempDataSet.Close;
  IExcelApp.Visible[0]:= true;
  finally
    if Assigned(tempDataSet) then tempDataSet.Free;
    if Assigned(GroupsList) then GroupsList.Free;
  //  IExcelApp.Workbooks[0].Close(false, EmptyParam, EmptyParam, 0);
    IExcelApp:= nil;
    RangeE:= nil;
  end;          
end;

procedure TSheduleMainController.ExportGroupLessonShedule(SheduleIK, DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar; numeratorStart: TDate);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  tempDataSet: TADODataSet;
  tempEvent: TSheduleEvent;
  tempStr: string;
  partList: TObjectList;
  tempList, twoTempList: TStringList;
  isSeparateRange: boolean;
  numStartTime, numStopTime, denumStartTime, denumStopTime: TDateTime;
  i, j, y, m, d, sy, sm, sd, h, min, s, ms: word;
  g, k, colNumber: integer;
  semLengthInfo: TDefaultSemLengthInfo;
  chokeDS: PDataSet;
  GroupsList: TObjectList;
//const
//  cols: array[0..29] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z','AA', 'AB','AC','AD');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
  end;
  IExcelApp.ActiveWindow.SplitColumn:= 2;
  IExcelApp.ActiveWindow.SplitRow:= 2;
  IExcelApp.ActiveWindow.FreezePanes:= true;

  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempList:= TStringList.Create;
  twoTempList:= TStringList.Create;
  GroupsList:= TObjectList.Create;

  // грузим пары
  colNumber:= 2;
  TSheduleRegistry.Functions.GetParts(partList);
  RangeE:= IExcelApp.Range['A2', 'A2'];
  RangeE.Value2:= 'Дни';
  RangeE.Font.Bold:= true;
  RangeE:= IExcelApp.Range['B2', 'B2'];
  RangeE.Value2:= 'Время\Группа';
  RangeE.Font.Bold:= true;

  for I := 1 to 6 do
  begin
    RangeE:= IExcelApp.Range['A' + IntToStr((i-1)*partList.Count*2 + 3), 'A' + IntToStr(i*partList.Count*2 + 3-1)];
    RangeE.MergeCells:= true;
    RangeE.Orientation:= 90;
    RangeE.Value2:= DayNames[i];
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 14;
    for j := 0 to partList.Count - 1 do
    begin
      RangeE:= IExcelApp.Range['B' + IntToStr((i-1)*partList.Count*2 + 3 + j*2), 'B' + IntToStr((i-1)*partList.Count*2 + 3 + j*2 + 1)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= FormatDateTime('h:nn', TSPartInfo(partList[j]).StartTime) + ' - ' + FormatDateTime('h:nn', TSPartInfo(partList[j]).StopTime);
      RangeE.Font.Size:= 12;
    end;
  end;

  semLengthInfo:= TSheduleController.AccountFunctions.GetSemesterLength(SheduleIK, false, chokeDS);

  //грузим группы
  tempDataSet.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(semLengthInfo.YearIK);
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('year_value').AsString;
  tempDataSet.Close;
  if not AIsDepShedule then
  begin                     // выборка для факультета
    case semLengthInfo.SemIK of
    1: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = ' + IntToStr(DepartmentID) +
      ') and (nYear_post <= ' + tempStr + ') and (nYear_post + YearObuch > ' + tempStr + ') ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') and (ik_spec in (SELECT ik_spec FROM Spec_stud WHERE ik_direction = 2)) ORDER BY nYear_post, cName_grup';
    2: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = ' + IntToStr(DepartmentID) +
      ') and (nYear_post < ' + tempStr + ') and (nYear_post + YearObuch >= ' + tempStr + ') ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') and (ik_spec in (SELECT ik_spec FROM Spec_stud WHERE ik_direction = 2)) ORDER BY nYear_post, cName_grup';
    end;
  end
  else
  begin
    case semLengthInfo.SemIK of
    1: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = (SELECT ik_fac FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID) + ')) ' +
      'and (nYear_post <= ' + tempStr + ') and (nYear_post + YearObuch > ' + tempStr + ') and (rsf.ik_spec in (SELECT ik_spec FROM Spec_stud WHERE Ik_vip_dep = ' + IntToStr(DepartmentID) + ')) ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') and (ik_spec in (SELECT ik_spec FROM Spec_stud WHERE ik_direction = 2)) ORDER BY nYear_post, cName_grup';
    2: tempDataSet.CommandText:= 'Select Grup.* From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (ik_fac = (SELECT ik_fac FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID) + ')) ' +
      'and (nYear_post < ' + tempStr + ') and (nYear_post + YearObuch >= ' + tempStr + ') and (rsf.ik_spec in (SELECT ik_spec FROM Spec_stud WHERE Ik_vip_dep = ' + IntToStr(DepartmentID) + ')) ' +
      'and (ISNULL(YEAR(DateCreate), nYear_post) <= ' + tempStr + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + tempStr + ') and (ik_spec in (SELECT ik_spec FROM Spec_stud WHERE ik_direction = 2)) ORDER BY nYear_post, cName_grup';
    end;
  end;
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    GroupsList.Add(TFacLessonSheduleGroup.Create(SheduleIK, tempDataSet.FieldByName('ik_grup').AsInteger, tempDataSet.FieldByName('cName_grup').AsString));
    tempDataSet.Next;
  end;
  tempDataSet.Close;

  //грузим название расписания
  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count+1) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(2.0, 0);
  RangeE.Font.Bold:= true;
  RangeE.Font.Size:= 42;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT Cname_sem_type, (Convert(nvarchar, year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar, year_value+1)) as Big_year FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type ' +
      'INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDataSet.Open;
  tempStr:= ' на ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_sem_type').AsString) + ' семестр ' + tempDataSet.FieldByName('Big_year').AsString + ' уч. года';
  tempDataSet.Close;
  if AIsDepShedule then
  begin
    tempDataSet.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + IntToStr(DepartmentID);
    tempDataSet.Open;
    RangeE.Value2:= 'Расписание кафедры ' + tempDataSet.FieldByName('cshort_name_kaf').AsString + tempStr;
    tempDataSet.Close;
  end
  else
  begin
    tempDataSet.CommandText:= 'SELECT Cshort_name_fac FROM Fac WHERE ik_fac = ' + IntToStr(DepartmentID);
    tempDataSet.Open;
    RangeE.Value2:= 'Расписание факультета ' + tempDataSet.FieldByName('Cshort_name_fac').AsString + tempStr;
    tempDataSet.Close;
  end;

  //настраиваем ячейки всего расписания
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count+1) + IntToStr(12*partList.Count+2)];
  RangeE.Columns.AutoFit;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Borders.Item[xlEdgeTop].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeLeft].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeRight].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideVertical].Weight:= xlMedium;

  RangeE:= IExcelApp.Range['C2', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count+1) + '2'];
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
  RangeE.Font.Size:= 12;
  RangeE.Font.Bold:= true;

  // настраиваем ячейки всего расписания за исключением заголовков
  RangeE:= IExcelApp.Range['C3', TGeneralController.Instance.GetExcelColumnLetter(GroupsList.Count+1) + IntToStr(12*partList.Count+2)];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(1.5, 0);
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.4, 0);
  RangeE.WrapText:= true;
  RangeE.Font.Size:= 10;

  ProgressBar.Max:= GroupsList.Count+1;
  ProgressBar.Position:= 1;
  for g:= 0 to GroupsList.Count - 1 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2', TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2'];
    RangeE.Font.Bold:= true;
    RangeE.Value2:= TFacLessonSheduleGroup(GroupsList[g]).GroupName;
{    if TFacLessonSheduleGroup(GroupsList[g]).EventCount = 0 then
    begin
      inc(colNumber);
      ProgressBar.Position:= ProgressBar.Position + 1;
      continue;
    end;   }
    for i := 0 to 5 do
    begin
      DecodeDate(numeratorStart + i, y, m, d);
      DecodeDate(numeratorStart + i + 7, sy, sm, sd);
      for j:= 0 to partList.Count - 1 do
      begin
        tempList.Clear;
        twoTempList.Clear;
        DecodeTime(TSPartInfo(partList[j]).StartTime, h, min, s, ms);
        numStartTime:= EncodeDateTime(y,m,d,h,min,s,ms);
        denumStartTime:= EncodeDateTime(sy,sm,sd,h,min,s,ms);
        DecodeTime(TSPartInfo(partList[j]).StopTime, h, min, s, ms);
        numStopTime:= EncodeDateTime(y,m,d,h,min,s,ms);
        denumStopTime:= EncodeDateTime(sy,sm,sd,h,min,s,ms);
        for k := 0 to TFacLessonSheduleGroup(GroupsList[g]).EventCount - 1 do
        begin
          if TFacLessonSheduleGroup(GroupsList[g]).Events[k].IsOccured(numStartTime, numStopTime) <> nil then
            if tempList.IndexOf(IntToStr(k)) < 0 then
              tempList.Add(IntToStr(k));
          if TFacLessonSheduleGroup(GroupsList[g]).Events[k].IsOccured(denumStartTime, denumStopTime) <> nil then
            if twoTempList.IndexOf(IntToStr(k)) < 0 then
              twoTempList.Add(IntToStr(k));
        end;

        if (tempList.Count <> 0) or (twoTempList.Count <> 0) then
        begin
          isSeparateRange:= not tempList.Equals(twoTempList);
          if isSeparateRange then   //есть ли разделение на числитель и знаменатель
          begin
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlThin;
            tempStr:= '';
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2)];
            for k := 0 to tempList.Count - 1 do  //пишем числитель
            begin
              tempEvent:= TFacLessonSheduleGroup(GroupsList[g]).Events[StrToInt(tempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.TeacherNameWithoutTabN + ', ' + tempEvent.FullRoomName + ',' + tempEvent.VidZanyatName;
              if TFacLessonSheduleGroup(GroupsList[g]).GroupName <> tempEvent.CalcUnitName then tempStr:= tempStr + ', ' + tempEvent.CalcUnitName;
              if k <> tempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            tempStr:= '';
            for k := 0 to twoTempList.Count - 1 do  //пишем знаменатель
            begin
              tempEvent:= TFacLessonSheduleGroup(GroupsList[g]).Events[StrToInt(twoTempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.TeacherNameWithoutTabN + ', ' + tempEvent.FullRoomName + ',' + tempEvent.VidZanyatName;
              if TFacLessonSheduleGroup(GroupsList[g]).GroupName <> tempEvent.CalcUnitName then tempStr:= tempStr + ', ' + tempEvent.CalcUnitName;
              if k <> twoTempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
          end
          else
          begin  //пишем всю ячейку
            tempStr:= '';
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            RangeE.MergeCells:= true;
            for k := 0 to tempList.Count - 1 do
            begin
              tempEvent:= TFacLessonSheduleGroup(GroupsList[g]).Events[StrToInt(tempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.TeacherNameWithoutTabN + ', ' + tempEvent.FullRoomName + ',' + tempEvent.VidZanyatName;;
              if TFacLessonSheduleGroup(GroupsList[g]).GroupName <> tempEvent.CalcUnitName then tempStr:= tempStr + ', ' + tempEvent.CalcUnitName;
              if k <> tempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
          end;
        end
        else
        begin
          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
          RangeE.MergeCells:= true;
        end;
      end;
    end;
    inc(colNumber);
    ProgressBar.Position:= ProgressBar.Position + 1;
  end;

  tempDataSet.Close;
  IExcelApp.Visible[0]:= true;
  finally
    if Assigned(tempList) then tempList.Free;
    if Assigned(twoTempList) then twoTempList.Free;
    if Assigned(tempDataSet) then tempDataSet.Free;
    if Assigned(GroupsList) then GroupsList.Free;
  //  IExcelApp.Workbooks[0].Close(false, EmptyParam, EmptyParam, 0);
    IExcelApp:= nil;
    RangeE:= nil;
  end;
end;

procedure TSheduleMainController.ExportTeacherExamShedule(SheduleIK, KafIK: integer;
  ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  tempDataSet: TADODataSet;
  tempExam: TSheduleExamination;
  tempStr: string;
  i, g, k, sessionDayCount, colNumber, rowNumber: integer;
  semLengthInfo: TDefaultSemLengthInfo;
  chokeDS: PDataSet;
  TeachersList: TObjectList;
//const
  //cols: array[0..29] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z','AA', 'AB','AC','AD');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
  end;
  IExcelApp.ActiveWindow.SplitColumn:= 1;
  IExcelApp.ActiveWindow.SplitRow:= 2;
  IExcelApp.ActiveWindow.FreezePanes:= true;

  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  TeachersList:= TObjectList.Create;

  // грузим даты сессии
  colNumber:= 1;
  RangeE:= IExcelApp.Range['A2', 'A2'];
  RangeE.Value2:= 'Дата';
  RangeE.Font.Bold:= true;
  semLengthInfo:= TSheduleController.AccountFunctions.GetSemesterLength(SheduleIK, false, chokeDS);
  sessionDayCount:= round(semLengthInfo.MaxSessionStop) - round(semLengthInfo.MinSessionStart);

  for I:= 0 to sessionDayCount do
  begin
    RangeE:= IExcelApp.Range['A' + IntToStr(3 + i), 'A' + IntToStr(3 + i)];
    RangeE.Value2:= FormatDateTime('dd.mm.yyyy', semLengthInfo.MinSessionStart + i);
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 12;
  end;

  //грузим группы
  tempDataSet.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(semLengthInfo.YearIK);
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('year_value').AsString;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'Select * From Prepods WHERE iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep Where (ik_kaf = ' + IntToStr(KafIK) + ') and (ISNULL(YEAR(release_date), ' + tempStr + ') >= ' + tempStr + ')) ORDER BY Prepods.clastname, Prepods.cfirstname, Prepods.cotch';
  tempDataSet.Open;

  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    TeachersList.Add(TDepExamSheduleTeacher.Create(SheduleIK, tempDataSet.FieldByName('iTab_n').AsInteger, tempDataSet.FieldByName('cfirstname').AsString, tempDataSet.FieldByName('clastname').AsString, tempDataSet.FieldByName('cotch').AsString));
    tempDataSet.Next;
  end;
  tempDataSet.Close;

  //грузим название расписания

  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(2.0, 0);
  RangeE.Font.Bold:= true;
  RangeE.Font.Size:= 42;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT Cname_sem_type, (Convert(nvarchar, year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar, year_value+1)) as Big_year FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type ' +
      'INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDataSet.Open;
  tempStr:= ' на ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_sem_type').AsString) + ' семестр ' + tempDataSet.FieldByName('Big_year').AsString + ' уч. года';
  tempDataSet.Close;

  tempDataSet.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + IntToStr(KafIK);
  tempDataSet.Open;
  RangeE.Value2:= 'Расписание экзаменов для преподавателей кафедры ' + tempDataSet.FieldByName('cshort_name_kaf').AsString + tempStr;
  tempDataSet.Close;

  //настраиваем ячейки всего расписания
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count) + IntToStr(sessionDayCount + 3)];
  RangeE.Columns.AutoFit;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Borders.Item[xlEdgeTop].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeLeft].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeRight].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideVertical].Weight:= xlMedium;

  RangeE:= IExcelApp.Range['C2', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count+1) + '2'];
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
  RangeE.Font.Size:= 12;
  RangeE.Font.Bold:= true;

  // настраиваем ячейки всего расписания за исключением заголовков
  RangeE:= IExcelApp.Range['B3', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count) + IntToStr(sessionDayCount + 3)];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(1.5, 0);
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.4, 0);
  RangeE.WrapText:= true;
  RangeE.Font.Size:= 10;

  ProgressBar.Max:= TeachersList.Count+1;
  ProgressBar.Position:= 1;
  for g:= 0 to TeachersList.Count - 1 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2', TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2'];
    RangeE.Font.Bold:= true;
    RangeE.Value2:= TDepExamSheduleTeacher(TeachersList[g]).FIO;
    if TDepExamSheduleTeacher(TeachersList[g]).ExamCount > 0 then
      for i := 0 to TDepExamSheduleTeacher(TeachersList[g]).ExamCount-1 do
      begin
        tempExam:= TDepExamSheduleTeacher(TeachersList[g]).Exams[i];
        rowNumber:= round(tempExam.ExamDate) - round(semLengthInfo.MinSessionStart);
        RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(rowNumber + 3), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(rowNumber + 3)];
        tempStr:= FormatDateTime('hh:nn', tempExam.Start) + ' - ' + FormatDateTime('hh:nn', tempExam.Stop) + ', ' + tempExam.DiscName + ', ' + tempExam.FullRoomName + ', ' + tempExam.CalcUnitName;
        if RangeE.Value2 <> EmptyStr then
          RangeE.Value2:= RangeE.Value2 + #10 + tempStr
        else RangeE.Value2:= tempStr;
      end;
    inc(colNumber);
    ProgressBar.Position:= ProgressBar.Position + 1;
  end;

  tempDataSet.Close;
  IExcelApp.Visible[0]:= true;
  finally
    if Assigned(tempDataSet) then tempDataSet.Free;
    if Assigned(TeachersList) then TeachersList.Free;
  //  IExcelApp.Workbooks[0].Close(false, EmptyParam, EmptyParam, 0);
    IExcelApp:= nil;
    RangeE:= nil;
  end;
end;

procedure TSheduleMainController.ExportTeacherLessonShedule(SheduleIK,
  KafIK: integer; ProgressBar: TProgressBar; numeratorStart: TDate);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  tempDataSet: TADODataSet;
  tempEvent: TSheduleEvent;
  tempStr: string;
  partList: TObjectList;
  tempList, twoTempList: TStringList;
  isSeparateRange: boolean;
  numStartTime, numStopTime, denumStartTime, denumStopTime: TDateTime;
  i, j, y, m, d, sy, sm, sd, h, min, s, ms: word;
  g, k, colNumber: integer;
  semLengthInfo: TDefaultSemLengthInfo;
  chokeDS: PDataSet;
  TeachersList: TObjectList;
//const
//  cols: array[0..29] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z','AA', 'AB','AC','AD');
begin
  ProgressBar.Position:= 0;
  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
try
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
  end;
  IExcelApp.ActiveWindow.SplitColumn:= 2;
  IExcelApp.ActiveWindow.SplitRow:= 2;
  IExcelApp.ActiveWindow.FreezePanes:= true;

  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempList:= TStringList.Create;
  twoTempList:= TStringList.Create;
  TeachersList:= TObjectList.Create;

  // грузим пары
  colNumber:= 2;
  TSheduleRegistry.Functions.GetParts(partList);
  RangeE:= IExcelApp.Range['A2', 'A2'];
  RangeE.Value2:= 'Дни';
  RangeE.Font.Bold:= true;
  RangeE:= IExcelApp.Range['B2', 'B2'];
  RangeE.Value2:= 'Время\Группа';
  RangeE.Font.Bold:= true;

  for I := 1 to 6 do
  begin
    RangeE:= IExcelApp.Range['A' + IntToStr((i-1)*partList.Count*2 + 3), 'A' + IntToStr(i*partList.Count*2 + 3-1)];
    RangeE.MergeCells:= true;
    RangeE.Orientation:= 90;
    RangeE.Value2:= DayNames[i];
    RangeE.Font.Bold:= true;
    RangeE.Font.Size:= 14;
    for j := 0 to partList.Count - 1 do
    begin
      RangeE:= IExcelApp.Range['B' + IntToStr((i-1)*partList.Count*2 + 3 + j*2), 'B' + IntToStr((i-1)*partList.Count*2 + 3 + j*2 + 1)];
      RangeE.MergeCells:= true;
      RangeE.Value2:= FormatDateTime('h:nn', TSPartInfo(partList[j]).StartTime) + ' - ' + FormatDateTime('h:nn', TSPartInfo(partList[j]).StopTime);
      RangeE.Font.Size:= 12;
    end;
  end;

  semLengthInfo:= TSheduleController.AccountFunctions.GetSemesterLength(SheduleIK, false, chokeDS);

  //грузим группы
  tempDataSet.CommandText:= 'SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(semLengthInfo.YearIK);
  tempDataSet.Open;
  tempStr:= tempDataSet.FieldByName('year_value').AsString;
  tempDataSet.Close;
  tempDataSet.CommandText:= 'Select * From Prepods WHERE iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep Where (ik_kaf = ' + IntToStr(KafIK) + ') and (ISNULL(YEAR(release_date), ' + tempStr + ') >= ' + tempStr + ')) ORDER BY Prepods.clastname, Prepods.cfirstname, Prepods.cotch';
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    TeachersList.Add(TDepLessonSheduleTeacher.Create(SheduleIK, tempDataSet.FieldByName('iTab_n').AsInteger, tempDataSet.FieldByName('cfirstname').AsString, tempDataSet.FieldByName('clastname').AsString, tempDataSet.FieldByName('cotch').AsString));
    tempDataSet.Next;
  end;
  tempDataSet.Close;

  //грузим название расписания
  RangeE:= IExcelApp.Range['A1', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count+1) + '1'];
  RangeE.MergeCells:= true;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(2.0, 0);
  RangeE.Font.Bold:= true;
  RangeE.Font.Size:= 42;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  tempDataSet.CommandText:= 'SELECT Cname_sem_type, (Convert(nvarchar, year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar, year_value+1)) as Big_year FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type ' +
      'INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDataSet.Open;
  tempStr:= ' на ' + AnsiLowerCase(tempDataSet.FieldByName('Cname_sem_type').AsString) + ' семестр ' + tempDataSet.FieldByName('Big_year').AsString + ' уч. года';
  tempDataSet.Close;
  tempDataSet.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + IntToStr(KafIK);
  tempDataSet.Open;
  RangeE.Value2:= 'Расписание преподавателей кафедры ' + tempDataSet.FieldByName('cshort_name_kaf').AsString + tempStr;
  tempDataSet.Close;

  //настраиваем ячейки всего расписания
  RangeE:= IExcelApp.Range['A2', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count+1) + IntToStr(12*partList.Count+2)];
  RangeE.Columns.AutoFit;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Borders.Item[xlEdgeTop].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeLeft].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeBottom].Weight:= xlMedium;
  RangeE.Borders.Item[xlEdgeRight].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlMedium;
  RangeE.Borders.Item[xlInsideVertical].Weight:= xlMedium;

  // настраиваем ячейки всего расписания за исключением заголовков
  RangeE:= IExcelApp.Range['C2', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count+1) + '2'];
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.2, 0);
  RangeE.Font.Size:= 12;
  RangeE.Font.Bold:= true;

  RangeE:= IExcelApp.Range['C3', TGeneralController.Instance.GetExcelColumnLetter(TeachersList.Count+1) + IntToStr(12*partList.Count+2)];
  RangeE.ColumnWidth:= IExcelApp.CentimetersToPoints(1.5, 0);
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.4, 0);
  RangeE.WrapText:= true;
  RangeE.Font.Size:= 10;

  ProgressBar.Max:= TeachersList.Count+1;
  ProgressBar.Position:= 1;
  for g:= 0 to TeachersList.Count - 1 do
  begin
    RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2', TGeneralController.Instance.GetExcelColumnLetter(colNumber) + '2'];
    RangeE.Value2:= TDepLessonSheduleTeacher(TeachersList[g]).FIO;
    for i := 0 to 5 do
    begin
      DecodeDate(numeratorStart + i, y, m, d);
      DecodeDate(numeratorStart + i + 7, sy, sm, sd);
      for j:= 0 to partList.Count - 1 do
      begin
        tempList.Clear;
        twoTempList.Clear;
        DecodeTime(TSPartInfo(partList[j]).StartTime, h, min, s, ms);
        numStartTime:= EncodeDateTime(y,m,d,h,min,s,ms);
        denumStartTime:= EncodeDateTime(sy,sm,sd,h,min,s,ms);
        DecodeTime(TSPartInfo(partList[j]).StopTime, h, min, s, ms);
        numStopTime:= EncodeDateTime(y,m,d,h,min,s,ms);
        denumStopTime:= EncodeDateTime(sy,sm,sd,h,min,s,ms);
        for k := 0 to TDepLessonSheduleTeacher(TeachersList[g]).EventCount - 1 do
        begin
          if TDepLessonSheduleTeacher(TeachersList[g]).Events[k].IsOccured(numStartTime, numStopTime) <> nil then
            if tempList.IndexOf(IntToStr(k)) < 0 then
              tempList.Add(IntToStr(k));
          if TDepLessonSheduleTeacher(TeachersList[g]).Events[k].IsOccured(denumStartTime, denumStopTime) <> nil then
            if twoTempList.IndexOf(IntToStr(k)) < 0 then
              twoTempList.Add(IntToStr(k));
        end;

        if (tempList.Count <> 0) or (twoTempList.Count <> 0) then
        begin
          isSeparateRange:= not tempList.Equals(twoTempList);
          if isSeparateRange then   //есть ли разделение на числитель и знаменатель
          begin
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            RangeE.Borders.Item[xlInsideHorizontal].Weight:= xlThin;
            tempStr:= '';
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2)];
            for k := 0 to tempList.Count - 1 do  //пишем числитель
            begin
              tempEvent:= TDepLessonSheduleTeacher(TeachersList[g]).Events[StrToInt(tempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.FullRoomName + ', ' + tempEvent.CalcUnitName;
              if k <> tempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            tempStr:= '';
            for k := 0 to twoTempList.Count - 1 do  //пишем знаменатель
            begin
              tempEvent:= TDepLessonSheduleTeacher(TeachersList[g]).Events[StrToInt(twoTempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.FullRoomName + ', ' + tempEvent.CalcUnitName;
              if k <> twoTempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
          end
          else
          begin  //пишем всю ячейку
            tempStr:= '';
            RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
            RangeE.MergeCells:= true;
            for k := 0 to tempList.Count - 1 do
            begin
              tempEvent:= TDepLessonSheduleTeacher(TeachersList[g]).Events[StrToInt(tempList[k])];
              tempStr:= tempStr + tempEvent.DiscName + ', ' + tempEvent.FullRoomName + ', ' + tempEvent.CalcUnitName;
              if k <> tempList.Count-1 then tempStr:= tempStr + #10;
            end;
            RangeE.Value2:= tempStr;
          end;
        end
        else
        begin
          RangeE:= IExcelApp.Range[TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2), TGeneralController.Instance.GetExcelColumnLetter(colNumber) + IntToStr(i*partList.Count*2 + 3 + j*2 + 1)];
          RangeE.MergeCells:= true;
        end;
      end;
    end;
    inc(colNumber);
    ProgressBar.Position:= ProgressBar.Position + 1;
  end;

  tempDataSet.Close;
  IExcelApp.Visible[0]:= true;
  finally
    if Assigned(tempList) then tempList.Free;
    if Assigned(twoTempList) then twoTempList.Free;
    if Assigned(tempDataSet) then tempDataSet.Free;
    if Assigned(TeachersList) then TeachersList.Free;
  //  IExcelApp.Workbooks[0].Close(false, EmptyParam, EmptyParam, 0);
    IExcelApp:= nil;
    RangeE:= nil;
  end;
end;

function TSheduleMainController.GetAllBookmarks: TStringList;
var
  tempDS: TADODataSet;
begin
  Result:= nil;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_bookmark FROM SheduleBookmarks WHERE ik_user = DATABASE_PRINCIPAL_ID()';
    tempDS.Open;
    Result:= TStringList.Create;
    while not tempDS.Eof do
    begin
      Result.Add(tempDS.FieldByName('ik_bookmark').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.GetAllCampus(SourceDataSet: PDataSet; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Campus ORDER BY cName_campus', 'ik_campus', isShowFirst, defaultValue);
end;

procedure TSheduleMainController.GetAllCampusRooms(SourceDataSet: PDataSet;
  CampusIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Room.*, cName_campus, cName_room_type, (cName_room + cName_campus) as full_name FROM Room INNER JOIN Campus ON Room.ik_campus = Campus.ik_campus INNER JOIN RoomType ON Room.ik_room_type = RoomType.ik_room_type WHERE Room.ik_campus = ' + IntToStr(CampusIK) + ' ORDER BY cName_campus, Cname_room', 'ik_room', false, NULL);
end;

function TSheduleMainController.GetAllEventsInInterval(startDate,
  stopDate: TDate; TeacherPlanNagrIK, TeacherIK: integer): TObjectList;
var
  tempDataSet: TADODataSet;
  tempEvent: TSheduleEvent;
  tempList: TObjectList;
  i: integer;
  y,m,d,h,min,s,ms: word;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'Select * From SheduleEvent INNER JOIN SheduleEventType ON SheduleEvent.ik_event_type = SheduleEventType.ik_event_type Where (ik_event in (SELECT ik_event FROM Relation_event_plan_nagr WHERE ik_prepod_plan = ' + IntToStr(TeacherPlanNagrIK) + ')) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (bit_exception = 0)';
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then
    Result:= TObjectList.Create(true)
  else
  begin
    tempDataSet.Close;
    tempDataSet.Free;
    Result:= nil;
    exit;
  end;
  while (not tempDataSet.Eof) do
  begin
    tempEvent:= TSheduleEvent.Create;
    DecodeDate(tempDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
    DecodeTime(tempDataSet.FieldByName('dEvent_start').AsDateTime, h, min, s, ms);
    tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(tempDataSet.FieldByName('dEvent_stop').AsDateTime, h, min, s, ms);
    tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
    tempEvent.EventType:= tempDataSet.FieldByName('ik_event_type').AsInteger;
    tempEvent.IsException:= false;
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_event').AsInteger;
    tempEvent.RepeatPattern:= TSheduleRegistry.Functions.GetRepeatPattern(tempDataSet.FieldByName('ik_repeat_pattern').AsInteger);
    tempEvent.LoadExceptions;
    tempList:= tempEvent.GetAllEventsBetween(startDate, stopDate);
    tempList.OwnsObjects:= false;
    for i:= 0 to tempList.Count-1 do
      Result.Add(tempList[i]);
    tempList.Free;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TSheduleMainController.GetAllExamsInInterval(startDate, stopDate: TDate;
  TeacherPlanNagrIK, TeacherIK: integer): TObjectList;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'Select * From SheduleExamination Where (ik_examination in (SELECT ik_examination FROM Relation_exam_plan_nagr WHERE ik_prepod_plan = ' + IntToStr(TeacherPlanNagrIK) + ')) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ')';
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then
    Result:= TObjectList.Create(true)
  else
  begin
    tempDataSet.Close;
    tempDataSet.Free;
    Result:= nil;
    exit;
  end;
  while (not tempDataSet.Eof) do
  begin
    if (tempDataSet.FieldByName('dt_time_start').AsDateTime >= startDate) and (tempDataSet.FieldByName('dt_time_start').AsDateTime <= stopDate) then
      Result.Add(TFactEvent.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime));
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TSheduleMainController.GetAllRooms(SourceDataSet: PDataSet;
  CampusIK: integer; isShowFirst: boolean; dopConditions: string;
  defaultValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Room Where (ik_campus = ' + IntToStr(CampusIK) + ')' + dopConditions + ' Order By Cname_room', 'ik_room', isShowFirst, defaultValue);
end;

function TSheduleMainController.GetCalcUnitListForAddEvent(SourceDataSet: PDataSet;
IK, TeacherIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK, PotokShemaDecomposeType: integer;
PlanNagrIKList, dopConditions: string; var ContentPlanNagrIKList: string; IsDepProcess, IsShowFirst: boolean; defValue: Variant): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
 tempDS.CommandText:= 'SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE id_potok = ' + IntToStr(PotokIK) + ')) and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') and (ik_vid_nagruzki = ' + IntToStr(VidNagruzkiIK) + ')';
  tempDS.Open;
  ContentPlanNagrIKList:= '';
  while not tempDS.Eof do
  begin
    ContentPlanNagrIKList:= ContentPlanNagrIKList + tempDS.FieldByName('ik_content_plan_nagr').AsString + ',';
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
  Delete(ContentPlanNagrIKList, Length(ContentPlanNagrIKList), 1);
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ppn.ik_calc_unit, Cname_calc_unit FROM Calc_unit_semestr INNER JOIN Prepod_plan_nagr ppn ON Calc_unit_semestr.ik_calc_unit = ppn.ik_calc_unit ' +
        'WHERE (by_plan_number = 1) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (ik_content_plan_nagr in (' + ContentPlanNagrIKList + ')) ' + dopConditions + ' ORDER BY Cname_calc_unit', 'ik_calc_unit', IsShowFirst, defValue)
  else
  begin
   case PotokShemaDecomposeType of
    1:  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ppn.ik_calc_unit, Cname_calc_unit FROM Calc_unit_semestr INNER JOIN Prepod_plan_nagr ppn ON Calc_unit_semestr.ik_calc_unit = ppn.ik_calc_unit ' +
        'WHERE (by_plan_number = 1) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (ik_content_plan_nagr in (' + ContentPlanNagrIKList + ')) ' + dopConditions + ' ORDER BY Cname_calc_unit', 'ik_calc_unit', IsShowFirst, defValue);
    2,3: Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ppn.ik_calc_unit, Cname_calc_unit FROM Calc_unit_semestr INNER JOIN Prepod_plan_nagr ppn ON Calc_unit_semestr.ik_calc_unit = ppn.ik_calc_unit ' +
        'WHERE (by_plan_number = 1) and (ik_id_prepod = ' + IntToStr(TeacherIK) + ') and (ik_content_plan_nagr in (' + ContentPlanNagrIKList + ')) ' + dopConditions + ' and (ppn.ik_calc_unit in (SELECT ik_calc_unit FROM Calc_unit_grup WHERE ik_grup = ' + IntToStr(IK) + ')) ORDER BY Cname_calc_unit', 'ik_calc_unit', IsShowFirst, defValue)
    end;
  end;
end;

function TSheduleMainController.GetCalcUnitListForAddEventFromPrefetch(
  KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].Items[VidZanyatIK].Items[VidNagruzkiIK].GetCalcUnitsList(KeyItemsList, ValueItemsList, defValue);
end;

function TSheduleMainController.GetCampusForPrepodPlanIK(SourceDataSet: PDataSet;
  CalcUnitIK, SheduleIK: integer; ContentPlanNagrIKList: string; var PrepodPlanIKList: string; defValue: Variant): Variant;
var
  tempDS: TADODataSet;
begin
  Result:= NULL;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT DISTINCT ik_prepod_plan FROM Prepod_plan_nagr WHERE (ik_calc_unit = ' + IntToStr(CalcUnitIK) + ') and (ik_content_plan_nagr in (' + ContentPlanNagrIKList + '))';
  tempDS.Open;
  PrepodPlanIKList:= '';
  while not tempDS.Eof do
  begin
    PrepodPlanIKList:= PrepodPlanIKList + tempDS.FieldByName('ik_prepod_plan').AsString + ',';
    tempDS.Next;
  end;
  tempDS.Close;
  if PrepodPlanIKList = '' then
  begin
    tempDS.Free;
    exit;
  end;
  Delete(PrepodPlanIKList, length(PrepodPlanIKList), 1);
  tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')';
  tempDS.Open;
  if tempDS.RecordCount > 0 then
  begin
    if tempDS.FieldByName('ik_kaf').Value = NULL then
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Campus WHERE ik_campus in (SELECT ik_campus FROM Room WHERE ik_room in (SELECT ik_room FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')))', 'ik_campus', false, defValue)
    else
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Campus WHERE ik_campus in (SELECT ik_campus FROM Room WHERE ik_room in (SELECT ik_room FROM Relation_kafedra_room WHERE (ik_kaf = ' + tempDS.FieldByName('ik_kaf').AsString + ') and (ik_shedule = ' + IntToStr(SheduleIK) + ')))', 'ik_campus', false, defValue);
  end
  else Result:= GetAllCampus(SourceDataSet, false, defValue);
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetCampusForPrepodPlanIKFromPrefetch(
  SourceDataSet: PDataSet; SheduleIK, KafedraIK, FormEdIK, DiscIK, VidZanyatIK,
  VidNagruzkiIK, CalcUnitIK, TeacherIK: integer; var PrepodPlanIKList: string;
  defValue: Variant): Variant;
var
  tempDS: TADODataSet;
begin
  Result:= NULL;
  PrepodPlanIKList:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].Items[VidZanyatIK].Items[VidNagruzkiIK].Items[CalcUnitIK].Items[TeacherIK].GetPrepodPlanIKListAsString;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')';
  tempDS.Open;
  if tempDS.RecordCount > 0 then
  begin
    if tempDS.FieldByName('ik_kaf').Value = NULL then
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Campus WHERE ik_campus in (SELECT ik_campus FROM Room WHERE ik_room in (SELECT ik_room FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')))', 'ik_campus', false, defValue)
    else Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Campus WHERE ik_campus in (SELECT ik_campus FROM Room WHERE ik_room in (SELECT ik_room FROM Relation_kafedra_room WHERE (ik_kaf = ' + tempDS.FieldByName('ik_kaf').AsString + ') and (ik_shedule = ' + IntToStr(SheduleIK) + ')))', 'ik_campus', false, defValue);
  end
  else Result:= GetAllCampus(SourceDataSet, false, defValue);
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetCampusFromRoom(RoomIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'Select * From Room Where ik_room = ' + IntToStr(RoomIK);
  tempDataSet.Open;
  Result:= tempDataSet.FieldByName('ik_campus').AsInteger;
  tempDataSet.Close;
  tempDataSet.Free;
end;

procedure TSheduleMainController.GetEventConflictList(AEvent: TSheduleEvent; ASheduleIK: integer; AConflictList: TSheduleEventList;
     ATeacherIK, ARoomIK, ACalcUnitIK: integer);
var
  //y,m,d,h, min, s, ms, hs, mins,ss, mss: word;
  tempDataSet: TADODataSet;
  tempEvent: TSheduleEvent;
{  eventList: TSheduleEventList;
  dateList: TObjectList;
  tempRSL, tempTCL: TStringList;
  i, j: integer;       }
begin
  AConflictList.Clear;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
//  tempDataSet.CommandText:= 'SELECT ik_event FROM SheduleEvent WHERE (ik_shedule = ' + IntToStr(SheduleIK) + ') and (bit_exception = 0) and (ik_event <> ' + IntToStr(AEvent.EventIK) + ') and (ik_event <> ' + IntToStr(AEvent.ParrentEventIK) + ')';
  if AEvent = nil then
    tempDataSet.CommandText:= 'SELECT * FROM SheduleEventWithPlanNagr WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and ((ik_id_prepod = ' + IntToStr(ATeacherIK) + ') or (ik_room = ' + IntToStr(ARoomIK) + ') or (ik_calc_unit in (' + GetSubsetOfCalcUnit(ACalcUnitIK) + ')))'
  else tempDataSet.CommandText:= 'SELECT * FROM SheduleEventWithPlanNagr WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and ((ik_id_prepod = ' + IntToStr(ATeacherIK) + ') or (ik_room = ' + IntToStr(ARoomIK) + ') or (ik_calc_unit in (' + GetSubsetOfCalcUnit(ACalcUnitIK) + '))) and (ik_event != ' + IntToStr(AEvent.EventIK) + ') and (ik_event != ' + IntToStr(AEvent.ParrentEventIK) + ')';
  tempDataSet.Open;
//  eventList:= TSheduleEventList.Create;
  while (not tempDataSet.Eof) do
  begin
    tempEvent:= TSheduleRegistry.EventStorage.GetEventByIK(tempDataSet.FieldByName('ik_event').AsInteger);
    if tempEvent = nil then
      tempEvent:= TSheduleRegistry.EventStorage.AddEvent(TSheduleEvent.Create(tempDataSet, false));
{      tempEvent:= fEventStorage.AddEvent(TSheduleEvent.Create(tempDataSet.FieldByName('dBegin_date').AsDateTime, tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, SheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_event_type').AsInteger, tempDataSet.FieldByName('ik_repeat_pattern').AsInteger,
        tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString, tempDataSet.FieldByName('bit_exception').AsBoolean));
    }
  //  eventList.Add(tempEvent);
    AConflictList.Add(tempEvent);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;

 { if not AEvent.IsException then
    dateList:= AEvent.GetAllEventsBetween(startDate, stopDate)
  else
  begin
    dateList:= TObjectList.Create;
    DecodeDate(AEvent.BeginDate, y, m, d);
    DecodeTime(AEvent.Start, h, min, s, ms);
    DecodeTime(AEvent.Stop, hs, mins,ss, mss);
    dateList.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
  end;
  for j:= 0 to eventList.Count-1 do
    for i:= 0 to dateList.Count-1 do
    begin
      tempEvent:= eventList[j].IsOccured(TFactEvent(dateList[i]).EventStart, TFactEvent(dateList[i]).EventStop);
      if tempEvent <> nil then
      begin
        AConflictList.Add(tempEvent);
        break;
      end;
    end;
  dateList.Free;
  eventList.Free;

  resCalcUnitConflictList:= '';
  resRoomConflictList:= '';
  resTeacherConflictList:= '';
  if AConflictList.Count > 0 then
  begin
    tempRSL:= TStringList.Create;
    tempTCL:= TStringList.Create;
    for I := 0 to AConflictList.Count - 1 do
    begin
      resCalcUnitConflictList:= resCalcUnitConflictList + IntToStr(AConflictList[i].CalcUnitIK) + ', ';
      if tempRSL.IndexOf(IntToStr(AConflictList[i].RoomIK)) < 0 then
      begin
            tempRSL.Add(IntToStr(AConflictList[i].RoomIK));
            resRoomConflictList:= resRoomConflictList + IntToStr(AConflictList[i].RoomIK) + ', ';
      end;
      if tempTCL.IndexOf(IntToStr(AConflictList[i].TeacherIK)) < 0 then
      begin
            tempTCL.Add(IntToStr(AConflictList[i].TeacherIK));
            resTeacherConflictList:= resTeacherConflictList + IntToStr(AConflictList[i].TeacherIK) + ', ';
      end;
    end;
    Delete(resRoomConflictList, Length(resRoomConflictList)-1, 2);
    Delete(resCalcUnitConflictList, Length(resCalcUnitConflictList)-1, 2);
    Delete(resTeacherConflictList, Length(resTeacherConflictList)-1, 2);

        //подгрузим еще расчетные единицы, которые являются подмножеством выбранных единиц
    tempRSL.Free;
    tempTCL.Free;
    resCalcUnitConflictList:= 'and (Calc_unit.ik_calc_unit not in (' + GetSubsetOfCalcUnit(resCalcUnitConflictList) + '))';
    resRoomConflictList:= 'and (ik_room not in (' + resRoomConflictList + '))';
    resTeacherConflictList:= 'and (ik_id_prepod not in (' + resTeacherConflictList + '))';
  end;      }
end;

function TSheduleMainController.LoadDepartmentEvents(SheduleIK,
  KafedraIK: integer): boolean;
begin
  Result:= TSheduleRegistry.Functions.GetDepartmentEvents(SheduleIK, KafedraIK);
end;

function TSheduleMainController.LoadDepartmentExams(SheduleIK,
  KafedraIK: integer): boolean;
begin
  Result:= TSheduleRegistry.Functions.GetDepartmentExams(SheduleIK, KafedraIK);
end;

function TSheduleMainController.GetDepartmentListForAddEvent(
  SourceDataSet: PDataSet; IK, SheduleIK: integer;
  IsDepProcess, IsAudEvent, IsShowFirst: boolean): Variant;
var
  vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '((iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1))or ((iK_type_vz = 6) and (ikTypeZanyat = 6)and (bit_nagr = 1))';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_kaf, cname_kaf FROM kafedra WHERE (ik_kaf in (SELECT ik_kaf FROM Plan_nagr ' +
      'WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
      ')) and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr ' +
      ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))) and (ik_kaf in (SELECT ik_kaf FROM Relation_kafedra_prep WHERE iTab_n = ' + IntToStr(IK) + '))', 'ik_kaf', IsShowFirst, NULL)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Plan_nagr.ik_kaf, cname_kaf FROM kafedra INNER JOIN Plan_nagr ON kafedra.ik_kaf = Plan_nagr.ik_kaf '+
        'INNER JOIN Shedule ON Plan_nagr.ik_sem_type  = Shedule.ik_sem_type INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr '+
        'INNER JOIN Potok_semestr_shema pss ON cpn.ik_shema = pss.ik_shema INNER JOIN Potok_semestr ps ON pss.ik_potok_semestr = ps.ik_potok_semestr '+
        'WHERE (ik_shedule = ' + IntToStr(SheduleIK) + ') and (ps.ik_potok_semestr  in (SELECT ik_potok_semestr FROM GetPotokForGroup(' + IntToStr(IK) + '))) '+
        'and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')', 'ik_kaf', IsShowFirst, NULL);
end;

function TSheduleMainController.GetDepartmentListForAddEventFromPrefetch(
  KeyItemsList, ValueItemsList: TStrings; defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.GetDepartmentList(KeyItemsList, ValueItemsList, defValue);
end;

function TSheduleMainController.GetDiscListForAddEvent(SourceDataSet: PDataSet; IK,
  TeacherIK: integer; PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
var
  vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT iK_disc, cName_disc FROM discpln WHERE ik_disc in (SELECT ik_disc FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))) ORDER BY cName_disc', 'ik_disc', IsShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT discpln.iK_disc, cName_disc FROM discpln INNER JOIN Content_plan_nagr cpn ON discpln.ik_disc = cpn.ik_disc '+
      'INNER JOIN Prepod_plan_nagr ppn ON ppn.ik_content_plan_nagr = cpn.ik_content_plan_nagr INNER JOIN Potok_semestr_shema pss ON cpn.ik_shema = pss.ik_shema '+
      'INNER JOIN Potok_semestr ps ON pss.ik_potok_semestr = ps.ik_potok_semestr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_id_prepod = ' + IntToStr(TeacherIK) +') '+
      'and (ps.ik_potok_semestr in (Select ik_potok_semestr From GetPotokForGroup(' + IntToStr(IK) + '))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat '+
      ' FROM vid_zaniat WHERE ' + vzCondition + ')) ORDER BY cName_disc', 'ik_disc', IsShowFirst, defValue);
//    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT iK_disc, cName_disc FROM discpln WHERE ik_disc in (SELECT ik_disc FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) +
//      ')) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))) ORDER BY cName_disc', 'ik_disc', IsShowFirst, defValue);
end;

function TSheduleMainController.GetDiscListForAddEventFromPrefetch(
  KafedraIK, FormEdIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].GetDiscList(KeyItemsList, ValueItemsList, defValue);
end;

procedure TSheduleMainController.GetExamConflictList(AExam: TSheduleExamination; ASheduleIK: integer; AConflictList: TSheduleExaminationList;
      ATeacherIK, ARoomIK, ACalcUnitIK: integer);
var
  tempDataSet: TADODataSet;
 // examList: TSheduleExaminationList;
  tempExam: TSheduleExamination;
 // tempRSL, tempTCL: TStringList;
 // i, j: integer;
begin
  AConflictList.Clear;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  if AExam = nil then
    tempDataSet.CommandText:= 'SELECT * FROM SheduleExaminationWithPlanNagr WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and ((ik_id_prepod = ' + IntToStr(ATeacherIK) + ') or (ik_room = ' + IntToStr(ARoomIK) + ') or (ik_calc_unit in (' + GetSubsetOfCalcUnit(ACalcUnitIK) + ')))'
  else tempDataSet.CommandText:= 'SELECT * FROM SheduleExaminationWithPlanNagr WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and ((ik_id_prepod = ' + IntToStr(ATeacherIK) + ') or (ik_room = ' + IntToStr(ARoomIK) + ') or (ik_calc_unit in (' + GetSubsetOfCalcUnit(ACalcUnitIK) + '))) and (ik_examination != ' + IntToStr(AExam.ExamIK) + ')';
  //'SELECT ik_examination FROM SheduleExamination WHERE (ik_shedule = ' + IntToStr(ASheduleIK) + ') and (ik_examination <> ' + IntToStr(AExam.ExamIK) + ')';
  tempDataSet.Open;
  //examList:= TSheduleExaminationList.Create;
  while (not tempDataSet.Eof) do
  begin
    tempExam:= TSheduleRegistry.ExamStorage.GetExamByIK(tempDataSet.FieldByName('ik_examination').AsInteger);
    if tempExam = nil then
      tempExam:= TSheduleRegistry.ExamStorage.AddExam(TSheduleExamination.Create(tempDataSet));
  {    tempExam:= fExamStorage.AddExam(TSheduleExamination.Create(tempDataSet.FieldByName('dt_time_start').AsDateTime, tempDataSet.FieldByName('dt_time_stop').AsDateTime,
        tempDataSet.FieldByName('ik_kaf').AsInteger, tempDataSet.FieldByName('ik_form_ed').AsInteger, ASheduleIK, tempDataSet.FieldByName('ik_object').AsInteger, tempDataSet.FieldByName('ik_id_prepod').AsInteger, tempDataSet.FieldByName('ik_id_plan_prepod').AsInteger,
        tempDataSet.FieldByName('ik_calc_unit').AsInteger, tempDataSet.FieldByName('ik_disc').AsInteger, tempDataSet.FieldByName('ik_vid_zanyat').AsInteger,
        tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger, tempDataSet.FieldByName('ik_room').AsInteger, tempDataSet.FieldByName('cName_vid_zanyat').AsString, AnsiLowerCase(tempDataSet.FieldByName('Сname_vid_nagruzki_short').AsString),
        tempDataSet.FieldByName('cName_disc').AsString, tempDataSet.FieldByName('cName_calc_unit').AsString));
   }
    AConflictList.Add(tempExam);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
  {
  for j:= 0 to examList.Count-1 do
    begin
      tempExam:= examList[j].IsOccured(AExam.Start, AExam.Stop);
      if tempExam <> nil then
      begin
        AConflictList.Add(tempExam);
        break;
      end;
    end;
  examList.Free;

  resCalcUnitConflictList:= '';
  resRoomConflictList:= '';
  resTeacherConflictList:= '';
  if AConflictList.Count > 0 then
  begin
    tempRSL:= TStringList.Create;
    tempTCL:= TStringList.Create;
    for I := 0 to AConflictList.Count - 1 do
    begin
      resCalcUnitConflictList:= resCalcUnitConflictList + IntToStr(AConflictList[i].CalcUnitIK) + ', ';
      if tempRSL.IndexOf(IntToStr(AConflictList[i].RoomIK)) < 0 then
      begin
        tempRSL.Add(IntToStr(AConflictList[i].RoomIK));
        resRoomConflictList:= resRoomConflictList + IntToStr(AConflictList[i].RoomIK) + ', ';
      end;
      if tempTCL.IndexOf(IntToStr(AConflictList[i].TeacherIK)) < 0 then
      begin
        tempTCL.Add(IntToStr(AConflictList[i].TeacherIK));
        resTeacherConflictList:= resTeacherConflictList + IntToStr(AConflictList[i].TeacherIK) + ', ';
      end;
    end;
    Delete(resRoomConflictList, Length(resRoomConflictList)-1, 2);
    Delete(resCalcUnitConflictList, Length(resCalcUnitConflictList)-1, 2);
    Delete(resTeacherConflictList, Length(resTeacherConflictList)-1, 2);

        //подгрузим еще расчетные единицы, которые являются подмножеством выбранных единиц
    tempRSL.Free;
    tempTCL.Free;
    resCalcUnitConflictList:= 'and (Calc_unit.ik_calc_unit not in (' + GetSubsetOfCalcUnit(resCalcUnitConflictList) + '))';
    resRoomConflictList:= 'and (ik_room not in (' + resRoomConflictList + '))';
    resTeacherConflictList:= 'and (ik_id_prepod not in (' + resTeacherConflictList + '))';
  end;    }

end;

function TSheduleMainController.LoadFacultyEvents(SheduleIK,
  FacultyIK: integer): boolean;
begin
  Result:= TSheduleRegistry.Functions.GetFacultyEvents(SheduleIK, FacultyIK);
end;

function TSheduleMainController.LoadFacultyExams(SheduleIK,
  FacultyIK: integer): boolean;
begin
  Result:= TSheduleRegistry.Functions.GetFacultyExams(SheduleIK, FacultyIK);
end;

function TSheduleMainController.GetFacultyForDep(KafIK: integer): integer;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_fac FROM kafedra WHERE ik_kaf = ' + IntToStr(KafIK);
    tempDS.Open;
    tempDS.Refresh;
    
    Result:= tempDS.FieldByName('ik_fac').AsInteger;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.GetFormEdListForAddEvent(SourceDataSet: PDataSet;
  IK, SheduleIK, KafIK: integer; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
var
  vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= '(iK_type_vz = 3)'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_form_ed, cName_form_ed FROM Form_ed WHERE ik_form_ed in (SELECT ik_form_ed FROM Plan_nagr ' +
      'WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
      ')) and (ik_kaf = ' + IntToStr(KafIK) + ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr '+
      ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))', 'ik_form_ed', IsShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Form_ed.ik_form_ed, cName_form_ed FROM Form_ed INNER JOIN Plan_nagr ON Form_ed.Ik_form_ed = Plan_nagr.ik_form_ed '+
        'INNER JOIN Shedule ON Plan_nagr.ik_sem_type = Shedule.ik_sem_type INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr '+
        'INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_shema = cpn.ik_shema INNER JOIN Calc_unit_semestr cus ON ppn.ik_calc_unit = cus.ik_calc_unit '+
        'INNER JOIN Potok_semestr_shema pss ON cus.ik_shema = pss.ik_shema INNER JOIN Potok_semestr ps ON pss.ik_potok_semestr = ps.ik_potok_semestr '+
        'WHERE (ik_shedule = ' + IntToStr(SheduleIK) +') and  (ik_kaf = ' + IntToStr(KafIK) + ') and (ps.ik_potok_semestr in (SELECT ps.ik_potok_semestr '+
        'FROM GetPotokForGroup(' + IntToStr(IK) + '))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))', 'ik_form_ed', IsShowFirst, defValue);
        
//     Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_form_ed, cName_form_ed FROM Form_ed WHERE ik_form_ed in (SELECT ik_form_ed FROM Plan_nagr WHERE ' +
//      '(ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_kaf = ' + IntToStr(KafIK) +
//      ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))', 'ik_form_ed', IsShowFirst, defValue)

  {if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_form_ed, cName_form_ed FROM Form_ed WHERE ik_form_ed in (SELECT ik_form_ed FROM Plan_nagr ' +
      'WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
      ')) and (ik_kaf = ' + IntToStr(KafIK) + ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr '+
      'WHERE ik_id_prepod in (SELECT ik_id_prepod FROM Relation_kafedra_prep WHERE (ik_kaf = ' + IntToStr(KafIK) + ') and (iTab_n = ' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))', 'ik_form_ed', IsShowFirst, defValue)
  else
  begin
    if IsAudEvent then
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'EXEC SheduleGetFromEdListForAudEvent @ik_shedule = ' + IntToStr(SheduleIK) + ', @ik_kaf = ' + IntToStr(KafIK) + ', @ik_group = ' + IntToStr(IK), 'ik_form_ed', IsShowFirst, defValue)
    else
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_form_ed, cName_form_ed FROM Form_ed WHERE ik_form_ed in (SELECT ik_form_ed FROM Plan_nagr WHERE ' +
        '(ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_kaf = ' + IntToStr(KafIK) +
        ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))', 'ik_form_ed', IsShowFirst, defValue)
  end;        }
end;

function TSheduleMainController.GetFormEdListForAddEventFromPrefetch(
  KafedraIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].GetFormEdList(KeyItemsList, ValueItemsList, defValue);
end;



procedure TSheduleMainController.GetFreedomCampusRooms(SourceDataSet: PDataSet;
  CampusIK, ScheduleIK, KafedraIK: integer);
begin
    TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Room.*, cName_campus, cName_room_type, (cName_room + '' '' + cName_campus) as full_name FROM Room INNER JOIN Campus ON Room.ik_campus = Campus.ik_campus INNER JOIN RoomType ON Room.ik_room_type = RoomType.ik_room_type WHERE (Room.ik_campus = ' + IntToStr(CampusIK) + ') and (ik_room not in (SELECT ik_room FROM Relation_kafedra_room WHERE (ik_shedule = ' + IntToStr(ScheduleIK) + ') and (ik_kaf != ' + IntToStr(KafedraIK) + '))) ORDER BY cName_campus, Cname_room', 'ik_room', false, NULL);
end;

{
function TSheduleMainController.GetPlanNagrFromShedule(
  SourceDataSet: PDataSet; SheduleIK, KafedraIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_plan From Plan_nagr ' + 'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed ' +
    'INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (Plan_nagr.ik_year in (Select ik_year From Shedule Where ik_shedule = ' + IntToStr(SheduleIK) + ')) and (Plan_nagr.ik_sem_type in (Select ik_sem_type From Shedule Where ik_shedule = ' + IntToStr(SheduleIK) + ')) and (Plan_nagr.ik_kaf = ' + IntToStr(KafedraIK) + ') ORDER BY cname_plan', 'ik_plan_nagr', isShowFirst, NULL);
end;
 }

procedure TSheduleMainController.GetParts(SourseDS: PDataSet);
begin
  TSheduleRegistry.Functions.GetParts(SourseDS);
end;

function TSheduleMainController.GetPotokListForAddEvent(SourceDataSet: PDataSet; IK,
  TeacherIK, DiscIK: integer; PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
var
  vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ps.ik_potok_semestr, cus.cName_calc_unit FROM Potok INNER JOIN Potok_semestr ps ON Potok.ik_potok = ps.id_potok INNER JOIN' +
      'Potok_semestr_shema pss ON ps.ik_potok_semestr = pss.ik_potok_semestr INNER JOIN Calc_unit_semestr cus ON pss.ik_shema = cus.ik_shema INNER JOIN Content_plan_nagr cpn ON cpn.ik_shema = pss.ik_shema'+
      'WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_disc = ' + IntToStr(DiscIK) + ') ORDER BY cName_calc_unit', 'ik_potok_semestr', IsShowFirst, defValue )
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ps.ik_potok_semestr, cus.cName_calc_unit FROM Potok INNER JOIN Potok_semestr ps ON Potok.ik_potok = ps.id_potok INNER JOIN Potok_semestr_shema pss ON ps.ik_potok_semestr  = ps.ik_potok_semestr INNER JOIN Calc_unit_semestr cus'+
       'ON pss.ik_shema = cus.ik_shema INNER JOIN Content_plan_nagr ON pss.ik_shema = Content_plan_nagr.ik_shema' +
      'WHERE (Content_plan_nagr.ik_plan_nagr in (' + PlanNagrIKList + ')) and (Content_plan_nagr.ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ps.ik_potok_semestr in (SELECT ik_potok_semestr FROM GetPotokForGroup(' + IntToStr(IK) + '))) and (Content_plan_nagr.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (Content_plan_nagr.ik_disc = ' + IntToStr(DiscIK) + ')', 'ik_potok_semestr', IsShowFirst, defValue);

   // Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT iK_potok, cName_potok FROM Potok WHERE ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) +
   //   ')) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_disc = ' + IntToStr(DiscIK) + '))) ORDER BY cName_potok', 'ik_potok', IsShowFirst, defValue);

{  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT iK_potok, cName_potok FROM Potok WHERE ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr ' +
      'WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_disc = ' + IntToStr(DiscIK) + ')))', 'ik_potok', IsShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT iK_potok, cName_potok FROM Potok WHERE ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) +
        ')) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_disc = ' + IntToStr(DiscIK) + ')))', 'ik_potok', IsShowFirst, defValue);}
end;

function TSheduleMainController.GetRepeatTypeList(
  SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From RepeatType WHERE ik_repeat_type <>3', 'ik_repeat_type', false, NULL);
end;

function TSheduleMainController.GetRoomsForPrepodPlanIK(SourceDataSet: PDataSet;
  CampusIK, SheduleIK: integer; PrepodPlanIKList, dopConditions: string; defValue: Variant): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + ')';
  tempDS.Open;
  if tempDS.RecordCount > 0 then
  begin
    if tempDS.FieldByName('ik_kaf').Value = NULL then
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Room WHERE (ik_room in (SELECT ik_room FROM Room_use_constraint WHERE ik_prepod_plan in (' + PrepodPlanIKList + '))) and (ik_campus = ' + IntToStr(CampusIK) + ')' + dopConditions + ' ORDER BY cName_room', 'ik_room', false, defValue)
    else
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Room WHERE (ik_room in (SELECT ik_room FROM Relation_kafedra_room WHERE (ik_kaf = ' + tempDS.FieldByName('ik_kaf').AsString + ') and (ik_shedule = ' + IntToStr(SheduleIK) + '))) and (ik_campus = ' + IntToStr(CampusIK) + ')' + dopConditions + ' ORDER BY cName_room', 'ik_room', false, defValue);
  end
  else
    Result:= GetAllRooms(SourceDataSet, CampusIK, false, dopConditions, defValue);
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetRoomsForPrepodPlanIKList(
  SourceDataSet: PDataSet; PrepodPlanIKList: TStringList): integer;
var
  i: integer;
  tempStr: string;
begin
  Result:= -1;
  tempStr:= '';
  for I := 0 to PrepodPlanIKList.Count - 1 do
    tempStr:= tempStr + PrepodPlanIKList[i] + ',';
  Delete(tempStr, Length(tempStr), 1);
  if SourceDataSet^.Active then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandText:= 'SELECT DISTINCT ruc.ik_room, ik_kaf, cName_room, Room.ik_campus, cName_campus FROM Room_use_constraint ruc LEFT JOIN Room ON ruc.ik_room = Room.ik_room LEFT JOIN Campus ON Room.ik_campus = Campus.ik_campus WHERE ik_prepod_plan in (' + tempStr + ')';
  SourceDataSet^.Open;
  while not SourceDataSet^.Eof do
  begin
    if SourceDataSet^.FieldByName('ik_kaf').Value <> NULL then
    begin
      Result:= SourceDataSet^.FieldByName('ik_kaf').AsInteger;
      exit;
    end;
    SourceDataSet^.Next;
  end;
  SourceDataSet^.First;
end;

procedure TSheduleMainController.GetScheduleBookmarkInfo(ABookmarkIK: integer;
  var ABookmarkType: TScheduleBookmarkType; var ABookmarkSheduleYearIK, ABookmarkSheduleSemIK,
  ABookmarkObjectIK: integer);
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT SheduleBookmarks.*, ik_year, ik_sem_type FROM SheduleBookmarks INNER JOIN Shedule ON SheduleBookmarks.ik_shedule = Shedule.ik_shedule WHERE ik_bookmark = ' + IntToStr(ABookmarkIK);
    tempDS.Open;
    ABookmarkType:= tempDS.FieldByName('i_bookmark_type').Value;
    ABookmarkSheduleYearIK:= tempDS.FieldByName('ik_year').AsInteger;
    ABookmarkSheduleSemIK:= tempDS.FieldByName('ik_sem_type').AsInteger;
    ABookmarkObjectIK:= tempDS.FieldByName('ik_object').AsInteger;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TSheduleMainController.GetScheduleBookmarkName(
  ABookmarkIK: integer): string;
var
  tempDS, secTempDS: TADODataSet;
  bookmarkType: TScheduleBookmarkType;
begin
  Result:= '<не определено>';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  secTempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT * FROM SheduleBookmarks WHERE ik_bookmark = ' + IntToStr(ABookmarkIK);
    tempDS.Open;
    secTempDS.CommandText:= 'SELECT year_value, Cname_sem_type FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + tempDS.FieldByName('ik_shedule').AsString;
    secTempDS.Open;
    Result:= secTempDS.FieldByName('year_value').AsString + '-' + IntToStr(secTempDS.FieldByName('year_value').AsInteger + 1) + '\' + secTempDS.FieldByName('Cname_sem_type').AsString + ' семестр\';
    secTempDS.Close;
    bookmarkType:= tempDS.FieldByName('i_bookmark_type').Value;
    case bookmarkType of
    sbKafedraAud:
      begin
        secTempDS.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + tempDS.FieldByName('ik_object').AsString;
        secTempDS.Open;
        Result:= Result + 'Аудиторное расписание кафедры ' + secTempDS.FieldByName('cshort_name_kaf').AsString;
        secTempDS.Close;
      end;
    sbKafedraExam:
      begin
        secTempDS.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + tempDS.FieldByName('ik_object').AsString;
        secTempDS.Open;
        Result:= Result + 'Расписание экзаменов кафедры ' + secTempDS.FieldByName('cshort_name_kaf').AsString;
        secTempDS.Close;
      end;
    sbFacAud:
      begin
        secTempDS.CommandText:= 'SELECT Cshort_name_fac FROM Fac WHERE ik_fac = ' + tempDS.FieldByName('ik_object').AsString;
        secTempDS.Open;
        Result:= Result + 'Аудиторное расписание факультета ' + secTempDS.FieldByName('Cshort_name_fac').AsString;
        secTempDS.Close;
      end;
    sbFacExam:
      begin
        secTempDS.CommandText:= 'SELECT Cshort_name_fac FROM Fac WHERE ik_fac = ' + tempDS.FieldByName('ik_object').AsString;
        secTempDS.Open;
        Result:= Result + 'Расписание экзаменов факультета ' + secTempDS.FieldByName('Cshort_name_fac').AsString;
        secTempDS.Close;
      end;
    end;
    tempDS.Close;
  finally
    secTempDS.Free;
    tempDS.Free;
  end;
end;

function TSheduleMainController.GetSheduleIK(YearIK,
  SemIK: integer): integer;
var
  tempDS: TADODataSet;
  tempSP: TADOStoredProc;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT ik_shedule FROM Shedule WHERE (ik_year = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + ')';
  tempDS.Open;
  if tempDS.RecordCount = 0 then
  begin
    tempSP:= TGeneralController.Instance.GetNewADOStoredProc('UpdateShedule', false);
    tempSP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
    tempSP.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, 0);
    tempSP.Parameters.CreateParameter('@ik_type_sem', ftWord, pdInput, 0, SemIK);
    tempSP.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
    try
      tempSP.Open;
      Result:= tempSP.FieldByName('ReturnValue').AsInteger;
    finally
      if tempSP.Active then tempSP.Close;
      tempSP.Free;
    end;
  end
  else Result:= tempDS.FieldByName('ik_shedule').AsInteger;
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetSheduleName(SheduleIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select Cname_sem_type, year_value FROM Shedule INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl WHERE ik_shedule = ' + IntToStr(SheduleIK);
  tempDS.Open;
  Result:= AnsiLowerCase(tempDS.FieldByName('Cname_sem_type').AsString + ' cеместр ' + tempDS.FieldByName('year_value').AsString + '-' + IntToStr(tempDS.FieldByName('year_value').AsInteger + 1) + ' уч. года');
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetStudyPeriodName(SheduleIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT year_value, Cname_sem_type FROM Shedule INNER JOIN Year_uch_pl ON Shedule.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Shedule.ik_sem_type = SemesterType.ik_sem_type Where ik_shedule = ' + IntToStr(SheduleIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('year_value').AsString + ' - ' + IntToStr(tempDS.FieldByName('year_value').AsInteger + 1) + ' учебный год, ' + AnsiLowerCase(tempDS.FieldByName('Cname_sem_type').AsString) + ' семестр';
  tempDS.Close;
  tempDS.Free;
end;

function TSheduleMainController.GetSubsetOfCalcUnit(CalcUnitIK: integer): string;
var
  tempCUSL: TStringList;
  secTempDataSet: TADODataSet;
  i: integer;
begin
  Result:= '0';
  tempCUSL:= TStringList.Create;
  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    secTempDataSet.CommandText:= 'SELECT ik_calc_unit FROM GetSubsetOfCalcUnit(' + IntToStr(CalcUnitIK) + ')';
    secTempDataSet.Open;
    while not secTempDataSet.Eof do
    begin
      if tempCUSL.IndexOf(secTempDataSet.FieldByName('ik_calc_unit').AsString) < 0 then
        tempCUSL.Add(secTempDataSet.FieldByName('ik_calc_unit').AsString);
      secTempDataSet.Next;
    end;
    secTempDataSet.Close;
    //подгрузили дополнительный список расчетных единиц

    // формируем окончательный список расчетных единиц
    if tempCUSL.Count > 0 then
    begin
      Result:= '';
      for i := 0 to tempCUSL.Count - 1 do
        Result:= Result + tempCUSL[i] + ', ';
      Delete(Result, Length(Result)-1, 2);
    end;
  finally
    tempCUSL.Free;
    if secTempDataSet.Active then secTempDataSet.Free;
  end;
end;

function TSheduleMainController.GetTeacherListForAddEvent(SourceDataSet: PDataSet;
  IK, SheduleIK, KafIK, FormEdIK: integer; var PlanNagrIKList: string; IsDepProcess, IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
var
  tempDS: TADODataSet;
  vzCondition: string;
begin
  Result:= NULL;
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  if IsDepProcess then
    tempDS.CommandText:= 'SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_form_ed = ' + IntToStr(FormEdIK) + ') and (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
      ')) and (ik_kaf = ' + IntToStr(KafIK) + ') and (ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr '+
      'WHERE ik_id_prepod in (SELECT ik_id_prepod FROM Relation_kafedra_prep WHERE ik_kaf = ' + IntToStr(KafIK) + '))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))))'
  else
    tempDS.CommandText:= 'SELECT Plan_nagr.ik_plan_nagr FROM Plan_nagr INNER JOIN Shedule ON Plan_nagr.ik_sem_type = Shedule.ik_sem_type '+
        'INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr INNER JOIN Potok_semestr_shema pss ON cpn.ik_shema = pss.ik_shema '+
        'INNER JOIN Potok_semestr ps ON pss.ik_potok_semestr = ps.ik_potok_semestr '+
        'WHERE (ik_form_ed = ' + IntToStr(FormEdIK) + ') and (ik_shedule = ' + IntToStr(SheduleIK) + ') and (ik_kaf = ' + IntToStr(KafIK) +') and (ps.ik_potok_semestr in (SELECT ik_potok_semestr '+
        'FROM GetPotokForGroup(' + IntToStr(IK) + '))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))';
        
 //   tempDS.CommandText:= 'SELECT DISTINCT Plan_nagr.ik_plan_nagr FROM Plan_nagr INNER JOIN Content_plan_nagr ON Plan_nagr.ik_plan_nagr = Content_plan_nagr.ik_plan_nagr WHERE (ik_form_ed = ' + IntToStr(FormEdIK) + ') and (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + ')) and (ik_kaf = ' + IntToStr(KafIK) +
 //     ') and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))';

  tempDS.Open;
  PlanNagrIKList:= '';
  while not tempDS.Eof do
  begin
    PlanNagrIKList:= PlanNagrIKList + tempDS.FieldByName('ik_plan_nagr').AsString + ',';
    tempDS.Next;
  end;
  tempDS.Close;
  if PlanNagrIKList = '' then
  begin
    tempDS.Free;
    exit;
  end;  
  Delete(PlanNagrIKList, Length(PlanNagrIKList), 1);
  if PlanNagrIKList = '' then
  begin
    Result:= NULL;
    exit;
  end;
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Prepods.iTab_n, (clastname + '' '' + cfirstname + '' '' + cotch + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO FROM Prepods ' +
      'WHERE (iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep WHERE ik_id_prepod in (SELECT ik_id_prepod FROM Prepod_plan_nagr WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + '))))))', 'iTab_n', IsShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT Prepods.iTab_n, (clastname + '' '' + cfirstname + '' '' + cotch + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO FROM Prepods INNER JOIN Relation_kafedra_prep rkp ON Prepods.iTab_n = rkp.iTab_n ' +
      'INNER JOIN Prepod_plan_nagr ON rkp.ik_id_prepod = Prepod_plan_nagr.ik_id_prepod INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr  WHERE ik_potok_semestr in (SELECT ik_potok_semestr FROM GetPotokForGroup(' + IntToStr(IK) + '))))', 'iTab_n', IsShowFirst, defValue)

  //    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Prepods.iTab_n, (clastname + '' '' + cfirstname + '' '' + cotch + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO FROM Prepods ' +
//      'WHERE (iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep WHERE ik_id_prepod in (SELECT ik_id_prepod FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ') and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE iK_type_vz = 3)) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + '))))))))))', 'iTab_n', IsShowFirst, defValue)
end;

function TSheduleMainController.GetTeacherListForAddEventFromPrefetch(
  KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK, CalcUnitIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].Items[VidZanyatIK].Items[VidNagruzkiIK].Items[CalcUnitIK].GetTeachersFIOList(KeyItemsList, ValueItemsList, defValue);
end;

function TSheduleMainController.GetTeacherWorkTypeListForAddEvent(
  SourceDataSet: PDataSet; IK, TabN: integer; PlanNagrIKList: string; IsDepProcess, IsAudEvent,
  IsShowFirst: boolean; defValue: Variant): Variant;
var
  vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
  if IsDepProcess then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_id_prepod, rkp.ik_work_type, cName_work_type, rkp.ik_defence_fund, cName_defence_fund, (cName_work_type + LOWER(ISNULL('', '' + cName_defence_fund, ''''))) as full_work_type_name FROM Relation_kafedra_prep rkp ' +
      'INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type LEFT JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund ' +
      'WHERE (iTab_n = ' + IntToStr(TabN) + ') and (ik_id_prepod in (SELECT ik_id_prepod FROM Prepod_plan_nagr WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')))))', 'ik_id_prepod', IsShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT ik_id_prepod, rkp.ik_work_type, cName_work_type, rkp.ik_defence_fund, cName_defence_fund, (cName_work_type + LOWER(ISNULL('', '' + cName_defence_fund, ''''))) as full_work_type_name FROM Relation_kafedra_prep rkp ' +
      'INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type LEFT JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund INNER JOIN Prepod_plan_nagr ' +
      'ON rkp.ik_id_prepod = Prepod_plan_nagr.ik_id_prepod INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr WHERE (iTab_n = ' + IntToStr(TabN) + ') and (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_shema in (SELECT ik_shema FROM Potok_semestr_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE ik_potok_semestr in (SELECT ik_potok_semestr FROM GetPotokForGroup(' + IntToStr(IK) + '))))', 'ik_id_prepod', IsShowFirst, defValue)

//    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT rkp.ik_id_prepod, rkp.ik_work_type, cName_work_type FROM Relation_kafedra_prep rkp INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type ' +
//      'WHERE (iTab_n = ' + IntToStr(TabN) + ') and (ik_id_prepod in (SELECT ik_id_prepod FROM Prepod_plan_nagr WHERE (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Content_plan_nagr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ' + vzCondition + ')) and (ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + '))))))))', 'ik_id_prepod', IsShowFirst, defValue)
end;

function TSheduleMainController.GetTeacherWorkTypeListForAddEventFromPrefetch(
  KafedraIK, FormEdIK, DiscIK, VidZanyatIK, VidNagruzkiIK, CalcUnitIK, TabN: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].Items[VidZanyatIK].Items[VidNagruzkiIK].Items[CalcUnitIK].GetTeacherWorkTypesList(TabN, KeyItemsList, ValueItemsList, defValue);
end;

function TSheduleMainController.GetVidNagruzkiListForAddEvent(
  SourceDataSet: PDataSet; IK, TeacherIK, DiscIK, PotokIK, VidZanyatIK: integer;
  PlanNagrIKList: string; IsShowFirst: boolean; defValue: Variant): Variant;
begin
//  if IsDepProcess then
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT cpn.ik_vid_nagruzki, Cname_vid_nagruzki, ik_decompose_type FROM Content_plan_nagr cpn INNER JOIN Vid_nagruzki ON cpn.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki ' +
        'INNER JOIN Potok_semestr_shema ON cpn.ik_shema = Potok_semestr_shema.ik_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr ' +
        'WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_disc = ' + IntToStr(DiscIK) + ') and (id_potok = ' + IntToStr(PotokIK) + ') and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') ORDER BY Cname_vid_nagruzki', 'ik_vid_nagruzki', IsShowFirst, defValue)
 { else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT cpn.ik_vid_nagruzki, Cname_vid_nagruzki, ik_decompose_type FROM Content_plan_nagr cpn INNER JOIN Vid_nagruzki ON cpn.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki ' +
        'INNER JOIN Potok_shema ON cpn.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr ' +
        'WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_potok = ' + IntToStr(PotokIK) + ') and (ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') ORDER BY Cname_vid_nagruzki', 'ik_vid_nagruzki', IsShowFirst, defValue);
 }
end;

function TSheduleMainController.GetVidNagruzkiListForAddEventFromPrefetch(
  KafedraIK, FormEdIK, DiscIK, VidZanyatIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].Items[VidZanyatIK].GetVidNagruzkiList(KeyItemsList, ValueItemsList, defValue);
end;

function TSheduleMainController.GetVidZanyatListForAddEvent(SourceDataSet: PDataSet;
  IK, TeacherIK, DiscIK, PotokIK: integer; PlanNagrIKList: string; IsAudEvent, IsShowFirst: boolean; defValue: Variant): Variant;
var
 vzCondition: string;
begin
  if IsAudEvent then
    vzCondition:= 'iK_type_vz = 3'
  else vzCondition:= '(iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)';
//  if IsDepProcess then
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT cpn.iK_vid_zanyat, cName_vid_zanyat FROM Content_plan_nagr cpn INNER JOIN vid_zaniat ON cpn.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat ' +
        'INNER JOIN Potok_semestr_shema ON cpn.ik_shema = Potok_semestr_shema.ik_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr ' +
        'WHERE ik_id_prepod = ' + IntToStr(TeacherIK) + ')) and (ik_disc = ' + IntToStr(DiscIK) + ') and (id_potok = ' + IntToStr(PotokIK) + ') and (' + vzCondition + ') ORDER BY cName_vid_zanyat', 'ik_vid_zanyat', IsShowFirst, defValue)
 { else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT cpn.iK_vid_zanyat, cName_vid_zanyat, ik_decompose_type FROM Content_plan_nagr cpn INNER JOIN vid_zaniat ON cpn.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat ' +
      'INNER JOIN Potok_shema ON cpn.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE (ik_plan_nagr in (' + PlanNagrIKList + ')) and (ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr WHERE ik_id_prepod = ' + IntToStr(TeacherIK) +
      ')) and (cpn.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok in (SELECT ik_potok FROM GetPotokForGroup(' + IntToStr(IK) + ')))) and (ik_disc = ' + IntToStr(DiscIK) + ') and (ik_potok = ' + IntToStr(PotokIK) + ') and (' + vzCondition + ') ORDER BY cName_vid_zanyat', 'ik_vid_zanyat', IsShowFirst, defValue);}
end;

function TSheduleMainController.GetVidZanyatListForAddEventFromPrefetch(
  KafedraIK, FormEdIK, DiscIK: integer; KeyItemsList, ValueItemsList: TStrings;
  defValue: integer): Integer;
begin
  Result:= fPlanNagrForAddSheduleItem.Items[KafedraIK].Items[FormEdIK].Items[DiscIK].GetVidZanyatList(KeyItemsList, ValueItemsList, defValue);
end;

procedure TSheduleMainController.LoadPlanNagrForGroupToPrefetch(AGroupIK, ASheduleIK: integer; isAudEvent: boolean);
begin
  fPlanNagrForAddSheduleItem.LoadPlanNagrForGroup(AGroupIK, ASheduleIK, isAudEvent);
end;

procedure TSheduleMainController.LoadPlanNagrForTeacherToPrefetch(AKafedraIK, ASheduleIK: integer; isAudEvent: boolean);
begin
  fPlanNagrForAddSheduleItem.LoadPlanNagrForTeacher(AKafedraIK, ASheduleIK, isAudEvent);
end;

function TSheduleMainController.MakeScheduleBookmark(ATypeIK: TScheduleBookmarkType;
  ASheduleIK, AObjectIK: integer): integer;
var
  tempSP: TADOStoredProc;
begin
  Result:= -1;
  tempSP:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSheduleBookmarks', false);
  tempSP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempSP.Parameters.CreateParameter('@ik_bookmark', ftInteger, pdInput, 0, -1);
  tempSP.Parameters.CreateParameter('@i_bookmark_type', ftWord, pdInput, 0, ATypeIK);
  tempSP.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, ASheduleIK);
  tempSP.Parameters.CreateParameter('@ik_object', ftInteger, pdInput, 0, AObjectIK);
  try
    tempSP.Open;
    Result:= tempSP.FieldByName('ReturnValue').AsInteger;
  finally
    if tempSP.Active then tempSP.Close;
    tempSP.Free;
  end;
end;

function TSheduleMainController.SaveEvent(var newEvent: TSheduleEvent;
  sourceEvent: TSheduleEvent; isException: boolean; sheduleGrid: TCustomLessonSheduleGrid; PrepodPlanNagrIKList: string): boolean;
var
  tempStoredProc: TADOStoredProc;
  tempDS: TADODataSet;
  tempStr: string;
  i: integer;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateShedulePattern', false);
  tempStoredProc.Connection.BeginTrans;
try
  if not newEvent.IsException then
  begin
    if (sourceEvent = nil) then
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
      tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, 0);
    end
    else
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
      tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, sourceEvent.RepeatPattern.RepeatPattenIK);
    end;
    tempStoredProc.Parameters.CreateParameter('@ik_repeat_type', ftInteger, pdInput, 0, newEvent.RepeatPattern.RepeatType);
    tempStoredProc.Parameters.CreateParameter('@iRepeat_frequency', ftInteger, pdInput, 0, newEvent.RepeatPattern.RepeatFrequency);
    tempStoredProc.Parameters.CreateParameter('@cRepeat_mask', ftString, pdInput, 10, newEvent.RepeatPattern.RepeatMask);
    tempStoredProc.Parameters.CreateParameter('@ik_repeat_limit', ftWord, pdInput, 0, newEvent.RepeatPattern.RepeatLimitType);
    tempStoredProc.Parameters.CreateParameter('@iRepeat_count', ftInteger, pdInput, 0, newEvent.RepeatPattern.RepeatCount);
    tempStoredProc.Parameters.CreateParameter('@dFinal_date', ftDateTime, pdInput, 0, newEvent.RepeatPattern.EndDateOfRepeat);
    tempStoredProc.Open;
    newEvent.RepeatPattern.RepeatPattenIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Parameters.Clear;
  end;

  tempStoredProc.ProcedureName:= 'UpdateSheduleEvent';
  if (sourceEvent = nil) then
  begin
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
    tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, 0);
    tempStoredProc.Parameters.CreateParameter('@i_version', ftInteger, pdInput, 0, 0);
    tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, newEvent.RepeatPattern.RepeatPattenIK);
  end
  else
  begin
    if (IsException) then
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
      tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@i_version', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, 0);
    end
    else
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
      tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, sourceEvent.EventIK);
      tempStoredProc.Parameters.CreateParameter('@i_version', ftInteger, pdInput, 0, sourceEvent.Version);
      if sourceEvent.IsException then
        tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, 0)
      else
        tempStoredProc.Parameters.CreateParameter('@ik_repeat_pattern', ftInteger, pdInput, 0, sourceEvent.RepeatPattern.RepeatPattenIK);
    end;
  end;

  tempStoredProc.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, SheduleGrid.SheduleIK);
  tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, newEvent.TeacherIK);
  tempStoredProc.Parameters.CreateParameter('@ik_event_type', ftInteger, pdInput, 0, newEvent.EventType);
  tempStoredProc.Parameters.CreateParameter('@ik_room', ftInteger, pdInput, 0, newEvent.RoomIK);
  tempStoredProc.Parameters.CreateParameter('@bit_exception', ftBoolean, pdInput, 0, newEvent.IsException);
  tempStoredProc.Parameters.CreateParameter('@dBegin_date', ftDateTime, pdInput, 0, newEvent.BeginDate);
  tempStoredProc.Open;
  newEvent.EventIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
  tempStoredProc.Close;

  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText:= 'SELECT * FROM Relation_event_plan_nagr WHERE ik_event = ' + IntToStr(newEvent.EventIK);
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  tempStr:= '';
  PrepodPlanNagrIKList:= PrepodPlanNagrIKList + ',';
  for I := 1 to Length(PrepodPlanNagrIKList) do
    if PrepodPlanNagrIKList[i] = ',' then
    begin
      tempDS.Insert;
      tempDS.FieldByName('ik_event').AsInteger:= newEvent.EventIK;
      tempDS.FieldByName('ik_prepod_plan').AsString:= tempStr;
      tempDS.Post;
      tempStr:= '';
    end
    else if PrepodPlanNagrIKList[i] <> ' ' then tempStr:= tempStr + PrepodPlanNagrIKList[i];
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Free;

  newEvent.Version:= newEvent.Version + 1;

  if (sourceEvent = nil) then
    SheduleGrid.AddEvent(TSheduleEvent.Create(newEvent))
  else
  begin
    if IsException then
    begin
      tempStoredProc.Parameters.Clear;
      tempStoredProc.ProcedureName:= 'UpdateSheduleException';
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
      tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, sourceEvent.EventIK);
      tempStoredProc.Parameters.CreateParameter('@ik_exception', ftInteger, pdInput, 0, newEvent.EventIK);
      tempStoredProc.Parameters.CreateParameter('@dExceptionDate', ftDate, pdInput, 0, newEvent.ExceptionDate);
      tempStoredProc.ExecProc;
      sourceEvent.AddException(TSheduleEvent.Create(newEvent));
    end
    else sourceEvent.Assign(newEvent);
  end;
  tempStoredProc.Connection.CommitTrans;
  tempStoredProc.Free;
  Result:= true;
except
  on E: Exception do
  begin
    if Assigned(tempStoredProc) then
    begin
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
    end;
    raise EApplicationException.Create(E.Message);
  end;
end;
end;

function TSheduleMainController.SaveExam(var newExam: TSheduleExamination; sourceExam: TSheduleExamination;
  sheduleGrid: TCustomExamSheduleGrid; PrepodPlanNagrIKList: string): boolean;
var
  tempStoredProc: TADOStoredProc;
  tempDS: TADODataSet;
  tempStr: string;
  i: integer;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSheduleExam', false);
  tempStoredProc.Connection.BeginTrans;
  try              
    if sourceExam <> nil then
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
      tempStoredProc.Parameters.CreateParameter('@ik_exam', ftInteger, pdInput, 0, newExam.ExamIK);
      tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, sourceExam.Version);
    end
    else
    begin
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
      tempStoredProc.Parameters.CreateParameter('@ik_exam', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@ik_event', ftInteger, pdInput, 0, 0);
    end;
    tempStoredProc.Parameters.CreateParameter('@dt_time_start', ftDateTime, pdInput, 0, newExam.Start);
    tempStoredProc.Parameters.CreateParameter('@dt_time_stop', ftDateTime, pdInput, 0, newExam.Stop);
    tempStoredProc.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, sheduleGrid.SheduleIK);
    tempStoredProc.Parameters.CreateParameter('@ik_id_prepod', ftInteger, pdInput, 0, newExam.TeacherIK);
    tempStoredProc.Parameters.CreateParameter('@ik_room', ftInteger, pdInput, 0, newExam.RoomIK);

    tempStoredProc.Open;
    newExam.ExamIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close; 

    tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
    tempDS.CommandText:= 'SELECT * FROM Relation_exam_plan_nagr WHERE ik_examination = ' + IntToStr(newExam.ExamIK);
    tempDS.Open;
    while not tempDS.Eof do
      tempDS.Delete;
    tempStr:= '';
    PrepodPlanNagrIKList:= PrepodPlanNagrIKList + ',';
    for I := 1 to Length(PrepodPlanNagrIKList) do
      if PrepodPlanNagrIKList[i] = ',' then
      begin
        tempDS.Insert;
        tempDS.FieldByName('ik_examination').AsInteger:= newExam.ExamIK;
        tempDS.FieldByName('ik_prepod_plan').AsString:= tempStr;
        tempDS.Post;
        tempStr:= '';
      end
      else if PrepodPlanNagrIKList[i] <> ' ' then tempStr:= tempStr + PrepodPlanNagrIKList[i];
    tempDS.UpdateBatch();
    tempDS.Close;
    FreeAndNil(tempDS);
    newExam.Version:= newExam.Version + 1;
    if sourceExam = nil then
      sheduleGrid.AddExam(TSheduleExamination.Create(newExam))
    else sourceExam.Assign(newExam);
    tempStoredProc.Connection.CommitTrans;
    FreeAndNil(tempStoredProc);
  except
    on E: Exception do
    begin
      if Assigned(tempStoredProc) then
      begin
        tempStoredProc.Connection.RollbackTrans;
        if tempStoredProc.Active then tempStoredProc.Close;
        tempStoredProc.Free;
      end;
      if Assigned(tempDS) then
      begin
        if tempDS.Active then tempDS.Close;
        tempDS.Free;
      end;
      raise EApplicationException.Create(E.Message);
    end;
  end;
  Result:= true;
end;

procedure TSheduleMainController.SearchEventsForGroup(SourceEventsDS: TADODataSet; ASheduleIK, AGroupIK: integer; SearchDate: TDate;
  StartTime, StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchEventsForGroup(SourceEventsDS, ASheduleIK, AGroupIK, StartTime, StopTime);
end;

procedure TSheduleMainController.SearchEventsForPrep(SourceEventsDS: TADODataSet; ASheduleIK, ATabN: integer; SearchDate: TDate; StartTime,
  StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchEventsForPrep(SourceEventsDS, ASheduleIK, ATabN, StartTime, StopTime);
end;

procedure TSheduleMainController.SearchEventsForRoom(SourceEventsDS: TADODataSet; ASheduleIK, ARoomIK: integer; SearchDate: TDate;
  StartTime, StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchEventsForRoom(SourceEventsDS, ASheduleIK, ARoomIK, StartTime, StopTime);
end;

procedure TSheduleMainController.SearchExamsForGroup(SourceExamDS: TADODataSet;
  ASheduleIK, AGroupIK: integer; SearchDate: TDate; StartTime,
  StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchExamsForGroup(SourceExamDS, ASheduleIK, AGroupIK, StartTime, StopTime);
end;

procedure TSheduleMainController.SearchExamsForPrep(SourceExamDS: TADODataSet;
  ASheduleIK, ATabN: integer; SearchDate: TDate; StartTime,
  StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchExamsForPrep(SourceExamDS, ASheduleIK, ATabN, StartTime, StopTime);
end;

procedure TSheduleMainController.SearchExamsForRoom(SourceExamDS: TADODataSet;
  ASheduleIK, ARoomIK: integer; SearchDate: TDate; StartTime,
  StopTime: TDateTime);
begin
  UnionDateAndTime(SearchDate, StartTime, StopTime);
  TSheduleRegistry.Functions.SearchExamsForRoom(SourceExamDS, ASheduleIK, ARoomIK, StartTime, StopTime);
end;

procedure TSheduleMainController.UnionDateAndTime(ADate: TDate; var AStartTime,
  AStopTime: TDateTime);
var
  y,m,d,h,mn,s: word;
begin
  DecodeDate(ADate, y, m, d);
  DecodeTime(AStartTime, h, mn, s, s);
  AStartTime:= EncodeDateTime(y,m,d,h,mn,0,0);
  DecodeTime(AStopTime, h, mn, s, s);
  AStopTime:= EncodeDateTime(y,m,d,h,mn,0,0);
end;

{ TPlanNagr }

constructor TPlanNagr.Create;
begin
  inherited Create(true);
  fItemNamesHaveBeenLoaded:= false;
end;

function TPlanNagr.getDepartment(KafedraIK: Integer): TDepartmentInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TDepartmentInPlanNagr(inherited Items[i]).KafedraIK = KafedraIK then
    begin
      Result:= TDepartmentInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TDepartmentInPlanNagr(inherited Items[Add(TDepartmentInPlanNagr.Create(KafedraIK))]);
end;

function TPlanNagr.GetDepartmentList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TDepartmentInPlanNagr(inherited Items[i]).KafedraIK));
    ValueItemsList.Add(TDepartmentInPlanNagr(inherited Items[i]).KafedraName);
    if TDepartmentInPlanNagr(inherited Items[i]).KafedraIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TDepartmentInPlanNagr(inherited Items[i]).KafedraIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_kaf, cname_kaf FROM kafedra WHERE ik_kaf in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('ik_kaf', TDepartmentInPlanNagr(inherited Items[i]).KafedraIK, [loPartialKey]) then
        TDepartmentInPlanNagr(inherited Items[i]).KafedraName:= tempDS.FieldByName('cname_kaf').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagr.LoadPlanNagrForGroup(AGroupIK, ASheduleIK: integer; isAudEvent: boolean): boolean;
var
  tempDS: TADODataSet;
  vzConditions: string;
begin
  Self.Clear;
  fItemNamesHaveBeenLoaded:= false;
  if IsAudEvent then
    vzConditions:= '(cpn.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE iK_type_vz = 3))'
  else vzConditions:= '(cpn.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE (iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1)))';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_prepod_plan, Plan_nagr.ik_kaf, ik_form_ed, cpn.ik_disc, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, ik_calc_unit, ik_id_prepod FROM Plan_nagr INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr ' +
      'INNER JOIN Potok_semestr_shema ON cpn.ik_shema = Potok_semestr_shema.ik_shema INNER JOIN Potok_semestr ON Potok_semestr_shema.ik_potok_semestr = Potok_semestr.ik_potok_semestr '+
      'INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_content_plan_nagr = ppn.ik_content_plan_nagr INNER JOIN discpln ON cpn.ik_disc = discpln.ik_disc ' +
      'INNER JOIN vid_zaniat ON cpn.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN vid_nagruzki ON cpn.ik_vid_nagruzki = vid_nagruzki.ik_vid_nagruzki INNER JOIN kafedra ON Plan_nagr.ik_kaf = kafedra.ik_kaf ' +
      'WHERE (Plan_nagr.ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = '+ IntToStr(ASheduleIK) +
      ')) and (Plan_nagr.ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = '+ IntToStr(ASheduleIK) + ')) and ' +
      '(((Potok_semestr_shema.ik_decompose_type = 1) and (Potok_semestr.ik_potok_semestr in (SELECT ik_potok_semestr FROM GetPotokForGroup(' + IntToStr(AGroupIK) + ')))) or ((Potok_semestr_shema.ik_decompose_type != 1) and (ppn.ik_calc_unit in (SELECT ik_calc_unit FROM Calc_unit_grup WHERE ik_grup = ' + IntToStr(AGroupIK) + ')))) and ' +
      vzConditions + ' ORDER BY cName_kaf, cName_disc, cName_vid_zanyat, cName_vid_nagruzki';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      fPlanNagrForAddSheduleItem.Items[tempDS.FieldByName('ik_kaf').AsInteger].Items[tempDS.FieldByName('ik_form_ed').AsInteger].Items[tempDS.FieldByName('ik_disc').AsInteger].Items[tempDS.FieldByName('ik_vid_zanyat').AsInteger].Items[tempDS.FieldByName('ik_vid_nagruzki').AsInteger].Items[tempDS.FieldByName('ik_calc_unit').AsInteger].Items[tempDS.FieldByName('ik_id_prepod').AsInteger].AddPrepodPlanIK(tempDS.FieldByName('ik_prepod_plan').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPlanNagr.LoadPlanNagrForTeacher(AKafedraIK, ASheduleIK: integer; isAudEvent: boolean): boolean;
var
  tempDS: TADODataSet;
  vzConditions: string;
begin
  Self.Clear;
  fItemNamesHaveBeenLoaded:= false;
  if IsAudEvent then
    vzConditions:= '(cpn.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE iK_type_vz = 3))'
  else vzConditions:= '(cpn.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE ((iK_type_vz = 4) and (ikTypeZanyat = 1) and (bit_nagr = 1))or ((iK_type_vz = 6) and (ikTypeZanyat = 6)and (bit_nagr = 1)) ))';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_prepod_plan, Plan_nagr.ik_kaf, ik_form_ed, cpn.ik_disc, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, ik_calc_unit, ik_id_prepod FROM Plan_nagr INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr ' +
      'INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_content_plan_nagr = ppn.ik_content_plan_nagr INNER JOIN discpln ON cpn.ik_disc = discpln.ik_disc ' +
      'INNER JOIN vid_zaniat ON cpn.ik_vid_zanyat = vid_zaniat.ik_vid_zanyat INNER JOIN vid_nagruzki ON cpn.ik_vid_nagruzki = vid_nagruzki.ik_vid_nagruzki INNER JOIN kafedra ON Plan_nagr.ik_kaf = kafedra.ik_kaf ' +
      'WHERE (Plan_nagr.ik_kaf = ' + IntToStr(AKafedraIK) + ') and (Plan_nagr.ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = '+ IntToStr(ASheduleIK) +
      ')) and (Plan_nagr.ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = '+ IntToStr(ASheduleIK) + ')) and ' +
      vzConditions + ' ORDER BY cName_kaf, cName_disc, cName_vid_zanyat, cName_vid_nagruzki';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      fPlanNagrForAddSheduleItem.Items[tempDS.FieldByName('ik_kaf').AsInteger].Items[tempDS.FieldByName('ik_form_ed').AsInteger].Items[tempDS.FieldByName('ik_disc').AsInteger].Items[tempDS.FieldByName('ik_vid_zanyat').AsInteger].Items[tempDS.FieldByName('ik_vid_nagruzki').AsInteger].Items[tempDS.FieldByName('ik_calc_unit').AsInteger].Items[tempDS.FieldByName('ik_id_prepod').AsInteger].AddPrepodPlanIK(tempDS.FieldByName('ik_prepod_plan').AsString);
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TPlanNagr.setDepartment(KafedraIK: Integer;
  const Value: TDepartmentInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TDepartmentInPlanNagr(inherited Items[i]).KafedraIK = KafedraIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TDepartmentInPlanNagr }

constructor TDepartmentInPlanNagr.Create(AKafedraIK: integer);
begin
  inherited Create(true);
  fKafedraIK:= AKafedraIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TDepartmentInPlanNagr.getFormEd(FormEdIK: Integer): TFormEdInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TFormEdInPlanNagr(inherited Items[i]).FormEdIK = FormEdIK then
    begin
      Result:= TFormEdInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TFormEdInPlanNagr(inherited Items[Add(TFormEdInPlanNagr.Create(FormEdIK))]);
end;

function TDepartmentInPlanNagr.GetFormEdList(KeyItemsList,
  ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TFormEdInPlanNagr(inherited Items[i]).FormEdIK));
    ValueItemsList.Add(TFormEdInPlanNagr(inherited Items[i]).FormEdName);
    if TFormEdInPlanNagr(inherited Items[i]).FormEdIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TDepartmentInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TFormEdInPlanNagr(inherited Items[i]).FormEdIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT Ik_form_ed, Cname_form_ed FROM Form_ed WHERE Ik_form_ed in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('Ik_form_ed', TFormEdInPlanNagr(inherited Items[i]).FormEdIK, [loPartialKey]) then
        TFormEdInPlanNagr(inherited Items[i]).FormEdName:= tempDS.FieldByName('Cname_form_ed').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TDepartmentInPlanNagr.setFormEd(FormEdIK: Integer;
  const Value: TFormEdInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TFormEdInPlanNagr(inherited Items[i]).FormEdIK = FormEdIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TFormEdInPlanNagr }

constructor TFormEdInPlanNagr.Create(AFormEdIK: integer);
begin
  inherited Create(true);
  fFormEdIK:= AFormEdIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TFormEdInPlanNagr.getDisc(DiscIK: Integer): TDiscInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TDiscInPlanNagr(inherited Items[i]).DiscIK = DiscIK then
    begin
      Result:= TDiscInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TDiscInPlanNagr(inherited Items[Add(TDiscInPlanNagr.Create(DiscIK))]);
end;

function TFormEdInPlanNagr.GetDiscList(KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TDiscInPlanNagr(inherited Items[i]).DiscIK));
    ValueItemsList.Add(TDiscInPlanNagr(inherited Items[i]).DiscName);
    if TDiscInPlanNagr(inherited Items[i]).DiscIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TFormEdInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TDiscInPlanNagr(inherited Items[i]).DiscIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT iK_disc, cName_disc FROM discpln WHERE iK_disc in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('iK_disc', TDiscInPlanNagr(inherited Items[i]).DiscIK, [loPartialKey]) then
        TDiscInPlanNagr(inherited Items[i]).DiscName:= tempDS.FieldByName('cName_disc').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TFormEdInPlanNagr.setDisc(DiscIK: Integer;
  const Value: TDiscInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TDiscInPlanNagr(inherited Items[i]).DiscIK = DiscIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TDiscInPlanNagr }

constructor TDiscInPlanNagr.Create(ADiscIK: integer);
begin
  inherited Create(true);
  fDiscIK:= ADiscIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TDiscInPlanNagr.getVidZanyat(
  VidZanyatIK: Integer): TVidZanyatInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK = VidZanyatIK then
    begin
      Result:= TVidZanyatInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TVidZanyatInPlanNagr(inherited Items[Add(TVidZanyatInPlanNagr.Create(VidZanyatIK))]);
end;

function TDiscInPlanNagr.GetVidZanyatList(KeyItemsList,
  ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK));
    ValueItemsList.Add(TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatName);
    if TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TDiscInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT iK_vid_zanyat, cName_vid_zanyat FROM vid_zaniat WHERE iK_vid_zanyat in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('iK_vid_zanyat', TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK, [loPartialKey]) then
        TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatName:= tempDS.FieldByName('cName_vid_zanyat').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TDiscInPlanNagr.setVidZanyat(VidZanyatIK: Integer;
  const Value: TVidZanyatInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TVidZanyatInPlanNagr(inherited Items[i]).VidZanyatIK = VidZanyatIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TVidZanyatInPlanNagr }

constructor TVidZanyatInPlanNagr.Create(AVidZanyatIK: integer);
begin
  inherited Create(true);
  fVidZanyatIK:= AVidZanyatIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TVidZanyatInPlanNagr.getVidNagruzki(
  VidNagruzkiIK: Integer): TVidNagruzkiInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK = VidNagruzkiIK then
    begin
      Result:= TVidNagruzkiInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TVidNagruzkiInPlanNagr(inherited Items[Add(TVidNagruzkiInPlanNagr.Create(VidNagruzkiIK))]);
end;

function TVidZanyatInPlanNagr.GetVidNagruzkiList(KeyItemsList,
  ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK));
    ValueItemsList.Add(TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiName);
    if TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TVidZanyatInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_vid_nagruzki, Cname_vid_nagruzki FROM Vid_nagruzki WHERE ik_vid_nagruzki in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('ik_vid_nagruzki', TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK, [loPartialKey]) then
        TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiName:= tempDS.FieldByName('Cname_vid_nagruzki').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TVidZanyatInPlanNagr.setVidNagruzki(VidNagruzkiIK: Integer;
  const Value: TVidNagruzkiInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TVidNagruzkiInPlanNagr(inherited Items[i]).VidNagruzkiIK = VidNagruzkiIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TVidNagruzkiInPlanNagr }

constructor TVidNagruzkiInPlanNagr.Create(AVidNagruzkiIK: integer);
begin
  inherited Create(true);
  fVidNagruzkiIK:= AVidNagruzkiIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TVidNagruzkiInPlanNagr.getCalcUnit(
  CalcUnitIK: Integer): TCalcUnitInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK = CalcUnitIK then
    begin
      Result:= TCalcUnitInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TCalcUnitInPlanNagr(inherited Items[Add(TCalcUnitInPlanNagr.Create(CalcUnitIK))]);
end;

function TVidNagruzkiInPlanNagr.GetCalcUnitsList(KeyItemsList,
  ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
  begin
    KeyItemsList.Add(IntToStr(TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK));
    ValueItemsList.Add(TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitName);
    if TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK = defValue then Result:= i;
  end;
  if (defValue = -1) and (Count = 1) then Result:= 0;
end;

procedure TVidNagruzkiInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
     tempDS.CommandText:= 'SELECT ik_calc_unit, cName_calc_unit FROM Calc_unit_semestr WHERE ik_calc_unit in ' + keysStr;
     tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('ik_calc_unit', TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK, [loPartialKey]) then
        TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitName:= tempDS.FieldByName('cName_calc_unit').AsString;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TVidNagruzkiInPlanNagr.setCalcUnit(CalcUnitIK: Integer;
  const Value: TCalcUnitInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TCalcUnitInPlanNagr(inherited Items[i]).CalcUnitIK = CalcUnitIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TCalcUnitInPlanNagr }

constructor TCalcUnitInPlanNagr.Create(ACalcUnitIK: integer);
begin
  inherited Create(true);
  fCalcUnitIK:= ACalcUnitIK;
  fItemNamesHaveBeenLoaded:= false;
end;

function TCalcUnitInPlanNagr.getTeacher(TeacherIK: Integer): TPrepodInPlanNagr;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TPrepodInPlanNagr(inherited Items[i]).TeacherIK = TeacherIK then
    begin
      Result:= TPrepodInPlanNagr(inherited Items[i]);
      exit;
    end;
  Result:= TPrepodInPlanNagr(inherited Items[Add(TPrepodInPlanNagr.Create(TeacherIK))]);
end;

function TCalcUnitInPlanNagr.GetTeachersFIOList(KeyItemsList,
  ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
    if KeyItemsList.IndexOf(IntToStr(TPrepodInPlanNagr(inherited Items[i]).TabN)) < 0 then
    begin
      KeyItemsList.Add(IntToStr(TPrepodInPlanNagr(inherited Items[i]).TabN));
      ValueItemsList.Add(TPrepodInPlanNagr(inherited Items[i]).FIO);
      if TPrepodInPlanNagr(inherited Items[i]).TabN = defValue then Result:= KeyItemsList.Count-1;
    end;
  if (defValue = -1) and (KeyItemsList.Count = 1) then Result:= 0;
end;

function TCalcUnitInPlanNagr.GetTeacherWorkTypesList(ATabN: integer;
  KeyItemsList, ValueItemsList: TStrings; defValue: integer): integer;
var
  i: integer;
begin
  Result:= -1;
  if not fItemNamesHaveBeenLoaded then LoadItemNames;
  KeyItemsList.Clear;
  ValueItemsList.Clear;
  for i:= 0 to Count - 1 do
    if TPrepodInPlanNagr(inherited Items[i]).TabN = ATabN then
    begin
      KeyItemsList.Add(IntToStr(TPrepodInPlanNagr(inherited Items[i]).TeacherIK));
      ValueItemsList.Add(TPrepodInPlanNagr(inherited Items[i]).WorkTypeName);
      if TPrepodInPlanNagr(inherited Items[i]).TeacherIK = defValue then Result:= KeyItemsList.Count-1;
    end;
  if (defValue = -1) and (KeyItemsList.Count = 1) then Result:= 0;
end;

procedure TCalcUnitInPlanNagr.LoadItemNames;
var
  tempDS: TADODataSet;
  i: integer;
  keysStr: string;
begin
  if Count = 0 then exit;
  keysStr:= '(';
  for i:= 0 to Count - 1 do
  begin
    keysStr:= keysStr + IntToStr(TPrepodInPlanNagr(inherited Items[i]).TeacherIK);
    if i <> Count - 1 then keysStr:= keysStr + ', ';
  end;
  keysStr:= keysStr + ')';
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_id_prepod, rkp.iTab_n, FIO, cName_work_type, cName_defence_fund FROM Relation_kafedra_prep rkp INNER JOIN (SELECT iTab_n, FIO, shortFIO FROM GetTeacherListForDepartment(3, 0, 0, 0)) preps ON rkp.iTab_n = preps.iTab_n ' +
      'INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type INNER JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund WHERE ik_id_prepod in ' + keysStr;
    tempDS.Open;
    for i:= 0 to Count - 1 do
      if tempDS.Locate('ik_id_prepod', TPrepodInPlanNagr(inherited Items[i]).TeacherIK, [loPartialKey]) then
      begin
        TPrepodInPlanNagr(inherited Items[i]).TabN:= tempDS.FieldByName('iTab_n').AsInteger;
        TPrepodInPlanNagr(inherited Items[i]).FIO:= tempDS.FieldByName('FIO').AsString;
        TPrepodInPlanNagr(inherited Items[i]).WorkTypeName:= tempDS.FieldByName('cName_work_type').AsString;
        if tempDS.FieldByName('cName_defence_fund').Value <> NULL then
          TPrepodInPlanNagr(inherited Items[i]).WorkTypeName:= TPrepodInPlanNagr(inherited Items[i]).WorkTypeName + ', ' + AnsiLowerCase(tempDS.FieldByName('cName_defence_fund').AsString);
      end;
    fItemNamesHaveBeenLoaded:= true;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TCalcUnitInPlanNagr.setTeacher(TeacherIK: Integer;
  const Value: TPrepodInPlanNagr);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if TPrepodInPlanNagr(inherited Items[i]).TeacherIK = TeacherIK then
    begin
      inherited Items[i]:= Value;
      break;
    end;
end;

{ TPrepodInPlanNagr }

procedure TPrepodInPlanNagr.AddPrepodPlanIK(APrepodPlanIK: string);
begin
  if fPrepodPlanIKList.IndexOf(APrepodPlanIK) < 0 then
    fPrepodPlanIKList.Add(APrepodPlanIK);
end;

constructor TPrepodInPlanNagr.Create(ATeacherIK: integer);
begin
  fPrepodPlanIKList:= TStringList.Create;
  fTeacherIK:= ATeacherIK;
end;

destructor TPrepodInPlanNagr.Destroy;
begin
  if Assigned(fPrepodPlanIKList) then FreeAndNil(fPrepodPlanIKList);
  inherited;
end;

function TPrepodInPlanNagr.GetPrepodPlanIKListAsString: string;
var
  i: integer;
begin
  Result:= '';
  for I := 0 to fPrepodPlanIKList.Count - 1 do
  begin
    Result:= Result + fPrepodPlanIKList[i];
    if (i <> fPrepodPlanIKList.Count - 1) then
      Result:= Result + ', ';
  end;
end;

end.
