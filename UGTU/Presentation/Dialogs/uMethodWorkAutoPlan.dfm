inherited frmMethodWorkAutoPlan: TfrmMethodWorkAutoPlan
  HorzScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  Caption = 'frmMethodWorkAutoPlan'
  ClientHeight = 578
  ClientWidth = 874
  OnResize = FormResize
  ExplicitWidth = 890
  ExplicitHeight = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 75
    Width = 874
    Height = 462
    ExplicitLeft = 1
    ExplicitTop = 75
    ExplicitWidth = 638
    ExplicitHeight = 424
  end
  inherited Panel1: TPanel
    Top = 537
    Width = 874
    ExplicitTop = 537
    ExplicitWidth = 874
    inherited bbOK: TBitBtn
      Left = 702
      ExplicitLeft = 702
    end
    inherited bbApply: TBitBtn
      Left = 785
      Visible = False
      ExplicitLeft = 785
    end
    inherited bbCancel: TBitBtn
      Left = 786
      ExplicitLeft = 786
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object GroupBox2: TGroupBox [2]
    Left = 0
    Top = 75
    Width = 874
    Height = 462
    Align = alClient
    Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1087#1083#1072#1085' '#1059#1052#1056' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
    TabOrder = 1
    object SG: TStringGrid
      Left = 2
      Top = 15
      Width = 870
      Height = 445
      Align = alClient
      DefaultColWidth = 100
      DefaultRowHeight = 32
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goTabs, goRowSelect]
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
      OnDblClick = SGDblClick
      OnDrawCell = SGDrawCell
      OnMouseMove = SGMouseMove
      OnSelectCell = SGSelectCell
    end
  end
  object Panel10: TPanel [3]
    Left = 0
    Top = 0
    Width = 874
    Height = 75
    Align = alTop
    TabOrder = 2
    object RG_Plan: TRadioGroup
      Left = 8
      Top = 7
      Width = 280
      Height = 59
      Caption = #1059#1095#1077#1090' '#1092#1072#1082#1090#1072' '#1059#1052#1056' '#1087#1088#1080' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1087#1083#1072#1085#1072
      ItemIndex = 1
      Items.Strings = (
        #1059#1095#1077#1090' '#1080#1084#1077#1102#1097#1080#1093#1089#1103' '#1059#1052#1056' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
        #1059#1095#1077#1090' '#1074#1089#1077#1093' '#1080#1084#1077#1102#1097#1080#1093#1089#1103' '#1059#1052#1056)
      TabOrder = 0
      OnClick = RG_PlanClick
    end
  end
  inherited actBaseDialog: TActionList
    Left = 457
    Top = 16
  end
  object dsAutoPlanPrep: TDataSource
    DataSet = dmMethodWork.aspAutoPlanMWOffPrep
    Left = 496
    Top = 16
  end
  object dsState: TDataSource
    Left = 496
    Top = 304
  end
  object dsCoautor: TDataSource
    Left = 512
    Top = 344
  end
  object dsDiscEd: TDataSource
    Left = 546
    Top = 346
  end
  object dsUchPlan: TDataSource
    Left = 584
    Top = 304
  end
  object dsFile: TDataSource
    DataSet = dmMethodWork.adsFile
    Left = 536
    Top = 304
  end
end
