object DMAbiturientRasp: TDMAbiturientRasp
  OldCreateOrder = False
  Height = 410
  Width = 561
  object adodsRasp: TADODataSet
    Connection = dm.DBConnect
    CommandText = 'ABIT_Raspisanie'
    CommandType = cmdTable
    Parameters = <>
    Left = 485
    Top = 24
    object adodsRaspid_rasp: TAutoIncField
      FieldName = 'id_rasp'
      ReadOnly = True
    end
    object adodsRaspdate_of: TDateTimeField
      FieldName = 'date_of'
    end
    object adodsRaspFIO_prepodav: TStringField
      FieldName = 'FIO_prepodav'
      FixedChar = True
      Size = 500
    end
    object adodsRaspTimeBegin: TStringField
      FieldName = 'TimeBegin'
      FixedChar = True
      Size = 5
    end
    object adodsRaspTimeEnd: TStringField
      FieldName = 'TimeEnd'
      FixedChar = True
      Size = 5
    end
    object adodsRaspik_sdach: TIntegerField
      FieldName = 'ik_sdach'
    end
    object adodsRaspik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adodsRaspik_typ_mer: TIntegerField
      FieldName = 'ik_typ_mer'
    end
  end
  object dsRasp: TDataSource
    DataSet = adodsRasp
    Left = 482
    Top = 75
  end
  object adospGetRasp: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    AfterScroll = adospGetRaspAfterScroll
    ProcedureName = 'ABIT_Get_Raspisanie_AllInfo;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@date_of'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 291
    Top = 27
    object adospGetRaspdate_of: TDateTimeField
      FieldName = 'date_of'
      Visible = False
    end
    object adospGetRaspcname_mer: TStringField
      DisplayLabel = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
      DisplayWidth = 50
      FieldName = 'cname_mer'
      ReadOnly = True
      Size = 100
    end
    object adospGetRaspdisc: TStringField
      DisplayLabel = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
      FieldName = 'disc'
      ReadOnly = True
      Size = 50
    end
    object adospGetRaspcname_sdach: TStringField
      DisplayLabel = #1042#1080#1076' '#1089#1076#1072#1095#1080
      FieldName = 'cname_sdach'
      ReadOnly = True
      Size = 50
    end
    object adospGetRaspid_rasp: TAutoIncField
      FieldName = 'id_rasp'
      ReadOnly = True
      Visible = False
    end
    object adospGetRaspik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object adospGetRaspik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adospGetRaspik_typ_mer: TIntegerField
      FieldName = 'ik_typ_mer'
      Visible = False
    end
    object adospGetRaspTimeBegin: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
      FieldName = 'TimeBegin'
      DisplayFormat = 'HH:MM'
    end
    object adospGetRaspTimeEnd: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'TimeEnd'
      DisplayFormat = 'HH:MM'
    end
  end
  object dsGetRasp: TDataSource
    DataSet = adospGetRasp
    Left = 291
    Top = 81
  end
  object adospAbitGetSpisok: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ABIT_SpisokOfExam'
      ''
      ''
      'ORDER BY  StudName, ik_spec_fac, ik_fac')
    Left = 49
    Top = 21
    object adospAbitGetSpisokid_VstEx: TIntegerField
      FieldName = 'id_VstEx'
      Visible = False
    end
    object adospAbitGetSpisokid_rasp: TIntegerField
      FieldName = 'id_rasp'
      Visible = False
    end
    object adospAbitGetSpisokid_rasp_kab: TIntegerField
      FieldName = 'id_rasp_kab'
      Visible = False
    end
    object adospAbitGetSpisokik_disc: TIntegerField
      FieldName = 'ik_disc'
      Visible = False
    end
    object adospAbitGetSpisokik_sdach: TIntegerField
      FieldName = 'ik_sdach'
      Visible = False
    end
    object adospAbitGetSpisokik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
      Visible = False
    end
    object adospAbitGetSpisokik_fac: TIntegerField
      FieldName = 'ik_fac'
      Visible = False
    end
    object adospAbitGetSpisoknn_abit: TIntegerField
      FieldName = 'nn_abit'
      Visible = False
    end
    object adospAbitGetSpisoknnvedom: TStringField
      DisplayLabel = #8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'/'#1089#1077#1088#1090'.'
      FieldName = 'nnvedom'
      FixedChar = True
    end
    object adospAbitGetSpisokStudName: TStringField
      DisplayLabel = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      FieldName = 'StudName'
      ReadOnly = True
      Size = 92
    end
    object adospAbitGetSpisokcosenka: TIntegerField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'cosenka'
    end
    object adospAbitGetSpisokCname_room: TStringField
      DisplayLabel = #1040#1091#1076#1080#1090#1086#1088#1080#1103
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Cname_room'
      LookupDataSet = adospAbitGetRaspKab
      LookupKeyFields = 'id'
      LookupResultField = 'Cname_room'
      KeyFields = 'id_rasp_kab'
      Size = 50
      Lookup = True
    end
    object adospAbitGetSpisokNNyear: TIntegerField
      FieldName = 'NNyear'
    end
    object adospAbitGetSpisokсname_disc: TStringField
      FieldName = #1089'name_disc'
      FixedChar = True
      Size = 50
    end
    object adospAbitGetSpisokDiscVedomName: TStringField
      FieldName = 'DiscVedomName'
      FixedChar = True
      Size = 50
    end
    object adospAbitGetSpisokNumber: TStringField
      FieldName = 'Number'
      ReadOnly = True
    end
  end
  object dsAbitGetSpisok: TDataSource
    DataSet = adospAbitGetSpisok
    Left = 51
    Top = 81
  end
  object dsAbitGetRaspKab: TDataSource
    DataSet = adospAbitGetRaspKab
    Left = 174
    Top = 86
  end
  object dsAbitNotBusyKab: TDataSource
    Left = 378
    Top = 81
  end
  object adospAbitNotBusyKab: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select ik_room, '
      
        #9'rtrim(Cname_room)+'#39' '#39#39#39'+rtrim(CName_campus)+'#39#39#39' ('#39'+isnull(conve' +
        'rt(varchar(4),iSeatCount),'#39'...'#39')+'
      #9#9#39' '#1084#1077#1089#1090')'#39' as Cname_room '
      'from dbo.Room'
      'inner join'
      'dbo.Campus'
      'on Campus.ik_campus=Room.ik_campus'
      'order by Cname_room ')
    Left = 377
    Top = 29
    object adospAbitNotBusyKabik_room: TAutoIncField
      FieldName = 'ik_room'
      ReadOnly = True
    end
    object adospAbitNotBusyKabCname_room: TStringField
      FieldName = 'Cname_room'
      ReadOnly = True
      Size = 65
    end
  end
  object adospAbitGetRaspKab: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'exec dbo.ABIT_get_raspkab 404')
    Left = 177
    Top = 29
    object adospAbitGetRaspKabik_room: TIntegerField
      FieldName = 'ik_room'
      Visible = False
    end
    object adospAbitGetRaspKabid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adospAbitGetRaspKabid_rasp: TIntegerField
      FieldName = 'id_rasp'
      Visible = False
    end
    object adospAbitGetRaspKabCname_room: TStringField
      FieldName = 'Cname_room'
      ReadOnly = True
      Visible = False
      Size = 55
    end
    object adospAbitGetRaspKabiSeatCount: TWordField
      FieldName = 'iSeatCount'
      Visible = False
    end
  end
  object adospAbitRaspKab: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.ABIT_Rassadka'
      'where id_rasp=2')
    Left = 49
    Top = 141
    object IntegerField1: TIntegerField
      FieldName = 'ik_room'
      Visible = False
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'id_rasp'
      Visible = False
    end
    object StringField2: TStringField
      DisplayLabel = #1040#1091#1076#1080#1090#1086#1088#1080#1103
      FieldKind = fkLookup
      FieldName = 'kabName'
      LookupDataSet = adospAbitNotBusyKab
      LookupKeyFields = 'ik_room'
      LookupResultField = 'Cname_room'
      KeyFields = 'ik_room'
      Size = 50
      Lookup = True
    end
  end
  object dsAbitRaspKab: TDataSource
    DataSet = adospAbitRaspKab
    Left = 46
    Top = 198
  end
  object adoqHelp: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ABIT_SpisokOfExam'
      ''
      ''
      'ORDER BY  StudName, ik_spec_fac, ik_fac')
    Left = 217
    Top = 189
    object adoqHelpid_VstEx: TIntegerField
      FieldName = 'id_VstEx'
    end
    object adoqHelpid_rasp: TIntegerField
      FieldName = 'id_rasp'
    end
    object adoqHelpid_rasp_kab: TIntegerField
      FieldName = 'id_rasp_kab'
    end
    object adoqHelpik_disc: TIntegerField
      FieldName = 'ik_disc'
    end
    object adoqHelpik_sdach: TIntegerField
      FieldName = 'ik_sdach'
    end
    object adoqHelpik_spec_fac: TIntegerField
      FieldName = 'ik_spec_fac'
    end
    object adoqHelpik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adoqHelpnn_abit: TIntegerField
      FieldName = 'nn_abit'
    end
    object adoqHelpnnvedom: TStringField
      FieldName = 'nnvedom'
      FixedChar = True
    end
    object adoqHelpStudName: TStringField
      FieldName = 'StudName'
      ReadOnly = True
      Size = 92
    end
    object adoqHelpcosenka: TIntegerField
      FieldName = 'cosenka'
    end
    object adoqHelpCname_room: TStringField
      FieldKind = fkLookup
      FieldName = 'Cname_room'
      LookupDataSet = adospAbitGetRaspKab
      LookupKeyFields = 'id'
      LookupResultField = 'Cname_room'
      KeyFields = 'id_rasp_kab'
      Size = 50
      Lookup = True
    end
  end
  object adoqFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct fac.* '
      
        'from dbo.GetSpecAbitPermissionsFromRelTable() AbitPermissions, d' +
        'bo.Relation_spec_fac, Fac'
      'where AbitPermissions.ik_spec_fac=Relation_spec_fac.ik_spec_fac'
      #9'AND Relation_spec_fac.ik_fac=Fac.ik_fac'
      ''
      ''
      ''
      '')
    Left = 105
    Top = 277
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
    Left = 105
    Top = 324
  end
  object adoqSpecFac: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct'
      ' Relation_spec_fac.ik_fac,Relation_spec_fac.ik_spec, '
      #9'Relation_spec_fac.ik_spec_fac, Cname_spec, Cshort_spec '
      'from '
      'dbo.GetSpecAbitPermissionsFromRelTable() AbitPermissions, '
      'dbo.Relation_spec_fac, dbo.Spec_stud '
      'WHERE '
      'AbitPermissions.ik_spec_fac=Relation_spec_fac.ik_spec_fac'
      'AND Spec_stud.ik_spec=Relation_spec_fac.ik_spec'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 37
    Top = 277
    object adoqSpecFacik_fac: TIntegerField
      FieldName = 'ik_fac'
    end
    object adoqSpecFacik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adoqSpecFacik_spec_fac: TAutoIncField
      FieldName = 'ik_spec_fac'
      ReadOnly = True
    end
    object adoqSpecFacCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object adoqSpecFacCshort_spec: TStringField
      FieldName = 'Cshort_spec'
      Size = 10
    end
  end
  object dsSpecFac: TDataSource
    DataSet = adoqSpecFac
    Left = 37
    Top = 324
  end
  object adoqMaxVedomNumber: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM [dbo].[ABIT_GetVedomNumber]'
      '')
    Left = 345
    Top = 189
    object adoqMaxVedomNumberMaxNumber: TStringField
      FieldName = 'MaxNumber'
      ReadOnly = True
    end
  end
end
