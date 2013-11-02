inherited frmAddDiscStrCompetence: TfrmAddDiscStrCompetence
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1091#1102' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1080' '#1076#1083#1103' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
  ClientHeight = 343
  ClientWidth = 640
  ExplicitWidth = 646
  ExplicitHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 640
    Height = 302
    ExplicitWidth = 640
    ExplicitHeight = 302
  end
  inherited Panel1: TPanel
    Top = 302
    Width = 640
    ExplicitTop = 302
    ExplicitWidth = 640
    inherited bbOK: TBitBtn
      Left = 383
      ExplicitLeft = 383
    end
    inherited bbApply: TBitBtn
      Left = 551
      ExplicitLeft = 551
    end
    inherited bbCancel: TBitBtn
      Left = 467
      ExplicitLeft = 467
    end
  end
  object dbgrCompetence: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 640
    Height = 302
    Align = alClient
    DataSource = dsGetStrCompetence
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ik_structure_competence'
        Footers = <>
        Visible = False
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'InDiscStr'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1082#1083#1102#1095#1080#1090#1100
        Width = 80
        OnEditButtonClick = dbgrCompetenceColumns1EditButtonClick
        OnUpdateData = dbgrCompetenceColumns1UpdateData
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'name_level_competence'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'description_content'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1077#1081
        Width = 900
      end>
  end
  inherited actBaseDialog: TActionList
    Left = 305
    Top = 304
  end
  object dsGetStrCompetence: TDataSource
    Left = 232
    Top = 304
  end
end
