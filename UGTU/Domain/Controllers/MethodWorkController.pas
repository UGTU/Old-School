unit MethodWorkController;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM, ComCtrls,
  Forms, Dialogs, Variants, StdCtrls, GeneralController, ExcelXP, ComObj,
  uDMMethodWork, DateUtils;
const
  PLAN_MSG = 'План';
  FACT_MSG = 'Факт';
  EDITION_MSG = 'Издаётся';
  NOT_EDITION_MSG = 'Не издаётся';
type

  TPlanEntryViewRow = class
  private
    FIsPlan, FIsEdition : Boolean;
    FPercent : Integer;
    procedure SetPercent(const Value : Integer);
  public
    constructor Create(IsPlan, IsEdition : Boolean);

    function GetFormatedRow : String;
    function GetFormatedRowEd : String;

    property IsPlan : Boolean read FIsPlan;
    property IsEdition : Boolean read FIsEdition;
    property Percent : Integer read FPercent write SetPercent;

  end;

  TDoubleArray = array [0..4] of double;

  TWorkTreeViewWorkItem = class
  protected
    fWorkIK: integer;
    fNameWork: string;
  public
    constructor Create(AWorkIK: integer; ANameWork: string);
    property WorkIK: integer read fWorkIK write fWorkIK;
    property NameWork: string read fNameWork write fNameWork;
  end;

TMethodWorkController = class (TObject)
  protected
    constructor CreateInstance;

    //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer): TMethodWorkController;

  public
    constructor Create;

    //Instance - возвращает экзепляр данного контроллера
    class function Instance: TMethodWorkController;

    //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;
    //---------------------------------------------------------

    function GetVidZan(SourceDataSet: PDataSet; DepIK: integer; isShowFirst: boolean): Variant;
    function GetNormsOfTime(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetDiscForFact(SourceDataSet: PDataSet; KafIK, TeacherIK: integer; isShowFirst: boolean): Variant;
    function GetDiscForPlan(SourceDataSet: PDataSet; YearPlan, KafIK, TeacherIK: integer; isShowFirst: boolean): Variant;
    function GetPlanMWForPlan(SourceDataSet: PDataSet; KafIK: integer; AddAll, isShowFirst: boolean): Variant;
    function GetUchPlanForFact(SourceDataSet: PDataSet; KafIK: integer; DiscIK: integer; isShowFirst: boolean): Variant;
    function GetStatus(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetDiscForDialogPlan(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetMWForDialogPlan(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetDiscForPlanDep(SourceDataSet: PDataSet; YearPlan, KafIK: integer; isShowFirst: boolean): Variant;
    function GetMethodWork(SourceDataSet: PDataSet; NormIK, WarrantIK: integer; isShowFirst: boolean): Variant;
    function GetWarrant(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetItemGos(SourceDataSet: PDataSet; GosIK: integer; isShowFirst: boolean): Variant;
    function GetAllItemGos(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetYearGos(SourceDataSet: PDataSet; SpecIK: integer; isShowFirst: boolean): Variant;
    function GetDiscForGos(SourceDataSet: PDataSet; KafIK: integer; isShowFirst: boolean): Variant;
    function GetCurrentDiscForGos(SourceDataSet: PDataSet; GosIK, DiscCycleIK, DiscGroupIK: integer): Variant;
    function GetAllDisciplineCycles(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllDisciplineGroups(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetAllYears(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
    function GetTypeReport(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
    function GetAllYearsForGos(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
    function GetAllYearsForPlanEd(SourceDataSet: PDataSet; KafIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
    function GetDepartmentName(KafIK: integer; isNeedShortName: boolean): string;
    function GetSpecName(KafIK: integer): Variant;
    function GetSpec(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
    function GetBitEdition(MWorkIK: integer): boolean;
    procedure CloseMethodWorkVidZan();
    procedure CloseNormOfTime;
    function LoadMethodWorkVidZan(KafIK, VidZanIK: Integer): TDataSet;
    function LoadSrokMethodWork(MWorkIK: Integer): TDataSet;
    function LoadNormOfTime(NormIK: Integer): TDataSet;
    function LoadFactPrep(DiscIK, TeacherIK{, UchPlanIK}: Integer): TDataSet;
    function LoadFactPrepAll(DiscIK{, UchPlanIK}: Integer): TDataSet;
    function LoadPlanPrep(DiscIK, TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadPlanPrepForAllDisc(TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadWarrantForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadMethodEditionForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadMethodWorkForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadPrepodForFilter(PlanMWIK: Integer): TDataSet;
    function LoadAutoPlanPrep(TeacherIK, KafIK, YearPlanNagrIK: Integer): TDataSet;
    function LoadAutoPlanPrepConcrDisc(TeacherIK, KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
    function LoadAutoPlanOffPrepConcrDisc(TeacherIK, KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
    function LoadAutoPlanOffPrep(TeacherIK, KafIK, YearPlanNagrIK: Integer): TDataSet;
    function LoadCoautor(KafIK, MethodEdIK :integer): TDataSet;
    function LoadUchPlan(KafIK, MethodEdIK :integer): TDataSet;
    function LoadDiscInDBGrid(KafIK, MethodEdIK :integer): TDataSet;
    function LoadMainDiscInDialog(MethodEdIK :integer): integer;
    function LoadState(BitPlan, MethodEdIK :integer): TDataSet;
    function LoadFile(MethodEdIK :integer): TDataSet;
    function LoadPlanEditionPrepForAllDisc(TeacherIK, year_value: Integer): TDataSet;
    function LoadPlanEditionPrepForConcrDisc(DiscIK, TeacherIK, PlanMWIK: Integer): TDataSet;
    function LoadPlanDep(PlanMWIK: Integer): TDataSet;
    function LoadPlanDepForDisc(DiscIK, PlanMWIK: Integer): TDataSet;
    function LoadAutoPlanDepAllDisc(KafIK, YearPlanNagrIK: Integer): TDataSet;
    //function LoadAutoPlanDepConcrDisc(KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
    function LoadCurrentMW(PlanIK, DiscIK, WarrantIK :integer): TDataSet;
    function LoadFactPrepAllDisc(TeacherIK: Integer): TDataSet;
    function LoadFactPrepAllDiscAll(KafIK: integer): TDataSet;
    function LoadFactDepPrepAllDiscAll(KafIK: integer; YearFact: string): TDataSet;
    function LoadFactDepPrepAll(DiscIK: Integer; YearFact:string): TDataSet;
    function LoadPlanEdDep(PlanMWIK: Integer): TDataSet;
    function LoadRatifyPlanDep(PlanMWIK, KafIK: Integer): TDataSet;
    function LoadPlanEdDepForDisc(DiscIK, PlanMWIK: Integer): TDataSet;
    procedure LoadExistsNormOfTime(NormIK: integer);
    function LoadItemGos(GosIK, ItemGosIK: integer): TDataSet;
    function LoadDiscGos(GosIK, DiscIK: integer): TDataSet;

    function SaveNormOfTime(var NormIK: integer; KafIK, YearIK: integer; Volume, DolMW: real): boolean;
    function SaveContentNormOfTime(NormIK: integer): boolean;
    procedure SavePlan(BitFact, BitFactReal: Boolean; var IK: integer; NameEd: string; Volume: integer; Code, Charact, Draw, Pos, Mark: Variant; MethodWorkIK, PlanMWIK, PrepodIK, DiscIK: integer; BitEd: Boolean; CountFact: Variant);
    procedure SavePlanEdition(MEditionIK: integer; BitEd: Boolean);
    procedure SavePlanDep(var PlanIK: integer; KafedraIK, YearIK: integer; Date, TypeRepIK, NumRep: Variant);
    function SaveGos(var GosIK: integer; SpecIK, YearIK: integer): boolean;
    function SaveMWvidZan(KafIK, VidZanIK: integer): boolean;
    function SaveSrokMW(MWorkIK: integer): boolean;
    function SaveItemGos(var ContentItemGosIK: integer; GosIK, ItemGosIK: integer; Content: Variant): boolean;
    function SaveDiscGos(var ContentDiscGosIK: integer; GosIK, DiscIK, CklDisc, GrpDisc: integer; Code: string; Hour:integer; Content: string): boolean;
    function SaveSectionWork(NameW: string): boolean;
    procedure SaveWork(var IDMW: integer; NameW: string; BitEdition: Integer; IDMWParent: integer; IDWarrant: Variant);

    procedure DeleteMWfromPlan(MEditionIK: integer);
    procedure DeleteMWfromFact(MEditionIK: integer);
    procedure DeletePlanDep(PlanIK: integer);
    procedure DeleteGos(GosIK: integer);
    procedure DeleteNormOfTime(NormOfTimeIK: integer);
    procedure DeleteItemGos(ContentItemGosIK: integer);
    procedure DeleteDiscGos(ContentDiscGosIK: integer);
    procedure DeleteWork(MWorkIK: integer);

    function GetLastNormOfTime(KafIK: integer): integer;
    function GetVolumeForMW(KafIK, PrepIK, NormIK: integer): double;
    function GetVolumeForMWDep(KafIK, NormIK: integer): double;
    function GetPlanVolumeForMW(DataSet: TDataSet): TDoubleArray;
    function GetPlanVolumeForMWdisc(KafIK, PrepIK, YearPlanIK, NormIK, DiscIK: integer): TDoubleArray;
    function GetFactVolumeForMW(dsFact: TDataSet): TDoubleArray;
    function GetPlanEditionVolumeForMW(dsPlanEd: TDataSet): TDoubleArray;
    function GetBitCoautor(MEditionIK, PrepIK: integer): boolean;
    procedure GetPlanCloseFact;
    procedure GetFilteredFact(KafIK, CountM: integer);
    //function GetPlanDepClosePlanPrep(MWorkIK, DiscIK, PlanIK: integer): variant;

    procedure BuildWorkTree(ATreeView: TTreeView);
    function AddWorkTreeNode(wtTreeNode: TTreeNode; IDWork: integer; NameWork: string; ATreeView: TTreeView): TTreeNode;
    function AddNodeWorkTreeNode(WorkIK: integer; WorkName: string; ATreeView: TTreeView; AWorkParentNode: TTreeNode; CBox, CBoxEdition: boolean): TTreeNode;

    procedure ExportCurrentTeacherPlan(PrepIK: integer; YearPlan: string; YearVolMW, PlanVolMW: double);
end;

implementation

uses
  ExceptionBase;

var
  FMethodWorkControllerInstance: TMethodWorkController = nil;
//------------------------------------------------------------------------------

class function TMethodWorkController.AccessInstance(
  Request: Integer): TMethodWorkController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FMethodWorkControllerInstance) then FMethodWorkControllerInstance := CreateInstance;
    2 : if FMethodWorkControllerInstance <> nil then
          begin
            FMethodWorkControllerInstance.Free;
            FMethodWorkControllerInstance:= nil;
          end;
    else raise Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера NagruzkaController', [Request]);
  end;
  Result := FMethodWorkControllerInstance;
end;

constructor TMethodWorkController.CreateInstance;
begin
  inherited Create;   
end;

constructor TMethodWorkController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;

class function TMethodWorkController.Instance: TMethodWorkController;
begin
  Result := AccessInstance(1);
end;

class procedure TMethodWorkController.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;
//--------------------------------------------------------------------------------

function TMethodWorkController.GetVidZan(
  SourceDataSet: PDataSet; DepIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select (vid_zaniat.cName_vid_zanyat + ' + #39 + ', ' + #39 + ' + RTRIM(typ_zan.Cname_typ_vz) + ' + #39 + ', ' + #39 + ' + RTRIM(TypeZanyat.TypeZanyat)) as cName_ZAN, vid_zaniat.* From vid_zaniat INNER JOIN typ_zan ON vid_zaniat.iK_type_vz = typ_zan.iK_type_vz INNER JOIN TypeZanyat ON vid_zaniat.ikTypeZanyat = TypeZanyat.ikTypeZanyat Order By cName_ZAN',
    'iK_vid_zanyat',
    isShowFirst, NULL);
end;

procedure TMethodWorkController.CloseMethodWorkVidZan();
begin
   if dmMethodWork.adsMethodWorkVidZan.Active
   then dmMethodWork.adsMethodWorkVidZan.Close;
end;

function TMethodWorkController.LoadMethodWorkVidZan(KafIK, VidZanIK: Integer): TDataSet;
begin
  if dmMethodWork.adsMethodWorkVidZan.Active then dmMethodWork.adsMethodWorkVidZan.Close;
  if dmMethodWork.adsWarrant.Active then dmMethodWork.adsWarrant.Close;

  dmMethodWork.adsWarrant.CommandText:= 'Select * From MW_Warrant';

  dmMethodWork.adsMethodWorkVidZan.CommandText:= 'SELECT MethodWork_VidZan.* FROM MethodWork_VidZan WHERE ik_kaf = ' + IntToStr(KafIK) + 'and MethodWork_VidZan.iK_vid_zanyat= (SELECT iK_vid_zanyat FROM vid_zaniat WHERE (iK_vid_zanyat = ' + IntToStr(VidZanIK) + ') )';
  dmMethodWork.adsMethodWorkVidZan.Open;
  Result:= dmMethodWork.adsMethodWorkVidZan;
end;

function TMethodWorkController.GetMethodWork(
  SourceDataSet: PDataSet; NormIK, WarrantIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
    {'Select M2.IDMethodWork, M2.BitEdition, M2.IDMethodWorkParent, M2.CountYear, (M1.NameWork + '': '' + M2.NameWork) as NameW, ShortNameUnit From MethodWork as M1 ' +
    'inner join MethodWork as M2 ON M1.IDMethodWork = M2.IDMethodWorkParent '+
    'left join (select IDMethodWork, ShortNameUnit from MethodWork_NormOfTime '+
    'inner join MW_Unit ON MethodWork_NormOfTime.IDUnit = MW_Unit.IDUnit where IDNormOfTime = ' + IntToStr(NormIK) +')as b '+
    'ON M2.IDMethodWork = b.IDMethodWork where (M2.BitEdition is not NULL) and (M2.IDWarrant = ' + IntToStr(WarrantIK) +') ORDER BY NameW',}
    'Select M2.IDMethodWork, M2.BitEdition, M2.IDMethodWorkParent, (M1.NameWork + '': '' + M2.NameWork + '' ('' + cast(Norma as varchar) + '' ч. '' + NameUnit + '')'') as NameW, ShortNameUnit, IDContentNorm From MethodWork as M1 ' +
    'inner join MethodWork as M2 ON M1.IDMethodWork = M2.IDMethodWorkParent '+
    'inner join (select IDContentNorm, Norma, IDMethodWork, NameUnit, ShortNameUnit from MethodWork_NormOfTime '+
    'inner join MW_Unit ON MethodWork_NormOfTime.IDUnit = MW_Unit.IDUnit where IDNormOfTime = ' + IntToStr(NormIK) +')as b '+
    'ON M2.IDMethodWork = b.IDMethodWork where (M2.BitEdition is not NULL) and (M2.IDWarrant = ' + IntToStr(WarrantIK) +') ORDER BY NameW',
    'IDContentNorm',
    isShowFirst, NULL);
end;

function TMethodWorkController.GetWarrant(
  SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select * From MW_Warrant Order By NameWarrant',
    'IDWarrant',
    isShowFirst, NULL);
end;

function TMethodWorkController.LoadSrokMethodWork(MWorkIK: Integer): TDataSet;
begin
  if dmMethodWork.adsSrokMW.Active then dmMethodWork.adsSrokMW.Close;
  if dmMethodWork.adsStatus.Active then dmMethodWork.adsStatus.Close;

  dmMethodWork.adsStatus.CommandText:= 'Select * From MW_Status where Bit_plan = 0';

  dmMethodWork.adsSrokMW.CommandText:= 'SELECT * FROM MethodWork_Status WHERE (IDWarrant= ' + IntToStr(MWorkIK) +')';
  dmMethodWork.adsSrokMW.Open;
  Result:= dmMethodWork.adsSrokMW;
end;

procedure TMethodWorkController.CloseNormOfTime;
begin
  if dmMethodWork.adsNormOfTime.Active then dmMethodWork.adsNormOfTime.Close;
end;

function TMethodWorkController.LoadNormOfTime(NormIK: Integer): TDataSet;
begin
  if dmMethodWork.adsNormOfTime.Active then dmMethodWork.adsNormOfTime.Close;
  if dmMethodWork.adsMethodWork.Active then dmMethodWork.adsMethodWork.Close;
  if dmMethodWork.adsUnit.Active then dmMethodWork.adsUnit.Close;
  dmMethodWork.adsUnit.CommandText:= 'Select * From MW_Unit ORDER BY NameUnit';
  dmMethodWork.adsMethodWork.CommandText:= 'Select M2.IDMethodWork, M2.BitEdition, M2.IDMethodWorkParent, (M1.NameWork + '': '' + M2.NameWork) as NameW From MethodWork as M1 ' +
    'inner join MethodWork as M2 ON M1.IDMethodWork = M2.IDMethodWorkParent where M2.BitEdition is not NULL ORDER BY NameW';
  dmMethodWork.adsNormOfTime.CommandText:= 'SELECT MethodWork_NormOfTime.* FROM MethodWork_NormOfTime WHERE MethodWork_NormOfTime.IDNormOfTime = (SELECT IDNormOfTime FROM MW_NormOfTime WHERE (IDNormOfTime = ' + IntToStr(NormIK) + '))';
  dmMethodWork.adsNormOfTime.Open;
  Result:= dmMethodWork.adsNormOfTime;
end;

// загрузка факта преподавателя по конкретной дисциплине
function TMethodWorkController.LoadFactPrep(DiscIK, TeacherIK: Integer): TDataSet;
begin
  if dmMethodWork.adsFactPrep.Active then dmMethodWork.adsFactPrep.Close;
  dmMethodWork.adsFactPrep.CommandText:= 'SELECT *, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as UchYear, ik_year '+
   'FROM dbo.MW_FactMW2 as F inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition '+
   'left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
   'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
   'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 0) and (itab_n = ' + IntToStr(TeacherIK) + ') '+
   'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsFactPrep.Open;
  Result:= dmMethodWork.adsFactPrep;
end;

// загрузка факта преподавателя по всем дисциплинам
function TMethodWorkController.LoadFactPrepAllDisc(TeacherIK: Integer): TDataSet;
begin
  if dmMethodWork.adsFactPrepAllDisc.Active then dmMethodWork.adsFactPrepAllDisc.Close;
  dmMethodWork.adsFactPrepAllDisc.CommandText:= 'SELECT distinct NameWork, DateTransitionInState, IDWarrant, NameWarrant, NameMethodEdition, Code, Characteristic, Volume, Drawing, Position, Mark, Norma, NormaExpert, '+
   '(Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as UchYear, ik_year, F.IDMethodEdition, IDContentNorm, IDMethodWork, Discpl, IDMethodEditionPlan, NameUnit '+
   'FROM dbo.MW_FactMW2 as F inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition '+
   'inner join MW_DiscEdition() ON F.IDMethodEdition = MW_DiscEdition.ID left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
   'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
   'WHERE (Bit_plan_fact = 0) and (itab_n = ' + IntToStr(TeacherIK) + ') '+
   'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsFactPrepAllDisc.Open;
  Result:= dmMethodWork.adsFactPrepAllDisc;
end;

function TMethodWorkController.LoadFactPrepAll(DiscIK: Integer): TDataSet;
begin
  if dmMethodWork.adsFactAllPrep.Active then dmMethodWork.adsFactAllPrep.Close;
  dmMethodWork.adsFactAllPrep.CommandText:= 'SELECT * from MW_AutorEdition() inner join dbo.MW_FactMW2 as F ON MW_AutorEdition.ID = F.IDMethodEdition '+
    'left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
    'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
    'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 0) ' +
    'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsFactAllPrep.Open;
  Result:= dmMethodWork.adsFactAllPrep;
end;

function TMethodWorkController.LoadFactDepPrepAll(DiscIK: Integer; YearFact:string): TDataSet;
begin
  if dmMethodWork.adsDepFactAllPrep.Active then dmMethodWork.adsDepFactAllPrep.Close;
  dmMethodWork.adsDepFactAllPrep.CommandText:= 'SELECT * from MW_AutorEdition() inner join dbo.MW_FactMW2 as F ON MW_AutorEdition.ID = F.IDMethodEdition ' +
  'left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 0) '+ //and (Year(DateTransitionInState) = ' + YearFact + ') '+
  'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsDepFactAllPrep.Open;
  Result:= dmMethodWork.adsDepFactAllPrep;
end;

function TMethodWorkController.LoadFactPrepAllDiscAll(KafIK: integer): TDataSet;
begin
  if dmMethodWork.adsFactAllPrepAllDisc.Active then dmMethodWork.adsFactAllPrepAllDisc.Close;
  dmMethodWork.adsFactAllPrepAllDisc.CommandText:= 'SELECT distinct DateTransitionInState, NameWork, NameWarrant, IDWarrant, NameMethodEdition, Code, '+
   'Characteristic, Volume, Drawing, Position, Mark, Pr, F.IDMethodEdition, IDMethodWork, IDContentNorm, Discpl, ik_year, Norma, NormaExpert from MW_AutorEdition() '+
   'inner join dbo.MW_FactMW2 as F ON MW_AutorEdition.ID = F.IDMethodEdition inner join MW_DiscEdition() ON F.IDMethodEdition = MW_DiscEdition.ID ' +
   'inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition inner join Prepods ON MW_EditionPrepods.itab_n = Prepods.itab_n inner join Relation_kafedra_prep ON Prepods.itab_n = Relation_kafedra_prep.itab_n ' +
   'left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
   'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
   'WHERE (Bit_plan_fact = 0) and (Relation_kafedra_prep.ik_kaf = ' + IntToStr(KafIK) + ') '+
   'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsFactAllPrepAllDisc.Open;
  Result:= dmMethodWork.adsFactAllPrepAllDisc;
end;

function TMethodWorkController.LoadFactDepPrepAllDiscAll(KafIK: integer; YearFact: string): TDataSet;
begin
  if dmMethodWork.adsDepFactAllPrepAllDisc.Active then dmMethodWork.adsDepFactAllPrepAllDisc.Close;
  dmMethodWork.adsDepFactAllPrepAllDisc.CommandText:= 'SELECT distinct DateTransitionInState, NameWork, IDWarrant, NameWarrant, NameMethodEdition, Code, '+
   'Characteristic, Volume, Drawing, Position, Mark, Pr, F.IDMethodEdition, IDMethodEditionPlan, IDMethodWork, IDContentNorm, Discpl, ik_year, Norma, NormaExpert, NameUnit, CurrentBitEdition from MW_AutorEdition() '+
   'inner join dbo.MW_FactMW2 as F ON MW_AutorEdition.ID = F.IDMethodEdition inner join MW_DiscEdition() ON F.IDMethodEdition = MW_DiscEdition.ID ' +
   'inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition inner join Prepods ON MW_EditionPrepods.itab_n = Prepods.itab_n inner join Relation_kafedra_prep ON Prepods.itab_n = Relation_kafedra_prep.itab_n ' +
   'left join (select * from MW_PlanMethodWork inner join Year_uch_pl ON MW_PlanMethodWork.ik_year = Year_uch_pl.ik_year_uch_pl)a ON F.IDPlanMW = a.IDPlanMW '+
   'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
   'WHERE (Bit_plan_fact = 0) and (Relation_kafedra_prep.ik_kaf = ' + IntToStr(KafIK) + ') '+ //and (Year(DateTransitionInState) = ' + YearFact + ') '+
   'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsDepFactAllPrepAllDisc.Open;
  Result:= dmMethodWork.adsDepFactAllPrepAllDisc;
end;

// загрузка плана преподавателя по конкретной дисциплине
function TMethodWorkController.LoadPlanPrep(DiscIK, TeacherIK, PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanPrepForDisc.Active then dmMethodWork.adsPlanPrepForDisc.Close;
  dmMethodWork.adsPlanPrepForDisc.CommandText:= 'SELECT F.*, DateTransitionInState, Bit_coautor FROM dbo.MW_FactMW2 as F inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 1) and (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';
  dmMethodWork.adsPlanPrepForDisc.Open;
  Result:= dmMethodWork.adsPlanPrepForDisc;
end;

function TMethodWorkController.LoadPlanDepForDisc(DiscIK, PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanDepForDisc.Active then dmMethodWork.adsPlanDepForDisc.Close;
  dmMethodWork.adsPlanDepForDisc.CommandText:= 'SELECT * FROM dbo.MW_FactMW2 as F inner join MW_AutorEdition() ON F.IDMethodEdition = MW_AutorEdition.ID ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 1) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') and ' +
  '(IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';
  dmMethodWork.adsPlanDepForDisc.Open;
  Result:= dmMethodWork.adsPlanDepForDisc;
end;

function TMethodWorkController.LoadPlanEdDepForDisc(DiscIK, PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanEdDepForDisc.Active then dmMethodWork.adsPlanEdDepForDisc.Close;
  dmMethodWork.adsPlanEdDepForDisc.CommandText:= 'SELECT * FROM dbo.MW_FactMW2 as F inner join MW_AutorEdition() ON F.IDMethodEdition = MW_AutorEdition.ID '+
    'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
    'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 1) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') and (CurrentBitEdition = 1) and '+
    '(IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsPlanEdDepForDisc.Open;
  Result:= dmMethodWork.adsPlanEdDepForDisc;
end;

// загрузка плана преподавателя по всем дисциплинам
function TMethodWorkController.LoadPlanPrepForAllDisc(TeacherIK, PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanPrep.Active then dmMethodWork.adsPlanPrep.Close;
  if PlanMWIK = 0 then
    dmMethodWork.adsPlanPrep.CommandText:=
  'select ID1, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime, PercentCompletion '+
  'from MW_PlanFactPrep() '+
  'left join MW_ViewPlanFact '+
  'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
  'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') '+
  'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + '))) '+
  'order by cName_disc, ID1, Bit_plan_fact desc'
  else
    dmMethodWork.adsPlanPrep.CommandText:= {'SELECT distinct iK_disc, NameWork, NameMethodEdition, F.IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, Discpl, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit ' +
  'from dbo.MW_DiscEdition() inner join dbo.MW_FactMW2 as F ON dbo.MW_DiscEdition.ID = F.IDMethodEdition inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (Bit_plan_fact = 1) and (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';}

  'select ID1, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime, PercentCompletion '+
  'from MW_PlanFactPrep() '+
  'left join MW_ViewPlanFact '+
  'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
  'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
  'order by cName_disc, ID1, Bit_plan_fact desc';
  dmMethodWork.adsPlanPrep.Open;
  Result:= dmMethodWork.adsPlanPrep;
end;

function TMethodWorkController.LoadWarrantForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  if (PlanMWIK = 0) and (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct IDWarrant, NameWarrant '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + '))) '+
    'order by NameWarrant'
  else if (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct IDWarrant, NameWarrant '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWarrant';

  if (PlanMWIK = 0) and (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct IDWarrant, NameWarrant '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + '))) '+
    'order by NameWarrant'
  else if (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct IDWarrant, NameWarrant '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWarrant';
  tempDataSet.Open;
  Result:= tempDataSet;
  //tempDataSet.Close;
  //tempDataSet.Free;
end;

function TMethodWorkController.LoadMethodEditionForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  if (PlanMWIK = 0) and (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct NameMethodEdition '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameMethodEdition'
  else if (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct NameMethodEdition '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameMethodEdition';

  if (PlanMWIK = 0) and (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct NameMethodEdition '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameMethodEdition'
  else if (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct NameMethodEdition '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameMethodEdition';
  tempDataSet.Open;
  Result:= tempDataSet;
  //tempDataSet.Close;
  //tempDataSet.Free;
end;

function TMethodWorkController.LoadMethodWorkForFilter(TeacherIK, PlanMWIK: Integer): TDataSet;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  if (PlanMWIK = 0) and (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct NameWork '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWork'
  else if (TeacherIK <> 0) then
    tempDataSet.CommandText:=
    'select distinct NameWork '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWork';

  if (PlanMWIK = 0) and (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct NameWork '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWork'
  else if (TeacherIK = 0) then
    tempDataSet.CommandText:=
    'select distinct NameWork '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by NameWork';
  tempDataSet.Open;
  Result:= tempDataSet;
  //tempDataSet.Close;
  //tempDataSet.Free;
end;

function TMethodWorkController.LoadPrepodForFilter(PlanMWIK: Integer): TDataSet;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  if (PlanMWIK = 0) then
    tempDataSet.CommandText:=
    'select distinct Pr '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by Pr'
  else
    tempDataSet.CommandText:=
    'select distinct Pr '+
    'from MW_PlanFactPrep() '+
    'left join MW_ViewPlanFact '+
    'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
    'WHERE (Bit_coautor = 0) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
    'order by Pr';
  tempDataSet.Open;
  Result:= tempDataSet;
  //tempDataSet.Close;
  //tempDataSet.Free;
end;

// загрузка плана издания преподавателя по конкретной дисциплине
function TMethodWorkController.LoadPlanEditionPrepForConcrDisc(DiscIK, TeacherIK, PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanPrepForDiscForDisc.Active then dmMethodWork.adsPlanPrepForDiscForDisc.Close;
  dmMethodWork.adsPlanPrepForDiscForDisc.CommandText:= 'SELECT F.*, DateTransitionInState FROM dbo.MW_FactMW2 as F inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition '+
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (Bit_coautor = 0) and (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 1) and (itab_n = ' + IntToStr(TeacherIK) + ') and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';
  dmMethodWork.adsPlanPrepForDiscForDisc.Open;
  Result:= dmMethodWork.adsPlanPrepForDiscForDisc;
end;

// загрузка плана издания преподавателя по всем дисциплинам
function TMethodWorkController.LoadPlanEditionPrepForAllDisc(TeacherIK, year_value: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanEditionPrep.Active then dmMethodWork.adsPlanEditionPrep.Close;
  dmMethodWork.adsPlanEditionPrep.CommandText:= 'SELECT distinct IDWarrant, NameWarrant, DateTransitionInState, NameWork, NameMethodEdition, F.IDMethodEdition, IDMethodEditionPlan, Code, Characteristic, Volume, Drawing, Mark, Position, Discpl, BitEdition, CurrentBitEdition, Norma, NormaExpert ' +
  'from dbo.MW_DiscEdition() inner join dbo.MW_FactMW2 as F ON dbo.MW_DiscEdition.ID = F.IDMethodEdition inner join MW_EditionPrepods ON F.IDMethodEdition = MW_EditionPrepods.IDMethodEdition ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (Bit_coautor = 0) and (Bit_plan_fact = 1) and (itab_n = ' + IntToStr(TeacherIK) + ') and (Year(DateTransitionInState) = ' + IntToStr(year_value) + ') '+//(IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  'and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';
  dmMethodWork.adsPlanEditionPrep.Open;
  Result:= dmMethodWork.adsPlanEditionPrep;
end;

function TMethodWorkController.LoadPlanDep(PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanDep.Active then dmMethodWork.adsPlanDep.Close;
  {dmMethodWork.adsPlanDep.CommandText:= 'SELECT distinct NameWarrant, IDWarrant, NameWork, NameMethodEdition, F.IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, Discpl, IDMethodWork, Pr, DateTransitionInState, IDMethodEditionPlan, Norma, NormaExpert, NameUnit ' +
  'from dbo.MW_DiscEdition() inner join dbo.MW_FactMW2 as F ON dbo.MW_DiscEdition.ID = F.IDMethodEdition inner join MW_AutorEdition() ON F.IDMethodEdition = MW_AutorEdition.ID ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (Bit_plan_fact = 1) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') and ' +
  '(IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState';
  }
  if PlanMWIK = 0 then
    dmMethodWork.adsPlanDep.CommandText:=
  'select ID1, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime, Pr, PercentCompletion '+
  'from MW_PlanFactPrep() '+
  'left join MW_ViewPlanFact '+
  'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
  'WHERE (Bit_coautor = 0) '+
  //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(TeacherIK) + '))) '+
  'order by cName_disc, ID1, Bit_plan_fact desc'
  else
    dmMethodWork.adsPlanDep.CommandText:=
  'select ID1, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime, Pr, PercentCompletion '+
  'from MW_PlanFactPrep() '+
  'left join MW_ViewPlanFact '+
  'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition '+
  'WHERE (Bit_coautor = 0) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
  //'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (IDPlanMW = ' + IntToStr(PlanMWIK) + '))) '+
  'order by cName_disc, ID1, Bit_plan_fact desc';
  dmMethodWork.adsPlanDep.Open;
  Result:= dmMethodWork.adsPlanDep;
end;

function TMethodWorkController.LoadPlanEdDep(PlanMWIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanEdDep.Active then dmMethodWork.adsPlanEdDep.Close;
  dmMethodWork.adsPlanEdDep.CommandText:= 'SELECT distinct DateTransitionInState, IDWarrant, NameWarrant, NameWork, NameMethodEdition, F.IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, Discpl, IDMethodWork, Pr, Norma, NormaExpert, F.IDMethodEditionPlan, NameUnit ' +
  'from dbo.MW_DiscEdition() inner join dbo.MW_FactMW2 as F ON dbo.MW_DiscEdition.ID = F.IDMethodEdition inner join MW_AutorEdition() ON F.IDMethodEdition = MW_AutorEdition.ID ' +
  'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
  'WHERE (Bit_plan_fact = 1) and (IDPlanMW = ' + IntToStr(PlanMWIK) + ') and (CurrentBitEdition = 1) and '+
  '(IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsPlanEdDep.Open;
  Result:= dmMethodWork.adsPlanEdDep;
end;

function TMethodWorkController.LoadRatifyPlanDep(PlanMWIK, KafIK: Integer): TDataSet;
begin
  if dmMethodWork.adsPlanRatify.Active then dmMethodWork.adsPlanRatify.Close;
  {dmMethodWork.adsPlanRatify.CommandText:= 'select b.itab_n, FIO, KolPlan, KolFact, DateRatification from '+
    '(Select max(DateRatification) as DateRatification, itab_n From MethodEdition '+
    'inner join MW_PlanMethodWork ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'where (Bit_plan_fact = 1) and (Bit_coautor = 0) and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'group by itab_n)a '+
    'right join '+
    '(select distinct dbo.Prepods.itab_n, (clastname+'' ''+cfirstname+'' ''+cotch) as FIO, count(dbo.MW_EditionPrepods.IDMethodEdition) as KolPlan, count(IDMethodEditionPlan) as KolFact '+
    'from dbo.MW_PlanMethodWork '+
    'inner join dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'inner join dbo.Prepods ON dbo.MW_EditionPrepods.itab_n = dbo.Prepods.itab_n '+
    'where (Bit_plan_fact = 1) and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'Group by dbo.Prepods.itab_n, clastname, cfirstname, cotch)b '+
    'ON a.itab_n = b.itab_n order by FIO'; }
  if PlanMWIK <> 0 then
  dmMethodWork.adsPlanRatify.CommandText:= 'SELECT distinct a.itab_n, FIO, KolFactPlan, KolFactPercent, CAST(ISNULL(KolFactNorm,0) as varchar(10)) + '' / '' + CAST(KolPlanNorm as varchar(10)) as KolFactPlanNorm, '+
    'round(ISNULL(KolFactNorm,0)*100/KolPlanNorm,2) as KolFactNormPercent '+
    'FROM '+
    '(select distinct dbo.Prepods.itab_n, (clastname+'' ''+cfirstname+'' ''+cotch) as FIO, '+
      'CAST(count(IDMethodEditionPlan) as varchar(10)) + '' / '' + cast(count(dbo.MW_EditionPrepods.IDMethodEdition) as varchar(10)) as KolFactPlan, '+
      'round(CAST(count(IDMethodEditionPlan)as float)*100/CAST(count(dbo.MW_EditionPrepods.IDMethodEdition) as float),2) as KolFactPercent, '+
      'SUM(Norma*Volume) as KolPlanNorm '+
    'from dbo.MW_PlanMethodWork '+
    'inner join dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'inner join dbo.Prepods ON dbo.MW_EditionPrepods.itab_n = dbo.Prepods.itab_n '+
    'inner join dbo.MethodWork_NormOfTime ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_NormOfTime.IDContentNorm '+
    'where (Bit_plan_fact = 1) and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'Group by dbo.Prepods.itab_n, clastname, cfirstname, cotch)a '+
    'LEFT JOIN '+
    '(select distinct itab_n, SUM(Norma*Volume) as KolFactNorm '+
    'from dbo.MW_PlanMethodWork '+
    'inner join dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'inner join dbo.MethodWork_NormOfTime ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_NormOfTime.IDContentNorm '+
    'where (Bit_plan_fact = 0) and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'Group by itab_n)b '+
    'ON a.itab_n = b.itab_n '+
    'inner join dbo.Relation_kafedra_prep ON a.itab_n = dbo.Relation_kafedra_prep.itab_n '+
    'where ik_kaf = ' + IntToStr(KafIK) + ' '+
    'order by FIO'
  else
  dmMethodWork.adsPlanRatify.CommandText:= 'SELECT distinct a.itab_n, FIO, KolFactPlan, KolFactPercent, CAST(ISNULL(KolFactNorm,0) as varchar(10)) + '' / '' + CAST(KolPlanNorm as varchar(10)) as KolFactPlanNorm, '+
    'round(ISNULL(KolFactNorm,0)*100/KolPlanNorm,2) as KolFactNormPercent '+
    'FROM '+
    '(select distinct dbo.Prepods.itab_n, (clastname+'' ''+cfirstname+'' ''+cotch) as FIO, '+
      'CAST(count(IDMethodEditionPlan) as varchar(10)) + '' / '' + cast(count(dbo.MW_EditionPrepods.IDMethodEdition) as varchar(10)) as KolFactPlan, '+
      'round(CAST(count(IDMethodEditionPlan)as float)*100/CAST(count(dbo.MW_EditionPrepods.IDMethodEdition) as float),2) as KolFactPercent, '+
      'SUM(Norma*Volume) as KolPlanNorm '+
    'from dbo.MW_PlanMethodWork '+
    'inner join dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'inner join dbo.Prepods ON dbo.MW_EditionPrepods.itab_n = dbo.Prepods.itab_n '+
    'inner join dbo.MethodWork_NormOfTime ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_NormOfTime.IDContentNorm '+
    'where (Bit_plan_fact = 1) '+ //and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'Group by dbo.Prepods.itab_n, clastname, cfirstname, cotch)a '+
    'LEFT JOIN '+
    '(select distinct itab_n, SUM(Norma*Volume) as KolFactNorm '+
    'from dbo.MW_PlanMethodWork '+
    'inner join dbo.MethodEdition ON dbo.MW_PlanMethodWork.IDPlanMW = dbo.MethodEdition.IDPlanMW '+
    'inner join dbo.MW_EditionPrepods ON dbo.MethodEdition.IDMethodEdition = dbo.MW_EditionPrepods.IDMethodEdition '+
    'inner join dbo.MethodWork_NormOfTime ON dbo.MethodEdition.IDContentNorm = dbo.MethodWork_NormOfTime.IDContentNorm '+
    'where (Bit_plan_fact = 0) '+ //and (dbo.MethodEdition.IDPlanMW = ' + IntToStr(PlanMWIK) + ') '+
    'Group by itab_n)b '+
    'ON a.itab_n = b.itab_n '+
    'inner join dbo.Relation_kafedra_prep ON a.itab_n = dbo.Relation_kafedra_prep.itab_n '+
    'where ik_kaf = ' + IntToStr(KafIK) + ' '+
    'order by FIO';
  dmMethodWork.adsPlanRatify.Open;
  Result:= dmMethodWork.adsPlanRatify;
end;

function TMethodWorkController.LoadAutoPlanPrep(TeacherIK, KafIK, YearPlanNagrIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanMWPrep.Active then dmMethodWork.aspAutoPlanMWPrep.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanMWPrep.Parameters[1].Value := TeacherIK;
  dmMethodWork.aspAutoPlanMWPrep.Parameters[2].Value := KafIK;
  dmMethodWork.aspAutoPlanMWPrep.Parameters[3].Value := YearPlanNagrIK;
  //dmMethodWork.aspAutoPlanMWPrep.Parameters[4].Value := NormIK;
  try
      dmMethodWork.aspAutoPlanMWPrep.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanMWPrep.open;
      dmMethodWork.aspAutoPlanMWPrep.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanMWPrep.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanMWPrep;
end;

function TMethodWorkController.LoadAutoPlanPrepConcrDisc(TeacherIK, KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanMWPrepConcrDisc.Active then dmMethodWork.aspAutoPlanMWPrepConcrDisc.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanMWPrepConcrDisc.Parameters[0].Value := TeacherIK;
  dmMethodWork.aspAutoPlanMWPrepConcrDisc.Parameters[1].Value := KafIK;
  dmMethodWork.aspAutoPlanMWPrepConcrDisc.Parameters[2].Value := YearPlanNagrIK;
  dmMethodWork.aspAutoPlanMWPrepConcrDisc.Parameters[3].Value := NormIK;
  dmMethodWork.aspAutoPlanMWPrepConcrDisc.Parameters[4].Value := DiscIK;
  try
      dmMethodWork.aspAutoPlanMWPrepConcrDisc.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanMWPrepConcrDisc.open;
      dmMethodWork.aspAutoPlanMWPrepConcrDisc.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanMWPrepConcrDisc.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanMWPrepConcrDisc;
end;

function TMethodWorkController.LoadAutoPlanOffPrep(TeacherIK, KafIK, YearPlanNagrIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanMWOffPrep.Active then dmMethodWork.aspAutoPlanMWOffPrep.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanMWOffPrep.Parameters[0].Value := TeacherIK;
  dmMethodWork.aspAutoPlanMWOffPrep.Parameters[1].Value := KafIK;
  dmMethodWork.aspAutoPlanMWOffPrep.Parameters[2].Value := YearPlanNagrIK;
  //dmMethodWork.aspAutoPlanMWOffPrep.Parameters[3].Value := NormIK;
  try
      dmMethodWork.aspAutoPlanMWOffPrep.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanMWOffPrep.open;
      dmMethodWork.aspAutoPlanMWOffPrep.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanMWOffPrep.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanMWOffPrep;
end;

function TMethodWorkController.LoadAutoPlanOffPrepConcrDisc(TeacherIK, KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Active then dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Parameters[0].Value := TeacherIK;
  dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Parameters[1].Value := KafIK;
  dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Parameters[2].Value := YearPlanNagrIK;
  dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Parameters[3].Value := NormIK;
  dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Parameters[4].Value := DiscIK;
  try
      dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.open;
      dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanMWOffPrepConcrDisc.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanMWOffPrepConcrDisc;
end;

function TMethodWorkController.LoadAutoPlanDepAllDisc(KafIK, YearPlanNagrIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanDepAllDisc.Active then dmMethodWork.aspAutoPlanDepAllDisc.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanDepAllDisc.Parameters[0].Value := KafIK;
  dmMethodWork.aspAutoPlanDepAllDisc.Parameters[1].Value := YearPlanNagrIK;
  //dmMethodWork.aspAutoPlanDepAllDisc.Parameters[2].Value := NormIK;
  try
      dmMethodWork.aspAutoPlanDepAllDisc.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanDepAllDisc.open;
      dmMethodWork.aspAutoPlanDepAllDisc.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanDepAllDisc.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanDepAllDisc;
end;

{function TMethodWorkController.LoadAutoPlanDepConcrDisc(KafIK, YearPlanNagrIK, NormIK, DiscIK: Integer): TDataSet;
begin
  if dmMethodWork.aspAutoPlanDepConcrDisc.Active then dmMethodWork.aspAutoPlanDepConcrDisc.Close;
  // считываем параметры
  dmMethodWork.aspAutoPlanDepConcrDisc.Parameters[0].Value := KafIK;
  dmMethodWork.aspAutoPlanDepConcrDisc.Parameters[1].Value := YearPlanNagrIK;
  dmMethodWork.aspAutoPlanDepConcrDisc.Parameters[2].Value := NormIK;
  dmMethodWork.aspAutoPlanDepConcrDisc.Parameters[3].Value := DiscIK;
  try
      dmMethodWork.aspAutoPlanDepConcrDisc.Connection.BeginTrans;
      dmMethodWork.aspAutoPlanDepConcrDisc.open;
      dmMethodWork.aspAutoPlanDepConcrDisc.Connection.CommitTrans;
  except
      dmMethodWork.aspAutoPlanDepConcrDisc.Connection.RollbackTrans;
      raise;
  end;
  Result:= dmMethodWork.aspAutoPlanDepConcrDisc;
end;}

// загрузка пункта ГОСа
function TMethodWorkController.LoadItemGos(GosIK, ItemGosIK: integer): TDataSet;
begin
  if dmMethodWork.adsItemGos.Active then dmMethodWork.adsItemGos.Close;
  dmMethodWork.adsItemGos.CommandText:= 'Select * From MW_ContentItemGos ' +
  'WHERE (IDItemGos = ' + IntToStr(ItemGosIK) + ') and (IDGos = ' + IntToStr(GosIK) + ')';
  dmMethodWork.adsItemGos.Open;
  Result:= dmMethodWork.adsItemGos;
end;

// загрузка содержания дисциплины по ГОСу
function TMethodWorkController.LoadDiscGos(GosIK, DiscIK: integer): TDataSet;
begin
  if dmMethodWork.adsDiscGos.Active then dmMethodWork.adsDiscGos.Close;
  dmMethodWork.adsDiscGos.CommandText:= 'Select * From MW_ContentDiscOnGos ' +
  'WHERE (IDGos = ' + IntToStr(GosIK) + ') and (ik_disc = ' + IntToStr(DiscIK) + ')';
  dmMethodWork.adsDiscGos.Open;
  Result:= dmMethodWork.adsDiscGos;
end;

function TMethodWorkController.GetNormsOfTime(
  SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'Select (''Общие нормы времени, '' + Convert(nvarchar, Year_uch_pl.year_value) + '' год, Объем нагрузки: '' + Convert(nvarchar, MW_NormOfTime.Vnagr) + '', Доля нагрузки на УМР: '' + Convert(nvarchar, MW_NormOfTime.DnagrMW)) ' +
    'as cName_norm, MW_NormOfTime.* From MW_NormOfTime ' +
    'INNER JOIN Year_uch_pl ON MW_NormOfTime.ik_year = Year_uch_pl.ik_year_uch_pl Where (ik_kaf IS NULL) '+
    'UNION Select (cshort_name_kaf + '', '' + Convert(nvarchar, Year_uch_pl.year_value) + '' год, Объем нагрузки: '' + Convert(nvarchar, MW_NormOfTime.Vnagr) + '', Доля нагрузки на УМР: '' + Convert(nvarchar, MW_NormOfTime.DnagrMW)) ' +
    'as cName_norm, MW_NormOfTime.* From MW_NormOfTime INNER JOIN kafedra ON MW_NormOfTime.ik_kaf = kafedra.ik_kaf ' +
    'INNER JOIN Year_uch_pl ON MW_NormOfTime.ik_year = Year_uch_pl.ik_year_uch_pl '+
    'Order By Cname_norm',
    'IDNormOfTime',
    isShowFirst, NULL);
end;

function TMethodWorkController.GetDiscForFact(SourceDataSet: PDataSet;
  KafIK, TeacherIK: integer;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      {'Select distinct dbo.discpln.iK_disc, cName_disc FROM dbo.discpln inner join dbo.Content_plan_nagr ON dbo.discpln.iK_disc = dbo.Content_plan_nagr.ik_disc ' +
      'inner join dbo.Prepod_plan_nagr ON dbo.Content_plan_nagr.ik_content_plan_nagr = dbo.Prepod_plan_nagr.ik_content_plan_nagr ' +
      'inner join dbo.Relation_kafedra_prep ON dbo.Prepod_plan_nagr.ik_id_prepod = dbo.Relation_kafedra_prep.ik_id_prepod inner join dbo.Prepods ON dbo.Relation_kafedra_prep.itab_n = dbo.Prepods.itab_n WHERE (dbo.Prepods.itab_n =  ' + IntToStr(TeacherIK) + ')and(ik_kaf =  ' + IntToStr(KafIK) + ') order by cName_disc',
      }
      'Select distinct dbo.discpln.iK_disc, cName_disc FROM dbo.discpln inner join MethodWork_Disc ON dbo.discpln.iK_disc = dbo.MethodWork_Disc.ik_disc '+
      'inner join dbo.MethodEdition ON MethodWork_Disc.IDMethodEdition = MethodEdition.IDMethodEdition '+
      'inner join dbo.MW_PlanMethodWork ON dbo.MethodEdition.IDPlanMW = dbo.MW_PlanMethodWork.IDPlanMW '+
      'where (Bit_plan_fact = 0) and (ik_kaf = ' + IntToStr(KafIK) + ') order by cName_disc',
      'iK_disc',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetDiscForGos(SourceDataSet: PDataSet;
  KafIK: integer;
  isShowFirst: boolean): Variant;
begin
    if KafIK = 0 then //вывести все дисциплины
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select iK_disc, cName_disc FROM dbo.discpln ' +
      'where (lPract = 0) order by cName_disc',
      'iK_disc',
     isShowFirst, NULL)
    else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select distinct dbo.discpln.iK_disc, cName_disc FROM dbo.discpln inner join dbo.Content_plan_nagr ON dbo.discpln.iK_disc = dbo.Content_plan_nagr.ik_disc ' +
      'inner join dbo.Plan_nagr ON dbo.Content_plan_nagr.ik_plan_nagr = dbo.Plan_nagr.ik_plan_nagr ' +
      'WHERE (ik_kaf =  ' + IntToStr(KafIK) + ') order by cName_disc',
      'iK_disc',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetCurrentDiscForGos(SourceDataSet: PDataSet;
  GosIK, DiscCycleIK, DiscGroupIK: integer): Variant;
begin
  if (SourceDataSet^.Active) then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).Connection:= dm.DBConnect;
  (SourceDataSet^ as TADODataSet).CommandText:= 'exec MW_Proc_GetDisciplinesForGos ' + IntToStr(GosIK) + ', ' + IntToStr(DiscCycleIK) + ', ' + IntToStr(DiscGroupIK) + '';
  try
      SourceDataSet^.Open;
  except
      raise;
  end;

  if (SourceDataSet^.RecordCount > 0) then
      Result:= SourceDataSet^.FieldByName('ik_disc').Value
    else
      Result:= NULL;
end;

function TMethodWorkController.GetAllDisciplineCycles(SourceDataSet: PDataSet;
        isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select ckl_disc.IK_ckl_disc, RTRIM(ckl_disc.Cname_ckl_disc) as name_ckl_disc From ckl_disc ORDER BY Cname_ckl_disc', 'ik_ckl_disc', isShowFirst, NULL);
end;

function TMethodWorkController.GetAllDisciplineGroups(SourceDataSet: PDataSet;
        isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select grp_disc.IK_grp_disc, RTRIM(grp_disc.Cname_grp_disc) as name_grp_disc From grp_disc ORDER BY Cname_grp_disc', 'ik_grp_disc', isShowFirst, NULL);
end;

function TMethodWorkController.GetAllYears(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select *, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value From Year_uch_pl Order By year_value desc', 'ik_year_uch_pl', isShowFirst, defValue);
end;

function TMethodWorkController.GetTypeReport(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From MW_TypeReport Order By NameTypeReport', 'IDTypeReport', isShowFirst, defValue);
end;

function TMethodWorkController.GetAllYearsForGos(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
  'select * from Year_uch_pl '+
  'order by year_value desc',
  'ik_year_uch_pl',
  isShowFirst, defValue);
end;

function TMethodWorkController.GetAllYearsForPlanEd(SourceDataSet: PDataSet; KafIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
  'select distinct dbo.MW_PlanMethodWork.ik_year, year_value from dbo.MW_PlanMethodWork '+
  'inner join dbo.Year_uch_pl ON dbo.MW_PlanMethodWork.ik_year = dbo.Year_uch_pl.ik_year_uch_pl '+
  'WHERE (ik_kaf =  ' + IntToStr(KafIK) + ') '+
  //'union select distinct dbo.Year_uch_pl.ik_year_uch_pl, year_value from dbo.MW_PlanMethodWork '+
  //'inner join dbo.Year_uch_pl ON dbo.MW_PlanMethodWork.ik_year = dbo.Year_uch_pl.ik_year_uch_pl '+
  //'WHERE (ik_kaf =  ' + IntToStr(KafIK) + ') '+
  'order by year_value desc',
  'ik_year',
  isShowFirst, defValue);
end;

function TMethodWorkController.GetDepartmentName(KafIK: integer; isNeedShortName: boolean): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select cshort_name_kaf, cname_kaf FROM Kafedra WHERE ik_kaf = ' + IntToStr(KafIK);
  tempDS.Open;
  if isNeedShortName then
    Result:= tempDS.FieldByName('cshort_name_kaf').AsString
  else Result:= tempDS.FieldByName('cname_kaf').AsString;
  tempDS.Close;
  tempDS.Free;
end;

function TMethodWorkController.GetSpecName(KafIK: integer): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select ik_spec, Cshort_spec, Cname_spec FROM Spec_stud WHERE Ik_vip_dep = ' + IntToStr(KafIK);
  try
  try
    tempDS.Open;
    Result:= tempDS.FieldByName('ik_spec').Value;
    tempDS.Close;
  except
    raise;
  end;
  finally
    tempDS.Free;
  end;
end;

function TMethodWorkController.GetBitEdition(MWorkIK: integer): boolean;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select BitEdition FROM MethodWork WHERE IDMethodWork = ' + IntToStr(MWorkIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('BitEdition').AsBoolean;
  tempDS.Close;
  tempDS.Free;
end;

function TMethodWorkController.GetDiscForPlan(SourceDataSet: PDataSet;
  YearPlan, KafIK, TeacherIK: integer;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select distinct dbo.discpln.iK_disc, cName_disc FROM dbo.discpln inner join dbo.Content_plan_nagr ON dbo.discpln.iK_disc = dbo.Content_plan_nagr.ik_disc ' +
      'inner join dbo.Prepod_plan_nagr ON dbo.Content_plan_nagr.ik_content_plan_nagr = dbo.Prepod_plan_nagr.ik_content_plan_nagr ' +
      'inner join dbo.Relation_kafedra_prep ON dbo.Prepod_plan_nagr.ik_id_prepod = dbo.Relation_kafedra_prep.ik_id_prepod inner join dbo.Prepods ON dbo.Relation_kafedra_prep.itab_n = dbo.Prepods.itab_n '+
      'inner join dbo.Plan_nagr ON dbo.Content_plan_nagr.ik_plan_nagr = dbo.Plan_nagr.ik_plan_nagr WHERE (dbo.Prepods.itab_n =  ' + IntToStr(TeacherIK) + ')and(dbo.Relation_kafedra_prep.ik_kaf =  ' + IntToStr(KafIK) + ')and(ik_year =  ' + IntToStr(YearPlan) + ') order by cName_disc',
      'iK_disc',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetDiscForPlanDep(SourceDataSet: PDataSet;
  YearPlan, KafIK: integer;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select distinct dbo.discpln.iK_disc, cName_disc FROM dbo.discpln inner join dbo.Content_plan_nagr ON dbo.discpln.iK_disc = dbo.Content_plan_nagr.ik_disc ' +
      'inner join dbo.Plan_nagr ON dbo.Content_plan_nagr.ik_plan_nagr = dbo.Plan_nagr.ik_plan_nagr WHERE (ik_kaf =  ' + IntToStr(KafIK) + ')and(ik_year =  ' + IntToStr(YearPlan) + ') order by cName_disc',
      'iK_disc',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetPlanMWForPlan(SourceDataSet: PDataSet;
  KafIK: integer; AddAll,
  isShowFirst: boolean): Variant;
begin
  if AddAll then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select 0 as IDPlanMW, 0 as ik_year, NULL as DateRatification,  NULL as NumProtocol,  NULL as IDTypeReport, ''<все>'' as UchYear, 30000 as year_value from MW_PlanMethodWork union '+
      'select distinct IDPlanMW, dbo.MW_PlanMethodWork.ik_year, DateRatification, NumProtocol, IDTypeReport, '+
      '(Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as UchYear, year_value from dbo.MW_PlanMethodWork '+
      'inner join dbo.Year_uch_pl ON dbo.MW_PlanMethodWork.ik_year = dbo.Year_uch_pl.ik_year_uch_pl '+
      'WHERE (ik_kaf =  ' + IntToStr(KafIK) + ') order by year_value desc',
      'ik_year',
      isShowFirst, NULL)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select distinct IDPlanMW, dbo.MW_PlanMethodWork.ik_year, DateRatification, NumProtocol, IDTypeReport, '+
      '(Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as UchYear, year_value from dbo.MW_PlanMethodWork '+
      'inner join dbo.Year_uch_pl ON dbo.MW_PlanMethodWork.ik_year = dbo.Year_uch_pl.ik_year_uch_pl '+
      'WHERE (ik_kaf =  ' + IntToStr(KafIK) + ') order by year_value desc',
      'ik_year',
      isShowFirst, NULL);
end;

function TMethodWorkController.GetStatus(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select * from dbo.MW_Status',
      'IDStatus',
      isShowFirst, NULL);
end;

function TMethodWorkController.GetSpec(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select ik_spec, Cshort_spec, Cname_spec FROM Spec_stud ' +
      'order by Cname_spec',
      'ik_spec',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetYearGos(SourceDataSet: PDataSet;
  SpecIK: integer;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select * From MW_Gos inner join Year_uch_pl ON MW_Gos.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'WHERE (ik_spec =  ' + IntToStr(SpecIK) + ') order by year_value desc',
      'IDGos',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetItemGos(SourceDataSet: PDataSet;
  GosIK: integer;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select MW_ContentItemGos.IDItemGos, IDContentItemGos, NameItemGos From MW_ItemGos inner join MW_ContentItemGos ON MW_ItemGos.IDItemGos = MW_ContentItemGos.IDItemGos ' +
      'WHERE (IDGos =  ' + IntToStr(GosIK) + ') order by NameItemGos',
      'IDContentItemGos',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetAllItemGos(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select IDItemGos, NameItemGos From MW_ItemGos ' +
      'order by NameItemGos',
      'IDItemGos',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetDiscForDialogPlan(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select iK_disc, cName_disc FROM dbo.discpln order by cName_disc',
      'iK_disc',
     isShowFirst, NULL);
end;

function TMethodWorkController.GetMWForDialogPlan(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select * FROM dbo.MethodWork',
      'IDMethodWork',
     isShowFirst, NULL);
end;

//функция не используется...
function TMethodWorkController.GetUchPlanForFact(SourceDataSet: PDataSet;
  KafIK: integer; DiscIK: integer;
  isShowFirst: boolean): Variant;
//var
//  tempDS: TADODataSet;
begin
  {tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT release_date FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDS.Open;
  if tempDS.FieldByName('release_date').Value = NULL then
    Result:= GetPlans(SourceDataSet, GetKafedraIKFromTeacherIK(TeacherIK), isShowFirst)
  else}
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'Select distinct dbo.Uch_pl.*, (Convert(nvarchar,year_value) + ' + #39 + ' год, ' + #39 + ' + Cname_form_ed)as CnameUchPl from dbo.Uch_pl inner join dbo.sv_disc ON dbo.Uch_pl.ik_uch_plan = dbo.sv_disc.ik_uch_plan inner join dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan '+
      'inner join dbo.Year_uch_pl ON dbo.Uch_pl.ik_year_uch_pl = dbo.Year_uch_pl.ik_year_uch_pl inner join dbo.Form_ed ON dbo.Uch_pl.ik_form_ed = dbo.Form_ed.Ik_form_ed '+
      'WHERE (dbo.Content_UchPl.ik_kaf = ' + IntToStr(KafIK) + ') and (iK_disc = ' + IntToStr(DiscIK) + ') order by CnameUchPl',
      'ik_uch_plan',
      {'Select Plan_nagr.*, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1) + ' + #39 + ', ' + #39 + ' + Cname_sem_type + ' + #39 + ' семестр, ' + #39 + ' + cName_type_ed + ' + #39 + ', ' + #39 + ' + cName_form_ed) as cName_plan From Plan_nagr ' + 'INNER JOIN Year_uch_pl ON Plan_nagr.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'INNER JOIN SemesterType ON Plan_nagr.ik_sem_type = SemesterType.ik_sem_type INNER JOIN Type_ed ON Plan_nagr.ik_type_ed = Type_ed.ik_type_ed INNER JOIN Form_ed ON Plan_nagr.ik_form_ed = Form_ed.ik_form_ed ' +
      'INNER JOIN SemesterLength ON (Plan_nagr.ik_year = SemesterLength.ik_year) and (Plan_nagr.ik_sem_type = SemesterLength.ik_sem_type) Where (ik_kaf = ' + IntToStr(GetKafedraIKFromTeacherIK(TeacherIK)) +
      ') and (d_sem_start < ''' + FormatDateTime('mm.dd.yyyy', tempDS.FieldByName('release_date').AsDateTime) + ''') Order By ik_year, ik_sem_type, ik_type_ed, ik_form_ed', 'ik_plan_nagr', }
      isShowFirst, NULL);
  //tempDS.Close;
  //tempDS.Free;
end;

function TMethodWorkController.SaveNormOfTime(
  var NormIK: integer; KafIK, YearIK: integer; Volume, DolMW: real): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  {dmMethodWork.adsNormOfTime.First;
  while (not dmMethodWork.adsNormOfTime.Eof) do
  begin
    if (dmMethodWork.adsNormOfTime.FieldByName('NameWork').Value = NULL) or (dmMethodWork.adsNormOfTime.FieldByName('Norma').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо указать наименование обеспечения и норму времени для его выполнения для каждой записи!', 'Сохранение норм времени', MB_ICONWARNING);
      exit;
    end;
    dmMethodWork.adsNormOfTime.Next;
  end;}

  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateNorm';
  tempStoredProc.Connection:= dm.DBConnect;
  if NormIK < 0 then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
    tempStoredProc.Parameters.CreateParameter('@ik_norm_of_time', ftInteger, pdInput, 0, NormIK);
    if KafIK = 0 then tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, NULL)
       else tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafIK);
    tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
    tempStoredProc.Parameters.CreateParameter('@Vnagr', ftFloat, pdInput, 0, Volume);
    tempStoredProc.Parameters.CreateParameter('@DnagrMW', ftFloat, pdInput, 0, DolMW);

  try
    tempStoredProc.Open;
    NormIK:= tempStoredProc.FieldByName('LastValue').Value;
    tempStoredProc.Close;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
  tempStoredProc.Free;
  {dmMethodWork.adsNormOfTime.First;
  while (not dmMethodWork.adsNormOfTime.Eof) do
  begin
    dmMethodWork.adsNormOfTime.Edit;
    dmMethodWork.adsNormOfTime.FieldByName('IDNormOfTime').Value:= NormIK;
    dmMethodWork.adsNormOfTime.Next;
  end;
  try
    dmMethodWork.adsNormOfTime.UpdateBatch();
    Result:= true;
  except
    on E: EOleException do
      //if E.ErrorCode = ADO_ERROR then
        Result:= true;
      //else raise;
    on E: Exception do raise;
  end;}
end;

function TMethodWorkController.SaveSectionWork(
  NameW: string): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_AddSectionWork';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@NameWork', ftString, pdInput, 150, NameW);
  try
    tempStoredProc.Open;
    tempStoredProc.Close;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
  tempStoredProc.Free;
end;

procedure TMethodWorkController.SaveWork(var IDMW: integer;
  NameW: string; BitEdition: Integer; IDMWParent: integer; IDWarrant: Variant);
var
  tempStoredProc: TADOStoredProc;
begin
  //dm.MethodWorkDataSet.Append;

  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_AddWork';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@IDMethodWork', ftInteger, pdInput, 0, IDMW);
  tempStoredProc.Parameters.CreateParameter('@NameWork', ftString, pdInput, 150, NameW);
  case BitEdition of
   -1: tempStoredProc.Parameters.CreateParameter('@BitEdition', ftBoolean, pdInput, 0, NULL);
    0: tempStoredProc.Parameters.CreateParameter('@BitEdition', ftBoolean, pdInput, 0, false);
    1: tempStoredProc.Parameters.CreateParameter('@BitEdition', ftBoolean, pdInput, 0, true);
  end;
  tempStoredProc.Parameters.CreateParameter('@IDMethodWorkParent', ftInteger, pdInput, 0, IDMWParent);
  tempStoredProc.Parameters.CreateParameter('@IDWarrant', ftInteger, pdInput, 0, IDWarrant);
  try
  try
    tempStoredProc.Open;
    IDMW:= tempStoredProc.FieldByName('LastValue').Value;
    //IDBActionPublisher(dm).Notify(tempStoredProc, dbaInsert);
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

procedure TMethodWorkController.DeleteWork(MWorkIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_DeleteWork';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@IDMethodWork', ftInteger, pdInput, 0, MWorkIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;

function TMethodWorkController.SaveContentNormOfTime(
  NormIK: integer): boolean;
begin
  Result:= false;
  dmMethodWork.adsNormOfTime.First;
  while (not dmMethodWork.adsNormOfTime.Eof) do
  begin
    dmMethodWork.adsNormOfTime.Edit;
    dmMethodWork.adsNormOfTime.FieldByName('IDNormOfTime').Value:= NormIK;
    dmMethodWork.adsNormOfTime.Next;
  end;
  try
    dmMethodWork.adsNormOfTime.UpdateBatch();
    Result:= true;
  except
    on E: EOleException do
      //if E.ErrorCode = ADO_ERROR then
        Result:= true;
      //else raise;
    on E: Exception do raise;
  end;
end;

procedure TMethodWorkController.DeleteNormOfTime(NormOfTimeIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateNorm';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 5);
  tempStoredProc.Parameters.CreateParameter('@ik_norm_of_time', ftInteger, pdInput, 0, NormOfTimeIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;

procedure TMethodWorkController.LoadExistsNormOfTime(NormIK: integer);
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'Select * FROM MethodWork_NormOfTime Where IDNormOfTime = ' + IntToStr(NormIK);
  tempDataSet.Open;
  while (not tempDataSet.Eof) do
  begin
    dmMethodWork.adsNormOfTime.Insert;
    dmMethodWork.adsNormOfTime.FieldByName('IDNormOfTime').Value:= NormIK;
    dmMethodWork.adsNormOfTime.FieldByName('IDMethodWork').Value:= tempDataSet.FieldByName('IDMethodWork').Value;
    dmMethodWork.adsNormOfTime.FieldByName('Norma').Value:= tempDataSet.FieldByName('Norma').Value;
    dmMethodWork.adsNormOfTime.FieldByName('NormaExpert').Value:= tempDataSet.FieldByName('NormaExpert').Value;
    dmMethodWork.adsNormOfTime.FieldByName('IDUnit').Value:= tempDataSet.FieldByName('IDUnit').Value;
    dmMethodWork.adsNormOfTime.FieldByName('Remark').Value:= tempDataSet.FieldByName('Remark').Value;
    tempDataSet.Next;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TMethodWorkController.SaveMWvidZan(
  KafIK, VidZanIK: integer): boolean;
begin
  Result:= false;

  dmMethodWork.adsMethodWorkVidZan.First;
  while (not dmMethodWork.adsMethodWorkVidZan.Eof) do
  begin
    dmMethodWork.adsMethodWorkVidZan.Edit;
    dmMethodWork.adsMethodWorkVidZan.FieldByName('ik_kaf').Value:= KafIK;
    dmMethodWork.adsMethodWorkVidZan.FieldByName('iK_vid_zanyat').Value:= VidZanIK;
    dmMethodWork.adsMethodWorkVidZan.Next;
  end;
  try
    dmMethodWork.adsMethodWorkVidZan.UpdateBatch();
    Result:= true;
  except
    on E: EOleException do
      //if E.ErrorCode = ADO_ERROR then
        Result:= true;
      //else raise;
    on E: Exception do raise;
  end;
end;

function TMethodWorkController.SaveSrokMW(
  MWorkIK: integer): boolean;
begin
  Result:= false;
  dmMethodWork.adsSrokMW.First;
  while (not dmMethodWork.adsSrokMW.Eof) do
  begin
    dmMethodWork.adsSrokMW.Edit;
    dmMethodWork.adsSrokMW.FieldByName('IDWarrant').Value:= MWorkIK;
    dmMethodWork.adsSrokMW.Next;
  end;
  try
    dmMethodWork.adsSrokMW.UpdateBatch();
    Result:= true;
  except
    on E: EOleException do
      //if E.ErrorCode = ADO_ERROR then
        Result:= true;
      //else raise;
    on E: Exception do raise;
  end;
end;

function TMethodWorkController.LoadCoautor(KafIK, MethodEdIK :integer): TDataSet;
begin
  if dmMethodWork.adsCoautor.Active then dmMethodWork.adsCoautor.Close;
  if dmMethodWork.adsPrepods.Active then dmMethodWork.adsPrepods.Close;
  //dmMethodWork.adsPrepods.CommandText:= 'Select distinct (clastname + ' + #39 + ' ' + #39 + ' + cfirstname + ' + #39 + ' ' + #39 + ' + cotch) as FIO, Prepods.itab_n From Prepods inner join Relation_kafedra_prep ON Prepods.itab_n = Relation_kafedra_prep.itab_n where (ik_kaf = '+ IntToStr(KafIK) +') order by FIO';
  dmMethodWork.adsPrepods.CommandText:= 'Select distinct (clastname + ' + #39 + ' ' + #39 + ' + cfirstname + ' + #39 + ' ' + #39 + ' + cotch) as FIO, Prepods.itab_n From Prepods order by FIO';
  dmMethodWork.adsCoautor.CommandText:= 'Select MW_EditionPrepods.* From MW_EditionPrepods where (IDMethodEdition = '+ IntToStr(MethodEdIK) +') and (Bit_coautor = 1)';
  dmMethodWork.adsCoautor.Open;
  Result:= dmMethodWork.adsCoautor;
end;

function TMethodWorkController.LoadUchPlan(KafIK, MethodEdIK :integer): TDataSet;
begin
  if dmMethodWork.adsUchPlanMW.Active then dmMethodWork.adsUchPlanMW.Close;
  if dmMethodWork.adsUchPlan.Active then dmMethodWork.adsUchPlan.Close;
  //dmMethodWork.adsPrepods.CommandText:= 'Select distinct (clastname + ' + #39 + ' ' + #39 + ' + cfirstname + ' + #39 + ' ' + #39 + ' + cotch) as FIO, Prepods.itab_n From Prepods inner join Relation_kafedra_prep ON Prepods.itab_n = Relation_kafedra_prep.itab_n where (ik_kaf = '+ IntToStr(KafIK) +') order by FIO';
  dmMethodWork.adsUchPlan.CommandText:= 'SELECT ik_uch_plan, (Cshort_spec + '' ('' + cName_spclz_short + ''), '' + Cname_form_ed + '', '' + CAST(year_value as varchar(4))) as full_name '+
    'from Uch_pl inner join Spec_stud ON Uch_pl.ik_spec = Spec_stud.ik_spec '+
    'inner join Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl '+
    'inner join spclz ON Uch_pl.ik_spclz = spclz.ik_spclz '+
    'inner join Form_ed ON Uch_pl.ik_form_ed = Form_ed.ik_form_ed '+
    'where Uch_pl.ik_spec in (SELECT ik_spec FROM Relation_spec_fac inner join Fac On Relation_spec_fac.ik_fac = Fac.ik_fac inner join kafedra ON Fac.ik_fac = kafedra.ik_fac WHERE ik_kaf = ' + IntToStr(KafIK) + ') '+
    'order by year_value desc, Cshort_spec, Cname_form_ed';
  dmMethodWork.adsUchPlanMW.CommandText:= 'Select * From MethodEdition_Uch_pl where (IDMethodEdition = '+ IntToStr(MethodEdIK) +')';
  dmMethodWork.adsUchPlanMW.Open;
  Result:= dmMethodWork.adsUchPlanMW;
end;

 function TMethodWorkController.LoadState(BitPlan, MethodEdIK :integer): TDataSet;
begin
  if dmMethodWork.adsState.Active then dmMethodWork.adsState.Close;
  if dmMethodWork.adsStatus.Active then dmMethodWork.adsStatus.Close;
  dmMethodWork.adsStatus.CommandText:= 'Select * From MW_Status where Bit_Plan = '+ IntToStr(BitPlan) +' order by OrdinalNumber';
  dmMethodWork.adsState.CommandText:= 'Select * From MW_State where (MW_State.IDMethodEdition = '+ IntToStr(MethodEdIK) +')';
  dmMethodWork.adsState.Open;
  Result:= dmMethodWork.adsState;
end;

function TMethodWorkController.LoadFile(MethodEdIK :integer): TDataSet;
begin
  if dmMethodWork.adsFile.Active then dmMethodWork.adsFile.Close;
  dmMethodWork.adsFile.CommandText:= 'Select * From MW_File where IDFile in (select IDFile from MW_File_MethodEdition where IDMethodEdition = '+ IntToStr(MethodEdIK) +')';
  dmMethodWork.adsFile.Open;
  Result:= dmMethodWork.adsFile;
end;

function TMethodWorkController.LoadDiscInDBGrid(KafIK, MethodEdIK :integer): TDataSet;
begin
  if dmMethodWork.adsDiscMW.Active then dmMethodWork.adsDiscMW.Close;
  if dmMethodWork.adsDiscpln.Active then dmMethodWork.adsDiscpln.Close;
  //dmMethodWork.adsDiscpln.CommandText:= 'Select distinct discpln.* From discpln inner join dbo.Content_plan_nagr ON discpln.iK_disc = dbo.Content_plan_nagr.ik_disc ' +
  //'inner join dbo.Plan_nagr ON dbo.Content_plan_nagr.ik_plan_nagr = dbo.Plan_nagr.ik_plan_nagr where (lPract = 0) and (ik_kaf =  ' + IntToStr(KafIK) + ') order by cName_disc';
  dmMethodWork.adsDiscpln.CommandText:= 'Select discpln.* From discpln order by cName_disc';
  dmMethodWork.adsDiscMW.CommandText:= 'Select MethodWork_Disc.* From MethodWork_Disc where (IDMethodEdition = '+ IntToStr(MethodEdIK) +') and (Bit_MainDisc = 0)';
  dmMethodWork.adsDiscMW.Open;
  Result:= dmMethodWork.adsDiscMW;
end;

function TMethodWorkController.LoadMainDiscInDialog(MethodEdIK :integer): integer;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TADODataSet.Create(nil);
  tempDataSet.Connection:= dm.DBConnect;
  tempDataSet.CommandText:= 'Select iK_disc as DiscIK From MethodWork_Disc where (IDMethodEdition = '+ IntToStr(MethodEdIK) +') and (Bit_MainDisc = 1)';
  tempDataSet.Open;
  Result:= tempDataSet.FieldByName('DiscIK').AsInteger;
  tempDataSet.Close;
  tempDataSet.Free;
end;

procedure TMethodWorkController.SavePlan(
  BitFact, BitFactReal: Boolean; var IK: integer;
  NameEd: string; Volume: integer;
  Code, Charact, Draw, Pos, Mark: Variant;
  MethodWorkIK, PlanMWIK, PrepodIK, DiscIK: integer; BitEd: Boolean; CountFact: Variant);
var
  tempIK, tempN: integer;
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);

  if BitFact or BitFactReal then tempStoredProc.ProcedureName:= 'MW_Proc_UpdateFact'
  else tempStoredProc.ProcedureName:= 'MW_Proc_UpdatePlan';

  tempStoredProc.Connection:= dm.DBConnect;

  if (IK < 0) or BitFact then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);

  tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, IK);
  tempStoredProc.Parameters.CreateParameter('@NameMethodEdition', ftString, pdInput, 200, NameEd);
  if Code = '' then tempStoredProc.Parameters.CreateParameter('@Code', ftString, pdInput, 50, NULL)
               else tempStoredProc.Parameters.CreateParameter('@Code', ftString, pdInput, 50, Code);
  if Charact = '' then tempStoredProc.Parameters.CreateParameter('@Characteristic', ftString, pdInput, 500, NULL)
                  else tempStoredProc.Parameters.CreateParameter('@Characteristic', ftString, pdInput, 500, Charact);
  tempStoredProc.Parameters.CreateParameter('@Volume', ftInteger, pdInput, 0, Volume);
  if Draw = '' then tempStoredProc.Parameters.CreateParameter('@Drawing', ftString, pdInput, 50, NULL)
               else tempStoredProc.Parameters.CreateParameter('@Drawing', ftString, pdInput, 50, Draw);
  if Mark = '' then tempStoredProc.Parameters.CreateParameter('@Mark', ftString, pdInput, 15, NULL)
               else tempStoredProc.Parameters.CreateParameter('@Mark', ftString, pdInput, 15, Mark);
  if Pos = '' then tempStoredProc.Parameters.CreateParameter('@Position', ftInteger, pdInput, 0, NULL)
              else tempStoredProc.Parameters.CreateParameter('@Position', ftInteger, pdInput, 0, StrToInt(Pos));

  if BitFact or BitFactReal then tempStoredProc.Parameters.CreateParameter('@Bit_plan_fact', ftBoolean, pdInput, 0, false)
  else tempStoredProc.Parameters.CreateParameter('@Bit_plan_fact', ftBoolean, pdInput, 0, true);

  tempStoredProc.Parameters.CreateParameter('@IDContentNorm', ftInteger, pdInput, 0, MethodWorkIK);

  if BitFactReal then tempStoredProc.Parameters.CreateParameter('@IDPlanMW', ftInteger, pdInput, 0, NULL)
  else tempStoredProc.Parameters.CreateParameter('@IDPlanMW', ftInteger, pdInput, 0, PlanMWIK);

  tempStoredProc.Parameters.CreateParameter('@BitEdition', ftBoolean, pdInput, 0, BitEd);

  if (BitFact) or (BitFactReal) then
  begin
    if (CountFact = '') then tempStoredProc.Parameters.CreateParameter('@CountFactTime', ftInteger, pdInput, 0, NULL)
    else tempStoredProc.Parameters.CreateParameter('@CountFactTime', ftInteger, pdInput, 0, StrToInt(CountFact));
    tempStoredProc.Parameters.CreateParameter('@PercentCompletion', ftInteger, pdInput, 0, NULL);
  end
  else
  //if not(BitFact) and not(BitFactReal) then
  begin
    tempStoredProc.Parameters.CreateParameter('@CountFactTime', ftInteger, pdInput, 0, NULL);
    if (CountFact = '') then tempStoredProc.Parameters.CreateParameter('@PercentCompletion', ftInteger, pdInput, 0, NULL)
    else tempStoredProc.Parameters.CreateParameter('@PercentCompletion', ftInteger, pdInput, 0, StrToInt(CountFact));
  end;

  //if BitFact then tempStoredProc.Parameters.CreateParameter('@IDMethodEditionPlan', ftInteger, pdInput, 0, IK)
  //else tempStoredProc.Parameters.CreateParameter('@IDMethodEditionPlan', ftInteger, pdInput, 0, NULL);
try
  dmMethodWork.adsCoautor.Connection.BeginTrans;
  try
  try
    tempStoredProc.Open;
    tempIK:= tempStoredProc.FieldByName('LastValue').Value;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;

  if BitFact then
  begin
  //фиксируем факт
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_FixingFact';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@MetEdIK', ftInteger, pdInput, 0, tempIK);
  tempStoredProc.Parameters.CreateParameter('@MetEdPlanIK', ftInteger, pdInput, 0, IK);
  try
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
  end;

  dmMethodWork.adsCoautor.First;
  if (not BitFact) then
  while (not dmMethodWork.adsCoautor.Eof) do
  begin
  //соавторы
    dmMethodWork.adsCoautor.Edit;
    dmMethodWork.adsCoautor.FieldByName('IDMethodEdition').Value:= tempIK;
    dmMethodWork.adsCoautor.FieldByName('Bit_coautor').AsBoolean:= true;
    dmMethodWork.adsCoautor.Next;
  end
  else
  while (not dmMethodWork.adsCoautor.Eof) do
  begin
  //соавторы
    tempN:= dmMethodWork.adsCoautor.FieldByName('itab_n').AsInteger;
    dmMethodWork.adsCoautor.Insert;
    dmMethodWork.adsCoautor.FieldByName('itab_n').AsInteger:= tempN;
    dmMethodWork.adsCoautor.FieldByName('IDMethodEdition').Value:= tempIK;
    dmMethodWork.adsCoautor.FieldByName('Bit_coautor').AsBoolean:= true;
    dmMethodWork.adsCoautor.Next;
  end;

  dmMethodWork.adsDiscMW.First;
  if (not BitFact) then
  while (not dmMethodWork.adsDiscMW.Eof) do
  begin
  //дополнительные дисциплины
    dmMethodWork.adsDiscMW.Edit;
    dmMethodWork.adsDiscMW.FieldByName('IDMethodEdition').Value:= tempIK;
    dmMethodWork.adsDiscMW.FieldByName('Bit_MainDisc').AsBoolean:= false;
    dmMethodWork.adsDiscMW.Next;
  end
  else
  while (not dmMethodWork.adsDiscMW.Eof) do
  begin
  //дополнительные дисциплины
    tempN:= dmMethodWork.adsDiscMW.FieldByName('iK_disc').AsInteger;
    dmMethodWork.adsDiscMW.Insert;
    dmMethodWork.adsDiscMW.FieldByName('iK_disc').AsInteger:= tempN;
    dmMethodWork.adsDiscMW.FieldByName('IDMethodEdition').Value:= tempIK;
    dmMethodWork.adsDiscMW.FieldByName('Bit_MainDisc').AsBoolean:= false;
    dmMethodWork.adsDiscMW.Next;
  end;

  dmMethodWork.adsState.First;
  while (not dmMethodWork.adsState.Eof) do
  begin
  //сохранение состояния
  dmMethodWork.adsState.Edit;
  dmMethodWork.adsState.FieldByName('IDMethodEdition').AsInteger:= tempIK;
  dmMethodWork.adsState.Next;
  end;

  dmMethodWork.adsUchPlanMW.First;
  while (not dmMethodWork.adsUchPlanMW.Eof) do
  begin
  //сохранение учебных планов
  dmMethodWork.adsUchPlanMW.Edit;
  dmMethodWork.adsUchPlanMW.FieldByName('IDMethodEdition').AsInteger:= tempIK;
  dmMethodWork.adsUchPlanMW.Next;
  end;

  if (IK < 0) or BitFact then
  begin
    //сохранение автора
  dmMethodWork.adsCoautor.Insert;
  dmMethodWork.adsCoautor.FieldByName('itab_n').AsInteger:= PrepodIK;
  dmMethodWork.adsCoautor.FieldByName('IDMethodEdition').AsInteger:= tempIK;
  dmMethodWork.adsCoautor.FieldByName('Bit_coautor').AsBoolean:= false;
    //сохранение основной дисциплины
  dmMethodWork.adsDiscMW.Insert;
  dmMethodWork.adsDiscMW.FieldByName('iK_disc').AsInteger:= DiscIK;
  dmMethodWork.adsDiscMW.FieldByName('IDMethodEdition').AsInteger:= tempIK;
  dmMethodWork.adsDiscMW.FieldByName('Bit_MainDisc').AsBoolean:= true;
  end;

  try
    dmMethodWork.adsCoautor.UpdateBatch();
    dmMethodWork.adsDiscMW.UpdateBatch();
    dmMethodWork.adsState.UpdateBatch();
    dmMethodWork.adsUchPlanMW.UpdateBatch();
    dmMethodWork.adsFile.UpdateBatch();

    //сохранение связи Файлы_УМР
    //обновляем связь, так как стоит опция ON DELETE CASCADE
    if dmMethodWork.adsFileMW.Active then dmMethodWork.adsFileMW.Close;
    dmMethodWork.adsFileMW.CommandText:= 'Select * From MW_File_MethodEdition where (IDMethodEdition = '+ IntToStr(tempIK) +')';
    dmMethodWork.adsFileMW.Open;
    //сначала все удаляем
    dmMethodWork.adsFileMW.First;
    while (not dmMethodWork.adsFileMW.Eof) do
    begin
      dmMethodWork.adsFileMW.Delete;
    end;
    //затем наполняем заново с учетом внесенных изменений
    dmMethodWork.adsFile.First;
    dmMethodWork.adsFileMW.First;
    while (not dmMethodWork.adsFile.Eof) do
    begin
      dmMethodWork.adsFileMW.Insert;
      dmMethodWork.adsFileMW.FieldByName('IDFile').AsInteger:= dmMethodWork.adsFile.FieldByName('IDFile').AsInteger;
      dmMethodWork.adsFileMW.FieldByName('IDMethodEdition').AsInteger:= tempIK;
      dmMethodWork.adsFile.Next;
    end;
    dmMethodWork.adsFileMW.UpdateBatch();
    //dmMethodWork.adsFile.ApplyUpdates(-1);
  except
    on E: EOleException do
      //if E.ErrorCode = ADO_ERROR then
       ;
      //else raise;
    on E: Exception do raise;
  end;

  if (IK > 0) and (not BitFact) then
  begin
  //обновляем основную дисциплину
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateMainDisc';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, IK);
  tempStoredProc.Parameters.CreateParameter('@iK_disc', ftInteger, pdInput, 0, DiscIK);
  try
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
  end;
  IK:= tempIK;
  dmMethodWork.adsCoautor.Connection.CommitTrans;
except
  dmMethodWork.adsCoautor.Connection.RollbackTrans;
end;
end;

procedure TMethodWorkController.SavePlanEdition(MEditionIK: integer; BitEd: Boolean);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdatePlanEdition';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, MEditionIK);
  tempStoredProc.Parameters.CreateParameter('@BitEdition', ftBoolean, pdInput, 0, BitEd);
  try
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
  except
      tempStoredProc.Connection.RollbackTrans;
      raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

function TMethodWorkController.GetLastNormOfTime(
  KafIK: integer): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetLastNormOfTime';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  try
  try
    tempStoredProc.Open;
    Result:= tempStoredProc.FieldByName('LastNorm').AsInteger;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

function TMethodWorkController.GetVolumeForMW(
  KafIK, PrepIK, NormIK: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetVolumeMW';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  tempStoredProc.Parameters.CreateParameter('@PrepIK', ftInteger, pdInput, 0, PrepIK);
  tempStoredProc.Parameters.CreateParameter('@NormIK', ftInteger, pdInput, 0, NormIK);
  try
  try
    tempStoredProc.Open;
    Result:= tempStoredProc.FieldByName('Volume').AsFloat;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

function TMethodWorkController.GetVolumeForMWDep(
  KafIK, NormIK: integer): double;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetVolumeMWDep';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  tempStoredProc.Parameters.CreateParameter('@NormIK', ftInteger, pdInput, 0, NormIK);
  try
  try
    tempStoredProc.Open;
    Result:= tempStoredProc.FieldByName('Volume').AsFloat;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;
end;

function TMethodWorkController.GetPlanVolumeForMW(DataSet: TDataSet): TDoubleArray;
var
  //tempStoredProc: TADOStoredProc;
  P: TDoubleArray;
begin
  {tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetPlanVolumeMW';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  tempStoredProc.Parameters.CreateParameter('@PrepIK', ftInteger, pdInput, 0, PrepIK);
  tempStoredProc.Parameters.CreateParameter('@YearPlanIK', ftInteger, pdInput, 0, YearPlanIK);
  tempStoredProc.Parameters.CreateParameter('@NormIK', ftInteger, pdInput, 0, NormIK);
  try
  try
    tempStoredProc.Open;
    Result:= tempStoredProc.FieldByName('Plann').AsFloat;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end; }
  P[4]:= 0;
  DataSet.First;
  while (not DataSet.Eof) do
  begin
    if DataSet.FieldByName('Bit_plan_fact').AsBoolean then
    begin
      //запланированный объем на УМР
      P[0]:= P[0] + (DataSet.FieldByName('Norma').Value * DataSet.FieldByName('Volume').Value);
      P[1]:= P[1] + (DataSet.FieldByName('NormaExpert').Value * DataSet.FieldByName('Volume').Value);
    end
    else
    begin
      //выполненный объем на УМР
      P[2]:= P[2] + (DataSet.FieldByName('Norma').Value * DataSet.FieldByName('Volume').Value);
      P[3]:= P[3] + (DataSet.FieldByName('NormaExpert').Value * DataSet.FieldByName('Volume').Value);
      if (DataSet.FieldByName('CountFactTime').Value <> NULL) then
        P[4]:= P[4] + (DataSet.FieldByName('CountFactTime').Value);
    end;
    DataSet.Next;
  end;
  Result:= P;
end;

function TMethodWorkController.GetPlanVolumeForMWdisc(
  KafIK, PrepIK, YearPlanIK, NormIK, DiscIK: integer): TDoubleArray;
var
  //tempStoredProc: TADOStoredProc;
  P: TDoubleArray;
begin
  {tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetPlanVolumeMWforDisc';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  tempStoredProc.Parameters.CreateParameter('@PrepIK', ftInteger, pdInput, 0, PrepIK);
  tempStoredProc.Parameters.CreateParameter('@YearPlanIK', ftInteger, pdInput, 0, YearPlanIK);
  tempStoredProc.Parameters.CreateParameter('@NormIK', ftInteger, pdInput, 0, NormIK);
  tempStoredProc.Parameters.CreateParameter('@DiscIK', ftInteger, pdInput, 0, DiscIK);
  try
  try
    tempStoredProc.Open;
    Result:= tempStoredProc.FieldByName('Plann').AsFloat;
    tempStoredProc.Close;
  except
    raise;
  end;
  finally
    tempStoredProc.Free;
  end;}
  dmMethodWork.adsPlanPrepForDisc.First;
  while (not dmMethodWork.adsPlanPrepForDisc.Eof) do
  begin
    P[0]:= P[0] + (dmMethodWork.adsPlanPrepForDisc.FieldByName('Norma').Value * dmMethodWork.adsPlanPrep.FieldByName('Volume').Value);
    P[1]:= P[1] + (dmMethodWork.adsPlanPrepForDisc.FieldByName('NormaExpert').Value * dmMethodWork.adsPlanPrep.FieldByName('Volume').Value);
    dmMethodWork.adsPlanPrepForDisc.Next;
  end;
  Result:= P;
end;

function TMethodWorkController.GetFactVolumeForMW(dsFact: TDataSet): TDoubleArray;
var
  P: TDoubleArray;
begin
  dsFact.First;
  while (not dsFact.Eof) do
  begin
    P[0]:= P[0] + (dsFact.FieldByName('Norma').Value * dsFact.FieldByName('Volume').Value);
    P[1]:= P[1] + (dsFact.FieldByName('NormaExpert').Value * dsFact.FieldByName('Volume').Value);
    dsFact.Next;
  end;
  Result:= P;
end;

function TMethodWorkController.GetPlanEditionVolumeForMW(dsPlanEd: TDataSet): TDoubleArray;
var
  P: TDoubleArray;
begin
  dsPlanEd.First;
  while (not dsPlanEd.Eof) do
  begin
    if dsPlanEd.FieldByName('CurrentBitEdition').AsBoolean then
    begin
      P[0]:= P[0] + (dsPlanEd.FieldByName('Norma').Value * dsPlanEd.FieldByName('Volume').Value);
      P[1]:= P[1] + (dsPlanEd.FieldByName('NormaExpert').Value * dsPlanEd.FieldByName('Volume').Value);
    end;
    dsPlanEd.Next;
  end;
  Result:= P;
end;

function TMethodWorkController.GetBitCoautor(
  MEditionIK, PrepIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetBitCoautor';
  tempStoredProc.Parameters.CreateParameter('@MEditionIK', ftInteger, pdInput, 0, MEditionIK);
  tempStoredProc.Parameters.CreateParameter('@PrepIK', ftInteger, pdInput, 0, PrepIK);
  tempStoredProc.Open;
  if tempStoredProc.FieldByName('Bit_coautor').Value = NULL then Result:= true
  else Result:= tempStoredProc.FieldByName('Bit_coautor').AsBoolean;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

procedure TMethodWorkController.GetPlanCloseFact;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetPlanCloseFact';
  //tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, MEditionIK);
  tempStoredProc.ExecProc;
  //Result:= tempStoredProc.FieldByName('IDMethodEdition').Value;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

procedure TMethodWorkController.GetFilteredFact(KafIK, CountM: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_FilteredFact';
  tempStoredProc.Parameters.CreateParameter('@KafIK', ftInteger, pdInput, 0, KafIK);
  tempStoredProc.Parameters.CreateParameter('@CountMounth', ftInteger, pdInput, 0, CountM);
  tempStoredProc.ExecProc;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;

{function TMethodWorkController.GetPlanDepClosePlanPrep(
  MWorkIK, DiscIK, PlanIK: integer): variant;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'MW_Proc_GetPlanDepClosePlanPrep';
  tempStoredProc.Parameters.CreateParameter('@IDMethodWork', ftInteger, pdInput, 0, MWorkIK);
  tempStoredProc.Parameters.CreateParameter('@DiscIK', ftInteger, pdInput, 0, DiscIK);
  tempStoredProc.Parameters.CreateParameter('@PlanIK', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Open;
  Result:= tempStoredProc.FieldByName('IDMethodEdition').Value;
  tempStoredProc.Close;
  tempStoredProc.Free;
end;}

procedure TMethodWorkController.DeleteMWfromPlan(MEditionIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdatePlan';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 5);
  tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, MEditionIK);
  try
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
  except
      tempStoredProc.Connection.RollbackTrans;
      raise;
  end;
  finally
      tempStoredProc.Free;
  end;
end;

procedure TMethodWorkController.DeleteMWfromFact(MEditionIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateFact';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 5);
  tempStoredProc.Parameters.CreateParameter('@IDMethodEdition', ftInteger, pdInput, 0, MEditionIK);
  try
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
  except
      tempStoredProc.Connection.RollbackTrans;
      raise;
  end;
  finally
      tempStoredProc.Free;
  end;
end;

procedure TMethodWorkController.ExportCurrentTeacherPlan(PrepIK: integer; YearPlan: string; YearVolMW, PlanVolMW: double);
var ExAppl, wb, Sheet: Variant;
    str:string;
    i, N: integer;
    tempDataSet1, tempDataSet2: TADODataSet;
begin
  try
     ExAppl:=CreateOleObject('Excel.Application');
     ExAppl.DisplayAlerts:= false;
     str:= ExtractFilePath(Application.ExeName)+'reports\MW_CurrentPlanPrep.XLT';
     ExAppl.WorkBooks.Add(str);
     wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];
     Sheet:= ExAppl.ActiveSheet;
     Sheet.Name:= 'Учебно-методическая работа';

     try
     try
       //выводим ФИО преподавателя
       tempDataSet1:= TADODataSet.Create(nil);
       tempDataSet1.Connection:= dm.DBConnect;
       tempDataSet1.CommandText:= 'Select (clastname + ' + #39 + ' ' + #39 + ' + cfirstname + ' + #39 + ' ' + #39 + ' + cotch) as FIO From Prepods where (itab_n = '+ IntToStr(PrepIK) +')';
       tempDataSet1.Open;
       ExAppl.Cells.Replace(What := '#FIO#',Replacement:= tempDataSet1.FieldByName('FIO').AsString);
     except
       Application.MessageBox('Произошла ошибка при обращении к серверу.','ИС Учебно-методическая работа',MB_OK);
       exit;
     end;
     finally
       tempDataSet1.Free;
     end;

     case MonthOf(Date) of
      1: str:= 'января';
      2: str:= 'февраля';
      3: str:= 'марта';
      4: str:= 'апреля';
      5: str:= 'мая';
      6: str:= 'июня';
      7: str:= 'июля';
      8: str:= 'августа';
      9: str:= 'сентября';
      10: str:= 'октября';
      11: str:= 'ноября';
      12: str:= 'декабря';
     end;
     Sheet.Cells.Replace(What := '#Date#',Replacement:= DayOf(Date));
     Sheet.Cells.Replace(What := '#Month#',Replacement:= str); //FormatDateTime('mmmm', Date));
     Sheet.Cells.Replace(What := '#Year#',Replacement:= YearOf(Date));
     Sheet.Cells.Replace(What := '#YY#',Replacement:= YearPlan);

  try
  try
     tempDataSet2:= TADODataSet.Create(nil);
     tempDataSet2.Connection:= dm.DBConnect;

     dmMethodWork.adsPlanPrep.First;
     i:= 10; N:= 0;
     while (not dmMethodWork.adsPlanPrep.Eof) do //and (i <= 10+dmMethodWork.adsPlanPrep.RecordCount) do
       begin
        inc(N);
        Sheet.Cells[i,1]:= IntToStr(N);
        Sheet.Cells[i,2]:= dmMethodWork.adsPlanPrep.FieldByName('Discpl').Value;
        Sheet.Cells[i,3]:= dmMethodWork.adsPlanPrep.FieldByName('NameWork').Value;
        Sheet.Cells[i,4]:= dmMethodWork.adsPlanPrep.FieldByName('NameMethodEdition').Value;
        Sheet.Cells[i,5]:= dmMethodWork.adsPlanPrep.FieldByName('Characteristic').Value;
        Sheet.Cells[i,6]:= dmMethodWork.adsPlanPrep.FieldByName('Volume').Value;
        Sheet.Cells[i,7]:= dmMethodWork.adsPlanPrep.FieldByName('Drawing').Value;
        Sheet.Cells[i,8]:= dmMethodWork.adsPlanPrep.FieldByName('Code').Value;
        Sheet.Cells[i,9]:= dmMethodWork.adsPlanPrep.FieldByName('Position').Value;

  tempDataSet2.CommandText:= 'Select DateTransitionInState From MW_State where (IDMethodEdition = '+ dmMethodWork.adsPlanPrep.FieldByName('IDMethodEdition').AsString +')and (IDStatus = 9)';
  tempDataSet2.Open;
  Sheet.Cells[i,10]:= tempDataSet2.FieldByName('DateTransitionInState').Value;
  tempDataSet2.Close;

  tempDataSet2.CommandText:= 'Select Mark, DateTransitionInState From MethodEdition inner join MW_State ON MethodEdition.IDMethodEdition = MW_State.IDMethodEdition where (MethodEdition.IDMethodEditionPlan = '+ dmMethodWork.adsPlanPrep.FieldByName('IDMethodEdition').AsString +')and (IDStatus = 10)';
  tempDataSet2.Open;
  Sheet.Cells[i,11]:= tempDataSet2.FieldByName('DateTransitionInState').Value;
  Sheet.Cells[i,12]:= tempDataSet2.FieldByName('Mark').Value;
  tempDataSet2.Close;

        dmMethodWork.adsPlanPrep.Next;
        inc(i);
       end;
  except
    Application.MessageBox('Произошла ошибка при обращении к серверу.','ИС Учебно-методическая работа',MB_OK);
    exit;
  end;
  finally
    tempDataSet2.Free;
  end;


     Sheet.Range['A10:' +'L'+IntToStr(i-1)].Borders.Weight:=2;

     Sheet.Cells[i+2,4]:= 'Итого:';
     Sheet.Cells[i+2,5]:= 'годовой объем на УМР:';
     Sheet.Range['F'+IntToStr(i+2)+':'+'G'+IntToStr(i+2)].Merge(true);
     Sheet.Range['F'+IntToStr(i+2)+':'+'G'+IntToStr(i+2)].Font.Bold:= true;
     Sheet.Cells[i+2,6]:= FloatToStrF(YearVolMW, ffFixed, 10, 2) + ' час.';
     Sheet.Range['H'+IntToStr(i+2)+':'+'I'+IntToStr(i+2)].Merge(true);
     Sheet.Cells[i+2,8]:= 'запланировано:';
     Sheet.Range['J'+IntToStr(i+2)+':'+'K'+IntToStr(i+2)].Merge(true);
     Sheet.Range['J'+IntToStr(i+2)+':'+'K'+IntToStr(i+2)].Font.Bold:= true;
     Sheet.Cells[i+2,10]:= FloatToStrF(PlanVolMW, ffFixed, 10, 2) + ' час.';;

     ExAppl.Visible:= true;
     ExAppl.DisplayAlerts:= true;

  except
     Application.MessageBox('Произошла ошибка при экспорте данных в Excel.','ИС Учебно-методическая работа',MB_OK);
     ExAppl.Quit;
     ExAppl:= UnAssigned;
  end;
end;

procedure TMethodWorkController.SavePlanDep(var
  PlanIK: integer; KafedraIK, YearIK: integer; Date, TypeRepIK, NumRep: Variant);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdatePlanDep';
  tempStoredProc.Connection:= dm.DBConnect;
  if PlanIK < 0 then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@PlanID', ftInteger, pdInput, 0, PlanIK);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);

  if PlanIK < 0 then
  begin
    tempStoredProc.Parameters.CreateParameter('@DateRatification', ftDateTime, pdInput, 0, NULL);
    tempStoredProc.Parameters.CreateParameter('@IDTypeReport', ftInteger, pdInput, 0, NULL);
    tempStoredProc.Parameters.CreateParameter('@NumProtocol', ftInteger, pdInput, 0, NULL);
  end
  else
  begin
    tempStoredProc.Parameters.CreateParameter('@DateRatification', ftDateTime, pdInput, 0, StrToDateTime(Date));
    tempStoredProc.Parameters.CreateParameter('@IDTypeReport', ftInteger, pdInput, 0, TypeRepIK);
    tempStoredProc.Parameters.CreateParameter('@NumProtocol', ftInteger, pdInput, 0, StrToInt(NumRep));
  end;

  try
    try
      tempStoredProc.Open;
      PlanIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
      tempStoredProc.Close;
    except
      on ex: EOleException do
        if ex.ErrorCode = -2147217900 then
          raise EApplicationException.Create(ex.Message, ex);
        else raise;
    end;
  finally
    tempStoredProc.Free;
  end;
end;

function TMethodWorkController.SaveGos(var
  GosIK: integer; SpecIK, YearIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateGos';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempStoredProc.Parameters.CreateParameter('@GosID', ftInteger, pdInput, 0, GosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_spec', ftInteger, pdInput, 0, SpecIK);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  try
    tempStoredProc.Open;
    GosIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

{procedure TMethodWorkController.SaveItemGos(var
  GosIK: integer; SpecIK, YearIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateItemGos';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  tempStoredProc.Parameters.CreateParameter('@GosID', ftInteger, pdInput, 0, GosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_spec', ftInteger, pdInput, 0, SpecIK);
  tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  try
    tempStoredProc.Open;
    GosIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
end; }

function TMethodWorkController.SaveItemGos(var
  ContentItemGosIK: integer; GosIK, ItemGosIK: integer; Content: Variant): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateContentItemGos';
  tempStoredProc.Connection:= dm.DBConnect;
  if ContentItemGosIK < 0 then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_ContentItemGos', ftInteger, pdInput, 0, ContentItemGosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_Gos', ftInteger, pdInput, 0, GosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_ItemGos', ftInteger, pdInput, 0, ItemGosIK);
  tempStoredProc.Parameters.CreateParameter('@ContentItemGos', ftString, pdInput, MaxListSize, Content);
  try
    tempStoredProc.Open;
    ContentItemGosIK:= tempStoredProc.FieldByName('LastValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TMethodWorkController.SaveDiscGos(var
  ContentDiscGosIK: integer; GosIK, DiscIK, CklDisc, GrpDisc: integer; Code: string; Hour:integer; Content: string): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateContentDiscGos';
  tempStoredProc.Connection:= dm.DBConnect;
  if ContentDiscGosIK < 0 then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
  else
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
  tempStoredProc.Parameters.CreateParameter('@ik_ContentDiscGos', ftInteger, pdInput, 0, ContentDiscGosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_Gos', ftInteger, pdInput, 0, GosIK);
  tempStoredProc.Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscIK);
  if Code = ' ' then tempStoredProc.Parameters.CreateParameter('@Code', ftString, pdInput, 10, NULL)
     else tempStoredProc.Parameters.CreateParameter('@Code', ftString, pdInput, 10, Code);
  if Hour = 0 then tempStoredProc.Parameters.CreateParameter('@TotalHour', ftInteger, pdInput, 0, NULL)
     else tempStoredProc.Parameters.CreateParameter('@TotalHour', ftInteger, pdInput, 0, Hour);
  tempStoredProc.Parameters.CreateParameter('@ContentDiscGos', ftString, pdInput, MaxListSize, Content);
  tempStoredProc.Parameters.CreateParameter('@IK_ckl_disc', ftInteger, pdInput, 0, CklDisc);
  if GrpDisc = -1 then tempStoredProc.Parameters.CreateParameter('@IK_grp_disc', ftInteger, pdInput, 0, NULL)
     else tempStoredProc.Parameters.CreateParameter('@IK_grp_disc', ftInteger, pdInput, 0, GrpDisc);
  try
    tempStoredProc.Open;
    ContentDiscGosIK:= tempStoredProc.FieldByName('LastValue').AsInteger;
    tempStoredProc.Close;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

procedure TMethodWorkController.DeletePlanDep(
  PlanIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdatePlanDep';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@PlanID', ftInteger, pdInput, 0, PlanIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;

procedure TMethodWorkController.DeleteGos(
  GosIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateGos';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@GosID', ftInteger, pdInput, 0, GosIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;

procedure TMethodWorkController.DeleteItemGos(
  ContentItemGosIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateContentItemGos';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 5);
  tempStoredProc.Parameters.CreateParameter('@ik_ContentItemGos', ftInteger, pdInput, 0, ContentItemGosIK);
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
  except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
      raise;
  end;
end;

procedure TMethodWorkController.DeleteDiscGos(
  ContentDiscGosIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'MW_Proc_UpdateContentDiscGos';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 5);
  tempStoredProc.Parameters.CreateParameter('@ik_ContentDiscGos', ftInteger, pdInput, 0, ContentDiscGosIK);
  try
  try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
  except
      tempStoredProc.Connection.RollbackTrans;
      raise;
  end;
  finally
     tempStoredProc.Free;
  end;
end;

function TMethodWorkController.LoadCurrentMW(PlanIK, DiscIK, WarrantIK :integer): TDataSet;
begin
  if dmMethodWork.adsCurrentMW.Active then dmMethodWork.adsCurrentMW.Close;
  dmMethodWork.adsCurrentMW.CommandText:= 'SELECT *, cast(Norma as varchar) + '' ч. '' + NameUnit as NormaUnit FROM dbo.MW_FactMW2 as F inner join MW_AutorEdition() ON F.IDMethodEdition = MW_AutorEdition.ID '+
    'inner join MW_State ON F.IDMethodEdition = MW_State.IDMethodEdition ' +
    'WHERE (iK_disc = ' + IntToStr(DiscIK) + ') and (Bit_plan_fact = 1) and (IDWarrant = ' + IntToStr(WarrantIK) + ') and (IDPlanMW = ' + IntToStr(PlanIK) + ') and '+
    '(IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = F.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = F.IDMethodEdition))) order by DateTransitionInState desc';
  dmMethodWork.adsCurrentMW.Open;
  Result:= dmMethodWork.adsCurrentMW;
end;

//----------------------------------------------------------------------------------------------------
procedure TMethodWorkController.BuildWorkTree(ATreeView: TTreeView);
var
  workDS: TADODataSet;
  wtTreeNode: TTreeNode;
begin
  ATreeView.Items.Clear;
  workDS:= TGeneralController.Instance.GetNewADODataSet(false);
  workDS.CommandText:= 'Select IDMethodWork, NameWork From MethodWork Where IDMethodWorkParent is NULL Order By NameWork';

  workDS.Open;
  while not workDS.Eof do
  begin
    wtTreeNode:= ATreeView.Items.AddChildObject(nil, workDS.FieldByName('NameWork').AsString, TWorkTreeViewWorkItem.Create(workDS.FieldByName('IDMethodWork').AsInteger, workDS.FieldByName('NameWork').AsString));
    wtTreeNode.ImageIndex:= 20;
    AddWorkTreeNode(wtTreeNode, workDS.FieldByName('IDMethodWork').AsInteger, workDS.FieldByName('NameWork').AsString, ATreeView);
    workDS.Next;
    //WinControl.Refresh;
    Application.ProcessMessages;
  end;
  workDS.Close;
  workDS.Free;
end;

function TMethodWorkController.AddWorkTreeNode(wtTreeNode: TTreeNode;
  IDWork: integer; NameWork: string; ATreeView: TTreeView): TTreeNode;
var
  workDS: TADODataSet;
  //wtTreeNode, wtTreeNode2, wtTreeNode3: TTreeNode;
begin
  //Result:= ATreeView.Items.AddChildObject(nil, NameWork, TWorkTreeViewWorkItem.Create(IDWork, NameWork));
  //Result.ImageIndex:= 20;
  workDS:= TGeneralController.Instance.GetNewADODataSet(false);
  //workDS2:= TGeneralController.Instance.GetNewADODataSet(false);
  //workDS3:= TGeneralController.Instance.GetNewADODataSet(false);
  workDS.CommandText:= 'SELECT IDMethodWork, NameWork, BitEdition From MethodWork ' +
    'WHERE IDMethodWorkParent = ' +IntToStr(IDWork)+ ' Order By NameWork';

  workDS.Open;
  while not workDS.Eof do
  begin
    Result:= ATreeView.Items.AddChildObject(wtTreeNode, workDS.FieldByName('NameWork').AsString, TWorkTreeViewWorkItem.Create(workDS.FieldByName('IDMethodWork').AsInteger, workDS.FieldByName('NameWork').AsString));
    if workDS.FieldByName('BitEdition').Value = NULL then
      begin
        Result.ImageIndex:= 2;
        AddWorkTreeNode(Result, workDS.FieldByName('IDMethodWork').AsInteger, workDS.FieldByName('NameWork').AsString, ATreeView);
      end
    else if workDS.FieldByName('BitEdition').AsBoolean then
            Result.ImageIndex:= 16
         else Result.ImageIndex:= 1;



    {workDS2.CommandText:= 'SELECT IDMethodWork, NameWork, BitEdition From MethodWork ' +
      'WHERE IDMethodWorkParent = ' +IntToStr(workDS.FieldByName('IDMethodWork').AsInteger)+ ' Order By NameWork';
    workDS2.Open;
    while not workDS2.Eof do
      begin
        wtTreeNode2:= ATreeView.Items.AddChildObject(wtTreeNode, workDS2.FieldByName('NameWork').AsString, TWorkTreeViewWorkItem.Create(workDS2.FieldByName('IDMethodWork').AsInteger, workDS2.FieldByName('NameWork').AsString));
        if workDS2.FieldByName('BitEdition').Value = NULL then
           wtTreeNode2.ImageIndex:= 2
        else if workDS2.FieldByName('BitEdition').AsBoolean then
                wtTreeNode2.ImageIndex:= 16
             else wtTreeNode2.ImageIndex:= 1;
        workDS3.CommandText:= 'SELECT IDMethodWork, NameWork, BitEdition From MethodWork ' +
          'WHERE IDMethodWorkParent = ' +IntToStr(workDS2.FieldByName('IDMethodWork').AsInteger)+ ' Order By NameWork';
        workDS3.Open;
        while not workDS3.Eof do
          begin
            wtTreeNode3:= ATreeView.Items.AddChildObject(wtTreeNode2, workDS3.FieldByName('NameWork').AsString, TWorkTreeViewWorkItem.Create(workDS3.FieldByName('IDMethodWork').AsInteger, workDS3.FieldByName('NameWork').AsString));
            if workDS3.FieldByName('BitEdition').Value = NULL then
               wtTreeNode3.ImageIndex:= 2
            else if workDS3.FieldByName('BitEdition').AsBoolean then
                    wtTreeNode3.ImageIndex:= 16
                 else wtTreeNode3.ImageIndex:= 1;
            workDS3.Next;
          end;
        workDS2.Next;
        workDS3.Close;
      end;}
    workDS.Next;
    //workDS2.Close;
  end;

  workDS.Close;

  workDS.Free;
  //workDS2.Free;
  //workDS3.Free;
end;

function TMethodWorkController.AddNodeWorkTreeNode(WorkIK: integer;
  WorkName: string; ATreeView: TTreeView; AWorkParentNode: TTreeNode;
  CBox, CBoxEdition: boolean): TTreeNode;
begin
  {case I of
  //1: Result:= ATreeView.Items.AddChildObject(AWorkParentNode, WorkName, TWorkTreeViewWorkItem.Create(WorkIK, WorkName));
  2: begin
       Result:= ATreeView.Items.AddChildObject(AWorkParentNode, WorkName, TWorkTreeViewWork2Item.Create(WorkIK, WorkName));
       //Result.ImageIndex:= 15;
     end;
  3: begin
       Result:= ATreeView.Items.AddChildObject(AWorkParentNode, WorkName, TWorkTreeViewWork3Item.Create(WorkIK, WorkName));
       //if CBox then Result.ImageIndex:= 2
        //else if CBoxEdition then Result.ImageIndex:= 16
             //else Result.ImageIndex:= 1;
     end;
  4: begin
       Result:= ATreeView.Items.AddChildObject(AWorkParentNode, WorkName, TWorkTreeViewWork4Item.Create(WorkIK, WorkName));
       //if CBoxEdition then Result.ImageIndex:= 16
            //else Result.ImageIndex:= 1;
     end;
  end;}
  Result:= ATreeView.Items.AddChildObject(AWorkParentNode, WorkName, TWorkTreeViewWorkItem.Create(WorkIK, WorkName));
  if CBox then Result.ImageIndex:= 2
  else if CBoxEdition then Result.ImageIndex:= 16
       else Result.ImageIndex:= 1;
end;
//-------------------------------------------------------------------------------------

{ TWorkTreeViewWorkItem }

constructor TWorkTreeViewWorkItem.Create(AWorkIK: integer;
  ANameWork: string);
begin
  fWorkIK:= AWorkIK;
  fNameWork:= ANameWork;
end;

{ TPlanEntryViewRow }

constructor TPlanEntryViewRow.Create(IsPlan, IsEdition: Boolean);
begin
  inherited Create;
  FPercent := 0;
  Self.FIsPlan := IsPlan;
  Self.FIsEdition:= IsEdition;
end;

function TPlanEntryViewRow.GetFormatedRow: String;
begin
  if (IsPlan) then
  begin
    Result := PLAN_MSG;
    if (Percent > 0) and (Percent < 100) then
      Result:=Result+Format(' (%d', [Percent])+'%)';
  end
  else  Result := FACT_MSG;

end;

function TPlanEntryViewRow.GetFormatedRowEd: String;
begin
  if (IsEdition) then
    Result := EDITION_MSG
  else  Result := NOT_EDITION_MSG;
end;

procedure TPlanEntryViewRow.SetPercent(const Value: Integer);
begin
  if (Value < 0) or (Value > 100) then
    raise EApplicationException.Create('Процент выполнения должен быть между 0 и 100.');
  FPercent := Value;
end;

end.
