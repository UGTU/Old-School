{ -----------------------------------------------------------
  Модуль UchPlanController - содержит:
  TUchPlanController - контроллер подсистемы "Учебные планы специальностей"
  Дата создания: 1.03.2007
  Дата последнего изменения: 1.04.2007
  Разработчик: Павловский Михаил
  ----------------------------------------------------------- }
unit UchPlanController;

{ #Author villain@ist.ugtu.net }
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  uDMUgtuStructure,
  Forms, Dialogs, DBLookupEh, Variants, GeneralController, ExcelXP, ComObj,
  ComCtrls, Math,
  ConstantRepository, DiscClasses;

const
  FISCULTURA = 10; // для особого учета зачетных единиц физической культуры
  FISCULTURA_CIKL = 19; // для особого учета зачетных единиц физической культуры

type
  PStringList = ^TStringList;
  PProgressBar = ^TProgressBar;

  TUchPlanController = class(TObject)
  private
    FMessageHandle: HWND;
    function CheckSemesterString(sourceStr: string): boolean;
    function CheckForRepeat(VidZanyatIK: integer;
      list: TStringList { *TContentDiscUnits* } ): boolean;
    function isListEqual(first: TStringList; second: TStringList): boolean;
    function isAuditorCorrect(value: string): boolean;
    function getStringListFromStr(sourceStr: string): TStringList;
    function getValuesFromStringList(lpSource: PStringList; tableName: string;
      fieldIK: string; fieldName: string): string;
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: integer): TUchPlanController;
  public
    constructor Create;
    destructor Destroy;

    {
      Instance - возвращает экзепляр данного контроллера
    }
    class function Instance: TUchPlanController;

    {
      ReleaseInstance - уничтожает контроллер
    }
    class procedure ReleaseInstance;

    {
      CloseUchPlanContent - закрывает qContentUchPlan на datamodule
    }
    procedure CloseUchPlanContent;

    {
      CheckColumn - проверяет корректность значения value для столбца columnNumber_уч.плана
    }
    function CheckColumn(columnNumber: integer; value: string;
      DefaultKafedraIK: integer): boolean;

    {
      CopyUchPlan - копирует содержание учебного плана OldUchPlanIK в учебный план NewUchPlanIK
    }
    procedure CopyUchPlan(OldUchPlanIK, NewUchPlanIK: integer);

    {
      DeleteDiscFormUchPlan - удаляет дисциплину DiscInUchPlanIK из соответсвующего ей уч. плана
    }
    procedure DeleteDiscFormUchPlan(DiscInUchPlanIK: integer);

    {
      DeleteUchPlan - удаляет уч. план UchPlanIK
    }
    procedure DeleteUchPlan(UchPlanIK: integer);

    {
      getAllFormEd - загружает все формы обучения в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllFormEd(SourceDataSet: PDataSet;
      isShowFirst: boolean): Variant;

    {
      getAllDepartments - загружает все кафедры в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDepartments(SourceDataSet: PDataSet;
      isShowFirst: boolean): Variant;

    {
      getAllDisciplines - загружает все дисциплины в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDisciplines(SourceDataSet: PDataSet;
      isShowFirst: boolean): Variant;

    {
      getAllDisciplineCycles - загружает все циклы дисциплин в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDisciplineCycles(SourceDataSet: PDataSet; VidGos: integer;
      isShowFirst: boolean): Variant;

    {
      getAllDisciplineGroups - загружает все группы дисциплин в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDisciplineGroups(SourceDataSet: PDataSet; VidGos: integer;
      isShowFirst: boolean): Variant;

    {
      getAllDisciplineCyclesWithoutAll - загружает все циклы дисциплин, кроме записи <все>, в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDisciplineCyclesWithoutAll(SourceDataSet: PDataSet;
      VidGos: integer; isShowFirst: boolean): Variant;

    {
      getAllDisciplines - загружает все группы дисциплин, кроме записи <все>, в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllDisciplineGroupsWithoutAll(SourceDataSet: PDataSet;
      VidGos: integer; isShowFirst: boolean): Variant;
    {
      getAllPodGroups - загружает все подгруппы дисциплин в SourseDataSet если isShowFirst
      , то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllPodGroups(SourceDataSet: PDataSet;
      isShowFirst: boolean): Variant;
    {
      getAllSpecializations - загружает все специализации специальности SpecIK в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllSpecializations(SourceDataSet: PDataSet; SpecIK: integer;
      isShowFirst: boolean): Variant;

    {
      getAllYears - загружает все года в SourceDataSet
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getAllYears(SourceDataSet: PDataSet; isShowFirst: boolean)
      : Variant;

    {
      getColumnType - возвращает тип столбца в уч. плане
      3 - форма контроля
      4 - лекции
      5 - лабораторные
      6 - практики
      11 - семестр
    }
    function getColumnType(columnNumber: integer): integer;

    {
      getColumnParamKey - возвращает ключ вида занятий либо номер семестра для стоблца в уч. плане
    }
    function getColumnParamKey(columnNumber: integer): integer;
    function GetSemesterHourityString(semesterNumber: integer): string;

    {
      getCurrentFormEd - загружает в SourceDataSet все формы обучения, для которых существует уч. план с параметрами SpecIK, SpclzIK
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getCurrentFormEd(SourceDataSet: PDataSet; SpecIK, VidGos: integer;
      isShowFirst: boolean): Variant;

    function getCurrentGroups(SourceDataSet: PDataSet; SpecFacIK: integer;
      isShowFirst, IsFilter: boolean): Variant;
    {
      getCurrentSpecializations - загружает в SourceDataSet все специализации, для которых существует уч. план с параметром SpecIK
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    // Выбирает учебный план для группы
    function getUchPlanForGroup(aIK_group: integer): integer;

    // выбирает только профили, которые подходят группе
    function getSpecializationsForGrup(SourceDataSet: PDataSet;
      aIK_group: integer): integer;

    function getCurrentSpecializations(SourceDataSet: PDataSet; SpecIK: integer;
      isShowFirst: boolean): Variant;

    function getUchPlanSpecializations(SourceDataSet: PDataSet; SpecIK: integer;
      isShowFirst: boolean): Variant;
    {
      getCurrentYears - загружает в SourceDataSet все года, для которых существует уч. план с параметрами SpecIK, SpclzIK, FormEdIK
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getCurrentYears(SourceDataSet: PDataSet;
      SpecIK, SpclzIK, FormEdIK, VidGos: integer; isShowFirst: boolean)
      : Variant;
    function getCurrentYearsUtv(SourceDataSet: PDataSet;
      SpecIK, SpclzIK, FormEdIK: integer; isShowFirst: boolean): Variant;
    {
      getCurrentDisciplines - загружает в SourceDataSet все дисциплины из уч. плана UchPlanIK, которые относятся к циклу DiscCycleIK и группе DiscGroupIK
      если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе возвращает NULL
    }
    function getCurrentDisciplines(aTPlan: integer;
      UchPlanIK, DiscCycleIK, DiscGroupIK, DiscPodGroupIK, n_sem, vid_zanIK,
      grupIK: integer): TDataSet;
    {
      getDiscExceptionsZE - загружает в  SourceDataSet значение ЗЕ (зачетных единиц)для выбранной дисциплины,
      для которых существуют исключения по ФГОСу.
    }

    function getDiscExceptionsZE(FgosIK, DiscIK: integer): TDataSet;

    {
      getDiscZE - загружает в  SourceDataSet значение ЗЕ (зачетных единиц) для выбранной дисциплины,
      определённые ФГОС.
    }

    function getDiscZE(FgosIK: integer): TDataSet;
    {
      getDiscInUchPlanIK - возврящает ключ дисциплины DiscIK в уч. плане UchPlanIK
    }
    function getDiscInUchPlanIK(UchPlanIK, DiscIK: integer): integer;

    {
      getColumnsNames - возвращает список названий столбцов уч. плана
      semestrStr - строка, характеризующая какие семестры должны быть отражаны в уч. плане, формируется функцией getSemestersInStr
    }
    function getColumnsNames(semestrStr: string; discTypeIK: integer)
      : TStringList;

    {
      getColumnsValues - возвращает в ValuesColumn - список значений для стобцов уч. плана, в KafedraColumn - список кафедр для соотвествующих столбцов
      в LectHour - суммарное кол-во лекционных часов, в LabHour - суммарное кол-во лабораторных часов, в PractHour - суммарное кол-во практических часов
      если isAlreadyOpen, то qContentUchPlan не открывается
    }
    function GetConsultationPercent: double;
    procedure getColumnsValues(DiscInUchPlanIK: integer;
      var LectHour, LabHour, PractHour: integer; var ValuesColumn: TStringList;
      KafedraColumn: PStringList; isAlreadyOpen: boolean);

    function GetCompetences(DiscInUchPlanIK: integer): string;
    {
      getSemestersInStr - загружает в SourceDataSet продолжительноть семестров уч. плана UchPlanIK
      в качестве результата возвращает строку определяющую список семестров уч. плана, которая используется затем в getColumnsNames
    }
    function getSemestersInStr(SourceDataSet: PDataSet; UchPlanIK: integer;
      keyField: string): string;

    {
      getSpecFromSpecFac - возвращает ключ специальности из связи "специальность - факультет"
    }
    function getSpecFromSpecFac(SpecFacIK: integer): integer;
    {
      getDirFromSpec - возвращает ключ direction (бакалавры, магистры, спец-ты)
    }
    function getDirFromSpec(SpecIK: integer): integer;
    {
      getVidGosFromSpecFac - возвращает ключ вида ГОС (1 = ГОС 2 поколения, 2 = ФГОС 3 поколения,
      3 = поле общее для обоих стандартов
    }
    function getVidGosFromSpecFac(SpecFacIK: integer): integer;
    {
      getSpecName - возвращает название специальности SpecIK
    }
    function getSpecName(SpecIK: integer): string;

    {
      getDiscName - возвращает название дисциплины IKDiscInUchPlan
    }
    function getDiscName(IKDiscInUchPlan: integer): string;

    {
      LoadUchPlanContent - загружает содержание уч. плана для дисциплины DiscInUchPlanIK в qContentUchPlan на DataModule
    }
    procedure LoadUchPlanContent(DiscInUchPlanIK: integer);

    {
      LoadAuditorVZ - загружает информацию по аудиторным занятиям за семестр Semester для дисциплины DefaultKafIK
      возвращает списки часов HourValues и кафедр KafedraValues
    }
    function LoadAuditorVZ(DiscUchPlanIK, Semester: integer): TDataSet;

    {
      LoadControlVZ -  загружает информацию по форме контроля VidZanyatIK для дисциплины DiscInUchPlanIK
      возвращает DataSet с загруженной информацией
    }
    function LoadControlVZ(DiscInUchPlanIK, VidZanyatIK: integer): TDataSet;

    {
      LoadSelection - делает выборку в Excel из уч. плана UchPlanIK по соотвествующей кафедре KafIK, либо по всем кафедрам, если KafIK = 1
      ProgressBar - ссылка на ProgressBar, в котором будет отображаться прогресс экспорта
      SemLengthDataSet - указатель на DataSet, в который загружена продолжительность семестров уч. плана
    }
    procedure LoadSelection(UchPlanIK, KafIK: integer; SemesterStr: string;
      ProgressBar: PProgressBar; SemLengthDataSet: PDataSet);

    {
      SaveAuditorVZ - сохраняет информацию об аудиторном виде занятий за семестр Semester
    }
    function SaveAuditorVZ(Semester, DefaultKaf: integer): boolean;

    {
      SaveControlVZ - сохраняет информацию об форме контроля с ключом VidZanyatIK
    }
    function SaveControlVZ(aDiscUPIK, VidZanyatIK: integer): boolean;

    {
      SaveUchPlan - сохраняет информацию об уч. плане с параметрами SpecIK, SpclzIK, FormEdIK, YearIK
      OperationType - тип операции: 1 - вставка, 2 - обновление
    }
    function SaveUchPlan(OperationType: byte; var UchPlanIK: integer;
      SpecIK, SpclzIK, FormEdIK, YearIK: integer; DateUtv: TDate;
      IsMain: boolean): boolean;

    {
      SaveDiscInUchPlan - сохраняет дисциплину DiscIK в уч. плане UchPlanIK
      OperationType - тип операции: 1 - вставка, 2 - обновление
      CycleIK, GroupIK,PodGroupIK - цикл, группа и подгруппа дисциплин
      KafedraIK - кафедра по умолчанию
      GOSHour - общее кол-во часов по дисциплине
      IndividHour - кол-во часов по индивидуальным занятиям
      CodeGOS - шифр дисциплины по ГОС
    }
    function SaveDiscInUchPlan(UchPlanIK: integer; var DiscInUchPlanIK: integer;
      CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK, SpclzIK, GOSHour,
      IndividHour, GroupViborNum: integer; CodeGOS: string;
      aStrCompetenceList, DiscRelationList: TStringList): boolean;
    { aCompetenceList }

    {
      ChangeDiscInUchPlan - изменяет дисциплины аналогичные DiscIK в уч. планах
      CycleIK, GroupIK,PodGroupIK - цикл, группа и подгруппа дисциплин
      KafedraIK - кафедра по умолчанию
      GOSHour - общее кол-во часов по дисциплине
      IndividHour - кол-во часов по индивидуальным занятиям
      CodeGOS - шифр дисциплины по ГОС
    }
    function ChangeDiscInUchPlan(UchPlanIK: integer; DiscInUchPlanIK: integer;
      CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour,
      GroupViborNum, SpclzIK: integer; CodeGOS: string;
      aCompetenceList: TStringList): boolean;

    {
      SaveSpecialization - сохраняет специализацию SpclzIK специальности SpecIK
      OperationType - тип операции: 1 - вставка, 2 - обновление
    }
    function SaveSpecialization(SpclzIK, SpecIK: integer;
      CodeSpclz, NameSpclz, NameShortSpclz: string): boolean;

    {
      MessageHandle - Handle для выдачи сообщений
    }
    property MessageHandle: HWND read FMessageHandle write FMessageHandle;

    {
      UpdateGrup - перенос оценок со старого уч. плана с изменением группы
    }
    function UpdateGrup(UchPlanOld, UchPlanNew, SpecFac: integer): boolean;

    {
      UpdateUspev - перенос оценок со старого уч. плана
    }
    function UpdateUspev(ik_grup, UchPlanNew: integer): boolean;

    // получение кода специализации по коду группы
    function getGrupSpecializations(ik_grup: integer): Variant;

    function getGrupFormEd(ik_grup: integer): Variant;
    function GetDefaultSemesterWeekCount(ASemNumber: integer): integer;
    function getGrupYear(ik_grup: integer): Variant;

    procedure AddNewDisc(ik_uch_plan, DiscInUchPlanIK, CycleIK, GroupIK,
      PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour, GroupViborNum,
      SpclzIK: integer; CodeGOS: string);

    procedure ReplaseDisc(ik_uch_plan: integer;
      var ik_disc_uch_plan_temp: integer; DiscInUchPlanIK: integer;
      CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour,
      GroupViborNum, SpclzIK: integer; CodeGOS: string);

  end;

var
  NoAudRowCount: integer;

implementation

uses Contnrs, ExceptionBase, uDMFgos;

type
  TColumnInfo = record
    columnType: integer;
    VidZanyatIK: integer;
    columnName: string;
  end;

  TSemInfo = record
    number: integer;
    auditorHour: array [0 .. 2] of integer;
    weekCount: integer;
  end;

  TVidZanyatException = class
  private
    fVidZanyatIK: integer;
    fSemNumber: integer;
    fKafIK: integer;
    fCount: integer;
    fNumber: integer;
  public
    constructor Create(AVidZanyatIK, ASemNumber, AKafIK, ANumber,
      ACount: integer);
    property VidZanyatIK: integer read fVidZanyatIK write fVidZanyatIK;
    property SemNumber: integer read fSemNumber write fSemNumber;
    property KafIK: integer read fKafIK write fKafIK;
    property number: integer read fNumber write fNumber;
    property Count: integer read fCount write fCount; // WeekCount or TaskCount
  end;

  TVidZanyatExceptionList = class(TObjectList)
  private
    function GetWeekCount(AVidZanyatIK, ASemNumber, AKafIK: integer): integer;
    function GetException(Index: integer): TVidZanyatException;
    procedure SetException(Index: integer; const value: TVidZanyatException);
    function GetTaskCount(AVidZanyatIK, ASemNumber, AKafIK,
      ANumber: integer): integer;
  public
    constructor Create;
    procedure ClearListForSemester(ASemNumber: integer);
    procedure ClearListForVidZnayat(AVidZanyat: integer);
    procedure AddTaskRecord(AVidZanyatIK, ASemNumber, AKafIK, ANumber,
      ACount: integer);
    property weekCount[AVidZanyatIK, ASemNumber, AKafIK: integer]: integer
      read GetWeekCount;
    property TaskCount[AVidZanyatIK, ASemNumber, AKafIK, ANumber: integer]
      : integer read GetTaskCount;
    property Items[Index: integer]: TVidZanyatException read GetException
      write SetException; default;
  end;

  TSemKafItem = class
  private
    fVidZanyatIK: integer;
    fSemNumber: integer;
    fKafIK: integer;
    fNumber: integer;
  public
    constructor Create(AVidZanyatIK, ASemNumber, AKafIK: integer);
    property VidZanyatIK: integer read fVidZanyatIK write fVidZanyatIK;
    property SemNumber: integer read fSemNumber write fSemNumber;
    property KafIK: integer read fKafIK write fKafIK;
    property number: integer read fNumber write fNumber;
  end;

  TSemKafList = class(TObjectList)
  private
    function GetSKItem(Index: integer): TSemKafItem;
    procedure SetSKItem(Index: integer; const value: TSemKafItem);
  published
  public
    function GetNextSemKafNumber(AVidZanyatIK, ASemNumber,
      AKafIK: integer): integer;
    property Items[Index: integer]: TSemKafItem read GetSKItem write SetSKItem;
  end;

var
  FUchPlanControllerInstance: TUchPlanController = nil;
  semesters: array of TSemInfo;
  auditorVZ: array [0 .. 2] of integer;
  arColumns: array of TColumnInfo;
  weekCountExceptionList: TVidZanyatExceptionList;
  vidZanyatTaskCountList: TVidZanyatExceptionList;
  vedomDelList: TStringList;

const
  Excel_GUID: TGUID = '{000208D5-0000-0000-C000-000000000046}';

  {
    ****************************** TUchPlanController ******************************
  }

constructor TUchPlanController.Create;
begin

  inherited Create;
  raise Exception.CreateFmt
    ('Доступ к классу %s можно получить только через поле Instance!',
    [ClassName]);
end;

constructor TUchPlanController.CreateInstance;
begin
  inherited Create;
  weekCountExceptionList := TVidZanyatExceptionList.Create;
  vidZanyatTaskCountList := TVidZanyatExceptionList.Create;
  vedomDelList := TStringList.Create;
end;

class function TUchPlanController.AccessInstance(Request: integer)
  : TUchPlanController;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FUchPlanControllerInstance) then
        FUchPlanControllerInstance := CreateInstance;
    2:
      begin
        if FUchPlanControllerInstance <> nil then
          FreeAndNil(FUchPlanControllerInstance);
      end
  else
    raise Exception.CreateFmt
      ('Неизвестное значение параметра %d в методе AccessInstance контроллера UchPlanController',
      [Request]);
  end;
  Result := FUchPlanControllerInstance;
end;

procedure TUchPlanController.CopyUchPlan(OldUchPlanIK, NewUchPlanIK: integer);
var
  DataSet: TADOStoredProc;
  tempDataSet: TADODataSet;
  DiscUchPlanIK: integer;
begin

  DataSet := TADOStoredProc.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.ProcedureName := 'UpdateUchPlan';
  DataSet.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 4);
  DataSet.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0,
    NewUchPlanIK);
  DataSet.Parameters.CreateParameter('@ik_spec', ftInteger, pdInput, 0, NULL);
  DataSet.Parameters.CreateParameter('@ik_spclz', ftInteger, pdInput, 0, NULL);
  DataSet.Parameters.CreateParameter('@ik_form_ed', ftInteger, pdInput,
    0, NULL);
  DataSet.Parameters.CreateParameter('@ik_year_uch_pl', ftInteger,
    pdInput, 0, NULL);
  DataSet.Parameters.CreateParameter('@date_utv', ftDate, pdInput, 0, NULL);
  DataSet.Parameters.CreateParameter('@old_uch_plan', ftInteger, pdInput, 0,
    OldUchPlanIK);
  DataSet.ExecProc;

  DataSet.Parameters.Clear;
  DataSet.ProcedureName := 'UpdateDiscInUchPlan';
  DataSet.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  DataSet.Parameters.CreateParameter('@ik_disc_uch_plan', ftInteger,
    pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ik_default_kaf', ftInteger,
    pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@iHour_gos', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@iIndivid', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ik_ckl_disc', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ik_grp_disc', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@Cname_ckl_disc_gos', ftString,
    pdInput, 20, '');
  DataSet.Parameters.CreateParameter('@ik_pdgrp_disc', ftInteger,
    pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@ViborGroup', ftInteger, pdInput, 0, 0);
  DataSet.Parameters.CreateParameter('@source_disc_uch_plan', ftInteger,
    pdInput, 0, 0);

  tempDataSet := TADODataSet.Create(nil);
  tempDataSet.Connection := dm.DBConnect;
  tempDataSet.CommandText := 'Select * From sv_disc Where ik_uch_plan = ' +
    IntToStr(OldUchPlanIK);
  tempDataSet.Open;

  while (not tempDataSet.Eof) do
  begin
    DataSet.Parameters.ParamByName('@i_type').value := 1;
    DataSet.Parameters.ParamByName('@ik_uch_plan').value := NewUchPlanIK;
    DataSet.Parameters.ParamByName('@ik_disc').value :=
      tempDataSet.FieldByName('ik_disc').value;
    DataSet.Parameters.ParamByName('@ik_default_kaf').value :=
      tempDataSet.FieldByName('ik_default_kaf').value;
    DataSet.Parameters.ParamByName('@iHour_gos').value :=
      tempDataSet.FieldByName('iHour_gos').value;
    DataSet.Parameters.ParamByName('@iIndivid').value :=
      tempDataSet.FieldByName('iIndivid').value;
    DataSet.Parameters.ParamByName('@ik_ckl_disc').value :=
      tempDataSet.FieldByName('ik_ckl_disc').value;
    DataSet.Parameters.ParamByName('@ik_grp_disc').value :=
      tempDataSet.FieldByName('ik_grp_disc').value;
    DataSet.Parameters.ParamByName('@ik_pdgrp_disc').value :=
      tempDataSet.FieldByName('ik_pdgrp_disc').value;
    DataSet.Parameters.ParamByName('@Cname_ckl_disc_gos').value :=
      tempDataSet.FieldByName('Cname_ckl_disc1').value;
    DataSet.Parameters.ParamByName('@ViborGroup').value :=
      tempDataSet.FieldByName('ViborGroup').value;
    try
      DataSet.Open;
      DiscUchPlanIK := DataSet.FieldByName('ReturnValue').AsInteger;
      DataSet.Close;
    except
      raise;
    end;
    DataSet.Parameters.ParamByName('@i_type').value := 4;
    DataSet.Parameters.ParamByName('@ik_disc_uch_plan').value := DiscUchPlanIK;
    DataSet.Parameters.ParamByName('@source_disc_uch_plan').value :=
      tempDataSet.FieldByName('ik_disc_uch_plan').value;
    try
      DataSet.ExecProc;
    except
      raise;
    end;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
  DataSet.Free;

end;

procedure TUchPlanController.DeleteDiscFormUchPlan(DiscInUchPlanIK: integer);
var
  myStoredProc: TADOStoredProc;
begin
  if MessageDlg('Будут удалены ведомости по данной дисциплине. Продолжить?',
      mtConfirmation, mbYesNoCancel, 0) = mrYes then
  begin
    myStoredProc := TADOStoredProc.Create(nil);
  try

    myStoredProc.Connection := dm.DBConnect;
    myStoredProc.Connection.BeginTrans;
    myStoredProc.ProcedureName := 'Hard_DiscDel';
   // myStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 3);
    myStoredProc.Parameters.CreateParameter('@ik_disc_uch_plan', ftInteger,
      pdInput, 0, DiscInUchPlanIK);

    try

      myStoredProc.ExecProc;
      myStoredProc.Connection.CommitTrans;
    except
      myStoredProc.Connection.RollbackTrans;

    end;
 //   myStoredProc.Connection.CommitTrans;


  finally
    myStoredProc.Free;
  end;

    // myStoredProc.Free;
    // raise;
  end;

end;

procedure TUchPlanController.DeleteUchPlan(UchPlanIK: integer);
var
  myStoredProc: TADOStoredProc;
begin
  myStoredProc := TADOStoredProc.Create(nil);
  myStoredProc.Connection := dm.DBConnect;
  myStoredProc.ProcedureName := 'UpdateUchPlan';
  myStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  myStoredProc.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0,
    UchPlanIK);
  try
    myStoredProc.ExecProc;
  except
    myStoredProc.Free;
    raise;
  end;
  myStoredProc.Free;
end;

destructor TUchPlanController.Destroy;
begin
  if Assigned(weekCountExceptionList) then
    FreeAndNil(weekCountExceptionList);
  if Assigned(vidZanyatTaskCountList) then
    FreeAndNil(vidZanyatTaskCountList);
end;

function TUchPlanController.getAllFormEd(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select * From Form_ed ORDER BY Cname_form_ed', 'ik_form_ed',
    isShowFirst, NULL);
end;

function TUchPlanController.getAllSpecializations(SourceDataSet: PDataSet;
  SpecIK: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select * From spclz Where ik_spec = ' + IntToStr(SpecIK) +
    ' Order By cName_spclz', 'ik_spclz', isShowFirst, NULL);
end;

function TUchPlanController.getAllYears(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select * From Year_uch_pl ORDER BY year_value', 'ik_year_uch_pl',
    isShowFirst, NULL);
end;

function TUchPlanController.getCurrentFormEd(SourceDataSet: PDataSet;
  SpecIK, VidGos: integer; isShowFirst: boolean): Variant;
var
  tempQuery: string;
begin
  tempQuery :=
    'Select * From Form_ed Where ik_form_ed in (Select ik_form_ed From Uch_pl Where ik_spec = '
    + IntToStr(SpecIK);
  tempQuery := tempQuery + ' and is_main = 1 ) ORDER BY Cname_form_ed';
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    tempQuery, 'ik_form_ed', isShowFirst, NULL);
end;

function TUchPlanController.getCurrentGroups(SourceDataSet: PDataSet;
  SpecFacIK: integer; isShowFirst, IsFilter: boolean): Variant;
var
  tempQuery: string;
begin
  // показывать все, или только текущие
  tempQuery := 'Select * from GetCurrentGrup(' + IntToStr(SpecFacIK) + ')';
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    tempQuery, 'ik_grup', isShowFirst, NULL);
end;

function TUchPlanController.getCurrentSpecializations(SourceDataSet: PDataSet;
  SpecIK: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from GetSpclzForSpec(' + IntToStr(SpecIK) +
    ') order by is_common desc', 'ik_spclz', isShowFirst, NULL);
end;

function TUchPlanController.getCurrentYears(SourceDataSet: PDataSet;
  SpecIK, SpclzIK, FormEdIK, VidGos: integer; isShowFirst: boolean): Variant;
var
  tempQuery: string;
begin
  tempQuery := 'Select Uch_pl.ik_uch_plan, Year_uch_pl.* From Uch_pl ' +
    'INNER JOIN Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl'
    + ' Where (Uch_pl.ik_spec = ' + IntToStr(SpecIK) +
    ') and (Uch_pl.ik_form_ed = ' + VarToStr(FormEdIK) +
    ') and is_main = 1 ORDER BY year_value';
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    tempQuery, 'ik_year_uch_pl', isShowFirst, NULL);
end;

function TUchPlanController.getCurrentYearsUtv(SourceDataSet: PDataSet;
  SpecIK, SpclzIK, FormEdIK: integer; isShowFirst: boolean): Variant;
var
  tempQuery: string;
begin
  tempQuery :=
    'Select Uch_pl.ik_uch_plan, Year_uch_pl.* From Uch_pl INNER JOIN Year_uch_pl ON Uch_pl.ik_year_utverzh = Year_uch_pl.ik_year_uch_pl Where (Uch_pl.ik_spec = '
    + IntToStr(SpecIK) + ') and (Uch_pl.ik_form_ed = ' +
    VarToStr(FormEdIK) + ')';
  if (SpclzIK <> NULL) and (SpclzIK <> 0) then
    tempQuery := tempQuery + ' and (Uch_pl.ik_spclz = ' +
      VarToStr(SpclzIK) + ') '
  else
    tempQuery := tempQuery + ' and (Uch_pl.ik_spclz is null ) ';
  tempQuery := tempQuery + 'ORDER BY year_value';
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    tempQuery, 'ik_year_uch_pl', isShowFirst, NULL);
end;

function TUchPlanController.GetDefaultSemesterWeekCount
  (ASemNumber: integer): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Length(semesters) - 1 do
    if (semesters[i].number = ASemNumber) then
    begin
      Result := semesters[i].weekCount;
      break;
    end;
end;

function TUchPlanController.getAllDisciplineCycles(SourceDataSet: PDataSet;
  VidGos: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select ckl_disc.IK_ckl_disc, RTRIM(ckl_disc.Cname_ckl_disc) as name_ckl_disc From ckl_disc where VidGos='
    + IntToStr(VidGos) + ' or VidGos=3 ORDER BY Cname_ckl_disc', 'ik_ckl_disc',
    isShowFirst, NULL);
end;

function TUchPlanController.getAllDisciplineGroups(SourceDataSet: PDataSet;
  VidGos: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select grp_disc.IK_grp_disc, RTRIM(grp_disc.Cname_grp_disc) as name_grp_disc From grp_disc where VidGos='
    + IntToStr(VidGos) + ' or VidGos=3 ORDER BY Cname_grp_disc', 'ik_grp_disc',
    isShowFirst, NULL);
end;

function TUchPlanController.getCurrentDisciplines(aTPlan: integer;
  UchPlanIK, DiscCycleIK, DiscGroupIK, DiscPodGroupIK, n_sem, vid_zanIK,
  grupIK: integer): TDataSet;
var
  i: integer;
  aSP: TADOStoredProc;
begin
  case aTPlan of
    key_ModelPlan:
      aSP := dm.aspGetDiscModel;
    key_WorkPlan:
      aSP := dm.aspGetDiscWork;
  end;

  if (aSP.Active) then
    aSP.Close;
  aSP.Parameters.ParamByName('@ik_uch_plan').value := UchPlanIK;
  aSP.Parameters.ParamByName('@ik_ckl_disc').value := DiscCycleIK;
  aSP.Parameters.ParamByName('@ik_grp_disc').value := DiscGroupIK;
  aSP.Parameters.ParamByName('@ik_pdgrp_disc').value := DiscPodGroupIK;
  aSP.Parameters.ParamByName('@n_sem').value := n_sem;
  aSP.Parameters.ParamByName('@ik_vid_zan').value := vid_zanIK;
  aSP.Parameters.ParamByName('@ik_grup').value := grupIK;

  aSP.Open;
  Result := aSP;
  // dm.aspGetDiscplines
end;

function TUchPlanController.getDiscZE(FgosIK: integer): TDataSet;
begin
  if (dmFgos.aspGetDiscZE.Active) then
    dmFgos.aspGetDiscZE.Close;
  dmFgos.aspGetDiscZE.Parameters.ParamByName('@IDGos').value := FgosIK;
  dmFgos.aspGetDiscZE.Open;
  Result := dmFgos.aspGetDiscZE;
end;

function TUchPlanController.getDiscExceptionsZE(FgosIK, DiscIK: integer)
  : TDataSet;
begin
  if (dmFgos.aspGetDiscExceptionZE.Active) then
    dmFgos.aspGetDiscExceptionZE.Close;
  dmFgos.aspGetDiscExceptionZE.Parameters.ParamByName('@IDGos').value := FgosIK;
  dmFgos.aspGetDiscExceptionZE.Parameters.ParamByName('@ik_disc').value
    := DiscIK;
  dmFgos.aspGetDiscExceptionZE.Open;
  Result := dmFgos.aspGetDiscExceptionZE;
end;

function TUchPlanController.getSpecName(SpecIK: integer): string;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandType := cmdText;
  DataSet.CommandText := 'Select * From Spec_stud Where ik_spec = ' +
    IntToStr(SpecIK);
  DataSet.Open;
  Result := DataSet.FieldByName('Cname_spec').AsString;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getDiscName(IKDiscInUchPlan: integer): string;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandType := cmdText;
  DataSet.CommandText := 'Select cName_disc From discpln d inner join sv_disc s'
    + ' on d.iK_disc=s.ik_disc Where s.ik_disc_uch_plan= ' +
    IntToStr(IKDiscInUchPlan);
  DataSet.Open;
  Result := DataSet.FieldByName('cName_disc').AsString;
  DataSet.Close;
  DataSet.Free;
end;

class function TUchPlanController.Instance: TUchPlanController;
begin
  Result := AccessInstance(1);
end;

class procedure TUchPlanController.ReleaseInstance;
begin
  AccessInstance(2);
end;

function TUchPlanController.SaveUchPlan(OperationType: byte;
  var UchPlanIK: integer; SpecIK, SpclzIK, FormEdIK, YearIK: integer;
  DateUtv: TDate; IsMain: boolean): boolean;
var
  DataSet: TCustomADODataSet;
begin
  DataSet := TADOStoredProc.Create(nil);
  DataSet.Connection := dm.DBConnect;
  (DataSet as TADOStoredProc).ProcedureName := 'UpdateUchPlan';
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@i_type', ftWord,
    pdInput, 0, OperationType);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_uch_plan',
    ftInteger, pdInput, 0, UchPlanIK);
  if (IsMain) then
    (DataSet as TADOStoredProc).Parameters.CreateParameter('@is_main',
      ftInteger, pdInput, 0, 1)
  else
    (DataSet as TADOStoredProc).Parameters.CreateParameter('@is_main',
      ftInteger, pdInput, 0, 0);

  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_spec', ftInteger,
    pdInput, 0, SpecIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_spclz', ftInteger,
    pdInput, 0, SpclzIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_form_ed',
    ftInteger, pdInput, 0, FormEdIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_year_uch_pl',
    ftInteger, pdInput, 0, YearIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@date_utv', ftDate,
    pdInput, 0, DateUtv);

  try
    DataSet.Open;
    UchPlanIK := DataSet.FieldByName('ReturnValue').AsInteger;
    DataSet.Close;
  except
    if DataSet.Active then
      DataSet.Close;
    DataSet.Free;
    raise;
  end;
  DataSet.Free;
  Result := true;
end;

function TUchPlanController.getSpecFromSpecFac(SpecFacIK: integer): integer;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandText := 'Select * From Relation_spec_fac Where ik_spec_fac = '
    + IntToStr(SpecFacIK);
  DataSet.Open;
  Result := DataSet.FieldByName('ik_spec').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getSpecializationsForGrup(SourceDataSet: PDataSet;
  aIK_group: integer): integer;
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from GetSpclzByGrup(' + IntToStr(aIK_group) +
    ') order by is_common desc', 'ik_spclz', false, NULL);
end;

function TUchPlanController.getVidGosFromSpecFac(SpecFacIK: integer): integer;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandText := 'Select * From Relation_spec_fac Where ik_spec_fac = '
    + IntToStr(SpecFacIK);
  DataSet.Open;
  Result := DataSet.FieldByName('VidGos').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getDirFromSpec(SpecIK: integer): integer;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandText := 'Select * From Spec_stud Where ik_spec = ' +
    IntToStr(SpecIK);
  DataSet.Open;
  Result := DataSet.FieldByName('ik_direction').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getAllDepartments(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select ik_kaf, RTRIM(cname_kaf) as name_kaf, RTRIM(cshort_name_kaf) as short_name_kaf From kafedra Order By cname_kaf',
    'ik_kaf', isShowFirst, 1);
end;

function TUchPlanController.getAllDisciplines(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select * From AllDisciplines order By name_disc',
    'iK_disc', isShowFirst, NULL);
end;

function TUchPlanController.getAllDisciplineCyclesWithoutAll
  (SourceDataSet: PDataSet; VidGos: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select ckl_disc.IK_ckl_disc, RTRIM(ckl_disc.Cname_ckl_disc) as name_ckl_disc, ckl_disc.Ccode_ckl_disc From ckl_disc Where (IK_ckl_disc != 11) and  (VidGos='
    + IntToStr(VidGos) + ' or VidGos=3) Order By Cname_ckl_disc', 'ik_ckl_disc',
    isShowFirst, NULL);
end;

function TUchPlanController.getAllDisciplineGroupsWithoutAll
  (SourceDataSet: PDataSet; VidGos: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select grp_disc.IK_grp_disc, RTRIM(grp_disc.Cname_grp_disc) as name_grp_disc, grp_disc.Ccode_grp_disc, lVibor From grp_disc Where (IK_grp_disc != 9) and  (VidGos='
    + IntToStr(VidGos) + ' or VidGos=3) Order By Cname_grp_disc', 'ik_grp_disc',
    isShowFirst, NULL);
end;

function TUchPlanController.getAllPodGroups(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select pdgrp_disc.iK_pdgrp_disc, RTRIM(pdgrp_disc.Cname_pdgrp_disc) as name_pdgrp_disc, pdgrp_disc.Ccode_pdgrp_disc From pdgrp_disc Order By Cname_pdgrp_disc',
    'iK_pdgrp_disc', isShowFirst, NULL);
end;

function TUchPlanController.getStringListFromStr(sourceStr: string)
  : TStringList;
var
  i: integer;
  number: string;
const
  allow: set of char = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
begin
  Result := TStringList.Create;
  if (Length(sourceStr) > 0) then
  begin
    number := '';
    if Length(sourceStr) > 0 then
      for i := 1 to Length(sourceStr) do
      begin
        if ((sourceStr[i] = ',') or (sourceStr[i] = '\') or (sourceStr[i] = ' ')
          or (Length(number) > 2)) then
        begin
          if (Length(number) > 0) then
            Result.Add(number);
          number := '';
        end
        else
        begin
          if (sourceStr[i] in allow) then
            number := number + sourceStr[i]
          else
          begin
            Application.MessageBox
              (PChar('Указанно неверное значение: ' + sourceStr),
              'Изменение дисциплины в учебном плане', MB_ICONWARNING);
            Result := TStringList.Create;
            exit;
          end;
        end;
      end;
    if (Length(number) > 0) then
      Result.Add(number);
  end;
end;

function TUchPlanController.getUchPlanForGroup(aIK_group: integer): integer;
begin
  with dm.adsGroups do
  begin
    Close;
    Open;
    Filter := 'ik_grup=' + IntToStr(aIK_group);
    Filtered := true;
    Result := FieldByName('Ik_uch_plan').AsInteger;
    if Result = NULL then
      Result := 0;
  end;
end;

function TUchPlanController.getUchPlanSpecializations(SourceDataSet: PDataSet;
  SpecIK: integer; isShowFirst: boolean): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from spclz where ik_spclz in (select ik_spclz from Uch_pl where ik_spec='
    + IntToStr(SpecIK) + ') order by ik_spec', 'ik_spclz', isShowFirst, NULL);
end;

function TUchPlanController.CheckSemesterString(sourceStr: string): boolean;
const
  allow: set of char = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
var
  i: integer;
  number: string;
begin
  number := '';
  if Length(sourceStr) > 0 then
    for i := 1 to Length(sourceStr) do
    begin
      if ((not(sourceStr[i] in allow)) and (sourceStr[i] <> ' ') and
        (sourceStr[i] <> ',')) then
      begin
        Result := false;
        exit;
      end;
      if (sourceStr[i] = ',') then
      begin
        if (Length(number) > 0) then
          if ((Length(number) > 2) or (StrToInt(number) > 12) or
            ((Length(number) = 1) and (StrToInt(number) = 0))) then
          begin
            Result := false;
            exit;
          end;
        number := '';
      end
      else
      begin
        if (sourceStr[i] in allow) then
          number := number + sourceStr[i]
        else if (sourceStr[i] <> ' ') then
        begin
          Result := false;
          exit;
        end;
      end;
    end;
  if (Length(number) > 0) then
    if ((Length(number) > 2) or (StrToInt(number) > 12) or
      ((Length(number) = 1) and (StrToInt(number) = 0))) then
    begin
      Result := false;
      exit;
    end;
  Result := true;
end;

function TUchPlanController.CheckForRepeat(VidZanyatIK: integer;
  list: TStringList { *TContentDiscUnits* } ): boolean;
var
  i, j, n: integer;
  tempDS: TADODataSet;
begin
  Result := false;
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText :=
      'SELECT count(*) as vz_count FROM vid_zaniat WHERE (iK_vid_zanyat = ' +
      IntToStr(VidZanyatIK) + ') and (IkTypeZanyat in (1,2))';
    tempDS.Open;
    if tempDS.FieldByName('vz_count').AsInteger > 0 then
    begin
      if (list.Count = 0) then
        exit;
      for i := 0 to list.Count - 1 do
      begin
        n := 0;
        for j := 0 to list.Count - 1 do
          if (list[i] = list[j]) then
            inc(n);
        if (n > 1) then
        begin
          Result := true;
          break;
        end;
      end;
    end;
  finally
    if tempDS.Active then
      tempDS.Close;
    tempDS.Free;
  end;
end;

function TUchPlanController.isListEqual(first, second: TStringList): boolean;
var
  i, Count: integer;
begin
  if (first.Count <> second.Count) then
  begin
    Result := false;
    exit;
  end
  else
  begin
    if (first.Count = 0) then
    begin
      Result := true;
      exit;
    end;
    Count := first.Count - 1;
    for i := 0 to Count do
    begin
      if (second.IndexOf(first[0]) = -1) then
      begin
        Result := false;
        exit;
      end;
      second.Delete(second.IndexOf(first[0]));
      first.Delete(0);
    end;
    Result := true;
  end;
end;

function TUchPlanController.isAuditorCorrect(value: string): boolean;
const
  allow: set of char = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
var
  i, n, numeric: integer;
begin
  n := 0;
  numeric := 0;
  for i := 1 to Length(value) do
  begin
    if (value[i] in allow) then
    begin
      inc(numeric);
    end
    else
    begin
      if (value[i] = '\') then
      begin
        if (numeric >= 1) then
        begin
          inc(n);
          numeric := 0;
        end
        else
        begin
          Result := false;
          exit;
        end;
      end
      else
      begin
        Result := false;
        exit;
      end;
    end;
  end;
  if (numeric >= 1) then
    inc(n);
  if (n = 3) then
    Result := true
  else
    Result := false;
end;

function TUchPlanController.getValuesFromStringList(lpSource: PStringList;
  tableName, fieldIK, fieldName: string): string;
var
  tempStr: string;
  i: integer;
  DataSet: TADODataSet;
begin
  if (lpSource^.Count > 0) then
  begin
    tempStr := '(' + fieldIK + ' = ' + lpSource^[0] + ')';
    for i := 1 to lpSource^.Count - 1 do
      tempStr := tempStr + ' or (' + fieldIK + ' = ' + lpSource^[i] + ')';
    DataSet := TADODataSet.Create(nil);
    DataSet.Connection := dm.DBConnect;
    DataSet.CommandText := 'Select * From ' + tableName + ' Where (' +
      tempStr + ')';
    DataSet.Open;
    tempStr := '';
    while (not DataSet.Eof) do
    begin
      tempStr := tempStr + DataSet.FieldByName(fieldName).AsString + ', ';
      DataSet.Next;
    end;
    if (Length(tempStr) > 0) then
      Delete(tempStr, Length(tempStr) - 1, 1);
    DataSet.Close;
    DataSet.Free;
    Result := tempStr;
  end
  else
    Result := '';
end;

procedure TUchPlanController.LoadUchPlanContent(DiscInUchPlanIK: integer);
var
  tempDS: TADODataSet;
  semKafList: TSemKafList;
  n: integer;
begin

  vedomDelList.Clear;

  with dm do
  begin
    if qContentUchPlan.Active then
      qContentUchPlan.Close;
    if Assigned(weekCountExceptionList) then
      weekCountExceptionList.Clear;
    if Assigned(vidZanyatTaskCountList) then
      vidZanyatTaskCountList.Clear;
    // грузим содержание дисциплины и ведомости по этому содержанию
    qContentUchPlan.Connection := dm.DBConnect;
    qVedomostForContent.Connection := dm.DBConnect;
    qContentUchPlan.SQL.Clear;
    qVedomostForContent.SQL.Clear;
    qContentUchPlan.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(DiscInUchPlanIK));
    qVedomostForContent.SQL.Add
      ('Select * from Vedomost where ik_upContent in (Select ik_upContent From Content_UchPl Where ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ')');
    qContentUchPlan.ExecSQL;
    qVedomostForContent.ExecSQL;
    qContentUchPlan.Open;
    qVedomostForContent.Open;
    tempDS := TGeneralController.Instance.GetNewADODataSet(false);
    semKafList := TSemKafList.Create;
    try
      tempDS.CommandText :=
        'SELECT ik_vid_zanyat, ik_kaf, n_sem, week_count FROM Content_UchPl INNER JOIN UchPlan_WeekCount_Exception upwce ON Content_UchPl.ik_upContent = upwce.ik_upContent WHERE ik_disc_uch_plan = '
        + IntToStr(DiscInUchPlanIK);
      tempDS.Open;
      while not tempDS.Eof do
      begin
        weekCountExceptionList.Add
          (TVidZanyatException.Create(tempDS.FieldByName('ik_vid_zanyat')
          .AsInteger, tempDS.FieldByName('n_sem').AsInteger,
          tempDS.FieldByName('ik_kaf').AsInteger, 1,
          tempDS.FieldByName('week_count').AsInteger));
        tempDS.Next;
      end;
      tempDS.Close;

      tempDS.CommandText :=
        'SELECT ik_upContent, tasks_count FROM Vid_zanyat_with_several_tasks WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
        + IntToStr(DiscInUchPlanIK) + ')';
      tempDS.Open;
      qContentUchPlan.first;
      while not qContentUchPlan.Eof do
      begin
        n := semKafList.GetNextSemKafNumber
          (qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger,
          qContentUchPlan.FieldByName('n_sem').AsInteger,
          qContentUchPlan.FieldByName('ik_kaf').AsInteger);
        if tempDS.Locate('ik_upContent',
          qContentUchPlan.FieldByName('ik_upContent').AsInteger, [loPartialKey])
        then
          vidZanyatTaskCountList.AddTaskRecord
            (qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger,
            qContentUchPlan.FieldByName('n_sem').AsInteger,
            qContentUchPlan.FieldByName('ik_kaf').AsInteger, n,
            tempDS.FieldByName('tasks_count').AsInteger);
        qContentUchPlan.Next;
      end;
    finally
      FreeAndNil(semKafList);
      if tempDS.Active then
        tempDS.Close;
      tempDS.Free;
    end;
  end;
end;

function TUchPlanController.getSemestersInStr(SourceDataSet: PDataSet;
  UchPlanIK: integer; keyField: string): string;
var
  n: integer;
begin
  if SourceDataSet^ <> nil then
  begin
    if SourceDataSet^.Active then
      SourceDataSet^.Close;
    SourceDataSet^.Free;
  end;
  // else
  begin
    SourceDataSet^ := TADODataSet.Create(nil);
    (SourceDataSet^ as TADODataSet).Connection := dm.DBConnect;
  end;
  (SourceDataSet^ as TADODataSet).LockType := ltBatchOptimistic;
  (SourceDataSet^ as TADODataSet).CommandText :=
    'Select * From sem_uch_pl Where ik_uch_plan = ' + IntToStr(UchPlanIK) +
    ' Order By n_sem';
  SourceDataSet^.Open;
  SourceDataSet^.FieldByName('ik_uch_plan').Visible := false;
  SourceDataSet^.FieldByName('n_sem').DisplayLabel := 'Номер семестра';
  SourceDataSet^.FieldByName('kol_ned').DisplayLabel := 'Количество недель';
  n := 0;
  SetLength(semesters, SourceDataSet^.RecordCount);
  if (SourceDataSet^.RecordCount > 0) then
  begin
    SourceDataSet^.first;
    while (not SourceDataSet^.Eof) do
    begin
      semesters[n].number := SourceDataSet^.FieldByName('n_sem').AsInteger;
      semesters[n].weekCount := SourceDataSet^.FieldByName('kol_ned').AsInteger;
      if (n = 0) then
        Result := '(' + keyField + '= ' + IntToStr(semesters[n].number) + ')'
      else
        Result := Result + ' or (' + keyField + ' = ' +
          IntToStr(semesters[n].number) + ')';
      inc(n);
      SourceDataSet^.Next;
    end;
  end
  else
    Result := keyField + ' = -1';
end;

function TUchPlanController.getColumnsNames(semestrStr: string;
  discTypeIK: integer): TStringList;
var
  n: integer;
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  (DataSet as TADODataSet).CommandText :=
    'SELECT count(ik_column) as NoAudRowCount FROM Uch_plan_columns WHERE (i_type_column = 3) and (ik_type_disc = '
    + IntToStr(discTypeIK) + ')';
  DataSet.Open;
  NoAudRowCount := DataSet.FieldByName('NoAudRowCount').AsInteger;
  DataSet.Close;
  case discTypeIK of
    1:
    begin
      if semestrStr='' then semestrStr := 'iK_vid_zanyat=-1';

      (DataSet as TADODataSet).CommandText :=
        'SELECT * FROM Uch_plan_columns WHERE (ik_type_disc = 1) and (((i_type_column IN (3, 4, 5, 6)) or ((i_type_column = 11) and ('
        + semestrStr + ')))) ORDER BY ik_column';
    end
  else
    (DataSet as TADODataSet).CommandText :=
      'SELECT * FROM Uch_plan_columns WHERE ik_type_disc = ' +
      IntToStr(discTypeIK);
end;
DataSet.Open;
Result := TStringList.Create;
case discTypeIK of
  1:
    SetLength(arColumns, DataSet.RecordCount - 3);
    // минус лекции, практ. и лаб.
else
  SetLength(arColumns, DataSet.RecordCount);
end;
n := 0;
while (not DataSet.Eof) do
begin
  case (DataSet.FieldByName('i_type_column').AsInteger) of
    4:
      auditorVZ[0] := DataSet.FieldByName('ik_vid_zanyat').AsInteger;
    5:
      auditorVZ[1] := DataSet.FieldByName('ik_vid_zanyat').AsInteger;
    6:
      auditorVZ[2] := DataSet.FieldByName('ik_vid_zanyat').AsInteger;
  else
    begin
      arColumns[n].columnType := DataSet.FieldByName('i_type_column').AsInteger;
      arColumns[n].VidZanyatIK := DataSet.FieldByName('ik_vid_zanyat')
        .AsInteger;
      arColumns[n].columnName := DataSet.FieldByName('Cname_column').AsString;
      Result.Add(arColumns[n].columnName);
      inc(n);
    end;
  end;
  DataSet.Next;
end;
DataSet.Close;
end;

procedure TUchPlanController.getColumnsValues(DiscInUchPlanIK: integer;
  var LectHour, LabHour, PractHour: integer; var ValuesColumn: TStringList;
  KafedraColumn: PStringList; isAlreadyOpen: boolean);
var
  tempSL: TStringList;
  tempStr, secTempStr: string;
  k, i, g: integer;
  tempDS: TADODataSet;
begin
  if not isAlreadyOpen then
  begin
    if dm.qContentUchPlan.Active then
      dm.qContentUchPlan.Close;
    if Assigned(weekCountExceptionList) then
      weekCountExceptionList.Clear;
    dm.qContentUchPlan.Connection := dm.DBConnect;
    dm.qContentUchPlan.SQL.Clear;
    dm.qContentUchPlan.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(DiscInUchPlanIK));
    dm.qContentUchPlan.Open;
    tempDS := TGeneralController.Instance.GetNewADODataSet(false);
    try
      tempDS.CommandText :=
        'SELECT ik_vid_zanyat, ik_kaf, n_sem, week_count FROM Content_UchPl INNER JOIN UchPlan_WeekCount_Exception upwce ON Content_UchPl.ik_upContent = upwce.ik_upContent WHERE ik_disc_uch_plan = '
        + IntToStr(DiscInUchPlanIK);
      tempDS.Open;
      while not tempDS.Eof do
      begin
        weekCountExceptionList.Add
          (TVidZanyatException.Create(tempDS.FieldByName('ik_vid_zanyat')
          .AsInteger, tempDS.FieldByName('n_sem').AsInteger,
          tempDS.FieldByName('ik_kaf').AsInteger, 1,
          tempDS.FieldByName('week_count').AsInteger));
        tempDS.Next;
      end;
    finally
      if tempDS.Active then
        tempDS.Close;
      tempDS.Free;
    end;
  end;
  LectHour := 0;
  LabHour := 0;
  PractHour := 0;

  { for g:= 0 to Length(semesters)-1 do
    begin
    for i:= 0 to 2 do
    semesters[g].auditorHour[i]:= 0;

    dm.qContentUchPlan.First;
    while not dm.qContentUchPlan.Eof do
    begin
    for i:= 0 to 2 do
    begin
    if (dm.qContentUchPlan.FieldByName('n_sem').AsInteger = semesters[g].number) and
    (dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger = auditorVZ[i]) then
    semesters[g].auditorHour[i]:= semesters[g].auditorHour[i] + dm.qContentUchPlan.FieldByName('i_hour_per_week').AsInteger;
    end;
    dm.qContentUchPlan.Next;
    end;
    LectHour:= LectHour + semesters[g].weekCount * semesters[g].auditorHour[0];
    LabHour:= LabHour + semesters[g].weekCount * semesters[g].auditorHour[1];
    PractHour:= PractHour + semesters[g].weekCount * semesters[g].auditorHour[2];
    end; }

  tempSL := TStringList.Create;
  for k := 0 to Length(arColumns) - 1 do
  begin
    case (arColumns[k].columnType) of
      3:
        begin
          dm.qContentUchPlan.first;
          tempStr := '';
          tempSL.Clear;
          while (not dm.qContentUchPlan.Eof) do
          begin
            if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
              .AsInteger = arColumns[k].VidZanyatIK) then
            begin
              if (KafedraColumn <> nil) then
              begin
                if (dm.qContentUchPlan.FieldByName('ik_kaf').value <> NULL) then
                  if (tempSL.IndexOf(dm.qContentUchPlan.FieldByName('ik_kaf')
                    .AsString) = -1) then
                    tempSL.Add(dm.qContentUchPlan.FieldByName('ik_kaf')
                      .AsString);
              end;
              tempStr := tempStr + dm.qContentUchPlan.FieldByName('n_sem')
                .AsString + ', ';
            end;
            dm.qContentUchPlan.Next;
          end;
          if (Length(tempStr) > 0) then
            Delete(tempStr, Length(tempStr) - 1, 2);
          ValuesColumn.Add(tempStr);
          if (KafedraColumn <> nil) then
            KafedraColumn^.Add(getValuesFromStringList(@tempSL, 'kafedra',
              'ik_kaf', 'cshort_name_kaf'));
        end;
      11:
        begin
          for g := 0 to Length(semesters) - 1 do
            if (arColumns[k].VidZanyatIK = semesters[g].number) then
            begin
              for i := 0 to 2 do
                semesters[g].auditorHour[i] := 0;

              tempStr := '';
              tempSL.Clear;

              dm.qContentUchPlan.first;
              while not dm.qContentUchPlan.Eof do
              begin
                for i := 0 to 2 do
                begin
                  if (dm.qContentUchPlan.FieldByName('n_sem')
                    .AsInteger = semesters[g].number) and
                    (dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
                    .AsInteger = auditorVZ[i]) then
                  begin
                    if semesters[g].auditorHour[i] <> 0 then
                      semesters[g].auditorHour[i] := -1
                    else
                      semesters[g].auditorHour[i] := semesters[g].auditorHour[i]
                        + dm.qContentUchPlan.FieldByName('i_hour_per_week')
                        .AsInteger;
                    if (dm.qContentUchPlan.FieldByName('ik_kaf').value <> NULL)
                    then
                    begin
                      if (tempSL.IndexOf(dm.qContentUchPlan.FieldByName
                        ('ik_kaf').AsString) = -1) then
                        tempSL.Add(dm.qContentUchPlan.FieldByName('ik_kaf')
                          .AsString);

                      if (i = 0) then
                        LectHour := LectHour + weekCountExceptionList.weekCount
                          [auditorVZ[i], semesters[g].number,
                          dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger] *
                          dm.qContentUchPlan.FieldByName('i_hour_per_week')
                          .AsInteger;
                      if (i = 1) then
                        LabHour := LabHour + weekCountExceptionList.weekCount
                          [auditorVZ[i], semesters[g].number,
                          dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger] *
                          dm.qContentUchPlan.FieldByName('i_hour_per_week')
                          .AsInteger;
                      if (i = 2) then
                        PractHour := PractHour +
                          weekCountExceptionList.weekCount[auditorVZ[i],
                          semesters[g].number,
                          dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger] *
                          dm.qContentUchPlan.FieldByName('i_hour_per_week')
                          .AsInteger;
                    end;
                  end;
                end;
                dm.qContentUchPlan.Next;
              end;
              { LectHour:= LectHour + semesters[g].weekCount * semesters[g].auditorHour[0];
                LabHour:= LabHour + semesters[g].weekCount * semesters[g].auditorHour[1];
                PractHour:= PractHour + semesters[g].weekCount * semesters[g].auditorHour[2]; }

              secTempStr := '';
              if semesters[g].auditorHour[0] = -1 then
                secTempStr := '??\'
              else
                secTempStr := IntToStr(semesters[g].auditorHour[0]) + '\';
              if semesters[g].auditorHour[1] = -1 then
                secTempStr := secTempStr + '??\'
              else
                secTempStr := secTempStr +
                  IntToStr(semesters[g].auditorHour[1]) + '\';
              if semesters[g].auditorHour[2] = -1 then
                secTempStr := secTempStr + '??'
              else
                secTempStr := secTempStr +
                  IntToStr(semesters[g].auditorHour[2]);
              ValuesColumn.Add(secTempStr);

              { if semesters[g].auditorHour[0] = -1 then ValuesColumn.Add('??') else
                ValuesColumn.Add(IntToStr(semesters[g].auditorHour[0]));
                if semesters[g].auditorHour[1] = -1 then ValuesColumn.Add('??') else
                ValuesColumn.Add(IntToStr(semesters[g].auditorHour[1]));
                if semesters[g].auditorHour[2] = -1 then ValuesColumn.Add('??') else
                ValuesColumn.Add(IntToStr(semesters[g].auditorHour[2])); }
              // IntToStr(semesters[g].auditorHour[0]) + '\' + IntToStr(semesters[g].auditorHour[1]) + '\' + IntToStr(semesters[g].auditorHour[2]));
              if (KafedraColumn <> nil) then
                KafedraColumn^.Add(getValuesFromStringList(@tempSL, 'kafedra',
                  'ik_kaf', 'cshort_name_kaf'));
              break;
            end;
        end;
    end;
  end;
  if not isAlreadyOpen then
    dm.qContentUchPlan.Close;
end;

function TUchPlanController.SaveDiscInUchPlan(UchPlanIK: integer;
  var DiscInUchPlanIK: integer; CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK,
  SpclzIK, GOSHour, IndividHour, GroupViborNum: integer; CodeGOS: string;
  aStrCompetenceList, DiscRelationList: TStringList): boolean;
{ aCompetenceList }
var
  DataSet: TADOStoredProc;
  tempDS: TADODataSet;
  i, n: integer;
  semKafList: TSemKafList;
begin
  // DataSet:= TGeneralController.Instance.GetNewADOStoredProc('UpdateDiscInUchPlan', false);
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  semKafList := TSemKafList.Create;
  dm.qContentUchPlan.Connection.BeginTrans;
  try
    with dm.aspUpdateDiscInPlan do
    begin
      Connection := dm.DBConnect;
      if DiscInUchPlanIK < 0 then
        Parameters.ParamByName('@i_type').value := 1
      else
        Parameters.ParamByName('@i_type').value := 2;
      Parameters.ParamByName('@ik_disc_uch_plan').value := DiscInUchPlanIK;
      Parameters.ParamByName('@ik_uch_plan').value := UchPlanIK;
      Parameters.ParamByName('@ik_disc').value := DiscIK;
      Parameters.ParamByName('@ik_default_kaf').value := KafedraIK;
      Parameters.ParamByName('@iHour_gos').value := GOSHour;
      Parameters.ParamByName('@iIndivid').value := IndividHour;
      Parameters.ParamByName('@ik_ckl_disc').value := CycleIK;
      Parameters.ParamByName('@ik_grp_disc').value := GroupIK;
      Parameters.ParamByName('@Cname_ckl_disc_gos').value := CodeGOS;
      Parameters.ParamByName('@ik_pdgrp_disc').value := PodGroupIK;
      Parameters.ParamByName('@ViborGroup').value := GroupViborNum;
      if SpclzIK = 0 then
        Parameters.ParamByName('@ik_spclz').value := NULL
      else Parameters.ParamByName('@ik_spclz').value := SpclzIK;
      ExecProc;
      DiscInUchPlanIK := Parameters.ParamByName('@RETURN_VALUE').value;
    end;

    // если новая дисциплина, то необходимо проставить id новой дисциплины всем видам занятий
    dm.qContentUchPlan.first;
    while (not dm.qContentUchPlan.Eof) do
    begin
      dm.qContentUchPlan.Edit;
      dm.qContentUchPlan.FieldByName('ik_disc_uch_plan').AsInteger :=
        DiscInUchPlanIK;
      dm.qContentUchPlan.Next;
    end;
    // if  then
    if vedomDelList.Count > 0 then
      for i := 0 to vedomDelList.Count - 1 do
        with dm.DelVedForContentDisc do
        begin
          Parameters.ParamByName('@ik_upContent').value :=
            StrToInt(vedomDelList[i]);
          ExecProc;
        end;

    dm.qContentUchPlan.UpdateBatch;

    // исключения по количеству недель
    tempDS.CommandText :=
      'SELECT * FROM UchPlan_WeekCount_Exception WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ')';
    tempDS.Open;
    while not tempDS.Eof do
      tempDS.Delete;
    if weekCountExceptionList.Count > 0 then
    begin
      dm.qContentUchPlan.Close;
      dm.qContentUchPlan.Open;
      for i := 0 to weekCountExceptionList.Count - 1 do
        if dm.qContentUchPlan.Locate('ik_vid_zanyat; n_sem; ik_kaf',
          VarArrayOf([weekCountExceptionList[i].VidZanyatIK,
          weekCountExceptionList[i].SemNumber, weekCountExceptionList[i].KafIK]
          ), [loPartialKey]) then
        begin
          tempDS.Insert;
          tempDS.FieldByName('ik_upContent').AsInteger :=
            dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger;
          tempDS.FieldByName('week_count').AsInteger :=
            weekCountExceptionList[i].Count;
          tempDS.Post;
        end;
    end;
    tempDS.UpdateBatch();
    if tempDS.Active then
      tempDS.Close;

    tempDS.CommandText :=
      'SELECT * FROM Vid_zanyat_with_several_tasks WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ')';
    tempDS.Open;
    while not tempDS.Eof do
      tempDS.Delete;

    dm.qContentUchPlan.first;
    while not dm.qContentUchPlan.Eof do
    begin
      n := semKafList.GetNextSemKafNumber
        (dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger,
        dm.qContentUchPlan.FieldByName('n_sem').AsInteger,
        dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger);
      n := vidZanyatTaskCountList.TaskCount
        [dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger,
        dm.qContentUchPlan.FieldByName('n_sem').AsInteger,
        dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger, n];
      if n > 1 then
      begin
        tempDS.Insert;
        tempDS.FieldByName('ik_upContent').AsInteger :=
          dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger;
        tempDS.FieldByName('tasks_count').AsInteger := n;
        tempDS.Post;
      end;
      dm.qContentUchPlan.Next;
    end;
    tempDS.UpdateBatch();
    if tempDS.Active then
      tempDS.Close;

    // структура компетенций
    tempDS.CommandText :=
      'select * from Struct_competence_sv_disc where ik_disc_uch_plan = ' +
      IntToStr(DiscInUchPlanIK);
    tempDS.Open;
    tempDS.first;
    while not tempDS.Eof do
    begin
      tempDS.Delete;
    end;
    for i := 0 to aStrCompetenceList.Count - 1 do
    begin
      tempDS.Insert;
      tempDS.FieldByName('ik_disc_uch_plan').value := DiscInUchPlanIK;
      tempDS.FieldByName('ik_structure_competence').value :=
        aStrCompetenceList[i];
      tempDS.Post;
    end;
    tempDS.UpdateBatch();
    if tempDS.Active then
      tempDS.Close;

    tempDS.CommandText :=
      'select * from sv_disc_relation where depends_on_ik = ' +
      IntToStr(DiscInUchPlanIK);
    tempDS.Open;
    tempDS.first;
    while not tempDS.Eof do
    begin
      tempDS.Delete;
    end;
    for i := 0 to DiscRelationList.Count - 1 do
    begin
      tempDS.Insert;
      tempDS.FieldByName('depends_on_ik').value := DiscInUchPlanIK;
      tempDS.FieldByName('base_for_ik').value := DiscRelationList[i];
      tempDS.Post;
    end;
    tempDS.UpdateBatch();
    if tempDS.Active then
      tempDS.Close;

    {
      tempDS.CommandText := 'select * from Competence_sv_disc where ik_disc_uch_plan = '+IntToStr(DiscInUchPlanIK);
      tempDS.Open;
      tempDS.First;
      while not tempDS.Eof do
      begin
      tempDS.Delete;
      end;
      for I := 0 to aCompetenceList.Count - 1 do
      begin
      tempDS.Insert;
      tempDS.FieldByName('ik_disc_uch_plan').Value := DiscInUchPlanIK;
      tempDS.FieldByName('ik_competence').Value := aCompetenceList[i];
      tempDS.Post;
      end;
      tempDS.UpdateBatch();
      if tempDS.Active then tempDS.Close;
    }

    dm.qContentUchPlan.Connection.CommitTrans;
    FreeAndNil(tempDS);
    FreeAndNil(semKafList);
  except
    on E: Exception do
    begin
      if tempDS.Active then
        tempDS.Close;
      dm.qContentUchPlan.Connection.RollbackTrans;
      FreeAndNil(tempDS);
      FreeAndNil(semKafList);
      raise EApplicationException.Create(E.Message);
    end;
  end;
  if dm.qContentUchPlan.Active then
    dm.qContentUchPlan.Close;
  Result := true;
end;

function TUchPlanController.getDiscInUchPlanIK(UchPlanIK,
  DiscIK: integer): integer;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandText := 'Select * From sv_disc Where (ik_uch_plan = ' +
    IntToStr(UchPlanIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ')';
  DataSet.Open;
  if (DataSet.FieldByName('ik_disc_uch_plan').value <> NULL) then
    Result := DataSet.FieldByName('ik_disc_uch_plan').AsInteger
  else
  begin
    // Result:= -1;
    raise Exception.Create
      ('В базе данных отсутствует запись со значением атрибутов ik_uch_plan = '
      + IntToStr(UchPlanIK) + 'и ik_disc = ' + IntToStr(DiscIK));
  end;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.CheckColumn(columnNumber: integer; value: string;
  DefaultKafedraIK: integer): boolean;
var
  i, g, n: integer;
  tempStr: string;
  IKList, TempIKList: TStringList;
  // removeKafedraIK:array of integer;
begin
  Result := false;
  try
    case (arColumns[columnNumber].columnType) of
      3:
        begin
          tempStr := '';
          if (not CheckSemesterString(value)) then
            exit;
          IKList := getStringListFromStr(value);
          // получаем номера семестров, которые только что ввели

          if (CheckForRepeat(arColumns[columnNumber].VidZanyatIK, IKList)) then
          begin
            FreeAndNil(IKList);
            Application.MessageBox
              ('Данный вид занятий не может проводиться дважды в одном семестре...',
              'Изменение информации по виду занятий', MB_ICONERROR);
            exit;
          end;

          TempIKList := TStringList.Create;
          dm.qContentUchPlan.first;
          // прочитаем семестры которые есть в таблице по данному виду занятий
          while (not dm.qContentUchPlan.Eof) do
          begin
            if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
              .AsInteger = arColumns[columnNumber].VidZanyatIK) then
              TempIKList.Add(dm.qContentUchPlan.FieldByName('n_sem').AsString);
            dm.qContentUchPlan.Next;
          end;

          if (not isListEqual(IKList, TempIKList)) then
          begin
            if (IKList.Count > 0) then
            begin
              i := 0;
              while (i <= IKList.Count - 1) do
              begin
                n := TempIKList.IndexOf(IKList[i]);
                if n >= 0 then
                begin
                  IKList.Delete(i);
                  TempIKList.Delete(n);
                end
                else
                  inc(i);
              end;
              IKList.Sort;
              TempIKList.Sort;
              while (IKList.Count <> 0) and (TempIKList.Count <> 0) do
              begin
                if dm.qContentUchPlan.Locate('iK_vid_zanyat; n_sem',
                  VarArrayOf([arColumns[columnNumber].VidZanyatIK,
                  TempIKList[0]]), [loPartialKey]) then
                begin
                  dm.qContentUchPlan.Edit;
                  dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value :=
                    arColumns[columnNumber].VidZanyatIK;
                  dm.qContentUchPlan.FieldByName('n_sem').value := IKList[0];
                  dm.qContentUchPlan.Post;
                  IKList.Delete(0);
                  TempIKList.Delete(0);
                end;
              end;

              if TempIKList.Count > 0 then
                for i := 0 to TempIKList.Count - 1 do
                  if dm.qContentUchPlan.Locate('iK_vid_zanyat; n_sem',
                    VarArrayOf([arColumns[columnNumber].VidZanyatIK,
                    TempIKList[0]]), [loPartialKey]) then
                    dm.qContentUchPlan.Delete;
              if IKList.Count > 0 then
                for i := 0 to IKList.Count - 1 do
                begin
                  dm.qContentUchPlan.Insert;
                  dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value :=
                    arColumns[columnNumber].VidZanyatIK;
                  dm.qContentUchPlan.FieldByName('n_sem').value := IKList[i];
                  dm.qContentUchPlan.FieldByName('ik_kaf').value :=
                    DefaultKafedraIK;
                  dm.qContentUchPlan.Post;
                end;

              // ------------ изменить этот участок кода

              { dm.qContentUchPlan.First;
                TempIKList.Clear;
                while (not dm.qContentUchPlan.Eof) do
                begin
                if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat').AsInteger = arColumns[columnNumber].vidZanyatIK) then
                begin
                n:= IKList.IndexOf(dm.qContentUchPlan.FieldByName('n_sem').AsString);
                if (n < 0) then
                begin
                if dm.qContentUchPlan.RecNo = dm.qContentUchPlan.RecordCount then
                begin
                dm.qContentUchPlan.Delete;
                break;
                end
                else dm.qContentUchPlan.Delete;
                end
                else
                begin
                IKList.Delete(n);
                dm.qContentUchPlan.Next;
                end;
                end
                else dm.qContentUchPlan.Next;
                end;
                dm.qContentUchPlan.First;
                for g:= 0 to IKList.Count-1 do
                begin
                dm.qContentUchPlan.Insert;
                dm.qContentUchPlan.FieldByName('iK_vid_zanyat').Value:= arColumns[columnNumber].vidZanyatIK;
                dm.qContentUchPlan.FieldByName('n_sem').Value:= IKList[g];
                dm.qContentUchPlan.FieldByName('ik_kaf').Value:= DefaultKafedraIK;
                end; }

              // -------------- конец участка

            end
            else // конец IKList.Count > 0, т.е. только что введенный список пуст
            begin
              dm.qContentUchPlan.first;
              while (not dm.qContentUchPlan.Eof) do
              begin
                if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
                  .AsInteger = arColumns[columnNumber].VidZanyatIK) then
                  dm.qContentUchPlan.Delete
                else
                  dm.qContentUchPlan.Next;
              end;
            end;
            FreeAndNil(IKList);
            FreeAndNil(TempIKList);
          end;
        end; // конец arColumns[columnNumber].columnType of 3
      11:
        begin
          value := StringReplace(value, ' ', '0', [rfReplaceAll]);
          if (not isAuditorCorrect(value)) then
            exit;

          for g := 0 to Length(semesters) - 1 do
            if (arColumns[columnNumber].VidZanyatIK = semesters[g].number) then
            begin
              tempStr := '';
              for i := 0 to 2 do
                if dm.qContentUchPlan.Locate('n_sem; iK_vid_zanyat',
                  VarArrayOf([semesters[g].number, auditorVZ[i]]),
                  [loPartialKey]) then
                begin
                  if dm.qContentUchPlan.FieldByName('i_hour_per_week').AsInteger
                    >= 10 then
                    tempStr := tempStr + dm.qContentUchPlan.FieldByName
                      ('i_hour_per_week').AsString + '\'
                  else
                    tempStr := tempStr + '0' + dm.qContentUchPlan.FieldByName
                      ('i_hour_per_week').AsString + '\';
                end
                else
                  tempStr := tempStr + '00\';
              if (Length(tempStr) > 0) then
                Delete(tempStr, Length(tempStr), 1);
              if (CompareStr(tempStr, value) <> 0) then
              begin
                IKList := getStringListFromStr(value);
                if (IKList.Count > 0) then
                begin
                  // SetLength(removeKafedraIK, IKList.Count);
                  // for i:= 0 to IKList.Count-1 do
                  // removeKafedraIK[i]:= -1;
                  dm.qContentUchPlan.first;
                  for i := 0 to 2 do
                    if dm.qContentUchPlan.Locate('n_sem; iK_vid_zanyat',
                      VarArrayOf([semesters[g].number, auditorVZ[i]]),
                      [loPartialKey]) then
                    begin
                      // if (dm.qContentUchPlan.FieldByName('ik_kaf').Value <> NULL) then
                      // removeKafedraIK[i]:= dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger;
                      if ((IKList[i] <> '0') and (IKList[i] <> '00')) then
                      begin
                        dm.qContentUchPlan.Edit;
                        dm.qContentUchPlan.FieldByName('i_hour_per_week').value
                          := IKList[i];
                        dm.qContentUchPlan.Post;
                      end
                      else
                        dm.qContentUchPlan.Delete;
                    end
                    else
                    begin
                      if ((IKList[i] <> '0') and (IKList[i] <> '00')) then
                      begin
                        dm.qContentUchPlan.Insert;
                        dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value :=
                          auditorVZ[i];
                        dm.qContentUchPlan.FieldByName('i_hour_per_week').value
                          := IKList[i];
                        dm.qContentUchPlan.FieldByName('n_sem').value :=
                          semesters[g].number;
                        dm.qContentUchPlan.FieldByName('ik_kaf').value :=
                          DefaultKafedraIK;
                        dm.qContentUchPlan.Post;
                      end;
                    end;

                  { for i:= 0 to 2 do
                    begin
                    if ((IKList[i] <> '0') and (IKList[i] <> '00')) then
                    begin
                    dm.qContentUchPlan.Insert;
                    dm.qContentUchPlan.FieldByName('iK_vid_zanyat').Value:= auditorVZ[i];
                    dm.qContentUchPlan.FieldByName('i_hour_per_week').Value:= IKList[i];
                    dm.qContentUchPlan.FieldByName('n_sem').Value:= semesters[g].number;
                    if (removeKafedraIK[i] = -1) then
                    dm.qContentUchPlan.FieldByName('ik_kaf').Value:= DefaultKafedraIK
                    else dm.qContentUchPlan.FieldByName('ik_kaf').Value:= removeKafedraIK[i];
                    end;
                    end; }
                end; // конец IKList.Count > 0
                FreeAndNil(IKList);
              end; // конец CompareStr(tempStr, value) <> 0
            end; // конец StrToInt(arColumns[columnNumber].vidZanyatIK) = semesters[g].number
        end; // конец  arColumns[columnNumber].columnType of 4
    end; // конец case
  except
    if Assigned(IKList) then
      FreeAndNil(IKList);
    if Assigned(TempIKList) then
      FreeAndNil(TempIKList);
    raise;
  end;
  Result := true;
end;

function TUchPlanController.getColumnType(columnNumber: integer): integer;
begin
  Result := arColumns[columnNumber].columnType;
end;

function TUchPlanController.GetCompetences(DiscInUchPlanIK: integer): string;
var
  tempDS: TADODataSet;
begin
  Result := '';
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  { tempDS.CommandText := 'select C.ik_competence, short_Name from Competence C, Competence_sv_disc Csd where C.ik_competence = Csd.ik_competence'+
    ' and ik_disc_uch_plan = ' +  IntToStr(DiscInUchPlanIK); }

  tempDS.CommandText := 'select distinct S.ik_competence, short_Name from' +
    ' Structure_competence S inner join Struct_competence_sv_disc Scd' +
    ' on S.ik_structure_competence=Scd.ik_structure_competence' +
    ' inner join Competence C on S.ik_competence=C.ik_competence' +
    ' where Scd.ik_disc_uch_plan =' + IntToStr(DiscInUchPlanIK);

  tempDS.Open;
  tempDS.first;
  while not tempDS.Eof do
  begin
    if Result <> '' then
      Result := Result + ', ';
    Result := Result + tempDS.FieldByName('short_Name').AsString;
    tempDS.Next;
  end;
end;

function TUchPlanController.GetConsultationPercent: double;
var
  tempDS: TADODataSet;
begin
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText :=
      'SELECT CONVERT(float, ISNULL(constant_value, 5)) as Cons_percent FROM Nagruzka_constant WHERE ik_constant = 1';
    tempDS.Open;
    Result := tempDS.FieldByName('Cons_percent').AsFloat / 100;
    tempDS.Close;
  finally
    tempDS.Free;
  end;
end;

function TUchPlanController.getColumnParamKey(columnNumber: integer): integer;
begin
  Result := arColumns[columnNumber].VidZanyatIK;
end;

procedure TUchPlanController.CloseUchPlanContent;
begin
  if (dm.qContentUchPlan.Active) then
    dm.qContentUchPlan.Close;
end;

function TUchPlanController.SaveAuditorVZ(Semester,
  DefaultKaf: integer): boolean;
var
  i: byte;
  isLastDelete: boolean;
begin
  try
    dm.qContentUchPlan.first;
    while (not dm.qContentUchPlan.Eof) do
    begin
      if (dm.qContentUchPlan.FieldByName('n_sem').AsInteger <> Semester) then
      begin
        dm.qContentUchPlan.Next;
        continue;
      end;
      isLastDelete := false;
      for i := 0 to 2 do
        if (dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
          .AsInteger = auditorVZ[i]) then
        begin
          if not dm.adsAuditorVZ.Locate('ik_vid_zanyat; ik_kaf',
            VarArrayOf([auditorVZ[i], dm.qContentUchPlan.FieldByName('ik_kaf')
            .AsInteger]), [loPartialKey]) then
          begin
            isLastDelete := true;
            dm.qContentUchPlan.Delete;
          end
          else
            isLastDelete := false;
        end
        else
          isLastDelete := false;
      if not isLastDelete then
        dm.qContentUchPlan.Next;
    end;
    weekCountExceptionList.ClearListForSemester(Semester);
    dm.adsAuditorVZ.first;
    while (not dm.adsAuditorVZ.Eof) do
    begin
      if dm.adsAuditorVZ.FieldByName('ik_vid_zanyat').value = NULL then
      begin
        dm.adsAuditorVZ.Next;
        continue;
      end;
      if (dm.adsAuditorVZ.FieldByName('i_hour_per_week').value = NULL) then
      begin
        MessageBox(FMessageHandle,
          'Необходимо указать количество часов в неделю по всем видам занятий!',
          'Проверка корректности значений', MB_ICONWARNING);
        Result := false;
        exit;
      end;

      if dm.adsAuditorVZ.FieldByName('i_hour_per_week').AsInteger = 0 then
      begin
        MessageBox(FMessageHandle,
          'Необходимо указать количество часов в неделю по всем видам занятий!',
          'Проверка корректности значений', MB_ICONWARNING);
        Result := false;
        exit;
      end;

      if (dm.adsAuditorVZ.FieldByName('week_count').value = NULL) then
      begin
        MessageBox(FMessageHandle,
          'Необходимо указать количество недель по всем видам занятий для каждой кафедры!',
          'Проверка корректности значений', MB_ICONWARNING);
        Result := false;
        exit;
      end;

      if (dm.adsAuditorVZ.FieldByName('week_count').AsInteger = 0) then
      begin
        MessageBox(FMessageHandle,
          'Необходимо указать количество недель по всем видам занятий для каждой кафедры!',
          'Проверка корректности значений', MB_ICONWARNING);
        Result := false;
        exit;
      end
      else
      begin
        if (dm.adsAuditorVZ.FieldByName('week_count').AsInteger >
          GetDefaultSemesterWeekCount(Semester)) then
        begin
          MessageBox(FMessageHandle,
            'Значение в столбце "Количество недель" не может быть больше, чем количество недель, указанное в параметрах учебного плана для данного семестра!',
            'Проверка корректности значений', MB_ICONWARNING);
          Result := false;
          exit;
        end;
      end;
      if (dm.adsAuditorVZ.FieldByName('ik_kaf').value = NULL) then
      begin
        dm.adsAuditorVZ.Edit;
        dm.adsAuditorVZ.FieldByName('ik_kaf').value := DefaultKaf;
        dm.adsAuditorVZ.Post;
      end;
      if dm.qContentUchPlan.Locate('ik_vid_zanyat; ik_kaf; n_sem',
        VarArrayOf([dm.adsAuditorVZ.FieldByName('ik_vid_zanyat').AsInteger,
        dm.adsAuditorVZ.FieldByName('ik_kaf').AsInteger, Semester]),
        [loPartialKey]) then
      begin
        dm.qContentUchPlan.Edit;
        dm.qContentUchPlan.FieldByName('i_hour_per_week').value :=
          dm.adsAuditorVZ.FieldByName('i_hour_per_week').AsInteger;
      end
      else
      begin
        dm.qContentUchPlan.Insert;
        dm.qContentUchPlan.FieldByName('n_sem').value := Semester;
        dm.qContentUchPlan.FieldByName('ik_vid_zanyat').value :=
          dm.adsAuditorVZ.FieldByName('ik_vid_zanyat').value;
        dm.qContentUchPlan.FieldByName('i_hour_per_week').value :=
          dm.adsAuditorVZ.FieldByName('i_hour_per_week').value;
        dm.qContentUchPlan.FieldByName('ik_kaf').value :=
          dm.adsAuditorVZ.FieldByName('ik_kaf').value;
      end;
      dm.qContentUchPlan.FieldByName('n_module').value :=
        dm.adsAuditorVZ.FieldByName('n_module').value;
      dm.qContentUchPlan.FieldByName('i_balls').value :=
        dm.adsAuditorVZ.FieldByName('i_balls').value;

      dm.qContentUchPlan.Post;
      if (dm.adsAuditorVZ.FieldByName('week_count').AsInteger <>
        GetDefaultSemesterWeekCount(Semester)) then
        weekCountExceptionList.Add
          (TVidZanyatException.Create(dm.adsAuditorVZ.FieldByName
          ('ik_vid_zanyat').AsInteger, Semester,
          dm.adsAuditorVZ.FieldByName('ik_kaf').AsInteger, 1,
          dm.adsAuditorVZ.FieldByName('week_count').AsInteger));
      dm.adsAuditorVZ.Next;
    end;
    Result := true;
  except
    raise;
  end;
end;

function TUchPlanController.LoadAuditorVZ(DiscUchPlanIK, Semester: integer)
  : TDataSet;
var
  i: integer;
  tempStr: string;
begin
  tempStr := '(';
  for i := 0 to 2 do
  begin
    tempStr := tempStr + IntToStr(auditorVZ[i]);
    if i <> 2 then
      tempStr := tempStr + ', '
    else
      tempStr := tempStr + ')';
  end;
  if dm.adsVidZanyat.Active then
    dm.adsVidZanyat.Close;
  dm.adsVidZanyat.CommandText :=
    'SELECT * FROM vid_zaniat WHERE ik_vid_zanyat in ' + tempStr;
  if dm.adsAuditorVZ.Active then
    dm.adsAuditorVZ.Close;
  dm.adsAuditorVZ.CommandText :=
    'SELECT ik_vid_zanyat, ik_kaf, i_hour_per_week, week_count, n_module, i_balls FROM Content_UchPl LEFT JOIN UchPlan_WeekCount_Exception upwce ON Content_UchPl.ik_upContent = upwce.ik_upContent WHERE (ik_disc_uch_plan = '
    + IntToStr(DiscUchPlanIK) + ') and (ik_vid_zanyat in ' + tempStr +
    ') and (n_sem = ' + IntToStr(Semester) + ')';
  dm.adsAuditorVZ.Open;
  while not dm.adsAuditorVZ.Eof do
    dm.adsAuditorVZ.Delete;
  dm.qContentUchPlan.first;
  while not dm.qContentUchPlan.Eof do
  begin
    for i := 0 to 2 do
    begin
      if (dm.qContentUchPlan.FieldByName('n_sem').AsInteger = Semester) and
        (dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
        .AsInteger = auditorVZ[i]) then
      begin
        dm.adsAuditorVZ.Insert;
        dm.adsAuditorVZ.FieldByName('ik_vid_zanyat').value := auditorVZ[i];
        dm.adsAuditorVZ.FieldByName('ik_kaf').value :=
          dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger;
        dm.adsAuditorVZ.FieldByName('i_hour_per_week').value :=
          dm.qContentUchPlan.FieldByName('i_hour_per_week').AsInteger;
        dm.adsAuditorVZ.FieldByName('n_module').value :=
          dm.qContentUchPlan.FieldByName('n_module').value;
        dm.adsAuditorVZ.FieldByName('i_balls').value :=
          dm.qContentUchPlan.FieldByName('i_balls').value;

        if Assigned(weekCountExceptionList) then
          dm.adsAuditorVZ.FieldByName('week_count').value :=
            weekCountExceptionList.weekCount[auditorVZ[i], Semester,
            dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger];
        dm.adsAuditorVZ.Post;
      end;
    end;
    dm.qContentUchPlan.Next;
  end;
  Result := dm.adsAuditorVZ;
end;

function TUchPlanController.LoadControlVZ(DiscInUchPlanIK, VidZanyatIK: integer)
  : TDataSet;
var
  semKafList: TSemKafList;
begin
  semKafList := TSemKafList.Create;
  try
    if (dm.adsContentVZ.Active) then
      dm.adsContentVZ.Close;
    if (dm.adsKafedra.Active) then
      dm.adsKafedra.Close;
    if (dm.adsSemester.Active) then
      dm.adsSemester.Close;

    dm.adsKafedra.Open;
    dm.adsSemester.Open;
    dm.adsContentVZ.CommandText :=
      'Select ik_kaf, n_sem, tasks_count, n_module, i_balls From Content_UchPl LEFT JOIN Vid_zanyat_with_several_tasks vzst ON Content_UchPl.ik_upContent = vzst.ik_upContent Where ((ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ') and (ik_vid_zanyat = ' +
      IntToStr(VidZanyatIK) + '))';
    dm.adsContentVZ.Open;
    dm.adsContentVZ.DisableControls;
    dm.adsContentVZ.first;
    while (not dm.adsContentVZ.Eof) do
      dm.adsContentVZ.Delete;

    dm.qContentUchPlan.first;
    while (not dm.qContentUchPlan.Eof) do
    begin
      if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
        .AsInteger = VidZanyatIK) then
      begin
        dm.adsContentVZ.Insert;
        dm.adsContentVZ.FieldByName('n_sem').value :=
          dm.qContentUchPlan.FieldByName('n_sem').value;
        dm.adsContentVZ.FieldByName('ik_kaf').value :=
          dm.qContentUchPlan.FieldByName('ik_kaf').value;
        dm.adsContentVZ.FieldByName('n_module').value :=
          dm.qContentUchPlan.FieldByName('n_module').value;
        dm.adsContentVZ.FieldByName('i_balls').value :=
          dm.qContentUchPlan.FieldByName('i_balls').value;

        if Assigned(vidZanyatTaskCountList) then
          dm.adsContentVZ.FieldByName('tasks_count').value :=
            vidZanyatTaskCountList.TaskCount[VidZanyatIK,
            dm.qContentUchPlan.FieldByName('n_sem').AsInteger,
            dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger,
            semKafList.GetNextSemKafNumber(VidZanyatIK,
            dm.qContentUchPlan.FieldByName('n_sem').AsInteger,
            dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger)];
        dm.adsContentVZ.Post;
      end;
      dm.qContentUchPlan.Next;
    end;
    Result := dm.adsContentVZ;

  finally
    dm.adsContentVZ.EnableControls;
    FreeAndNil(semKafList);
  end;
end;

function TUchPlanController.SaveControlVZ(aDiscUPIK,
  VidZanyatIK: integer): boolean;
var
  tempDS: TADODataSet;
  // *newContentList, oldContentList: TContentDiscUnits;
  TempIKList, IKList, ModuleIkList: TStringList; // IKList - лист семестров
  i, n, n_module: integer; // ModuleIkList - лист модулей
  semKafList: TSemKafList;
  canDel: boolean;
begin

  IKList := TStringList.Create;
  TempIKList := TStringList.Create;

  semKafList := TSemKafList.Create;
  dm.adsContentVZ.DisableControls;
  ModuleIkList := TStringList.Create; // модули

  try
    canDel := false;
    dm.adsContentVZ.first;
    while (not dm.adsContentVZ.Eof) do
      with dm.adsContentVZ do
      begin
        // проверки на полноту информации
        if (FieldByName('tasks_count').value = NULL) then
        begin
          Application.MessageBox
            ('Необходимо указать количество заданий для всех записей. Если данный вид занятий не подразумевает деление на несколько заданий, то укажите 1.',
            'Изменение информации по виду занятий', MB_ICONERROR);
          exit;
        end;
        if (FieldByName('tasks_count').AsInteger = 0) then
        begin
          Application.MessageBox
            ('Значение в столбце "Количество заданий" не может быть равно 0. Если данный вид занятий не подразумевает деление на несколько заданий, то укажите 1.',
            'Изменение информации по виду занятий', MB_ICONERROR);
          exit;
        end;

        // сбор данных по семестрам и модулям в листы  (как стало)
        if (FieldByName('n_module').value <> NULL) and
          (FieldByName('n_module').AsString <> '') then
          n_module := FieldByName('n_module').AsInteger
        else
          n_module := 0;

        IKList.Add(dm.adsContentVZ.FieldByName('n_sem').AsString);

        if (dm.adsContentVZ.FieldByName('n_module').value <> NULL) and
          (dm.adsContentVZ.FieldByName('n_module').AsString <> '') then
          ModuleIkList.Add(dm.adsContentVZ.FieldByName('n_module').AsString)
        else
          ModuleIkList.Add('null');
        Next;
      end;

    // проверка на повторы экзаменов и зачетов
    if (CheckForRepeat(VidZanyatIK, IKList { *newContentList* } )) then
    begin
      dm.adsContentVZ.EnableControls;
      Result := false;
      // FreeAndNil(newSemList);
      FreeAndNil(IKList);
      FreeAndNil(TempIKList);
      FreeAndNil(semKafList);

      // *newContentList.Clear;
      // *newContentList.Free;
      Application.MessageBox
        ('Данный вид занятий не может проводиться дважды в одном семестре...',
        'Изменение информации по виду занятий', MB_ICONERROR);
      exit;
    end;

    // собрать данные по видам занятий с несколькими заданиями
    vidZanyatTaskCountList.ClearListForVidZnayat(VidZanyatIK);
    dm.adsContentVZ.first;
    while (not dm.adsContentVZ.Eof) do
    begin
      n := semKafList.GetNextSemKafNumber(VidZanyatIK,
        dm.adsContentVZ.FieldByName('n_sem').AsInteger,
        dm.adsContentVZ.FieldByName('ik_kaf').AsInteger);
      if dm.adsContentVZ.FieldByName('tasks_count').AsInteger <> 1 then
        vidZanyatTaskCountList.AddTaskRecord(VidZanyatIK,
          dm.adsContentVZ.FieldByName('n_sem').AsInteger,
          dm.adsContentVZ.FieldByName('ik_kaf').AsInteger, n,
          dm.adsContentVZ.FieldByName('tasks_count').AsInteger);
      dm.adsContentVZ.Next;
    end;
    // FreeAndNil(semKafList);

    // --TempIKList:= TStringList.Create;
    dm.qContentUchPlan.first; // прочитаем семестры которые есть в таблице
    // по данному виду занятий (как было)
    while (not dm.qContentUchPlan.Eof) do
    begin
      if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
        .AsInteger = VidZanyatIK) then
      begin
        // temp oldContentIKList.Add(dm.qContentUchPlan.FieldByName('n_sem').AsString);
        TempIKList.Add(dm.qContentUchPlan.FieldByName('n_sem').AsString)
      end;
      dm.qContentUchPlan.Next;
    end;

    // редактирование уже существующих
    { * n := 0;
      repeat
      if dm.qContentUchPlan.Locate('ik_upContent', newContentIKList[n], [loPartialKey]) then
      begin

      dm.qContentUchPlan.Edit;
      dm.qContentUchPlan.FieldByName('iK_vid_zanyat').Value:= vidZanyatIK;
      dm.qContentUchPlan.FieldByName('n_sem').Value:= newSemList[n];

      dm.adsContentVZ.Locate('ik_upContent', newContentIKList[n], [loPartialKey]);

      dm.qContentUchPlan.FieldByName('ik_kaf').Value:= dm.adsContentVZ.FieldByName('ik_kaf').Value;
      dm.qContentUchPlan.FieldByName('n_module').Value:= dm.adsContentVZ.FieldByName('n_module').Value;
      dm.qContentUchPlan.FieldByName('i_balls').Value:= dm.adsContentVZ.FieldByName('i_balls').Value;
      dm.qContentUchPlan.Post;
      oldContentIKList.Delete(oldContentIKList.IndexOf(newContentIKList[n]));
      newContentIKList.Delete(n);
      newSemList.Delete(n);
      end else n:= n+1;
      until n=newContentIKList.Count;    * }

    // если семестры данного вида занятий не совпадают с теми, что были
    if (not isListEqual(IKList, TempIKList)) then
    begin
      // если еще остались хоть какие-то занятия
      if (IKList.Count > 0) then
      begin
        i := 0;
        while (i <= IKList.Count - 1) do
        begin
          // если в обоих списках есть
          n := TempIKList.IndexOf(IKList[i]);
          if n >= 0 then
          begin
            // чистим совпадения
            IKList.Delete(i);
            ModuleIkList.Delete(i);
            TempIKList.Delete(n);
            // TempContentIKList.Delete(n);
          end
          else
            inc(i);
        end;
        if TempIKList.Count > 0 then // начинаем править несовпадения
        begin
          IKList.Sort;
          TempIKList.Sort;
          while (IKList.Count <> 0) and (TempIKList.Count <> 0) do
          begin
            if dm.qContentUchPlan.Locate('iK_vid_zanyat; n_sem',
              VarArrayOf([VidZanyatIK, TempIKList[0]]), [loPartialKey]) then
            begin
              dm.qContentUchPlan.Edit;
              dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value :=
                VidZanyatIK;
              dm.qContentUchPlan.FieldByName('n_sem').value := IKList[0];
              if dm.adsContentVZ.Locate('n_sem', IKList[0], [loPartialKey]) then
                dm.qContentUchPlan.FieldByName('ik_kaf').value :=
                  dm.adsContentVZ.FieldByName('ik_kaf').value;
              dm.qContentUchPlan.FieldByName('n_module').value :=
                dm.adsContentVZ.FieldByName('n_module').value;
              dm.qContentUchPlan.FieldByName('i_balls').value :=
                dm.adsContentVZ.FieldByName('i_balls').value;
              dm.qContentUchPlan.Post;
              IKList.Delete(0);
              TempIKList.Delete(0);
            end;
          end;
          if TempIKList.Count > 0 then
          // если были удалены какие-то виды и занятия
            for i := 0 to TempIKList.Count - 1 do
              if dm.qContentUchPlan.Locate('iK_vid_zanyat; n_sem',
                VarArrayOf([VidZanyatIK, TempIKList[i]]), [loPartialKey]) then
              begin
                // если существуют ведомости для данного вида занятий
                if dm.qVedomostForContent.Locate('ik_upContent',
                  dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger,
                  [loPartialKey]) then
                begin
                  if canDel or
                    (MessageDlg
                    ('Будут удалены ведомости по данной дисциплине. Продолжить?',
                    mtConfirmation, mbYesNoCancel, 0) = mrYes) then
                  begin
                    canDel := true;
                    vedomDelList.Add
                      (dm.qContentUchPlan.FieldByName('ik_upContent').AsString);
                    // with dm.DelVedForContentDisc do
                    // begin
                    // Parameters.ParamByName('@ik_upContent').Value := dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger;
                    // Open;
                    // end;
                    dm.qContentUchPlan.Delete;
                  end;
                end
                else
                  dm.qContentUchPlan.Delete;
              end;
        end;
        if IKList.Count > 0 then
          for i := 0 to IKList.Count - 1 do
          begin
            dm.qContentUchPlan.Insert;
            dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value :=
              VidZanyatIK;
            dm.qContentUchPlan.FieldByName('n_sem').value := IKList[i];
            if ModuleIkList[i] <> 'null' then
            begin
              if dm.adsContentVZ.Locate('n_sem; n_module',
                VarArrayOf([IKList[i], ModuleIkList[i]]), [loPartialKey]) then
              begin
                dm.qContentUchPlan.FieldByName('ik_kaf').value :=
                  dm.adsContentVZ.FieldByName('ik_kaf').value;
                dm.qContentUchPlan.FieldByName('n_module').value :=
                  dm.adsContentVZ.FieldByName('n_module').value;
                dm.qContentUchPlan.FieldByName('i_balls').value :=
                  dm.adsContentVZ.FieldByName('i_balls').value;
              end;
            end
            else if dm.adsContentVZ.Locate('n_sem', IKList[i], [loPartialKey])
            then
            begin
              dm.qContentUchPlan.FieldByName('ik_kaf').value :=
                dm.adsContentVZ.FieldByName('ik_kaf').value;
              dm.qContentUchPlan.FieldByName('n_module').value :=
                dm.adsContentVZ.FieldByName('n_module').value;
              dm.qContentUchPlan.FieldByName('i_balls').value :=
                dm.adsContentVZ.FieldByName('i_balls').value;
            end;

            dm.qContentUchPlan.Post;
          end;
      end
      else // конец IKList.Count > 0, т.е. только что введенный список пуст
      begin
        dm.qContentUchPlan.first;
        while (not dm.qContentUchPlan.Eof) do
        begin
          if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
            .AsInteger = VidZanyatIK) then

            if dm.qVedomostForContent.Locate('ik_upContent',
              dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger,
              [loPartialKey]) then
            begin
              if canDel or
                (MessageDlg
                ('Будут удалены ведомости по данной дисциплине. Продолжить?',
                mtConfirmation, mbYesNoCancel, 0) = mrYes) then
              begin
                canDel := true;
                vedomDelList.Add(dm.qContentUchPlan.FieldByName('ik_upContent')
                  .AsString);
                // with dm.DelVedForContentDisc do
                // begin
                // Parameters.ParamByName('@ik_upContent').Value := dm.qContentUchPlan.FieldByName('ik_upContent').AsInteger;
                // Open;
                // end;
                dm.qContentUchPlan.Delete;
              end;
            end
            else
              dm.qContentUchPlan.Delete

          else
            dm.qContentUchPlan.Next;
        end;
      end;
      Result := true;
      // FreeAndNil(IKList);
      // FreeAndNil(TempIKList);
    end // конец not IsListEqual
    else
    begin
      TempIKList.Clear;
      dm.qContentUchPlan.first;
      while (not dm.qContentUchPlan.Eof) do
      begin
        if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat')
          .AsInteger = VidZanyatIK) then
        begin
          dm.adsContentVZ.first;
          while not dm.adsContentVZ.Eof do
          begin
            if (dm.adsContentVZ.FieldByName('n_sem')
              .AsInteger = dm.qContentUchPlan.FieldByName('n_sem').AsInteger)
              and (TempIKList.IndexOf(IntToStr(dm.adsContentVZ.RecNo)) < 0) then
            begin
              dm.qContentUchPlan.Edit;
              dm.qContentUchPlan.FieldByName('ik_kaf').AsInteger :=
                dm.adsContentVZ.FieldByName('ik_kaf').AsInteger;
              dm.qContentUchPlan.FieldByName('n_module').value :=
                dm.adsContentVZ.FieldByName('n_module').value;
              dm.qContentUchPlan.FieldByName('i_balls').value :=
                dm.adsContentVZ.FieldByName('i_balls').value;

              dm.qContentUchPlan.Post;
              TempIKList.Add(IntToStr(dm.adsContentVZ.RecNo));
              break;
            end;
            dm.adsContentVZ.Next;
          end;
        end;
        dm.qContentUchPlan.Next;
      end;
      Result := true;
    end;
    // dm.adsContentVZ.EnableControls;

    { dm.qContentUchPlan.First;
      while (not dm.qContentUchPlan.Eof) do
      begin
      if (dm.qContentUchPlan.FieldByName('iK_vid_zanyat').AsInteger = vidZanyatIK) then
      dm.qContentUchPlan.Delete
      else dm.qContentUchPlan.Next;
      end;
      dm.adsContentVZ.First;
      while (not dm.adsContentVZ.Eof) do
      begin
      dm.qContentUchPlan.Insert;
      dm.qContentUchPlan.FieldByName('ik_vid_zanyat').Value:= VidZanyatIK;
      dm.qContentUchPlan.FieldByName('n_sem').Value:= dm.adsContentVZ.FieldByName('n_sem').Value;
      dm.qContentUchPlan.FieldByName('ik_kaf').Value:= dm.adsContentVZ.FieldByName('ik_kaf').Value;
      dm.adsContentVZ.Next;
      end;
      dm.adsContentVZ.EnableControls;
      Result:= true; }
  finally
    dm.adsContentVZ.EnableControls;
    if Assigned(IKList) then
      FreeAndNil(IKList);
    if Assigned(TempIKList) then
      FreeAndNil(TempIKList);
    if Assigned(semKafList) then
      FreeAndNil(semKafList);
  end;
end;

procedure TUchPlanController.LoadSelection(UchPlanIK, KafIK: integer;
  SemesterStr: string; ProgressBar: PProgressBar; SemLengthDataSet: PDataSet);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  CycleRow, GroupRow, RowInCycle, RowInGroup: integer;
  CycleDataSet, GroupDataSet, DiscDataSet, SemDataSet, CompetDataSet,
    FgosDataSet: TADODataSet;
  lect, lab, pract, i, j, k, year_count, sem_ind, no_aud, ZE, cklZE, grpZE,
    allZE: integer;
  slColumnValues, slKafedraList: TStringList;
  tempSL, tempCSL: TStringList;
  tempStr: string;
const
  rimChisl: array [0 .. 5] of string = ('I', 'II', 'III', 'IV', 'V', 'VI');
  SemContent: array [0 .. 2] of string = ('Лекции', 'Лабораторные',
    'Практические');
  semCols: array [1 .. 52] of string = ('T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA',
    'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM',
    'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY',
    'AZ', 'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BK',
    'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS');
  semCols2: array [1 .. 8] of string = ('D', 'E', 'F', 'G', 'H', 'I', 'J', 'K');
  semCols3: array [1 .. 7] of string = ('M', 'N', 'O', 'P', 'Q', 'R', 'S');
begin
  try
    tempSL := TStringList.Create;
    tempCSL := TStringList.Create;
    DiscDataSet := TADODataSet.Create(nil);
    SemDataSet := TADODataSet.Create(nil);
    CompetDataSet := TADODataSet.Create(nil);
    FgosDataSet := TADODataSet.Create(nil);
    DiscDataSet.Connection := dm.DBConnect;
    SemDataSet.Connection := dm.DBConnect;
    CompetDataSet.Connection := dm.DBConnect;
    FgosDataSet.Connection := dm.DBConnect;

    if (KafIK = 1) then
      DiscDataSet.CommandText :=
        'Select count(*) as DiscCount From sv_disc Where ik_uch_plan = ' +
        IntToStr(UchPlanIK)
    else
      DiscDataSet.CommandText :=
        'Select count(*) as DiscCount From sv_disc Where (ik_disc_uch_plan in (Select ik_disc_uch_plan From Content_UchPl Where ik_kaf = '
        + IntToStr(KafIK) + ')) and (ik_uch_plan = ' +
        IntToStr(UchPlanIK) + ')';
    DiscDataSet.Open;
    if (DiscDataSet.FieldByName('DiscCount').AsInteger = 0) then
    begin
      MessageBox(MessageHandle,
        'В выбранном учебном плане нет дисциплин, удовлетворяющих заданному условию!',
        'Экспорт данных в Microsoft Excel', MB_ICONINFORMATION);
      DiscDataSet.Close;
      exit;
    end;
    ProgressBar^.Max := DiscDataSet.FieldByName('DiscCount').AsInteger;
    ProgressBar^.Position := 0;
    DiscDataSet.Close;
    Disp := CreateOleObject('Excel.Application');
    Disp.QueryInterface(Excel_GUID, IExcelApp);
    IExcelApp.Workbooks.Add(NULL, 0);
    with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
    begin
      Orientation := xlLandscape;
      CenterHorizontally := true;
      LeftMargin := IExcelApp.CentimetersToPoints(0.5, 0);
      RightMargin := IExcelApp.CentimetersToPoints(0.5, 0);
      TopMargin := IExcelApp.CentimetersToPoints(0.5, 0);
      BottomMargin := IExcelApp.CentimetersToPoints(0.5, 0);
      PrintTitleRows := '$4:$10';
      FitToPagesWide := 1;
      FitToPagesTall := false;
      Zoom := false;
    end;
    CycleDataSet := TGeneralController.Instance.GetNewADODataSet(false);
    GroupDataSet := TGeneralController.Instance.GetNewADODataSet(false);

    slColumnValues := TStringList.Create;
    slKafedraList := TStringList.Create;
    TUchPlanController.Instance.getColumnsNames(SemesterStr, 1);

    RangeE := IExcelApp.Range['A1',
      semCols[Length(arColumns) - (NoAudRowCount - 1)] + '1'];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'УХТИНСКИЙ ГОСУДАРСТВЕННЫЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ';
    RangeE.RowHeight := IExcelApp.CentimetersToPoints(1.5, 0);

    RangeE := IExcelApp.Range['A2',
      semCols[Length(arColumns) - (NoAudRowCount - 1)] + '2'];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'УЧЕБНЫЙ РАБОЧИЙ ПЛАН';
    RangeE.RowHeight := IExcelApp.CentimetersToPoints(1.5, 0);

    DiscDataSet.CommandText :=
      'Select * From Uch_pl up INNER JOIN Spec_stud ss ON up.ik_spec = ss.ik_spec left JOIN spclz ON up.ik_spclz = spclz.ik_spclz '
      + 'INNER JOIN Form_ed ON up.Ik_form_ed = Form_ed.Ik_form_ed INNER JOIN Year_uch_pl ON up.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl inner join Relation_spec_fac rsf '
      + 'on (rsf.ik_spec = ss.ik_spec)and(rsf.Ik_form_ed = up.Ik_form_ed) Where ik_uch_plan = '
      + IntToStr(UchPlanIK);
    DiscDataSet.Open;
    year_count := DiscDataSet.FieldByName('YearObuch').AsInteger;
    FgosDataSet.CommandText :=
      'select znach_ZE from Znachenie_ZE where ik_znach_ZE=(select ik_znach_ZE from MW_Gos where ik_spec='
      + DiscDataSet.FieldByName('ik_spec').AsString + ')';
    FgosDataSet.Open;
    ZE := FgosDataSet.FieldByName('znach_ZE').AsInteger;
    FgosDataSet.Close;

    RangeE := IExcelApp.Range['A3',
      semCols[Length(arColumns) - (NoAudRowCount - 1)] + '3'];
    RangeE.MergeCells := true;

    tempStr := 'Специальность: ' + Trim(DiscDataSet.FieldByName('Sh_spec')
      .AsString) + ' ' + Trim(DiscDataSet.FieldByName('Cname_spec').AsString);
    if DiscDataSet.FieldByName('ik_spclz').AsInteger <> 0 then
      case DiscDataSet.FieldByName('ik_direction').AsInteger of
        1:
          tempStr := tempStr + ', профиль: ';
        2:
          tempStr := tempStr + ', специализация: ';
        3:
          tempStr := tempStr + ', программа: ';
        4:
          tempStr := tempStr + ', специализация: ';
      end;

    RangeE.Value2 := tempStr + Trim(DiscDataSet.FieldByName('cName_spclz')
      .AsString) + ', форма обучения: ' +
      Trim(DiscDataSet.FieldByName('Cname_form_ed').AsString) +
      ', год утверждения: ' + Trim(DiscDataSet.FieldByName('year_value')
      .AsString);
    RangeE.RowHeight := IExcelApp.CentimetersToPoints(1.5, 0);
    DiscDataSet.Close;

    CycleRow := 4;

    RangeE := IExcelApp.Range['A' + IntToStr(CycleRow),
      'A' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Закреплено за кафедрой';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['B' + IntToStr(CycleRow),
      'B' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Индекс';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['C' + IntToStr(CycleRow),
      'C' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Название циклов и дисциплин';

    RangeE := IExcelApp.Range['D' + IntToStr(CycleRow),
      'K' + IntToStr(CycleRow)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Распределение по семестрам';

    RangeE := IExcelApp.Range['D' + IntToStr(CycleRow + 1),
      'D' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Экзамены';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['E' + IntToStr(CycleRow + 1),
      'E' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Зачеты';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['F' + IntToStr(CycleRow + 1),
      'F' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Курсовой проект';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['G' + IntToStr(CycleRow + 1),
      'G' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Курсовая работа';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['H' + IntToStr(CycleRow + 1),
      'H' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'РГР';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['I' + IntToStr(CycleRow + 1),
      'I' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Реферат';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['J' + IntToStr(CycleRow + 1),
      'J' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Контрольная работа';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['K' + IntToStr(CycleRow + 1),
      'K' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Аттестации';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['L' + IntToStr(CycleRow),
      'L' + IntToStr(CycleRow + 4)];

    RangeE.MergeCells := true;
    RangeE.Value2 := 'Всего (зач.единиц)';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['M' + IntToStr(CycleRow),
      'S' + IntToStr(CycleRow)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Обязательная работа студента';

    RangeE := IExcelApp.Range['M' + IntToStr(CycleRow + 1),
      'M' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Всего (часов)';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['N' + IntToStr(CycleRow + 1),
      'N' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Всего аудиторных';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['O' + IntToStr(CycleRow + 1),
      'Q' + IntToStr(CycleRow + 1)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Из них';

    RangeE := IExcelApp.Range['O' + IntToStr(CycleRow + 2),
      'O' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Лекции';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['P' + IntToStr(CycleRow + 2),
      'P' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Лабораторные';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['Q' + IntToStr(CycleRow + 2),
      'Q' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Практические';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['R' + IntToStr(CycleRow + 1),
      'R' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Индивидуальные занятия';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range['S' + IntToStr(CycleRow + 1),
      'S' + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'Самост. работа';
    RangeE.Orientation := 90;

    RangeE := IExcelApp.Range[semCols[1] + IntToStr(CycleRow),
      semCols[6 * year_count] + IntToStr(CycleRow)];
    RangeE.MergeCells := true;
    RangeE.Value2 :=
      'Распределение аудиторных занятий по курсам и семестрам (зачетных единиц)';

    SemDataSet.CommandText := 'Select * from sem_uch_pl where ik_uch_plan=' +
      IntToStr(UchPlanIK);
    SemDataSet.Open;

    // CompetDataSet.CommandText := 'select short_Name,ik_disc_uch_plan from Competence,Competence_sv_disc '+
    // 'where Competence.ik_competence = Competence_sv_disc.ik_competence '+
    // 'and Competence_sv_disc.ik_disc_uch_plan in (select ik_disc_uch_plan from sv_disc where ik_uch_plan = '+IntToStr(UchPlanIK)+')';

    CompetDataSet.CommandText := 'select distinct short_Name,ik_disc_uch_plan '
      + 'from Competence C inner join Structure_competence Sc on C.ik_competence=Sc.ik_competence '
      + 'inner join Struct_competence_sv_disc Scd on Sc.ik_structure_competence=Scd.ik_structure_competence '
      + 'where Scd.ik_disc_uch_plan in ' +
      '(select ik_disc_uch_plan from sv_disc where ik_uch_plan = ' +
      IntToStr(UchPlanIK) + ')';

    CompetDataSet.Open;

    for i := 0 to year_count - 1 do
    begin
      RangeE := IExcelApp.Range[semCols[6 * i + 1] + IntToStr(CycleRow + 1),
        semCols[6 * i + 6] + IntToStr(CycleRow + 1)];
      RangeE.MergeCells := true;
      RangeE.Value2 := rimChisl[i] + ' курс';
      for j := 0 to 1 do
      begin
        RangeE := IExcelApp.Range[semCols[6 * i + j * 3 + 1] +
          IntToStr(CycleRow + 2), semCols[6 * i + j * 3 + 3] +
          IntToStr(CycleRow + 2)];
        RangeE.MergeCells := true;
        RangeE.Value2 := IntToStr(j + 1) + ' семестр';
        SemDataSet.Filter := 'n_sem=' + IntToStr(2 * i + j + 1);
        SemDataSet.Filtered := true;

        RangeE := IExcelApp.Range[semCols[6 * i + j * 3 + 1] +
          IntToStr(CycleRow + 3), semCols[6 * i + j * 3 + 1] +
          IntToStr(CycleRow + 3)];
        RangeE.MergeCells := true;
        RangeE.Value2 := SemDataSet.FieldByName('kol_ned').AsString;
        RangeE.Font.ColorIndex := 3;

        RangeE := IExcelApp.Range[semCols[6 * i + j * 3 + 2] +
          IntToStr(CycleRow + 3), semCols[6 * i + j * 3 + 3] +
          IntToStr(CycleRow + 3)];
        RangeE.MergeCells := true;
        RangeE.Value2 := 'недель';
        RangeE.Font.ColorIndex := 3;

        for k := 0 to 2 do
        begin
          RangeE := IExcelApp.Range[semCols[6 * i + j * 3 + k + 1] +
            IntToStr(CycleRow + 4), semCols[6 * i + j * 3 + k + 1] +
            IntToStr(CycleRow + 4)];
          RangeE.MergeCells := true;
          RangeE.Value2 := SemContent[k];
          RangeE.Orientation := 90;
        end;

      end;
    end;

    RangeE := IExcelApp.Range[semCols[6 * year_count + 1] + IntToStr(CycleRow),
      semCols[6 * year_count + 1] + IntToStr(CycleRow + 4)];
    RangeE.MergeCells := true;
    RangeE.Value2 := 'компетенции';

    // закончилась шапка и начались данные
    allZE := 0;

    RangeE := IExcelApp.Range['A1',
      semCols[Length(arColumns) - (NoAudRowCount - 1)] +
      IntToStr(CycleRow + 6)];
    // RangeE.VerticalAlignment:= xlCenter;
    // RangeE.HorizontalAlignment:= xlCenter;
    RangeE.Font.Size := 10;

    CycleRow := 9;
    tempCSL.Clear;
    if (KafIK = 1) then
      CycleDataSet.CommandText :=
        'SELECT * FROM ckl_disc WHERE ik_ckl_disc in (SELECT ik_ckl_disc FROM sv_disc WHERE (ik_uch_plan = '
        + IntToStr(UchPlanIK) +
        ') and (ik_disc in (SELECT ik_disc FROM discpln WHERE ik_type_disc = 1)))'
    else
      CycleDataSet.CommandText :=
        'SELECT * FROM ckl_disc WHERE ik_ckl_disc in (SELECT ik_ckl_disc FROM sv_disc WHERE (ik_uch_plan = '
        + IntToStr(UchPlanIK) +
        ') and (ik_disc in (SELECT ik_disc FROM discpln WHERE ik_type_disc = 1)) and (ik_disc_uch_plan in (Select ik_disc_uch_plan From Content_UchPl Where ik_kaf = '
        + IntToStr(KafIK) + ')))';
    CycleDataSet.Open;
    CycleDataSet.first;
    while (not CycleDataSet.Eof) do
    begin
      cklZE := 0;
      if (KafIK = 1) then
        GroupDataSet.CommandText :=
          'SELECT * FROM grp_disc WHERE IK_grp_disc in (SELECT IK_grp_disc FROM sv_disc WHERE (ik_uch_plan = '
          + IntToStr(UchPlanIK) +
          ') and (ik_disc in (SELECT ik_disc FROM discpln WHERE ik_type_disc = 1)) and (ik_ckl_disc = '
          + CycleDataSet.FieldByName('ik_ckl_disc').AsString + '))'
      else
        GroupDataSet.CommandText :=
          'SELECT * FROM grp_disc WHERE IK_grp_disc in (SELECT IK_grp_disc FROM sv_disc WHERE (ik_uch_plan = '
          + IntToStr(UchPlanIK) +
          ') and (ik_disc in (SELECT ik_disc FROM discpln WHERE ik_type_disc = 1)) and (ik_ckl_disc = '
          + CycleDataSet.FieldByName('ik_ckl_disc').AsString +
          ') and (ik_disc_uch_plan in (Select ik_disc_uch_plan From Content_UchPl Where ik_kaf = '
          + IntToStr(KafIK) + ')))';
      GroupDataSet.Open;
      GroupDataSet.first;
      if CycleDataSet.FieldByName('ik_ckl_disc').AsInteger <> 15 then
      begin
        RangeE := IExcelApp.Range['B' + IntToStr(CycleRow),
          'B' + IntToStr(CycleRow)];
        if (CycleDataSet.FieldByName('Ccode_ckl_disc').value <> NULL) then
          RangeE.Value2 := Trim(CycleDataSet.FieldByName('Ccode_ckl_disc')
            .AsString) + '.00';

        RangeE := IExcelApp.Range['C' + IntToStr(CycleRow),
          'C' + IntToStr(CycleRow)];
        RangeE.MergeCells := true;
        RangeE.Value2 := Trim(CycleDataSet.FieldByName('Cname_ckl_disc')
          .AsString);
        RangeE.Font.Bold := true;
        RangeE.Font.Size := 13;
        GroupRow := CycleRow + 1;

      end
      else
        GroupRow := CycleRow;
      RowInCycle := 0;
      tempSL.Clear;
      while (not GroupDataSet.Eof) do
      begin
        grpZE := 0;
        if GroupDataSet.FieldByName('ik_grp_disc').AsInteger <> 14 then
        begin
          RangeE := IExcelApp.Range['B' + IntToStr(GroupRow),
            'B' + IntToStr(GroupRow)];

          if (CycleDataSet.FieldByName('Ccode_ckl_disc').value <> NULL) and
            (GroupDataSet.FieldByName('Ccode_grp_disc').value <> NULL) then
            RangeE.Value2 := Trim(CycleDataSet.FieldByName('Ccode_ckl_disc')
              .AsString) + '.' + Trim(GroupDataSet.FieldByName('Ccode_grp_disc')
              .AsString) + '.00';
          RangeE := IExcelApp.Range['C' + IntToStr(GroupRow),
            'C' + IntToStr(GroupRow)];
          RangeE.MergeCells := true;

          RangeE.Value2 := Trim(GroupDataSet.FieldByName('Cname_grp_disc')
            .AsString);
          RangeE.Font.Bold := true;
          RangeE.Font.Italic := true;
          RangeE.Font.Size := 12;

        end
        else
          GroupRow := GroupRow - 1;

        RowInGroup := 0; // исправил - было Cname_disc
        DiscDataSet.CommandText :=
          'Select * From sv_disc INNER JOIN discpln ON sv_disc.ik_disc = discpln.ik_disc Where (sv_disc.ik_grp_disc = '
          + GroupDataSet.FieldByName('ik_grp_disc').AsString +
          ') and (sv_disc.ik_ckl_disc = ' + CycleDataSet.FieldByName
          ('ik_ckl_disc').AsString + ') and (ik_uch_plan = ' +
          IntToStr(UchPlanIK) + ') Order By cname_ckl_disc1';
        DiscDataSet.Open;
        while (not DiscDataSet.Eof) do
        begin
          RangeE := IExcelApp.Range['B' + IntToStr(GroupRow + RowInGroup + 1),
            'B' + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := Trim(DiscDataSet.FieldByName('cname_ckl_disc1')
            .AsString);
          RangeE := IExcelApp.Range['C' + IntToStr(GroupRow + RowInGroup + 1),
            'C' + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := Trim(DiscDataSet.FieldByName('cname_disc').AsString);

          dm.qContentUchPlan.SQL.Clear;
          if (KafIK = 1) then
            dm.qContentUchPlan.SQL.Add
              ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
              DiscDataSet.FieldByName('ik_disc_uch_plan').AsString)
          else
            dm.qContentUchPlan.SQL.Add
              ('Select * From Content_UchPl Where (ik_disc_uch_plan = ' +
              DiscDataSet.FieldByName('ik_disc_uch_plan').AsString +
              ') and (ik_kaf = ' + IntToStr(KafIK) + ')');
          dm.qContentUchPlan.Open;

          slColumnValues.Clear;
          getColumnsValues(DiscDataSet.FieldByName('ik_disc_uch_plan')
            .AsInteger, lect, lab, pract, slColumnValues, nil, true);

          RangeE := IExcelApp.Range
            [semCols3[1] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[1] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := DiscDataSet.FieldByName('iHour_gos').AsInteger;
          RangeE := IExcelApp.Range['L' + IntToStr(GroupRow + RowInGroup + 1),
            'L' + IntToStr(GroupRow + RowInGroup + 1)];

          if ZE > 0 then

            if DiscDataSet.FieldByName('ik_disc').AsInteger <> FISCULTURA then
            begin
              RangeE.Value2 := DiscDataSet.FieldByName('iHour_gos')
                .AsInteger / ZE;
              grpZE := grpZE + Round(DiscDataSet.FieldByName('iHour_gos')
                .AsInteger / ZE);
            end
            else
            begin
              RangeE.Value2 := 2;
              grpZE := grpZE + 2;
            end;

          RangeE := IExcelApp.Range
            [semCols3[2] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[2] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := IntToStr(lect);
          RangeE := IExcelApp.Range
            [semCols3[3] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[3] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := IntToStr(lab);
          RangeE := IExcelApp.Range
            [semCols3[4] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[4] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := IntToStr(pract);
          RangeE := IExcelApp.Range
            [semCols3[5] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[5] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := IntToStr(pract + lab + lect);
          RangeE := IExcelApp.Range
            [semCols3[6] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[6] + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := DiscDataSet.FieldByName('iIndivid').AsInteger;
          RangeE := IExcelApp.Range
            [semCols3[7] + IntToStr(GroupRow + RowInGroup + 1),
            semCols3[7] + IntToStr(GroupRow + RowInGroup + 1)];
          i := DiscDataSet.FieldByName('iHour_gos').AsInteger -
            (pract + lab + lect) - DiscDataSet.FieldByName('iIndivid')
            .AsInteger;
          RangeE.Value2 := IntToStr(i);

          // вывод компетенций
          tempStr := '';
          CompetDataSet.Filter := 'ik_disc_uch_plan=' + DiscDataSet.FieldByName
            ('ik_disc_uch_plan').AsString;
          CompetDataSet.Filtered := true;
          CompetDataSet.first;
          while not CompetDataSet.Eof do
          begin
            if tempStr <> '' then
              tempStr := tempStr + ', ';
            tempStr := tempStr + CompetDataSet.FieldByName
              ('short_Name').AsString;
            CompetDataSet.Next;
          end;
          RangeE := IExcelApp.Range[semCols[6 * year_count + 1] +
            IntToStr(GroupRow + RowInGroup + 1), semCols[6 * year_count + 1] +
            IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := tempStr;

          sem_ind := 0;

          for i := 0 to Length(arColumns) - 1 do
          begin
            // if i div 3 =0 then sem_ind = i+1 else

            case (arColumns[i].columnType) of
              3:
                begin
                  RangeE := IExcelApp.Range
                    [semCols2[i + 1] + IntToStr(GroupRow + RowInGroup + 1),
                    semCols2[i + 1] + IntToStr(GroupRow + RowInGroup + 1)];
                  RangeE.Value2 := slColumnValues[i];
                end;
              11:
                begin
                  SemDataSet.Filter := 'n_sem=' + IntToStr(sem_ind + 1);
                  SemDataSet.Filtered := true;
                  if (slColumnValues[i] <> '0\0\0') then
                    for j := 0 to 2 do
                    begin
                      RangeE := IExcelApp.Range
                        [semCols[sem_ind * 3 + 1 + j] +
                        IntToStr(GroupRow + RowInGroup + 1),
                        semCols[sem_ind * 3 + 1 + j] +
                        IntToStr(GroupRow + RowInGroup + 1)];
                      if j = 2 then
                        RangeE.Value2 := copy(slColumnValues[i], 1,
                          Length(slColumnValues[i]))
                      else
                      begin
                        RangeE.Value2 := copy(slColumnValues[i], 1,
                          Pos('\', slColumnValues[i]) - 1);
                        slColumnValues[i] :=
                          copy(slColumnValues[i], Pos('\', slColumnValues[i]) +
                          1, Length(slColumnValues[i]) - Pos('\',
                          slColumnValues[i]));
                      end;
                    end;
                  inc(sem_ind);
                end;
            end;
          end;

          slKafedraList.Clear;
          if (KafIK = 1) then
          begin
            dm.qContentUchPlan.first;
            while (not dm.qContentUchPlan.Eof) do
            begin
              if (dm.qContentUchPlan.FieldByName('ik_kaf').value <> NULL) then
                if (slKafedraList.IndexOf(dm.qContentUchPlan.FieldByName
                  ('ik_kaf').AsString) = -1) then
                  slKafedraList.Add(dm.qContentUchPlan.FieldByName('ik_kaf')
                    .AsString);
              dm.qContentUchPlan.Next;
            end;
          end
          else
            slKafedraList.Add(IntToStr(KafIK));
          RangeE := IExcelApp.Range['A' + IntToStr(GroupRow + RowInGroup + 1),
            'A' + IntToStr(GroupRow + RowInGroup + 1)];
          RangeE.Value2 := getValuesFromStringList(@slKafedraList, 'kafedra',
            'ik_kaf', 'cshort_name_kaf');
          if GroupDataSet.FieldByName('ik_grp_disc').AsInteger = 14 then
            tempSL.Add(IntToStr(GroupRow + RowInGroup + 1));
          if CycleDataSet.FieldByName('ik_ckl_disc').AsInteger = 15 then
            tempCSL.Add(IntToStr(GroupRow + RowInGroup + 1));
          inc(RowInGroup);
          ProgressBar^.Position := ProgressBar^.Position + 1;
          DiscDataSet.Next;
        end;
        cklZE := cklZE + grpZE;

        DiscDataSet.Close;

        if GroupDataSet.FieldByName('ik_grp_disc').AsInteger <> 14 then
        begin
          RangeE := IExcelApp.Range[semCols3[1] + IntToStr(GroupRow),
            semCols3[1] + IntToStr(GroupRow)];
          RangeE.Value2 := '=SUM(' + semCols3[1] + IntToStr(GroupRow + 1) + ':'
            + semCols3[1] + IntToStr(GroupRow + RowInGroup) + ')';

          RangeE.Font.Bold := true;
          RangeE.Font.Size := 12;

          RangeE := IExcelApp.Range['L' + IntToStr(GroupRow),
            'L' + IntToStr(GroupRow)];
          if ZE > 0 then
            RangeE.Value2 := IntToStr(grpZE);
          // '='+semCols3[1] + IntToStr(GroupRow)+'/'+IntToStr(ZE);

          RangeE.Font.Bold := true;
          RangeE.Font.Size := 12;

          GroupRow := GroupRow + RowInGroup + 1;
          RangeE := IExcelApp.Range['C' + IntToStr(GroupRow),
            'C' + IntToStr(GroupRow)];
          RangeE.Value2 := 'Итого по группе дисциплин';

          RangeE.Font.Bold := true;
          RangeE.Font.Italic := true;
          RangeE.Font.Size := 12;
          for i := 1 to 7 do
          begin
            RangeE := IExcelApp.Range[semCols3[i] + IntToStr(GroupRow),
              semCols3[i] + IntToStr(GroupRow)];
            RangeE.Value2 := '=SUM(' + semCols3[i] +
              IntToStr(GroupRow - RowInGroup) + ':' + semCols3[i] +
              IntToStr(GroupRow - 1) + ')';

            RangeE.Font.Bold := true;

          end;
          RangeE := IExcelApp.Range['L' + IntToStr(GroupRow),
            'L' + IntToStr(GroupRow)];
          if ZE > 0 then
            RangeE.Value2 := IntToStr(grpZE);

          RangeE.Font.Bold := true;

          tempSL.Add(IntToStr(GroupRow));
          inc(GroupRow);
          RowInCycle := RowInCycle + RowInGroup + 2;
        end
        else
          RowInCycle := RowInCycle + RowInGroup;
        GroupDataSet.Next;
      end;
      GroupDataSet.Close;

      if CycleDataSet.FieldByName('ik_ckl_disc').AsInteger <> 15 then
      begin
        RangeE := IExcelApp.Range[semCols3[1] + IntToStr(CycleRow),
          semCols3[1] + IntToStr(CycleRow)];
        tempStr := '';
        for j := 0 to tempSL.Count - 1 do
          tempStr := tempStr + semCols3[1] + tempSL[j] + ',';
        RangeE.Value2 := '=SUM(' + tempStr + ')';

        RangeE.Font.Bold := true;
        RangeE.Font.Size := 13;

        allZE := allZE + cklZE;

        RangeE := IExcelApp.Range['L' + IntToStr(CycleRow),
          'L' + IntToStr(CycleRow)];
        { if CycleDataSet.FieldByName('ik_ckl_disc').AsInteger <> FISCULTURA_CIKL then
          RangeE.Value2:= '=' + semCols3[1] + IntToStr(CycleRow) + '/' + IntToStr(ZE)
          else  RangeE.Value2:= '2'; }

        if ZE > 0 then
          RangeE.Value2 := IntToStr(cklZE);

        RangeE.Font.Bold := true;
        RangeE.Font.Size := 13;

        CycleRow := CycleRow + RowInCycle + 1;

        RangeE := IExcelApp.Range['C' + IntToStr(CycleRow),
          'C' + IntToStr(CycleRow)];
        RangeE.Value2 := 'Всего по циклу дисциплин';
        RangeE.Font.Bold := true;

        RangeE.Font.Size := 13;
        for i := 1 to 7 do
        begin
          RangeE := IExcelApp.Range[semCols3[i] + IntToStr(CycleRow),
            semCols3[i] + IntToStr(CycleRow)];
          tempStr := '';
          for j := 0 to tempSL.Count - 1 do
            tempStr := tempStr + semCols3[i] + tempSL[j] + ',';
          RangeE.Value2 := '=SUM(' + tempStr + ')';

          RangeE.Font.Bold := true;
          RangeE.Font.Size := 13;
        end;
        RangeE := IExcelApp.Range['L' + IntToStr(CycleRow),
          'L' + IntToStr(CycleRow)];
        { if CycleDataSet.FieldByName('ik_ckl_disc').AsInteger <> FISCULTURA_CIKL then
          RangeE.Value2:= '=' + semCols3[1] + IntToStr(CycleRow) + '/'+IntToStr(ZE) else RangeE.Value2:= '2'; }
        if ZE > 0 then
          RangeE.Value2 := IntToStr(cklZE);

        RangeE.Font.Bold := true;
        RangeE.Font.Size := 13;

        tempCSL.Add(IntToStr(CycleRow));
        inc(CycleRow);
      end
      else
        CycleRow := CycleRow + RowInCycle;
      CycleDataSet.Next;
    end;
    CycleDataSet.Close;

    RangeE := IExcelApp.Range['C' + IntToStr(CycleRow),
      'C' + IntToStr(CycleRow)];
    RangeE.Value2 := 'ИТОГО ПО ПЛАНУ';

    RangeE.Font.Bold := true;
    RangeE.Font.Size := 14;

    for i := 1 to 7 do
    begin
      RangeE := IExcelApp.Range[semCols3[i] + IntToStr(CycleRow),
        semCols3[i] + IntToStr(CycleRow)];
      tempStr := '';
      for j := 0 to tempCSL.Count - 1 do
        tempStr := tempStr + semCols3[i] + tempCSL[j] + ',';
      RangeE.Value2 := '=SUM(' + tempStr + ')';

      RangeE.Font.Bold := true;
      RangeE.Font.Size := 14;
    end;

    RangeE := IExcelApp.Range['L' + IntToStr(CycleRow),
      'L' + IntToStr(CycleRow)];
    if ZE > 0 then
      RangeE.Value2 := IntToStr(allZE);

    RangeE.Font.Bold := true;
    RangeE.Font.Size := 14;

    if (Length(arColumns) - NoAudRowCount) > 0 then
    begin
      RangeE := IExcelApp.Range[semCols[1] + '11',
        semCols[Length(arColumns) - NoAudRowCount] + IntToStr(CycleRow)];
      RangeE.HorizontalAlignment := xlCenter;
      RangeE.VerticalAlignment := xlCenter;
    end;
    RangeE := IExcelApp.Range['A4', semCols[6 * year_count + 1] +
      IntToStr(CycleRow)];
    RangeE.Columns.AutoFit;
    RangeE.Borders.LineStyle := 1;

    DiscDataSet.CommandText :=
      'SELECT cName_disc, iHour_gos, ik_disc_uch_plan FROM sv_disc INNER JOIN discpln ON sv_disc.ik_disc = discpln.ik_disc WHERE (ik_type_disc <> 1) and (ik_uch_plan = '
      + IntToStr(UchPlanIK) + ')';
    DiscDataSet.Open;
    if DiscDataSet.RecordCount > 0 then
    begin
      RangeE := IExcelApp.Range['A' + IntToStr(CycleRow + 2),
        'A' + IntToStr(CycleRow + 2)];
      RangeE.Value2 := 'Название практики/работы';
      RangeE := IExcelApp.Range['B' + IntToStr(CycleRow + 2),
        'B' + IntToStr(CycleRow + 2)];
      RangeE.Value2 := 'Семестр';
      RangeE := IExcelApp.Range['C' + IntToStr(CycleRow + 2),
        'C' + IntToStr(CycleRow + 2)];
      RangeE.Value2 := 'Количество недель';
      RangeE := IExcelApp.Range['A' + IntToStr(CycleRow + 2),
        'C' + IntToStr(CycleRow + 2)];
      RangeE.Font.Bold := 1;
      RangeE.Font.Size := 12;
      RangeE.HorizontalAlignment := xlCenter;
      DiscDataSet.first;
      while not DiscDataSet.Eof do
      begin
        RangeE := IExcelApp.Range
          ['A' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo),
          'A' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo)];
        RangeE.Value2 := DiscDataSet.FieldByName('cName_disc').AsString;
        CycleDataSet.CommandText :=
          'SELECT n_sem FROM Content_UchPl WHERE ik_disc_uch_plan = ' +
          DiscDataSet.FieldByName('ik_disc_uch_plan').AsString;
        CycleDataSet.Open;
        tempStr := '';
        while not CycleDataSet.Eof do
        begin
          tempStr := tempStr + CycleDataSet.FieldByName('n_sem')
            .AsString + ', ';
          CycleDataSet.Next;
        end;
        CycleDataSet.Close;
        RangeE := IExcelApp.Range
          ['B' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo),
          'B' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo)];
        Delete(tempStr, Length(tempStr) - 1, 2);
        RangeE.Value2 := tempStr;
        RangeE := IExcelApp.Range
          ['C' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo),
          'C' + IntToStr(CycleRow + 2 + DiscDataSet.RecNo)];
        RangeE.Value2 := DiscDataSet.FieldByName('iHour_gos').AsString;
        DiscDataSet.Next;
      end;
      RangeE := IExcelApp.Range['A' + IntToStr(CycleRow + 2),
        'C' + IntToStr(CycleRow + 2 + DiscDataSet.RecordCount)];
      RangeE.Columns.AutoFit;
      RangeE.Borders.LineStyle := 1;
    end;
    DiscDataSet.Close;
    SemDataSet.Close;
    CompetDataSet.Close;

    IExcelApp.Visible[0] := true;
    CycleDataSet.Free;
    GroupDataSet.Free;
    DiscDataSet.Free;
    SemDataSet.Free;
    CompetDataSet.Free;
    FgosDataSet.Free;
    IExcelApp := nil;
    RangeE := nil;
    Disp := nil;
  except
    on E: Exception do
    begin
      if Assigned(DiscDataSet) then
      begin
        if DiscDataSet.Active then
          DiscDataSet.Close;
        DiscDataSet.Free;
      end;
      if Assigned(GroupDataSet) then
      begin
        if GroupDataSet.Active then
          GroupDataSet.Close;
        GroupDataSet.Free;
      end;
      if Assigned(CycleDataSet) then
      begin
        if CycleDataSet.Active then
          CycleDataSet.Close;
        CycleDataSet.Free;
      end;
      if Assigned(SemDataSet) then
      begin
        if SemDataSet.Active then
          SemDataSet.Close;
        SemDataSet.Free;
      end;
      if Assigned(CompetDataSet) then
      begin
        if CompetDataSet.Active then
          CompetDataSet.Close;
        CompetDataSet.Free;
      end;
      if Assigned(FgosDataSet) then
      begin
        if FgosDataSet.Active then
          FgosDataSet.Close;
        FgosDataSet.Free;
      end;

      RangeE := nil;
      if IExcelApp <> nil then
      begin
        IExcelApp.DisplayAlerts[0] := false;
        IExcelApp.Quit;
        IExcelApp := nil;
      end;
      Disp := nil;
      raise;
    end;
  end;
end;

function TUchPlanController.SaveSpecialization(SpclzIK, SpecIK: integer;
  CodeSpclz, NameSpclz, NameShortSpclz: string): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  tempStoredProc.Connection := dm.DBConnect;
  tempStoredProc.ProcedureName := 'UpdateSpclz';
  if SpclzIK < 0 then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_spclz', ftInteger, pdInput,
    0, SpclzIK);
  tempStoredProc.Parameters.CreateParameter('@ik_spec', ftInteger, pdInput,
    0, SpecIK);
  tempStoredProc.Parameters.CreateParameter('@Sh_spclz', ftString, pdInput, 10,
    CodeSpclz);
  tempStoredProc.Parameters.CreateParameter('@Cname_spclz', ftString, pdInput,
    150, NameSpclz);
  tempStoredProc.Parameters.CreateParameter('@Cshort_name_spclz', ftString,
    pdInput, 20, NameShortSpclz);
  tempStoredProc.Connection.BeginTrans;
  try
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Connection.CommitTrans;
    Result := true;
  except
    tempStoredProc.Connection.RollbackTrans;
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

function TUchPlanController.UpdateGrup(UchPlanOld, UchPlanNew,
  SpecFac: integer): boolean;
var
  DataSet: TADOStoredProc;
begin
  DataSet := TADOStoredProc.Create(nil);
  DataSet.Connection := dm.DBConnect;
  (DataSet as TADOStoredProc).ProcedureName := 'UpdateGrup';
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_uch_plan_old',
    ftInteger, pdInput, 0, UchPlanOld);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_uch_plan_new',
    ftInteger, pdInput, 0, UchPlanNew);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_spec_fac',
    ftInteger, pdInput, 0, SpecFac);
  try
    DataSet.ExecProc;
  except
    DataSet.Free;
    raise;
  end;
  DataSet.Free;
  Result := true;
end;

function TUchPlanController.UpdateUspev(ik_grup, UchPlanNew: integer): boolean;
var
  DataSet: TADOStoredProc;
begin
  DataSet := TADOStoredProc.Create(nil);
  DataSet.Connection := dm.DBConnect;
  (DataSet as TADOStoredProc).ProcedureName := 'UpdateUspev';
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_grup', ftInteger,
    pdInput, 0, ik_grup);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_uch_plan_new',
    ftInteger, pdInput, 0, UchPlanNew);
  try
    DataSet.ExecProc;
  except
    DataSet.Free;
    raise;
  end;
  DataSet.Free;
  Result := true;
end;

function TUchPlanController.getGrupSpecializations(ik_grup: integer): Variant;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandType := cmdText;
  DataSet.CommandText :=
    'SELECT ik_spclz from Uch_pl where ik_uch_plan = (select ik_uch_plan from grup where Ik_grup='
    + IntToStr(ik_grup) + ')';
  DataSet.Open;
  Result := DataSet.FieldByName('ik_spclz').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getGrupFormEd(ik_grup: integer): Variant;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandType := cmdText;
  DataSet.CommandText :=
    'SELECT ik_form_ed from Uch_pl where ik_uch_plan = (select ik_uch_plan from grup where Ik_grup='
    + IntToStr(ik_grup) + ')';
  DataSet.Open;
  Result := DataSet.FieldByName('ik_form_ed').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.getGrupYear(ik_grup: integer): Variant;
var
  DataSet: TADODataSet;
begin
  DataSet := TADODataSet.Create(nil);
  DataSet.Connection := dm.DBConnect;
  DataSet.CommandType := cmdText;
  DataSet.CommandText :=
    'SELECT ik_year_uch_pl from Uch_pl where ik_uch_plan = (select ik_uch_plan from grup where Ik_grup='
    + IntToStr(ik_grup) + ')';
  DataSet.Open;
  Result := DataSet.FieldByName('ik_year_uch_pl').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

function TUchPlanController.GetSemesterHourityString(semesterNumber
  : integer): string;
var
  i: integer;
begin
  Result := '00\00\00';
  for i := 0 to Length(semesters) - 1 do
    if semesters[i].number = semesterNumber then
    begin
      if semesters[i].auditorHour[0] >= 0 then
      begin
        if semesters[i].auditorHour[0] >= 10 then
          Result := IntToStr(semesters[i].auditorHour[0]) + '\'
        else
          Result := '0' + IntToStr(semesters[i].auditorHour[0]) + '\';
      end
      else
        Result := '00\';
      if semesters[i].auditorHour[1] >= 0 then
      begin
        if semesters[i].auditorHour[1] >= 10 then
          Result := Result + IntToStr(semesters[i].auditorHour[1]) + '\'
        else
          Result := Result + '0' + IntToStr(semesters[i].auditorHour[1]) + '\';
      end
      else
        Result := Result + '00\';
      if semesters[i].auditorHour[2] >= 0 then
      begin
        if semesters[i].auditorHour[2] >= 10 then
          Result := Result + IntToStr(semesters[i].auditorHour[2])
        else
          Result := Result + '0' + IntToStr(semesters[i].auditorHour[2]);
      end
      else
        Result := Result + '00';
      exit;
    end;
end;

{ TWeekCountExceptionList }

procedure TVidZanyatExceptionList.AddTaskRecord(AVidZanyatIK, ASemNumber,
  AKafIK, ANumber, ACount: integer);
var
  i, n: integer;
begin
  { n:= 1;
    for I := 0 to Count - 1 do
    if (Items[i].VidZanyatIK = AVidZanyatIK) and (Items[i].SemNumber = ASemNumber) and
    (Items[i].KafIK = AKafIK) then inc(n); }
  Add(TVidZanyatException.Create(AVidZanyatIK, ASemNumber, AKafIK,
    ANumber, ACount));
end;

procedure TVidZanyatExceptionList.ClearListForSemester(ASemNumber: integer);
var
  i: integer;
begin
  i := 0;
  while (i < Count) do
  begin
    if (TVidZanyatException(Items[i]).SemNumber = ASemNumber) then
      Delete(i)
    else
      inc(i);
  end;
end;

procedure TVidZanyatExceptionList.ClearListForVidZnayat(AVidZanyat: integer);
var
  i: integer;
begin
  i := 0;
  while (i < Count) do
  begin
    if (TVidZanyatException(Items[i]).VidZanyatIK = AVidZanyat) then
      Delete(i)
    else
      inc(i);
  end;
end;

constructor TVidZanyatExceptionList.Create;
begin
  inherited Create(true);
end;

function TVidZanyatExceptionList.GetException(Index: integer)
  : TVidZanyatException;
begin
  Result := TVidZanyatException(inherited Items[Index]);
end;

function TVidZanyatExceptionList.GetTaskCount(AVidZanyatIK, ASemNumber, AKafIK,
  ANumber: integer): integer;
var
  i: integer;
begin
  Result := 1;
  for i := 0 to Count - 1 do
    if (Items[i].VidZanyatIK = AVidZanyatIK) and
      (Items[i].SemNumber = ASemNumber) and (Items[i].KafIK = AKafIK) and
      (Items[i].number = ANumber) then
    begin
      Result := Items[i].Count;
      exit;
    end;
end;

function TVidZanyatExceptionList.GetWeekCount(AVidZanyatIK, ASemNumber,
  AKafIK: integer): integer;
var
  i: integer;
begin
  Result := TUchPlanController.Instance.GetDefaultSemesterWeekCount(ASemNumber);
  for i := 0 to Count - 1 do
    if (Items[i].VidZanyatIK = AVidZanyatIK) and
      (Items[i].SemNumber = ASemNumber) and (Items[i].KafIK = AKafIK) then
    begin
      Result := Items[i].Count;
      exit;
    end;
end;

procedure TVidZanyatExceptionList.SetException(Index: integer;
  const value: TVidZanyatException);
begin
  inherited Items[Index] := value;
end;

{ TWeekCountException }

constructor TVidZanyatException.Create(AVidZanyatIK, ASemNumber, AKafIK,
  ANumber, ACount: integer);
begin
  fVidZanyatIK := AVidZanyatIK;
  fSemNumber := ASemNumber;
  fKafIK := AKafIK;
  fNumber := ANumber;
  fCount := ACount;
end;

{ TSemKafList }

function TSemKafList.GetNextSemKafNumber(AVidZanyatIK, ASemNumber,
  AKafIK: integer): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
    if (Items[i].VidZanyatIK = AVidZanyatIK) and
      (Items[i].SemNumber = ASemNumber) and (Items[i].KafIK = AKafIK) then
    begin
      Items[i].number := Items[i].number + 1;
      Result := Items[i].number;
      exit;
    end;
  if Result = 0 then
  begin
    Add(TSemKafItem.Create(AVidZanyatIK, ASemNumber, AKafIK));
    Result := 1;
  end;
end;

function TSemKafList.GetSKItem(Index: integer): TSemKafItem;
begin
  Result := TSemKafItem(inherited Items[index]);
end;

procedure TSemKafList.SetSKItem(Index: integer; const value: TSemKafItem);
begin
  inherited Items[index] := value;
end;

{ TSemKafItem }

constructor TSemKafItem.Create(AVidZanyatIK, ASemNumber, AKafIK: integer);
begin
  fVidZanyatIK := AVidZanyatIK;
  fSemNumber := ASemNumber;
  fKafIK := AKafIK;
  fNumber := 1;
end;

function TUchPlanController.ChangeDiscInUchPlan(UchPlanIK: integer;
  DiscInUchPlanIK: integer; CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK,
  GOSHour, IndividHour, GroupViborNum, SpclzIK: integer; CodeGOS: string;
  aCompetenceList: TStringList): boolean;
var
  DataSet: TADOStoredProc;
  i, ik_disc_uch_plan_temp, ik_uch_plan, year_uch_plan: integer;
  grupError: TStringList;
  msgstr: string;
begin
  DataSet := TGeneralController.Instance.GetNewADOStoredProc
    ('Get_DiscUchPlan_YearUchPlan', false);
  if DiscInUchPlanIK < 0 then
  begin
    DataSet.Free;
    exit;
  end
  else
    DataSet.Parameters.CreateParameter('@ik_disc_uch_plan', ftInteger, pdInput,
      0, DiscInUchPlanIK);
  try
    try // DataSet.Open;
      DataSet.Open;
      DataSet.first;
      grupError := TStringList.Create;
      while not DataSet.Eof do
      begin
        ik_uch_plan := DataSet.FieldByName('ik_uch_plan').AsInteger;
        year_uch_plan := DataSet.FieldByName('year_value').AsInteger;
        if DataSet.FieldByName('ik_disc_uch_plan').AsInteger <> 0 then
          ik_disc_uch_plan_temp := DataSet.FieldByName('ik_disc_uch_plan')
            .AsInteger
        else
          ik_disc_uch_plan_temp := 0;

        try
          if ik_disc_uch_plan_temp = 0 then // добавление
            AddNewDisc(ik_uch_plan, DiscInUchPlanIK, CycleIK, GroupIK,
              PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour,
              GroupViborNum, SpclzIK, CodeGOS)
          else // замена
            ReplaseDisc(ik_uch_plan, ik_disc_uch_plan_temp, DiscInUchPlanIK,
              CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK, GOSHour,
              IndividHour, GroupViborNum, SpclzIK, CodeGOS);

        except
          if grupError.Count > 0 then
            grupError.Add(', ' + DataSet.FieldByName('grup_comment').AsString)
          else
            grupError.Add(DataSet.FieldByName('grup_comment').AsString);
        end;
        DataSet.Next;
      end;
      if grupError.Count > 0 then
      begin
        msgstr := '';
        for i := 0 to grupError.Count - 1 do
          msgstr := msgstr + grupError[i];
        ShowMessage
          ('Не удалось распространить изменения на учебные планы следующих групп: '
          + msgstr + '.');
        { if MessageBox(MessageHandle, PWideChar('Не удалось внести изменения в учебный план '+ inttostr(year_uch_plan)+ ' года. Продолжить?'),
          'ИС УГТУ', MB_YESNO)=IDNO then exit; }
      end;
    finally // DataSet.Open;
      DataSet.Close;
      DataSet.Free;
    end;
  except
    raise;
  end;
end;

procedure TUchPlanController.AddNewDisc(ik_uch_plan, DiscInUchPlanIK, CycleIK,
  GroupIK, PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour, GroupViborNum,
  SpclzIK: integer; CodeGOS: string);
var
  DataSet: TADOStoredProc;
  tempDS, tempDS_new: TADODataSet;
  new_ik_disc_uch_plan: integer;
begin

  try
    dm.DBConnect.BeginTrans;
    with dm.aspUpdateDiscInPlan do
    begin
      Connection := dm.DBConnect;
      Parameters.ParamByName('@i_type').value := 1;
      Parameters.ParamByName('@ik_disc_uch_plan').value := DiscInUchPlanIK;
      Parameters.ParamByName('@ik_uch_plan').value := ik_uch_plan;
      Parameters.ParamByName('@ik_disc').value := DiscIK;
      Parameters.ParamByName('@ik_default_kaf').value := KafedraIK;
      Parameters.ParamByName('@iHour_gos').value := GOSHour;
      Parameters.ParamByName('@iIndivid').value := IndividHour;
      Parameters.ParamByName('@ik_ckl_disc').value := CycleIK;
      Parameters.ParamByName('@ik_grp_disc').value := GroupIK;
      Parameters.ParamByName('@Cname_ckl_disc_gos').value := CodeGOS;
      Parameters.ParamByName('@ik_pdgrp_disc').value := PodGroupIK;
      Parameters.ParamByName('@ViborGroup').value := GroupViborNum;
      Parameters.ParamByName('@ik_spclz').value := SpclzIK;
      try
        ExecProc;
        new_ik_disc_uch_plan := Parameters.ParamByName('@RETURN_VALUE').value;
      finally

      end;
    end;
    { DataSet:= TGeneralController.Instance.GetNewADOStoredProc('UpdateDiscInUchPlan', false);
      DataSet.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 1);
      DataSet.Parameters.CreateParameter('@ik_disc_uch_plan',ftInteger,pdInput, 0, DiscInUchPlanIK);
      DataSet.Parameters.CreateParameter('@ik_uch_plan',ftInteger,pdInput, 0, ik_uch_plan);
      DataSet.Parameters.CreateParameter('@ik_disc',ftInteger,pdInput,0, DiscIK);
      DataSet.Parameters.CreateParameter('@ik_default_kaf',ftInteger,pdInput,0, KafedraIK);
      DataSet.Parameters.CreateParameter('@iHour_gos',ftInteger,pdInput,0, GOSHour);
      DataSet.Parameters.CreateParameter('@iIndivid',ftInteger,pdInput,0, IndividHour);
      DataSet.Parameters.CreateParameter('@ik_ckl_disc',ftInteger,pdInput,0,CycleIK);
      DataSet.Parameters.CreateParameter('@ik_grp_disc',ftInteger,pdInput,0,GroupIK);
      DataSet.Parameters.CreateParameter('@Cname_ckl_disc_gos',ftString, pdInput, 20, CodeGOS);
      DataSet.Parameters.CreateParameter('@ik_pgrp_disc',ftInteger,pdInput,0,PodGroupIK);
      DataSet.Parameters.CreateParameter('@ViborGroup',ftInteger, pdInput, 0, GroupViborNum);
      DataSet.Parameters.CreateParameter('@ik_spclz',ftInteger, pdInput, 0, SpclzIK);
      DataSet.Parameters.CreateParameter('@source_disc_uch_plan',ftInteger,pdInput, 0, 0);
      DataSet.Parameters.CreateParameter('@RETURN_VALUE',ftInteger, pdOutput, 0, 0); }
    {
      DataSet.Parameters.Clear;
      DataSet.ProcedureName:= 'UpdateDiscInUchPlan';
      DataSet.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
      DataSet.Parameters.CreateParameter('@ik_disc_uch_plan',ftInteger,pdInput, 0, 0);
      DataSet.Parameters.CreateParameter('@ik_uch_plan',ftInteger,pdInput, 0,0);
      DataSet.Parameters.CreateParameter('@ik_disc',ftInteger,pdInput,0, 0);
      DataSet.Parameters.CreateParameter('@ik_default_kaf',ftInteger,pdInput,0, 0);
      DataSet.Parameters.CreateParameter('@iHour_gos',ftInteger,pdInput,0, 0);
      DataSet.Parameters.CreateParameter('@iIndivid',ftInteger,pdInput,0, 0);
      DataSet.Parameters.CreateParameter('@ik_ckl_disc',ftInteger,pdInput,0,0);
      DataSet.Parameters.CreateParameter('@ik_grp_disc',ftInteger,pdInput,0,0);
      DataSet.Parameters.CreateParameter('@Cname_ckl_disc_gos',ftString,pdInput, 20, '');
      DataSet.Parameters.CreateParameter('@ik_pdgrp_disc',ftInteger,pdInput,0,0);
      DataSet.Parameters.CreateParameter('@ViborGroup',ftInteger,pdInput,0,0);
      DataSet.Parameters.CreateParameter('@source_disc_uch_plan',ftInteger,pdInput, 0, 0);
    }
    { try
      //DataSet.ExecProc;
      new_ik_disc_uch_plan:= DataSet.Parameters.ParamByName('@RETURN_VALUE').Value; }

    dm.qContentUchPlan_temp.Close;
    dm.qContentUchPlan_temp.SQL.Clear;
    dm.qContentUchPlan_temp.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(new_ik_disc_uch_plan));
    dm.qContentUchPlan_temp.ExecSQL;
    dm.qContentUchPlan_temp.Open;
    dm.qContentUchPlan_temp.first;

    dm.qContentUchPlan.Close;
    dm.qContentUchPlan.SQL.Clear;
    dm.qContentUchPlan.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(DiscInUchPlanIK));
    dm.qContentUchPlan.ExecSQL;
    dm.qContentUchPlan.Open;

    dm.qContentUchPlan.first;
    while not dm.qContentUchPlan.Eof do
    begin
      dm.qContentUchPlan_temp.Insert;
      dm.qContentUchPlan_temp.FieldByName('iK_disc_uch_plan').value :=
        new_ik_disc_uch_plan;
      dm.qContentUchPlan_temp.FieldByName('iK_vid_zanyat').value :=
        dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value;
      dm.qContentUchPlan_temp.FieldByName('i_hour_per_week').value :=
        dm.qContentUchPlan.FieldByName('i_hour_per_week').value;
      dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
        dm.qContentUchPlan.FieldByName('n_sem').value;
      dm.qContentUchPlan_temp.FieldByName('ik_kaf').value :=
        dm.qContentUchPlan.FieldByName('ik_kaf').value;
      dm.qContentUchPlan_temp.Post;
      dm.qContentUchPlan.Next;
    end;
    dm.qContentUchPlan_temp.UpdateBatch;

    tempDS := TGeneralController.Instance.GetNewADODataSet(true);
    tempDS.CommandText :=
      'SELECT * FROM UchPlan_WeekCount_Exception WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ')';
    tempDS.Open;

    tempDS_new := TGeneralController.Instance.GetNewADODataSet(true);
    tempDS_new.CommandText :=
      'SELECT * FROM UchPlan_WeekCount_Exception WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(new_ik_disc_uch_plan) + ')';
    tempDS_new.Open;

    if tempDS.RecordCount > 0 then
    begin
      tempDS.first;
      while not tempDS.Eof do
      begin
        if dm.qContentUchPlan.Locate('ik_upcontent',
          tempDS.FieldByName('ik_upcontent').value, [loPartialKey]) then
          if dm.qContentUchPlan_temp.Locate
            ('ik_vid_zanyat; n_sem; ik_kaf; i_hour_per_week',
            VarArrayOf([dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value,
            dm.qContentUchPlan.FieldByName('n_sem').value,
            dm.qContentUchPlan.FieldByName('i_hour_per_week').value,
            dm.qContentUchPlan.FieldByName('ik_kaf').value]), [loPartialKey])
          then

          begin
            tempDS_new.Insert;
            tempDS_new.FieldByName('ik_upContent').AsInteger :=
              dm.qContentUchPlan_temp.FieldByName('ik_upContent').AsInteger;
            tempDS_new.FieldByName('week_count').AsInteger :=
              tempDS.FieldByName('week_count').AsInteger;
            tempDS_new.Post;
          end;

        tempDS.Next;
      end;
      tempDS_new.UpdateBatch();
    end;

    if tempDS.Active then
      tempDS.Close;
    if tempDS_new.Active then
      tempDS_new.Close;
    FreeAndNil(tempDS);
    FreeAndNil(tempDS_new);

    dm.DBConnect.CommitTrans;

  except
    dm.DBConnect.RollbackTrans;
    FreeAndNil(tempDS);
    FreeAndNil(tempDS_new);
    raise;
  end;

  if dm.qContentUchPlan.Active then
    dm.qContentUchPlan.Close;
  if dm.qContentUchPlan_temp.Active then
    dm.qContentUchPlan_temp.Close;

end;

procedure TUchPlanController.ReplaseDisc(ik_uch_plan: integer;
  var ik_disc_uch_plan_temp: integer; DiscInUchPlanIK: integer;
  CycleIK, GroupIK, PodGroupIK, DiscIK, KafedraIK, GOSHour, IndividHour,
  GroupViborNum, SpclzIK: integer; CodeGOS: string);
var
  DataSet: TADOStoredProc;
  tempDS, tempDS_new: TADODataSet;
  i_hour_per_week: integer;
  IK_vz_List, IK_vz_List_old, IK_nsem_List, ik_kaf_list, IK_nsem_List_old,
    ik_kaf_list_old: TStringList;
  i, j: integer;
  vz_chek: boolean;
begin

  try
    dm.DBConnect.BeginTrans;
    with dm.aspUpdateDiscInPlan do
    begin
      Connection := dm.DBConnect;
      Parameters.ParamByName('@i_type').value := 2;
      Parameters.ParamByName('@ik_disc_uch_plan').value :=
        ik_disc_uch_plan_temp;
      Parameters.ParamByName('@ik_uch_plan').value := ik_uch_plan;
      Parameters.ParamByName('@ik_disc').value := DiscIK;
      Parameters.ParamByName('@ik_default_kaf').value := KafedraIK;
      Parameters.ParamByName('@iHour_gos').value := GOSHour;
      Parameters.ParamByName('@iIndivid').value := IndividHour;
      Parameters.ParamByName('@ik_ckl_disc').value := CycleIK;
      Parameters.ParamByName('@ik_grp_disc').value := GroupIK;
      Parameters.ParamByName('@Cname_ckl_disc_gos').value := CodeGOS;
      Parameters.ParamByName('@ik_pdgrp_disc').value := PodGroupIK;
      Parameters.ParamByName('@ViborGroup').value := GroupViborNum;
      Parameters.ParamByName('@ik_spclz').value := SpclzIK;
      try
        ExecProc;
        ik_disc_uch_plan_temp := Parameters.ParamByName('@RETURN_VALUE').value;
      finally

      end;
    end;
    { DataSet:= TGeneralController.Instance.GetNewADOStoredProc('UpdateDiscInUchPlan318', false);
      DataSet.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 2);
      DataSet.Parameters.CreateParameter('@ik_disc_uch_plan',ftInteger,pdInput, 0, ik_disc_uch_plan_temp);
      DataSet.Parameters.CreateParameter('@ik_uch_plan',ftInteger,pdInput, 0, ik_uch_plan);
      DataSet.Parameters.CreateParameter('@ik_disc',ftInteger,pdInput,0, DiscIK);
      DataSet.Parameters.CreateParameter('@ik_default_kaf',ftInteger,pdInput,0, KafedraIK);
      DataSet.Parameters.CreateParameter('@iHour_gos',ftInteger,pdInput,0, GOSHour);
      DataSet.Parameters.CreateParameter('@iIndivid',ftInteger,pdInput,0, IndividHour);
      DataSet.Parameters.CreateParameter('@ik_ckl_disc',ftInteger,pdInput,0,CycleIK);
      DataSet.Parameters.CreateParameter('@ik_grp_disc',ftInteger,pdInput,0,GroupIK);
      DataSet.Parameters.CreateParameter('@Cname_ckl_disc_gos',ftString, pdInput, 20, CodeGOS);
      DataSet.Parameters.CreateParameter('@ik_pgrp_disc',ftInteger,pdInput,0,PodGroupIK);
      DataSet.Parameters.CreateParameter('@ViborGroup',ftInteger, pdInput, 0, GroupViborNum);

      try
      DataSet.Open;
      ik_disc_uch_plan_temp:= DataSet.FieldByName('ReturnValue').AsInteger;
      finally
      DataSet.Close;
      DataSet.Free;
      end; }

    dm.qContentUchPlan_temp.Close;
    dm.qContentUchPlan_temp.SQL.Clear;
    dm.qContentUchPlan_temp.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(ik_disc_uch_plan_temp));
    dm.qContentUchPlan_temp.ExecSQL;
    dm.qContentUchPlan_temp.Open;
    dm.qContentUchPlan_temp.first;

    dm.qContentUchPlan.Close;
    dm.qContentUchPlan.SQL.Clear;
    dm.qContentUchPlan.SQL.Add
      ('Select * From Content_UchPl Where ik_disc_uch_plan = ' +
      IntToStr(DiscInUchPlanIK));
    dm.qContentUchPlan.ExecSQL;
    dm.qContentUchPlan.Open;

    IK_vz_List := TStringList.Create;
    dm.qContentUchPlan.first; // прочитаем виды занятий которые есть в таблице
    while (not dm.qContentUchPlan.Eof) do
    begin
      vz_chek := false;
      if IK_vz_List.Count > 0 then
        for i := 0 to IK_vz_List.Count - 1 do
          if dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
            .AsString = IK_vz_List[i] then
          begin
            vz_chek := true;
            break;
          end;
      if not vz_chek then
        IK_vz_List.Add(dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
          .AsString);
      dm.qContentUchPlan.Next;
    end;

    IK_vz_List_old := TStringList.Create;
    dm.qContentUchPlan_temp.first;
    // прочитаем виды занятий которые есть в таблице
    while (not dm.qContentUchPlan_temp.Eof) do
    begin
      vz_chek := false;
      if IK_vz_List_old.Count > 0 then
        for i := 0 to IK_vz_List_old.Count - 1 do
          if dm.qContentUchPlan_temp.FieldByName('ik_vid_zanyat')
            .AsString = IK_vz_List_old[i] then
          begin
            vz_chek := true;
            break;
          end;
      if not vz_chek then
        IK_vz_List_old.Add(dm.qContentUchPlan_temp.FieldByName('ik_vid_zanyat')
          .AsString);
      dm.qContentUchPlan_temp.Next;
    end;

    if IK_vz_List.Count > 0 then
    begin
      IK_nsem_List := TStringList.Create;
      IK_nsem_List_old := TStringList.Create;
      ik_kaf_list := TStringList.Create;
      ik_kaf_list_old := TStringList.Create;
      for i := 0 to IK_vz_List.Count - 1 do
      begin
        IK_nsem_List.Clear;
        ik_kaf_list.Clear;
        dm.qContentUchPlan.first;
        // прочитаем номера семестров которые есть в таблице
        while (not dm.qContentUchPlan.Eof) do
        begin
          if dm.qContentUchPlan.FieldByName('ik_vid_zanyat')
            .AsString = IK_vz_List[i] then
          begin
            IK_nsem_List.Add(dm.qContentUchPlan.FieldByName('n_sem').AsString);
            ik_kaf_list.Add(dm.qContentUchPlan.FieldByName('ik_kaf').AsString);
          end;
          dm.qContentUchPlan.Next;
        end;

        IK_nsem_List_old.Clear;
        ik_kaf_list_old.Clear;
        dm.qContentUchPlan_temp.first;
        // прочитаем номера семестров которые есть в таблице
        while (not dm.qContentUchPlan_temp.Eof) do
        begin
          if dm.qContentUchPlan_temp.FieldByName('ik_vid_zanyat')
            .AsString = IK_vz_List[i] then
          begin
            IK_nsem_List_old.Add(dm.qContentUchPlan_temp.FieldByName('n_sem')
              .AsString);
            ik_kaf_list_old.Add(dm.qContentUchPlan_temp.FieldByName('ik_kaf')
              .AsString);
          end;
          dm.qContentUchPlan_temp.Next;
        end;

        if IK_nsem_List.Count > 0 then
        begin

          case StrToInt(IK_vz_List[i]) of
            6, 7, 8, 9, 27, 33: // виды занятий с ведомостями
              begin

                // for j:=0 to IK_nsem_List.Count-1 do
                j := 0;
                while j <> IK_nsem_List.Count do
                begin
                  if (IK_nsem_List_old.IndexOf(IK_nsem_List[j]) <> -1)
                  // удаление повторений
                    and (ik_kaf_list_old
                    [IK_nsem_List_old.IndexOf(IK_nsem_List[j])] = ik_kaf_list[j])
                  then
                  begin
                    ik_kaf_list_old.Delete
                      (IK_nsem_List_old.IndexOf(IK_nsem_List[j]));
                    ik_kaf_list.Delete(j);
                    IK_nsem_List_old.Delete
                      (IK_nsem_List_old.IndexOf(IK_nsem_List[j]));
                    IK_nsem_List.Delete(j);
                  end
                  else
                    inc(j);
                end;

                while IK_nsem_List.Count > 0 do // оставшиеся в новом списке
                begin
                  if IK_nsem_List_old.Count > 0 then // оставшиеся в старом
                  begin
                    if not dm.qContentUchPlan_temp.Locate
                      ('ik_vid_zanyat; n_sem; ik_kaf',
                      VarArrayOf([IK_vz_List[i], IK_nsem_List[0],
                      ik_kaf_list[0]]), [loPartialKey]) then
                      if dm.qContentUchPlan_temp.Locate
                        ('ik_vid_zanyat; n_sem; ik_kaf',
                        VarArrayOf([IK_vz_List[i], IK_nsem_List_old[0],
                        ik_kaf_list_old[0]]), [loPartialKey]) then
                      begin // редактирование прежних записей
                        dm.qContentUchPlan_temp.Edit;
                        dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
                          IK_nsem_List[0];
                        dm.qContentUchPlan_temp.FieldByName('ik_kaf').value :=
                          ik_kaf_list[0];
                        dm.qContentUchPlan_temp.Post;

                        ik_kaf_list_old.Delete(0);
                        IK_nsem_List_old.Delete(0);
                      end;

                    ik_kaf_list.Delete(0);
                    IK_nsem_List.Delete(0);
                  end
                  else
                  begin // вставка новой, если такой еще нет
                    if not dm.qContentUchPlan_temp.Locate
                      ('ik_vid_zanyat; n_sem; ik_kaf',
                      VarArrayOf([IK_vz_List[i], IK_nsem_List[0],
                      ik_kaf_list[0]]), [loPartialKey]) then
                    begin
                      dm.qContentUchPlan_temp.Insert;
                      dm.qContentUchPlan_temp.FieldByName('ik_vid_zanyat').value
                        := IK_vz_List[i];
                      dm.qContentUchPlan_temp.FieldByName('ik_disc_uch_plan')
                        .value := ik_disc_uch_plan_temp;
                      dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
                        IK_nsem_List[0];
                      dm.qContentUchPlan_temp.FieldByName('ik_kaf').value :=
                        ik_kaf_list[0];
                      dm.qContentUchPlan_temp.Post;
                    end;

                    ik_kaf_list.Delete(0);
                    IK_nsem_List.Delete(0);
                  end;
                end; // конец   while IK_nsem_List.Count>0

                while IK_nsem_List_old.Count > 0 do
                // оставшиеся в старом списке
                begin
                  if dm.qContentUchPlan_temp.Locate
                    ('ik_vid_zanyat; n_sem; ik_kaf',
                    VarArrayOf([IK_vz_List[i], IK_nsem_List_old[0],
                    ik_kaf_list_old[0]]), [loPartialKey]) then
                    dm.qContentUchPlan_temp.Delete;

                  IK_nsem_List_old.Delete(0);
                  ik_kaf_list_old.Delete(0);
                end;
              end;

          else // case виды занятий без ведомостей
            begin

              j := 0;
              while j <> IK_nsem_List.Count do
              begin
                dm.qContentUchPlan.Locate('ik_vid_zanyat; n_sem; ik_kaf',
                  VarArrayOf([IK_vz_List[i], IK_nsem_List[j], ik_kaf_list[j]]),
                  [loPartialKey]);
                dm.qContentUchPlan_temp.Locate('ik_vid_zanyat; n_sem; ik_kaf',
                  VarArrayOf([IK_vz_List[i],
                  IK_nsem_List_old[IK_nsem_List_old.IndexOf(IK_nsem_List[j])],
                  ik_kaf_list_old[IK_nsem_List_old.IndexOf(IK_nsem_List[j])]]),
                  [loPartialKey]);
                if (IK_nsem_List_old.IndexOf(IK_nsem_List[j]) <> -1)
                // удаление повторений
                  and (ik_kaf_list_old[IK_nsem_List_old.IndexOf(IK_nsem_List[j])
                  ] = ik_kaf_list[j]) and
                  (dm.qContentUchPlan.FieldByName('i_hour_per_week')
                  .AsInteger = dm.qContentUchPlan_temp.FieldByName
                  ('i_hour_per_week').AsInteger) then
                begin
                  ik_kaf_list_old.Delete
                    (IK_nsem_List_old.IndexOf(IK_nsem_List[j]));
                  ik_kaf_list.Delete(j);
                  IK_nsem_List_old.Delete
                    (IK_nsem_List_old.IndexOf(IK_nsem_List[j]));
                  IK_nsem_List.Delete(j);
                end
                else
                  inc(j);
              end;

              while IK_nsem_List.Count > 0 do // оставшиеся в новом списке
              begin
                if dm.qContentUchPlan.Locate('ik_vid_zanyat; n_sem; ik_kaf',
                  VarArrayOf([IK_vz_List[i], IK_nsem_List[0], ik_kaf_list[0]]),
                  [loPartialKey]) then
                  i_hour_per_week := dm.qContentUchPlan.FieldByName
                    ('i_hour_per_week').AsInteger
                else
                  i_hour_per_week := 0;

                if IK_nsem_List_old.Count > 0 then // оставшиеся в старом
                begin

                  if dm.qContentUchPlan_temp.Locate
                    ('ik_vid_zanyat; n_sem; ik_kaf',
                    VarArrayOf([IK_vz_List[i], IK_nsem_List_old[0],
                    ik_kaf_list_old[0]]), [loPartialKey]) then
                  begin // редактирование прежних записей
                    dm.qContentUchPlan_temp.Edit;
                    dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
                      IK_nsem_List[0];
                    dm.qContentUchPlan_temp.FieldByName('ik_kaf').value :=
                      ik_kaf_list[0];
                    dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
                      IK_nsem_List[0];
                    if i_hour_per_week <> 0 then
                      dm.qContentUchPlan_temp.FieldByName('i_hour_per_week')
                        .value := i_hour_per_week;
                    dm.qContentUchPlan_temp.Post;

                    ik_kaf_list_old.Delete(0);
                    IK_nsem_List_old.Delete(0);
                  end;

                  ik_kaf_list.Delete(0);
                  IK_nsem_List.Delete(0);
                end
                else
                begin // вставка новой, если такой еще нет
                  dm.qContentUchPlan_temp.Insert;
                  dm.qContentUchPlan_temp.FieldByName('ik_vid_zanyat').value :=
                    IK_vz_List[i];
                  dm.qContentUchPlan_temp.FieldByName('ik_disc_uch_plan').value
                    := ik_disc_uch_plan_temp;
                  dm.qContentUchPlan_temp.FieldByName('n_sem').value :=
                    IK_nsem_List[0];
                  dm.qContentUchPlan_temp.FieldByName('ik_kaf').value :=
                    ik_kaf_list[0];
                  if i_hour_per_week <> 0 then
                    dm.qContentUchPlan_temp.FieldByName('i_hour_per_week').value
                      := i_hour_per_week;
                  dm.qContentUchPlan_temp.Post;

                  ik_kaf_list.Delete(0);
                  IK_nsem_List.Delete(0);
                end;
              end; // конец   while IK_nsem_List.Count>0

              while IK_nsem_List_old.Count > 0 do // оставшиеся в старом списке
              begin
                if dm.qContentUchPlan_temp.Locate
                  ('ik_vid_zanyat; n_sem; ik_kaf',
                  VarArrayOf([IK_vz_List[i], IK_nsem_List_old[0],
                  ik_kaf_list_old[0]]), [loPartialKey]) then
                  dm.qContentUchPlan_temp.Delete;

                IK_nsem_List_old.Delete(0);
                ik_kaf_list_old.Delete(0);
              end;

            end;
          end; // конец case

        end // конец if IK_nsem_List.Count>0 then
        else // удаление
        begin
          while IK_nsem_List_old.Count > 0 do // оставшиеся в старом списке
          begin
            if dm.qContentUchPlan_temp.Locate('ik_vid_zanyat; n_sem; ik_kaf',
              VarArrayOf([IK_vz_List[i], IK_nsem_List_old[0], ik_kaf_list_old[0]
              ]), [loPartialKey]) then
              dm.qContentUchPlan_temp.Delete;

            IK_nsem_List_old.Delete(0);
            ik_kaf_list_old.Delete(0);
          end;
        end;
        if IK_vz_List_old.IndexOf(IK_vz_List[i]) <> -1 then
          IK_vz_List_old.Delete(IK_vz_List_old.IndexOf(IK_vz_List[i]));
      end; // конец цикла for i:=0 to ik_vz_List.Count-1 do
      while IK_vz_List_old.Count > 0 do
      begin
        while dm.qContentUchPlan_temp.Locate('ik_vid_zanyat', IK_vz_List_old[0],
          [loPartialKey]) do
          dm.qContentUchPlan_temp.Delete;
        IK_vz_List_old.Delete(0);
      end;
    end
    else // конец if ik_vz_List.Count>0 then
    // пустая дисциплина, нет видов занятий, удаление всех записей
    begin
      dm.qContentUchPlan_temp.first;
      while (not dm.qContentUchPlan_temp.Eof) do
        dm.qContentUchPlan_temp.Delete;
    end;

    dm.qContentUchPlan_temp.UpdateBatch;

    // проверка исключений
    tempDS := TGeneralController.Instance.GetNewADODataSet(true);
    tempDS.CommandText :=
      'SELECT * FROM UchPlan_WeekCount_Exception WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(DiscInUchPlanIK) + ')';
    tempDS.Open;

    tempDS_new := TGeneralController.Instance.GetNewADODataSet(true);
    tempDS_new.CommandText :=
      'SELECT * FROM UchPlan_WeekCount_Exception WHERE ik_upContent in (SELECT ik_upContent FROM Content_UchPl WHERE ik_disc_uch_plan = '
      + IntToStr(ik_disc_uch_plan_temp) + ')';
    tempDS_new.Open;

    if tempDS.RecordCount > 0 then
    begin
      tempDS.first;
      while not tempDS.Eof do
      begin
        if dm.qContentUchPlan.Locate('ik_upcontent',
          tempDS.FieldByName('ik_upcontent').value, [loPartialKey]) then
          if dm.qContentUchPlan_temp.Locate
            ('ik_vid_zanyat; n_sem; ik_kaf; i_hour_per_week',
            VarArrayOf([dm.qContentUchPlan.FieldByName('iK_vid_zanyat').value,
            dm.qContentUchPlan.FieldByName('n_sem').value,
            dm.qContentUchPlan.FieldByName('i_hour_per_week').value,
            dm.qContentUchPlan.FieldByName('ik_kaf').value]), [loPartialKey])
          then

          begin
            tempDS_new.Insert;
            tempDS_new.FieldByName('ik_upContent').AsInteger :=
              dm.qContentUchPlan_temp.FieldByName('ik_upContent').AsInteger;
            tempDS_new.FieldByName('week_count').AsInteger :=
              tempDS.FieldByName('week_count').AsInteger;
            tempDS_new.Post;
          end;

        tempDS.Next;
      end;
      tempDS_new.UpdateBatch();
    end;

    if tempDS.Active then
      tempDS.Close;
    if tempDS_new.Active then
      tempDS_new.Close;
    FreeAndNil(tempDS);
    FreeAndNil(tempDS_new);

    FreeAndNil(IK_vz_List);
    FreeAndNil(IK_vz_List_old);
    FreeAndNil(IK_nsem_List);
    FreeAndNil(IK_nsem_List_old);
    FreeAndNil(ik_kaf_list);
    FreeAndNil(ik_kaf_list_old);

    dm.DBConnect.CommitTrans;

  except
    dm.DBConnect.RollbackTrans;
    if tempDS.Active then
      tempDS.Close;
    if tempDS_new.Active then
      tempDS_new.Close;
    FreeAndNil(tempDS);
    FreeAndNil(tempDS_new);
    FreeAndNil(IK_vz_List);
    FreeAndNil(IK_vz_List_old);
    FreeAndNil(IK_nsem_List);
    FreeAndNil(IK_nsem_List_old);
    FreeAndNil(ik_kaf_list);
    FreeAndNil(ik_kaf_list_old);
    raise;
  end;

  if dm.qContentUchPlan.Active then
    dm.qContentUchPlan.Close;
  if dm.qContentUchPlan_temp.Active then
    dm.qContentUchPlan_temp.Close;

end;

end.
