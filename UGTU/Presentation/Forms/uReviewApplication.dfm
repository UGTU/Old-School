inherited frmReviewApplication: TfrmReviewApplication
  Caption = 'frmReviewApplication'
  ClientHeight = 346
  ClientWidth = 446
  ExplicitWidth = 452
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 446
    Height = 306
    ExplicitLeft = 32
    ExplicitWidth = 443
    ExplicitHeight = 345
  end
  inherited Label2: TLabel
    Top = 54
    ExplicitTop = 54
  end
  inherited Label3: TLabel
    Left = 21
    Top = 230
    ExplicitLeft = 21
    ExplicitTop = 230
  end
  inherited Label4: TLabel
    Left = 238
    Top = 230
    ParentFont = False
    ExplicitLeft = 238
    ExplicitTop = 230
  end
  inherited Label5: TLabel
    Left = 22
    Top = 267
    ExplicitLeft = 22
    ExplicitTop = 267
  end
  object Label6: TLabel [6]
    Left = 21
    Top = 98
    Width = 43
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072
  end
  object Label7: TLabel [7]
    Left = 21
    Top = 129
    Width = 87
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1087#1077#1088#1077#1076#1072#1095#1080
  end
  object Label8: TLabel [8]
    Left = 21
    Top = 156
    Width = 58
    Height = 13
    Caption = #1055#1077#1088#1077#1089#1099#1083#1082#1072
  end
  object Label9: TLabel [9]
    Left = 22
    Top = 198
    Width = 27
    Height = 13
    Caption = #1042#1080#1079#1099
  end
  object Label10: TLabel [10]
    Left = 166
    Top = 177
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
  object Label11: TLabel [11]
    Left = 70
    Top = 98
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
  object Label12: TLabel [12]
    Left = 114
    Top = 129
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
  object Label13: TLabel [13]
    Left = 85
    Top = 153
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
    Top = 306
    Width = 446
    OnClick = Panel1Click
    ExplicitTop = 306
    inherited bbOK: TBitBtn
      Left = 272
      Enabled = False
      ModalResult = 0
      ExplicitLeft = 269
    end
    inherited bbApply: TBitBtn
      Left = 23
    end
    inherited bbCancel: TBitBtn
      Left = 358
    end
    inherited BitBtn1: TBitBtn
      Left = 125
      Enabled = False
    end
  end
  inherited eDest: TEdit
    Left = 164
    Top = 51
    Width = 232
    ExplicitLeft = 164
    ExplicitTop = 51
    ExplicitWidth = 232
  end
  inherited eNum: TEdit
    Left = 166
    Top = 227
    ExplicitLeft = 166
    ExplicitTop = 227
  end
  inherited eInd: TEdit
    Left = 282
    Top = 227
    ExplicitLeft = 282
    ExplicitTop = 227
  end
  inherited dtUtv: TDateTimePicker
    Left = 166
    Width = 230
    ExplicitLeft = 166
    ExplicitWidth = 230
  end
  inherited dtGot: TDateTimePicker
    Left = 166
    Top = 267
    Width = 230
    ExplicitLeft = 166
    ExplicitTop = 267
    ExplicitWidth = 230
  end
  object cbexReason: TDBLookupComboboxEh [20]
    Left = 164
    Top = 101
    Width = 232
    Height = 21
    DataField = ''
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'Ik_pric'
    ListField = 'ShortCname_pric'
    ListSource = dmDocs.dsPricina
    ParentFont = False
    TabOrder = 6
    Visible = True
    OnChange = cbexReasonChange
  end
  object rbP: TRadioButton [21]
    Left = 166
    Top = 128
    Width = 113
    Height = 17
    Caption = #1055#1086#1095#1090#1086#1081
    Checked = True
    TabOrder = 7
    TabStop = True
    OnClick = rbPClick
  end
  object rbL: TRadioButton [22]
    Left = 285
    Top = 128
    Width = 113
    Height = 17
    Caption = #1053#1072' '#1088#1091#1082#1080
    TabOrder = 8
    OnClick = rbLClick
  end
  object Edit1: TEdit [23]
    Left = 164
    Top = 195
    Width = 230
    Height = 21
    TabOrder = 9
    Text = #1055#1088#1086#1088#1077#1082#1090#1086#1088' '#1087#1086' '#1091#1095#1077#1073#1085#1086#1081' '#1088#1072#1073#1086#1090#1077
  end
  object cbexTransp: TDBLookupComboboxEh [24]
    Left = 166
    Top = 150
    Width = 232
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
    TabOrder = 10
    Visible = True
    OnChange = cbexTranspChange
  end
  inherited actBaseDialog: TActionList
    Top = 248
  end
end
