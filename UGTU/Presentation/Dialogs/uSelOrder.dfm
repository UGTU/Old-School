inherited frmOrderPick: TfrmOrderPick
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1080#1082#1072#1079#1072
  ClientHeight = 366
  ClientWidth = 314
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 314
    Height = 325
    ExplicitWidth = 314
    ExplicitHeight = 325
  end
  inherited Panel1: TPanel
    Top = 325
    Width = 314
    ExplicitTop = 325
    ExplicitWidth = 314
    inherited bbApply: TBitBtn [0]
      Left = 225
      Visible = False
      ExplicitLeft = 225
    end
    inherited bbCancel: TBitBtn [1]
      Left = 227
      Visible = False
      ExplicitLeft = 227
    end
    inherited bbSprav: TBitBtn [2]
      Visible = False
    end
    inherited bbOK: TBitBtn [3]
      Left = 207
      Top = 7
      Width = 101
      Height = 26
      ExplicitLeft = 207
      ExplicitTop = 7
      ExplicitWidth = 101
      ExplicitHeight = 26
    end
  end
  object dbgeOrder: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 314
    Height = 325
    Align = alClient
    AutoFitColWidths = True
    DataSource = dmPrikaz.dsPrikaz
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = actOKExecute
    OnTitleClick = dbgeOrderTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Nn_prikaz'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Dd_prikaz'
        Footers = <>
      end>
  end
end
