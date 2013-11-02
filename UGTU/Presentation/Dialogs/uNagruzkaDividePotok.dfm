inherited frmDividePotok: TfrmDividePotok
  Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
  ClientHeight = 291
  ClientWidth = 386
  OnClose = FormClose
  OnCloseQuery = nil
  OnKeyUp = nil
  ExplicitWidth = 392
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 49
    Width = 386
    Height = 201
    ExplicitTop = 49
    ExplicitWidth = 387
    ExplicitHeight = 201
  end
  inherited Panel1: TPanel
    Top = 250
    Width = 386
    ExplicitTop = 250
    ExplicitWidth = 387
    inherited bbOK: TBitBtn
      Left = 129
      ExplicitLeft = 130
    end
    inherited bbApply: TBitBtn
      Left = 297
      Visible = False
      ExplicitLeft = 298
    end
    inherited bbCancel: TBitBtn
      Left = 213
      ExplicitLeft = 214
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object rgDivideType: TRadioGroup [2]
    Left = 0
    Top = 0
    Width = 386
    Height = 49
    Align = alTop
    ItemIndex = 0
    Items.Strings = (
      #1055#1086' '#1075#1088#1091#1087#1087#1072#1084)
    TabOrder = 1
    ExplicitWidth = 387
  end
  object dbgGroups: TDBGridEh [3]
    Left = 0
    Top = 49
    Width = 386
    Height = 201
    Align = alClient
    AutoFitColWidths = True
    DataSource = dsGrups
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind]
    ParentFont = False
    ReadOnly = True
    RowHeight = 2
    RowLines = 1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 15
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ik_spec_fac'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'Cshort_spec'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 190
      end
      item
        EditButtons = <>
        FieldName = 'year_value'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'group_count'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'subgroup_count'
        Footers = <>
        Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087
      end
      item
        EditButtons = <>
        FieldName = 'budget_count'
        Footers = <>
        Title.Caption = #1041#1102#1076#1078#1077#1090
      end
      item
        EditButtons = <>
        FieldName = 'contract_count'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090
      end
      item
        EditButtons = <>
        FieldName = 'course'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'is_group'
        Footers = <>
        Visible = False
      end>
  end
  inherited actBaseDialog: TActionList
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
  object dsGrups: TDataSource
    Left = 288
    Top = 144
  end
end
