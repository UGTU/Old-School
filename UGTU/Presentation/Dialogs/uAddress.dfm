inherited frmAddress: TfrmAddress
  Caption = #1040#1076#1088#1077#1089
  ClientHeight = 293
  ClientWidth = 533
  OnShow = FormShow
  ExplicitWidth = 539
  ExplicitHeight = 322
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 533
    Height = 252
    ExplicitTop = 2
    ExplicitWidth = 533
    ExplicitHeight = 252
  end
  object Label14: TLabel [1]
    Left = 263
    Top = 95
    Width = 98
    Height = 13
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090':'
  end
  object Label19: TLabel [2]
    Left = 21
    Top = 138
    Width = 35
    Height = 13
    Caption = #1059#1083#1080#1094#1072':'
  end
  object Label35: TLabel [3]
    Left = 263
    Top = 138
    Width = 26
    Height = 13
    Caption = #1044#1086#1084':'
  end
  object Label36: TLabel [4]
    Left = 432
    Top = 138
    Width = 51
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072':'
  end
  object Label11: TLabel [5]
    Left = 21
    Top = 95
    Width = 34
    Height = 13
    Caption = #1056#1072#1081#1086#1085':'
  end
  object Label10: TLabel [6]
    Left = 263
    Top = 50
    Width = 39
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085':'
  end
  object Label9: TLabel [7]
    Left = 21
    Top = 50
    Width = 39
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072':'
  end
  object Label7: TLabel [8]
    Left = 432
    Top = 95
    Width = 41
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089':'
  end
  object Label1: TLabel [9]
    Left = 21
    Top = 8
    Width = 61
    Height = 13
    Caption = #1058#1080#1087' '#1072#1076#1088#1077#1089#1072':'
  end
  object Label2: TLabel [10]
    Left = 348
    Top = 138
    Width = 39
    Height = 13
    Caption = #1050#1086#1088#1087#1091#1089':'
  end
  object Label3: TLabel [11]
    Left = 20
    Top = 182
    Width = 132
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103':'
  end
  object Label4: TLabel [12]
    Left = 263
    Top = 182
    Width = 150
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103':'
  end
  object Label46: TLabel [13]
    Left = 83
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
  object Label5: TLabel [14]
    Left = 61
    Top = 50
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
  object Label6: TLabel [15]
    Left = 304
    Top = 50
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
  object Label12: TLabel [16]
    Left = 56
    Top = 95
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
  object Label13: TLabel [17]
    Left = 362
    Top = 95
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
  object Label15: TLabel [18]
    Left = 58
    Top = 138
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
    Top = 252
    Width = 533
    TabOrder = 12
    ExplicitTop = 252
    ExplicitWidth = 533
    inherited bbOK: TBitBtn
      Left = 354
      ExplicitLeft = 354
    end
    inherited bbApply: TBitBtn
      Left = 352
      TabOrder = 2
      Visible = False
      ExplicitLeft = 352
    end
    inherited bbCancel: TBitBtn
      Left = 440
      TabOrder = 1
      ExplicitLeft = 440
    end
    inherited bbSprav: TBitBtn
      Left = 13
      ExplicitLeft = 13
    end
  end
  object dbcbeStreet: TDBLookupComboboxEh [20]
    Left = 21
    Top = 157
    Width = 236
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_street'
    ListField = 'CStreet'
    ListSource = dmAdress.dsStreet
    TabOrder = 6
    Visible = True
  end
  object dbcbePoint: TDBLookupComboboxEh [21]
    Left = 263
    Top = 114
    Width = 156
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'IK_Gorod'
    ListField = 'CGorod'
    ListSource = dmAdress.dsGorod
    TabOrder = 4
    Visible = True
    OnChange = dbcbePointChange
  end
  object eHouse: TDBEditEh [22]
    Left = 263
    Top = 157
    Width = 72
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 7
    Visible = True
  end
  object eFlat: TDBEditEh [23]
    Left = 432
    Top = 157
    Width = 89
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 9
    Visible = True
  end
  object eIndex: TDBEditEh [24]
    Left = 432
    Top = 114
    Width = 89
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Visible = True
  end
  object dbcbeDist: TDBLookupComboboxEh [25]
    Left = 21
    Top = 114
    Width = 236
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'IK_Raion'
    ListField = 'CRaion'
    ListSource = dmAdress.dsRaion
    TabOrder = 3
    Visible = True
    OnChange = dbcbeDistChange
  end
  object dbcbeReg: TDBLookupComboboxEh [26]
    Left = 263
    Top = 69
    Width = 258
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_region'
    ListField = 'Cregion'
    ListSource = dmAdress.dsRegion
    TabOrder = 2
    Visible = True
    OnChange = dbcbeRegChange
  end
  object dbcbeCountry: TDBLookupComboboxEh [27]
    Left = 21
    Top = 69
    Width = 236
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'Ik_strana'
    ListField = 'Cstrana'
    ListSource = dmAdress.dsStrana
    TabOrder = 1
    Visible = True
    OnChange = dbcbeCountryChange
  end
  object dbcbeAddressType: TDBLookupComboboxEh [28]
    Left = 21
    Top = 25
    Width = 500
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_AddressType'
    ListField = 'AddressTypeName'
    ListSource = dmAdress.dsAddressType
    TabOrder = 0
    Visible = True
  end
  object eBuilding: TDBEditEh [29]
    Left = 348
    Top = 157
    Width = 71
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 8
    Visible = True
  end
  object dbdteBegin: TDBDateTimeEditEh [30]
    Left = 21
    Top = 201
    Width = 236
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 10
    Visible = True
  end
  object dbdteEnd: TDBDateTimeEditEh [31]
    Left = 263
    Top = 201
    Width = 258
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 11
    Visible = True
  end
  inherited actBaseDialog: TActionList
    Left = 73
    Top = 208
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
