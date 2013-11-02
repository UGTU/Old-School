inherited ftmPrikaz: TftmPrikaz
  Left = 206
  Top = 243
  HelpKeyword = 'Add_Prikaz.htm'
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072
  ClientHeight = 218
  ClientWidth = 257
  Constraints.MinWidth = 263
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 263
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 257
    Height = 177
    ExplicitWidth = 257
    ExplicitHeight = 184
  end
  inherited Panel1: TPanel
    Top = 177
    Width = 257
    ExplicitTop = 184
    ExplicitWidth = 257
    inherited bbOK: TBitBtn
      Left = 29
      Width = 71
      Enabled = False
      ModalResult = 1
      ExplicitLeft = 29
      ExplicitWidth = 71
    end
    inherited bbApply: TBitBtn
      Left = 175
      Width = 71
      Enabled = False
      ExplicitLeft = 175
      ExplicitWidth = 71
    end
    inherited bbCancel: TBitBtn
      Left = 102
      Width = 71
      ExplicitLeft = 102
      ExplicitWidth = 71
    end
    inherited bbSprav: TBitBtn
      Left = 24
      Top = -8
      Visible = False
      ExplicitLeft = 24
      ExplicitTop = -8
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 257
    Height = 177
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 184
    object Label1: TLabel
      Left = 12
      Top = 9
      Width = 82
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 74
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label3: TLabel
      Left = 12
      Top = 129
      Width = 170
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1087#1088#1080#1082#1072#1079#1072' '#1074' '#1089#1080#1083#1091':'
    end
    object Label4: TLabel
      Left = 94
      Top = 9
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
    object Label5: TLabel
      Left = 87
      Top = 49
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
      Left = 12
      Top = 91
      Width = 67
      Height = 13
      Caption = #1058#1080#1087' '#1087#1088#1080#1082#1072#1079#1072':'
    end
    object Label8: TLabel
      Left = 80
      Top = 91
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
    object dbdtePrikDate: TDBDateTimeEditEh
      Left = 12
      Top = 65
      Width = 234
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = dbdtePrikDateChange
    end
    object dbdteVstDate: TDBDateTimeEditEh
      Left = 12
      Top = 144
      Width = 234
      Height = 19
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object eNum: TDBEditEh
      Left = 12
      Top = 25
      Width = 234
      Height = 19
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnChange = eNumChange
    end
    object dbcbePrikType: TDBLookupComboboxEh
      Left = 12
      Top = 105
      Width = 234
      Height = 19
      EditButtons = <>
      Flat = True
      KeyField = 'ik_typePrikaz'
      ListField = 'cTypePrikaz'
      ListSource = dmPrikaz.dsPrikType
      TabOrder = 3
      Visible = True
      OnChange = eNumChange
    end
  end
end
