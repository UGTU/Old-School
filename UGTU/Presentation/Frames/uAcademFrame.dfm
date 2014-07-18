inherited fmAcadem: TfmAcadem
  inherited Panel1: TPanel
    object tbAcadem: TToolBar
      Left = 2
      Top = 2
      Width = 741
      Height = 23
      ButtonWidth = 25
      Caption = 'ToolBar2'
      Images = frmMain.ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbPrint: TToolButton
        Left = 0
        Top = 0
        Action = actReportToExcel
      end
      object tbEditAcadem: TToolButton
        Left = 25
        Top = 0
        Action = actEditAcadem
      end
    end
    object dbgeAcadem: TDBGridEh
      Left = 2
      Top = 25
      Width = 741
      Height = 447
      Align = alClient
      AutoFitColWidths = True
      DataSource = dmStudentData.dsAcadem
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = ppmAcadem
      RowHeight = 16
      TabOrder = 1
      OnDblClick = actEditAcademExecute
      OnTitleClick = dbgeAcademTitleClick
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited pnlSave: TPanel
    Visible = False
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    Left = 280
    Top = 152
    object actReportToExcel: TAction
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1086#1090#1095#1077#1090' '#1074' Excel'
      Hint = #1042#1099#1074#1077#1089#1090#1080' '#1086#1090#1095#1077#1090' '#1074' Excel'
      ImageIndex = 56
      OnExecute = actReportToExcelExecute
    end
    object actEditAcadem: TAction
      Caption = 'actEditAcadem'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1072#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1086#1075#1086' '#1086#1090#1087#1091#1089#1082#1072
      ImageIndex = 29
      OnExecute = actEditAcademExecute
    end
  end
  object ppmAcadem: TPopupMenu
    Images = frmMain.ImageList1
    Left = 320
    Top = 152
    object actEditAcadem1: TMenuItem
      Action = actEditAcadem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1072#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1086#1075#1086' '#1086#1090#1087#1091#1089#1082#1072'...'
    end
  end
end
