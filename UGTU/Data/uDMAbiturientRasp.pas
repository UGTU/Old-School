unit uDMAbiturientRasp;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, uDM, DB, ADODB,
    udmAbiturientOtchety, ApplicationController, ExceptionBase;

type
  TDMAbiturientRasp = class(TDataModule)
    adodsRasp: TADODataSet;
    adodsRaspid_rasp: TAutoIncField;
    adodsRaspdate_of: TDateTimeField;
    adodsRaspFIO_prepodav: TStringField;
    adodsRaspTimeBegin: TStringField;
    adodsRaspTimeEnd: TStringField;
    adodsRaspik_sdach: TIntegerField;
    adodsRaspik_disc: TIntegerField;
    adodsRaspik_typ_mer: TIntegerField;
    dsRasp: TDataSource;
    adospGetRasp: TADOStoredProc;
    adospGetRaspdate_of: TDateTimeField;
    adospGetRaspcname_mer: TStringField;
    adospGetRaspdisc: TStringField;
    adospGetRaspcname_sdach: TStringField;
    adospGetRaspid_rasp: TAutoIncField;
    adospGetRaspik_sdach: TIntegerField;
    adospGetRaspik_disc: TIntegerField;
    adospGetRaspik_typ_mer: TIntegerField;
    adospGetRaspTimeBegin: TDateTimeField;
    adospGetRaspTimeEnd: TDateTimeField;
    dsGetRasp: TDataSource;
    adospAbitGetSpisok: TADOQuery;
    adospAbitGetSpisokid_VstEx: TIntegerField;
    adospAbitGetSpisokid_rasp: TIntegerField;
    adospAbitGetSpisokid_rasp_kab: TIntegerField;
    adospAbitGetSpisokik_disc: TIntegerField;
    adospAbitGetSpisokik_sdach: TIntegerField;
    adospAbitGetSpisokik_spec_fac: TIntegerField;
    adospAbitGetSpisokik_fac: TIntegerField;
    adospAbitGetSpisoknn_abit: TIntegerField;
    adospAbitGetSpisoknnvedom: TStringField;
    adospAbitGetSpisokStudName: TStringField;
    adospAbitGetSpisokcosenka: TIntegerField;
    adospAbitGetSpisokCname_room: TStringField;
    dsAbitGetSpisok: TDataSource;
    dsAbitGetRaspKab: TDataSource;
    dsAbitNotBusyKab: TDataSource;
    adospAbitNotBusyKab: TADOQuery;
    adospAbitNotBusyKabik_room: TAutoIncField;
    adospAbitNotBusyKabCname_room: TStringField;
    adospAbitGetRaspKab: TADOQuery;
    adospAbitGetRaspKabik_room: TIntegerField;
    adospAbitGetRaspKabid: TAutoIncField;
    adospAbitGetRaspKabid_rasp: TIntegerField;
    adospAbitRaspKab: TADOQuery;
    IntegerField1: TIntegerField;
    AutoIncField1: TAutoIncField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    dsAbitRaspKab: TDataSource;
    adospAbitGetRaspKabCname_room: TStringField;
    adospAbitGetRaspKabiSeatCount: TWordField;
    adoqHelp: TADOQuery;
    adoqHelpid_VstEx: TIntegerField;
    adoqHelpid_rasp: TIntegerField;
    adoqHelpid_rasp_kab: TIntegerField;
    adoqHelpik_disc: TIntegerField;
    adoqHelpik_sdach: TIntegerField;
    adoqHelpik_spec_fac: TIntegerField;
    adoqHelpik_fac: TIntegerField;
    adoqHelpnn_abit: TIntegerField;
    adoqHelpnnvedom: TStringField;
    adoqHelpStudName: TStringField;
    adoqHelpcosenka: TIntegerField;
    adoqHelpCname_room: TStringField;
    adoqFac: TADOQuery;
    adoqFacIk_fac: TAutoIncField;
    adoqFacCname_fac: TStringField;
    adoqFacCshort_name_fac: TStringField;
    adoqFacfDateExit: TDateTimeField;
    dsFac: TDataSource;
    adoqSpecFac: TADOQuery;
    dsSpecFac: TDataSource;
    adoqSpecFacik_fac: TIntegerField;
    adoqSpecFacik_spec: TIntegerField;
    adoqSpecFacik_spec_fac: TAutoIncField;
    adoqSpecFacCname_spec: TStringField;
    adoqSpecFacCshort_spec: TStringField;
    procedure adospGetRaspAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAbiturientRasp: TDMAbiturientRasp;

implementation

{$R *.dfm}

uses
  ABIT_rasp_frame, uAbitRaspisanieController;


procedure TDMAbiturientRasp.adospGetRaspAfterScroll(DataSet: TDataSet);
begin
  //if fmAbitRasp.Modified then
    //fmAbitRasp.GetRaspScroll;
  if not TAbitRaspisanieController.Instance.OpenAllForRasp then
    raise EApplicationException.Create('Произошла ошибка при загрузке данных с сервера');

end;

end.
