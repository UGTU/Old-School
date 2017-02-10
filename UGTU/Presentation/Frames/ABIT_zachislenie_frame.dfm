inherited fmZach: TfmZach
  Width = 853
  Height = 591
  ExplicitWidth = 853
  ExplicitHeight = 591
  inherited Panel1: TPanel
    Width = 853
    Height = 554
    ExplicitWidth = 853
    ExplicitHeight = 554
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 849
      Height = 550
      ActivePage = prikazpage
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControl1Change
      OnChanging = PageControl1Changing
      object spisokAll: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1074'-'#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081
        object dbgrdMain: TDBGridEh
          Left = 0
          Top = 29
          Width = 841
          Height = 490
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsList
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 841
          Height = 29
          ButtonHeight = 25
          Caption = 'ToolBar3'
          Images = frmMain.ImageList1
          TabOrder = 1
          object btnGivezachNumber: TToolButton
            Left = 0
            Top = 0
            Action = actGiveZachNumber
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel9: TPanel
          Left = 122
          Top = 178
          Width = 337
          Height = 65
          BorderStyle = bsSingle
          TabOrder = 2
          Visible = False
          object Label28: TLabel
            Left = 84
            Top = 16
            Width = 132
            Height = 13
            Caption = #1042#1099#1076#1072#1095#1072' '#1079#1072#1095#1077#1090#1085#1099#1093' '#1082#1085#1080#1078#1077#1082
          end
          object ProgressBar1: TProgressBar
            Left = 2
            Top = 35
            Width = 328
            Height = 17
            TabOrder = 0
          end
        end
      end
      object predvpage: TTabSheet
        Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1080#1089#1082#1080
        ImageIndex = 2
        object Label1: TLabel
          Left = 0
          Top = 507
          Width = 841
          Height = 12
          Align = alBottom
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 841
          Height = 24
          ButtonHeight = 30
          ButtonWidth = 71
          Images = frmMain.ImageList1
          TabOrder = 0
          object cbKatZachisl: TDBLookupComboboxEh
            Left = 0
            Top = 0
            Width = 152
            Height = 30
            Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataField = ''
            EditButtons = <>
            Flat = True
            KeyField = 'ik_type_kat'
            ListField = 'CType_kat'
            ListSource = dm.dsTypeKatZach
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = cbKatZachislChange
          end
          object ToolButton14: TToolButton
            Left = 152
            Top = 0
            Action = actRefreshAbitList
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton1: TToolButton
            Left = 223
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 57
            Style = tbsSeparator
          end
          object ToolButton13: TToolButton
            Left = 231
            Top = 0
            Action = actAutomaticZachisl
            Visible = False
          end
          object ToolButton5: TToolButton
            Left = 302
            Top = 0
            Action = actZachislAbit
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton11: TToolButton
            Left = 373
            Top = 0
            Action = actRezervAbit
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton12: TToolButton
            Left = 444
            Top = 0
            Action = actExileAbit
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton2: TToolButton
            Left = 515
            Top = 0
            Width = 8
            Caption = 'ToolButton2'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton17: TToolButton
            Left = 523
            Top = 0
            Action = actAbitSpisokToExcel
            DropdownMenu = ppmPredvOtchet
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
          end
          object ToolButton18: TToolButton
            Left = 609
            Top = 0
            Width = 8
            Caption = 'ToolButton18'
            ImageIndex = 57
            Style = tbsSeparator
          end
          object ToolButton19: TToolButton
            Left = 617
            Top = 0
            Action = actPredvSpisokZachisl
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton20: TToolButton
            Left = 688
            Top = 0
            Width = 8
            Caption = 'ToolButton20'
            ImageIndex = 55
            Style = tbsSeparator
          end
        end
        object sost: TComboBox
          Left = 282
          Top = 208
          Width = 67
          Height = 21
          TabOrder = 1
          Visible = False
        end
        object Realy: TComboBox
          Left = 466
          Top = 208
          Width = 49
          Height = 21
          TabOrder = 2
          Visible = False
        end
        object nn_abit: TComboBox
          Left = 202
          Top = 209
          Width = 73
          Height = 21
          TabOrder = 3
          Visible = False
        end
        object Spisok: TDBComboBoxEh
          Left = 360
          Top = 209
          Width = 64
          Height = 19
          DynProps = <>
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = False
        end
        object dbgAbitsForZachisl: TDBGridEh
          Left = 0
          Top = 24
          Width = 841
          Height = 448
          Hint = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1080#1089#1082#1080' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = True
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          PopupMenu = PopupMenu2
          ReadOnly = True
          ShowHint = True
          TabOrder = 5
          OnDblClick = dbgAbitsForZachislDblClick
          OnDrawColumnCell = dbgAbitsForZachislDrawColumnCell
          OnTitleClick = dbgAbitsForZachislTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fio'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cshort_name_fac'
              Footers = <>
              Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_spec'
              Footers = <>
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cname_zach'
              Footers = <>
              Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cname_kat_zach'
              Footers = <>
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_lang'
              Footers = <>
              Title.Caption = #1048#1085'. '#1103#1079#1099#1082
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SummBall'
              Footers = <>
              Title.Caption = #1057#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MinBall'
              Footers = <>
              Title.Caption = #1052#1080#1085'. '#1073#1072#1083#1083
              Width = 60
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SredBall'
              Footers = <>
              Title.Caption = #1057#1088#1077#1076'. '#1073#1072#1083#1083
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 472
          Width = 841
          Height = 35
          Align = alBottom
          TabOrder = 6
          object Label2: TLabel
            Left = 39
            Top = 12
            Width = 130
            Height = 13
            Caption = '- '#1076#1086#1089#1090#1091#1087#1085#1099' '#1082' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1102
          end
          object Label4: TLabel
            Left = 203
            Top = 12
            Width = 246
            Height = 13
            Caption = '- '#1085#1077#1076#1086#1089#1090#1072#1090#1086#1095#1085#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' ('#1087#1072#1089#1087#1086#1088#1090'/'#1072#1090#1090#1077#1089#1090#1072#1090')'
          end
          object Label5: TLabel
            Left = 486
            Top = 12
            Width = 227
            Height = 13
            Caption = '- '#1085#1077' '#1074#1089#1077' '#1074#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1099#1077' '#1080#1089#1087#1099#1090#1072#1085#1080#1103' '#1074#1074#1077#1076#1077#1085#1099
          end
          object Panel3: TPanel
            Left = 10
            Top = 6
            Width = 23
            Height = 23
            Color = 8117693
            ParentBackground = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 174
            Top = 6
            Width = 23
            Height = 23
            Color = clSkyBlue
            ParentBackground = False
            TabOrder = 1
          end
          object Panel6: TPanel
            Left = 457
            Top = 6
            Width = 23
            Height = 23
            Color = 13027071
            ParentBackground = False
            TabOrder = 2
          end
        end
      end
      object prikazpage: TTabSheet
        Caption = #1055#1088#1080#1082#1072#1079' '#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
        ImageIndex = 1
        object nnrecord: TDBText
          Left = 397
          Top = 50
          Width = 65
          Height = 17
          DataField = 'nnrecord'
          Visible = False
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 841
          Height = 25
          ButtonHeight = 25
          Images = frmMain.ImageList1
          TabOrder = 0
          object ToolButton15: TToolButton
            Left = 0
            Top = 0
            Action = actRefreshAbitList
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 23
            Top = 0
            Action = actCancelZachisl
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton3: TToolButton
            Left = 46
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 3
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton7: TToolButton
            Left = 54
            Top = 0
            Action = frmMain.actJoinGroup
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton10: TToolButton
            Left = 77
            Top = 0
            Action = frmMain.actGroupChange
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton24: TToolButton
            Left = 100
            Top = 0
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072' '#1080#1079' '#1075#1088#1091#1087#1087#1099
            Action = actDelFromGroup
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 123
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton16: TToolButton
            Left = 131
            Top = 0
            Action = actExpPrikSpec
            DropdownMenu = ppmPrikazOtchet
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
          end
          object ToolButton4: TToolButton
            Left = 169
            Top = 0
            Action = actAbitSpisokToExcel
            DropdownMenu = ppmPrikazExcelOtchet
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
          end
          object ToolButton23: TToolButton
            Left = 207
            Top = 0
            Action = actPrikazAppoint
            ParentShowHint = False
            ShowHint = True
            Visible = False
          end
          object ToolButton25: TToolButton
            Left = 230
            Top = 0
            Action = actExportPhoto4Bank
          end
        end
        object s_ik: TComboBox
          Left = 485
          Top = 33
          Width = 20
          Height = 21
          TabOrder = 1
          Visible = False
        end
        object f_ik: TComboBox
          Left = 485
          Top = 57
          Width = 20
          Height = 21
          TabOrder = 2
          Visible = False
        end
        object prikaz: TDBGridEh
          Left = 0
          Top = 25
          Width = 841
          Height = 494
          Hint = #1044#1072#1085#1085#1099#1077' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
          Align = alClient
          AutoFitColWidths = True
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
          OnDblClick = prikazDblClick
          OnTitleClick = prikazTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'fio'
              Footers = <>
              Title.Caption = #1060#1048#1054' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              MaxWidth = 70
              Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
              Width = 62
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_spec'
              Footers = <>
              MaxWidth = 90
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 83
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_kat_zach'
              Footers = <>
              MaxWidth = 125
              Title.Alignment = taCenter
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 121
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'cname_zach'
              Footers = <>
              MaxWidth = 125
              Title.Alignment = taCenter
              Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1103
              Width = 125
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dd_prikaz'
              Footers = <>
              ReadOnly = False
              Title.Alignment = taCenter
              Title.Caption = #1055#1088#1080#1082#1072#1079
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_lang'
              Footers = <>
              MaxWidth = 90
              Title.Caption = #1048#1085'. '#1103#1079#1099#1082
              Width = 72
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1095#1077#1090#1082#1080
              Width = 79
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_grup'
              Footers = <>
              Title.Caption = #1043#1088#1091#1087#1087#1072
              Width = 50
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SummBall'
              Footers = <>
              Title.Caption = #1057#1091#1084#1084#1072' '#1073#1072#1083#1083#1086#1074
              Width = 34
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SredBall'
              Footers = <>
              Title.Caption = #1057#1088#1077#1076'. '#1073#1072#1083#1083
              Width = 34
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MinBall'
              Footers = <>
              Title.Caption = #1052#1080#1085'. '#1073#1072#1083#1083
              Width = 34
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'nCode'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RegNomer'
              Footers = <>
              Visible = False
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object tsBalls: TTabSheet
        Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1077' '#1076#1086#1087#1091#1089#1090#1080#1084#1099#1077' '#1073#1072#1083#1083#1099
        ImageIndex = 3
        object dbgBalls: TDBGridEh
          Left = 0
          Top = 31
          Width = 841
          Height = 488
          Hint = #1044#1072#1085#1085#1099#1077' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
          Align = alClient
          AutoFitColWidths = True
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnTitleClick = dbgBallsTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cshort_name_fac'
              Footers = <>
              MaxWidth = 65
              ReadOnly = True
              Title.Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
              Width = 65
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_spec'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
              Width = 250
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_kat_zach'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = #1089'name_disc'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MinBall'
              Footers = <>
              Title.Caption = #1052#1080#1085'. '#1073#1072#1083#1083' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
              Width = 150
              OnUpdateData = dbgBallsColumns3UpdateData
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 841
          Height = 31
          ButtonWidth = 24
          Caption = 'ToolBar1'
          Images = frmMain.ImageList1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 146
            Height = 22
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
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
          object ToolButton9: TToolButton
            Left = 146
            Top = 0
            ImageIndex = 65
          end
          object ToolButton21: TToolButton
            Left = 170
            Top = 0
            Action = actCancelMinBalls
            ImageIndex = 66
          end
          object ToolButton22: TToolButton
            Left = 194
            Top = 0
            Action = actSaveMinBalls
            ImageIndex = 64
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 554
    Width = 853
    Visible = False
    ExplicitTop = 554
    ExplicitWidth = 853
    DesignSize = (
      853
      37)
    inherited bbSave: TBitBtn
      Left = 684
      Action = actZachislAbit
      Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000280000004100000861
        080008610800218E2100188E1800107910000861080000300000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000610000219E210052C75200399E
        39002186210063C7630063CF630039BE390031B6310010791000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00188E18005AC75A0063CF63003996
        3900DEEFCE00429E39006BCF6B0063CF630039B6390008690800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002186210063CF630084DF8400639E
        5A00FFFFFF008CBE8C005AB65A0063CF630042AE420000490000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000061000042A642009CE79C0084AE
        6B00BDCFCE009CBEC6003986420042A6420000590000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000610000217929000069
        84001079C6001079C6000871AD0000493900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000598400298E
        EF00319EFF00319EFF00319EFF001079C60000101800FF00FF00FF00FF00FF00
        FF007BAE730063965A00528E4A00FF00FF00FF00FF00FF00FF001879C60039A6
        FF0042A6FF0042A6FF0039A6FF00319EFF0000497300FF00FF00FF00FF005296
        4A00FFF7FF00E7E7E700EFE7EF00F7E7F70039863100FF00FF00218ECE0042AE
        FF004AB6FF004AB6FF004AAEFF0042AEFF001879BD00FF00FF00428E3900FFFF
        FF00FFFFFF0000710000DEEFDE00F7F7F700EFE7EF00FF00FF00218ECE0052B6
        FF0052BEFF0052BEFF0052B6FF004AB6FF00218ECE00FF00FF00CEE7C600FFFF
        FF00FFFFFF000079000000790000DEEFDE00E7E7EF005A9E52002186BD00319E
        D6002996C60039A6DE004AB6FF0042AEF7002186B500FF00FF00E7EFE700FFFF
        FF00FFFFFF000079000008790800EFF7EF00EFEFEF005A9E520000619400318E
        BD0052A6D60073B6DE005AA6C600398EB50008699C00FF00FF00428E3900FFFF
        FF00FFFFFF0008710800FFFFFF00FFFFFF00FFF7FF00FF00FF00006194002186
        B50084C7E70094CFEF008CC7E700298EBD0000496B00FF00FF00FF00FF00E7F7
        E700FFFFFF00FFFFFF00FFFFFF00FFFFFF0052964A00FF00FF00FF00FF000061
        94001871A5004296BD001871A50000517B00FF00FF00FF00FF00FF00FF00FF00
        FF00639E5A006BA66300529652008CBE8C00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ExplicitLeft = 684
    end
    inherited bbUndo: TBitBtn
      Left = 510
      Action = actCancelMinBalls
      ParentFont = False
      ExplicitLeft = 510
    end
    object bbProceed: TBitBtn
      Left = 678
      Top = 6
      Width = 162
      Height = 25
      Action = actSaveMinBalls
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Default = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
        927FD5D7D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF78927F1B221CBDC0BDFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78
        927F43774E1B221CC2C6C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF7C9884222B232B362C3340353A493C518D6043774E1B221CC2C6C2FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82A18CA9E9BE73B3866AAA7D62
        A0745A976A62AA7443774E1B221CBEC2BEFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF89AA93B1EFC693E2AD8BD8A381CD9876C18C6CB58062AA745692646076
        67FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B49CB4F1C9AEEEC4AAEABFA4
        E4B9A3E0B676C18C6DB2807B9784D3E1D7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF95BCA290B49C89AA9382A18C7C9884A8E5BB80C7967B9784D2E0D7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82
        A18CA5E1B87B9784D2E0D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF89AA937B9784D2E0D7FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
        B49CE2EDE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      ModalResult = 1
      TabOrder = 2
    end
  end
  object ImageList1: TImageList
    Left = 483
    Top = 80
    Bitmap = {
      494C010105004000840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000000000000000000000000000EAEAEA00E8E9E900E7E6
      E600E3E3E200E0E0DF00DEDDDB00ECEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F8F600624B2C00654C2A00644C
      2A005E492C00614A2D00664D2A00A9A39700FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFA00634B2B006B4F2900604A
      2D00654D2B00664D2A00694D240081756300ACA19200B8B1A900BBB4AA00BAB3
      AA00C0B9B200C8C2BB00CDC8C200C6C4C2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00674D290078684B007060
      450072644B0071634A005B462B009F968B00F2F2F300DFDCDC00E8E7E700E4E0
      E000E8E6E700E7E6E600E8E6E600C8C5C2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFA00654C2A006A4E2800654C
      2900664C2800674C2900654C27009D948900F1F0F200DBD8D700E8E6E700DFDB
      DC00E6E3E300E5E3E300E6E4E400BFBCB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFA0086704F00766246007F69
      4900857152008874570086725600A9A19700F1F0F100DFDCDC00E4E2E200DAD6
      D600DAD7D700E1DEDD00E4E2E200B8B4B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5C0BE00EDED
      EE00F2F2F300F0EFF000F1F1F200EFEFF000EFEEEF00E9E8E900F1F1F200EDE9
      EB00EDEAEB00EFEEEF00EFEEEF00AFACA8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDFDFC00FCFCFB00FDFDFD00000000000000
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
      00000000000000000000000000000000000000000000214D3900214D3900214D
      3900184531001845310018453100103429001034290010342900103429000828
      18000828180008281800081C1800081C18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084340000843400008434
      0000843400007B3000007B3000006B2800006B2800006B2800005A2400005220
      00005220000052200000421C0000421C000000000000F7F7F700D6D3D600D6D3
      D600D6D3D600D6D3D600D6D3D600D6D3D600D6D3D600D6D3D600D6D3D600D6D3
      D600D6D3D600DEDFDE000000000000000000000000006B967B00527563005275
      630052756300527563004A6963004A6963004A6963004A696300425D5A00425D
      5A00425D5A00425D5A00425D5A00081C18008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A56D5200845542008455
      420084554200845542007B513900734D3900734D3900734D39006B4531006B45
      31006B4531006B4531006B453100421C00000000000094655A0094655A009465
      5A0094655A0094655A0094655A0094655A0094655A0094655A0094655A009465
      5A0094655A007B7D7B00000000000000000042825A006B967B00EFF3EF00E7F3
      E700E7EFE700E7EFE700DEEFDE00DEEBDE00DEEBDE00DEEBDE00DEE7DE00D6E7
      D600D6E7D600D6E7D600425D5A000828180084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD5D3100A56D5200FFFBFF00FFFB
      F700FFFBF700FFF7F700FFF3F700FFF3EF00FFEFEF00F7EFEF00F7EBE700F7E7
      E700F7E7E700F7E3DE006B45310052200000000000009C696300FFEFDE00FFEB
      D600FFE7CE00FFE3C600FFE3BD00FFDFBD00FFDBB500FFDBAD00FFD7AD00FFD3
      A500FFD7BD008482840000000000000000004A8663006B967B00EFF3EF00EFF3
      EF00EFF3EF00E7EFE700E7EFE700DEEFDE00DEEBDE00DEEBDE00DEEBDE00DEE7
      DE00D6E7D600D6E7D600425D5A000828180084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD613900AD755A00FFFFFF00FFFB
      FF00FFFBFF00FFFBF700FFF7F700FFF3F700FFF3F700FFEFEF00F7EFEF00F7EB
      E700F7E7E700F7E7E7006B45310052200000000000009C6D6B00FFF3DE00FFEB
      D600FFEBD600FFE7CE00FFE3C600FFEBBD00FFDFBD00FFDBB500FFDBB500FFD7
      AD00FFD7BD008482840000000000000000004A8663006B967B00EFF7EF00EFF3
      EF00EFF3EF00E7F3E700E7EFE700E7EFE700DEEFDE00639A6300213821002138
      21002138210021382100425D5A000828180084828400CEB2A50000000000CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000AD613900AD755A00FFFFFF009C65
      4A008C55390084513100FFF7F7008C4D21007B4921006B452100E7D3CE00F7EB
      E700F7EBE700F7E7E7006B4531005220000000000000A5716B00FFF3E700FFD3
      A500FFD3A500FFDB9C006B79DE001030FF00FFD79C00FFCF9C00FFDBB500FFDB
      B500FFD7BD00848284000000000000000000528E630073A284004A964A001075
      3100186D390029654200395D5200395D5200006900008CC7940029864200217D
      4200217D4200DEE7DE00425D5A001034290084828400CEB2A50000000000CEB2
      A500FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000B5654200AD755A00FFFFFF00A56D
      5200DE967B00CE754A00D6BAAD009C593900C6613100AD512100523C1000FFEF
      EF00F7EFEF00F7EBE7006B4531005A24000000000000A5756B00FFF7EF00FFDB
      B500DECFC600002CFF000030FF000030FF00C6B6C600FFD3A500FFD3A500FFD3
      A500FFDBC600848284000000000000000000528E630073A28400F7FBF7004A96
      4A006BB6730073BA7B0052A65A00429242009CD3A5004A9A5200429242000069
      0000184D2900DEEBDE004A6963001034290084828400CEB2A50000000000CEB2
      A500FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000BD694200B57D6300FFFFFF00AD75
      5A00DEA68C00CE7952008C4D2100A5694A00C6755200B55931009C4D2100E7D3
      CE00FFEFEF00F7EFEF00734D39006B28000000000000AD7D7300FFFBEF00BDB2
      C600002CFF000028FF00D6C3B500082CFF000028FF00FFE3A500FFD7AD00FFD7
      AD00FFDBC6008482840000000000000000005A966B0084AA8C00F7FBF700F7FB
      F700DEEBDE0052A65A004292420073BA7B0052A65A0052A65A00006900005282
      5A00528E6300DEEBDE004A6963001034290084828400CEB2A50000000000CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000C66D4A00B57D6300FFFFFF00B57D
      6300E7AA9400B5715A00CE826300AD755A00CE866B00C6613100CE754A00523C
      1000E7D3CE00FFEFEF00734D39006B28000000000000B5827300FFFBF700FFFB
      F7007B79CE00FFE7B500FFFBF700EFD3B500002CFF006B79E700FFDFBD00FFDF
      BD00FFDBC6008482840000000000000000005A9A730084AA8C00F7FBF700F7FB
      F700F7FBF70018791800ADD7B5005AAA63005AAA630052A65A00ADC3AD00E7EF
      E700DEEFDE00DEEBDE004A6963001034290084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C6755200BD867300FFFFFF00B57D
      6300EFB29C009C654A00DE9E8400CE795200C6755200BD653900CE7552006B3C
      10009C8A7300FFF3EF00734D39006B28000000000000BD8A7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A5DE7000028FF00FFE3C600FFE3
      C600FFDFCE008482840000000000000000005A9A730084AA8C00FFFBFF00F7FB
      F70094C79C00BDDFC6006BB6730063AE6B005AAA6300529A5A0000690000E7EF
      E700E7EFE700DEEFDE004A6963001845310084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000CE795200BD867300FFFFFF00C682
      6B00EFBEAD009C654A00B57D6300CE866B00CE826300BD694200BD927B00C66D
      42007B492100FFF3F700845542007B30000000000000C6927B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEBB5000024FF001845FF00FFDF
      B500FFDFCE0084828400000000000000000063A2730084AA8C00FFFFFF005AAA
      6300C6E7CE007BC3840073BA7B0052825A006BB26B0073BA7B0052A65A000069
      0000CEDBCE00E7EFE700527563001845310084828400CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A5000000000000000000D67D5A00BD867300FFFFFF00D68A
      7300EFBEAD00A56D5200FFF3F700E7AA9400D6927300C66D4A00FFFBFF00B571
      5A00CE7D5A00B5A29400845542007B30000000000000CE9A8400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59ECE000028FF00FFF3
      E700FFDFD6008482840000000000000000006BA67B008CB694006BB673009CD3
      A5008CC794008CC79400639A6300F7FBF700CEDBCE006BB6730073BA7B0052A6
      5A0052825A00E7EFE700527563001845310084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000D6826300BD927B00D6927300EFB2
      9C00EFBEAD00E7AA9400AD755A00BD867300DE9E8400DE9E8400FFFBFF00D692
      7300D6927300D68A6300845542008434000000000000D6A28400FFFFFF00FFF3
      E700FFF3E700FFF3E700FFF3E700FFF3E700FFF3E700FFF3E700FFF3E700FFF3
      E700FFDBCE008482840000000000000000006BA67B008CB694006BB673006BB2
      6B0063AE6B00639A6300E7EBE700F7FBF700F7FBF700639A6300639A63005282
      5A0052825A00E7F3E70052756300214D390084828400CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A5000000000000000000D6826300BD927B00DE9E8400DE9E
      8400DE967B00D6927300D68A7300E7D3CE00CE826300CE7D5A00FFFBFF00C675
      5200C6755200C66D4A00845542008434000000000000DEAA8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFFBF700FFF7EF00FFF3E700FFF3E700FFEF
      DE00FFD3C60084828400000000000000000073AA84008CB69400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBFF00F7FBF700F7FBF700F7FBF700EFF7EF00EFF7
      EF00EFF3EF00EFF3EF0052756300214D390084828400C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C6000000000000000000DE8A6300BD927B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFBFF008C5D42008434000000000000E7AE8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBFF00FFFBF700FFF7EF00FFF7EF00CEAAA500C69A
      8C00CE8E7B008C8A8C00000000000000000073AE840084AA8C008CB694008CB6
      94008CB694008CB6940084AA8C0084AA8C0084AA8C0073A2840073A2840073A2
      84006B967B006B967B006B967B00214D390084828400C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C60000000000C6C3
      C60000000000C6C3C6000000000000000000E78E6B00BD927B00BD927B00BD92
      7B00BD927B00BD867300BD867300B57D6300B57D6300B57D6300AD755A00AD75
      5A00AD755A00A56D5200A56D52008C3C080000000000E7B68C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF700FFFBF700BD8A7B00FFB6
      3900BD8A7B00F7F7F700000000000000000073AE840073AE840073AA84006BA6
      7B006BA67B0063A2730063A273005A9A73005A9A7300528E6300528E63004A86
      63004A86630042825A0000000000000000008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E78E6B00E78E6B00DE8A6300DE8A
      6300D6826300D6826300CE7D5A00CE795200C6755200C66D4A00C66D4A00BD69
      4200B5654200B5654200AD613900AD61390000000000EFBA9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD8A7B00BD8A
      7B00F7F7F700000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000080FF0000000000000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C000000000000000FC3F000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF0000000000008000FFFF8000800380007FFF80008003
      0000000300008003000000030000800300002093000080030000244B00008003
      0000260300008003000020CB0000800300000003000080030000008B00008003
      0000000300008003000000030000800300000003000080030000000300008003
      0000002B0000800300037FFF0000800700000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 163
    Top = 328
    Bitmap = {
      494C010103000400840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000214D3900214D3900214D
      3900184531001845310018453100103429001034290010342900103429000828
      18000828180008281800081C1800081C18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084340000843400008434
      0000843400007B3000007B3000006B2800006B2800006B2800005A2400005220
      00005220000052200000421C0000421C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B967B00527563005275
      630052756300527563004A6963004A6963004A6963004A696300425D5A00425D
      5A00425D5A00425D5A00425D5A00081C18008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A56D5200845542008455
      420084554200845542007B513900734D3900734D3900734D39006B4531006B45
      31006B4531006B4531006B453100421C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042825A006B967B00EFF3EF00E7F3
      E700E7EFE700E7EFE700DEEFDE00DEEBDE00DEEBDE00DEEBDE00DEE7DE00D6E7
      D600D6E7D600D6E7D600425D5A000828180084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD5D3100A56D5200FFFBFF00FFFB
      F700FFFBF700FFF7F700FFF3F700FFF3EF00FFEFEF00F7EFEF00F7EBE700F7E7
      E700F7E7E700F7E3DE006B453100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A8663006B967B00EFF3EF00EFF3
      EF00EFF3EF00E7EFE700E7EFE700DEEFDE00DEEBDE00DEEBDE00DEEBDE00DEE7
      DE00D6E7D600D6E7D600425D5A000828180084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000AD613900AD755A00FFFFFF00FFFB
      FF00FFFBFF00FFFBF700FFF7F700FFF3F700FFF3F700FFEFEF00F7EFEF00F7EB
      E700F7E7E700F7E7E7006B453100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A8663006B967B00EFF7EF00EFF3
      EF00EFF3EF00E7F3E700E7EFE700E7EFE700DEEFDE00639A6300213821002138
      21002138210021382100425D5A000828180084828400CEB2A50000000000CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000AD613900AD755A00FFFFFF009C65
      4A008C55390084513100FFF7F7008C4D21007B4921006B452100E7D3CE00F7EB
      E700F7EBE700F7E7E7006B453100522000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000528E630073A284004A964A001075
      3100186D390029654200395D5200395D5200006900008CC7940029864200217D
      4200217D4200DEE7DE00425D5A001034290084828400CEB2A50000000000CEB2
      A500FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000B5654200AD755A00FFFFFF00A56D
      5200DE967B00CE754A00D6BAAD009C593900C6613100AD512100523C1000FFEF
      EF00F7EFEF00F7EBE7006B4531005A2400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000528E630073A28400F7FBF7004A96
      4A006BB6730073BA7B0052A65A00429242009CD3A5004A9A5200429242000069
      0000184D2900DEEBDE004A6963001034290084828400CEB2A50000000000CEB2
      A500FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000BD694200B57D6300FFFFFF00AD75
      5A00DEA68C00CE7952008C4D2100A5694A00C6755200B55931009C4D2100E7D3
      CE00FFEFEF00F7EFEF00734D39006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A966B0084AA8C00F7FBF700F7FB
      F700DEEBDE0052A65A004292420073BA7B0052A65A0052A65A00006900005282
      5A00528E6300DEEBDE004A6963001034290084828400CEB2A50000000000CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000C66D4A00B57D6300FFFFFF00B57D
      6300E7AA9400B5715A00CE826300AD755A00CE866B00C6613100CE754A00523C
      1000E7D3CE00FFEFEF00734D39006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A9A730084AA8C00F7FBF700F7FB
      F700F7FBF70018791800ADD7B5005AAA63005AAA630052A65A00ADC3AD00E7EF
      E700DEEFDE00DEEBDE004A6963001034290084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C6755200BD867300FFFFFF00B57D
      6300EFB29C009C654A00DE9E8400CE795200C6755200BD653900CE7552006B3C
      10009C8A7300FFF3EF00734D39006B2800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A9A730084AA8C00FFFBFF00F7FB
      F70094C79C00BDDFC6006BB6730063AE6B005AAA6300529A5A0000690000E7EF
      E700E7EFE700DEEFDE004A6963001845310084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000CE795200BD867300FFFFFF00C682
      6B00EFBEAD009C654A00B57D6300CE866B00CE826300BD694200BD927B00C66D
      42007B492100FFF3F700845542007B3000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063A2730084AA8C00FFFFFF005AAA
      6300C6E7CE007BC3840073BA7B0052825A006BB26B0073BA7B0052A65A000069
      0000CEDBCE00E7EFE700527563001845310084828400CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A5000000000000000000D67D5A00BD867300FFFFFF00D68A
      7300EFBEAD00A56D5200FFF3F700E7AA9400D6927300C66D4A00FFFBFF00B571
      5A00CE7D5A00B5A29400845542007B3000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006BA67B008CB694006BB673009CD3
      A5008CC794008CC79400639A6300F7FBF700CEDBCE006BB6730073BA7B0052A6
      5A0052825A00E7EFE700527563001845310084828400CEB2A500FFFFFF00CEB2
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000D6826300BD927B00D6927300EFB2
      9C00EFBEAD00E7AA9400AD755A00BD867300DE9E8400DE9E8400FFFBFF00D692
      7300D6927300D68A630084554200843400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006BA67B008CB694006BB673006BB2
      6B0063AE6B00639A6300E7EBE700F7FBF700F7FBF700639A6300639A63005282
      5A0052825A00E7F3E70052756300214D390084828400CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2A500CEB2
      A500CEB2A500CEB2A5000000000000000000D6826300BD927B00DE9E8400DE9E
      8400DE967B00D6927300D68A7300E7D3CE00CE826300CE7D5A00FFFBFF00C675
      5200C6755200C66D4A0084554200843400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073AA84008CB69400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBFF00F7FBF700F7FBF700F7FBF700EFF7EF00EFF7
      EF00EFF3EF00EFF3EF0052756300214D390084828400C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C6000000000000000000DE8A6300BD927B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFBFF008C5D4200843400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073AE840084AA8C008CB694008CB6
      94008CB694008CB6940084AA8C0084AA8C0084AA8C0073A2840073A2840073A2
      84006B967B006B967B006B967B00214D390084828400C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C60000000000C6C3
      C60000000000C6C3C6000000000000000000E78E6B00BD927B00BD927B00BD92
      7B00BD927B00BD867300BD867300B57D6300B57D6300B57D6300AD755A00AD75
      5A00AD755A00A56D5200A56D52008C3C08000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073AE840073AE840073AA84006BA6
      7B006BA67B0063A2730063A273005A9A73005A9A7300528E6300528E63004A86
      63004A86630042825A0000000000000000008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E78E6B00E78E6B00DE8A6300DE8A
      6300D6826300D6826300CE7D5A00CE795200C6755200C66D4A00C66D4A00BD69
      4200B5654200B5654200AD613900AD6139000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF008000FFFF8000000080007FFF80000000
      0000000300000000000000030000000000002093000000000000244B00000000
      0000260300000000000020CB0000000000000003000000000000008B00000000
      0000000300000000000000030000000000000003000000000000000300000000
      0000002B0000000000037FFF0000000000000000000000000000000000000000
      000000000000}
  end
  object actList: TActionList
    Images = frmMain.ImageList1
    Left = 630
    Top = 90
    object actZachislAbit: TAction
      Category = 'Zachisl'
      Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100
      Enabled = False
      Hint = #1047#1072#1095#1080#1089#1083#1080#1090#1100' '
      ImageIndex = 31
      ShortCut = 16467
      OnExecute = actZachislAbitExecute
      OnUpdate = actZachislAbitUpdate
    end
    object actExpPrikGrup: TAction
      Category = 'Prikaz'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1080#1082#1072#1079#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Word '#1087#1088#1080#1082#1072#1079#1072' '#1088#1072#1079#1073#1080#1077#1085#1080#1103' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
      ImageIndex = 59
      OnExecute = actExpPrikGrupExecute
      OnUpdate = actExpPrikSpecUpdate
    end
    object actExpPrikSpec: TAction
      Category = 'Prikaz'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1080#1082#1072#1079#1072' '#1087#1086' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1103#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Word '#1086#1073#1097#1077#1075#1086' '#1087#1088#1080#1082#1072#1079#1072' '#1087#1086' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1103#1084
      ImageIndex = 60
      OnExecute = actExpPrikSpecExecute
      OnUpdate = actExpPrikSpecUpdate
    end
    object actCancelZachisl: TAction
      Category = 'Prikaz'
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      Enabled = False
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093
      ImageIndex = 32
      OnExecute = actCancelZachislExecute
      OnUpdate = actExpPrikSpecUpdate
    end
    object actRezervAbit: TAction
      Category = 'Zachisl'
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1088#1077#1079#1077#1088#1074
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1088#1077#1079#1077#1088#1074
      ImageIndex = 29
      OnExecute = actRezervAbitExecute
      OnUpdate = actRezervAbitUpdate
    end
    object actExileAbit: TAction
      Category = 'Zachisl'
      Caption = #1054#1090#1082#1072#1079#1072#1090#1100' '#1074' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
      Hint = #1054#1090#1082#1072#1079#1072#1090#1100' '#1074' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
      ImageIndex = 25
      OnExecute = actExileAbitExecute
      OnUpdate = actExileAbitUpdate
    end
    object actPredvSpiskiPologOcenki: TAction
      Category = 'Zachisl'
      Caption = #1062#1050#1055', '#1073#1102#1076#1078#1077#1090' '#1089' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1084#1080' '#1086#1094#1077#1085#1082#1072#1084#1080
      Hint = #1062#1050#1055', '#1073#1102#1076#1078#1077#1090' '#1089' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1084#1080' '#1086#1094#1077#1085#1082#1072#1084#1080
      ImageIndex = 41
      OnExecute = actPredvSpiskiPologOcenkiExecute
      OnUpdate = actPredvSpiskiPologOcenkiUpdate
    end
    object actAbitReturnExecute: TAction
      Category = 'Prikaz'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
      OnExecute = actAbitReturnExecuteExecute
      OnUpdate = actAbitReturnExecuteUpdate
    end
    object actAbitSpisokToExcel: TAction
      Category = 'Zachisl'
      Caption = #1057#1087#1080#1089#1086#1082' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 56
      OnExecute = actAbitSpisokToExcelExecute
      OnUpdate = actAbitSpisokToExcelUpdate
    end
    object actRefreshAbitList: TAction
      Category = 'Zachisl'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 62
      OnExecute = actRefreshAbitListExecute
    end
    object actProtokolToExcel: TAction
      Category = 'Prikaz'
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1086' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1080
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1074' Ecxel'
      OnExecute = actProtokolToExcelExecute
    end
    object actAddAllProhBalls: TAction
      Category = 'Proh ball'
      Hint = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1088#1086#1093#1086#1076#1085#1099#1077' '#1073#1072#1083#1083#1099
      ImageIndex = 52
      OnExecute = actAddAllProhBallsExecute
      OnUpdate = actAddAllProhBallsUpdate
    end
    object actAutomaticZachisl: TAction
      Category = 'Zachisl'
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
      ImageIndex = 67
      OnExecute = actAutomaticZachislExecute
    end
    object actPredvSpisokZachisl: TAction
      Category = 'Zachisl'
      Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1085#1072' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
      ImageIndex = 54
      OnExecute = actPredvSpisokZachislExecute
    end
    object actAvtomZachisl: TAction
      Category = 'Zachisl'
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1077
    end
    object actSaveMinBalls: TAction
      Category = 'MinBalls'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actSaveMinBallsExecute
      OnUpdate = actSaveMinBallsUpdate
    end
    object actCancelMinBalls: TAction
      Category = 'MinBalls'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      OnExecute = actCancelMinBallsExecute
      OnUpdate = actSaveMinBallsUpdate
    end
    object actPrintExamStatistic: TAction
      Category = 'Prikaz'
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1074#1089#1090#1091#1087#1080#1090#1077#1083#1100#1085#1099#1084' '#1101#1082#1079#1072#1084#1077#1085#1072#1084
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel '#1089#1090#1072#1090#1080#1090#1089#1090#1080#1082#1080' '#1087#1086' '#1074#1089#1090#1091#1087' '#1101#1082#1079#1072#1084#1077#1085#1072#1084' '#1079#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093
      OnExecute = actPrintExamStatisticExecute
    end
    object actGiveZachNumber: TAction
      Category = 'Zachisl'
      Caption = 'actGiveZachNumber'
      Hint = #1042#1099#1076#1072#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1079#1072#1095#1077#1090#1085#1099#1093' '#1082#1085#1080#1078#1077#1082
      ImageIndex = 73
      OnExecute = actGiveZachNumberExecute
    end
    object actPrikazAppoint: TAction
      Category = 'Prikaz'
      Caption = 'actPrikazAppoint'
      Hint = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1087#1088#1080#1082#1072#1079' '#1076#1083#1103' '#1079#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093
      ImageIndex = 69
      OnExecute = actPrikazAppointExecute
    end
    object actDelFromGroup: TAction
      Category = 'Prikaz'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072' '#1080#1079' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 57
      OnExecute = actDelFromGroupExecute
    end
    object actExportPhoto4Bank: TAction
      Caption = 'actExportPhoto4Bank'
      ImageIndex = 58
      OnExecute = actExportPhoto4BankExecute
    end
  end
  object adoqTypeKatZach: TADOQuery
    Connection = dm.DBConnect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.TypeKatZach')
    Left = 192
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    Images = frmMain.ImageList1
    Left = 190
    Top = 259
    object N1: TMenuItem
      Action = frmMain.actJoinGroup
    end
    object N2: TMenuItem
      Action = frmMain.actGroupChange
    end
    object N3: TMenuItem
      Action = actCancelZachisl
    end
  end
  object dsList: TDataSource
    Left = 232
    Top = 258
  end
  object PopupMenu2: TPopupMenu
    Images = frmMain.ImageList1
    Left = 142
    Top = 259
    object N4: TMenuItem
      Action = actZachislAbit
    end
    object actRezervAbit1: TMenuItem
      Action = actRezervAbit
    end
    object actExileAbit1: TMenuItem
      Action = actExileAbit
    end
  end
  object ppmPredvOtchet: TPopupMenu
    Images = ImageList1
    Left = 69
    Top = 149
    object Excel1: TMenuItem
      Action = actAbitSpisokToExcel
    end
    object N5: TMenuItem
      Action = actPredvSpiskiPologOcenki
    end
  end
  object ppmPrikazOtchet: TPopupMenu
    Images = ImageList1
    Left = 149
    Top = 141
    object MenuItem1: TMenuItem
      Action = actExpPrikSpec
    end
    object MenuItem2: TMenuItem
      Action = actExpPrikGrup
    end
  end
  object ppmPrikazExcelOtchet: TPopupMenu
    Images = ImageList1
    Left = 205
    Top = 141
    object MenuItem5: TMenuItem
      Action = actProtokolToExcel
    end
    object Excel2: TMenuItem
      Action = actAbitSpisokToExcel
    end
    object N6: TMenuItem
      Action = frmMain.actPrintItogiPostForSpec
    end
    object N7: TMenuItem
      Action = actPrintExamStatistic
    end
  end
end
