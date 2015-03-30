inherited frmAddDocument: TfrmAddDocument
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 395
  ClientWidth = 435
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 441
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 435
    Height = 281
    Align = alTop
    ExplicitTop = 2
    ExplicitWidth = 435
    ExplicitHeight = 281
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 8
    Width = 76
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object Label8: TLabel [2]
    Left = 88
    Top = 8
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 111
    Top = 55
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label3: TLabel [4]
    Left = 10
    Top = 55
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object Label6: TLabel [5]
    Left = 10
    Top = 96
    Width = 56
    Height = 13
    Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
  end
  object Label11: TLabel [6]
    Left = 249
    Top = 55
    Width = 66
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
  end
  object Label4: TLabel [7]
    Left = 147
    Top = 55
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [8]
    Left = 10
    Top = 164
    Width = 153
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  end
  inherited Panel1: TPanel
    Top = 354
    Width = 435
    ExplicitTop = 354
    ExplicitWidth = 435
    inherited bbOK: TBitBtn
      Left = 170
      Top = 6
      Visible = False
      ExplicitLeft = 170
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 255
      Top = 6
      ParentFont = False
      ExplicitLeft = 255
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 342
      Top = 6
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 342
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 10
      Top = 6
      Visible = False
      ExplicitLeft = 10
      ExplicitTop = 6
    end
  end
  object dbcbeKind: TDBLookupComboboxEh [10]
    Left = 10
    Top = 27
    Width = 414
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_vid_doc'
    ListField = 'cvid_doc'
    ListSource = dmStudentData.dsDocType
    TabOrder = 1
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eSer: TDBEditEh [11]
    Left = 10
    Top = 71
    Width = 95
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eNum: TDBEditEh [12]
    Left = 111
    Top = 71
    Width = 132
    Height = 19
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eWho: TDBEditEh [13]
    Left = 10
    Top = 111
    Width = 413
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Text = #1054#1090#1076#1077#1083' '#1059#1060#1052#1057' '#1056#1086#1089#1089#1080#1080
    Visible = True
  end
  object dbdteGetDate: TDBDateTimeEditEh [14]
    Left = 249
    Top = 71
    Width = 175
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
  end
  object dbeAddInfo: TDBEditEh [15]
    Left = 10
    Top = 180
    Width = 413
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 6
    Visible = True
  end
  object btnLoad: TButton [16]
    Left = 8
    Top = 206
    Width = 129
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'...'
    TabOrder = 7
  end
  object chbxBonuses: TCheckBox [17]
    Left = 8
    Top = 258
    Width = 121
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1072#1083#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = chbxBonusesClick
  end
  object pnlBonuses: TPanel [18]
    Left = 0
    Top = 281
    Width = 435
    Height = 73
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
    object Label7: TLabel
      Left = 16
      Top = 8
      Width = 123
      Height = 13
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1073#1072#1083#1083#1099
    end
    object Label10: TLabel
      Left = 170
      Top = 8
      Width = 171
      Height = 13
      Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072' ('#1087#1088#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080')'
    end
    object UpDown1: TUpDown
      Left = 129
      Top = 27
      Width = 16
      Height = 19
      Associate = dbBalls
      Max = 35
      TabOrder = 0
    end
    object dbBalls: TDBEditEh
      Left = 18
      Top = 27
      Width = 111
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Text = '0'
      Visible = True
    end
    object dbcbeDisc: TDBLookupComboboxEh
      Left = 170
      Top = 27
      Width = 171
      Height = 19
      DataField = ''
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Flat = True
      KeyField = 'ik_disc'
      ListField = #1089'name_disc'
      ListSource = dmStudentData.dsAbitDisc
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnChange = dbcbeKindChange
    end
  end
  object cbReal: TCheckBox [19]
    Left = 10
    Top = 138
    Width = 111
    Height = 17
    Caption = #1055#1088#1080#1085#1103#1090' '#1086#1088#1080#1075#1080#1085#1072#1083
    TabOrder = 10
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      Enabled = False
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      Enabled = False
      OnUpdate = actOKUpdate
    end
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnUpdate = actCheckFieldsUpdate
    end
  end
  object odOpenFile: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 392
    Top = 200
  end
end
