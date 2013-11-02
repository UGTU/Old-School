inherited frmQMAdminRelation: TfrmQMAdminRelation
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1074#1103#1079#1100
  ClientHeight = 157
  ClientWidth = 406
  ExplicitWidth = 412
  ExplicitHeight = 189
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 406
    Height = 116
    ExplicitWidth = 396
    ExplicitHeight = 111
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 8
    Width = 138
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1077#1088#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1099':'
  end
  object Label1: TLabel [2]
    Left = 208
    Top = 8
    Width = 137
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1090#1086#1088#1086#1081' '#1090#1072#1073#1083#1080#1094#1099':'
  end
  object Label2: TLabel [3]
    Left = 8
    Top = 56
    Width = 124
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1083#1103':'
  end
  object Label4: TLabel [4]
    Left = 208
    Top = 56
    Width = 123
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1090#1086#1088#1086#1075#1086' '#1087#1086#1083#1103':'
  end
  inherited Panel1: TPanel
    Top = 116
    Width = 406
    ExplicitTop = 111
    ExplicitWidth = 396
    inherited bbOK: TBitBtn
      Left = 140
      ExplicitLeft = 130
    end
    inherited bbApply: TBitBtn
      Left = 317
      ExplicitLeft = 307
    end
    inherited bbCancel: TBitBtn
      Left = 229
      ExplicitLeft = 219
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbcbeTable1: TDBLookupComboboxEh [6]
    Left = 8
    Top = 27
    Width = 161
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_table'
    ListField = 'ctable_caption'
    ListSource = dsTable1
    TabOrder = 1
    Visible = True
    OnChange = dbcbeTable1Change
  end
  object dbcbeTable2: TDBLookupComboboxEh [7]
    Left = 208
    Top = 27
    Width = 180
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_table'
    ListField = 'ctable_caption'
    ListSource = dsTable2
    TabOrder = 2
    Visible = True
    OnChange = dbcbeTable2Change
  end
  object dbcbeField1: TDBLookupComboboxEh [8]
    Left = 8
    Top = 75
    Width = 161
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_field'
    ListField = 'cfield_caption'
    ListSource = dsField1
    TabOrder = 3
    Visible = True
  end
  object dbcbeField2: TDBLookupComboboxEh [9]
    Left = 208
    Top = 75
    Width = 180
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_field'
    ListField = 'cfield_caption'
    ListSource = dsField2
    TabOrder = 4
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 465
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
  object dsTable1: TDataSource
    DataSet = QMDataModule.adodsQMAdminTables
    Left = 144
    Top = 40
  end
  object dsTable2: TDataSource
    DataSet = QMDataModule.adodsQMAdminTables
    Left = 176
    Top = 40
  end
  object dsField2: TDataSource
    Left = 176
    Top = 80
  end
  object dsField1: TDataSource
    Left = 144
    Top = 80
  end
end
