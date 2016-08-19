inherited fmAbitNabor: TfmAbitNabor
  Width = 755
  Height = 468
  HelpKeyword = 'A_Nabor_frame.htm'
  ParentFont = False
  ExplicitWidth = 755
  ExplicitHeight = 468
  inherited Panel1: TPanel
    Width = 755
    Height = 431
    ExplicitWidth = 755
    ExplicitHeight = 431
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 751
      Height = 427
      ActivePage = statpage
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControl1Change
      OnChanging = PageControl1Changing
      object fac_spec: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1074'-'#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081
        ImageIndex = 2
        object dbgrdMain: TDBGridEh
          Left = 0
          Top = 0
          Width = 743
          Height = 396
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = dsMain
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnTitleClick = dbgrdMainTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object naborpage: TTabSheet
        Caption = #1053#1072#1073#1086#1088#1099
        object nnyear: TDBText
          Left = 288
          Top = 72
          Width = 65
          Height = 17
          DataField = 'nnyear'
          DataSource = DS_nabor
          Visible = False
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 25
          ButtonHeight = 23
          Images = ImageList3
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Action = actImportNabor
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton12: TToolButton
            Left = 23
            Top = 0
            Action = actAddNabor
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton14: TToolButton
            Left = 46
            Top = 0
            Action = actEditNabor
          end
          object ToolButton6: TToolButton
            Left = 69
            Top = 0
            Action = actDelNabor
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton3: TToolButton
            Left = 92
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton4: TToolButton
            Left = 100
            Top = 0
            Action = actPrintNabor
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 123
            Top = 0
            Action = actPrintDinamica
            ParentShowHint = False
            ShowHint = True
            Style = tbsCheck
          end
          object ToolButton7: TToolButton
            Left = 146
            Top = 0
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton15: TToolButton
            Left = 154
            Top = 0
            Caption = 'ToolButton15'
            ImageIndex = 3
          end
        end
        object nabor: TDBGridEh
          Left = 0
          Top = 25
          Width = 743
          Height = 371
          Hint = #1044#1072#1085#1085#1099#1077' '#1085#1072#1073#1086#1088#1072
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = DMAbiturientNabor.dsNaborList
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = actEditNaborExecute
          OnKeyDown = naborKeyDown
          OnTitleClick = naborTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fac'
              Footers = <>
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SF'
              Footers = <>
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 300
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'budj'
              Footers = <>
              Title.Caption = #1041#1102#1076#1078#1077#1090' ('#1087#1083#1072#1085' /'#1092#1072#1082#1090'/ '#1087#1077#1088#1074#1080#1095#1085#1099#1093')'
              Width = 70
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'ckp'
              Footers = <>
              Title.Caption = #1062#1050#1055' ('#1087#1083#1072#1085' /'#1092#1072#1082#1090'/ '#1087#1077#1088#1074#1080#1095#1085#1099#1093')'
              Width = 70
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'lgot'
              Footers = <>
              Title.Caption = #1054#1089#1086#1073#1086#1077' '#1087#1088#1072#1074#1086' ('#1087#1083#1072#1085' /'#1092#1072#1082#1090'/ '#1087#1077#1088#1074#1080#1095#1085#1099#1093')'
              Width = 80
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'kont'
              Footers = <>
              Title.Caption = #1050#1086#1085#1090#1088#1072#1082#1090' ('#1087#1083#1072#1085' /'#1092#1072#1082#1090'/ '#1087#1077#1088#1074#1080#1095#1085#1099#1093')'
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'lRussian'
              Footers = <>
              Title.Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
              Visible = False
              Width = 151
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object tsNaborDisc: TTabSheet
        Caption = #1042#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1099#1077' '#1101#1082#1079#1072#1084#1077#1085#1099
        ImageIndex = 4
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 31
          ButtonWidth = 24
          Caption = 'ToolBar1'
          Images = frmMain.ImageList1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 153
            Height = 22
            DataSource = DMAbiturientNabor.dsNaborDiscs
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
            TabOrder = 0
          end
          object ToolButton10: TToolButton
            Left = 153
            Top = 0
            ImageIndex = 65
            OnClick = ToolButton10Click
          end
          object ToolButton11: TToolButton
            Left = 177
            Top = 0
            Action = actCancelMinBalls
            ImageIndex = 66
          end
          object ToolButton13: TToolButton
            Left = 201
            Top = 0
            Action = actSaveMinBalls
            ImageIndex = 64
          end
        end
        object dbgNaborDiscs: TDBGridEh
          Left = 0
          Top = 31
          Width = 743
          Height = 365
          Align = alClient
          AutoFitColWidths = True
          DataSource = DMAbiturientNabor.dsNaborDiscs
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          SortLocal = True
          TabOrder = 1
          OnTitleClick = dbgNaborDiscsTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_spec'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DiscName'
              Footers = <>
              Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
              Width = 1500
              OnDropDownBoxDrawColumnCell = dbgNaborDiscsColumns2DropDownBoxDrawColumnCell
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Min_ball'
              Footers = <>
              Width = 120
              OnUpdateData = dbgNaborDiscsColumns2UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object statpage: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
        ImageIndex = 1
        object counter: TLabel
          Left = 0
          Top = 383
          Width = 743
          Height = 13
          Align = alBottom
          Visible = False
          ExplicitWidth = 3
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 24
          Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091
          Images = ImageList1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object spec: TDBComboBoxEh
            Left = 0
            Top = 0
            Width = 121
            Height = 22
            Hint = #1060#1080#1083#1100#1090#1088' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
            DynProps = <>
            EditButtons = <>
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = False
            OnChange = specChange
          end
          object fac: TDBComboBoxEh
            Left = 121
            Top = 0
            Width = 121
            Height = 22
            DynProps = <>
            EditButtons = <>
            Flat = True
            ShowHint = True
            TabOrder = 1
            Visible = False
            OnChange = facChange
          end
          object ToolButton8: TToolButton
            Left = 242
            Top = 0
            Action = actPrintStat
            DropdownMenu = ppmStatToExcel
            ImageIndex = 0
            Style = tbsDropDown
          end
          object ToolButton5: TToolButton
            Left = 284
            Top = 0
            Width = 8
            Caption = 'ToolButton5'
            ImageIndex = 1
            Style = tbsSeparator
            Visible = False
          end
        end
        object GRD_stat: TStringGrid
          Left = 0
          Top = 24
          Width = 743
          Height = 359
          Hint = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1095#1077#1090
          Align = alClient
          BorderStyle = bsNone
          ColCount = 8
          Ctl3D = False
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          ColWidths = (
            64
            71
            64
            64
            64
            64
            64
            64)
        end
        object nn_abit: TComboBox
          Left = 338
          Top = 30
          Width = 49
          Height = 21
          TabOrder = 2
          Visible = False
        end
        object s_ik: TComboBox
          Left = 336
          Top = 32
          Width = 49
          Height = 21
          TabOrder = 3
          Text = 's_ik'
          Visible = False
        end
        object f_ik: TComboBox
          Left = 336
          Top = 32
          Width = 49
          Height = 21
          TabOrder = 4
          Text = 'f_ik'
          Visible = False
        end
        object dbgrdStatistika: TDBGridEh
          Left = 0
          Top = 24
          Width = 743
          Height = 359
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = DMAbiturientNabor.dsAbitGetPostupStatistika
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 5
          TitleParams.MultiTitle = True
          OnTitleClick = dbgrdStatistikaTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RegNomer'
              Footers = <>
              Title.Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fio'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Width = 250
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'dd_pod_zayav'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cname_spec'
              Footers = <>
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'zach'
              Footers = <>
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cmedal'
              Footers = <>
              Title.Caption = #1052#1077#1076#1072#1083#1100
              Width = 80
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'post'
              Footers = <>
              Title.Caption = #1057#1090#1072#1090#1091#1089' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sum_ball'
              Footers = <>
              Title.Caption = #1057#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sredBall'
              Footers = <>
              Title.Caption = #1057#1088#1077#1076#1085#1080#1081' '#1073#1072#1083#1083
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'IsMain'
              Footers = <>
              Title.Caption = #1055#1077#1088#1074#1080#1095#1085#1086#1077
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Realy_postup'
              Footers = <>
              Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086
              Width = 80
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object tsNaborStatistik: TTabSheet
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        ImageIndex = 3
        object dbgNaborStatistik: TDBGridEh
          Left = 0
          Top = 29
          Width = 743
          Height = 367
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = DMAbiturientNabor.dsAbitNaborStatistik
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          RowHeight = 2
          RowLines = 1
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnTitleClick = dbgNaborStatistikTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CType_kat'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1082#1072#1090' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 140
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_kat_zach'
              Footers = <>
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 152
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'allCount'
              Footers = <>
              Title.Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083'-'#1074#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
              Width = 124
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'mainCount'
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1077#1088#1074#1080#1095#1085#1099#1093
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'realCount'
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1093
              Width = 124
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'currCount'
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1090#1077#1082#1091#1097#1080#1093
              Width = 121
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'zachCount'
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093
              Width = 105
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'unzachCount'
              Footers = <>
              Title.Caption = #1047#1072#1073#1088#1072#1074#1096#1080#1093' '#1079#1072#1103#1074#1083#1077#1085#1080#1077
              Width = 126
            end
            item
              Alignment = taRightJustify
              DynProps = <>
              EditButtons = <>
              FieldName = 'SredBall'
              Footers = <>
              Title.Caption = #1057#1088#1077#1076' '#1073#1072#1083#1083
            end
            item
              Alignment = taRightJustify
              DynProps = <>
              EditButtons = <>
              FieldName = 'MinBall'
              Footers = <>
              Title.Caption = #1052#1080#1085' '#1073#1072#1083#1083
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 743
          Height = 29
          Caption = 'ToolBar3'
          Images = ImageList3
          TabOrder = 1
          object ToolButton9: TToolButton
            Left = 0
            Top = 0
            Action = actStatToExcel
          end
        end
      end
      object tsExamsErrors: TTabSheet
        Caption = #1054#1096#1080#1073#1082#1080' '#1074' '#1101#1082#1079#1072#1084#1077#1085#1072#1093
        ImageIndex = 5
        object dbgExamsErrors: TDBGridEh
          Left = 0
          Top = 0
          Width = 743
          Height = 396
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DataSource = DMAbiturientNabor.dsExamsErrors
          DynProps = <>
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          RowHeight = 2
          RowLines = 1
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnTitleClick = dbgNaborStatistikTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ErrorName'
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1086#1096#1080#1073#1082#1080
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_fac'
              Footers = <>
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
              Width = 74
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_spec'
              Footers = <>
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 145
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cname_zach'
              Footers = <>
              Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NameStud'
              Footers = <>
              Title.Caption = #1060#1048#1054' '#1089#1090#1091#1076#1077#1085#1090#1072
              Width = 252
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #1089'name_disc'
              Footers = <>
              Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
              Width = 96
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object IndBalls: TTabSheet
        Caption = #1048#1085#1076'. '#1076#1086#1089#1090#1080#1078#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ParentFont = False
        object dbgIndBalls: TDBGridEh
          Left = 0
          Top = 0
          Width = 743
          Height = 396
          Align = alClient
          DataSource = DMAbiturientNabor.dsIndBall
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImeMode = imDisable
          IndicatorOptions = [gioShowRowIndicatorEh]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_fac'
              Footers = <>
              Visible = False
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_spec_fac'
              Footers = <>
              Visible = False
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_spec'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fio'
              Footers = <>
              Title.Caption = #1060#1048#1054
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cvid_doc'
              Footers = <>
              Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'cd_seria'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1057#1077#1088#1080#1103
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'np_number'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1053#1086#1084#1077#1088
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'balls'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1041#1072#1083#1083#1099
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #1089'name_disc'
              Footers = <>
              Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object Network: TTabSheet
        Caption = #1048#1085#1090#1077#1088#1085#1077#1090'-'#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1099
        ImageIndex = 7
        object dbgNetwork: TDBGridEh
          Left = 0
          Top = 0
          Width = 743
          Height = 396
          Align = alClient
          DataSource = DMAbiturientNabor.dsNetworkAbit
          DynProps = <>
          ImeMode = imDisable
          IndicatorOptions = [gioShowRowIndicatorEh]
          ReadOnly = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_fac'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              Title.Caption = #1048#1085#1089#1090#1080#1090#1091#1090
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ik_spec_fac'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_spec'
              Footers = <>
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 120
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fio'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Width = 250
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_kat_zach'
              Footers = <>
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              Width = 175
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cSotTel'
              Footers = <>
              Title.Caption = #1057#1086#1090'. '#1090#1077#1083#1077#1092#1086#1085
              Width = 300
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ctelefon'
              Footers = <>
              Title.Caption = #1058#1077#1083#1077#1092#1086#1085
              Width = 200
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'balls'
              Footers = <>
              Title.Caption = #1041#1072#1083#1083#1099
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 431
    Width = 755
    ExplicitTop = 431
    ExplicitWidth = 755
    DesignSize = (
      755
      37)
    inherited bbSave: TBitBtn
      Left = 586
      Action = actSaveMinBalls
      ExplicitLeft = 586
    end
    inherited bbUndo: TBitBtn
      Left = 405
      Action = actCancelMinBalls
      ExplicitLeft = 405
    end
  end
  object DS_nabor: TDataSource
    Left = 612
    Top = 418
  end
  object ImageList1: TImageList
    Left = 640
    Top = 32
    Bitmap = {
      494C01010400A801F00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021493900214939002149
      3900184131001841310018413100103029001030290010302900103029000828
      1800082818000828180008181800081818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084300000843000008430
      0000843000007B3000007B3000006B2800006B2800006B2800005A2000005220
      0000522000005220000042180000421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B967B00527163005271
      630052716300527163004A6963004A6963004A6963004A69630042595A004259
      5A0042595A0042595A0042595A00081818008486840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5695200845142008451
      420084514200845142007B5139007349390073493900734939006B4131006B41
      31006B4131006B4131006B413100421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042865A006B967B00EFF7EF00E7F7
      E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEE7DE00D6E7
      D600D6E7D600D6E7D60042595A000828180084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD593100A5695200FFFFFF00FFFF
      F700FFFFF700FFF7F700FFF7F700FFF7EF00FFEFEF00F7EFEF00F7EFE700F7E7
      E700F7E7E700F7E7DE006B41310052200000B5A694007B614A00735942006349
      3900634931006349310063493100634931006349310063493100634931006349
      3100634931006349310063493100634931004A8663006B967B00EFF7EF00EFF7
      EF00EFF7EF00E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEE7
      DE00D6E7D600D6E7D60042595A000828180084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD613900AD715A00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7F700FFEFEF00F7EFEF00F7EF
      E700F7E7E700F7E7E7006B41310052200000B5A69400EFDFD600EFDFD600EFCF
      BD00EFCFBD00DEBEA500DEBEA500DEBEA500DEBEA500DEBEA500DEBEA500DEB6
      9C00DEB69C00E7AE9400E7AE9400634931004A8663006B967B00EFF7EF00EFF7
      EF00EFF7EF00E7F7E700E7EFE700E7EFE700DEEFDE00639E6300213821002138
      2100213821002138210042595A000828180084868400CEB6A50000000000CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000AD613900AD715A00FFFFFF009C61
      4A008C51390084513100FFF7F7008C4921007B4921006B412100E7D7CE00F7EF
      E700F7EFE700F7E7E7006B41310052200000BDA69400FFF7EF00ADBED6000859
      CE001851AD000041940029499400ADA6A500FFE7D600F7DFCE00F7D7C600F7D7
      C600F7D7C600F7D7C600DEB69C0063493100528E630073A684004A964A001071
      310018693900296142003959520039595200006900008CC79400298642002179
      420021794200DEE7DE0042595A001030290084868400CEB6A50000000000CEB6
      A500FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000B5614200AD715A00FFFFFF00A569
      5200DE967B00CE714A00D6BEAD009C593900C6613100AD51210052381000FFEF
      EF00F7EFEF00F7EFE7006B4131005A200000BDAE9C00EFEFF7001851C60063A6
      F7004286DE000049A5001061D60000419400FFEFDE00DEBEA500BD968400BD96
      8400BD968400BD968400DEB69C0063493100528E630073A68400F7FFF7004A96
      4A006BB6730073BE7B0052A65A00429642009CD7A5004A9E5200429642000069
      000018492900DEEFDE004A6963001030290084868400CEB6A50000000000CEB6
      A500FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000BD694200B5796300FFFFFF00AD71
      5A00DEA68C00CE7952008C492100A5694A00C6715200B55931009C492100E7D7
      CE00FFEFEF00F7EFEF00734939006B280000BDAE9C00EFEFF7002969D60063A6
      F7001851AD002969D6000851B5001851AD00FFEFE700FFE7D600FFDFCE00F7DF
      CE00F7DFC600F7D7C600DEBEA500634931005A966B0084AE8C00F7FFF700F7FF
      F700DEEFDE0052A65A004296420073BE7B0052A65A0052A65A00006900005286
      5A00528E6300DEEFDE004A6963001030290084868400CEB6A50000000000CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000C6694A00B5796300FFFFFF00B579
      6300E7AE9400B5715A00CE866300AD715A00CE866B00C6613100CE714A005238
      1000E7D7CE00FFEFEF00734939006B280000C6B6A500FFFFF700DEDFDE002949
      94009C9E9400848E9C0029499400D6D7DE00FFF7EF00EFD7CE00BD968400BD96
      8400BD968400BD968400DEBEA500634931005A9E730084AE8C00F7FFF700F7FF
      F700F7FFF70018791800ADD7B5005AAE63005AAE630052A65A00ADC7AD00E7EF
      E700DEEFDE00DEEFDE004A6963001030290084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C6715200BD867300FFFFFF00B579
      6300EFB69C009C614A00DE9E8400CE795200C6715200BD613900CE7152006B38
      10009C8E7300FFF7EF00734939006B280000C6B6A500FFFFFF00636163002928
      2900B5B6B5007B797B0063616300FFFFFF00FFFFF700FFF7EF00FFEFE700FFEF
      E700FFEFDE00FFE7D600D6BEB500634931005A9E730084AE8C00FFFFFF00F7FF
      F70094C79C00BDDFC6006BB6730063AE6B005AAE6300529E5A0000690000E7EF
      E700E7EFE700DEEFDE004A6963001841310084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000CE795200BD867300FFFFFF00C686
      6B00EFBEAD009C614A00B5796300CE866B00CE866300BD694200BD967B00C669
      42007B492100FFF7F700845142007B300000CEB6AD00FFFFFF004A494A004A49
      4A00E7E7E700C6C7C6007B797300DEDFDE00FFF7F700F7C7A500F7B68C00F7AE
      8400FFA67B00F79E7300D6C7B5006349310063A6730084AE8C00FFFFFF005AAE
      6300C6E7CE007BC7840073BE7B0052865A006BB66B0073BE7B0052A65A000069
      0000CEDFCE00E7EFE700527163001841310084868400CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A5000000000000000000D6795A00BD867300FFFFFF00D68E
      7300EFBEAD00A5695200FFF7F700E7AE9400D6967300C6694A00FFFFFF00B571
      5A00CE795A00B5A69400845142007B300000CEBEAD00FFFFFF006B696B007371
      730094969C0094969C007B797300E7DFDE00FFFFFF00FFFFF700FFFFF700FFFF
      F700FFF7EF00FFF7EF00CECFC600634939006BA67B008CB694006BB673009CD7
      A5008CC794008CC79400639E6300F7FFF700CEDFCE006BB6730073BE7B0052A6
      5A0052865A00E7EFE700527163001841310084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000D6866300BD967B00D6967300EFB6
      9C00EFBEAD00E7AE9400AD715A00BD867300DE9E8400DE9E8400FFFFFF00D696
      7300D6967300D68E63008451420084300000D6BEB500FFFFFF00E7E7E7007371
      73008486840073717300C6C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700CECFC600735942006BA67B008CB694006BB673006BB6
      6B0063AE6B00639E6300E7EFE700F7FFF700F7FFF700639E6300639E63005286
      5A0052865A00E7F7E700527163002149390084868400CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A5000000000000000000D6866300BD967B00DE9E8400DE9E
      8400DE967B00D6967300D68E7300E7D7CE00CE866300CE795A00FFFFFF00C671
      5200C6715200C6694A008451420084300000D6C7B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B614A0073AE84008CB69400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7FFF700EFF7EF00EFF7
      EF00EFF7EF00EFF7EF00527163002149390084868400C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C6000000000000000000DE8E6300BD967B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C59420084300000D6C7B500D6C7B500D6BEB500CEBE
      AD00CEBEAD00CEB6AD00C6B6A500C6B6A500C6AEA500BDAE9C00BDA69400BDA6
      9400B5A69400B5A69400B5A69400B5A6940073AE840084AE8C008CB694008CB6
      94008CB694008CB6940084AE8C0084AE8C0084AE8C0073A6840073A6840073A6
      84006B967B006B967B006B967B002149390084868400C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C60000000000C6C7
      C60000000000C6C7C6000000000000000000E78E6B00BD967B00BD967B00BD96
      7B00BD967B00BD867300BD867300B5796300B5796300B5796300AD715A00AD71
      5A00AD715A00A5695200A56952008C3808000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073AE840073AE840073AE84006BA6
      7B006BA67B0063A6730063A673005A9E73005A9E7300528E6300528E63004A86
      63004A86630042865A0000000000000000008486840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E78E6B00E78E6B00DE8E6300DE8E
      6300D6866300D6866300CE795A00CE795200C6715200C6694A00C6694A00BD69
      4200B5614200B5614200AD613900AD6139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000FFFF8000FFFF80007FFF8000FFFF
      0000000300000000000000030000000000002093000000000000244B00000000
      0000260300000000000020CB0000000000000003000000000000008B00000000
      0000000300000000000000030000000000000003000000000000000300000000
      0000002B0000FFFF00037FFF0000FFFF00000000000000000000000000000000
      000000000000}
  end
  object DS_for_spisok: TDataSource
    Left = 639
    Top = 418
  end
  object DS_datestend: TDataSource
    Left = 666
    Top = 418
  end
  object ImageList2: TImageList
    Left = 896
    Top = 40
    Bitmap = {
      494C010102000400D80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B79
      7B007B797B007B797B007B797B007B797B007B797B007B797B007B797B00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000007B797B000000
      00000000000000000000000000000000000000000000000000007B797B007B79
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      840000000000000000000000000000000000000000007B797B00FFFFFF000000
      00000000000000000000000000000000000000000000000000007B797B00FFFF
      FF007B797B0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400000084000000840000008400000000000000
      8400000084000000000000000000000000007B797B007B797B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B797B00FFFF
      FF00FFFFFF007B797B0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000007B797B007B797B007B797B007B79
      7B007B797B007B797B007B797B007B797B007B797B007B797B007B797B007B79
      7B0000000000FFFFFF007B797B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B797B000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000000084000000840000000000000000007B797B007B797B007B79
      7B00FFFFFF0000000000000000000000000000000000000000007B797B00FFFF
      FF007B797B0000000000FFFFFF007B797B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000000084000000000000000000000000007B797B007B79
      7B00FFFFFF00000000000000000000000000FFFFFF00FFFFFF007B797B00FFFF
      FF00000000007B797B00000000007B797B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF007B797B0000000000000000000000000000000000BDBE
      BD00BDBEBD00FFFFFF0000000000000000000000000000000000000000007B79
      7B0000000000FFFFFF00FFFFFF007B797B007B797B007B797B007B797B000000
      000000000000000000007B797B007B797B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBEBD00BDBEBD00BDBEBD00BDBEBD00BDBE
      BD00BDBEBD00FFFFFF0000000000000000000000000000000000000000000000
      00007B797B007B797B007B797B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B797B007B797B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000007B797B007B797B007B797B007B797B007B797B007B797B007B79
      7B007B797B00FFFFFF007B797B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000007B797B00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00007B797B00FFFFFF007B797B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007B797B00FFFFFF007B797B007B797B007B797B00000000000000
      00007B797B007B797B007B797B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007B797B00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF007B797B00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF007B797B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B797B0000000000FFFFFF00FFFFFF007B797B007B797B007B79
      7B007B797B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B797B007B797B007B797B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF00F00000000E01FE00700000000
      C00FDFCB0000000080079FC50000000000030002000000000001000900000000
      800087C400000000C000C70A00000000E000E81C00000000F000F00000000000
      F801F80000000000F801F91000000000F801F83100000000F807F9C300000000
      F807FA0700000000FC7FFC7F0000000000000000000000000000000000000000
      000000000000}
  end
  object dsMain: TDataSource
    Left = 693
    Top = 418
  end
  object actList: TActionList
    Images = ImageList3
    Left = 549
    Top = 31
    object actAddNabor: TAction
      Category = 'Nabor'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1085#1072' '#1085#1072#1073#1086#1088
      ImageIndex = 3
      ShortCut = 16449
      OnExecute = actAddNaborExecute
    end
    object actEditNabor: TAction
      Tag = 1
      Category = 'Nabor'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1085#1072' '#1085#1072#1073#1086#1088
      ImageIndex = 4
      ShortCut = 16450
      OnExecute = actEditNaborExecute
    end
    object actDelNabor: TAction
      Category = 'Nabor'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1085#1072' '#1085#1072#1073#1086#1088
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = actDelNaborExecute
      OnUpdate = actDelNaborUpdate
    end
    object actPrintNabor: TAction
      Category = 'Nabor'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1074' MS Word'
      ImageIndex = 25
      OnExecute = actPrintNaborExecute
    end
    object actPrintItogiAbit: TAction
      Category = 'AbitList'
      Caption = #1055#1077#1095#1072#1090#1100' '#1080#1090#1086#1075#1086#1074
      Hint = #1042#1099#1074#1086#1076' '#1074' Excel '#1080#1090#1086#1075#1086#1074
      ImageIndex = 1
    end
    object actPrintStat: TAction
      Category = 'AbitList'
      Caption = 'C'#1087#1080#1089#1086#1082' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074' '#1074' Excel'
      OnExecute = actPrintStatExecute
    end
    object actImportNabor: TAction
      Category = 'Nabor'
      Caption = #1048#1084#1087#1086#1088#1090' '#1087#1083#1072#1085#1086#1074#1099#1093' '#1085#1072#1073#1086#1088#1086#1074' '#1080#1079' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' "'#1053#1072#1075#1088#1091#1079#1082#1072'"'
      Hint = #1048#1084#1087#1086#1088#1090' '#1087#1083#1072#1085#1086#1074#1099#1093' '#1085#1072#1073#1086#1088#1086#1074' '#1080#1079' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1099' "'#1053#1072#1075#1088#1091#1079#1082#1072'"'
      ImageIndex = 27
      OnExecute = actImportNaborExecute
      OnUpdate = actImportNaborUpdate
    end
    object actPrintDinamica: TAction
      Category = 'Nabor'
      Caption = #1044#1080#1085#1072#1084#1080#1082#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1077#1090' '#1044#1080#1085#1072#1084#1080#1082#1072' '#1087#1086#1076#1072#1095#1080' '#1079#1072#1103#1074#1083#1077#1085#1080#1081
      ImageIndex = 20
      OnExecute = actPrintDinamicaExecute
    end
    object actStatToExcel: TAction
      Category = 'NaborStatistic'
      Caption = 'actStatToExcel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1074' MS Excel'
      ImageIndex = 20
      OnExecute = actStatToExcelExecute
    end
    object actSaveMinBalls: TAction
      Category = 'MinBalls'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actSaveMinBallsExecute
      OnUpdate = actSaveMinBallsUpdate
    end
    object actCancelMinBalls: TAction
      Category = 'MinBalls'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actCancelMinBallsExecute
      OnUpdate = actSaveMinBallsUpdate
    end
    object actPrintAbitExams: TAction
      Category = 'AbitList'
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1101#1082#1079#1072#1084#1077#1085#1086#1074
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1101#1082#1079#1072#1084#1077#1085#1086#1074
      OnExecute = actPrintAbitExamsExecute
    end
    object actPrintExamStatistic: TAction
      Category = 'AbitList'
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1101#1082#1079#1072#1084#1077#1085#1072#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1087#1086' '#1101#1082#1079#1072#1084#1077#1085#1072#1084
      OnExecute = actPrintExamStatisticExecute
    end
    object actPrintProtocol: TAction
      Category = 'AbitList'
      Caption = #1042#1099#1074#1086#1076' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      ImageIndex = 20
      OnExecute = actPrintProtocolExecute
    end
    object actExportPhotos: TAction
      Category = 'AbitList'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1092#1086#1090#1086
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1092#1086#1090#1086
      ImageIndex = 4
      OnExecute = actExportPhotosExecute
    end
  end
  object ImageList3: TImageList
    Left = 612
    Top = 32
    Bitmap = {
      494C01011D003000D80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFCFCE00C6616300AD51
      5200A55152009C4952009C494A0094494A008C4142008C414200844142007B38
      39007B383900733839006B303100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE696B00F78E8C00E786
      8400AD41210042302100C6B6AD00C6BEB500CEC7BD00CECFC60052494A009C38
      31009C3831009C38310073383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6697300FF9E9C00EF86
      8400E786840073594A00423831008C796B00EFE7DE00F7E7E7008C797300A541
      3100A54139009C3831007B383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6717300FF9EA500F796
      9400EF86840073594A000000000042383100EFDFCE00EFDFD60084716300AD49
      4200AD494200A54139007B383900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6797B00FFAEAD00FF9E
      A500F796940073594A0073594A0073594A0073594A00736152007B695A00BD51
      5200B5494A00AD49420084414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE868400FFB6B500FFAE
      AD00FFA6A500F78E8C00EF868400E7868400DE797B00D6717300D6696B00C659
      5A00BD515200B5514A008C414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE8E8C00FFBEBD00FFB6
      B500CE616300C6595200BD594A00BD513900B5493100AD412900A5411800A538
      1000C6595A00BD5152008C414200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7969400FFBEBD00CE61
      6300FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDFD600E7D7C600E7CF
      BD00A5381000C6595A0094494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7969C00FFBEBD00D669
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDFD600E7D7
      C600A5411800CE6163009C494A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF9E9C00FFBEBD00DE71
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDF
      D600AD412900D67173009C495200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFA6A500FFBEBD00E786
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7
      DE00B5493100DE797B00A5515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7AEAD00FFBEBD00EF8E
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EF
      EF00BD51390063303100AD515200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7B6B500FFBEBD00FF96
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700BD594A00B5595A00B5595A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7B6B500F7B6B500F7B6
      B500F7AEAD00EFA6AD00EFA6A500E79E9C00E7969400E78E8C00DE868C00DE86
      8400D6797B00D6717300D6697300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084300000843000008430
      0000843000007B3000007B3000006B2800006B2800006B2800005A2000005220
      0000522000005220000042180000421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008486840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5695200845142008451
      420084514200845142007B5139007349390073493900734939006B4131006B41
      31006B4131006B4131006B413100421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C8E84006349310063493100634931006349310063493100634931006349
      31006349310063493100000000000000000084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD593100A5695200FFFFFF00FFFF
      F700FFFFF700FFF7F700FFF7F700FFF7EF00FFEFEF00F7EFEF00F7EFE700F7E7
      E700F7E7E700F7E7DE006B413100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C8E7B00FFFFFF00DEC7AD00D6BEAD00CEB6A500CEB6A500C6AE9C00BDA6
      9400B5A6940063493100000000000000000084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD613900AD715A00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7F700FFEFEF00F7EFEF00F7EF
      E700F7E7E700F7E7E7006B413100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C8E7B00FFFFFF00FFFFF700F7F7EF00F7EFE700EFDFD600E7D7CE00E7CF
      BD00BDA6940063493100000000000000000084868400CEB6A50000000000CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000AD613900AD715A00FFFFFF009C61
      4A008C51390084513100FFF7F7008C4921007B4921006B412100E7D7CE00F7EF
      E700F7EFE700F7E7E7006B413100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C8E8400FFFFFF00FFFFFF00FFF7F700F7EFEF00F7E7DE00EFDFD600E7D7
      C600C6AE9C0063493100000000000000000084868400CEB6A50000000000CEB6
      A500FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000B5614200AD715A00FFFFFF00A569
      5200DE967B00CE714A00D6BEAD009C593900C6613100AD51210052381000FFEF
      EF00F7EFEF00F7EFE7006B4131005A2000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5968400FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDF
      D600CEB6A50063493100000000000000000084868400CEB6A50000000000CEB6
      A500FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000BD694200B5796300FFFFFF00AD71
      5A00DEA68C00CE7952008C492100A5694A00C6715200B55931009C492100E7D7
      CE00FFEFEF00F7EFEF00734939006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5968C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700EFE7
      DE00CEB6A50063493100000000000000000084868400CEB6A50000000000CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000C6694A00B5796300FFFFFF00B579
      6300E7AE9400B5715A00CE866300AD715A00CE866B00C6613100CE714A005238
      1000E7D7CE00FFEFEF00734939006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD9E8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00F7EF
      E700D6BEAD0063493100000000000000000084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C6715200BD867300FFFFFF00B579
      6300EFB69C009C614A00DE9E8400CE795200C6715200BD613900CE7152006B38
      10009C8E7300FFF7EF00734939006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B59E9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7
      EF00DEC7AD0063493100000000000000000084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000CE795200BD867300FFFFFF00C686
      6B00EFBEAD009C614A00B5796300CE866B00CE866300BD694200BD967B00C669
      42007B492100FFF7F700845142007B3000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073C7E70084DFEF0084E7
      FF0039BEE7009CDFDE0094E7F70084D7EF00FFFFFF00FFFFFF00FFFFFF00C6AE
      9C00C6AE9C0063493100000000000000000084868400CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A5000000000000000000D6795A00BD867300FFFFFF00D68E
      7300EFBEAD00A5695200FFF7F700E7AE9400D6967300C6694A00FFFFFF00B571
      5A00CE795A00B5A69400845142007B3000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009CE7F70031B6DE007BEF
      FF005AC7E70094F7FF0029B6DE00A5EFFF00FFFFFF00FFFFFF00AD9E8C006349
      31006349310063493100000000000000000084868400CEB6A500FFFFFF00CEB6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000D6866300BD967B00D6967300EFB6
      9C00EFBEAD00E7AE9400AD715A00BD867300DE9E8400DE9E8400FFFFFF00D696
      7300D6967300D68E630084514200843000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094EFFF0094F7FF00BDFF
      FF00ADEFF700C6FFFF0094F7FF009CF7FF00FFFFFF00FFFFFF00AD9E8C00D6C7
      BD0063493100D6CFC600000000000000000084868400CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6A500CEB6
      A500CEB6A500CEB6A5000000000000000000D6866300BD967B00DE9E8400DE9E
      8400DE967B00D6967300D68E7300E7D7CE00CE866300CE795A00FFFFFF00C671
      5200C6715200C6694A0084514200843000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021AEDE0052BEE700ADEF
      F700F7FFFF00B5EFF70052BEE70031BEE700FFFFFF00FFFFFF00B5A694006349
      3100D6CFC60000000000000000000000000084868400C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C6000000000000000000DE8E6300BD967B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C594200843000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094EFFF0094F7FF00C6FF
      FF00ADE7F700C6FFFF0094F7FF008CD7E700B5A69400B5A69400B5A69400D6CF
      C6000000000000000000000000000000000084868400C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C60000000000C6C7
      C60000000000C6C7C6000000000000000000E78E6B00BD967B00BD967B00BD96
      7B00BD967B00BD867300BD867300B5796300B5796300B5796300AD715A00AD71
      5A00AD715A00A5695200A56952008C3808000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094E7F70031BEE7008CF7
      FF005AC7E70094F7FF0029B6DE008CDFF7000000000000000000000000000000
      0000000000000000000000000000000000008486840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E78E6B00E78E6B00DE8E6300DE8E
      6300D6866300D6866300CE795A00CE795200C6715200C6694A00C6694A00BD69
      4200B5614200B5614200AD613900AD6139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063C7E70084DFEF0094EF
      FF0021AEDE008CEFFF008CDFF70084CFE7000000000000000000000000000000
      0000000000000000000000000000000000000049000000490000004900000049
      0000004900000049000000510000005100000051000000510000005100000051
      0000005100000051000000510000002000000000000073616300736963006B59
      52006B594A00635142005A493900635952005A514A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021493900214939002149
      3900184131001841310018413100103029001030290010302900103029000828
      1800082818000828180008181800081818000086000000860000007900000079
      0000008600000086000000860000008600000086000000860000008600000086
      00000086000000790000008E0000003800007B716B006B6152008C716300D6A6
      8C00E7AE8C00EFA68400C69673006349390063514A006B595200000000000000
      0000000000000000000000000000000000000000000073798C00634931006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      310063493100293039000000000000000000000000006B967B00527163005271
      630052716300527163004A6963004A6963004A6963004A69630042595A004259
      5A0042595A0042595A0042595A000818180000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800007B716B008C796B00EFD7C600F7D7
      C600F7D7CE00F7CFBD00F7BEA500EFA67B006349390052514A004A494A004A49
      4A004A494A004A494A004A494A000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD00DEC7BD00D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C0063493100000000000000000042865A006B967B00EFF7EF00E7F7
      E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEE7DE00D6E7
      D600D6E7D600D6E7D60042595A000828180000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700008600000038000084716B00E7DFD600FFF7F700FFF7
      F700F7E7E700EFD7CE00EFC7B500F7BE9C00C69673005A413100A5A6A500A5A6
      A500A5A6A500A5A6A5004A494A000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE700F7EFE700F7EFE700F7EFE700E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE94006349310000000000000000004A8663006B967B00EFF7EF00EFF7
      EF00EFF7EF00E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEE7
      DE00D6E7D600D6E7D60042595A000828180000860000F7EFF70031A63100299E
      2900299629002996290029962900299629002996290021962100299629000086
      000000860000D6E7D60000790000003800008C797300F7F7F700FFFFFF00FFFF
      FF00423029005A49390084716300BDA68C00E7A6840063514A00D6D7CE00D6D7
      D600CECFCE00A5A6A5004A494A000000000000000000BDAE9C00FFF7EF00FFFF
      FF00FFFFF700F7EFEF00F7EFE700F7EFE700EFD7CE00EFD7C600EFCFC600E7C7
      B500D6AE94006349310063493100000000004A8663006B967B00EFF7EF00EFF7
      EF00EFF7EF00E7F7E700E7EFE700E7EFE700DEEFDE00639E6300213821002138
      2100213821002138210042595A000828180000860000F7EFF700008600000086
      0000008E0000008E0000008E0000008E00000086000094BE9400008600000086
      00009CA69C00F7EFF7000079000000380000A59E9400FFFFFF00FFFFFF00FFFF
      FF00393029009C968C00F7E7D600F7CFB500EFB694005A494200E7E7E700DEDF
      DE00D6D7D600ADAEAD004A494A000000000000000000C6AE9C00FFF7F700FFFF
      FF00FFFFF700F7EFEF00F7EFE700F7EFE700F7EFE700EFD7CE00EFD7CE00E7CF
      BD00D6AE9C00634931006349310000000000528E630073A684004A964A001071
      310018693900296142003959520039595200006900008CC79400298642002179
      420021794200DEE7DE0042595A001030290000860000F7EFF700FFF7FF000086
      0000008E0000008E0000008E000000860000A5C7A50000860000008E0000088E
      0800F7EFF700F7EFF7000079000000380000A59E9400F7F7EF00FFFFFF00FFFF
      FF0052493900DED7CE00F7E7D600F7CFB500E7BEA5006B595200E7E7E700E7E7
      E700DEDFDE00ADAEAD004A494A000000000000000000C6AEA500FFFFF700FFFF
      FF00FFFFF700F7EFEF00F7EFE700F7EFE700F7EFE700F7EFE700EFD7CE00EFD7
      CE00D6B6A500634939000000000000000000528E630073A68400F7FFF7004A96
      4A006BB6730073BE7B0052A65A00429642009CD7A5004A9E5200429642000069
      000018492900DEEFDE004A6963001030290000860000F7EFF700F7EFF700FFFF
      FF00088E08000086000000860000B5CFB5000086000000860000008600000086
      000042A64200F7EFF7000079000000380000ADA69C00B5AEAD00FFFFFF00FFFF
      FF00948E8400FFF7EF00F7DFD600EFCFBD0084695A00BDB6B500EFEFEF00E7E7
      E700DEDFDE00B5B6B5004A494A000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700F7EFEF00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7E7
      DE00DEC7B5007359420000000000000000005A966B0084AE8C00F7FFF700F7FF
      F700DEEFDE0052A65A004296420073BE7B0052A65A0052A65A00006900005286
      5A00528E6300DEEFDE004A6963001030290000860000F7EFF700F7EFF700F7EF
      F700F7EFF70000860000B5CFB50000860000008600007BAE7B00F7EFF700F7EF
      F700F7EFF700F7EFF70000790000003800009C969400B5A69C00BDB6B500F7F7
      F700FFF7F700FFEFEF00EFD7CE00948673007B716B00F7F7F700F7F7F700EFEF
      EF00E7E7E700B5B6B5004A494A000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700F7EFE700F7EFE700F7E7
      DE00E7CFC60084695A0063493900000000005A9E730084AE8C00F7FFF700F7FF
      F700F7FFF70018791800ADD7B5005AAE63005AAE630052A65A00ADC7AD00E7EF
      E700DEEFDE00DEEFDE004A6963001030290000860000F7EFF700F7EFF700EFEF
      EF009CC79C00B5C7B50000860000008E0000008E000000860000BDBEBD00F7EF
      F700F7EFF700F7EFF7000079000000380000000000008C867B00ADA69C00ADA6
      9C008C8673007B7163006B594A00CEC7C600F7F7F700FFFFFF00FFFFFF00F7F7
      F700EFEFEF00BDBEBD004A494A000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE700F7EFE700F7E7
      DE00E7CFC600A58E7B00FFF7EF00000000005A9E730084AE8C00FFFFFF00F7FF
      F70094C79C00BDDFC6006BB6730063AE6B005AAE6300529E5A0000690000E7EF
      E700E7EFE700DEEFDE004A6963001841310000860000F7EFF700F7EFF700ADCF
      AD00B5CFB50000860000008600000086000000860000008E000000860000A5A6
      A500F7EFF700F7EFF7000079000000380000000000000000000000000000BDB6
      AD0063594A0063514200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700EFEFEF00C6C7BD004A494A000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD00F7E7
      DE00E7CFC600AD968C00FFF7EF000000000063A6730084AE8C00FFFFFF005AAE
      6300C6E7CE007BC7840073BE7B0052865A006BB66B0073BE7B0052A65A000069
      0000CEDFCE00E7EFE700527163001841310000860000F7EFF700B5CFB500BDCF
      BD0000860000008600005AAE5A00F7EFF700299E290000860000008E00000086
      0000D6CFD600F7EFF7000079000000380000000000000000000000000000A58E
      7B008C71630084695A007B615200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDFD600C6C7C6004A494A000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00F7E7DE00A5968C0000000000000000006BA67B008CB694006BB673009CD7
      A5008CC794008CC79400639E6300F7FFF700CEDFCE006BB6730073BE7B0052A6
      5A0052865A00E7EFE700527163001841310000860000F7EFF7004AAE4A0052AE
      520052B6520073BE7300F7EFF700F7EFF700FFF7FF0063B6630052AE52003996
      390039A63900F7EFF70000790000003800000000000000000000000000000000
      0000BDBEBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A6
      A5004A494A004A494A004A494A000000000000000000D6C7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA500948673007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE0084716300FFF7EF00000000006BA67B008CB694006BB673006BB6
      6B0063AE6B00639E6300E7EFE700F7FFF700F7FFF700639E6300639E63005286
      5A0052865A00E7F7E700527163002149390000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800000000000000000000000000000000
      0000C6C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A6
      A500C6C7C6004A494A00B5B6B50000000000000000008CA6AD00D6C7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400949EA500000000000000000073AE84008CB69400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7FFF700EFF7EF00EFF7
      EF00EFF7EF00EFF7EF00527163002149390000860000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000860000003800000000000000000000000000000000
      0000C6C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAE
      AD004A494A00B5B6B50000000000000000000000000000000000000000000000
      000084B6C6008CB6C60084B6C6007BA6B5006B96A50042617300000000000000
      00000000000000000000000000000000000073AE840084AE8C008CB694008CB6
      94008CB694008CB6940084AE8C0084AE8C0084AE8C0073A6840073A6840073A6
      84006B967B006B967B006B967B00214939000086000000860000008600000086
      000000860000008600000086000000860000008600000086000000860000008E
      0000008E000000860000008600004AAE4A000000000000000000000000000000
      0000C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600BDBEBD00B5B6
      B500B5B6B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073AE840073AE840073AE84006BA6
      7B006BA67B0063A6730063A673005A9E73005A9E7300528E6300528E63004A86
      63004A86630042865A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFEFE70000000000000000000000000000000000B5A69400634931006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100634931006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000028FF000820DE000020FF000000
      00000000000000000000000000000018EF0000000000AD968C0084695A007B69
      52007B61520084715A00847163008471630073594A000000000000000000FFEF
      E7009C300000FFEFE700000000000000000000000000B5A69400EFC7AD00EFC7
      AD00EFC7AD00EFC7AD00EFC7AD00EFC7AD00EFC7AD00EFC7AD00EFC7AD00EFC7
      AD00EFC7AD006349310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002141FF000020FF000820F7004251D6000000
      000000000000000000000018DE000010AD0000000000BDA69C00EFEFEF00FFFF
      FF00FFFFFF00F7F7F700EFEFE700F7F7F7007B61520000000000FFEFE700B561
      3100DE9E5A009C300000FFEFE7000000000000000000B5A69400EFCFB500EFCF
      B500EFCFB500EFCFB500E7BEA500AD592900DEAE9C00EFCFB500EFCFB500EFCF
      B500EFCFB500634931000000000000000000B5A6940063413100634931006349
      3100634931006349310063493100634931006349310063493100634931006B49
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001841FF001030FF000020FF001038
      FF00000000000020FF000010C6000018EF0000000000BDA69C00FFFFFF000808
      0800DEDFDE00FFFFFF0008080800FFFFF7007B69520094866B00DE9E5A00FFCF
      9C00EFB67B00DE9E5A009C300000FFEFE70000000000B5A69400F7D7BD00F7CF
      C600F7CFBD00EFBEAD00AD592900C6693900A5513100DEB6A500F7CFBD00F7CF
      BD00F7CFBD00634931000000000000000000BDAE9C00FFFFFF00E7E7E700E7E7
      DE00E7DFD600E7D7CE00E7CFC600E7CFBD00E7C7B500E7C7AD00C6AE9C006B49
      39000000000000000000000000000000000073868C006B798400636973005259
      630042495200313842002128310010182100101831002951FF001841FF001028
      9400101863000020F7003951F7000000000000000000BDAE9C00FFFFFF008C8E
      8C0000000000C6C7C60008080800EFEFEF007B61520000000000FFEFE700DE9E
      5A00FFCF9C00EFB67B00DE9E5A009C30000000000000B5A69400F7DFCE00F7DF
      CE00EFC7B500AD592900E7865200DE794A00BD693900A5512900E7BEAD00F7DF
      CE00F7DFCE00634931000000000000000000C6B6A500FFFFFF00DEC7BD00D6C7
      B500D6BEAD00FFEFE700CEB6A500CEAE9C00CEAE9C00F7DFCE00C6AE9C006B49
      39000000000000000000000000000000000073869400A5DFF70073CFEF004ABE
      E70031AEDE0029AEDE0021A6D600219EC600218EBD002179BD003959FF002951
      FF001841FF002949FF00101829000000000000000000C6B6AD00FFFFFF00FFFF
      FF00949694000000000000000000F7F7FF007B6952000000000000000000FFEF
      E700DE9E5A00FFCF9C00CE714200FFEFE70000000000B5A69400F7E7D600F7D7
      C600C6714A00F79E6B00FF9E6B00E7865200D6714A00BD6139009C492900E7C7
      B500F7E7D600634931000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF0073716B005251520000000000D6C7B500CEB6A5006B49
      3900000000000000000000000000000000007B8E9400ADEFF70094E7FF0084DF
      FF0073D7FF006BD7F7005AC7F70052BEF70042B6EF0031AEEF003196EF004269
      FF003959FF002169BD00212029000000000000000000CEBEB500F7F7F7001010
      1000292829000000000000000000F7F7FF007B61520000000000000000000000
      0000F7DFE700DE9E5A00FFEFE7000000000000000000B5A69400FFEFE700EF9E
      7300E79E7300DE966B00FFAE7B00F78E5A00DE794A00A5512900AD613900B569
      4200FFEFE700634931000000000000000000CEB6A500FFFFFF00DECFC600DECF
      BD00DEC7BD00FFFFF700A59E9C00FFFFFF005296AD0008101000BDB6AD007B61
      4A00000000000000000000000000000000007B8E9C00B5EFF7009CEFFF0094E7
      FF0084DFFF0073D7FF006BCFF7005AC7F7004ABEF7004AA6F7005279FF005279
      FF004A71FF004269FF00293852000000000000000000CEBEB500FFFFFF00F7F7
      FF00F7F7F700FFFFFF00F7F7F700FFFFFF008C796B000000000000000000FFEF
      FF008C288C00F7DFE700000000000000000000000000BDA69400FFF7EF00FFF7
      EF00FFF7EF00D6865A00FFAE8400FF965A00EF8E5200B5613900FFF7EF00FFF7
      EF00FFF7EF00634931000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A59E9C008CB6C60073CFE7004A9EB500081010007B71
      6300E7D7CE0000000000000000000000000084969C00B5EFFF00ADEFFF009CEF
      FF008CE7FF0084DFFF0073D7FF006BCFF7005AA6FF005279FF005271FF004296
      F700219EE7004A79F7004A69F7004A69FF0000000000BDAE9C00BDA69C00BDA6
      9C00BDAE9C00C6B6A500BDAE9C00BDAE9C00AD968C0000000000FFEFFF00B538
      B500DE71DE008C288C00FFEFFF000000000000000000BDAE9C00FFFFFF00FFFF
      FF00FFFFFF00DE8E6B00FFBE9C00FFA67B00F7965A00B5613900FFFFFF00FFFF
      FF00FFFFFF00634931000000000000000000CEB6A500FFFFFF00DECFC600DECF
      C600DECFC600FFFFFF00C6BEB5004A9EB5008CE7EF0063BED6004A9EB5000810
      10002961730000000000000000000000000084969C00BDF7FF00ADF7F700A5EF
      FF009CE7FF008CE7FF007BDFFF005A96FF005271FF005279FF004AAEF70039B6
      EF0029A6E700088EBD004A61A5005271FF0000000000DEEFF70008799C004ACF
      F70031C7EF0029BEEF000861840094866B0094866B0094866B00DE69DE00FFAE
      FF00FF9EFF00DE71DE008C288C00FFEFFF0000000000C6AE9C00FFFFFF00FFFF
      FF00FFFFFF00E7967300FFC7A500FFBE9400FFB68C00BD714A00FFFFFF00FFFF
      FF00FFFFFF00634931000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700D6CFCE0052A6B5008CE7EF0063BED6004A9E
      B50008101000296173000000000000000000849EA500BDF7FF00B5EFFF00B5EF
      FF00A5EFFF0094E7FF008CE7FF006396FF005A86FF0063BEFF005AC7F7004ABE
      EF0031AEE700088EC60052616B0000000000DEEFF70010AEE70084E7F7006BD7
      F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEFFF00D661
      D600FFAEFF00FF9EFF00DE71DE008C288C0000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00EF9E7300E79E7300DE966B00D68E6300D6865A00FFFFFF00FFFF
      FF00FFFFFF00634931000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA6
      7B00EF9E7300E78E6300E7865A00E7966300CEAE940063A6B5008CE7EF0063BE
      D6004A9EB5000810100029516300000000008C9EA500BDF7FF00B5EFFF00B5EF
      FF00ADF7F700A5EFFF0094E7FF008CE7FF007BDFFF006BD7FF0063CFF70052C7
      F7004ABEEF00189ECE0063717B000000000000000000DEEFF70010AEE70084E7
      F7006BD7F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEF
      FF00D661D600FFAEFF00D661D600FFEFFF0000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00634931000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE
      9C00FFB69400FFB68C00FFAE8400FFA67B00F7A68400D6B69C0073AEBD008CE7
      EF006BC7DE007B86840031309400293884008CA6AD00BDF7FF00BDF7FF00BDF7
      FF00BDF7FF00B5F7FF00ADEFFF00A5EFFF0094E7FF008CDFFF007BDFFF0073D7
      FF006BCFF7005AC7F70063717B00000000000000000000000000DEEFF70010AE
      E70084E7F7006BD7F70052CFF70031C7EF0018B6EF0008618400DEEFF7000000
      0000FFEFFF00D661D600FFEFFF000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00634931000000000000000000EFAE8C00EFAE8C00EFAE8C00EFAE
      8C00EFA68400EF9E7300E7966B00E78E6300E7865200E78E5A00CE9E7B007BB6
      BD00CEBEAD007386D6005A69AD00313094008CA6AD008CA6AD008CA6AD008CA6
      AD008CA6AD008C9EAD008C9EA5008C9EA500849EA500849EA5008496A5008496
      A5008496A5008496A50073868C0000000000000000000000000000000000DEEF
      F70010AEE70084E7F7006BD7F70052CFF700109ECE00DEEFF700000000000000
      000000000000FFEFFF00000000000000000000000000EFAE8C00EFAE8C00EFA6
      8400EF9E7B00E7966B00E78E6300E7865200E7794A00E7714200E7713900E771
      3900E7713900CE61290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFAE8C007B9E
      AD005A69AD00738EDE005A71D6005A69AD008CA6AD00B5E7EF00B5EFFF00B5EF
      FF00ADEFF70094E7F7008CA6AD0084A6B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEEFF70010AEE70084E7F700109ECE00DEEFF70000000000000000000000
      00000000000000000000000000000000000000000000EFAE8C00FFC7A500FFBE
      9C00FFBE9400FFB69400FFB68C00FFAE8400FFA67B00F7A67300F79E7300F796
      6300F7966300CE61310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B79C6005A69AD005A69AD006379BD006BB6CE008CA6AD008CA6AD008CA6
      AD008CA6AD008CA6AD008CAEB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF70010AEE700DEEFF7000000000000000000000000000000
      00000000000000000000000000000000000000000000EFAE8C00EFAE8C00EFAE
      8C00EFA68400EFA67B00EF9E7300E7966B00E78E6300E7865A00E7864A00E771
      3900E7713900E771390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD592100F7E7DE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD968C0084695A007B69
      52007B61520084715A00847163008471630073594A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD592100F7E7DE0000000000000000000000000000000000000000000000
      0000FFEFE7000000000000000000000000000000000000000000EFF7F7002169
      8C00DEEFF7000000000000000000000000000000000000000000000000000000
      0000FFEFE7000000000000000000000000000000000000000000FFF7F700AD59
      2100DEA67B00A5491800EFDFD600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00EFEFEF00FFFF
      FF00FFFFFF00F7F7F700EFEFE700F7F7F7007B61520000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF7F700E7A6
      5200DEA67B00A5491800EFDFD60000000000000000000000000000000000FFEF
      E7009C300000FFEFE700000000000000000000000000000000005ABEDE005ACF
      EF0021698C00DEEFF7000000000000000000000000000000000000000000FFEF
      E7009C300000FFEFE700000000000000000000000000FFF7EF00AD592100FFEF
      C600FFE7B500DEAE8400A5411000EFDFD6000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00FFFFFF000808
      0800DEDFDE00FFFFFF0008080800FFFFF7007B69520000000000000000000000
      00000000000000000000000000000000000000000000FFF7EF00E7A65200FFEF
      C600FFE7B500DEAE8400A5411000EFDFD6000000000000000000FFEFE700B561
      3100DE9E5A009C300000FFEFE7000000000000000000000000005ABEDE006BDF
      FF0029C7EF002986A50000000000000000000000000000000000FFEFE700B561
      3100DE9E5A009C300000FFEFE7000000000000000000DE9E4A00FFFFDE00FFF7
      CE00FFE7BD00FFE7B500DEAE8400A54110000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFFFFF008C8E
      8C0000000000C6C7C60008080800EFEFEF007B61520000000000000000000000
      00000000000000000000000000000000000000000000E7AE5A00FFFFDE00FFF7
      CE00FFE7BD00FFE7B500DEAE8400A541100094866B0094866B00DE9E5A00FFCF
      9C00EFB67B00DE9E5A009C300000FFEFE70000000000C6DFE7005ABEDE006BDF
      FF002986A500DEEFEF00000000000000000094866B0094866B00DE9E5A00FFCF
      9C00EFB67B00DE9E5A009C300000FFEFE70000000000DE9E4A00FFFFE700FFFF
      D600FFF7CE00FFEFBD00FFDFB500AD5921000000000000000000000000000000
      00000000000000000000000000000000000000000000C6B6AD00FFFFFF00FFFF
      FF00949694000000000000000000F7F7FF007B69520000000000000000000000
      00000000000000000000000000000000000000000000E7AE5A00FFFFE700FFFF
      D600FFF7CE00FFEFBD00FFDFB500AD59210094866B0000000000FFEFE700DE9E
      5A00FFCF9C00EFB67B00DE9E5A009C300000D6EFF7005AAECE0031CFFF006BDF
      FF0029C7EF002986A500CEE7EF000000000094866B0000000000FFEFE700DE9E
      5A00FFCF9C00EFB67B00DE9E5A009C30000000000000FFF7EF00DE9E4A00FFFF
      E700FFF7D600EFD7AD00DE9E4A00AD794A007B614A0073594A00735142006B51
      39006B49390063493100BDAEA5000000000000000000CEBEB500F7F7F7001010
      1000292829000000000000000000F7F7FF007B61520073594A00735142006B51
      39006B49390063493100BDAEA5000000000000000000FFF7EF00E7AE5A00FFFF
      E700FFF7D600FFE7BD00E7A65200F7CFA50094866B000000000000000000FFEF
      E700DE9E5A00FFCF9C00CE714200FFEFE7007BBED60094DFEF006BDFFF005ABE
      DE005ABEDE0029C7EF002986A5000000000094866B000000000000000000FFEF
      E700DE9E5A00FFCF9C00CE714200FFEFE7000000000000000000FFF7EF00DE9E
      4A00F7F7D600DE9E4A00E7C79C00DED7CE00DECFC600D6C7BD00D6BEB500CEBE
      AD00C6B6A500C6AE9C006B4939000000000000000000CEBEB500FFFFFF00F7F7
      FF00F7F7F700FFFFFF00F7F7F700FFFFFF008C796B00D6C7BD00D6BEB500CEBE
      AD00C6B6A500C6AE9C006B493900000000000000000000000000FFF7EF00E7AE
      5200FFFFE700E7A64A00F7DFBD000000000094866B0000000000000000000000
      0000F7DFE700DE9E5A00FFEFE700000000007BBED600ADEFF700ADF7FF001869
      8C005ABEDE0031CFFF002986A5000000000094866B0000000000000000000000
      0000F7DFE700DE9E5A00FFEFE70000000000000000000000000000000000FFF7
      EF00DE9E4A00EFD7BD00EFE7DE00E7DFD600DED7CE00DECFC600D6C7BD00D6BE
      B500CEBEAD00C6B6A5006B5139000000000000000000BDAE9C00BDA69C00BDA6
      9C00BDAE9C00C6B6A500BDAE9C00BDAE9C00AD968C00DECFC600D6C7BD00D6BE
      B500CEBEAD00C6B6A5006B51390000000000000000000000000000000000DEE7
      E700DEAE5A00DEDFCE00000000000000000094866B000000000000000000FFEF
      FF008C288C00F7DFE7000000000000000000CEE7EF007BBED600B5EFF7006BDF
      FF006BDFFF003986A500B5D7E7000000000094866B000000000000000000FFEF
      FF008C288C00F7DFE70000000000000000000000000000000000000000000000
      0000B59E9400F7EFEF00EFEFE700EFE7DE007B6152006B51420063493100D6C7
      BD00D6BEB500CEBEAD0073594200000000000000000000000000000000000000
      0000B59E9400F7EFEF00EFEFE700EFE7DE007B6152006B51420063493100D6C7
      BD00D6BEB500CEBEAD0073594200000000000000000000000000DEEFF7000879
      9C0018B6EF0008799C00DEEFF7000000000094866B0000000000FFEFFF00B538
      B500DE71DE008C288C00FFEFFF000000000000000000CEE7EF007BBED60073AE
      CE005AAECE0063AECE00DEEFF7000000000094866B0000000000FFEFFF00B538
      B500DE71DE008C288C00FFEFFF00000000000000000000000000000000000000
      0000BDA69400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DFD600DED7CE00DECF
      C600D6C7BD00D6BEB5007B614A00000000000000000000000000000000000000
      0000BDA69400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DFD600DED7CE00DECF
      C600D6C7BD00D6BEB5007B614A000000000000000000DEEFF70008799C004ACF
      F70031C7EF0029BEEF000861840094866B0094866B0094866B00DE69DE00FFAE
      FF00FF9EFF00DE71DE008C288C00FFEFFF0000000000DEEFF70008799C004ACF
      F70031C7EF0029BEEF000861840094866B0094866B0094866B00DE69DE00FFAE
      FF00FF9EFF00DE71DE008C288C00FFEFFF000000000000000000000000000000
      0000C6AE9C00FFFFFF00FFF7F700F7EFEF007B6152006B51390063493100DED7
      CE00DECFC600D6C7BD0084695200000000000000000000000000000000000000
      0000C6AE9C00FFFFFF00FFF7F700F7EFEF007B6152006B51390063493100DED7
      CE00DECFC600D6C7BD008469520000000000DEEFF70010AEE70084E7F7006BD7
      F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEFFF00D661
      D600FFAEFF00FF9EFF00DE71DE008C288C00DEEFF70010AEE70084E7F7006BD7
      F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEFFF00D661
      D600FFAEFF00FF9EFF00DE71DE008C288C000000000000000000000000000000
      0000C6AEA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DF
      D600DED7CE00DECFC6008C715A00000000000000000000000000000000000000
      0000C6AEA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DF
      D600DED7CE00DECFC6008C715A000000000000000000DEEFF70010AEE70084E7
      F7006BD7F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEF
      FF00D661D600FFAEFF00D661D600FFEFFF0000000000DEEFF70010AEE70084E7
      F7006BD7F70052CFF70031C7F70018B6EF0008618400DEEFF70000000000FFEF
      FF00D661D600FFAEFF00D661D600FFEFFF000000000000000000000000000000
      0000CEB6AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DFD600DED7CE008C716300000000000000000000000000000000000000
      0000CEB6AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DFD600DED7CE008C716300000000000000000000000000DEEFF70010AE
      E70084E7F7006BD7F70052CFF70031C7EF0018B6EF0008618400DEEFF7000000
      0000FFEFFF00D661D600FFEFFF00000000000000000000000000DEEFF70010AE
      E70084E7F7006BD7F70052CFF70031C7EF0018B6EF0008618400DEEFF7000000
      0000FFEFFF00D661D600FFEFFF00000000000000000000000000000000000000
      0000E7DFDE00CEB6AD00C6AEA500BDAE9C00BDA69400B59E8C00B59E8C00AD96
      8400AD8E7B00A58E7B00CEBEB500000000000000000000000000000000000000
      0000E7DFDE00CEB6AD00C6AEA500BDAE9C00BDA69400B59E8C00B59E8C00AD96
      8400AD8E7B00A58E7B00CEBEB50000000000000000000000000000000000DEEF
      F70010AEE70084E7F7006BD7F70052CFF700109ECE00DEEFF700000000000000
      000000000000FFEFFF000000000000000000000000000000000000000000DEEF
      F70010AEE70084E7F7006BD7F70052CFF700109ECE00DEEFF700000000000000
      000000000000FFEFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEEFF70010AEE70084E7F700109ECE00DEEFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEEFF70010AEE70084E7F700109ECE00DEEFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF70010AEE700DEEFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEEFF70010AEE700DEEFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFF7
      F70021698C00DEEFF70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073798C00634931006349
      3900634931006B49390073614A00000000001030B50018308C0018308C002130
      840018206B00081039000000000000000000BDA69C0063493100634931006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100634931006349310063493100634931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005ABE
      DE005ACFEF0021698C00DEEFF700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD00DEC7BD005A5163000830BD002149CE000830C6000830
      B50010289C0010206B001010390000000000BDAE9C00FFF7F700FFF7EF00AD8E
      7300FFEFE700EFC7B500EFC7AD00A5796300F7DFCE00EFB69400EFB68C009C69
      4A00F7CFB500F7AE8400F7AE84006349310000000000B5B6B5006B696B009C9E
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A6A5009496940000000000000000000000000000000000000000005ABE
      DE006BDFFF0029C7EF002986A500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE700F7EFEF00F7EFE7001041DE003961E7002959E7000030DE000030
      D6000830BD0010289C0018286B0000000000C6AE9C00FFFFF700FFF7F700B596
      7B00FFEFE700FFEFE700EFC7B500A5796300FFDFCE00F7DFCE00EFB694009C69
      5200F7D7BD00F7CFB500F7AE8400634931009479EF002900DE003928A5006361
      6300CECFCE000000000000000000000000000000000000000000D6D7D6006351
      B5002900DE00A5A6A50000000000000000000000000000000000C6DFE7005ABE
      DE006BDFFF002986A500DEEFEF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF003161EF00F7F7FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0018308C0000000000C6AEA500FFFFFF00FFFFF700B596
      8400B5967B00B58E7300AD8E7300AD866B00A5796300A5796300A5715A009C71
      52009C6952009C694A0094614A0063493100BDAEF7002900DE003108DE005249
      6B007B797B00DEDFDE00000000000000000000000000CEC7D6004228C6002900
      DE007B69CE0000000000000000000000000000000000D6EFF7005AAECE0031CF
      FF006BDFFF0029C7EF002986A500CEE7EF000000000000000000000000000000
      00000000000000000000000000000000000000000000C6AE9C00FFF7F700FFFF
      F700FFFFF700FFFFF700F7EFE7003169F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0018308C0000000000CEB6A500FFFFFF00FFFFFF00BD9E
      8400FFF7F700E7D7C600E7CFC600AD8E7300FFE7DE00EFC7AD00EFBEA500A571
      5A00F7D7C600EFB68C00EFB68C0063493100000000008471EF002900DE003918
      D6005A595A0094969400E7E7E70000000000CEC7D6003918CE002900DE00A59E
      C60000000000000000000000000000000000000000007BBED60094DFEF006BDF
      FF005ABEDE005ABEDE0029C7EF002986A5007B614A0073594A00735142006B51
      39006B49390063493100BDAEA5000000000000000000C6AEA500FFFFF700FFFF
      F700FFFFF700FFFFF700F7EFE7002961FF00849EF7005A86EF003961E7002151
      E7000030D6000830BD0018389C0000000000CEB6A500FFFFFF00FFFFFF00BD9E
      8C00FFFFF700FFF7F700E7D7C600AD8E7300FFEFE700FFE7DE00EFC7AD00A579
      6300F7DFCE00F7D7C600EFB68C006349310000000000000000007B61EF002900
      DE005238C6006361630094969400B5B6C6003918CE002900DE00A59EC6000000
      000000000000000000000000000000000000000000007BBED600ADEFF700ADF7
      FF0018698C005ABEDE0031CFFF002986A500DECFC600D6C7BD00D6BEB500CEBE
      AD00C6B6A500C6AE9C006B4939000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00F7EFEF00F7EFE700D6DFF7003161F70094AEF7005A86EF005271
      E7002149D6001838B5001841C60000000000CEB6AD00FFFFFF00FFFFFF00BDA6
      9400BD9E8C00BD9E8400B5968400B5967B00AD8E7300AD867300AD866B00A579
      6300A5796300A5715A009C715200634931000000000000000000000000007B61
      EF002900DE005230C60052515A003110C6002900D600A59EC600000000000000
      00000000000000000000000000000000000000000000CEE7EF007BBED600B5EF
      F7006BDFFF006BDFFF003986A500ADCFD600DED7CE00DECFC600D6C7BD00D6BE
      B500CEBEAD00C6B6A5006B5139000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00FFFFFF00D6D7F7003161F7003161EF003159
      DE001841C6001841C6000000000000000000D6BEAD00FFFFFF00FFFFFF00BDA6
      9400FFFFFF00DEDFDE00DEDFD600B5968400FFF7EF00E7CFC600E7CFB500AD86
      6B00FFE7D600EFBEA500EFBE9C00634931000000000000000000000000000000
      00007B59EF002900DE002900D6002900D6006B618C00DEDFDE00000000000000
      0000000000000000000000000000000000000000000000000000CEE7EF007BBE
      D60073AECE005AAECE00A5CFDE00EFE7DE007B6152006B51420063493100D6C7
      BD00D6BEB500CEBEAD00735942000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00F7EFE700F7EFE700EFE7E700EFDF
      D600E7D7CE00A58E7B00FFF7EF0000000000D6C7B500FFFFFF00FFFFFF00C6AE
      9C00FFFFFF00FFFFFF00DEDFDE00BD9E8400FFF7F700FFF7EF00E7CFC600AD86
      7300FFE7DE00FFE7D600EFBEA500634931000000000000000000000000000000
      0000CEC7D6002908DE002900DE004228C6007371730094969400D6D7D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDA69400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DFD600DED7CE00DECF
      C600D6C7BD00D6BEB5007B614A000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD00F7E7
      DE00E7D7CE00AD968C00FFF7EF0000000000DEC7BD00BD9E8C00B5967B00C6AE
      9C00C6AE9400C6A69400BDA69400BD9E8C00BD9E8400B5968400B5967B00AD8E
      7300AD867300AD866B00A579630063493100000000000000000000000000CEC7
      D6003918CE002900DE007359CE003108E7005A38D6007B798C0084868400C6C7
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6AE9C00FFFFFF00FFF7F700F7EFEF007B6152006B51390063493100DED7
      CE00DECFC600D6C7BD00846952000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C000000000000000000DECFBD00FFFFFF00FFFFFF00BD9E
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7
      EF00FFEFE700FFEFE700FFE7DE00634931000000000000000000CEC7D6003918
      CE002900DE008C86BD0000000000000000004218E7004A28DE007B719C007B79
      7B00B5B6B5000000000000000000000000000000000000000000000000000000
      0000C6AEA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DF
      D600DED7CE00DECFC6008C715A000000000000000000D6C7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA500948673007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE0084716300FFF7EF0000000000DECFBD00FFFFFF00FFFFFF00BD9E
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      F700FFF7EF00FFEFE700FFEFE7006349310000000000BDBEC6003910CE002900
      DE007361B500000000000000000000000000000000005A41E7003108DE007B69
      B5008C8E8C00DEDFDE0000000000000000000000000000000000000000000000
      0000CEB6AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DFD600DED7CE008C71630000000000000000008CA6AD00D6C7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400949EA5000000000000000000DECFC600DECFC600DECFBD00DECF
      BD00DEC7BD00D6C7B500D6C7B500D6BEB500CEBEAD00CEBEAD00C6B6A500C6B6
      A500C6AE9C00C6AE9C00BDAE9C00BDA69400C6BEEF003910CE002900DE005A41
      B5000000000000000000000000000000000000000000000000009479EF002900
      DE00CECFE7000000000000000000000000000000000000000000000000000000
      0000E7DFDE00CEB6AD00C6AEA500BDAE9C00BDA69400B59E8C00B59E8C00AD96
      8400AD8E7B00A58E7B00CEBEB500000000000000000000000000000000000000
      000084B6C6008CB6C60084B6C6007BA6B5006B96A50042617300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004218E7002900DE004228C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003110E7004A28E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5A694006341310063493100634931006349
      31006349310063493100634931006B4939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDA6940063493100634931006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDAE9C00FFFFFF00EFEFEF00EFE7E700EFDF
      D600E7D7CE00E7D7C600D6C7B5006B5139000000000073798C00634931006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      3100634931002930390000000000000000000000000073798C00634931006349
      3900634931006B49390073614A006B5139006349310063493100634931006349
      310063493100293039000000000000000000BDA69400FFFFEF00FFF7E700F7EF
      DE00F7DFCE00EFD7BD00EFCFB500E7BEA500E7B69C00DEAE9400DEA68C006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6B6A500FFFFFF00DECFC600DECFBD00FFFF
      F700D6BEAD00D6BEAD00DED7C6006B51390000000000BDA69C00F7EFEF00E7DF
      D600E7CFC600DEC7BD008C8EB500D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C0063493100000000000000000000000000BDA69C00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00DEC7BD00D6BEB500DEB6A500D6B6A500D6AE9C00D6AE
      9400CE9E8C00634931000000000000000000BDA69C00FFFFF700BDA69C00B5A6
      9C00F7EFDE00B59E9400B59E8C00B59E8C00B59E8C00B59E8C00DEAE94006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00E7D7CE006B51390000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE7003151BD001038B5006B79C600E7D7CE00EFD7C600E7CFBD00E7C7
      B500D6AE940063493100000000000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFE700F7EFEF0073716B005251520000000000D6C7B500CEB6A500E7C7
      B500D6AE9400634931000000000000000000BDAE9C00FFFFF700FFFFF700FFFF
      EF00FFF7E700F7EFDE00F7DFCE00EFD7C600EFCFB500E7BEA500E7B69C006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00DECFC600DECFC600FFFF
      FF00DEC7BD00DEC7BD00E7DFD6006B51390000000000BDAE9C00FFF7EF00D6D7
      E7002949C6002951EF002149E7001038B5009C96C600EFD7C600EFCFC600E7C7
      B500D6AE940063493100634931000000000000000000BDAE9C00FFF7EF00F7EF
      EF00F7EFEF00F7EFEF00A59E9C00FFFFFF005296AD0008101000BDB6AD00E7C7
      B500D6AE9400634931006349310000000000C6AE9C00FFFFF700B5A69C00B5A6
      9C00FFFFEF00B59E9400B59E8C00B59E8C00B59E8C00B59E8C00E7BEA5006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700F7EFDE006B51390000000000C6AE9C00FFF7F7001841
      BD002951F7006386FF005271F7003961EF002138B500D6C7C600EFD7CE00E7CF
      BD00D6AE9C0063493100634931000000000000000000C6AE9C00FFF7F700FFFF
      F700FFFFF700FFFFF700A59E9C008CB6C60073CFE7004A9EB50008101000E7CF
      BD00D6AE9C00634931006349310000000000C6AE9C00FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFEF00FFF7E700F7EFDE00F7DFCE00EFD7C600EFCFB5006349
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA67B00E78E
      6300E7865200E7794200E7713900CE61310000000000C6AEA500FFFFF70084A6
      FF007B96FF007B8EF700D6D7E7007B96F7004261E7003951AD00EFD7CE00EFD7
      CE00D6B6A50063493900000000000000000000000000C6AEA500FFFFF700FFFF
      F700FFFFF700FFFFF700C6BEB5004A9EB5008CE7EF0063BED6004A9EB5000810
      1000D6AE9C00634939000000000000000000C6B6A500FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFEF00C6C7C60042597300F7DFCE00EFD7C6006349
      3100000000000000000000000000397142000000000000000000000000000000
      0000000000000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE9C00FFB6
      8C00FFAE8400FFA67B00F7966B00D669390000000000CEB6A500FFFFFF00E7E7
      FF00BDC7F700F7EFEF00F7EFE700E7DFE7007B96F7002951DE005261AD00EFDF
      D600DEC7B50073594200000000000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFFF00F7EFEF00FFFFF700D6CFCE0052A6B5008CE7EF0063BED6004A9E
      B50008101000634939000000000000000000C6B6A500FFFFFF00E7EFEF005A71
      8400DEE7E700FFFFF700C6CFCE004A61730029AED60021304200ADA69C006349
      310000000000000000003971420042864A000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFAE8C00EF9E
      7300E7966B00E78E6300E7714200E771390000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00F7EFE700EFE7E700738EF7002149D6008C96
      BD00E7CFC60084695A00634939000000000000000000CEB6A500FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7EFEF00F7EFEF00CEAE940063A6B5008CE7EF0063BE
      D6004A9EB500081010002951630000000000CEB6A500FFFFFF008CA6AD0084D7
      E7004A617300ADBEBD004A61730063C7DE004A616B0029B6EF00102031001028
      39001028310010202900397142004AA663000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700F7EFEF00EFE7E700F7EFE7007B96EF002149
      D6009C96BD00A58E7B00FFF7EF000000000000000000CEBEAD00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700F7EFEF00F7EFEF00F7EFEF00D6B69C0073AEBD008CE7
      EF006BC7DE007B8684003130940029388400CEB6A500FFFFFF00E7EFEF008CA6
      AD0084E7F7004A6173007BCFE7004A616B0063D7F7004259730031B6DE00189E
      CE00188EB50018516B004A865A004AAE6300109EC600189EB500189EB500189E
      B500189EB500085163000830390008384A000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD008CA6
      EF002949D600AD968C00FFF7EF000000000000000000D6BEAD00FFFFFF00FFFF
      FF007B9EAD00638E94006386940063798C005A7184006B868C0094A6AD007BB6
      BD00CEBEAD007386D6005A69AD0031309400CEB6A500CEB6A500CEB6A500BDB6
      A5008CA6AD0084E7F7004A61730084E7F7003959730063D7F70052CFEF0039BE
      EF0021B6E70018A6D60063966B0052B66B0039AED600A5F7FF008CEFFF0084F7
      FF0063EFFF0042DFF70031BED600104152000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB5006B868C00F7E7
      DE00E7D7CE00A5968C00000000000000000000000000D6BEAD00FFFFFF00FFFF
      FF0084AEB50094D7E70094E7F7007BD7EF0063C7DE00529EB500F7EFEF007B9E
      AD005A69AD00738EDE005A71D6005A69AD000000000000000000000000000000
      00008CA6AD008CA6AD0084E7F7004259730084E7F70073DFF70063D7F70052CF
      EF0039BEEF0029B6EF0073A684005AC77B005AB6D600D6FFFF00CEFFFF00ADF7
      FF007BF7FF005AE7F70042D7EF0018697B000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA500948673007BC7D6004A697B00F7EFEF00EFE7
      DE00F7E7DE0084716300FFF7EF000000000000000000D6C7B500FFFFFF00FFFF
      FF00F7FFFF0084A6B500A5AEA500948673007BC7D6004A697B00F7EFEF00F7EF
      EF006B79C6005A69AD005A69AD006379BD000000000000000000000000000000
      0000000000008CA6AD008CA6AD0084E7F70084E7F70084E7F70073DFF70063D7
      F7005AB6CE007B8E9400ADC7A50094D79C0052BEDE006BC7DE0042C7CE0042C7
      CE0042C7CE0029A6B5001086940010718C000000000000000000000000000000
      000000000000000000000000000000000000000000008CA6AD00D6C7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400949EA5000000000000000000000000008CA6AD00D6C7B500D6BE
      AD00D6BEAD0073A6B500A5E7EF009CE7F7008CD7E70042617300C6AE9C00BDAE
      9C00BDA69400949EA50000000000000000000000000000000000000000000000
      000000000000000000008CA6AD008CA6AD008CA6AD008C9EA5008496A5007B96
      9C007B8E94007B8E94009CBE9C00ADC7A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084B6C6008CB6C60084B6C6007BA6B5006B96A50042617300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084B6C6008CB6C60084B6C6007BA6B5006B96A50042617300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5A694006341310063493100634931006349
      31006349310063493100634931006B4939000000000000000000B5A694006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100634931000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7864A009C5129008C4121008C41
      21008C4121000000000000000000000000000000000000000000B5A694006349
      3100634931006349310063493100634931006349310063493100634931006349
      3100634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDAE9C00FFFFFF00EFEFEF00EFE7E700EFDF
      D600E7D7CE00E7D7C600D6C7B5006B5139000000000000000000B5A69400FFFF
      FF00B5A69400B5A69400B5A69400B5A69400B5A69400B5A69400B5A69400B5A6
      940063493100000000000000000000000000B5A6940063493100634931006349
      310063493100634931007B695A0094867300E7864A00E78E5A00D6795200BD69
      4200944121000000000000000000000000000000000000000000B5A69400FFFF
      FF00B5A69400B5A69400B5A69400B5A69400B5A69400B5A69400B5A69400B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6B6A500FFFFFF00DECFC600DECFBD00FFFF
      F700D6BEAD00D6BEAD00DED7C6006B5139000000000000000000B5A69400FFFF
      FF00FFFFFF00FFFFFF00F7F7EF00F7E7E700EFDFD600E7D7CE00E7CFBD00B5A6
      940063493100000000000000000000000000BDA69400FFFFFF00B5A69400B5A6
      9400B5A69400B5A69400B5A69400CEBEAD00E7864A00F7A67B00E78E5A00D679
      52009C4921000000000000000000000000000000000000000000B5A69400FFFF
      FF00FFFFFF00FFFFFF00F7F7EF00F7E7E700EFDFD600E7D7CE00E7CFBD00B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7EF00E7D7CE006B5139000000000000000000B5A69400FFFF
      FF00DEDFDE009C9E9C00EFEFEF00F7EFEF00DED7CE00DECFC600DEC7BD00C6AE
      A50063493100000000000000000000000000BDA69C00FFFFFF00FFFFFF00FFFF
      FF00F7F7EF00F7E7E700EFDFD600E7D7CE00E7864A00FFBE9C00F7966300E78E
      5A00A54921000000000000000000000000000000000000000000B5A69400FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7DE00EFDFD600E7CFC600B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00DECFC600DECFC600FFFF
      FF00DEC7BD00DEC7BD00E7DFD6006B5139000000000000000000B5A69400FFFF
      FF0063616300FFFFFF0094969400FFF7F700A59E94009C968400948E8400CEBE
      AD0063493900000000000000000000000000C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700F7EFEF00E79E7300D6713900CE613100FFB68C00F7966300F796
      6300AD5129009C49210094492100000000000000000000000000B5A69400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700EFDFDE00E7D7CE00B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700F7EFDE006B5139000000000000000000BDA69400FFFF
      FF00CECFCE006B696B00DEDFDE00FFFFF700F7EFEF00F7E7DE00EFDFD600BDAE
      9C0063493900000000000000000000000000C6AE9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700EFD7C600E79E7300FFBEA500FFB68C00FF9E6B00F78E
      5A00D67142009C49290094492100000000000000000000000000BDA69400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7EFEF00F7E7DE00EFDFD600B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFAE8C00EFAE8C00EFAE8C00EFA67B00E78E
      6300E7865200E7794200E7713900CE6131000000000000000000BDAE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700EFE7DE00B5A6
      940063493100000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700F7EFEF00EFD7C600EF9E7300FFC7A500FFB68C00E786
      5A00A55129009449210000000000000000000000000000000000BDAE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFE700EFE7DE00B5A6
      9400634931000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFAE8C00FFC7A500FFBE9C00FFBE9C00FFB6
      8C00FFAE8400FFA67B00F7966B00D66939000000000000000000C6AE9C00FFFF
      FF00B5AEAD0042383900C6BEB500FFFFFF00E7DFDE00DED7D600DED7CE00BDAE
      9C0063493100000000000000000000000000CEB6A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700F7EFE700EFCFBD00EF9E7300FFC7A500A551
      3100944921000000000000000000000000000000000000000000C6AE9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00F7E7E700B5A6
      940063493100000000000000000000000000000000000000000010718C001059
      6B0010495A001041520000000000EFAE8C00EFAE8C00EFAE8C00EFAE8C00EF9E
      7300E7966B00E78E6300E7714200E77139000000000000000000CEB6A500FFFF
      FF0021202100CECFCE0063515200FFFFFF00AD9E9400A59E9400ADA69400C6B6
      AD0063493100000000000000000000000000CEBEAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7EF00F7E7E700E7C7B500E7966B009449
      2100000000000000000000000000000000000000000000000000CEB6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00B5A6
      9400634931000000000000000000000000000000000000000000218E9C004AD7
      EF0021BED6000820290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB6A500FFFF
      FF00ADA69C0029202100B5B6AD00FFFFFF00FFFFFF00FFFFFF00CEBEB500C6B6
      AD0063493100000000000000000000000000D6BEAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00D6BEAD00AD9E94000000
      0000000000000000000000000000000000000000000000000000CEB6A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A69400B5A6
      940063493100000000000000000000000000109EC600189EB5001896AD0063E7
      F70039D7EF00085163000830390008384A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BEAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A69400634931006349
      310063493100000000000000000000000000D6C7B500F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700BDA694007B614A000000
      0000000000000000000000000000000000000000000000000000D6BEAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A69400634931006349
      31006349310000000000000000000000000039AED600A5F7FF008CEFFF0084F7
      FF0063EFFF0042DFF70031BED600104152000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6BEAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA69400D6C7BD006349
      3100CEB6A500000000000000000000000000DEC7B500BDAE9C00BDA69400B59E
      8C00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A69400634931000000
      0000000000000000000000000000000000000000000000000000D6BEAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA69400D6C7BD006349
      3100CEB6A5000000000000000000000000005AB6D600D6FFFF00CEFFFF00ADF7
      FF007BF7FF005AE7F70042D7EF0018697B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEC7B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AE9C0063493100CEB6
      A50000000000000000000000000000000000D6C7B500D6C7B500F7EFE700BDA6
      9400F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A69400634931000000
      0000000000000000000000000000000000000000000000000000DEC7B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AE9C0063493100CEB6
      A5000000000000000000000000000000000052BEDE006BC7DE0042C7CE00C6FF
      FF0084EFFF0029A6B5001086940010718C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEC7B500DEC7
      B500DEC7B500DEC7B500DEC7B500D6BEAD00CEBEAD00CEB6A500CEB6A5000000
      00000000000000000000000000000000000000000000D6C7B500D6C7B500C6AE
      9C00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00634931000000
      0000000000000000000000000000000000000000000000000000DEC7B500DEC7
      B500DEC7B500DEC7B500DEC7B500D6BEAD00CEBEAD00CEB6A500CEB6A5000000
      000000000000000000000000000000000000000000000000000063BEDE00CEFF
      FF00ADF7FF0029AEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6C7B500DEC7
      B500D6BEAD00D6BEAD00CEB6A500C6AEA500BDAE9C00BDA69400B5A694000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063BEE7005ABE
      DE0039AED60021A6CE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000FFFF000000000000FFFF8000FFFFFFFF7FFF8000FFFFF003
      00030000FFFFF00300030000FFFFF00320930000FFFFF003244B0000FFFFF003
      26030000FFFFF00320CB0000FFFFF00300030000FFFFF003008B0000FFFF8003
      00030000FFFF800300030000FFFF800300030000FFFF800700030000FFFF800F
      002B0000FFFF80FF7FFF0000FFFF80FF0000807FFFFF80000000003F80038000
      0000000180030000000000018003000000000001800100000000000180010000
      0000000180030000000000018003000000000001800100000000800180010000
      0000E001800100000000E001800300000000F001800100000000F00180030000
      0000F003F03F00000000F007FFFF0003FFF78003FFFFFF1E80638003FFFFFE1C
      80418003000FFF0880008003000F000180408003000F000180608003000F0001
      80718003000F0001806380030007000080418003000700008000800300030001
      00408003000100018020800300000001C011800300000001E03B8003FFC000FF
      F07F8003FFF001FFF8FF8003FFFFFFFFF3FF807FF3F7C7F7C1FF807FC1E3C3E3
      80FF807F80C1C3C180FF807F8000830080FF807F804001408001800180600160
      C0018001C1710171E0018001E3630163F001F001C1418141F001F00180008000
      F001F00100400040F001F00180208020F001F001C011C011F001F001E03BE03B
      FFFFFFFFF07FF07FFFFFFFFFF8FFF8FFFFFFFFFFFFFFE3FF81030000FFFFE1FF
      800100008FE3E1FF8001000007C3C1FF80010000038780FF80010000810F8001
      80010000C01F800180010000E03F800180030000F03FC00180010000F01FF001
      80010000E00FF00180030000C307F001800100008783F001800300000FC7F001
      F03FFFFF1FFFFFFFFFFFFFFF3FFFFFFFFFFFFE00FFFFFFFF000FFE0080038003
      000FFE0080038003000FFE0080038083000FFE0080018001000FFE0080018001
      000FFE0080038003000EFE0080038003000CFE00800180010000FFFF80018000
      000000FF80018000000000FF80038000F00000FF80018000F80000FF80038003
      FC00FFFFF03FF03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00C007FF07C007FE00
      C0070007C007FE00C0070007C007FE00C0070007C007FE00C0070001C007FE00
      C0070001C007FE00C0070003C007FE00C0070007C007C200C007000FC007C3FF
      C007001FC00700FFC007001FC00700FFC007001FC00700FFC00F001FC00F00FF
      C01F801FC01FC3FFFFFFC01FFFFFC3FF00000000000000000000000000000000
      000000000000}
  end
  object ppmStatToExcel: TPopupMenu
    Left = 379
    Top = 30
    object N6: TMenuItem
      Action = actPrintProtocol
    end
    object Excel1: TMenuItem
      Action = actPrintStat
    end
    object N1: TMenuItem
      Action = frmMain.actStatToExcel
    end
    object N2: TMenuItem
      Action = actPrintAbitExams
    end
    object N3: TMenuItem
      Action = actPrintExamStatistic
    end
  end
end
