unit uDMUgtuStructure;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmUgtuStructure = class(TDataModule)
    adoqSelAllGroups: TADOQuery;
    adodsFaculty: TADODataSet;
    dsFaculty: TDataSource;
    adodsSpec: TADODataSet;
    dsSpec: TDataSource;
    adodsGroups: TADODataSet;
    dsGroups: TDataSource;
    adodsGroup: TADODataSet;
    adoqFac: TADOQuery;
    adoqFacIk_fac: TAutoIncField;
    adoqFacCname_fac: TStringField;
    adoqFacCshort_name_fac: TStringField;
    adoqFacfDateExit: TDateTimeField;
    dsFac: TDataSource;
    adoqSpecFac: TADOQuery;
    adoqSpecFacik_fac: TIntegerField;
    adoqSpecFacik_spec_fac: TAutoIncField;
    adoqSpecFacCname_spec: TStringField;
    adoqSpecFacCname_fac: TStringField;
    adoqSpecFacCshort_name_fac: TStringField;
    adoqSpecFacik_spec: TIntegerField;
    adoqSpecFacCshort_spec: TStringField;
    dsSpecFac: TDataSource;
    adodsGroupsofspec: TADODataSet;
    dsGroupsofSpec: TDataSource;
    adoqSpec: TADOQuery;
    dsqSpec: TDataSource;
    adoqSpecik_spec: TAutoIncField;
    adoqSpecCname_spec: TStringField;
    adoqSpecCshort_spec: TStringField;
    adoqSpecSh_spec: TStringField;
    adoqSpecFacik_direction: TIntegerField;
    adodsFacultyAll: TADODataSet;
    dsFacultyAll: TDataSource;
    dsSpecForNagr: TDataSource;
    adospSpecForNagr: TADOStoredProc;
    adospSpclzForNagr: TADOStoredProc;
    dsSpclzForNagr: TDataSource;
    adospFormEdForNagr: TADOStoredProc;
    dsFormEdForNagr: TDataSource;
    dsYearUPForNagr: TDataSource;
    adoqSpecFacYearObuch: TIntegerField;
    dsYearForUchPlan: TADOStoredProc;
    adsSpecFac: TADODataSet;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUgtuStructure: TdmUgtuStructure;

implementation

uses uDM;

{$R *.dfm}

end.
