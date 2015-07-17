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
    dsOsn: TDataSource;
    spOsn: TADOStoredProc;
    adodsNeusp: TADODataSet;
    dsNeusp: TDataSource;
    adodsNeuspIk_studGrup: TIntegerField;
    adodsNeuspik_upContent: TIntegerField;
    adodsNeuspcName_disc: TStringField;
    adodsNeuspcName_vid_zanyat: TStringField;
    adodsNeuspn_sem: TWordField;
    adodsNeuspflag: TBooleanField;
    dsDestination: TDataSource;
    adodsDestination: TADODataSet;
    adodsDestinationIk_destination: TAutoIncField;
    adodsDestinationcNameDestination: TStringField;
    adodsDestinationcShortNameDestination: TStringField;
    adodsDestinationDescription: TMemoField;
    adodsDestinationik_typesup: TIntegerField;
    adodsDestinationBase: TBooleanField;
    adodsDocStud: TADODataSet;
    DateTimeField3: TDateTimeField;
    BCDField2: TBCDField;
    IntegerField12: TIntegerField;
    StringField14: TStringField;
    IntegerField13: TIntegerField;
    StringField15: TStringField;
    IntegerField14: TIntegerField;
    StringField16: TStringField;
    IntegerField15: TIntegerField;
    StringField17: TStringField;
    IntegerField16: TIntegerField;
    StringField18: TStringField;
    IntegerField17: TIntegerField;
    StringField19: TStringField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    IntegerField20: TIntegerField;
    WordField2: TWordField;
    IntegerField21: TIntegerField;
    DateTimeField4: TDateTimeField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    dsDocStud: TDataSource;
    spDest: TADOStoredProc;
    dsDest: TDataSource;
    adodsDocsDatePod: TDateTimeField;
    adodsDocStudDatePod: TDateTimeField;
    procedure adodsDocsCalcFields(DataSet: TDataSet);
    procedure adodsDocStudCalcFields(DataSet: TDataSet);

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
 DataSet.FieldByName('Status').AsString:='������'
 else
 begin
 if (DataSet.FieldByName('DateReady').AsString='') then
    DataSet.FieldByName('Status').AsString:='�� ������������'
    else
    DataSet.FieldByName('Status').AsString:='������'
 end;

end;



procedure TdmDocs.adodsDocStudCalcFields(DataSet: TDataSet);
begin
if (DataSet.FieldByName('DateCreate').AsString='') then
 DataSet.FieldByName('Status').AsString:='������'
 else
 begin
 if (DataSet.FieldByName('DateReady').AsString='') then
    DataSet.FieldByName('Status').AsString:='�� ������������'
    else
    DataSet.FieldByName('Status').AsString:='������'
 end;
end;

end.