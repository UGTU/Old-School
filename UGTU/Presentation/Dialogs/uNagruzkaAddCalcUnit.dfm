inherited frmNagruzkaAddCalcUnit: TfrmNagruzkaAddCalcUnit
  BorderStyle = bsSizeable
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1088#1072#1089#1095#1077#1090#1085#1086#1081' '#1077#1076#1080#1085#1080#1094#1099
  ClientHeight = 117
  ClientWidth = 398
  Constraints.MaxHeight = 151
  Constraints.MinHeight = 150
  OnShow = FormShow
  ExplicitWidth = 406
  ExplicitHeight = 151
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 73
    Width = 398
    Height = 9
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 136
    ExplicitWidth = 415
    ExplicitHeight = 9
  end
  object Label1: TLabel [1]
    Left = 54
    Top = 8
    Width = 89
    Height = 13
    Caption = #1056#1077#1072#1083#1100#1085#1072#1103' '#1075#1088#1091#1087#1087#1072':'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 33
    Width = 135
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1089#1095'. '#1077#1076#1080#1085#1080#1094#1099'  :'
  end
  object Label3: TLabel [3]
    Left = 62
    Top = 58
    Width = 81
    Height = 13
    Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'  :'
  end
  object Label8: TLabel [4]
    Left = 135
    Top = 33
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
  object Label4: TLabel [5]
    Left = 135
    Top = 58
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
    Top = 82
    Width = 398
    Height = 35
    BevelOuter = bvNone
    ExplicitTop = 82
    ExplicitWidth = 398
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 224
      Top = 5
      Default = True
      ExplicitLeft = 224
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 43
      Top = 28
      Visible = False
      ExplicitLeft = 43
      ExplicitTop = 28
    end
    inherited bbCancel: TBitBtn
      Left = 311
      Top = 5
      ExplicitLeft = 311
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = -40
      Top = 30
      Visible = False
      ExplicitLeft = -40
      ExplicitTop = 30
    end
  end
  object dbcbGrups: TDBLookupComboboxEh [7]
    Left = 149
    Top = 8
    Width = 243
    Height = 19
    AlwaysShowBorder = True
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = dbcbGrupsKeyValueChanged
  end
  object dbeUnitName: TDBEditEh [8]
    Left = 149
    Top = 31
    Width = 243
    Height = 19
    AlwaysShowBorder = True
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnChange = dbeUnitNameChange
  end
  object dbcbUchPlan: TDBLookupComboboxEh [9]
    Left = 149
    Top = 56
    Width = 243
    Height = 19
    AlwaysShowBorder = True
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnKeyValueChanged = dbeUnitNameChange
  end
  inherited actBaseDialog: TActionList
    Left = 25
    Top = 96
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
