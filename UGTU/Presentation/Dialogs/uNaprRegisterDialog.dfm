inherited frmNaprRegister: TfrmNaprRegister
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
  ClientHeight = 251
  ClientWidth = 260
  OnShow = FormShow
  ExplicitWidth = 266
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 210
    ExplicitTop = -1
    ExplicitWidth = 260
    ExplicitHeight = 210
  end
  object Label5: TLabel [1]
    Left = 10
    Top = 4
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
  end
  object Label4: TLabel [2]
    Left = 134
    Top = 4
    Width = 47
    Height = 13
    Caption = #1055#1086#1088#1103#1076#1086#1082':'
  end
  object Label15: TLabel [3]
    Left = 181
    Top = 4
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
  object Label7: TLabel [4]
    Left = 10
    Top = 42
    Width = 69
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
  end
  object Label10: TLabel [5]
    Left = 79
    Top = 42
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
  object Label3: TLabel [6]
    Left = 10
    Top = 119
    Width = 71
    Height = 13
    Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1090#1086#1088':'
  end
  object Label13: TLabel [7]
    Left = 81
    Top = 117
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
  object Label6: TLabel [8]
    Left = 10
    Top = 82
    Width = 41
    Height = 13
    Caption = #1054#1094#1077#1085#1082#1072':'
  end
  object Label8: TLabel [9]
    Left = 51
    Top = 80
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
  object Label16: TLabel [10]
    Left = 134
    Top = 43
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1076#1072#1095#1080':'
  end
  object Label18: TLabel [11]
    Left = 10
    Top = 157
    Width = 30
    Height = 13
    Caption = #1058#1077#1084#1072':'
  end
  object Label9: TLabel [12]
    Left = 195
    Top = 42
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
    Top = 210
    Width = 260
    ExplicitTop = 210
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 87
      Top = 6
      ExplicitLeft = 87
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 171
      Visible = False
      ExplicitLeft = 171
    end
    inherited bbCancel: TBitBtn
      Left = 171
      Top = 6
      ExplicitLeft = 171
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = -19
      Top = 16
      Visible = False
      ExplicitLeft = -19
      ExplicitTop = 16
    end
  end
  object eNum: TDBNumberEditEh [14]
    Left = 10
    Top = 21
    Width = 121
    Height = 19
    Alignment = taLeftJustify
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
  end
  object dbcbeVidExam: TDBLookupComboboxEh [15]
    Left = 134
    Top = 21
    Width = 118
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_vid_exam'
    ListField = 'cName_vid_exam'
    ListSource = dm.dsVidExam
    TabOrder = 2
    Visible = True
  end
  object dbdteOut: TDBDateTimeEditEh [16]
    Left = 10
    Top = 58
    Width = 121
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object dbcbeEx: TDBLookupComboboxEh [17]
    Left = 10
    Top = 136
    Width = 242
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'idEmployee'
    ListField = 'NamePrepod'
    ListSource = dmUspevaemost.dsPrepodVed
    TabOrder = 4
    Visible = True
  end
  object dbcbeMark: TDBLookupComboboxEh [18]
    Left = 10
    Top = 96
    Width = 242
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Cosenca'
    ListField = 'ShortName'
    ListSource = dmUspevaemost.dsMark
    TabOrder = 5
    Visible = True
  end
  object dbdteExam: TDBDateTimeEditEh [19]
    Left = 134
    Top = 58
    Width = 118
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 6
    Visible = True
  end
  object eTema: TDBEditEh [20]
    Left = 10
    Top = 173
    Width = 242
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
  end
  inherited actBaseDialog: TActionList
    OnUpdate = actBaseDialogUpdate
  end
end
