inherited frmMethodWorkDateFilter: TfrmMethodWorkDateFilter
  Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1076#1072#1090#1077' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
  ClientHeight = 181
  ClientWidth = 260
  ExplicitWidth = 266
  ExplicitHeight = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 140
    ExplicitWidth = 260
    ExplicitHeight = 140
  end
  inherited Panel1: TPanel
    Top = 140
    Width = 260
    ExplicitTop = 140
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 88
      ExplicitLeft = 88
    end
    inherited bbApply: TBitBtn
      Left = 171
      Visible = False
      ExplicitLeft = 171
    end
    inherited bbCancel: TBitBtn
      Left = 172
      ExplicitLeft = 172
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object RadioGroup1: TRadioGroup [2]
    Left = 8
    Top = 8
    Width = 241
    Height = 121
    Caption = #1042#1099#1073#1080#1088#1077#1090#1077' '#1092#1080#1083#1100#1090#1088
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077
      '>'
      '<')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object DateTimePicker1: TDateTimePicker [3]
    Left = 48
    Top = 64
    Width = 186
    Height = 21
    Date = 40260.606353252310000000
    Time = 40260.606353252310000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker [4]
    Left = 48
    Top = 94
    Width = 186
    Height = 21
    Date = 40260.606353252310000000
    Time = 40260.606353252310000000
    TabOrder = 3
  end
  inherited actBaseDialog: TActionList
    Left = 121
    Top = 152
  end
end
