unit PreparationNagruzkaController;
   {#Author villain@ist.ugtu.net}
interface

uses GeneralController, NagruzkaClasses, ComCtrls, ADODB, DB, uDM, Classes, Contnrs, StdCtrls, Forms, Controls, SysUtils,
    Windows, Messages, Variants, ExcelXP, ComObj, NagruzkaController,Dialogs;

type
  TPreparationNagruzkaController = class(TInterfacedObject, IPreparationNagruzkaController)
  public
    function AddPotokShemaTreeNode(ShemaUnionNode: TTreeNode; ShemaIK: integer; ShemaName: string; PotokIK: integer; PotokName: string; ATreeView: TTreeView): TTreeNode;
    function AddPotokShemaUnionTreeNode(PotokNode: TTreeNode; PotokSemIK: integer; PotokName: string; ATreeView: TTreeView): TTreeNode;
    procedure AutoDistributeContingentBetweenCalcUnits(PotokIK, DecomposeTypeIK: integer; tempPSYC: TPotokShemaYearContingent);
    //procedure BuildPotokTree(KafedraIK: integer; ATreeView: TTreeView; FilterText: string);
    function CountOfSeparatedGroupsInPotok(PotokIK: integer): integer;
    function CountOfSpecialitiesInPotok(PotokIK: integer): integer;
    procedure CloseNormOfTime();
    function CheckForSpecContingentExists(PotokIK, PlanIK, CourseNumber: integer): boolean;
    function GetAllGroupsFromPotok(SourceDataSet: PDataSet; PotokIK: integer; isShowFirst: boolean): Variant;
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

    function GetPrepodWorkTypesInfo(AKafIK, ATabN: integer): TDataSet;
    procedure GetAllPrepInKaf(SourceDataSet: PDataSet; KafedraIK: integer);
    procedure GetAllWorkedPrepInKaf(SourceDataSet: PDataSet; KafedraIK, YearIK, SemTypeIK: integer);
    function GetAllPrepWorkTypes(SourceDataSet: PDataSet; TabN, KafedraIK, YearIK, SemTypeIK: integer; isShowFirst: boolean): Variant;
    function GetTeacherFIO(TeahcerIK: integer): string;
    function GetAllYearsForShemes(SourceDataSet: PDataSet; PotokIK: integer; isShowFirst: boolean): Variant;
    function GetAllYearsForDepByUchPlan(SourceDataSet: PDataSet; KafedraIK, FacultyIK: integer; defValue:Variant): Variant;

    function GetPotokName(PotokSemIK: integer): string;
    function RebuildPotokName(aPotokSpec: TSpecNodes; aFacIK: integer): string;

    function GetPlanContingent(aPotokSemIK: integer; var aDSet: TADODataSet):TPlanPotokInfos;
    function GetAutoCalcUnits(aPotokSemIK, aDecomposeType, aShemaIK: integer): TSemesterCalcUnits;
    function GetTabNFromTeacherIK(TeacherIK: integer): integer;
    function GetWorkTypeFromTeacherIK(TeacherIK: integer): integer;
    function GetKafedraIKFromTeacherIK(TeacherIK: integer): integer;
    function GetAlowedWorkTypes(SourceDataSet: PDataSet; TabN, KafedraIK: integer; SemStart: TDate; dopConditions: string; defValue: Variant): Variant;
    function SearchPrepAtAnotherKaf(ALastName, AFirstName, ACotch: string; var findTabN, findKafIK, findFacIK: integer): boolean;
    function  DeletePrepodFromKafedra(ATabN, AKafedraIK: integer): boolean;
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
    function SaveSemesterCalcUnit(Tag: integer; shemaIK, cuIK: integer; cName: string; budg,cont: integer; GroupList: TStringList):boolean;
    function SavePotok(isAddExistPotok: boolean; PotokIK: integer; PotokName: string; KafedraIK, NormOfTimeIK: integer; aPotokSpec: TSpecNodes; YIK, SIK: integer): boolean;
    function CreatePotokByGroups(KafedraIK, YearIK: integer; aPotokSpec: TSpecNodes): boolean;
    function SavePlanContingentOfSepGroups(YearIK: integer): boolean;
    function SaveTeacher(AIsAddExists: boolean; ATabN, AKafedraIK: integer; ALastName, AFirstName, AMiddleName: string; ARankID, ADegreeID: Variant): boolean;
    function LoadPotoksToSemester(KafedraIK, YeaкIK, SemIK: integer; PotokIK: TStringList): boolean;
  end;

implementation
  uses ConstantRepository;

function TPreparationNagruzkaController.DeletePrepodFromKafedra(ATabN, AKafedraIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePrepInKaf', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 4);
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, ATabN);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, AKafedraIK);
  try
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
  Result:= true;
end;

function TPreparationNagruzkaController.GetTabNFromTeacherIK(TeacherIK: integer): integer;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select itab_n FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('itab_n').AsInteger;
  tempDS.Close;
  tempDS.Free;
end;

function TPreparationNagruzkaController.GetTeacherFIO(TeahcerIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'Select DISTINCT Prepods.itab_n, (RTRIM(Prepods.clastname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cfirstname) + ' + #39 + ' ' + #39 + ' + RTRIM(dbo.Prepods.cotch) + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '', '' + cName_work_type_short + '')'') AS FIO FROM Prepods INNER JOIN Relation_kafedra_prep ON Prepods.iTab_n = Relation_kafedra_prep.iTab_n ' +
    'INNER JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type WHERE ik_id_prepod = ' + IntToStr(TeahcerIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('FIO').AsString;
  tempDS.Close;
  tempDS.Free;
end;

function TPreparationNagruzkaController.GetUchPlanOfAnyGroupOfSpec(SpecIK,
  YearIK: integer): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    //раньше учебный план грузился из групп, которые входят в соответствующую специальность
    //tempDS.CommandText:= 'SELECT ik_uch_plan FROM Grup WHERE (ik_uch_plan is not NULL) and (ik_spec_fac = ' + IntToStr(SpecIK) + ') and (nYear_post = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + '))';
    tempDS.CommandText:= 'SELECT ik_uch_plan FROM Uch_pl WHERE (ik_year_uch_pl = '+  IntToStr(YearIK) + ') and ik_spec=(select ik_spec from Relation_spec_fac where ik_spec_fac=' + IntToStr(SpecIK) + ') and ik_form_ed=(select ik_form_ed from Relation_spec_fac where ik_spec_fac='+IntToStr(SpecIK)+')';
    tempDS.Open;
    Result:= tempDS.FieldByName('ik_uch_plan').Value;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.GetUchPlanOfGroup(GroupIK: integer): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_uch_plan FROM Grup WHERE ik_grup = ' + IntToStr(GroupIK);
    tempDS.Open;
    Result:= tempDS.FieldByName('ik_uch_plan').Value;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

procedure TPreparationNagruzkaController.GetAllWorkedPrepInKaf(SourceDataSet: PDataSet;
  KafedraIK, YearIK, SemTypeIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM GetTeacherListForDepartment(1, ' + IntToStr(KafedraIK) + ', ' + IntToStr(YearIK) + ', ' + IntToStr(SemTypeIK) + ')', 'itab_n', false, NULL);
 { case SemTypeIK of
  1: TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Prepods.iTab_n, (clastname + '' '' + cfirstname + '' '' + cotch + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as largeFIO, clastname, cfirstname, cotch, ik_rank, ik_degree, ' +
    '(clastname + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''. (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO From Prepods WHERE iTab_n in (SELECT iTab_N FROM Relation_kafedra_prep Where (ik_kaf = ' + IntToStr(KafedraIK) + ') and ((release_date is NULL) or (YEAR(release_date) > ' + IntToStr(yearValue) + '))) Order By FIO', 'itab_n', false, NULL);
  2: TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Prepods.iTab_n, (clastname + '' '' + cfirstname + '' '' + cotch + '' (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as largeFIO, clastname, cfirstname, cotch, ik_rank, ik_degree, ' +
    '(clastname + '' '' + LEFT(cfirstname, 1) + ''. '' + LEFT(cotch, 1) + ''. (таб. № '' + Convert(nvarchar, Prepods.iTab_n) + '')'') as FIO From Prepods WHERE iTab_n in (SELECT iTab_N FROM Relation_kafedra_prep Where (ik_kaf = ' + IntToStr(KafedraIK) + ') and ((release_date is NULL) or (release_date < CONVERT(datetime, ''09.01.' + IntToStr(yearValue+1) + ''')))) Order By FIO', 'itab_n', false, NULL);
  end;}
end;

function TPreparationNagruzkaController.SaveTeacher(AIsAddExists: boolean; ATabN, AKafedraIK: integer; ALastName, AFirstName, AMiddleName: string; ARankID, ADegreeID: Variant): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePrepInKaf', false);
  if AIsAddExists then
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3)
  else
  begin
    if ATabN >= 0 then
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2)
    else tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1);
  end;
  tempStoredProc.Parameters.CreateParameter('@iTab_n', ftInteger, pdInput, 0, ATabN);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, AKafedraIK);
  tempStoredProc.Parameters.CreateParameter('@clastname', ftString, pdInput, 30, ALastName);
  tempStoredProc.Parameters.CreateParameter('@cfirstname', ftString, pdInput, 30, AFirstName);
  tempStoredProc.Parameters.CreateParameter('@cotch', ftString, pdInput, 30, AMiddleName);
  tempStoredProc.Parameters.CreateParameter('@ik_rank', ftInteger, pdInput, 0, ARankID);
  tempStoredProc.Parameters.CreateParameter('@ik_degree', ftInteger, pdInput, 0, ADegreeID);
  try
    tempStoredProc.Open;
    ATabN:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
  finally
    if tempStoredProc.Active then tempStoredProc.Close;    
    tempStoredProc.Free;
  end;
  dm.adsTeachersWorkTypes.First;
  while not dm.adsTeachersWorkTypes.Eof do
  begin
    if (dm.adsTeachersWorkTypes.FieldByName('iTab_n').Value = NULL) and (dm.adsTeachersWorkTypes.FieldByName('ik_kaf').Value = NULL) then
    begin
      dm.adsTeachersWorkTypes.Edit;
      dm.adsTeachersWorkTypes.FieldByName('iTab_n').AsInteger:= ATabN;
      dm.adsTeachersWorkTypes.FieldByName('ik_kaf').AsInteger:= AKafedraIK;
      dm.adsTeachersWorkTypes.Post;
    end;
    dm.adsTeachersWorkTypes.Next;
  end;
  try
    dm.adsTeachersWorkTypes.UpdateBatch;
  except
    on E: EOleException do
      if E.ErrorCode = ADO_ERROR_TWO then
        Result:= true
      else raise;
  end;
  Result:= true;
end;

function TPreparationNagruzkaController.SearchPrepAtAnotherKaf(ALastName, AFirstName,
  ACotch: string; var findTabN, findKafIK, findFacIK: integer): boolean;
var
  tempDS: TADODataSet;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT itab_n FROM Prepods WHERE (clastname = ''' + ALastName + ''') and (cfirstname = ''' + AFirstName + ''') and (cotch = ''' + ACotch + ''') and (itab_n in (SELECT itab_n FROM Relation_kafedra_prep))';
    tempDS.Open;
    if tempDS.RecordCount > 0 then
    begin
      findTabN:= tempDS.FieldByName('itab_n').AsInteger;
      tempDS.Close;
      tempDS.CommandText:= 'SELECT rkp.itab_n, rkp.ik_kaf, ik_fac FROM Relation_kafedra_prep rkp INNER JOIN Kafedra ON rkp.ik_kaf = Kafedra.ik_kaf WHERE rkp.itab_n = ' + IntToStr(findTabN);
      tempDS.Open;
      findKafIK:= tempDS.FieldByName('ik_kaf').AsInteger;
      findFacIK:= tempDS.FieldByName('ik_fac').AsInteger;
      Result:= true;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.GetPotokName(PotokSemIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select ps.Cname_potok FROM Potok,Potok_semestr ps WHERE Potok.ik_potok = ps.id_potok and ik_potok_semestr = ' + IntToStr(PotokSemIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('Cname_potok').AsString;
  tempDS.Close;
  tempDS.Free;
end;

function TPreparationNagruzkaController.GetWorkTypeFromTeacherIK(
  TeacherIK: integer): integer;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select ik_work_type FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('ik_work_type').AsInteger;
  tempDS.Close;
  tempDS.Free;
end;

procedure TPreparationNagruzkaController.GetAllPrepInKaf(SourceDataSet: PDataSet;
  KafedraIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM GetTeacherListForDepartment(0, ' + IntToStr(KafedraIK) + ', 0, 0)', 'itab_n', false, NULL);
end;

function TPreparationNagruzkaController.GetAllPrepWorkTypes(SourceDataSet: PDataSet; TabN,
  KafedraIK, YearIK, SemTypeIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * FROM GetTeacherWorkTypeList(1, ' + IntToStr(KafedraIK) + ', ' + IntToStr(TabN) + ', ' + IntToStr(YearIK) + ', ' + IntToStr(SemTypeIK) + ')', 'ik_id_prepod', isShowFirst, NULL);
//  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select ik_id_prepod, rkp.ik_work_type, cName_work_type, rkp.ik_defence_fund, cName_defence_fund, (cName_work_type + LOWER(ISNULL('', '' + cName_defence_fund, ''''))) as full_work_type_name ' +
//    'From Relation_kafedra_prep rkp INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type LEFT JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund WHERE (ik_kaf = ' + IntToStr(KafedraIK) + ') and (iTab_n = ' + IntToStr(TabN) + ') Order By cName_work_type, cName_defence_fund', 'ik_id_prepod', isShowFirst, NULL);
end;

function TPreparationNagruzkaController.GetAllYearsForDepByUchPlan(
  SourceDataSet: PDataSet; KafedraIK, FacultyIK: integer; defValue:Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT nYear_post FROM Grup WHERE (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_spec_fac WHERE ik_fac = ' + IntToStr(FacultyIK) + ')) and ' +
    '(ik_uch_plan in (SELECT ik_uch_plan FROM sv_disc WHERE ik_disc_uch_plan in (SELECT ik_disc_uch_plan FROM Content_UchPl WHERE ik_kaf = ' + IntToStr(KafedraIK) + '))) ORDER BY nYear_post', 'nYear_post', false, defValue);
end;

function TPreparationNagruzkaController.GetAllYearsForShemes(SourceDataSet: PDataSet;
  PotokIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select *, (Convert(nvarchar,year_value) + ' + #39 + ' - ' + #39 + ' + Convert(nvarchar,year_value+1)) as big_year From Year_uch_pl Where ik_year_uch_pl in (Select ik_year From Plan_grup_contingent Where ik_grup in (Select ik_grup From Relation_potok_grup Where ik_potok = ' + IntToStr(PotokIK) + '))', 'ik_year_uch_pl', isShowFirst, NULL);
end;

function TPreparationNagruzkaController.GetAlowedWorkTypes(SourceDataSet: PDataSet; TabN,
  KafedraIK: integer; SemStart: TDate; dopConditions: string; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT ik_id_prepod, rkp.ik_work_type, cName_work_type, rkp.ik_defence_fund, cName_defence_fund, (cName_work_type + LOWER(ISNULL('', '' + cName_defence_fund, ''''))) as full_work_type_name FROM Relation_kafedra_prep rkp ' +
      'INNER JOIN PrepodWorkType ON rkp.ik_work_type = PrepodWorkType.ik_work_type LEFT JOIN Defence_fund ON rkp.ik_defence_fund = Defence_fund.ik_defence_fund Where (ik_kaf = ' + IntToStr(KafedraIK) + ') and (iTab_n = ' + IntToStr(TabN) + ') ' + dopConditions + ' Order By cName_work_type', 'ik_id_prepod', false, defValue);
end;

function TPreparationNagruzkaController.GetAutoCalcUnits(aPotokSemIK,
  aDecomposeType, aShemaIK: integer): TSemesterCalcUnits;
var
  tempPlanContingent: TPlanPotokInfos;
  tempDataSet: TADODataSet;
  yearIK, tBudget, tContract: integer;
  PotokName, tName, yearName: string;
  fCalcGUID, i, j, g, k, basicCount, lastCount, b, c: integer;
  budgBase, budgLast, contrBase, contrLast, calcCount: integer;
begin
  fCalcGUID := -1;
  Result := TSemesterCalcUnits.Create;
  tempDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  tempDataSet.Close;
  tempDataSet.CommandText := 'select id_year,ps.Cname_potok,year_value from dbo.Potok_semestr ps, dbo.Potok p, dbo.Year_uch_pl yup '+
                             'where ps.id_potok = p.ik_potok and yup.ik_year_uch_pl=ps.id_year and ps.ik_potok_semestr = '+
                             IntToStr(aPotokSemIK);
  tempDataSet.Open;
  yearIK := tempDataSet.FieldByName('id_year').AsInteger;
  yearName := tempDataSet.FieldByName('year_value').AsString;
  PotokName := tempDataSet.FieldByName('Cname_potok').AsString;
  tempDataSet.Close;

  //загружаем плановый контингент
  tempPlanContingent := GetPlanContingent(aPotokSemIK,tempDataSet);
  tempDataSet.Close;

  if aDecomposeType=1 then
   begin
     tBudget:=0; tContract:=0;
     for I := 0 to tempPlanContingent.Count - 1 do
     begin
       tBudget:= tBudget + tempPlanContingent.Items[i].Budget;
       tContract := tContract + tempPlanContingent.Items[i].Contract;
     end;
     Result.Add(TSemesterCalcUnit.Create(fCalcGUID,PotokName,aShemaIK,aPotokSemIK,tBudget,tContract));
     tempDataSet.CommandText := 'select * from Nagr_GetCalcUnitGroup('+IntToStr(aPotokSemIK)+','+IntToStr(fCalcGUID)+')';
     tempDataSet.Open;
     while not tempDataSet.Eof do
     begin
       Result.Items[Result.Count - 1].AddGroup(tempDataSet.FieldByName('Ik_grup').AsInteger,tempDataSet.FieldByName('Cname_grup').AsString);
       tempDataSet.Next;
     end;
   end
   else
      for I := 0 to tempPlanContingent.Count - 1 do
      with tempPlanContingent.Items[i] do
      begin
        //сколько расч. единиц будет для текущ. спец-ти
        if aDecomposeType=2 then calcCount := Groups;
        if aDecomposeType=3 then calcCount := SupGroups;
        //сколько бюджетников в расч. единице
        budgBase := Round(Budget/calcCount);
        budgLast := Budget - budgBase*(calcCount - 1);
        //сколько контрактников в расч. единице
        contrBase := Round(Contract/calcCount);
        contrLast := Contract - contrBase*(calcCount - 1);

        basicCount:= Round(SupGroups/Groups);     //сколько подгрупп будет в группе
        lastCount:= SupGroups - basicCount*(Groups - 1);   //сколько подгрупп будет в последней группе

        tempDataSet.Close;

        if not ISGroup then
          tempDataSet.CommandText := 'select Ik_grup,Cname_grup,DateCreate,DateExit from dbo.Grup g where g.nYear_post = '+IntToStr(YearEnter)+
        'and g.ik_spec_fac = ' +IntToStr(SpecFac)+ ' and (select count(Ik_studGrup) from dbo.StudGrup sg,dbo.Prikaz p '+
        'where ((sg.Ik_prikazOtch = p.Ik_prikaz and year(p.Dd_prikaz) > '+yearName+')or(sg.Ik_prikazOtch is null)) and sg.Ik_grup = g.Ik_grup)>0 '+
        'order by Cname_grup'

        else
          tempDataSet.CommandText := 'select Ik_grup,Cname_grup,DateCreate,DateExit from dbo.Grup where ik_grup = ' + IntToStr(SpecFac);

      {  'select Ik_grup,Cname_grup from dbo.Grup g where g.nYear_post = '
        + IntToStr(YearEnter) + ' and g.ik_spec_fac = ' + IntToStr(SpecFac) + ' order by Cname_grup';}
        tempDataSet.Open;

        for j:= 1 to Groups do
         begin
           if aDecomposeType=3 then
             if (j = Groups) then k:= lastCount else k:= basicCount
               else k:=1;
           for g := 1 to k do
           begin
             if g*j<calcCount then begin
                                b:= budgBase;
                                c:= contrBase
                              end
                              else begin
                                b:= budgLast;
                                c:= contrLast;
                              end;

             if Groups > 1 then
             begin
               tName:= Name + '-' + IntToStr(j) + '-' + Copy(IntToStr(YearEnter), 3, 2);
               if k <> 1 then tName:= tName + ' - ' + IntToStr(g);
             end
             else
                begin
                  tName:= Name;
                  if not ISGroup then tName:= tName + '-' + Copy(IntToStr(YearEnter), 3, 2);
                  if k <> 1 then tName:= tName + ' - ' + IntToStr(g);
                end;
             Result.Add(TSemesterCalcUnit.Create(fCalcGUID,tName,aShemaIK,aPotokSemIK,b,c));
             dec(fCalcGUID);
             //добавляем в расчетную единицу группы
             if not tempDataSet.Eof then
               Result.Items[Result.Count - 1].AddGroup(tempDataSet.FieldByName('Ik_grup').AsInteger,tempDataSet.FieldByName('Cname_grup').AsString);
           end;
           tempDataSet.Next; //переходим на следующую группу
         end;
      end;
   tempPlanContingent.Clear;
   tempPlanContingent.Free;
   tempDataSet.Close;
   tempDataSet.Free;
end;

function TPreparationNagruzkaController.GetPrepodWorkTypesInfo(AKafIK,
  ATabN: integer): TDataSet;
begin
  if dm.adsTeachersWorkTypes.Active then dm.adsTeachersWorkTypes.Close;
  dm.adsTeachersWorkTypes.CommandText:= 'SELECT * FROM Relation_kafedra_prep WHERE (iTab_n = ' + IntToStr(ATabN) + ') and (ik_kaf = ' + IntToStr(AKafIK) + ')';
  dm.adsTeachersWorkTypes.Open;
  Result:= dm.adsTeachersWorkTypes;
end;

function TPreparationNagruzkaController.GetKafedraIKFromTeacherIK(
  TeacherIK: integer): integer;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select ik_kaf FROM Relation_kafedra_prep WHERE ik_id_prepod = ' + IntToStr(TeacherIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('ik_kaf').AsInteger;
  tempDS.Close;
  tempDS.Free;
end;

procedure TPreparationNagruzkaController.DeleteNormOfTime(NormOfTimeIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateNormOfTime', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
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

procedure TPreparationNagruzkaController.DeletePotok(PotokIK, KafIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePotok', false);
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
  tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafIK);
    try
      tempStoredProc.ExecProc;
      tempStoredProc.Free;
    except
      tempStoredProc.Free;
      raise;
    end;
end;

function TPreparationNagruzkaController.AddPotokShemaUnionTreeNode(PotokNode: TTreeNode;
  PotokSemIK: integer; PotokName: string; ATreeView: TTreeView): TTreeNode;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokSemIK) + ' ORDER BY Name_shema';
  tempDS.Open;
  Result:= ATreeView.Items.AddChildObject(PotokNode, 'Схемы деления потока', TPotokTreeViewPotokItem.Create(ptvitPotokShemeUnion, PotokSemIK, PotokName));
  Result.ImageIndex:= 3;
  while not tempDS.Eof do
  begin
    AddPotokShemaTreeNode(Result, tempDS.FieldByName('ik_shema').AsInteger, tempDS.FieldByName('Name_shema').AsString, PotokSemIK, PotokName, ATreeView);
    tempDS.Next;
  end;
  Result.Expand(false);
  tempDS.Close;
  tempDS.Free;
end;

procedure TPreparationNagruzkaController.AutoDistributeContingentBetweenCalcUnits(
  PotokIK, DecomposeTypeIK: integer; tempPSYC: TPotokShemaYearContingent);
var
  tempDS: TADODataSet;
  i, curGroup, curSubgroup: integer;
  basicSubgroup, lastSubgroup: integer;                   // массив содержит кон-т для бюджета и контракта
  basicGC, lastGC, basicGBSC, basicGLSC, lastGBSC, lastGLSC: array[1..2] of integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    // распределим контингент специальностей
    tempDS.CommandText:= 'SELECT rsp.ik_spec_fac, group_count, subgroup_count, budget_count, contract_count FROM Relation_potok_spec rsp INNER JOIN Potok ON rsp.ik_potok = Potok.ik_potok ' +
              'INNER JOIN Year_uch_pl py ON Potok.ik_year_enter = py.ik_year_uch_pl INNER JOIN Plan_contingent ON rsp.ik_spec_fac = Plan_contingent.ik_spec_fac ' +
              'INNER JOIN Year_uch_pl cy ON Plan_contingent.ik_year = cy.ik_year_uch_pl ' +
              'WHERE (course_number = (cy.year_value - py.year_value + 1)) and (cy.ik_year_uch_pl = ' + IntToStr(tempPSYC.YearIK) + ') and (Potok.ik_potok = ' + IntToStr(PotokIK) + ')';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      basicSubgroup:= Round(tempDS.FieldByName('subgroup_count').AsInteger/tempDS.FieldByName('group_count').AsInteger);
      lastSubgroup:= tempDS.FieldByName('subgroup_count').AsInteger - basicSubgroup*(tempDS.FieldByName('group_count').AsInteger - 1);
      basicGC[1]:= Round(tempDS.FieldByName('budget_count').AsInteger/tempDS.FieldByName('group_count').AsInteger);
      lastGC[1]:= tempDS.FieldByName('budget_count').AsInteger - basicGC[1]*(tempDS.FieldByName('group_count').AsInteger - 1);
      basicGC[2]:= Round(tempDS.FieldByName('contract_count').AsInteger/tempDS.FieldByName('group_count').AsInteger);
      lastGC[2]:= tempDS.FieldByName('contract_count').AsInteger - basicGC[2]*(tempDS.FieldByName('group_count').AsInteger - 1);
      case DecomposeTypeIK of
      2:
        begin
          curGroup:= 1;
          for i := 0 to tempPSYC.CalcUnitCount - 1 do
          begin
            if (tempPSYC.CalcUnitContingent[i].SpecIK = tempDS.FieldByName('ik_spec_fac').AsInteger) then
            begin
              if curGroup = tempDS.FieldByName('group_count').AsInteger then
                tempPSYC.CalcUnitContingent[i].StudentBudget:= lastGC[1]
              else tempPSYC.CalcUnitContingent[i].StudentBudget:= basicGC[1];
              if curGroup = tempDS.FieldByName('group_count').AsInteger then
                tempPSYC.CalcUnitContingent[i].StudentContract:= lastGC[2]
              else tempPSYC.CalcUnitContingent[i].StudentContract:= basicGC[2];
              inc(curGroup);
            end;
            if curGroup > tempDS.FieldByName('group_count').AsInteger then break;
          end;
        end;
      3:
        begin
          for i:= 1 to 2 do
          begin
            basicGBSC[i]:= round(basicGC[i]/basicSubgroup);
            basicGLSC[i]:= basicGC[i] - basicGBSC[i]*(basicSubgroup - 1);
            lastGBSC[i]:= round(lastGC[i]/lastSubgroup);
            lastGLSC[i]:= lastGC[i] - lastGBSC[i]*(lastSubgroup - 1);
          end;

          curGroup:= 1;
          curSubgroup:= 1;
          for i := 0 to tempPSYC.CalcUnitCount - 1 do
          begin
            if (tempPSYC.CalcUnitContingent[i].SpecIK = tempDS.FieldByName('ik_spec_fac').AsInteger) then
            begin
              if curGroup = tempDS.FieldByName('group_count').AsInteger then
              begin
                if curSubgroup = lastSubgroup then // последняя подгруппа последней группы
                begin
                  tempPSYC.CalcUnitContingent[i].StudentBudget:= lastGLSC[1];
                  tempPSYC.CalcUnitContingent[i].StudentContract:= lastGLSC[2];
                  break;
                end
                else
                begin
                  tempPSYC.CalcUnitContingent[i].StudentBudget:= lastGBSC[1];
                  tempPSYC.CalcUnitContingent[i].StudentContract:= lastGBSC[2];
                  inc(curSubgroup);
                end;
              end
              else
              begin
                if curSubgroup = basicSubgroup then
                begin
                  tempPSYC.CalcUnitContingent[i].StudentBudget:= basicGLSC[1];
                  tempPSYC.CalcUnitContingent[i].StudentContract:= basicGLSC[2];
                  curSubgroup:= 1;
                  inc(curGroup);
                end
                else
                begin
                  tempPSYC.CalcUnitContingent[i].StudentBudget:= basicGBSC[1];
                  tempPSYC.CalcUnitContingent[i].StudentContract:= basicGBSC[2];
                  inc(curSubgroup);
                end;
              end;
            end;
          end;
        end;
      end;
      tempDS.Next;
    end;
    tempDS.Close;
    
    // распределим контингент сепаративных групп
    tempDS.CommandText:= 'SELECT ik_grup, subgroup_count, budget_count, contract_count FROM Plan_contingent_of_sep_groups WHERE (ik_year = ' + IntToStr(tempPSYC.YearIK) + ') and (ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(PotokIK) + '))';
    tempDS.Open;
    tempDS.First;
    while not tempDS.Eof do
    begin
      case DecomposeTypeIK of
      2:
          for i := 0 to tempPSYC.CalcUnitCount - 1 do
            if (tempPSYC.CalcUnitContingent[i].GrupIK = tempDS.FieldByName('ik_grup').Value) then
            begin
              tempPSYC.CalcUnitContingent[i].StudentBudget:= tempDS.FieldByName('budget_count').AsInteger;
              tempPSYC.CalcUnitContingent[i].StudentContract:= tempDS.FieldByName('contract_count').AsInteger;
              break;
            end;
      3:
        begin
          curSubgroup:= 1;
          basicGC[1]:= Round(tempDS.FieldByName('budget_count').AsInteger/tempDS.FieldByName('subgroup_count').AsInteger);
          lastGC[1]:= tempDS.FieldByName('budget_count').AsInteger - basicGC[1]*(tempDS.FieldByName('subgroup_count').AsInteger - 1);
          basicGC[2]:= Round(tempDS.FieldByName('contract_count').AsInteger/tempDS.FieldByName('subgroup_count').AsInteger);
          lastGC[2]:= tempDS.FieldByName('contract_count').AsInteger - basicGC[2]*(tempDS.FieldByName('subgroup_count').AsInteger - 1);

          for i := 0 to tempPSYC.CalcUnitCount - 1 do
          begin
            if (tempPSYC.CalcUnitContingent[i].GrupIK = tempDS.FieldByName('ik_grup').Value) then
            begin
              if (curSubgroup = tempDS.FieldByName('subgroup_count').AsInteger) then
              begin
                tempPSYC.CalcUnitContingent[i].StudentBudget:= lastGC[1];
                tempPSYC.CalcUnitContingent[i].StudentContract:= lastGC[2];
              end
              else
              begin
                tempPSYC.CalcUnitContingent[i].StudentBudget:= basicGC[1];
                tempPSYC.CalcUnitContingent[i].StudentContract:= basicGC[2];
              end;
              inc(curSubgroup);
            end;
            if curSubgroup > tempDS.FieldByName('subgroup_count').AsInteger then break;
          end;
        end;
      end;
      tempDS.Next;
    end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.AddPotokShemaTreeNode(ShemaUnionNode: TTreeNode;
  ShemaIK: integer; ShemaName: string; PotokIK: integer; PotokName: string;
  ATreeView: TTreeView): TTreeNode;
var
  calcUnitDS: TADODataSet;
begin
  calcUnitDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Result:= ATreeView.Items.AddChildObject(ShemaUnionNode, ShemaName, TPotokTreeViewPotokShemeItem.Create(ptvitPotokSheme, PotokIK, ShemaIK, PotokName));
  Result.ImageIndex:= 4;
  calcUnitDS.CommandText:= 'SELECT * FROM Calc_unit_semestr WHERE ik_shema = ' + IntToStr(ShemaIK) + ' ORDER BY cName_calc_unit';
  calcUnitDS.Open;
  while not calcUnitDS.Eof do
  begin
    ATreeView.Items.AddChildObject(Result, calcUnitDS.FieldByName('cName_calc_unit').AsString, TPotokTreeViewPotokItem.Create(ptvitCalcUnit, PotokIK, PotokName)).ImageIndex:= 5;
    calcUnitDS.Next;
  end;
  calcUnitDS.Close;
  calcUnitDS.Free;
end;

function TPreparationNagruzkaController.CheckForSpecContingentExists(PotokIK,
  PlanIK, CourseNumber: integer): boolean;
var
  tempDS:TADODataSet;
  specCount: integer;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT count(ik_spec_fac) as spec_count FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK);
    tempDS.Open;
    specCount:= tempDS.FieldByName('spec_count').AsInteger;
    tempDS.Close;
    tempDS.CommandText:= 'SELECT count(ik_spec_fac) as spec_count FROM Plan_contingent WHERE (ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK) +
      ')) and (ik_year = (SELECT ik_year FROM Plan_nagr WHERE ik_plan_nagr = ' + IntToStr(PlanIK) + ')) and (course_number = ' + IntToStr(CourseNumber) + ')';
    tempDS.Open;
    Result:= specCount = tempDS.FieldByName('spec_count').AsInteger;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.GetAllShemasOfPotok(SourceDataSet: PDataSet;
  PotokIK: integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * FROM Potok_shema WHERE ik_potok = ' + IntToStr(PotokIK) + ' Order By cName_shema', 'ik_shema', true, false);
end;

function TPreparationNagruzkaController.GetAllUchPlanForAddPotok(SourceDataSet: PDataSet;
  FacultyIK: Variant; YearIK: integer; isShowFirst: boolean;
  defValue: Variant): Variant;
begin
  if FacultyIK = NULL then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Uch_pl.ik_uch_plan, (RTRIM(Cshort_spec) + '' ('' + RTRIM(IsNull(cName_spclz_short,''-'')) + ''), '' + RTRIM(Cname_form_ed) + '', '' + Convert(nvarchar, year_value)) as full_name ' +
      'FROM Uch_pl left JOIN spclz ON Uch_pl.ik_spclz = spclz.iK_spclz INNER JOIN Form_ed ON Uch_pl.ik_form_ed = Form_ed.Ik_form_ed INNER JOIN Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl ' +
      'INNER JOIN  Spec_stud ON Uch_pl.ik_spec = Spec_stud.ik_Spec Where year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ') ' +
      'and year_value > (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' +IntToStr(YearIK)+ ')- (select COUNT(n_sem) from dbo.sem_uch_pl where ik_uch_plan = Uch_pl.ik_uch_plan)/2 ' +        //фильтр, который убирает старые планы
      'ORDER BY Cshort_spec, cName_spclz_short, year_value, Form_ed.ik_form_ed', 'ik_uch_plan', isShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Uch_pl.ik_uch_plan, (RTRIM(Cshort_spec) + '' ('' + RTRIM(IsNull(cName_spclz_short,''-'')) + ''), '' + RTRIM(Cname_form_ed) + '', '' + Convert(nvarchar, year_value)) as full_name ' +
      'FROM Uch_pl left JOIN spclz ON Uch_pl.ik_spclz = spclz.iK_spclz INNER JOIN Form_ed ON Uch_pl.ik_form_ed = Form_ed.Ik_form_ed INNER JOIN Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl ' +
      'INNER JOIN  Spec_stud ON Uch_pl.ik_spec = Spec_stud.ik_Spec Where (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (Uch_pl.ik_spec in (SELECT ik_spec FROM Relation_spec_fac WHERE ik_fac = ' + IntToStr(FacultyIK) +
      ')) and year_value > (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' +IntToStr(YearIK)+ ')- (select COUNT(n_sem) from dbo.sem_uch_pl where ik_uch_plan = Uch_pl.ik_uch_plan)/2 ' +        //фильтр, который убирает старые планы
      'ORDER BY Cshort_spec, cName_spclz_short, year_value, Form_ed.ik_form_ed', 'ik_uch_plan', isShowFirst, defValue);
end;

function TPreparationNagruzkaController.GetAllUchPlanForPotok(SourceDataSet: PDataSet;
  PotokIK: integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Uch_pl.ik_uch_plan, (RTRIM(Cshort_spec) + '' ('' + RTRIM(IsNull(cName_spclz_short,''-'')) + ''), '' + RTRIM(Cname_form_ed) + '', '' + Convert(nvarchar, year_value)) as full_name ' +
      'FROM Uch_pl left JOIN spclz ON Uch_pl.ik_spclz = spclz.iK_spclz INNER JOIN Form_ed ON Uch_pl.ik_form_ed = Form_ed.Ik_form_ed INNER JOIN Year_uch_pl ON Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl ' +
      'INNER JOIN  Spec_stud ON Uch_pl.ik_spec = Spec_stud.ik_Spec WHERE (((Spec_stud.ik_spec in (SELECT ik_spec FROM Relation_spec_fac WHERE ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK) +
      '))) and (Form_ed.ik_form_ed = (SELECT Ik_form_ed FROM Uch_pl WHERE ik_uch_plan = (SELECT ik_uch_plan FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK) + ')))) or (Uch_pl.ik_uch_plan in (SELECT ik_uch_plan FROM Grup WHERE ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(PotokIK) +
      ')))) and (Year_uch_pl.year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK) + '))) ORDER BY Cshort_spec, cName_spclz_short, Cname_form_ed, year_value', 'ik_uch_plan', false, GetDefaultUchPlanForPotok(PotokIK));
end;

function TPreparationNagruzkaController.GetDefaultUchPlanForPotok(PotokIK: integer): Variant;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDS.CommandText:= 'SELECT ik_uch_plan FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK);
    tempDS.Open;
    Result:= tempDS.FieldByName('ik_uch_plan').AsInteger;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.SaveContentNormOfTime(NormIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
try
  if not dm.adsNormOfTime.Active then raise Exception.Create('Таблица, содержащая нормы времени для дисцилин, в данный момент не находится в состоянии редактирования!');
  if not dm.adsNormOfTimeForPractice.Active then raise Exception.Create('Таблица, содержащая нормы времени для практик и выпускных работ, в данный момент не находится в состоянии редактирования!');
  dm.adsNormOfTime.DisableControls;
  dm.adsNormOfTime.First;
  while (not dm.adsNormOfTime.Eof) do
  begin
    if (dm.adsNormOfTime.FieldByName('name_vid_zanyat').Value = NULL) or (dm.adsNormOfTime.FieldByName('name_vid_nagruzki').Value = NULL) then
    begin
      dm.adsNormOfTime.EnableControls;
      Application.MessageBox('Необходимо указать вид занятий и вид нагрузки для каждой записи норм времени, используемых для дисциплин!', 'Сохранение норм времени', MB_ICONWARNING);
      exit;
    end;
    if (dm.adsNormOfTime.FieldByName('cname_decompose_type').Value = NULL) then
    begin
      dm.adsNormOfTime.EnableControls;
      Application.MessageBox('Необходимо указать схему деления потока (используемую по умолчанию) для каждой записи!', 'Сохранение норм времени', MB_ICONWARNING);
      exit;
    end;
    dm.adsNormOfTime.Edit;
    dm.adsNormOfTime.FieldByName('ik_norm_of_time').Value:= NormIK;
    if (dm.adsNormOfTime.FieldByName('f_norm_per_student').Value = NULL) then
      dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat:= 0;
    if (dm.adsNormOfTime.FieldByName('f_norm_per_ed').Value = NULL) then
      dm.adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat:= 0;
    if (dm.adsNormOfTime.FieldByName('min_requed_student').Value = NULL) then
      dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger:= 0;
    if (dm.adsNormOfTime.FieldByName('min_requed_student').AsInteger = 0) then
    begin
      dm.adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat:= 0;
      dm.adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat:= 0;
    end;
    if (dm.adsNormOfTime.FieldByName('max_norm_per_student').Value = NULL) then
      dm.adsNormOfTime.FieldByName('max_norm_per_student').AsFloat:= dm.adsNormOfTime.FieldByName('f_norm_per_student').AsFloat;
    dm.adsNormOfTime.Post;
    dm.adsNormOfTime.Next;
  end;
  dm.adsNormOfTime.EnableControls;
  
  dm.adsNormOfTimeForPractice.DisableControls;
  dm.adsNormOfTimeForPractice.First;
  while (not dm.adsNormOfTimeForPractice.Eof) do
  begin
    if (dm.adsNormOfTimeForPractice.FieldByName('name_disc').Value = NULL) or (dm.adsNormOfTimeForPractice.FieldByName('name_vid_nagruzki').Value = NULL)
      or (dm.adsNormOfTimeForPractice.FieldByName('name_practice_norm_type').Value = NULL) then
    begin
      dm.adsNormOfTimeForPractice.EnableControls;
      Application.MessageBox('Необходимо указать название практики, вид нагрузки и тип расчета для каждой записи норм времени, используемых для практик и выпускных работ!', 'Сохранение норм времени', MB_ICONWARNING);
      exit;
    end;
    if (dm.adsNormOfTimeForPractice.FieldByName('cname_decompose_type').Value = NULL) then
    begin
      dm.adsNormOfTimeForPractice.EnableControls;
      Application.MessageBox('Необходимо указать схему деления потока (используемую по умолчанию) для каждой записи!', 'Сохранение норм времени', MB_ICONWARNING);
      exit;
    end;
    dm.adsNormOfTimeForPractice.Edit;
    dm.adsNormOfTimeForPractice.FieldByName('ik_norm_of_time').Value:= NormIK;
    if (dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').Value = NULL) then
      dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat:= 0;
    if (dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').Value = NULL) then
      dm.adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsFloat:= 0;
    dm.adsNormOfTimeForPractice.Post;
    dm.adsNormOfTimeForPractice.Next;
  end;
  dm.adsNormOfTimeForPractice.EnableControls;

  dm.DBConnect.BeginTrans;
  try
    dm.adsNormOfTime.UpdateBatch();
    dm.adsNormOfTimeForPractice.UpdateBatch();
    dm.DBConnect.CommitTrans;
  except
    dm.DBConnect.RollbackTrans;
  end;
except
  on E: EOleException do
  begin
    dm.adsNormOfTime.EnableControls;
    dm.adsNormOfTimeForPractice.EnableControls;
    if E.ErrorCode = ADO_ERROR then
    begin
      if Assigned(tempStoredProc) then tempStoredProc.Free;
      Result:= true;
    end
    else raise;
  end;
  on E: Exception do
  begin
    dm.adsNormOfTime.EnableControls;
    dm.adsNormOfTimeForPractice.EnableControls;
    if Assigned(tempStoredProc) then tempStoredProc.Free;
    raise;
  end;
end;
  Result:= true;
end;

function TPreparationNagruzkaController.LoadContentNormOfTime(NormIK: Integer; var NormForDisc, NormForPractice: PDataSet): boolean;
begin
  Result:= false;
  CloseNormOfTime;
  if dm.adsVidZanyat.Active then dm.adsVidZanyat.Close;
  if dm.adsVidNagruzki.Active then dm.adsVidNagruzki.Close;
  dm.adsVidZanyat.CommandText:= 'Select * From vid_zaniat WHERE (ik_vid_zanyat <> 32) and (bit_nagr = 1) ORDER BY cName_vid_zanyat';
  dm.adsVidNagruzki.CommandText:= 'Select * From vid_nagruzki ORDER BY cName_vid_nagruzki';
  dm.adsNormOfTime.CommandText:= 'SELECT * FROM Content_norma_of_time WHERE ik_norm_of_time = ' + IntToStr(NormIK) + ' ORDER BY ik_vid_zanyat, ik_vid_nagruzki';
  dm.adsNormOfTime.Open;
  dm.adsNormOfTimeForPractice.CommandText:= 'SELECT * FROM Content_norm_of_time_practice WHERE ik_norm_of_time = ' + IntToStr(NormIK) + ' ORDER BY ik_disc, ik_vid_nagruzki';
  dm.adsNormOfTimeForPractice.Open;
  NormForDisc^:= dm.adsNormOfTime;
  NormForPractice^:= dm.adsNormOfTimeForPractice;
  Result:= true;
end;

function TPreparationNagruzkaController.LoadPotokNodeInfo(ATreeView: TTreeView;
  PotokNode: TTreeNode): boolean;
var
  tempDS: TADODataSet;
  curUnionNode, curTempNode: TTreeNode;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  curUnionNode:= ATreeView.Items.AddChildObject(PotokNode, 'Специальности, входящие в поток', TPotokTreeViewPotokItem.Create(ptvitGroupUnion, TPotokTreeViewPotokItem(PotokNode.Data).IK, TPotokTreeViewPotokItem(PotokNode.Data).PotokName));
  curUnionNode.ImageIndex:= 3;
  tempDS.CommandText:= 'SELECT ik_spec_fac, rsf.ik_fac, (Cshort_spec + '' (факультет: '' + Cshort_name_fac + '')'') as full_name ' +
      'From Spec_stud,Relation_spec_fac rsf,Fac Where Spec_stud.ik_spec = rsf.ik_spec and rsf.ik_fac = Fac.ik_fac and ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec rps,Potok_semestr ps WHERE rps.ik_potok=ps.id_potok and ik_potok_semestr = ' + IntToStr(TPotokTreeViewPotokItem(PotokNode.Data).IK) + ') ORDER BY Cshort_spec, Cshort_name_fac';
  tempDS.Open;
  while not tempDS.Eof do
  begin
    curTempNode:= ATreeView.Items.AddChildObject(curUnionNode, tempDS.FieldByName('full_name').AsString, TPotokTreeViewPotokItem.Create(ptvitSpec, TPotokTreeViewPotokItem(PotokNode.Data).IK, TPotokTreeViewPotokItem(PotokNode.Data).PotokName));
    curTempNode.ImageIndex:= 1;
    tempDS.Next;
  end;
  curUnionNode.Expand(false);
  tempDS.Close;

  tempDS.CommandText:= 'SELECT count(ik_grup) as GroupCount FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(TPotokTreeViewPotokItem(PotokNode.Data).IK);
  tempDS.Open;
  if tempDS.FieldByName('GroupCount').AsInteger > 0 then
  begin
    tempDS.Close;
    curUnionNode:= ATreeView.Items.AddChildObject(PotokNode, 'Отдельные группы, входящие в поток', TPotokTreeViewPotokItem.Create(ptvitGroupUnion, TPotokTreeViewPotokItem(PotokNode.Data).IK, TPotokTreeViewPotokItem(PotokNode.Data).PotokName));
    curUnionNode.ImageIndex:= 3;
    tempDS.CommandText:= 'SELECT ik_grup, (cName_grup + '' (специальность/направление: '' + Cshort_spec + '')'') as full_name ' +
      'From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec Where Grup.ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(TPotokTreeViewPotokItem(PotokNode.Data).IK) + ') ORDER BY cName_grup';
    tempDS.Open;
    while not tempDS.Eof do
    begin
      curTempNode:= ATreeView.Items.AddChildObject(curUnionNode, tempDS.FieldByName('full_name').AsString, TPotokTreeViewPotokItem.Create(ptvitSpec, TPotokTreeViewPotokItem(PotokNode.Data).IK, TPotokTreeViewPotokItem(PotokNode.Data).PotokName));
      curTempNode.ImageIndex:= 1;
      tempDS.Next;
    end;
    curUnionNode.Expand(false);
  end;
  tempDS.Close;

  tempDS.Free;
  AddPotokShemaUnionTreeNode(PotokNode, TPotokTreeViewPotokItem(PotokNode.Data).IK, TPotokTreeViewPotokItem(PotokNode.Data).PotokName, ATreeView);
  TPotokTreeViewPotokItem(PotokNode.Data).IsLoad:= true;
end;

function TPreparationNagruzkaController.LoadPotoksToSemester(KafedraIK, YeaкIK,
  SemIK: integer; PotokIK: TStringList): boolean;
var tempDS,NormDS: TADODataSet;
    i,normIK: integer;
begin
  Result:= false;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  NormDS := TGeneralController.Instance.GetNewADODataSet(true);
  NormDS.CommandText := 'select * FROM Potok_semestr';
  tempDS.CommandText:= 'SELECT * FROM Potok_semestr WHERE ik_potok_semestr in (Select ps.ik_potok_semestr FROM Potok_semestr ps inner join Potok p'
                      +' on p.ik_potok=ps.id_potok inner join Relation_potok_kaf rpk on p.ik_potok = rpk.ik_potok'
                      +' where id_year = '+IntToStr(YeaкIK)+' and id_sem_type = '+IntToStr(SemIK)+' and ik_kaf='+IntToStr(KafedraIK)+')';
  tempDS.Open;
  NormDS.Open;
  TRY
        while not tempDS.Eof do
        begin
          if PotokIK.IndexOf(tempDS.FieldByName('id_potok').AsString)<0 then
            tempDS.Delete
          else
          begin
            PotokIK.Delete(PotokIK.IndexOf(tempDS.FieldByName('id_potok').AsString));
            tempDS.Next;
          end;
        end;
        for I := 0 to PotokIK.Count - 1 do
        begin
          NormDS.Filter := 'id_potok='+PotokIK[i];
          NormDS.Filtered := true;
          normIK := NormDS.FieldByName('ik_norm_of_time').AsInteger;
          tempDS.Insert;
          tempDS.FieldByName('id_potok').AsInteger:= StrToInt(PotokIK[i]);
          tempDS.FieldByName('id_sem_type').AsInteger:= SemIK;
          tempDS.FieldByName('id_year').AsInteger:= YeaкIK;
          tempDS.FieldByName('ik_norm_of_time').AsInteger:= NormIK;
          tempDS.Post;
        end;
        tempDS.UpdateBatch();
        tempDS.Close;
        Result:= true;
  EXCEPT
     raise Exception.Create('Вы пытаетесь удалить из текущего семестра поток, который уже используется в запланированной нагрузке');
  end;
  if tempDS.Active then tempDS.Close;
  tempDS.Free;
end;

function TPreparationNagruzkaController.RebuildPotokName(
  aPotokSpec: TSpecNodes; aFacIK: integer): string;
var
  i: integer;
  tempStr, tSp, tYe: string;
  spec, year: TStringList;
begin

  if ((aPotokSpec.Count = 1) and (aPotokSpec.Items[0].GroupIK<>0)) then
  begin
    Result:= aPotokSpec.Items[0].GroupName;
    exit;
  end;
  spec:= TStringList.Create;
  year:= TStringList.Create;
  tempStr:= '';
  //выбираем все уникальные специальности и года
  if aPotokSpec.Count>0 then
    for I := 0 to aPotokSpec.Count - 1 do
    begin
      tSp := aPotokSpec.Items[i].SpecShortName;
      tYe := aPotokSpec.Items[i].YearName;
      if spec.IndexOf(tSp)<0 then spec.Add(tSp);
      if year.IndexOf(tYe)<0 then year.Add(tYe);
    end;
  //добавляем в имя специальности
  for I := 0 to spec.Count - 1 do
  begin
    tempStr:= tempStr + spec[i];
    if i <> spec.Count - 1 then
        tempStr:= tempStr + ', ';
  end;
  //добавляем в имя года
  tempStr:= tempStr + ' - ';
  for I := 0 to year.Count - 1 do
  begin
    tempStr:= tempStr + Copy(year[i], 3, 2);
    if i <> year.Count - 1 then
        tempStr:= tempStr + ', ';
  end;

  if aFacIK = key_FBO then tempStr := tempStr + 'з';    //если заочники
  Result := tempStr;
  spec.Free;
  year.Free;

end;

function TPreparationNagruzkaController.SaveNormOfTime(var NormIK: integer; UsedNormIK, SpecIK: Variant;
  YearIK: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  try
    tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateNormOfTime', false);
    if NormIK < 0 then
    begin
      if UsedNormIK = -1 then
        tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
      else tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 4);
    end
    else
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
    tempStoredProc.Parameters.CreateParameter('@ik_norm_of_time', ftInteger, pdInput, 0, NormIK);
    tempStoredProc.Parameters.CreateParameter('@ik_spec', ftInteger, pdInput, 0, SpecIK);
    tempStoredProc.Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
    tempStoredProc.Parameters.CreateParameter('@used_norm_of_time', ftInteger, pdInput, 0, UsedNormIK);
    tempStoredProc.Open;
    NormIK:= tempStoredProc.FieldByName('LastValue').AsInteger;
    tempStoredProc.Close;
    Result:= true;
  finally
    if Assigned(tempStoredProc) then tempStoredProc.Free;
  end;
end;

function TPreparationNagruzkaController.GetNormsOfTime(
  SourceDataSet: PDataSet; FacultyIK: integer; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT (''Общие нормы времени'' +  '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* ' +
    'FROM Norm_of_time INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (Norm_of_time.ik_spec_fac is NULL)  and (Year_uch_pl.year_value >=2012) UNION ' +
    'Select (cShort_spec + '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time INNER JOIN Relation_spec_fac ON Norm_of_time.ik_spec_fac = Relation_spec_fac.ik_spec_fac ' +
    'INNER JOIN Spec_stud ON Relation_spec_fac.ik_spec = Spec_stud.ik_spec INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'Where (Norm_of_time.ik_spec_fac is not NULL) and (Relation_spec_fac.ik_fac = ' + IntToStr(FacultyIK) + ') '+
        //заглушка для добавления общих норм времени для ФБО
    'and (Relation_spec_fac.ik_fac <> 19) and (Norm_of_time.ik_spec_fac <> 10) and (Year_uch_pl.year_value >=2012) '+
    'UNION Select (''Общие нормы времени, ФБО, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time INNER JOIN Relation_spec_fac ON Norm_of_time.ik_spec_fac = Relation_spec_fac.ik_spec_fac ' +
    'INNER JOIN Spec_stud ON Relation_spec_fac.ik_spec = Spec_stud.ik_spec INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'Where (Norm_of_time.ik_spec_fac is not NULL) and (Relation_spec_fac.ik_fac = ' + IntToStr(FacultyIK) + ') '+
    'and (Relation_spec_fac.ik_fac <> 19) and (Norm_of_time.ik_spec_fac = 10)  and (Year_uch_pl.year_value >=2012) '+
        //заглушка для добавления общих норм времени для аспирантуры
    'UNION Select (''Общие нормы времени, Аспирантура, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time INNER JOIN Relation_spec_fac ON Norm_of_time.ik_spec_fac = Relation_spec_fac.ik_spec_fac ' +
    'INNER JOIN Spec_stud ON Relation_spec_fac.ik_spec = Spec_stud.ik_spec INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
    'Where (Relation_spec_fac.ik_fac = 19) and (Relation_spec_fac.ik_fac = ' + IntToStr(FacultyIK) + ') '
    , 'ik_norm_of_time', isShowFirst, defValue);
end;

function TPreparationNagruzkaController.GetCalcUnitContingent(SourceDataSet: PDataSet;
  ShemaIK, YearIK: integer): boolean;
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Calc_unit.cName_calc_unit, budget_count, contract_count ' +
                'From Calc_unit_contingent INNER JOIN Calc_unit ON Calc_unit_contingent.ik_calc_unit = Calc_unit.ik_calc_unit ' +
                'Where (ik_shema_of_potok = ' + IntToStr(ShemaIK) + ') and (ik_year = ' + IntToStr(YearIK) + ') Order By cName_calc_unit', 'cName_calc_unit', false, NULL);
  Result:= true;
end;



function TPreparationNagruzkaController.GetSepGroupContingentFromPotok(
  SourceDataSet: PDataSet; PotokIK, YearIK: integer;
  isShowFirst: boolean): boolean;
begin
  Result:= false;
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Grup.ik_grup, cName_grup, nYear_post as Tag, subgroup_count, budget_count, contract_count FROM Grup INNER JOIN Relation_potok_grup rpg ON Grup.ik_grup = rpg.ik_grup ' +
      'LEFT JOIN Plan_contingent_of_sep_groups pcsg ON Grup.ik_grup = pcsg.ik_grup WHERE (rpg.ik_potok = ' + IntToStr(PotokIK) + ') and (pcsg.ik_year = ' + IntToStr(YearIK) + ') ORDER BY cName_grup',  'ik_grup', isShowFirst, NULL);
  Result:= true;
end;

function TPreparationNagruzkaController.GetSpecContingentFromPotok(SourceDataSet: PDataSet;
  PotokIK, YearIK: integer; isShowFirst: boolean): boolean;
begin
  Result:= false;
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Plan_contingent.*, (Cshort_name_fac + '' - '' + Cshort_spec) as full_name, nN_prikaz as Tag FROM Plan_contingent ' +
    'INNER JOIN Relation_spec_fac rsf ON Plan_contingent.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac WHERE (ik_year = ' +
    IntToStr(YearIK) + ') and (course_number = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ') - (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' +
    IntToStr(PotokIK) + ')) + 1) and (rsf.ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK) + ')) ORDER BY Cshort_name_fac, Cshort_spec', 'ik_spec_fac', isShowFirst, NULL);
  Result:= true;
end;

function TPreparationNagruzkaController.GetAllGroupsStudyAtYear(SourceDataSet: PDataSet; YearIK: integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Grup.* From Grup INNER JOIN Relation_spec_fac ON Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac WHERE (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (ISNULL(YEAR(DateCreate), nYear_post) <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) ORDER BY cName_grup', 'ik_grup', false, NULL);
end;


function TPreparationNagruzkaController.GetAllGroupsFromPotok(SourceDataSet: PDataSet;
  PotokIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select Grup.*, rsf.ik_fac From Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE ((Grup.ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE (ik_potok = ' + IntToStr(PotokIK) + '))) or (ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(PotokIK) + '))) and (nYear_post = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK) + '))) ORDER BY cName_grup', 'ik_grup', isShowFirst, NULL);
end;

function TPreparationNagruzkaController.GetAllNormsOfTime(SourceDataSet: PDataSet;
  isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT (''Общие нормы времени'' +  '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* ' +
    'FROM Norm_of_time INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (Norm_of_time.ik_spec_fac is NULL) and (Year_uch_pl.year_value >=2012) UNION ' +
    'Select (Cshort_name_fac + '' - '' + cShort_spec + '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
    'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec ' +
    'INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (Norm_of_time.ik_spec_fac is not NULL) '+
         //заглушка для добавления общих норм времени для ФБО
    'and (rsf.ik_fac <> 19) and (Norm_of_time.ik_spec_fac <> 10) and (Year_uch_pl.year_value >=2012) UNION ' +
    'Select (''Общие нормы времени, ФБО, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
    'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac ' +
    'INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (Norm_of_time.ik_spec_fac is not NULL) ' +
    'and (rsf.ik_fac <> 19) and (Norm_of_time.ik_spec_fac = 10) and (Year_uch_pl.year_value >=2012) '+
         //заглушка для добавления общих норм времени для аспирантуры
    'UNION Select (''Общие нормы времени, Аспирантура, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
    'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac ' +
    'INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (rsf.ik_fac = 19) '
    , 'ik_norm_of_time', isShowFirst, defValue);
end;

function TPreparationNagruzkaController.GetAllNormsOfTimeForAddPotok(
  SourceDataSet: PDataSet; YearIK: integer;
  isShowFirst: boolean; defValue: Variant): Variant;
begin
  //if FacultyIK = NULL then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT (''Общие нормы времени'' + '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* ' +
      'FROM Norm_of_time INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl WHERE (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (Norm_of_time.ik_spec_fac is NULL) UNION ' +
      'Select (Cshort_name_fac + '' - '' + cShort_spec + '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
      'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'WHERE (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (Norm_of_time.ik_spec_fac is not NULL) '+
              //заглушка для добавления общих норм времени для ФБО
      'and (rsf.ik_fac <> 19) and (Norm_of_time.ik_spec_fac <> 10) UNION ' +
      'Select (''Общие нормы времени, ФБО, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
      'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'WHERE (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (Norm_of_time.ik_spec_fac is not NULL) '+
      'and (rsf.ik_fac <> 19) and (Norm_of_time.ik_spec_fac = 10) '+
              //заглушка для добавления общих норм времени для аспирантуры
      'UNION Select (''Общие нормы времени, Аспирантура, '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
      'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'WHERE (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) '+
      'and (rsf.ik_fac = 19)', 'ik_norm_of_time', isShowFirst, defValue);
  {else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select (Cshort_name_fac + '' - '' + Cshort_spec + '', '' + Convert(nvarchar, Year_uch_pl.year_value)) as cName_norm, Norm_of_time.* From Norm_of_time ' +
      'INNER JOIN Relation_spec_fac rsf ON Norm_of_time.ik_spec_fac = rsf.ik_spec_fac INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec INNER JOIN Year_uch_pl ON Norm_of_time.ik_year = Year_uch_pl.ik_year_uch_pl ' +
      'WHERE (year_value <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (rsf.ik_fac = ' + IntToStr(FacultyIK) + ') ORDER BY Cshort_name_fac, cName_spec, year_value', 'ik_norm_of_time', isShowFirst, defValue);}
end;

function TPreparationNagruzkaController.GetPotokSemShemaInfo(
  PotokSemIK: integer): boolean;
var
  tempDataSet: TADODataSet;
begin
{  Result:= false;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECT * FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(PotokSemIK);
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then
  begin
    DecomposeType:= tempDataSet.FieldByName('ik_decompose_type').AsInteger;
    ShemaName:= tempDataSet.FieldByName('Name_shema').AsString;
    Result:= true;
  end;
  tempDataSet.Close;
  tempDataSet.Free; }
end;

function TPreparationNagruzkaController.GetPotokShemaInfo(ShemaIK: integer;
  var DecomposeType: integer; var ShemaName: string): boolean;
var
  tempDataSet: TADODataSet;
begin
  Result:= false;
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDataSet.CommandText:= 'SELECT * FROM Potok_semestr_shema WHERE ik_shema = ' + IntToStr(ShemaIK);
  tempDataSet.Open;
  if tempDataSet.RecordCount > 0 then
  begin
    DecomposeType:= tempDataSet.FieldByName('ik_decompose_type').AsInteger;
    ShemaName:= tempDataSet.FieldByName('Name_shema').AsString;
    Result:= true;
  end;
  tempDataSet.Close;
  tempDataSet.Free;
end;

function TPreparationNagruzkaController.GetPotoksWithSameSpecFac(specList, groupList: TStringList;
  YearPost: integer): TList;
var
  i: integer;
  tempDS: TADODataSet;
  tempStr: string;
begin
  Result:= nil;
  if specList.Count = 0 then exit;
  Result:= TList.Create;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
  tempDS.CommandText:= 'SELECT DISTINCT * FROM Potok WHERE (ik_year_enter = ' + IntToStr(YearPost) + ')';
  if specList.Count > 0 then
  begin
    tempDS.CommandText:= tempDS.CommandText + ' and ';
    tempStr:= '';
    for i := 0 to specList.Count - 1 do
    begin
      tempDS.CommandText:= tempDS.CommandText + '(ik_potok in (SELECT ik_potok FROM Relation_potok_spec WHERE ik_spec_fac = ' + specList[i] + '))';
      tempStr:= tempStr + specList[i];
      if i <> specList.Count - 1 then
      begin
        tempDS.CommandText:= tempDS.CommandText + ' and ';
        tempStr:= tempStr + ', ';
      end;
    end;
    tempDS.CommandText:= tempDS.CommandText + ' and (ik_potok not in (SELECT ik_potok FROM Relation_potok_spec WHERE ik_spec_fac not in (' + tempStr + ')))';
  end;

  if groupList.Count > 0 then
  begin
    tempDS.CommandText:= tempDS.CommandText + ' and ';
    tempStr:= '';
    for i := 0 to groupList.Count - 1 do
    begin
      tempDS.CommandText:= tempDS.CommandText + '(ik_potok in (SELECT ik_potok FROM Relation_potok_grup WHERE ik_grup = ' + groupList[i] + '))';
      tempStr:= tempStr + groupList[i];
      if i <> groupList.Count - 1 then
      begin
        tempDS.CommandText:= tempDS.CommandText + ' and ';
        tempStr:= tempStr + ', ';
      end;
    end;
    tempDS.CommandText:= tempDS.CommandText + ' and (ik_potok not in (SELECT ik_potok FROM Relation_potok_grup WHERE ik_grup not in (' + tempStr + ')))';
  end;

  tempDS.Open;
  while not tempDS.Eof do
  begin
    Result.Add(TFoundedPotok.Create(tempDS.FieldByName('ik_potok').AsInteger, tempDS.FieldByName('ik_uch_plan').AsInteger, tempDS.FieldByName('ik_norm_of_time').AsInteger, tempDS.FieldByName('cName_potok').AsString));
    tempDS.Next;
  end;
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

function TPreparationNagruzkaController.SavePotok(isAddExistPotok: boolean; PotokIK: integer;
  PotokName: string; KafedraIK, NormOfTimeIK: integer;
  aPotokSpec: TSpecNodes; YIK, SIK: integer): boolean;        // aPotokSpec - коллекция групп, которые входят в поток
var                                                           // YIK и SIK - год и семестр планирования нагрузки
  tempSP: TADOStoredProc;
  tempDS: TADODataSet;
  i: integer;
begin
  Result:= false;
  if Length(PotokName) > 100 then
  begin
    Application.MessageBox(PChar('Максимальная длина названия потока должна составлять 100 символов. Для названия потока "' + PotokName + '" составляет ' + IntToStr(Length(PotokName)) + ' символов! Сохранение информации о потоке невозможно.'), 'Сохранение информации об учебном потоке', MB_ICONWARNING);
    exit;
  end;
 { tempSP:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePotok', false);
  tempSP.Connection.BeginTrans;}
  try
  {  tempSP.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 0);
    tempSP.Parameters.CreateParameter('@ik_potok', ftInteger, pdInput, 0, PotokIK);
    tempSP.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, KafedraIK);
    tempSP.Parameters.CreateParameter('@cName_potok', ftString, pdInput, 50, PotokName);
    tempSP.Parameters.CreateParameter('@ik_norm_of_time', ftInteger, pdInput, 0, NormOfTimeIK);
    tempSP.Parameters.CreateParameter('@ik_year_enter', ftInteger, pdInput, 0, YearEnterIK);
    tempSP.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0, UchPlanIK);

    if isAddExistPotok then
      tempSP.Parameters.ParamByName('@i_type').Value:= 4
    else
    begin
      if (PotokIK >= 0) then
        tempSP.Parameters.ParamByName('@i_type').Value:= 2
      else
        tempSP.Parameters.ParamByName('@i_type').Value:= 1;
    end;
    tempSP.Open;
    PotokIK:=  tempSP.FieldByName('ReturnValue').AsInteger;
    tempSP.Close;
                             }
    if not isAddExistPotok then
    begin
        tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
        tempDS.CommandText:= 'SELECT * FROM dbo.Potok_semestr';
        tempDS.Open;
        tempDS.Insert;
        tempDS.FieldByName('id_potok').AsInteger:= PotokIK;
        tempDS.FieldByName('id_year').AsInteger:= YIK;
        tempDS.FieldByName('id_sem_type').AsInteger := SIK;
        tempDS.FieldByName('ik_norm_of_time').AsInteger := NormOfTimeIK;
        tempDS.Post;
        tempDS.UpdateBatch();
        tempDS.Close;
    end
    else //если правим поток +для текущего семестра
    begin
        //правим нормы времени
        tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
        tempDS.CommandText:= 'SELECT * FROM dbo.Potok_semestr where id_potok = '+IntToStr(PotokIK)+
                             ' and id_year = '+IntToStr(YIK)+' and id_sem_type = '+IntToStr(SIK);
        tempDS.Open;
        tempDS.Edit;
        tempDS.FieldByName('ik_norm_of_time').AsInteger := NormOfTimeIK;
        tempDS.Post;
        tempDS.UpdateBatch();
        tempDS.Close;
     end;

     //правим состав потока
     tempDS.CommandText:= 'SELECT * FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK);
     tempDS.Open;
     while not tempDS.Eof do
       tempDS.Delete;
     tempDS.UpdateBatch();
     for I := 0 to aPotokSpec.Count - 1 do
     begin
       tempDS.Insert;
       tempDS.FieldByName('ik_potok').AsInteger:= PotokIK;
       tempDS.FieldByName('ik_spec_fac').AsString:= aPotokSpec.Items[i].SpecShortName;
       tempDS.FieldByName('ik_year_enter').AsString := IntToStr(aPotokSpec.Items[i].YearIK);
       tempDS.Post;
     end;
     tempDS.UpdateBatch();
     tempDS.Close;
   
    tempSP.Connection.CommitTrans;
    tempSP.Free;
    Result:= true;
  except
    if Assigned(tempDS) then
    begin
      if tempDS.Active then tempDS.Close;
      tempDS.Free;
    end;
    if Assigned(tempSP) then
    begin
      if tempSP.Active then tempSP.Close;
      tempSP.Connection.RollbackTrans;
      tempSP.Free;
    end;
    raise;
  end;
end;

function TPreparationNagruzkaController.SavePotokSemesterShema(potokSemIK: integer; fPotokShemas: TPotokSemesterShemas):boolean;
var
  tempStoredProc, calcStoredProc: TADOStoredProc;
  tempDataSet,calcDataSet,calcGroupDataSet: TADODataSet;
  tempShema: TPotokSemesterShema;
  tempCalc: TSemesterCalcUnit;
  tempShemaIK, tempCalcIK: integer;
  i,j,k: integer;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePotokSemesterShema',false);
  calcStoredProc := TGeneralController.Instance.GetNewADOStoredProc('UpdateSemesterCalcUnit', false);
  tempDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  calcDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  calcGroupDataSet := TGeneralController.Instance.GetNewADODataSet(true);

  tempStoredProc.Connection.BeginTrans;
  try
      //создание параметров для процедуры редактирования схем деления
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@ik_shema', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@Name_shema', ftString, pdInput, 30, '');
      tempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@ik_decompose_type', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@ReturnValue',ftInteger,pdOutput,0,0);

      //создание параметров для процедуры редактирования расчетных единиц
      calcStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 0);
      calcStoredProc.Parameters.CreateParameter('@ik_calc_unit', ftInteger, pdInput, 0, 0);
      calcStoredProc.Parameters.CreateParameter('@ik_shema', ftInteger, pdInput, 0, 0);
      calcStoredProc.Parameters.CreateParameter('@cName', ftString, pdInput, 30, '');
      calcStoredProc.Parameters.CreateParameter('@budget', ftInteger, pdInput, 0, 0);
      calcStoredProc.Parameters.CreateParameter('@contract', ftInteger, pdInput, 0, 0);



      tempDataSet.CommandText:= 'Select * from dbo.Potok_semestr_shema where ik_potok_semestr = ' + IntToStr(potokSemIK);
      tempDataSet.Open;
      tempDataSet.First;
      while not tempDataSet.Eof do
      begin
        tempShema := fPotokShemas.ItemByID(tempDataSet.FieldByName('ik_shema').AsInteger);
        if not Assigned(tempShema) then   //выполняем удаление
        begin
          tempStoredProc.Parameters.ParamByName('@i_type').Value:= 3;
          tempStoredProc.Parameters.ParamByName('@ik_shema').Value := tempDataSet.FieldByName('ik_shema').AsInteger;
          tempStoredProc.Parameters.ParamByName('@Name_shema').Value := tempDataSet.FieldByName('Name_shema').AsString;
          tempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value := tempDataSet.FieldByName('ik_potok_semestr').AsInteger;
          tempStoredProc.Parameters.ParamByName('@ik_decompose_type').Value := tempDataSet.FieldByName('ik_decompose_type').AsInteger;
          tempStoredProc.ExecProc;
          tempShemaIK := tempStoredProc.Parameters.ParamByName('@ReturnValue').Value;
          tempDataSet.Next;
        end
        else
        begin
          if fPotokShemas.ItemByID(tempDataSet.FieldByName('ik_shema').AsInteger).IsModified then
          begin   //выполняем обновление данных и расчетных единиц
            tempStoredProc.Parameters.ParamByName('@i_type').Value:= 2;
            tempStoredProc.Parameters.ParamByName('@ik_shema').Value := tempShema.IK;
            tempStoredProc.Parameters.ParamByName('@Name_shema').Value := tempShema.Name;
            tempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value := tempShema.PotokSemesterIK;
            tempStoredProc.Parameters.ParamByName('@ik_decompose_type').Value := tempShema.DecomposeTypeIK;
            tempStoredProc.ExecProc;
           // tempShemaIK := tempStoredProc.Parameters.ParamByName('@ReturnValue').Value;
            //редактируем расчетные удиницы
            calcDataSet.Close;
            calcDataSet.CommandText := 'Select * from Calc_unit_semestr where ik_shema=' + IntToStr(tempShema.IK);
            calcDataSet.Open;
            calcDataSet.First;
            while not calcDataSet.Eof do
            begin
              tempCalc := tempShema.CalcUnitList.ItemByID(calcDataSet.FieldByName('ik_calc_unit').AsInteger);
              if tempCalc=nil then
                 begin  //удаляем расчетную единицу
                    calcStoredProc.Parameters.ParamByName('@i_type').Value:= 3;
                    calcStoredProc.Parameters.ParamByName('@ik_calc_unit').Value := calcDataSet.FieldByName('ik_calc_unit').AsInteger;
                    calcStoredProc.Open;
                    tempCalcIK:= calcStoredProc.FieldByName('ReturnValue').AsInteger;
                    calcStoredProc.Close;
                 end
              else
                begin  //редактируем расчетную единицу
                  calcStoredProc.Parameters.ParamByName('@i_type').Value:= 2;
                  calcStoredProc.Parameters.ParamByName('@ik_calc_unit').Value := tempCalc.IK;
                  calcStoredProc.Parameters.ParamByName('@cName').Value := tempCalc.Name;
                  calcStoredProc.Parameters.ParamByName('@budget').Value := tempCalc.Budget;
                  calcStoredProc.Parameters.ParamByName('@contract').Value := tempCalc.Contract;
                  calcStoredProc.Open;
                  tempCalcIK:= calcStoredProc.FieldByName('ReturnValue').AsInteger;
                  calcStoredProc.Close;

                  //обновляем список групп
                  calcGroupDataSet.Close;
                  calcGroupDataSet.CommandText := 'Select * from Calc_unit_grup where ik_calc_unit='+calcDataSet.FieldByName('ik_calc_unit').AsString;
                  calcGroupDataSet.Open;
                  calcGroupDataSet.First;
                  while not calcGroupDataSet.Eof do
                  begin
                    calcGroupDataSet.Delete;
                  end;
                  for I := 0 to tempCalc.Groups.Count - 1 do
                  begin
                    calcGroupDataSet.Insert;
                    calcGroupDataSet.FieldByName('Ik_grup').AsString := IntToStr((tempCalc.Groups.Items[i] as TGroup).IK);
                    calcGroupDataSet.FieldByName('ik_calc_unit').AsString := calcDataSet.FieldByName('ik_calc_unit').AsString;
                    calcGroupDataSet.Post;
                  end;
                  calcGroupDataSet.UpdateBatch();
                  calcGroupDataSet.Close;
                end;
              calcDataSet.Next;
            end;
            for I := 0 to tempShema.CalcUnitList.Count - 1 do    //вставка новых расчетных единиц
               if tempShema.CalcUnitList.Items[i].IK<0 then
               begin
                 calcStoredProc.Parameters.ParamByName('@i_type').Value:= 1;
                 calcStoredProc.Parameters.ParamByName('@ik_calc_unit').Value := tempShema.CalcUnitList.Items[i].IK;
                 calcStoredProc.Parameters.ParamByName('@ik_shema').Value := tempShema.IK;
                 calcStoredProc.Parameters.ParamByName('@cName').Value := tempShema.CalcUnitList.Items[i].Name;
                 calcStoredProc.Parameters.ParamByName('@budget').Value := tempShema.CalcUnitList.Items[i].Budget;
                 calcStoredProc.Parameters.ParamByName('@contract').Value := tempShema.CalcUnitList.Items[i].Contract;
                 calcStoredProc.Open;
                 tempCalcIK:= calcStoredProc.FieldByName('ReturnValue').AsInteger;
                 calcStoredProc.Close;

                 calcGroupDataSet.Close;
                 calcGroupDataSet.CommandText := 'Select * from Calc_unit_grup';
                 calcGroupDataSet.Open;
                 for j := 0 to tempShema.CalcUnitList.Items[i].Groups.Count - 1 do
                  begin
                    calcGroupDataSet.Insert;
                    calcGroupDataSet.FieldByName('Ik_grup').AsString := IntToStr((tempShema.CalcUnitList.Items[i].Groups.Items[j] as TGroup).IK);
                    calcGroupDataSet.FieldByName('ik_calc_unit').AsString := IntToStr(tempCalcIK);
                    calcGroupDataSet.Post;
                  end;
                 calcGroupDataSet.UpdateBatch();
                 calcGroupDataSet.Close;
               end;
          end;
          fPotokShemas.Delete(fPotokShemas.IndexByID(tempShema.IK));    //удалить после обновления
          tempDataSet.Next;
        end;
      end;
      tempDataSet.Close;

      for I := 0 to fPotokShemas.Count - 1 do      //вставить новые схемы деления
      with fPotokShemas.Items[i] do
      begin
        tempStoredProc.Parameters.ParamByName('@i_type').Value:= 1;
        tempStoredProc.Parameters.ParamByName('@ik_shema').Value := IK;
        tempStoredProc.Parameters.ParamByName('@Name_shema').Value := Name;
        tempStoredProc.Parameters.ParamByName('@ik_potok_semestr').Value := PotokSemesterIK;
        tempStoredProc.Parameters.ParamByName('@ik_decompose_type').Value := DecomposeTypeIK;
        tempStoredProc.ExecProc;
        for j := 0 to CalcUnitList.Count - 1 do     //в том числе, с расчетными единицами
        begin
          calcStoredProc.Parameters.ParamByName('@i_type').Value:= 1;
          calcStoredProc.Parameters.ParamByName('@ik_calc_unit').Value := CalcUnitList.Items[j].IK;
          calcStoredProc.Parameters.ParamByName('@ik_shema').Value := tempStoredProc.Parameters.ParamByName('@ReturnValue').Value;
          calcStoredProc.Parameters.ParamByName('@cName').Value := CalcUnitList.Items[j].Name;
          calcStoredProc.Parameters.ParamByName('@budget').Value := CalcUnitList.Items[j].Budget;
          calcStoredProc.Parameters.ParamByName('@contract').Value := CalcUnitList.Items[j].Contract;
          calcStoredProc.Open;
          tempCalcIK:= calcStoredProc.FieldByName('ReturnValue').AsInteger;
          calcStoredProc.Close;

          //вставка групп
          calcGroupDataSet.Close;
          calcGroupDataSet.CommandText := 'Select * from Calc_unit_grup';
          calcGroupDataSet.Open;
          for k := 0 to CalcUnitList.Items[j].Groups.Count - 1 do
          begin
            calcGroupDataSet.Insert;
            calcGroupDataSet.FieldByName('Ik_grup').AsString := IntToStr((CalcUnitList.Items[j].Groups.Items[k] as TGroup).IK);
            calcGroupDataSet.FieldByName('ik_calc_unit').AsString := IntToStr(tempCalcIK);
            calcGroupDataSet.Post;
          end;
          calcGroupDataSet.UpdateBatch();
          calcGroupDataSet.Close;
        end;
      end;

    tempStoredProc.Connection.CommitTrans;
    tempDataSet.Free;
    calcDataSet.Free;
    calcGroupDataSet.Free;
    calcStoredProc.Free;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Connection.RollbackTrans;
    if tempStoredProc.Active then tempStoredProc.Close;
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
    calcDataSet.Free;
    calcGroupDataSet.Free;
    calcStoredProc.Free;
    tempStoredProc.Free;
    raise;
  end;
end;

function TPreparationNagruzkaController.SavePotokSheme(shemaIK, potokIK, decomposeTypeIK: integer;
  shemaName: string; fPotokShemaContingent: TList; dsCalcUnits: PDataSet; CheckContingent: boolean): boolean;
var
  tempStoredProc: TADOStoredProc;
  tempDataSet, secTempDataSet: TADODataSet;
  i, j, tempShemaIK: integer;
begin
  Result:= false;
  dsCalcUnits.First;
  while not dsCalcUnits.Eof do
  begin
    if dsCalcUnits.FieldByName('ik_uch_plan').Value = NULL then
    begin
      Application.MessageBox(PChar('Для расчетной единицы "' + dsCalcUnits.FieldByName('cName_calc_unit').AsString + '" не указан учебный план, по которому она обучается. ' +
        'Сохранение информации о данной расчетной единице невозможно!'), 'Для расчетной единицы не указан учебный план', MB_ICONWARNING);
      exit;
    end;
    if (CheckContingent) and (decomposeTypeIK <> 1) and (dsCalcUnits.FieldByName('ik_grup').Value = NULL) then
      case Application.MessageBox(PChar('Расчетная единица "' + dsCalcUnits.FieldByName('cName_calc_unit').AsString + '" не связана с реальной группой. Отсутсвие связи расчетной единицы с реальной группой не позволит в дальнейшем составить для нее расписание. ' +
          'Продолжить сохранение схемы деления без установки связи?'), 'Расчетная единица не связана с реальной группой', MB_YESNO) of
        mrYes:
          begin
            dsCalcUnits.Next;
            Continue;
          end;
        mrNo: exit;
      end;
    dsCalcUnits.Next;
  end;
  if Length(shemaName) > 30 then
  begin
    Application.MessageBox('Максимальная длина для названия схемы деления составляет 30 символов!', 'Сохранение схемы деления потока', MB_ICONWARNING);
    exit;
  end;
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdatePotokShema', false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  secTempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  tempStoredProc.Connection.BeginTrans;
  try
    if (shemaIK = -1) then
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 1)
    else
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 2);
    tempStoredProc.Parameters.CreateParameter('@ik_shema_of_potok', ftInteger, pdInput, 0, shemaIK);
    tempStoredProc.Parameters.CreateParameter('@Name_shema', ftString, pdInput, 30, shemaName);
    tempStoredProc.Parameters.CreateParameter('@ik_potok_semestr', ftInteger, pdInput, 0, potokIK);
    tempStoredProc.Parameters.CreateParameter('@ik_decompose_type', ftInteger, pdInput, 0, decomposeTypeIK);
    tempStoredProc.Open;
    tempShemaIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
    tempStoredProc.Close;

    tempDataSet.CommandText:= 'Select * From dbo.Calc_unit_semestr Where ik_shema = ' + IntToStr(tempShemaIK);
    if shemaIK = -1 then
    begin
      tempStoredProc.Parameters.Clear;
      tempDataSet.Open;
      tempStoredProc.ProcedureName:= 'InsertCalcUnit';
      tempStoredProc.Parameters.CreateParameter('@ik_shema', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@cName_calc_unit', ftString, pdInput, 30, '');
      tempStoredProc.Parameters.CreateParameter('@budget', ftInteger, pdInput, 0, 0);
      tempStoredProc.Parameters.CreateParameter('@contract', ftInteger, pdInput, 0, 0);
     // tempStoredProc.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput, 0, 0);

      dsCalcUnits^.First;
      while not dsCalcUnits^.Eof do
      begin
        if not tempDataSet.Locate('cName_calc_unit', dsCalcUnits^.FieldByName('cName_calc_unit').AsString, [loPartialKey]) then
        begin
          tempStoredProc.Parameters.ParamByName('@ik_shema').Value:= tempShemaIK;
          tempStoredProc.Parameters.ParamByName('@cName_calc_unit').Value:= dsCalcUnits^.FieldByName('cName_calc_unit').AsString;
          tempStoredProc.Parameters.ParamByName('@budget').Value:= dsCalcUnits^.FieldByName('budget_count').Value;
          tempStoredProc.Parameters.ParamByName('@contract').Value:= dsCalcUnits^.FieldByName('contract_count').Value;
          //tempStoredProc.Parameters.ParamByName('@ik_uch_plan').Value:= dsCalcUnits^.FieldByName('ik_uch_plan').Value;
          tempStoredProc.ExecProc;
        end;
        dsCalcUnits^.Next;
      end;
      tempDataSet.Close;
    end
    else
    begin
      if decomposeTypeIK <> 1 then  //удалить и обновить названия
      begin
        tempDataSet.Open;
        tempDataSet.First;
        while not tempDataSet.Eof do
        begin
          if not dsCalcUnits^.Locate('old_cName_calc_unit', tempDataSet.FieldByName('cName_calc_unit').AsString, [loPartialKey]) then
            tempDataSet.Delete
          else
          begin
            tempDataSet.Edit;
            tempDataSet.FieldByName('ik_uch_plan').AsInteger:= dsCalcUnits^.FieldByName('ik_uch_plan').AsInteger;
            tempDataSet.FieldByName('cName_calc_unit').AsString:= dsCalcUnits^.FieldByName('cName_calc_unit').AsString;
            tempDataSet.Post;
            tempDataSet.Next;
          end;
        end;
        dsCalcUnits^.First;
        while not dsCalcUnits^.Eof do
        begin
          if not tempDataSet.Locate('cName_calc_unit', dsCalcUnits^.FieldByName('cName_calc_unit').AsString, [loPartialKey]) then
          begin
            tempDataSet.Insert;
            tempDataSet.FieldByName('cName_calc_unit').AsString:= dsCalcUnits^.FieldByName('cName_calc_unit').AsString;
            tempDataSet.FieldByName('ik_uch_plan').AsInteger:= dsCalcUnits^.FieldByName('ik_uch_plan').AsInteger;
            tempDataSet.FieldByName('ik_shema').AsInteger:= shemaIK;
            tempDataSet.Post;
          end;
          dsCalcUnits^.Next;
        end;
        tempDataSet.UpdateBatch();
        tempDataSet.Close;
      end;
    end;

    if (decomposeTypeIK <> 1) then
    begin
      secTempDataSet.CommandText:= 'SELECT * FROM Relation_calc_unit_grup WHERE ik_calc_unit in (SELECT ik_calc_unit from Calc_unit WHERE ik_shema_of_potok = ' + IntToStr(tempShemaIK) + ')';
      secTempDataSet.Open;
      while not secTempDataSet.Eof do
        secTempDataSet.Delete;
      tempDataSet.Open;
      tempDataSet.First;
      while not tempDataSet.Eof do
      begin
        if dsCalcUnits^.Locate('cName_calc_unit', tempDataSet.FieldByName('cName_calc_unit').AsString, [loPartialKey]) then
          if dsCalcUnits^.FieldByName('ik_grup').Value <> NULL then
          begin
            secTempDataSet.Insert;
            secTempDataSet.FieldByName('ik_calc_unit').AsInteger:= tempDataSet.FieldByName('ik_calc_unit').AsInteger;
            secTempDataSet.FieldByName('ik_grup').AsInteger:= dsCalcUnits^.FieldByName('ik_grup').AsInteger;
            secTempDataSet.Post;
          end;
        tempDataSet.Next;
      end;
      tempDataSet.Close;
      secTempDataSet.UpdateBatch();
      secTempDataSet.Close;
    end;

    secTempDataSet.CommandText:= 'SELECT * FROM Calc_unit_contingent WHERE ik_calc_unit in (SELECT ik_calc_unit from Calc_unit WHERE ik_shema_of_potok = ' + IntToStr(tempShemaIK) + ')';
    secTempDataSet.Open;
    while not secTempDataSet.Eof do
      secTempDataSet.Delete;
    tempDataSet.Open;
    for j := 0 to fPotokShemaContingent.Count - 1 do
      with TPotokShemaYearContingent(fPotokShemaContingent[j]) do
      begin
        if (AllCalcUnitBudget <> 0) or (AllCalcUnitContract <> 0) then
          for I := 0 to CalcUnitCount - 1 do
            if tempDataSet.Locate('cName_calc_unit', CalcUnitContingent[i].CalcUnitName, [loPartialKey]) then
            begin
              secTempDataSet.Insert;
              secTempDataSet.FieldByName('ik_year').Value:=  YearIK;
              secTempDataSet.FieldByName('ik_calc_unit').Value:= tempDataSet.FieldByName('ik_calc_unit').AsInteger;
              secTempDataSet.FieldByName('budget_count').Value:= CalcUnitContingent[i].StudentBudget;
              secTempDataSet.FieldByName('contract_count').Value:= CalcUnitContingent[i].StudentContract;
              secTempDataSet.Post;
            end;
      end;
    secTempDataSet.UpdateBatch();
    secTempDataSet.Close;
    secTempDataSet.Free;
    tempDataSet.Close;
    tempDataSet.Free;
    tempStoredProc.Connection.CommitTrans;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Connection.RollbackTrans;
    if tempStoredProc.Active then tempStoredProc.Close;
    tempStoredProc.Free;
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
    if secTempDataSet.Active then secTempDataSet.Close;
    secTempDataSet.Free;
    raise;
  end;
end;

function TPreparationNagruzkaController.SaveSemesterCalcUnit(Tag: integer; shemaIK,
  cuIK: integer; cName: string; budg, cont: integer;
  GroupList: TStringList): boolean;
var tempStoredProc: TADOStoredProc;
    tempDataSet: TADODataSet;
    tempCalcIK, i: integer;
begin
  tempStoredProc:= TGeneralController.Instance.GetNewADOStoredProc('UpdateSemesterCalcUnit', false);
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  tempStoredProc.Connection.BeginTrans;
  try
      tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, Tag);
      tempStoredProc.Parameters.CreateParameter('@ik_calc_unit', ftInteger, pdInput, 0, cuIK);
      tempStoredProc.Parameters.CreateParameter('@ik_shema', ftInteger, pdInput, 0, shemaIK);
      tempStoredProc.Parameters.CreateParameter('@cName', ftString, pdInput, 30, cName);
      tempStoredProc.Parameters.CreateParameter('@budget', ftInteger, pdInput, 0, budg);
      tempStoredProc.Parameters.CreateParameter('@contract', ftInteger, pdInput, 0, cont);
      tempStoredProc.Open;
      tempCalcIK:= tempStoredProc.FieldByName('ReturnValue').AsInteger;
      tempStoredProc.Close;

      tempDataSet.CommandText:= 'Select * from Calc_unit_grup where ik_calc_unit='+IntToStr(cuIK);
      tempDataSet.Open;
      tempDataSet.First;
      while not tempDataSet.Eof do
      begin
        if GroupList.IndexOf(tempDataSet.FieldByName('Ik_grup').AsString)<0 then
          tempDataSet.Delete
        else
        begin
          GroupList.Delete(GroupList.IndexOf(tempDataSet.FieldByName('Ik_grup').AsString));
          tempDataSet.Next;
        end;
      end;
      for I := 0 to GroupList.Count - 1 do
      begin
        tempDataSet.Insert;
        tempDataSet.FieldByName('Ik_grup').Value := GroupList[i];
        tempDataSet.FieldByName('ik_calc_unit').Value := tempCalcIK;
        tempDataSet.Post;
      end;
      tempDataSet.Close;
      //при удачном завершении
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
      tempDataSet.Free;
      Result:= true;
  except
      tempStoredProc.Connection.RollbackTrans;
      if tempStoredProc.Active then tempStoredProc.Close;
      tempStoredProc.Free;
      tempDataSet.Free;
      raise;
  end;

end;

procedure TPreparationNagruzkaController.DeleteShemaOfPotok(ShemaIK: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'UpdatePotokShema';
  tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempStoredProc.Parameters.CreateParameter('@ik_shema_of_potok', ftInteger, pdInput, 0, ShemaIK);
  try
    tempStoredProc.ExecProc;
  except
    tempStoredProc.Free;
    raise;
  end;
  tempStoredProc.Free;
end;

function TPreparationNagruzkaController.CountOfSeparatedGroupsInPotok(
  PotokIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'Select count(ik_grup) as GroupCount FROM Relation_potok_grup Where ik_potok = ' + IntToStr(PotokIK);
    tempDataSet.Open;
    Result:= tempDataSet.FieldByName('GroupCount').AsInteger;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TPreparationNagruzkaController.CountOfSpecialitiesInPotok(
  PotokIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'Select count(ik_spec_fac) as SpecCount FROM Relation_potok_spec Where ik_potok = ' + IntToStr(PotokIK);
    tempDataSet.Open;
    Result:= tempDataSet.FieldByName('SpecCount').AsInteger;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

function TPreparationNagruzkaController.CreatePotokByGroups(
  KafedraIK, YearIK: integer; aPotokSpec: TSpecNodes): boolean;
var FacIK: integer;
    tempDS: TADODataSet;
begin

 {
  Result:= SavePotok(true, nil, dbeName.Text, IK, dbcbNorms.KeyValue, dbcbYear.KeyValue,
                     dbcbUchPlan.KeyValue, specIK,yearIK, groupIK, fCurYear, fCurSem)         }

end;

procedure TPreparationNagruzkaController.CloseNormOfTime;
begin
  if dm.adsNormOfTime.Active then dm.adsNormOfTime.Close;
  if dm.adsNormOfTimeForPractice.Active then dm.adsNormOfTimeForPractice.Close;
end;

function TPreparationNagruzkaController.GetPlanContingent(aPotokSemIK: integer; var aDSet: TADODataSet): TPlanPotokInfos;
var
  tempDataSet: TADODataSet;
begin
  Result := TPlanPotokInfos.Create;
  //загрузить плановый контингент
  tempDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  tempDataSet.Close;
  try
    tempDataSet.CommandText:= 'SELECT * from GetPlanContingentPotokSemester('+IntToStr(aPotokSemIK)+')';
    tempDataSet.Open;
    tempDataSet.First;
    while not tempDataSet.Eof do
    with tempDataSet do
    begin
      Result.Add(TPlanPotokInfo.Create(FieldByName('ik_spec_fac').AsInteger,FieldByName('Cshort_spec').AsString,
                                                      FieldByName('year_value').AsInteger));
      Result.Items[Result.Count - 1].FillPlan(FieldByName('group_count').AsInteger,FieldByName('subgroup_count').AsInteger,
                                                      FieldByName('budget_count').AsInteger,FieldByName('contract_count').AsInteger, FieldByName('is_group').AsBoolean);
      Next;
    end;
  aDSet := tempDataSet;
  finally
  //  tempDataSet.Close;
 //   tempDataSet.Free;
  end;
end;

function TPreparationNagruzkaController.GetPlanContingentOfSeparatedGroups(
  FacIK, YearIK: integer): TDataSet;
begin
  if dm.adsPlanContingentOfSepGroups.Active then dm.adsPlanContingentOfSepGroups.Close;
  if dm.adsSepGroups.Active then dm.adsSepGroups.Close;
 // dm.adsSepGroups.CommandText:= 'SELECT ik_grup, cName_grup FROM Grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac WHERE (rsf.ik_fac = ' + IntToStr(FacIK) + ') and (nYear_post <= (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) and (nYear_post + rsf.YearObuch > (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = ' + IntToStr(YearIK) + ')) ORDER BY nYear_post, cName_grup';
  dm.adsPlanContingentOfSepGroups.CommandText:= 'select * from Nagr_GetGrupContingent(' + IntToStr(YearIK) + ',' + IntToStr(FacIK) + ')';
  dm.adsPlanContingentOfSepGroups.Open;
  Result:= dm.adsPlanContingentOfSepGroups;
end;

function TPreparationNagruzkaController.GetPotokFromShema(calcUnitIK: integer): integer;
var
  tempDataSet: TADODataSet;
begin
  tempDataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    tempDataSet.CommandText:= 'Select ik_potok FROM Potok_shema Where ik_shema_of_potok = (SELECT ik_shema_of_potok FROM Calc_unit Where ik_calc_unit = ' + IntToStr(calcUnitIK) + ')';
    tempDataSet.Open;
    Result:= tempDataSet.FieldByName('ik_potok').AsInteger;
  finally
    if tempDataSet.Active then tempDataSet.Close;
    tempDataSet.Free;
  end;
end;

procedure TPreparationNagruzkaController.GetFacForDepByUchPlan(SourceDataSet: PDataSet;
  KafedraIK: integer);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Fac WHERE bit_calc_nagr = 1 ORDER BY Cname_fac', 'ik_fac', false, NULL);
  {TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT * FROM Fac WHERE ik_fac in (SELECT ik_fac FROM Relation_spec_fac WHERE ik_spec in (SELECT ik_spec FROM Uch_pl WHERE ik_uch_plan in ' +
    '(SELECT DISTINCT ik_uch_plan FROM sv_disc WHERE ik_disc_uch_plan in (SELECT ik_disc_uch_plan FROM Content_UchPl WHERE ik_kaf = ' + IntToStr(KafedraIK) + ')))) ORDER BY Cname_fac', 'ik_fac', false, NULL);}
end;

function TPreparationNagruzkaController.GetCurrentGroupContingentFromPotok(
  SourceDataSet: PDataSet; PotokIK, YearValue: integer;
  isShowFirst: boolean): boolean;
begin
  Result:= false;
  if not Assigned(SourceDataSet^) then exit;
  if SourceDataSet^.Active then SourceDataSet^.Close;
  (SourceDataSet^ as TADODataSet).CommandText:= 'SELECT DISTINCT Grup.ik_grup, Grup.cName_grup, IsNULL(budget_count, 0) as budget_count, IsNULL(contract_count, 0) as contract_count From Grup LEFT JOIN ' +
    '(SELECT ik_grup, count(ik_zach) as budget_count FROM StudGrup WHERE (ik_kat_zach in (SELECT ik_kat_zach FROM Kat_zach WHERE ik_type_kat <> 3)) and (ik_prikazOtch is NULL) GROUP BY ik_grup) bud_stud ' +
    'ON Grup.ik_grup = bud_stud.ik_grup LEFT JOIN (SELECT ik_grup, count(ik_zach) as contract_count FROM StudGrup WHERE (ik_kat_zach in (SELECT ik_kat_zach FROM Kat_zach WHERE ik_type_kat = 3)) and (ik_prikazOtch is NULL) GROUP BY ik_grup) cont_stud ' +
    'ON Grup.ik_grup = cont_stud.ik_grup INNER JOIN Relation_spec_fac rsf ON Grup.ik_spec_fac = rsf.ik_spec_fac ' +
    'WHERE (Grup.nYear_post = (SELECT year_value FROM Year_uch_pl WHERE ik_year_uch_pl = (SELECT ik_year_enter FROM Potok WHERE ik_potok = ' + IntToStr(PotokIK) + '))) and ' +
    '(ISNULL(YEAR(DateCreate), nYear_post) <= ' + IntToStr(YearValue) + ') and (ISNULL(YEAR(DateExit), nYear_post + YearObuch) > ' + IntToStr(YearValue) + ') and ' +
    '((Grup.ik_spec_fac in (SELECT ik_spec_fac FROM Relation_potok_spec WHERE ik_potok = ' + IntToStr(PotokIK) + ')) or (Grup.ik_grup in (SELECT ik_grup FROM Relation_potok_grup WHERE ik_potok = ' + IntToStr(PotokIK) + '))) ORDER BY cName_grup';
  SourceDataSet^.Open;
  Result:= true;
end;

function TPreparationNagruzkaController.SavePlanContingentOfSepGroups(YearIK: integer): boolean;
var
  bookmark: Pointer;
  ds: TADODataSet;
begin
  Result:= false;
  if (dm.adsPlanContingentOfSepGroups.State = dsInsert) or (dm.adsPlanContingentOfSepGroups.State = dsEdit) then
    dm.adsPlanContingentOfSepGroups.Post;
  bookmark:= dm.adsPlanContingentOfSepGroups.GetBookmark;
  dm.adsPlanContingentOfSepGroups.DisableControls;

  ds := TADODataSet.Create(nil);
  ds.Connection := dm.DBConnect;
  ds.CommandText := 'select * from Plan_contingent_of_sep_groups where ik_year = ' + IntToStr(YearIK);
  ds.Open;
  try
    dm.adsPlanContingentOfSepGroups.First;
    while not dm.adsPlanContingentOfSepGroups.Eof do
    begin
      {if (dm.adsPlanContingentOfSepGroups.FieldByName('ik_grup').Value = NULL) or (dm.adsPlanContingentOfSepGroups.FieldByName('subgroup_count').Value = NULL) then
      begin
        dm.adsPlanContingentOfSepGroups.EnableControls;
        dm.adsPlanContingentOfSepGroups.GotoBookmark(bookmark);
        Application.MessageBox('Поля "Группа" и "Количество подгрупп" являются обязательными для заполнения в таблице "Ожидаемый контингент отдельных групп"!', 'Ожидаемый контингент', MB_ICONWARNING);
        exit;
      end
      else
      begin
        if (dm.adsPlanContingentOfSepGroups.FieldByName('budget_count').Value = NULL) and (dm.adsPlanContingentOfSepGroups.FieldByName('contract_count').Value = NULL) then
        begin
          dm.adsPlanContingentOfSepGroups.EnableControls;
          dm.adsPlanContingentOfSepGroups.GotoBookmark(bookmark);
          Application.MessageBox(PChar('Для группы "' + dm.adsPlanContingentOfSepGroups.FieldByName('cName_grup').AsString + '" не заполнена информация о количестве студентов! Сохранение ожидаемого контингента невозможно.'), 'Ожидаемый контингент', MB_ICONWARNING);
          exit;
        end
        else
        begin    }
       if (dm.adsPlanContingentOfSepGroups.FieldByName('subgroup_count').Value <> NULL)  then
       begin
          if (dm.adsPlanContingentOfSepGroups.FieldByName('budget_count').Value <> NULL)or(dm.adsPlanContingentOfSepGroups.FieldByName('subgroup_count').Value <> NULL) then
          begin
            ds.Filter := 'ik_grup=' +  dm.adsPlanContingentOfSepGroups.FieldByName('ik_grup').AsString;
            ds.Filtered := true;
            if ds.RecordCount = 0 then
            begin
              ds.Insert;
              ds.FieldByName('ik_grup').AsInteger:= dm.adsPlanContingentOfSepGroups.FieldByName('ik_grup').Value;
            end else ds.Edit;
            ds.FieldByName('subgroup_count').Value := dm.adsPlanContingentOfSepGroups.FieldByName('subgroup_count').Value;
            ds.FieldByName('ik_year').AsInteger:= YearIK;
            if (dm.adsPlanContingentOfSepGroups.FieldByName('budget_count').Value = NULL) then
              ds.FieldByName('budget_count').AsInteger:= 0 else  ds.FieldByName('budget_count').AsInteger:= dm.adsPlanContingentOfSepGroups.FieldByName('budget_count').Value;
            if (dm.adsPlanContingentOfSepGroups.FieldByName('contract_count').Value = NULL) then
              ds.FieldByName('contract_count').AsInteger:= 0 else ds.FieldByName('contract_count').AsInteger:= dm.adsPlanContingentOfSepGroups.FieldByName('contract_count').Value;
            ds.Post;
           // dm.adsPlanContingentOfSepGroups.Next;
          {  dm.adsPlanContingentOfSepGroups.Edit;  }
            
          end
          else
          begin
            dm.adsPlanContingentOfSepGroups.EnableControls;
            dm.adsPlanContingentOfSepGroups.GotoBookmark(bookmark);
            Application.MessageBox(PChar('Для группы "' + dm.adsPlanContingentOfSepGroups.FieldByName('cName_grup').AsString + '" не заполнена информация о количестве студентов! Сохранение ожидаемого контингента невозможно.'), 'Ожидаемый контингент', MB_ICONWARNING);
            exit;
          end;
       end;
       dm.adsPlanContingentOfSepGroups.Next;
      end;
  {    end;
    end; }
  if ds.Active then
      ds.UpdateBatch();
    Result:= true;
  finally
    ds.Close;
    ds.Free;
    dm.adsPlanContingentOfSepGroups.EnableControls;
    dm.adsPlanContingentOfSepGroups.GotoBookmark(bookmark);
  end;
end;

function TPreparationNagruzkaController.SavePlanNormTime(aKafIK, aYearIK, aSemIK: integer): boolean;
var tempDS: TADODataSet;
begin
  Result:= false;
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText := 'select * from Plan_nagr where ik_kaf=' + IntToStr(aKafIK) + ' and ik_year = ' + IntToStr(aYearIK)
                        + ' and ik_sem_type='+IntToStr(aSemIK);
  tempDS.Open;
  //сохраняем нормы для планов нагрузки
  try
    if not dm.aspPlanNormTime.Active then raise Exception.Create('Таблица, содержащая нормы времени для дисцилин, в данный момент не находится в состоянии редактирования!');
    dm.aspPlanNormTime.First;
    while (not dm.aspPlanNormTime.Eof) do
    begin
      if dm.aspPlanNormTime.FieldByName('ik_norm_time').AsInteger<>0 then
      begin
        tempDS.Filter := 'ik_plan_nagr='+ dm.aspPlanNormTime.FieldByName('ik_plan_nagr').AsString;
        tempDS.Filtered := true;
        tempDS.Edit;
        tempDS.FieldByName('ik_norm_time').Value := dm.aspPlanNormTime.FieldByName('ik_norm_time').AsInteger;
        tempDS.Post;
      end;
      dm.aspPlanNormTime.Next;
    end;
    Result:= true;
  finally
    tempDS.Close;
    tempDS.Free;
  end;

end;

procedure TPreparationNagruzkaController.ExportTeacherList(KafedraIK: integer; ProgressBar: TProgressBar);
var
  Disp: IDispatch;
  IExcelApp: ExcelApplication;
  RangeE: ExcelRange;
  i, rowCount: integer;
  TeacherList, WorkTypeList: TADODataSet;
  KafedraName: string;
begin
  ProgressBar.Position:= 0;
  TeacherList:= TGeneralController.Instance.GetNewADODataSet(false);
  WorkTypeList:= TGeneralController.Instance.GetNewADODataSet(false);
  TeacherList.CommandText:= 'SELECT count(*) as PrepCount FROM Relation_kafedra_prep WHERE ik_kaf = ' + IntToStr(KafedraIK);
  TeacherList.Open;
  ProgressBar.Max:= TeacherList.FieldByName('PrepCount').AsInteger;
  TeacherList.Close;
  TeacherList.CommandText:= 'SELECT cshort_name_kaf FROM kafedra WHERE ik_kaf = ' + IntToStr(KafedraIK);
  TeacherList.Open;
  KafedraName:= TeacherList.FieldByName('cshort_name_kaf').AsString;
  TeacherList.Close;
  TeacherList.CommandText:= 'SELECT (RTRIM(Prepods.clastname) + '' '' + RTRIM(Prepods.cfirstname) + '' '' + RTRIM(Prepods.cotch)) AS FIO, Prepods.itab_n, cName_rank, cName_degree ' +
    'FROM Prepods LEFT OUTER JOIN PrepodRank ON Prepods.ik_rank = PrepodRank.ik_rank LEFT OUTER JOIN PrepodDegree ON Prepods.ik_degree = PrepodDegree.ik_degree WHERE iTab_n in (SELECT iTab_n FROM Relation_kafedra_prep WHERE ik_kaf = ' + IntToStr(KafedraIK) + ') ORDER BY FIO';

  Disp:= CreateOleObject('Excel.Application');
  Disp.QueryInterface(Excel_GUID, IExcelApp);
  IExcelApp.Workbooks.Add(null,0);
  with (IExcelApp.ActiveSheet as ExcelWorksheet).PageSetup do
  begin
    Orientation:= xlLandscape;
    CenterHorizontally:= True;
    LeftMargin:= IExcelApp.CentimetersToPoints(1, 0);
    RightMargin:= IExcelApp.CentimetersToPoints(1, 0);
    TopMargin:= IExcelApp.CentimetersToPoints(1, 0);
    BottomMargin:= IExcelApp.CentimetersToPoints(1, 0);
    PrintTitleRows:= '$2:$2';
    FitToPagesWide:= 1;
    FitToPagesTall:= False;
    Zoom:= False;
  end;
  RangeE:= IExcelApp.Range['A1', 'H1'];
  RangeE.MergeCells:= true;
  RangeE.Value2:= 'Список преподавателей кафедры ' +  KafedraName;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.Font.Size:= 14;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1.5, 0);

  RangeE:= IExcelApp.Range['A2', 'A2'];
  RangeE.Value2:= 'Табельный номер';
  RangeE:= IExcelApp.Range['B2', 'B2'];
  RangeE.Value2:= 'ФИО преподавателя';
  RangeE:= IExcelApp.Range['C2', 'C2'];
  RangeE.Value2:= 'Научное звание';
  RangeE:= IExcelApp.Range['D2', 'D2'];
  RangeE.Value2:= 'Научная степень';
  RangeE:= IExcelApp.Range['E2', 'E2'];
  RangeE.Value2:= 'Вид работы';
  RangeE:= IExcelApp.Range['F2', 'F2'];
  RangeE.Value2:= 'Должность';
  RangeE:= IExcelApp.Range['G2', 'G2'];
  RangeE.Value2:= 'Фонд оплаты';
  RangeE:= IExcelApp.Range['H2', 'H2'];
  RangeE.Value2:= 'Ставка';
  RangeE:= IExcelApp.Range['A2', 'H2'];
  RangeE.Font.Bold:= true;
  RangeE.HorizontalAlignment:= xlCenter;
  RangeE.RowHeight:= IExcelApp.CentimetersToPoints(1, 0);

  rowCount:= 3;
  TeacherList.Open;
  TeacherList.First;
  while not TeacherList.Eof do
  begin
    WorkTypeList.CommandText:= 'SELECT Relation_kafedra_prep.ik_id_prepod, cName_work_type, Cname_capacity, f_rates, cName_defence_fund FROM Relation_kafedra_prep LEFT OUTER JOIN PrepodWorkType ON Relation_kafedra_prep.ik_work_type = PrepodWorkType.ik_work_type ' +
      'LEFT OUTER JOIN PrepodCapacity ON Relation_kafedra_prep.ik_capacity = PrepodCapacity.ik_capacity LEFT OUTER JOIN Defence_fund ON Relation_kafedra_prep.ik_defence_fund = Defence_fund.ik_defence_fund WHERE (iTab_n = ' + TeacherList.FieldByName('iTab_n').AsString + ') and (ik_kaf = ' + IntToStr(KafedraIK) + ') and (release_date is NULL)';
    WorkTypeList.Open;
    if WorkTypeList.RecordCount = 0 then
    begin
      WorkTypeList.Close;
      ProgressBar.Position:= ProgressBar.Position + 1;
      TeacherList.Next;
      continue;
    end;

    RangeE:= IExcelApp.Range['A' + IntToStr(rowCount), 'A' + IntToStr(rowCount + WorkTypeList.RecordCount - 1)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= TeacherList.FieldByName('iTab_n').AsString;
    RangeE:= IExcelApp.Range['B' + IntToStr(rowCount), 'B' + IntToStr(rowCount + WorkTypeList.RecordCount - 1)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= TeacherList.FieldByName('FIO').AsString;
    RangeE:= IExcelApp.Range['C' + IntToStr(rowCount), 'C' + IntToStr(rowCount + WorkTypeList.RecordCount - 1)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= TeacherList.FieldByName('cName_rank').AsString;
    RangeE:= IExcelApp.Range['D' + IntToStr(rowCount), 'D' + IntToStr(rowCount + WorkTypeList.RecordCount - 1)];
    RangeE.MergeCells:= true;
    RangeE.Value2:= TeacherList.FieldByName('cName_degree').AsString;
    WorkTypeList.First;
    i:= 0;
    while not WorkTypeList.Eof do
    begin
      RangeE:= IExcelApp.Range['E' + IntToStr(rowCount+i), 'E' + IntToStr(rowCount + i)];
      RangeE.Value2:= WorkTypeList.FieldByName('cName_work_type').AsString;
      RangeE:= IExcelApp.Range['F' + IntToStr(rowCount+i), 'F' + IntToStr(rowCount + i)];
      RangeE.Value2:= WorkTypeList.FieldByName('Cname_capacity').AsString;
      RangeE:= IExcelApp.Range['G' + IntToStr(rowCount+i), 'G' + IntToStr(rowCount + i)];
      RangeE.Value2:= WorkTypeList.FieldByName('cName_defence_fund').AsString;
      RangeE:= IExcelApp.Range['H' + IntToStr(rowCount+i), 'H' + IntToStr(rowCount + i)];
      RangeE.Value2:= WorkTypeList.FieldByName('f_rates').AsString;
      inc(i);
      WorkTypeList.Next;
    end;
    inc(rowCount, WorkTypeList.RecordCount);
    WorkTypeList.Close;
    ProgressBar.Position:= ProgressBar.Position + 1;
    TeacherList.Next;
  end;
  TeacherList.Close;
  TeacherList.Free;
  WorkTypeList.Free;
  RangeE:= IExcelApp.Range['A2', 'H' + IntToStr(rowCount-1)];
  RangeE.Columns.AutoFit;
  RangeE.Borders.LineStyle:= 1;
  RangeE.Font.Size:= 10;
  RangeE.VerticalAlignment:= xlCenter;
  RangeE.HorizontalAlignment:= xlCenter;
  IExcelApp.Visible[0]:= true;
  IExcelApp:= nil;
  RangeE:= nil;
end;

end.
