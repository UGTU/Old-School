inherited AddNarush: TAddNarush
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1103
  ClientHeight = 450
  ClientWidth = 452
  OnShow = FormShow
  ExplicitWidth = 458
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 452
    Height = 409
    ExplicitLeft = 64
    ExplicitTop = 344
    ExplicitWidth = 437
    ExplicitHeight = 409
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    Caption = #1053#1072#1088#1091#1096#1077#1085#1080#1077
  end
  object Label2: TLabel [2]
    Left = 232
    Top = 8
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object BTAllRight: TSpeedButton [3]
    Left = 203
    Top = 169
    Width = 23
    Height = 22
    Caption = '>>'
    Enabled = False
    Flat = True
    OnClick = BTAllRightClick
  end
  object SpeedButton1: TSpeedButton [4]
    Left = 203
    Top = 197
    Width = 23
    Height = 22
    Caption = '>'
    Enabled = False
    Flat = True
    OnClick = ListViewProjDblClick
  end
  object SpeedButton2: TSpeedButton [5]
    Left = 203
    Top = 225
    Width = 23
    Height = 22
    Caption = '<'
    Enabled = False
    Flat = True
    OnClick = ListViewNurushDblClick
  end
  object BTAllleft: TSpeedButton [6]
    Left = 203
    Top = 253
    Width = 23
    Height = 22
    Caption = '<<'
    Enabled = False
    Flat = True
    OnClick = BTAllleftClick
  end
  object Label4: TLabel [7]
    Left = 232
    Top = 52
    Width = 44
    Height = 13
    Caption = #1050#1086#1084#1085#1072#1090#1072
  end
  object Label5: TLabel [8]
    Left = 8
    Top = 52
    Width = 26
    Height = 13
    Caption = #1069#1090#1072#1078
  end
  object Label6: TLabel [9]
    Left = 8
    Top = 101
    Width = 78
    Height = 13
    Caption = #1055#1088#1086#1078#1080#1074#1072#1102#1097#1080#1077':'
  end
  object Label7: TLabel [10]
    Left = 232
    Top = 101
    Width = 65
    Height = 13
    Caption = #1053#1072#1088#1091#1096#1080#1090#1077#1083#1080':'
  end
  inherited Panel1: TPanel
    Top = 409
    Width = 452
    ExplicitTop = 409
    ExplicitWidth = 452
    inherited bbOK: TBitBtn
      Left = 195
      ExplicitLeft = 195
    end
    inherited bbApply: TBitBtn
      Left = 363
      ExplicitLeft = 363
    end
    inherited bbCancel: TBitBtn
      Left = 279
      ExplicitLeft = 279
    end
  end
  object ComBNarush: TDBLookupComboboxEh [12]
    Left = 8
    Top = 27
    Width = 189
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'IDVidNurush'
    ListField = 'NAMEVidNurush'
    ListSource = dmHOST.dsVidNurush
    TabOrder = 1
    Visible = True
    OnChange = ComBNarushChange
  end
  object DateNar: TDBDateTimeEditEh [13]
    Left = 232
    Top = 27
    Width = 212
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
    OnChange = DateNarChange
  end
  object ListViewProj: TListView [14]
    Left = 8
    Top = 120
    Width = 189
    Height = 283
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Caption = #1060#1048#1054
        Width = 120
      end>
    FlatScrollBars = True
    RowSelect = True
    ShowColumnHeaders = False
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = ListViewProjDblClick
  end
  object ListViewNurush: TListView [15]
    Left = 232
    Top = 120
    Width = 212
    Height = 283
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
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
    OnDblClick = ListViewNurushDblClick
  end
  object ComBNumRoom: TDBLookupComboboxEh [16]
    Left = 232
    Top = 71
    Width = 212
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_address'
    ListField = 'FlatNumber'
    ListSource = dmHOST.dsVivodRoomPoEtazh
    TabOrder = 5
    Visible = True
    OnChange = ComBNumRoomChange
  end
  object ComNumEtazh: TDBLookupComboboxEh [17]
    Left = 8
    Top = 71
    Width = 189
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumEtazh'
    ListField = 'NumEtazh'
    ListSource = dmHOST.dsProcVivodEtazhPoObj
    TabOrder = 6
    Visible = True
    OnChange = ComNumEtazhChange
  end
  inherited actBaseDialog: TActionList
    Left = 401
  end
end
