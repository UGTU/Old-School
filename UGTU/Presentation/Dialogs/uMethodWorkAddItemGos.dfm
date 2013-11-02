inherited frmMethodWorkAddItemGos: TfrmMethodWorkAddItemGos
  Caption = 'frmMethodWorkAddItemGos'
  ClientHeight = 125
  ClientWidth = 397
  ExplicitWidth = 403
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 397
    Height = 84
    ExplicitTop = 2
    ExplicitWidth = 397
    ExplicitHeight = 84
  end
  object Label1: TLabel [1]
    Left = 9
    Top = 21
    Width = 39
    Height = 13
    Caption = #1055#1091#1085#1082#1090'  :'
  end
  object Label11: TLabel [2]
    Left = 40
    Top = 19
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
    Top = 84
    Width = 397
    ExplicitTop = 84
    ExplicitWidth = 397
    inherited bbOK: TBitBtn
      Left = 131
      ExplicitLeft = 131
    end
    inherited bbApply: TBitBtn
      Left = 308
      ExplicitLeft = 308
    end
    inherited bbCancel: TBitBtn
      Left = 220
      ExplicitLeft = 220
    end
    inherited bbSprav: TBitBtn
      Left = 96
      Top = 40
      Visible = False
      ExplicitLeft = 96
      ExplicitTop = 40
    end
  end
  object edItem: TEdit [4]
    Left = 54
    Top = 18
    Width = 337
    Height = 21
    AutoSize = False
    TabOrder = 1
    OnChange = edItemChange
  end
end
