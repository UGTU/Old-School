inherited ftmLangDialog: TftmLangDialog
  Left = 359
  Top = 377
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1103#1079#1099#1082
  ClientHeight = 146
  ClientWidth = 263
  Constraints.MinHeight = 178
  OldCreateOrder = True
  ExplicitWidth = 269
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 263
    Height = 105
    ExplicitWidth = 263
    ExplicitHeight = 105
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 7
    Width = 28
    Height = 13
    Caption = #1071#1079#1099#1082
  end
  object Label2: TLabel [2]
    Left = 10
    Top = 52
    Width = 93
    Height = 13
    Caption = #1057#1090#1077#1087#1077#1085#1100' '#1074#1083#1072#1076#1077#1085#1080#1103
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 7
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
  object Label4: TLabel [4]
    Left = 105
    Top = 52
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
    Top = 105
    Width = 263
    ExplicitTop = 105
    ExplicitWidth = 263
    inherited bbOK: TBitBtn
      Left = 13
      Enabled = False
      Visible = False
      ExplicitLeft = 13
    end
    inherited bbApply: TBitBtn
      Left = 81
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ExplicitLeft = 81
    end
    inherited bbCancel: TBitBtn
      Left = 164
      Width = 86
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 164
      ExplicitWidth = 86
    end
    inherited bbSprav: TBitBtn
      Left = 94
      Top = -13
      Visible = False
      ExplicitLeft = 94
      ExplicitTop = -13
    end
  end
  object dbcbeLang: TDBLookupComboboxEh [6]
    Left = 10
    Top = 22
    Width = 240
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_lang'
    ListField = 'Cname_lang'
    ListSource = dmStudentData.dsLang
    TabOrder = 1
    Visible = True
    OnChange = actCheckFieldsExecute
  end
  object dbcbeStepVlad: TDBLookupComboboxEh [7]
    Left = 10
    Top = 67
    Width = 240
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_step_vlad'
    ListField = 'Cname_step_vlad'
    ListSource = dmStudentData.dsStepVlad
    TabOrder = 2
    Visible = True
    OnChange = actCheckFieldsExecute
  end
  inherited actBaseDialog: TActionList
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnExecute = actCheckFieldsExecute
    end
  end
end
