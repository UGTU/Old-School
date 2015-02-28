inherited frmAbitConfirm: TfrmAbitConfirm
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
  ClientHeight = 222
  ClientWidth = 385
  ExplicitWidth = 391
  ExplicitHeight = 251
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 385
    Height = 103
    ExplicitWidth = 411
    ExplicitHeight = 81
  end
  object Label1: TLabel [1]
    Left = 24
    Top = 26
    Width = 353
    Height = 48
    Caption = 
      #1042#1099' '#1093#1086#1090#1080#1090#1077' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072', '#1080#1083#1080' '#1083#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1072#1073#1080#1090#1091#1088#1080 +
      #1077#1085#1090#1072' '#1091#1078#1077' '#1073#1099#1083#1080' '#1074#1085#1077#1089#1077#1085#1099' '#1074' '#1089#1080#1089#1090#1077#1084#1091', '#1080' '#1085#1091#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1080#1083#1080' '#1087#1086#1076 +
      #1090#1074#1077#1088#1076#1080#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077'? '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  inherited Panel1: TPanel
    Top = 103
    Width = 385
    Height = 119
    ExplicitTop = 103
    ExplicitWidth = 385
    ExplicitHeight = 119
    inherited bbOK: TBitBtn
      Left = 168
      Top = 68
      Visible = False
      ExplicitLeft = 168
      ExplicitTop = 68
    end
    inherited bbApply: TBitBtn
      Left = 166
      Top = 68
      Visible = False
      ExplicitLeft = 166
      ExplicitTop = 68
    end
    inherited bbCancel: TBitBtn
      Left = 168
      Top = 68
      Visible = False
      ExplicitLeft = 168
      ExplicitTop = 68
    end
    inherited bbSprav: TBitBtn
      Left = 214
      Top = -8
      Visible = False
      ExplicitLeft = 214
      ExplicitTop = -8
    end
    object BitBtn1: TBitBtn
      Left = 87
      Top = 14
      Width = 223
      Height = 25
      Action = actAddAbit
      Caption = #1042#1074#1077#1089#1090#1080' '#1083#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 87
      Top = 45
      Width = 223
      Height = 25
      Action = actAddStatement
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      TabOrder = 5
    end
    object BitBtn3: TBitBtn
      Left = 87
      Top = 76
      Width = 223
      Height = 25
      Action = actConfirmOnline
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1086#1085#1083#1072#1081#1085'-'#1079#1072#1103#1074#1083#1077#1085#1080#1077
      TabOrder = 6
    end
  end
  inherited actBaseDialog: TActionList
    object actAddAbit: TAction
      Caption = #1042#1074#1077#1089#1090#1080' '#1083#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      OnExecute = actAddAbitExecute
    end
    object actAddStatement: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
      OnExecute = actAddStatementExecute
    end
    object actConfirmOnline: TAction
      Caption = 'actConfirmOnline'
      OnExecute = actConfirmOnlineExecute
    end
  end
end
