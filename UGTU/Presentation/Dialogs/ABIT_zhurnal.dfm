inherited frmAbitZhurnal: TfrmAbitZhurnal
  Left = 491
  Top = 438
  HelpKeyword = 'A_Get_report_magazin_all_spec.htm'
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1078#1091#1088#1085#1072#1083#1072
  ClientHeight = 105
  ClientWidth = 260
  OldCreateOrder = True
  OnCloseQuery = nil
  OnShow = FormShow
  ExplicitWidth = 266
  ExplicitHeight = 137
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 64
    ExplicitWidth = 258
    ExplicitHeight = 64
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 8
    Width = 115
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1078#1091#1088#1085#1072#1083#1072':'
  end
  inherited Panel1: TPanel
    Top = 64
    Width = 260
    TabOrder = 1
    ExplicitTop = 64
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 81
      ModalResult = 1
      ExplicitLeft = 81
    end
    inherited bbApply: TBitBtn
      Left = 171
      Visible = False
      ExplicitLeft = 171
    end
    inherited bbCancel: TBitBtn
      Left = 166
      Width = 84
      ModalResult = 2
      ExplicitLeft = 166
      ExplicitWidth = 84
    end
    inherited bbSprav: TBitBtn
      Left = 36
      Top = 4
      Visible = False
      ExplicitLeft = 36
      ExplicitTop = 4
    end
  end
  object dbdtmDate: TDBDateTimeEditEh [3]
    Left = 10
    Top = 29
    Width = 240
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
    OnChange = dbdtmDateChange
    OnKeyDown = dbdtmDateKeyDown
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      OnExecute = nil
    end
  end
end
