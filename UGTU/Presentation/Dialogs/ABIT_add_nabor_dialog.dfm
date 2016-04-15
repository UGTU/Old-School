inherited frmNewNabor: TfrmNewNabor
  Left = 89
  Top = 214
  HelpKeyword = 'A_Add_str_in_nabor.htm'
  Caption = #1053#1072#1073#1086#1088
  ClientHeight = 194
  ClientWidth = 627
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 633
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 627
    Height = 161
    ExplicitTop = -2
    ExplicitWidth = 627
    ExplicitHeight = 161
  end
  object Label2: TLabel [1]
    Left = 29
    Top = 10
    Width = 63
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1075#1086#1076#1072':'
  end
  object Label1: TLabel [2]
    Left = 11
    Top = 58
    Width = 81
    Height = 13
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
  end
  object Label6: TLabel [3]
    Left = 51
    Top = 139
    Width = 43
    Height = 13
    Caption = #1041#1102#1076#1078#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [4]
    Left = 92
    Top = 6
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel [5]
    Left = 33
    Top = 35
    Width = 59
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
  end
  object Label10: TLabel [6]
    Left = 92
    Top = 54
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label110: TLabel [7]
    Left = 188
    Top = 139
    Width = 82
    Height = 13
    Caption = #1062#1077#1083#1077#1074#1086#1081' '#1087#1088#1080#1077#1084':'
  end
  object Label17: TLabel [8]
    Left = 92
    Top = 29
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [9]
    Left = 11
    Top = 116
    Width = 230
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1077' '#1094#1080#1092#1088#1099' '#1087#1088#1080#1077#1084#1072' '#1080' '#1082#1074#1086#1090#1099' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [10]
    Left = 368
    Top = 139
    Width = 74
    Height = 13
    Caption = #1054#1089#1086#1073#1086#1077' '#1087#1088#1072#1074#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [11]
    Left = 92
    Top = 135
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [12]
    Left = 270
    Top = 135
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [13]
    Left = 441
    Top = 135
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [14]
    Left = 40
    Top = 83
    Width = 49
    Height = 13
    Caption = #1055#1088#1086#1092#1080#1083#1100':'
  end
  inherited Panel1: TPanel
    Top = 161
    Width = 627
    Height = 33
    TabOrder = 2
    ExplicitTop = 161
    ExplicitWidth = 627
    ExplicitHeight = 33
    inherited bbOK: TBitBtn
      Left = 375
      Top = 4
      Width = 78
      Enabled = False
      ExplicitLeft = 375
      ExplicitTop = 4
      ExplicitWidth = 78
    end
    inherited bbApply: TBitBtn
      Left = 538
      Top = 4
      ExplicitLeft = 538
      ExplicitTop = 4
    end
    inherited bbCancel: TBitBtn
      Left = 455
      Top = 4
      ExplicitLeft = 455
      ExplicitTop = 4
    end
    inherited bbSprav: TBitBtn
      Left = 4
      Top = 4
      ExplicitLeft = 4
      ExplicitTop = 4
    end
  end
  object dbcmbxFac: TDBLookupComboboxEh [16]
    Left = 104
    Top = 30
    Width = 521
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_fac'
    ListField = 'Cname_fac'
    ListSource = DMAbiturientNabor.dsFac
    TabOrder = 0
    Visible = True
    OnChange = dbcmbxFacChange
  end
  object Spec_Fac: TDBLookupComboboxEh [17]
    Left = 102
    Top = 55
    Width = 521
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_spec_fac'
    ListField = 'Cname_spec'
    ListSource = DMAbiturientNabor.dsSpecFac
    TabOrder = 1
    Visible = True
    OnChange = Spec_FacChange
  end
  object nnyear: TDBLookupComboboxEh [18]
    Left = 102
    Top = 7
    Width = 179
    Height = 19
    DataField = ''
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
  object cbRussian: TCheckBox [19]
    Left = 287
    Top = 9
    Width = 154
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = nnyearChange
  end
  object mestBudjet: TDBNumberEditEh [20]
    Left = 102
    Top = 136
    Width = 71
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 5
    Visible = True
    OnChange = nnyearChange
  end
  object mestCKP: TDBNumberEditEh [21]
    Left = 276
    Top = 136
    Width = 71
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 6
    Visible = True
    OnChange = nnyearChange
  end
  object MestLgot: TDBNumberEditEh [22]
    Left = 448
    Top = 136
    Width = 71
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
    OnChange = nnyearChange
  end
  object dbcmbxPrifile: TDBLookupComboboxEh [23]
    Left = 101
    Top = 80
    Width = 521
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_spec'
    ListField = 'Cname_spec'
    ListSource = DMAbiturientNabor.dsProfile
    TabOrder = 8
    Visible = True
    OnChange = dbcmbxPrifileChange
  end
  inherited actBaseDialog: TActionList
    Left = 549
    Top = 2
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
