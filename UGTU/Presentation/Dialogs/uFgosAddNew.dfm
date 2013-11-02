inherited frmFgosAddNew: TfrmFgosAddNew
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'frmFgosAddNew'
  ClientHeight = 336
  ClientWidth = 434
  Constraints.MinHeight = 362
  Constraints.MinWidth = 440
  ExplicitWidth = 440
  ExplicitHeight = 368
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 434
    Height = 103
    Align = alTop
    ExplicitTop = 2
    ExplicitWidth = 435
    ExplicitHeight = 102
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 38
    Width = 98
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103':'
  end
  object Label4: TLabel [3]
    Left = 7
    Top = 72
    Width = 106
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103':'
  end
  object Label5: TLabel [4]
    Left = 115
    Top = 38
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
  object Label6: TLabel [5]
    Left = 115
    Top = 70
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
  object Label7: TLabel [6]
    Left = 128
    Top = 8
    Width = 3
    Height = 13
  end
  inherited Panel1: TPanel
    Top = 295
    Width = 434
    ExplicitTop = 295
    ExplicitWidth = 434
    inherited bbOK: TBitBtn
      Left = 177
      ExplicitLeft = 177
    end
    inherited bbApply: TBitBtn
      Left = 345
      ExplicitLeft = 345
    end
    inherited bbCancel: TBitBtn
      Left = 261
      ExplicitLeft = 261
    end
  end
  object dbdtDate: TDBDateTimeEditEh [8]
    Left = 125
    Top = 35
    Width = 298
    Height = 19
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
    OnChange = dbdtDateChange
  end
  object eNum: TEdit [9]
    Left = 125
    Top = 69
    Width = 298
    Height = 21
    TabOrder = 2
    OnChange = eNumChange
  end
  object Panel2: TPanel [10]
    Left = 0
    Top = 103
    Width = 434
    Height = 192
    Align = alClient
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 213
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080': '
    end
    object Label8: TLabel
      Left = 8
      Top = 20
      Width = 85
      Height = 13
      Caption = '('#1095#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102')'
    end
    object Label9: TLabel
      Left = 8
      Top = 39
      Width = 268
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1072#1091#1076#1080#1090#1086#1088#1085#1099#1093' '#1091#1095#1077#1073#1085#1099#1093' '#1079#1072#1085#1103#1090#1080#1081':'
    end
    object Label10: TLabel
      Left = 8
      Top = 51
      Width = 85
      Height = 13
      Caption = '('#1095#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102')'
    end
    object Label11: TLabel
      Left = 8
      Top = 70
      Width = 273
      Height = 13
      Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1082#1072#1085#1080#1082#1091#1083#1103#1088#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1079#1072' '#1075#1086#1076':'
    end
    object Label12: TLabel
      Left = 8
      Top = 82
      Width = 42
      Height = 13
      Caption = '('#1085#1077#1076#1077#1083#1100')'
    end
    object Label13: TLabel
      Left = 8
      Top = 101
      Width = 279
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1082#1072#1085#1080#1082#1091#1083#1103#1088#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1079#1072' '#1075#1086#1076':'
    end
    object Label14: TLabel
      Left = 8
      Top = 113
      Width = 42
      Height = 13
      Caption = '('#1085#1077#1076#1077#1083#1100')'
    end
    object Label15: TLabel
      Left = 8
      Top = 132
      Width = 196
      Height = 13
      Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1086#1073#1098#1105#1084' '#1079#1080#1084#1085#1080#1093' '#1082#1072#1085#1080#1082#1091#1083':'
    end
    object Label16: TLabel
      Left = 8
      Top = 144
      Width = 42
      Height = 13
      Caption = '('#1085#1077#1076#1077#1083#1100')'
    end
    object Label17: TLabel
      Left = 8
      Top = 163
      Width = 156
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' 1 '#1079#1072#1095#1077#1090#1085#1086#1081' '#1077#1076#1080#1085#1080#1094#1099':'
    end
    object Label18: TLabel
      Left = 290
      Top = 168
      Width = 7
      Height = 18
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 303
      Top = 6
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 303
      Top = 39
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 1
      OnChange = Edit2Change
    end
    object Edit3: TEdit
      Left = 303
      Top = 70
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 2
      OnChange = Edit3Change
    end
    object Edit4: TEdit
      Left = 303
      Top = 101
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 3
      OnChange = Edit4Change
    end
    object Edit5: TEdit
      Left = 303
      Top = 132
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 4
      OnChange = Edit5Change
    end
    object Edit6: TEdit
      Left = 303
      Top = 163
      Width = 120
      Height = 19
      Constraints.MaxHeight = 19
      Constraints.MinHeight = 19
      TabOrder = 5
      OnChange = Edit6Change
    end
  end
  inherited actBaseDialog: TActionList
    Left = 337
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
