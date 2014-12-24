unit uDMUspevaemost;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB, variants;

type
  TdmUspevaemost = class(TDataModule)
    dsSelVedEkz: TDataSource;
    adospSelVedEkz: TADOStoredProc;
    adospSelVedEkznCode: TIntegerField;
    adospSelVedEkzStudName: TStringField;
    adospSelVedEkzNn_zach: TStringField;
    adospSelVedEkzKatZach: TStringField;
    adospSelVedEkzik_zach: TIntegerField;
    adospSelVedEkzdopusc: TStringField;
    adospSelVedEkzzCosenca: TIntegerField;
    adospSelVedEkzeCosenca: TIntegerField;
    adospSelVedEkznameOsenca: TStringField;
    adospSelVedEkzNumber: TIntegerField;
    adospSelVedEkznameZOsenca: TStringField;
    dsPredmGroup: TDataSource;
    adospPredmGroup: TADOStoredProc;
    adospPredmGroupIk_ved: TAutoIncField;
    adospPredmGroupCOLUMN1: TStringField;
    adospPredmGroupiK_disc: TAutoIncField;
    adospPredmGroupiK_vid_zanyat: TIntegerField;
    dsPrepodVed: TDataSource;
    adospPrepodVed: TADOStoredProc;
    dsVedTop: TDataSource;
    adospVedTop: TADOStoredProc;
    adospVedTopCname_fac: TStringField;
    adospVedTopn_sem: TWordField;
    adospVedTopCname_grup: TStringField;
    adospVedTopcName_disc: TStringField;
    adospVedTopNamePrepod: TStringField;
    adospVedTopDd_exam: TStringField;
    dsSelVedGroup: TDataSource;
    dsAppVed: TDataSource;
    adospAppVed: TADOStoredProc;
    dsSelVed: TDataSource;
    adospSelVed: TADOStoredProc;
    aspNapr: TADOStoredProc;
    dsNapr: TDataSource;
    dsClearUspev: TDataSource;
    adospClearUspev: TADOStoredProc;
    dsAppendUspev: TDataSource;
    adospAppendUspev: TADOStoredProc;
    dsSelVedKP: TDataSource;
    adospSelVedKP: TADOStoredProc;
    adospSelVedKPnCode: TIntegerField;
    adospSelVedKPStudName: TStringField;
    adospSelVedKPNn_zach: TStringField;
    adospSelVedKPKatZach: TStringField;
    adospSelVedKPik_zach: TIntegerField;
    adospSelVedKPdopusc: TStringField;
    adospSelVedKPeCosenca: TIntegerField;
    adospSelVedKPnameOsenca: TStringField;
    adospSelVedKPcTema: TStringField;
    adospSelVedKPNumber: TIntegerField;
    dsGetAllPredms: TDataSource;
    adospGetAllPredms: TADOStoredProc;
    adospGetAllVeds4Group: TADOStoredProc;
    dsSelVedBottom: TDataSource;
    adospSelVedBottom: TADOStoredProc;
    adospCheckVedClose: TADOStoredProc;
    adospCloseNapr: TADOStoredProc;
    dsSelUspevForStud: TDataSource;
    adospSelUspevForStud: TADOStoredProc;
    adospSelVedGroup: TADODataSet;
    adospSelVedGroupStudName: TStringField;
    adospSelVedGroupNn_zach: TStringField;
    adospSelVedGroupKatZach: TStringField;
    adospSelVedGroupik_zach: TIntegerField;
    adospSelVedGroupdopusc: TBooleanField;
    adospSelVedGroupCosenca: TIntegerField;
    adospSelVedGroupcTema: TStringField;
    dsGetDopuskForVedom: TDataSource;
    adodsGetDopuskForVedom: TADODataSet;
    dsGetDopuskForVedom0: TDataSource;
    adodsGetDopuskForVedom0: TADODataSet;
    dsAppendRap: TDataSource;
    adospAppendRap: TADOStoredProc;
    IntegerField7: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField8: TIntegerField;
    StringField10: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    StringField11: TStringField;
    IntegerField11: TIntegerField;
    StringField12: TStringField;
    ds4VinVed: TDataSource;
    adosp4VinVed: TADOStoredProc;
    dsInsertVedomost: TDataSource;
    adospInsertVedomost: TADOStoredProc;
    dsGetUpContRap: TDataSource;
    adospGetUpContRap: TADOStoredProc;
    adospGetUpContRapik_vid_zanyat: TIntegerField;
    adospGetUpContRapik_disc: TAutoIncField;
    adospGetUpContRapcName_disc: TStringField;
    adospGetUpContRapik_upContent: TAutoIncField;
    adospUpdateDopusk: TADOStoredProc;
    StringField27: TStringField;
    WordField1: TWordField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    dsUpdateDopusk: TDataSource;
    adodsNapravl: TADODataSet;
    adodsNapravlIk_ved: TAutoIncField;
    adodsNapravlCosenca: TIntegerField;
    adodsNapravlcTema: TStringField;
    adodsNapravlclastname: TStringField;
    adodsNapravlcfirstname: TStringField;
    adodsNapravlcotch: TStringField;
    adodsNapravlcName_vid_zanyat: TStringField;
    adodsNapravlcName_vid_exam: TStringField;
    adodsNapravlIk_zach: TIntegerField;
    adodsNapravlOutcolumn: TStringField;
    dsNapravl: TDataSource;
    adodsMark: TADODataSet;
    dsMark: TDataSource;
    dsGetAllAtt: TDataSource;
    adospGetAllAtt: TADOStoredProc;
    adospGetAttVidZan: TADOStoredProc;
    dsGetAttVidZan: TDataSource;
    dsSelAttGroup: TDataSource;
    adodsSelAttGroup: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    adodsSelAttGroupPropCount: TIntegerField;
    dsAppendRezAtt: TDataSource;
    adospAppendRezAtt: TADOStoredProc;
    dsSelNapr: TDataSource;
    adospSelNapr: TADOStoredProc;
    dsGetAllVedNaprForGrup: TDataSource;
    dsGetAllVedNaprForDisc: TDataSource;
    adospGetAllVedNaprForDisc: TADOStoredProc;
    dsSelAtt: TDataSource;
    adospSelAtt: TADOStoredProc;
    dsCloseAllAtt: TDataSource;
    adoCloseAllAtt: TADOStoredProc;
    dsUpdateVedom: TDataSource;
    adospUpdateVedom: TADOStoredProc;
    adospVedTopcNumber_ved: TStringField;
    adospGetNomerNapr: TADOStoredProc;
    dsGetNomerNapr: TDataSource;
    dsGetAllNaprStud: TDataSource;
    adospGetAllNaprStud: TADOStoredProc;
    adospGetAllNaprStudcName_disc: TStringField;
    adospGetAllNaprStudcName_vid_zanyat: TStringField;
    adospGetAllNaprStudShortName: TStringField;
    adospGetAllNaprStuddD_vydano: TDateTimeField;
    adospGetAllNaprStudcName_vid_exam: TStringField;
    adospGetAllNaprStudDd_exam: TDateTimeField;
    adospGetAllNaprStudPrepName: TStringField;
    adospGetAllNaprStudn_sem: TIntegerField;
    adospGetAllVidZanyat: TADOQuery;
    adospUspevDependVidZanyat: TADOStoredProc;
    adospSelVedWithDopusk: TADOStoredProc;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField4: TIntegerField;
    StringField13: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField14: TStringField;
    IntegerField12: TIntegerField;
    StringField15: TStringField;
    adospGetAllNaprForFac: TADOStoredProc;
    dsGetAllNaprForFac: TDataSource;
    adospNaprRegister: TADOStoredProc;
    adospUspevStatForStud: TADOStoredProc;
    dsUspevStatForStud: TDataSource;
    adospSelVedGroupIsPassed: TBooleanField;
    adodsUspevForStipend: TADOStoredProc;
    dsSelAttBRSGroup: TDataSource;
    adodsSelAttBRSGroup: TADODataSet;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    IntegerField13: TIntegerField;
    adodsSelAttBRSGroupi_balls: TIntegerField;
    adospAppendRezBRSAtt: TADOStoredProc;
    adodsSelAttBRSGroupi_sumballs: TIntegerField;
    aspPrepodVedFromUchPlan: TADOStoredProc;
    dsPrepodVedFromUchPlan: TDataSource;
    adodsSelAttBRSGroupPropCount: TIntegerField;
    adodsNapravlDd_exam: TDateTimeField;
    adsGetBRSVedomost: TADODataSet;
    adospSaveDateAllAtt: TADOStoredProc;
    adodsSelAttGroupUvag_PropCount: TIntegerField;
    aspSetAttributesVedomost: TADOStoredProc;
    adsAvgBalls: TADODataSet;
    dsAvgBalls: TDataSource;
    adodsSelAttBRSGroupUvag_propCount: TIntegerField;
    adospGetBRSExamVidZan: TADOStoredProc;
    adospGetAllBRSExam: TADOStoredProc;
    dsGetAllBRSExam: TDataSource;
    adospSelBRSExam: TADOStoredProc;
    dsSelBRSExamGroup: TDataSource;
    adospAppendUspevKPTheme: TADOStoredProc;
    adodsSelBRSExamGroup: TADODataSet;
    StringField19: TStringField;
    StringField20: TStringField;
    IntegerField14: TIntegerField;
    StringField21: TStringField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    dsGetAverageBalls: TDataSource;
    adodsGetAverageBalls: TADODataSet;
    adodsGetAverageBallsStudName: TStringField;
    adodsGetAverageBallsNn_zach: TStringField;
    adodsGetAverageBallsKatZach: TStringField;
    adodsGetAverageBallsik_zach: TIntegerField;
    adodsGetAverageBallsi_balls: TFloatField;
    adsSelAllBRSBallsForStudent: TADODataSet;
    dsSelAllBRSBallsForStudent: TDataSource;
    adsAvgBallsNameStud: TStringField;
    adsAvgBallsNn_zach: TStringField;
    adsAvgBallsCname_grup: TStringField;
    adsAvgBallsAVGBall: TBCDField;
    adsSelAllBRSBallsForStudentn_module: TIntegerField;
    adsSelAllBRSBallsForStudentn_sem: TIntegerField;
    adsSelAllBRSBallsForStudentc_disc: TStringField;
    adsSelAllBRSBallsForStudenti_balls: TIntegerField;
    adsSelAllBRSBallsForStudentPropCount: TIntegerField;
    adsSelAllBRSBallsForStudentUvag_propCount: TIntegerField;
    adospAppendRezAttWithGrade: TADOStoredProc;
    adodsSelBRSExamGroupi_grade: TIntegerField;
    adodsSelBRSExamGroupi_sumall: TStringField;
    adospPredmStud: TADOStoredProc;
    adospPredmStudIk_ved: TAutoIncField;
    adospPredmStudNaprName: TStringField;
    adospPredmStudiK_disc: TAutoIncField;
    adospPredmStudiK_vid_zanyat: TIntegerField;
    adospPredmStudcName_disc: TStringField;
    adospGetAllVedNaprForGrup: TADOStoredProc;
    adospGetAllVedNaprForGrupName: TStringField;
    adospGetAllVedNaprForGrupiK_disc: TAutoIncField;
    adospGetAllVedNaprForGrupiK_vid_zanyat: TIntegerField;
    adospGetAllVedNaprForGrupcName_disc: TStringField;
    adospVedTopiHour_gos: TIntegerField;
    adodsNapravlItab_n: TStringField;
    procedure adospSelVedEkzCalcFields(DataSet: TDataSet);
    procedure adospSelVedKPCalcFields(DataSet: TDataSet);
    procedure adodsSelBRSExamGroupCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUspevaemost: TdmUspevaemost;

implementation

uses uDM;

{$R *.dfm}

procedure TdmUspevaemost.adodsSelBRSExamGroupCalcFields(DataSet: TDataSet);
begin
if not adodsSelBRSExamGroup.Active then exit;

if (adodsSelBRSExamGroup.FieldByName('i_balls').Value>0) and(adodsSelBRSExamGroup.FieldByName('i_sumballs').Value>0) then
adodsSelBRSExamGroupi_sumall.Value:=adodsSelBRSExamGroup.FieldByName('i_balls').Value+adodsSelBRSExamGroup.FieldByName('i_sumballs').Value;

{if (adodsSelBRSExamGroup.FieldByName('i_grade').Value<0) then
begin
adodsSelBRSExamGroup.FieldByName('i_gradedisplay').Value := null;
adodsSelBRSExamGroup.FieldByName('i_gradedisplay').Text := '';
end else
adodsSelBRSExamGroup.FieldByName('i_gradedisplay').Value := adodsSelBRSExamGroup.FieldByName('i_grade').Value;}

end;

procedure TdmUspevaemost.adospSelVedEkzCalcFields(DataSet: TDataSet);
begin
  if adospSelVedEkz.RecNo = -1 then
    adospSelVedEkzNumber.Value := 1
  else
    adospSelVedEkzNumber.Value := adospSelVedEkz.RecNo;
end;

procedure TdmUspevaemost.adospSelVedKPCalcFields(DataSet: TDataSet);
begin
  if adospSelVedKP.RecNo = -1 then
    adospSelVedKPNumber.Value := 1
  else
    adospSelVedKPNumber.Value := adospSelVedKP.RecNo;
end;

end.
