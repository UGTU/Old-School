object dmUgtuStructure: TdmUgtuStructure
  OldCreateOrder = False
  Height = 443
  Width = 540
  object adoqSelAllGroups: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.TREE_groups')
    Left = 83
    Top = 13
  end
  object adodsFaculty: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Tree_Faculties'
    Parameters = <>
    Left = 153
    Top = 138
  end
  object dsFaculty: TDataSource
    DataSet = adodsFaculty
    Left = 151
    Top = 166
  end
  object adodsSpec: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Tree_specialties'
    Parameters = <>
    Left = 20
    Top = 131
  end
  object dsSpec: TDataSource
    DataSet = adodsSpec
    Left = 324
    Top = 139
  end
  object adodsGroups: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Tree_groups'
    Parameters = <>
    Left = 15
    Top = 14
  end
  object dsGroups: TDataSource
    DataSet = adodsGroups
    Left = 15
    Top = 74
  end
  object adodsGroup: TADODataSet
    CursorType = ctStatic
    CommandText = 'select Is_Member('#39'ist\students'#39')'
    Parameters = <>
    Left = 84
    Top = 73
  end
  object adoqFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct fac.* from Fac, '
      
        #9'dbo.Relation_spec_fac, dbo.GetSpecPermissionsFromRelTable() as ' +
        'permissionSpecList'
      'where'
      'Fac.ik_fac=Relation_spec_fac.ik_fac'
      'and Relation_spec_fac.ik_spec_fac=permissionSpecList.ik_spec'
      ''
      ''
      ''
      ''
      ''
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
      Size = 50
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
    Top = 172
  end
  object adoqSpecFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select spf.ik_fac,spf.ik_spec, ik_spec_fac, Cname_spec, Cname_fa' +
        'c, Cshort_name_fac, Cshort_spec, ik_direction, YearObuch from '
      'dbo.Relation_spec_fac spf inner join dbo.Spec_stud sp on'
      'spf.ik_spec=sp.ik_spec'
      ' inner join fac on'
      'spf.ik_fac=fac.ik_fac'
      ''
      ''
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
    Top = 133
    object adoqSpecFacik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adoqSpecFacik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adoqSpecFacCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 80
    end
    object adoqSpecFacCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 50
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
    object adoqSpecFacYearObuch: TIntegerField
      FieldName = 'YearObuch'
    end
  end
  object dsSpecFac: TDataSource
    DataSet = adoqSpecFac
    Left = 373
    Top = 68
  end
  object adodsGroupsofspec: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from Tree_groups'
    Parameters = <>
    Left = 169
    Top = 15
  end
  object dsGroupsofSpec: TDataSource
    DataSet = adodsGroupsofspec
    Left = 170
    Top = 70
  end
  object adoqSpec: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Spec_stud')
    Left = 259
    Top = 24
    object adoqSpecik_spec: TAutoIncField
      FieldName = 'ik_spec'
      ReadOnly = True
    end
    object adoqSpecCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object adoqSpecCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object adoqSpecSh_spec: TStringField
      FieldName = 'Sh_spec'
      Size = 10
    end
  end
  object dsqSpec: TDataSource
    DataSet = adoqSpec
    Left = 259
    Top = 55
  end
  object adodsFacultyAll: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select * from fac where ik_fac<>5 and ik_fac<>9 and (ik_fac<14 o' +
      'r ik_fac>17) order by 2'
    Parameters = <>
    Left = 25
    Top = 250
  end
  object dsFacultyAll: TDataSource
    DataSet = adodsFacultyAll
    Left = 23
    Top = 286
  end
  object dsSpecForNagr: TDataSource
    DataSet = adospSpecForNagr
    Left = 90
    Top = 294
  end
  object adospSpecForNagr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectSpecForNagr;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@ik_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@ik_fac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 90
    Top = 248
  end
  object adospSpclzForNagr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectSpclzForNagr;1'
    Parameters = <>
    Left = 154
    Top = 248
  end
  object dsSpclzForNagr: TDataSource
    DataSet = adospSpclzForNagr
    Left = 154
    Top = 294
  end
  object adospFormEdForNagr: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'SelectFormEdForNagr;1'
    Parameters = <>
    Left = 226
    Top = 248
  end
  object dsFormEdForNagr: TDataSource
    DataSet = adospFormEdForNagr
    Left = 226
    Top = 294
  end
  object dsYearUPForNagr: TDataSource
    DataSet = dsYearForUchPlan
    Left = 314
    Top = 302
  end
  object dsYearForUchPlan: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'SelectYearUPForNagr;1'
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
        Name = '@ik_kaf'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_spclz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_spec'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_form_ed'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 240
  end
  object adsSpecFac: TADODataSet
    Connection = dm.DBConnect
    CommandText = 'select * from Spec_stud'
    Parameters = <>
    Left = 432
    Top = 208
  end
end
