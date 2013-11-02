inherited frmMethodWorkAddNorm: TfrmMethodWorkAddNorm
  Caption = 'frmMethodWorkAddNorm'
  ClientHeight = 211
  ClientWidth = 637
  ExplicitWidth = 643
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 169
    Width = 637
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    ExplicitTop = 126
    ExplicitWidth = 655
    ExplicitHeight = 42
  end
  inherited Panel1: TPanel
    Top = 170
    Width = 637
    ExplicitTop = 170
    ExplicitWidth = 637
    inherited bbOK: TBitBtn
      Left = 371
      ExplicitLeft = 371
    end
    inherited bbApply: TBitBtn
      Left = 548
      ExplicitLeft = 548
    end
    inherited bbCancel: TBitBtn
      Left = 460
      ExplicitLeft = 460
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 637
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      637
      169)
    object Label3: TLabel
      Left = 74
      Top = 62
      Width = 96
      Height = 13
      Caption = #1043#1086#1076' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103'  :'
    end
    object Label1: TLabel
      Left = 116
      Top = 10
      Width = 54
      Height = 13
      Caption = #1050#1072#1092#1077#1076#1088#1072'  :'
    end
    object Label4: TLabel
      Left = 162
      Top = 9
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 162
      Top = 62
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
    object Label2: TLabel
      Left = 78
      Top = 142
      Width = 92
      Height = 13
      Caption = #1053#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080'  :'
    end
    object Label6: TLabel
      Left = 162
      Top = 142
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
    object Label7: TLabel
      Left = 8
      Top = 95
      Width = 162
      Height = 13
      Caption = #1043#1086#1076#1086#1074#1086#1081' '#1086#1073#1098#1077#1084' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1055#1055#1057'  :'
    end
    object Label8: TLabel
      Left = 162
      Top = 94
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
    object Label9: TLabel
      Left = 347
      Top = 95
      Width = 127
      Height = 13
      Caption = #1044#1086#1083#1103' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1085#1072' '#1059#1052#1056'  :'
    end
    object Label10: TLabel
      Left = 466
      Top = 93
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
    object CheckBox1: TCheckBox
      Left = 176
      Top = 119
      Width = 281
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object dbcbYear: TDBLookupComboboxEh
      Left = 176
      Top = 61
      Width = 163
      Height = 21
      AlwaysShowBorder = True
      AutoSize = False
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnKeyValueChanged = dbcbKafKeyValueChanged
    end
    object dbcbKaf: TDBLookupComboboxEh
      Left = 176
      Top = 5
      Width = 446
      Height = 21
      AlwaysShowBorder = True
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnKeyValueChanged = dbcbKafKeyValueChanged
    end
    object dbcbNormExists: TDBLookupComboboxEh
      Left = 176
      Top = 140
      Width = 446
      Height = 21
      AlwaysShowBorder = True
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      TabOrder = 3
      Visible = True
      OnChange = dbcbKafKeyValueChanged
    end
    object dbeDolMW: TDBEditEh
      Left = 478
      Top = 91
      Width = 144
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
      OnChange = dbcbKafKeyValueChanged
      OnKeyPress = dbeYearVolumKeyPress
    end
    object dbeYearVolum: TDBEditEh
      Left = 176
      Top = 91
      Width = 163
      Height = 21
      EditButtons = <>
      TabOrder = 5
      Visible = True
      OnChange = dbcbKafKeyValueChanged
      OnKeyPress = dbeYearVolumKeyPress
    end
    object StaticText1: TStaticText
      Left = 176
      Top = 29
      Width = 357
      Height = 27
      AutoSize = False
      Caption = 
        '* - '#1077#1089#1083#1080' '#1082#1072#1092#1077#1076#1088#1072' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1072', '#1090#1086' '#1076#1072#1085#1085#1099#1077' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080' '#1073#1091#1076#1091#1090'      ' +
        '  '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1089#1103' '#1082#1072#1082' "'#1054#1073#1097#1080#1077' '#1085#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080'"'
      TabOrder = 6
    end
  end
  inherited actBaseDialog: TActionList
    Left = 41
  end
end
