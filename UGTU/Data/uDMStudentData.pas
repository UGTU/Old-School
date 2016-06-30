unit uDMStudentData;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmStudentData = class(TDataModule)
    adodsZaved_Stud: TADODataSet;
    dsZaved_stud: TDataSource;
    dsKatZach: TDataSource;
    adodsKatZach: TADODataSet;
    adodsEnterprise: TADODataSet;
    dsEnterprise: TDataSource;
    dsRel: TDataSource;
    adodsRelative: TADODataSet;
    adodsDocType: TADODataSet;
    adodsSempol: TADODataSet;
    adodsNat: TADODataSet;
    dsNat: TDataSource;
    dsSempol: TDataSource;
    dsDocType: TDataSource;
    adodsJob: TADODataSet;
    dsJob: TDataSource;
    adodsPrep: TADODataSet;
    dsPrep: TDataSource;
    adodsCitizen: TADODataSet;
    dsCitizen: TDataSource;
    adodsLang: TADODataSet;
    dsLang: TDataSource;
    adodsStepVlad: TADODataSet;
    dsStepVlad: TDataSource;
    adodsMedal: TADODataSet;
    dsMedal: TDataSource;
    adodsMilSt: TADODataSet;
    dsMilSt: TDataSource;
    dsCount: TDataSource;
    adodsCount: TADODataSet;
    dsPredpr: TDataSource;
    adodsEnterpriseIk_pred: TAutoIncField;
    adodsEnterpriseCname_pred: TStringField;
    adodsSmallGroup: TADODataSet;
    adodsSmallGroupNameStud: TStringField;
    adodsSmallGroupCname_kat_zach: TStringField;
    adodsSmallGroupDd_birth: TDateTimeField;
    adodsSmallGroupctelefon: TStringField;
    adodsSmallGroupNum: TIntegerField;
    adodsSmallGroupIk_zach: TIntegerField;
    adodsSmallGroupnCode: TBCDField;
    adodsSmallGroupIk_grup: TIntegerField;
    adodsSmallGroupIk_kat_zach: TIntegerField;
    dsPrikaz: TDataSource;
    adodsPrikaz: TADODataSet;
    adodsPrikazIk_prikaz: TIntegerField;
    adodsPrikazNn_prikaz: TStringField;
    adodsPrikazNamePrikaz: TStringField;
    adodsPrikazDd_prikaz: TDateTimeField;
    adodsPrikazDd_prikazVst: TDateTimeField;
    adodsPrikazik_typePrikaz: TIntegerField;
    adodsPrikazNN_Date: TStringField;
    adotblPredpr: TADODataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    aspFindAbit: TADOStoredProc;
    dsFindAbit: TDataSource;
    aspFindAbitregnomer: TIntegerField;
    aspFindAbitCshort_name_fac: TStringField;
    aspFindAbitCshort_spec: TStringField;
    aspFindAbitclastname: TStringField;
    aspFindAbitcfirstname: TStringField;
    aspFindAbitcotch: TStringField;
    aspFindAbitncode: TIntegerField;
    aspGetAbitCat0: TADOStoredProc;
    dsGetAbitCat: TDataSource;
    aspFindAbitnn_abit: TIntegerField;
    aspFindAbitidCat: TIntegerField;
    adodsAllStud: TADODataSet;
    dsAllStud: TDataSource;
    adodsAcadem: TADODataSet;
    dsAcadem: TDataSource;
    adodsAllStudNameStud: TStringField;
    adodsAllStudNn_zach: TStringField;
    adodsAllStudCname_grup: TStringField;
    adodsAllStudCshort_name_fac: TStringField;
    adodsAcademStringField: TStringField;
    adodsAcademStringField2: TStringField;
    adodsAcademStringField3: TStringField;
    adodsAcademDateTimeField: TDateTimeField;
    adodsAcademDateTimeField2: TDateTimeField;
    adodsAcademStringField4: TStringField;
    adodsAcademStringField5: TStringField;
    adodsAcademStringField6: TStringField;
    adodsAcademStringField7: TStringField;
    adodsAcademDateTimeField3: TDateTimeField;
    adodsAcademDateTimeField4: TDateTimeField;
    adodsAcademDateTimeField5: TDateTimeField;
    adodsAcademDateTimeField6: TDateTimeField;
    adodsAcademDateTimeField7: TDateTimeField;
    adodsAcademStringField8: TStringField;
    adodsAcademStringField9: TStringField;
    adodsAcademStringField10: TStringField;
    adodsAcademStringField11: TStringField;
    adodsAcademIk_pric: TIntegerField;
    adodsAcademIk_prikaz: TIntegerField;
    adodsAcademIk_grup: TIntegerField;
    adodsAcademNn_zach: TStringField;
    adodsAcademStudName: TStringField;
    adodsAcademIk_fac: TIntegerField;
    adodsAcademIk_zach: TIntegerField;
    adodsAcademIk_kat_zach: TIntegerField;
    adodsAcademik_spec: TIntegerField;
    adodsAcademik_newgrup: TIntegerField;
    adodsAcademIsFreeAttendance: TBooleanField;
    adodsAcademcObosnOtch: TStringField;
    adsIsOnVacation: TADODataSet;
    adodsAbitDisc: TADODataSet;
    dsAbitDisc: TDataSource;
    adoqTargetOrganization: TADOQuery;
    dsTargetOrganization: TDataSource;
    aspGetAbitCat: TADOStoredProc;
    aspGetAbitCatIk_kat_zach: TIntegerField;
    aspGetAbitCatCname_kat_zach: TStringField;
    aspGetAbitCatik_type_kat: TIntegerField;
    procedure adodsSmallGroupCalcFields(DataSet: TDataSet);
    procedure adodsPrikazCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStudentData: TdmStudentData;

implementation

{$R *.dfm}

procedure TdmStudentData.adodsPrikazCalcFields(DataSet: TDataSet);
begin
adodsPrikazNN_Date.Value:=adodsPrikazNn_prikaz.Value+' от '+Datetostr(adodsPrikazDd_prikaz.Value);
end;

procedure TdmStudentData.adodsSmallGroupCalcFields(DataSet: TDataSet);
begin
if (adodsSmallGroup.RecNo=-1) then adodsSmallGroupNum.Value:=1 else
adodsSmallGroupNum.Value:=adodsSmallGroup.RecNo;
end;

end.
