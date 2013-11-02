inherited frmDiplomOKadr: TfrmDiplomOKadr
  Left = 237
  Top = 106
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1099#1087#1080#1089#1082#1080' '#1082' '#1076#1080#1087#1083#1086#1084#1091
  ClientHeight = 143
  ClientWidth = 303
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 309
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 303
    Height = 102
    ExplicitWidth = 293
    ExplicitHeight = 102
  end
  object Label1: TLabel [1]
    Left = 19
    Top = 8
    Width = 126
    Height = 13
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label8: TLabel [2]
    Left = 19
    Top = 52
    Width = 113
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1097#1080#1090#1099' '#1087#1088#1086#1077#1082#1090#1072
  end
  object Label9: TLabel [3]
    Left = 140
    Top = 9
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
  object Label10: TLabel [4]
    Left = 315
    Top = 9
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
  object Label11: TLabel [5]
    Left = 74
    Top = 49
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
  object Label12: TLabel [6]
    Left = 315
    Top = 49
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
  object Label13: TLabel [7]
    Left = 187
    Top = 88
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
  object Label14: TLabel [8]
    Left = 143
    Top = 127
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
  object Label15: TLabel [9]
    Left = 353
    Top = 171
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
  object Label16: TLabel [10]
    Left = 223
    Top = 171
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
  object Label18: TLabel [11]
    Left = 48
    Top = 171
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
    Top = 102
    Width = 303
    TabOrder = 2
    ExplicitTop = 102
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 40
      Top = 6
      ExplicitLeft = 40
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 214
      Top = 6
      Visible = False
      ExplicitLeft = 214
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 127
      Top = 6
      ExplicitLeft = 127
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object edtRegNumber: TDBEditEh [13]
    Left = 19
    Top = 24
    Width = 179
    Height = 19
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    EditButtons = <>
    Flat = True
    MaxLength = 500
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = edtVipNumderChange
  end
  object dteZashita: TDBDateTimeEditEh [14]
    Left = 19
    Top = 68
    Width = 179
    Height = 19
    Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091' '#1079#1072#1097#1080#1090#1099' '#1076#1080#1087#1083#1086#1084#1085#1086#1075#1086' '#1087#1088#1086#1077#1082#1090#1072
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = edtVipNumderChange
  end
  inherited actBaseDialog: TActionList
    Left = 118
    Top = 346
  end
end
