inherited frmEnterprisePick: TfrmEnterprisePick
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
  ClientHeight = 396
  ClientWidth = 286
  ExplicitWidth = 292
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 286
    Height = 355
    ExplicitWidth = 286
    ExplicitHeight = 355
  end
  inherited Panel1: TPanel
    Top = 355
    Width = 286
    ExplicitTop = 355
    ExplicitWidth = 286
    inherited bbOK: TBitBtn
      Left = 179
      Top = 6
      Width = 93
      ExplicitLeft = 179
      ExplicitTop = 6
      ExplicitWidth = 93
    end
    inherited bbApply: TBitBtn
      Left = 14
      Top = 6
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 16
      Top = 6
      Visible = False
      ExplicitLeft = 16
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 16
      Top = 6
      Visible = False
      ExplicitLeft = 16
      ExplicitTop = 6
    end
  end
  object DBGridEh1: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 286
    Height = 355
    Align = alClient
    DataSource = dmStudentData.dsEnterprise
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
  end
end
