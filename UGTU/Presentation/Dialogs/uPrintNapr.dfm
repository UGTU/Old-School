inherited frmPrintNaprDialog: TfrmPrintNaprDialog
  Left = 380
  Top = 414
  Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 102
  ClientWidth = 337
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 343
  ExplicitHeight = 134
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 337
    Height = 61
    ExplicitWidth = 337
    ExplicitHeight = 61
  end
  object Label1: TLabel [1]
    Left = 12
    Top = 9
    Width = 71
    Height = 13
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
  end
  object Label5: TLabel [2]
    Left = 83
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
  inherited Panel1: TPanel
    Top = 61
    Width = 337
    ExplicitTop = 61
    ExplicitWidth = 337
    inherited bbOK: TBitBtn
      Left = 47
      Visible = False
      ExplicitLeft = 47
    end
    inherited bbApply: TBitBtn
      Left = 162
      Top = 7
      Height = 24
      Caption = #1055#1077#1095#1072#1090#1100
      ExplicitLeft = 162
      ExplicitTop = 7
      ExplicitHeight = 24
    end
    inherited bbCancel: TBitBtn
      Left = 247
      Top = 7
      Height = 24
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 247
      ExplicitTop = 7
      ExplicitHeight = 24
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbcbeNapr: TDBLookupComboboxEh [4]
    Left = 12
    Top = 25
    Width = 316
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_ved'
    ListField = 'OutColumn'
    ListSource = dmUspevaemost.dsNapravl
    TabOrder = 1
    Visible = True
  end
end
