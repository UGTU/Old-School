inherited frmReviewAkadem: TfrmReviewAkadem
  Caption = 'frmReviewAkadem'
  ClientHeight = 263
  ClientWidth = 469
  ExplicitWidth = 475
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 469
    Height = 223
    ExplicitLeft = 8
    ExplicitWidth = 443
    ExplicitHeight = 268
  end
  inherited Label3: TLabel
    Left = 21
    Top = 137
    ExplicitLeft = 21
    ExplicitTop = 137
  end
  inherited Label4: TLabel
    Top = 137
    ExplicitTop = 137
  end
  inherited Label5: TLabel
    Left = 20
    Top = 179
    ExplicitLeft = 20
    ExplicitTop = 179
  end
  object Label6: TLabel [6]
    Left = 21
    Top = 96
    Width = 56
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
  end
  object Label12: TLabel [7]
    Left = 83
    Top = 96
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 223
    Width = 469
    ExplicitLeft = 0
    ExplicitTop = 223
    ExplicitWidth = 469
    inherited bbOK: TBitBtn
      Left = 294
      Enabled = False
      ParentFont = False
      ExplicitLeft = 294
    end
    inherited bbApply: TBitBtn
      Left = 46
      ExplicitLeft = 46
    end
    inherited bbCancel: TBitBtn
      Left = 381
      ExplicitLeft = 381
    end
    inherited BitBtn1: TBitBtn
      Left = 147
      Enabled = False
      ExplicitLeft = 147
    end
  end
  inherited eDest: TEdit
    Width = 281
    ExplicitWidth = 281
  end
  inherited eNum: TEdit
    Top = 134
    ExplicitTop = 134
  end
  inherited eInd: TEdit
    Left = 294
    Top = 134
    ExplicitLeft = 294
    ExplicitTop = 134
  end
  inherited dtUtv: TDateTimePicker
    Width = 281
    ExplicitWidth = 281
  end
  inherited dtGot: TDateTimePicker
    Top = 179
    Width = 281
    ExplicitTop = 179
    ExplicitWidth = 281
  end
  object cbexOsnov: TDBLookupComboboxEh [14]
    Left = 144
    Top = 93
    Width = 281
    Height = 21
    DataField = ''
    EditButtons = <>
    ListSource = dmDocs.dsOsn
    TabOrder = 6
    Visible = True
    OnChange = cbexOsnovChange
  end
  inherited actBaseDialog: TActionList
    Left = 105
    Top = 40
  end
end
