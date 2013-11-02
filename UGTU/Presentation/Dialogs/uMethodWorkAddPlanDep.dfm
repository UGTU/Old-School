inherited frmMethodWorkAddPlanDep: TfrmMethodWorkAddPlanDep
  Caption = 'frmMethodWorkAddPlanDep'
  ClientHeight = 194
  ClientWidth = 323
  ExplicitWidth = 329
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 323
    Height = 153
    ExplicitTop = 2
    ExplicitWidth = 338
    ExplicitHeight = 153
  end
  object Label3: TLabel [1]
    Left = 63
    Top = 8
    Width = 48
    Height = 13
    Caption = #1050#1072#1092#1077#1076#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 37
    Top = 33
    Width = 74
    Height = 13
    Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076'  :'
  end
  object Label11: TLabel [3]
    Left = 103
    Top = 31
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
  object Label4: TLabel [4]
    Left = 116
    Top = 8
    Width = 3
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [5]
    Left = 7
    Top = 60
    Width = 104
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103'  :'
  end
  object Label5: TLabel [6]
    Left = 26
    Top = 86
    Width = 85
    Height = 13
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'  :'
  end
  object Label6: TLabel [7]
    Left = 35
    Top = 114
    Width = 76
    Height = 13
    Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072'  :'
  end
  object Label7: TLabel [8]
    Left = 103
    Top = 58
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
  object Label8: TLabel [9]
    Left = 103
    Top = 82
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
  object Label9: TLabel [10]
    Left = 103
    Top = 110
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
    Top = 153
    Width = 323
    ExplicitTop = 153
    ExplicitWidth = 323
    inherited bbOK: TBitBtn
      Left = 147
      ExplicitLeft = 147
    end
    inherited bbApply: TBitBtn
      Left = 234
      Visible = False
      ExplicitLeft = 234
    end
    inherited bbCancel: TBitBtn
      Left = 236
      ExplicitLeft = 236
    end
    inherited bbSprav: TBitBtn
      Left = 5
      ExplicitLeft = 5
    end
  end
  object dbcbYear: TDBLookupComboboxEh [12]
    Left = 116
    Top = 30
    Width = 173
    Height = 21
    AlwaysShowBorder = True
    AutoSize = False
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = dbcbYearKeyValueChanged
  end
  object dbdtDate: TDBDateTimeEditEh [13]
    Left = 116
    Top = 57
    Width = 173
    Height = 21
    AlwaysShowBorder = True
    AutoSize = False
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
    OnChange = dbdtDateChange
  end
  object dbcbTypeRep: TDBLookupComboboxEh [14]
    Left = 116
    Top = 84
    Width = 173
    Height = 21
    AlwaysShowBorder = True
    AutoSize = False
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
    OnKeyValueChanged = dbdtDateChange
  end
  object dbeProtocol: TDBEditEh [15]
    Left = 116
    Top = 111
    Width = 173
    Height = 21
    AlwaysShowBorder = True
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnChange = dbdtDateChange
    OnKeyPress = dbeProtocolKeyPress
  end
  inherited actBaseDialog: TActionList
    Left = 25
    Top = 160
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
