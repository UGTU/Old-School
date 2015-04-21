object dmOtdKadrDiplom: TdmOtdKadrDiplom
  OldCreateOrder = False
  Height = 255
  Width = 396
  object dsGakMember: TDataSource
    DataSet = adospGakMember
    Left = 40
    Top = 72
  end
  object dsSpecFac: TDataSource
    DataSet = adoqSpec
    Left = 85
    Top = 164
  end
  object adoqSpec: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '[dbo].[OKADRGetSpecialities] '
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
  end
  object adospGakMember: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'OKADRGetGakMembers;1'
    Parameters = <>
    Left = 40
    Top = 24
    object adospGakMemberik_GakMember: TIntegerField
      FieldName = 'ik_GakMember'
    end
    object adospGakMemberCNameMember: TStringField
      FieldName = 'GakMemberName'
      Size = 300
    end
    object adospGakMemberik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adospGakMemberik_year: TIntegerField
      FieldName = 'ik_year'
    end
    object adospGakMemberspecName: TStringField
      FieldKind = fkLookup
      FieldName = 'specName'
      LookupDataSet = adoqSpec
      LookupKeyFields = 'ik_spec'
      LookupResultField = 'Cname_spec'
      KeyFields = 'ik_spec'
      Size = 150
      Lookup = True
    end
  end
  object dsFaculty: TDataSource
    Left = 151
    Top = 166
  end
  object adoqYear: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.Year_uch_pl'
      'order by year_value'
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
      ''
      '')
    Left = 157
    Top = 125
  end
  object adospQualification: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'OKADRGetQualifications;1'
    Parameters = <>
    Left = 128
    Top = 24
    object adospQualificationik_spec: TAutoIncField
      FieldName = 'ik_spec'
      ReadOnly = True
    end
    object adospQualificationCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object adospQualificationCname_qualif: TStringField
      DisplayWidth = 500
      FieldName = 'Cname_qualif'
      Size = 500
    end
    object adospQualificationCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
    object adospQualificationSpecategory: TStringField
      FieldName = 'Spec'#1057'ategory'
      Size = 50
    end
    object adospQualificationQualifShortName: TStringField
      FieldName = 'QualifShortName'
      Size = 300
    end
    object adospQualificationSh_spec: TStringField
      FieldName = 'Sh_spec'
      Size = 10
    end
    object adospQualificationcName_direction: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
  end
  object dsQualification: TDataSource
    DataSet = adospQualification
    Left = 136
    Top = 72
  end
end
