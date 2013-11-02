inherited AddZayav: TAddZayav
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
  ClientHeight = 298
  ClientWidth = 265
  OnShow = FormShow
  ExplicitWidth = 271
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 265
    Height = 257
    ExplicitTop = 2
    ExplicitWidth = 370
    ExplicitHeight = 225
  end
  inherited Panel1: TPanel
    Top = 257
    Width = 265
    ExplicitTop = 257
    ExplicitWidth = 265
    inherited bbOK: TBitBtn
      Left = 8
      ExplicitLeft = 8
    end
    inherited bbApply: TBitBtn
      Left = 176
      ExplicitLeft = 176
    end
    inherited bbCancel: TBitBtn
      Left = 92
      ExplicitLeft = 92
    end
    inherited bbSprav: TBitBtn
      Left = 208
      Top = 6
      Visible = False
      ExplicitLeft = 208
      ExplicitTop = 6
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 8
    Top = 8
    Width = 249
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1090#1072#1090#1091#1089' '#1087#1077#1088#1089#1086#1085#1099
    TabOrder = 1
    object RBtStudent: TRadioButton
      Left = 23
      Top = 16
      Width = 113
      Height = 17
      Caption = #1057#1090#1091#1076#1077#1085#1090
      TabOrder = 0
      OnClick = RBtStudentClick
    end
    object RBtSotrudn: TRadioButton
      Left = 134
      Top = 16
      Width = 72
      Height = 17
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      TabOrder = 1
      OnClick = RBtSotrudnClick
    end
  end
  object Panel2: TPanel [3]
    Left = 8
    Top = 55
    Width = 248
    Height = 194
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    DesignSize = (
      248
      194)
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 56
      Height = 13
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
    end
    object Label2: TLabel
      Left = 11
      Top = 55
      Width = 78
      Height = 13
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    end
    object Label3: TLabel
      Left = 11
      Top = 99
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object Label4: TLabel
      Left = 11
      Top = 143
      Width = 74
      Height = 13
      Caption = #1060#1048#1054' '#1087#1077#1088#1089#1086#1085#1099
    end
    object ComBFac: TDBLookupComboboxEh
      Left = 11
      Top = 30
      Width = 223
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_fac'
      ListField = 'Cname_fac'
      ListSource = dmUgtuStructure.dsFaculty
      TabOrder = 0
      Visible = True
      OnChange = ComBFacChange
    end
    object ComBSpec: TDBLookupComboboxEh
      Left = 11
      Top = 74
      Width = 223
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      KeyField = 'ik_spec_fac'
      ListField = 'Cname_spec'
      ListSource = dmUgtuStructure.dsSpec
      TabOrder = 1
      Visible = True
      OnChange = ComBSpecChange
    end
    object ComBGrup: TDBLookupComboboxEh
      Left = 11
      Top = 118
      Width = 223
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_grup'
      ListField = 'Cname_grup'
      ListSource = dmUgtuStructure.dsGroups
      TabOrder = 2
      Visible = True
      OnChange = ComBGrupChange
    end
    object ComBFIO: TDBLookupComboboxEh
      Left = 11
      Top = 162
      Width = 223
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      KeyField = 'nCode'
      ListField = 'FIO'
      ListSource = dmHOST.dsVivodPersonFormGroup
      TabOrder = 3
      Visible = True
    end
  end
  inherited actBaseDialog: TActionList
    Top = 16
  end
end
