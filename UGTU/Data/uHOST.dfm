object dmHOST: TdmHOST
  OldCreateOrder = False
  Height = 592
  Width = 916
  object tHostel: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_Hostel'
    Left = 24
    Top = 16
  end
  object dsHostel: TDataSource
    DataSet = tHostel
    Left = 24
    Top = 80
  end
  object Query1: TADOQuery
    Connection = dm.DBConnect
    Parameters = <>
    Left = 544
    Top = 8
  end
  object vInfoRoom: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_svobmest'
    Left = 24
    Top = 144
  end
  object dsInfoRoom: TDataSource
    DataSet = vInfoRoom
    Left = 24
    Top = 208
  end
  object vVkSpisokZayav: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_VkSpisokZayav'
    Left = 104
    Top = 144
  end
  object dsVkSpisokZayav: TDataSource
    DataSet = vVkSpisokZayav
    Left = 104
    Top = 208
  end
  object ProcVivodOrdera: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_VivodOrderaPoCode;1'
    Parameters = <>
    Left = 48
    Top = 520
  end
  object ProcRoomForZas: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_RoomForZas;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NumHost'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end>
    Left = 520
    Top = 120
  end
  object DSProcRoomForZas: TDataSource
    DataSet = ProcRoomForZas
    Left = 512
    Top = 176
  end
  object ProcProjInRoom: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_ProjInRoom;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_address'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 528
    Top = 232
    object ProcProjInRoomnCode: TBCDField
      FieldName = 'nCode'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object ProcProjInRoomik_AddressType: TIntegerField
      FieldName = 'ik_AddressType'
    end
    object ProcProjInRoomik_address: TIntegerField
      FieldName = 'ik_address'
    end
    object ProcProjInRoomFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object ProcProjInRoompol: TStringField
      FieldName = 'pol'
      ReadOnly = True
      Size = 7
    end
    object ProcProjInRoomstatusquo: TStringField
      FieldName = 'statusquo'
      ReadOnly = True
      Size = 9
    end
  end
  object dsProcProjInRoom: TDataSource
    DataSet = ProcProjInRoom
    Left = 544
    Top = 288
  end
  object vHOST_PredvSpisok: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_PredvSpisok'
    Left = 200
    Top = 144
  end
  object dsHOST_PredvSpisok: TDataSource
    DataSet = vHOST_PredvSpisok
    Left = 200
    Top = 208
  end
  object vPrikazNaZas: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_PrikazNaZas'
    Left = 288
    Top = 144
  end
  object dsPrikazNaZas: TDataSource
    DataSet = vPrikazNaZas
    Left = 288
    Top = 208
  end
  object vVklSpisRoom: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    TableName = 'HOST_VklSpisRoom'
    Left = 352
    Top = 144
  end
  object dsVklSpisRoom: TDataSource
    DataSet = vVklSpisRoom
    Left = 352
    Top = 208
  end
  object vSpisProj: TADOTable
    Connection = dm.DBConnect
    TableName = 'HOST_SpisProj'
    Left = 24
    Top = 272
  end
  object dsSpisProj: TDataSource
    DataSet = vSpisProj
    Left = 24
    Top = 328
  end
  object ProcVivodEtazhPoObj: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_VivodEtazhPoObj;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NumHost'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 632
    Top = 8
  end
  object dsProcVivodEtazhPoObj: TDataSource
    DataSet = ProcVivodEtazhPoObj
    Left = 632
    Top = 64
  end
  object tPrikaz: TADOTable
    Connection = dm.DBConnect
    TableName = 'Prikaz'
    Left = 80
    Top = 16
  end
  object vVivodPrichVis: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_VivodPrichVis'
    Left = 88
    Top = 272
  end
  object dsPrikaz: TDataSource
    DataSet = tPrikaz
    Left = 80
    Top = 80
  end
  object dsVivodPrichVis: TDataSource
    DataSet = vVivodPrichVis
    Left = 88
    Top = 328
  end
  object ProcVivodPersonFormGroup: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_VivodPersonFormGroup;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Ik_grup'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 632
    Top = 120
  end
  object dsVivodPersonFormGroup: TDataSource
    DataSet = ProcVivodPersonFormGroup
    Left = 632
    Top = 176
  end
  object ProcVivodZayavPoCode: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'HOST_VivodZayavPoCode;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 48
    Top = 464
  end
  object ProcGetPersonAddress: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetPersonAddress;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 640
    Top = 240
  end
  object dsGetPersonAddress: TDataSource
    DataSet = ProcGetPersonAddress
    Left = 640
    Top = 296
  end
  object dsProcVivodInvent: TDataSource
    DataSet = ProcVivodInvent
    Left = 544
    Top = 416
  end
  object ProcVivodInvent: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_VivodInvent;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 544
    Top = 360
    object ProcVivodInventnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object ProcVivodInventIDTipInven: TIntegerField
      FieldName = 'IDTipInven'
    end
    object ProcVivodInventKolvo: TIntegerField
      FieldName = 'Kolvo'
    end
    object ProcVivodInventDataVidachi: TDateTimeField
      FieldName = 'DataVidachi'
    end
    object ProcVivodInventDataVozvrata: TDateTimeField
      FieldName = 'DataVozvrata'
    end
    object ProcVivodInventNameTipInvent: TStringField
      FieldKind = fkLookup
      FieldName = 'NameTipInvent'
      LookupDataSet = VidInvent
      LookupKeyFields = 'IDTipInven'
      LookupResultField = 'NAMETipInven'
      KeyFields = 'IDTipInven'
      Lookup = True
    end
  end
  object ProcRegistrPers: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_RegistrPers;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 632
    Top = 360
  end
  object dsProcRegistrPers: TDataSource
    DataSet = ProcRegistrPers
    Left = 632
    Top = 408
  end
  object VidNarush: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from HOST_VidNurush')
    Left = 448
    Top = 328
  end
  object VidInvent: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from HOST_TipInven')
    Left = 448
    Top = 400
  end
  object ProcVivodKartochk: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'HOST_VivodKartochki;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 152
    Top = 464
  end
  object tVidNurush: TADOTable
    Active = True
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_VidNurush'
    Left = 136
    Top = 16
  end
  object dsVidNurush: TDataSource
    DataSet = tVidNurush
    Left = 136
    Top = 80
  end
  object dsVivodRoomPoEtazh: TDataSource
    DataSet = ProcVivodRoomPoEtazh
    Left = 736
    Top = 64
  end
  object ProcVivodRoomPoEtazh: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'HOST_VivodRoomPoEtazh;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@NumEtazh'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 736
    Top = 8
  end
  object ProcVivodNurushPoOb: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'HOST_VivodNurushPoObj;1'
    Parameters = <>
    Left = 840
    Top = 8
  end
  object dsVivodNurushPoOb: TDataSource
    DataSet = ProcVivodNurushPoOb
    Left = 840
    Top = 64
  end
  object dsPersonPoNarush: TDataSource
    DataSet = vNarushPersony
    Left = 752
    Top = 176
  end
  object ProcPersonPoNarush: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'HOST_PersonPoNarush;1'
    Parameters = <>
    Left = 752
    Top = 120
  end
  object dsNarushPersony: TDataSource
    DataSet = vNarushPersony
    Left = 168
    Top = 328
  end
  object vNarushPersony: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_NarushPersony'
    Left = 176
    Top = 272
  end
  object ProcVivodDogovoraPoCode: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'HOST_VivodDogovoraPoCode;1'
    Parameters = <>
    Left = 152
    Top = 520
  end
  object dsvHostel: TDataSource
    DataSet = vHostel
    Left = 256
    Top = 328
  end
  object vHostel: TADOTable
    Connection = dm.DBConnect
    CursorType = ctStatic
    TableName = 'HOST_vHostel'
    Left = 256
    Top = 272
  end
end
