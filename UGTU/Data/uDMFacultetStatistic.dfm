object dmFacultetStatistic: TdmFacultetStatistic
  OldCreateOrder = False
  Height = 250
  Width = 318
  object adospSmallKont: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectSmallKont;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 148
    Top = 37
    object adospSmallKontik_spec: TIntegerField
      FieldName = 'ik_spec'
      Visible = False
    end
    object adospSmallKontDSDesigner: TStringField
      FieldName = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      ReadOnly = True
      Size = 59
    end
    object adospSmallKontDSDesigner2: TIntegerField
      FieldName = #1050#1091#1088#1089
      ReadOnly = True
    end
    object adospSmallKontDSDesigner3: TIntegerField
      FieldName = #1041#1102#1076#1078#1077#1090
    end
    object adospSmallKontDSDesigner4: TIntegerField
      FieldName = #1050#1086#1085#1090#1088#1072#1082#1090
    end
    object adospSmallKontDSDesigner5: TIntegerField
      FieldName = #1062#1050#1055
    end
    object adospSmallKontDSDesigner6: TIntegerField
      FieldName = #1042' '#1072#1082#1072#1076'. '#1086#1090#1087'.'
    end
  end
  object dsSmallKont: TDataSource
    DataSet = adospSmallKont
    Left = 150
    Top = 84
  end
  object dsSelKont: TDataSource
    DataSet = adospSelKont
    Left = 55
    Top = 82
  end
  object adospSelKont: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectKont;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 54
    Top = 39
  end
  object adospSelKursItogi: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandTimeout = 300000
    ProcedureName = 'SelItogiExForKurs;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sem'
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
      end>
    Left = 145
    Top = 141
  end
  object dsSelKursItogi: TDataSource
    DataSet = adospSelKursItogi
    Left = 142
    Top = 184
  end
  object adospSelItogiFac: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandTimeout = 300000
    ProcedureName = 'SelItogiForFac;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sem'
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
      end>
    Left = 231
    Top = 142
  end
  object dsSelItogiFac: TDataSource
    DataSet = adospSelItogiFac
    Left = 228
    Top = 185
  end
  object adospSelKursItogiCol: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = adospSelKursItogiColCalcFields
    CommandTimeout = 300
    ProcedureName = 'SelItogiCountForKurs;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sem'
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
      end>
    Left = 231
    Top = 40
    object adospSelKursItogiColik_grup: TIntegerField
      FieldName = 'ik_grup'
      Visible = False
    end
    object adospSelKursItogiColKurs: TIntegerField
      FieldName = 'Kurs'
      ReadOnly = True
      Visible = False
    end
    object adospSelKursItogiColCname_grup: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 15
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adospSelKursItogiColobcol: TIntegerField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      DisplayWidth = 10
      FieldName = 'obcol'
      ReadOnly = True
    end
    object adospSelKursItogiColacademcol: TIntegerField
      DisplayLabel = #1042' '#1072#1082#1072#1076#1077#1084'. '#1086#1090#1087#1091#1089#1082#1077
      DisplayWidth = 12
      FieldName = 'academcol'
      ReadOnly = True
    end
    object adospSelKursItogiColdopcol: TIntegerField
      DisplayLabel = #1044#1086#1087#1091#1097#1077#1085#1085#1099#1093
      FieldName = 'dopcol'
      ReadOnly = True
    end
    object adospSelKursItogiColotlcol: TIntegerField
      DisplayLabel = #1054#1090#1083#1080#1095#1085#1080#1082#1086#1074
      FieldName = 'otlcol'
      ReadOnly = True
    end
    object adospSelKursItogiColhorcol: TIntegerField
      DisplayLabel = #1061#1086#1088#1086#1096#1080#1089#1090#1086#1074
      FieldName = 'horcol'
      ReadOnly = True
    end
    object adospSelKursItogiColudcol: TIntegerField
      DisplayLabel = #1048#1084#1077#1102#1097#1080#1093' '#1090#1088#1086#1081#1082#1080
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'udcol'
      Calculated = True
    end
    object adospSelKursItogiColneudcol: TIntegerField
      DisplayLabel = #1053#1077#1091#1089#1087#1077#1074#1072#1102#1097#1080#1093
      FieldName = 'neudcol'
      ReadOnly = True
    end
  end
  object dsSelKursItogiCol: TDataSource
    DataSet = adospSelKursItogiCol
    Left = 232
    Top = 71
  end
  object dsSelDaysItogi: TDataSource
    DataSet = adospSelDaysItogi
    Left = 53
    Top = 181
  end
  object adospSelDaysItogi: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'SELECT * from SelDaysItogiForfac(7,null)'
    CommandTimeout = 3000
    Parameters = <>
    Left = 53
    Top = 139
    object adospSelDaysItogiDd_exam: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1101#1082#1079#1072#1084#1077#1085#1072
      FieldName = 'Dd_exam'
    end
    object adospSelDaysItogiik_grup: TIntegerField
      FieldName = 'ik_grup'
      Visible = False
    end
    object adospSelDaysItogiCname_grup: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 15
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adospSelDaysItogicName_disc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      DisplayWidth = 20
      FieldName = 'cName_disc'
      Size = 50
    end
    object adospSelDaysItogiprepName: TStringField
      DisplayLabel = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100
      DisplayWidth = 20
      FieldName = 'prepName'
      Size = 60
    end
    object adospSelDaysItogistudCount: TIntegerField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      FieldName = 'studCount'
    end
    object adospSelDaysItogidopCount: TIntegerField
      DisplayLabel = #1044#1086#1087#1091#1097#1077#1085#1085#1099#1093
      FieldName = 'dopCount'
    end
    object adospSelDaysItogiotlCount: TIntegerField
      DisplayLabel = #1054#1090#1083#1080#1095#1085#1080#1082#1086#1074
      FieldName = 'otlCount'
    end
    object adospSelDaysItogihorCount: TIntegerField
      DisplayLabel = #1061#1086#1088#1086#1096#1080#1089#1090#1086#1074
      FieldName = 'horCount'
    end
    object adospSelDaysItogiudCount: TIntegerField
      DisplayLabel = #1057#1076#1072#1074#1096#1080#1093' '#1085#1072' '#1089#1084#1077#1096'. '#1086#1094#1077#1085#1082#1080
      FieldName = 'udCount'
    end
    object adospSelDaysItogineudCount: TIntegerField
      DisplayLabel = #1053#1077#1089#1076#1072#1074#1096#1080#1093
      FieldName = 'neudCount'
    end
    object adospSelDaysItogiFac: TStringField
      FieldName = 'Fac'
      Visible = False
    end
  end
end
