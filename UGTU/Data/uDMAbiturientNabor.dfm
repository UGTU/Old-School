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
    Left = 81
    Top = 157
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
    Left = 81
    Top = 204
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
    Left = 13
    Top = 157
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
    Left = 13
    Top = 204
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
    Left = 408
    Top = 120
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
    Left = 160
    Top = 157
  end
  object dsExamsErrors: TDataSource
    DataSet = adoqExamsErrors
    Left = 161
    Top = 203
  end
  object dsDocRights: TDataSource
    DataSet = adoDocRights
    Left = 697
    Top = 203
  end
  object adoDocRights: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from documents left join Doc_kat_zach'
      'on documents.ik_vid_doc =  Doc_kat_zach.ik_vid_doc'
      'Where (IsIdentity = 0) and (IsEducational = 0)'
      '')
    Left = 696
    Top = 157
    object adoDocRightsik_vid_doc: TAutoIncField
      FieldName = 'ik_vid_doc'
      ReadOnly = True
      Visible = False
    end
    object adoDocRightscvid_doc: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 80
      FieldName = 'cvid_doc'
      Size = 500
    end
    object adoDocRightsIsDefault: TBooleanField
      FieldName = 'IsDefault'
      Visible = False
    end
    object adoDocRightsIsIdentity: TBooleanField
      FieldName = 'IsIdentity'
      Visible = False
    end
    object adoDocRightsIsEducational: TBooleanField
      FieldName = 'IsEducational'
      Visible = False
    end
    object adoDocRightsik_FB: TIntegerField
      FieldName = 'ik_FB'
      Visible = False
    end
    object adoDocRightsIsOsoboePravo: TBooleanField
      Alignment = taCenter
      DisplayLabel = #1054#1089#1086#1073#1086#1077' '#1087#1088#1072#1074#1086
      DisplayWidth = 25
      FieldName = 'IsOsoboePravo'
    end
    object adoDocRightsIsPreimushestvo: TBooleanField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074#1077#1085#1085#1086#1077' '#1087#1088#1072#1074#1086
      DisplayWidth = 25
      FieldName = 'IsPreimushestvo'
    end
    object adoDocRightsIsWithoutExam: TBooleanField
      Alignment = taCenter
      DisplayLabel = #1041#1077#1079' '#1101#1082#1079#1072#1084#1077#1085#1086#1074
      DisplayWidth = 25
      FieldName = 'IsWithoutExam'
    end
    object adoDocRightsik_subFB: TIntegerField
      FieldName = 'ik_subFB'
      Visible = False
    end
    object adoDocRightsik_type_grazd: TIntegerField
      FieldName = 'ik_type_grazd'
      Visible = False
    end
  end
  object dsIndBall: TDataSource
    DataSet = adoIndBall
    Left = 609
    Top = 203
  end
  object adoIndBall: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from SelectIndBalls'
      ''
      '')
    Left = 608
    Top = 157
    object adoIndBallfio: TStringField
      DisplayWidth = 30
      FieldName = 'fio'
      Size = 500
    end
    object adoIndBallcvid_doc: TStringField
      DisplayWidth = 60
      FieldName = 'cvid_doc'
      Size = 500
    end
    object adoIndBallik_fac: TIntegerField
      FieldName = 'ik_fac'
      Visible = False
    end
    object adoIndBallCshort_name_fac: TStringField
      DisplayWidth = 20
      FieldName = 'Cshort_name_fac'
      Size = 500
    end
    object adoIndBallik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
    object adoIndBallCshort_spec: TStringField
      FieldName = 'Cshort_spec'
    end
    object adoIndBallcd_seria: TStringField
      FieldName = 'cd_seria'
      Size = 10
    end
    object adoIndBallnp_number: TStringField
      FieldName = 'np_number'
      Size = 15
    end
    object adoIndBallballs: TIntegerField
      FieldName = 'balls'
    end
    object adoIndBallсname_disc: TStringField
      FieldName = #1089'name_disc'
      Size = 50
    end
  end
  object adoNetworkAbit: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from SelectNetworkAbit'
      ''
      ''
      '')
    Left = 544
    Top = 157
    object adoNetworkAbitik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adoNetworkAbitCshort_name_fac: TStringField
      DisplayWidth = 30
      FieldName = 'Cshort_name_fac'
      Size = 500
    end
    object adoNetworkAbitik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
    end
    object adoNetworkAbitCshort_spec: TStringField
      FieldName = 'Cshort_spec'
    end
    object adoNetworkAbitfio: TStringField
      DisplayWidth = 30
      FieldName = 'fio'
      Size = 500
    end
    object adoNetworkAbitCname_kat_zach: TStringField
      FieldName = 'Cname_kat_zach'
      Size = 50
    end
    object adoNetworkAbitcSotTel: TStringField
      DisplayWidth = 50
      FieldName = 'cSotTel'
      Size = 500
    end
    object adoNetworkAbitctelefon: TStringField
      FieldName = 'ctelefon'
    end
    object adoNetworkAbitballs: TIntegerField
      FieldName = 'balls'
    end
  end
  object dsNetworkAbit: TDataSource
    DataSet = adoNetworkAbit
    Left = 545
    Top = 203
  end
  object dsProfile: TDataSource
    DataSet = adoqProfile
    Left = 237
    Top = 204
  end
  object adoqProfile: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [dbo].[ABIT_GetProfileList]'
      '(2016,156, 12)'
      ' order by Sortorder,Cname_spec'
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
    Left = 237
    Top = 157
    object adoqProfileik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adoqProfileCname_spec: TStringField
      FieldName = 'Cname_spec'
      ReadOnly = True
      Size = 364
    end
    object adoqProfileCshort_spec: TStringField
      FieldName = 'Cshort_spec'
    end
    object adoqProfileik_direction: TIntegerField
      FieldName = 'ik_direction'
    end
    object adoqProfileSortorder: TIntegerField
      FieldName = 'Sortorder'
    end
    object adoqProfileid_parent: TIntegerField
      FieldName = 'id_parent'
    end
  end
end
