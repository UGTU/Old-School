unit uDMAbiturientAction;
{#Author tanyav@ist.ugtu.net}

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmAbiturientAction = class(TDataModule)
    aspAbitDelExam: TADOStoredProc;
    aspAppendAbit: TADOStoredProc;
    aspAddExam: TADOStoredProc;
    aspDocsRetrieve: TADOStoredProc;
    aspAbitMove: TADOStoredProc;
    adospPrintZayavl: TADOStoredProc;
    adospPrintZayavlRegNomer: TIntegerField;
    adospPrintZayavlClastname: TStringField;
    adospPrintZayavlCfirstname: TStringField;
    adospPrintZayavlCotch: TStringField;
    adospPrintZayavlDd_birth: TDateTimeField;
    adospPrintZayavlCplacebirth: TStringField;
    adospPrintZayavlc_grazd: TStringField;
    adospPrintZayavludostover: TStringField;
    adospPrintZayavlPCd_seria: TStringField;
    adospPrintZayavlPNp_number: TStringField;
    adospPrintZayavlPDate: TIntegerField;
    adospPrintZayavlPMonth: TIntegerField;
    adospPrintZayavlPYear: TIntegerField;
    adospPrintZayavlPCd_kem_vidan: TStringField;
    adospPrintZayavlcIndex_fact: TStringField;
    adospPrintZayavlAddress1: TStringField;
    adospPrintZayavlAddress2: TStringField;
    adospPrintZayavlAddress3: TStringField;
    adospPrintZayavlcSotTel: TStringField;
    adospPrintZayavlctelefon: TStringField;
    adospPrintZayavlCname_spec: TStringField;
    adospPrintZayavlCname_fac: TStringField;
    adospPrintZayavlik_fac: TIntegerField;
    adospPrintZayavlik_type_kat: TIntegerField;
    adospPrintZayavlNgodokon: TBCDField;
    adospPrintZayavlAIk_vid_doc: TIntegerField;
    adospPrintZayavlACd_seria: TStringField;
    adospPrintZayavlANp_number: TStringField;
    adospPrintZayavlik_medal: TIntegerField;
    adospPrintZayavlStazYear: TIntegerField;
    adospPrintZayavlStazMonth: TIntegerField;
    adospPrintZayavlLobchegit: TBooleanField;
    adospPrintZayavlCdopsved: TStringField;
    adospPrintZayavlFIO: TStringField;
    adospPrintZayavlCLgot: TStringField;
    adospPrintZayavlik_kat_zaved: TIntegerField;
    adospPrintZayavlckat_zaved: TStringField;
    adospPrintZayavlZDate: TIntegerField;
    adospPrintZayavlZMonth: TIntegerField;
    adospPrintZayavlZYear: TIntegerField;
    adospAbit_docsForZayavl: TADOStoredProc;
    adospAbit_docsForZayavlNp_number: TStringField;
    adospAbit_docsForZayavlCd_seria: TStringField;
    adospAbit_docsForZayavlIk_vid_doc: TIntegerField;
    adospAbit_docsForZayavlcvid_doc: TStringField;
    aspAbitDelPostup: TADOStoredProc;
    aspEditPostup: TADOStoredProc;
    aspAddPostup: TADOStoredProc;
    adospInsertPredpr: TADOStoredProc;
    aspGetNewNum: TADOStoredProc;
    aspGetAdditionalspec: TADOStoredProc;
    aspDelSpec: TADOStoredProc;
    aspAddSpec: TADOStoredProc;
    dsAbitAdditionalSpec: TDataSource;
    aspGetAdditionalspecSpecNumber: TIntegerField;
    aspGetAdditionalspecCname_spec: TStringField;
    aspGetAdditionalspecik_spec: TIntegerField;
    aspGetAdditionalspecCshort_spec: TStringField;
    aspGetAdditionalspecNN_abit: TIntegerField;
    aspGetAdditionalspecNNrecord: TIntegerField;
    aspGetAdditionalspecik_spec_fac: TIntegerField;
    aspAbitReturn: TADOStoredProc;
    adospPrintZayavlIsRussOlimpWinner: TBooleanField;
    adospPrintZayavlEducationLevelName: TStringField;
    adospPrintZayavlIk_form_ed: TIntegerField;
    adospPrintZayavlnCode: TBCDField;
    aspGetOtherspec: TADOStoredProc;
    aspGetOtherspecRegNomer: TIntegerField;
    aspGetOtherspecik_kat_zach: TIntegerField;
    aspGetOtherspecdd_pod_zayav: TDateTimeField;
    aspGetOtherspecRealy_postup: TBooleanField;
    aspGetOtherspeccname_zach: TStringField;
    aspGetOtherspecCname_kat_zach: TStringField;
    aspGetOtherspecNaborName: TStringField;
    aspGetOtherspecIsMain: TBooleanField;
    dsAbitOtherlSpec: TDataSource;
    adospPrintZayavlcurrentIK_kat_zaved: TAutoIncField;
    aspAbitConfirmOnline: TADOStoredProc;
    adospPrintZayavlIsNotFirstEducation: TBooleanField;
    aspAddExamByName: TADOStoredProc;
    adospPrintZayavlcEmail: TStringField;
    aspDoubles: TADODataSet;
    adospPrintZayavlFullName: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAbiturientAction: TdmAbiturientAction;

implementation

uses uDM;

{$R *.dfm}

end.
