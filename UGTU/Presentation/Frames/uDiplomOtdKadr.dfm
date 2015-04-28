inherited fmDiplomOtdKadr: TfmDiplomOtdKadr
  Width = 927
  Height = 524
  ExplicitWidth = 927
  ExplicitHeight = 524
  inherited Panel1: TPanel
    Width = 927
    Height = 487
    ExplicitWidth = 927
    ExplicitHeight = 487
    object CheckBox1: TCheckBox
      Left = 672
      Top = 32
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 656
      Top = 24
      Width = 97
      Height = 17
      Caption = 'CheckBox2'
      TabOrder = 1
    end
  end
  inherited pnlSave: TPanel
    Top = 487
    Width = 927
    ExplicitTop = 487
    ExplicitWidth = 927
    inherited bbSave: TBitBtn
      Left = 758
      Action = actSaveDipl
      ExplicitLeft = 758
    end
    inherited bbUndo: TBitBtn
      Left = 590
      Action = actCancelDiplUpd
      ExplicitLeft = 590
    end
  end
  object pcOtdKadr: TPageControl
    Left = 0
    Top = 0
    Width = 927
    Height = 487
    ActivePage = tshGak
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = pcOtdKadrChange
    OnChanging = pcOtdKadrChanging
    object tshDiplom: TTabSheet
      Caption = #1044#1080#1087#1083#1086#1084
      object dbgStudList: TDBGridEh
        Left = 0
        Top = 31
        Width = 919
        Height = 425
        Hint = #1044#1072#1085#1085#1099#1077' '#1076#1080#1087#1083#1086#1084#1072
        Align = alClient
        AutoFitColWidths = True
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        IndicatorOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnCellClick = dbgStudListCellClick
        OnMouseDown = dbgStudListMouseDown
        OnMouseMove = dbgStudListMouseMove
        OnMouseUp = dbgStudListMouseUp
        OnTitleClick = dbgStudListTitleClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'StudName'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1060#1048#1054' '#1089#1090#1091#1076#1077#1085#1090#1072
            Width = 195
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RegNumber'
            Footers = <>
            MaxWidth = 300
            Title.Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088
            Width = 150
            OnUpdateData = dbgStudListColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'VipNumber'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 132
            OnUpdateData = dbgStudListColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Dd_dipl'
            Footers = <>
            MaxWidth = 300
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
            Width = 90
            OnUpdateData = dbgStudListColumns2UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DiplSeries'
            Footers = <>
            Title.Caption = #1057#1077#1088#1080#1103' '#1076#1080#1087#1083#1086#1084#1072
            Width = 110
            OnUpdateData = dbgStudListColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DiplNumber'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1076#1080#1087#1083#1086#1084#1072
            Width = 110
            OnUpdateData = dbgStudListColumns1UpdateData
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'IsExcellent'
            Footers = <>
            Title.Caption = #1057' '#1086#1090#1083#1080#1095#1080#1077#1084
            OnUpdateData = dbgStudListColumns1UpdateData
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 919
        Height = 31
        ButtonWidth = 24
        Caption = 'ToolBar1'
        Images = frmMain.ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Action = actCreateDiploms
        end
        object ToolButton6: TToolButton
          Left = 24
          Top = 0
          Action = actUpdateDiploms
        end
        object ToolButton3: TToolButton
          Left = 48
          Top = 0
          Action = actPrintDipl
        end
        object ToolButton7: TToolButton
          Left = 72
          Top = 0
          Action = actPrintOldDipl
        end
        object ToolButton1: TToolButton
          Left = 96
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 64
          Style = tbsSeparator
        end
        object dbcmbxFac: TDBLookupComboboxEh
          Left = 104
          Top = 0
          Width = 185
          Height = 22
          Hint = #1060#1072#1082#1091#1083#1100#1090#1077#1090
          DataField = ''
          EditButtons = <>
          Flat = True
          KeyField = 'Ik_fac'
          ListField = 'Cname_fac'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnChange = dbcmbxFacChange
        end
        object dbcmbxSpec: TDBLookupComboboxEh
          Left = 289
          Top = 0
          Width = 424
          Height = 22
          Hint = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
          DataField = ''
          EditButtons = <>
          Flat = True
          KeyField = 'ik_spec_fac'
          ListField = 'Cname_spec'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = True
          OnChange = dbcmbxSpecChange
        end
        object dbcmbxGroup: TDBLookupComboboxEh
          Left = 713
          Top = 0
          Width = 136
          Height = 22
          Hint = #1043#1088#1091#1087#1087#1072
          DataField = ''
          EditButtons = <>
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = True
          OnChange = dbcmbxGroupChange
        end
      end
    end
    object tshGak: TTabSheet
      Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1080' '#1043#1040#1050
      ImageIndex = 1
      object dbgMemberGak: TDBGridEh
        Left = 0
        Top = 31
        Width = 919
        Height = 425
        Hint = #1057#1087#1080#1089#1086#1082' '#1087#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1077#1081' '#1043#1040#1050
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmOtdKadrDiplom.dsGakMember
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        IndicatorOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyDown = dbgMemberGakKeyDown
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'specName'
            Footers = <>
            Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Width = 250
            OnUpdateData = dbgMemberGakColumns0UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GakMemberName'
            Footers = <>
            MaxWidth = 1000
            Title.Caption = #1060#1048#1054' '#1087#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1103' '#1043#1040#1050
            Width = 250
            OnUpdateData = dbgMemberGakColumns0UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ik_year'
            Footers = <>
            Visible = False
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 919
        Height = 31
        ButtonWidth = 32
        Caption = 'ToolBar1'
        Images = frmMain.ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 185
          Height = 22
          Hint = #1053#1072#1074#1080#1075#1072#1090#1086#1088' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
          DataSource = dmOtdKadrDiplom.dsGakMember
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert]
          Align = alTop
          Flat = True
          Hints.Strings = (
            #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+F)'
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+P)'
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+R)'
            #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100' (Ctrl+L)'
            #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' (Ctrl+N)'
            #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
            #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084'e'#1085#1077#1085#1080#1103
            #1054#1090#1084#1077#1085#1072
            #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088)
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object ToolButton5: TToolButton
          Left = 185
          Top = 0
          Action = actDelGakMember
        end
        object dbcmbxYear: TDBLookupComboboxEh
          Left = 217
          Top = 0
          Width = 155
          Height = 22
          Hint = #1043#1086#1076' '#1087#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100#1089#1090#1074#1072' '#1074' '#1043#1040#1050
          DataField = ''
          EditButtons = <>
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnChange = dbcmbxYearChange
        end
        object ToolButton4: TToolButton
          Left = 372
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          Style = tbsSeparator
        end
        object dbcmbxGAKFac: TDBLookupComboboxEh
          Left = 380
          Top = 0
          Width = 293
          Height = 22
          Hint = #1060#1072#1082#1091#1083#1100#1090#1077#1090
          DataField = ''
          EditButtons = <>
          Flat = True
          KeyField = 'Ik_fac'
          ListField = 'Cname_fac'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = True
          OnChange = dbcmbxGAKFacChange
        end
        object cbDisplayType: TComboBox
          Left = 673
          Top = 0
          Width = 192
          Height = 22
          Hint = #1058#1080#1087' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
          Style = csOwnerDrawFixed
          TabOrder = 3
          OnChange = dbcmbxYearChange
          Items.Strings = (
            #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
            #1055#1088#1086#1092#1080#1083#1080)
        end
      end
    end
    object tsQualif: TTabSheet
      Caption = #1050#1074#1072#1083#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 2
      object dbgQualif: TDBGridEh
        Left = 0
        Top = 0
        Width = 919
        Height = 456
        Hint = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1074#1072#1083#1080#1092#1080#1082#1072#1094#1080#1080
        Align = alClient
        AutoFitColWidths = True
        DataSource = dmOtdKadrDiplom.dsQualification
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        IndicatorOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyDown = dbgMemberGakKeyDown
        OnTitleClick = dbgQualifTitleClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Cname_spec'
            Footers = <>
            Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            Width = 350
            OnUpdateData = dbgQualifColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'cName_direction'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1073#1091#1095'.'
            Width = 100
            OnUpdateData = dbgQualifColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Cname_qualif'
            Footers = <>
            MaxWidth = 1000
            Title.Caption = #1050#1074#1072#1083#1080#1092#1080#1082#1072#1094#1080#1103
            Width = 193
            OnUpdateData = dbgQualifColumns1UpdateData
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QualifShortName'
            Footers = <>
            Title.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074' '#1082#1074#1072#1083#1080#1092#1080#1082#1072#1094#1080#1080
            Width = 50
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Spec'#1057'ategory'
            Footers = <>
            Title.Caption = #1056#1072#1079#1088#1103#1076
            Width = 50
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Sh_spec'
            Footers = <>
            Title.Caption = #1064#1080#1092#1088
            Width = 50
            OnUpdateData = dbgQualifColumns1UpdateData
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object actList: TActionList
    Images = frmMain.ImageList1
    Left = 22
    Top = 146
    object actCreateDiploms: TAction
      Category = #1076#1080#1087#1083#1086#1084
      Caption = 'actCreateDiploms'
      ImageIndex = 70
      OnExecute = actCreateDiplomsExecute
      OnUpdate = actCreateDiplomsUpdate
    end
    object actPrintDipl: TAction
      Category = #1076#1080#1087#1083#1086#1084
      Caption = 'actPrintDipl'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1080#1087#1083#1086#1084#1099' '#1074' Excel'
      ImageIndex = 56
      OnExecute = actPrintDiplExecute
      OnUpdate = actPrintDiplUpdate
    end
    object actSaveDipl: TAction
      Category = #1076#1080#1087#1083#1086#1084
      ShortCut = 16467
      OnExecute = actSaveDiplExecute
      OnUpdate = actSaveDiplUpdate
    end
    object actCancelDiplUpd: TAction
      Category = #1076#1080#1087#1083#1086#1084
      Caption = 'actCancelDiplUpd'
      ShortCut = 16474
      OnExecute = actCancelDiplUpdExecute
      OnUpdate = actCancelDiplUpdUpdate
    end
    object actSaveGak: TAction
      Category = #1043#1040#1050
      Caption = 'actSaveGak'
      OnUpdate = actSaveGakUpdate
    end
    object actCancelUpdGak: TAction
      Category = #1043#1040#1050
      Caption = 'actCancelUpdGak'
      OnUpdate = actCancelUpdGakUpdate
    end
    object actDelGakMember: TAction
      Category = #1043#1040#1050
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 65
      OnExecute = actDelGakMemberExecute
      OnUpdate = actDelGakMemberUpdate
    end
    object actUpdateDiploms: TAction
      Category = #1076#1080#1087#1083#1086#1084
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 62
      OnExecute = actUpdateDiplomsExecute
    end
    object actPrintOldDipl: TAction
      Category = #1076#1080#1087#1083#1086#1084
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1080#1087#1083#1086#1084#1099' '#1074' Excel ('#1089#1090#1072#1088#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090')'
      ImageIndex = 19
      OnExecute = actPrintOldDiplExecute
    end
  end
end
