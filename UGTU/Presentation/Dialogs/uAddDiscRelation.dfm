inherited frmAddDiscRelation: TfrmAddDiscRelation
  Caption = 'frmAddDiscRelation'
  ClientHeight = 418
  ClientWidth = 502
  ExplicitWidth = 508
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 502
    Height = 377
    ExplicitWidth = 502
    ExplicitHeight = 377
  end
  inherited Panel1: TPanel
    Top = 377
    Width = 502
    ExplicitTop = 377
    ExplicitWidth = 502
    inherited bbOK: TBitBtn
      Left = 245
      ExplicitLeft = 245
    end
    inherited bbApply: TBitBtn
      Left = 413
      ExplicitLeft = 413
    end
    inherited bbCancel: TBitBtn
      Left = 329
      ExplicitLeft = 329
    end
  end
  object dbgrDiscRelation: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 502
    Height = 377
    Align = alClient
    DataSource = dsGetDiscRelation
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
        FieldName = 'ik_disc_uch_plan_opir_na'
        Footers = <>
        Visible = False
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'InDiscRel'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1082#1083#1102#1095#1080#1090#1100
        Width = 80
        OnUpdateData = dbgrDiscRelationColumns1UpdateData
      end
      item
        EditButtons = <>
        FieldName = 'cName_disc'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072', '#1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1086#1087#1080#1088#1072#1077#1090#1089#1103' '#1088#1072#1089#1089#1084#1072#1090#1088#1080#1074#1072#1077#1084#1072#1103' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1072
        Width = 500
      end>
  end
  inherited actBaseDialog: TActionList
    Left = 201
    Top = 384
  end
  object dsGetDiscRelation: TDataSource
    Left = 144
    Top = 384
  end
end
