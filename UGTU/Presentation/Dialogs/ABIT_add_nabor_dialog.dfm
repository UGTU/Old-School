inherited frmNewNabor: TfrmNewNabor
  Left = 89
  Top = 214
  HelpKeyword = 'A_Add_str_in_nabor.htm'
  Caption = #1053#1072#1073#1086#1088
  ClientHeight = 202
  ClientWidth = 627
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 633
  ExplicitHeight = 231
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel [0]
    Left = 287
    Top = 81
    Width = 337
    Height = 75
    Anchors = [akLeft, akTop, akRight]
  end
  object Bevel2: TBevel [1]
    Left = 0
    Top = 0
    Width = 627
    Height = 161
    Align = alClient
    Style = bsRaised
    ExplicitLeft = 7
    ExplicitWidth = 383
    ExplicitHeight = 173
  end
  object Bevel3: TBevel [2]
    Left = 8
    Top = 81
    Width = 273
    Height = 75
  end
  inherited Bevel1: TBevel
    Width = 627
    Height = 161
    ExplicitLeft = 8
    ExplicitTop = 2
    ExplicitWidth = 627
    ExplicitHeight = 161
  end
  object Label2: TLabel [4]
    Left = 29
    Top = 10
    Width = 63
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1075#1086#1076#1072':'
  end
  object Label1: TLabel [5]
    Left = 11
    Top = 58
    Width = 81
    Height = 13
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
  end
  object Label3: TLabel [6]
    Left = 21
    Top = 86
    Width = 51
    Height = 13
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085
  end
  object Label4: TLabel [7]
    Left = 14
    Top = 130
    Width = 58
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077':'
  end
  object Label6: TLabel [8]
    Left = 314
    Top = 107
    Width = 43
    Height = 13
    Caption = #1041#1102#1076#1078#1077#1090':'
  end
  object Label9: TLabel [9]
    Left = 92
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
  object Label13: TLabel [10]
    Left = 134
    Top = 113
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
  object Label16: TLabel [11]
    Left = 32
    Top = 109
    Width = 40
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086':'
  end
  object Label15: TLabel [12]
    Left = 33
    Top = 35
    Width = 59
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
  end
  object Label10: TLabel [13]
    Left = 92
    Top = 54
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
  object Label110: TLabel [14]
    Left = 331
    Top = 130
    Width = 26
    Height = 13
    Caption = #1062#1050#1055':'
  end
  object Label17: TLabel [15]
    Left = 92
    Top = 29
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
  object Label5: TLabel [16]
    Left = 302
    Top = 83
    Width = 87
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1077#1089#1090
  end
  inherited Panel1: TPanel
    Top = 161
    Width = 627
    TabOrder = 2
    ExplicitTop = 161
    ExplicitWidth = 627
    inherited bbOK: TBitBtn
      Left = 375
      Width = 78
      Enabled = False
      ExplicitLeft = 375
      ExplicitWidth = 78
    end
    inherited bbApply: TBitBtn
      Left = 538
      ExplicitLeft = 538
    end
    inherited bbCancel: TBitBtn
      Left = 455
      ExplicitLeft = 455
    end
  end
  object dbcmbxFac: TDBLookupComboboxEh [18]
    Left = 102
    Top = 32
    Width = 521
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_fac'
    ListField = 'Cname_fac'
    ListSource = DMAbiturientNabor.dsFac
    TabOrder = 0
    Visible = True
    OnChange = dbcmbxFacChange
  end
  object Spec_Fac: TDBLookupComboboxEh [19]
    Left = 102
    Top = 55
    Width = 521
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_spec_fac'
    ListField = 'Cname_spec'
    ListSource = DMAbiturientNabor.dsSpecFac
    TabOrder = 1
    Visible = True
    OnChange = nnyearChange
  end
  object nnyear: TDBLookupComboboxEh [20]
    Left = 102
    Top = 7
    Width = 179
    Height = 19
    Enabled = False
    EditButtons = <>
    Flat = True
    KeyField = 'NNyear'
    ListField = 'NNyear'
    ListSource = dm.dsYears
    TabOrder = 3
    Visible = True
    OnChange = nnyearChange
  end
  object cbRussian: TCheckBox [21]
    Left = 287
    Top = 9
    Width = 154
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
    TabOrder = 4
    OnClick = nnyearChange
  end
  object begind: TDBNumberEditEh [22]
    Left = 78
    Top = 103
    Width = 195
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
    OnChange = nnyearChange
  end
  object endd: TDBNumberEditEh [23]
    Left = 78
    Top = 127
    Width = 195
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 6
    Visible = True
    OnChange = nnyearChange
  end
  object mestBudjet: TDBNumberEditEh [24]
    Left = 375
    Top = 102
    Width = 241
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
    OnChange = nnyearChange
  end
  object mestCKP: TDBNumberEditEh [25]
    Left = 375
    Top = 127
    Width = 241
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    TabOrder = 8
    Visible = True
    OnChange = nnyearChange
  end
  inherited actBaseDialog: TActionList
    Left = 333
    Top = 2
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
