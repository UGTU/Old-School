inherited fmDoc: TfmDoc
  Width = 703
  Height = 613
  ExplicitWidth = 703
  ExplicitHeight = 613
  inherited Panel1: TPanel
    Width = 703
    Height = 576
    ExplicitWidth = 703
    ExplicitHeight = 576
    object dbgehMagazineDocs: TDBGridEh
      Left = 2
      Top = 49
      Width = 699
      Height = 525
      Align = alClient
      ColumnDefValues.AutoDropDown = True
      ColumnDefValues.DblClickNextVal = True
      ColumnDefValues.DropDownShowTitles = True
      ColumnDefValues.EndEllipsis = True
      ColumnDefValues.Footer.ToolTips = True
      ColumnDefValues.HighlightRequired = True
      ColumnDefValues.Title.EndEllipsis = True
      ColumnDefValues.Title.TitleButton = True
      DataSource = dmDocs.dsDocs
      DynProps = <>
      IndicatorOptions = [gioShowRowIndicatorEh]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      STFilter.Font.Charset = DEFAULT_CHARSET
      STFilter.Font.Color = clBlue
      STFilter.Font.Height = -11
      STFilter.Font.Name = 'Tahoma'
      STFilter.Font.Style = []
      STFilter.ParentFont = False
      TabOrder = 0
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          Footers = <>
          STFilter.Visible = False
          Width = 37
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NumberDoc'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_Document'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #8470
          Width = 69
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DateCreate'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          ReadOnly = True
          STFilter.Visible = False
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
          Width = 86
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'cNameDestination'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'ik_direction'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
          Width = 129
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_studGrup'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1060#1048#1054
          Width = 181
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cname_grup'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_grup'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Width = 149
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'cName_direction'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'ik_direction'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
          Width = 153
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cname_form_ed'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_form_ed'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1060#1086#1088#1084#1072'. '#1086#1073'.'
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cname_spec'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'ik_spec'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cname_fac'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_fac'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DateStartCallSpr'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.Visible = False
          Title.Caption = #1057#1087#1088'.'#1074#1099#1079#1086#1074' '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DateEndCallSpr'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.Visible = False
          Title.Caption = #1057#1087#1088'.'#1074#1099#1079#1086#1074' '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'cNameTransfer'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'Ik_Transfer'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1052#1077#1090#1086#1076' '#1087#1077#1088#1077#1076#1072#1095#1080
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'cName_type_disc'
          Footers = <>
          PopupMenu = gridColumnSelectMenu
          STFilter.KeyField = 'ik_type_disc'
          STFilter.ListSource = dmDocs.dsDocs
          Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
          Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 699
      Height = 47
      Align = alTop
      TabOrder = 1
      DesignSize = (
        699
        47)
      object Label1: TLabel
        Left = 180
        Top = 12
        Width = 4
        Height = 13
        Caption = '-'
      end
      object Label2: TLabel
        Left = 9
        Top = 12
        Width = 38
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076
      end
      object bPrint: TButton
        Left = 551
        Top = 10
        Width = 143
        Height = 31
        Align = alCustom
        Anchors = [akRight, akBottom]
        Caption = #1055#1077#1095#1072#1090#1100
        TabOrder = 0
        OnClick = bPrintClick
      end
      object dtpEnd: TDateTimePicker
        Left = 190
        Top = 10
        Width = 121
        Height = 21
        Date = 42073.571743564810000000
        Time = 42073.571743564810000000
        TabOrder = 1
        OnCloseUp = dtpEndCloseUp
      end
      object dtpStart: TDateTimePicker
        Left = 53
        Top = 10
        Width = 121
        Height = 21
        Date = 42073.571743564810000000
        Time = 42073.571743564810000000
        TabOrder = 2
        OnCloseUp = dtpStartCloseUp
      end
      object bReset: TButton
        Left = 385
        Top = 10
        Width = 160
        Height = 31
        Anchors = [akRight, akBottom]
        Caption = #1057#1073#1088#1086#1089
        TabOrder = 3
        OnClick = bResetClick
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 576
    Width = 703
    ExplicitTop = 576
    ExplicitWidth = 703
    inherited bbSave: TBitBtn
      Left = 534
      ExplicitLeft = 534
    end
    inherited bbUndo: TBitBtn
      Left = 366
      ExplicitLeft = 366
    end
  end
  object gridColumnSelectMenu: TPopupMenu
    OnPopup = gridColumnSelectMenuPopup
    Left = 576
    Top = 224
  end
  object Query1: TQuery
    DataSource = dmDocs.dsDocs
    Left = 544
    Top = 296
  end
end
