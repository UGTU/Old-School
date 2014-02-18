object dmPrikaz: TdmPrikaz
  OldCreateOrder = False
  Height = 176
  Width = 494
  object dsPrikazold: TDataSource
    DataSet = adodsPrikazold
    Left = 272
    Top = 95
  end
  object adodsPrikazold: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adodsPrikazCalcFields
    CommandText = 
      'select *, [Nn_prikaz]+'#39' '#1086#1090' '#39'+CONVERT(VARCHAR(10),[Dd_prikaz],104' +
      ') NN_Date from Prikaz '#13#10'order by Nn_prikaz'
    Parameters = <>
    Left = 270
    Top = 49
    object adodsPrikazoldIk_prikaz: TIntegerField
      FieldName = 'Ik_prikaz'
      Visible = False
    end
    object adodsPrikazoldNn_prikaz: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'Nn_prikaz'
      Size = 10
    end
    object adodsPrikazoldNamePrikaz: TStringField
      FieldName = 'NamePrikaz'
      Visible = False
      Size = 100
    end
    object adodsPrikazoldDd_prikaz: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '
      FieldName = 'Dd_prikaz'
    end
    object adodsPrikazoldDd_prikazVst: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
      FieldName = 'Dd_prikazVst'
    end
    object adodsPrikazoldik_typePrikaz: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'ik_typePrikaz'
      Visible = False
    end
    object adodsPrikazoldName_type: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072
      FieldKind = fkLookup
      FieldName = 'Name_type'
      LookupDataSet = adodsPrikType
      LookupKeyFields = 'ik_typePrikaz'
      LookupResultField = 'cTypePrikaz'
      KeyFields = 'ik_typePrikaz'
      Lookup = True
    end
    object adodsPrikazoldNN_Date: TStringField
      FieldName = 'NN_Date'
      ReadOnly = True
      Size = 34
    end
  end
  object dsPrikType: TDataSource
    DataSet = adodsPrikType
    Left = 380
    Top = 86
  end
  object adodsPrikType: TADODataSet
    Active = True
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'typePrikaz'
    CommandType = cmdTable
    Parameters = <>
    Left = 383
    Top = 48
  end
  object aspPrikaz: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filter = 'object ADOStoredProc1: TADOStoredProc'
    ProcedureName = 'AppendPrikaz;1'
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
        Name = '@Nn_prikaz'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Ddprikaz'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DdVst'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_typePrikaz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 50
    Top = 46
  end
  object dsPrikaz: TDataSource
    DataSet = adodsPrikaz
    Left = 184
    Top = 95
  end
  object adodsPrikaz: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    OnCalcFields = adodsPrikazCalcFields
    ProcedureName = 'SelPrikazs'
    Parameters = <>
    Left = 184
    Top = 48
    object adodsPrikazIk_prikaz: TAutoIncField
      FieldName = 'Ik_prikaz'
      ReadOnly = True
      Visible = False
    end
    object adodsPrikazNn_prikaz: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
      DisplayWidth = 30
      FieldName = 'Nn_prikaz'
      Size = 11
    end
    object adodsPrikazik_typePrikaz: TIntegerField
      FieldName = 'ik_typePrikaz'
      Visible = False
    end
    object adodsPrikazDd_prikaz: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
      DisplayWidth = 30
      FieldName = 'Dd_prikaz'
    end
    object adodsPrikazDd_prikazVst: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
      DisplayWidth = 30
      FieldName = 'Dd_prikazVst'
    end
    object adodsPrikazNamePrikaz: TStringField
      FieldName = 'NamePrikaz'
      Visible = False
      Size = 100
    end
    object adodsPrikazcTypePrikaz: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'cTypePrikaz'
      Size = 100
    end
    object adodsPrikazNN_Date: TStringField
      FieldName = 'NN_Date'
      ReadOnly = True
      Size = 34
    end
  end
end
