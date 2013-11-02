unit NagruzkaDirectory;
  {#Author villain@ist.ugtu.net}
interface

uses GeneralController, NagruzkaClasses, ComCtrls, ADODB, DB, uDM, Classes, Contnrs, StdCtrls, Forms, Controls, SysUtils,
    Windows, Messages, Variants, ExcelXP, ComObj, NagruzkaController;

type
  TNagruzkaDirectory = class(TInterfacedObject, INagruzkaDirectory)
  public
    function GetAllYears(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
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

implementation

function TNagruzkaDirectory.GetAllSemesters(SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From SemesterType', 'ik_sem_type', false, NULL);
end;

function TNagruzkaDirectory.GetAllTeachers(SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT iTab_n, (RTRIM(clastname) + ' + #39 + ' ' + #39 + ' + RTRIM(cfirstname) + ' + #39 + ' ' + #39 + ' + RTRIM(cotch) + '' (таб. № '' + Convert(nvarchar, iTab_n) + '')'') AS FIO FROM Prepods ORDER BY clastname, cfirstname, cotch', 'iTab_n', false, NULL);
end;

function TNagruzkaDirectory.GetAllYears(SourceDataSet: PDataSet; isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select *, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value From Year_uch_pl Order By year_value', 'ik_year_uch_pl', isShowFirst, defValue);
end;

function TNagruzkaDirectory.GetDepartmentName(KafIK: integer; isNeedShortName: boolean): string;
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

function TNagruzkaDirectory.GetAllDegrees(
  SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From PrepodDegree Order By cName_degree', 'ik_degree', isShowFirst, NULL);
end;

function TNagruzkaDirectory.GetAllRanks(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From PrepodRank Order By cName_rank', 'ik_rank', isShowFirst, NULL);
end;

function TNagruzkaDirectory.GetAllWorkType(
  SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From PrepodWorkType Order By cName_work_type', 'ik_work_type', isShowFirst, NULL);
end;

function TNagruzkaDirectory.GetAllFacultyes(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Fac Order By Cname_fac', 'ik_fac', isShowFirst, NULL);
end;

function TNagruzkaDirectory.GetAllDepartments(SourceDataSet: PDataSet; FacultyIK: integer;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Kafedra Where ik_fac = ' + IntToStr(FacultyIK) + ' ORDER BY Cname_kaf', 'ik_kaf', isShowFirst, NULL);
end;

{
function TNagruzkaDirectory.GetAllCampus(SourceDataSet: PDataSet;
  isShowFirst: boolean; defValue: Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Campus Order By Cname_campus', 'ik_campus', isShowFirst, defValue);
end;}

function TNagruzkaDirectory.GetDiscName(DiscIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select Cname_disc FROM discpln WHERE ik_disc = ' + IntToStr(DiscIK);
  tempDS.Open;
  Result:= tempDS.FieldByName('Cname_disc').AsString;
  tempDS.Close;
  tempDS.Free;
end;

function TNagruzkaDirectory.GetAllPlanTypes(
  SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Type_ed', 'ik_type_ed', false, NULL);
end;

function TNagruzkaDirectory.GetAllDecomposeType(SourceDataSet: PDataSet;
  isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Shema_decompose Order By cName_decompose', 'ik_decompose_type', isShowFirst, NULL);
end;

function TNagruzkaDirectory.GetAllYearsForGrup(SourceDataSet: PDataSet; defValue:Variant): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT DISTINCT nYear_post FROM Grup ORDER BY nYear_post', 'nYear_post', false, defValue);
end;

function TNagruzkaDirectory.GetAllYearsForSpec(SourceDataSet: PDataSet; FacultyIK: Variant; isShowFirst: boolean;
  defValue: Variant): Variant;
begin
  if FacultyIK <> NULL then
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select ik_year_uch_pl, year_value, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value From Year_uch_pl Where year_value >=ANY (SELECT ISNULL(YEAR(dDate_spec), year_value) FROM Spec_stud ' +
      'WHERE (ik_spec in (SELECT ik_spec FROM Relation_spec_fac WHERE ik_fac = ' + VarToStr(FacultyIK) + '))) ORDER BY year_value', 'ik_year_uch_pl', isShowFirst, defValue)
  else
    Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select ik_year_uch_pl, year_value, (Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as big_year_value From Year_uch_pl Where year_value >=ANY (SELECT ISNULL(YEAR(dDate_spec), year_value) FROM Spec_stud) ORDER BY year_value', 'ik_year_uch_pl', isShowFirst, defValue);
end;

procedure TNagruzkaDirectory.GetAvailFac(SourceDataSet: PDataSet);
begin
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'SELECT Ik_fac, Cname_fac FROM Fac WHERE Ik_fac IN (SELECT ik_fac FROM GetNagrFacPermissionsFromRelTable()) ORDER BY Cname_fac', 'ik_fac', false, NULL);
end;

function TNagruzkaDirectory.GetSemesterName(YearIK, SemIK: integer): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select Cname_sem_type, year_value FROM SemesterType CROSS JOIN Year_uch_pl WHERE (ik_year_uch_pl = ' + IntToStr(YearIK) + ') and (ik_sem_type = ' + IntToStr(SemIK) + ')';
  tempDS.Open;
  Result:= tempDS.FieldByName('Cname_sem_type').AsString + ' cеместр ' + AnsiLowerCase(tempDS.FieldByName('year_value').AsString + '-' + IntToStr(tempDS.FieldByName('year_value').AsInteger + 1) + ' учебного года');
  tempDS.Close;
  tempDS.Free;
end;

function TNagruzkaDirectory.GetFacultyName(FacIK: integer;
  isNeedShortName: boolean): string;
var
  tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= dm.DBConnect;
  tempDS.CommandText:= 'Select Cshort_name_fac, Cname_fac FROM Fac WHERE ik_fac = ' + IntToStr(FacIK);
  tempDS.Open;
  if isNeedShortName then
    Result:= tempDS.FieldByName('Cshort_name_fac').AsString
  else Result:= tempDS.FieldByName('Cname_fac').AsString;
  tempDS.Close;
  tempDS.Free;
end;

end.
