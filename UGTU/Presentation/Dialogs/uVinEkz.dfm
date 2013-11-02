inherited frmVinEkz: TfrmVinEkz
  Left = 666
  Top = 205
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1099#1085#1086#1089#1085#1086#1081' '#1101#1082#1079#1072#1084#1077#1085
  ClientHeight = 101
  ClientWidth = 314
  OldCreateOrder = True
  ExplicitHeight = 133
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 314
    Height = 60
    ExplicitWidth = 314
    ExplicitHeight = 60
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 253
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1101#1082#1079#1072#1084#1077#1085', '#1082#1086#1090#1086#1088#1099#1081' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1099#1085#1086#1089#1085#1099#1084
  end
  inherited Panel1: TPanel
    Top = 60
    Width = 314
    ExplicitTop = 60
    ExplicitWidth = 314
    inherited bbOK: TBitBtn
      Left = 142
      ExplicitLeft = 142
    end
    inherited bbApply: TBitBtn
      Left = 225
      Visible = False
      ExplicitLeft = 225
    end
    inherited bbCancel: TBitBtn
      Left = 226
      ExplicitLeft = 226
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbcbExamList: TDBLookupComboboxEh [3]
    Left = 8
    Top = 25
    Width = 299
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_disc'
    ListField = 'cName_disc'
    ListSource = dmUspevaemost.ds4VinVed
    TabOrder = 1
    Visible = True
    OnClick = dbcbExamListClick
  end
  inherited actBaseDialog: TActionList
    Left = 113
    Top = 80
  end
end
