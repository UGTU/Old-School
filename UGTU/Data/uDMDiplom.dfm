object dmDiplom: TdmDiplom
  OldCreateOrder = False
  Height = 333
  Width = 534
  object adospDiplomList: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDiplomsForGroup'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 804
      end>
    Left = 32
    Top = 24
    object adospDiplomListik_zach: TAutoIncField
      FieldName = 'ik_zach'
      ReadOnly = True
    end
    object adospDiplomListStudName: TStringField
      FieldName = 'StudName'
      ReadOnly = True
      Size = 93
    end
    object adospDiplomListRegNumber: TStringField
      FieldName = 'RegNumber'
      Size = 10
    end
    object adospDiplomListVipNumber: TStringField
      FieldName = 'VipNumber'
      Size = 12
    end
    object adospDiplomListDd_dipl: TDateTimeField
      FieldName = 'Dd_dipl'
    end
    object adospDiplomListDd_VidDipl: TDateTimeField
      FieldName = 'Dd_VidDipl'
    end
    object adospDiplomListCosenca: TIntegerField
      FieldName = 'Cosenca'
    end
    object adospDiplomListik_typeTema: TIntegerField
      FieldName = 'ik_typeTema'
    end
    object adospDiplomListik_pred: TIntegerField
      FieldName = 'ik_pred'
    end
    object adospDiplomListcTeacher: TStringField
      FieldName = 'cTeacher'
      Size = 500
    end
    object adospDiplomListcTema: TStringField
      DisplayWidth = 2000
      FieldName = 'cTema'
      Size = 2000
    end
    object adospDiplomListPredprName: TStringField
      FieldKind = fkLookup
      FieldName = 'PredprName'
      LookupDataSet = adotPredpr
      LookupKeyFields = 'Ik_pred'
      LookupResultField = 'Cname_pred'
      KeyFields = 'ik_pred'
      Lookup = True
    end
    object adospDiplomListTypeTemaName: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeTemaName'
      LookupDataSet = adotTypeTema
      LookupKeyFields = 'ik_typeTema'
      LookupResultField = 'cTypeTema'
      KeyFields = 'ik_typeTema'
      Lookup = True
    end
    object adospDiplomListExcelPatternName: TStringField
      DisplayWidth = 150
      FieldName = 'ExcelPatternName'
      LookupCache = True
      Size = 150
    end
    object adospDiplomListik_direction: TAutoIncField
      FieldName = 'ik_direction'
      ReadOnly = True
    end
    object adospDiplomListDiplVklDatPadez: TBooleanField
      FieldName = 'DiplVklDatPadez'
    end
    object adospDiplomListIk_fac: TAutoIncField
      FieldName = 'Ik_fac'
      ReadOnly = True
    end
    object adospDiplomListIsExcellent: TBooleanField
      FieldName = 'IsExcellent'
    end
    object adospDiplomListOverVUZ: TBooleanField
      FieldName = 'OverVUZ'
    end
    object adospDiplomListOverVWeekCount: TIntegerField
      FieldName = 'OverVWeekCount'
    end
    object adospDiplomListOverVUZName: TStringField
      FieldName = 'OverVUZName'
      Size = 150
    end
    object adospDiplomListVidGos: TIntegerField
      FieldName = 'VidGos'
    end
    object adospDiplomListDiplSeries: TStringField
      FieldName = 'DiplSeries'
      Size = 10
    end
    object adospDiplomListDiplNumber: TStringField
      FieldName = 'DiplNumber'
      Size = 15
    end
    object adospDiplomListProtNumber: TStringField
      FieldName = 'ProtNumber'
      Size = 12
    end
    object adospDiplomListProtDate: TDateTimeField
      FieldName = 'ProtDate'
    end
  end
  object dsDiplomList: TDataSource
    DataSet = adospDiplomList
    Left = 32
    Top = 88
  end
  object adotPredpr: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'Predpr'
    Left = 112
    Top = 24
  end
  object adotTypeTema: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'typeTema'
    Left = 192
    Top = 24
  end
  object adospSelKPForVipisca: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'SelKPForVipisca;1'
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
        Value = 5497
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 8
      end
      item
        Name = '@ik_CurGroup'
        DataType = ftString
        Size = 3
        Value = '125'
      end>
    Left = 32
    Top = 179
    object adospSelKPForVipiscaik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adospSelKPForVipiscacTema: TStringField
      FieldName = 'cTema'
      Size = 100
    end
    object adospSelKPForVipiscacOsenca: TStringField
      FieldName = 'cOsenca'
    end
    object adospSelKPForVipiscadiscName: TStringField
      FieldName = 'discName'
      Size = 500
    end
  end
  object adospSelKRForVipisca: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'SelKPForVipisca;1'
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
        Value = 5352
      end
      item
        Name = '@iK_vid_zanyat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 9
      end
      item
        Name = '@ik_CurGroup'
        DataType = ftInteger
        Value = 1052
      end>
    Left = 280
    Top = 175
    object adospSelKRForVipiscaik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adospSelKRForVipiscacTema: TStringField
      FieldName = 'cTema'
      Size = 100
    end
    object adospSelKRForVipiscacOsenca: TStringField
      FieldName = 'cOsenca'
    end
    object adospSelKRForVipiscadiscName: TStringField
      FieldName = 'discName'
      Size = 500
    end
  end
  object adospSelUspevForVipisca: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'SelUspevForVipisca;1'
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
        Value = 21406
      end
      item
        Name = '@ik_CurGroup'
        DataType = ftString
        Size = 4
        Value = '1770'
      end>
    Left = 156
    Top = 179
  end
  object adospGetVipiscaForDiplom: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetVipiscaForDiplom;1'
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
        Value = 5490
      end
      item
        Name = '@ik_CurGroup'
        DataType = ftInteger
        Value = 100
      end
      item
        Value = Null
      end>
    Left = 155
    Top = 248
    object adospGetVipiscaForDiplomStudName: TStringField
      FieldName = 'StudName'
      ReadOnly = True
      Size = 92
    end
    object adospGetVipiscaForDiplomDd_birth: TDateTimeField
      FieldName = 'Dd_birth'
    end
    object adospGetVipiscaForDiplomYearObuch: TIntegerField
      FieldName = 'YearObuch'
    end
    object adospGetVipiscaForDiplomyearPostup: TIntegerField
      FieldName = 'yearPostup'
      ReadOnly = True
    end
    object adospGetVipiscaForDiplomYearGrad: TIntegerField
      FieldName = 'YearGrad'
      ReadOnly = True
    end
    object adospGetVipiscaForDiplomVipNumber: TStringField
      FieldName = 'VipNumber'
      Size = 12
    end
    object adospGetVipiscaForDiplomRegNumber: TStringField
      FieldName = 'RegNumber'
      Size = 10
    end
    object adospGetVipiscaForDiplomDd_dipl: TDateTimeField
      FieldName = 'Dd_dipl'
    end
    object adospGetVipiscaForDiplomDd_VidDipl: TDateTimeField
      FieldName = 'Dd_VidDipl'
    end
    object adospGetVipiscaForDiplomCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object adospGetVipiscaForDiplomcName_spclz: TStringField
      FieldName = 'cName_spclz'
      Size = 150
    end
    object adospGetVipiscaForDiplomSpLine: TStringField
      FieldName = 'SpLine'
      ReadOnly = True
    end
    object adospGetVipiscaForDiplomdocum: TStringField
      FieldName = 'docum'
      ReadOnly = True
      Size = 72
    end
    object adospGetVipiscaForDiplomform: TStringField
      FieldName = 'form'
      ReadOnly = True
      Size = 58
    end
    object adospGetVipiscaForDiplomcdiplom: TStringField
      FieldName = 'cdiplom'
      ReadOnly = True
      Size = 533
    end
    object adospGetVipiscaForDiplomCname_qualif: TStringField
      FieldName = 'Cname_qualif'
      Size = 500
    end
    object adospGetVipiscaForDiplomtypeQualif: TStringField
      FieldName = 'typeQualif'
    end
    object adospGetVipiscaForDiplomClastname: TStringField
      FieldName = 'Clastname'
      ReadOnly = True
      Size = 100
    end
    object adospGetVipiscaForDiplomFirstName: TStringField
      FieldName = 'FirstName'
      ReadOnly = True
      Size = 100
    end
    object adospGetVipiscaForDiplomPatronymic: TStringField
      FieldName = 'Patronymic'
      ReadOnly = True
      Size = 100
    end
    object adospGetVipiscaForDiplomSpecategory: TStringField
      FieldName = 'Spec'#1057'ategory'
      Size = 50
    end
    object adospGetVipiscaForDiplomQualifShortName: TStringField
      FieldName = 'QualifShortName'
      Size = 300
    end
    object adospGetVipiscaForDiplomCplacebirth: TStringField
      FieldName = 'Cplacebirth'
      Size = 300
    end
    object adospGetVipiscaForDiplomattYear: TStringField
      FieldName = 'attYear'
      ReadOnly = True
      Size = 4
    end
    object adospGetVipiscaForDiplomAttSer: TStringField
      FieldName = 'AttSer'
      Size = 10
    end
    object adospGetVipiscaForDiplomAttNumber: TStringField
      FieldName = 'AttNumber'
      Size = 15
    end
    object adospGetVipiscaForDiplomdocumName: TStringField
      FieldName = 'documName'
      ReadOnly = True
      Size = 500
    end
    object adospGetVipiscaForDiplomMonthObuch: TIntegerField
      FieldName = 'MonthObuch'
    end
    object adospGetVipiscaForDiplomiClastname: TStringField
      FieldName = 'iClastname'
      Size = 30
    end
    object adospGetVipiscaForDiplomiFirstName: TStringField
      FieldName = 'iFirstName'
      Size = 30
    end
    object adospGetVipiscaForDiplomiPatronymic: TStringField
      FieldName = 'iPatronymic'
      Size = 30
    end
    object adospGetVipiscaForDiplomSh_spec: TStringField
      FieldName = 'Sh_spec'
      Size = 10
    end
    object adospGetVipiscaForDiplomOcencaDiplom: TStringField
      DisplayWidth = 50
      FieldName = 'OcencaDiplom'
      ReadOnly = True
      Size = 50
    end
    object adospGetVipiscaForDiplomManagerSmallName: TStringField
      FieldName = 'ManagerSmallName'
      Size = 60
    end
    object adospGetVipiscaForDiplomIsExcellent: TBooleanField
      FieldName = 'IsExcellent'
    end
    object adospGetVipiscaForDiplomIk_form_ed: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object adospGetVipiscaForDiplomik_direction: TIntegerField
      FieldName = 'ik_direction'
    end
    object adospGetVipiscaForDiplomOverVUZ: TBooleanField
      FieldName = 'OverVUZ'
    end
    object adospGetVipiscaForDiplomOverVWeekCount: TIntegerField
      FieldName = 'OverVWeekCount'
    end
    object adospGetVipiscaForDiplomOverVUZName: TStringField
      FieldName = 'OverVUZName'
      Size = 150
    end
    object adospGetVipiscaForDiplomik_spec: TAutoIncField
      FieldName = 'ik_spec'
      ReadOnly = True
    end
    object adospGetVipiscaForDiplomik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adospGetVipiscaForDiplomDateDiplomDelivery: TDateTimeField
      FieldName = 'DateDiplomDelivery'
    end
    object adospGetVipiscaForDiplomOchYearObuch: TIntegerField
      FieldName = 'OchYearObuch'
    end
    object adospGetVipiscaForDiplomIsFast: TBooleanField
      FieldName = 'IsFast'
    end
  end
  object adospAppendDiplom: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'AppendDiplom;1'
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
        Name = '@RegNumber'
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
        Name = '@VipNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
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
        Name = '@cTeacher'
        Attributes = [paNullable]
        DataType = ftString
        Size = 500
        Value = Null
      end
      item
        Name = '@ik_pred'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_typeTema'
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
        Name = '@Dd_dipl'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Dd_VidDipl'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 430
    Top = 43
    object StringField20: TStringField
      FieldName = 'StudName'
      ReadOnly = True
      Size = 92
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Dd_birth'
    end
    object IntegerField19: TIntegerField
      FieldName = 'YearObuch'
    end
    object IntegerField20: TIntegerField
      FieldName = 'yearPostup'
      ReadOnly = True
    end
    object IntegerField21: TIntegerField
      FieldName = 'YearGrad'
      ReadOnly = True
    end
    object StringField21: TStringField
      FieldName = 'VipNumber'
      Size = 10
    end
    object IntegerField22: TIntegerField
      FieldName = 'RegNumber'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Dd_dipl'
    end
    object StringField22: TStringField
      FieldName = 'Cname_spec'
      Size = 80
    end
    object StringField23: TStringField
      FieldName = 'cName_spclz'
      Size = 80
    end
    object StringField24: TStringField
      FieldName = 'SpLine'
      ReadOnly = True
    end
    object StringField25: TStringField
      FieldName = 'docum'
      ReadOnly = True
      Size = 72
    end
    object StringField26: TStringField
      FieldName = 'form'
      ReadOnly = True
      Size = 58
    end
  end
  object dsAppendDiplom: TDataSource
    DataSet = adospAppendDiplom
    Left = 430
    Top = 101
  end
  object adospSelPractForVipisca: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelPractForVipisca;1'
    Parameters = <>
    Left = 27
    Top = 248
  end
  object adospSelGOSForVipisca: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelGOSForVipisca;1'
    Parameters = <>
    Left = 283
    Top = 248
  end
  object adospGetVipiscaCommonInf: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetVipiscaCommonInf;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_CurGroup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 416
    Top = 175
    object IntegerField1: TIntegerField
      FieldName = 'ik_disc'
    end
    object StringField1: TStringField
      FieldName = 'cTema'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'cOsenca'
    end
    object StringField3: TStringField
      FieldName = 'discName'
      Size = 500
    end
  end
end
