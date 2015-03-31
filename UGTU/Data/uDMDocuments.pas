unit uDMDocuments;

interface

uses
 uDM, System.SysUtils, System.Classes, DB, ADODB;

type
  TdmDocs = class(TDataModule)
    dsDocs: TDataSource;
    adodsDocs: TADODataSet;
    adodsDocsDateCreate: TDateTimeField;
    adodsDocsIk_studGrup: TIntegerField;
    adodsDocsnCode: TBCDField;
    adodsDocsFIO: TStringField;
    adodsDocsIk_grup: TIntegerField;
    adodsDocsCname_grup: TStringField;
    adodsDocsIk_form_ed: TIntegerField;
    adodsDocsCname_form_ed: TStringField;
    adodsDocsIk_fac: TIntegerField;
    adodsDocsCname_fac: TStringField;
    adodsDocsik_spec: TIntegerField;
    adodsDocsCname_spec: TStringField;
    adodsDocsik_direction: TIntegerField;
    adodsDocscNameDestination: TStringField;
    adodsDocsIk_Document: TIntegerField;
    adodsDocsIk_destination: TIntegerField;
    adodsDocscName_direction: TStringField;
    adodsDocscNameTransfer: TStringField;
    adodsDocscName_type_disc: TStringField;
    adodsDocsDateStartCallSpr: TWideStringField;
    adodsDocsDateEndCallSpr: TWideStringField;
    adodsDocsIk_Transfer: TIntegerField;
    adodsDocsik_type_disc: TWordField;
    dsReviewDoc: TDataSource;
    adodsReviewDoc: TADODataSet;
    StringField2: TStringField;
    IntegerField8: TIntegerField;
    adodsReviewDoccNameDestination: TStringField;
    adodsReviewDocIk_studGrup: TIntegerField;
    adodsReviewDocIk_Document: TIntegerField;
    adodsDocsNumberDoc: TIntegerField;
    adodsDocsDateReady: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDocs: TdmDocs;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
