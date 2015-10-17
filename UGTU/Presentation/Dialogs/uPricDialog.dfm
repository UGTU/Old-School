inherited frmPricDialog: TfrmPricDialog
  Caption = #1055#1077#1095#1072#1090#1100' '#1087#1088#1080#1082#1072#1079#1072
  ClientHeight = 111
  ClientWidth = 393
  ExplicitWidth = 399
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 393
    Height = 70
    ExplicitWidth = 393
    ExplicitHeight = 70
  end
  object Label2: TLabel [1]
    Left = 20
    Top = 13
    Width = 115
    Height = 13
    Caption = #1055#1088#1080#1082#1072#1079' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
  end
  inherited Panel1: TPanel
    Top = 70
    Width = 393
    ExplicitTop = 70
    ExplicitWidth = 393
    inherited bbOK: TBitBtn
      Left = 201
      Top = 6
      Height = 27
      ExplicitLeft = 201
      ExplicitTop = 6
      ExplicitHeight = 27
    end
    inherited bbApply: TBitBtn
      Left = 296
      Top = 6
      ExplicitLeft = 296
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 296
      Top = 6
      Width = 83
      Height = 27
      ExplicitLeft = 296
      ExplicitTop = 6
      ExplicitWidth = 83
      ExplicitHeight = 27
    end
  end
  object dbcbePric: TDBLookupComboboxEh [3]
    Left = 20
    Top = 32
    Width = 349
    Height = 21
    DataField = ''
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'Ik_prikaz'
    ListField = 'NN_Date'
    ListSource = dmDocs.dsPric
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 329
    Top = 0
  end
end
