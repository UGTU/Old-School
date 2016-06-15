inherited frmAbitMove: TfrmAbitMove
  Left = 435
  Top = 342
  HelpKeyword = 'A_Trans_abit_other_spec.htm'
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1085#1072' '#1076#1088#1091#1075#1091#1102' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  ClientHeight = 272
  ClientWidth = 629
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 635
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 113
    Width = 629
    Height = 118
    ExplicitTop = 113
    ExplicitWidth = 525
    ExplicitHeight = 118
  end
  inherited Panel1: TPanel
    Top = 231
    Width = 629
    ExplicitTop = 231
    ExplicitWidth = 629
    DesignSize = (
      629
      41)
    inherited bbOK: TBitBtn
      Left = 451
      Width = 82
      ExplicitLeft = 451
      ExplicitWidth = 82
    end
    inherited bbApply: TBitBtn
      Left = 539
      Visible = False
      ExplicitLeft = 539
    end
    inherited bbCancel: TBitBtn
      Left = 539
      Width = 83
      ExplicitLeft = 539
      ExplicitWidth = 83
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 0
    Width = 629
    Height = 113
    Align = alTop
    Caption = #1057#1090#1072#1088#1086#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      629
      113)
    object Label2: TLabel
      Left = 9
      Top = 15
      Width = 32
      Height = 13
      Caption = #1053#1072#1073#1086#1088
    end
    object Label5: TLabel
      Left = 43
      Top = 15
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
    object Label3: TLabel
      Left = 127
      Top = 61
      Width = 115
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
    end
    object Label6: TLabel
      Left = 245
      Top = 61
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
    object Label4: TLabel
      Left = 9
      Top = 59
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
    end
    object Label7: TLabel
      Left = 74
      Top = 59
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
    object dbcbeRecruit: TDBLookupComboboxEh
      Left = 9
      Top = 34
      Width = 613
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      DataField = ''
      Enabled = False
      EditButtons = <>
      Flat = True
      KeyField = 'NNrecord'
      ListField = 'FullName'
      ListSource = dm.dsNabor
      TabOrder = 0
      Visible = True
    end
    object dbcbeCategory: TDBLookupComboboxEh
      Left = 127
      Top = 77
      Width = 495
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      DataField = ''
      Enabled = False
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_kat_zach'
      ListField = 'Cname_kat_zach'
      ListSource = dmStudentData.dsGetAbitCat
      TabOrder = 1
      Visible = True
    end
    object dbdteList: TDBDateTimeEditEh
      Left = 9
      Top = 77
      Width = 112
      Height = 19
      DynProps = <>
      Enabled = False
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
  end
  object GroupBox2: TGroupBox [3]
    Left = 0
    Top = 113
    Width = 629
    Height = 118
    Align = alClient
    Caption = #1053#1086#1074#1086#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      629
      118)
    object Label10: TLabel
      Left = 9
      Top = 16
      Width = 32
      Height = 13
      Caption = #1053#1072#1073#1086#1088
    end
    object Label11: TLabel
      Left = 43
      Top = 16
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
    object Label12: TLabel
      Left = 127
      Top = 59
      Width = 115
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
    end
    object Label13: TLabel
      Left = 245
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
    object Label14: TLabel
      Left = 9
      Top = 59
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
    end
    object Label15: TLabel
      Left = 74
      Top = 59
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
    object dbcbeRecruitNew: TDBLookupComboboxEh
      Left = 9
      Top = 34
      Width = 613
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'NNrecord'
      ListField = 'FullName'
      ListSource = dm.dsNabor
      TabOrder = 0
      Visible = True
      OnChange = dbcbeRecruitNewChange
    end
    object dbcbeCategoryNew: TDBLookupComboboxEh
      Left = 127
      Top = 78
      Width = 495
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_kat_zach'
      ListField = 'Cname_kat_zach'
      ListSource = dmStudentData.dsGetAbitCat
      TabOrder = 1
      Visible = True
    end
    object dbdteListNew: TDBDateTimeEditEh
      Left = 9
      Top = 77
      Width = 112
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
  end
  inherited actBaseDialog: TActionList
    Left = 321
    Top = 16
  end
end
