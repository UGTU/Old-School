inherited frmNagruzkaAddAudEvent: TfrmNagruzkaAddAudEvent
  Left = 484
  Top = 276
  Caption = 'frmNagruzkaAddAudEvent'
  ClientHeight = 531
  ClientWidth = 448
  OldCreateOrder = True
  ExplicitWidth = 454
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = -5
    Top = -5
    Width = 1
    Height = 1
    Align = alNone
    ExplicitLeft = -5
    ExplicitTop = -5
    ExplicitWidth = 1
    ExplicitHeight = 1
  end
  object Label28: TLabel [1]
    Left = 86
    Top = 58
    Width = 36
    Height = 13
    Caption = #1042#1088#1077#1084#1103':'
  end
  object Label27: TLabel [2]
    Left = 55
    Top = 33
    Width = 67
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
  end
  object Label25: TLabel [3]
    Left = 280
    Top = 58
    Width = 56
    Height = 13
    Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077':'
  end
  object Label26: TLabel [4]
    Left = 128
    Top = 58
    Width = 38
    Height = 13
    Caption = #1085#1072#1095#1072#1083#1086':'
  end
  object Label24: TLabel [5]
    Left = 23
    Top = 8
    Width = 99
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1086#1073#1099#1090#1080#1103':'
  end
  object Bevel2: TBevel [6]
    Left = 125
    Top = 261
    Width = 322
    Height = 5
    Shape = bsTopLine
  end
  inherited Panel1: TPanel
    Top = 490
    Width = 448
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    ExplicitTop = 490
    ExplicitWidth = 448
    inherited bbOK: TBitBtn
      Left = 183
      Top = 6
      ExplicitLeft = 183
    end
    inherited bbApply: TBitBtn
      Left = 358
      Top = 6
      TabOrder = 2
      ExplicitLeft = 358
    end
    inherited bbCancel: TBitBtn
      Left = 271
      Top = 6
      TabOrder = 1
      ExplicitLeft = 271
    end
    inherited bbSprav: TBitBtn
      Width = 121
      ExplicitWidth = 121
    end
  end
  object dbeStop: TDBEditEh [8]
    Left = 344
    Top = 56
    Width = 95
    Height = 19
    AlwaysShowBorder = True
    Color = clBtnFace
    EditButtons = <>
    Flat = True
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object dbeName: TDBEditEh [9]
    Left = 128
    Top = 8
    Width = 145
    Height = 19
    AlwaysShowBorder = True
    Color = clBtnFace
    EditButtons = <>
    Flat = True
    ReadOnly = True
    TabOrder = 2
    Visible = True
    OnChange = dbeNameChange
  end
  object dbdtBeginDate: TDBDateTimeEditEh [10]
    Left = 128
    Top = 33
    Width = 145
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
    OnChange = dbdtBeginDateChange
  end
  object dbcbStart: TDBComboBoxEh [11]
    Left = 177
    Top = 58
    Width = 97
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    KeyItems.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
    TabOrder = 4
    Visible = True
    OnChange = dbcbStartChange
  end
  object Panel3: TPanel [12]
    Left = 8
    Top = 77
    Width = 431
    Height = 158
    BevelOuter = bvNone
    TabOrder = 5
    object Label13: TLabel
      Left = 292
      Top = 112
      Width = 59
      Height = 13
      Caption = #1087#1086#1074#1090#1086#1088#1077#1085#1080#1081
    end
    object Label15: TLabel
      Left = 12
      Top = 8
      Width = 102
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1087#1086#1074#1090#1086#1088#1077#1085#1080#1103':'
    end
    object Label3: TLabel
      Left = 7
      Top = 94
      Width = 107
      Height = 13
      Caption = #1050#1088#1080#1090#1077#1088#1080#1081' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
    end
    object dbcbRepeatType: TDBLookupComboboxEh
      Left = 120
      Top = 8
      Width = 145
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnKeyValueChanged = dbcbRepeatTypeKeyValueChanged
    end
    object dbdtFinalDate: TDBDateTimeEditEh
      Left = 204
      Top = 134
      Width = 82
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = dbdtFinalDateChange
    end
    object dbeRepeatCount: TDBEditEh
      Left = 236
      Top = 114
      Width = 50
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Text = '1'
      Visible = True
      OnChange = dbeRepeatCountChange
      OnKeyPress = dbeWWeekKeyPress
    end
    object pDayRepeat: TPanel
      Left = 0
      Top = 33
      Width = 385
      Height = 56
      BevelOuter = bvNone
      TabOrder = 3
      object Label16: TLabel
        Left = 160
        Top = 2
        Width = 24
        Height = 13
        Caption = #1076#1077#1085#1100
      end
      object Label23: TLabel
        Left = 72
        Top = 2
        Width = 40
        Height = 13
        Caption = #1082#1072#1078#1076#1099#1081
      end
      object dbeDFDay: TDBEditEh
        Left = 120
        Top = 0
        Width = 31
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Text = '1'
        Visible = True
        OnChange = dbeDFDayChange
        OnKeyPress = dbeWWeekKeyPress
      end
    end
    object pMonthRepeat: TPanel
      Left = -1
      Top = 33
      Width = 431
      Height = 55
      BevelOuter = bvNone
      TabOrder = 4
      object Label19: TLabel
        Left = 168
        Top = 2
        Width = 75
        Height = 13
        Caption = #1095#1080#1089#1083#1072' '#1082#1072#1078#1076#1086#1075#1086
      end
      object Label20: TLabel
        Left = 288
        Top = 2
        Width = 38
        Height = 13
        Caption = #1084#1077#1089#1103#1094#1072
      end
      object Label21: TLabel
        Left = 256
        Top = 26
        Width = 43
        Height = 13
        Caption = #1082#1072#1078#1076#1086#1075#1086
      end
      object Label22: TLabel
        Left = 344
        Top = 26
        Width = 38
        Height = 13
        Caption = #1084#1077#1089#1103#1094#1072
      end
      object dbeMFDay: TDBEditEh
        Left = 120
        Top = 0
        Width = 41
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Text = '1'
        Visible = True
        OnChange = dbeMFDayChange
        OnExit = dbeMFDayExit
      end
      object dbeMFMonth: TDBEditEh
        Left = 251
        Top = 0
        Width = 31
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 1
        Text = '1'
        Visible = True
        OnChange = dbeMFDayChange
      end
      object rbMF: TRadioButton
        Left = 98
        Top = 2
        Width = 17
        Height = 17
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbMS: TRadioButton
        Left = 98
        Top = 24
        Width = 15
        Height = 17
        TabOrder = 3
      end
      object dbcbMSDayName: TDBComboBoxEh
        Left = 168
        Top = 24
        Width = 81
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        Items.Strings = (
          #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
          #1074#1090#1086#1088#1085#1080#1082
          #1089#1088#1077#1076#1091
          #1095#1077#1090#1074#1077#1088#1075
          #1087#1103#1090#1085#1080#1094#1091
          #1089#1091#1073#1073#1086#1090#1091)
        KeyItems.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        TabOrder = 4
        Visible = True
        OnChange = dbcbMSNumChange
      end
      object dbeMSMonth: TDBEditEh
        Left = 307
        Top = 24
        Width = 31
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 5
        Text = '1'
        Visible = True
        OnChange = dbcbMSNumChange
      end
      object dbcbMSNum: TDBComboBoxEh
        Left = 120
        Top = 24
        Width = 41
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          #1087#1086#1089#1083#1077#1076'.')
        KeyItems.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
        TabOrder = 6
        Visible = True
        OnChange = dbcbMSNumChange
      end
    end
    object pWeekRepeat: TPanel
      Left = -1
      Top = 33
      Width = 425
      Height = 57
      BevelOuter = bvNone
      TabOrder = 5
      object Label17: TLabel
        Left = 72
        Top = 2
        Width = 39
        Height = 13
        Caption = #1082#1072#1078#1076#1091#1102
      end
      object Label18: TLabel
        Left = 160
        Top = 2
        Width = 132
        Height = 13
        Caption = #1085#1077#1076#1077#1083#1102' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1076#1085#1080':'
      end
      object dbeWWeek: TDBEditEh
        Left = 121
        Top = 0
        Width = 31
        Height = 19
        AlwaysShowBorder = True
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Text = '1'
        Visible = True
        OnChange = dbeWWeekChange
        OnKeyPress = dbeWWeekKeyPress
      end
      object cbWMon: TCheckBox
        Left = 120
        Top = 24
        Width = 97
        Height = 17
        Caption = #1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
        TabOrder = 1
        OnClick = cbWMonClick
      end
      object cbWTue: TCheckBox
        Left = 120
        Top = 40
        Width = 81
        Height = 17
        Caption = #1074#1090#1086#1088#1085#1080#1082
        TabOrder = 2
        OnClick = cbWMonClick
      end
      object cbWWen: TCheckBox
        Left = 232
        Top = 24
        Width = 73
        Height = 17
        Caption = #1089#1088#1077#1076#1072
        TabOrder = 3
        OnClick = cbWMonClick
      end
      object cbWThu: TCheckBox
        Left = 232
        Top = 40
        Width = 73
        Height = 17
        Caption = #1095#1077#1090#1074#1077#1088#1075
        TabOrder = 4
        OnClick = cbWMonClick
      end
      object cbWFri: TCheckBox
        Left = 320
        Top = 22
        Width = 81
        Height = 17
        Caption = #1087#1103#1090#1085#1080#1094#1072
        TabOrder = 5
        OnClick = cbWMonClick
      end
      object cbWSat: TCheckBox
        Left = 320
        Top = 40
        Width = 81
        Height = 17
        Caption = #1089#1091#1073#1073#1086#1090#1072
        TabOrder = 6
        OnClick = cbWMonClick
      end
    end
    object rbRLTF: TRadioButton
      Left = 118
      Top = 94
      Width = 149
      Height = 17
      Caption = #1053#1077#1090' '#1082#1086#1085#1077#1095#1085#1086#1081' '#1076#1072#1090#1099
      TabOrder = 6
      OnClick = cbWMonClick
    end
    object rbRLTS: TRadioButton
      Left = 118
      Top = 114
      Width = 114
      Height = 17
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1087#1086#1089#1083#1077
      TabOrder = 7
      OnClick = cbWMonClick
    end
    object rbRLTT: TRadioButton
      Left = 118
      Top = 134
      Width = 82
      Height = 17
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100':'
      Checked = True
      TabOrder = 8
      TabStop = True
      OnClick = cbWMonClick
    end
  end
  object Panel2: TPanel [13]
    Left = 55
    Top = 104
    Width = 364
    Height = 57
    BorderStyle = bsSingle
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077'... '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1076#1072#1085#1085#1099#1093'...'
    TabOrder = 6
    Visible = False
  end
  object Panel4: TPanel [14]
    Left = 2
    Top = 264
    Width = 443
    Height = 221
    BevelOuter = bvNone
    TabOrder = 7
    object Label1: TLabel
      Left = 39
      Top = 8
      Width = 78
      Height = 13
      Caption = #1055#1083#1072#1085' '#1085#1072#1075#1088#1091#1079#1082#1080':'
    end
    object Label10: TLabel
      Left = 123
      Top = 156
      Width = 38
      Height = 13
      Caption = #1082#1086#1088#1087#1091#1089':'
    end
    object Label11: TLabel
      Left = 232
      Top = 155
      Width = 35
      Height = 13
      Caption = #1085#1086#1084#1077#1088':'
    end
    object Label12: TLabel
      Left = 122
      Top = 205
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 228
      Top = 132
      Width = 101
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072':'
    end
    object Label29: TLabel
      Left = 130
      Top = 205
      Width = 280
      Height = 13
      Caption = '- '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103' '#1060#1048#1054' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
    end
    object Label31: TLabel
      Left = 46
      Top = 132
      Width = 71
      Height = 13
      Caption = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080':'
    end
    object Label4: TLabel
      Left = 83
      Top = 83
      Width = 34
      Height = 13
      Caption = #1055#1086#1090#1086#1082':'
    end
    object Label5: TLabel
      Left = 51
      Top = 58
      Width = 66
      Height = 13
      Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
    end
    object Label6: TLabel
      Left = 1
      Top = 33
      Width = 116
      Height = 13
      Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103'  :'
    end
    object Label7: TLabel
      Left = 109
      Top = 31
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 51
      Top = 108
      Width = 66
      Height = 13
      Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081':'
    end
    object Label9: TLabel
      Left = 61
      Top = 156
      Width = 56
      Height = 13
      Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103':'
    end
    object Label30: TLabel
      Left = 55
      Top = 181
      Width = 62
      Height = 13
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099':'
    end
    object dbcbCalcUnit: TDBLookupComboboxEh
      Left = 335
      Top = 132
      Width = 99
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnKeyValueChanged = dbeNameChange
    end
    object dbcbCampus: TDBLookupComboboxEh
      Left = 167
      Top = 156
      Width = 53
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnKeyValueChanged = dbcbCampusKeyValueChanged
    end
    object dbcbDisc: TDBLookupComboboxEh
      Left = 123
      Top = 58
      Width = 313
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
      OnKeyValueChanged = dbcbDiscKeyValueChanged
    end
    object dbcbPlan: TDBLookupComboboxEh
      Left = 123
      Top = 8
      Width = 313
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 3
      Visible = True
      OnKeyValueChanged = dbcbPlanKeyValueChanged
    end
    object dbcbPotok: TDBLookupComboboxEh
      Left = 123
      Top = 83
      Width = 206
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 4
      Visible = True
      OnKeyValueChanged = dbcbPotokKeyValueChanged
    end
    object dbcbPrep: TDBLookupComboboxEh
      Left = 123
      Top = 33
      Width = 313
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 5
      Visible = True
      OnKeyValueChanged = dbcbPrepKeyValueChanged
    end
    object dbcbRoom: TDBLookupComboboxEh
      Left = 273
      Top = 156
      Width = 56
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 6
      Visible = True
      OnKeyValueChanged = dbeNameChange
    end
    object dbcbVidNagruzki: TDBLookupComboboxEh
      Left = 123
      Top = 132
      Width = 97
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 7
      Visible = True
      OnKeyValueChanged = dbcbVidNagruzkiKeyValueChanged
    end
    object dbcbVidZanyat: TDBLookupComboboxEh
      Left = 123
      Top = 108
      Width = 206
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 8
      Visible = True
      OnKeyValueChanged = dbcbVidZanyatKeyValueChanged
    end
    object dbcbWorkType: TDBLookupComboboxEh
      Left = 123
      Top = 181
      Width = 206
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 9
      Visible = True
      OnKeyValueChanged = dbcbVidZanyatKeyValueChanged
    end
  end
  object Panel5: TPanel [15]
    Left = 123
    Top = 230
    Width = 317
    Height = 27
    BevelOuter = bvNone
    TabOrder = 8
    object Label14: TLabel
      Left = 1
      Top = 9
      Width = 182
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1086#1089#1090#1080' '#1089#1086#1073#1099#1090#1080#1081':'
    end
    object ToolBar1: TToolBar
      Left = 189
      Top = 5
      Width = 60
      Height = 22
      Align = alNone
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = actRefreshConflictList
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = actShowConflictList
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  inherited actBaseDialog: TActionList
    Images = ImageList1
    Left = 25
    Top = 126
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    object actRefreshConflictList: TAction
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081', '#1087#1088#1086#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1074' '#1101#1090#1086' '#1078#1077' '#1074#1088#1077#1084#1103
      ImageIndex = 1
      OnExecute = actRefreshConflictListExecute
      OnUpdate = actRefreshConflictListUpdate
    end
    object actShowConflictList: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081', '#1087#1088#1086#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1074' '#1101#1090#1086' '#1078#1077' '#1074#1088#1077#1084#1103
      ImageIndex = 0
      OnExecute = actShowConflictListExecute
      OnUpdate = actShowConflictListUpdate
    end
  end
  object ImageList1: TImageList
    Left = 216
    Top = 256
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004CACD5000883B8000868
      91004B9DC0000000000000000000000000000000000000000000000000000000
      0000FAF4EF00B9957B00E9E0DA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9EBFA0037A2D0000993CB00289ED800149F
      E6000E8BC3003687AA00C7E0EB00000000000000000000000000000000000000
      0000E6BD9D008B552C00C6B7AC00F2EFEC00EFEAE600FAF9F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F003A95BC0023B1F80029A0F70009182A004259
      67002CB0F2000F8FC8003278960000000000000000000000000000000000F5E1
      D200D4864B00AC68340091633F00835C3F007A583E00876D5A00B7A99E00F4F1
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FCFBFC00FAFAFA00F9F9
      F900F8F8F800F7F6F60098D8F3001597CF0029A0F70029A0F700303239003043
      53002CB0F20023A7E70009709B0090C3DA000000000000000000FAF3EE00D89A
      6B00D5804100DA844200D7824100D8834200D7824100BF743A0089532A008468
      5300E4DDD8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FCFCFD00FBFBFC00FAFA
      FA00F9F9F900F7F8F8001797CC0023B1F80029A0F7002298F6000175DD000175
      DD00107FF1002C9BE9001A90C400075576000000000000000000EEB99100E590
      5100E48B4900E3894600E48B4900E89D6600EFBB9400F0C3A200EFBA9300E695
      59009D6D4800E5DDD70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FDFEFD00FDFDFD00FCFC
      FC00FAFAFA00F9F9F9001A98CC0043C4FB0023B1F80028BDFF0009182A000F18
      2600107FF1001679E6001496E000086A92000000000000000000F7DFCC00F1C5
      A400EDB48900E89E6700DF874400E1B59300000000000000000000000000F8E3
      D300EAAA7A00C0865B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FEFEFE00FDFDFE00FCFC
      FD00FCFBFB00FBFBFB0045ABD50050C7FB0055C9F20068DEFF001A283A001D23
      3200107FF1000677E8001F91D300368FB600000000000000000000000000FEFD
      FC00F8E2D200F2C9A900EAA87600B97F53000000000000000000000000000000
      0000FCF2EC00ECB4880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FEFEFE00FDFD
      FD00FDFDFD00FCFBFC0086C7E30024A0D40069CDF10089DBF8005B5A5C004F60
      65001895E4002EA3E2002E95BF0094CFE9000000000000000000000000000000
      000000000000FEFEFE00F7DFCD00EDB78D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FEFF
      FE00FEFEFD00FCFDFC00FBFAFB00E1F1F9002BA3D6007DCBEA006FCDF30035BD
      FC0029A3DE001CA3DD008B949700000000000000000000000000000000000000
      0000000000000000000000000000FEFDFB0000000000D1AE9300D5CAC3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FEFEFF00FDFEFE00FBFBFB00FBFAFB00C3E8F80056B6DE00219DD20025AC
      E6003FB7E900B9E0F10097928F00000000000000000000000000DBA98300BEA4
      90000000000000000000000000000000000000000000DD87470080573900A593
      8500D1C6BE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FCFDFC00FBFBFB00FAFBFB00F9FAF900F8F7F800F6F7
      F600F5F5F500F3F3F40097928F00000000000000000000000000F7DECB00E591
      5300A17E6400CAC0B900000000000000000000000000E6975B00C4763C00985C
      2E007B543600A38C7A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFEFD00FDFDFD00FBFCFC00FBFBFA00F9F9F900F8F8
      F800F6F6F700F5F5F50097928F0000000000000000000000000000000000F6DB
      C700E89E66009F603000775339007B5C4500AC795300CC7E4400E2884500DD85
      4300CA7A3D009A62390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA0097928F0000000000000000000000000000000000FEFE
      FE00F8E2D200F0BE9900EAA57100E5915100E48D4B00E48E4C00E48E4D00E48C
      4A00E48D4D00E2BB9D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00E0D9D300E0D9D300E0D9
      D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D30091796800E0D9D3009179
      6800E0D9D3009179680097928F00000000000000000000000000000000000000
      000000000000FBF0E800F6D9C400F2C9AB00EFC09C00F0C09C00EBAD7E00E593
      5400DFA57900FDFAF70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDF9F600FCF6F100FCF6F100F1C8A900E79C
      6300F5E3D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5D8C200F3CF
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF87F1FF00000000FE01F03F00000000
      0001E00F000000000000C007000000000000C003000000000000C0E300000000
      0000E0F3000000000000F8FF000000000001FE9F000000000001CF8700000000
      0001C383000000000001E003000000000001E003000000000001F80300000000
      0001FC0700000000FFFFFFCF00000000}
  end
end
