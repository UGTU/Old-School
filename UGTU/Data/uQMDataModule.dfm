object QMDataModule: TQMDataModule
  OldCreateOrder = False
  Height = 474
  Width = 340
  object adodsQMTables: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'QM_tables'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 20
    object adodsQMTablesik_table: TBCDField
      FieldName = 'ik_table'
      ReadOnly = True
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsQMTablesctable_name: TStringField
      FieldName = 'ctable_name'
      Visible = False
      Size = 30
    end
    object adodsQMTablesctable_caption: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'ctable_caption'
      Size = 30
    end
  end
  object adodsQMFields: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 76
  end
  object adodsQMRelations: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'QM_RelationView'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 132
  end
  object adodsQMAllFields: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'select * from QM_fields where lvisible='#39'true'#39
    Parameters = <>
    Left = 136
    Top = 76
    object adodsQMAllFieldsik_field: TBCDField
      FieldName = 'ik_field'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object adodsQMAllFieldsik_table: TBCDField
      FieldName = 'ik_table'
      Precision = 18
      Size = 0
    end
    object adodsQMAllFieldscfield_name: TStringField
      FieldName = 'cfield_name'
      Size = 50
    end
    object adodsQMAllFieldscfield_caption: TStringField
      FieldName = 'cfield_caption'
      Size = 50
    end
    object adodsQMAllFieldslvisible: TBooleanField
      FieldName = 'lvisible'
    end
  end
  object adodsQMAdminTables: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'QM_tables'
    CommandType = cmdTable
    Parameters = <>
    Left = 136
    Top = 20
    object BCDField1: TBCDField
      FieldName = 'ik_table'
      ReadOnly = True
      Visible = False
      Precision = 18
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074' '#1073#1072#1079#1077
      FieldName = 'ctable_name'
      Size = 30
    end
    object StringField2: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'ctable_caption'
      Size = 30
    end
  end
  object adodsQMAdminFields: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'QM_ADMIN_Fields'
    CommandType = cmdTable
    Parameters = <>
    Left = 136
    Top = 132
    object StringField3: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1086#1083#1103' '#1074' '#1073#1072#1079#1077
      FieldName = 'cfield_name'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103
      FieldName = 'cfield_caption'
      Size = 50
    end
    object adodsQMAdminFieldsctable_name: TStringField
      DisplayLabel = #1048#1084#1103' '#1090#1072#1073#1083#1080#1094#1099' '#1074' '#1073#1072#1079#1077
      FieldName = 'ctable_name'
      Size = 30
    end
    object adodsQMAdminFieldsctable_caption: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'ctable_caption'
      Size = 30
    end
    object BooleanField1: TBooleanField
      DisplayLabel = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1084#1072#1089#1090#1077#1088#1077
      FieldName = 'lvisible'
    end
    object adodsQMAdminFieldsik_table: TBCDField
      FieldName = 'ik_table'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsQMAdminFieldsik_field: TBCDField
      FieldName = 'ik_field'
      Visible = False
      Precision = 18
      Size = 0
    end
  end
  object adodsQMADMINRelations: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 'QM_RelationViewWithTable'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 188
    object adodsQMADMINRelationsik_relation: TBCDField
      FieldName = 'ik_relation'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsQMADMINRelationsik_field2: TBCDField
      FieldName = 'ik_field2'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsQMADMINRelationsik_field1: TBCDField
      FieldName = 'ik_field1'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adodsQMADMINRelationsctable_caption: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1077#1088#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
      DisplayWidth = 30
      FieldName = 'ctable_caption'
      Size = 30
    end
    object adodsQMADMINRelationsExpr2: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1090#1086#1088#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
      DisplayWidth = 30
      FieldName = 'Expr2'
      Size = 30
    end
    object adodsQMADMINRelationsctable_name1: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1077#1088#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' '#1074' '#1073#1072#1079#1077
      DisplayWidth = 30
      FieldName = 'ctable_name1'
      Size = 30
    end
    object adodsQMADMINRelationsctable_name2: TStringField
      DisplayLabel = #1048#1084#1103' '#1074#1090#1086#1088#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' '#1074' '#1073#1072#1079#1077
      DisplayWidth = 30
      FieldName = 'ctable_name2'
      Size = 30
    end
    object adodsQMADMINRelationscfield_name1: TStringField
      DisplayLabel = #1048#1084#1103' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1083#1103' '#1074' '#1073#1072#1079#1077
      DisplayWidth = 24
      FieldName = 'cfield_name1'
      Size = 50
    end
    object adodsQMADMINRelationscfield_name2: TStringField
      DisplayLabel = #1048#1084#1103' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1083#1103' '#1074' '#1073#1072#1079#1077
      DisplayWidth = 50
      FieldName = 'cfield_name2'
      Size = 50
    end
    object adodsQMADMINRelationscfield_caption: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1083#1103
      DisplayWidth = 21
      FieldName = 'cfield_caption'
      Size = 50
    end
    object adodsQMADMINRelationsExpr1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1083#1103
      DisplayWidth = 50
      FieldName = 'Expr1'
      Size = 50
    end
  end
  object adospQMAddTable: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_AddTable;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@caption'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end>
    Left = 32
    Top = 254
  end
  object adospQMEditTable: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_EDITTable;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@caption'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end>
    Left = 128
    Top = 254
  end
  object adospQMDeleteTable: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_DeleteTable;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 254
  end
  object adospQMAddField: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_AddField;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_table'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@caption'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@visible'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 32
    Top = 310
  end
  object AdospQMEditField: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_EditField;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@ik_table'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
        Value = Null
      end
      item
        Name = '@name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@caption'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@visible'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 128
    Top = 310
  end
  object adospQMDeleteField: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_DeleteField;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 310
  end
  object adospQMAddRelation: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_AddRelation;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@ik_field1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end
      item
        Name = '@ik_field2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Left = 31
    Top = 374
  end
  object adospQMDeleteRelation: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'QM_DeleteRelation;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@ik'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 18
      end>
    Left = 128
    Top = 374
  end
end
