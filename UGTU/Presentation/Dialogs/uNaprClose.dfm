inherited ftmNaprclose: TftmNaprclose
  Left = 340
  Top = 536
  HelpKeyword = 'Close_naprav_stud.htm'
  Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 217
  ClientWidth = 395
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 401
  ExplicitHeight = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 395
    Height = 176
    ExplicitLeft = -8
    ExplicitTop = 2
    ExplicitWidth = 395
    ExplicitHeight = 176
  end
  object Label1: TLabel [1]
    Left = 13
    Top = 7
    Width = 71
    Height = 13
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
  end
  object Label2: TLabel [2]
    Left = 13
    Top = 93
    Width = 41
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072':'
  end
  object Label3: TLabel [3]
    Left = 184
    Top = 90
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1076#1072#1095#1080':'
  end
  object Label4: TLabel [4]
    Left = 14
    Top = 51
    Width = 71
    Height = 13
    Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1090#1086#1088':'
  end
  object Label13: TLabel [5]
    Left = 85
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
  object Label5: TLabel [6]
    Left = 85
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
  object Label6: TLabel [7]
    Left = 55
    Top = 90
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
  object Label7: TLabel [8]
    Left = 186
    Top = 87
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
  object Label8: TLabel [9]
    Left = 13
    Top = 128
    Width = 30
    Height = 13
    Caption = #1058#1077#1084#1072':'
  end
  inherited Panel1: TPanel
    Top = 176
    Width = 395
    ExplicitTop = 176
    ExplicitWidth = 395
    inherited bbOK: TBitBtn
      Left = 137
      Top = 6
      Enabled = False
      ExplicitLeft = 137
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 303
      Top = 6
      Enabled = False
      ExplicitLeft = 303
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 220
      Top = 6
      ExplicitLeft = 220
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbcbeNapr: TDBLookupComboboxEh [11]
    Left = 13
    Top = 21
    Width = 374
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_ved'
    ListField = 'Content_name'
    ListSource = dsNapr
    TabOrder = 1
    Visible = True
    OnChange = dbcbeNaprChange
  end
  object dbcbeMark: TDBLookupComboboxEh [12]
    Left = 13
    Top = 106
    Width = 167
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Cosenca'
    ListField = 'ShortName'
    ListSource = dmUspevaemost.dsMark
    TabOrder = 2
    Visible = True
    OnChange = dbcbeNaprChange
  end
  object dbdteExam: TDBDateTimeEditEh [13]
    Left = 184
    Top = 106
    Width = 203
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
    OnChange = dbcbeNaprChange
  end
  object dbcbeEx: TDBLookupComboboxEh [14]
    Left = 13
    Top = 65
    Width = 374
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'itab_n'
    ListField = 'NamePrepod'
    ListSource = dmUspevaemost.dsPrepodVed
    TabOrder = 4
    Visible = True
  end
  object eTema: TDBEditEh [15]
    Left = 13
    Top = 144
    Width = 374
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
  end
  object dsNapr: TDataSource
    Left = 296
    Top = 8
  end
end
