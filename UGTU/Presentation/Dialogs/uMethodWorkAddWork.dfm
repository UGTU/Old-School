inherited frmMethodWorkAddWork: TfrmMethodWorkAddWork
  Caption = 'frmMethodWorkAddWork'
  ClientHeight = 149
  ClientWidth = 416
  Constraints.MinHeight = 100
  ExplicitWidth = 422
  ExplicitHeight = 174
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 416
    Height = 108
    ExplicitTop = 2
    ExplicitWidth = 416
    ExplicitHeight = 121
  end
  inherited Panel1: TPanel
    Top = 108
    Width = 416
    ExplicitTop = 111
    ExplicitWidth = 416
    inherited bbOK: TBitBtn
      Left = 150
      ExplicitLeft = 150
    end
    inherited bbApply: TBitBtn
      Left = 327
      ExplicitLeft = 327
    end
    inherited bbCancel: TBitBtn
      Left = 239
      ExplicitLeft = 239
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 416
    Height = 108
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 111
    DesignSize = (
      416
      108)
    object Label1: TLabel
      Left = 32
      Top = 83
      Width = 62
      Height = 17
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' : '
      ParentBiDiMode = False
    end
    object Label10: TLabel
      Left = 84
      Top = 5
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
      Left = 84
      Top = 79
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
      Left = 8
      Top = 11
      Width = 86
      Height = 17
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' : '
      ParentBiDiMode = False
    end
    object CBox: TCheckBox
      Left = 94
      Top = 56
      Width = 123
      Height = 17
      Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1088#1072#1079#1076#1077#1083#1086#1084
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CBoxClick
    end
    object CBoxEdition: TCheckBox
      Left = 265
      Top = 55
      Width = 97
      Height = 17
      Caption = #1048#1079#1076#1072#1077#1090#1089#1103
      TabOrder = 1
      OnClick = CBoxEditionClick
    end
    object dbcbWarrant: TDBLookupComboboxEh
      Left = 94
      Top = 79
      Width = 316
      Height = 21
      AlwaysShowBorder = True
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      EditButtons = <>
      Flat = True
      TabOrder = 2
      Visible = True
      OnKeyValueChanged = dbcbWarrantKeyValueChanged
    end
    object dbeNameW: TDBEditEh
      Left = 94
      Top = 8
      Width = 316
      Height = 42
      AutoSize = False
      EditButtons = <>
      TabOrder = 3
      Visible = True
      WordWrap = True
      OnChange = dbeNameWChange
    end
  end
  inherited actBaseDialog: TActionList
    Left = 433
  end
end
