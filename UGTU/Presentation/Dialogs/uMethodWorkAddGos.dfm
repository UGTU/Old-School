inherited frmMethodWorkAddGos: TfrmMethodWorkAddGos
  Caption = 'frmMethodWorkAddGos'
  ClientHeight = 121
  ClientWidth = 300
  ExplicitWidth = 306
  ExplicitHeight = 146
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 300
    Height = 80
    ExplicitLeft = 8
    ExplicitWidth = 355
    ExplicitHeight = 114
  end
  object Label3: TLabel [1]
    Left = 15
    Top = 8
    Width = 81
    Height = 13
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 69
    Top = 37
    Width = 27
    Height = 13
    Caption = #1043#1086#1076'  :'
  end
  object Label11: TLabel [3]
    Left = 88
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
  object Label4: TLabel [4]
    Left = 103
    Top = 8
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 80
    Width = 300
    ExplicitTop = 114
    ExplicitWidth = 300
    inherited bbOK: TBitBtn
      Left = 34
      ExplicitLeft = 34
    end
    inherited bbApply: TBitBtn
      Left = 211
      ExplicitLeft = 211
    end
    inherited bbCancel: TBitBtn
      Left = 123
      ExplicitLeft = 123
    end
    inherited bbSprav: TBitBtn
      Left = 0
      Top = 40
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 40
    end
  end
  object dbcbYear: TDBLookupComboboxEh [6]
    Left = 103
    Top = 35
    Width = 191
    Height = 21
    AlwaysShowBorder = True
    AutoSize = False
    EditButtons = <>
    Flat = True
    TabOrder = 1
    Visible = True
    OnKeyValueChanged = dbcbYearKeyValueChanged
  end
end
