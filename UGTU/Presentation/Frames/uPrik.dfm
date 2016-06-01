inherited fmPrik: TfmPrik
  inherited Panel1: TPanel
    object dbgePrik: TDBGridEh
      Left = 2
      Top = 31
      Width = 741
      Height = 441
      Align = alClient
      AutoFitColWidths = True
      DataSource = dmPrikaz.dsPrikaz
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = ppmPrik
      TabOrder = 0
      OnDblClick = dbgePrikDblClick
      OnTitleClick = dbgePrikTitleClick
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar1: TToolBar
      Left = 2
      Top = 2
      Width = 741
      Height = 29
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 1
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = frmMain.actAddPrikaz
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = actEditPrikaz
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Action = actDelPrikaz
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 43
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Hint = #1060#1080#1083#1100#1090#1088' '#1087#1088#1080#1082#1072#1079#1086#1074
        Caption = 'ToolButton5'
        ImageIndex = 0
        Style = tbsCheck
        Visible = False
        OnClick = ToolButton5Click
      end
      object dbcbePrikFilter: TDBLookupComboboxEh
        Left = 100
        Top = 0
        Width = 148
        Height = 22
        DataField = ''
        EditButtons = <>
        KeyField = 'ik_typePrikaz'
        ListField = 'cTypePrikaz'
        TabOrder = 0
        Visible = False
      end
    end
  end
  inherited pnlSave: TPanel
    Visible = False
  end
  object ppmPrik: TPopupMenu
    Images = frmMain.ImageList1
    Left = 314
    Top = 115
    object MenuItem5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      ImageIndex = 44
      ShortCut = 16449
    end
    object MenuItem6: TMenuItem
      Action = actEditPrikaz
    end
    object MenuItem7: TMenuItem
      Action = actDelPrikaz
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    Left = 279
    Top = 114
    object actEditPrikaz: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'...'
      ImageIndex = 43
      ShortCut = 16453
      OnExecute = actEditPrikazExecute
      OnUpdate = actEditPrikazUpdate
    end
    object actDelPrikaz: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1082#1072#1079
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1082#1072#1079'('#1099')'
      ImageIndex = 42
      ShortCut = 16452
      OnExecute = actDelPrikazExecute
      OnUpdate = actDelPrikazUpdate
    end
  end
end
