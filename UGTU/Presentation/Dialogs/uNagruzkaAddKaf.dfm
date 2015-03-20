inherited frmNagruzkaAddKaf: TfrmNagruzkaAddKaf
  Left = 447
  Top = 390
  Caption = 'frmNagruzkaAddKaf'
  ClientHeight = 102
  ClientWidth = 371
  OldCreateOrder = True
  ExplicitWidth = 377
  ExplicitHeight = 134
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 371
    Height = 61
    ExplicitTop = 2
    ExplicitWidth = 371
    ExplicitHeight = 61
  end
  object Label1: TLabel [1]
    Left = 77
    Top = 8
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel [2]
    Left = 6
    Top = 35
    Width = 124
    Height = 13
    Caption = #1057#1086#1082#1088#1072#1097#1105#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel [3]
    Left = 132
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
  object Label4: TLabel [4]
    Left = 132
    Top = 35
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
    Top = 61
    Width = 371
    TabOrder = 2
    ExplicitTop = 61
    ExplicitWidth = 371
    inherited bbOK: TBitBtn
      Left = 111
      ExplicitLeft = 111
    end
    inherited bbApply: TBitBtn
      Left = 277
      TabOrder = 2
      ExplicitLeft = 277
    end
    inherited bbCancel: TBitBtn
      Left = 194
      TabOrder = 1
      ExplicitLeft = 194
    end
    inherited bbSprav: TBitBtn
      Left = 6
      Top = 38
      Visible = False
      ExplicitLeft = 6
      ExplicitTop = 38
    end
  end
  object dbeName: TDBEditEh [6]
    Left = 142
    Top = 5
    Width = 217
    Height = 19
    AlwaysShowBorder = True
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
    OnChange = dbeNameChange
    OnMouseMove = dbeNameMouseMove
  end
  object dbeNameShort: TDBEditEh [7]
    Left = 142
    Top = 32
    Width = 218
    Height = 19
    AlwaysShowBorder = True
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnChange = dbeNameChange
  end
  inherited actBaseDialog: TActionList
    Left = 313
  end
end
