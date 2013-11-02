inherited frmProdlProzh: TfrmProdlProzh
  Caption = #1055#1088#1086#1076#1083#1077#1085#1080#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
  ClientHeight = 148
  ClientWidth = 260
  OnShow = FormShow
  ExplicitWidth = 266
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 107
    ExplicitLeft = 104
    ExplicitTop = 27
    ExplicitWidth = 262
    ExplicitHeight = 73
  end
  object Label1: TLabel [1]
    Left = 136
    Top = 8
    Width = 26
    Height = 13
    Caption = #1069#1090#1072#1078
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 52
    Width = 44
    Height = 13
    Caption = #1050#1086#1084#1085#1072#1090#1072
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = #1054#1073#1097#1077#1078#1080#1090#1080#1077
  end
  inherited Panel1: TPanel
    Top = 107
    Width = 260
    ExplicitTop = 107
    ExplicitWidth = 260
    inherited bbOK: TBitBtn
      Left = 3
      ExplicitLeft = 3
    end
    inherited bbApply: TBitBtn
      Left = 171
      ExplicitLeft = 171
    end
    inherited bbCancel: TBitBtn
      Left = 87
      ExplicitLeft = 87
    end
    inherited bbSprav: TBitBtn
      Left = 344
      Top = 6
      ExplicitLeft = 344
      ExplicitTop = 6
    end
  end
  object ComBEtazh: TDBLookupComboboxEh [5]
    Left = 136
    Top = 27
    Width = 116
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumEtazh'
    ListField = 'NumEtazh'
    ListSource = dmHOST.dsProcVivodEtazhPoObj
    TabOrder = 1
    Visible = True
    OnChange = ComBEtazhChange
  end
  object ComBRoom: TDBLookupComboboxEh [6]
    Left = 8
    Top = 71
    Width = 244
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    EditButtons = <>
    Flat = True
    KeyField = 'ik_address'
    ListField = 'FlatNumber'
    ListSource = dmHOST.dsVivodRoomPoEtazh
    TabOrder = 2
    Visible = True
  end
  object ComBNumHost: TDBLookupComboboxEh [7]
    Left = 8
    Top = 27
    Width = 114
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumHostel'
    ListField = 'NumHostel'
    ListSource = dmHOST.dsHostel
    TabOrder = 3
    Visible = True
    OnChange = ComBNumHostChange
  end
  inherited actBaseDialog: TActionList
    Left = 185
    Top = 65520
  end
end
