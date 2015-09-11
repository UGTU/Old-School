inherited fmMethodWorkDep: TfmMethodWorkDep
  Width = 930
  Height = 488
  ExplicitWidth = 930
  ExplicitHeight = 488
  inherited Panel1: TPanel
    Width = 930
    Height = 451
    ExplicitWidth = 930
    ExplicitHeight = 451
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 926
      Height = 447
      ActivePage = tsPrepods
      Align = alClient
      Images = frmMain.ImageList1
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControl1Change
      object tsPlan: TTabSheet
        Caption = #1055#1083#1072#1085' '#1059#1052#1056' '#1082#1072#1092#1077#1076#1088#1099
        ImageIndex = 39
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          918
          416)
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar2'
          Images = ImageList1
          TabOrder = 0
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Action = actAddPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton1: TToolButton
            Left = 23
            Top = 0
            Action = actEditPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton9: TToolButton
            Left = 46
            Top = 0
            Action = actDelPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 69
            Top = 0
            Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1059#1052#1056
            Caption = 'actLoadCurrentPlan'
            ImageIndex = 22
            ParentShowHint = False
            ShowHint = True
            OnClick = actLoadCurrentPlanExecute
          end
          object ToolButton18: TToolButton
            Left = 92
            Top = 0
            Action = actExportPlan
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 394
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitHeight = 393
          object Panel15: TPanel
            Left = 1
            Top = 59
            Width = 916
            Height = 280
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvLowered
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 1
              Top = 1
              Width = 914
              Height = 3
              Cursor = crVSplit
              Align = alTop
              ExplicitTop = 109
              ExplicitWidth = 684
            end
            object GroupBox1: TGroupBox
              Left = 1
              Top = 4
              Width = 914
              Height = 275
              Align = alClient
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085' '#1059#1052#1056' '#1082#1072#1092#1077#1076#1088#1099
              TabOrder = 0
              object SG: TStringGrid
                Left = 2
                Top = 15
                Width = 910
                Height = 258
                Align = alClient
                DefaultColWidth = 100
                DefaultRowHeight = 32
                FixedCols = 0
                FixedRows = 2
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goTabs, goRowSelect]
                ParentShowHint = False
                ScrollBars = ssVertical
                ShowHint = True
                TabOrder = 0
                OnDrawCell = SGDrawCell
                OnSelectCell = SGSelectCell
                ColWidths = (
                  100
                  100
                  100
                  100
                  100)
              end
            end
          end
          object Panel19: TPanel
            Left = 1
            Top = 1
            Width = 916
            Height = 58
            Align = alTop
            TabOrder = 1
            object Label1: TLabel
              Left = 42
              Top = 11
              Width = 70
              Height = 13
              Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
            end
            object dbcbPlan: TDBLookupComboboxEh
              Left = 116
              Top = 8
              Width = 173
              Height = 21
              AlwaysShowBorder = True
              AutoSize = False
              DataField = ''
              EditButtons = <>
              Flat = True
              TabOrder = 0
              Visible = True
              OnKeyValueChanged = dbcbPlanKeyValueChanged
            end
          end
          object Panel13: TPanel
            Left = 1
            Top = 339
            Width = 916
            Height = 53
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 2
            object Label28: TLabel
              Left = 7
              Top = 8
              Width = 34
              Height = 13
              Caption = #1048#1090#1086#1075#1086':'
            end
            object Label15: TLabel
              Left = 60
              Top = 8
              Width = 122
              Height = 13
              Caption = #1075#1086#1076#1086#1074#1086#1081' '#1086#1073#1098#1077#1084' '#1085#1072' '#1059#1052#1056':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 306
              Top = 8
              Width = 81
              Height = 13
              Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 393
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label27: TLabel
              Left = 188
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1095#1072#1089#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103' '#1087#1086' '#1074#1099#1073#1088 +
                #1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label29: TLabel
              Left = 506
              Top = 8
              Width = 131
              Height = 13
              Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 643
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label31: TLabel
              Left = 393
              Top = 27
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label45: TLabel
              Left = 328
              Top = 27
              Width = 59
              Height = 13
              Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label46: TLabel
              Left = 528
              Top = 27
              Width = 109
              Height = 13
              Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 643
              Top = 27
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label48: TLabel
              Left = 758
              Top = 8
              Width = 71
              Height = 13
              Caption = #1055#1083#1072#1085' ('#1082#1086#1083'-'#1074#1086'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label49: TLabel
              Left = 759
              Top = 27
              Width = 70
              Height = 13
              Caption = #1060#1072#1082#1090'('#1082#1086#1083'-'#1074#1086'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label50: TLabel
              Left = 833
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label51: TLabel
              Left = 833
              Top = 27
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 307
          Top = 23
          Width = 588
          Height = 56
          Anchors = [akLeft, akTop, akRight]
          Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1083#1072#1085#1072
          TabOrder = 2
          object Label43: TLabel
            Left = 206
            Top = 14
            Width = 79
            Height = 13
            Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
          end
          object Label44: TLabel
            Left = 405
            Top = 15
            Width = 74
            Height = 13
            Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072':'
          end
          object Label42: TLabel
            Left = 9
            Top = 15
            Width = 101
            Height = 13
            Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103':'
          end
          object dbcbTypeRep: TDBLookupComboboxEh
            Left = 206
            Top = 33
            Width = 173
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DataField = ''
            Enabled = False
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 0
            Visible = True
          end
          object dbdtDate: TDBDateTimeEditEh
            Left = 9
            Top = 33
            Width = 173
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            BorderStyle = bsNone
            Color = clBtnFace
            DynProps = <>
            Enabled = False
            EditButton.Visible = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Flat = True
            Kind = dtkDateEh
            ParentFont = False
            TabOrder = 1
            Visible = True
          end
          object dbeProtocol: TDBEditEh
            Left = 405
            Top = 33
            Width = 173
            Height = 21
            AlwaysShowBorder = True
            BorderStyle = bsNone
            Color = clBtnFace
            DynProps = <>
            EditButtons = <>
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = True
          end
        end
      end
      object tsPrepods: TTabSheet
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        ImageIndex = 67
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar2'
          Images = ImageList1
          TabOrder = 0
          object ToolButton20: TToolButton
            Left = 0
            Top = 0
            Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085' '#1074' MS Excel'
            ImageIndex = 20
            ParentShowHint = False
            ShowHint = True
            OnClick = actExportPlanExecute
          end
        end
        object Panel20: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 45
          Align = alTop
          TabOrder = 1
          object Label41: TLabel
            Left = 42
            Top = 11
            Width = 70
            Height = 13
            Caption = #1059#1095#1077#1073#1085#1099#1081' '#1075#1086#1076':'
          end
          object dbcbPlanDep: TDBLookupComboboxEh
            Left = 116
            Top = 8
            Width = 173
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            DataField = ''
            EditButtons = <>
            Flat = True
            TabOrder = 0
            Visible = True
            OnKeyValueChanged = dbcbPlanDepKeyValueChanged
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 67
          Width = 918
          Height = 296
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1085#1086#1074
          TabOrder = 2
          object dbeDep: TDBGridEh
            Left = 2
            Top = 15
            Width = 914
            Height = 279
            Align = alClient
            AutoFitColWidths = True
            DataSource = DSPrep
            DynProps = <>
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterParams.Color = clWindow
            IndicatorOptions = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleParams.MultiTitle = True
            TitleParams.RowHeight = 15
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object Panel21: TPanel
          Left = 0
          Top = 363
          Width = 918
          Height = 52
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 3
          ExplicitLeft = 1
          ExplicitTop = 339
          ExplicitWidth = 916
          ExplicitHeight = 53
          object Label52: TLabel
            Left = 7
            Top = 8
            Width = 34
            Height = 13
            Caption = #1048#1090#1086#1075#1086':'
          end
          object Label53: TLabel
            Left = 60
            Top = 8
            Width = 122
            Height = 13
            Caption = #1075#1086#1076#1086#1074#1086#1081' '#1086#1073#1098#1077#1084' '#1085#1072' '#1059#1052#1056':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label54: TLabel
            Left = 306
            Top = 8
            Width = 81
            Height = 13
            Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label55: TLabel
            Left = 393
            Top = 8
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label56: TLabel
            Left = 188
            Top = 8
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1095#1072#1089#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103' '#1087#1086' '#1074#1099#1073#1088 +
              #1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label57: TLabel
            Left = 506
            Top = 8
            Width = 131
            Height = 13
            Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label58: TLabel
            Left = 643
            Top = 8
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label59: TLabel
            Left = 393
            Top = 27
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label60: TLabel
            Left = 328
            Top = 27
            Width = 59
            Height = 13
            Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label61: TLabel
            Left = 528
            Top = 27
            Width = 109
            Height = 13
            Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label62: TLabel
            Left = 643
            Top = 27
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label63: TLabel
            Left = 758
            Top = 8
            Width = 71
            Height = 13
            Caption = #1055#1083#1072#1085' ('#1082#1086#1083'-'#1074#1086'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label64: TLabel
            Left = 759
            Top = 27
            Width = 70
            Height = 13
            Caption = #1060#1072#1082#1090'('#1082#1086#1083'-'#1074#1086'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label65: TLabel
            Left = 833
            Top = 8
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label66: TLabel
            Left = 833
            Top = 27
            Width = 3
            Height = 13
            Hint = 
              #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
              #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1055#1083#1072#1085' '#1080#1079#1076#1072#1085#1080#1103' '#1082#1072#1092#1077#1076#1088#1099
        ImageIndex = 23
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar2'
          Images = ImageList1
          TabOrder = 0
          object ToolButton17: TToolButton
            Left = 0
            Top = 0
            Action = actExportPlanEd
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 393
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            918
            394)
          object Label3: TLabel
            Left = 21
            Top = 12
            Width = 53
            Height = 13
            Caption = #1055#1083#1072#1085' '#1059#1052#1056':'
          end
          object Label4: TLabel
            Left = 9
            Top = 51
            Width = 65
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
            Enabled = False
          end
          object dbgPlanEd: TDBGridEh
            Left = 4
            Top = 75
            Width = 909
            Height = 275
            AllowedOperations = []
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoFitColWidths = True
            DataSource = dsPlanEdDep
            DynProps = <>
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterParams.Color = clWindow
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            RowHeight = 5
            RowLines = 2
            TabOrder = 0
            TitleParams.MultiTitle = True
            TitleParams.RowHeight = 15
            OnTitleClick = dbgPlanDepTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object dbcbPlanEd: TDBLookupComboboxEh
            Left = 88
            Top = 8
            Width = 381
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            DataField = ''
            EditButtons = <>
            Flat = True
            TabOrder = 1
            Visible = True
            OnKeyValueChanged = dbcbPlanEdKeyValueChanged
          end
          object chbDiscEd: TCheckBox
            Left = 88
            Top = 30
            Width = 139
            Height = 17
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091
            TabOrder = 2
            OnClick = chbDiscEdClick
          end
          object dbcbDiscPlanEd: TDBLookupComboboxEh
            Left = 88
            Top = 48
            Width = 381
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            DataField = ''
            Enabled = False
            EditButtons = <>
            Flat = True
            TabOrder = 3
            Visible = True
            OnKeyValueChanged = dbcbDiscPlanEdKeyValueChanged
          end
          object Panel14: TPanel
            Left = 1
            Top = 348
            Width = 916
            Height = 45
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 4
            ExplicitTop = 347
            object Label32: TLabel
              Left = 7
              Top = 8
              Width = 34
              Height = 13
              Caption = #1048#1090#1086#1075#1086':'
            end
            object Label33: TLabel
              Left = 61
              Top = 8
              Width = 122
              Height = 13
              Caption = #1075#1086#1076#1086#1074#1086#1081' '#1086#1073#1098#1077#1084' '#1085#1072' '#1059#1052#1056':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 306
              Top = 8
              Width = 81
              Height = 13
              Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 393
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label36: TLabel
              Left = 188
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1095#1072#1089#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103' '#1087#1086' '#1074#1099#1073#1088 +
                #1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label37: TLabel
              Left = 506
              Top = 8
              Width = 131
              Height = 13
              Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 643
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #1060#1072#1082#1090' '#1059#1052#1056' '#1082#1072#1092#1077#1076#1088#1099
        ImageIndex = 6
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar7: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar2'
          Images = ImageList1
          TabOrder = 0
          object ToolButton16: TToolButton
            Left = 0
            Top = 0
            Action = actExportFact
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 393
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            918
            394)
          object Label17: TLabel
            Left = 9
            Top = 67
            Width = 65
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
            Enabled = False
          end
          object Label9: TLabel
            Left = 21
            Top = 27
            Width = 53
            Height = 13
            Caption = #1055#1083#1072#1085' '#1059#1052#1056':'
            Enabled = False
          end
          object Label39: TLabel
            Left = 531
            Top = 32
            Width = 230
            Height = 13
            AutoSize = False
            Caption = '- '#1059#1052#1056', '#1089#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '#1082#1086#1090#1086#1088#1099#1093' '#1080#1089#1090#1077#1082
          end
          object Image1: TImage
            Left = 502
            Top = 31
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036040000424D360400000000000036000000280000001000
              0000100000000100200000000000000400000000000000000000000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00B5B6B5006B696B009C9E9C00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00E7E7E700A5A6A50094969400FF00FF00FF00
              FF009479EF002900DE003928A50063616300CECFCE00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00D6D7D6006351B5002900DE00A5A6A500FF00FF00FF00
              FF00BDAEF7002900DE003108DE0052496B007B797B00DEDFDE00FF00FF00FF00
              FF00FF00FF00CEC7D6004228C6002900DE007B69CE00FF00FF00FF00FF00FF00
              FF00FF00FF008471EF002900DE003918D6005A595A0094969400E7E7E700FF00
              FF00CEC7D6003918CE002900DE00A59EC600FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF007B61EF002900DE005238C6006361630094969400B5B6
              C6003918CE002900DE00A59EC600FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF007B61EF002900DE005230C60052515A003110
              C6002900D600A59EC600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF007B59EF002900DE002900D6002900
              D6006B618C00DEDFDE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00CEC7D6002908DE002900DE004228
              C6007371730094969400D6D7D600FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00CEC7D6003918CE002900DE007359CE003108
              E7005A38D6007B798C0084868400C6C7C600FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00CEC7D6003918CE002900DE008C86BD00FF00FF00FF00
              FF004218E7004A28DE007B719C007B797B00B5B6B500FF00FF00FF00FF00FF00
              FF00FF00FF00BDBEC6003910CE002900DE007361B500FF00FF00FF00FF00FF00
              FF00FF00FF005A41E7003108DE007B69B5008C8E8C00DEDFDE00FF00FF00FF00
              FF00C6BEEF003910CE002900DE005A41B500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009479EF002900DE00CECFE700FF00FF00FF00FF00FF00
              FF004218E7002900DE004228C600FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF003110E7004A28E700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00}
            Stretch = True
            Transparent = True
          end
          object Image2: TImage
            Left = 502
            Top = 56
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036040000424D360400000000000036000000280000001000
              0000100000000100200000000000000400000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00001C7598C3237696FF1E789BFF1B7396FF1B7396FF196F92FF186C8FFF186C
              8FFF156487FF156487FF146285FF125D80FF125D80FF10577AFF10587BFF1767
              8AA41E6E8EFE98F2EFFF8AEBEDFF7BE9F0FF6FE4EFFF62DFEEFF54D9EDFF46D3
              EBFF39CEEAFF2DC9E9FF21C4E7FF17C0E6FF0FBDE6FF08BAE5FF0C91B8FF1568
              8BEB3390AE7781DFE5FF9BF5F2FF87EEF2FF7BE9F0FF6FE4EFFF60D4E1FF3148
              4CFF1A2D2FFF38C0DAFF2DC9E9FF21C4E7FF17C0E6FF0BBBE5FF0B97BFFE0E62
              86A50000000043A9C4E99CF6F3FF9AF6F3FF87EEF2FF7BE9F0FF67B7BFFF515A
              5BFF383939FF2C8291FF44D3EBFF44D1EBFF1DC2E7FF09B8E2FF0F7195F20000
              0000000000003A9BB73F69CFDFFE9DF7F3FF93F3F3FF87EEF2FF77DAE1FF5094
              9BFF478D95FF54D1E4FF3ACEEAFF3FD0EAFF20C3E7FF0C8EB5FE0E688D4C0000
              000000000000000000003EA3BFD08EE8E9FC9DF7F3FF91F2F3FF84E5E9FF3247
              47FF355559FF58C7D4FF51D7ECFF4FD7ECFF1CBCE1FD0F6C91D4000000000000
              0000000000000000000042A9C41D59C2D8FD9DF7F3FF9BF6F3FF7DBFBFFF5352
              53FF2C2F31FF60B7BFFF66E0EFFF54D9EDFF2099BBFE0F6D9120000000000000
              00000000000000000000000000003DA1BDA87DD9E0FD9EF7F3FF617D7CFF7171
              71FF403F3EFF3D6D71FF6FE3EEFF3CC4DEFE0F698EA300000000000000000000
              000000000000000000000000000050C0DA094CB7D2F99DF7F3FF555A59FF8F8F
              8FFF686868FF0F1717FF61DDEBFF1582A6F80F71960500000000000000000000
              0000000000000000000000000000000000003FA3BF7767C9D8FD657B7AFFACAC
              ACFF828282FF181C1BFF33B5D0FF0F6B8F670000000000000000000000000000
              0000000000000000000000000000000000000000000048B1CBEB95DEDCFF647C
              7BFF4F5959FF69BCC4FF1C84A5E7000000000000000000000000000000000000
              0000000000000000000000000000000000000000000042A8C44C5EC3D6FD9DF7
              F3FF75E4ECFF3ABAD4FF0F6E932E000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000043AAC6D67ED8
              DDFA77CFD6FD0F6B90B500000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000050C0DA2041AA
              C5FC0F6D91F90F71961300000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000}
            Stretch = True
            Transparent = True
          end
          object Label40: TLabel
            Left = 531
            Top = 57
            Width = 377
            Height = 13
            AutoSize = False
            Caption = 
              '- '#1059#1052#1056', '#1089#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '#1082#1086#1090#1086#1088#1099#1093' '#1080#1089#1090#1077#1082#1072#1077#1090' '#1084#1077#1085#1077#1077' '#1095#1077#1084' '#1095#1077#1088#1077#1079'           ' +
              #1084#1077#1089#1103#1094#1077#1074
          end
          object dbgFact: TDBGridEh
            Left = 4
            Top = 91
            Width = 909
            Height = 259
            AllowedOperations = []
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoFitColWidths = True
            DataSource = dsFactDep
            DynProps = <>
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            FooterParams.Color = clWindow
            IndicatorOptions = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            RowHeight = 5
            RowLines = 2
            TabOrder = 0
            TitleParams.MultiTitle = True
            TitleParams.RowHeight = 15
            OnDrawColumnCell = dbgFactDrawColumnCell
            OnTitleClick = dbgPlanDepTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object chbFact: TCheckBox
            Left = 88
            Top = 46
            Width = 139
            Height = 17
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091
            TabOrder = 1
            OnClick = chbFactClick
          end
          object dbcbDisc: TDBLookupComboboxEh
            Left = 88
            Top = 64
            Width = 381
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            DataField = ''
            Enabled = False
            EditButtons = <>
            Flat = True
            TabOrder = 2
            Visible = True
            OnKeyValueChanged = dbcbDiscKeyValueChanged
          end
          object dbcbYearFact: TDBLookupComboboxEh
            Left = 88
            Top = 24
            Width = 381
            Height = 21
            AlwaysShowBorder = True
            AutoSize = False
            DataField = ''
            Enabled = False
            EditButtons = <>
            Flat = True
            TabOrder = 3
            Visible = True
            OnKeyValueChanged = dbcbYearFactKeyValueChanged
          end
          object chbYearFact: TCheckBox
            Left = 88
            Top = 6
            Width = 139
            Height = 17
            Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1083#1072#1085
            TabOrder = 4
            OnClick = chbYearFactClick
          end
          object Panel3: TPanel
            Left = 1
            Top = 348
            Width = 916
            Height = 45
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 5
            ExplicitTop = 347
            object Label14: TLabel
              Left = 7
              Top = 8
              Width = 34
              Height = 13
              Caption = #1048#1090#1086#1075#1086':'
            end
            object Label19: TLabel
              Left = 61
              Top = 8
              Width = 122
              Height = 13
              Caption = #1075#1086#1076#1086#1074#1086#1081' '#1086#1073#1098#1077#1084' '#1085#1072' '#1059#1052#1056':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 330
              Top = 8
              Width = 59
              Height = 13
              Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 393
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label22: TLabel
              Left = 188
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1095#1072#1089#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103' '#1087#1086' '#1074#1099#1073#1088 +
                #1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label23: TLabel
              Left = 530
              Top = 8
              Width = 109
              Height = 13
              Caption = #1074#1099#1087#1086#1083#1085#1077#1085#1086' ('#1101#1082#1089#1087#1077#1088#1090'):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 643
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', ' +
                #1082#1086#1090#1086#1088#1099#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1079#1072' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1084
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
          end
          object eCountM: TEdit
            Left = 827
            Top = 54
            Width = 25
            Height = 21
            TabOrder = 6
            Text = '12'
            OnExit = eCountMExit
            OnKeyPress = eCountMKeyPress
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1054#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1079#1072#1085#1103#1090#1080#1081
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar2'
          Images = ImageList1
          TabOrder = 0
          Visible = False
          object ToolButton30: TToolButton
            Left = 0
            Top = 0
            Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1079#1072#1085#1103#1090#1080#1081'...'
            ImageIndex = 12
            ParentShowHint = False
            ShowHint = True
            OnClick = actAddMWExecute
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 393
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel16: TPanel
            Left = 1
            Top = 1
            Width = 916
            Height = 41
            Align = alTop
            TabOrder = 0
            DesignSize = (
              916
              41)
            object Label2: TLabel
              Left = 11
              Top = 14
              Width = 67
              Height = 13
              Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081':'
            end
            object dbcbVidZan: TDBLookupComboboxEh
              Left = 86
              Top = 11
              Width = 419
              Height = 21
              AlwaysShowBorder = True
              AutoSize = False
              Anchors = [akLeft, akTop, akRight]
              DataField = ''
              EditButtons = <>
              Flat = True
              TabOrder = 0
              Visible = True
              OnKeyValueChanged = dbcbVidZanKeyValueChanged
            end
          end
          object Panel17: TPanel
            Left = 1
            Top = 42
            Width = 916
            Height = 351
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 350
            object dbgVidZanyat: TDBGridEh
              Left = 1
              Top = 1
              Width = 874
              Height = 348
              Align = alClient
              AutoFitColWidths = True
              DataSource = DSWarrant
              DynProps = <>
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              FooterParams.Color = clWindow
              IndicatorOptions = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleParams.MultiTitle = True
              TitleParams.RowHeight = 15
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object Panel18: TPanel
              Left = 875
              Top = 1
              Width = 40
              Height = 348
              Align = alRight
              Anchors = [akRight, akBottom]
              BevelEdges = [beBottom]
              BevelKind = bkFlat
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                40
                347)
              object SpeedButton1: TSpeedButton
                Left = 9
                Top = 28
                Width = 23
                Height = 22
                Action = actRemWarrant
                Anchors = [akTop, akRight]
                Flat = True
                Glyph.Data = {
                  36080000424D3608000000000000360000002800000020000000100000000100
                  2000000000000008000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00D4CCC7006349350063493500634935006349350063493500634935006349
                  35006349350063493500D4CCC700FF00FF00FF00FF00FF00FF00777777007777
                  77008F8F8F003434340034343400343434003434340034343400343434003434
                  340034343400343434008F8F8F00777777007777770077777700FF00FF00FF00
                  FF00B8A49400F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
                  BB00EBCAB800EAC8B50063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A1A1A1009E9E9E009C9C9C009999990096969600949494009393
                  9300919191008F8F8F0034343400777777007777770077777700FF00FF00FF00
                  FF00B8A49400F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
                  BF00ECCDBB00EBCAB80063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A4A4A400A1A1A1009E9E9E009C9C9C0099999900969696009494
                  9400939393009191910034343400777777007777770077777700FF00FF00FF00
                  FF00B8A49400F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3
                  C400EDD0BF00ECCDBB0063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A6A6A600A4A4A400A1A1A1009E9E9E009C9C9C00999999009696
                  9600949494009393930034343400777777007777770077777700FF00FF00FF00
                  FF00B9A59500F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
                  C900EED3C400EDD0BF0063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A9A9A900A6A6A600A4A4A400A1A1A1009E9E9E009C9C9C009999
                  9900969696009494940034343400777777007777770077777700FF00FF00FF00
                  FF00BCA69700FBF4F000F9F0EB00634935006349350063493500634935006349
                  3500F0D7C900EED3C40063493500FF00FF00FF00FF00FF00FF00777777007777
                  770076767600ACACAC00A9A9A900343434003434340034343400343434003434
                  3400999999009696960034343400777777007777770077777700FF00FF00FF00
                  FF00BEA89A00FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
                  D400F1DBCF00F0D7C90063493500FF00FF00FF00FF00FF00FF00777777007777
                  770077777700AEAEAE00ACACAC00A9A9A900A6A6A600A4A4A400A1A1A1009E9E
                  9E009C9C9C009999990034343400777777007777770077777700FF00FF00FF00
                  FF00C0AB9C00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
                  DA00F3DFD400F1DBCF0063493500FF00FF00FF00FF00FF00FF00777777007777
                  770079797900AFAFAF00AEAEAE00ACACAC00A9A9A900A6A6A600A4A4A400A1A1
                  A1009E9E9E009C9C9C0034343400777777007777770077777700FF00FF00FF00
                  FF00C3AC9D00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8
                  E000F4E3DA00F3DFD40063493500FF00FF00FF00FF00FF00FF00777777007777
                  77007A7A7A00B1B1B100AFAFAF00AEAEAE00ACACAC00A9A9A900A6A6A600A4A4
                  A400A1A1A1009E9E9E0034343400777777007777770077777700FF00FF00FF00
                  FF00C4AE9E00FFFFFF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8EC
                  E500F6E8E000F4E3DA0063493500FF00FF00FF00FF00FF00FF00777777007777
                  77007B7B7B00B2B2B200B1B1B100AFAFAF00AEAEAE00ACACAC00A9A9A900A6A6
                  A600A4A4A400A1A1A10034343400777777007777770077777700FF00FF00FF00
                  FF00EFE8E400C3AD9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A3
                  9400B8A39400B8A39400D4CCC700FF00FF00FF00FF00FF00FF00777777007777
                  7700A3A3A3007B7B7B007A7A7A00797979007777770076767600757575007373
                  730073737300737373008F8F8F00777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                ExplicitLeft = 2
              end
              object SpeedButton2: TSpeedButton
                Left = 9
                Top = 5
                Width = 23
                Height = 22
                Action = actAddWarrant
                Anchors = [akTop, akRight]
                Flat = True
                Glyph.Data = {
                  36080000424D3608000000000000360000002800000020000000100000000100
                  2000000000000008000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00D4CCC7006349350063493500634935006349350063493500634935006349
                  35006349350063493500D4CCC700FF00FF00FF00FF00FF00FF00777777007777
                  77008F8F8F003434340034343400343434003434340034343400343434003434
                  340034343400343434008F8F8F00777777007777770077777700FF00FF00FF00
                  FF00B8A49400F4E3DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9
                  A500D6B7A300D6B6A20063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A1A1A100939393008C8C8C008787870086868600858585008484
                  8400838383008282820034343400777777007777770077777700FF00FF00FF00
                  FF00B8A49400F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
                  BF00ECCDBB00D6B7A30063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A4A4A400A1A1A1009E9E9E009C9C9C0099999900969696009494
                  9400939393008383830034343400777777007777770077777700FF00FF00FF00
                  FF00B8A49400F8ECE500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3
                  C400EDD0BF00D7B9A50063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A6A6A600A4A4A400A1A1A1009E9E9E0034343400999999009696
                  9600949494008484840034343400777777007777770077777700FF00FF00FF00
                  FF00B9A59500F9F0EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7
                  C900EED3C400D7BAA70063493500FF00FF00FF00FF00FF00FF00777777007777
                  770074747400A9A9A900A6A6A600A4A4A400A1A1A100343434009C9C9C009999
                  9900969696008585850034343400777777007777770077777700FF00FF00FF00
                  FF00BCA69700FBF4F000F9F0EB00634935006349350063493500634935006349
                  3500F0D7C900D8BCA90063493500FF00FF00FF00FF00FF00FF00777777007777
                  770076767600ACACAC00A9A9A900343434003434340034343400343434003434
                  3400999999008686860034343400777777007777770077777700FF00FF00FF00
                  FF00BEA89A00FCF7F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DF
                  D400F1DBCF00D9BEAC0063493500FF00FF00FF00FF00FF00FF00777777007777
                  770077777700AEAEAE00ACACAC00A9A9A900A6A6A60034343400A1A1A1009E9E
                  9E009C9C9C008787870034343400777777007777770077777700FF00FF00FF00
                  FF00C0AB9C00FDFAF900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3
                  DA00F3DFD400D9C0AF0063493500FF00FF00FF00FF00FF00FF00777777007777
                  770079797900AFAFAF00AEAEAE00ACACAC00A9A9A90034343400A4A4A400A1A1
                  A1009E9E9E008888880034343400777777007777770077777700FF00FF00FF00
                  FF00C3AC9D00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8
                  E000F4E3DA00E1CDC00063493500FF00FF00FF00FF00FF00FF00777777007777
                  77007A7A7A00B1B1B100AFAFAF00AEAEAE00ACACAC00A9A9A900A6A6A600A4A4
                  A400A1A1A1009191910034343400777777007777770077777700FF00FF00FF00
                  FF00C4AE9E00FFFFFF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8EC
                  E500F6E8E000F4E3DA0063493500FF00FF00FF00FF00FF00FF00777777007777
                  77007B7B7B00B2B2B200B1B1B100AFAFAF00AEAEAE00ACACAC00A9A9A900A6A6
                  A600A4A4A400A1A1A10034343400777777007777770077777700FF00FF00FF00
                  FF00EFE8E400C3AD9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A3
                  9400B8A39400B8A39400D4CCC700FF00FF00FF00FF00FF00FF00777777007777
                  7700A3A3A3007B7B7B007A7A7A00797979007777770076767600757575007373
                  730073737300737373008F8F8F00777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00777777007777
                  7700777777007777770077777700777777007777770077777700777777007777
                  7700777777007777770077777700777777007777770077777700}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                ExplicitLeft = 2
              end
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1043#1054#1057' '#1085#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1080
        ImageIndex = 70
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar6: TToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 22
          AutoSize = True
          Caption = 'ToolBar1'
          Images = ImageList2
          TabOrder = 0
          object ToolButton5: TToolButton
            Left = 0
            Top = 0
            Action = actAddGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton10: TToolButton
            Left = 23
            Top = 0
            Action = actDelGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton11: TToolButton
            Left = 46
            Top = 0
            Action = actAddItemGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 69
            Top = 0
            Action = actEditItemGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton12: TToolButton
            Left = 92
            Top = 0
            Action = actDelItemGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton13: TToolButton
            Left = 115
            Top = 0
            Action = actAddDiscGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton14: TToolButton
            Left = 138
            Top = 0
            Action = actEditDiscGos
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton15: TToolButton
            Left = 161
            Top = 0
            Action = actDelDiscGos
            ParentShowHint = False
            ShowHint = True
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 22
          Width = 918
          Height = 393
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Splitter1: TSplitter
            Left = 1
            Top = 220
            Width = 916
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitTop = 223
            ExplicitWidth = 685
          end
          object GroupBox4: TGroupBox
            Left = 1
            Top = 36
            Width = 916
            Height = 184
            Align = alTop
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1091#1085#1082#1090#1072' '#1043#1054#1057#1072
            TabOrder = 0
            object Panel9: TPanel
              Left = 2
              Top = 15
              Width = 912
              Height = 41
              Align = alTop
              TabOrder = 0
              object Label6: TLabel
                Left = 69
                Top = 14
                Width = 34
                Height = 13
                Caption = #1055#1091#1085#1082#1090':'
              end
              object dbcbItemGos: TDBLookupComboboxEh
                Left = 110
                Top = 11
                Width = 437
                Height = 21
                AlwaysShowBorder = True
                AutoSize = False
                DataField = ''
                EditButtons = <>
                Flat = True
                TabOrder = 0
                Visible = True
                OnKeyValueChanged = dbcbItemGosKeyValueChanged
              end
            end
            object Panel10: TPanel
              Left = 2
              Top = 56
              Width = 912
              Height = 126
              Align = alClient
              Caption = 'Panel10'
              TabOrder = 1
              object DBMemo1: TDBMemo
                Left = 1
                Top = 1
                Width = 910
                Height = 124
                Align = alClient
                DataField = 'ContentItemGos'
                DataSource = dsItemGos
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
          object GroupBox3: TGroupBox
            Left = 1
            Top = 223
            Width = 916
            Height = 169
            Align = alClient
            Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099' '#1087#1086' '#1043#1054#1057#1091
            TabOrder = 1
            object Panel11: TPanel
              Left = 2
              Top = 121
              Width = 912
              Height = 46
              Align = alClient
              Caption = 'Panel10'
              TabOrder = 0
              object DBMemo2: TDBMemo
                Left = 1
                Top = 1
                Width = 910
                Height = 44
                Align = alClient
                DataField = 'ContentDiscOnGos'
                DataSource = dsDiscGos
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
            object Panel12: TPanel
              Left = 2
              Top = 15
              Width = 912
              Height = 106
              Align = alTop
              TabOrder = 1
              object Label5: TLabel
                Left = 39
                Top = 61
                Width = 65
                Height = 13
                Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072':'
              end
              object Label7: TLabel
                Left = 25
                Top = 86
                Width = 78
                Height = 13
                Caption = #1064#1080#1092#1088' '#1087#1086' '#1043#1054#1057#1091':'
              end
              object Label10: TLabel
                Left = 215
                Top = 86
                Width = 64
                Height = 13
                Caption = #1042#1089#1077#1075#1086' '#1095#1072#1089#1086#1074':'
              end
              object Label11: TLabel
                Left = 17
                Top = 12
                Width = 87
                Height = 13
                Caption = #1062#1080#1082#1083' '#1076#1080#1089#1094#1080#1087#1083#1080#1085':'
              end
              object Label12: TLabel
                Left = 7
                Top = 37
                Width = 96
                Height = 13
                Caption = #1043#1088#1091#1087#1087#1072' '#1076#1080#1089#1094#1080#1087#1083#1080#1085':'
              end
              object Label13: TLabel
                Left = 109
                Top = 86
                Width = 3
                Height = 13
              end
              object Label16: TLabel
                Left = 285
                Top = 86
                Width = 3
                Height = 13
              end
              object dbcbDiscGos: TDBLookupComboboxEh
                Left = 110
                Top = 61
                Width = 437
                Height = 21
                AlwaysShowBorder = True
                AutoSize = False
                DataField = ''
                EditButtons = <>
                Flat = True
                TabOrder = 0
                Visible = True
                OnKeyValueChanged = dbcbDiscGosKeyValueChanged
              end
              object dbcbCklDisc: TDBLookupComboboxEh
                Left = 110
                Top = 12
                Width = 437
                Height = 21
                AlwaysShowBorder = True
                AutoSize = False
                DataField = ''
                EditButtons = <>
                Flat = True
                TabOrder = 1
                Visible = True
                OnKeyValueChanged = dbcbCklDiscKeyValueChanged
              end
              object dbcbGrpDisc: TDBLookupComboboxEh
                Left = 110
                Top = 37
                Width = 437
                Height = 21
                AlwaysShowBorder = True
                AutoSize = False
                DataField = ''
                EditButtons = <>
                Flat = True
                TabOrder = 2
                Visible = True
                OnKeyValueChanged = dbcbCklDiscKeyValueChanged
              end
            end
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 916
            Height = 35
            Align = alTop
            TabOrder = 2
            object Label8: TLabel
              Left = 333
              Top = 10
              Width = 25
              Height = 13
              Caption = #1043'OC:'
            end
            object Label18: TLabel
              Left = 24
              Top = 10
              Width = 82
              Height = 13
              Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
            end
            object dbcbYearGos: TDBLookupComboboxEh
              Left = 364
              Top = 7
              Width = 185
              Height = 21
              AlwaysShowBorder = True
              AutoSize = False
              DataField = ''
              EditButtons = <>
              Flat = True
              TabOrder = 0
              Visible = True
              OnKeyValueChanged = dbcbYearGosKeyValueChanged
            end
            object dbcbSpec: TDBLookupComboboxEh
              Left = 112
              Top = 8
              Width = 216
              Height = 21
              AlwaysShowBorder = True
              AutoSize = False
              DataField = ''
              EditButtons = <>
              Flat = True
              TabOrder = 1
              Visible = True
              OnKeyValueChanged = dbcbSpecKeyValueChanged
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 451
    Width = 930
    ExplicitTop = 451
    ExplicitWidth = 930
    inherited bbSave: TBitBtn
      Left = 761
      Action = actSave
      ExplicitLeft = 761
    end
    inherited bbUndo: TBitBtn
      Left = 593
      Action = actUndo
      ExplicitLeft = 593
    end
  end
  object DSPrep: TDataSource
    DataSet = dmMethodWork.adsPlanRatify
    OnDataChange = DSPrepDataChange
    Left = 48
    Top = 248
  end
  object ImageList1: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Left = 444
    Top = 285
    Bitmap = {
      494C01011A001C005C0010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007000000001002000000000000070
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018739C0021739400187B9C001873
      940018739400186B9400186B8C00186B8C00106384001063840010638400105A
      8400105A840010527B00105A7B0010638C00FFFFFF00FFFFFF00FFFFFF007B7B
      7B00DEDEDE00E7E7EF0094A5AD007B7B7B00848C8C00B5C6C600FFFFFF009C9C
      9C006B6B6B00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186B8C009CF7EF008CEFEF007BEF
      F7006BE7EF0063DEEF0052DEEF0042D6EF0039CEEF0029CEEF0021C6E70010C6
      E70008BDE70008BDE7000894BD00106B8C00FFFFFF00FFFFFF0094949400E7E7
      E7006394AD0031BDE70039CEEF00429CB5004ABDD60052DEF70052BDD600849C
      9C00EFEFEF006B6B6B00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003194AD0084DEE7009CF7F70084EF
      F7007BEFF7006BE7EF0063D6E700314A4A001829290039C6DE0029CEEF0021C6
      E70010C6E70008BDE7000894BD0008638400FFFFFF0084848400CED6D60031A5
      CE0029ADDE0031BDE7002139420039393900524A4A004ACEE7004AD6F7004AD6
      EF00638C9C00EFEFEF006B6B6B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0042ADC6009CF7F7009CF7
      F70084EFF7007BEFF70063B5BD00525A5A00393939002984940042D6EF0042D6
      EF0018C6E70008BDE70008739400FFFFFF006B6B6B00FFFFFF0042ADCE0021AD
      DE0021ADDE0029B5E7002129290018181800211818004AC6DE004AD6F7004AD6
      EF004AD6EF00849C9C009C9C9C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00399CB5006BCEDE009CF7
      F70094F7F70084EFF70073DEE70052949C00428C940052D6E70039CEEF0039D6
      EF0021C6E700088CB500086B8C00FFFFFF0084848400A5B5BD0018BDE70021B5
      DE0021ADDE0029ADDE0031BDE700296B7B00319CB50042CEEF004AD6EF004AD6
      EF004AD6EF0052BDCE00FFFFFF006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0039A5BD008CEF
      EF009CF7F70094F7F70084E7EF003142420031525A005AC6D60052D6EF004AD6
      EF0018BDE700086B9400FFFFFF00FFFFFF00E7E7E7006BC6CE0031CEEF0018BD
      E70021B5DE0021ADDE003194B5004A4242005A4A4A0039C6EF0042C6EF0042CE
      EF0042CEEF0042CEEF00B5BDC6006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0042ADC6005AC6
      DE009CF7F7009CF7F7007BBDBD00525252002929310063B5BD0063E7EF0052DE
      EF00219CBD00086B9400FFFFFF00FFFFFF00FFFFFF004ADEEF0039DEEF0031CE
      EF0018BDE70021B5DE00217B9C00212121003131290031BDEF0031BDE70039BD
      E70039BDE70039BDE700848C8C006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0039A5
      BD007BDEE7009CF7F700637B7B007373730042393900396B73006BE7EF0039C6
      DE00086B8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF0039EFF70039E7F70039DE
      EF0039D6EF0021BDE70021738C00181818001810100029B5E70029B5DE0031B5
      DE0031B5E70031B5E7007B7B7B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0052C6
      DE004AB5D6009CF7F700525A5A008C8C8C006B6B6B000810100063DEEF001084
      A50008739400FFFFFF00FFFFFF00FFFFFF00F7F7F7005ADEE70031EFF70039E7
      F70039DEEF0039D6EF0042849400313131002118180021B5E70029ADDE0029AD
      DE0029B5DE0029B5DE0094A5AD006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0039A5BD0063CEDE00637B7B00ADADAD00848484001818180031B5D600086B
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60094CECE0031EFF70031EF
      F70039E7F70039DEEF005A8C94005A5A5A00524A4A0042BDE70042B5DE0042B5
      DE0042B5DE0042B5E700E7E7EF006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004AB5CE0094DEDE00637B7B004A5A5A006BBDC6001884A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073737300D6E7E70031F7F70031EF
      F70031EFF70039E7F7006B8C94006B6B6B006363630039BDE70042BDE70042B5
      DE0042B5DE006B9CAD00DEDEDE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0042ADC6005AC6D6009CF7F70073E7EF0039BDD600086B9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6009CCECE0031F7
      F70031EFF70031EFF70073848400736B6B00736B6B0039C6DE0042C6E70042BD
      E7004AADD600E7E7E7007B7B7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042ADC6007BDEDE0073CED600086B9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B00F7F7F700A5CE
      CE0031F7F70031EFF70031E7EF0039DEE70039D6E70039D6EF0039CEE7005AB5
      CE00D6D6D60094949400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0052C6DE0042ADC600086B940008739400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B00D6D6
      D600DEE7E70094CECE005ADEE70039EFF70042DEE7006BC6CE00A5B5BD00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0073737300C6C6C600F7F7F700FFFFFF00FFFFFF00E7E7E700848484006B6B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A0000004A0000004A0000004A
      0000004A0000004A000000520000005200000052000000520000005200000052
      000000520000005200000052000000210000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF009C9C94005252
      52004A4A4A00313129005A5A5200FFFFFF0052524A004A4A4200525252009494
      9400FFFFFF00292921004A4A4A005A5A5A000084000000840000007B0000007B
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000007B0000008C000000390000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7EFEF00B5ADA500AD9C8C00A5947B00A58C
      7300A5947B00AD9C8C00B5A59C00DEDED600FFFFFF00FFFFFF00FFFFFF008484
      8400F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FFFF0084848400FFFFFF00FFFFFF00949C8C00FFFF
      FF00FFFFFF00FFFFFF005A5A520084847B00FFFFFF00FFFFF700BDBDB5004242
      390084847B00EFE7D600FFF7EF009494840000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000FFFFFF00FFFFFF00F7F7F700E7E7
      E700E7E7E700E7E7E700EFEFEF00A5947B00B5947300F7D6BD00EFBD9400F7C6
      9400EFC69400DEB58C00BD9C7B00BDA58C00FFFFFF00FFFFFF00FFFFFF009494
      9400F7F7F700CEC6C600A58C8C00A58C8C00DED6D600F7F7F700D6CECE00CEC6
      C600F7F7FF00F7FFFF00FFFFFF0094949400FFFFFF00FFFFFF0094948C00FFFF
      FF00F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B0000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000DEDEDE0084948C00528C6B004A8C
      6B00428C6B005A8C7300427B5A00AD947300CEAD8400F7DEC600EFC69C00F7C6
      9C00F7CEA500E7C69C00CEA57B00B59C8C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C0094948C0094948C00F7F7F700D6CECE00CEC6
      C600FFFFFF00FFFFFF00FFFFFF009C9C9C00FFFFFF00FFFFFF0094948400FFFF
      FF00EFDED600C6B5A500C6B5A500CEBDAD00E7DED600F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B0000840000F7EFF70031A53100299C
      2900299429002994290029942900299429002994290021942100299429000084
      000000840000D6E7D600007B000000390000BDBDBD006BC69C0063C694005ABD
      8C0052B58400A5C6AD005AA57B00ADA57300E7B59400F7DECE00FFDEBD00FFCE
      9C00FFD6AD00EFCEAD00CEA58400AD947B0094948C00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F70094948C00F7F7FF00D6CECE00D6C6
      C600FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00FFFFFF0094948C00FFFF
      FF00C6AD9C00FFFFFF00FFFFFF00FFFFFF00D6BDB500F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B0000840000F7EFF700008400000084
      0000008C0000008C0000008C0000008C00000084000094BD9400008400000084
      00009CA59C00F7EFF700007B000000390000DEDEDE0073CEA5006BC6940063BD
      94006BC69400D6E7C60063B594008CAD7300FFD6A500DECEBD00D6CEC600E7BD
      9C00FFCEA500EFC69C00DEAD7B00C6B5A50094948C00FFFFFF00B5B5AD00B5B5
      AD00FFFFFF00B5B5AD00B5B5AD00FFFFFF0094948C00CEBDBD00BDA5AD00D6C6
      C600FFFFFF00FFFFFF00FFFFFF00ADADAD009C9C9400525252007B847300FFF7
      F700AD9C8400FFFFFF00FFFFFF00FFFFFF00DEC6BD00F7EFE700C6B5A500C6B5
      A500C6B5A500C6B5A500F7EFE7008C8C7B0000840000F7EFF700FFF7FF000084
      0000008C0000008C0000008C000000840000A5C6A50000840000008C0000088C
      0800F7EFF700F7EFF700007B000000390000EFEFEF007BCEA50073CEA5006BC6
      940084C6AD00B5CEBD0063AD84004AAD7300ADA584007B7B8C0008427B004263
      8400CEAD8400DEB58C00C6B5A500F7F7F70094948C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094948C00FFFFFF00CEBDC600D6C6
      CE00FFFFFF00FFFFFF00FFFFFF00B5B5B500949C8C00FFFFFF00848C7B00FFFF
      F700C6B5A500FFFFFF00FFFFFF00FFFFFF00D6C6BD00F7EFE700D6C6B500D6C6
      B500D6C6B500D6C6B500FFF7EF008484730000840000F7EFF700F7EFF700FFFF
      FF00088C08000084000000840000B5CEB5000084000000840000008400000084
      000042A54200F7EFF700007B000000390000FFFFFF00C6EFD60073CEA50063BD
      94006394B5005284A500397B5A0063A58400738C9400315A8400214A7B00184A
      7B006B737B00E7D6C600FFFFFF00FFFFFF0094948C00FFFFFF00B5B5AD00B5B5
      AD00FFFFFF00B5B5AD00B5B5AD00FFFFFF0094948C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5B5B50094948C00FFFFFF0094948400FFFF
      FF00EFDED600C6B5A500C6B5A500C6AD9400EFDED600F7EFE700C6B5A500C6B5
      A500C6B5A500C6B5A500FFF7EF008C8C7B0000840000F7EFF700F7EFF700F7EF
      F700F7EFF70000840000B5CEB50000840000008400007BAD7B00F7EFF700F7EF
      F700F7EFF700F7EFF700007B000000390000FFFFFF00FFFFFF00D6EFE70063B5
      94004A7BAD005A84AD0094ADAD00E7EFE7005A84AD00426B9C00396394002952
      8400DEDEDE00FFFFFF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094948C00BDADAD00A58C8C00A58C
      8C00F7F7F700FFFFFF00FFFFFF00B5B5B50094948400FFFFFF008C8C8400FFFF
      FF00EFDED600EFDED600EFDED600EFDED600EFDED600FFFFFF00FFFFF700FFF7
      F700F7F7F700F7EFE700FFFFF70094948C0000840000F7EFF700F7EFF700EFEF
      EF009CC69C00B5C6B50000840000008C0000008C000000840000BDBDBD00F7EF
      F700F7EFF700F7EFF700007B000000390000FFFFFF00FFFFFF009CB5C600316B
      840073A5CE0084ADDE005A7BA500A5B5C6006B94C60073737300525252000000
      0000DEDEDE00FFFFFF00FFFFFF00FFFFFF00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00216BBD00216BBD00AD9C9C00FFFFFF00CEBD
      C600DED6DE00FFFFFF00FFFFFF00BDBDBD0094948C00FFFFFF008C8C8400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094948C0094948C009494
      8C0094948C0094948C0094948C009C9C940000840000F7EFF700F7EFF700ADCE
      AD00B5CEB50000840000008400000084000000840000008C000000840000A5A5
      A500F7EFF700F7EFF700007B000000390000FFFFFF00FFFFFF005A94A5005A8C
      AD00A5CEFF0094C6F7006B94BD00BDCEDE008CB5DE00A59C9C00FFFFFF005294
      AD0008101000E7E7E700FFFFFF00FFFFFF00216BBD001084F700218CF700319C
      F70042ADF7004AB5F7005ABDFF005ABDFF00216BBD00BDADAD00FFFFFF00D6C6
      CE00DECED600FFFFFF00FFFFFF00BDBDBD0094948C00FFF7F700DEDED6009494
      8C0094948C0094948C0094948C0094948C0094948C00DEDED600C6B5A500C6B5
      A500F7EFE7008C8C7B00FFFFFF00FFFFFF0000840000F7EFF700B5CEB500BDCE
      BD0000840000008400005AAD5A00F7EFF700299C290000840000008C00000084
      0000D6CED600F7EFF700007B000000390000FFFFFF00FFFFFF00639CB5008CBD
      DE00CEF7FF00ADD6FF008CADD600FFFFFF00A5D6FF00A59C9C008CB5C60073CE
      E7004A9CB50008101000FFFFFF00FFFFFF00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00216BBD00216BBD00B5A5A500FFFFFF00CEC6
      C600DED6DE00E7E7E700DEDEE700BDBDBD00848C7B00FFFFF700CEB5A500FFFF
      FF00FFFFFF00FFFFFF00D6C6BD00F7EFE700D6C6B500D6C6B500D6C6B500D6C6
      B500FFF7EF0084847300FFFFFF00FFFFFF0000840000F7EFF7004AAD4A0052AD
      520052B5520073BD7300F7EFF700F7EFF700FFF7FF0063B5630052AD52003994
      390039A53900F7EFF700007B000000390000FFFFFF00FFFFFF008CBDCE006BA5
      C600BDE7F700ADD6FF0084A5CE00FFFFFF008CA5BD0052A5D6004A9CB5008CE7
      EF0063BDD6004A9CB50010101800FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      BD00FFFFFF00FFFFFF00DED6D600BDADAD00FFFFFF00BDADAD00A58C8C00A58C
      8C00B5B5B500BDBDBD00BDBDBD00BDBDBD0094948C00FFFFFF00EFDED600C6B5
      A500C6B5A500C6AD9C00EFDED600F7EFE700C6B5A500C6B5A500C6B5A500C6B5
      A500FFF7EF008C8C7B00FFFFFF00FFFFFF0000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000FFFFFF00FFFFFF00DEF7F70073BD
      D6005AA5B5005A94B50042739400FFFFFF00CECEC6008C8484006B63630052A5
      B5008CE7EF006BC6DE007B84840031319400FFFFFF00FFFFFF00FFFFFF00BDBD
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600F7F7F700BDBDBD00F7F7F70094948400FFFFFF00EFDED600EFDE
      D600EFDED600EFDED600EFDED600FFFFFF00FFFFF700FFF7F700F7F7F700F7EF
      E700FFFFF70094948C00FFFFFF00FFFFFF0000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000FFFFFF00FFFFFF00FFFFFF00DEFF
      FF00A5E7F70084CEDE007BBDCE00BDDEE700FFFFFF00F7F7F700DEDEDE00DEDE
      DE007BB5BD00CEBDAD007384D6005A6BAD00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00BDBDBD00F7F7F700FFFFFF0094948C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBDB500B5B5AD00ADADA500ADADA500A5AD
      9C00BDBDB5009C9C9400FFFFFF00FFFFFF000084000000840000008400000084
      000000840000008400000084000000840000008400000084000000840000008C
      0000008C000000840000008400004AAD4A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A6BAD00849CEF005A73D600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600BDBDBD00FFFFFF00FFFFFF00FFFFFF00DEDED600C6C6BD00BDC6B500BDC6
      B500BDC6B500BDC6B500BDBDB500DEDED600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094949400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007BA5B5005A94A500528494004A73840039636B00314A
      520031424A0029314200FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7
      F700BDADAD00B5A5A500F7F7F700F7F7FF00AD9C9C009C9494009C949400FFFF
      FF00FFFFFF009CA5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007BA5B50094E7F70073C6CE0063BDCE0063B5C6005AAD
      C600425A63002931420029314200FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7
      F700B5A5A500BDADAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BA5
      B5005A94A50042737B0084ADBD00ADE7F70094E7F70084DEEF0073D6EF006BCE
      E7005A7384006BCEE7002931420029314200FFFFFF00B5B5B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BA5
      B50094E7F70063A5B50084B5C600BDEFF700ADE7F70094E7F70084DEEF0073D6
      EF006B8494005A738400425A630029394A00FFFFFF00B5B5B500F7F7F700F7F7
      F700734A52008C6B6B00FFFFFF00FFFFFF00AD9C9C00AD9C9C00AD9C9C00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00FFFFFF007BA5B5005A94A50042737B0084AD
      BD00ADE7F7007BBDCE008CBDCE00CEF7FF00BDEFF700ADE7F70094E7F70084DE
      EF0073D6EF006BCEE7005AADC60031425200FFFFFF00B5B5B500F7F7F700F7F7
      FF008C6B6B00845A6300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00216BBD001084F700218CF700319CF70042ADF7004AB5
      F7005ABDFF005ABDFF00216BBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00216BBD001084F700218CF700319CF70042ADF7004AB5
      F7005ABDFF005ABDFF00216BBD00FFFFFF007BA5B50094E7F70063A5B50084B5
      C600BDEFF7008CC6CE0094C6D600D6F7FF00CEF7FF00BDEFF700ADE7F70094E7
      F70084DEEF0073D6EF006BCEE70031425A00FFFFFF00BDBDBD00F7F7FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373007373
      730073737300FFFFFF00216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00FFFFFF0084ADBD00ADE7F7007BBDCE008CBD
      CE00CEF7FF00BDEFF70094C6D60094C6D60094C6D6008CBDCE0084B5C60084AD
      BD007BA5B500739CAD007394A5006B8C9C00FFFFFF00BDBDBD00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073737300ADAD
      AD0073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084B5C600BDEFF7008CC6CE0094C6
      D600D6F7FF00CEF7FF00BDEFF700ADE7F70094E7F70084DEEF0073D6EF006BCE
      E70031425A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFF
      FF00BDADAD00BDADAD00BDADAD00BDADAD00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700DEDEE700BDBDBD00FFFFFF00FFFFFF00737373007373730073737300ADAD
      AD00737373007373730073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730073737300737373007373
      7300737373007373730073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CBDCE00CEF7FF00BDEFF70094C6
      D60094C6D60094C6D6008CBDCE0084B5C60084ADBD007BA5B500739CAD007394
      A5006B8C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00FFFFFF00FFFFFF0073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C6D600D6F7FF00CEF7FF00BDEF
      F700ADE7F70094E7F70084DEEF0073D6EF006BCEE70031425A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600F7F7
      F700BDBDBD00F7F7F700FFFFFF00FFFFFF00737373007373730073737300ADAD
      AD00737373007373730073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007373730073737300737373007373
      7300737373007373730073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C6D60094C6D60094C6D6008CBD
      CE0084B5C60084ADBD007BA5B500739CAD007394A5006B8C9C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00BDBD
      BD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073737300ADAD
      AD0073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373007373
      730073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094948C009C9494009C94
      94009C9494009C9494009C9494009C9494009C9494009C94940094948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7FF00F7FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7FF00F7FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094949400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B5006B6B6B009C9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700A5A5A50094949400FFFFFF00FFFFFF0094949400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59C9C00EFEFEF00CECE
      CE00BDBDBD00EFEFEF00EFEFEF00BDBDBD00CECECE00EFEFEF009C949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C00FFFFFF00FFFFFF00FFFFFF00947BEF002900DE003929A5006363
      6300CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6006352
      B5002900DE00A5A5A500FFFFFF00FFFFFF009C9C9C00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59C9C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7F700BDAD
      AD00B5A5A500F7F7F700F7F7FF00AD9C9C009C9494009C949400FFFFFF00FFFF
      FF009CA5A500FFFFFF00FFFFFF00FFFFFF00BDADF7002900DE003108DE00524A
      6B007B7B7B00DEDEDE00FFFFFF00FFFFFF00FFFFFF00CEC6D6004229C6002900
      DE007B6BCE00FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7F700BDAD
      AD00B5A5A500F7F7F700F7F7FF00AD9C9C009C9494009C949400FFFFFF00FFFF
      FF009CA5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59C9C00EFEFEF00DEDE
      DE00CECECE00EFEFEF00EFEFEF00CECECE00DEDEDE00EFEFEF009C949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7F700B5A5
      A500BDADAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF008473EF002900DE003918
      D6005A5A5A0094949400E7E7E700FFFFFF00CEC6D6003918CE002900DE00A59C
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7F700B5A5
      A500BDADAD00F7F7FF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A59C9C00F7F7F700E7DE
      DE00D6D6CE00F7EFEF0073736B005252520000000000EFEFEF009C9C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B63EF002900
      DE005239C6006363630094949400B5B5C6003918CE002900DE00A59CC600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FFFF0073736B005252520000000000FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B8CA500EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00A59C9C00FFFFFF005294AD00081010009C9C9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7F700734A
      52008C6B6B00FFFFFF00FFFFFF00AD9C9C00AD9C9C00AD9C9C00FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B63
      EF002900DE005231C60052525A003110C6002900D600A59CC600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7F700734A
      52008C6B6B00FFFFFF00A59C9C00FFFFFF005294AD0008101000FFFFFF00FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00216BC600186BCE002173
      CE002173CE002173CE00A59C9C008CB5C60073CEE7004A9CB50008101000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7FF008C6B
      6B00845A6300FFFFFF00FFFFFF00FFFFFF006363630073737300FFFFFF00FFFF
      FF00BDBDBD00FFFFFF007373730063636300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B5AEF002900DE002900D6002900D6006B638C00DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500F7F7F700F7F7FF008C6B
      6B00845A6300FFFFFF00A59C9C008CB5C60073CEE7004A9CB50008101000FFFF
      FF00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00216BC600187BE7001884
      EF002994EF00319CEF0042A5EF004A9CB5008CE7EF0063BDD6004A9CB5000810
      1000FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00F7F7FF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373006363630073737300FFFF
      FF00BDBDBD00737373005252520073737300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CEC6D6002908DE002900DE004229C6007373730094949400D6D6D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00F7F7FF00F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004A9CB5008CE7EF0063BDD6004A9CB5000810
      1000BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00216BBD00216BC6002173
      C6002173C6002973C6002973C6002973C60052A5B5008CE7EF0063BDD6004A9C
      B50008101000FFFFFF00FFFFFF00FFFFFF00BDBDBD00F7FFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073737300636363007B7B
      7B007B7B7B005A5A5A0073737300FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEC6
      D6003918CE002900DE00735ACE003108E7005A39D6007B7B8C0084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00F7FFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0052A5B5008CE7EF0063BDD6004A9C
      B50008101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063A5B5008CE7EF0063BD
      D6004A9CB50008101000FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00BDAD
      AD00BDADAD00BDADAD00BDADAD00FFFFFF00FFFFFF00FFFFFF007B7B7B006B6B
      6B006B6B6B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEC6D6003918
      CE002900DE008C84BD00FFFFFF00FFFFFF004218E7004A29DE007B739C007B7B
      7B00B5B5B500FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00BDAD
      AD00BDADAD00BDADAD00BDADAD00FFFFFF00FFFFFF0063A5B5008CE7EF0063BD
      D6004A9CB50008101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0073ADBD008CE7
      EF006BC6DE007B84840031319400FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B005A5A
      5A005A5A5A007B7B7B00FFFFFF00FFFFFF00FFFFFF00BDBDC6003910CE002900
      DE007363B500FFFFFF00FFFFFF00FFFFFF00FFFFFF005A42E7003108DE007B6B
      B5008C8C8C00DEDEDE00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD0073ADBD008CE7
      EF006BC6DE007B84840031319400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007BB5
      BD00CEBDAD007384D6005A6BAD0031319400BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4A4A00636363005A5A
      5A00636363006B6B6B005A5A5A00FFFFFF00C6BDEF003910CE002900DE005A42
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00947BEF002900
      DE00CECEE700FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600F7F7F7007BB5
      BD00CEBDAD007384D6005A6BAD0031319400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005A6BAD00738CDE005A73D6005A6BAD00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00636363006B6B6B0052525200F7F7
      F700FFFFFF006B6B6B006B6B6B00636363004218E7002900DE004229C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00BDBDBD00F7F7
      F7005A6BAD00738CDE005A73D6005A6BAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A6BAD005A6BAD00637BBD00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6006363630073737300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006B6B6B00636363003110E7004A29E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00FFFFFF00FFFF
      FF00FFFFFF005A6BAD005A6BAD00637BBD00FFFFFF00AD948C00846B5A007B6B
      52007B63520084735A008473630084736300735A4A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AD5A2100F7E7DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF7
      F700216B8C00DEEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400634A3100634A
      3100634A3100634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100FFFFFF00FFFFFF00FFFFFF00BDA59C00EFEFEF00FFFF
      FF00FFFFFF00F7F7F700EFEFE700F7F7F7007B635200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700AD5A
      2100DEA57B00A54A1800EFDED600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005ABD
      DE005ACEEF00216B8C00DEEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400EFC6AD00EFC6
      AD00EFC6AD00EFC6AD00EFC6AD00EFC6AD00EFC6AD00EFC6AD00EFC6AD00EFC6
      AD00EFC6AD00634A3100FFFFFF00FFFFFF00FFFFFF00BDA59C00FFFFFF000808
      0800DEDEDE00FFFFFF0008080800FFFFF7007B6B5200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00AD5A2100FFEF
      C600FFE7B500DEAD8400A5421000EFDED600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005ABD
      DE006BDEFF0029C6EF002984A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400EFCEB500EFCE
      B500EFCEB500EFCEB500E7BDA500AD5A2900DEAD9C00EFCEB500EFCEB500EFCE
      B500EFCEB500634A3100FFFFFF00FFFFFF00FFFFFF00BDAD9C00FFFFFF008C8C
      8C0000000000C6C6C60008080800EFEFEF007B635200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DE9C4A00FFFFDE00FFF7
      CE00FFE7BD00FFE7B500DEAD8400A5421000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6DEE7005ABD
      DE006BDEFF002984A500DEEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400F7D6BD00F7CE
      C600F7CEBD00EFBDAD00AD5A2900C66B3900A5523100DEB5A500F7CEBD00F7CE
      BD00F7CEBD00634A3100FFFFFF00FFFFFF00FFFFFF00C6B5AD00FFFFFF00FFFF
      FF00949494000000000000000000F7F7FF007B6B5200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DE9C4A00FFFFE700FFFF
      D600FFF7CE00FFEFBD00FFDEB500AD5A2100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6EFF7005AADCE0031CE
      FF006BDEFF0029C6EF002984A500CEE7EF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A59400F7DECE00F7DE
      CE00EFC6B500AD5A2900E7845200DE7B4A00BD6B3900A5522900E7BDAD00F7DE
      CE00F7DECE00634A3100FFFFFF00FFFFFF00FFFFFF00CEBDB500F7F7F7001010
      1000292929000000000000000000F7F7FF007B635200735A4A00735242006B52
      39006B4A3900634A3100BDADA500FFFFFF00FFFFFF00FFF7EF00DE9C4A00FFFF
      E700FFF7D600EFD6AD00DE9C4A00AD7B4A007B634A00735A4A00735242006B52
      39006B4A3900634A3100BDADA500FFFFFF00FFFFFF007BBDD60094DEEF006BDE
      FF005ABDDE005ABDDE0029C6EF002984A5007B634A00735A4A00735242006B52
      39006B4A3900634A3100BDADA500FFFFFF00FFFFFF00B5A59400F7E7D600F7D6
      C600C6734A00F79C6B00FF9C6B00E7845200D6734A00BD6339009C4A2900E7C6
      B500F7E7D600634A3100FFFFFF00FFFFFF00FFFFFF00CEBDB500FFFFFF00F7F7
      FF00F7F7F700FFFFFF00F7F7F700FFFFFF008C7B6B00D6C6BD00D6BDB500CEBD
      AD00C6B5A500C6AD9C006B4A3900FFFFFF00FFFFFF00FFFFFF00FFF7EF00DE9C
      4A00F7F7D600DE9C4A00E7C69C00DED6CE00DECEC600D6C6BD00D6BDB500CEBD
      AD00C6B5A500C6AD9C006B4A3900FFFFFF00FFFFFF007BBDD600ADEFF700ADF7
      FF00186B8C005ABDDE0031CEFF002984A500DECEC600D6C6BD00D6BDB500CEBD
      AD00C6B5A500C6AD9C006B4A3900FFFFFF00FFFFFF00B5A59400FFEFE700EF9C
      7300E79C7300DE946B00FFAD7B00F78C5A00DE7B4A00A5522900AD633900B56B
      4200FFEFE700634A3100FFFFFF00FFFFFF00FFFFFF00BDAD9C00BDA59C00BDA5
      9C00BDAD9C00C6B5A500BDAD9C00BDAD9C00AD948C00DECEC600D6C6BD00D6BD
      B500CEBDAD00C6B5A5006B523900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      EF00DE9C4A00EFD6BD00EFE7DE00E7DED600DED6CE00DECEC600D6C6BD00D6BD
      B500CEBDAD00C6B5A5006B523900FFFFFF00FFFFFF00CEE7EF007BBDD600B5EF
      F7006BDEFF006BDEFF003984A500ADCED600DED6CE00DECEC600D6C6BD00D6BD
      B500CEBDAD00C6B5A5006B523900FFFFFF00FFFFFF00BDA59400FFF7EF00FFF7
      EF00FFF7EF00D6845A00FFAD8400FF945A00EF8C5200B5633900FFF7EF00FFF7
      EF00FFF7EF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B59C9400F7EFEF00EFEFE700EFE7DE007B6352006B524200634A3100D6C6
      BD00D6BDB500CEBDAD00735A4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B59C9400F7EFEF00EFEFE700EFE7DE007B6352006B524200634A3100D6C6
      BD00D6BDB500CEBDAD00735A4200FFFFFF00FFFFFF00FFFFFF00CEE7EF007BBD
      D60073ADCE005AADCE00A5CEDE00EFE7DE007B6352006B524200634A3100D6C6
      BD00D6BDB500CEBDAD00735A4200FFFFFF00FFFFFF00BDAD9C00FFFFFF00FFFF
      FF00FFFFFF00DE8C6B00FFBD9C00FFA57B00F7945A00B5633900FFFFFF00FFFF
      FF00FFFFFF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDA59400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DED600DED6CE00DECE
      C600D6C6BD00D6BDB5007B634A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDA59400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DED600DED6CE00DECE
      C600D6C6BD00D6BDB5007B634A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDA59400FFF7F700F7EFEF00EFEFE700EFE7DE00E7DED600DED6CE00DECE
      C600D6C6BD00D6BDB5007B634A00FFFFFF00FFFFFF00C6AD9C00FFFFFF00FFFF
      FF00FFFFFF00E7947300FFC6A500FFBD9400FFB58C00BD734A00FFFFFF00FFFF
      FF00FFFFFF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6AD9C00FFFFFF00FFF7F700F7EFEF007B6352006B523900634A3100DED6
      CE00DECEC600D6C6BD00846B5200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6AD9C00FFFFFF00FFF7F700F7EFEF007B6352006B523900634A3100DED6
      CE00DECEC600D6C6BD00846B5200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6AD9C00FFFFFF00FFF7F700F7EFEF007B6352006B523900634A3100DED6
      CE00DECEC600D6C6BD00846B5200FFFFFF00FFFFFF00CEB5A500FFFFFF00FFFF
      FF00FFFFFF00EF9C7300E79C7300DE946B00D68C6300D6845A00FFFFFF00FFFF
      FF00FFFFFF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6ADA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DE
      D600DED6CE00DECEC6008C735A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6ADA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DE
      D600DED6CE00DECEC6008C735A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6ADA500FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7DE00E7DE
      D600DED6CE00DECEC6008C735A00FFFFFF00FFFFFF00CEB5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CEB5AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DED600DED6CE008C736300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CEB5AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DED600DED6CE008C736300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CEB5AD00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7EFEF00EFE7E700EFE7
      DE00E7DED600DED6CE008C736300FFFFFF00FFFFFF00CEB5A500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7DEDE00CEB5AD00C6ADA500BDAD9C00BDA59400B59C8C00B59C8C00AD94
      8400AD8C7B00A58C7B00CEBDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7DEDE00CEB5AD00C6ADA500BDAD9C00BDA59400B59C8C00B59C8C00AD94
      8400AD8C7B00A58C7B00CEBDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7DEDE00CEB5AD00C6ADA500BDAD9C00BDA59400B59C8C00B59C8C00AD94
      8400AD8C7B00A58C7B00CEBDB500FFFFFF00FFFFFF00EFAD8C00EFAD8C00EFA5
      8400EF9C7B00E7946B00E78C6300E7845200E77B4A00E7734200E7733900E773
      3900E7733900CE632900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFAD8C00FFC6A500FFBD
      9C00FFBD9400FFB59400FFB58C00FFAD8400FFA57B00F7A57300F79C7300F794
      6300F7946300CE633100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFAD8C00EFAD8C00EFAD
      8C00EFA58400EFA57B00EF9C7300E7946B00E78C6300E7845A00E7844A00E773
      3900E7733900E7733900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDE
      DE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDE
      DE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700EFEFEF00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600DEDE
      DE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700C6C6C600A5A5A5008C8C8C008484840073737300737373007B7B7B008C8C
      8C00B5B5B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700C6C6C600A5A5A5008C8C8C008484840073737300737373007B7B7B008C8C
      8C00B5B5B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700C6C6C600A5A5A5008C8C8C008484840073737300737373007B7B7B008C8C
      8C00B5B5B500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7EFEF00B5ADA500AD9C8C00A5947B00A58C
      7300A5947B00AD9C8C00B5A59C00DEDED600FFFFFF00FFFFFF00E7E7E7009C94
      8C006B5239006B4221006B4221008C5221008C521800844A1000734218005A42
      29008C8C8C00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E7009C94
      8C006B5239006B4221006B4221008C5221008C521800844A1000734218005A42
      29008C8C8C00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E7009C94
      8C006B5239006B4221006B4221008C5221008C521800844A1000734218005A42
      29008C8C8C00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7
      E700E7E7E700E7E7E700EFEFEF00A5947B00B5947300F7D6BD00EFBD9400F7C6
      9400EFC69400DEB58C00BD9C7B00BDA58C00FFFFFF00FFFFFF009C7B63009C5A
      2100C68C52009C6B3900844A2100C6946300CE946300BD7B3900B5733100844A
      180084848400DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C7B63009C5A
      2100C68C52009C6B3900844A2100C6946300CE946300BD7B3900B5733100844A
      180084848400DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C7B63009C5A
      2100C68C52009C6B3900844A2100C6946300CE946300BD7B3900B5733100844A
      180084848400DEDEDE00FFFFFF00FFFFFF00DEDEDE0084948C00528C6B004A8C
      6B00428C6B005A8C7300427B5A00AD947300CEAD8400F7DEC600EFC69C00F7C6
      9C00F7CEA500E7C69C00CEA57B00B59C8C00FFFFFF00FFFFFF008C521800C694
      5A00CE94630094633900EFCECE009C6B3900CE9C6B00CE946300B57339007342
      1800ADADAD00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C521800C694
      5A00CE94630094633900EFCECE009C6B3900CE9C6B00CE946300B57339007342
      1800ADADAD00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C521800C694
      5A00CE94630094633900EFCECE009C6B3900CE9C6B00CE946300B57339007342
      1800ADADAD00EFEFEF00FFFFFF00FFFFFF00BDBDBD006BC69C0063C694005ABD
      8C0052B58400A5C6AD005AA57B00ADA57300E7B59400F7DECE00FFDEBD00FFCE
      9C00FFD6AD00EFCEAD00CEA58400AD947B00FFFFFF00FFFFFF0094633900CE94
      6300DEAD84009C7B5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B63
      4A00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094633900CE94
      6300DEAD84009C7B5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B63
      4A00D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094633900CE94
      6300DEAD84009C7B5A00FFFFFF00BDA58C00B58C5A00CE946300AD7342007B63
      4A00D6D6D600FFFFFF00FFFFFF00FFFFFF00DEDEDE0073CEA5006BC6940063BD
      94006BC69400D6E7C60063B594008CAD7300FFD6A500DECEBD00D6CEC600E7BD
      9C00FFCEA500EFC69C00DEAD7B00C6B5A500FFFFFF00FFFFFF00AD947B00A573
      4200E7BD9C00AD7B6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6
      C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD947B00A573
      4200E7BD9C00AD7B6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6
      C600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD947B00A573
      4200E7BD9C00AD7B6B00BDCECE009CBDC600846B3900A5734200734A2900C6C6
      C600F7F7F700FFFFFF00FFFFFF00FFFFFF00EFEFEF007BCEA50073CEA5006BC6
      940084C6AD00B5CEBD0063AD84004AAD7300ADA584007B7B8C0008427B004263
      8400CEAD8400DEB58C00C6B5A500F7F7F700FFFFFF00FFFFFF00FFFFFF00C6AD
      9C0094734200006B8400107BC600107BC6000873AD005A4218006B6B6B00BDBD
      BD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AD
      9C0094734200006B8400107BC600107BC6000873AD005A4218006B6B6B00BDBD
      BD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AD
      9C0094734200006B8400107BC600107BC6000873AD005A4218006B6B6B00BDBD
      BD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6EFD60073CEA50063BD
      94006394B5005284A500397B5A0063A58400738C9400315A8400214A7B00184A
      7B006B737B00E7D6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006B9CBD00298CEF00319CFF00319CFF00319CFF00107BC6004A525A009C9C
      9C00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006B9CBD00298CEF00319CFF00319CFF00319CFF00107BC6004A525A009C9C
      9C00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006B9CBD00298CEF00319CFF00319CFF00319CFF00107BC6004A525A009C9C
      9C00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6EFE70063B5
      94004A7BAD005A84AD0094ADAD00E7EFE7005A84AD00426B9C00396394002952
      8400DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184C60039A5FF0042A5FF0042A5FF0039A5FF00319CFF00634A3100634A
      3100634A3100634A3100634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184C60039A5FF0042A5FF0042A5FF0039A5FF00319CFF00634A3900634A
      3100634A3100634A3100634A3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184C60039A5FF0042A5FF0042A5FF0039A5FF0073737300525252000000
      0000D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CB5C600316B
      840073A5CE0084ADDE005A7BA500A5B5C6006B94C6006394BD005284AD003163
      9400A5ADBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0042ADFF004AB5FF004AB5FF004AADFF00B5A59400F7E7DE00F7DE
      D600F7D6CE00EFD6BD00EFCEBD006B423900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0042ADFF004AB5FF004AB5FF004AADFF00BDA59400F7E7DE00F7DE
      D600F7D6CE00EFD6BD00EFCEBD00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0042ADFF004AB5FF004AB5FF004AADFF00A59C9C00FFFFFF005294
      AD0008101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A94A5005A8C
      AD00A5CEFF0094C6F7006B94BD00BDCEDE008CB5DE0084ADDE006394BD00426B
      940021314A00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0052B5FF0052BDFF0052BDFF0052B5FF00BDA59400F7EFE700F7E7
      DE00634A3100EFD6C600EFD6BD00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0052B5FF0052BDFF0052BDFF0052B5FF00BDA59400F7EFE700F7E7
      DE00F7E7DE00EFD6C600EFD6BD00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00218CCE0052B5FF0052BDFF0052BDFF0052B5FF00A59C9C008CB5C60073CE
      E7004A9CB50008101000FFFFFF00FFFFFF00FFFFFF00FFFFFF00639CB5008CBD
      DE00CEF7FF00ADD6FF008CADD600FFFFFF00A5D6FF009CC6F7006BA5D600425A
      730021211800DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184BD00319CD6002994C60039A5DE004AB5FF00BDA59400FFF7EF00634A
      3100634A3100634A3100F7D6CE00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184BD00319CD6002994C60039A5DE004AB5FF00BDA59400FFF7EF00634A
      3100634A3100634A3100F7D6CE00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002184BD00319CD6002994C60039A5DE004AB5FF0042ADF7004A9CB5008CE7
      EF0063BDD6004A9CB50010101800FFFFFF00FFFFFF00FFFFFF008CBDCE006BA5
      C600BDE7F700ADD6FF0084A5CE00FFFFFF008CA5BD007B94AD00637B8C00424A
      4A0029292900E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00398CAD00318CBD0052A5D60073B5DE005AA5C600C6AD9C00FFF7F700FFF7
      F700634A3100F7E7DE00F7DED600634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00398CAD00318CBD0052A5D60073B5DE005AA5C600C6AD9C00FFF7F700FFF7
      F700F7E7DE00F7E7DE00F7DED600634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00398CAD00318CBD0052A5D60073B5DE005AA5C600398CB500216BA50052A5
      B5008CE7EF006BC6DE007B84840031319400FFFFFF00FFFFFF00DEF7F70073BD
      D6005AA5B5005A94B50042739400FFFFFF00CECEC6008C8484006B6363005252
      5200ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDD6E7002184B50084C6E70094CEEF008CC6E700C6AD9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDD6E7002184B50084C6E70094CEEF008CC6E700C6AD9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634A3100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDD6E7002184B50084C6E70094CEEF008CC6E700298CBD006394A500E7D6
      E7007BB5BD00CEBDAD007384D6005A6BAD00FFFFFF00FFFFFF00FFFFFF00DEFF
      FF00A5E7F70084CEDE007BBDCE00BDDEE700FFFFFF00F7F7F700DEDEDE00E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADCEDE005294BD004294BD00428CB5008CB5C600C6AD9C00C6AD
      9C00BDA59C00BDA59400BDA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADCEDE005294BD004294BD00428CB50094A5C600C6A5A500C6AD
      9C00BDA59C00BDA59400BDA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADCEDE005294BD004294BD00428CB5008CADC600EFEFEF00FFFF
      FF00FFFFFF005A6BAD00849CEF005A73D600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
      EF00B5ADA5009C9484009C8C7B00948473009C948C00EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7EFEF00B5ADA500AD9C8C00A5947B00A58C
      7300A5947B00AD9C8C00B5A59C00DEDED600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7EFEF00B5ADA500AD9C8C00A5947B00A58C
      7300A5947B00AD9C8C00B5A59C00DEDED600FFFFFF00F7EFEF00B59C8400AD94
      8400D6B58C00EFBD9400EFC69400E7B58C00D6AD84009C846B00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00C6BDC600A5A5A5008C8C8C008C8C8C00A5A5A500BDBD
      BD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7
      E700E7E7E700E7E7E700EFEFEF00A5947B00B5947300F7D6BD00EFBD9400F7C6
      9400EFC69400DEB58C00BD9C7B00BDA58C00FFFFFF00FFFFFF00F7F7F700E7E7
      E700E7E7E700E7E7E700EFEFEF00A5947B00B5947300F7D6BD00EFBD9400F7C6
      9400EFC69400DEB58C00BD9C7B00BDA58C00FFFFF700BD9C7B00E7B58C00E7CE
      B500E7BDA500E7B58C00E7BD9C00DEB59400DEB58C00D6A57B009C948C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600A59C9C00ADA59C00DED6CE00D6CECE00D6CEC600DEDEDE00ADAD
      AD009C949400CECECE00FFFFFF00FFFFFF00DEDEDE0084948C00528C6B004A8C
      6B00428C6B005A8C7300427B5A00AD947300CEAD8400F7DEC600EFC69C00F7C6
      9C00F7CEA500E7C69C00CEA57B00B59C8C00DEDEDE0084948C00528C6B004A8C
      6B00428C6B005A8C7300427B5A00AD947300CEAD8400F7DEC600EFC69C00F7C6
      9C00F7CEA500E7C69C00CEA57B00B59C8C00FFFFFF00C6B58C00E7B58C00CEBD
      AD00F7DEC600EFBD9400EFCEA500E7C6A500DEB58C00C69C7300A5A59C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
      D600ADADA500CEBDB500CEBDB500F7EFDE00D6CEC600DED6D600FFFFFF00D6CE
      CE00DEDEDE00ADADAD00CECECE00FFFFFF00BDBDBD006BC69C0063C694005ABD
      8C0052B58400A5C6AD005AA57B00ADA57300E7B59400F7DECE00FFDEBD00FFCE
      9C00FFD6AD00EFCEAD00CEA58400AD947B00BDBDBD006BC69C0063C694005ABD
      8C0052B58400A5C6AD005AA57B00ADA57300E7B59400F7DECE00FFDEBD00FFCE
      9C00FFD6AD00EFCEAD00CEA58400AD947B009C9C94007B7B6300F7BD9400CEC6
      B500FFFFFF00FFD6A500F7CEA500E7CEAD00EFBD94009C7B5A008C848400FFFF
      FF004A4A42004A4A42004A4A4A005A5A5A00FFFFFF00FFFFFF00EFEFEF00A59C
      9C00C6BDAD00F7E7C600D6C6BD00F7E7D600FFF7EF00FFFFFF00FFFFFF00E7E7
      E700FFFFFF00D6D6D6009C9C9C00E7E7E700DEDEDE0073CEA5006BC6940063BD
      94006BC69400D6E7C60063B594008CAD7300FFD6A500DECEBD00D6CEC600E7BD
      9C00FFCEA500EFC69C00DEAD7B00C6B5A500DEDEDE0073CEA5006BC6940063BD
      94006BC69400D6E7C60063B594008CAD7300FFD6A500DECEBD00D6CEC600E7BD
      9C00FFCEA500EFC69C00DEAD7B00C6B5A500949C8C00E7EFE700F7CE9C00C6AD
      9C00426B9C0094949400F7C69400F7CEA500CEA57B00948C8400424239008484
      7B00F7EFDE00EFE7D600FFF7EF0094948400FFFFFF00FFFFFF00C6C6C600848C
      7B007B7B6B00CEC6B500F7E7CE00F7E7CE00F7E7DE00FFEFEF00FFFFFF00FFFF
      FF00EFE7E700D6CECE00B5ADAD00BDBDBD00EFEFEF007BCEA50073CEA5006BC6
      940084C6AD00B5CEBD0063AD84004AAD7300ADA584007B7B8C0008427B004263
      8400CEAD8400DEB58C00C6B5A500F7F7F700EFEFEF007BCEA50073CEA5006BC6
      940084C6AD00B5CEBD0063AD84004AAD7300ADA584007B7B8C0008427B004263
      8400CEAD8400DEB58C00C6B5A500F7F7F70094948C00FFFFFF00EFE7CE007373
      7B00214A7B00184A7B00948C8400C6A58400D6C6BD00F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00FFFFFF00FFFFFF00848C8400429C
      5200296B310094947B00EFDEC600F7E7CE00F7E7D600F7EFDE00F7EFE700FFFF
      FF00FFFFFF00FFFFFF00E7DEDE00A5A5A500FFFFFF00C6EFD60073CEA50063BD
      94006394B5005284A500397B5A0063A58400738C9400315A8400214A7B00184A
      7B006B737B00E7D6C600FFFFFF00FFFFFF00FFFFFF00C6EFD60073CEA50063BD
      94006394B5005284A500397B5A0063A58400738C9400315A8400214A7B00184A
      7B006B737B00E7D6C600FFFFFF00FFFFFF0094948400FFFFFF00BDBDBD00214A
      7B0039638C00315A8C006B6B7300E7DED600F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00FFFFFF00D6D6D600429C52005AF7
      7B0042DE5A0029733100A59C8C00EFDECE00EFDECE00A58C8400AD949400B59C
      9C00B5A59C00CEC6BD00CEBDBD008C8C8C00FFFFFF00FFFFFF00D6EFE70063B5
      94004A7BAD005A84AD0094ADAD00E7EFE7005A84AD00426B9C00396394002952
      8400DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6EFE70063B5
      94004A7BAD005A84AD0094ADAD00E7EFE7005A84AD00426B9C00396394002952
      8400DEDEDE00FFFFFF00FFFFFF00FFFFFF0094948C00F7F7F7006B8CAD004A73
      A500527BA500396B9400A5ADB500D6BDB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00D6D6D6004A9C520073F78C005AEF
      730052EF730052FF6B00297B3100BDB5A500F7E7CE00AD948C00EFDECE00EFDE
      CE00EFDED600D6CEC600C6BDB5008C8C8C00FFFFFF00FFFFFF009CB5C600316B
      840073A5CE0084ADDE005A7BA500A5B5C6006B94C6006394C600634A3100634A
      3100634A3100634A3100634A3100FFFFFF00FFFFFF00FFFFFF009CB5C600316B
      840073A5CE0084ADDE005A7BA500A5B5C6006B94C6006394C600634A3100634A
      3100634A3100634A3100634A3100FFFFFF0094948C00EFEFEF006B94BD00739C
      BD00638CB5004A7BA50039526B00C6B5AD00F7EFE700C6B5A500C6B5A500C6B5
      A500C6B5A500C6B5A500F7EFE7008C8C7B00529C5A00529C5A004A9C52006BE7
      84005AF77300299C3900319C3900427B4200F7EFCE00BDA59C00F7E7CE00F7E7
      CE00F7E7CE00EFDECE00D6CEC600A5A5A500FFFFFF00FFFFFF005A94A5005A8C
      AD00A5CEFF0094C6F7006B94BD00BDCEDE008CB5DE00BDA59400F7E7DE00F7DE
      D600F7D6CE00EFD6BD00EFCEBD00634A3100FFFFFF00FFFFFF005A94A5005A8C
      AD00A5CEFF0094C6F7006B94BD00BDCEDE008CB5DE00BDA59400F7E7DE00F7DE
      D600F7D6CE00EFD6BD00EFCEBD00634A310094948C00E7E7EF008CB5D6009CBD
      E7007BA5CE0052739C0029394200A59C9400F7EFE700D6C6B500D6C6BD00D6C6
      BD00D6C6BD00D6C6B500F7EFE7008C8C7B00FFFFFF00FFFFFF005A9C630073E7
      840073F78400427B4200EFDED600FFEFDE00F7E7D600BDA59C00FFE7CE00F7E7
      CE00F7DECE00CEBDA500A5A59C00C6C6C600FFFFFF00FFFFFF00639CB5008CBD
      DE00CEF7FF00ADD6FF008CADD600FFFFFF00A5D6FF00BDA59400F7EFE700F7E7
      DE00F7E7DE00EFD6C600EFD6BD00634A3100FFFFFF00FFFFFF00639CB5008CBD
      DE00CEF7FF00ADD6FF008CADD600FFFFFF00A5D6FF00BDA59400F7EFE700F7E7
      DE00634A3100EFD6C600EFD6BD00634A310094948C00F7F7F7009CBDE7009CC6
      EF007BADD6004A637B002921180094848400F7EFE700D6C6B500D6C6B500D6C6
      B500D6C6B500D6C6B500FFF7EF008C8C7B00FFFFFF00FFFFFF00CED6CE0052A5
      5A0073E784005AC66B0052735200EFDED600FFEFDE00BDA59C00F7E7CE00E7D6
      BD00FFEFCE00D6CEBD009C9C9C00EFEFEF00FFFFFF00FFFFFF008CBDCE006BA5
      C600BDE7F700ADD6FF0084A5CE00FFFFFF008CA5BD00BDA59400FFF7EF00634A
      3100634A3100634A3100F7D6CE00634A3100FFFFFF00FFFFFF008CBDCE006BA5
      C600BDE7F700ADD6FF0084A5CE00FFFFFF008CA5BD00BDA59400FFF7EF00634A
      3100634A3100634A3100F7D6CE00634A310094948C00FFF7F7009CA5AD007B84
      8C006B737B005252520039393900CEBDBD00F7EFE700C6B5A500C6B5A500C6B5
      A500C6B5A500C6B5A500FFF7EF008C8C7B00FFFFFF00FFFFFF00FFFFFF0094B5
      94005ACE730073EF8C005AAD63004A734A00BDB5AD00BDADA500EFDED600BDAD
      A500C6B5AD00ADA5A500D6D6D600FFFFFF00FFFFFF00FFFFFF00DEF7F70073BD
      D6005AA5B5005A94B50042739400FFFFFF00CECEC600C6AD9C00FFF7F700FFF7
      F700F7E7DE00F7E7DE00F7DED600634A3100FFFFFF00FFFFFF00DEF7F70073BD
      D6005AA5B5005A94B50042739400FFFFFF00CECEC600C6AD9C00FFF7F700FFF7
      F700634A3100F7E7DE00F7DED600634A310094948400FFFFFF00DECEC600A59C
      9C007B7373006B6B6300ADA5A500EFDED600FFFFFF00FFFFF700FFF7F700F7F7
      F700F7F7EF00F7EFE700FFFFF70094948C00FFFFFF00FFFFFF00FFFFFF00EFF7
      EF009CC6A50052A55A006BE7840063D673004A7B52005A845A005A8C63004A7B
      520084848400D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEFF
      FF00A5E7F70084CEDE007BBDCE00BDDEE700FFFFFF00C6AD9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634A3100FFFFFF00FFFFFF00FFFFFF00DEFF
      FF00A5E7F70084CEDE007BBDCE00BDDEE700FFFFFF00C6AD9C00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7E7DE00634A310094948C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDB500B5B5AD00ADADA500ADAD
      A500ADADA500ADADA500BDBDB5009C9C9400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6DECE008CB58C0073AD7B006BB57B007BBD8C0094BD9C00D6DE
      D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6A5A500C6AD
      9C00BDA59C00BDA59400BDA59400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6AD9C00C6AD
      9C00BDA59C00BDA59400BDA59400FFFFFF00DEDED60094948C0094948C009494
      8C0094948C0094948C0094948C0094948C00DEDED600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000700000000100010000000000800300000000000000000000
      000000000000000000000000FFFFFF00FFFFF81F000000000000E00700000000
      0000C00300000000000080010000000080010001000000008001000000000000
      C003000000000000C003000000000000E007000000000000E007000000000000
      F00F000000000000F81F000100000000F81F800100000000FC3F800300000000
      FC3FC00700000000FFFFF00F000000000000FFFFE000C1080000FE00E000C000
      0000C000E000C000000000000000C000000000000000C0000000000000000000
      000000000000000000008002000000000000C007000000000000C00300000000
      0000800300000003000081030000000300008101E00000030000C100E0000003
      0000C080E00100030000FFF8E00300FF8003FFFFFFFFFFFF8003FC01FC01FFFF
      8003FC01FC01FFFF8003FC01FC01FC038003FC01FC01FC018003FC01FC01E000
      8003FC01FC01E0008003FC01FC0100008003FC01FC0100008003C401FC010000
      8003C7FFFFFF0007800301FF01FF0007800301FF01FF003F800301FF01FF003F
      8007C7FFFFFFFFFF800FC7FFFFFFFFFFFFFF0007FFFF0007801F0007FFFF0007
      801F00078FE30007801F000707C30007801F000703870007801F0007810F0007
      801F0007C01F0007801F0007E03F0007801F0004F03F0007800F0000F01F0007
      80070001E00F0007FF830003C3070003FFC1000387830001FFE000010FC70000
      FFF000081FFF0000FFF8001C3FFF0018807FF3FFE3FF8003807FC1FFE1FF8003
      807F80FFE1FF8003807F80FFC1FF8003807F80FF80FF80038001800180018003
      8001C001800180038001E00180018003F001F001C0018003F001F001F0018003
      F001F001F0018003F001F001F0018003F001F001F0018003F001F001F0018003
      FFFFFFFFFFFF8003FFFFFFFFFFFF8003F007F007E007FFFFC003C003C003FE00
      C003C003C003C000C003C003C0030000C003C003C0030000C003C003C0030000
      C007C007C0070000E007E007E0078002F007F007F007C007F001F001F007C003
      F000F000F0078003F000F000F0038103F000F000F0018103F000F000F000C103
      F000F000F000C08FF801F801F808FFFFFFFFFFFFC03FFFFFFE00FE00801FF003
      C000C000001FE00100000000801FE001000000000010C000000000000000C000
      000000000000C0008002800200008000C007C00700000000C001C00100000000
      8000800000008000810081000000C000810081000000E001C100C1000000E001
      C080C0800000F807FFC1FFC1007FFFFF00000000000000000000000000000000
      000000000000}
  end
  object actList: TActionList
    Images = ImageList1
    Left = 439
    Top = 242
    object actAddPlan: TAction
      Category = 'catPlanDep'
      Caption = 'actAddPlan'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1085' '#1059#1052#1056'...'
      ImageIndex = 16
      ShortCut = 16453
      OnExecute = actAddPlanExecute
    end
    object actEditPlan: TAction
      Tag = 1
      Category = 'catPlanDep'
      Caption = 'actEditPlan'
      Hint = #1059#1090#1074#1077#1088#1076#1080#1090#1100' '#1087#1083#1072#1085' '#1059#1052#1056'...'
      ImageIndex = 15
      ShortCut = 16454
      OnExecute = actEditPlanExecute
      OnUpdate = actDelPlanUpdate
    end
    object actDelPlan: TAction
      Category = 'catPlanDep'
      Caption = 'actDelPlan'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1085' '#1059#1052#1056
      ImageIndex = 13
      ShortCut = 16455
      OnExecute = actDelPlanExecute
      OnUpdate = actDelPlanUpdate
    end
    object actLoadCurrentPlan: TAction
      Category = 'catPlanDep'
      Caption = 'actLoadCurrentPlan'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1059#1052#1056
      ImageIndex = 22
      OnExecute = actLoadCurrentPlanExecute
      OnUpdate = actLoadCurrentPlanUpdate
    end
    object actExportFact: TAction
      Category = 'catFactDep'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1082#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1074' MS Excel'
      ImageIndex = 20
      OnExecute = actExportFactExecute
      OnUpdate = actExportFactUpdate
    end
    object actSave: TAction
      Category = 'catSaveUndo'
      Caption = 'actSave'
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actUndo: TAction
      Category = 'catSaveUndo'
      Caption = 'actUndo'
      OnExecute = actUndoExecute
      OnUpdate = actSaveUpdate
    end
    object actAddWarrant: TAction
      Category = 'catSaveUndo'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      OnExecute = actAddWarrantExecute
      OnUpdate = actAddWarrantUpdate
    end
    object actRemWarrant: TAction
      Category = 'catSaveUndo'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      OnExecute = actRemWarrantExecute
      OnUpdate = actRemWarrantUpdate
    end
    object actAddSrok: TAction
      Category = 'catSaveUndo'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
      OnExecute = actAddSrokExecute
      OnUpdate = actAddSrokUpdate
    end
    object actRemSrok: TAction
      Category = 'catSaveUndo'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
      OnExecute = actRemSrokExecute
      OnUpdate = actRemSrokUpdate
    end
    object actExportPlan: TAction
      Category = 'catPlanDep'
      Caption = 'actExportPlan'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085' '#1074' MS Excel'
      ImageIndex = 20
      OnExecute = actExportPlanExecute
      OnUpdate = actExportPlanUpdate
    end
    object actExportPlanEd: TAction
      Category = 'catPlanEdDep'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085' '#1080#1079#1076#1072#1085#1080#1103' '#1074' MS Excel'
      ImageIndex = 20
      OnExecute = actExportPlanEdExecute
      OnUpdate = actExportPlanEdUpdate
    end
  end
  object DSWarrant: TDataSource
    OnDataChange = DSWarrantDataChange
    Left = 264
    Top = 264
  end
  object dsPlanDep: TDataSource
    Left = 152
    Top = 280
  end
  object dsPlanEdDep: TDataSource
    Left = 216
    Top = 304
  end
  object dsSrok: TDataSource
    OnDataChange = dsSrokDataChange
    Left = 320
    Top = 264
  end
  object dsItemGos: TDataSource
    Left = 496
    Top = 192
  end
  object dsDiscGos: TDataSource
    Left = 536
    Top = 192
  end
  object ImageList2: TImageList
    Left = 615
    Top = 186
    Bitmap = {
      494C010109000C005C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      00000000000000000000000000000000000000000000DE734A00CE734A00CE73
      4A00C66B4200C66B4200BD6B3900BD6B3900B5633900B5633900AD633900AD5A
      3100AD5A3100A55A2900A55A2900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008452420084524200845242008452
      420084524200845242007B523900734A3900734A39006B4231006B4231006B42
      31006B4231006B4231006B423100A55A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A56B5200FFFFFF00FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7EF00FFEFEF00F7EFE700F7EFE700F7E7
      E700F7E7E700F7E7DE00F7E7DE00A55A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD735A00FFFFFF009C634A00AD52
      29009C52290084523100FFFFF7008C5231007B4A21006B3910009C8C7300FFEF
      EF00F7EFEF00F7EFE700F7E7E700B56339000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD735A00FFFFFF00A56B5200CE73
      4A00CE734A008C4A2100D6BDAD009C5A3900AD5229009C4A210052391000E7D6
      CE00FFEFEF00F7EFE700F7E7E700BD6B39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B6300FFFFFF00A56B5200CE7B
      5200CE734A00AD6339008C5231009C634A00B55A3100AD5221006B3910009C8C
      7300FFEFEF00F7EFEF00F7EFE700BD6B39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B630000000000AD735A00D68C
      6300CE846300D67B5A00AD633900A56B5200BD633900C6633100AD5229006B39
      10009C8C7300FFEFEF00F7EFEF00C66B42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B6300FFFFFF00B57B6300D68C
      7300B5735A00DE9C8400CE846300AD735A00C66B4200C66B4200CE734A009C52
      290052391000FFF7EF00FFEFEF00CE734A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD84730000000000C6846B00DE94
      7B009C634A00AD735A00DE9C8400CE846300CE7352008C5A42009C634A00CE73
      4A009C522900E7D6CE00FFF7EF00CE7B52000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD84730000000000D68C7300DEA5
      8C009C634A00EFDED600D6BDAD00DE9C8400D6846300A56B5200FFF7F7009C63
      4A00CE84630052422100FFF7F700D6845A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD84730000000000D68C7300E7AD
      9400A56B5200E7D6CE00FFF7F700E7AD9400D68C6300AD735A00FFFFFF00B5A5
      9400B5735A007B4A2100EFDED600D6845A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD947B0000000000DE9C8400E7AD
      9400BD847300B57B6300F7EFE700CE947300D6947300B57B6300FFFFFF00DEBD
      AD00AD735A00B5633900DEC6BD00DE8463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD947B00DE9C8400DE9C8400D694
      7300D6947300D68C7300D68C7300E7D6CE00CE7B5A00C6735200FFFFFF00C66B
      4A00C6735200C66B4A00BD633900DE8463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD947B0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E78C63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD947B00BD947B00BD947B00BD94
      7B00BD847300BD847300BD847300B57B6300B57B6300B57B6300AD735A00AD73
      5A00AD735A00AD735A00A56B5200E78C63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7CEB500F7CEB500F7CE
      B500F7BDAD00F7BDAD00F7B5A500EFB59C00E7AD9400EFA58C00EFA58C00E79C
      8400EF947300E78C6300E78C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A0000004A0000004A0000004A
      0000004A0000004A000000520000005200000052000000520000005200000052
      0000005200000052000000520000002100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094948C009C9494009C94
      94009C9494009C9494009C9494009C9494009C9494009C94940094948C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00000000000084000000840000007B0000007B
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000007B0000008C0000003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000840000003900000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      00008400000084000000840000008400000000000000A59C9C00EFEFEF00CECE
      CE00BDBDBD00EFEFEF00EFEFEF00BDBDBD00CECECE00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000840000003900000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000000000A59C9C00EFEFEF00EFEF
      EF00E7E7E700F7F7F700F7F7F700E7E7E700EFEFEF00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C000000000000840000F7EFF70031A53100299C
      2900299429002994290029942900299429002994290021942100299429000084
      000000840000D6E7D600007B0000003900000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF008400000000000000A59C9C00EFEFEF00DEDE
      DE00CECECE00EFEFEF00EFEFEF00CECECE00DEDEDE00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C000000000000840000F7EFF700008400000084
      0000008C0000008C0000008C0000008C00000084000094BD9400008400000084
      00009CA59C00F7EFF700007B0000003900000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000000000A59C9C00F7F7F700DEDE
      DE00D6CECE00EFEFEF0073736B005252520000000000F7F7F7009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C000000000000840000F7EFF700FFF7FF000084
      0000008C0000008C0000008C000000840000A5C6A50000840000008C0000088C
      0800F7EFF700F7EFF700007B0000003900000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF008400000000000000949C8C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00A59C9C00FFFFFF005294AD00081010008C9484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073946B0073946B0073946B0073946B0073946B007394
      6B0073946B0073946B0073946B000000000000840000F7EFF700F7EFF700FFFF
      FF00088C08000084000000840000B5CEB5000084000000840000008400000084
      000042A54200F7EFF700007B0000003900000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000000000000739C63006BA55A006BA5
      52006BA552006BA55200A59C9C008CB5C60073CEE7004A9CB500081010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073946B0063D6290063D6290063D6290063D6290063D6
      290063D6290063D6290073946B000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF70000840000B5CEB50000840000008400007BAD7B00F7EFF700F7EF
      F700F7EFF700F7EFF700007B0000003900000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF008400000084000000840000008400000000000000739C630063C6310063CE
      290063CE310063CE310063CE31004A9CB5008CE7EF0063BDD6004A9CB5000810
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073946B0073946B0073946B0073946B0073946B007394
      6B0073946B0073946B0073946B000000000000840000F7EFF700F7EFF700EFEF
      EF009CC69C00B5C6B50000840000008C0000008C000000840000BDBDBD00F7EF
      F700F7EFF700F7EFF700007B0000003900000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000073946300739C6300739C
      6300739C6300739C6300739C6300739C630052A5B5008CE7EF0063BDD6004A9C
      B500081010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000F7EFF700F7EFF700ADCE
      AD00B5CEB50000840000008400000084000000840000008C000000840000A5A5
      A500F7EFF700F7EFF700007B0000003900000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063A5B5008CE7EF0063BD
      D6004A9CB5000810100000000000000000007373730073737300737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      00000000000000000000000000000000000000840000F7EFF700B5CEB500BDCE
      BD0000840000008400005AAD5A00F7EFF700299C290000840000008C00000084
      0000D6CED600F7EFF700007B0000003900000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073ADBD008CE7
      EF006BC6DE007B848400313194000000000073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300000000000000000000000000000000000000
      00000000000000000000000000000000000000840000F7EFF7004AAD4A0052AD
      520052B5520073BD7300F7EFF700F7EFF700FFF7FF0063B5630052AD52003994
      390039A53900F7EFF700007B0000003900000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007BB5
      BD00CEBDAD007384D6005A6BAD00313194007373730073737300737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      00000000000000000000000000000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000840000003900000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A6BAD00738CDE005A73D6005A6BAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000840000003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A6BAD005A6BAD00637BBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000840000008400000084000000840000008400000084000000840000008C
      0000008C000000840000008400004AAD4A000000000000000000000000000000
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
      0000000000000000000094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00000000000000000094948C009C9494009C94
      94009C9494009C9494009C9494009C9494009C9494009C94940094948C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00000000000000000000000000000000000000
      0000000000000000000094948C0094948C0094948C0094948C0094948C009494
      8C0094948C0094948C0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C0000000000000000009C9C9C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C00000000000000000000000000000000000000
      0000000000000000000094948C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C000000000000000000A59C9C00EFEFEF00CECE
      CE00BDBDBD00EFEFEF00EFEFEF00BDBDBD00CECECE00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C000000000000000000A59C9C00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C000000000000000000A59C9C00EFEFEF00DEDE
      DE00CECECE00EFEFEF00EFEFEF00CECECE00DEDEDE00EFEFEF009C9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00B5B5AD00B5B5AD00FFFFFF00B5B5
      AD00B5B5AD00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C000000000000000000A59C9C00F7F7F700E7DE
      DE00D6D6CE00F7EFEF0073736B005252520000000000EFEFEF009C9C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00000000000000000000000000000000000000
      0000000000000000000094948C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0094948C00000000000000000000000000000000000000
      00000000000000000000216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD0000000000000000007B8CA500EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00A59C9C00FFFFFF005294AD00081010009C9C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00000000000000000000000000000000000000
      0000000000000000000073946B0073946B0073946B0073946B0073946B007394
      6B0073946B0073946B0073946B00000000000000000000000000000000000000
      00000000000000000000216BBD001084F700218CF700319CF70042ADF7004AB5
      F7005ABDFF005ABDFF00216BBD000000000000000000216BC600186BCE002173
      CE002173CE002173CE00A59C9C008CB5C60073CEE7004A9CB500081010000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000216BBD001084F700218CF700319CF70042ADF7004AB5
      F7005ABDFF005ABDFF00216BBD00000000000000000000000000000000000000
      0000000000000000000073946B0063D6290063D6290063D6290063D6290063D6
      290063D6290063D6290073946B00000000000000000000000000737373007373
      73007373730000000000216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD000000000000000000216BC600187BE7001884
      EF002994EF00319CEF0042A5EF004A9CB5008CE7EF0063BDD6004A9CB5000810
      1000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000216BBD00216BBD00216BBD00216BBD00216BBD00216B
      BD00216BBD00216BBD00216BBD00000000000000000000000000737373007373
      7300737373000000000073946B0073946B0073946B0073946B0073946B007394
      6B0073946B0073946B0073946B0000000000000000000000000073737300ADAD
      AD00737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000216BBD00216BC6002173
      C6002173C6002973C6002973C6002973C60052A5B5008CE7EF0063BDD6004A9C
      B500081010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300ADAD
      AD00737373000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373007373730073737300ADAD
      AD00737373007373730073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063A5B5008CE7EF0063BD
      D6004A9CB5000810100000000000000000007373730073737300737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      000000000000000000000000000000000000737373007373730073737300ADAD
      AD00737373007373730073737300000000000000000000000000000000000000
      00000000000000000000000000000000000073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073ADBD008CE7
      EF006BC6DE007B848400313194000000000073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300000000000000000000000000000000000000
      00000000000000000000000000000000000073737300ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0073737300000000000000000000000000000000000000
      000000000000000000000000000000000000737373007373730073737300ADAD
      AD00737373007373730073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007BB5
      BD00CEBDAD007384D6005A6BAD00313194007373730073737300737373007373
      7300737373007373730073737300000000000000000000000000000000000000
      000000000000000000000000000000000000737373007373730073737300ADAD
      AD00737373007373730073737300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300ADAD
      AD00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A6BAD00738CDE005A73D6005A6BAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300ADAD
      AD00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373007373
      7300737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A6BAD005A6BAD00637BBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373007373
      7300737373000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      4000000000000000000000000000000040000000000000004000000000000000
      4000000000000000400000000000000000000000000000007F80000000000000
      00000000000000008001000000000000FFFFFFFF0000FFFF801FFC010000FFFF
      801FFC010000FE00801FFC010000FE00801FFC010000FE00801FFC0100008000
      801FFC0100008000801FFC0100008000801FFC0100008000800FFC0100008001
      8007FFFF00008003FF8301FF00008007FFC101FF0000807FFFE001FF000080FF
      FFF0FFFF000081FFFFF8FFFF0000FFFFFFFFFFFFFFFFFFFFFC01801FFC01FC01
      FC01801FFC01FC01FC01801FFC01FC01FC01801FFC01FC01FC01801FFC01FC01
      FC01801FFC01FC01FC01801FFC01FC01FC01801FFC01FC01C401800FFC01C401
      C7FF8007FFFFC7FF01FFFF8301FF01FF01FFFFC101FF01FF01FFFFE001FF01FF
      C7FFFFF0FFFFC7FFC7FFFFF8FFFFC7FF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList2
    Left = 647
    Top = 186
    object actAddGos: TAction
      Category = 'catGos'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1043#1054#1057
      ImageIndex = 0
      OnExecute = actAddGosExecute
      OnUpdate = actAddGosUpdate
    end
    object actDelGos: TAction
      Category = 'catGos'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1043#1054#1057
      ImageIndex = 2
      OnExecute = actDelGosExecute
      OnUpdate = actDelGosUpdate
    end
    object actAddItemGos: TAction
      Category = 'catGos'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1085#1082#1090' '#1043#1054#1057#1072
      ImageIndex = 3
      OnExecute = actAddItemGosExecute
      OnUpdate = actAddItemGosUpdate
    end
    object actEditItemGos: TAction
      Category = 'catGos'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1091#1085#1082#1090#1072' '#1043#1054#1057#1072
      ImageIndex = 4
      OnExecute = actEditItemGosExecute
      OnUpdate = actEditItemGosUpdate
    end
    object actDelItemGos: TAction
      Category = 'catGos'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1091#1085#1082#1090' '#1043#1054#1057#1072
      ImageIndex = 5
      OnExecute = actDelItemGosExecute
      OnUpdate = actEditItemGosUpdate
    end
    object actAddDiscGos: TAction
      Category = 'catGos'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1043#1054#1057#1072
      ImageIndex = 0
      OnExecute = actAddDiscGosExecute
      OnUpdate = actAddItemGosUpdate
    end
    object actEditDiscGos: TAction
      Category = 'catGos'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099' '#1043#1054#1057#1072
      ImageIndex = 1
      OnExecute = actEditDiscGosExecute
      OnUpdate = actEditDiscGosUpdate
    end
    object actDelDiscGos: TAction
      Category = 'catGos'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1043#1054#1057#1072
      ImageIndex = 2
      OnExecute = actDelDiscGosExecute
      OnUpdate = actEditDiscGosUpdate
    end
  end
  object dsFactDep: TDataSource
    Left = 288
    Top = 304
  end
  object dsWarrantFilter: TDataSource
    Left = 496
    Top = 248
  end
  object dsNameWorkFilter: TDataSource
    Left = 536
    Top = 248
  end
  object dsMethodWorkFilter: TDataSource
    Left = 576
    Top = 248
  end
  object dsPrepodFilter: TDataSource
    Left = 616
    Top = 248
  end
end
