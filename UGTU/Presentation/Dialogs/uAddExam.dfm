inherited frmAddExamDialog: TfrmAddExamDialog
  Left = 738
  Top = 532
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1099#1081' '#1101#1082#1079#1072#1084#1077#1085
  ClientHeight = 233
  ClientWidth = 268
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 274
  ExplicitHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 14
    Top = 140
    Width = 148
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072' (1- '#1079#1072#1095#1105#1090', 0 - '#1085#1077#1079#1072#1095#1105#1090')'
    Visible = False
  end
  inherited Bevel1: TBevel
    Width = 268
    Height = 192
    ExplicitWidth = 268
    ExplicitHeight = 192
  end
  object Label3: TLabel [2]
    Left = 14
    Top = 10
    Width = 63
    Height = 13
    Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
  end
  object Label6: TLabel [3]
    Left = 78
    Top = 10
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
  object Label1: TLabel [4]
    Left = 66
    Top = 51
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
  object Label2: TLabel [5]
    Left = 14
    Top = 53
    Width = 51
    Height = 13
    Caption = #1042#1080#1076' '#1089#1076#1072#1095#1080
  end
  object Label8: TLabel [6]
    Left = 14
    Top = 97
    Width = 163
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'/'#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
  end
  object Label9: TLabel [7]
    Left = 14
    Top = 140
    Width = 38
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072
  end
  object Label4: TLabel [8]
    Left = 14
    Top = 140
    Width = 138
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072' ('#1073#1072#1083#1083#1099' '#1086#1090' 0 '#1076#1086' 100)'
    Visible = False
  end
  inherited Panel1: TPanel
    Top = 192
    Width = 268
    ExplicitTop = 192
    ExplicitWidth = 268
    inherited bbOK: TBitBtn
      Left = 14
      Top = 6
      Width = 79
      Enabled = False
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 6
      ExplicitWidth = 79
    end
    inherited bbApply: TBitBtn
      Left = 174
      Top = 6
      Width = 78
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ExplicitLeft = 174
      ExplicitTop = 6
      ExplicitWidth = 78
    end
    inherited bbCancel: TBitBtn
      Left = 95
      Top = 6
      Width = 77
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 95
      ExplicitTop = 6
      ExplicitWidth = 77
    end
    inherited bbSprav: TBitBtn
      Top = -14
      Visible = False
      ExplicitTop = -14
    end
  end
  object dbcbeDisc: TDBLookupComboboxEh [10]
    Left = 14
    Top = 28
    Width = 238
    Height = 19
    DataField = ''
    DropDownBox.Rows = 20
    EditButtons = <>
    Flat = True
    KeyField = 'ik_disc'
    ListField = #1089'name_disc'
    ListSource = dm.dsAbitDiscipline
    TabOrder = 1
    Visible = True
    OnChange = dbcbeDiscChange
  end
  object dbcbeVid: TDBLookupComboboxEh [11]
    Left = 14
    Top = 73
    Width = 238
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_sdach'
    ListField = 'cname_sdach'
    ListSource = dm.dsAbitExamType
    TabOrder = 2
    Visible = True
    OnChange = dbcbeDiscChange
  end
  object eVedNum: TDBEditEh [12]
    Left = 14
    Top = 115
    Width = 238
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
  end
  object eMark: TDBNumberEditEh [13]
    Left = 14
    Top = 157
    Width = 238
    Height = 19
    Alignment = taLeftJustify
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 4
    Visible = True
  end
end
