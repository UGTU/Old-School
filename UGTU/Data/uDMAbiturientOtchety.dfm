object dmAbiturientOtchety: TdmAbiturientOtchety
  OldCreateOrder = False
  Height = 418
  Width = 551
  object adospAbitRaspKab: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_raspkab;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_rasp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 42
    Top = 26
    object AutoIncField11: TAutoIncField
      FieldName = 'ik_room'
      ReadOnly = True
      Visible = False
    end
    object AuditName: TStringField
      DisplayLabel = #1040#1091#1076#1080#1090#1086#1088#1080#1103
      DisplayWidth = 20
      FieldName = 'Cname_room'
      ReadOnly = True
      Size = 50
    end
    object SeatCount: TWordField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1090
      FieldName = 'iSeatCount'
    end
    object id_asp_kab: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
  end
  object adoPrintExams: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_ekz_SpisokForZayavl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 121
    Top = 21
    object adoPrintExamsik_disc: TIntegerField
      FieldName = 'ik_disc'
      ReadOnly = True
    end
    object adoPrintExamsname_disc: TStringField
      FieldName = #1089'name_disc'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object adoPrintExamsik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      ReadOnly = True
    end
    object adoPrintExamscosenka: TIntegerField
      FieldName = 'cosenka'
      ReadOnly = True
    end
    object adoPrintExamsNNvedom: TStringField
      FieldName = 'NNvedom'
      ReadOnly = True
    end
  end
  object adospAbitGetZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'ABIT_Get_ekz_SpisokForZayavl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NN_abit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 109
    Top = 131
  end
  object adospAbitZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_InfForZhurnal;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_spec_fac'
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
        Name = '@NNyear'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = 2008
      end>
    Left = 33
    Top = 130
    object adospAbitZhurnalNN_abit: TAutoIncField
      FieldName = 'NN_abit'
      ReadOnly = True
    end
    object adospAbitZhurnalnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adospAbitZhurnalRegNomer: TIntegerField
      FieldName = 'RegNomer'
    end
    object adospAbitZhurnaldd_pod_zayav: TDateTimeField
      FieldName = 'dd_pod_zayav'
      ReadOnly = True
    end
    object adospAbitZhurnalStudname: TStringField
      FieldName = 'Studname'
      ReadOnly = True
      Size = 92
    end
    object adospAbitZhurnalDd_birth: TDateTimeField
      FieldName = 'Dd_birth'
    end
    object adospAbitZhurnallSex: TBooleanField
      FieldName = 'lSex'
    end
    object adospAbitZhurnalcName_zaved: TStringField
      FieldName = 'cName_zaved'
      Size = 100
    end
    object adospAbitZhurnalik_kat_zaved: TIntegerField
      FieldName = 'ik_kat_zaved'
    end
    object adospAbitZhurnalCname_pred: TStringField
      FieldName = 'Cname_pred'
      Size = 100
    end
    object adospAbitZhurnalcDolgnost: TStringField
      FieldName = 'cDolgnost'
      Size = 50
    end
    object adospAbitZhurnalStazYear: TIntegerField
      FieldName = 'StazYear'
    end
    object adospAbitZhurnalStazMonth: TIntegerField
      FieldName = 'StazMonth'
    end
    object adospAbitZhurnalCname_kat_zach: TStringField
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object adospAbitZhurnalcIndex_fact: TStringField
      FieldName = 'cIndex_fact'
      Size = 6
    end
    object adospAbitZhurnalIk_Street_fact: TIntegerField
      FieldName = 'Ik_Street_fact'
    end
    object adospAbitZhurnalAddressf: TStringField
      FieldName = 'Addressf'
      ReadOnly = True
      Size = 21
    end
    object adospAbitZhurnalcIndex_prop: TStringField
      FieldName = 'cIndex_prop'
      Size = 6
    end
    object adospAbitZhurnalIk_Street_prop: TIntegerField
      FieldName = 'Ik_Street_prop'
    end
    object adospAbitZhurnalAddressp: TStringField
      FieldName = 'Addressp'
      ReadOnly = True
      Size = 21
    end
    object adospAbitZhurnalcSotTel: TStringField
      FieldName = 'cSotTel'
      Size = 50
    end
    object adospAbitZhurnalctelefon: TStringField
      FieldName = 'ctelefon'
    end
    object adospAbitZhurnalLobchegit: TBooleanField
      FieldName = 'Lobchegit'
    end
    object adospAbitZhurnalik_medal: TIntegerField
      FieldName = 'ik_medal'
    end
    object adospAbitZhurnalcKat_Zaved: TStringField
      FieldName = 'cKat_Zaved'
      Size = 150
    end
    object adospAbitZhurnalik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adospAbitZhurnallRussian: TBooleanField
      FieldName = 'lRussian'
    end
    object adospAbitZhurnalIsMain: TBooleanField
      FieldName = 'IsMain'
    end
    object adospAbitZhurnalRealy_postup: TBooleanField
      FieldName = 'Realy_postup'
    end
  end
  object adospAbitLangForZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_LangvsForZhurnal;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 180
    Top = 133
    object adospAbitLangForZhurnalnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adospAbitLangForZhurnalCname_lang: TStringField
      FieldName = 'Cname_lang'
      Size = 50
    end
  end
  object adospAbitDocsForZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_DocsForZhurnal;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 161
    Top = 197
    object adospAbitDocsForZhurnalnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adospAbitDocsForZhurnalNp_number: TStringField
      FieldName = 'Np_number'
      ReadOnly = True
      Size = 15
    end
    object adospAbitDocsForZhurnalCd_seria: TStringField
      FieldName = 'Cd_seria'
      ReadOnly = True
      Size = 10
    end
    object adospAbitDocsForZhurnalIk_vid_doc: TIntegerField
      FieldName = 'Ik_vid_doc'
    end
    object adospAbitDocsForZhurnalcvid_doc: TStringField
      FieldName = 'cvid_doc'
      ReadOnly = True
      Size = 50
    end
    object adospAbitDocsForZhurnalDd_vidan: TDateTimeField
      FieldName = 'Dd_vidan'
    end
  end
  object adospAbitExForZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_Get_ekz_Spisok_ForZhurnal;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@dd_pod_zayav'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 37
    Top = 201
    object adospAbitExForZhurnalNN_abit: TIntegerField
      FieldName = 'NN_abit'
      ReadOnly = True
    end
    object adospAbitExForZhurnalik_disc: TIntegerField
      FieldName = 'ik_disc'
      ReadOnly = True
    end
    object adospAbitExForZhurnalcosenka: TIntegerField
      FieldName = 'cosenka'
      ReadOnly = True
    end
  end
  object adospItogiPostuplAbitList: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_AbitListForItogiPostupl;1'
    Parameters = <>
    Left = 302
    Top = 197
  end
  object adodsAbitReport: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'ABIT_Report'
    CommandType = cmdTable
    Parameters = <>
    Left = 187
    Top = 19
  end
  object dsAbitReport: TDataSource
    DataSet = adodsAbitReport
    Left = 188
    Top = 57
  end
  object dsSelStat: TDataSource
    DataSet = adospSelStat
    Left = 258
    Top = 52
  end
  object adospSelStat: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from Abit_StatisticNew(2007,6,'#39'2007-07-01'#39',7)'
    Parameters = <>
    Left = 258
    Top = 22
  end
  object adospAbitAddressForZhurnal: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ABIT_get_AddrForZhurnal;1'
    Parameters = <>
    Left = 86
    Top = 269
    object adospAbitAddressForZhurnalIk_street: TIntegerField
      FieldName = 'Ik_street'
      ReadOnly = True
    end
    object adospAbitAddressForZhurnalAddress: TStringField
      FieldName = 'Address'
      ReadOnly = True
      Size = 359
    end
  end
  object adospABITGetPredvSpisok: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandTimeout = 3000000
    ProcedureName = 'ABIT_GetPredvSpisok;1'
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
    Left = 230
    Top = 269
  end
  object adospAbitGetDinamika: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandTimeout = 3000000
    ProcedureName = 'Abit_GetDinamika;1'
    Parameters = <>
    Left = 78
    Top = 333
  end
  object adoqExamStatistic: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[ABIT_GetExamStatistic]'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 432
    Top = 264
  end
end
