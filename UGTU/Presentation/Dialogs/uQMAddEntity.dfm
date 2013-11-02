inherited frmQMAddEntity: TfrmQMAddEntity
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 287
  ClientWidth = 291
  ExplicitWidth = 297
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 291
    Height = 246
    ExplicitWidth = 291
    ExplicitHeight = 246
  end
  inherited Panel1: TPanel
    Top = 246
    Width = 291
    ExplicitTop = 246
    ExplicitWidth = 291
    inherited bbOK: TBitBtn
      Left = 115
      Top = 6
      ExplicitLeft = 115
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 26
      Top = 6
      ExplicitLeft = 26
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 202
      Top = 6
      ExplicitLeft = 202
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 0
      Top = 6
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = 6
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 0
    Width = 291
    Height = 246
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1083#1103
      object dbgeFields: TDBGridEh
        Left = 0
        Top = 0
        Width = 283
        Height = 218
        Align = alClient
        DataSource = dsFields
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = actApplyExecute
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099
      ImageIndex = 1
      object dbgeEntities: TDBGridEh
        Left = 0
        Top = 0
        Width = 283
        Height = 218
        Align = alClient
        DataSource = dsEntities
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = actApplyExecute
      end
    end
  end
  object dsEntities: TDataSource
    DataSet = QMDataModule.adodsQMTables
    Left = 224
    Top = 60
  end
  object dsFields: TDataSource
    DataSet = QMDataModule.adodsQMAllFields
    Left = 224
    Top = 100
  end
end
