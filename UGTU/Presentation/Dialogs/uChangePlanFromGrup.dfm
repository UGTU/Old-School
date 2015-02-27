inherited frmChangeGrupPlan: TfrmChangeGrupPlan
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1083#1072#1085#1072' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 101
  OnClose = FormClose
  ExplicitWidth = 437
  ExplicitHeight = 130
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 60
    ExplicitTop = 2
    ExplicitHeight = 60
  end
  object Label7: TLabel [1]
    Left = 8
    Top = 8
    Width = 263
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1088#1091#1087#1087#1091', '#1095#1077#1081' '#1087#1083#1072#1085' '#1093#1086#1090#1080#1090#1077' '#1074#1079#1103#1090#1100' '#1079#1072' '#1086#1089#1085#1086#1074#1091' :'
  end
  inherited Panel1: TPanel
    Top = 60
    ExplicitTop = 60
    inherited bbOK: TBitBtn
      OnClick = actApplyExecute
    end
    inherited bbApply: TBitBtn
      Caption = #1054#1050
      Visible = False
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbcmbxGrupPlans: TDBLookupComboboxEh [3]
    Left = 8
    Top = 28
    Width = 348
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_uch_plan'
    ListField = 'name_content'
    ListSource = dsGrupPlans
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 345
    Top = 16
  end
  object dsGrupPlans: TDataSource
    Left = 392
    Top = 17
  end
end
