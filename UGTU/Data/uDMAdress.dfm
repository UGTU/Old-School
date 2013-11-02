object dmAdress: TdmAdress
  OldCreateOrder = False
  Height = 375
  Width = 419
  object adodsSignRaion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select Ik_region,IK_Raion,CRaion from Raion  where Ik_region='#39'1'#39
    Parameters = <>
    Left = 136
    Top = 12
  end
  object dsSignRaion: TDataSource
    DataSet = adodsSignRaion
    Left = 136
    Top = 64
  end
  object adodsStrana: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Strana'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 8
    Top = 132
  end
  object dsStrana: TDataSource
    DataSet = adodsStrana
    Left = 8
    Top = 188
  end
  object dsRegion: TDataSource
    DataSet = adodsRegion
    Left = 56
    Top = 188
  end
  object adodsRegion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select Region.Ik_strana,IK_Region,CRegion from Region  where Ik_' +
      'strana='#39'1'#39
    Parameters = <>
    Left = 60
    Top = 132
  end
  object adodsStreet: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 132
  end
  object adodsGorod: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    Left = 172
    Top = 132
  end
  object adodsRaion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select Ik_region,IK_Raion,CRaion from Raion  where Ik_region='#39'1'#39
    Parameters = <>
    Left = 120
    Top = 132
  end
  object dsRaion: TDataSource
    DataSet = adodsRaion
    Left = 124
    Top = 188
  end
  object dsGorod: TDataSource
    DataSet = adodsGorod
    Left = 176
    Top = 188
  end
  object dsStreet: TDataSource
    DataSet = adodsStreet
    Left = 228
    Top = 188
  end
  object adodsSignStrana: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'Strana'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 20
    Top = 12
  end
  object dsSignStrana: TDataSource
    DataSet = adodsSignStrana
    Left = 16
    Top = 64
  end
  object adodsSignRegion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select Region.Ik_strana,IK_Region,CRegion from Region  where Ik_' +
      'strana='#39'1'#39
    Parameters = <>
    Left = 80
    Top = 12
  end
  object dsSignRegion: TDataSource
    DataSet = adodsSignRegion
    Left = 76
    Top = 64
  end
  object adodsSignGorod: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    Left = 188
    Top = 12
  end
  object adodsSignStreet: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    Left = 244
    Top = 12
  end
  object dsSignGorod: TDataSource
    DataSet = adodsSignGorod
    Left = 188
    Top = 64
  end
  object dsSignStreet: TDataSource
    DataSet = adodsSignStreet
    Left = 244
    Top = 64
  end
  object ADODSsChoolStrana: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select distinct ik_strana, cstrana from SchoolAdressView where i' +
      'k_strana IS NOT NULL'
    Parameters = <>
    Left = 32
    Top = 252
  end
  object DSsChoolStrana: TDataSource
    DataSet = ADODSsChoolStrana
    Left = 32
    Top = 308
  end
  object DSsChoolRegion: TDataSource
    DataSet = ADODSsChoolRegion
    Left = 96
    Top = 308
  end
  object ADODSsChoolRegion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select distinct ik_region, cregion, ik_strana from SchoolAdressV' +
      'iew where ik_region is not null'
    Parameters = <>
    Left = 100
    Top = 252
  end
  object ADODSsChoolGorod: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select distinct ik_region,  ik_strana, ik_raion, ik_gorod, cgoro' +
      'd from SchoolAdressView where ik_gorod is not null'
    Parameters = <>
    Left = 212
    Top = 252
  end
  object ADODSsChoolRaion: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select distinct ik_region,  ik_strana, ik_raion, craion from Sch' +
      'oolAdressView where ik_raion is not null'
    Parameters = <>
    Left = 160
    Top = 252
  end
  object DSsChoolRaion: TDataSource
    DataSet = ADODSsChoolRaion
    Left = 156
    Top = 308
  end
  object DSsChoolGorod: TDataSource
    DataSet = ADODSsChoolGorod
    Left = 208
    Top = 308
  end
  object adodsSchool: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select distinct ik_region,  ik_strana, ik_raion, ik_gorod, ik_za' +
      'ved, cname_zaved from SchoolAdressView where ik_zaved is not nul' +
      'l'
    Parameters = <>
    Left = 268
    Top = 252
  end
  object dsSchool: TDataSource
    DataSet = adodsSchool
    Left = 264
    Top = 308
  end
  object adsAddressType: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'AddressType'
    CommandType = cmdTable
    Parameters = <>
    Left = 332
    Top = 252
  end
  object dsAddressType: TDataSource
    DataSet = adsAddressType
    Left = 336
    Top = 308
  end
  object aspAddAddress: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'AppendPersonAddress;1'
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
      end
      item
        Name = '@ik_AddressType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_street'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BuildingNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@StructNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@FlatNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@fIndex'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@DateBegin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateEnd'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 336
    Top = 16
  end
  object aspEditAddress: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'UpdatePersonAddress;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_AddressType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ik_street'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BuildingNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@StructNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@FlatNumber'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@fIndex'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@DateBegin'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateEnd'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ik_personAddress'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 336
    Top = 64
  end
  object aspDelAddress: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'DelPersonAddress;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_personAddress'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 336
    Top = 120
  end
  object aspPropToFact: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'CopyPersonAddressPropToFact;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@nCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Left = 336
    Top = 184
  end
end
