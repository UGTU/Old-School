inherited frmReviewDoc: TfrmReviewDoc
  Caption = 'frmReviewDoc'
  ClientHeight = 225
  ClientWidth = 443
  ExplicitWidth = 449
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 443
    Height = 185
    ExplicitWidth = 423
    ExplicitHeight = 160
  end
  object Label1: TLabel [1]
    Left = 21
    Top = 24
    Width = 95
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
  end
  object Label2: TLabel [2]
    Left = 21
    Top = 59
    Width = 61
    Height = 13
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
  end
  object Label3: TLabel [3]
    Left = 24
    Top = 102
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1087#1088#1072#1074#1082#1080
  end
  object Label4: TLabel [4]
    Left = 224
    Top = 102
    Width = 38
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089
  end
  object Label5: TLabel [5]
    Left = 24
    Top = 139
    Width = 86
    Height = 13
    Caption = #1044#1072#1090#1072' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
  end
  inherited Panel1: TPanel
    Top = 185
    Width = 443
    Height = 40
    ExplicitLeft = -8
    ExplicitTop = 191
    ExplicitWidth = 443
    ExplicitHeight = 40
    DesignSize = (
      443
      40)
    inherited bbOK: TBitBtn
      Left = 268
      Top = 6
      ModalResult = 1
      ExplicitLeft = 268
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 20
      Top = 6
      ModalResult = 6
      Visible = False
      ExplicitLeft = 20
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 355
      Top = 6
      ModalResult = 2
      ExplicitLeft = 355
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 20
      Top = 6
      ExplicitLeft = 20
      ExplicitTop = 6
    end
    object BitBtn1: TBitBtn
      Left = 122
      Top = 6
      Width = 141
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      TabOrder = 4
      OnClick = BitBtn1Click
    end
  end
  object eDest: TEdit [7]
    Left = 144
    Top = 56
    Width = 265
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object eNum: TEdit [8]
    Left = 144
    Top = 99
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object eInd: TEdit [9]
    Left = 268
    Top = 99
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object dtUtv: TDateTimePicker [10]
    Left = 144
    Top = 16
    Width = 265
    Height = 21
    Date = 42098.622855671300000000
    Time = 42098.622855671300000000
    Enabled = False
    TabOrder = 4
  end
  object dtGot: TDateTimePicker [11]
    Left = 144
    Top = 139
    Width = 265
    Height = 21
    Date = 42098.623583078700000000
    Time = 42098.623583078700000000
    Enabled = False
    TabOrder = 5
  end
  inherited actBaseDialog: TActionList
    Left = 393
    Top = 88
  end
end
