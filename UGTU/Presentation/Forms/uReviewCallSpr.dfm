inherited fmСhallengeSpr: TfmСhallengeSpr
  Caption = 'fm'#1057'hallengeSpr'
  ClientHeight = 516
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 476
    ExplicitTop = 24
    ExplicitWidth = 443
    ExplicitHeight = 476
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
    Top = 387
    ExplicitTop = 387
  end
  inherited Label4: TLabel
    Left = 233
    Top = 387
    ExplicitLeft = 233
    ExplicitTop = 387
  end
  inherited Label5: TLabel
    Top = 435
    ExplicitTop = 435
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
  object Bevel2: TBevel [14]
    Left = 0
    Top = 0
    Width = 443
    Height = 476
    Align = alClient
    Style = bsRaised
    ExplicitLeft = -8
  end
  object Label13: TLabel [15]
    Left = 20
    Top = 291
    Width = 87
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1087#1077#1088#1077#1076#1072#1095#1080
  end
  object Label14: TLabel [16]
    Left = 23
    Top = 334
    Width = 58
    Height = 13
    Caption = #1055#1077#1088#1077#1089#1099#1083#1082#1072
  end
  object Label15: TLabel [17]
    Left = 152
    Top = 358
    Width = 32
    Height = 12
    Caption = 'Label10'
    Font.Charset = OEM_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label16: TLabel [18]
    Left = 113
    Top = 291
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
  object Label17: TLabel [19]
    Left = 87
    Top = 334
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
    Top = 476
    ExplicitTop = 476
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
    Top = 384
    Width = 57
    ExplicitLeft = 152
    ExplicitTop = 384
    ExplicitWidth = 57
  end
  inherited eInd: TEdit
    Left = 277
    Top = 384
    ExplicitLeft = 277
    ExplicitTop = 384
  end
  inherited dtUtv: TDateTimePicker
    Left = 152
    Width = 257
    ExplicitLeft = 152
    ExplicitWidth = 257
  end
  inherited dtGot: TDateTimePicker
    Left = 152
    Top = 427
    Width = 257
    ExplicitLeft = 152
    ExplicitTop = 427
    ExplicitWidth = 257
  end
  object cbeSem: TComboBoxEx [26]
    Left = 152
    Top = 99
    Width = 257
    Height = 22
    ItemsEx = <>
    TabOrder = 6
    OnChange = cbeSemChange
  end
  object cbeReason: TComboBoxEx [27]
    Left = 152
    Top = 141
    Width = 257
    Height = 22
    ItemsEx = <>
    TabOrder = 7
    OnChange = cbeReasonChange
  end
  object dtpBegin: TDateTimePicker [28]
    Left = 152
    Top = 213
    Width = 121
    Height = 21
    Date = 42131.439409826390000000
    Time = 42131.439409826390000000
    Enabled = False
    TabOrder = 8
  end
  object dtpEnd: TDateTimePicker [29]
    Left = 152
    Top = 251
    Width = 121
    Height = 21
    Date = 42131.439409826390000000
    Time = 42131.439409826390000000
    Enabled = False
    TabOrder = 9
  end
  object eNumDate: TEdit [30]
    Left = 397
    Top = 229
    Width = 32
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object rbP: TRadioButton [31]
    Left = 152
    Top = 290
    Width = 113
    Height = 17
    Caption = #1055#1086#1095#1090#1086#1081
    Checked = True
    TabOrder = 11
    TabStop = True
    OnClick = rbPClick
  end
  object rbL: TRadioButton [32]
    Left = 247
    Top = 290
    Width = 113
    Height = 17
    Caption = #1053#1072' '#1088#1091#1082#1080
    TabOrder = 12
    OnClick = rbLClick
  end
  object cbexTransp: TDBLookupComboboxEh [33]
    Left = 152
    Top = 331
    Width = 257
    Height = 21
    DataField = ''
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'ik_AddressType'
    ListField = 'AddressTypeName'
    ListSource = dmDocs.dsStudAddressProc
    ParentFont = False
    TabOrder = 13
    Visible = True
    OnChange = cbexTranspChange
  end
  inherited actBaseDialog: TActionList
    Left = 57
    Top = 456
  end
end
