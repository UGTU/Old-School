object dmFgos: TdmFgos
  OldCreateOrder = False
  Height = 462
  Width = 617
  object aspGetFgosBySpec: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'GetFgosBySpec;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_spec'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 72
  end
  object aspGetCompetence: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetCompetenceSpec;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_spec'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_type_competence'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 40
    Top = 16
    object aspGetCompetenceik_competence: TAutoIncField
      FieldName = 'ik_competence'
      ReadOnly = True
      Visible = False
    end
    object aspGetCompetencezhach_competence: TMemoField
      DisplayWidth = 66
      FieldName = 'zhach_competence'
      BlobType = ftFmtMemo
    end
  end
  object aspGetFgosSpecYearNum: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'GetFgosBySpecYearNum;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
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
        Name = '@year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 16
  end
  object aspGetFgosException: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetFgosException;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 144
    Top = 72
    object aspGetFgosExceptionik_exception_fgos: TAutoIncField
      FieldName = 'ik_exception_fgos'
      ReadOnly = True
      Visible = False
    end
    object aspGetFgosExceptioncName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 100
    end
    object aspGetFgosExceptionznach_ZE: TIntegerField
      FieldName = 'znach_ZE'
    end
  end
  object aspGetAllAboutFgos: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'GetAllAboutFgos;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 48
    Top = 136
  end
  object aspGetDiscExceptionZE: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDiscExceptionZE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_disc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 265
    Top = 77
  end
  object aspGetDiscZE: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDiscZE;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 273
    Top = 21
  end
  object adodsApplication1: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    CommandText = 
      'select * from FgosApplication1 order by short_Name, name_level_c' +
      'ompetence'
    FieldDefs = <>
    Parameters = <>
    StoreDefs = True
    Left = 24
    Top = 264
    object adodsApplication1short_Name: TStringField
      DisplayLabel = #1050#1086#1076#1099' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1081
      FieldName = 'short_Name'
      Size = 10
    end
    object adodsApplication1zhach_competence: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1080
      FieldName = 'zhach_competence'
      Size = 8000
    end
    object adodsApplication1name_level_competence: TStringField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1077#1081
      FieldName = 'name_level_competence'
      Visible = False
    end
    object adodsApplication1description_content: TStringField
      DisplayLabel = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1080
      FieldName = 'description_content'
      Size = 8000
    end
    object adodsApplication1ik_competence: TIntegerField
      FieldName = 'ik_competence'
      Visible = False
    end
    object adodsApplication1ik_type_competence: TIntegerField
      FieldName = 'ik_type_competence'
      Visible = False
    end
  end
  object dsApplication1: TDataSource
    DataSet = adodsApplication1
    Left = 24
    Top = 208
  end
  object aspGetDataTitle: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ProcedureName = 'GetDataTitle;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 184
    object aspGetDataTitleCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 150
    end
    object aspGetDataTitlecName_spclz: TStringField
      FieldName = 'cName_spclz'
      Size = 150
    end
    object aspGetDataTitleCname_qualif: TStringField
      FieldName = 'Cname_qualif'
      Size = 50
    end
    object aspGetDataTitleSh_spec: TStringField
      FieldName = 'Sh_spec'
      Size = 10
    end
    object aspGetDataTitleYearObuch: TIntegerField
      FieldName = 'YearObuch'
    end
  end
  object aspGetCompForDicsUchPlan: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'GetCompetenceForDiscUchPlan;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ik_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IDGos'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 264
  end
  object aspGetDiscBasedOn: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetDiscBasedOn;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 336
    object aspGetDiscBasedOnik_disc_uch_plan_opir_na: TIntegerField
      FieldName = 'base_for_ik'
    end
    object aspGetDiscBasedOncname_ckl_disc1: TStringField
      FieldName = 'cname_ckl_disc1'
    end
  end
  object aspGetDiscMainStayFor: TADOStoredProc
    Connection = dm.DBConnect
    CursorType = ctStatic
    ProcedureName = 'GetDiscMainStayFor;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ik_disc_uch_plan'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 160
    Top = 400
    object aspGetDiscMainStayForik_disc_uch_plan_main: TIntegerField
      FieldName = 'depends_on_ik'
    end
    object aspGetDiscMainStayForcname_ckl_disc1: TStringField
      FieldName = 'cname_ckl_disc1'
    end
  end
end
