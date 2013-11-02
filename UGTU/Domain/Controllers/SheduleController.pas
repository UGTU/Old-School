unit SheduleController;
{#Author villain@ist.ugtu.net}
interface

uses
  SysUtils, Classes, Controls, Dialogs, StdCtrls, ComCtrls, Contnrs, SheduleClasses, SheduleGrids,
    ExcelXP, ComObj, Messages, ADODB, DB, Variants, GeneralController;

type
  TScheduleBookmarkType = (sbKafedraAud = 1, sbKafedraExam = 2, sbFacAud = 3, sbFacExam = 4);

  ISheduleConstraintController = interface
  ['{148E82F9-4564-40CF-BCAD-7F6CB0790509}']
    procedure InitializeRoomConstraints(KafIK, YearIK, SemIK: integer; ATreeView: TTreeView);
    procedure InitializeTeacherConstraints(SheduleIK, TabN, KafIK: integer; ASemesterGrid: TTeacherSemesterConstraintsGrid);
    procedure InitializeTeacherSessionConstraints(SheduleIK, TabN, KafIK: integer; ASessionDataSet: TADODataSet);
    function SaveTeacherConstraints(SheduleIK, TabN, KafIK: integer; ATeacherConstraintGrid: TTeacherSemesterConstraintsGrid): boolean;
    function SaveRoomConstraint(isKafRooms: boolean; KafIK: integer; PrepodPlanIKList, AddedRooms: TStringList): boolean;
    function DeleteRoomConstraint(PrepodPlanIKList, ObjectIKList: TStringList; objectIsDep: boolean): boolean;
    procedure ReadPotoksToRoomConstraint(KafIK, YearIK, SemIK: integer; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadVZandVNsToRoomConstraint(KafIK, YearIK, SemIK: integer; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadCalcUnitsToRoomConstraint(parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadPrepodsToRoomConstraint(ContentPlanIKList: string; parentNode: TTreeNode; ATreeView: TTreeView);
    procedure ReadRoomsToRoomConstraint(parentNode: TTreeNode; ATreeView: TTreeView);
    function GetPrepodPlanIKListForDisc(AKafIK, AYearIK, ASemIK, ADiscIK: integer): TStringList;
    function GetPrepodPlanIKListForPotok(AKafIK, AYearIK, ASemIK, ADiscIK, APotokIK: integer): TStringList;
    function GetPrepodPlanIKListForVZandVN(AContentPlanNagrIKList: string): TStringList;
    function GetPrepodPlanIKListForCalcUnit(AContentPlanNagrIKList: string; ACalcUnitIK: integer): TStringList;
  end;

  ISheduleAccountController = interface
  ['{36FB772C-44A3-4606-9F04-CF0AD6D5966C}']
    procedure GetRoomFund(SourceDataSet: PDataSet; KafIK, SheduleIK: integer);
    function CopyRoomListFromPrevSemester(SheduleIK, KafIK: integer): boolean;
    function DeleteRoomsFromRoomFund(SheduleIK: integer; RoomsIK: TStringList): boolean;
    function SaveDepRoomList(KafIK, SheduleIK: integer; fAddedRoomsList: TStringList): boolean;
    function GetSemesterLength(SheduleIK: integer; isLoadExceptions: boolean; var exceptionsDataSet: PDataSet): TDefaultSemLengthInfo; overload;
    function GetCampusDistance(): TObjectList;
    function SaveCampusDistance(fCampusDistanceInfoList: TObjectList): boolean;
    function SaveSemsterLength(SheduleIK, YearIK, SemIK: integer; SemStart, SemStop, SessionStart, SessionStop: TDate; WTStart, WTEnd: TTime): boolean;
    function LoadSemLengthExceptionAvto(SheduleIK: integer; ASemStart, ASessionStart, ASessionStop: TDate): boolean;
  end;

  ISheduleMainController = interface
  ['{6663388A-77E2-4D0F-8253-B675F607B41D}']
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
   // function GetSubsetOfCalcUnit(inputCalcUnitList: string): string;
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
    procedure GetParts(SourseDS: PDataSet);
    function GetAllEventsInInterval(startDate, stopDate: TDate; TeacherPlanNagrIK, TeacherIK: integer): TObjectList;
    function GetAllExamsInInterval(startDate, stopDate: TDate; TeacherPlanNagrIK, TeacherIK: integer): TObjectList;
    procedure DeleteExam(ExamIK: integer);
    procedure DeleteEvent(EventIK: integer);
    procedure DeleteException(ExceptionIK: integer);
    procedure ExportGroupLessonShedule(SheduleIK, DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar; numeratorStart: TDate);
    procedure ExportTeacherLessonShedule(SheduleIK, KafIK: integer; ProgressBar: TProgressBar; numeratorStart: TDate);
    procedure ExportGroupExamShedule(SheduleIK, DepartmentID: integer; AIsDepShedule: boolean; ProgressBar: TProgressBar);
    procedure ExportTeacherExamShedule(SheduleIK, KafIK: integer; ProgressBar: TProgressBar);
    function SaveEvent(var newEvent: TSheduleEvent; sourceEvent: TSheduleEvent; isException: boolean; sheduleGrid: TCustomLessonSheduleGrid; PrepodPlanNagrIKList: string): boolean;
    function SaveExam(var newExam: TSheduleExamination; sourceExam: TSheduleExamination; sheduleGrid: TCustomExamSheduleGrid; PrepodPlanNagrIKList: string): boolean;
    procedure UnionDateAndTime(ADate: TDate; var AStartTime, AStopTime: TDateTime);
  end;

  TSheduleController = class(TInterfacedObject, ISheduleAccountController, ISheduleConstraintController, ISheduleMainController)
  private
    fSheduleCCInstance: ISheduleConstraintController;
    fSheduleACInstance: ISheduleAccountController;
    fSheduleMCInstance: ISheduleMainController;
    property AccountInstance: ISheduleAccountController read fSheduleACInstance implements ISheduleAccountController;
    property ConstraintInstance: ISheduleConstraintController read fSheduleCCInstance implements ISheduleConstraintController;
    property MainInstance: ISheduleMainController read fSheduleMCInstance implements ISheduleMainController;
    procedure Release;
    constructor CreateInstance;
    class function Instance: TSheduleController;
  public
    constructor Create;
    class procedure ReleaseInstance;

    class function ConstraintFunctions: ISheduleConstraintController;
    class function AccountFunctions: ISheduleAccountController;
    class function MainFunctions: ISheduleMainController;

    {
        GetEvents - загружает список событий из расписания SheduleIK для преподавателя TeacherIK, если он не равен -1
    }
 //   procedure CheckTeacherBusy(AEvent: TSheduleEvent; SheduleIK, TeacherIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);
 //   procedure CheckCalcUnitBusy(AEvent: TSheduleEvent; SheduleIK, CalcUnitIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);
 //   procedure CheckRoomBusy(AEvent: TSheduleEvent; SheduleIK, RoomIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);

  end;

implementation

uses SheduleAccountController, SheduleConstraintController, SheduleMainController;

var
  FSheduleControllerInstance: TSheduleController = nil;

{
procedure TSheduleController.CheckCalcUnitBusy(AEvent: TSheduleEvent;
  SheduleIK, CalcUnitIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);
var
  y,m,d,h, min, s, ms, hs, mins,ss, mss: word;
  tempDataSet: TADODataSet;
  eventList: TList;
  dateList: TList;
  tempEvent: TSheduleEvent;
  tempDate: TFactEvent;
  i, j: integer;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM SheduleEvent INNER JOIN SheduleEventType ON SheduleEvent.ik_event_type = SheduleEventType.ik_event_type INNER JOIN Prepod_plan_nagr ON Prepod_plan_nagr.ik_prepod_plan = SheduleEvent.ik_prepod_plan ' +
    'INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr ' +
    'WHERE ik_shedule in (SELECT ik_shedule FROM Shedule WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
    ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + '))) and (SheduleEvent.ik_prepod_plan in (SELECT ik_prepod_plan FROM Prepod_plan_nagr WHERE ik_calc_unit = '
    + IntToStr(CalcUnitIK) + ')) and (bit_exception = 0) and (ik_event <> ' + IntToStr(AEvent.EventIK) + ')';
  tempDataSet.Open;
  eventList:= TList.Create;
  while (not tempDataSet.Eof) do
  begin
    tempEvent:= TSheduleEvent.Create;
    tempEvent.Connection:= dm.DBConnect;
    DecodeDate(tempDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
    DecodeTime(tempDataSet.FieldByName('dEvent_start').AsDateTime, h, min, s, ms);
    tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(tempDataSet.FieldByName('dEvent_stop').AsDateTime, h, min, s, ms);
    tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_event').AsInteger;
    tempEvent.DiscIK:= tempDataSet.FieldByName('ik_disc').AsInteger;
    tempEvent.TeacherIK:= tempDataSet.FieldByName('iTab_n').AsInteger;
    tempEvent.VidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempEvent.VidNagruzkiIK:= tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger;
    tempEvent.RoomIK:= tempDataSet.FieldByName('ik_room').AsInteger;
    tempEvent.BeginDate:= tempDataSet.FieldByName('dBegin_date').AsDateTime;
    tempEvent.IsException:= false;
    tempEvent.ReadInfo(tempDataSet.FieldByName('ik_event').AsInteger, tempDataSet.FieldByName('ik_repeat_pattern').AsInteger);
    eventList.Add(tempEvent);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
  if not AEvent.IsException then
    dateList:= AEvent.GetAllEventsBetween(startDate, stopDate)
  else
  begin
    dateList:= TList.Create;
    DecodeDate(AEvent.BeginDate, y, m, d);
    DecodeTime(AEvent.Start, h, min, s, ms);
    DecodeTime(AEvent.Stop, hs, mins,ss, mss);
    dateList.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
  end;
  for i:= 0 to dateList.Count-1 do
  begin
    tempDate:= dateList[i];
    for j:= 0 to eventList.Count-1 do
    begin
      tempEvent:= eventList[j];
      if tempEvent.IsOccured(tempDate.EventStart, tempDate.EventStop) <> nil then
        outConfList^.Add(TConflictItem.Create(PartNumber, tempDate.EventStart, tempEvent.VidZanyatName, tempEvent.CalcUnitName, tempEvent.DiscName, tempEvent.RoomName, tempEvent.TeacherName, citCalcUnit));
    end;
  end;
  dateList.Free;
  eventList.Free;
end;

procedure TSheduleController.CheckRoomBusy(AEvent: TSheduleEvent; SheduleIK,
  RoomIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);
var
  y,m,d,h, min, s, ms, hs, mins,ss, mss: word;
  tempDataSet: TADODataSet;
  eventList: TList;
  dateList: TList;
  tempEvent: TSheduleEvent;
  tempDate: TFactEvent;
  i, j: integer;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM SheduleEvent INNER JOIN SheduleEventType ON SheduleEvent.ik_event_type = SheduleEventType.ik_event_type INNER JOIN Prepod_plan_nagr ON Prepod_plan_nagr.ik_prepod_plan = SheduleEvent.ik_prepod_plan ' +
    'INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr ' +
    'WHERE ik_shedule in (SELECT ik_shedule FROM Shedule WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
    ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + '))) and (ik_room = ' + IntToStr(RoomIK) + ') and (bit_exception = 0) and (ik_event <> ' + IntToStr(AEvent.EventIK) + ')';
  tempDataSet.Open;
  eventList:= TList.Create;
  while (not tempDataSet.Eof) do
  begin
    tempEvent:= TSheduleEvent.Create;
    tempEvent.Connection:= dm.DBConnect;
    DecodeDate(tempDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
    DecodeTime(tempDataSet.FieldByName('dEvent_start').AsDateTime, h, min, s, ms);
    tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(tempDataSet.FieldByName('dEvent_stop').AsDateTime, h, min, s, ms);
    tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_event').AsInteger;
    tempEvent.CalcUnitIK:= tempDataSet.FieldByName('ik_calc_unit').AsInteger;
    tempEvent.DiscIK:= tempDataSet.FieldByName('ik_disc').AsInteger;
    tempEvent.TeacherIK:= tempDataSet.FieldByName('iTab_n').AsInteger;
    tempEvent.VidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempEvent.VidNagruzkiIK:= tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger;
    tempEvent.BeginDate:= tempDataSet.FieldByName('dBegin_date').AsDateTime;
    tempEvent.IsException:= false;
    tempEvent.ReadInfo(tempDataSet.FieldByName('ik_event').AsInteger, tempDataSet.FieldByName('ik_repeat_pattern').AsInteger);
    eventList.Add(tempEvent);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
  if not AEvent.IsException then
    dateList:= AEvent.GetAllEventsBetween(startDate, stopDate)
  else
  begin
    dateList:= TList.Create;
    DecodeDate(AEvent.BeginDate, y, m, d);
    DecodeTime(AEvent.Start, h, min, s, ms);
    DecodeTime(AEvent.Stop, hs, mins,ss, mss);
    dateList.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
  end;
  for i:= 0 to dateList.Count-1 do
  begin
    tempDate:= dateList[i];
    for j:= 0 to eventList.Count-1 do
    begin
      tempEvent:= eventList[j];
      if tempEvent.IsOccured(tempDate.EventStart, tempDate.EventStop) <> nil then
        outConfList^.Add(TConflictItem.Create(PartNumber, tempDate.EventStart, tempEvent.VidZanyatName, tempEvent.CalcUnitName, tempEvent.DiscName, tempEvent.RoomName, tempEvent.TeacherName, citRoom));
    end;
  end;
  dateList.Free;
  eventList.Free;
end;

procedure TSheduleController.CheckTeacherBusy(AEvent: TSheduleEvent; SheduleIK,
  TeacherIK: integer; startDate, stopDate: TDateTime; PartNumber: integer; outConfList: PList);
var
  y,m,d,h, min, s, ms, hs, mins,ss, mss: word;
  tempDataSet: TADODataSet;
  eventList: TList;
  dateList: TList;
  tempEvent: TSheduleEvent;
  tempDate: TFactEvent;
  i, j: integer;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'SELECT * FROM SheduleEvent INNER JOIN SheduleEventType ON SheduleEvent.ik_event_type = SheduleEventType.ik_event_type INNER JOIN Prepod_plan_nagr ON Prepod_plan_nagr.ik_prepod_plan = SheduleEvent.ik_prepod_plan ' +
    'INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr ' +
    'WHERE ik_shedule in (SELECT ik_shedule FROM Shedule WHERE (ik_sem_type = (SELECT ik_sem_type FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) +
    ')) and (ik_year = (SELECT ik_year FROM Shedule WHERE ik_shedule = ' + IntToStr(SheduleIK) + '))) and (SheduleEvent.iTab_n = ' + IntToStr(TeacherIK) + ') and (bit_exception = 0) and (ik_event <> ' + IntToStr(AEvent.EventIK) + ')';
  tempDataSet.Open;
  eventList:= TList.Create;
  while (not tempDataSet.Eof) do
  begin
    tempEvent:= TSheduleEvent.Create;
    tempEvent.Connection:= dm.DBConnect;
    DecodeDate(tempDataSet.FieldByName('dBegin_date').AsDateTime, y,m,d);
    DecodeTime(tempDataSet.FieldByName('dEvent_start').AsDateTime, h, min, s, ms);
    tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(tempDataSet.FieldByName('dEvent_stop').AsDateTime, h, min, s, ms);
    tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
    tempEvent.EventIK:= tempDataSet.FieldByName('ik_event').AsInteger;
    tempEvent.CalcUnitIK:= tempDataSet.FieldByName('ik_calc_unit').AsInteger;
    tempEvent.DiscIK:= tempDataSet.FieldByName('ik_disc').AsInteger;
    tempEvent.VidZanyatIK:= tempDataSet.FieldByName('ik_vid_zanyat').AsInteger;
    tempEvent.VidNagruzkiIK:= tempDataSet.FieldByName('ik_vid_nagruzki').AsInteger;
    tempEvent.RoomIK:= tempDataSet.FieldByName('ik_room').AsInteger;
    tempEvent.TeacherIK:= tempDataSet.FieldByName('iTab_n').AsInteger;
    tempEvent.BeginDate:= tempDataSet.FieldByName('dBegin_date').AsDateTime;
    tempEvent.IsException:= false;
    tempEvent.ReadInfo(tempDataSet.FieldByName('ik_event').AsInteger, tempDataSet.FieldByName('ik_repeat_pattern').AsInteger);
    eventList.Add(tempEvent);
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
  if not AEvent.IsException then
    dateList:= AEvent.GetAllEventsBetween(startDate, stopDate)
  else
  begin
    dateList:= TList.Create;
    DecodeDate(AEvent.BeginDate, y, m, d);
    DecodeTime(AEvent.Start, h, min, s, ms);
    DecodeTime(AEvent.Stop, hs, mins,ss, mss);
    dateList.Add(TFactEvent.Create(EncodeDateTime(y,m,d,h,min,s,ms), EncodeDateTime(y,m,d,hs,mins,ss,mss)));
  end;
  for i:= 0 to dateList.Count-1 do
  begin
    tempDate:= dateList[i];
    for j:= 0 to eventList.Count-1 do
    begin
      tempEvent:= eventList[j];
      if tempEvent.IsOccured(tempDate.EventStart, tempDate.EventStop) <> nil then
        outConfList^.Add(TConflictItem.Create(PartNumber, tempDate.EventStart, tempEvent.VidZanyatName, tempEvent.CalcUnitName, tempEvent.DiscName, tempEvent.RoomName, tempEvent.TeacherName, citTeacher));
    end;
  end;
  dateList.Free;
  eventList.Free;
end;                 }

class function TSheduleController.AccountFunctions: ISheduleAccountController;
begin
  Result:= Instance;
end;

class function TSheduleController.ConstraintFunctions: ISheduleConstraintController;
begin
  Result:= Instance;
end;

constructor TSheduleController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;

constructor TSheduleController.CreateInstance;
begin
  inherited Create;
  _AddRef;
  fSheduleCCInstance:= TSheduleConstraintController.Create;
  fSheduleACInstance:= TSheduleAccountController.Create;
  fSheduleMCInstance:= TSheduleMainController.Create;
end;

class function TSheduleController.Instance: TSheduleController;
begin
  if not Assigned(FSheduleControllerInstance) then
    FSheduleControllerInstance:= CreateInstance;
  Result:= FSheduleControllerInstance;
end;

class function TSheduleController.MainFunctions: ISheduleMainController;
begin
  Result:= Instance;
end;

procedure TSheduleController.Release;
begin
  fSheduleCCInstance:= nil;
  fSheduleACInstance:= nil;
  fSheduleMCInstance:= nil;
end;

class procedure TSheduleController.ReleaseInstance;
begin
  if FSheduleControllerInstance <> nil then
  begin
    FSheduleControllerInstance.Release;
    FSheduleControllerInstance:= nil;
  end;
  TSheduleRegistry.ReleaseInstance;
end;

end.
