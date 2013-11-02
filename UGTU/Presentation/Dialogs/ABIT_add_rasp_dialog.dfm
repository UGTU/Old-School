inherited frmDialRasp: TfrmDialRasp
  Left = 59
  Top = 292
  HelpKeyword = 'A_Add_str_in_timetable.htm'
  Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 179
  ClientWidth = 413
  OldCreateOrder = True
  ExplicitWidth = 419
  ExplicitHeight = 208
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 413
    Height = 138
    ExplicitWidth = 413
    ExplicitHeight = 135
  end
  object Label1: TLabel [1]
    Left = 38
    Top = 63
    Width = 66
    Height = 13
    Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
  end
  object Label2: TLabel [2]
    Left = 50
    Top = 87
    Width = 54
    Height = 13
    Caption = #1042#1080#1076' '#1089#1076#1072#1095#1080':'
  end
  object Label7: TLabel [3]
    Left = 210
    Top = 38
    Width = 92
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
  end
  object Label8: TLabel [4]
    Left = 33
    Top = 111
    Width = 71
    Height = 13
    Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077':'
  end
  object Label3: TLabel [5]
    Left = 12
    Top = 14
    Width = 92
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
  end
  object Label4: TLabel [6]
    Left = 106
    Top = 11
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
  object Label5: TLabel [7]
    Left = 106
    Top = 108
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
  object Label9: TLabel [8]
    Left = 106
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
  object Label10: TLabel [9]
    Left = 30
    Top = 38
    Width = 74
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072':'
  end
  inherited Panel1: TPanel
    Top = 138
    Width = 413
    TabOrder = 6
    ExplicitTop = 138
    ExplicitWidth = 413
    inherited bbOK: TBitBtn
      Left = 158
      Top = 7
      Enabled = False
      ExplicitLeft = 158
      ExplicitTop = 7
    end
    inherited bbApply: TBitBtn
      Left = 324
      Top = 7
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 324
      ExplicitTop = 7
    end
    inherited bbCancel: TBitBtn
      Left = 241
      Top = 7
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 241
      ExplicitTop = 7
    end
    inherited bbSprav: TBitBtn
      Top = 7
      ExplicitTop = 7
    end
  end
  object MonCal: TDBDateTimeEditEh [11]
    Left = 114
    Top = 11
    Width = 90
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
    OnExit = MonCalChange
  end
  object Timebegin: TDBDateTimeEditEh [12]
    Left = 114
    Top = 34
    Width = 90
    Height = 19
    EditButton.Visible = False
    EditButtons = <>
    Flat = True
    Kind = dtkTimeEh
    TabOrder = 1
    Visible = True
    OnChange = DiscChange
  end
  object TimeEnd: TDBDateTimeEditEh [13]
    Left = 305
    Top = 34
    Width = 100
    Height = 19
    EditButton.Visible = False
    EditButtons = <>
    Flat = True
    Kind = dtkTimeEh
    TabOrder = 2
    Visible = True
    OnChange = DiscChange
  end
  object Disc: TDBLookupComboboxEh [14]
    Left = 114
    Top = 60
    Width = 291
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnChange = DiscChange
  end
  object vidsd: TDBLookupComboboxEh [15]
    Left = 114
    Top = 84
    Width = 291
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 4
    Visible = True
    OnChange = DiscChange
  end
  object Meropr: TDBLookupComboboxEh [16]
    Left = 114
    Top = 108
    Width = 291
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
    OnChange = DiscChange
  end
  inherited actBaseDialog: TActionList
    Left = 286
    Top = 7
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
