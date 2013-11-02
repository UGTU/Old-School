inherited frmStudInfo: TfrmStudInfo
  Left = 81
  Top = 113
  HelpKeyword = 'Get_report_stud_group.htm'
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1075#1088#1091#1087#1087#1077' '#1074' Excel'
  ClientHeight = 355
  ClientWidth = 395
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 401
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 395
    Height = 314
    ExplicitWidth = 391
    ExplicitHeight = 314
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 186
    Top = 116
    Width = 23
    Height = 22
    Action = actSel
    Flat = True
  end
  object SpeedButton2: TSpeedButton [2]
    Left = 186
    Top = 141
    Width = 23
    Height = 22
    Action = actDeSel
    Flat = True
  end
  object SpeedButton3: TSpeedButton [3]
    Left = 186
    Top = 166
    Width = 23
    Height = 22
    Action = actUnCheckAll
    Flat = True
  end
  object SpeedButton4: TSpeedButton [4]
    Left = 187
    Top = 91
    Width = 23
    Height = 22
    Action = actCheckAll
    Flat = True
  end
  inherited Panel1: TPanel
    Top = 314
    Width = 395
    ExplicitTop = 314
    ExplicitWidth = 395
    inherited bbOK: TBitBtn
      Left = 223
      Enabled = False
      ExplicitLeft = 223
    end
    inherited bbApply: TBitBtn
      Left = 306
      Visible = False
      ExplicitLeft = 306
    end
    inherited bbCancel: TBitBtn
      Left = 306
      ExplicitLeft = 306
    end
    inherited bbSprav: TBitBtn
      Top = 6
      Visible = False
      ExplicitTop = 6
    end
  end
  object lbAvail: TListBox [6]
    Left = 8
    Top = 12
    Width = 173
    Height = 296
    BevelInner = bvSpace
    BevelOuter = bvSpace
    ItemHeight = 13
    Items.Strings = (
      #8470' '#1079#1072#1095#1105#1090#1082#1080
      #1060#1048#1054
      #1060#1072#1084#1080#1083#1080#1103
      #1048#1084#1103
      #1054#1090#1095#1077#1089#1090#1074#1086
      #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
      #1043#1088#1091#1087#1087#1072
      #1055#1086#1083
      #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
      #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
      #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      #1057#1086#1090#1086#1074#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
      #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      #1063#1090#1086' '#1086#1082#1086#1085#1095#1080#1083
      #1043#1086#1076' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      #1052#1077#1076#1072#1083#1100
      #1044#1086#1074#1091#1079#1086#1074#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072
      #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1074' '#1086#1073#1097#1077#1078#1080#1090#1080#1080
      #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081
      #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
      #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1081' '#1091#1095#1105#1090
      #1054#1073#1097#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1088#1072#1073#1086#1090#1072
      #1053#1072#1083#1080#1095#1080#1077' '#1088#1072#1073#1086#1090#1099
      'E-Mail'
      #1042#1086#1077#1085#1085#1086#1077' '#1079#1074#1072#1085#1080#1077)
    TabOrder = 1
    OnDblClick = actSelExecute
  end
  object lbSel: TListBox [7]
    Left = 214
    Top = 12
    Width = 173
    Height = 296
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = actDeSelExecute
  end
  inherited actBaseDialog: TActionList
    Left = 183
    Top = 274
    object actCheckAll: TAction
      Caption = '>>'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1105
      OnExecute = actCheckAllExecute
    end
    object actUnCheckAll: TAction
      Caption = '<<'
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1099#1073#1086#1088
      OnExecute = actUnCheckAllExecute
    end
    object actSel: TAction
      Caption = '>'
      OnExecute = actSelExecute
    end
    object actDeSel: TAction
      Caption = '<'
      OnExecute = actDeSelExecute
    end
  end
end
