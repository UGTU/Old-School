inherited ftmNapr: TftmNapr
  Left = 503
  Top = 535
  HelpKeyword = 'Given_naprav_stud.htm'
  Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 231
  ClientWidth = 261
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 267
  ExplicitHeight = 260
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 261
    Height = 190
    ExplicitWidth = 261
    ExplicitHeight = 167
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 45
    Width = 89
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072':'
  end
  object Label2: TLabel [2]
    Left = 10
    Top = 82
    Width = 59
    Height = 13
    Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100':'
  end
  object Label4: TLabel [3]
    Left = 134
    Top = 5
    Width = 47
    Height = 13
    Caption = #1055#1086#1088#1103#1076#1086#1082':'
  end
  object Label5: TLabel [4]
    Left = 10
    Top = 5
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '
  end
  object Label7: TLabel [5]
    Left = 10
    Top = 122
    Width = 69
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
  end
  object Label9: TLabel [6]
    Left = 134
    Top = 122
    Width = 97
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1076#1086':'
  end
  object Label10: TLabel [7]
    Left = 80
    Top = 122
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
  object Label11: TLabel [8]
    Left = 232
    Top = 122
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
  object Label12: TLabel [9]
    Left = 99
    Top = 45
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
  object Label14: TLabel [10]
    Left = 70
    Top = 82
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
  object Label15: TLabel [11]
    Left = 181
    Top = 5
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
  object Label17: TLabel [12]
    Left = 91
    Top = 31
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
    Top = 190
    Width = 261
    ExplicitTop = 190
    ExplicitWidth = 261
    inherited bbOK: TBitBtn
      Left = 23
      Width = 76
      Enabled = False
      ExplicitLeft = 23
      ExplicitWidth = 76
    end
    inherited bbApply: TBitBtn
      Left = 179
      Width = 76
      Enabled = False
      ExplicitLeft = 179
      ExplicitWidth = 76
    end
    inherited bbCancel: TBitBtn
      Left = 101
      Width = 76
      ExplicitLeft = 101
      ExplicitWidth = 76
    end
    inherited bbSprav: TBitBtn
      Top = -8
      Visible = False
      ExplicitTop = -8
    end
  end
  object dbdteOut: TDBDateTimeEditEh [14]
    Left = 10
    Top = 138
    Width = 121
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
    OnChange = dbdteOutChange
  end
  object dbdteTo: TDBDateTimeEditEh [15]
    Left = 135
    Top = 138
    Width = 120
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
    OnChange = eNumChange
  end
  object eNum: TDBNumberEditEh [16]
    Left = 10
    Top = 21
    Width = 120
    Height = 19
    Alignment = taLeftJustify
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnChange = eNumChange
  end
  object dbcbeVidExam: TDBLookupComboboxEh [17]
    Left = 134
    Top = 21
    Width = 121
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_vid_exam'
    ListField = 'cName_vid_exam'
    ListSource = dm.dsVidExam
    TabOrder = 4
    Visible = True
    OnChange = eNumChange
  end
  object dbcbeDisc: TDBLookupComboboxEh [18]
    Left = 10
    Top = 99
    Width = 245
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_ved'
    ListField = 'NaprName'
    ListSource = dmUspevaemost.dsPredmStud
    TabOrder = 5
    Visible = True
    OnChange = eNumChange
  end
  object dbcbeNum: TDBNumberEditEh [19]
    Left = 10
    Top = 60
    Width = 245
    Height = 19
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    Flat = True
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 6
    Value = 1.000000000000000000
    Visible = True
    OnChange = dbcbeNumChange
  end
  object cbPrintExcel: TCheckBox [20]
    Left = 10
    Top = 163
    Width = 100
    Height = 17
    Caption = #1042#1099#1074#1086#1076' '#1074' Excel'
    TabOrder = 7
    OnClick = cbPrintExcelClick
  end
  object cbBlankNapr: TCheckBox [21]
    Left = 134
    Top = 163
    Width = 119
    Height = 17
    Caption = #1053#1072' '#1075#1086#1090#1086#1074#1099#1081' '#1073#1083#1072#1085#1082
    Enabled = False
    TabOrder = 8
  end
end
