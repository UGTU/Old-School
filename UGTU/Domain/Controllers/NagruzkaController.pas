{-----------------------------------------------------------
  Модуль NagruzkaController - содержит:
      TNagruzkaController - контроллер подсистемы "Учет учебной нагрузки"
      TFactGrid -
      TFactEvent -
  Дата создания: 5.03.2007
  Дата последнего изменения: 1.04.2007
  Разработчик: Павловский Михаил
-----------------------------------------------------------}
unit NagruzkaController;
  {#Author villain@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Controls, ADODB, DB, ComCtrls, Contnrs,
  Variants, StdCtrls, GeneralController, NagruzkaClasses, Forms;

type
  // интерфейс отвечающий за загрузку данных из справочников, выделен в соответсвии с шаблоном "Реестр"

  INagruzkaDirectory = interface
  ['{17A87332-E2D7-4541-9FE9-CB815A61C186}']
    function GetAllYears(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
//    function GetYearIntervals(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
    function GetAllSemesters(SourceDataSet: PDataSet): Variant;
    function GetAllPlanTypes(SourceDataSet: PDataSet): Variant;
    function GetAllWorkType(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllDegrees(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllRanks(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllFacultyes(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllDepartments(SourceDataSet: PDataSet; FacultyIK: integer; isShowFirst: boolean): Variant;
    function GetAllDecomposeType(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllYearsForGrup(SourceDataSet: PDataSet; defValue:Variant): Variant;
    function GetAllYearsForSpec(SourceDataSet: PDataSet; FacultyIK: Variant; isShowFirst: boolean; defValue:Variant): Variant;
    function GetAllTeachers(SourceDataSet: PDataSet): Variant;
    function GetDepartmentName(KafIK: integer; isNeedShortName: boolean): string;
    function GetFacultyName(FacIK: integer; isNeedShortName: boolean): string;
    function GetDiscName(DiscIK: integer): string;
    function GetSemesterName(YearIK, SemIK: integer): string;
    procedure GetAvailFac(SourceDataSet: PDataSet);
  end;

  ICommonNagruzkaController = interface
  ['{1CA437BE-7BD1-4C2B-8CBE-8C4D267BE679}']     

//    function GetCalcUnitsForShedule(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, VidNagruzkiIK: integer; isShowFirst: boolean; dopConditions: string; defaultValue: Variant): Variant;
    procedure DeleteKafedra(KafedraIK: integer);
    procedure ExportAllNagrByFaculty(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
    procedure ExportCompireByYears(YearOneIK, YearTwoIK, TypeEdIK: integer; YearOneName, YearTwoName: string; ProgressBar: TProgressBar);
    procedure ExportAllFactNagrByFaculty(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
    procedure ExportAllNagrByFacultyForStaffCalc(YearIK, TypeEdIK: integer; YearName: string; ProgressBar: TProgressBar);
  end;

  // контроллер отвечающий за подготовку данных, необходимых для расчета нагрузки

  IPreparationNagruzkaController = interface
  ['{E4DA6D1E-8A9A-46C0-83F4-081C0D3957D2}']
    function AddPotokShemaTreeNode(ShemaUnionNode: TTreeNode; ShemaIK: integer; ShemaName: string; PotokIK: integer; PotokName: string; ATreeView: TTreeView): TTreeNode;
    function AddPotokShemaUnionTreeNode(PotokNode: TTreeNode; PotokSemIK: integer; PotokName: string; ATreeView: TTreeView): TTreeNode;
  //  function AddPotokTreeNode(PotokIK: integer; PotokName: string; ATreeView: TTreeView; AYearNode: TTreeNode; isNeedLoad: boolean): TTreeNode;
    procedure AutoDistributeContingentBetweenCalcUnits(PotokIK, DecomposeTypeIK: integer; tempPSYC: TPotokShemaYearContingent);
 //   procedure BuildPotokTree(KafedraIK: integer; ATreeView: TTreeView; FilterText: string);
    function CountOfSeparatedGroupsInPotok(PotokIK: integer): integer;
    function CountOfSpecialitiesInPotok(PotokIK: integer): integer;
    procedure CloseNormOfTime();
    function CheckForSpecContingentExists(PotokIK, PlanIK, CourseNumber: integer): boolean;function GetAllGroupsFromPotok(SourceDataSet: PDataSet; PotokIK: integer; isShowFirst: boolean): Variant;
    function GetAllUchPlanForAddPotok(SourceDataSet: PDataSet; FacultyIK: Variant; YearIK: integer; isShowFirst: boolean; defValue:Variant): Variant;
    function GetAllNormsOfTimeForAddPotok(SourceDataSet: PDataSet; YearIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetAllUchPlanForPotok(SourceDataSet: PDataSet; PotokIK: integer): Variant;
    function GetDefaultUchPlanForPotok(PotokIK: integer): Variant;
    function GetAllGroupsStudyAtYear(SourceDataSet: PDataSet; YearIK: integer): Variant;
    function GetPotokFromShema(calcUnitIK: integer): integer;
    function GetSpecContingentFromPotok(SourceDataSet: PDataSet; PotokIK, YearIK: integer; isShowFirst: boolean): boolean;
    function GetSepGroupContingentFromPotok(SourceDataSet: PDataSet; PotokIK, YearIK: integer; isShowFirst: boolean): boolean;
    function GetCurrentGroupContingentFromPotok(SourceDataSet: PDataSet; PotokIK, YearValue: integer; isShowFirst: boolean): boolean;
    procedure GetFacForDepByUchPlan(SourceDataSet: PDataSet; KafedraIK: integer);
    function GetPotokShemaInfo(ShemaIK: integer; var DecomposeType: integer; var ShemaName: string): boolean;
    function GetPotokSemShemaInfo(PotokSemIK: integer): boolean;
    function GetNormsOfTime(SourceDataSet: PDataSet; FacultyIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetAllNormsOfTime(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
    function GetCalcUnitContingent(SourceDataSet: PDataSet; ShemaIK, YearIK: integer): boolean;
    function GetAllShemasOfPotok(SourceDataSet: PDataSet; PotokIK: integer): Variant;
    function GetPotoksWithSameSpecFac(specList, groupList: TStringList; YearPost: integer): TList;
    function GetPlanContingentOfSeparatedGroups(FacIK, YearIK: integer): TDataSet;
    function GetUchPlanOfAnyGroupOfSpec(SpecIK, YearIK: integer): Variant;
    function GetUchPlanOfGroup(GroupIK: integer): Variant;

    function GetTeacherFIO(TeahcerIK: integer): string;
    function GetPrepodWorkTypesInfo(AKafIK, ATabN: integer): TDataSet;
    procedure GetAllPrepInKaf(SourceDataSet: PDataSet; KafedraIK: integer);
    procedure GetAllWorkedPrepInKaf(SourceDataSet: PDataSet; KafedraIK, YearIK, SemTypeIK: integer);
    function GetAllPrepWorkTypes(SourceDataSet: PDataSet; TabN, KafedraIK, YearIK, SemTypeIK: integer; isShowFirst: boolean): Variant;
    function GetTabNFromTeacherIK(TeacherIK: integer): integer;
    function GetWorkTypeFromTeacherIK(TeacherIK: integer): integer;
    function GetKafedraIKFromTeacherIK(TeacherIK: integer): integer;
    function GetAlowedWorkTypes(SourceDataSet: PDataSet; TabN, KafedraIK: integer; SemStart: TDate; dopConditions: string; defValue: Variant): Variant;
    function GetAllYearsForShemes(SourceDataSet: PDataSet; PotokIK: integer; isShowFirst: boolean): Variant;
    function GetAllYearsForDepByUchPlan(SourceDataSet: PDataSet; KafedraIK, FacultyIK: integer; defValue:Variant): Variant;

    function RebuildPotokName(aPotokSpec: TSpecNodes; aFacIK: integer): string;
    function GetPotokName(PotokSemIK: integer): string;

    function GetPlanContingent(aPotokSemIK: integer; var aDSet: TADODataSet):TPlanPotokInfos;
    function GetAutoCalcUnits(aPotokSemIK, aDecomposeType,aShemaIK: integer): TSemesterCalcUnits;
    function SearchPrepAtAnotherKaf(ALastName, AFirstName, ACotch: string; var findTabN, findKafIK, findFacIK: integer): boolean;
    function  DeletePrepodFromKafedra(ATabN, AKafedraIK: integer): boolean;
    function SaveTeacher(AIsAddExists: boolean; ATabN, AKafedraIK: integer; ALastName, AFirstName, AMiddleName: string; ARankID, ADegreeID: Variant): boolean;
    procedure ExportTeacherList(KafedraIK: integer; ProgressBar: TProgressBar);

    procedure DeleteNormOfTime(NormOfTimeIK: integer);
    procedure DeletePotok(PotokIK, KafIK: integer);
    procedure DeleteShemaOfPotok(ShemaIK: integer);
    function LoadContentNormOfTime(NormIK: Integer; var NormForDisc, NormForPractice: PDataSet): boolean;
    function LoadPotokNodeInfo(ATreeView: TTreeView; PotokNode: TTreeNode): boolean;
    function SaveNormOfTime(var NormIK: integer; UsedNormIK, SpecIK: Variant; YearIK: integer): boolean;
    function SaveContentNormOfTime(NormIK: integer): boolean;
    function SavePlanNormTime(aKafIK, aYearIK, aSemIK: integer): boolean;

    function SavePotokSheme(shemaIK, potokIK, decomposeTypeIK: integer; shemaName: string; fPotokShemaContingent: TList; dsCalcUnits: PDataSet; CheckContingent: boolean):boolean;
    function SavePotokSemesterShema(potokSemIK: integer; fPotokShemas: TPotokSemesterShemas):boolean;
    function SaveSemesterCalcUnit(Tag: integer; shemaIK, cuIK: integer; cName: string; budg,cont: integer; GroupList: TStringList): boolean;
    function SavePotok(isAddExistPotok: boolean; PotokIK: integer; PotokName: string; KafedraIK, NormOfTimeIK: integer; aPotokSpec: TSpecNodes; YIK, SIK: integer): boolean;
    function CreatePotokByGroups(KafedraIK, YearIK: integer; aPotokSpec: TSpecNodes): boolean;
    function SavePlanContingentOfSepGroups(YearIK: integer): boolean;
    function LoadPotoksToSemester(KafedraIK, YeaкIK, SemIK: integer; PotokIK: TStringList): boolean;
  end;

  // контроллер отвечающий за плановую нагрузку

  IPlanNagruzkaController = interface
  ['{BD6F355A-A9E5-48A6-AA66-FC254EE8C57B}']
    procedure CloseContentPlanNagr();
    procedure ClosePlanNormTime();

    //function GetPlanName(PlanIK: integer): string;

    function GetAllTeacherPlanHour(PlanIK, TeacherIK: integer): double;
    function GetAllSemesterPlanHour(YearIK, SemIK, TeacherIK: integer): double;
    function GetAllSemesterPlanHourForTeacher(YearIK, SemIK, KafedraIK, TabN: integer): double;
    function GetInCommissionNumbersFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetDisciplinesFromDepPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean): Variant;
    procedure GetDisciplinesFromPotok(SourceDataSet: PDataSet; PotokIK, PlanNagrIK: integer);
    function GetDisciplinesFromTeahcerPlan(SourceDataSet: PDataSet; PlanIK, TeacherIK: integer;  var planHour: double; isShowFirst, isNeedCalc: boolean; defaultValue: Variant): Variant;
    function GetPotoksFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetPotoksFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK: integer; isShowFirst: boolean): integer;
    function GetPotoksForPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean): Variant;
    function GetCalculationSchemeGrid(AOwner: TComponent; PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount: integer; ifDiscCalcAsPractice: boolean): double;
    function GetByPlanNumbers(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, CalcUnitIK, InCommissionNumber: integer; isShowFirst: boolean): Variant;
    function GetCalcUnits(UnitsOwner: TComponent; TeacherIK, ContentPlannagrIK, MinContingent: integer; NormPerUnit, NormPerUnitForMin: double): TObjectList;
    function GetUchPlanParametrsForCalcUnit(UchPlanIK, SemesterNumber, ContentPlanNagrIK, VidZanyatIK: integer; var inPlanHour: double; var inPlanCount: integer; taskCounts: TStringList; var WeekInPlanCount: integer): boolean;
    function GetSemesterNumberForPotok(PotokIK, PlanIK: integer): integer; overload;
    function GetSemesterNumberForPotok(ContentPlanNagrIK: integer): integer; overload;
    function GetDistributedNagr(PlanIK, DiscIK, PotokSemIK: integer): TDataSet;
    function GiveDutyToAnotherTeacher(SourceTeacherIK, TargetTeacherIK, PlanIK, DiscIK, PotokIK, ContentPlanNagrIK: integer): boolean;
    procedure GetPickListForVidNagruzki(PotokIK, DiscIK, DiscTypeIK, VidZanyatIK: integer; outputPickList: TStrings);
    procedure FullPickListForVidNagruzki(DiscIK, DiscTypeIK, VidZanyatIK: integer; outputPickList: TStrings);
    function GetVidZanyatsFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK, PotokIK: integer; isShowFirst: boolean): Variant;
    function GetVidNagruzkiFromDepPlan(SourceDataSet: PDataSet; PlanIK, DiscIK, PotokIK, VidZanyatIK: integer; isShowFirst: boolean): Variant;
    function GetVidZanyatFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK, PotokSemIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    procedure SetPlanStatus(PlanIK: integer; CloseStatus: boolean);
    function GetCurrentNormOfTime(VidZanyatIK, VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean; var NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; var MinContingent: integer): boolean;
    function GetDefaultNormOfTime(VidZanyatIK, VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean; var NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; var MinContingent: integer): boolean;
    function GetCalcUnitsFromTeacherPlan(SourceDataSet: PDataSet; TeacherIK, ContentPlanIK, InComissionNumber: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    function GetTeacherIKFromTeacherPlan(PlanIK, DiscIK, PotokIK, TeacherIK: integer): TADODataSet;
    function GetPlanHourForShedule(PrepodPlanIKList: string): double;
    procedure GetNormValues(NormIK, PlanIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK, ContentPlanNagrIK: integer; var NormPerUnit, NormPerStudent, MaxNormPerStudent: double; var MinRequedContingent: integer; var NormPerUnitForMin, NormPerStudentForMin: double);
    procedure GetPotokInfo(PlanIK, PotokSemIK: integer; var StudCount, Course, grupCount, subgroupCount: string);
    function GetPotokShemes(PlanIK, PotokIK: integer): TDataSet;
    function GetPlanHourForDiscipline(PlanIK, DiscIK, PotokIK: integer; var plan_hour, busy_hour: double): boolean;
    function GetPlans(SourceDataSet: PDataSet; KafedraIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetPlansForTeacher(SourceDataSet: PDataSet; TeacherIK, YearIK, SemIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetTeachersFromPlan(SourceDataSet: PDataSet; PlanIK: integer; isShowFirst: boolean; defaultValue: Variant): Variant;
    
    procedure DeletePlanNagr(PlanIK: integer);
    procedure DeleteDiscFromPlanNagr(PlanIK, PotokSemIK, DiscIK: Integer);
    function DeleteDiscFromTeacherPlanNagr(TeacherIK, PlanIK, DiscIK, PotokIK: integer): boolean;
    procedure DeleteVidZanyatFromTeacherPlanNagr(TeacherIK, PlanIK, DiscIK, PotokIK, VidZanyatIK, VidNagruzkiIK: integer);

    function DoIHavePermsOnNormException(): boolean;
    
    procedure ExportDitributedNagr(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportDitributedNagrForShedule(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportKafedraPlan(PlanIK: integer; ProgressBar: TProgressBar);
    procedure ExportKafedraPlanForYear(KafedraIK, YearIK: integer; ProgressBar: TProgressBar);
    
    function IsConflictOnAutoBuildExists(conflictList: TObjectList; AShemaTypeName, APotokName: string; AItemType: TConflictOnAutoBuildItemType): boolean;

    function LoadAllPlanNagr(PlanIK: integer): TDataSet;
    procedure LoadAllTeacherPlanNagr(SourceDataSet:PDataSet; PlanIK, TeacherIK: Integer; var AllPlanHour: double);
    function LoadContentPlanNagr(isEdit: boolean; PlanIK, PotokSemIK, DiscIK, DiscTypeIK{, semesterNumber}: Integer; DiscTypeCalcAsPractice: boolean; var DiscHour, RaspHour:double; isNeedCalc: boolean): TDataSet;
    function LoadTakeNagr(UnitsOwner: TComponent; PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK, TeacherIK: integer; ATakeNagr: TObjectList): TDataSet;
    procedure LoadPlanNagrByDiscAvto(planIK, DiscIK, PotokSemIK: integer; DiscName, PotokName: string; conflictDecomposeType: TObjectList);
    procedure LoadPlanNagrAvto(PlanIK: integer; conflictList: TObjectList);
    function LoadVidZanyatTaskCountInfo(VidZanyatIK, VidNagruzkiIK: integer; planNumberPickList: TStrings): TADODataSet;

    function SaveDiscToTeacher(TeacherIK: integer; ATakeNagr: TObjectList): boolean;
    function SaveContingient(YearIK, FacIK: integer; PlanContingentList: TObjectList): boolean;
    function SavePlan(var PlanIK: integer; KafedraIK, YearIK, SemTypeIK, TypeEdIK, FormEdIK: integer): boolean;
    function SavePlanContent(PlanIK, DiscIK, PotokIK: integer; DiscName, potokName: string; DiscTypeCalcAsPractice: boolean; conflictList: TObjectList): boolean;
    function SetNormOfTimeExceptionForCurrentDisc(DiscCalcAsPractice: boolean; VidZanyatIK, VidNagruzkiIK: integer; NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double; MinContingent: integer): boolean;

    procedure TakeAllNagrOnDiscToTeacher(TeacherIK, PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK: integer; ATakeNagr: TObjectList);

    //версия 4: работа с группами
    procedure GetSpecByFac(SourceDataSet: PDataSet; FacIK: integer; isShowFirst: boolean; defaultValue: Variant);
    procedure GetProfileBySpec(SourceDataSet: PDataSet; SpecFacIK: integer; isShowFirst: boolean; defaultValue: Variant);

    // версия 4: работа с потоками
    procedure AddGrupsToPotok(PotokSemestrID: integer; aGrups: TStringList);

    //удаление старой нагрузки по группам
    function DeleteOldNagrForGrup(YearIK, SemIK, DiscIK, KafIK: integer; aGrups: TStringList): boolean;

  end;

  // контроллер отвечающий за фактическую нагрузку

  IFactNagruzkaController = interface
  ['{577B6970-7DF6-47A0-8F89-FF9D960EE219}']
    function GetDisciplinesFromFact(SourceDataSet: PDataSet; TeacherIK, PlanIK: integer; isShowFirst: boolean): Variant;
    function GetPotoksFromFact(SourceDataSet: PDataSet; TeacherIK, PlanIK, DiscIK: integer; isShowFirst: boolean): Variant;
    function GetAllVedomost(PlanIK, CalcUnitIK, ShemaDecomposeType, DiscIK, VidZanyatIK, TeacherIK, PlanStudCount: integer; HourPerUnit: double; WorkDayStart: TTime): TObjectList;
    function DeleteDiscFromFactNagr(PlanIK, DiscIK, PotokIK, TeacherIK: integer): boolean;
    procedure ExportIndividTeacherPlan(PlanIK, TeacherIK: integer; ProgressBar: TProgressBar);
    procedure ExportFactResult(PlanIK: integer; ProgressBar: TProgressBar);
    function LoadAllTeacherFactNagr(SourceDataSet: PDataSet; PlanIK, TeacherIK: Integer; var allFactHour:double; incorrectList, correctList: TStringList): TDataSet;
    function LoadAdditionTeacherFact(PlanIK, TeacherIK, DiscIK: Integer; var DiscHour: double):  TDataSet;
    function LoadTakeFactNagr(TeahcerIK, PlanIK, PlanTeacherIK, DiscIK, PotokIK, PotokNormIK: integer; ASemStart, ASemStop: TDate; ATakeFactNagr: TObjectList): TDataSet;
    function LoadTakeFactNagrItem(isNeedCreate: boolean; var CreateItem: TTakeFactNagrItem; ContentPlanNagrIK, VidZanyatIK, VidZanyatTypeIK, VidZanyatTypeByTimeIK, VidNagruzkiIK: integer): TDataSet;
    function SaveFact(TeacherIK: integer; TakeFactNagr: TObjectList): boolean;
    function SaveAdditionFact(TeacherIK, PlanIK, DiscIK: integer): boolean;
    function SaveFactWithoutSheduler(TeacherIK: integer;  aTakeFactNagr: TObjectList): boolean;
    function GetAllSemesterFactHour(YearIK, SemIK, TeacherIK: integer): double;
    function GetAllSemesterFactHourForTeacher(YearIK, SemIK, KafedraIK, TabN: integer): double;
    function GetAllTeacherFacts(SourceDataSet: PDataSet; KafedraIK, TabN: integer; isShowFirst: boolean): Variant;
  end;

  TNagruzkaController = class
  private
    class var fNagruzkaDirectory: INagruzkaDirectory;
    class var fPlanNagruzkaInstance: IPlanNagruzkaController;
    class var fFactNagruzkaInstance: IFactNagruzkaController;
    class var fPreparationNagruzkaInstance: IPreparationNagruzkaController;
    class var fCommonNagruzkaController: ICommonNagruzkaController;
//    property NagruzkaDirectory: INagruzkaDirectory read fNagruzkaDirectory implements INagruzkaDirectory;
//    property PlanNagruzkaInstance: IPlanNagruzkaController read fPlanNagruzkaInstance implements IPlanNagruzkaController;
//    property FactNagruzkaInstance: IFactNagruzkaController read fFactNagruzkaInstance implements IFactNagruzkaController;
//    property PreparationNagruzkaInstance: IPreparationNagruzkaController read fPreparationNagruzkaInstance implements IPreparationNagruzkaController;
//    property CommonNagruzkaController: ICommonNagruzkaController read fCommonNagruzkaController implements ICommonNagruzkaController;
  public
    constructor Create;
    class procedure ReleaseInstance;
    class function Directory: INagruzkaDirectory;
    class function CommonFunctions: ICommonNagruzkaController;
    class function Preparation: IPreparationNagruzkaController;
    class function PlanNagruzka: IPlanNagruzkaController;
    class function FactNagruzka: IFactNagruzkaController;
    class procedure PrintNagrComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
    class procedure PrintNagrCommonComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
    class procedure PrintNagrDepsComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
    class procedure PrintFactNagrExecution(ik_year:integer; ik_typesem:integer; ik_kaf:integer; ik_typeed:integer);

    class procedure PrintNagrStaffComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
    class procedure PrintNagrLectComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);

    class procedure PrintDepsNagrForSemester(ik_year:integer; year:string; ik_typesem:integer; ik_typeed:integer);
    class procedure PrintDepsPFONagr(ik_year:integer; year:string; ik_typeed:integer);
    class procedure PrintFullDepsNagrForSemester(ik_year:integer; year:string; ik_typeed:integer);
    class procedure PrintPlanDepsNagrForSemesters(ik_year:integer; year:string; ik_typeed:integer);
    class procedure PrintFactDepsNagrForSemester(ik_year:integer; year:string; ik_typesem:integer; ik_typeed:integer);
  end;

  function RoundFloat(R: Extended; Decimals: Integer): Extended;

implementation

uses PlanNagruzkaController, FactNagruzkaController, PreparationNagruzkaController, CommonNagruzkaController,
  NagruzkaDirectory, N_YearsComparison, N_YearsCommonComparison, N_DepsSemester, N_FullDepsSemester, N_PlanDepsSemesters, N_PlanDepsCompare, N_FactDeps, uWaitingController, N_YearsStaffComparison, N_YearsLectComparison, N_PFODeps, N_FactPrepodsExecute;

//var
//  FNagruzkaControllerInstance: TNagruzkaController = nil;

function RoundFloat(R: Extended; Decimals: Integer): Extended;
var
  Factor: Extended;
begin
  Factor := Int(Exp(Decimals * Ln(10)));
  Result := Round(Factor * R) / Factor;
end;

{ TNagruzkaController }

class function TNagruzkaController.CommonFunctions: ICommonNagruzkaController;
begin
  if not Assigned(fCommonNagruzkaController) then
    fCommonNagruzkaController:= TCommonNagruzkaController.Create;
  Result:= fCommonNagruzkaController;
end;

constructor TNagruzkaController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;

class function TNagruzkaController.Directory: INagruzkaDirectory;
begin
  if not Assigned(fNagruzkaDirectory) then
    fNagruzkaDirectory:= TNagruzkaDirectory.Create;
  Result:= fNagruzkaDirectory;
end;

class function TNagruzkaController.PlanNagruzka: IPlanNagruzkaController;
begin
  if not Assigned(fPlanNagruzkaInstance) then
    fPlanNagruzkaInstance:= TPlanNagruzkaController.Create;
  Result:= fPlanNagruzkaInstance;
end;

class function TNagruzkaController.FactNagruzka: IFactNagruzkaController;
begin
  if not Assigned(fFactNagruzkaInstance) then
    fFactNagruzkaInstance:= TFactNagruzkaController.Create;
  Result:= fFactNagruzkaInstance;
end;

class function TNagruzkaController.Preparation: IPreparationNagruzkaController;
begin
  if not Assigned(fPreparationNagruzkaInstance) then
    fPreparationNagruzkaInstance:= TPreparationNagruzkaController.Create;
  Result:= fPreparationNagruzkaInstance;
end;

class procedure TNagruzkaController.PrintNagrCommonComparison(ik_year1,
  ik_year2: integer; year1, year2: string; ik_typeed: integer);
  var
  Report:TNagrYearCommonComparisonReport;
begin
  Report := TNagrYearCommonComparisonReport.Create(nil, ik_year1, ik_year2, year1, year2, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_YearsCommonComparison.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintNagrComparison(ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
  var
  Report:TNagrYearComparisonReport;
begin

  Report := TNagrYearComparisonReport.Create(nil, ik_year1, ik_year2, year1, year2, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_YearsComparison.xlt';
  Report.BuildReport;
  Report.Show;
  Report.Free;

end;

class procedure TNagruzkaController.PrintNagrDepsComparison(ik_year1,
  ik_year2: integer; year1, year2: string; ik_typeed: integer);
    var
  Report:TPlanNagrDepartmentsCompareReport;
begin
  Report := TPlanNagrDepartmentsCompareReport.Create(nil, ik_year1, year1, ik_year2, year2, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_PlanDepsYearsCompare.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintNagrLectComparison(ik_year1,
  ik_year2: integer; year1, year2: string; ik_typeed: integer);
  var
  Report:TNagrYearLectComparisonReport;
begin
  Report := TNagrYearLectComparisonReport.Create(nil, ik_year1, ik_year2, year1, year2, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_LectComparison.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintNagrStaffComparison(ik_year1,
  ik_year2: integer; year1, year2: string; ik_typeed: integer);
 var
  Report:TNagrYearStaffComparisonReport;
begin
  Report := TNagrYearStaffComparisonReport.Create(nil, ik_year1, ik_year2, year1, year2, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_YearsStaffComparison.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintPlanDepsNagrForSemesters(
  ik_year: integer; year: string; ik_typeed: integer);
  var
  Report:TNagrSemesterDepartmentsReport;
begin
  Report := TPlanNagrDepartmentsSemestersReport.Create(nil, ik_year, year, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_PlanDepsSemesters.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintDepsNagrForSemester(ik_year:integer; year:string; ik_typesem:integer; ik_typeed:integer);
  var
  Report:TNagrSemesterDepartmentsReport;
begin
  Report := TNagrSemesterDepartmentsReport.Create(nil, ik_year, year, ik_typesem, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_DepsSemester.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintDepsPFONagr(ik_year: integer;
  year: string; ik_typeed: integer);
var
  Report:TNagrPFODepartmentsReport;
begin
  Report := TNagrPFODepartmentsReport.Create(nil, ik_year, year, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_PFODeps.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintFactDepsNagrForSemester(
  ik_year: integer; year: string; ik_typesem, ik_typeed: integer);
var
  Report:TNagrFactDepartmentsReport;
begin
  Report := TNagrFactDepartmentsReport.Create(nil, ik_year, year, ik_typesem, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_FactDeps.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintFactNagrExecution(ik_year:integer;ik_typesem,
  ik_kaf, ik_typeed: integer);
  var Report:TNagrFactPrepodsExecuteReport;
begin
  Report := TNagrFactPrepodsExecuteReport.Create(nil, ik_year, ik_kaf, ik_typesem, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_FactPrepodsExecute.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.PrintFullDepsNagrForSemester(
  ik_year: integer; year: string; ik_typeed: integer);
  var
  Report:TNagrSemesterDepartmentsReport;
begin
  Report := TNagrSemesterDepartmentsFullReport.Create(nil, ik_year, year, ik_typeed);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\N_FullDepsSemester.xlt';
  TWaitingController.GetInstance.Process(Report);
end;

class procedure TNagruzkaController.ReleaseInstance;
begin
  if TeacherTreeLoadMutex <> 0 then
  begin
    WaitForSingleObject(TeacherTreeLoadMutex, INFINITE);
    CloseHandle(TeacherTreeLoadMutex);
    TeacherTreeLoadMutex:= 0;
  end;
  if PotokTreeLoadMutex <> 0 then
  begin
    WaitForSingleObject(PotokTreeLoadMutex, INFINITE);
    CloseHandle(PotokTreeLoadMutex);
    PotokTreeLoadMutex:= 0;
  end;
  if fNagruzkaDirectory <> nil then fNagruzkaDirectory:= nil;
  if fPlanNagruzkaInstance <> nil then fPlanNagruzkaInstance:= nil;
  if fFactNagruzkaInstance <> nil then fFactNagruzkaInstance:= nil;
  if fPreparationNagruzkaInstance <> nil then fPreparationNagruzkaInstance:= nil;
  if fCommonNagruzkaController <> nil then fCommonNagruzkaController:= nil;
end;


{
function TNagruzkaController.GetAllTeachersPlans(SourceDataSet: PDataSet;
  KafedraIK, TabN: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_plan From Plan_nagr ' +
    'INNER JOIN Content_plan_nagr ON Plan_nagr.ik_plan_nagr = Content_plan_nagr.ik_plan_nagr INNER JOIN Prepod_plan_nagr ON Content_plan_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_nagr ' +
    'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type ' +
    'INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed Where (Plan_nagr.ik_kaf = ' + IntToStr(KafedraIK) + ') and (Prepod_plan_nagr.ik_id_prepod in (SELECT ik_id_prepod FROM Relation_kafedra_prep WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (iTab_n = ' + IntToStr(TabN) + '))) Order By ik_year, ik_sem_type, ik_type_ed, ik_form_ed', 'ik_plan_nagr', isShowFirst, NULL);
end;       }

{
function TNagruzkaController.GetPlanInfoForEvent(EventIK: integer; var KafIK, FormEdIK: integer): boolean;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select * From Plan_nagr Where ik_plan_nagr in (SELECT ik_plan_nagr FROM Content_plan_nagr WHERE ik_content_plan_nagr in (SELECT ik_content_plan_nagr FROM Prepod_plan_nagr ' +
    'WHERE ik_prepod_plan in (SELECT ik_prepod_plan FROM Relation_event_plan_nagr WHERE ik_event = ' + IntToStr(EventIK) + ')))';
  tempDS.Open;
  if tempDS.RecordCount > 0 then
  begin
    KafIK:= tempDS.FieldByName('ik_kaf').AsInteger;
    FormEdIK:= tempDS.FieldByName('ik_form_ed').AsInteger;
    Result:= true;
  end;
  tempDS.Close;
  tempDS.Free;
end;      }


{procedure TNagruzkaController.GetTeachersInKafByPlan(SourceDataSet: PDataSet; PlanIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Relation_kafedra_prep.ik_id_prepod, (RTRIM(Prepods.clastname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cfirstname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cotch) + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '')'') AS FIO ' +
    'From Relation_kafedra_prep INNER JOIN Prepods ON Relation_kafedra_prep.itab_n = Prepods.itab_n LEFT JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type ' +
    'Where ik_id_prepod in (Select ik_id_prepod From Relation_kafedra_prep Where ik_kaf = (SELECT ik_kaf FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')) Order By FIO', 'ik_id_prepod', false, NULL);
end;             }

{
function TNagruzkaController.GetVidNagruzkiFromNorm(
  SourceDataSet: PDataSet; NormIK, VidZanyatIK: integer;
  isShowFirst: boolean): Variant;
begin
  if VidZanyatIK = 32 then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Vid_nagruzki Where ik_vid_nagruzki = 1 Order By Cname_vid_nagruzki', 'ik_vid_nagruzki', isShowFirst, NULL)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select DISTINCT Content_norma_of_time.ik_vid_nagruzki, Vid_nagruzki.Cname_vid_nagruzki From Content_norma_of_time ' + 'INNER JOIN Vid_nagruzki ON Content_norma_of_time.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki Where (Content_norma_of_time.ik_norm_of_time = ' + IntToStr(NormIK) + ') and (Content_norma_of_time.ik_vid_zanyat = ' + IntToStr(VidZanyatIK) + ') Order By Cname_vid_nagruzki', 'ik_vid_nagruzki', isShowFirst, NULL)
end;
}

{
function TNagruzkaController.GetAllDefenceFund(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Defence_fund Order By cName_defence_fund', 'ik_defence_fund', isShowFirst, NULL);
end;
         }


{
function TNagruzkaController.SaveAllDiscToTeacher(TeacherIK, PlanIK,
  DiskIK, PotokIK: integer): boolean;
begin
  Result:= TPlanNagruzkaController.Instance.SaveAllDiscToTeacher(TeacherIK, PlanIK, DiskIK, PotokIK);
end;
 }

end.
