inherited frmMethodWorkHyperLink: TfrmMethodWorkHyperLink
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1075#1080#1087#1077#1088#1089#1089#1099#1083#1082#1080
  ClientHeight = 156
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 115
    ExplicitHeight = 115
  end
  object Label9: TLabel [1]
    Left = 48
    Top = 11
    Width = 42
    Height = 17
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = #1058#1077#1082#1089#1090' : '
    ParentBiDiMode = False
  end
  object Label10: TLabel [2]
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
  object Label1: TLabel [3]
    Left = 47
    Top = 59
    Width = 43
    Height = 17
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = #1040#1076#1088#1077#1089' : '
    ParentBiDiMode = False
  end
  object Label2: TLabel [4]
    Left = 84
    Top = 55
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
    Top = 115
    ExplicitTop = 115
    inherited bbOK: TBitBtn
      Left = 260
      ExplicitLeft = 260
    end
    inherited bbApply: TBitBtn
      Visible = False
    end
    inherited bbCancel: TBitBtn
      Left = 344
      ExplicitLeft = 344
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbeName: TDBEditEh [6]
    Left = 94
    Top = 8
    Width = 316
    Height = 42
    AutoSize = False
    EditButtons = <>
    TabOrder = 1
    Visible = True
    WordWrap = True
    OnChange = dbeNameChange
  end
  object dbeAdress: TDBEditEh [7]
    Left = 94
    Top = 56
    Width = 316
    Height = 21
    AutoSize = False
    EditButtons = <>
    TabOrder = 2
    Visible = True
    OnChange = dbeNameChange
  end
  inherited actBaseDialog: TActionList
    Left = 129
    Top = 128
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
