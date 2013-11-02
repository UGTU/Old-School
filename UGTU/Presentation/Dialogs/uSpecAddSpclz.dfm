inherited frmSpecAddSpclz: TfrmSpecAddSpclz
  Left = 473
  Top = 467
  HelpKeyword = 'Add_spec.htm'
  Caption = 'frmSpecAddSpclz'
  ClientHeight = 127
  ClientWidth = 439
  Constraints.MinHeight = 150
  Constraints.MinWidth = 382
  OldCreateOrder = True
  ExplicitWidth = 445
  ExplicitHeight = 159
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 81
    Width = 439
    Height = 11
    Align = alBottom
    Shape = bsBottomLine
    Style = bsLowered
    ExplicitTop = 103
    ExplicitWidth = 448
    ExplicitHeight = 11
  end
  object Label1: TLabel [1]
    Left = 5
    Top = 7
    Width = 32
    Height = 13
    Caption = #1064#1080#1092#1088':'
  end
  object Label2: TLabel [2]
    Left = 5
    Top = 45
    Width = 98
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1087#1086#1083#1085#1086#1077'):'
  end
  object Label3: TLabel [3]
    Left = 221
    Top = 7
    Width = 131
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1089#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077'):'
  end
  object Label8: TLabel [4]
    Left = 37
    Top = 7
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
  object Label4: TLabel [5]
    Left = 351
    Top = 4
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
  object Label5: TLabel [6]
    Left = 103
    Top = 45
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
    Top = 92
    Width = 439
    Height = 35
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 103
    ExplicitWidth = 439
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 186
      Top = 5
      Enabled = False
      ExplicitLeft = 186
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 350
      Top = 5
      Enabled = False
      TabOrder = 2
      ExplicitLeft = 350
      ExplicitTop = 5
    end
    inherited bbCancel: TBitBtn
      Left = 268
      Top = 5
      TabOrder = 1
      ExplicitLeft = 268
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Top = 32
      Visible = False
      ExplicitTop = 32
    end
  end
  object dbeShSpclz: TDBEditEh [8]
    Left = 5
    Top = 23
    Width = 212
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
    OnChange = dbeShSpclzChange
  end
  object dbeName: TDBEditEh [9]
    Left = 5
    Top = 61
    Width = 429
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    MRUList.Limit = 150
    TabOrder = 2
    Visible = True
    OnChange = dbeShSpclzChange
  end
  object dbeNameShort: TDBEditEh [10]
    Left = 221
    Top = 23
    Width = 212
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnChange = dbeShSpclzChange
  end
  inherited actBaseDialog: TActionList
    Left = 406
    Top = 0
  end
end
