unit uDMStudentSelectionProcs;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmStudentSelectionProcs = class(TDataModule)
    aspSelLanguage: TADOStoredProc;
    aspSelLanguageIk_lang: TIntegerField;
    aspSelLanguageIk_step_vlad: TIntegerField;
    aspSelLanguagenCode: TBCDField;
    aspSelLanguageLang: TStringField;
    aspSelLanguageStepVl: TStringField;
    aspSelFamily: TADOStoredProc;
    aspSelFamilynCode: TBCDField;
    aspSelFamilyIk_memb_fam: TIntegerField;
    aspSelFamilyIk_pred: TIntegerField;
    aspSelFamilymemb_fam: TStringField;
    aspSelFamilyDSDesigner: TStringField;
    aspSelFamilypred: TStringField;
    aspSelFamilyDSDesigner5: TStringField;
    aspSelFamilyDSDesigner2: TStringField;
    aspSelFamilyDSDesigner3: TStringField;
    aspSelFamilyDSDesigner4: TStringField;
    aspSelFamilyDSDesigner6: TDateTimeField;
    dsLanguages: TDataSource;
    dsFamily: TDataSource;
    aspSelLastNames: TADOStoredProc;
    dsDocuments: TDataSource;
    dsLastnames: TDataSource;
    aspSelMoves: TADOStoredProc;
    aspSelAcadem: TADOStoredProc;
    dsMoves: TDataSource;
    dsAcadem: TDataSource;
    aspSelExiles: TADOStoredProc;
    aspSelVosst: TADOStoredProc;
    dsVosst: TDataSource;
    dsExiles: TDataSource;
    dslichnKartStud: TDataSource;
    adoLichnKartStud: TADOStoredProc;
    aspSelExtendedSessions: TADOStoredProc;
    dsExtendedSessions: TDataSource;
    aspSelExtendedSessionsStringField: TStringField;
    aspSelExtendedSessionsDateTimeField: TDateTimeField;
    aspSelExtendedSessionsDateTimeField2: TDateTimeField;
    aspSelExtendedSessionsStringField2: TStringField;
    aspSelExtendedSessionsStringField3: TStringField;
    aspSelAcademStringField: TStringField;
    aspSelAcademStringField2: TStringField;
    aspSelAcademStringField3: TStringField;
    aspSelAcademDateTimeField: TDateTimeField;
    aspSelAcademDateTimeField2: TDateTimeField;
    aspSelAcademStringField4: TStringField;
    aspSelAcademStringField5: TStringField;
    aspSelAcademStringField6: TStringField;
    aspSelAcademStringField7: TStringField;
    aspSelAcademDateTimeField3: TDateTimeField;
    aspSelAcademDateTimeField4: TDateTimeField;
    aspSelAcademDateTimeField5: TDateTimeField;
    aspSelAcademDateTimeField6: TDateTimeField;
    aspSelAcademDateTimeField7: TDateTimeField;
    aspSelAcademIk_pric: TAutoIncField;
    aspSelAcademIk_prikaz: TAutoIncField;
    aspSelAcademik_grup: TAutoIncField;
    aspSelAcademStringField8: TStringField;
    aspSelAcademBooleanField: TBooleanField;
    aspGetPersonAddress: TADOStoredProc;
    dsGetPersonAddress: TDataSource;
    aspGetPersonAddressCStreet: TStringField;
    aspGetPersonAddressCgorod: TStringField;
    aspGetPersonAddressCraion: TStringField;
    aspGetPersonAddressCregion: TStringField;
    aspGetPersonAddressCstrana: TStringField;
    aspGetPersonAddressBuildingNumber: TStringField;
    aspGetPersonAddressStructNumber: TStringField;
    aspGetPersonAddressFlatNumber: TStringField;
    aspGetPersonAddressfIndex: TStringField;
    aspGetPersonAddressAddressTypeName: TStringField;
    aspGetPersonAddressDateBegin: TDateTimeField;
    aspGetPersonAddressDateEnd: TDateTimeField;
    aspGetPersonAddressik_address: TIntegerField;
    aspGetPersonAddressIk_street: TIntegerField;
    aspGetPersonAddressik_gorod: TIntegerField;
    aspGetPersonAddressIk_raion: TIntegerField;
    aspGetPersonAddressIk_region: TIntegerField;
    aspGetPersonAddressIk_strana: TIntegerField;
    aspGetPersonAddressik_AddressType: TIntegerField;
    aspGetPersonAddressik_personAddress: TAutoIncField;
    aspSelLastNamesStringField: TStringField;
    aspSelLastNamesDateTimeField: TDateTimeField;
    aspSelLastNamesDateTimeField2: TDateTimeField;
    aspSelLastNamesStringField2: TStringField;
    aspSelLastNamesStringField3: TStringField;
    aspSelKatChanges: TADOStoredProc;
    dsSelKatChanges: TDataSource;
    adsGetParamNeedness: TADODataSet;
    adoSelDocuments: TADODataSet;
    adoSelDocumentsIK_doc: TIntegerField;
    adoSelDocumentsik_vid_doc: TIntegerField;
    adoSelDocumentscd_seria: TStringField;
    adoSelDocumentsnp_number: TStringField;
    adoSelDocumentsdd_vidan: TDateTimeField;
    adoSelDocumentscd_kem_vidan: TStringField;
    adoSelDocumentsisreal: TBooleanField;
    adoSelDocumentsballs: TIntegerField;
    adoSelDocumentsñname_disc: TStringField;
    adoSelDocumentscvid_doc: TStringField;
    adoSelDocumentsaddinfo: TStringField;
    adoSelDocumentsik_disc: TIntegerField;
    adoSelDocumentsDocCount: TIntegerField;
    aspSelStudPhotoAndPassport: TADOStoredProc;
    dsSelStudPhotoAndPassport: TDataSource;
    procedure aspSelLanguageNewRecord(DataSet: TDataSet);
    procedure aspSelFamilyNewRecord(DataSet: TDataSet);
   
    procedure aspSelLanguageAfterEdit(DataSet: TDataSet);
    procedure aspSelFamilyAfterEdit(DataSet: TDataSet);
    procedure aspSelDocumentsNewRecord(DataSet: TDataSet);
    procedure aspSelDocumentsAfterEdit(DataSet: TDataSet);
    procedure dsLanguagesDataChange(Sender: TObject; Field: TField);
    procedure dsFamilyDataChange(Sender: TObject; Field: TField);
    procedure dsDocumentsDataChange(Sender: TObject; Field: TField);
    procedure aspSelDocumentsdoc_typeChange(Sender: TField);
    procedure aspSelFamilymemb_famChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStudentSelectionProcs: TdmStudentSelectionProcs;

implementation

uses uMain;

{$R *.dfm}



procedure TdmStudentSelectionProcs.aspSelFamilyNewRecord(DataSet: TDataSet);
begin
  //frmMain.ActiveFrame.Modified:=true;
  Dataset.Fields[0].Value:=aspSelFamily.Parameters[0].Value;
end;


procedure TdmStudentSelectionProcs.aspSelLanguageNewRecord(DataSet: TDataSet);
begin
  Dataset.Fields[2].Value:=aspSelLanguage.Parameters[0].Value;
  //frmMain.ActiveFrame.Modified:=true;
end;


procedure TdmStudentSelectionProcs.dsDocumentsDataChange(Sender: TObject;
  Field: TField);
begin
  //frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.dsFamilyDataChange(Sender: TObject;
  Field: TField);
begin
//frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.dsLanguagesDataChange(Sender: TObject;
  Field: TField);
begin
//frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.aspSelLanguageAfterEdit(DataSet: TDataSet);
begin
//frmMain.ActiveFrame.Modified:=true;
end;


procedure TdmStudentSelectionProcs.aspSelFamilyAfterEdit(DataSet: TDataSet);
begin
//frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.aspSelFamilymemb_famChange(Sender: TField);
begin
frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.aspSelDocumentsAfterEdit(DataSet: TDataSet);
begin
//frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.aspSelDocumentsdoc_typeChange(
  Sender: TField);
begin
frmMain.ActiveFrame.Modified:=true;
end;

procedure TdmStudentSelectionProcs.aspSelDocumentsNewRecord(DataSet: TDataSet);
begin
//frmMain.ActiveFrame.Modified:=true;
 // Dataset.Fields[0].Value:=adoSelDocuments.Parameters[0].Value;
end;

end.
