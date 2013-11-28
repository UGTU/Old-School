inherited frmGroupEdt: TfrmGroupEdt
  Left = 190
  Top = 189
  HelpKeyword = 'Edit_group.htm'
  Caption = 'frmGroupEdt'
  ClientHeight = 390
  ClientWidth = 399
  Constraints.MinHeight = 197
  Constraints.MinWidth = 402
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 405
  ExplicitHeight = 425
  PixelsPerInch = 120
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 60
    Width = 399
    Height = 209
    ExplicitTop = 129
    ExplicitWidth = 399
    ExplicitHeight = 209
  end
  inherited Panel1: TPanel
    Top = 338
    Width = 399
    Height = 52
    ExplicitTop = 338
    ExplicitWidth = 399
    ExplicitHeight = 52
    inherited bbOK: TBitBtn
      Left = 190
      Top = 7
      Width = 94
      ExplicitLeft = 190
      ExplicitTop = 7
      ExplicitWidth = 94
    end
    inherited bbApply: TBitBtn
      Left = 7
      Top = 11
      Width = 99
      TabOrder = 2
      Visible = False
      ExplicitLeft = 7
      ExplicitTop = 11
      ExplicitWidth = 99
    end
    inherited bbCancel: TBitBtn
      Left = 289
      Top = 7
      TabOrder = 1
      ExplicitLeft = 289
      ExplicitTop = 7
    end
    inherited bbSprav: TBitBtn
      Top = 49
      Visible = False
      ExplicitTop = 49
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 60
    Width = 399
    Height = 209
    Align = alClient
    TabOrder = 1
    ExplicitTop = 129
    object Label7: TLabel
      Left = 188
      Top = 58
      Width = 116
      Height = 16
      Caption = #1056#1072#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1072
    end
    object Label6: TLabel
      Left = 20
      Top = 58
      Width = 101
      Height = 16
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1072
    end
    object Label45: TLabel
      Left = 127
      Top = 10
      Width = 5
      Height = 16
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 300
      Top = 10
      Width = 5
      Height = 16
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 10
      Width = 111
      Height = 16
      Caption = #1043#1086#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
    end
    object Label2: TLabel
      Left = 20
      Top = 103
      Width = 93
      Height = 16
      Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
    end
    object Label1: TLabel
      Left = 188
      Top = 10
      Width = 116
      Height = 16
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
    end
    object CheckBox1: TCheckBox
      Left = 20
      Top = 160
      Width = 354
      Height = 21
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072' '#1089' '#1087#1077#1088#1077#1085#1086#1089#1086#1084' '#1086#1094#1077#1085#1086#1082
      Enabled = False
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object edtName: TDBEditEh
      Left = 187
      Top = 30
      Width = 195
      Height = 22
      EditButtons = <>
      Flat = True
      ParentShowHint = False
      TabOrder = 1
      Tooltips = True
      Visible = True
      OnChange = edtNameChange
    end
    object dbneYear: TDBNumberEditEh
      Left = 20
      Top = 30
      Width = 155
      Height = 22
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
      Left = 20
      Top = 125
      Width = 362
      Height = 22
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
      Left = 187
      Top = 76
      Width = 195
      Height = 22
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 4
      Visible = True
      OnChange = edtNameChange
    end
    object dbdteCreate: TDBDateTimeEditEh
      Left = 20
      Top = 76
      Width = 155
      Height = 22
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
    Width = 399
    Height = 60
    Align = alTop
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 20
      Top = 2
      Width = 101
      Height = 16
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    end
    object dbcbSpec: TDBLookupComboboxEh
      Left = 20
      Top = 26
      Width = 362
      Height = 22
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
  object Panel4: TPanel [4]
    Left = 0
    Top = 269
    Width = 399
    Height = 69
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -8
    ExplicitTop = 270
    object Label8: TLabel
      Left = 20
      Top = 7
      Width = 110
      Height = 16
      Caption = #1055#1088#1086#1092#1080#1083#1100' '#1075#1088#1091#1087#1087#1099
    end
    object dbcbProfile: TDBLookupComboboxEh
      Left = 20
      Top = 31
      Width = 362
      Height = 22
      EditButtons = <>
      Flat = True
      KeyField = 'ik_spclz'
      ListField = 'Cname'
      ListSource = dm.dsProfileForGroup
      ParentShowHint = False
      TabOrder = 0
      Tooltips = True
      Visible = True
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
    Left = 280
    Top = 184
  end
end
