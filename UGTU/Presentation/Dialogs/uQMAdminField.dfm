inherited frmQMAdminField: TfrmQMAdminField
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1077
  ClientHeight = 212
  ClientWidth = 274
  ExplicitWidth = 280
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 274
    Height = 171
    ExplicitWidth = 274
    ExplicitHeight = 171
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 52
    Width = 128
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1103' '#1074' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093':'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 95
    Width = 80
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103':'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099':'
  end
  inherited Panel1: TPanel
    Top = 171
    Width = 274
    ExplicitTop = 171
    ExplicitWidth = 274
    inherited bbOK: TBitBtn
      Left = 18
      ExplicitLeft = 18
    end
    inherited bbApply: TBitBtn
      Left = 183
      ExplicitLeft = 183
    end
    inherited bbCancel: TBitBtn
      Left = 100
      ExplicitLeft = 100
    end
    inherited bbSprav: TBitBtn
      Left = 19
      Top = 31
      Visible = False
      ExplicitLeft = 19
      ExplicitTop = 31
    end
  end
  object eName: TDBEditEh [5]
    Left = 8
    Top = 71
    Width = 258
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
  end
  object eCaption: TDBEditEh [6]
    Left = 8
    Top = 113
    Width = 258
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
  end
  object cbVisible: TCheckBox [7]
    Left = 8
    Top = 143
    Width = 161
    Height = 17
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1074#1080#1076#1080#1090' '#1087#1086#1083#1077
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object dbcbeTable: TDBLookupComboboxEh [8]
    Left = 8
    Top = 27
    Width = 258
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_table'
    ListField = 'ctable_caption'
    ListSource = dsTable
    TabOrder = 4
    Visible = True
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
  object dsTable: TDataSource
    DataSet = QMDataModule.adodsQMAdminTables
    Left = 224
    Top = 48
  end
end
