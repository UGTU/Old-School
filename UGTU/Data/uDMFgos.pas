unit uDMFgos;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmFgos = class(TDataModule)
    aspGetFgosBySpec: TADOStoredProc;
    aspGetCompetence: TADOStoredProc;
    aspGetFgosSpecYearNum: TADOStoredProc;
    aspGetFgosException: TADOStoredProc;
    aspGetFgosExceptionik_exception_fgos: TAutoIncField;
    aspGetFgosExceptioncName_disc: TStringField;
    aspGetFgosExceptionznach_ZE: TIntegerField;
    aspGetCompetenceik_competence: TAutoIncField;
    aspGetCompetencezhach_competence: TMemoField;
    aspGetAllAboutFgos: TADOStoredProc;
    aspGetDiscExceptionZE: TADOStoredProc;
    aspGetDiscZE: TADOStoredProc;
    adodsApplication1: TADODataSet;
    dsApplication1: TDataSource;
    adodsApplication1short_Name: TStringField;
    adodsApplication1zhach_competence: TStringField;
    adodsApplication1name_level_competence: TStringField;
    adodsApplication1description_content: TStringField;
    adodsApplication1ik_competence: TIntegerField;
    adodsApplication1ik_type_competence: TIntegerField;
    aspGetDataTitle: TADOStoredProc;
    aspGetCompForDicsUchPlan: TADOStoredProc;
    aspGetDiscBasedOn: TADOStoredProc;
    aspGetDiscMainStayFor: TADOStoredProc;
    aspGetDataTitleCname_spec: TStringField;
    aspGetDataTitlecName_spclz: TStringField;
    aspGetDataTitleCname_qualif: TStringField;
    aspGetDataTitleSh_spec: TStringField;
    aspGetDataTitleYearObuch: TIntegerField;
    aspGetDiscMainStayForik_disc_uch_plan_main: TIntegerField;
    aspGetDiscMainStayForcname_ckl_disc1: TStringField;
    aspGetDiscBasedOnik_disc_uch_plan_opir_na: TIntegerField;
    aspGetDiscBasedOncname_ckl_disc1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFgos: TdmFgos;

implementation

{$R *.dfm}

end.
