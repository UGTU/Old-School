inherited fmСhallengeSpr: TfmСhallengeSpr
  Caption = 'fm'#1057'hallengeSpr'
  ClientHeight = 414
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 374
    ExplicitLeft = -8
    ExplicitWidth = 443
    ExplicitHeight = 374
  end
  inherited Label1: TLabel
    Left = 22
    ExplicitLeft = 22
  end
  inherited Label2: TLabel
    Left = 22
    ExplicitLeft = 22
  end
  inherited Label3: TLabel
    Left = 24
    Top = 291
    ExplicitLeft = 24
    ExplicitTop = 291
  end
  inherited Label4: TLabel
    Left = 233
    Top = 291
    ExplicitLeft = 233
    ExplicitTop = 291
  end
  inherited Label5: TLabel
    Left = 24
    Top = 339
    ExplicitLeft = 24
    ExplicitTop = 339
  end
  object Label6: TLabel [6]
    Left = 22
    Top = 102
    Width = 44
    Height = 13
    Caption = #1057#1077#1084#1077#1089#1090#1088
  end
  object Label7: TLabel [7]
    Left = 23
    Top = 144
    Width = 43
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072
  end
  object Label8: TLabel [8]
    Left = 23
    Top = 192
    Width = 31
    Height = 13
    Caption = #1057#1088#1086#1082#1080
  end
  object Label9: TLabel [9]
    Left = 39
    Top = 221
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label10: TLabel [10]
    Left = 39
    Top = 259
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object lblNumDate: TLabel [11]
    Left = 297
    Top = 232
    Width = 94
    Height = 13
    Caption = #1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1077#1081
  end
  object Label12: TLabel [12]
    Left = 72
    Top = 102
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
  object Label11: TLabel [13]
    Left = 72
    Top = 141
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
  inherited Panel1: TPanel
    Top = 374
    ExplicitTop = 374
    inherited bbOK: TBitBtn
      Enabled = False
    end
    inherited BitBtn1: TBitBtn
      Enabled = False
    end
  end
  inherited eDest: TEdit
    Left = 152
    Width = 257
    ExplicitLeft = 152
    ExplicitWidth = 257
  end
  inherited eNum: TEdit
    Left = 152
    Top = 288
    Width = 57
    ExplicitLeft = 152
    ExplicitTop = 288
    ExplicitWidth = 57
  end
  inherited eInd: TEdit
    Left = 277
    Top = 288
    ExplicitLeft = 277
    ExplicitTop = 288
  end
  inherited dtUtv: TDateTimePicker
    Left = 152
    Width = 257
    ExplicitLeft = 152
    ExplicitWidth = 257
  end
  inherited dtGot: TDateTimePicker
    Left = 152
    Top = 331
    Width = 257
    ExplicitLeft = 152
    ExplicitTop = 331
    ExplicitWidth = 257
  end
  object cbeSem: TComboBoxEx [20]
    Left = 152
    Top = 99
    Width = 257
    Height = 22
    ItemsEx = <>
    TabOrder = 6
    OnChange = cbeSemChange
  end
  object cbeReason: TComboBoxEx [21]
    Left = 152
    Top = 141
    Width = 257
    Height = 22
    ItemsEx = <>
    TabOrder = 7
    OnChange = cbeReasonChange
  end
  object dtpBegin: TDateTimePicker [22]
    Left = 152
    Top = 213
    Width = 121
    Height = 21
    Date = 42131.439409826390000000
    Time = 42131.439409826390000000
    Enabled = False
    TabOrder = 8
  end
  object dtpEnd: TDateTimePicker [23]
    Left = 152
    Top = 251
    Width = 121
    Height = 21
    Date = 42131.439409826390000000
    Time = 42131.439409826390000000
    Enabled = False
    TabOrder = 9
  end
  object eNumDate: TEdit [24]
    Left = 397
    Top = 229
    Width = 32
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  inherited actBaseDialog: TActionList
    Left = 57
    Top = 456
  end
end
