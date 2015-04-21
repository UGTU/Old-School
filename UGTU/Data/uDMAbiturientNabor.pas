unit uDMAbiturientNabor;

interface

uses
  SysUtils, Classes, uDM, DB, ADODB;

type
  TDMAbiturientNabor = class(TDataModule)
    adospAbitGetPostupStatistika: TADOQuery;
    dsAbitGetPostupStatistika: TDataSource;
    adoqNaborList: TADOQuery;
    dsNaborList: TDataSource;
    adospAbitNaborStatistik: TADOStoredProc;
    dsAbitNaborStatistik: TDataSource;
    adoqNaborDiscs: TADOQuery;
    dsNaborDiscs: TDataSource;
    adoqNaborDiscsik_disc: TIntegerField;
    adoqNaborDiscsMin_ball: TIntegerField;
    adoqNaborDiscsbit_Profil: TBooleanField;
    adoqNaborDiscsbit_Concurs: TBooleanField;
    adoqNaborDiscsNNrecord: TIntegerField;
    adoqNaborDiscsik_disc_nabor: TIntegerField;
    adoqNaborDiscsCname_fac: TStringField;
    adoqNaborDiscsCshort_name_fac: TStringField;
    adoqNaborDiscsik_spec_fac: TIntegerField;
    adoqNaborDiscsCname_spec: TStringField;
    adoqNaborDiscsCshort_spec: TStringField;
    adoqNaborDiscsik_fac: TIntegerField;
    adoqNaborDiscsik_spec: TIntegerField;
    adoqNaborDiscsNNyear: TIntegerField;
    adotAbitDisc: TADOTable;
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
    adoqSpecFacik_direction: TIntegerField;
    dsSpecFac: TDataSource;
    adoqAbitExams: TADOQuery;
    adoqExamsErrors: TADOQuery;
    dsExamsErrors: TDataSource;
    adoqNaborDiscsDiscName: TStringField;
    adoqSpecFacSortorder: TIntegerField;
    adoqSpecFacIk_form_ed: TIntegerField;
    dsDocRights: TDataSource;
    adoDocRights: TADOQuery;
    adoDocRightsik_vid_doc: TAutoIncField;
    adoDocRightscvid_doc: TStringField;
    adoDocRightsIsDefault: TBooleanField;
    adoDocRightsIsIdentity: TBooleanField;
    adoDocRightsIsEducational: TBooleanField;
    adoDocRightsik_FB: TIntegerField;
    adoDocRightsIsOsoboePravo: TBooleanField;
    adoDocRightsIsPreimushestvo: TBooleanField;
    adoDocRightsIsWithoutExam: TBooleanField;
    adoDocRightsik_subFB: TIntegerField;
    adoDocRightsik_type_grazd: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAbiturientNabor: TDMAbiturientNabor;

implementation

{$R *.dfm}

end.
