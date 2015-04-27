object dmStudentSelectionProcs: TdmStudentSelectionProcs
  OldCreateOrder = False
  Height = 523
  Width = 636
  object aspSelLanguage: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterEdit = aspSelLanguageAfterEdit
    OnNewRecord = aspSelLanguageNewRecord
    ProcedureName = 'SelLanguage;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@code'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = 0c
      end>
    Left = 75
    Top = 12
    object aspSelLanguageIk_lang: TIntegerField
      FieldName = 'Ik_lang'
      Visible = False
    end
    object aspSelLanguageIk_step_vlad: TIntegerField
      FieldName = 'Ik_step_vlad'
      Visible = False
    end
    object aspSelLanguagenCode: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object aspSelLanguageLang: TStringField
      DisplayLabel = #1048#1085#1086#1089#1090#1088#1072#1085#1085#1099#1081' '#1103#1079#1099#1082
      FieldKind = fkLookup
      FieldName = 'Lang'
      LookupDataSet = dmStudentData.adodsLang
      LookupKeyFields = 'Ik_lang'
      LookupResultField = 'Cname_lang'
      KeyFields = 'Ik_lang'
      LookupCache = True
      Size = 50
      Lookup = True
    end
    object aspSelLanguageStepVl: TStringField
      DisplayLabel = #1057#1090#1077#1087#1077#1085#1100' '#1074#1083#1072#1076#1077#1085#1080#1103
      FieldKind = fkLookup
      FieldName = 'StepVl'
      LookupDataSet = dmStudentData.adodsStepVlad
      LookupKeyFields = 'Ik_step_vlad'
      LookupResultField = 'Cname_step_vlad'
      KeyFields = 'Ik_step_vlad'
      Size = 50
      Lookup = True
    end
  end
  object aspSelFamily: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    AfterEdit = aspSelFamilyAfterEdit
    OnNewRecord = aspSelFamilyNewRecord
    ProcedureName = 'SelFamily;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@code'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 75
    Top = 70
    object aspSelFamilynCode: TBCDField
      FieldName = 'nCode'
      Visible = False
      Precision = 18
      Size = 0
    end
    object aspSelFamilyIk_memb_fam: TIntegerField
      FieldName = 'Ik_memb_fam'
      Visible = False
    end
    object aspSelFamilyIk_pred: TIntegerField
      FieldName = 'Ik_pred'
      Visible = False
    end
    object aspSelFamilymemb_fam: TStringField
      DisplayLabel = #1050#1077#1084' '#1087#1088#1080#1093#1086#1076#1080#1090#1089#1103
      FieldKind = fkLookup
      FieldName = 'memb_fam'
      LookupDataSet = dmStudentData.adodsRelative
      LookupKeyFields = 'ik_memb_fam'
      LookupResultField = 'cmemb_fam'
      KeyFields = 'Ik_memb_fam'
      OnChange = aspSelFamilymemb_famChange
      Size = 60
      Lookup = True
    end
    object aspSelFamilyDSDesigner: TStringField
      FieldName = #1060#1048#1054
      OnChange = aspSelFamilymemb_famChange
      Size = 90
    end
    object aspSelFamilypred: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      FieldKind = fkLookup
      FieldName = 'pred'
      LookupDataSet = dmStudentData.adodsEnterprise
      LookupKeyFields = 'Ik_pred'
      LookupResultField = 'Cname_pred'
      KeyFields = 'Ik_pred'
      OnChange = aspSelFamilymemb_famChange
      Size = 60
      Lookup = True
    end
    object aspSelFamilyDSDesigner5: TStringField
      FieldName = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      OnChange = aspSelFamilymemb_famChange
      Size = 100
    end
    object aspSelFamilyDSDesigner2: TStringField
      FieldName = #1058#1077#1083#1077#1092#1086#1085
      OnChange = aspSelFamilymemb_famChange
      Size = 15
    end
    object aspSelFamilyDSDesigner3: TStringField
      FieldName = #1040#1076#1088#1077#1089
      OnChange = aspSelFamilymemb_famChange
      Size = 100
    end
    object aspSelFamilyDSDesigner4: TStringField
      FieldName = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      OnChange = aspSelFamilymemb_famChange
      Size = 15
    end
    object aspSelFamilyDSDesigner6: TDateTimeField
      FieldName = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      OnChange = aspSelFamilymemb_famChange
    end
  end
  object dsLanguages: TDataSource
    DataSet = aspSelLanguage
    OnDataChange = dsLanguagesDataChange
    Left = 133
    Top = 13
  end
  object dsFamily: TDataSource
    DataSet = aspSelFamily
    OnDataChange = dsFamilyDataChange
    Left = 133
    Top = 72
  end
  object aspSelLastNames: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelChangeFam;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 73
    Top = 155
    object aspSelLastNamesStringField: TStringField
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072
      OnChange = aspSelFamilymemb_famChange
    end
    object aspSelLastNamesDateTimeField: TDateTimeField
      FieldName = #1044#1090' '#1074#1099#1093'. '#1087#1088#1080#1082#1072#1079#1072
      OnChange = aspSelFamilymemb_famChange
    end
    object aspSelLastNamesDateTimeField2: TDateTimeField
      FieldName = #1044#1090'. '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091
      OnChange = aspSelFamilymemb_famChange
    end
    object aspSelLastNamesStringField2: TStringField
      FieldName = #1055#1088#1080#1095#1080#1085#1072' '#1089#1084#1077#1085#1099
      OnChange = aspSelFamilymemb_famChange
      Size = 50
    end
    object aspSelLastNamesStringField3: TStringField
      FieldName = #1055#1088#1077#1078#1085#1103#1103' '#1092#1072#1084#1080#1083#1080#1103
      OnChange = aspSelFamilymemb_famChange
      Size = 50
    end
  end
  object dsDocuments: TDataSource
    AutoEdit = False
    DataSet = adoSelDocuments
    OnDataChange = dsDocumentsDataChange
    Left = 549
    Top = 264
  end
  object dsLastnames: TDataSource
    DataSet = aspSelLastNames
    Left = 155
    Top = 186
  end
  object aspSelMoves: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelPerevods;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 71
    Top = 279
  end
  object aspSelAcadem: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelAcademStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 14752
      end>
    Left = 48
    Top = 229
    object aspSelAcademStringField: TStringField
      FieldName = #1055#1088#1086#1096#1083#1072#1103' '#1075#1088#1091#1087#1087#1072
      Size = 50
    end
    object aspSelAcademStringField2: TStringField
      FieldName = #1055#1088#1080#1095'. '#1074#1099#1093#1086#1076#1072
      Size = 50
    end
    object aspSelAcademStringField3: TStringField
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1074#1099#1093#1086#1076#1072
    end
    object aspSelAcademDateTimeField: TDateTimeField
      FieldName = #1044#1090'. '#1087#1088'. '#1086' '#1074#1099#1093#1086#1076#1077
      Visible = False
    end
    object aspSelAcademDateTimeField2: TDateTimeField
      FieldName = #1044#1090'. '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091' '#1087#1088'. '#1086' '#1074#1099#1093'.'
      Visible = False
    end
    object aspSelAcademStringField4: TStringField
      FieldName = #1053#1086#1074#1072#1103' '#1075#1088#1091#1087#1087#1072
      Size = 50
    end
    object aspSelAcademStringField5: TStringField
      FieldName = #1055#1088#1080#1095'. '#1074#1086#1089#1089#1090'.'
      Visible = False
      Size = 50
    end
    object aspSelAcademStringField6: TStringField
      FieldName = #1050#1072#1090'. '#1079#1072#1095'.'
      Visible = False
      Size = 50
    end
    object aspSelAcademStringField7: TStringField
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1074#1086#1089#1089#1090'.'
    end
    object aspSelAcademDateTimeField3: TDateTimeField
      FieldName = #1044#1090'. '#1087#1088'. '#1086' '#1074#1086#1089#1089#1090'.'
      Visible = False
    end
    object aspSelAcademDateTimeField4: TDateTimeField
      FieldName = #1044#1090' '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091' '#1087#1088'. '#1086' '#1074#1086#1089#1089#1090'.'
      Visible = False
    end
    object aspSelAcademDateTimeField5: TDateTimeField
      FieldName = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object aspSelAcademDateTimeField6: TDateTimeField
      FieldName = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object aspSelAcademDateTimeField7: TDateTimeField
      FieldName = #1044#1072#1090#1072' '#1074#1099#1093#1086#1076#1072' '#1085#1072' '#1091#1095#1077#1073#1091
    end
    object aspSelAcademIk_pric: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
      Visible = False
    end
    object aspSelAcademIk_prikaz: TAutoIncField
      FieldName = 'Ik_prikaz'
      ReadOnly = True
      Visible = False
    end
    object aspSelAcademik_grup: TAutoIncField
      FieldName = 'ik_grup'
      ReadOnly = True
      Visible = False
    end
    object aspSelAcademStringField8: TStringField
      FieldName = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103
      Visible = False
      Size = 500
    end
    object aspSelAcademBooleanField: TBooleanField
      FieldName = #1057#1074#1086#1073#1086#1076#1085#1086#1077' '#1087#1086#1089#1077#1097#1077#1085#1080#1077
      Visible = False
    end
  end
  object dsMoves: TDataSource
    DataSet = aspSelMoves
    Left = 129
    Top = 281
  end
  object dsAcadem: TDataSource
    DataSet = aspSelAcadem
    Left = 129
    Top = 230
  end
  object aspSelExiles: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelOtchislStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 70
    Top = 335
  end
  object aspSelVosst: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelZachislStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 69
    Top = 389
  end
  object dsVosst: TDataSource
    DataSet = aspSelVosst
    Left = 132
    Top = 387
  end
  object dsExiles: TDataSource
    DataSet = aspSelExiles
    Left = 131
    Top = 335
  end
  object dslichnKartStud: TDataSource
    DataSet = adoLichnKartStud
    Left = 133
    Top = 448
  end
  object adoLichnKartStud: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'GetLichnKartStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ncode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 72
    Top = 448
  end
  object aspSelExtendedSessions: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelExtendedSessions;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 209
    Top = 27
    object aspSelExtendedSessionsStringField: TStringField
      FieldName = #8470' '#1087#1088#1080#1082#1072#1079#1072
      Size = 11
    end
    object aspSelExtendedSessionsDateTimeField: TDateTimeField
      FieldName = #1044#1090' '#1074#1099#1093'. '#1087#1088#1080#1082#1072#1079#1072
    end
    object aspSelExtendedSessionsDateTimeField2: TDateTimeField
      FieldName = #1044#1090'. '#1074#1089#1090'. '#1074' '#1089#1080#1083#1091
    end
    object aspSelExtendedSessionsStringField2: TStringField
      FieldName = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
      Size = 50
    end
    object aspSelExtendedSessionsStringField3: TStringField
      FieldName = #1055#1088#1086#1076#1083#1077#1085#1086' '#1076#1086
      Size = 50
    end
  end
  object dsExtendedSessions: TDataSource
    DataSet = aspSelExtendedSessions
    Left = 323
    Top = 26
  end
  object aspGetPersonAddress: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetPersonAddress;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 4566
      end>
    Left = 207
    Top = 78
    object aspGetPersonAddressCstrana: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      DisplayWidth = 10
      FieldName = 'Cstrana'
      Size = 50
    end
    object aspGetPersonAddressCregion: TStringField
      DisplayLabel = #1056#1077#1075#1080#1086#1085
      DisplayWidth = 15
      FieldName = 'Cregion'
      Size = 50
    end
    object aspGetPersonAddressCraion: TStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      DisplayWidth = 15
      FieldName = 'Craion'
      Size = 50
    end
    object aspGetPersonAddressCgorod: TStringField
      DisplayLabel = #1043#1086#1088#1086#1076
      DisplayWidth = 15
      FieldName = 'Cgorod'
      Size = 50
    end
    object aspGetPersonAddressfIndex: TStringField
      DisplayLabel = #1048#1085#1076#1077#1082#1089
      DisplayWidth = 10
      FieldName = 'fIndex'
      Visible = False
      Size = 10
    end
    object aspGetPersonAddressCStreet: TStringField
      DisplayLabel = #1059#1083#1080#1094#1072
      DisplayWidth = 20
      FieldName = 'CStreet'
      Size = 80
    end
    object aspGetPersonAddressBuildingNumber: TStringField
      DisplayLabel = #1044#1086#1084
      FieldName = 'BuildingNumber'
      Size = 7
    end
    object aspGetPersonAddressStructNumber: TStringField
      DisplayLabel = #1050#1086#1088#1087#1091#1089
      FieldName = 'StructNumber'
      Size = 7
    end
    object aspGetPersonAddressFlatNumber: TStringField
      DisplayLabel = #1050#1074#1072#1088#1090#1080#1088#1072
      FieldName = 'FlatNumber'
      Size = 7
    end
    object aspGetPersonAddressAddressTypeName: TStringField
      DisplayLabel = #1058#1080#1087' '#1072#1076#1088#1077#1089#1072
      FieldName = 'AddressTypeName'
      Size = 30
    end
    object aspGetPersonAddressDateBegin: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
      FieldName = 'DateBegin'
    end
    object aspGetPersonAddressDateEnd: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
      FieldName = 'DateEnd'
    end
    object aspGetPersonAddressik_address: TIntegerField
      FieldName = 'ik_address'
      Visible = False
    end
    object aspGetPersonAddressIk_street: TIntegerField
      FieldName = 'Ik_street'
      Visible = False
    end
    object aspGetPersonAddressik_gorod: TIntegerField
      FieldName = 'ik_gorod'
      Visible = False
    end
    object aspGetPersonAddressIk_raion: TIntegerField
      FieldName = 'Ik_raion'
      Visible = False
    end
    object aspGetPersonAddressIk_region: TIntegerField
      FieldName = 'Ik_region'
      Visible = False
    end
    object aspGetPersonAddressIk_strana: TIntegerField
      FieldName = 'Ik_strana'
      Visible = False
    end
    object aspGetPersonAddressik_AddressType: TIntegerField
      FieldName = 'ik_AddressType'
      Visible = False
    end
    object aspGetPersonAddressik_personAddress: TAutoIncField
      FieldName = 'ik_personAddress'
      ReadOnly = True
      Visible = False
    end
  end
  object dsGetPersonAddress: TDataSource
    DataSet = aspGetPersonAddress
    Left = 319
    Top = 88
  end
  object aspSelKatChanges: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'SelKatChanges;1'
    Parameters = <>
    Left = 229
    Top = 173
  end
  object dsSelKatChanges: TDataSource
    DataSet = aspSelKatChanges
    Left = 292
    Top = 171
  end
  object adsGetParamNeedness: TADODataSet
    Connection = dm.DBConnect
    CommandText = 'select * from ABIT_GetParamNeedness()'
    Parameters = <>
    Left = 512
    Top = 136
  end
  object adoSelDocuments: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from SelStudDocuments(0)'
    Parameters = <>
    Left = 552
    Top = 320
    object adoSelDocumentsIK_doc: TIntegerField
      FieldName = 'IK_doc'
      Visible = False
    end
    object adoSelDocumentscvid_doc: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 150
      FieldName = 'cvid_doc'
      Size = 500
    end
    object adoSelDocumentsik_vid_doc: TIntegerField
      FieldName = 'ik_vid_doc'
      Visible = False
    end
    object adoSelDocumentscd_seria: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'cd_seria'
      Size = 10
    end
    object adoSelDocumentsnp_number: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'np_number'
      Size = 15
    end
    object adoSelDocumentsdd_vidan: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      FieldName = 'dd_vidan'
    end
    object adoSelDocumentscd_kem_vidan: TStringField
      DisplayLabel = #1050#1077#1084' '#1074#1099#1076#1072#1085
      DisplayWidth = 120
      FieldName = 'cd_kem_vidan'
      Size = 500
    end
    object adoSelDocumentsisreal: TBooleanField
      DisplayLabel = #1054#1088#1080#1075#1080#1085#1072#1083
      DisplayWidth = 25
      FieldName = 'isreal'
    end
    object adoSelDocumentsballs: TIntegerField
      DisplayLabel = #1044#1086#1087'. '#1073#1072#1083#1083
      DisplayWidth = 25
      FieldName = 'balls'
    end
    object adoSelDocumentsсname_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = #1089'name_disc'
    end
    object adoSelDocumentsaddinfo: TStringField
      FieldName = 'addinfo'
      Visible = False
    end
    object adoSelDocumentsik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adoSelDocumentsDocCount: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DocCount'
      Calculated = True
    end
  end
end
