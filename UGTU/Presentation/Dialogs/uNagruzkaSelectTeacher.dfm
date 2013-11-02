inherited frmNagruzkaSelectTeacher: TfrmNagruzkaSelectTeacher
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
  ClientHeight = 155
  ClientWidth = 340
  ExplicitWidth = 346
  ExplicitHeight = 187
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 117
    Width = 340
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 128
    ExplicitWidth = 340
    ExplicitHeight = 3
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 29
    Width = 110
    Height = 13
    Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103':'
  end
  object Label4: TLabel [2]
    Left = 8
    Top = 72
    Width = 142
    Height = 13
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103':'
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 8
    Width = 275
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103' '#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1074#1080#1076' '#1088#1072#1073#1086#1090#1099':'
  end
  inherited Panel1: TPanel
    Top = 120
    Width = 340
    Height = 35
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 120
    ExplicitWidth = 365
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 169
      Top = 5
      Default = True
      ExplicitLeft = 169
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = -70
      Top = 29
      TabOrder = 2
      Visible = False
      ExplicitLeft = -45
      ExplicitTop = 29
    end
    inherited bbCancel: TBitBtn
      Left = 253
      Top = 5
      TabOrder = 1
      ExplicitLeft = 278
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 7
      Top = 29
      Width = 109
      Visible = False
      ExplicitLeft = 7
      ExplicitTop = 29
      ExplicitWidth = 109
    end
  end
  object dbcbPrep: TDBLookupComboboxEh [5]
    Left = 8
    Top = 48
    Width = 326
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
    OnKeyValueChanged = dbcbPrepKeyValueChanged
  end
  object dbcbWorkType: TDBLookupComboboxEh [6]
    Left = 8
    Top = 88
    Width = 326
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = dbcbWorkTypeKeyValueChanged
  end
  inherited actBaseDialog: TActionList
    Left = 294
    Top = 97
  end
end
