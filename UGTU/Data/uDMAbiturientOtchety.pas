unit uDMAbiturientOtchety;
{#Author tanyav@ist.ugtu.net}

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmAbiturientOtchety = class(TDataModule)
    adospAbitRaspKab: TADOStoredProc;
    AutoIncField11: TAutoIncField;
    AuditName: TStringField;
    SeatCount: TWordField;
    id_asp_kab: TAutoIncField;
    adoPrintExams: TADOStoredProc;
    adoPrintExamsik_disc: TIntegerField;
    adoPrintExamsname_disc: TStringField;
    adoPrintExamsik_sdach: TIntegerField;
    adoPrintExamscosenka: TIntegerField;
    adoPrintExamsNNvedom: TStringField;
    adospAbitGetZhurnal: TADOStoredProc;
    adospAbitZhurnal: TADOStoredProc;
    adospAbitZhurnalNN_abit: TAutoIncField;
    adospAbitZhurnalnCode: TBCDField;
    adospAbitZhurnalRegNomer: TIntegerField;
    adospAbitZhurnaldd_pod_zayav: TDateTimeField;
    adospAbitZhurnalStudname: TStringField;
    adospAbitZhurnalDd_birth: TDateTimeField;
    adospAbitZhurnallSex: TBooleanField;
    adospAbitZhurnalcName_zaved: TStringField;
    adospAbitZhurnalik_kat_zaved: TIntegerField;
    adospAbitZhurnalCname_pred: TStringField;
    adospAbitZhurnalcDolgnost: TStringField;
    adospAbitZhurnalStazYear: TIntegerField;
    adospAbitZhurnalStazMonth: TIntegerField;
    adospAbitZhurnalCname_kat_zach: TStringField;
    adospAbitZhurnalcIndex_fact: TStringField;
    adospAbitZhurnalIk_Street_fact: TIntegerField;
    adospAbitZhurnalAddressf: TStringField;
    adospAbitZhurnalcIndex_prop: TStringField;
    adospAbitZhurnalIk_Street_prop: TIntegerField;
    adospAbitZhurnalAddressp: TStringField;
    adospAbitZhurnalcSotTel: TStringField;
    adospAbitZhurnalctelefon: TStringField;
    adospAbitZhurnalLobchegit: TBooleanField;
    adospAbitZhurnalik_medal: TIntegerField;
    adospAbitZhurnalcKat_Zaved: TStringField;
    adospAbitZhurnalik_spec_fac: TIntegerField;
    adospAbitLangForZhurnal: TADOStoredProc;
    adospAbitLangForZhurnalnCode: TBCDField;
    adospAbitLangForZhurnalCname_lang: TStringField;
    adospAbitDocsForZhurnal: TADOStoredProc;
    adospAbitDocsForZhurnalnCode: TBCDField;
    adospAbitDocsForZhurnalNp_number: TStringField;
    adospAbitDocsForZhurnalCd_seria: TStringField;
    adospAbitDocsForZhurnalIk_vid_doc: TIntegerField;
    adospAbitDocsForZhurnalcvid_doc: TStringField;
    adospAbitDocsForZhurnalDd_vidan: TDateTimeField;
    adospAbitExForZhurnal: TADOStoredProc;
    adospAbitExForZhurnalNN_abit: TIntegerField;
    adospAbitExForZhurnalik_disc: TIntegerField;
    adospAbitExForZhurnalcosenka: TIntegerField;
    adospItogiPostuplAbitList: TADOStoredProc;
    adodsAbitReport: TADODataSet;
    dsAbitReport: TDataSource;
    dsSelStat: TDataSource;
    adospSelStat: TADODataSet;
    adospAbitZhurnallRussian: TBooleanField;
    adospAbitAddressForZhurnal: TADOStoredProc;
    adospAbitAddressForZhurnalIk_street: TIntegerField;
    adospAbitAddressForZhurnalAddress: TStringField;
    adospAbitZhurnalIsMain: TBooleanField;
    adospAbitZhurnalRealy_postup: TBooleanField;
    adospABITGetPredvSpisok: TADOStoredProc;
    adospAbitGetDinamika: TADOStoredProc;
    adoqExamStatistic: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAbiturientOtchety: TdmAbiturientOtchety;

implementation

uses uDM;

{$R *.dfm}

end.
