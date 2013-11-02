inherited UtvZayav: TUtvZayav
  Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
  ClientHeight = 147
  ClientWidth = 260
  OnShow = FormShow
  ExplicitWidth = 266
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 106
    ExplicitLeft = 22
    ExplicitTop = 2
    ExplicitWidth = 262
    ExplicitHeight = 159
  end
  object Label2: TLabel [1]
    Left = 26
    Top = 8
    Width = 142
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103':'
  end
  inherited Panel1: TPanel
    Top = 106
    Width = 260
    ExplicitTop = 106
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 3
      ModalResult = 1
      ExplicitLeft = 3
    end
    inherited bbApply: TBitBtn
      Left = 171
      Visible = False
      ExplicitLeft = 171
    end
    inherited bbCancel: TBitBtn
      Left = 87
      ExplicitLeft = 87
    end
    inherited bbSprav: TBitBtn
      Left = 22
      Top = 39
      Visible = False
      ExplicitLeft = 22
      ExplicitTop = 39
    end
  end
  object dbCBVidDog: TDBCheckBoxEh [3]
    Left = 21
    Top = 64
    Width = 97
    Height = 17
    Caption = #1042#1099#1076#1072#1090#1100' '#1086#1088#1076#1077#1088
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object CheckPrint: TDBCheckBoxEh [4]
    Left = 143
    Top = 64
    Width = 97
    Height = 17
    Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = CheckPrintClick
  end
  object DateUtv: TDBDateTimeEditEh [5]
    Left = 22
    Top = 27
    Width = 218
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 185
    Top = 65520
  end
end
