inherited ZamenaRoom: TZamenaRoom
  Caption = #1047#1072#1084#1077#1085#1072' '#1082#1086#1084#1085#1072#1090#1099
  ClientHeight = 232
  ClientWidth = 327
  OnShow = FormShow
  ExplicitWidth = 333
  ExplicitHeight = 260
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 327
    Height = 191
    ExplicitWidth = 260
    ExplicitHeight = 116
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = #8470' '#1086#1073#1097#1077#1078#1080#1090#1080#1103
  end
  object Label2: TLabel [2]
    Left = 200
    Top = 8
    Width = 59
    Height = 13
    Caption = #8470' '#1082#1086#1084#1085#1072#1090#1099
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 54
    Width = 75
    Height = 13
    Caption = #1055#1088#1086#1078#1080#1074#1072#1102#1097#1080#1077
  end
  object Label4: TLabel [4]
    Left = 103
    Top = 8
    Width = 45
    Height = 13
    Caption = #8470' '#1101#1090#1072#1078#1072
  end
  inherited Panel1: TPanel
    Top = 191
    Width = 327
    ExplicitTop = 191
    ExplicitWidth = 327
    inherited bbOK: TBitBtn
      Left = 75
      Width = 78
      ExplicitLeft = 75
      ExplicitWidth = 78
    end
    inherited bbApply: TBitBtn
      Left = 241
      Width = 78
      ExplicitLeft = 241
      ExplicitWidth = 78
    end
    inherited bbCancel: TBitBtn
      Tag = 1
      Left = 157
      Width = 78
      TabOrder = 3
      ExplicitLeft = 157
      ExplicitWidth = 78
    end
    inherited bbSprav: TBitBtn
      Left = 376
      Top = 6
      TabOrder = 2
      ExplicitLeft = 376
      ExplicitTop = 6
    end
  end
  object ComBNumHost: TDBLookupComboboxEh [6]
    Left = 8
    Top = 27
    Width = 89
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumHostel'
    ListField = 'NumHostel'
    ListSource = dmHOST.dsHostel
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = ComBNumHostKeyValueChanged
  end
  object ComBNumRoom: TDBLookupComboboxEh [7]
    Left = 200
    Top = 27
    Width = 119
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_address'
    ListField = 'svob'
    ListSource = dmHOST.dsVivodRoomPoEtazh
    TabOrder = 2
    Visible = True
    OnKeyValueChanged = ComBNumRoomKeyValueChanged
  end
  object GridProjInRoom: TDBGridEh [8]
    Left = 8
    Top = 73
    Width = 311
    Height = 112
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = dmHOST.dsProcProjInRoom
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1048#1054' '#1087#1077#1088#1089#1086#1085#1099
        Width = 129
      end
      item
        EditButtons = <>
        FieldName = 'pol'
        Footers = <>
        Title.Caption = #1055#1086#1083
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'statusquo'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 85
      end>
  end
  object ComBEtazh: TDBLookupComboboxEh [9]
    Left = 103
    Top = 27
    Width = 91
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumEtazh'
    ListField = 'NumEtazh'
    ListSource = dmHOST.dsProcVivodEtazhPoObj
    TabOrder = 4
    Visible = True
    OnKeyValueChanged = ComBEtazhKeyValueChanged
  end
  inherited actBaseDialog: TActionList
    Left = 233
    Top = 65520
  end
end
