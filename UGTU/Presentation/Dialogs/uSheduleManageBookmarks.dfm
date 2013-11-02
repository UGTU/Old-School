inherited frmSheduleManageBookmarks: TfrmSheduleManageBookmarks
  Caption = #1047#1072#1082#1083#1072#1076#1082#1080' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1081
  ClientHeight = 412
  ClientWidth = 548
  ExplicitWidth = 554
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 728
    Height = 5
    Align = alNone
    Shape = bsBottomLine
    Style = bsLowered
    Visible = False
    ExplicitTop = 728
    ExplicitHeight = 5
  end
  inherited Panel1: TPanel
    Top = 377
    Width = 548
    Height = 35
    BevelOuter = bvNone
    ExplicitTop = 147
    ExplicitHeight = 35
    inherited bbOK: TBitBtn
      Left = 376
      Top = 5
      ExplicitLeft = 376
      ExplicitTop = 5
    end
    inherited bbApply: TBitBtn
      Left = 211
      Top = 36
      Visible = False
      ExplicitLeft = 94
      ExplicitTop = 36
    end
    inherited bbCancel: TBitBtn
      Left = 463
      Top = 5
      ExplicitLeft = 463
      ExplicitTop = 5
    end
    inherited bbSprav: TBitBtn
      Left = 0
      Top = 32
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 32
    end
  end
  object Panel2: TPanel [2]
    Left = 517
    Top = 0
    Width = 31
    Height = 377
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 4
      Top = 3
      Width = 27
      Height = 23
      Align = alNone
      Caption = 'ToolBar1'
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object sgBookmarks: TStringGrid [3]
    Left = 0
    Top = 0
    Width = 517
    Height = 377
    Align = alClient
    ColCount = 1
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    ExplicitLeft = 104
    ExplicitTop = 176
    ExplicitWidth = 320
    ExplicitHeight = 120
  end
end
