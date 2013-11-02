inherited NaznRoom: TNaznRoom
  Caption = #1047#1072#1089#1077#1083#1080#1090#1100' '#1074' '#1082#1086#1084#1085#1072#1090#1091
  ClientHeight = 236
  ClientWidth = 265
  OnShow = FormShow
  ExplicitWidth = 271
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 265
    Height = 195
    ExplicitWidth = 369
    ExplicitHeight = 208
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1082#1086#1084#1085#1072#1090#1091
  end
  object Label1: TLabel [2]
    Left = 8
    Top = 61
    Width = 67
    Height = 13
    Caption = #1055#1088#1086#1078#1080#1074#1072#1097#1080#1077
  end
  inherited Panel1: TPanel
    Top = 195
    Width = 265
    Anchors = [akLeft, akRight]
    ExplicitTop = 195
    ExplicitWidth = 265
    inherited bbOK: TBitBtn
      Left = 85
      Top = 7
      Height = 28
      ExplicitLeft = 85
      ExplicitTop = 7
      ExplicitHeight = 28
    end
    inherited bbApply: TBitBtn
      Left = 172
      Top = 6
      Width = 87
      Visible = False
      ExplicitLeft = 172
      ExplicitTop = 6
      ExplicitWidth = 87
    end
    inherited bbCancel: TBitBtn
      Left = 172
      Top = 6
      Width = 87
      Height = 28
      ExplicitLeft = 172
      ExplicitTop = 6
      ExplicitWidth = 87
      ExplicitHeight = 28
    end
    inherited bbSprav: TBitBtn
      Left = 369
      Top = -8
      ExplicitLeft = 369
      ExplicitTop = -8
    end
  end
  object ComBRoom: TDBLookupComboboxEh [4]
    Left = 8
    Top = 27
    Width = 249
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_address'
    ListField = 'svob'
    ListSource = dmHOST.DSProcRoomForZas
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = ComBRoomKeyValueChanged
  end
  object GridProjInRoom: TDBGridEh [5]
    Left = 8
    Top = 80
    Width = 249
    Height = 97
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
    TabOrder = 2
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
        Width = 83
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
        Width = 89
      end>
  end
  inherited actBaseDialog: TActionList
    Left = 129
    Top = 0
  end
end
