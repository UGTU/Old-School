object dmUspevaemost: TdmUspevaemost
  OldCreateOrder = False
  Height = 979
  Width = 792
  object dsSelVedEkz: TDataSource
    DataSet = adospSelVedEkz
    Left = 294
    Top = 88
  end
  object adospSelVedEkz: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelVedForExam;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 293
    Top = 41
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
  object dsPredmGroup: TDataSource
    DataSet = adospPredmGroup
    Left = 554
    Top = 319
  end
  object adospPredmGroup: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetAllVedomostsForGrup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 551
    Top = 269
    object adospPredmGroupIk_ved: TAutoIncField
      FieldName = 'Ik_ved'
      ReadOnly = True
    end
    object adospPredmGroupCOLUMN1: TStringField
      FieldName = 'COLUMN1'
      ReadOnly = True
      Size = 152
    end
    object adospPredmGroupiK_disc: TAutoIncField
      FieldName = 'iK_disc'
      ReadOnly = True
    end
    object adospPredmGroupiK_vid_zanyat: TIntegerField
      FieldName = 'iK_vid_zanyat'
    end
  end
  object dsPrepodVed: TDataSource
    DataSet = adospPrepodVed
    Left = 214
    Top = 199
  end
  object adospPrepodVed: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelPrepodForVedom;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 153
  end
  object dsVedTop: TDataSource
    DataSet = adospVedTop
    Left = 370
    Top = 85
  end
  object adospVedTop: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelVedShapca;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 370
    Top = 41
    object adospVedTopCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 50
    end
    object adospVedTopn_sem: TWordField
      FieldName = 'n_sem'
    end
    object adospVedTopCname_grup: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adospVedTopcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
    object adospVedTopNamePrepod: TStringField
      FieldName = 'NamePrepod'
      ReadOnly = True
      Size = 152
    end
    object adospVedTopDd_exam: TStringField
      FieldName = 'Dd_exam'
      ReadOnly = True
      Size = 10
    end
    object adospVedTopcNumber_ved: TStringField
      FieldName = 'cNumber_ved'
      Size = 50
    end
    object adospVedTopiHour_gos: TIntegerField
      FieldName = 'iHour_gos'
    end
  end
  object dsSelVedGroup: TDataSource
    DataSet = adospSelVedGroup
    Left = 122
    Top = 432
  end
  object dsAppVed: TDataSource
    DataSet = adospAppVed
    Left = 376
    Top = 442
  end
  object adospAppVed: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendVedomost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cNumber_ved'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@Ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
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
        Name = '@Itab_n'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Ik_vid_exam'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dd_exam'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dD_vydano'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@lClose'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@lPriznak_napr'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@lVnosn'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ik_upContent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 377
    Top = 381
  end
  object dsSelVed: TDataSource
    DataSet = adospSelVed
    Left = 294
    Top = 204
  end
  object adospSelVed: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'UspevSelVed;1'
    Parameters = <>
    Left = 294
    Top = 151
  end
  object aspNapr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'AppendNapravl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iK_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Itab_n'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@EndDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Ik_vid_exam'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cNumber_napr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@dnev'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@zaoch'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@first'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@second'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@last'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@ecs'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@zach'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 550
    Top = 133
  end
  object dsNapr: TDataSource
    DataSet = aspNapr
    Left = 552
    Top = 189
  end
  object dsClearUspev: TDataSource
    DataSet = adospClearUspev
    Left = 457
    Top = 310
  end
  object adospClearUspev: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'ClearUspev;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 460
    Top = 265
  end
  object dsAppendUspev: TDataSource
    DataSet = adospAppendUspev
    Left = 208
    Top = 311
  end
  object adospAppendUspev: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendUspev;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Cosenca'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cTema'
        Attributes = [paNullable]
        DataType = ftString
        Size = 500
        Value = Null
      end
      item
        Name = '@i_balls'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 208
    Top = 264
  end
  object dsSelVedKP: TDataSource
    DataSet = adospSelVedKP
    Left = 217
    Top = 86
  end
  object adospSelVedKP: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedKPCalcFields
    ProcedureName = 'SelVedForKP;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 40
    object adospSelVedKPnCode: TIntegerField
      FieldName = 'nCode'
    end
    object adospSelVedKPStudName: TStringField
      FieldName = 'StudName'
      Size = 200
    end
    object adospSelVedKPNn_zach: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object adospSelVedKPKatZach: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object adospSelVedKPik_zach: TIntegerField
      FieldName = 'ik_zach'
    end
    object adospSelVedKPdopusc: TStringField
      FieldName = 'dopusc'
      ReadOnly = True
      Size = 1
    end
    object adospSelVedKPeCosenca: TIntegerField
      FieldName = 'eCosenca'
    end
    object adospSelVedKPnameOsenca: TStringField
      FieldName = 'nameOsenca'
      Size = 10
    end
    object adospSelVedKPcTema: TStringField
      FieldName = 'cTema'
      Size = 100
    end
    object adospSelVedKPNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
  end
  object dsGetAllPredms: TDataSource
    DataSet = adospGetAllPredms
    Left = 293
    Top = 321
  end
  object adospGetAllPredms: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'GetControlVidZanyat;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@bitExam'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 285
    Top = 267
  end
  object dsGetAllVeds4Group: TDataSource
    DataSet = adospGetAllVeds4Group
    Left = 468
    Top = 438
  end
  object adospGetAllVeds4Group: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    DataSource = dm.dsAbitAllExam
    ProcedureName = 'GetAllVedomostsForGrup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 468
    Top = 384
  end
  object dsSelVedBottom: TDataSource
    DataSet = adospSelVedBottom
    Left = 375
    Top = 195
  end
  object adospSelVedBottom: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelVedResults;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 377
    Top = 153
  end
  object adospCheckVedClose: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'CheckVedClose;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
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
    Left = 532
    Top = 18
  end
  object adospCloseNapr: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'CloseVedomost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dd_exam'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@itab_n'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 581
    Top = 84
  end
  object dsSelUspevForStud: TDataSource
    DataSet = adospSelUspevForStud
    Left = 130
    Top = 86
  end
  object adospSelUspevForStud: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelUspevForStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@n_sem'
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
      end>
    Left = 130
    Top = 40
  end
  object adospSelVedGroup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetSmallVedForGrup(3226)'
    Parameters = <>
    Left = 122
    Top = 378
    object adospSelVedGroupStudName: TStringField
      FieldName = 'StudName'
      Size = 60
    end
    object adospSelVedGroupNn_zach: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object adospSelVedGroupKatZach: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object adospSelVedGroupik_zach: TIntegerField
      FieldName = 'ik_zach'
    end
    object adospSelVedGroupdopusc: TBooleanField
      FieldName = 'dopusc'
      DisplayValues = #1076#1086#1087#1091#1097#1077#1085';'#1085#1077' '#1076#1086#1087#1091#1097#1077#1085
    end
    object adospSelVedGroupCosenca: TIntegerField
      FieldName = 'Cosenca'
    end
    object adospSelVedGroupcTema: TStringField
      DisplayWidth = 2000
      FieldName = 'cTema'
      Size = 2000
    end
    object adospSelVedGroupIsPassed: TBooleanField
      Alignment = taRightJustify
      FieldName = 'IsPassed'
    end
    object adospSelVedGroupi_balls: TIntegerField
      FieldName = 'i_balls'
    end
  end
  object dsGetDopuskForVedom: TDataSource
    DataSet = adodsGetDopuskForVedom
    Left = 105
    Top = 204
  end
  object adodsGetDopuskForVedom: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetDopuscForVedom(3226)'
    Parameters = <>
    Left = 103
    Top = 151
  end
  object dsGetDopuskForVedom0: TDataSource
    DataSet = adodsGetDopuskForVedom0
    Left = 123
    Top = 309
  end
  object adodsGetDopuskForVedom0: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetDopuscForVedom(3226)'
    Parameters = <>
    Left = 123
    Top = 264
  end
  object dsAppendRap: TDataSource
    DataSet = adospAppendRap
    Left = 455
    Top = 87
  end
  object adospAppendRap: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'AppendRaport;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
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
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
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
        Name = '@bitClose'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 454
    Top = 44
    object IntegerField7: TIntegerField
      FieldName = 'nCode'
    end
    object StringField7: TStringField
      FieldName = 'StudName'
      Size = 200
    end
    object StringField8: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object StringField9: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object IntegerField8: TIntegerField
      FieldName = 'ik_zach'
    end
    object StringField10: TStringField
      DisplayWidth = 10
      FieldName = 'dopusc'
      ReadOnly = True
      Size = 10
    end
    object IntegerField9: TIntegerField
      FieldName = 'zCosenca'
      ReadOnly = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'eCosenca'
    end
    object StringField11: TStringField
      FieldName = 'nameOsenca'
      Size = 10
    end
    object IntegerField11: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
    object StringField12: TStringField
      FieldName = 'nameZOsenca'
      Size = 10
    end
  end
  object ds4VinVed: TDataSource
    DataSet = adosp4VinVed
    Left = 557
    Top = 441
  end
  object adosp4VinVed: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'UspevGetControlVidZanyatForVnost;1'
    Parameters = <>
    Left = 557
    Top = 387
  end
  object dsInsertVedomost: TDataSource
    DataSet = adospInsertVedomost
    Left = 205
    Top = 444
  end
  object adospInsertVedomost: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'InsertVedomost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@cNumber_ved'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@Ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
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
        Name = '@Itab_n'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_vid_exam'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dd_exam'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dD_vydano'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@lClose'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@lVnosn'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 206
    Top = 382
  end
  object dsGetUpContRap: TDataSource
    DataSet = adospGetUpContRap
    Left = 368
    Top = 310
  end
  object adospGetUpContRap: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'UspevGetControlVidZanyatForRaport;1'
    Parameters = <>
    Left = 366
    Top = 263
    object adospGetUpContRapik_vid_zanyat: TIntegerField
      FieldName = 'ik_vid_zanyat'
    end
    object adospGetUpContRapik_disc: TAutoIncField
      FieldName = 'ik_disc'
      ReadOnly = True
    end
    object adospGetUpContRapcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
    object adospGetUpContRapik_upContent: TAutoIncField
      FieldName = 'ik_upContent'
      ReadOnly = True
    end
  end
  object adospUpdateDopusk: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'UspevUpdateDopuscs;1'
    Parameters = <>
    Left = 458
    Top = 153
    object StringField27: TStringField
      FieldName = 'Cname_fac'
      Size = 50
    end
    object WordField1: TWordField
      FieldName = 'n_sem'
    end
    object StringField28: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object StringField29: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
    object StringField30: TStringField
      FieldName = 'NamePrepod'
      ReadOnly = True
      Size = 152
    end
    object StringField31: TStringField
      FieldName = 'Dd_exam'
      ReadOnly = True
      Size = 10
    end
  end
  object dsUpdateDopusk: TDataSource
    DataSet = adospUpdateDopusk
    Left = 458
    Top = 197
  end
  object dsPredmStud: TDataSource
    DataSet = adospPredmStud
    Left = 294
    Top = 447
  end
  object adodsNapravl: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Napr_View'
    Parameters = <>
    Left = 121
    Top = 503
    object adodsNapravlIk_ved: TAutoIncField
      FieldName = 'Ik_ved'
      ReadOnly = True
    end
    object adodsNapravlCosenca: TIntegerField
      FieldName = 'Cosenca'
    end
    object adodsNapravlcTema: TStringField
      DisplayWidth = 2000
      FieldName = 'cTema'
      Size = 2000
    end
    object adodsNapravlclastname: TStringField
      FieldName = 'clastname'
      FixedChar = True
      Size = 30
    end
    object adodsNapravlcfirstname: TStringField
      FieldName = 'cfirstname'
      FixedChar = True
      Size = 30
    end
    object adodsNapravlcotch: TStringField
      FieldName = 'cotch'
      FixedChar = True
      Size = 30
    end
    object adodsNapravlcName_vid_zanyat: TStringField
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adodsNapravlcName_vid_exam: TStringField
      FieldName = 'cName_vid_exam'
      Size = 12
    end
    object adodsNapravlIk_zach: TIntegerField
      FieldName = 'Ik_zach'
    end
    object adodsNapravlOutcolumn: TStringField
      FieldName = 'Outcolumn'
      ReadOnly = True
      Size = 166
    end
    object adodsNapravlDd_exam: TDateTimeField
      FieldName = 'Dd_exam'
    end
    object adodsNapravlid_teacher: TIntegerField
      FieldName = 'id_teacher'
    end
  end
  object dsNapravl: TDataSource
    DataSet = adodsNapravl
    Left = 120
    Top = 558
  end
  object adodsMark: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Osenca'
    CommandType = cmdTable
    Parameters = <>
    Left = 205
    Top = 504
  end
  object dsMark: TDataSource
    DataSet = adodsMark
    Left = 205
    Top = 557
  end
  object dsGetAllAtt: TDataSource
    DataSet = adospGetAllAtt
    Left = 293
    Top = 561
  end
  object adospGetAllAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'GetAllAttestForGrup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 294
    Top = 507
  end
  object adospGetAttVidZan: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'GetAttestVidZanyat;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 375
    Top = 499
  end
  object dsGetAttVidZan: TDataSource
    DataSet = adospGetAttVidZan
    Left = 381
    Top = 561
  end
  object dsSelAttGroup: TDataSource
    DataSet = adodsSelAttGroup
    Left = 466
    Top = 560
  end
  object adodsSelAttGroup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetSmallAttForGrup(3226)'
    Parameters = <>
    Left = 466
    Top = 506
    object StringField1: TStringField
      FieldName = 'StudName'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object StringField3: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'ik_zach'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Cosenca'
    end
    object adodsSelAttGroupPropCount: TIntegerField
      FieldName = 'PropCount'
    end
    object adodsSelAttGroupUvag_PropCount: TIntegerField
      FieldName = 'Uvag_PropCount'
    end
  end
  object dsAppendRezAtt: TDataSource
    DataSet = adospAppendRezAtt
    Left = 560
    Top = 559
  end
  object adospAppendRezAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendRezAtt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Cosenca'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PropCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Uvag_PropCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 560
    Top = 512
  end
  object dsSelNapr: TDataSource
    DataSet = adospSelNapr
    Left = 120
    Top = 647
  end
  object adospSelNapr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelNapr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 118
    Top = 616
  end
  object dsGetAllVedNaprForGrup: TDataSource
    DataSet = adospGetAllVedNaprForGrup
    Left = 202
    Top = 651
  end
  object dsGetAllVedNaprForDisc: TDataSource
    DataSet = adospGetAllVedNaprForDisc
    Left = 293
    Top = 654
  end
  object adospGetAllVedNaprForDisc: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetAllVedNaprForDisc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 438
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 6
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 3
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 7
      end>
    Left = 293
    Top = 623
  end
  object dsSelAtt: TDataSource
    DataSet = adospSelAtt
    Left = 379
    Top = 655
  end
  object adospSelAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelAtt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_upContent'
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
      end
      item
        Name = '@nom_att'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 379
    Top = 626
  end
  object dsCloseAllAtt: TDataSource
    DataSet = adoCloseAllAtt
    Left = 465
    Top = 655
  end
  object adoCloseAllAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'CloseAllAttestForGrup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@numAtt'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 465
    Top = 626
  end
  object dsUpdateVedom: TDataSource
    DataSet = adospUpdateVedom
    Left = 560
    Top = 656
  end
  object adospUpdateVedom: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'UpdateVedomost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 562
    Top = 627
  end
  object adospGetNomerNapr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'getNomerNapr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 656
    Top = 158
  end
  object dsGetNomerNapr: TDataSource
    DataSet = adospGetNomerNapr
    Left = 658
    Top = 190
  end
  object dsGetAllNaprStud: TDataSource
    DataSet = adospGetAllNaprStud
    Left = 654
    Top = 316
  end
  object adospGetAllNaprStud: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetAllNaprStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 5531
      end>
    Left = 654
    Top = 266
    object adospGetAllNaprStudcName_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 54
      FieldName = 'cName_disc'
      Size = 100
    end
    object adospGetAllNaprStudcName_vid_zanyat: TStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
      DisplayWidth = 13
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adospGetAllNaprStudShortName: TStringField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      DisplayWidth = 14
      FieldName = 'ShortName'
    end
    object adospGetAllNaprStuddD_vydano: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 13
      FieldName = 'dd_vydano'
    end
    object adospGetAllNaprStudcName_vid_exam: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
      DisplayWidth = 17
      FieldName = 'cname_vid_exam'
    end
    object adospGetAllNaprStudDd_exam: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
      DisplayWidth = 14
      FieldName = 'dd_exam'
    end
    object adospGetAllNaprStudPrepName: TStringField
      DisplayLabel = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100
      DisplayWidth = 28
      FieldName = 'prepname'
      Size = 100
    end
    object adospGetAllNaprStudn_sem: TIntegerField
      DisplayLabel = #1057#1077#1084#1077#1089#1090#1088
      DisplayWidth = 8
      FieldName = 'n_sem'
    end
  end
  object adospGetAllVidZanyat: TADOQuery
    Connection = dm.DBConnect
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM [UspevGetVidZanyatForVedomost]'
      ''
      '')
    Left = 664
    Top = 392
  end
  object adospUspevDependVidZanyat: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'UspevGetDependVidZanyat;1'
    Parameters = <>
    Left = 662
    Top = 450
  end
  object adospSelVedWithDopusk: TADOStoredProc
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'UspevSelVedWithDopusk;1'
    Parameters = <>
    Left = 657
    Top = 504
    object IntegerField3: TIntegerField
      FieldName = 'nCode'
    end
    object StringField4: TStringField
      FieldName = 'StudName'
      Size = 200
    end
    object StringField5: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object StringField6: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object IntegerField4: TIntegerField
      FieldName = 'ik_zach'
    end
    object StringField13: TStringField
      DisplayWidth = 10
      FieldName = 'dopusc'
      ReadOnly = True
      Size = 10
    end
    object IntegerField5: TIntegerField
      FieldName = 'zCosenca'
      ReadOnly = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'eCosenca'
    end
    object StringField14: TStringField
      FieldName = 'nameOsenca'
      Size = 10
    end
    object IntegerField12: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
    object StringField15: TStringField
      FieldName = 'nameZOsenca'
      Size = 10
    end
  end
  object adospGetAllNaprForFac: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'GetAllNaprForFac;1'
    Parameters = <>
    Left = 657
    Top = 552
  end
  object dsGetAllNaprForFac: TDataSource
    DataSet = adospGetAllNaprForFac
    Left = 658
    Top = 599
  end
  object adospNaprRegister: TADOStoredProc
    Connection = dm.DBConnect
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'CreateNapravl;1'
    Parameters = <
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_upContent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Itab_n'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_vid_exam'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cNumber_napr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = '@Ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Cosenca'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cTema'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@dD_vydano'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Dd_exam'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 661
    Top = 95
  end
  object adospUspevStatForStud: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelStatisticForStud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 697
    Top = 643
  end
  object dsUspevStatForStud: TDataSource
    DataSet = adospUspevStatForStud
    Left = 642
    Top = 642
  end
  object adodsUspevForStipend: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectUspevForStipend;1'
    Parameters = <>
    Left = 118
    Top = 720
  end
  object dsSelAttBRSGroup: TDataSource
    DataSet = adodsSelAttBRSGroup
    Left = 202
    Top = 720
  end
  object adodsSelAttBRSGroup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetSmallBRSAttForGrup(3226)'
    Parameters = <>
    Left = 290
    Top = 714
    object StringField16: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
      FieldName = 'StudName'
      Size = 60
    end
    object StringField17: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1095#1105#1090#1082#1080
      FieldName = 'Nn_zach'
      Visible = False
      Size = 6
    end
    object IntegerField13: TIntegerField
      FieldName = 'ik_zach'
    end
    object StringField18: TStringField
      DisplayLabel = ' '
      FieldName = 'KatZach'
      Size = 2
    end
    object adodsSelAttBRSGroupi_balls: TIntegerField
      DisplayLabel = #1058#1077#1082#1091#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
      FieldName = 'i_balls'
    end
    object adodsSelAttBRSGroupi_sumballs: TIntegerField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085#1086' '#1088#1072#1085#1077#1077
      FieldName = 'i_sumballs'
    end
    object adodsSelAttBRSGroupPropCount: TIntegerField
      DisplayLabel = #1055#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'PropCount'
    end
    object adodsSelAttBRSGroupUvag_propCount: TIntegerField
      DisplayLabel = #1059#1074#1072#1078#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'Uvag_propCount'
    end
  end
  object adospAppendRezBRSAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendRezBRSAtt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@i_balls'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PropCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PropUvajCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 376
    Top = 720
  end
  object aspPrepodVedFromUchPlan: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelPrepodForVedom;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 560
    Top = 705
  end
  object dsPrepodVedFromUchPlan: TDataSource
    DataSet = aspPrepodVedFromUchPlan
    Left = 462
    Top = 721
  end
  object adsGetBRSVedomost: TADODataSet
    Connection = dm.DBConnect
    CommandText = 'select dbo.GetBRSVedomost(1,1,1)'
    Parameters = <>
    Left = 120
    Top = 768
  end
  object adospSaveDateAllAtt: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'Dek_SaveDateAllAtt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@numAtt'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DateAtt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 209
    Top = 778
  end
  object aspSetAttributesVedomost: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SetAttributesVedomost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dd_exam'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@itab_n'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 704
    Top = 705
  end
  object adsAvgBalls: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select *  from AverageBall'
    Parameters = <>
    Left = 357
    Top = 784
    object adsAvgBallsNameStud: TStringField
      FieldName = 'NameStud'
      ReadOnly = True
      Size = 92
    end
    object adsAvgBallsNn_zach: TStringField
      FieldName = 'Nn_zach'
      FixedChar = True
      Size = 6
    end
    object adsAvgBallsCname_grup: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adsAvgBallsAVGBall: TBCDField
      FieldName = 'AVGBall'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
  end
  object dsAvgBalls: TDataSource
    DataSet = adsAvgBalls
    Left = 282
    Top = 784
  end
  object adospGetBRSExamVidZan: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetBRSExamVidZanyat;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 439
    Top = 787
  end
  object adospGetAllBRSExam: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'GetAllBRSExamForGrup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_group'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 542
    Top = 771
  end
  object dsGetAllBRSExam: TDataSource
    DataSet = adospGetAllBRSExam
    Left = 557
    Top = 833
  end
  object adospSelBRSExam: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'SelBRSExam;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@n_sem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iK_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_vid_zanyat'
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
    Left = 438
    Top = 835
  end
  object dsSelBRSExamGroup: TDataSource
    DataSet = adodsSelBRSExamGroup
    Left = 658
    Top = 832
  end
  object adospAppendUspevKPTheme: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adospSelVedEkzCalcFields
    ProcedureName = 'AppendUspevKPTheme;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
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
        Name = '@ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@KPTheme'
        Attributes = [paNullable]
        DataType = ftString
        Size = 8000
        Value = Null
      end>
    Left = 636
    Top = 18
  end
  object adodsSelBRSExamGroup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = adodsSelBRSExamGroupCalcFields
    CommandText = 'select * from GetSmallBRSExamForGrup(3226)'
    Parameters = <>
    Left = 658
    Top = 778
    object StringField19: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
      FieldName = 'StudName'
      Size = 60
    end
    object StringField20: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1095#1105#1090#1082#1080
      FieldName = 'Nn_zach'
      Visible = False
      Size = 6
    end
    object IntegerField14: TIntegerField
      FieldName = 'ik_zach'
    end
    object StringField21: TStringField
      DisplayLabel = ' '
      FieldName = 'KatZach'
      Size = 2
    end
    object IntegerField15: TIntegerField
      DisplayLabel = #1058#1077#1082#1091#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
      FieldName = 'i_balls'
    end
    object IntegerField16: TIntegerField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085#1086' '#1088#1072#1085#1077#1077
      FieldName = 'i_sumballs'
    end
    object adodsSelBRSExamGroupi_sumall: TStringField
      DisplayLabel = #1048#1090#1086#1075#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
      FieldKind = fkCalculated
      FieldName = 'i_sumall'
      Calculated = True
    end
    object adodsSelBRSExamGroupi_grade: TIntegerField
      DisplayLabel = #1048#1090#1086#1075#1086#1074#1072#1103' '#1086#1094#1077#1085#1082#1072' ('#1087#1103#1090#1080#1073#1072#1083#1083#1100#1085#1072#1103')'
      FieldName = 'i_grade'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = #1055#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'PropCount'
    end
    object IntegerField18: TIntegerField
      DisplayLabel = #1059#1074#1072#1078#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'Uvag_propCount'
    end
  end
  object dsGetAverageBalls: TDataSource
    DataSet = adodsGetAverageBalls
    Left = 122
    Top = 864
  end
  object adodsGetAverageBalls: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from dbo.GetBRSAverageBallsForModule(1181, 3, 1)'
    Parameters = <>
    Left = 122
    Top = 810
    object adodsGetAverageBallsStudName: TStringField
      FieldName = 'StudName'
      Size = 60
    end
    object adodsGetAverageBallsNn_zach: TStringField
      FieldName = 'Nn_zach'
      Size = 6
    end
    object adodsGetAverageBallsKatZach: TStringField
      FieldName = 'KatZach'
      Size = 2
    end
    object adodsGetAverageBallsik_zach: TIntegerField
      FieldName = 'ik_zach'
    end
    object adodsGetAverageBallsi_balls: TFloatField
      FieldName = 'i_balls'
    end
  end
  object adsSelAllBRSBallsForStudent: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from GetALLBRSBallsForStud(17815)'
    Parameters = <>
    Left = 282
    Top = 842
    object adsSelAllBRSBallsForStudentn_sem: TIntegerField
      DisplayLabel = #1057#1077#1084#1077#1089#1090#1088
      FieldName = 'n_sem'
    end
    object adsSelAllBRSBallsForStudentn_module: TIntegerField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'n_module'
    end
    object adsSelAllBRSBallsForStudentc_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = 'c_disc'
      Size = 50
    end
    object adsSelAllBRSBallsForStudenti_balls: TIntegerField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
      FieldName = 'i_balls'
    end
    object adsSelAllBRSBallsForStudentPropCount: TIntegerField
      DisplayLabel = #1055#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'PropCount'
    end
    object adsSelAllBRSBallsForStudentUvag_propCount: TIntegerField
      DisplayLabel = #1059#1074#1072#1078#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1088#1086#1087#1091#1089#1082#1080
      FieldName = 'Uvag_propCount'
    end
  end
  object dsSelAllBRSBallsForStudent: TDataSource
    DataSet = adsSelAllBRSBallsForStudent
    Left = 282
    Top = 888
  end
  object adospAppendRezAttWithGrade: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendRezBRSAttWithGrade;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_ved'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_zach'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@i_balls'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@i_grade'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PropCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PropUvajCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 440
    Top = 888
  end
  object adospPredmStud: TADOStoredProc
    Active = True
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetAllVedomostsForNapr;1'
    Parameters = <
      item
        Name = '@ik_zach'
        DataType = ftInteger
        Size = 5
        Value = 39605
      end
      item
        Name = '@n_sem'
        DataType = ftInteger
        Size = 1
        Value = 2
      end>
    Left = 296
    Top = 384
    object adospPredmStudIk_ved: TAutoIncField
      FieldName = 'Ik_ved'
      ReadOnly = True
    end
    object adospPredmStudNaprName: TStringField
      FieldName = 'NaprName'
      ReadOnly = True
      Size = 552
    end
    object adospPredmStudiK_disc: TAutoIncField
      FieldName = 'iK_disc'
      ReadOnly = True
    end
    object adospPredmStudiK_vid_zanyat: TIntegerField
      FieldName = 'iK_vid_zanyat'
    end
    object adospPredmStudcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
  end
  object adospGetAllVedNaprForGrup: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetAllVedNaprForGrup;1'
    Parameters = <
      item
        Name = '@ik_group'
        DataType = ftInteger
        Size = 4
        Value = 1565
      end
      item
        Name = '@n_sem'
        DataType = ftInteger
        Value = 4
      end>
    Left = 201
    Top = 608
    object adospGetAllVedNaprForGrupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 552
    end
    object adospGetAllVedNaprForGrupiK_disc: TAutoIncField
      FieldName = 'iK_disc'
      ReadOnly = True
    end
    object adospGetAllVedNaprForGrupiK_vid_zanyat: TIntegerField
      FieldName = 'iK_vid_zanyat'
    end
    object adospGetAllVedNaprForGrupcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
  end
end
