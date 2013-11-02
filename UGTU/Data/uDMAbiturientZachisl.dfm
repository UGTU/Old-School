object DMAbiturientZachisl: TDMAbiturientZachisl
  OldCreateOrder = False
  Height = 319
  Width = 483
  object adospAbitSpisokForZachisl: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'ABIT_Get_Abit_ForZachislenie;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nnyear'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 56
    Top = 13
    object adospAbitSpisokForZachislnn_abit: TAutoIncField
      FieldName = 'nn_abit'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislfio: TStringField
      DisplayLabel = #1060#1048#1054
      DisplayWidth = 50
      FieldName = 'fio'
      ReadOnly = True
      Size = 92
    end
    object adospAbitSpisokForZachislcshort_name_fac: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      DisplayWidth = 15
      FieldName = 'cshort_name_fac'
      ReadOnly = True
    end
    object adospAbitSpisokForZachislcname_spec: TStringField
      DisplayLabel = 'C'#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      DisplayWidth = 15
      FieldName = 'cname_spec'
      ReadOnly = True
      Size = 150
    end
    object adospAbitSpisokForZachislcname_zach: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      DisplayWidth = 20
      FieldName = 'cname_zach'
      ReadOnly = True
      Size = 30
    end
    object adospAbitSpisokForZachislcname_kat_zach: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'cname_kat_zach'
      ReadOnly = True
      Size = 50
    end
    object adospAbitSpisokForZachislSumBall: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
      DisplayWidth = 20
      FieldName = 'SumBall'
      ReadOnly = True
    end
    object adospAbitSpisokForZachislik_zach: TAutoIncField
      FieldName = 'ik_zach'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislNNrecord: TAutoIncField
      FieldName = 'NNrecord'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislik_spec: TAutoIncField
      FieldName = 'ik_spec'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislik_fac: TAutoIncField
      FieldName = 'ik_fac'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislik_type_kat: TIntegerField
      FieldName = 'ik_type_kat'
      Visible = False
    end
    object adospAbitSpisokForZachislbit_Lgota: TBooleanField
      FieldName = 'bit_Lgota'
      Visible = False
    end
    object adospAbitSpisokForZachislbit_NotMinim: TIntegerField
      FieldName = 'bit_NotMinim'
      ReadOnly = True
      Visible = False
    end
    object adospAbitSpisokForZachislik_kat_zach: TAutoIncField
      FieldName = 'ik_kat_zach'
      ReadOnly = True
      Visible = False
    end
  end
  object dsAbitSpisokForZachisl: TDataSource
    DataSet = adospAbitSpisokForZachisl
    Left = 61
    Top = 72
  end
  object adospAbitZachisl: TADOStoredProc
    ProcedureName = 'ABIT_Zachisl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_abit'
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
    Left = 184
    Top = 14
  end
  object dsAbitSpisokForPrikaz: TDataSource
    Left = 187
    Top = 79
  end
  object adoqAbitMinBalls: TADOQuery
    Connection = dm.DBConnect
    Parameters = <>
    SQL.Strings = (
      'select * from ABIT_MinBalls')
    Left = 296
    Top = 16
  end
  object dsAbitMinBalls: TDataSource
    DataSet = adoqAbitMinBalls
    Left = 296
    Top = 80
  end
end
