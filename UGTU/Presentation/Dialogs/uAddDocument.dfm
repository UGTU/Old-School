inherited frmAddDocument: TfrmAddDocument
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 234
  ClientWidth = 279
  OnShow = FormShow
  ExplicitWidth = 285
  ExplicitHeight = 266
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 279
    Height = 193
    ExplicitLeft = -24
    ExplicitWidth = 280
    ExplicitHeight = 323
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
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 135
    Top = 55
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label9: TLabel [4]
    Left = 45
    Top = 55
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [5]
    Left = 10
    Top = 55
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object Label6: TLabel [6]
    Left = 10
    Top = 145
    Width = 56
    Height = 13
    Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
  end
  object Label11: TLabel [7]
    Left = 10
    Top = 101
    Width = 66
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
  end
  object Label4: TLabel [8]
    Left = 171
    Top = 55
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 193
    Width = 279
    ExplicitTop = 193
    ExplicitWidth = 279
    inherited bbOK: TBitBtn
      Left = 14
      Top = 6
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 99
      Top = 6
      Action = nil
      Enabled = False
      OnClick = bbApplyClick
      ExplicitLeft = 99
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 186
      Top = 6
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 186
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 48
      Top = -4
      Visible = False
      ExplicitLeft = 48
      ExplicitTop = -4
    end
  end
  object dbcbeKind: TDBLookupComboboxEh [10]
    Left = 10
    Top = 30
    Width = 257
    Height = 19
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
    Top = 74
    Width = 119
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eNum: TDBEditEh [12]
    Left = 135
    Top = 74
    Width = 132
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eWho: TDBEditEh [13]
    Left = 10
    Top = 164
    Width = 257
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Text = #1054#1090#1076#1077#1083' '#1059#1060#1052#1057' '#1056#1086#1089#1089#1080#1080
    Visible = True
  end
  object dbdteGetDate: TDBDateTimeEditEh [14]
    Left = 10
    Top = 120
    Width = 257
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      Enabled = False
    end
    inherited actOK: TAction
      Enabled = False
    end
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnUpdate = actCheckFieldsUpdate
    end
  end
end
