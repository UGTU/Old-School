unit uDMDiplom;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDiplom = class(TDataModule)
    adospDiplomList: TADOStoredProc;
    dsDiplomList: TDataSource;
    adospDiplomListik_zach: TAutoIncField;
    adospDiplomListStudName: TStringField;
    adospDiplomListRegNumber: TStringField;
    adospDiplomListVipNumber: TStringField;
    adospDiplomListDd_dipl: TDateTimeField;
    adospDiplomListDd_VidDipl: TDateTimeField;
    adospDiplomListCosenca: TIntegerField;
    adospDiplomListik_typeTema: TIntegerField;
    adospDiplomListik_pred: TIntegerField;
    adospDiplomListcTeacher: TStringField;
    adospDiplomListcTema: TStringField;
    adotPredpr: TADOTable;
    adotTypeTema: TADOTable;
    adospDiplomListPredprName: TStringField;
    adospDiplomListTypeTemaName: TStringField;
    adospSelKPForVipisca: TADOStoredProc;
    adospSelKPForVipiscaik_disc: TIntegerField;
    adospSelKPForVipiscacTema: TStringField;
    adospSelKPForVipiscacOsenca: TStringField;
    adospSelKRForVipisca: TADOStoredProc;
    adospSelKRForVipiscaik_disc: TIntegerField;
    adospSelKRForVipiscacTema: TStringField;
    adospSelKRForVipiscacOsenca: TStringField;
    adospSelUspevForVipisca: TADOStoredProc;
    adospGetVipiscaForDiplom: TADOStoredProc;
    adospGetVipiscaForDiplomStudName: TStringField;
    adospGetVipiscaForDiplomDd_birth: TDateTimeField;
    adospGetVipiscaForDiplomYearObuch: TIntegerField;
    adospGetVipiscaForDiplomyearPostup: TIntegerField;
    adospGetVipiscaForDiplomYearGrad: TIntegerField;
    adospGetVipiscaForDiplomVipNumber: TStringField;
    adospGetVipiscaForDiplomRegNumber: TStringField;
    adospGetVipiscaForDiplomDd_dipl: TDateTimeField;
    adospGetVipiscaForDiplomDd_VidDipl: TDateTimeField;
    adospGetVipiscaForDiplomCname_spec: TStringField;
    adospGetVipiscaForDiplomcName_spclz: TStringField;
    adospGetVipiscaForDiplomSpLine: TStringField;
    adospGetVipiscaForDiplomdocum: TStringField;
    adospGetVipiscaForDiplomform: TStringField;
    adospGetVipiscaForDiplomcdiplom: TStringField;
    adospAppendDiplom: TADOStoredProc;
    StringField20: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    StringField21: TStringField;
    IntegerField22: TIntegerField;
    DateTimeField2: TDateTimeField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    dsAppendDiplom: TDataSource;
    adospSelPractForVipisca: TADOStoredProc;
    adospGetVipiscaForDiplomCname_qualif: TStringField;
    adospGetVipiscaForDiplomtypeQualif: TStringField;
    adospSelGOSForVipisca: TADOStoredProc;
    adospDiplomListExcelPatternName: TStringField;
    adospDiplomListik_direction: TAutoIncField;
    adospGetVipiscaForDiplomClastname: TStringField;
    adospGetVipiscaForDiplomFirstName: TStringField;
    adospGetVipiscaForDiplomPatronymic: TStringField;
    adospDiplomListDiplVklDatPadez: TBooleanField;
    adospGetVipiscaForDiplomSpecategory: TStringField;
    adospGetVipiscaForDiplomQualifShortName: TStringField;
    adospGetVipiscaForDiplomCplacebirth: TStringField;
    adospGetVipiscaForDiplomattYear: TStringField;
    adospGetVipiscaForDiplomAttSer: TStringField;
    adospGetVipiscaForDiplomAttNumber: TStringField;
    adospGetVipiscaForDiplomdocumName: TStringField;
    adospDiplomListIk_fac: TAutoIncField;
    adospGetVipiscaForDiplomMonthObuch: TIntegerField;
    adospGetVipiscaForDiplomiClastname: TStringField;
    adospGetVipiscaForDiplomiFirstName: TStringField;
    adospGetVipiscaForDiplomiPatronymic: TStringField;
    adospGetVipiscaForDiplomSh_spec: TStringField;
    adospSelKRForVipiscadiscName: TStringField;
    adospGetVipiscaForDiplomOcencaDiplom: TStringField;
    adospSelKPForVipiscadiscName: TStringField;
    adospGetVipiscaForDiplomManagerSmallName: TStringField;
    adospGetVipiscaForDiplomIsExcellent: TBooleanField;
    adospDiplomListIsExcellent: TBooleanField;
    adospGetVipiscaForDiplomIk_form_ed: TIntegerField;
    adospDiplomListOverVUZ: TBooleanField;
    adospGetVipiscaForDiplomik_direction: TIntegerField;
    adospGetVipiscaForDiplomOverVUZ: TBooleanField;
    adospDiplomListOverVWeekCount: TIntegerField;
    adospDiplomListOverVUZName: TStringField;
    adospGetVipiscaForDiplomOverVWeekCount: TIntegerField;
    adospGetVipiscaForDiplomOverVUZName: TStringField;
    adospGetVipiscaForDiplomik_spec: TAutoIncField;
    adospGetVipiscaForDiplomik_spec_fac: TAutoIncField;
    adospDiplomListVidGos: TIntegerField;
    adospGetVipiscaForDiplomDateDiplomDelivery: TDateTimeField;
    adospGetVipiscaForDiplomOchYearObuch: TIntegerField;
    adospDiplomListDiplSeries: TStringField;
    adospDiplomListDiplNumber: TStringField;
    adospDiplomListProtNumber: TStringField;
    adospDiplomListProtDate: TDateTimeField;
    adospGetVipiscaCommonInf: TADOStoredProc;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDiplom: TdmDiplom;

implementation

uses uDM;
{$R *.dfm}

end.
