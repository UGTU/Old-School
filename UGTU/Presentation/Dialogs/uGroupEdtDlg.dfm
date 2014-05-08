inherited frmGroupEdt: TfrmGroupEdt
  Left = 190
  Top = 189
  HelpKeyword = 'Edit_group.htm'
  AutoSize = True
  Caption = 'frmGroupEdt'
  ClientHeight = 317
  ClientWidth = 324
  Constraints.MinHeight = 160
  Constraints.MinWidth = 327
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 330
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 49
    Width = 324
    Height = 156
    ExplicitTop = 49
    ExplicitWidth = 324
    ExplicitHeight = 170
  end
  inherited Panel1: TPanel
    Top = 272
    Width = 324
    Height = 45
    ExplicitTop = 272
    ExplicitWidth = 324
    ExplicitHeight = 45
    inherited bbOK: TBitBtn
      Left = 154
      Top = 9
      Width = 77
      ExplicitLeft = 154
      ExplicitTop = 9
      ExplicitWidth = 77
    end
    inherited bbApply: TBitBtn
      Left = 6
      Top = 12
      Width = 80
      TabOrder = 2
      Visible = False
      ExplicitLeft = 6
      ExplicitTop = 12
      ExplicitWidth = 80
    end
    inherited bbCancel: TBitBtn
      Left = 235
      Top = 9
      TabOrder = 1
      ExplicitLeft = 235
      ExplicitTop = 9
    end
    inherited bbSprav: TBitBtn
      Top = 40
      Visible = False
      ExplicitTop = 40
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 49
    Width = 324
    Height = 156
    Align = alClient
    TabOrder = 1
    object Label7: TLabel
      Left = 153
      Top = 47
      Width = 89
      Height = 13
      Caption = #1056#1072#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1072
    end
    object Label6: TLabel
      Left = 16
      Top = 47
      Width = 77
      Height = 13
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1072
    end
    object Label45: TLabel
      Left = 103
      Top = 8
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 244
      Top = 8
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 85
      Height = 13
      Caption = #1043#1086#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
    end
    object Label2: TLabel
      Left = 16
      Top = 84
      Width = 72
      Height = 13
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
    end
    object Label1: TLabel
      Left = 153
      Top = 8
      Width = 89
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 130
      Width = 288
      Height = 17
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072' '#1089' '#1087#1077#1088#1077#1085#1086#1089#1086#1084' '#1086#1094#1077#1085#1086#1082
      Enabled = False
      TabOrder = 0
      Visible = False
      OnClick = CheckBox1Click
    end
    object edtName: TDBEditEh
      Left = 152
      Top = 24
      Width = 158
      Height = 19
      EditButtons = <>
      Flat = True
      ParentShowHint = False
      TabOrder = 1
      Tooltips = True
      Visible = True
      OnChange = edtNameChange
    end
    object dbneYear: TDBNumberEditEh
      Left = 16
      Top = 24
      Width = 126
      Height = 19
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      Flat = True
      MinValue = 1999.000000000000000000
      ParentShowHint = False
      TabOrder = 2
      Tooltips = True
      Value = 1901.000000000000000000
      Visible = True
      OnChange = dbneYearChange
    end
    object dblcbUchPln: TDBLookupComboboxEh
      Left = 16
      Top = 102
      Width = 294
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'ik_uch_plan'
      ListField = 'Cname'
      ListSource = dm.dsGetUchPlnGroup
      ParentShowHint = False
      TabOrder = 3
      Tooltips = True
      Visible = True
      OnChange = dblcbUchPlnChange
    end
    object dbdteExit: TDBDateTimeEditEh
      Left = 152
      Top = 62
      Width = 158
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 4
      Visible = True
      OnChange = edtNameChange
    end
    object dbdteCreate: TDBDateTimeEditEh
      Left = 16
      Top = 62
      Width = 126
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 5
      Visible = True
      OnChange = edtNameChange
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 0
    Width = 324
    Height = 49
    Align = alTop
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 16
      Top = 2
      Width = 78
      Height = 13
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    end
    object dbcbSpec: TDBLookupComboboxEh
      Left = 16
      Top = 21
      Width = 294
      Height = 19
      EditButtons = <>
      Flat = True
      ParentShowHint = False
      TabOrder = 0
      Tooltips = True
      Visible = True
      OnChange = dblcbUchPlnChange
      OnKeyValueChanged = dbcbSpecKeyValueChanged
    end
  end
  object pnlProfile: TPanel [4]
    Left = 0
    Top = 205
    Width = 324
    Height = 67
    Align = alBottom
    TabOrder = 3
    object Label8: TLabel
      Left = 16
      Top = 6
      Width = 85
      Height = 13
      Caption = #1055#1088#1086#1092#1080#1083#1100' '#1075#1088#1091#1087#1087#1099
    end
    object dbcbProfile: TDBLookupComboboxEh
      Left = 16
      Top = 25
      Width = 294
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'ik_spclz'
      ListField = 'Cname'
      ListSource = dm.dsProfileForGroup
      ParentShowHint = False
      TabOrder = 0
      Tooltips = True
      Visible = True
      OnKeyValueChanged = dbcbProfileKeyValueChanged
    end
  end
  inherited actBaseDialog: TActionList
    Left = 38
    Top = 70
    inherited actApply: TAction
      Enabled = False
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      Enabled = False
      OnUpdate = actOKUpdate
    end
  end
  object dsSpec: TDataSource
    DataSet = dmUgtuStructure.adsSpecFac
    Left = 232
    Top = 65528
  end
end
