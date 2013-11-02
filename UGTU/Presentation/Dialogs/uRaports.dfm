inherited frmRaporsDlg: TfrmRaporsDlg
  Left = 431
  Top = 232
  Caption = #1057#1086#1079#1076#1072#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1088#1072#1087#1086#1088#1090' '#1086' '#1085#1077#1076#1086#1087#1091#1089#1082#1077
  ClientHeight = 366
  ClientWidth = 438
  OldCreateOrder = True
  ExplicitWidth = 444
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 438
    Height = 325
    ExplicitWidth = 438
    ExplicitHeight = 308
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 205
    Top = 129
    Width = 23
    Height = 22
    Action = actRight
    Flat = True
  end
  object SpeedButton2: TSpeedButton [2]
    Left = 205
    Top = 154
    Width = 23
    Height = 22
    Action = actLeft
    Flat = True
  end
  object SpeedButton3: TSpeedButton [3]
    Left = 205
    Top = 179
    Width = 23
    Height = 22
    Action = actAllLeft
    Flat = True
  end
  object SpeedButton4: TSpeedButton [4]
    Left = 205
    Top = 105
    Width = 23
    Height = 22
    Action = actAllRight
    Flat = True
  end
  object Label1: TLabel [5]
    Left = 12
    Top = 51
    Width = 70
    Height = 13
    Caption = #1044#1086#1087#1091#1097#1077#1085#1085#1099#1077':'
  end
  object Label2: TLabel [6]
    Left = 240
    Top = 54
    Width = 139
    Height = 13
    Caption = #1053#1077#1076#1086#1087#1091#1097#1077#1085#1085#1099#1077' '#1087#1086' '#1088#1072#1087#1086#1088#1090#1091':'
  end
  object Label3: TLabel [7]
    Left = 12
    Top = 6
    Width = 38
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072':'
  end
  object Label4: TLabel [8]
    Left = 12
    Top = 28
    Width = 48
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090':'
  end
  object Label5: TLabel [9]
    Left = 153
    Top = 6
    Width = 47
    Height = 13
    Caption = #1057#1077#1084#1077#1089#1090#1088':'
  end
  object lblGroup: TLabel [10]
    Left = 52
    Top = 6
    Width = 3
    Height = 13
  end
  object lblSemestr: TLabel [11]
    Left = 204
    Top = 6
    Width = 3
    Height = 13
  end
  inherited Panel1: TPanel
    Top = 325
    Width = 438
    ExplicitTop = 325
    ExplicitWidth = 438
    inherited bbOK: TBitBtn
      Left = 171
      ExplicitLeft = 171
    end
    inherited bbApply: TBitBtn
      Left = 337
      ExplicitLeft = 337
    end
    inherited bbCancel: TBitBtn
      Left = 254
      ExplicitLeft = 254
    end
    inherited bbSprav: TBitBtn
      Left = 7
      Visible = False
      ExplicitLeft = 7
    end
  end
  object lvDop: TListView [13]
    Left = 12
    Top = 73
    Width = 180
    Height = 235
    Columns = <
      item
        Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
      end
      item
        Caption = #1060#1048#1054
        Width = 120
      end>
    FlatScrollBars = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = actRightExecute
  end
  object lvNDop: TListView [14]
    Left = 239
    Top = 71
    Width = 180
    Height = 235
    Columns = <
      item
        Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
      end
      item
        Caption = #1060#1048#1054
        Width = 120
      end
      item
        Caption = 'ikZach'
        Width = 0
      end>
    FlatScrollBars = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = actLeftExecute
  end
  object lv2: TListView [15]
    Left = 240
    Top = 72
    Width = 180
    Height = 235
    Columns = <
      item
        Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
      end
      item
        Caption = #1060#1048#1054
        Width = 120
      end>
    FlatScrollBars = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 3
    ViewStyle = vsReport
    Visible = False
    OnDblClick = actLeftExecute
  end
  object lv1: TListView [16]
    Left = 12
    Top = 73
    Width = 180
    Height = 235
    Columns = <
      item
        Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
      end
      item
        Caption = #1060#1048#1054
        Width = 120
      end>
    FlatScrollBars = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 4
    ViewStyle = vsReport
    Visible = False
    OnDblClick = actRightExecute
  end
  object cmbx_UpContent: TDBLookupComboboxEh [17]
    Left = 67
    Top = 25
    Width = 353
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'ik_upContent'
    ListField = 'cName_disc'
    ListSource = dmUspevaemost.dsGetUpContRap
    TabOrder = 5
    Visible = True
    OnChange = cmbx_UpContentChange
  end
  inherited actBaseDialog: TActionList
    Left = 114
    Top = 315
    object actAllRight: TAction
      Caption = '>>'
      Hint = #1053#1080#1082#1086#1075#1086' '#1085#1077' '#1076#1086#1087#1091#1089#1090#1080#1090#1100
      OnExecute = actAllRightExecute
      OnUpdate = actAllRightUpdate
    end
    object actRight: TAction
      Caption = '>'
      Hint = #1053#1077' '#1076#1086#1087#1091#1089#1090#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1089#1083#1077#1074#1072
      OnExecute = actRightExecute
      OnUpdate = actAllRightUpdate
    end
    object actLeft: TAction
      Caption = '<'
      Hint = #1044#1086#1087#1091#1089#1090#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1089#1087#1088#1072#1074#1072
      OnExecute = actLeftExecute
      OnUpdate = actAllLeftUpdate
    end
    object actAllLeft: TAction
      Caption = '<<'
      Hint = #1044#1086#1087#1091#1089#1090#1080#1090#1100' '#1074#1089#1077#1093
      OnExecute = actAllLeftExecute
      OnUpdate = actAllLeftUpdate
    end
  end
end
