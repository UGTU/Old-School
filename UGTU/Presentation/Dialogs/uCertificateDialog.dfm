inherited frmEGECertificateCheck: TfrmEGECertificateCheck
  Cursor = crHourGlass
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1086#1074' '#1045#1043#1069
  ClientHeight = 524
  ClientWidth = 564
  OnShow = FormShow
  ExplicitWidth = 570
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 564
    Height = 462
    ExplicitWidth = 1159
    ExplicitHeight = 609
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 13
    Width = 30
    Height = 13
    Caption = #1060#1048#1054':'
  end
  object Label5: TLabel [2]
    Left = 16
    Top = 244
    Width = 77
    Height = 13
    Caption = #1042#1089#1077' '#1101#1082#1079#1072#1084#1077#1085#1099':'
  end
  inherited Panel1: TPanel
    Top = 462
    Width = 564
    Height = 62
    ExplicitTop = 462
    ExplicitWidth = 564
    ExplicitHeight = 62
    inherited bbOK: TBitBtn
      Left = 344
      Top = 24
      Width = 209
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1082#1079#1072#1084#1077#1085#1099' '#1074' '#1079#1072#1103#1074#1083#1077#1085#1080#1077' '
      ModalResult = 1
      ExplicitLeft = 344
      ExplicitTop = 24
      ExplicitWidth = 209
    end
    inherited bbApply: TBitBtn
      Left = -77
      Top = 21
      Visible = False
      ExplicitLeft = -77
      ExplicitTop = 21
    end
    inherited bbCancel: TBitBtn
      Left = 268
      Top = 24
      Width = 70
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      ExplicitLeft = 268
      ExplicitTop = 24
      ExplicitWidth = 70
    end
    inherited bbSprav: TBitBtn
      Left = 0
      Top = 6
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 6
    end
  end
  object sgExams: TStringGrid [4]
    Left = 16
    Top = 263
    Width = 537
    Height = 175
    BorderStyle = bsNone
    ColCount = 4
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    GridLineWidth = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 1
    ColWidths = (
      177
      58
      97
      116)
  end
  object eFio: TDBEditEh [5]
    Left = 16
    Top = 29
    Width = 537
    Height = 19
    Alignment = taLeftJustify
    DynProps = <>
    EditButtons = <>
    Enabled = False
    Flat = True
    ReadOnly = True
    TabOrder = 2
    Visible = True
    EditMask = ''
  end
  object Memo1: TMemo [6]
    Left = 512
    Top = 344
    Width = 495
    Height = 94
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object GroupBox1: TGroupBox [7]
    Left = 8
    Top = 57
    Width = 545
    Height = 173
    Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
    TabOrder = 4
    object Label2: TLabel
      Left = 267
      Top = 68
      Width = 198
      Height = 13
      Caption = #1058#1080#1087#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1085#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 119
      Width = 61
      Height = 13
      Caption = #1043#1086#1076' '#1074#1099#1076#1072#1095#1080':'
    end
    object Label4: TLabel
      Left = 267
      Top = 119
      Width = 37
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089':'
    end
    object Label6: TLabel
      Left = 8
      Top = 68
      Width = 106
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
    end
    object lCurrentCert: TLabel
      Left = 251
      Top = 30
      Width = 17
      Height = 13
      Caption = '1/1'
    end
    object bNextCert: TBitBtn
      Left = 274
      Top = 24
      Width = 34
      Height = 25
      Caption = '>>'
      Enabled = False
      TabOrder = 0
      OnClick = bNextCertClick
    end
    object bPrevCert: TBitBtn
      Left = 211
      Top = 24
      Width = 34
      Height = 25
      Caption = '<<'
      Enabled = False
      TabOrder = 1
      OnClick = bPrevCertClick
    end
    object eCertNumber: TDBEditEh
      Left = 8
      Top = 85
      Width = 241
      Height = 19
      Alignment = taLeftJustify
      DynProps = <>
      EditButtons = <>
      Enabled = False
      Flat = True
      ReadOnly = True
      TabOrder = 2
      Visible = True
      EditMask = ''
    end
    object eStatus: TDBEditEh
      Left = 267
      Top = 136
      Width = 257
      Height = 19
      Alignment = taLeftJustify
      DynProps = <>
      EditButtons = <>
      Enabled = False
      Flat = True
      ReadOnly = True
      TabOrder = 3
      Visible = True
      EditMask = ''
    end
    object eTypoNumber: TDBEditEh
      Left = 267
      Top = 85
      Width = 257
      Height = 19
      Alignment = taLeftJustify
      DynProps = <>
      EditButtons = <>
      Enabled = False
      Flat = True
      ReadOnly = True
      TabOrder = 4
      Visible = True
      EditMask = ''
    end
    object eYear: TDBEditEh
      Left = 8
      Top = 136
      Width = 241
      Height = 19
      Alignment = taLeftJustify
      DynProps = <>
      EditButtons = <>
      Enabled = False
      Flat = True
      ReadOnly = True
      TabOrder = 5
      Visible = True
      EditMask = ''
    end
  end
  inherited actBaseDialog: TActionList
    Left = 649
    Top = 416
  end
end
