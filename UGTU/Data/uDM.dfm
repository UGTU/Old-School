object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 1002
  Width = 1149
  object DBConnect: TADOConnection
    CommandTimeout = 300
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=developer;Initial Catalog=UGTU_ACTTEST;Data Sou' +
      'rce=ugtudb.ugtu.net;Use Procedure for Prepare=1;Auto Translate=T' +
      'rue;Packet Size=4096;Workstation ID=LAB-6;Use Encryption for Dat' +
      'a=False;Tag with column collation when possible=False;'
    IsolationLevel = ilReadUncommitted
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = DBConnectAfterConnect
    OnExecuteComplete = DBConnectExecuteComplete
    OnWillExecute = DBConnectWillExecute
    Left = 32
    Top = 128
  end
  object dsSelVedEkz: TDataSource
    DataSet = adospWriteVer
    Left = 400
    Top = 56
  end
  object adospSelVedEkz: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelVedForExam;1'
    Parameters = <>
    Left = 400
    Top = 24
    object adospSelVedEkznCode: TIntegerField
      FieldName = 'nCode'
    end
    object adospSelVedEkzStudName: TStringField
      FieldName = 'StudName'
      Size = 200
    end
    object adospSelVedEkzNn_zach: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object adospSelVedEkzKatZach: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object adospSelVedEkzik_zach: TIntegerField
      FieldName = 'ik_zach'
    end
    object adospSelVedEkzdopusc: TStringField
      DisplayWidth = 10
      FieldName = 'dopusc'
      ReadOnly = True
      Size = 10
    end
    object adospSelVedEkzzCosenca: TIntegerField
      FieldName = 'zCosenca'
      ReadOnly = True
    end
    object adospSelVedEkzeCosenca: TIntegerField
      FieldName = 'eCosenca'
    end
    object adospSelVedEkznameOsenca: TStringField
      FieldName = 'nameOsenca'
      Size = 10
    end
    object adospSelVedEkzNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
    object adospSelVedEkznameZOsenca: TStringField
      FieldName = 'nameZOsenca'
      Size = 10
    end
  end
  object adodsVidExam: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    Filter = 'ik_vid_exam<>0'
    Filtered = True
    CommandText = 'Vid_exam'
    CommandType = cmdTable
    Parameters = <>
    Left = 736
    Top = 560
  end
  object dsVidExam: TDataSource
    DataSet = adodsVidExam
    Left = 784
    Top = 560
  end
  object adotFilter2: TADOTable
    CacheSize = 15
    Connection = DBConnect
    Filtered = True
    LockType = ltBatchOptimistic
    TableName = 'kafedra'
    Left = 96
    Top = 856
    object adotFilter2ik_kaf: TAutoIncField
      FieldName = 'ik_kaf'
      ReadOnly = True
    end
    object adotFilter2ik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adotFilter2cname_kaf: TStringField
      FieldName = 'cname_kaf'
      Size = 100
    end
    object adotFilter2cshort_name_kaf: TStringField
      FieldName = 'cshort_name_kaf'
      Size = 15
    end
    object adotFilter2kolvo: TFloatField
      FieldName = 'kolvo'
    end
  end
  object adodsUsers: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from sysusers'
    Parameters = <>
    Left = 32
    Top = 888
  end
  object adotFilter1: TADOTable
    CacheSize = 15
    Connection = DBConnect
    LockType = ltBatchOptimistic
    TableName = 'Fac'
    Left = 96
    Top = 904
  end
  object adotElemUsers: TADOTable
    CacheSize = 15
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = adotElemUsersBeforePost
    AfterScroll = adotElemUsersAfterScroll
    TableName = 'Relation_VisElem_User'
    Left = 256
    Top = 864
    object adotElemUsersik_Element: TIntegerField
      FieldName = 'ik_Element'
      Visible = False
    end
    object adotElemUsersuid: TIntegerField
      FieldName = 'uid'
      Visible = False
    end
    object adotElemUsersik_filter1: TIntegerField
      FieldName = 'ik_filter1'
      Visible = False
    end
    object adotElemUsersik_filter2: TIntegerField
      FieldName = 'ik_filter2'
      Visible = False
    end
    object adotElemUsersuser: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'user'
      LookupDataSet = adodsUsers
      LookupKeyFields = 'uid'
      LookupResultField = 'name'
      KeyFields = 'uid'
      Size = 128
      Lookup = True
    end
    object adotElemUsersfilter1: TStringField
      DisplayLabel = #1060#1080#1083#1100#1090#1088' 1'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'filter1'
      LookupDataSet = adotFilter1
      LookupKeyFields = 'Ik_fac'
      LookupResultField = 'Cname_fac'
      KeyFields = 'ik_filter1'
      OnChange = adotElemUsersfilter1Change
      Size = 50
      Lookup = True
    end
    object adotElemUsersfilter2: TStringField
      DisplayLabel = #1060#1080#1083#1100#1090#1088' 2'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'filter2'
      LookupDataSet = adotFilter2
      LookupKeyFields = 'ik_kaf'
      LookupResultField = 'cname_kaf'
      KeyFields = 'ik_filter2'
      LookupCache = True
      Size = 50
      Lookup = True
    end
  end
  object dsElemUsers: TDataSource
    DataSet = adotElemUsers
    Left = 256
    Top = 920
  end
  object dsElement: TDataSource
    DataSet = adotElement
    Left = 184
    Top = 888
  end
  object adotElement: TADOTable
    CacheSize = 15
    Connection = DBConnect
    TableName = 'VisElements'
    Left = 192
    Top = 856
  end
  object dsSostZach: TDataSource
    DataSet = adotblSostZach
    Left = 880
    Top = 496
  end
  object adotblSostZach: TADOTable
    Connection = DBConnect
    CursorType = ctStatic
    TableName = 'ABIT_sost_zach'
    Left = 880
    Top = 464
  end
  object dsEdtPost: TDataSource
    DataSet = adospEdtPost
    Left = 1088
    Top = 496
  end
  object adospEdtPost: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'ABIT_edit_postup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@RegNomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Realy_postup'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1088
    Top = 440
  end
  object adospWriteVer: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'VERSION_UpdateLastRegistredVersion;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@majorVersion'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@minorVersion'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@release'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@build'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 328
    Top = 856
  end
  object dsWriteVer: TDataSource
    DataSet = adospWriteVer
    Left = 336
    Top = 896
  end
  object adodsNabor: TADODataSet
    Connection = DBConnect
    CommandText = 'TREE_ABIT_Specialties'
    CommandType = cmdTable
    Parameters = <>
    Left = 752
    Top = 384
    object adodsNaborik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
    end
    object adodsNaborik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adodsNaborNNyear: TIntegerField
      FieldName = 'NNyear'
    end
    object adodsNaborYearObuch: TIntegerField
      FieldName = 'YearObuch'
    end
    object adodsNaborik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adodsNaborCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 80
    end
    object adodsNaborCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object adodsNaborNNrecord: TIntegerField
      FieldName = 'NNrecord'
    end
    object adodsNaborCshort_name_fac: TStringField
      FieldName = 'Cshort_name_fac'
    end
    object adodsNaborName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 103
    end
  end
  object dsNabor: TDataSource
    DataSet = adodsNabor
    Left = 744
    Top = 408
  end
  object qContentUchPlan: TADOQuery
    Connection = DBConnect
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 1064
    Top = 304
  end
  object adsSemester: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From Semester Order By n_sem'
    Parameters = <>
    Left = 744
    Top = 304
  end
  object aspGetDiscModel: TADOStoredProc
    Active = True
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDisciplines_4filters;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1620
      end
      item
        Name = '@ik_ckl_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 11
      end
      item
        Name = '@ik_grp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 9
      end
      item
        Name = '@ik_pdgrp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 3
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_zan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_grup'
        DataType = ftInteger
        Size = 1
        Value = 0
      end>
    Left = 648
    Top = 296
    object aspGetDiscModelik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object aspGetDiscModelik_grp_disc: TIntegerField
      FieldName = 'ik_grp_disc'
      Visible = False
    end
    object aspGetDiscModelik_ckl_disc: TIntegerField
      FieldName = 'ik_ckl_disc'
      Visible = False
    end
    object aspGetDiscModelcname_ckl_disc1: TStringField
      FieldName = 'cname_ckl_disc1'
      Visible = False
      Size = 15
    end
    object aspGetDiscModelik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
      Visible = False
    end
    object aspGetDiscModeliHour_gos: TIntegerField
      FieldName = 'iHour_gos'
      Visible = False
    end
    object aspGetDiscModelik_disc_uch_plan: TAutoIncField
      FieldName = 'ik_disc_uch_plan'
      ReadOnly = True
      Visible = False
    end
    object aspGetDiscModelik_default_kaf: TIntegerField
      FieldName = 'ik_default_kaf'
      Visible = False
    end
    object aspGetDiscModelcName_disc: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
      DisplayWidth = 150
      FieldName = 'cName_disc'
      Size = 100
    end
    object aspGetDiscModeliIndivid: TIntegerField
      FieldName = 'iIndivid'
      Visible = False
    end
    object aspGetDiscModellPract: TBooleanField
      FieldName = 'lPract'
      Visible = False
    end
    object aspGetDiscModelik_type_disc: TWordField
      FieldName = 'ik_type_disc'
      Visible = False
    end
    object aspGetDiscModelViborGroup: TIntegerField
      FieldName = 'ViborGroup'
      Visible = False
    end
    object aspGetDiscModeliK_pdgrp_disc: TIntegerField
      FieldName = 'iK_pdgrp_disc'
      Visible = False
    end
    object aspGetDiscModeliK_spclz: TIntegerField
      FieldName = 'iK_spclz'
      Visible = False
    end
    object aspGetDiscModelcName_spclz_short: TStringField
      DisplayLabel = #1055#1088#1086#1092#1080#1083#1100
      DisplayWidth = 40
      FieldName = 'cName_spclz_short'
    end
    object aspGetDiscModelShowToUser: TStringField
      FieldName = 'ShowToUser'
      Visible = False
    end
    object aspGetDiscModelik_ed_izm: TIntegerField
      FieldName = 'ik_ed_izm'
      Visible = False
    end
    object aspGetDiscModelik_podckl: TIntegerField
      FieldName = 'ik_podckl'
    end
    object aspGetDiscModeluchet: TBooleanField
      FieldName = 'uchet'
    end
    object aspGetDiscModeliK_disc1: TIntegerField
      FieldName = 'iK_disc1'
    end
    object aspGetDiscModelcshortname: TStringField
      FieldName = 'cshortname'
      Size = 40
    end
    object aspGetDiscModeliHour_Audit: TIntegerField
      FieldName = 'iHour_Audit'
    end
  end
  object adsVidNagruzki: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From vid_nagruzki'
    Parameters = <>
    Left = 680
    Top = 128
    object adsVidNagruzkiik_vid_nagruzki: TAutoIncField
      FieldName = 'ik_vid_nagruzki'
      ReadOnly = True
    end
    object adsVidNagruzkiCname_vid_nagruzki: TStringField
      FieldName = 'Cname_vid_nagruzki'
      Size = 50
    end
  end
  object adsVidZanyat: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From vid_zaniat'
    Parameters = <>
    Left = 680
    Top = 176
    object adsVidZanyatiK_vid_zanyat: TAutoIncField
      FieldName = 'iK_vid_zanyat'
      ReadOnly = True
    end
    object adsVidZanyatcName_vid_zanyat: TStringField
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adsVidZanyatbit_must_be_in_uch_plan: TBooleanField
      FieldName = 'bit_must_be_in_uch_plan'
    end
  end
  object dsAbitDisc: TDataSource
    DataSet = adodsAbitDisc
    Left = 640
    Top = 512
  end
  object adodsAbitDisc: TADODataSet
    Connection = DBConnect
    CommandText = 'ABIT_Disc'
    CommandType = cmdTable
    Parameters = <>
    Left = 640
    Top = 464
    object adodsAbitDiscik_disc: TAutoIncField
      FieldName = 'ik_disc'
      ReadOnly = True
    end
    object adodsAbitDiscname_disc: TStringField
      FieldName = #1089'name_disc'
      FixedChar = True
      Size = 50
    end
  end
  object adodsVidSdachi: TADODataSet
    Connection = DBConnect
    CommandText = 'ABIT_VidSdachi'
    CommandType = cmdTable
    Parameters = <>
    Left = 856
    Top = 384
    object adodsVidSdachiik_sdach: TAutoIncField
      FieldName = 'ik_sdach'
      ReadOnly = True
    end
    object adodsVidSdachicname_sdach: TStringField
      FieldName = 'cname_sdach'
      FixedChar = True
      Size = 50
    end
    object adodsVidSdachicshort_sdach: TStringField
      FieldName = 'cshort_sdach'
      FixedChar = True
      Size = 50
    end
  end
  object dsVidSdachi: TDataSource
    DataSet = adodsVidSdachi
    Left = 856
    Top = 416
  end
  object adodsRasp: TADODataSet
    Connection = DBConnect
    CommandText = 'ABIT_Raspisanie'
    CommandType = cmdTable
    Parameters = <>
    Left = 1064
    Top = 696
    object adodsRaspid_rasp: TAutoIncField
      FieldName = 'id_rasp'
      ReadOnly = True
    end
    object adodsRaspdate_of: TDateTimeField
      FieldName = 'date_of'
    end
    object adodsRaspFIO_prepodav: TStringField
      FieldName = 'FIO_prepodav'
      FixedChar = True
      Size = 500
    end
    object adodsRaspTimeBegin: TStringField
      FieldName = 'TimeBegin'
      FixedChar = True
      Size = 5
    end
    object adodsRaspTimeEnd: TStringField
      FieldName = 'TimeEnd'
      FixedChar = True
      Size = 5
    end
    object adodsRaspik_sdach: TIntegerField
      FieldName = 'ik_sdach'
    end
    object adodsRaspik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adodsRaspik_typ_mer: TIntegerField
      FieldName = 'ik_typ_mer'
    end
  end
  object dsRasp: TDataSource
    DataSet = adodsRasp
    Left = 1056
    Top = 744
  end
  object adodsPostupView: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'Abit_Postup_view'
    CommandType = cmdTable
    Parameters = <>
    Left = 1008
    Top = 544
    object adodsPostupViewRegNomer: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'RegNomer'
    end
    object adodsPostupViewNN_abit: TIntegerField
      FieldName = 'NN_abit'
      Visible = False
    end
    object adodsPostupViewnCode: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsPostupViewNNrecord: TIntegerField
      FieldName = 'NNrecord'
      Visible = False
    end
    object adodsPostupViewik_zach: TIntegerField
      FieldName = 'ik_zach'
      Visible = False
    end
    object adodsPostupViewik_kat_zach: TIntegerField
      FieldName = 'ik_kat_zach'
      Visible = False
    end
    object adodsPostupViewdd_pod_zayav: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'dd_pod_zayav'
    end
    object adodsPostupViewcname_zach: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'cname_zach'
      FixedChar = True
      Size = 30
    end
    object adodsPostupViewCname_kat_zach: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object adodsPostupViewCshort_name_fac: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      FieldName = 'Cshort_name_fac'
    end
    object adodsPostupViewCname_spec: TStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'Cname_spec'
      Size = 80
    end
    object adodsPostupViewNaborName: TStringField
      FieldName = 'NaborName'
      ReadOnly = True
      Visible = False
      Size = 103
    end
    object adodsPostupViewRealy_postup: TBooleanField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086
      FieldName = 'Realy_postup'
      ReadOnly = True
    end
    object adodsPostupViewik_type_zach: TIntegerField
      FieldName = 'ik_type_zach'
      Visible = False
    end
    object adodsPostupViewIsMain: TBooleanField
      DisplayLabel = #1055#1077#1088#1074#1080#1095#1085#1086#1077
      FieldName = 'IsMain'
      ReadOnly = True
    end
    object adodsPostupViewSchoolAverMark: TFloatField
      FieldName = 'SchoolAverMark'
    end
    object adodsPostupViewClastname: TStringField
      FieldName = 'Clastname'
      Size = 30
    end
    object adodsPostupViewCfirstname: TStringField
      FieldName = 'Cfirstname'
      Size = 30
    end
    object adodsPostupViewCotch: TStringField
      FieldName = 'Cotch'
      Size = 30
    end
    object adodsPostupViewNNyear: TIntegerField
      FieldName = 'NNyear'
    end
    object adodsPostupViewCname_form_ed: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
  end
  object dsPostupView: TDataSource
    DataSet = adodsPostupView
    Left = 1088
    Top = 552
  end
  object adotbltypeTema: TADOTable
    Connection = DBConnect
    CursorType = ctStatic
    TableName = 'typeTema'
    Left = 40
    Top = 240
  end
  object dstypeTema: TDataSource
    DataSet = adotbltypeTema
    Left = 40
    Top = 288
  end
  object adodsAbitExamView: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'ABit_Exam_View'
    CommandType = cmdTable
    Parameters = <>
    Left = 648
    Top = 384
    object adodsAbitExamViewname_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = #1089'name_disc'
      FixedChar = True
      Size = 50
    end
    object adodsAbitExamViewcname_sdach: TStringField
      DisplayLabel = #1042#1080#1076' '#1089#1076#1072#1095#1080
      FieldName = 'cname_sdach'
      FixedChar = True
      Size = 50
    end
    object adodsAbitExamViewcosenka: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'cosenka'
    end
    object adodsAbitExamViewNNvedom: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'NNvedom'
      FixedChar = True
    end
    object adodsAbitExamViewnCode: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsAbitExamViewik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adodsAbitExamViewik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object adodsAbitExamViewid_rasp_kab: TIntegerField
      FieldName = 'id_rasp_kab'
      Visible = False
    end
    object adodsAbitExamViewNN_abit: TIntegerField
      FieldName = 'NN_abit'
      Visible = False
    end
    object adodsAbitExamViewid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
  end
  object dsAbitExamView: TDataSource
    DataSet = adodsAbitExamView
    Left = 648
    Top = 416
  end
  object adodsStudSearch: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Tree_stud_search Order by nn_zach'
    Parameters = <>
    Left = 200
    Top = 24
  end
  object dsStudSearch: TDataSource
    DataSet = adodsStudSearch
    Left = 200
    Top = 64
  end
  object dsMetodist: TDataSource
    DataSet = adospMetodists
    Left = 752
    Top = 664
  end
  object adospMetodists: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'abit_SelMetodists;1'
    Parameters = <>
    Left = 752
    Top = 632
    object adospMetodistsik_metodist: TAutoIncField
      FieldName = 'ik_metodist'
      ReadOnly = True
    end
    object adospMetodistsNameMetodists: TStringField
      FieldName = 'NameMetodists'
      ReadOnly = True
      Size = 152
    end
  end
  object adoqFilial: TADOQuery
    Connection = DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ABIT_filial')
    Left = 744
    Top = 472
  end
  object dsFilial: TDataSource
    DataSet = adoqFilial
    Left = 744
    Top = 504
  end
  object adoqYears: TADOQuery
    Connection = DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ABIT_Years')
    Left = 816
    Top = 472
  end
  object dsYears: TDataSource
    DataSet = adoqYears
    Left = 816
    Top = 504
  end
  object dsVer: TDataSource
    Left = 384
    Top = 888
  end
  object adospGetRasp: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    AfterScroll = adospGetRaspAfterScroll
    ProcedureName = 'ABIT_Get_Raspisanie_AllInfo;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@date_of'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38718d
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 920
    Top = 696
    object adospGetRaspdate_of: TDateTimeField
      FieldName = 'date_of'
      Visible = False
    end
    object adospGetRaspcname_mer: TStringField
      DisplayLabel = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 50
      FieldName = 'cname_mer'
      ReadOnly = True
      Size = 100
    end
    object adospGetRaspdisc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = 'disc'
      ReadOnly = True
      Size = 50
    end
    object adospGetRaspcname_sdach: TStringField
      DisplayLabel = #1042#1080#1076' '#1089#1076#1072#1095#1080
      FieldName = 'cname_sdach'
      ReadOnly = True
      Size = 50
    end
    object adospGetRaspid_rasp: TAutoIncField
      FieldName = 'id_rasp'
      ReadOnly = True
      Visible = False
    end
    object adospGetRaspik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object adospGetRaspik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adospGetRaspik_typ_mer: TIntegerField
      FieldName = 'ik_typ_mer'
      Visible = False
    end
    object adospGetRaspTimeBegin: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
      FieldName = 'TimeBegin'
      DisplayFormat = 'HH:MM'
    end
    object adospGetRaspTimeEnd: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'TimeEnd'
      DisplayFormat = 'HH:MM'
    end
  end
  object dsGetRasp: TDataSource
    DataSet = adospGetRasp
    Left = 920
    Top = 784
  end
  object adospAbitGetSpisok: TADOQuery
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ABIT_SpisokOfExam'
      ''
      ''
      'ORDER BY  StudName, ik_spec_fac, ik_fac')
    Left = 632
    Top = 640
    object adospAbitGetSpisokid_VstEx: TIntegerField
      FieldName = 'id_VstEx'
      Visible = False
    end
    object adospAbitGetSpisokid_rasp: TIntegerField
      FieldName = 'id_rasp'
      Visible = False
    end
    object adospAbitGetSpisokid_rasp_kab: TIntegerField
      FieldName = 'id_rasp_kab'
      Visible = False
    end
    object adospAbitGetSpisokik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adospAbitGetSpisokik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object adospAbitGetSpisokik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
    object adospAbitGetSpisokik_fac: TIntegerField
      FieldName = 'ik_fac'
      Visible = False
    end
    object adospAbitGetSpisoknn_abit: TIntegerField
      FieldName = 'nn_abit'
      Visible = False
    end
    object adospAbitGetSpisoknnvedom: TStringField
      DisplayLabel = #8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'/'#1089#1077#1088#1090'.'
      FieldName = 'nnvedom'
      FixedChar = True
    end
    object adospAbitGetSpisokStudName: TStringField
      DisplayLabel = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      FieldName = 'StudName'
      ReadOnly = True
      Size = 92
    end
    object adospAbitGetSpisokcosenka: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'cosenka'
    end
    object adospAbitGetSpisokCname_room: TStringField
      DisplayLabel = #1040#1091#1076#1080#1090#1086#1088#1080#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Cname_room'
      LookupDataSet = adospAbitGetRaspKab
      LookupKeyFields = 'id'
      LookupResultField = 'Cname_room'
      KeyFields = 'id_rasp_kab'
      Size = 50
      Lookup = True
    end
  end
  object dsAbitGetSpisok: TDataSource
    DataSet = adospAbitGetSpisok
    Left = 624
    Top = 688
  end
  object adospAbitGetRaspKab: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_raspkab;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_rasp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 404
      end>
    Left = 752
    Top = 704
    object adospAbitGetRaspKabik_room: TAutoIncField
      FieldName = 'ik_room'
      ReadOnly = True
      Visible = False
    end
    object adospAbitGetRaspKabCname_room: TStringField
      DisplayLabel = #1040#1091#1076#1080#1090#1086#1088#1080#1103
      DisplayWidth = 20
      FieldName = 'Cname_room'
      ReadOnly = True
      Size = 50
    end
    object adospAbitGetRaspKabiSeatCount: TWordField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1090
      FieldName = 'iSeatCount'
    end
    object adospAbitGetRaspKabid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
  end
  object dsAbitGetRaspKab: TDataSource
    DataSet = adospAbitGetRaspKab
    Left = 752
    Top = 776
  end
  object adospAbitNotBusyKab: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_kab_isnotbusy;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_rasp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 404
      end>
    Left = 992
    Top = 696
    object adospAbitNotBusyKabik_room: TIntegerField
      FieldName = 'ik_room'
      ReadOnly = True
    end
    object adospAbitNotBusyKabCname_room: TStringField
      FieldName = 'Cname_room'
      ReadOnly = True
      Size = 50
    end
    object adospAbitNotBusyKabiSeatCount: TWordField
      FieldName = 'iSeatCount'
      ReadOnly = True
    end
    object adospAbitNotBusyKabid_Rassadka: TIntegerField
      FieldName = 'id_Rassadka'
      ReadOnly = True
    end
    object adospAbitNotBusyKabid_rasp: TIntegerField
      FieldName = 'id_rasp'
      ReadOnly = True
    end
  end
  object dsAbitNotBusyKab: TDataSource
    DataSet = adospAbitNotBusyKab
    Left = 1000
    Top = 800
  end
  object adospAbitKabMetodists: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_Rasp_kab_FIOMetodist;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_rasp_kab'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 61
      end>
    Left = 840
    Top = 696
    object adospAbitKabMetodistsid_rasp_kab: TIntegerField
      FieldName = 'id_rasp_kab'
      ReadOnly = True
    end
    object adospAbitKabMetodistsik_metodist: TIntegerField
      FieldName = 'ik_metodist'
      ReadOnly = True
    end
    object adospAbitKabMetodistsNameMetodists: TStringField
      FieldName = 'NameMetodists'
      ReadOnly = True
      Size = 152
    end
  end
  object dsAbitKabMetodists: TDataSource
    DataSet = adospAbitKabMetodists
    Left = 840
    Top = 760
  end
  object adospAbitUpdateKabMetodist: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_add_metodist_rassadka;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_rasp_kab'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_metodist'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 880
    Top = 616
    object DateTimeField3: TDateTimeField
      FieldName = 'date_of'
      Visible = False
    end
    object StringField33: TStringField
      DisplayLabel = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 50
      FieldName = 'cname_mer'
      ReadOnly = True
      Size = 100
    end
    object StringField34: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = 'disc'
      ReadOnly = True
      Size = 50
    end
    object StringField35: TStringField
      DisplayLabel = #1042#1080#1076' '#1089#1076#1072#1095#1080
      FieldName = 'cname_sdach'
      ReadOnly = True
      Size = 50
    end
    object AutoIncField10: TAutoIncField
      FieldName = 'id_rasp'
      ReadOnly = True
      Visible = False
    end
    object IntegerField24: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object IntegerField25: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object IntegerField26: TIntegerField
      FieldName = 'ik_typ_mer'
      Visible = False
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
      FieldName = 'TimeBegin'
      DisplayFormat = 'HH:MM'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'TimeEnd'
      DisplayFormat = 'HH:MM'
    end
  end
  object dsAbitUpdateKabMetodist: TDataSource
    DataSet = adospAbitUpdateKabMetodist
    Left = 880
    Top = 656
  end
  object adotEgeOtchet: TADOTable
    Connection = DBConnect
    CursorType = ctStatic
    TableName = 'EGE_view'
    Left = 624
    Top = 800
    object adotEgeOtchetRegNomer: TIntegerField
      FieldName = 'RegNomer'
    end
    object adotEgeOtchetClastname: TStringField
      FieldName = 'Clastname'
      Size = 30
    end
    object adotEgeOtchetCfirstname: TStringField
      FieldName = 'Cfirstname'
      Size = 30
    end
    object adotEgeOtchetCotch: TStringField
      FieldName = 'Cotch'
      Size = 30
    end
    object adotEgeOtchetDd_birth: TDateTimeField
      FieldName = 'Dd_birth'
    end
    object adotEgeOtchetCd_seria: TStringField
      FieldName = 'Cd_seria'
      Size = 10
    end
    object adotEgeOtchetNp_number: TStringField
      FieldName = 'Np_number'
      Size = 15
    end
    object adotEgeOtchetcAttest: TStringField
      FieldName = 'cAttest'
      ReadOnly = True
      Size = 26
    end
    object adotEgeOtchetlSex: TBooleanField
      FieldName = 'lSex'
    end
    object adotEgeOtchetMath: TIntegerField
      FieldName = 'Math'
      ReadOnly = True
    end
    object adotEgeOtchetRuss: TIntegerField
      FieldName = 'Russ'
      ReadOnly = True
    end
    object adotEgeOtchetPhis: TIntegerField
      FieldName = 'Phis'
      ReadOnly = True
    end
    object adotEgeOtchetBiol: TIntegerField
      FieldName = 'Biol'
      ReadOnly = True
    end
    object adotEgeOtchetObch: TIntegerField
      FieldName = 'Obch'
      ReadOnly = True
    end
    object adotEgeOtchetChem: TIntegerField
      FieldName = 'Chem'
      ReadOnly = True
    end
    object adotEgeOtchetHist: TIntegerField
      FieldName = 'Hist'
      ReadOnly = True
    end
    object adotEgeOtchetGeog: TIntegerField
      FieldName = 'Geog'
      ReadOnly = True
    end
    object adotEgeOtchetLitr: TIntegerField
      FieldName = 'Litr'
      ReadOnly = True
    end
  end
  object adoqAbitItogiCount: TADOQuery
    Connection = DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from AbitGetAllStatisticForItogi'
      '(2007)'
      'ORDER BY Cname_fac, Cname_spec')
    Left = 624
    Top = 856
    object adoqAbitItogiCountIk_fac: TIntegerField
      FieldName = 'Ik_fac'
    end
    object adoqAbitItogiCountik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
    end
    object adoqAbitItogiCountCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 50
    end
    object adoqAbitItogiCountCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object adoqAbitItogiCountObFCount: TIntegerField
      FieldName = 'ObFCount'
    end
    object adoqAbitItogiCountObPlCount: TIntegerField
      FieldName = 'ObPlCount'
    end
    object adoqAbitItogiCountZCPFCount: TIntegerField
      FieldName = 'ZCPFCount'
    end
    object adoqAbitItogiCountZCPPlCount: TIntegerField
      FieldName = 'ZCPPlCount'
    end
    object adoqAbitItogiCountContrCount: TIntegerField
      FieldName = 'ContrCount'
    end
    object adoqAbitItogiCountSrBall: TIntegerField
      FieldName = 'SrBall'
    end
    object adoqAbitItogiCountMedalCount: TIntegerField
      FieldName = 'MedalCount'
    end
  end
  object adoqAbitSpecPermisions: TADOQuery
    Connection = DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.GetSpecAbitPermissionsFromRelTable() ')
    Left = 336
    Top = 816
    object adoqAbitSpecPermisionsik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
    end
  end
  object adospAbitProhBall: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'ABIT_Get_ProhBallForZachislenie;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NNrecord'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 19
      end
      item
        Name = '@ik_type_kat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@Ik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 968
    Top = 928
    object adospAbitProhBallProhBall: TIntegerField
      FieldName = 'ProhBall'
      ReadOnly = True
    end
  end
  object dsTypeKatZach: TDataSource
    DataSet = adodsTypeKatZach
    Left = 976
    Top = 488
  end
  object adodsTypeKatZach: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'TypeKatZach'
    CommandType = cmdTable
    Parameters = <>
    Left = 984
    Top = 432
  end
  object adodsVidOtch: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'select iK_vid_zanyat, cName_vid_zanyat from vid_zaniat'#13#10'where ik' +
      'TypeZanyat in'#13#10'(SELECT ikTypeZanyat  FROM'#13#10'TypeZanyat '#13#10'where bi' +
      'tOtchetnost=1)'#13#10
    Parameters = <>
    Left = 280
    Top = 392
  end
  object dsVidOtch: TDataSource
    DataSet = adodsVidOtch
    Left = 280
    Top = 440
  end
  object adsDecomposeType: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Shema_decompose'
    Parameters = <>
    Left = 1056
    Top = 16
    object adsDecomposeTypeik_decompose_type: TWordField
      FieldName = 'ik_decompose_type'
      ReadOnly = True
    end
    object adsDecomposeTypecName_decompose: TStringField
      FieldName = 'cName_decompose'
      Size = 30
    end
  end
  object adsKafedra: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'Select * From kafedra Order By cname_kaf'
    Parameters = <>
    Left = 824
    Top = 304
  end
  object adsTeacherTakeNagr: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT DISTINCt Prepod_plan_nagr.ik_content_plan_nagr, Content_p' +
      'lan_nagr.ik_vid_zanyat, cName_vid_zanyat,'#13#10'Prepod_plan_nagr.ik_v' +
      'id_nagruzki, Cname_vid_nagruzki, f_hour_per_unit as take_hour FR' +
      'OM'#13#10'Content_plan_nagr INNER JOIN Prepod_plan_nagr ON'#13#10'Content_pl' +
      'an_nagr.ik_content_plan_nagr = Prepod_plan_nagr.ik_content_plan_' +
      'nagr'#13#10'INNER JOIN vid_zaniat ON Content_plan_nagr.ik_vid_zanyat =' +
      ' vid_zaniat.ik_vid_zanyat'#13#10'INNER JOIN Vid_nagruzki ON Prepod_pla' +
      'n_nagr.ik_vid_nagruzki = Vid_nagruzki.ik_vid_nagruzki'
    Parameters = <>
    Left = 800
    Top = 216
    object adsTeacherTakeNagrik_content_plan_nagr: TIntegerField
      FieldName = 'ik_content_plan_nagr'
      Visible = False
    end
    object adsTeacherTakeNagrik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object adsTeacherTakeNagrcName_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adsTeacherTakeNagrik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object adsTeacherTakeNagrCname_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'Cname_vid_nagruzki'
      Size = 50
    end
    object adsTeacherTakeNagrtake_hour: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1095#1072#1089#1086#1074
      DisplayWidth = 30
      FieldName = 'take_hour'
    end
  end
  object adodsAbout: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'AboutParameters'
    CommandType = cmdTable
    Parameters = <>
    Left = 72
    Top = 16
  end
  object aspTakeFactNagr: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetTakeFactNagr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@i_type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 3
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_potok'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@fact_ik_id_prepod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@plan_ik_id_prepod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_nagruzki'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 920
    Top = 224
    object aspTakeFactNagrik_content_plan_nagr: TIntegerField
      FieldName = 'ik_content_plan_nagr'
      Visible = False
    end
    object aspTakeFactNagrik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object aspTakeFactNagrcName_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object aspTakeFactNagriK_type_vz: TIntegerField
      FieldName = 'iK_type_vz'
      Visible = False
    end
    object aspTakeFactNagrik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object aspTakeFactNagrCname_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'Cname_vid_nagruzki'
      Size = 50
    end
    object aspTakeFactNagrf_hour_per_unit: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074
      DisplayWidth = 30
      FieldName = 'f_hour_per_unit'
    end
    object aspTakeFactNagrikTypeZanyat: TIntegerField
      FieldName = 'ikTypeZanyat'
      Visible = False
    end
  end
  object aspTakeFactVZNagr: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetTakeFactNagr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@i_type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 2
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_potok'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@fact_ik_id_prepod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@plan_ik_id_prepod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_nagruzki'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 1024
    Top = 224
    object aspTakeFactVZNagrik_calc_unit: TIntegerField
      FieldName = 'ik_calc_unit'
      Visible = False
    end
    object aspTakeFactVZNagrcName_calc_unit: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072
      FieldName = 'cName_calc_unit'
      Size = 30
    end
    object aspTakeFactVZNagrby_plan_number: TWordField
      DisplayLabel = #8470' '#1088#1072#1073#1086#1090#1099
      FieldName = 'by_plan_number'
    end
    object aspTakeFactVZNagri_student_count: TIntegerField
      FieldName = 'i_student_count'
      Visible = False
    end
    object aspTakeFactVZNagrik_prepod_plan: TIntegerField
      FieldName = 'ik_prepod_plan'
      Visible = False
    end
    object aspTakeFactVZNagrf_hour_per_unit: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074
      FieldName = 'f_hour_per_unit'
    end
    object aspTakeFactVZNagrfact_hour: TFloatField
      DisplayWidth = 30
      FieldName = 'fact_hour'
      Visible = False
    end
    object aspTakeFactVZNagrik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
      Visible = False
    end
    object aspTakeFactVZNagrbit_calc_students_only: TBooleanField
      FieldName = 'bit_calc_students_only'
      Visible = False
    end
  end
  object adodsTeachSearch: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from TREE_TeachSearch order by itab_n'
    Parameters = <>
    Left = 264
    Top = 24
  end
  object dsTeachSearch: TDataSource
    DataSet = adodsTeachSearch
    Left = 264
    Top = 64
  end
  object adsNormOfTime: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From Content_norma_of_time'
    Parameters = <>
    Left = 680
    Top = 72
    object adsNormOfTimeik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object adsNormOfTimename_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'name_vid_zanyat'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'cName_vid_zanyat'
      KeyFields = 'ik_vid_zanyat'
      Size = 50
      Lookup = True
    end
    object adsNormOfTimename_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'name_vid_nagruzki'
      LookupDataSet = adsVidNagruzki
      LookupKeyFields = 'ik_vid_nagruzki'
      LookupResultField = 'Cname_vid_nagruzki'
      KeyFields = 'ik_vid_nagruzki'
      Size = 50
      Lookup = True
    end
    object adsNormOfTimef_norm_per_student: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #1053#1057
      DisplayWidth = 6
      FieldName = 'f_norm_per_student'
    end
    object adsNormOfTimef_norm_per_ed: TFloatField
      DisplayLabel = #1053#1056#1045
      DisplayWidth = 6
      FieldName = 'f_norm_per_ed'
    end
    object adsNormOfTimeik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object adsNormOfTimeik_norm_of_time: TIntegerField
      FieldName = 'ik_norm_of_time'
      Visible = False
    end
    object adsNormOfTimeik_default_decompose_type: TWordField
      FieldName = 'ik_default_decompose_type'
      Visible = False
    end
    object adsNormOfTimecname_decompose_type: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'cname_decompose_type'
      LookupDataSet = adsDecomposeType
      LookupKeyFields = 'ik_decompose_type'
      LookupResultField = 'cName_decompose'
      KeyFields = 'ik_default_decompose_type'
      Size = 40
      Lookup = True
    end
    object adsNormOfTimemax_norm_per_student: TFloatField
      DisplayLabel = #1052#1072#1082#1089'. '#1053#1057
      DisplayWidth = 8
      FieldName = 'max_norm_per_student'
    end
    object adsNormOfTimemin_requed_student: TIntegerField
      DisplayLabel = #1052#1080#1085'. '#1082#1086#1085'.'
      DisplayWidth = 8
      FieldName = 'min_requed_student'
    end
    object adsNormOfTimef_norm_per_student_for_min: TFloatField
      DisplayLabel = #1053#1057' ('#1084#1080#1085'. '#1082#1086#1085'.)'
      FieldName = 'f_norm_per_student_for_min'
    end
    object adsNormOfTimef_norm_per_ed_for_min: TFloatField
      DisplayLabel = #1053#1056#1045' ('#1084#1080#1085'. '#1082#1086#1085'.)'
      FieldName = 'f_norm_per_ed_for_min'
    end
    object adsNormOfTimei_default_commission_count: TWordField
      DisplayLabel = #1057#1086#1089#1090#1072#1074' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'i_default_commission_count'
    end
  end
  object adsAllPlanNagr: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM temp_GetAllPlanNagr(0)'
    CommandTimeout = 100
    Parameters = <>
    Left = 680
    Top = 24
    object adsAllPlanNagrik_plan_nagr: TIntegerField
      FieldName = 'ik_plan_nagr'
      Visible = False
    end
    object adsAllPlanNagrik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adsAllPlanNagrcName_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 80
      FieldName = 'cName_disc'
      Size = 100
    end
    object adsAllPlanNagrik_potok: TIntegerField
      FieldName = 'ik_potok'
      Visible = False
    end
    object adsAllPlanNagrcName_potok: TStringField
      DisplayLabel = #1055#1086#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'cName_potok'
      Size = 50
    end
    object adsAllPlanNagrplan_hour: TFloatField
      DisplayLabel = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' '#1095#1072#1089#1086#1074
      DisplayWidth = 30
      FieldName = 'plan_hour'
    end
    object adsAllPlanNagrbusy_hour: TFloatField
      DisplayLabel = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1086' '#1095#1072#1089#1086#1074
      DisplayWidth = 30
      FieldName = 'busy_hour'
    end
    object adsAllPlanNagrn_sem: TIntegerField
      FieldName = 'n_sem'
      Visible = False
    end
    object adsAllPlanNagrik_type_disc: TWordField
      FieldName = 'ik_type_disc'
      Visible = False
    end
    object adsAllPlanNagrbit_calc_as_practice: TBooleanField
      FieldName = 'bit_calc_as_practice'
      Visible = False
    end
  end
  object adsSpecialities: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 
      'Select ik_spec_fac, (Cshort_spec + '#39' ('#1092#1072#1082#1091#1083#1100#1090#1077#1090': '#39' + Cshort_name' +
      '_fac + '#39')'#39') as full_name From Spec_stud INNER JOIN Relation_spec' +
      '_fac rsf ON Spec_stud.ik_spec = rsf.ik_spec INNER JOIN Fac ON rs' +
      'f.ik_fac = Fac.ik_fac ORDER BY Cshort_spec, Cshort_name_fac'
    Parameters = <>
    Left = 1016
    Top = 72
    object adsSpecialitiesik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adsSpecialitiesfull_name: TStringField
      FieldName = 'full_name'
      ReadOnly = True
      Size = 44
    end
  end
  object adsSemLengthExceptions: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM Semester_length_exception'
    Parameters = <>
    Left = 1016
    Top = 128
    object adsSemLengthExceptionsik_shedule: TIntegerField
      FieldName = 'ik_shedule'
      Visible = False
    end
    object adsSemLengthExceptionsik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
    object adsSemLengthExceptionsspec_fac_name: TStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'spec_fac_name'
      LookupDataSet = adsSpecialities
      LookupKeyFields = 'ik_spec_fac'
      LookupResultField = 'full_name'
      KeyFields = 'ik_spec_fac'
      Size = 30
      Lookup = True
    end
    object adsSemLengthExceptionscourse_number: TWordField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'course_number'
      MaxValue = 6
      MinValue = 1
    end
    object adsSemLengthExceptionsd_sem_start: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'd_sem_start'
    end
    object adsSemLengthExceptionsd_sem_end: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'd_sem_end'
    end
    object adsSemLengthExceptionsd_session_start: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1089#1077#1089#1089#1080#1080
      FieldName = 'd_session_start'
    end
    object adsSemLengthExceptionsd_session_end: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1089#1077#1089#1089#1080#1080
      FieldName = 'd_session_end'
    end
    object adsSemLengthExceptionsd_work_time_start: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1088#1072#1073'. '#1076#1085#1103
      FieldName = 'd_work_time_start'
    end
    object adsSemLengthExceptionsd_work_time_end: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1088#1072#1073'. '#1076#1085#1103
      FieldName = 'd_work_time_end'
    end
  end
  object adsWorkTypes: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM PrepodWorkType'
    Parameters = <>
    Left = 784
    Top = 136
    object adsWorkTypesik_work_type: TIntegerField
      FieldName = 'ik_work_type'
    end
    object adsWorkTypescName_work_type: TStringField
      FieldName = 'cName_work_type'
      Size = 50
    end
  end
  object adsDefenceFund: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Defence_fund'
    Parameters = <>
    Left = 888
    Top = 80
    object adsDefenceFundik_defence_fund: TWordField
      FieldName = 'ik_defence_fund'
    end
    object adsDefenceFundcName_defence_fund: TStringField
      FieldName = 'cName_defence_fund'
      Size = 30
    end
  end
  object adsCapacity: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM PrepodCapacity'
    Parameters = <>
    Left = 888
    Top = 136
    object adsCapacityik_capacity: TIntegerField
      FieldName = 'ik_capacity'
    end
    object adsCapacityCname_capacity: TStringField
      FieldName = 'Cname_capacity'
      Size = 50
    end
  end
  object tblVer: TADOTable
    Connection = DBConnect
    TableName = 'LastRegisteredVersion'
    Left = 384
    Top = 632
  end
  object adodsVer: TADODataSet
    Connection = DBConnect
    Parameters = <>
    Left = 384
    Top = 840
  end
  object adodsAdditionalSpec: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from AdditionalSpec'
    Parameters = <>
    Left = 800
    Top = 384
    object IntegerField1: TIntegerField
      FieldName = 'ik_spec_fac'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ik_fac'
    end
    object IntegerField3: TIntegerField
      FieldName = 'NNyear'
    end
    object IntegerField4: TIntegerField
      FieldName = 'YearObuch'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ik_spec'
    end
    object StringField1: TStringField
      FieldName = 'Cname_spec'
      Size = 80
    end
    object StringField2: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object IntegerField6: TIntegerField
      FieldName = 'NNrecord'
    end
    object StringField3: TStringField
      FieldName = 'Cshort_name_fac'
    end
    object StringField4: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 103
    end
  end
  object dsAdditionalSpec: TDataSource
    DataSet = adodsAdditionalSpec
    Left = 792
    Top = 408
  end
  object adsNormOfTimeForPractice: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'Select * From Content_norm_of_time_practice'
    Parameters = <>
    Left = 576
    Top = 40
    object adsNormOfTimeForPracticename_disc: TStringField
      DisplayLabel = #1055#1088#1072#1082#1090#1080#1082#1072'/'#1088#1072#1073#1086#1090#1072
      FieldKind = fkLookup
      FieldName = 'name_disc'
      LookupDataSet = adsPracticeListForNormOfTime
      LookupKeyFields = 'iK_disc'
      LookupResultField = 'cName_disc'
      KeyFields = 'ik_disc'
      OnSetText = adsNormOfTimeForPracticename_discSetText
      Size = 50
      Lookup = True
    end
    object StringField6: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'name_vid_nagruzki'
      LookupDataSet = adsVidNagruzki
      LookupKeyFields = 'ik_vid_nagruzki'
      LookupResultField = 'Cname_vid_nagruzki'
      KeyFields = 'ik_vid_nagruzki'
      Size = 50
      Lookup = True
    end
    object adsNormOfTimeForPracticename_practice_norm_type: TStringField
      DisplayLabel = #1058#1080#1087' '#1088#1072#1089#1095#1077#1090#1072
      FieldKind = fkLookup
      FieldName = 'name_practice_norm_type'
      LookupDataSet = adsPracticeNormType
      LookupKeyFields = 'ik_practice_norm_type'
      LookupResultField = 'cName_practice_norm_type'
      KeyFields = 'ik_practice_norm_type'
      Lookup = True
    end
    object FloatField1: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #1053#1057
      DisplayWidth = 6
      FieldName = 'f_norm_per_student'
    end
    object FloatField2: TFloatField
      DisplayLabel = #1053#1056#1045
      DisplayWidth = 6
      FieldName = 'f_norm_per_ed'
    end
    object StringField7: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072
      DisplayWidth = 18
      FieldKind = fkLookup
      FieldName = 'cname_decompose_type'
      LookupDataSet = adsDecomposeType
      LookupKeyFields = 'ik_decompose_type'
      LookupResultField = 'cName_decompose'
      KeyFields = 'ik_default_decompose_type'
      Size = 40
      Lookup = True
    end
    object adsNormOfTimeForPracticei_default_commission_count: TWordField
      DisplayLabel = #1057#1086#1089#1090#1072#1074' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'i_default_commission_count'
    end
    object IntegerField9: TIntegerField
      FieldName = 'ik_norm_of_time'
      Visible = False
    end
    object adsNormOfTimeForPracticeik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object IntegerField8: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object WordField1: TWordField
      FieldName = 'ik_default_decompose_type'
      Visible = False
    end
    object adsNormOfTimeForPracticeik_practice_norm_type: TWordField
      FieldName = 'ik_practice_norm_type'
      Visible = False
    end
  end
  object adsPracticeListForNormOfTime: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM discpln WHERE ik_type_disc in (SELECT ik_type_disc' +
      ' FROM Type_disc WHERE bit_calc_as_practice = 1) ORDER BY cName_d' +
      'isc'
    Parameters = <>
    Left = 576
    Top = 88
    object adsPracticeListForNormOfTimeiK_disc: TAutoIncField
      FieldName = 'iK_disc'
      ReadOnly = True
    end
    object adsPracticeListForNormOfTimecName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
  end
  object adsPracticeNormType: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM Practice_norm_type'
    Parameters = <>
    Left = 576
    Top = 144
    object adsPracticeNormTypeik_practice_norm_type: TWordField
      FieldName = 'ik_practice_norm_type'
      ReadOnly = True
    end
    object adsPracticeNormTypecName_practice_norm_type: TStringField
      FieldName = 'cName_practice_norm_type'
    end
  end
  object aspContentPlanNagr: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = aspContentPlanNagrCalcFields
    ProcedureName = 'GetContentPlanNagr'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_potok'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 784
    Top = 24
    object aspContentPlanNagrik_content_plan_nagr: TAutoIncField
      FieldName = 'ik_content_plan_nagr'
      ReadOnly = True
      Visible = False
    end
    object aspContentPlanNagrik_plan_nagr: TIntegerField
      FieldName = 'ik_plan_nagr'
      Visible = False
    end
    object aspContentPlanNagrik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object aspContentPlanNagrik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object aspContentPlanNagrik_shema: TIntegerField
      FieldName = 'ik_shema'
      Visible = False
    end
    object aspContentPlanNagrik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object aspContentPlanNagrname_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'name_vid_zanyat'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'cName_vid_zanyat'
      KeyFields = 'ik_vid_zanyat'
      Size = 30
      Lookup = True
    end
    object aspContentPlanNagrname_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 25
      FieldName = 'name_vid_nagruzki'
      OnSetText = aspContentPlanNagrname_vid_nagruzkiSetText
      Size = 50
    end
    object aspContentPlanNagrname_potok_shema: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1076#1077#1083#1077#1085#1080#1103
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'name_potok_shema'
      LookupDataSet = aspPotokShemes
      LookupKeyFields = 'ik_shema'
      LookupResultField = 'cNameShema'
      KeyFields = 'ik_shema'
      Size = 30
      Lookup = True
    end
    object aspContentPlanNagri_commission_count: TWordField
      DisplayLabel = #1050#1086#1084#1080#1089#1089#1080#1103' ('#1095#1077#1083'.)'
      DisplayWidth = 17
      FieldName = 'i_commission_count'
    end
    object aspContentPlanNagrf_all_hour: TFloatField
      DisplayLabel = #1053#1072#1075#1088#1091#1079#1082#1072' ('#1095#1072#1089'.)'
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'f_all_hour'
      Calculated = True
    end
    object aspContentPlanNagrbusy_hour: TFloatField
      DisplayLabel = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1086' '#1095#1072#1089#1086#1074
      FieldName = 'busy_hour'
      ReadOnly = True
      Visible = False
    end
    object aspContentPlanNagrik_schema_decompose_type: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ik_schema_decompose_type'
      LookupDataSet = aspPotokShemes
      LookupKeyFields = 'ik_shema'
      LookupResultField = 'ik_decompose_type'
      KeyFields = 'ik_shema'
      Visible = False
      Lookup = True
    end
    object aspContentPlanNagrbit_vz_must_be_in_up: TBooleanField
      FieldKind = fkLookup
      FieldName = 'bit_vz_must_be_in_up'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'bit_must_be_in_uch_plan'
      KeyFields = 'ik_vid_zanyat'
      Visible = False
      Lookup = True
    end
    object aspContentPlanNagrcalc_plan: TFloatField
      FieldName = 'calc_plan'
      Visible = False
    end
  end
  object adsPotokShemasInfo: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * FROM GetPotokShemaInfo(0, 0, 0, 0)'
    Parameters = <>
    Left = 968
    Top = 8
    object adsPotokShemasInfoik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
    end
    object adsPotokShemasInfocalc_unit_count: TIntegerField
      FieldName = 'calc_unit_count'
    end
    object adsPotokShemasInfostudent_count: TIntegerField
      FieldName = 'student_count'
    end
    object adsPotokShemasInfoconsultation_hour: TFloatField
      FieldName = 'consultation_hour'
    end
    object adsPotokShemasInfohour_by_gos: TIntegerField
      FieldName = 'hour_by_gos'
    end
    object adsPotokShemasInfobit_calc_students_only: TBooleanField
      FieldName = 'bit_calc_students_only'
    end
    object adsPotokShemasInfoik_shema: TIntegerField
      FieldName = 'ik_shema'
    end
  end
  object aspPotokShemes: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetNeedPotokShemes'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_potok'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 880
    Top = 24
    object aspPotokShemesik_shema: TAutoIncField
      FieldName = 'ik_shema'
      ReadOnly = True
    end
    object aspPotokShemesik_decompose_type: TWordField
      FieldName = 'ik_decompose_type'
    end
    object aspPotokShemescNameShema: TStringField
      FieldName = 'cNameShema'
      Size = 50
    end
  end
  object adsTeachersWorkTypes: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM Relation_kafedra_prep'
    Parameters = <>
    Left = 784
    Top = 80
    object adsTeachersWorkTypesik_kaf: TIntegerField
      FieldName = 'ik_kaf'
      Visible = False
    end
    object adsTeachersWorkTypesitab_n: TIntegerField
      FieldName = 'itab_n'
      Visible = False
    end
    object adsTeachersWorkTypesik_work_type: TIntegerField
      FieldName = 'ik_work_type'
      Visible = False
    end
    object adsTeachersWorkTypesik_capacity: TIntegerField
      FieldName = 'ik_capacity'
      Visible = False
    end
    object adsTeachersWorkTypesik_defence_fund: TWordField
      FieldName = 'ik_defence_fund'
      Visible = False
    end
    object adsTeachersWorkTypescName_work_type: TStringField
      DisplayLabel = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'cName_work_type'
      LookupDataSet = adsWorkTypes
      LookupKeyFields = 'ik_work_type'
      LookupResultField = 'cName_work_type'
      KeyFields = 'ik_work_type'
      Size = 50
      Lookup = True
    end
    object adsTeachersWorkTypescName_capacity: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'cName_capacity'
      LookupDataSet = adsCapacity
      LookupKeyFields = 'ik_capacity'
      LookupResultField = 'Cname_capacity'
      KeyFields = 'ik_capacity'
      Size = 30
      Lookup = True
    end
    object adsTeachersWorkTypescName_defence_fund: TStringField
      DisplayLabel = #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'cName_defence_fund'
      LookupDataSet = adsDefenceFund
      LookupKeyFields = 'ik_defence_fund'
      LookupResultField = 'cName_defence_fund'
      KeyFields = 'ik_defence_fund'
      Size = 30
      Lookup = True
    end
    object adsTeachersWorkTypesf_rates: TFloatField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = 'f_rates'
    end
    object adsTeachersWorkTypesik_id_prepod: TAutoIncField
      FieldName = 'ik_id_prepod'
      ReadOnly = True
      Visible = False
    end
    object adsTeachersWorkTypesrelease_date: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      FieldName = 'release_date'
    end
  end
  object adsPlanContingentOfSepGroups: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM Plan_contingent_of_sep_groups'
    Parameters = <>
    Left = 568
    Top = 224
    object adsPlanContingentOfSepGroupsik_year: TIntegerField
      FieldName = 'ik_year'
      Visible = False
    end
    object adsPlanContingentOfSepGroupsik_grup: TIntegerField
      FieldName = 'ik_grup'
      Visible = False
    end
    object adsPlanContingentOfSepGroupscName_grup: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'cName_grup'
      LookupDataSet = adsSepGroups
      LookupKeyFields = 'ik_grup'
      LookupResultField = 'cName_grup'
      KeyFields = 'ik_grup'
      ReadOnly = True
      Size = 50
    end
    object adsPlanContingentOfSepGroupssubgroup_count: TWordField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1076#1075#1088#1091#1087#1087
      FieldName = 'subgroup_count'
    end
    object adsPlanContingentOfSepGroupsbudget_count: TIntegerField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'budget_count'
    end
    object adsPlanContingentOfSepGroupscontract_count: TIntegerField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'contract_count'
    end
    object adsPlanContingentOfSepGroupsik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
      Visible = False
    end
  end
  object adsSepGroups: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT ik_grup, cName_grup FROM Grup'
    Parameters = <>
    Left = 688
    Top = 224
    object adsSepGroupsik_grup: TAutoIncField
      FieldName = 'ik_grup'
      ReadOnly = True
    end
    object adsSepGroupscName_grup: TStringField
      FieldName = 'cName_grup'
      Size = 50
    end
  end
  object adsAuditorVZ: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT ik_vid_zanyat, ik_kaf, i_hour_per_week, week_count, n_mod' +
      'ule, i_balls FROM Content_UchPl LEFT JOIN UchPlan_WeekCount_Exce' +
      'ption upwce ON  Content_UchPl.ik_upContent = upwce.ik_upContent'
    Parameters = <>
    Left = 896
    Top = 304
    object adsAuditorVZik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object adsAuditorVZik_kaf: TIntegerField
      FieldName = 'ik_kaf'
      Visible = False
    end
    object adsAuditorVZname_vz: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'name_vz'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'cName_vid_zanyat'
      KeyFields = 'ik_vid_zanyat'
      Size = 50
      Lookup = True
    end
    object adsAuditorVZname_kaf: TStringField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'name_kaf'
      LookupDataSet = adsKafedra
      LookupKeyFields = 'ik_kaf'
      LookupResultField = 'cshort_name_kaf'
      KeyFields = 'ik_kaf'
      Size = 10
      Lookup = True
    end
    object adsAuditorVZi_hour_per_week: TIntegerField
      DisplayLabel = #1063#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102
      DisplayWidth = 30
      FieldName = 'i_hour_per_week'
    end
    object adsAuditorVZweek_count: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1076#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'week_count'
    end
    object adsAuditorVZn_module: TWordField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'n_module'
      Visible = False
    end
    object adsAuditorVZi_balls: TIntegerField
      DisplayLabel = #1052#1072#1082#1089#1080#1084#1091#1084' '#1073#1072#1083#1083#1086#1074
      FieldName = 'i_balls'
      Visible = False
    end
  end
  object qContentUchPlan_temp: TADOQuery
    Connection = DBConnect
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 960
    Top = 360
  end
  object aspAbitDisc: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'ABIT_Get_disc_abit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNyear'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 488
    Top = 464
  end
  object dsAbitDiscipline: TDataSource
    DataSet = aspAbitDisc
    Left = 504
    Top = 520
  end
  object aspAbitExamType: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'ABIT_Get_sdacha_abit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NNyear'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_kat_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 464
  end
  object dsAbitExamType: TDataSource
    DataSet = aspAbitExamType
    Left = 400
    Top = 520
  end
  object adsContentVZ: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'Select ik_upContent, ik_kaf, n_sem, tasks_count, n_module, i_bal' +
      'ls From Content_UchPl LEFT JOIN Vid_zanyat_with_several_tasks vz' +
      'st ON Content_UchPl.ik_upContent = vzst.ik_upContent'
    Parameters = <>
    Left = 976
    Top = 304
    object adsContentVZsel_sem: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'sel_sem'
      LookupDataSet = adsSemester
      LookupKeyFields = 'n_sem'
      LookupResultField = 'n_sem'
      KeyFields = 'n_sem'
      LookupCache = True
      Lookup = True
    end
    object adsContentVZik_kaf: TIntegerField
      FieldName = 'ik_kaf'
      Visible = False
    end
    object adsContentVZn_sem: TIntegerField
      DisplayWidth = 25
      FieldName = 'n_sem'
      Visible = False
    end
    object adsContentVZkafedra_name: TStringField
      DisplayLabel = #1050#1072#1092#1077#1076#1088#1072
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'kafedra_name'
      LookupDataSet = adsKafedra
      LookupKeyFields = 'ik_kaf'
      LookupResultField = 'cshort_name_kaf'
      KeyFields = 'ik_kaf'
      LookupCache = True
      Size = 50
      Lookup = True
    end
    object adsContentVZtasks_count: TWordField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1076#1072#1085#1080#1081
      DisplayWidth = 20
      FieldName = 'tasks_count'
    end
    object adsContentVZn_module: TWordField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'n_module'
    end
    object adsContentVZi_balls: TIntegerField
      DisplayLabel = #1052#1072#1082#1089#1080#1084#1091#1084' '#1073#1072#1083#1083#1086#1074
      FieldName = 'i_balls'
    end
  end
  object dsAbitAllExam: TDataSource
    DataSet = adodsAbitAllExam
    Left = 560
    Top = 424
  end
  object adodsAbitAllExam: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'ABit_AllExamView'
    CommandType = cmdTable
    Parameters = <>
    Left = 560
    Top = 384
    object StringField5: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = #1089'name_disc'
      FixedChar = True
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = #1042#1080#1076' '#1089#1076#1072#1095#1080
      FieldName = 'cname_sdach'
      FixedChar = True
      Size = 50
    end
    object IntegerField7: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'cosenka'
    end
    object StringField9: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'NNvedom'
      FixedChar = True
    end
    object BCDField1: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object IntegerField10: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object IntegerField11: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object IntegerField12: TIntegerField
      FieldName = 'id_rasp_kab'
      Visible = False
    end
    object IntegerField13: TIntegerField
      FieldName = 'NN_abit'
      Visible = False
    end
    object IntegerField14: TIntegerField
      FieldName = 'id'
      Visible = False
    end
  end
  object AdodsDBUpdateAbility: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 
      'select DATABASEPROPERTYEX('#39'UGTU'#39', '#39'Updateability'#39') as UpdateAbil' +
      'ity'
    Parameters = <>
    Left = 16
    Top = 64
  end
  object AdodsDBStatus: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select DATABASEPROPERTYEX('#39'UGTU'#39', '#39'Status'#39') as Status'
    Parameters = <>
    Left = 72
    Top = 64
  end
  object adsFactNagr: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 432
    Top = 152
    object adsFactNagrcName_calc_unit: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072
      FieldName = 'cName_calc_unit'
      ReadOnly = True
    end
    object adsFactNagrik_prepod_plan: TIntegerField
      FieldName = 'ik_prepod_plan'
      Visible = False
    end
    object adsFactNagrcName_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      FieldKind = fkLookup
      FieldName = 'cName_vid_zanyat'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'cName_vid_zanyat'
      KeyFields = 'ik_vid_zanyat'
      ReadOnly = True
      Lookup = True
    end
    object adsFactNagrCname_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'Cname_vid_nagruzki'
      ReadOnly = True
      OnSetText = adsFactNagrCname_vid_nagruzkiSetText
    end
    object adsFactNagrby_plan_number: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1072#1073#1086#1090#1099
      FieldName = 'by_plan_number'
      ReadOnly = True
    end
    object adsFactNagrcomission_member: TSmallintField
      Alignment = taCenter
      DisplayLabel = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080
      FieldName = 'comission_member'
    end
    object adsFactNagrik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object adsFactNagrik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object adsFactNagrplan_hour: TFloatField
      Alignment = taCenter
      DisplayLabel = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086', '#1095#1072#1089
      FieldName = 'plan_hour'
      ReadOnly = True
    end
    object adsFactNagrplan_student: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1057#1090#1091#1076#1077#1085#1077#1090#1099' ('#1087#1083#1072#1085')'
      FieldName = 'plan_student'
      ReadOnly = True
    end
    object adsFactNagrfact_hour: TFloatField
      Alignment = taCenter
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1086' '#1076#1088#1091#1075#1080#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084', '#1095#1072#1089
      FieldName = 'fact_hour'
      ReadOnly = True
    end
    object adsFactNagrik_calc_unit: TIntegerField
      FieldName = 'ik_calc_unit'
      Visible = False
    end
    object adsFactNagrfact_student: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' ('#1076#1088#1091#1075#1086#1081')'
      FieldName = 'fact_student'
      ReadOnly = True
    end
    object adsFactNagrcur_fact_hour: TFloatField
      Alignment = taCenter
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1086' '#1090#1077#1082#1091#1097#1080#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084', '#1095#1072#1089
      FieldName = 'cur_fact_hour'
      OnChange = adsFactNagrcur_fact_hourChange
    end
    object adsFactNagrcur_fact_student: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074' ('#1090#1077#1082#1091#1097#1080#1081')'
      FieldName = 'cur_fact_student'
      OnChange = adsFactNagrcur_fact_studentChange
    end
  end
  object adsAdditionReason: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from Addition_nagr_reason'
    Parameters = <>
    Left = 272
    Top = 224
    object adsAdditionReasonik_addition_reason: TAutoIncField
      FieldName = 'ik_addition_reason'
      ReadOnly = True
    end
    object adsAdditionReasoncName_reason: TStringField
      FieldName = 'cName_reason'
      Size = 200
    end
  end
  object adsNagrCommit: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from GetPotentialForKafForPotoks(1176)'
    Parameters = <>
    Left = 456
    Top = 344
    object adsNagrCommitnPotoks: TStringField
      FieldName = 'nPotoks'
      Size = 100
    end
    object adsNagrCommitik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adsNagrCommitcName_spec: TStringField
      FieldName = 'cName_spec'
      Size = 50
    end
    object adsNagrCommitcourse: TStringField
      Alignment = taCenter
      FieldName = 'course'
      Size = 10
    end
    object adsNagrCommitIk_grup: TIntegerField
      FieldName = 'Ik_grup'
    end
    object adsNagrCommitCname_grup: TStringField
      Alignment = taCenter
      FieldName = 'Cname_grup'
      Size = 150
    end
    object adsNagrCommitik_disc_uch_plan: TIntegerField
      FieldName = 'ik_disc_uch_plan'
    end
    object adsNagrCommitcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
    object adsNagrCommitrasch: TStringField
      FieldName = 'rasch'
      Size = 100
    end
    object adsNagrCommitn_full: TIntegerField
      FieldName = 'n_full'
    end
    object adsNagrCommitbudget_count: TIntegerField
      Alignment = taCenter
      FieldName = 'budget_count'
    end
    object adsNagrCommitcontract_count: TIntegerField
      Alignment = taCenter
      FieldName = 'contract_count'
    end
    object adsNagrCommitsubgroup_count: TWordField
      Alignment = taCenter
      FieldName = 'subgroup_count'
    end
    object adsNagrCommitik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adsNagrCommitik_potok_semestr: TIntegerField
      FieldName = 'ik_potok_semestr'
    end
  end
  object ADOStoredProc1: TADOStoredProc
    Parameters = <>
    Left = 560
    Top = 488
  end
  object aspAdditionFactNagr: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetContentAdditionNagr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_id_prepod'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 480
    object aspAdditionFactNagrik_addition: TAutoIncField
      FieldName = 'ik_addition'
      ReadOnly = True
      Visible = False
    end
    object aspAdditionFactNagrik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
      Visible = False
    end
    object aspAdditionFactNagrik_vid_nagruzki: TIntegerField
      FieldName = 'ik_vid_nagruzki'
      Visible = False
    end
    object aspAdditionFactNagrik_addition_reason: TIntegerField
      FieldName = 'ik_addition_reason'
      Visible = False
    end
    object aspAdditionFactNagrname_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      FieldKind = fkLookup
      FieldName = 'name_vid_zanyat'
      LookupDataSet = adsVidZanyat
      LookupKeyFields = 'iK_vid_zanyat'
      LookupResultField = 'cName_vid_zanyat'
      KeyFields = 'ik_vid_zanyat'
      Size = 40
      Lookup = True
    end
    object aspAdditionFactNagrname_vid_nagruzki: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'name_vid_nagruzki'
      OnSetText = aspAdditionFactNagrname_vid_nagruzkiSetText
      Size = 40
    end
    object aspAdditionFactNagrname_reason: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'name_reason'
      LookupDataSet = adsAdditionReason
      LookupKeyFields = 'ik_addition_reason'
      LookupResultField = 'cName_reason'
      KeyFields = 'ik_addition_reason'
      Size = 40
      Lookup = True
    end
    object aspAdditionFactNagri_fact_student: TIntegerField
      DisplayLabel = #1057#1090#1091#1076#1077#1085#1090#1086#1074
      DisplayWidth = 20
      FieldName = 'i_fact_student'
    end
    object aspAdditionFactNagrf_all_fact_hour: TBCDField
      DisplayLabel = #1063#1072#1089#1086#1074
      DisplayWidth = 20
      FieldName = 'f_all_fact_hour'
      Precision = 8
      Size = 2
    end
  end
  object aspDefaultPotoks: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'Nagr_AddDefaultPotoks;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_plan_nagr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 248
    Top = 528
  end
  object aspAddDefaultPlans: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'Nagr_AddDefaultPlans;1'
    Parameters = <
      item
        Name = '@ik_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_type_semestr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 408
  end
  object dsAllTimeNorm: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from AllNormTime(19)'
    Parameters = <>
    Left = 168
    Top = 328
    object dsAllTimeNormik_norm_time: TIntegerField
      FieldName = 'ik_norm_time'
    end
    object dsAllTimeNormName_norm: TStringField
      FieldName = 'Name_norm'
      Size = 200
    end
  end
  object aspPlanNormTime: TADOStoredProc
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'PlanNormTime'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_sem_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 392
    Top = 256
    object aspPlanNormTimeik_plan_nagr: TAutoIncField
      FieldName = 'ik_plan_nagr'
      ReadOnly = True
      Visible = False
    end
    object aspPlanNormTimeik_norm_time: TIntegerField
      FieldName = 'ik_norm_time'
      Visible = False
    end
    object aspPlanNormTimeName_plan: TStringField
      DisplayLabel = #1055#1083#1072#1085' '#1085#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'Name_plan'
      ReadOnly = True
      Size = 75
    end
    object aspPlanNormTimeName_norm: TStringField
      DisplayLabel = #1053#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080
      DisplayWidth = 70
      FieldKind = fkLookup
      FieldName = 'Name_norm_time'
      LookupDataSet = dsAllTimeNorm
      LookupKeyFields = 'ik_norm_time'
      LookupResultField = 'Name_norm'
      KeyFields = 'ik_norm_time'
      Size = 75
      Lookup = True
    end
  end
  object aspDeleteOldNagr: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'Nagr_DeleteOldNagr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 176
    Top = 192
  end
  object aspDeletePotokSemestr: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'Nagr_DeletePotokSemestr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_potok_semestr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 328
    Top = 328
  end
  object adsProfile: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from GetProfileEduBranches'
    Parameters = <
      item
        Name = '@ik_uch_pl'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Left = 32
    Top = 456
  end
  object dsProfileForGroup: TDataSource
    DataSet = adsProfile
    Left = 32
    Top = 400
  end
  object adsGroups: TADODataSet
    Connection = DBConnect
    CommandText = 'select * from Grup'
    Parameters = <>
    Left = 32
    Top = 656
  end
  object aspGetDiscWork: TADOStoredProc
    Active = True
    Connection = DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDisciplines_4filters;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1620
      end
      item
        Name = '@ik_ckl_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 11
      end
      item
        Name = '@ik_grp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 9
      end
      item
        Name = '@ik_pdgrp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 3
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_vid_zan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_grup'
        DataType = ftInteger
        Value = 0
      end>
    Left = 544
    Top = 296
    object aspGetDiscWorkik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object aspGetDiscWorkik_grp_disc: TIntegerField
      FieldName = 'ik_grp_disc'
      Visible = False
    end
    object aspGetDiscWorkik_ckl_disc: TIntegerField
      FieldName = 'ik_ckl_disc'
      Visible = False
    end
    object aspGetDiscWorkik_pdgrp_disc: TIntegerField
      FieldName = 'ik_pdgrp_disc'
      Visible = False
    end
    object aspGetDiscWorkik_podckl: TIntegerField
      FieldName = 'ik_podckl'
      Visible = False
    end
    object aspGetDiscWorkcname_ckl_disc1: TStringField
      FieldName = 'cname_ckl_disc1'
      Visible = False
    end
    object aspGetDiscWorkik_uch_plan: TIntegerField
      FieldName = 'ik_uch_plan'
      Visible = False
    end
    object aspGetDiscWorkuchet: TBooleanField
      FieldName = 'uchet'
      Visible = False
    end
    object aspGetDiscWorkihour_gos: TIntegerField
      FieldName = 'ihour_gos'
      Visible = False
    end
    object aspGetDiscWorkik_disc_uch_plan: TIntegerField
      FieldName = 'ik_disc_uch_plan'
      Visible = False
    end
    object aspGetDiscWorkik_default_kaf: TIntegerField
      FieldName = 'ik_default_kaf'
      Visible = False
    end
    object aspGetDiscWorkiindivid: TIntegerField
      FieldName = 'iindivid'
      Visible = False
    end
    object aspGetDiscWorkViborGroup: TIntegerField
      FieldName = 'ViborGroup'
      Visible = False
    end
    object aspGetDiscWorkiK_disc1: TIntegerField
      FieldName = 'iK_disc1'
      Visible = False
    end
    object aspGetDiscWorkcname_disc: TStringField
      DisplayWidth = 150
      FieldName = 'cname_disc'
      Size = 500
    end
    object aspGetDiscWorkcshortname: TStringField
      FieldName = 'cshortname'
      Visible = False
      Size = 40
    end
    object aspGetDiscWorklpract: TBooleanField
      FieldName = 'lpract'
      Visible = False
    end
    object aspGetDiscWorkik_type_disc: TWordField
      FieldName = 'ik_type_disc'
      Visible = False
    end
    object aspGetDiscWorkcName_spclz_short: TStringField
      DisplayWidth = 40
      FieldName = 'cName_spclz_short'
    end
    object aspGetDiscWorkik_spclz: TIntegerField
      FieldName = 'ik_spclz'
      Visible = False
    end
    object aspGetDiscWorkik_ed_izm: TIntegerField
      FieldName = 'ik_ed_izm'
      Visible = False
    end
    object aspGetDiscWorkShowToUser: TStringField
      FieldName = 'ShowToUser'
      Visible = False
    end
    object aspGetDiscWorkiHour_Audit: TIntegerField
      FieldName = 'iHour_Audit'
    end
  end
  object adsGetUchPlanGrup: TADODataSet
    Connection = DBConnect
    CursorType = ctStatic
    CommandText = 'select * from GetUchPlanForGroup'
    Parameters = <>
    Left = 1008
    Top = 608
  end
  object dsGetUchPlnGroup: TDataSource
    DataSet = adsGetUchPlanGrup
    Left = 1056
    Top = 656
  end
  object aspAddRupGrup: TADOStoredProc
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'AddRUPForGroup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = -6
      end
      item
        Name = '@grup_comment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@vidgos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_spec_fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_main_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@inserted_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 176
    Top = 696
  end
  object aspUpdateDiscInPlan: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'UpdateDiscInUchPlan;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@i_type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@ik_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_default_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iHour_gos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iIndivid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ckl_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_grp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Cname_ckl_disc_gos'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@ik_pdgrp_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ViborGroup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_spclz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@source_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 288
    Top = 696
  end
  object DelVedForContentDisc: TADOStoredProc
    Connection = DBConnect
    LockType = ltBatchOptimistic
    ProcedureName = 'DelVedomostForContentDisc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_upContent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 608
  end
  object Hard_DiscDel: TADOStoredProc
    Connection = DBConnect
    ProcedureName = 'Hard_DiscDel;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 120
    Top = 544
  end
  object qVedomostForContent: TADOQuery
    Connection = DBConnect
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 1072
    Top = 360
  end
end
