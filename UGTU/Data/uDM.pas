unit uDM;
{#Author support@ugtu.net}

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient,
  Provider, StdCtrls, Variants, DBLookupEh, uDMUgtuStructure, IniFiles,
  Contnrs, ExceptionBase, ADOint, CommonIntf, CommonIntfImpl, Math;
type
  TDBAction = (dbaInsert, dbaUpdate, dbaDelete);

  IDBActionSubscriber = interface (IInterface)
    procedure Notify(Sender : TObject; DataSet : TDataSet; DBAction : TDBAction);
  end;

   IDBActionPublisher = interface (IInterface)
    procedure Notify(DataSet : TDataSet; DBAction : TDBAction);
    procedure AddSubscriber( Subscriber : IDBActionSubscriber);
    procedure RemoveSubscriber( Subscriber : IDBActionSubscriber);
  end;

  Tdm = class(TDataModule, IDBActionPublisher)
    DBConnect: TADOConnection;
    dsSelVedEkz: TDataSource;
    adospSelVedEkz: TADOStoredProc;
    dsGetUchPlnGroup: TDataSource;
    adospGetUchPlnGroup: TADOStoredProc;
    adodsVidExam: TADODataSet;
    dsVidExam: TDataSource;
    adospSelVedEkzNumber: TIntegerField;
    adospSelVedEkznCode: TIntegerField;
    adospSelVedEkzStudName: TStringField;
    adospSelVedEkzNn_zach: TStringField;
    adospSelVedEkzKatZach: TStringField;
    adospSelVedEkzik_zach: TIntegerField;
    adospSelVedEkzdopusc: TStringField;
    adospSelVedEkzzCosenca: TIntegerField;
    adospSelVedEkzeCosenca: TIntegerField;
    adospSelVedEkznameOsenca: TStringField;
    adospSelVedEkznameZOsenca: TStringField;
    adotFilter2: TADOTable;
    adotFilter2ik_kaf: TAutoIncField;
    adotFilter2ik_fac: TIntegerField;
    adotFilter2cname_kaf: TStringField;
    adotFilter2cshort_name_kaf: TStringField;
    adotFilter2kolvo: TFloatField;
    adodsUsers: TADODataSet;
    adotFilter1: TADOTable;
    adotElemUsers: TADOTable;
    adotElemUsersik_Element: TIntegerField;
    adotElemUsersuid: TIntegerField;
    adotElemUsersik_filter1: TIntegerField;
    adotElemUsersik_filter2: TIntegerField;
    adotElemUsersuser: TStringField;
    adotElemUsersfilter1: TStringField;
    adotElemUsersfilter2: TStringField;
    dsElemUsers: TDataSource;
    dsElement: TDataSource;
    adotElement: TADOTable;
    dsSostZach: TDataSource;
    adotblSostZach: TADOTable;
    dsEdtPost: TDataSource;
    adospEdtPost: TADOStoredProc;
    adospWriteVer: TADOStoredProc;
    dsWriteVer: TDataSource;
    adodsNabor: TADODataSet;
    adodsNaborik_spec_fac: TIntegerField;
    adodsNaborik_fac: TIntegerField;
    adodsNaborNNyear: TIntegerField;
    adodsNaborYearObuch: TIntegerField;
    adodsNaborik_spec: TIntegerField;
    adodsNaborCname_spec: TStringField;
    adodsNaborCshort_spec: TStringField;
    adodsNaborNNrecord: TIntegerField;
    adodsNaborCshort_name_fac: TStringField;
    adodsNaborName: TStringField;
    dsNabor: TDataSource;
    qContentUchPlan: TADOQuery;
    adsSemester: TADODataSet;
    aspGetDiscplines: TADOStoredProc;
    aspGetDiscplinesik_disc: TIntegerField;
    aspGetDiscplinesik_grp_disc: TIntegerField;
    aspGetDiscplinesik_ckl_disc: TIntegerField;
    aspGetDiscplinescname_ckl_disc1: TStringField;
    aspGetDiscplinesik_uch_plan: TIntegerField;
    aspGetDiscplinesiHour_gos: TIntegerField;
    aspGetDiscplinesik_disc_uch_plan: TAutoIncField;
    aspGetDiscplinesik_default_kaf: TIntegerField;
    aspGetDiscplinescName_disc: TStringField;
    aspGetDiscplinesiIndivid: TIntegerField;
    adsVidNagruzki: TADODataSet;
    adsVidNagruzkiik_vid_nagruzki: TAutoIncField;
    adsVidNagruzkiCname_vid_nagruzki: TStringField;
    adsVidZanyat: TADODataSet;
    adsVidZanyatiK_vid_zanyat: TAutoIncField;
    adsVidZanyatcName_vid_zanyat: TStringField;
    dsAbitDisc: TDataSource;
    adodsAbitDisc: TADODataSet;
    adodsVidSdachi: TADODataSet;
    dsVidSdachi: TDataSource;
    adodsRasp: TADODataSet;
    dsRasp: TDataSource;
    adodsAbitDiscik_disc: TAutoIncField;
    adodsAbitDiscname_disc: TStringField;
    adodsVidSdachiik_sdach: TAutoIncField;
    adodsVidSdachicname_sdach: TStringField;
    adodsVidSdachicshort_sdach: TStringField;
    adodsRaspid_rasp: TAutoIncField;
    adodsRaspdate_of: TDateTimeField;
    adodsRaspFIO_prepodav: TStringField;
    adodsRaspTimeBegin: TStringField;
    adodsRaspTimeEnd: TStringField;
    adodsRaspik_sdach: TIntegerField;
    adodsRaspik_disc: TIntegerField;
    adodsRaspik_typ_mer: TIntegerField;
    adodsPostupView: TADODataSet;
    dsPostupView: TDataSource;
    adotbltypeTema: TADOTable;
    dstypeTema: TDataSource;
    adodsAbitExamView: TADODataSet;
    dsAbitExamView: TDataSource;
    adodsStudSearch: TADODataSet;
    dsStudSearch: TDataSource;
    dsMetodist: TDataSource;
    adospMetodists: TADOStoredProc;
    adospMetodistsik_metodist: TAutoIncField;
    adospMetodistsNameMetodists: TStringField;
    adoqFilial: TADOQuery;
    dsFilial: TDataSource;
    adoqYears: TADOQuery;
    dsYears: TDataSource;
    dsVer: TDataSource;
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
    adospAbitGetRaspKab: TADOStoredProc;
    adospAbitGetRaspKabik_room: TAutoIncField;
    adospAbitGetRaspKabCname_room: TStringField;
    adospAbitGetRaspKabiSeatCount: TWordField;
    adospAbitGetRaspKabid: TAutoIncField;
    dsAbitGetRaspKab: TDataSource;
    adospAbitNotBusyKab: TADOStoredProc;
    adospAbitNotBusyKabik_room: TIntegerField;
    adospAbitNotBusyKabCname_room: TStringField;
    adospAbitNotBusyKabiSeatCount: TWordField;
    adospAbitNotBusyKabid_Rassadka: TIntegerField;
    adospAbitNotBusyKabid_rasp: TIntegerField;
    dsAbitNotBusyKab: TDataSource;
    adospAbitKabMetodists: TADOStoredProc;
    adospAbitKabMetodistsid_rasp_kab: TIntegerField;
    adospAbitKabMetodistsik_metodist: TIntegerField;
    adospAbitKabMetodistsNameMetodists: TStringField;
    dsAbitKabMetodists: TDataSource;
    adospAbitUpdateKabMetodist: TADOStoredProc;
    DateTimeField3: TDateTimeField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    AutoIncField10: TAutoIncField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    dsAbitUpdateKabMetodist: TDataSource;
    adodsPostupViewRegNomer: TIntegerField;
    adodsPostupViewNN_abit: TIntegerField;
    adodsPostupViewnCode: TBCDField;
    adodsPostupViewNNrecord: TIntegerField;
    adodsPostupViewik_zach: TIntegerField;
    adodsPostupViewik_kat_zach: TIntegerField;
    adodsPostupViewdd_pod_zayav: TDateTimeField;
    adodsPostupViewcname_zach: TStringField;
    adodsPostupViewCname_kat_zach: TStringField;
    adodsPostupViewCshort_name_fac: TStringField;
    adodsPostupViewCname_spec: TStringField;
    adodsPostupViewNaborName: TStringField;
    adodsAbitExamViewnCode: TBCDField;
    adodsAbitExamViewik_disc: TIntegerField;
    adodsAbitExamViewik_sdach: TIntegerField;
    adodsAbitExamViewid_rasp_kab: TIntegerField;
    adodsAbitExamViewNNvedom: TStringField;
    adodsAbitExamViewcosenka: TIntegerField;
    adodsAbitExamViewNN_abit: TIntegerField;
    adodsAbitExamViewid: TIntegerField;
    adodsAbitExamViewcname_sdach: TStringField;
    adodsAbitExamViewname_disc: TStringField;
    adotEgeOtchet: TADOTable;
    adotEgeOtchetRegNomer: TIntegerField;
    adotEgeOtchetClastname: TStringField;
    adotEgeOtchetCfirstname: TStringField;
    adotEgeOtchetCotch: TStringField;
    adotEgeOtchetDd_birth: TDateTimeField;
    adotEgeOtchetCd_seria: TStringField;
    adotEgeOtchetNp_number: TStringField;
    adotEgeOtchetcAttest: TStringField;
    adotEgeOtchetlSex: TBooleanField;
    adotEgeOtchetMath: TIntegerField;
    adotEgeOtchetRuss: TIntegerField;
    adotEgeOtchetPhis: TIntegerField;
    adotEgeOtchetBiol: TIntegerField;
    adotEgeOtchetObch: TIntegerField;
    adotEgeOtchetChem: TIntegerField;
    adotEgeOtchetHist: TIntegerField;
    adotEgeOtchetGeog: TIntegerField;
    adotEgeOtchetLitr: TIntegerField;
    adoqAbitItogiCount: TADOQuery;
    adoqAbitSpecPermisions: TADOQuery;
    adoqAbitSpecPermisionsik_spec_fac: TIntegerField;
    adospAbitProhBall: TADOStoredProc;
    adospAbitProhBallProhBall: TIntegerField;
    dsTypeKatZach: TDataSource;
    adodsTypeKatZach: TADODataSet;
    adodsVidOtch: TADODataSet;
    dsVidOtch: TDataSource;
    adsDecomposeType: TADODataSet;
    adsDecomposeTypeik_decompose_type: TWordField;
    adsDecomposeTypecName_decompose: TStringField;
    adsKafedra: TADODataSet;
    adsTeacherTakeNagr: TADODataSet;
    adsTeacherTakeNagrik_vid_zanyat: TIntegerField;
    adsTeacherTakeNagrcName_vid_zanyat: TStringField;
    adsTeacherTakeNagrik_vid_nagruzki: TIntegerField;
    adsTeacherTakeNagrCname_vid_nagruzki: TStringField;
    adsTeacherTakeNagrtake_hour: TFloatField;
    adsTeacherTakeNagrik_content_plan_nagr: TIntegerField;
    adodsAbout: TADODataSet;
    aspTakeFactNagr: TADOStoredProc;
    aspTakeFactNagrik_content_plan_nagr: TIntegerField;
    aspTakeFactNagrik_vid_zanyat: TIntegerField;
    aspTakeFactNagrcName_vid_zanyat: TStringField;
    aspTakeFactNagriK_type_vz: TIntegerField;
    aspTakeFactNagrik_vid_nagruzki: TIntegerField;
    aspTakeFactNagrCname_vid_nagruzki: TStringField;
    aspTakeFactNagrf_hour_per_unit: TFloatField;
    aspTakeFactVZNagr: TADOStoredProc;
    aspTakeFactVZNagrik_calc_unit: TIntegerField;
    aspTakeFactVZNagrcName_calc_unit: TStringField;
    aspTakeFactVZNagrby_plan_number: TWordField;
    aspTakeFactVZNagri_student_count: TIntegerField;
    aspTakeFactVZNagrik_prepod_plan: TIntegerField;
    aspTakeFactVZNagrf_hour_per_unit: TFloatField;
    aspTakeFactVZNagrfact_hour: TFloatField;
    adodsTeachSearch: TADODataSet;
    dsTeachSearch: TDataSource;
    adsNormOfTime: TADODataSet;
    adsNormOfTimeik_vid_zanyat: TIntegerField;
    adsNormOfTimename_vid_zanyat: TStringField;
    adsNormOfTimename_vid_nagruzki: TStringField;
    adsNormOfTimef_norm_per_student: TFloatField;
    adsNormOfTimef_norm_per_ed: TFloatField;
    adsNormOfTimeik_vid_nagruzki: TIntegerField;
    adsNormOfTimeik_norm_of_time: TIntegerField;
    adsNormOfTimeik_default_decompose_type: TWordField;
    adsNormOfTimecname_decompose_type: TStringField;
    adsNormOfTimemax_norm_per_student: TFloatField;
    adsNormOfTimemin_requed_student: TIntegerField;
    adsNormOfTimef_norm_per_student_for_min: TFloatField;
    adsNormOfTimef_norm_per_ed_for_min: TFloatField;
    adoqAbitItogiCountIk_fac: TIntegerField;
    adoqAbitItogiCountik_spec_fac: TIntegerField;
    adoqAbitItogiCountCname_fac: TStringField;
    adoqAbitItogiCountCname_spec: TStringField;
    adoqAbitItogiCountObFCount: TIntegerField;
    adoqAbitItogiCountObPlCount: TIntegerField;
    adoqAbitItogiCountZCPFCount: TIntegerField;
    adoqAbitItogiCountZCPPlCount: TIntegerField;
    adoqAbitItogiCountContrCount: TIntegerField;
    adoqAbitItogiCountSrBall: TIntegerField;
    adoqAbitItogiCountMedalCount: TIntegerField;
    adsAllPlanNagr: TADODataSet;
    adsAllPlanNagrik_plan_nagr: TIntegerField;
    adsAllPlanNagrik_disc: TIntegerField;
    adsAllPlanNagrcName_disc: TStringField;
    adsAllPlanNagrik_potok: TIntegerField;
    adsAllPlanNagrcName_potok: TStringField;
    adsAllPlanNagrplan_hour: TFloatField;
    adsAllPlanNagrbusy_hour: TFloatField;
    adsAllPlanNagrn_sem: TIntegerField;
    adsSpecialities: TADODataSet;
    adsSpecialitiesik_spec_fac: TAutoIncField;
    adsSpecialitiesfull_name: TStringField;
    adsSemLengthExceptions: TADODataSet;
    adsSemLengthExceptionsik_shedule: TIntegerField;
    adsSemLengthExceptionsik_spec_fac: TIntegerField;
    adsSemLengthExceptionsspec_fac_name: TStringField;
    adsSemLengthExceptionscourse_number: TWordField;
    adsSemLengthExceptionsd_sem_start: TDateTimeField;
    adsSemLengthExceptionsd_sem_end: TDateTimeField;
    adsSemLengthExceptionsd_session_start: TDateTimeField;
    adsSemLengthExceptionsd_session_end: TDateTimeField;
    adsSemLengthExceptionsd_work_time_start: TDateTimeField;
    adsSemLengthExceptionsd_work_time_end: TDateTimeField;
    adsWorkTypes: TADODataSet;
    adsWorkTypesik_work_type: TIntegerField;
    adsWorkTypescName_work_type: TStringField;
    adsDefenceFund: TADODataSet;
    adsDefenceFundik_defence_fund: TWordField;
    adsDefenceFundcName_defence_fund: TStringField;
    adsCapacity: TADODataSet;
    adsCapacityik_capacity: TIntegerField;
    adsCapacityCname_capacity: TStringField;
    tblVer: TADOTable;
    adodsVer: TADODataSet;
    adodsPostupViewRealy_postup: TBooleanField;
    adodsAdditionalSpec: TADODataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField6: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    dsAdditionalSpec: TDataSource;
    aspGetDiscplineslPract: TBooleanField;
    aspGetDiscplinesik_type_disc: TWordField;
    adsNormOfTimeForPractice: TADODataSet;
    adsNormOfTimeForPracticename_disc: TStringField;
    StringField6: TStringField;
    adsNormOfTimeForPracticename_practice_norm_type: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField7: TStringField;
    adsNormOfTimeForPracticei_default_commission_count: TWordField;
    IntegerField9: TIntegerField;
    adsNormOfTimeForPracticeik_disc: TIntegerField;
    IntegerField8: TIntegerField;
    WordField1: TWordField;
    adsNormOfTimeForPracticeik_practice_norm_type: TWordField;
    adsPracticeListForNormOfTime: TADODataSet;
    adsPracticeListForNormOfTimeiK_disc: TAutoIncField;
    adsPracticeListForNormOfTimecName_disc: TStringField;
    adsPracticeNormType: TADODataSet;
    adsPracticeNormTypeik_practice_norm_type: TWordField;
    adsPracticeNormTypecName_practice_norm_type: TStringField;
    adsNormOfTimei_default_commission_count: TWordField;
    adsAllPlanNagrik_type_disc: TWordField;
    adsAllPlanNagrbit_calc_as_practice: TBooleanField;
    aspContentPlanNagr: TADOStoredProc;
    aspContentPlanNagrik_content_plan_nagr: TAutoIncField;
    aspContentPlanNagrik_plan_nagr: TIntegerField;
    aspContentPlanNagrik_disc: TIntegerField;
    aspContentPlanNagrik_vid_zanyat: TIntegerField;
    aspContentPlanNagrik_vid_nagruzki: TIntegerField;
    aspContentPlanNagrname_vid_zanyat: TStringField;
    aspContentPlanNagrname_vid_nagruzki: TStringField;
    aspContentPlanNagrname_potok_shema: TStringField;
    aspContentPlanNagri_commission_count: TWordField;
    aspContentPlanNagrf_all_hour: TFloatField;
    aspContentPlanNagrbusy_hour: TFloatField;
    aspContentPlanNagrik_schema_decompose_type: TIntegerField;
    adsPotokShemasInfo: TADODataSet;
    adsPotokShemasInfoik_uch_plan: TIntegerField;
    adsPotokShemasInfocalc_unit_count: TIntegerField;
    adsPotokShemasInfostudent_count: TIntegerField;
    adsPotokShemasInfoconsultation_hour: TFloatField;
    aspPotokShemes: TADOStoredProc;
    aspPotokShemesik_decompose_type: TWordField;
    adsTeachersWorkTypes: TADODataSet;
    adsTeachersWorkTypesik_kaf: TIntegerField;
    adsTeachersWorkTypesitab_n: TIntegerField;
    adsTeachersWorkTypesik_work_type: TIntegerField;
    adsTeachersWorkTypesik_capacity: TIntegerField;
    adsTeachersWorkTypesik_defence_fund: TWordField;
    adsTeachersWorkTypescName_work_type: TStringField;
    adsTeachersWorkTypescName_capacity: TStringField;
    adsTeachersWorkTypescName_defence_fund: TStringField;
    adsTeachersWorkTypesf_rates: TFloatField;
    adsTeachersWorkTypesik_id_prepod: TAutoIncField;
    adsTeachersWorkTypesrelease_date: TDateTimeField;
    aspTakeFactVZNagrik_uch_plan: TIntegerField;
    adsVidZanyatbit_must_be_in_uch_plan: TBooleanField;
    aspContentPlanNagrbit_vz_must_be_in_up: TBooleanField;
    adsPlanContingentOfSepGroups: TADODataSet;
    adsPlanContingentOfSepGroupsik_grup: TIntegerField;
    adsPlanContingentOfSepGroupscName_grup: TStringField;
    adsPlanContingentOfSepGroupssubgroup_count: TWordField;
    adsPlanContingentOfSepGroupsbudget_count: TIntegerField;
    adsPlanContingentOfSepGroupscontract_count: TIntegerField;
    adsSepGroups: TADODataSet;
    adsSepGroupsik_grup: TAutoIncField;
    adsSepGroupscName_grup: TStringField;
    aspGetDiscplinesViborGroup: TIntegerField;
    adsPotokShemasInfohour_by_gos: TIntegerField;
    adsPotokShemasInfobit_calc_students_only: TBooleanField;
    adsAuditorVZ: TADODataSet;
    adsAuditorVZik_vid_zanyat: TIntegerField;
    adsAuditorVZik_kaf: TIntegerField;
    adsAuditorVZname_vz: TStringField;
    adsAuditorVZname_kaf: TStringField;
    adsAuditorVZi_hour_per_week: TIntegerField;
    adsAuditorVZweek_count: TIntegerField;
    aspTakeFactNagrikTypeZanyat: TIntegerField;
    aspTakeFactVZNagrbit_calc_students_only: TBooleanField;
    qContentUchPlan_temp: TADOQuery;
    aspAbitDisc: TADOStoredProc;
    dsAbitDiscipline: TDataSource;
    aspAbitExamType: TADOStoredProc;
    dsAbitExamType: TDataSource;
    adodsPostupViewik_type_zach: TIntegerField;
    adsContentVZ: TADODataSet;
    adsContentVZsel_sem: TIntegerField;
    adsContentVZik_kaf: TIntegerField;
    adsContentVZn_sem: TIntegerField;
    adsContentVZkafedra_name: TStringField;
    adsContentVZtasks_count: TWordField;
    dsAbitAllExam: TDataSource;
    adodsAbitAllExam: TADODataSet;
    StringField5: TStringField;
    StringField8: TStringField;
    IntegerField7: TIntegerField;
    StringField9: TStringField;
    BCDField1: TBCDField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    AdodsDBUpdateAbility: TADODataSet;
    AdodsDBStatus: TADODataSet;
    adodsPostupViewIsMain: TBooleanField;
    adsAuditorVZn_module: TWordField;
    adsAuditorVZi_balls: TIntegerField;
    adsContentVZn_module: TWordField;
    adsContentVZi_balls: TIntegerField;
    adsPotokShemasInfoik_shema: TIntegerField;
    aspPotokShemescNameShema: TStringField;
    adsFactNagr: TADODataSet;
    adsFactNagrik_prepod_plan: TIntegerField;
    adsFactNagrik_vid_zanyat: TIntegerField;
    adsFactNagrik_vid_nagruzki: TIntegerField;
    adsFactNagrplan_hour: TFloatField;
    adsFactNagrfact_hour: TFloatField;
    adsFactNagrcName_vid_zanyat: TStringField;
    adsFactNagrCname_vid_nagruzki: TStringField;
    adsFactNagrik_calc_unit: TIntegerField;
    adsFactNagrcName_calc_unit: TStringField;
    adsFactNagrplan_student: TIntegerField;
    adsFactNagrfact_student: TIntegerField;
    adsFactNagrcur_fact_hour: TFloatField;
    adsFactNagrby_plan_number: TIntegerField;
    adsFactNagrcur_fact_student: TIntegerField;
    adsFactNagrcomission_member: TSmallintField;
    aspContentPlanNagrcalc_plan: TFloatField;
    aspGetDiscplinesiK_pdgrp_disc: TIntegerField;
    adsAdditionReason: TADODataSet;
    adsAdditionReasonik_addition_reason: TAutoIncField;
    adsAdditionReasoncName_reason: TStringField;
    adsNagrCommit: TADODataSet;
    adsNagrCommitnPotoks: TStringField;
    adsNagrCommitik_spec: TIntegerField;
    adsNagrCommitcName_spec: TStringField;
    adsNagrCommitcourse: TStringField;
    adsNagrCommitIk_grup: TIntegerField;
    adsNagrCommitCname_grup: TStringField;
    adsNagrCommitik_disc_uch_plan: TIntegerField;
    adsNagrCommitcName_disc: TStringField;
    adsNagrCommitrasch: TStringField;
    ADOStoredProc1: TADOStoredProc;
    aspAdditionFactNagr: TADOStoredProc;
    aspAdditionFactNagrik_addition: TAutoIncField;
    aspAdditionFactNagrik_vid_zanyat: TIntegerField;
    aspAdditionFactNagrik_vid_nagruzki: TIntegerField;
    aspAdditionFactNagrik_addition_reason: TIntegerField;
    aspAdditionFactNagrf_all_fact_hour: TBCDField;
    aspAdditionFactNagri_fact_student: TIntegerField;
    aspAdditionFactNagrname_vid_zanyat: TStringField;
    aspAdditionFactNagrname_vid_nagruzki: TStringField;
    aspAdditionFactNagrname_reason: TStringField;
    adsNagrCommitn_full: TIntegerField;
    adsPlanContingentOfSepGroupsik_year: TIntegerField;
    adsNagrCommitbudget_count: TIntegerField;
    adsNagrCommitcontract_count: TIntegerField;
    adsNagrCommitsubgroup_count: TWordField;
    aspDefaultPotoks: TADOStoredProc;
    aspAddDefaultPlans: TADOStoredProc;
    adsNagrCommitik_disc: TIntegerField;
    adsNagrCommitik_potok_semestr: TIntegerField;
    dsAllTimeNorm: TADODataSet;
    dsAllTimeNormik_norm_time: TIntegerField;
    dsAllTimeNormName_norm: TStringField;
    adsPlanContingentOfSepGroupsik_uch_plan: TIntegerField;
    aspPlanNormTime: TADOStoredProc;
    aspPlanNormTimeik_plan_nagr: TAutoIncField;
    aspPlanNormTimeik_norm_time: TIntegerField;
    aspPlanNormTimeName_plan: TStringField;
    aspPlanNormTimeName_norm: TStringField;
    aspDeleteOldNagr: TADOStoredProc;
    aspDeletePotokSemestr: TADOStoredProc;
    adodsPostupViewSchoolAverMark: TFloatField;
    aspGetDiscplinesiK_spclz: TIntegerField;
    aspGetDiscplinescName_spclz_short: TStringField;
    adsProfile: TADODataSet;
    dsProfileForGroup: TDataSource;
    adsGroups: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);


    procedure adospSelVedEkzCalcFields(DataSet: TDataSet);

    procedure adotElemUsersAfterScroll(DataSet: TDataSet);
    procedure adotElemUsersBeforePost(DataSet: TDataSet);
    procedure adotElemUsersfilter1Change(Sender: TField);
    procedure aspContentPlanNagrCalcFields(DataSet: TDataSet);
    procedure adospGetRaspAfterScroll(DataSet: TDataSet);
    procedure aspContentPlanNagrname_vid_nagruzkiSetText(Sender: TField;
      const Text: string);
    procedure adsNormOfTimeForPracticename_discSetText(Sender: TField;
      const Text: string);
    procedure DBConnectAfterConnect(Sender: TObject);
    procedure DBConnectWillExecute(Connection: TADOConnection;
      var CommandText: WideString; var CursorType: TCursorType;
      var LockType: TADOLockType; var CommandType: TCommandType;
      var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
      const Command: _Command; const Recordset: _Recordset);
    procedure DBConnectExecuteComplete(Connection: TADOConnection;
      RecordsAffected: Integer; const Err: Error;
      var EventStatus: TEventStatus; const Command: _Command;
      const Recordset: _Recordset);
    procedure adsFactNagrCname_vid_nagruzkiSetText(Sender: TField;
      const Text: string);
    procedure adsFactNagrcur_fact_hourChange(Sender: TField);
    procedure adsFactNagrcur_fact_studentChange(Sender: TField);


    procedure aspAdditionFactNagrname_vid_nagruzkiSetText(Sender: TField;
      const Text: string);
    procedure aspAdditionFactNagrCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    procedure MethodWorkNewRecordHandler(DataSet: TDataSet);
    function GetMethodWorkDataSet : TADODataSet;
    function GetMethodWorkInNormDataSet : TADODataSet;
    function CalcZaniatHour(aVidSZan: string; PlanStud,CurStud: integer; PlanHours, CurHours: double): double;
  public
    FDBSubscriberList : TInterfaceList;
    property MethodWorkDataSet : TADODataSet read GetMethodWorkDataSet;
    property MethodWorkInNormDataSet : TADODataSet read GetMethodWorkInNormDataSet;
    //ServerName: string;
    //DBName: string;
    //LoginName: string;
    //SID: string;
    //ReportSendingMail:string;
    //SupportMail:string;

  protected
    procedure Notify(DataSet : TDataSet; DBAction : TDBAction);
    procedure AddSubscriber( Subscriber : IDBActionSubscriber);
    procedure RemoveSubscriber( Subscriber : IDBActionSubscriber);
  end;

var
  dm: Tdm;
  minor, major, rls, build: Integer;

implementation

uses
  uLogin, Controls, Forms, Windows, Dialogs, uDMAbiturientOtchety, ApplicationController, VersionController;

{$R *.dfm}



procedure Tdm.DataModuleCreate(Sender: TObject);
var SearchOptions: TLocateOptions;
begin
  FDBSubscriberList := TInterfaceList.Create;

 TApplicationController.GetInstance.AddLogEntry('ИС "УГТУ" ' + TVersionController.GetInstance.CurrentVersion.VersionString);

if dbConnect.Connected then showmessage('ВНИМАНИЕ! СОЕДИНЕНИЕ ОТКРЫТО!');
 with TfrmLogin.Create(Self) do
  begin
    blExtended := false;
    Caption:= 'ИС "УГТУ" ' + TVersionController.GetInstance.CurrentVersion.VersionString + ' - Вход в систему';
    if (ShowModal = mrOK) then
    begin
      DBConnect.Connected:=false;
      DBConnect.ConnectionString:=ConnectionString;
      try
        DBConnect.Connected:=true;
      except
        raise EApplicationLoginFail.Create('Не удалось войти под именем ' + UserName, TApplicationController.GetInstance);
        {MessageBox(0, PAnsiChar('Не удалось войти под именем ' + UserName), 'ИС "УГТУ" - Вход в систему невозможен', MB_ICONERROR);
        TApplicationController.GetInstance.FinalizeApplication;
        Application.Terminate;
        ExitProcess($FF);}

      end;

      AdodsDBUpdateAbility.Active:=true;
      AdodsDBUpdateAbility.First;
      AdodsDBStatus.Active:=true;
      AdodsDBStatus.First;
      TApplicationController.GetInstance.CheckDBStats(AdodsDBUpdateAbility.FieldByName('UpdateAbility').Value,AdodsDBStatus.FieldByName('Status').Value );

      TAppVersion(TVersionController.GetInstance.CurrentVersion).VersionRegister;

    end
    else
    begin
      TApplicationController.GetInstance.FinalizeApplication;
      Application.Terminate;
      ExitProcess($FF);
    end;
    Free;
  end;

end;

procedure Tdm.DBConnectAfterConnect(Sender: TObject);
begin
  TApplicationController.GetInstance.InitAboutParameters;
end;

procedure Tdm.DBConnectExecuteComplete(Connection: TADOConnection;
  RecordsAffected: Integer; const Err: Adoint.Error; var EventStatus: TEventStatus;
  const Command: _Command; const Recordset: _Recordset);
  var Logger:ILogger;
begin
Logger:=TNullLogger.GetInstance;
Logger.LogMessage('Запрос выполнен');
end;

procedure Tdm.DBConnectWillExecute(Connection: TADOConnection;
  var CommandText: WideString; var CursorType: TCursorType;
  var LockType: TADOLockType; var CommandType: TCommandType;
  var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
  const Command: _Command; const Recordset: _Recordset);
var Logger:ILogger;
begin
Logger:=TNullLogger.GetInstance;
Logger.LogMessage('Выполняется запрос: '+CommandText);
end;

function Tdm.GetMethodWorkDataSet: TADODataSet;
const
  ds : TADODataSet = nil;
begin
  if (not Assigned(ds)) then
  begin
    ds := TADODataSet.Create(nil);
    ds.Connection := DBConnect;
    ds.CommandText := 'SELECT *, NULL as IDContentNorm From MethodWork Order By NameWork';
    //ds.OnNewRecord := MethodWorkNewRecordHandler;
    ds.Open;
  end;
  Result := ds;
end;

function Tdm.GetMethodWorkInNormDataSet: TADODataSet;
const
  ds : TADODataSet = nil;
begin
  if (not Assigned(ds)) then
  begin
    ds := TADODataSet.Create(nil);
    ds.Connection := DBConnect;
    ds.CommandText := 'select NULL as IDNormOfTime, NULL as IDContentNorm, IDWarrant, IDMethodWork, NameWork, IDMethodWorkParent, BitEdition from MethodWork where BitEdition is NULL union '+
      'SELECT IDNormOfTime, IDContentNorm, IDWarrant, MethodWork_NormOfTime.IDMethodWork, NameWork + '' ('' + cast(Norma as varchar) + '' ч. '' + NameUnit + '')'', IDMethodWorkParent, BitEdition From MethodWork_NormOfTime '+
      'inner join MethodWork ON MethodWork_NormOfTime.IDMethodWork = MethodWork.IDMethodWork '+
      'inner join MW_Unit ON MethodWork_NormOfTime.IDUnit = MW_Unit.IDUnit '+
      'Order By NameWork';
    //ds.OnNewRecord := MethodWorkNewRecordHandler;
    ds.Open;
  end;
  Result := ds;
end;

procedure Tdm.MethodWorkNewRecordHandler(DataSet: TDataSet);
begin
  Self.Notify(DataSet, dbaInsert);
end;

procedure Tdm.Notify(DataSet: TDataSet; DBAction: TDBAction);
var
  I: Integer;
begin
  for I := 0 to FDBSubscriberList.Count - 1 do
  begin
    IDBActionSubscriber(FDBSubscriberList[I]).Notify(Self, DataSet, DBAction);
  end;
end;

procedure Tdm.RemoveSubscriber(Subscriber: IDBActionSubscriber);
begin
  FDBSubscriberList.Remove(Subscriber);
end;

procedure Tdm.adospSelVedEkzCalcFields(DataSet: TDataSet);
begin
  if adospSelVedEkz.RecNo = -1 then
    adospSelVedEkzNumber.Value := 1
  else
    adospSelVedEkzNumber.Value := adospSelVedEkz.RecNo;
end;





procedure Tdm.adotElemUsersAfterScroll(DataSet: TDataSet);
begin
   if not adotFilter2.Active then exit;
   if adotElemUsersik_filter1.IsNull then
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'=0'
   else
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'='+
      adotElemUsersik_filter1.AsString;

end;

procedure Tdm.adotElemUsersBeforePost(DataSet: TDataSet);
begin
  adotElemUsersik_Element.AsString:=adotElemUsers.Filter[length(adotElemUsers.Filter)];

end;

procedure Tdm.adotElemUsersfilter1Change(Sender: TField);
var fl:boolean;
begin
   if not adotFilter2.Active then exit;
   if adotElemUsersik_filter1.IsNull then
   begin
      adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'=0';
      adotElemUsersik_filter2.Value:=null;
   end
   else
   begin
      fl:=false;
      try
         adotFilter2.Locate(adotFilter2.Fields[0].FieldName,adotElemUsersik_filter2.Value,[]);
         if (adotFilter2.Fields[1].AsInteger<>adotElemUsersik_filter1.AsInteger)
            then fl:=true;
         adotFilter2.Filter:=adotFilter1.Fields[0].FieldName+'='+
         adotElemUsersik_filter1.AsString;
         if (adotFilter2.RecordCount=0) then
         begin
            adotElemUsersik_filter2.Value:=null;
            exit;
         end;
         adotFilter2.Locate(adotFilter2.Fields[0].FieldName,adotElemUsersik_filter2.Value,[]);
         if fl then
         begin
            adotFilter2.First;
            adotElemUsersik_filter2.AsInteger:=adotFilter2.Fields[0].AsInteger;
         end;
      except
      end;
   end;

end;

procedure Tdm.adsFactNagrCname_vid_nagruzkiSetText(Sender: TField;
  const Text: string);
var   tempDS: TADODataSet;
begin
  // установим ID выбраного вида нагрузки
   tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= DBConnect;
  try
    tempDS.CommandText:= 'SELECT ik_vid_nagruzki FROM Vid_nagruzki WHERE Cname_vid_nagruzki = ''' + Text + '''';
    tempDS.Open;
    if tempDS.RecordCount > 0 then
    begin
      adsFactNagr.FieldByName('ik_vid_nagruzki').AsInteger:= tempDS.FieldByName('ik_vid_nagruzki').AsInteger;
      adsFactNagr.FieldByName('Cname_vid_nagruzki').AsString:= Text;
    end
    else
    begin
      tempDS.Close;
      tempDS.Free;
      exit;
    end;
    tempDS.Close;
  finally
    tempDS.Free;
  end;
end;

procedure Tdm.adsFactNagrcur_fact_hourChange(Sender: TField);
begin
  adsFactNagr.Tag := 1;
end;

procedure Tdm.adsFactNagrcur_fact_studentChange(Sender: TField);
begin
  //здесь идет пересчет часов по студентам
  adsFactNagr.Tag := 1;
  if (Sender.Value>0) then
    adsFactNagr.FieldByName('cur_fact_hour').Value := CalcZaniatHour(adsFactNagr.FieldByName('ik_vid_zanyat').AsString,adsFactNagr.FieldByName('plan_student').AsInteger,
                                                                     adsFactNagr.FieldByName('cur_fact_student').AsInteger,adsFactNagr.FieldByName('plan_hour').AsFloat, adsFactNagr.FieldByName('cur_fact_hour').Value);

end;

procedure Tdm.adsNormOfTimeForPracticename_discSetText(Sender: TField;
  const Text: string);
begin
  if adsNormOfTimeForPractice.FieldByName('ik_default_decompose_type').Value = NULL then
    adsNormOfTimeForPractice.FieldByName('ik_default_decompose_type').AsInteger:= 1;
  if adsNormOfTimeForPractice.FieldByName('i_default_commission_count').Value = NULL then
    adsNormOfTimeForPractice.FieldByName('i_default_commission_count').AsInteger:= 1;
end;

procedure Tdm.aspAdditionFactNagrCalcFields(DataSet: TDataSet);
begin
  if (aspAdditionFactNagr.FieldByName('ik_vid_zanyat').Value = NULL) or
    (aspAdditionFactNagr.FieldByName('ik_vid_nagruzki').Value = NULL) or
    (dm.aspAdditionFactNagr.FieldByName('ik_addition_reason').Value = NULL) then exit;
end;

procedure Tdm.aspAdditionFactNagrname_vid_nagruzkiSetText(Sender: TField;
  const Text: string);
var
  tempDS: TADODataSet;
begin
  // установим ID выбраного вида нагрузки
   tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= DBConnect;
  try
    tempDS.CommandText:= 'SELECT ik_vid_nagruzki FROM Vid_nagruzki WHERE Cname_vid_nagruzki = ''' + Text + '''';
    tempDS.Open;
    if tempDS.RecordCount > 0 then
    begin
      aspAdditionFactNagr.FieldByName('ik_vid_nagruzki').AsInteger:= tempDS.FieldByName('ik_vid_nagruzki').AsInteger;
      aspAdditionFactNagr.FieldByName('name_vid_nagruzki').AsString:= Text;
    end
    else
    begin
      tempDS.Close;
      tempDS.Free;
      exit;
    end;
    tempDS.Close;
  finally
    tempDS.Free;
  end;
end;


procedure Tdm.aspContentPlanNagrCalcFields(DataSet: TDataSet);
var
  allHour, allEdHour, allStudHour, allStudMaxHour, uchPlanHour: double;
  inPlanCount: integer;
  vzWasFoundInUchPlan: boolean;
begin
  if (aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value = NULL) or
    (aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value = NULL) or
    (dm.aspContentPlanNagr.FieldByName('ik_shema').Value = NULL) then exit;
  allHour:= 0;

  if (aspContentPlanNagr.FieldByName('ik_vid_zanyat').Value = 32) then   //если консультации
  begin
    dm.adsPotokShemasInfo.Locate('ik_shema', dm.aspContentPlanNagr.FieldByName('ik_shema').AsInteger, [loPartialKey]); // установим указатель на первую запись
    while (true and (not dm.adsPotokShemasInfo.Eof)) do
    begin
      if dm.adsPotokShemasInfo.FieldByName('ik_shema').AsInteger <> dm.aspContentPlanNagr.FieldByName('ik_shema').AsInteger then break;
      allHour:= allHour + dm.adsPotokShemasInfo.FieldByName('consultation_hour').AsFloat;
      dm.adsPotokShemasInfo.Next;
    end;
    aspContentPlanNagr.FieldByName('f_all_hour').AsFloat:= allHour; // * aspContentPlanNagr.FieldByName('calc_unit_count').AsFloat);
    exit;
  end;

  if adsNormOfTime.Active and adsNormOfTimeForPractice.Active then
  begin
    dm.adsPotokShemasInfo.Locate('ik_shema', dm.aspContentPlanNagr.FieldByName('ik_shema').AsInteger, [loPartialKey]); // установим указатель на первую запись
    // считаем часы отдельно по каждому учебному плану, по которым учатся расч. единицы выбранной схемы деления
    while (not dm.adsPotokShemasInfo.Eof) do
    begin
      if dm.adsPotokShemasInfo.FieldByName('ik_shema').AsInteger <> dm.aspContentPlanNagr.FieldByName('ik_shema').AsInteger then break;
      if dm.adsPotokShemasInfo.FieldByName('ik_uch_plan').Value = NULL then
      begin
        dm.adsPotokShemasInfo.Next;
        continue;
      end;
      uchPlanHour:= -1;
      vzWasFoundInUchPlan:= false;
      inPlanCount:= 0;
      allEdHour:= 0;
      allStudHour:= 0;
      allStudMaxHour:= 0;
      if aspContentPlanNagr.FieldByName('bit_vz_must_be_in_up').AsBoolean then
      begin
        if dm.qContentUchPlan.Active then
        begin
          dm.qContentUchPlan.First;
          while not dm.qContentUchPlan.Eof do
          begin
            if (dm.qContentUchPlan.FieldByName('ik_vid_zanyat').AsInteger = dm.aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger) and
              (dm.qContentUchPlan.FieldByName('ik_shema').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_shema').AsInteger) and
              (dm.qContentUchPlan.FieldByName('ik_uch_plan').AsInteger = dm.adsPotokShemasInfo.FieldByName('ik_uch_plan').AsInteger) then
            begin
              if (dm.qContentUchPlan.FieldByName('i_hour_per_week').Value <> NULL) then
                uchPlanHour:= uchPlanHour + dm.qContentUchPlan.FieldByName('i_hour_per_week').AsFloat * dm.qContentUchPlan.FieldByName('kol_ned').AsFloat * dm.adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat;
              vzWasFoundInUchPlan:= true;
              Inc(inPlanCount, dm.qContentUchPlan.FieldByName('tasks_count').AsInteger);
            end;
            dm.qContentUchPlan.Next;
          end;
        end
        else raise EApplicationException.Create('Не загружена информация из учебных планов. Расчет нагрузки невозможен!');
        if not vzWasFoundInUchPlan then  // т.е. вид занятий вообще не был найден в уч. плане, пока так, но потом появятся виды занятий которых в уч. плане быть не должно, но нагрузка по ним может быть
        begin
          dm.adsPotokShemasInfo.Next;
          continue;
        end;
        if (uchPlanHour >= 0.0) then uchPlanHour:= uchPlanHour + 1.0;
      end;
      dm.qContentUchPlan.First;
      if (inPlanCount = 0) then inPlanCount:= 1;

      if aspContentPlanNagr.Tag = 1 then // в зависимости от вида текущей дисциплины
      begin
         if adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger, [loPartialKey]) then
         begin
           allStudHour:= adsNormOfTimeForPractice.FieldByName('f_norm_per_student').AsFloat * adsPotokShemasInfo.FieldByName('student_count').AsFloat;//currentPotokStundentCount;
           allEdHour:= adsNormOfTimeForPractice.FieldByName('f_norm_per_ed').AsFloat * adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat;
           case adsNormOfTimeForPractice.FieldByName('ik_practice_norm_type').AsInteger of
           2:
            begin
              allStudHour:= 6*adsPotokShemasInfo.FieldByName('hour_by_gos').AsFloat*allStudHour;
              allEdHour:= 6*adsPotokShemasInfo.FieldByName('hour_by_gos').AsFloat*allEdHour;
            end;
           3:
            begin
              allStudHour:= adsPotokShemasInfo.FieldByName('hour_by_gos').AsFloat*allStudHour;
              allEdHour:= adsPotokShemasInfo.FieldByName('hour_by_gos').AsFloat*allEdHour;
            end;
           end;
         end;
      end
      else
      begin
          if adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger, aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
          begin
            if adsPotokShemasInfo.FieldByName('student_count').AsInteger < adsNormOfTime.FieldByName('min_requed_student').AsInteger then
            begin
              allStudHour:= adsNormOfTime.FieldByName('f_norm_per_student_for_min').AsFloat * adsPotokShemasInfo.FieldByName('student_count').AsFloat; //currentPotokStundentCount;
              allStudMaxHour:= adsNormOfTime.FieldByName('max_norm_per_student').AsFloat * adsPotokShemasInfo.FieldByName('student_count').AsFloat; //currentPotokStundentCount;
              if (uchPlanHour = -1) then
                allEdHour:= adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat * adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat
              else
                allEdHour:= uchPlanHour * adsNormOfTime.FieldByName('f_norm_per_ed_for_min').AsFloat; //* aspContentPlanNagr.FieldByName('calc_unit_count').AsFloat;
            end
            else
            begin
              allStudHour:= adsNormOfTime.FieldByName('f_norm_per_student').AsFloat * adsPotokShemasInfo.FieldByName('student_count').AsFloat; //currentPotokStundentCount;
              allStudMaxHour:= adsNormOfTime.FieldByName('max_norm_per_student').AsFloat * adsPotokShemasInfo.FieldByName('student_count').AsFloat; //currentPotokStundentCount;
              if (uchPlanHour = -1) then
                allEdHour:= adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat * adsPotokShemasInfo.FieldByName('calc_unit_count').AsFloat
              else
                allEdHour:= uchPlanHour * adsNormOfTime.FieldByName('f_norm_per_ed').AsFloat; //* aspContentPlanNagr.FieldByName('calc_unit_count').AsFloat;
            end;
          end;
      end;
      if dm.adsPotokShemasInfo.FieldByName('bit_calc_students_only').AsBoolean then
        allEdHour:= 0;

      if (allStudHour*inPlanCount > allStudMaxHour) and (allStudMaxHour <> 0) then
        allHour:= allHour + allEdHour*inPlanCount + allStudMaxHour
      else allHour:= allHour + (allEdHour + allStudHour)*inPlanCount;
      dm.adsPotokShemasInfo.Next;
    end;
  end
  else exit;
  if aspContentPlanNagr.FieldByName('i_commission_count').Value <> NULL then
    aspContentPlanNagr.FieldByName('f_all_hour').AsFloat:= allHour * aspContentPlanNagr.FieldByName('i_commission_count').AsFloat
  else aspContentPlanNagr.FieldByName('f_all_hour').AsFloat:= allHour;
  //aspContentPlanNagr.FieldByName('f_all_hour').AsFloat:= aspContentPlanNagr.FieldByName('calc_plan').AsFloat;
end;

procedure Tdm.aspContentPlanNagrname_vid_nagruzkiSetText(Sender: TField;
  const Text: string);
var
  tempDS: TADODataSet;
begin
  // установим ID выбраного вида нагрузки
   tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= DBConnect;
  try
    tempDS.CommandText:= 'SELECT ik_vid_nagruzki FROM Vid_nagruzki WHERE Cname_vid_nagruzki = ''' + Text + '''';
    tempDS.Open;
    if tempDS.RecordCount > 0 then
    begin
      aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger:= tempDS.FieldByName('ik_vid_nagruzki').AsInteger;
      aspContentPlanNagr.FieldByName('name_vid_nagruzki').AsString:= Text;
    end
    else
    begin
      tempDS.Close;
      tempDS.Free;
      exit;
    end;
    tempDS.Close;
  finally
    tempDS.Free;
  end;

  // загрузим схему деления, используемую по умолчанию
  if (aspContentPlanNagr.FieldByName('ik_shema').Value = NULL) and
    (aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value <> NULL) then
  begin
    if (aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger = 32) then
    begin
      if aspPotokShemes.Locate('ik_decompose_type', 2, [loPartialKey]) then
        aspContentPlanNagr.FieldByName('ik_shema').Value:= aspPotokShemes.FieldByName('ik_shema').Value;
    end
    else
    begin
      if aspContentPlanNagr.Tag = 1 then
      begin
          if adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger, [loPartialKey]) then
            if aspPotokShemes.Locate('ik_decompose_type', adsNormOfTimeForPractice.FieldByName('ik_default_decompose_type').AsString, [loPartialKey]) then
              aspContentPlanNagr.FieldByName('ik_shema').Value:= aspPotokShemes.FieldByName('ik_shema').Value;
      end
      else
        if adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger, aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
          if aspPotokShemes.Locate('ik_decompose_type', adsNormOfTime.FieldByName('ik_default_decompose_type').AsString, [loPartialKey]) then
            aspContentPlanNagr.FieldByName('ik_shema').Value:= aspPotokShemes.FieldByName('ik_shema').Value;
    end;
  end;

  // загрузим количество членов комиссии, используемое по умолчанию
  if (aspContentPlanNagr.FieldByName('i_commission_count').Value = NULL) and
    (aspContentPlanNagr.FieldByName('ik_vid_nagruzki').Value <> NULL) then
  begin
    if (aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger = 32) then
      aspContentPlanNagr.FieldByName('i_commission_count').Value:= 1
    else
    begin
      if aspContentPlanNagr.Tag = 1 then
      begin
          if adsNormOfTimeForPractice.Locate('ik_vid_nagruzki', aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger, [loPartialKey]) then
          aspContentPlanNagr.FieldByName('i_commission_count').Value:= adsNormOfTimeForPractice.FieldByName('i_default_commission_count').Value
      end
      else
        if adsNormOfTime.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([aspContentPlanNagr.FieldByName('ik_vid_zanyat').AsInteger, aspContentPlanNagr.FieldByName('ik_vid_nagruzki').AsInteger]), [loPartialKey]) then
          aspContentPlanNagr.FieldByName('i_commission_count').Value:= adsNormOfTime.FieldByName('i_default_commission_count').Value;
    end;
  end;
end;

function Tdm.CalcZaniatHour(aVidSZan: string; PlanStud, CurStud: integer;
  PlanHours, CurHours: double): double;
var tempDS: TADODataSet;
begin
  tempDS:= TADODataSet.Create(nil);
  tempDS.Connection:= DBConnect;
  tempDS.CommandText := 'select ik_type_vz from vid_zaniat where iK_vid_zanyat='+aVidSZan;
  tempDS.Open;
  if (tempDS.FieldByName('ik_type_vz').AsInteger<>3)and(aVidSZan<>'32')and(aVidSZan<>'7') then           // не аудиторные
     Result := RoundTo(PlanHours*CurStud/PlanStud,-2)
        else Result := CurHours;
  tempDS.Close;
  tempDS.Free;
end;

procedure Tdm.AddSubscriber(Subscriber: IDBActionSubscriber);
begin
//  Subscriber._AddRef;
  FDBSubscriberList.Add(Subscriber);
end;

procedure Tdm.adospGetRaspAfterScroll(DataSet: TDataSet);
var
  str:string;
begin
//загружаем списки закрепленных кабинетов
  dm.adospAbitGetRaspKab.Close;
  dm.adospAbitGetRaspKab.Parameters.ParamByName('@id_rasp').Value:=adospGetRaspid_rasp.Value;
  dm.adospAbitGetRaspKab.Open;

  dmAbiturientOtchety.adospAbitRaspKab.Close;
  dmAbiturientOtchety.adospAbitRaspKab.Parameters.ParamByName('@id_rasp').Value:=adospGetRaspid_rasp.Value;
  dmAbiturientOtchety.adospAbitRaspKab.Open;

//загружаем список абитуриентов
  dm.adospAbitGetSpisok.Close;
  str:='WHERE';
  if (adospGetRaspik_disc.AsString='') or (adospGetRaspik_sdach.AsString='') then
    dm.adospAbitGetSpisok.SQL.Strings[1]:='WHERE ik_disc IS NULL'
  else
  begin
    dm.adospAbitGetSpisok.SQL.Strings[1]:='WHERE ik_disc='+adospGetRaspik_disc.AsString+' and  ik_sdach='+
      adospGetRaspik_sdach.AsString+' and (id_rasp IS NULL OR id_rasp='+adospGetRaspid_rasp.AsString+')';
  end;
  dm.adospAbitGetSpisok.Open;
end;

{ TReportSending }

end.
