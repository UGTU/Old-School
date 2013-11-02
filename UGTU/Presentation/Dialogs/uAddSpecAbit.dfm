inherited frmAdditionalSpec: TfrmAdditionalSpec
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1091#1102' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  ClientHeight = 100
  ClientWidth = 343
  OnShow = FormShow
  ExplicitWidth = 349
  ExplicitHeight = 132
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 343
    Height = 59
    ExplicitWidth = 343
    ExplicitHeight = 59
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 6
    Width = 32
    Height = 13
    Caption = #1053#1072#1073#1086#1088
  end
  object Label5: TLabel [2]
    Left = 42
    Top = 6
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 59
    Width = 343
    ExplicitTop = 59
    ExplicitWidth = 343
    inherited bbOK: TBitBtn
      Left = 84
      Visible = False
      ExplicitLeft = 84
    end
    inherited bbApply: TBitBtn
      Left = 168
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ExplicitLeft = 168
    end
    inherited bbCancel: TBitBtn
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
    inherited bbSprav: TBitBtn
      Left = 21
      Top = 6
      Width = 100
      Visible = False
      ExplicitLeft = 21
      ExplicitTop = 6
      ExplicitWidth = 100
    end
  end
  object dbcbeRecruit: TDBLookupComboboxEh [4]
    Left = 8
    Top = 25
    Width = 327
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NNrecord'
    ListField = 'Name'
    ListSource = dm.dsAdditionalSpec
    TabOrder = 1
    Visible = True
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
