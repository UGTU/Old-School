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
    ADODataSet1: TADODataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
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
