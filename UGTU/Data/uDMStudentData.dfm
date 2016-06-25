object dmStudentData: TdmStudentData
  OldCreateOrder = False
  Height = 434
  Width = 621
  object adodsZaved_Stud: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Zaved_stud'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 20
  end
  object dsZaved_stud: TDataSource
    DataSet = adodsZaved_Stud
    Left = 32
    Top = 80
  end
  object dsKatZach: TDataSource
    DataSet = adodsKatZach
    Left = 92
    Top = 76
  end
  object adodsKatZach: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Kat_zach'
    CommandType = cmdTable
    Parameters = <>
    Left = 92
    Top = 20
  end
  object adodsEnterprise: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Predpr order by Cname_pred'
    Parameters = <>
    Left = 204
    Top = 176
    object adodsEnterpriseIk_pred: TAutoIncField
      FieldName = 'Ik_pred'
      ReadOnly = True
      Visible = False
    end
    object adodsEnterpriseCname_pred: TStringField
      FieldName = 'Cname_pred'
      Size = 100
    end
  end
  object dsEnterprise: TDataSource
    DataSet = adodsEnterprise
    Left = 204
    Top = 228
  end
  object dsRel: TDataSource
    DataSet = adodsRelative
    Left = 148
    Top = 76
  end
  object adodsRelative: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'memb_fam'
    CommandType = cmdTable
    Parameters = <>
    Left = 148
    Top = 20
  end
  object adodsDocType: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from documents order by cvid_doc'
    Parameters = <>
    Left = 324
    Top = 20
  end
  object adodsSempol: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'sem_pol'
    CommandType = cmdTable
    Parameters = <>
    Left = 388
    Top = 20
  end
  object adodsNat: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Nacion order by Cname_nac'
    Parameters = <>
    Left = 268
    Top = 176
  end
  object dsNat: TDataSource
    DataSet = adodsNat
    Left = 268
    Top = 228
  end
  object dsSempol: TDataSource
    DataSet = adodsSempol
    Left = 388
    Top = 76
  end
  object dsDocType: TDataSource
    DataSet = adodsDocType
    Left = 324
    Top = 76
  end
  object adodsJob: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Vid_ob_rab order by Cname_ob_rab'
    Parameters = <>
    Left = 384
    Top = 176
  end
  object dsJob: TDataSource
    DataSet = adodsJob
    Left = 384
    Top = 228
  end
  object adodsPrep: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Abit_podg order by Cname_podg'
    Parameters = <>
    Left = 144
    Top = 176
  end
  object dsPrep: TDataSource
    DataSet = adodsPrep
    Left = 144
    Top = 228
  end
  object adodsCitizen: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from grazd order by c_grazd'
    Parameters = <>
    Left = 92
    Top = 176
  end
  object dsCitizen: TDataSource
    DataSet = adodsCitizen
    Left = 92
    Top = 228
  end
  object adodsLang: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Lang'
    CommandType = cmdTable
    Parameters = <>
    Left = 204
    Top = 20
  end
  object dsLang: TDataSource
    DataSet = adodsLang
    Left = 204
    Top = 76
  end
  object adodsStepVlad: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Step_vlad'
    CommandType = cmdTable
    Parameters = <>
    Left = 264
    Top = 20
  end
  object dsStepVlad: TDataSource
    DataSet = adodsStepVlad
    Left = 264
    Top = 76
  end
  object adodsMedal: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from medal_abit order by cmedal'
    Parameters = <>
    Left = 44
    Top = 176
  end
  object dsMedal: TDataSource
    DataSet = adodsMedal
    Left = 44
    Top = 228
  end
  object adodsMilSt: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Voen_zvanie order by Cvoen_zvanie'
    Parameters = <>
    Left = 324
    Top = 176
  end
  object dsMilSt: TDataSource
    DataSet = adodsMilSt
    Left = 324
    Top = 228
  end
  object dsCount: TDataSource
    DataSet = adodsCount
    Left = 442
    Top = 75
  end
  object adodsCount: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Special_uchet'
    CommandType = cmdTable
    Parameters = <>
    Left = 444
    Top = 23
  end
  object dsPredpr: TDataSource
    DataSet = adotblPredpr
    Left = 434
    Top = 225
  end
  object adodsSmallGroup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adodsSmallGroupCalcFields
    CommandText = 'select * from Tree_SmallStudent'
    FieldDefs = <
      item
        Name = 'Ik_zach'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'nCode'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'NameStud'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 92
      end
      item
        Name = 'Ik_grup'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Dd_birth'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'ctelefon'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ik_kat_zach'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'Cname_kat_zach'
        DataType = ftString
        Size = 50
      end>
    Parameters = <>
    StoreDefs = True
    Left = 44
    Top = 304
    object adodsSmallGroupNum: TIntegerField
      AutoGenerateValue = arAutoInc
      DefaultExpression = '0'
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldKind = fkCalculated
      FieldName = 'Num'
      Calculated = True
    end
    object adodsSmallGroupNameStud: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'NameStud'
      ReadOnly = True
      Size = 92
    end
    object adodsSmallGroupCname_kat_zach: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object adodsSmallGroupDd_birth: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'Dd_birth'
    end
    object adodsSmallGroupctelefon: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'ctelefon'
    end
    object adodsSmallGroupIk_zach: TIntegerField
      FieldName = 'Ik_zach'
      Visible = False
    end
    object adodsSmallGroupnCode: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsSmallGroupIk_grup: TIntegerField
      FieldName = 'Ik_grup'
      Visible = False
    end
    object adodsSmallGroupIk_kat_zach: TIntegerField
      FieldName = 'Ik_kat_zach'
      Visible = False
    end
  end
  object dsPrikaz: TDataSource
    DataSet = adodsPrikaz
    Left = 112
    Top = 351
  end
  object adodsPrikaz: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adodsPrikazCalcFields
    CommandText = 'Prikaz'
    CommandType = cmdTable
    Parameters = <>
    Left = 110
    Top = 305
    object adodsPrikazIk_prikaz: TIntegerField
      FieldName = 'Ik_prikaz'
      Visible = False
    end
    object adodsPrikazNn_prikaz: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'Nn_prikaz'
      Size = 10
    end
    object adodsPrikazNamePrikaz: TStringField
      FieldName = 'NamePrikaz'
      Visible = False
      Size = 100
    end
    object adodsPrikazDd_prikaz: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '
      FieldName = 'Dd_prikaz'
    end
    object adodsPrikazDd_prikazVst: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
      FieldName = 'Dd_prikazVst'
    end
    object adodsPrikazik_typePrikaz: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'ik_typePrikaz'
      Visible = False
    end
    object adodsPrikazNN_Date: TStringField
      FieldKind = fkCalculated
      FieldName = 'NN_Date'
      Calculated = True
    end
  end
  object adotblPredpr: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Predpr order by Cname_pred'
    Parameters = <>
    Left = 436
    Top = 184
    object AutoIncField1: TAutoIncField
      FieldName = 'Ik_pred'
      ReadOnly = True
      Visible = False
    end
    object StringField1: TStringField
      FieldName = 'Cname_pred'
      Size = 100
    end
  end
  object aspFindAbit: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'Abit_Search_Abit;1'
    Parameters = <>
    Left = 167
    Top = 302
    object aspFindAbitclastname: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'clastname'
      Size = 30
    end
    object aspFindAbitcfirstname: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'cfirstname'
      Size = 30
    end
    object aspFindAbitcotch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'cotch'
      Size = 30
    end
    object aspFindAbitCshort_spec: TStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object aspFindAbitCshort_name_fac: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      FieldName = 'Cshort_name_fac'
    end
    object aspFindAbitregnomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'regnomer'
    end
    object aspFindAbitncode: TIntegerField
      FieldName = 'ncode'
      Visible = False
    end
    object aspFindAbitnn_abit: TIntegerField
      FieldName = 'nn_abit'
      Visible = False
    end
    object aspFindAbitidCat: TIntegerField
      FieldName = 'idCat'
      Visible = False
    end
  end
  object dsFindAbit: TDataSource
    DataSet = aspFindAbit
    Left = 167
    Top = 352
  end
  object aspGetAbitCat: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_Kat_zach;1'
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
    Left = 223
    Top = 302
  end
  object dsGetAbitCat: TDataSource
    DataSet = aspGetAbitCat
    Left = 223
    Top = 352
  end
  object adodsAllStud: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Cont'
    Parameters = <>
    Left = 376
    Top = 312
    object adodsAllStudNameStud: TStringField
      FieldName = 'NameStud'
      ReadOnly = True
      Size = 92
    end
    object adodsAllStudNn_zach: TStringField
      FieldName = 'Nn_zach'
      FixedChar = True
      Size = 6
    end
    object adodsAllStudCname_grup: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adodsAllStudCshort_name_fac: TStringField
      FieldName = 'Cshort_name_fac'
    end
  end
  object dsAllStud: TDataSource
    DataSet = adodsAllStud
    Left = 375
    Top = 360
  end
  object adodsAcadem: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from AcademStud'
    Parameters = <>
    Left = 432
    Top = 312
    object adodsAcademStudName: TStringField
      DisplayLabel = #1060#1048#1054' '#1089#1090#1091#1076#1077#1085#1090#1072
      DisplayWidth = 19
      FieldName = 'StudName'
      ReadOnly = True
      Size = 60
    end
    object adodsAcademNn_zach: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1095#1077#1090#1085#1086#1081' '#1082#1085#1080#1078#1082#1080
      DisplayWidth = 13
      FieldName = 'Nn_zach'
      FixedChar = True
      Size = 6
    end
    object adodsAcademStringField11: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      DisplayWidth = 10
      FieldName = #1053#1086#1074#1099#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090
      Size = 50
    end
    object adodsAcademStringField4: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 12
      FieldName = #1053#1086#1074#1072#1103' '#1075#1088#1091#1087#1087#1072
      Size = 50
    end
    object adodsAcademStringField10: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090' ('#1087#1088#1077#1078#1085#1080#1081')'
      FieldName = #1055#1088#1077#1078#1085#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090
      Visible = False
      Size = 50
    end
    object adodsAcademStringField: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' ('#1087#1088#1077#1078#1085#1103#1103')'
      DisplayWidth = 17
      FieldName = #1055#1088#1086#1096#1083#1072#1103' '#1075#1088#1091#1087#1087#1072
      Size = 50
    end
    object adodsAcademStringField3: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
      DisplayWidth = 13
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1074#1099#1093#1086#1076#1072
    end
    object adodsAcademStringField7: TStringField
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1074#1086#1089#1089#1090'.'
    end
    object adodsAcademDateTimeField: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = #1044#1090'. '#1087#1088'. '#1086' '#1074#1099#1093#1086#1076#1077
      Visible = False
    end
    object adodsAcademStringField2: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1087#1091#1089#1082#1072
      DisplayWidth = 30
      FieldName = #1055#1088#1080#1095'. '#1074#1099#1093#1086#1076#1072
      Size = 50
    end
    object adodsAcademDateTimeField5: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1086#1090#1087#1091#1089#1082#1072
      DisplayWidth = 14
      FieldName = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object adodsAcademDateTimeField6: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1072
      DisplayWidth = 17
      FieldName = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object adodsAcademDateTimeField7: TDateTimeField
      DisplayLabel = #1055#1088#1080#1089#1090#1091#1087#1072#1077#1090' '#1082' '#1086#1073#1091#1095#1077#1085#1080#1102
      DisplayWidth = 20
      FieldName = #1044#1072#1090#1072' '#1074#1099#1093#1086#1076#1072' '#1085#1072' '#1091#1095#1077#1073#1091
    end
    object adodsAcademDateTimeField2: TDateTimeField
      FieldName = #1044#1090'. '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091' '#1087#1088'. '#1086' '#1074#1099#1093'.'
      Visible = False
    end
    object adodsAcademStringField5: TStringField
      FieldName = #1055#1088#1080#1095'. '#1074#1086#1089#1089#1090'.'
      Visible = False
      Size = 50
    end
    object adodsAcademStringField6: TStringField
      FieldName = #1050#1072#1090'. '#1079#1072#1095'.'
      Visible = False
      Size = 50
    end
    object adodsAcademDateTimeField3: TDateTimeField
      FieldName = #1044#1090'. '#1087#1088'. '#1086' '#1074#1086#1089#1089#1090'.'
      Visible = False
    end
    object adodsAcademDateTimeField4: TDateTimeField
      FieldName = #1044#1090' '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091' '#1087#1088'. '#1086' '#1074#1086#1089#1089#1090'.'
      Visible = False
    end
    object adodsAcademStringField8: TStringField
      FieldName = #1055#1088#1077#1078#1085#1103#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      Visible = False
      Size = 150
    end
    object adodsAcademStringField9: TStringField
      FieldName = #1053#1086#1074#1072#1103' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      Visible = False
      Size = 150
    end
    object adodsAcademIk_pric: TIntegerField
      FieldName = 'Ik_pric'
      Visible = False
    end
    object adodsAcademIk_prikaz: TIntegerField
      FieldName = 'Ik_prikaz'
      Visible = False
    end
    object adodsAcademIk_grup: TIntegerField
      FieldName = 'Ik_grup'
      Visible = False
    end
    object adodsAcademIk_fac: TIntegerField
      FieldName = 'Ik_fac'
      Visible = False
    end
    object adodsAcademIk_zach: TIntegerField
      FieldName = 'Ik_zach'
      Visible = False
    end
    object adodsAcademIk_kat_zach: TIntegerField
      FieldName = 'Ik_kat_zach'
      Visible = False
    end
    object adodsAcademik_spec: TIntegerField
      FieldName = 'ik_spec'
      Visible = False
    end
    object adodsAcademik_newgrup: TIntegerField
      FieldName = 'ik_newgrup'
      Visible = False
    end
    object adodsAcademIsFreeAttendance: TBooleanField
      DisplayLabel = #1057#1074#1086#1073#1086#1076#1085#1086#1077' '#1087#1086#1089#1077#1097#1077#1085#1080#1077
      FieldName = 'IsFreeAttendance'
      ReadOnly = True
    end
    object adodsAcademcObosnOtch: TStringField
      FieldName = 'cObosnOtch'
      Visible = False
      Size = 500
    end
  end
  object dsAcadem: TDataSource
    DataSet = adodsAcadem
    Left = 431
    Top = 360
  end
  object adsIsOnVacation: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select [dbo].[IsInVacation](12014)'
    Parameters = <>
    Left = 376
    Top = 272
  end
  object adodsAbitDisc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from ABIT_Disc order by '#1089'name_disc'
    Parameters = <>
    Left = 292
    Top = 304
  end
  object dsAbitDisc: TDataSource
    DataSet = adodsAbitDisc
    Left = 295
    Top = 352
  end
  object adoqTargetOrganization: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[TargetOrganization]'
      ''
      ''
      ''
      ''
      '')
    Left = 520
    Top = 312
  end
  object dsTargetOrganization: TDataSource
    DataSet = adoqTargetOrganization
    Left = 519
    Top = 360
  end
end
