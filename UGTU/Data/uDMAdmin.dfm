object DMAdmin: TDMAdmin
  OldCreateOrder = False
  Height = 201
  Width = 396
  object adoqAuditObject: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.Audit_Object')
    Left = 24
    Top = 24
  end
  object adoqAuditOperationType: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.Audit_OperationType')
    Left = 136
    Top = 24
  end
  object adoqUsers: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct UserName from AUDIT')
    Left = 232
    Top = 24
  end
  object dsAuditObject: TDataSource
    DataSet = adoqAuditObject
    Left = 24
    Top = 72
  end
  object dsAuditOperationType: TDataSource
    DataSet = adoqAuditOperationType
    Left = 136
    Top = 72
  end
  object dsUsers: TDataSource
    DataSet = adoqUsers
    Left = 232
    Top = 72
  end
  object adotEvent: TADOTable
    CacheSize = 15
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    TableName = 'AUDIT'
    Left = 287
    Top = 26
    object adotEventObjectName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
      DisplayWidth = 15
      FieldName = 'ObjectName'
      Size = 50
    end
    object adotEventOperationName: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1084#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103
      DisplayWidth = 15
      FieldName = 'OperationName'
      Size = 50
    end
    object adotEventUserName: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      DisplayWidth = 15
      FieldName = 'UserName'
      Size = 50
    end
    object adotEventAuditDateTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1089#1086#1074#1077#1088#1096#1077#1085#1080#1103
      DisplayWidth = 18
      FieldName = 'AuditDateTime'
    end
    object adotEventDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Description'
      Size = 500
    end
  end
  object dsEvent: TDataSource
    DataSet = adotEvent
    Left = 286
    Top = 72
  end
end
