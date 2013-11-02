inherited frmNagruzkaShowCalculationScheme: TfrmNagruzkaShowCalculationScheme
  BorderStyle = bsSizeable
  Caption = #1057#1093#1077#1084#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
  ClientHeight = 320
  ClientWidth = 624
  Constraints.MinHeight = 255
  Constraints.MinWidth = 630
  OnCreate = FormCreate
  ExplicitWidth = 632
  ExplicitHeight = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 280
    Width = 624
    Height = 5
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 136
    ExplicitWidth = 680
    ExplicitHeight = 5
  end
  object Bevel2: TBevel [1]
    Left = 0
    Top = 51
    Width = 7
    Height = 203
    Align = alLeft
    Shape = bsSpacer
    ExplicitTop = 65
    ExplicitHeight = 300
  end
  object Bevel3: TBevel [2]
    Left = 617
    Top = 51
    Width = 7
    Height = 203
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 8
    ExplicitTop = 73
    ExplicitHeight = 300
  end
  inherited Panel1: TPanel
    Top = 285
    Width = 624
    Height = 35
    BevelOuter = bvNone
    ExplicitTop = 285
    ExplicitWidth = 624
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 537
      Top = 5
      Default = True
      ExplicitLeft = 537
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 303
      Top = 26
      Visible = False
      ExplicitLeft = 303
      ExplicitTop = 26
    end
    inherited bbCancel: TBitBtn
      Left = 303
      Top = 26
      Visible = False
      ExplicitLeft = 303
      ExplicitTop = 26
    end
    inherited bbSprav: TBitBtn
      Top = 32
      Visible = False
      ExplicitTop = 32
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 0
    Width = 624
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 34
      Height = 13
      Caption = #1055#1086#1090#1086#1082':'
    end
    object Label2: TLabel
      Left = 269
      Top = 8
      Width = 66
      Height = 13
      Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 30
      Width = 66
      Height = 13
      Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081':'
    end
    object Label5: TLabel
      Left = 80
      Top = 8
      Width = 3
      Height = 13
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 341
      Top = 8
      Width = 3
      Height = 13
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 80
      Top = 30
      Width = 3
      Height = 13
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 264
      Top = 30
      Width = 71
      Height = 13
      Caption = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080':'
    end
    object Label10: TLabel
      Left = 341
      Top = 30
      Width = 3
      Height = 13
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel3: TPanel [5]
    Left = 0
    Top = 254
    Width = 624
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label11: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = #1048#1090#1086#1075#1086':'
    end
    object Label12: TLabel
      Left = 47
      Top = 8
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
end
