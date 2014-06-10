unit uDMOtdKadrDiplom;
 {# Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, uDM, ADODB;

type
  TdmOtdKadrDiplom = class(TDataModule)
    dsGakMember: TDataSource;
    dsSpecFac: TDataSource;
    adoqSpec: TADOQuery;
    adospGakMember: TADOStoredProc;
    dsFaculty: TDataSource;
    adoqYear: TADOQuery;
    adospGakMemberik_GakMember: TIntegerField;
    adospGakMemberCNameMember: TStringField;
    adospGakMemberik_spec: TIntegerField;
    adospGakMemberik_year: TIntegerField;
    adospGakMemberspecName: TStringField;
    adospQualification: TADOStoredProc;
    dsQualification: TDataSource;
    adospQualificationik_spec: TAutoIncField;
    adospQualificationCname_spec: TStringField;
    adospQualificationCname_qualif: TStringField;
    adospQualificationCshort_spec: TStringField;
    adospQualificationSpecategory: TStringField;
    adospQualificationQualifShortName: TStringField;
    adospQualificationSh_spec: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOtdKadrDiplom: TdmOtdKadrDiplom;

implementation

{$R *.dfm}

end.
