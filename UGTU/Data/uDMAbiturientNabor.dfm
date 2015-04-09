object DMAbiturientNabor: TDMAbiturientNabor
  OldCreateOrder = False
  Height = 255
  Width = 755
  object adospAbitGetPostupStatistika: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[ABIT_GetAbitPostupList]'
      ''
      ''
      ''
      '')
    Left = 64
    Top = 16
  end
  object dsAbitGetPostupStatistika: TDataSource
    DataSet = adospAbitGetPostupStatistika
    Left = 57
    Top = 67
  end
  object adoqNaborList: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[ABIT_GetNaborList]'
      ''
      ''
      ''
      '')
    Left = 192
    Top = 24
  end
  object dsNaborList: TDataSource
    DataSet = adoqNaborList
    Left = 193
    Top = 67
  end
  object adospAbitNaborStatistik: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'ABIT_getNaborStatistik;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@objectType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@objectID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2008
      end
      item
        Name = '@NNyear'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2008
      end>
    Left = 296
    Top = 24
  end
  object dsAbitNaborStatistik: TDataSource
    DataSet = adospAbitNaborStatistik
    Left = 296
    Top = 72
  end
  object adoqNaborDiscs: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from ABIT_NaborDiscs'
      ''
      ''
      ''
      '')
    Left = 440
    Top = 16
    object adoqNaborDiscsik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adoqNaborDiscsbit_Profil: TBooleanField
      FieldName = 'bit_Profil'
      Visible = False
    end
    object adoqNaborDiscsbit_Concurs: TBooleanField
      FieldName = 'bit_Concurs'
      Visible = False
    end
    object adoqNaborDiscsNNrecord: TIntegerField
      FieldName = 'NNrecord'
      Visible = False
    end
    object adoqNaborDiscsik_disc_nabor: TIntegerField
      FieldName = 'ik_disc_nabor'
      Visible = False
    end
    object adoqNaborDiscsCname_fac: TStringField
      FieldName = 'Cname_fac'
      Visible = False
      Size = 50
    end
    object adoqNaborDiscsCshort_name_fac: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      FieldName = 'Cshort_name_fac'
      ReadOnly = True
    end
    object adoqNaborDiscsik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
    object adoqNaborDiscsCname_spec: TStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'Cname_spec'
      ReadOnly = True
      Size = 150
    end
    object adoqNaborDiscsCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Visible = False
      Size = 10
    end
    object adoqNaborDiscsik_fac: TIntegerField
      FieldName = 'ik_fac'
      Visible = False
    end
    object adoqNaborDiscsik_spec: TIntegerField
      FieldName = 'ik_spec'
      Visible = False
    end
    object adoqNaborDiscsNNyear: TIntegerField
      FieldName = 'NNyear'
      Visible = False
    end
    object adoqNaborDiscsMin_ball: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1052#1080#1085'. '#1073#1072#1083#1083
      FieldName = 'Min_ball'
    end
    object adoqNaborDiscsDiscName: TStringField
      FieldKind = fkLookup
      FieldName = 'DiscName'
      LookupDataSet = adotAbitDisc
      LookupKeyFields = 'ik_disc'
      LookupResultField = #1089'name_disc'
      KeyFields = 'ik_disc'
      Size = 500
      Lookup = True
    end
  end
  object dsNaborDiscs: TDataSource
    DataSet = adoqNaborDiscs
    Left = 441
    Top = 67
  end
  object adotAbitDisc: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'ABIT_Disc'
    Left = 520
    Top = 16
  end
  object adoqFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct fac.* from Fac, '
      
        #9'dbo.Relation_spec_fac, GetSpecAbitPermissionsFromRelTable() as ' +
        'permissionSpecList'
      'where'
      'Fac.ik_fac=Relation_spec_fac.ik_fac'
      'and Relation_spec_fac.ik_spec_fac=permissionSpecList.ik_spec_fac'
      ''
      '')
    Left = 217
    Top = 125
    object adoqFacIk_fac: TAutoIncField
      FieldName = 'Ik_fac'
      ReadOnly = True
    end
    object adoqFacCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object adoqFacCshort_name_fac: TStringField
      FieldName = 'Cshort_name_fac'
    end
    object adoqFacfDateExit: TDateTimeField
      FieldName = 'fDateExit'
    end
  end
  object dsFac: TDataSource
    DataSet = adoqFac
    Left = 217
    Top = 180
  end
  object adoqSpecFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[ABIT_GetSpecList]'
      '(2012,0)'
      'order by Sortorder,Ik_form_ed'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 85
    Top = 125
    object adoqSpecFacik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adoqSpecFacik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adoqSpecFacCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 250
    end
    object adoqSpecFacCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object adoqSpecFacCshort_name_fac: TStringField
      FieldName = 'Cshort_name_fac'
    end
    object adoqSpecFacik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adoqSpecFacCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object adoqSpecFacik_direction: TIntegerField
      FieldName = 'ik_direction'
    end
    object adoqSpecFacSortorder: TIntegerField
      FieldName = 'Sortorder'
    end
    object adoqSpecFacIk_form_ed: TIntegerField
      FieldName = 'Ik_form_ed'
    end
  end
  object dsSpecFac: TDataSource
    DataSet = adoqSpecFac
    Left = 85
    Top = 180
  end
  object adoqAbitExams: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * FROM [UGTU].[dbo].[ABit_Exam_View]'
      ''
      ''
      ''
      ''
      ''
      ''
      'order by NNyear, ik_fac, ik_spec, NN_abit, OrderNumber')
    Left = 296
    Top = 136
  end
  object adoqExamsErrors: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].ABIT_GetExamsErrors'
      '(2012)'
      ''
      ''
      ''
      '')
    Left = 416
    Top = 152
  end
  object dsExamsErrors: TDataSource
    DataSet = adoqExamsErrors
    Left = 417
    Top = 195
  end
end
