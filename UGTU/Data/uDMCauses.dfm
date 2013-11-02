object dmCauses: TdmCauses
  OldCreateOrder = False
  Height = 165
  Width = 847
  object dsJoinCause: TDataSource
    DataSet = adodsJoinCause
    Left = 260
    Top = 52
  end
  object adodsJoinCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=1'
    Parameters = <>
    Left = 260
    Top = 8
    object adodsJoinCauseIk_pric: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object adodsJoinCauseCname_pric: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object adodsJoinCauseikTypePric: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object adodsExCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=2'
    Parameters = <>
    Left = 320
    Top = 8
    object AutoIncField1: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField13: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField12: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsExCause: TDataSource
    DataSet = adodsExCause
    Left = 320
    Top = 52
  end
  object adodsExile: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Pricina'
    CommandType = cmdTable
    Parameters = <>
    Left = 34
    Top = 9
  end
  object dsExile: TDataSource
    DataSet = adodsExile
    Left = 32
    Top = 54
  end
  object dsCauseChangePass: TDataSource
    DataSet = adodsCauseChangePass
    Left = 156
    Top = 52
  end
  object adodsCauseChangePass: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=5'
    Parameters = <>
    Left = 156
    Top = 8
    object AutoIncField7: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField19: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField18: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsAcademCause: TDataSource
    DataSet = adodsAcademCause
    Left = 372
    Top = 52
  end
  object adodsAcademCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=4'
    Parameters = <>
    Left = 372
    Top = 8
    object AutoIncField5: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField17: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField16: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object adodsCauseLastName: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=6'
    Parameters = <>
    Left = 208
    Top = 8
    object AutoIncField6: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField18: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField17: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsCauseLastName: TDataSource
    DataSet = adodsCauseLastName
    Left = 208
    Top = 52
  end
  object adodsRestoreCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where (ik_Pric=116)'
    Parameters = <>
    Left = 96
    Top = 8
    object AutoIncField2: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField14: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField13: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsRestoreCause: TDataSource
    DataSet = adodsRestoreCause
    Left = 96
    Top = 52
  end
  object dsMoveFromCause: TDataSource
    DataSet = adodsMoveFromCause
    Left = 430
    Top = 51
  end
  object adodsMoveFromCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=18'
    Parameters = <>
    Left = 430
    Top = 6
    object AutoIncField3: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField15: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField14: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsMoveToCause: TDataSource
    DataSet = adodsMoveToCause
    Left = 482
    Top = 53
  end
  object adodsMoveToCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=17'
    Parameters = <>
    Left = 484
    Top = 8
    object AutoIncField4: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField16: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField15: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsSessionExtendCauses: TDataSource
    DataSet = adodsSessionExtendCauses
    Left = 554
    Top = 53
  end
  object adodsSessionExtendCauses: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=29'
    Parameters = <>
    Left = 556
    Top = 8
    object AutoIncField8: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
  object dsKatZachCause: TDataSource
    DataSet = adodsKatZachCause
    Left = 666
    Top = 53
  end
  object adodsKatZachCause: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Pricina '#13#10'where  ikTypePric=34'
    Parameters = <>
    Left = 668
    Top = 8
    object AutoIncField9: TAutoIncField
      FieldName = 'Ik_pric'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'ikTypePric'
    end
  end
end
