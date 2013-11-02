inherited AddRoom: TAddRoom
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1086#1084#1085#1072#1090#1099
  ClientHeight = 162
  ClientWidth = 260
  OnShow = FormShow
  ExplicitWidth = 266
  ExplicitHeight = 190
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 260
    Height = 121
    ExplicitWidth = 260
    ExplicitHeight = 121
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = #8470' '#1086#1073#1097#1077#1078#1080#1090#1080#1103
  end
  object Label2: TLabel [2]
    Left = 135
    Top = 8
    Width = 45
    Height = 13
    Caption = #8470' '#1101#1090#1072#1078#1072
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 55
    Width = 59
    Height = 13
    Caption = #8470' '#1082#1086#1084#1085#1072#1090#1099
  end
  object Label4: TLabel [4]
    Left = 135
    Top = 55
    Width = 87
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1077#1089#1090
  end
  inherited Panel1: TPanel
    Top = 121
    Width = 260
    ExplicitTop = 121
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
      Left = 368
      Top = 6
      ExplicitLeft = 368
      ExplicitTop = 6
    end
  end
  object TextBNumRoom: TDBEditEh [6]
    Left = 8
    Top = 74
    Width = 113
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
  end
  object ComBNumHost: TDBLookupComboboxEh [7]
    Left = 8
    Top = 30
    Width = 113
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumHostel'
    ListField = 'NumHostel'
    ListSource = dmHOST.dsHostel
    TabOrder = 2
    Visible = True
    OnChange = ComBNumHostChange
  end
  object ComBNumEtazh: TDBLookupComboboxEh [8]
    Left = 135
    Top = 27
    Width = 117
    Height = 19
    EditButtons = <>
    Flat = True
    KeyField = 'NumEtazh'
    ListField = 'NumEtazh'
    ListSource = dmHOST.dsProcVivodEtazhPoObj
    TabOrder = 3
    Visible = True
  end
  object TextBKolMest: TDBEditEh [9]
    Left = 135
    Top = 74
    Width = 117
    Height = 19
    EditButtons = <>
    Flat = True
    TabOrder = 4
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 241
    Top = 0
  end
end
