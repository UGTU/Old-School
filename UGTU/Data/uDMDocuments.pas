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
    adodsDocsNum_podrazd: TStringField;
    adodsDocsPersName: TStringField;
    adodsDocsStatus: TStringField;
    dsPricina: TDataSource;
    adodsPricina: TADODataSet;
    dsStudAddres: TDataSource;
    adodsStudAddres: TADODataSet;
    adodsStudAddresik_AddressType: TIntegerField;
    adodsStudAddresAddressTypeName: TStringField;
    adodsStudAddresik_personAddress: TIntegerField;
    adodsStudAddresBuildingNumber: TStringField;
    adodsStudAddresStructNumber: TStringField;
    adodsStudAddresCStreet: TStringField;
    adodsStudAddrescshort_type_street: TStringField;
    adodsStudAddresCType_Street: TStringField;
    adodsStudAddresCgorod: TStringField;
    adodsStudAddresCIndex: TStringField;
    adodsStudAddrescshort_type_gorod: TStringField;
    adodsStudAddresctype_gorod: TStringField;
    adodsStudAddresCraion: TStringField;
    adodsStudAddresCregion: TStringField;
    adodsStudAddresCstrana: TStringField;
    adodsStudAddresbit_SNG: TBooleanField;
    adodsStudAddresIk_studGrup: TIntegerField;
    adodsStudAddresFlatNumber: TStringField;
    dsVisa: TDataSource;
    adodsVisa: TADODataSet;
    DateTimeField1: TDateTimeField;
    BCDField1: TBCDField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    IntegerField4: TIntegerField;
    StringField5: TStringField;
    IntegerField5: TIntegerField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    IntegerField7: TIntegerField;
    IntegerField9: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    IntegerField10: TIntegerField;
    WordField1: TWordField;
    IntegerField11: TIntegerField;
    DateTimeField2: TDateTimeField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    adodsPricinaIk_pric: TIntegerField;
    adodsPricinaCname_pric: TStringField;
    adodsPricinaShortCname_pric: TStringField;
    adodsPricinaIk_reason_issuing: TIntegerField;
    adodsPricinaIk_destination: TIntegerField;
    adodsPricinacNameDestination: TStringField;
    procedure adodsDocsCalcFields(DataSet: TDataSet);
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

procedure TdmDocs.adodsDocsCalcFields(DataSet: TDataSet);
begin
if (DataSet.FieldByName('DateCreate').AsString='') then
 DataSet.FieldByName('Status').AsString:='Заявка'
 else
 begin
 if (DataSet.FieldByName('DateReady').AsString='') then
    DataSet.FieldByName('Status').AsString:='Утверждено'
    else
    DataSet.FieldByName('Status').AsString:='Готово'
 end;

end;

end.
