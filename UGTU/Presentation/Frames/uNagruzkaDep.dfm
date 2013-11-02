inherited fmNagruzkaDep: TfmNagruzkaDep
  Width = 820
  Height = 685
  ExplicitWidth = 820
  ExplicitHeight = 685
  inherited Panel1: TPanel
    Width = 820
    Height = 685
    ExplicitWidth = 820
    ExplicitHeight = 685
    object Bevel6: TBevel
      Left = 2
      Top = 2
      Width = 816
      Height = 4
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = -3
      ExplicitTop = 6
      ExplicitWidth = 661
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 6
      Width = 816
      Height = 677
      HelpKeyword = #1053#1072#1075#1088#1091#1079#1082#1072'\Add_NagrDep.htm'
      ActivePage = tsPotok
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControl1Change
      object tsPrepods: TTabSheet
        HelpKeyword = #1053#1072#1075#1088#1091#1079#1082#1072'\FrameDep.htm'
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081
        ImageIndex = 2
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 808
          Height = 24
          ButtonWidth = 170
          Caption = 'ToolBar1'
          Images = ImageList1
          List = True
          ParentShowHint = False
          AllowTextButtons = True
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Action = actAddPrepod
          end
          object ToolButton2: TToolButton
            Left = 24
            Top = 0
            Action = actEditPrepod
          end
          object ToolButton3: TToolButton
            Left = 48
            Top = 0
            Action = actDelPrepod
          end
          object ToolButton4: TToolButton
            Left = 72
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 23
            Style = tbsSeparator
          end
          object ToolButton25: TToolButton
            Left = 80
            Top = 0
            Action = actExportTeacherList
            ParentShowHint = False
            ShowHint = True
            Style = tbsTextButton
          end
        end
        object tvPrepods: TTreeView
          Left = 0
          Top = 53
          Width = 808
          Height = 592
          Align = alClient
          Images = ImageList3
          Indent = 19
          ReadOnly = True
          TabOrder = 1
          OnChange = tvPrepodsChange
          OnKeyDown = tvPrepodsKeyDown
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 24
          Width = 808
          Height = 29
          Caption = 'ToolBar2'
          TabOrder = 2
        end
      end
      object tsPotok: TTabSheet
        HelpKeyword = #1053#1072#1075#1088#1091#1079#1082#1072'\Add_Thread.htm'
        Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072#1075#1088#1091#1079#1082#1080
        ImageIndex = 7
        object Splitter1: TSplitter
          Left = 247
          Top = 68
          Height = 577
          ExplicitLeft = 448
          ExplicitTop = 144
          ExplicitHeight = 100
        end
        object potokTreeView: TTreeView
          Left = 0
          Top = 68
          Width = 247
          Height = 577
          Align = alLeft
          Images = ImageList2
          Indent = 19
          PopupMenu = PopupMenu7
          ReadOnly = True
          TabOrder = 0
          Visible = False
          OnChange = potokTreeViewChange
          OnDblClick = potokTreeViewDblClick
          OnDragDrop = potokTreeViewDragDrop
          OnDragOver = potokTreeViewDragOver
          OnExpanding = potokTreeViewExpanding
          OnKeyDown = potokTreeViewKeyDown
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 808
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            808
            24)
          object Label9: TLabel
            Left = 525
            Top = 3
            Width = 73
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1055#1086#1080#1089#1082' '#1087#1086#1090#1086#1082#1072':'
            ExplicitLeft = 370
          end
          object ToolBar3: TToolBar
            Left = 0
            Top = 0
            Width = 808
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            Caption = 'ToolBar3'
            Images = ImageList1
            TabOrder = 0
            object ToolButton5: TToolButton
              Left = 0
              Top = 0
              Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1090#1086#1082#1080' '#1074' '#1089#1077#1084#1077#1089#1090#1088'...'
              Caption = 'actAddPotokSemester'
              ImageIndex = 32
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = actLoadPotokExecute
            end
            object ToolButton11: TToolButton
              Left = 23
              Top = 0
              Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1086#1090#1086#1082'...'
              Action = actAddPotok
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton14: TToolButton
              Left = 46
              Top = 0
              Action = actDelPotok
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton13: TToolButton
              Left = 69
              Top = 0
              Action = actEditPotok
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton15: TToolButton
              Left = 92
              Top = 0
              Action = actShowUchPlan
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton30: TToolButton
              Left = 115
              Top = 0
              Action = actEditPotokShema
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton31: TToolButton
              Left = 138
              Top = 0
              Action = actDelPotokShema
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton22: TToolButton
              Left = 161
              Top = 0
              Width = 8
              Caption = 'ToolButton22'
              Enabled = False
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton23: TToolButton
              Left = 169
              Top = 0
              Action = actAddPotokShema
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object addSemesterShema: TToolButton
              Left = 192
              Top = 0
              Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1093#1077#1084#1099' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
              Action = actAddPotokSemesterShema
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object ToolButton12: TToolButton
              Left = 215
              Top = 0
              Action = actAutoShema
              ParentShowHint = False
              ShowHint = True
              Visible = False
            end
            object combineGroups: TToolButton
              Left = 238
              Top = 0
              Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1087#1086#1090#1086#1082#1080
              Enabled = False
              ImageIndex = 31
              Visible = False
            end
            object btnCombinePotoks: TButton
              Left = 261
              Top = 0
              Width = 115
              Height = 25
              Action = actCombinePotoks
              Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1074' '#1087#1086#1090#1086#1082
              Enabled = False
              TabOrder = 0
            end
            object btnDividePotok: TButton
              Left = 376
              Top = 0
              Width = 88
              Height = 25
              Action = actDividePotok
              Caption = #1056#1072#1079#1073#1080#1090#1100' '#1087#1086#1090#1086#1082
              Enabled = False
              TabOrder = 1
            end
            object btnShema: TButton
              Left = 464
              Top = 0
              Width = 106
              Height = 25
              Caption = #1057#1093#1077#1084#1099' '#1076#1077#1083#1077#1085#1080#1103'...'
              Enabled = False
              TabOrder = 2
              OnClick = btnShemaClick
            end
          end
          object potokFilter: TDBEditEh
            Left = 604
            Top = -1
            Width = 203
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akTop, akRight]
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clSilver
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Flat = True
            ParentFont = False
            TabOrder = 1
            Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
            Visible = False
            OnEnter = potokFilterEnter
            OnExit = potokFilterExit
            OnKeyDown = potokFilterKeyDown
          end
          object dbcbPlans: TDBLookupComboboxEh
            Left = 568
            Top = -1
            Width = 233
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akLeft, akTop, akRight]
            EditButtons = <>
            Flat = True
            TabOrder = 2
            Visible = True
            OnKeyValueChanged = dbcbPlansKeyValueChanged
          end
        end
        object Panel3: TPanel
          Left = 250
          Top = 68
          Width = 558
          Height = 577
          Align = alClient
          TabOrder = 2
          object dbNagrCommit: TDBGridEh
            Left = 1
            Top = 1
            Width = 556
            Height = 575
            Align = alClient
            DataSource = dsNagrCommit
            DragMode = dmAutomatic
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
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            RowHeight = 2
            RowLines = 1
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleHeight = 15
            UseMultiTitle = True
            OnCellMouseClick = dbNagrCommitCellMouseClick
            OnDblClick = dbNagrCommitDblClick
            OnDrawColumnCell = dbNagrCommitDrawColumnCell
            OnDrawDataCell = dbNagrCommitDrawDataCell
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ik_spec'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'cName_disc'
                Footers = <>
                Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
                Width = 350
              end
              item
                EditButtons = <>
                FieldName = 'Cname_grup'
                Footers = <>
                Title.Caption = #1043#1088#1091#1087#1087#1072'/'#1087#1086#1090#1086#1082
                Width = 200
              end
              item
                EditButtons = <>
                FieldName = 'nPotoks'
                Footers = <>
                Title.Caption = #1043#1088#1091#1087#1087#1072'/'#1087#1086#1090#1086#1082
                Visible = False
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'cName_spec'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'course'
                Footers = <>
                Title.Caption = #1050#1091#1088#1089
              end
              item
                EditButtons = <>
                FieldName = 'Ik_grup'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'ik_disc_uch_plan'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'rasch'
                Footers = <>
                Title.Caption = #1042#1080#1076#1099' '#1079#1072#1085#1103#1090#1080#1081
                Width = 300
              end
              item
                EditButtons = <>
                FieldName = 'n_full'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'subgroup_count'
                Footers = <>
                Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1099
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
                FieldName = 'ik_disc'
                Footers = <>
                Visible = False
              end>
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 24
          Width = 808
          Height = 44
          Align = alTop
          TabOrder = 3
          object Label14: TLabel
            Left = 253
            Top = 7
            Width = 141
            Height = 13
            Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086':'
          end
          object lblFull: TLabel
            Left = 443
            Top = 7
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 400
            Top = 7
            Width = 37
            Height = 13
            Caption = #1087#1086#1083#1085#1099#1093
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblPart: TLabel
            Left = 522
            Top = 7
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 470
            Top = 7
            Width = 49
            Height = 13
            Caption = #1085#1077#1087#1086#1083#1085#1099#1093
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblAll: TLabel
            Left = 380
            Top = 25
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 253
            Top = 25
            Width = 123
            Height = 13
            Caption = #1074#1089#1077#1075#1086' '#1074' '#1091#1095#1077#1073#1085#1099#1093' '#1087#1083#1072#1085#1072#1093':'
          end
          object lblNo: TLabel
            Left = 647
            Top = 7
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 550
            Top = 7
            Width = 90
            Height = 13
            Caption = #1085#1077#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object StringGrid1: TStringGrid
          Left = 348
          Top = 171
          Width = 358
          Height = 90
          FixedCols = 0
          RowCount = 3
          FixedRows = 0
          TabOrder = 4
          Visible = False
        end
        object Button1: TButton
          Left = 16
          Top = 37
          Width = 222
          Height = 25
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
          TabOrder = 5
          OnClick = actNagrAutoFillExecute
        end
      end
      object tsNagruzka: TTabSheet
        HelpKeyword = 'Add_NagrDep.htm'
        Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1085#1072#1075#1088#1091#1079#1082#1080
        ImageIndex = 25
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 808
          Height = 23
          AutoSize = True
          ButtonHeight = 23
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = ImageList1
          TabOrder = 0
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Action = actAddPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton8: TToolButton
            Left = 25
            Top = 0
            Action = actEditPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton9: TToolButton
            Left = 50
            Top = 0
            Action = actDelPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton28: TToolButton
            Left = 75
            Top = 0
            Width = 8
            Caption = 'ToolButton28'
            ImageIndex = 22
            Style = tbsSeparator
          end
          object ToolButton29: TToolButton
            Left = 83
            Top = 0
            Action = actLockUnlockPlan
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton26: TToolButton
            Left = 108
            Top = 0
            Action = actLoadNagrAvto
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton10: TToolButton
            Left = 133
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton17: TToolButton
            Left = 141
            Top = 0
            Action = actAddDisc
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton18: TToolButton
            Left = 166
            Top = 0
            Action = actEditDisc
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton19: TToolButton
            Left = 191
            Top = 0
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1075#1088#1091#1079#1082#1091' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
            Action = actDelDisc
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton32: TToolButton
            Left = 216
            Top = 0
            Hint = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077'...'
            Action = actGetDistributedNagr
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton6: TToolButton
            Left = 241
            Top = 0
            Action = actCloseFactNagr
            ParentShowHint = False
            ShowHint = True
          end
          object ToolButton20: TToolButton
            Left = 266
            Top = 0
            Width = 8
            Caption = 'ToolButton20'
            ImageIndex = 20
            Style = tbsSeparator
          end
          object ToolButton21: TToolButton
            Left = 274
            Top = 0
            Action = actExport
            DropdownMenu = PopupMenu5
            ParentShowHint = False
            ShowHint = True
            Style = tbsDropDown
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 23
          Width = 808
          Height = 622
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            808
            622)
          object Label27: TLabel
            Left = 8
            Top = 10
            Width = 121
            Height = 13
            Caption = #1055#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dbcbPlan: TDBLookupComboboxEh
            Left = 135
            Top = 8
            Width = 663
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akLeft, akTop, akRight]
            EditButtons = <>
            Flat = True
            TabOrder = 0
            Visible = True
            OnKeyValueChanged = dbcbPlanKeyValueChanged
          end
          object dbgVidZanyatPlan: TDBGridEh
            Left = 8
            Top = 33
            Width = 792
            Height = 439
            AllowedOperations = []
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoFitColWidths = True
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
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind]
            ParentFont = False
            PopupMenu = PopupMenu9
            RowHeight = 2
            RowLines = 1
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleHeight = 15
            UseMultiTitle = True
            OnDblClick = dbgVidZanyatPlanDblClick
            OnDrawColumnCell = dbgVidZanyatPlanDrawColumnCell
            OnDrawDataCell = dbgVidZanyatPlanDrawDataCell
            OnKeyDown = dbgVidZanyatPlanKeyDown
            Columns = <
              item
                EditButtons = <>
                FieldName = 'cName_disc'
                Footers = <>
                Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'cName_potok'
                Footers = <>
                Title.Caption = #1055#1086#1090#1086#1082
                Width = 20
              end
              item
                EditButtons = <>
                FieldName = 'plan_hour'
                Footers = <>
                Title.Caption = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' '#1095#1072#1089#1086#1074
                Width = 30
              end
              item
                EditButtons = <>
                FieldName = 'busy_hour'
                Footers = <>
                Title.Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1086' '#1095#1072#1089#1086#1074
                Width = 30
              end>
          end
          object Panel6: TPanel
            Left = 1
            Top = 574
            Width = 806
            Height = 47
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object Label28: TLabel
              Left = 7
              Top = 8
              Width = 80
              Height = 13
              Caption = #1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1085#1091':'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 187
              Top = 8
              Width = 3
              Height = 13
              Hint = #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074', '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077
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
            object Label5: TLabel
              Left = 94
              Top = 8
              Width = 87
              Height = 13
              Caption = #1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 266
              Top = 8
              Width = 75
              Height = 13
              Caption = #1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1086':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 347
              Top = 8
              Width = 3
              Height = 13
              Hint = 
                #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077', '#1082#1086#1090#1086#1088#1099#1077' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1099' '#1084 +
                #1077#1078#1076#1091' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103#1084#1080' '#1082#1072#1092#1077#1076#1088#1099
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
            object Label4: TLabel
              Left = 94
              Top = 27
              Width = 69
              Height = 13
              Caption = #1089#1090#1072#1090#1091#1089' '#1087#1083#1072#1085#1072':'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 171
              Top = 27
              Width = 3
              Height = 13
              Caption = '-'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object tsUchPlan: TTabSheet
        Caption = #1059#1095#1077#1073#1085#1099#1077' '#1087#1083#1072#1085#1099
        ImageIndex = 3
        inline fmUchPlan: TfmUchPlan
          Left = 0
          Top = 52
          Width = 808
          Height = 593
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 52
          ExplicitWidth = 808
          ExplicitHeight = 593
          inherited Panel1: TPanel
            Width = 808
            Height = 593
            ExplicitWidth = 808
            ExplicitHeight = 593
            inherited Panel3: TPanel
              Width = 808
              Height = 571
              ExplicitWidth = 808
              ExplicitHeight = 571
              inherited ScrollBox1: TScrollBox
                Width = 806
                Height = 569
                ExplicitWidth = 806
                ExplicitHeight = 569
                inherited Bevel1: TBevel
                  Top = 75
                  Width = 803
                  ExplicitTop = 75
                  ExplicitWidth = 725
                end
                inherited Bevel2: TBevel
                  Top = 131
                  Width = 803
                  ExplicitTop = 131
                  ExplicitWidth = 725
                end
                inherited Label1: TLabel
                  Left = 100
                  Top = 5
                  ExplicitLeft = 100
                  ExplicitTop = 5
                end
                inherited Label16: TLabel
                  Left = 12
                  Top = 29
                  ExplicitLeft = 12
                  ExplicitTop = 29
                end
                inherited Label2: TLabel
                  Left = 19
                  Top = 48
                  ExplicitLeft = 19
                  ExplicitTop = 48
                end
                inherited Label3: TLabel
                  Top = 84
                  ExplicitTop = 84
                end
                inherited Bevel6: TBevel
                  Top = 162
                  Width = 803
                  ExplicitTop = 162
                  ExplicitWidth = 725
                end
                inherited Label4: TLabel
                  Top = 109
                  ExplicitTop = 109
                end
                inherited Label29: TLabel
                  Left = 570
                  Top = 143
                  ExplicitLeft = 570
                  ExplicitTop = 143
                end
                inherited Label30: TLabel
                  Top = 59
                  ExplicitTop = 59
                end
                inherited Label31: TLabel
                  Left = 321
                  Top = 143
                  ExplicitLeft = 321
                  ExplicitTop = 143
                end
                inherited Label36: TLabel
                  Left = 236
                  Top = 54
                  ExplicitLeft = 236
                  ExplicitTop = 54
                end
                inherited Label37: TLabel
                  Top = 143
                  ExplicitTop = 143
                end
                inherited Panel2: TPanel
                  Top = 164
                  Width = 805
                  Height = 397
                  ExplicitTop = 164
                  ExplicitWidth = 805
                  ExplicitHeight = 397
                  inherited Splitter1: TSplitter
                    Height = 397
                    ExplicitHeight = 382
                  end
                  inherited Panel5: TPanel
                    Height = 397
                    ExplicitHeight = 397
                    inherited dbgDisc: TDBGridEh
                      Height = 369
                      PopupMenu = nil
                      OnDblClick = fmUchPlandbgDiscDblClick
                      OnKeyDown = fmUchPlandbgDiscKeyDown
                    end
                  end
                  inherited Panel6: TPanel
                    Width = 598
                    Height = 397
                    ExplicitWidth = 598
                    ExplicitHeight = 397
                    inherited ScrollBox2: TScrollBox
                      Width = 598
                      Height = 397
                      ExplicitWidth = 598
                      ExplicitHeight = 397
                      inherited sgDisc: TStringGrid
                        OnMouseLeave = fmUchPlansgDiscMouseLeave
                        OnMouseMove = fmUchPlansgDiscMouseMove
                      end
                    end
                  end
                end
                inherited dbcbSpclz: TDBLookupComboboxEh
                  Left = 109
                  Top = 1
                  Width = 691
                  KeyField = 'iK_spclz'
                  ListField = 'cName_spclz'
                  ListSource = dmUgtuStructure.dsSpclzForNagr
                  OnKeyValueChanged = fmUchPlandbcbSpclzKeyValueChanged
                  ExplicitLeft = 109
                  ExplicitTop = 1
                  ExplicitWidth = 691
                end
                inherited dbcbFormEd: TDBLookupComboboxEh
                  Left = 107
                  Top = 26
                  KeyField = 'Ik_form_ed'
                  ListField = 'Cname_form_ed'
                  ListSource = dmUgtuStructure.dsFormEdForNagr
                  OnKeyValueChanged = fmUchPlandbcbFormEdKeyValueChanged
                  ExplicitLeft = 107
                  ExplicitTop = 26
                end
                inherited dbcbYear: TDBLookupComboboxEh
                  Left = 107
                  Top = 50
                  KeyField = 'ik_year_uch_pl'
                  ListField = 'year_value'
                  ListSource = dmUgtuStructure.dsYearUPForNagr
                  ExplicitLeft = 107
                  ExplicitTop = 50
                end
                inherited dbcbCklDisc: TDBLookupComboboxEh
                  Top = 82
                  Width = 691
                  ExplicitTop = 82
                  ExplicitWidth = 691
                end
                inherited dbcbGrpDisc: TDBLookupComboboxEh
                  Top = 106
                  Width = 691
                  ExplicitTop = 106
                  ExplicitWidth = 691
                end
                inherited Panel8: TPanel
                  Left = 496
                  Top = 170
                  ExplicitLeft = 496
                  ExplicitTop = 170
                end
                inherited cmbxSem: TDBComboBoxEh
                  Left = 623
                  Top = 139
                  Width = 59
                  ExplicitLeft = 623
                  ExplicitTop = 139
                  ExplicitWidth = 59
                end
                inherited cmbxVidZan: TDBComboBoxEh
                  Left = 393
                  Top = 139
                  Width = 171
                  ExplicitLeft = 393
                  ExplicitTop = 139
                  ExplicitWidth = 171
                end
                inherited cbBRS: TCheckBox
                  Left = 477
                  Top = 52
                  ExplicitLeft = 477
                  ExplicitTop = 52
                end
                inherited dtpDateUtv: TDateTimePicker
                  Left = 343
                  Top = 51
                  ExplicitLeft = 343
                  ExplicitTop = 51
                end
              end
              inherited dbcbPdgrpDisc: TDBLookupComboboxEh
                Left = 128
                Top = 140
                Width = 181
                ExplicitLeft = 128
                ExplicitTop = 140
                ExplicitWidth = 181
              end
            end
            inherited Panel4: TPanel
              Width = 808
              ExplicitWidth = 808
              inherited ToolBar1: TToolBar
                Width = 808
                Visible = False
                ExplicitWidth = 808
                inherited ToolButton5: TToolButton
                  ExplicitWidth = 38
                end
              end
            end
          end
          inherited ImageList1: TImageList
            Bitmap = {
              494C010108000C00600010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              0000000000003600000028000000400000003000000001002000000000000030
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
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000007A7A7A007A7A7A007A7A7A007A7A
              7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
              7A007A7A7A000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000004F0000004C0000004E0000004F
              0000004F0000004F000000510000005100000052000000520000005200000052
              0000005200000052000000520000002200000000000000000000000000000000
              0000000000000000000097928F0097928F0097928F0097928F0097928F009792
              8F0097928F0097928F0097928F000000000086868600F0F0F200F1F1F300F1F2
              F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7F800F7F8
              F900868686000000000000000000000000000000000097928F009B9693009C97
              94009C9794009C9794009C9794009C9794009C9794009B96930097928F000000
              0000000000000000000000000000000000000086000000820000007E0000007F
              0000008200000083000000830000008200000082000000810000008100000081
              000000800000007D000000880000003D00000000000000000000000000000000
              0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
              F600F6F6F600F6F6F60097928F000000000090909000F1F1F300F1F2F300F2F2
              F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFEFE00F8F9
              FA0090909000000000000000000000000000000000009F9A9800EFEEEE00EAE9
              E900E9E8E800E9E9E800E9E9E800E9E8E800EAE9E900EFEEEE009B9693000000
              00000000000000000000000000000000000000840000F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF60000800000003D00000000000000000000000000000000
              0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
              AD00B1B0AD00F8F9F80097928F00000000009D9D9D00F2F2F300F2F2F400F3F3
              F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFEFE00FDFE
              FE009D9D9D0000000000000000000000000000000000A19C9A00EAEAE900CCCB
              CA00BCBBB800EFEEEE00EFEEEE00BCBBB800CCCBCA00EBEBEA009C9794000000
              00000000000000000000000000000000000000840000F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF60000800000003D00000000000000000000000000000000
              0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
              FC00FBFCFC00FBFBFC0097928F0000000000ACACAC00F2F2F400F3F3F500BAAA
              AD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFEFE00FDFE
              FE009FA1A30000000000000000000000000000000000A19D9900ECECEB00E9E9
              E900EFEEEE00EFEEEE00EFEEEE00EFEEEE00EFEEEE00EDECEC009C9793000000
              00000000000000000000000000000000000000840000F6EEF60036A036002F98
              2F002A932A00299229002C952C002C952C002C952C00239423002C972C000085
              000000830000D0E1D000007C0000003D00000000000000000000000000000000
              0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
              AD00B1B0AD00FEFEFE0097928F0000000000ADADAD00F3F3F500F4F4F500B4A3
              A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFEFE00FDFE
              FE00B8B8B80000000000000000000000000000000000A29D9A00EFEEEE00DBDB
              D900CDCDCC00EFEEEE00EFEEEE00CDCDCC00DBDBD900EFEEEE009C9794000000
              00000000000000000000000000000000000000840000F6EEF600008600000087
              0000008800000088000000880000008800000083000092BD9200008600000087
              00009EA69E00F1EDF100007C0000003D00000000000000000000000000000000
              0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
              FE00FEFEFE00FEFEFE0097928F0000000000B1B1B100F4F4F600F5F5F600F5F6
              F700F6F7F800F7F8F800F8F8F900F9F9FA00F9FAFB00FAFBFB00FDFEFE00FDFE
              FE00B8B8B80000000000000000000000000000000000A59E9900F6F3F000E1DF
              DA00D4D1CC00F1EFEC0075716E005754510000000000EFEEEE009F9893000000
              00000000000000000000000000000000000000840000F6EEF600FEF7FE000084
              000000880000008800000088000000860000A2C4A20000860000008800000989
              0900F6EEF600F6EEF600007E0000003D00000000000000000000000000000000
              00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
              BF00266DBF00266DBF00266DBF0000000000B3B3B300F5F5F600F5F6F700764B
              51008E6A6F00F8F9F900F9F9FA00AC999C00AD999C00AD9A9D00FBFCFD00FDFE
              FE00B8B8B800000000000000000000000000000000007A8DA600EFEEEE00EFEE
              EE00EFEEEE00EFEEEE00A39D9800FDFEFE005193A9000E1216009F9893000000
              00000000000000000000000000000000000000840000F6EEF600F6EEF600FFFB
              FF000B8D0B000087000000820000B1C9B1000085000000870000008500000086
              000040A04000F6EEF600007C0000003D00000000000000000000000000000000
              00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
              F70058BAF80058BAF800266DBF0000000000B5B5B500F6F6F700F6F7F8008E6A
              6F00835C6100F9F9FA00FAFAFB00FAFBFB006767670076767600FCFDFD00FDFE
              FE00B8B8B80000000000767676006767670000000000236CC0001E6EC8002070
              CA002373CA002676CA00A39D980088B7C70074CEE200499AB2000E1216000000
              00000000000000000000000000000000000000840000F6EEF600F6EEF600F6EE
              F600F6EEF60000850000B6CBB600008400000087000078AA7800F6EEF600F6EE
              F600F6EEF600F6EEF600007C0000003D00000000000000000000000000000000
              00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
              BF00266DBF00266DBF00266DBF0000000000B8B8B800F6F7F800F7F8F900F8F9
              F900F9F9FA00FAFAFB00FAFBFC00FBFCFC00767676006262620076767600FDFE
              FE00B8B8B80073737300515151007676760000000000246EC300197DE7001F86
              EE002C90ED00379AEE0042A4EF004D9CB3008CE0EE0062BFD700499AB2000E12
              16000000000000000000000000000000000000840000F6EEF600F6EEF600ECEB
              EC009AC49A00B3C4B30000840000008800000088000000830000BEBEBE00F6EE
              F600F6EEF600F6EEF600007C0000003D00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000BABABA00F7F8F900F8F9FA00F9FA
              FA00FAFAFB00FAFBFC00FBFCFC00FCFDFD00FCFDFD0074747400636363007C7C
              7C007E7E7E005F5F5F00727272000000000000000000256DBF00246FC4002570
              C5002671C4002872C5002974C5002A74C50057A0B5008CE0EE0062BFD700499A
              B2000E12160000000000000000000000000000860000F6EEF600F6EEF600AFCB
              AF00B2C8B200008300000087000000840000008700000088000000850000A3A3
              A300F6EEF600F6EEF600007E0000003D00007272720072727200727272007272
              7200727272007272720072727200000000000000000000000000000000000000
              000000000000000000000000000000000000BCBCBC00F8F9FA00F9FAFA00BCAB
              AE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE00FDFEFE007C7C7C006868
              6800686868007B7B7B0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000065A6B7008CE0EE0062BF
              D700499AB2000E121600000000000000000000860000F6EEF600B1CAB100B9CE
              B90000830000008600005CAD5C00F3ECF3002C9C2C0000870000008800000084
              0000D0CFD000F0ECF000007E0000003D000072727200AEAEAE00AEAEAE00AEAE
              AE00AEAEAE00AEAEAE0072727200000000000000000000000000000000000000
              000000000000000000000000000000000000BDBDBD00F9FAFA00FAFBFB00FBFB
              FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE007C7C7C005D5D
              5D005F5F5F007A7A7A0000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000073ACB9008CE0
              EE006CC4D9007D868600353590000000000000850000F6EEF6004CAB4C0051AE
              510055B0550074BC7400F1EEF100F6EEF600FDF7FD0062B4620051AB51003994
              39003EA13E00F6EEF600007C0000003D00007272720072727200727272007272
              7200727272007272720072727200000000000000000000000000000000000000
              000000000000000000000000000000000000BFBFBF00FAFBFB00FBFBFC00FBFC
              FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE004D4D4D00676767005959
              590062626200686868005F5F5F00000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000007DB0
              BB00CAB8AC007385D1005E6CAD003535900000850000F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF60000810000003D00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000C0C0C000FBFBFC00FBFCFC00FCFD
              FD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00626262006868680054545400F3F4
              F300000000006B6B6B0068686800616161000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00005E6CAD00708FDF005E76D0005E6CAD0000850000F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
              F600F6EEF600F6EEF60000830000003A00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000C0C0C000C0C0C0006565650074747400FAFAFA000000
              0000000000000000000069696900656565000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000005E6CAD005E6CAD006579BC000082000000830000008300000082
              000000830000008600000086000000850000008600000084000000840000008C
              0000008D000000840000008300004FAB4F007A7A7A007A7A7A007A7A7A007A7A
              7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
              7A007A7A7A000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000007A7A7A007A7A7A007A7A
              7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
              7A007A7A7A007A7A7A00000000000000000086868600F0F0F200F1F1F300F1F2
              F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7F800F7F8
              F900868686000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F0097928F0097928F0097928F0097928F009792
              8F0097928F0097928F0097928F00000000000000000000000000000000000000
              0000FDFDFD00EAEAEA00C0BFC000A4A3A3008C8A8A008C8A8A00A2A0A100BCBB
              BB00E4E4E400FCFCFC0000000000000000000000000086868600F0F0F200F1F1
              F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7
              F800F7F8F90086868600000000000000000090909000F1F1F300F1F2F300F2F2
              F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFEFE00F8F9
              FA00909090000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
              F600F6F6F600F6F6F60097928F0000000000000000000000000000000000FCFC
              FC00D1D1D100A09E9E00A9A19D00D8D1CD00D2C9C800D4C9C700DCD9D900AEAB
              AB009A979700C9C8C800FAFAFA00000000000000000090909000F1F1F300F1F2
              F300F2F2F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFE
              FE00F8F9FA009090900000000000000000009D9D9D00F2F2F300F2F2F400F3F3
              F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFEFE00FDFE
              FE009D9D9D000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
              AD00B1B0AD00F8F9F80097928F0000000000000000000000000000000000D2D2
              D200ABA8A600CCBFB200C8BBB200F5EADE00D2C8C300D9D3D000F9F9F800D7CF
              CF00DFDBDB00AEACAD00C9C9C90000000000000000009D9D9D00F2F2F300F2F2
              F400F3F3F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFE
              FE00FDFEFE009D9D9D000000000000000000ACACAC00F2F2F400F3F3F500BAAA
              AD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFEFE00FDFE
              FE009FA1A3000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
              FC00FBFCFC00FBFBFC0097928F00000000000000000000000000EAE9EA00A09E
              9E00C7BCAF00F4E2C500D6C7B800F0E0D000FDF3EB00FFFDFC00FBFBFB00E4E0
              E000FFFFFF00D7D3D3009E9C9C00E4E4E40000000000ACACAC00F2F2F400F3F3
              F500BAAAAD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFE
              FE00FDFEFE009FA1A3000000000000000000ADADAD00F3F3F500F4F4F500B4A3
              A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFEFE00FDFE
              FE00B8B8B8000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
              AD00B1B0AD00FEFEFE0097928F00000000000000000000000000C1C1C100828A
              7D007B7B6800CDC0B200F6E6CB00F6E4CF00F6E7D900F9EFE800FFFCFB00FFFF
              FF00E8E5E400D6CECD00B0ADAD00BCBBBB0000000000ADADAD00F3F3F500F4F4
              F500B4A3A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFE
              FE00FDFEFE00B8B8B8000000000000000000B1B1B100F4F4F600F5F5F600F5F6
              F700F6F7F800F7F8F80075716E005754510000000000FAFBFB00FDFEFE00FDFE
              FE00B8B8B8000000000000000000000000000000000000000000000000000000
              0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
              FE00FEFEFE00FEFEFE0097928F00000000000000000000000000868F86004499
              50002D6C340096937D00EEDFC500F1E1CC00F4E5D200F7EADE00F5ECE500FFFB
              F800FCFBFB00FAF9F900E0DEDF00A2A1A10000000000B1B1B100F4F4F600F5F5
              F600F5F6F700F6F7F800F7F8F800F8F8F900F9F9FA00F9FAFB00FAFBFB00FDFE
              FE00FDFEFE00B8B8B8000000000000000000B3B3B300F5F5F600F5F6F700764B
              51008E6A6F00F8F9F900A39D9800FDFEFE005193A9000E121600FBFCFD00FDFE
              FE00B8B8B8000000000000000000000000000000000000000000000000000000
              00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
              BF00266DBF00266DBF00266DBF000000000000000000D0D5D000469B52005CF6
              780047DA5F002B703500A69D8D00EEDDCB00E9D9C800A08A8400AC979100B39F
              9800B2A19B00CDC2BF00C9BDB8008D8B8B0000000000B3B3B300F5F5F600F5F6
              F700764B51008E6A6F00F8F9F900F9F9FA00AC999C00AD999C00AD9A9D00FBFC
              FD00FDFEFE00B8B8B8000000000000000000B5B5B500F6F6F700F6F7F8008E6A
              6F00835C6100F9F9FA00A39D980088B7C70074CEE200499AB2000E121600FDFE
              FE00B8B8B8000000000000000000000000000000000000000000000000000000
              00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
              F70058BAF80058BAF800266DBF0000000000D1D5D100489A530075F58C005CEB
              750056EB700050F96B002C793500BAB0A000F0E1CE00A8948B00ECDBC900EBDC
              C800EEDED100D7C9C000C7BAB4008A88880000000000B5B5B500F6F6F700F6F7
              F8008E6A6F00835C6100F9F9FA00FAFAFB00FAFBFB00FBFCFC00FCFCFD00FCFD
              FD00FDFEFE00B8B8B8000000000000000000B8B8B800F6F7F800F7F8F900F8F9
              F900F9F9FA00FAFAFB00FAFBFC004D9CB3008CE0EE0062BFD700499AB2000E12
              1600B8B8B8000000000000000000000000000000000000000000757575007575
              75007575750000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
              BF00266DBF00266DBF00266DBF000000000055995E0051995A004B9D56006DE6
              82005DF27700299A3800359A3F0042794600F7E8CF00BBA79B00F3E2CB00F0E0
              CC00F2E0CA00EBDDCD00D6CCC400A4A3A30000000000B8B8B800F6F7F800F7F8
              F900F8F9F900F9F9FA00FAFAFB00FAFBFC00FBFCFC00FCFCFD00FCFDFD00FDFE
              FE00FDFEFE00B8B8B8000000000000000000BABABA00F7F8F900F8F9FA00F9FA
              FA00FAFAFB00FAFBFC00FBFCFC00FCFDFD0057A0B5008CE0EE0062BFD700499A
              B2000E121600000000000000000000000000000000000000000075757500AEAE
              AE00757575000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000FEFEFE005E9B660071E3
              840070F08600407B4600E8DCD100FBEBD800F6E6D000B8A59800F8E7CC00F4E2
              CA00F0DFC900CCBCA700A7A19A00C0C0C00000000000BABABA00F7F8F900F8F9
              FA00F9FAFA00FAFAFB00FAFBFC00FBFCFC00FCFDFD00FCFDFD00FCFDFD00FDFE
              FE00FDFEFE00B8B8B8000000000000000000BCBCBC00F8F9FA00F9FAFA00BCAB
              AE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE0065A6B7008CE0EE0062BF
              D700499AB2000E1216000000000000000000757575007575750075757500AEAE
              AE00757575007575750075757500000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000CBD0CC0057A5
              5F0072E3850059C16A0054755400EEDED300FAEADA00BCA69D00F3E1C900E1D1
              BA00FDEBCE00D4C8B8009B989800EAE9EA0000000000BCBCBC00F8F9FA00F9FA
              FA00BCABAE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE00FDFEFE00E5E5
              E600DFDFE000BABABA000000000000000000BDBDBD00F9FAFA00FAFBFB00FBFB
              FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00BABABA0073ACB9008CE0
              EE006CC4D9007D868600353590000000000075757500AEAEAE00AEAEAE00AEAE
              AE00AEAEAE00AEAEAE0075757500000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000091B7
              96005ECE700074EA880058AF65004B744E00BCB1AC00B9AAA400EDDFD100BDAF
              A000C1B5A900AAA7A500D0D0D1000000000000000000BDBDBD00F9FAFA00FAFB
              FB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00BABABA00B8B8
              B800B8B8B800BABABA000000000000000000BFBFBF00FAFBFB00FBFBFC00FBFC
              FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE00C5C5C500F6F6F6007DB0
              BB00CAB8AC007385D1005E6CAD0035359000757575007575750075757500AEAE
              AE00757575007575750075757500000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000EDF6
              EF009DC2A00052A15B006DE2810065D67700497C500059805B005B8E61004D7B
              510087868500D2D2D200FCFCFC000000000000000000BFBFBF00FAFBFB00FBFB
              FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE00C5C5C500F6F6
              F600BBBBBB00F2F2F2000000000000000000C0C0C000FBFBFC00FBFCFC00FCFD
              FD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFEFE00CACACA00BABABA00F3F4
              F3005E6CAD00708FDF005E76D0005E6CAD00000000000000000075757500AEAE
              AE00757575000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000C5DEC8008AB38F0075AA7D006EB078007FBB890093B89800D1D9
              D200FDFDFD0000000000000000000000000000000000C0C0C000FBFBFC00FBFC
              FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFEFE00CACACA00BABA
              BA00F3F4F300000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBFBF00FAFAFA000000
              0000000000005E6CAD005E6CAD006579BC000000000000000000757575007575
              7500757575000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
              C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBFBF00FAFA
              FA0000000000000000000000000000000000424D3E000000000000003E000000
              2800000040000000300000000100010000000000800100000000000000000000
              000000000000000000000000FFFFFF0000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFF0007FFFF0000FC010007801F0000
              FC010007801F0000FC010007801F0000FC010007801F0000FC010007801F0000
              FC010007801F0000FC010007801F0000FC010004801F0000FC010000800F0000
              FFFF00018007000001FF0003FF83000001FF0003FFC1000001FF0001FFE00000
              FFFF0008FFF00000FFFF001CFFF800000007FFFFFFFF80030007FC01F0038003
              0007FC01E00180030007FC01E00180030007FC01C00080030007FC01C0008003
              0007FC01C00080030007FC01800080030007FC01000080030007C40100008003
              0007C7FF80008003000301FFC0008003000101FFE0018003000001FFE0018003
              0000C7FFF80780070018C7FFFFFF800F00000000000000000000000000000000
              000000000000}
          end
        end
        object FacSpec: TPanel
          Left = 0
          Top = 0
          Width = 808
          Height = 52
          Align = alTop
          BevelEdges = []
          BevelKind = bkSoft
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            808
            52)
          object Label10: TLabel
            Left = 45
            Top = 9
            Width = 59
            Height = 13
            Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
          end
          object Label11: TLabel
            Left = 23
            Top = 33
            Width = 81
            Height = 13
            Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
          end
          object dbcbeFac: TDBLookupComboboxEh
            Left = 110
            Top = 5
            Width = 691
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            DropDownBox.Rows = 20
            EditButtons = <>
            Flat = True
            KeyField = 'Ik_fac'
            ListField = 'Cname_fac'
            ListSource = dmUgtuStructure.dsFacultyAll
            TabOrder = 0
            Visible = True
            OnKeyValueChanged = dbcbeFacKeyValueChanged
          end
          object dbcbeSpec: TDBLookupComboboxEh
            Left = 110
            Top = 30
            Width = 691
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            EditButtons = <>
            Flat = True
            KeyField = 'ik_spec'
            ListField = 'Cname_spec'
            ListSource = dmUgtuStructure.dsSpecForNagr
            TabOrder = 1
            Visible = True
            OnKeyValueChanged = dbcbeSpecKeyValueChanged
          end
        end
        object cbKaf: TCheckBox
          Left = 478
          Top = 104
          Width = 167
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1081' '#1082#1072#1092#1077#1076#1088#1099
          TabOrder = 2
          OnClick = cbKafClick
        end
        object PContentForDiscVC: TPanel
          Left = 241
          Top = 424
          Width = 434
          Height = 105
          Caption = 'PContentForDiscVC'
          TabOrder = 3
          Visible = False
          object DBGEContentForDiscVC: TDBGridEh
            Left = 1
            Top = 1
            Width = 432
            Height = 103
            Align = alClient
            AutoFitColWidths = True
            DataSource = dsContentForDiscVC
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = RUSSIAN_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'n_sem'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'cshort_name_kaf'
                Footers = <>
                Title.Caption = #1050#1072#1092#1077#1076#1088#1072
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'tasks_count'
                Footers = <>
                Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1076#1072#1085#1080#1081
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'n_module'
                Footers = <>
                Title.Caption = #1052#1086#1076#1091#1083#1100
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'i_balls'
                Footers = <>
                Title.Caption = #1052#1072#1082#1089#1080#1084#1091#1084' '#1073#1072#1083#1086#1074
              end>
          end
        end
        object PContentForDiscAZ: TPanel
          Left = 241
          Top = 424
          Width = 434
          Height = 118
          Caption = 'PContentForDisc'
          TabOrder = 4
          Visible = False
          object DBGEContentForDiscAZ: TDBGridEh
            Left = 1
            Top = 1
            Width = 432
            Height = 116
            Align = alClient
            AutoFitColWidths = True
            DataSource = dsContentForDiscAZ
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = RUSSIAN_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'cName_vid_zanyat'
                Footers = <>
                Title.Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
                Width = 170
              end
              item
                EditButtons = <>
                FieldName = 'cshort_name_kaf'
                Footers = <>
                Title.Caption = #1050#1072#1092#1077#1076#1088#1072
              end
              item
                EditButtons = <>
                FieldName = 'i_hour_per_week'
                Footers = <>
                Title.Caption = #1063#1072#1089#1086#1074' '#1074' '#1085#1077#1076#1077#1083#1102
                Width = 70
              end
              item
                EditButtons = <>
                FieldName = 'week_count'
                Footers = <>
                Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1076#1077#1083#1100
                Width = 72
              end>
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1053#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080
        ImageIndex = 4
        object dbgNormTime: TDBGridEh
          Left = 0
          Top = 0
          Width = 808
          Height = 619
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsPlanNormTime
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
          RowHeight = 2
          RowLines = 1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleHeight = 15
          UseMultiTitle = True
        end
        object Panel10: TPanel
          Left = 0
          Top = 619
          Width = 808
          Height = 26
          Align = alBottom
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 1
          object ToolBar5: TToolBar
            Left = 508
            Top = 0
            Width = 296
            Height = 22
            Align = alRight
            ButtonWidth = 145
            Caption = 'ToolBar4'
            Images = ImageList1
            List = True
            ShowCaptions = True
            AllowTextButtons = True
            TabOrder = 0
            object ToolButton16: TToolButton
              Left = 0
              Top = 0
              Cursor = crHandPoint
              Action = actNormUndoChanges
              Style = tbsTextButton
            end
            object ToolButton24: TToolButton
              Left = 146
              Top = 0
              Cursor = crHandPoint
              Action = actNormSaveChanges
              Style = tbsTextButton
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 588
    Width = 665
    Align = alNone
    Visible = False
    ExplicitTop = 588
    ExplicitWidth = 665
    DesignSize = (
      665
      37)
    inherited bbSave: TBitBtn
      Left = 496
      ExplicitLeft = 496
    end
    inherited bbUndo: TBitBtn
      Left = 52
      ExplicitLeft = 52
    end
  end
  object Panel9: TPanel
    Left = 160
    Top = 271
    Width = 337
    Height = 65
    BorderStyle = bsSingle
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 84
      Top = 16
      Width = 166
      Height = 13
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Microsoft Excel'
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 40
      Width = 327
      Height = 17
      TabOrder = 0
    end
  end
  object Panel8: TPanel
    Left = 240
    Top = 298
    Width = 238
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    object Image1: TImage
      Left = 16
      Top = 14
      Width = 32
      Height = 32
      Picture.Data = {
        055449636F6E0000010001002020000001002000A81000001600000028000000
        2000000040000000010020000000000080100000000000000000000000000000
        00000000000000000000000000000000010101031919192E1B1B1B3001010115
        0000000200000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000101010B2D2D2D93303030B42F2F2F7F37373737
        0000001000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000004E4C4EAD858484FF888888FF444444D53F3F3F6E
        2A2B2A2B0000000A000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000757073E5E3E0E2FF959495FF909090FE353635C1
        4A4A4A5A15151522000000050000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000766F71A7B4ACAFFFE5E2E4FF8C8B8BFF818181F7
        2B2A2AA7494949490505051A0000000200000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000007B767A0D6D6669CDCBC5C7FFCFCDCFFF8D8C8CFF
        686868EC2A2A2A8C3E3E3E390000001100000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000747074266D6668E3DCD6D9FFB8B6B7FF
        8E8E8EFF4A4A4ADB393838722B2B2B2C00000009000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000706C6F45776F71F1E5DFE2FF
        A5A3A4FF8A8989FF363636C24444445912121221000000040000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000006F6A6E64877E81FB
        E3DDE0FF969595FF767676F62A2929A441414144010101160000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006D676B81
        978E91FFD6D2D3FF908E8EFF575757E82B2B2B83313131310000000B00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        6B66699BA59D9EFFC3C0C0FF858485FF3C3C3CD03939395F1313132200000006
        0000000000000002000000080000000E000000100000000E0000000A00000006
        0000000200000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006E686BAEAFA7A9FFB0AEAEFF6C6B6BFA2C2B2BA7363636490E0E0E21
        00000023080808470E0E0F621313146B16161765171718581010104605050530
        0000001B00000009000000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000007D787C06776F73B9B0A9AAFF9C999AFF515151E72A2A2AA43D3D3E96
        5B5B5BCB7A7A7BE6949495ED9E9E9FF0929292ED767676E2595958C44342428B
        2423234F0707072F000000140000000200000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000918A8F077A7375B5B3B1B1FFA9A9A9FF808081F69D9C9CE3
        B7B5B2ABC6C4C165CAC8C828E6B9920BCFBEAE32C8C0B86FB0AEA9B3939392E1
        5D5C5DC944424073151617390000001900000002000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003D3B3C30777778F7BCBCBEFFC6C2BDA6E0C7AD36
        FFAD660FFFAD6608FFAD6606FFAD6608FFAD660FFFAD6617FFAD6620E4C09D49
        B2ADA7B9757575DE494745841A1A1B3900000014000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003636375B8F8F90F2CEC5B689FFAD6623FFAD661B
        FFAD6614FFAD660FFFAD660DFFD6B31CFFE0C530FFDEC139FFCCA035FFB27030
        FFAE6839C7BCAEA1767676E1474642720D0D0D2F000000060000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000E0F10356F6F71E0C6BEB3A9FFAD6632FFAD662AFFAD6622
        FFAD661BFFBF871CFFE8D43CFFF1E45AFFEEE05DFFEAD960FFE7D165FFD9B959
        FFC18B4BFFAE6847BAB3AABA5F5F5ECF373533490000001C0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000044444693AFAEABE2E8B98954FFAD6639FFAD6631FFAD662A
        FFB57627FFE4CD4DFFF0E36CFFEFE16BFFEDDD6CFFEAD86EFFE7D172FFE3CB76
        FFDAB96EFFBF885AEEBB89649D9C9AE54644428E1010112E0000000200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000010111230707072DEC5BAAAA8FFAD6649FFAD6641FFAD6639FFAD6633
        FFD9B953FFEEDF7DFFEEDF7BFFEDDD7AFFEBDA7AFFE9D67CFFE7D27EFFE4CD82
        FFE1C786FFD4AE79FFB2705FC1B7A8B85C5B5BCD2828293C0000000800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000020202252919090EFD9BB9880FFAD6651FFAD6649FFAD6642FFBF8849
        FFE8D47FFFEDDD8BFFEDDD8AFFECDB89FFEAD988FFE9D689FFE7D28BFFE4CD8E
        FFE2C991FFE0C596FFC59377DCBB9A8E818081E9282929530000000F00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000020202266A8A7A6EEECB27B6DFFAD6659FFAD6652FFAD664CFFCDA263
        FFECDC9BFFECDC98FFECDC97FFEBDA96FFEAD896FFE9D696FFE7D397FFE5CF99
        FFE3CB9DFFE1C8A0FFD3AC8EEEB47D7A9C9D9DF020201F690000011200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000027272972B2B0AEF0FDAE6969FFAD6661FFAD665BFFAD6656FFBC825D
        FFDEC184FFECDCA4FFEBDAA3FFEBD9A2FFEAD8A2FFE9D6A2FFE8D3A4FFE6D0A4
        FFE5CEA7FFE3CAA9FFDCBEA3FDAD6875A9A9A9F21C1C1C6F0000010F00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000004243457CA8A6A3F1ECB17879FFAD6669FFAD6664FFAD665FFFCEA47D
        FFB4735EFFCDA275FFDFC492FFEBDAADFFEAD8ADFFE9D6ADFFE8D5AEFFE7D3AF
        FFE5CFB0FFE4CDB2FFE2C9B3EFB37B82A1A1A0F11B1B1C670000000800000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000042434563959390F0DCB68C8FFFAD6670FFAD666CFFAD6668FFEBD9B9
        FFE1C7A1FFCFA682FFB47367FFC79779FFD7B591FFE2CAA6FFE9D6B7FFE8D4B8
        FFE7D3B9FFE5CFBAFFDFC4B2E0BA95968B8B8BEC1B1B1C4C0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000077777C617F7D7CEFC6B299AFFFAD6677FFAD6674FFAD6671FFEBDAC2
        FFEDDDC4FFECDCC2FFE4CCAEFFD6B398FFC69482FFB37173FFC18B83FFCCA093
        FFD5B0A0FFDABBACFFD1AAA2CCBBA8BB6E6E6FD7141515200000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000008485872B7C7C7CCEADA59BDDEFB2757FFFAD667AFFAD6678FFE7D1BD
        FFEDDECBFFEDDDC9FFEDDDC9FFECDCC8FFECDCC7FFE5CEBAFFDCBDACFFD2ACA0
        FFC99A98FFC08A90F2BB8487B7B2ADE4434444A0000000040000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000091919263898683F5C4AE92B3FFAD677FFFAD667EFFDEC1B3
        FFEEE0D1FFEEDFD0FFEEDFCFFFEDDDCEFFEDDDCEFFECDCCEFFECDBCDFFEBDACD
        FFEBD9CDFFDDC0B4D5C2ADBE7A7A7BE50C0D0D26000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000007E7F7FBF9C948DF5D0B18CA3FFAD6780FFD1A9A3
        FFEFE1D5FFEFE0D5FFEEDFD4FFEEDFD3FFEEDFD3FFEDDED2FFEDDDD2FFEDDDD1
        FFE4CCBFE4CBB3B6A29E9DF33738397F00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000003535351981807FD9A39990F6CAB399BAF2C18E8D
        FFE8D4C8FFF0E3D7FFEFE2D7FFEFE2D6FFEFE1D6FFEFE1D5FFEEE0D4F8E1CABC
        D9C7B4C7A6A2A0F647484AA30000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000009899991C706F6FC8928A84F9B8AC9FE5
        D3C1ACC6ECDCCACBF8E8D9D1FEEFE2D7F8E8D8CFEDDDCBC9D9CABACFBEB4AAEA
        878583F34040428D000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000202121063B3B3C776E6D6AE0
        8E8680F7A49A92FCB4ABA3FDBBB4ADFCB3ABA4FCA29B95FB84817DF35C5C5DC4
        1616173600000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000C0C0D0B
        2C2D2D534847478F535251AE52514FB34E4E4DA0363637761516172C00000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000E0FFFFFFC0FFFFFFC07FFFFFC03FFFFFC01FFFFFC01FFFFFE00FFFFF
        F007FFFFF807FFFFFC03FFFFFE0100FFFF00003FFF00001FFF80000FFFC0000F
        FFC00007FF800007FF800003FF000003FF000003FF000003FF000003FF000003
        FF000007FF000007FF000007FF80000FFFC0001FFFC0003FFFE0007FFFF000FF
        FFFC03FF}
    end
    object Label1: TLabel
      Left = 71
      Top = 14
      Width = 132
      Height = 13
      Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077'...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 58
      Top = 33
      Width = 159
      Height = 13
      Caption = ' '#1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1072#1085#1072#1083#1080#1079' '#1076#1072#1085#1085#1099#1093'...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 25
    Top = 61
    Width = 212
    Height = 96
    BevelEdges = [beRight, beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object Label12: TLabel
      Left = 15
      Top = 8
      Width = 61
      Height = 13
      Caption = #1058#1080#1087' '#1086#1090#1095#1077#1090#1072':'
    end
    object Label13: TLabel
      Left = 3
      Top = 36
      Width = 72
      Height = 13
      Caption = #1058#1080#1087' '#1086#1073#1091#1095#1077#1085#1080#1103':'
    end
    object Bevel4: TBevel
      Left = 2
      Top = 58
      Width = 207
      Height = 8
      Shape = bsTopLine
    end
    object SpeedButton7: TSpeedButton
      Left = 75
      Top = 66
      Width = 62
      Height = 22
      Cursor = crHandPoint
      Action = actExportFactNagrExecution
      Flat = True
    end
    object SpeedButton8: TSpeedButton
      Left = 143
      Top = 66
      Width = 62
      Height = 22
      Cursor = crHandPoint
      Caption = #1054#1090#1084#1077#1085#1072
      Flat = True
      OnClick = SpeedButton8Click
    end
    object cbRepType: TDBComboBoxEh
      Left = 82
      Top = 5
      Width = 119
      Height = 19
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1079#1072' '#1089#1077#1084#1077#1089#1090#1088
        #1079#1072' '#1075#1086#1076)
      KeyItems.Strings = (
        #1079#1072' '#1089#1077#1084#1077#1089#1090#1088
        #1079#1072' '#1075#1086#1076)
      TabOrder = 0
      Visible = True
    end
    object cbFormEd: TDBComboBoxEh
      Left = 82
      Top = 33
      Width = 119
      Height = 19
      EditButtons = <>
      Flat = True
      Items.Strings = (
        #1073#1102#1076#1078#1077#1090
        #1082#1086#1085#1090#1088#1072#1082#1090)
      KeyItems.Strings = (
        '1'
        '2')
      TabOrder = 1
      Visible = True
    end
  end
  object actList: TActionList
    Images = ImageList1
    Left = 447
    Top = 282
    object actAddPotokSemester: TAction
      Category = 'catPotok'
      Caption = 'actAddPotokSemester'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1090#1086#1082#1080' '#1074' '#1089#1077#1084#1077#1089#1090#1088'...'
      ImageIndex = 32
    end
    object actAddPotok: TAction
      Category = 'catPotok'
      Caption = 'actAddPotok'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1090#1086#1082'...'
      ImageIndex = 1
      ShortCut = 45
      OnExecute = actEditPotokExecute
      OnUpdate = actAddPotokUpdate
    end
    object actEditPotok: TAction
      Tag = 1
      Category = 'catPotok'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1090#1086#1082'...'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1090#1086#1082'...'
      ImageIndex = 23
      ShortCut = 16450
      OnExecute = actEditPotokExecute
      OnUpdate = actEditPotokUpdate
    end
    object actDelPotok: TAction
      Category = 'catPotok'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1090#1086#1082
      ImageIndex = 0
      ShortCut = 46
      OnExecute = actDelPotokExecute
      OnUpdate = actEditPotokUpdate
    end
    object actAddPrepod: TAction
      Category = 'catPrepods'
      Caption = 'act'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103'...'
      ImageIndex = 4
      OnExecute = actAddPrepodExecute
      OnUpdate = actAddPotokUpdate
    end
    object actEditPrepod: TAction
      Category = 'catPrepods'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077'...'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077'...'
      ImageIndex = 6
      OnExecute = actEditPrepodExecute
      OnUpdate = actEditPrepodUpdate
    end
    object actDelPrepod: TAction
      Category = 'catPrepods'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
      ImageIndex = 5
      OnExecute = actDelPrepodExecute
      OnUpdate = actEditPrepodUpdate
    end
    object actAddPlan: TAction
      Category = 'catNagruzka'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'...'
      ImageIndex = 16
      ShortCut = 16455
      OnExecute = actEditPlanExecute
      OnUpdate = actAddPlanUpdate
    end
    object actEditPlan: TAction
      Tag = 1
      Category = 'catNagruzka'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1083#1072#1085#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'...'
      ImageIndex = 15
      ShortCut = 16456
      OnExecute = actEditPlanExecute
      OnUpdate = actEditPlanUpdate
    end
    object actDelPlan: TAction
      Category = 'catNagruzka'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
      ImageIndex = 13
      ShortCut = 16457
      OnExecute = actDelPlanExecute
      OnUpdate = actEditPlanUpdate
    end
    object actLockUnlockPlan: TAction
      Category = 'catNagruzka'
      ImageIndex = 26
      ShortCut = 16458
      OnExecute = actLockUnlockPlanExecute
      OnUpdate = actLockUnlockPlanUpdate
    end
    object actExportFactNagrExecution: TAction
      Category = 'catNagruzka'
      Caption = #1054#1050
      OnExecute = actExportFactNagrExecutionExecute
    end
    object actLoadNagrAvto: TAction
      Category = 'catNagruzka'
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      ImageIndex = 24
      ShortCut = 16459
      OnExecute = actLoadNagrAvtoExecute
      OnUpdate = actEditPlanUpdate
    end
    object actAddDisc: TAction
      Category = 'catNagruzka'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1074' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080'...'
      ImageIndex = 17
      ShortCut = 16460
      OnExecute = actAddDiscExecute
      OnUpdate = actEditPlanUpdate
    end
    object actEditDisc: TAction
      Tag = 1
      Category = 'catNagruzka'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1075#1088#1091#1079#1082#1091' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077'...'
      ImageIndex = 12
      ShortCut = 16461
      OnExecute = actAddDiscExecute
      OnUpdate = actEditDiscUpdate
    end
    object actDelDisc: TAction
      Category = 'catNagruzka'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1080#1079' '#1087#1083#1072#1085#1072' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
      ImageIndex = 18
      ShortCut = 46
      OnExecute = actDelDiscExecute
      OnUpdate = actEditDiscUpdate
    end
    object actGetDistributedNagr: TAction
      Category = 'catNagruzka'
      Caption = 'actGetDistributedNagr'
      ImageIndex = 28
      ShortCut = 16463
      OnExecute = actGetDistributedNagrExecute
      OnUpdate = actEditDiscUpdate
    end
    object actExport: TAction
      Category = 'catNagruzka'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' MS Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1074' MS Excel'
      ImageIndex = 22
      ShortCut = 16464
      OnExecute = actExportDepPlanExecute
      OnUpdate = actExportUpdate
    end
    object actAddPotokShema: TAction
      Category = 'catPotok'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1093#1077#1084#1099' '#1088#1072#1079#1073#1080#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      ImageIndex = 21
      ShortCut = 16429
      OnExecute = actAddPotokShemaExecute
      OnUpdate = actAddPotokShemaUpdate
    end
    object actExportTeacherList: TAction
      Category = 'catPrepods'
      Caption = ' '#1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' MS Excel'
      Enabled = False
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081' '#1074' MS Excel'
      ImageIndex = 22
      ShortCut = 16465
      OnExecute = actExportTeacherListExecute
      OnUpdate = actExportTeacherListUpdate
    end
    object actExportDepPlan: TAction
      Category = 'catNagruzka'
      Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1074' MS Excel'
      OnExecute = actExportDepPlanExecute
      OnUpdate = actLockUnlockPlanUpdate
    end
    object actExportFactPlanResult: TAction
      Category = 'catNagruzka'
      Caption = 
        #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1084' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1074' MS E' +
        'xcel'
      Visible = False
      OnExecute = actExportFactPlanResultExecute
      OnUpdate = actLockUnlockPlanUpdate
    end
    object actExportDistributedNarg: TAction
      Category = 'catNagruzka'
      Caption = 
        #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1086#1073' '#1086#1073#1098#1077#1084#1072#1093' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1074' MS Exce' +
        'l'
      OnExecute = actExportDistributedNargExecute
      OnUpdate = actLockUnlockPlanUpdate
    end
    object actEditPotokShema: TAction
      Tag = 1
      Category = 'catPotok'
      Caption = 'actEditPotokShema'
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      ImageIndex = 20
      ShortCut = 16453
      OnExecute = actAddPotokShemaExecute
      OnUpdate = actEditPotokShemaUpdate
    end
    object actDelPotokShema: TAction
      Category = 'catPotok'
      Caption = 'actDelPotokShema'
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072
      ImageIndex = 19
      ShortCut = 16430
      OnExecute = actDelPotokShemaExecute
      OnUpdate = actEditPotokShemaUpdate
    end
    object actExportDistributedNagrForShedule: TAction
      Category = 'catNagruzka'
      Caption = 
        #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1086' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1080' '#1085#1072#1075#1088#1091#1079#1082#1080' ('#1076#1083#1103' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1088 +
        #1072#1089#1087#1080#1089#1072#1085#1080#1103') '#1074' MS Excel'
      OnExecute = actExportDistributedNagrForSheduleExecute
      OnUpdate = actLockUnlockPlanUpdate
    end
    object actExportSummaryNagrForYear: TAction
      Category = 'catNagruzka'
      Caption = 
        #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1086' '#1088#1072#1089#1095#1077#1090#1077' '#1091#1095#1077#1073#1085#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1079#1072' '#1090#1077#1082#1091#1097 +
        #1080#1081' '#1091#1095#1077#1073#1085#1099#1081' '#1075#1086#1076' '#1074' MS Excel'
      OnExecute = actExportSummaryNagrForYearExecute
      OnUpdate = actExportSummaryNagrForYearUpdate
    end
    object actAddPotokSemesterShema: TAction
      Category = 'catPotok'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1093#1077#1084#1099' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      Enabled = False
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1093#1077#1084#1091' '#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1072'...'
      ImageIndex = 21
      OnExecute = actAddPotokSemesterShemaExecute
      OnUpdate = actAddPotokSemesterShemaUpdate
    end
    object actCloseFactNagr: TAction
      Category = 'catNagruzka'
      Caption = 'actCloseFactNagr'
      ImageIndex = 2
    end
    object actAutoShema: TAction
      Category = 'catPotok'
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1093#1077#1084#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      Enabled = False
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1093#1077#1084#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'...'
      ImageIndex = 30
      OnExecute = actAutoShemaExecute
      OnUpdate = actAutoShemaUpdate
    end
    object actShowUchPlan: TAction
      Category = 'catPotok'
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085' '#1087#1086#1090#1086#1082#1072' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1089#1077#1084#1077#1089#1090#1088#1077
      Enabled = False
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085' '#1087#1086#1090#1086#1082#1072' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1089#1077#1084#1077#1089#1090#1088#1077
      ImageIndex = 16
      OnExecute = actShowUchPlanExecute
      OnUpdate = actShowUchPlanUpdate
    end
    object ExportFactNagrYearExecution: TAction
      Category = 'catNagruzka'
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1079#1072' '#1075#1086#1076
      OnExecute = ExportFactNagrYearExecutionExecute
    end
    object actNagrAutoFill: TAction
      Category = 'catNagruzka'
      Caption = 'actNagrAutoFill'
      OnExecute = actNagrAutoFillExecute
    end
    object actCombinePotoks: TAction
      Category = 'catPotok'
      Caption = 'actCombinePotoks'
      OnExecute = actCombinePotoksExecute
    end
    object actDividePotok: TAction
      Category = 'catPotok'
      Caption = 'actDividePotok'
      OnExecute = actDividePotokExecute
    end
  end
  object ImageList1: TImageList
    Left = 612
    Top = 125
    Bitmap = {
      494C010121002200580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      00000000000000000000000000000000000000000002000000100000001C0000
      002800000034000000400000004A000000560000005A00000058000000680000
      006A0000004C0000002A00000014000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000382F2956382F29B9382F29B9382F
      29B939302AB93A312BB93C332DB93D352FB9302924C7A6A6A6FFC7C7C7FFCCCC
      CCFFCACACAFF666462E9453D38BF382F29640000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000413832FFDDDCDBFFE1DFDEFFE4E2
      E2FFE6E5E4FFE9E8E7FFEBEAEAFFCCCCCCFFBFBFBFFFB6C3B8FF2A8F36FF2B93
      38FF2D953AFFD4D4D4FFA8A7A7FF7D7773FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000483F3AFFE1E0DFFFD8B69AFFDBBB
      A0FFDEBEA5FFDFC2AAFFE1C5AFFF969696FFAFBFB0FF2A8F36FFD7D7D7FFDADA
      DAFFD8DAD8FF2E9E3CFFD2D2D2FF5F5B58FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000483F3AFFE3E2E1FFE4D8CFFFE7DB
      D4FFEAE0D9FFEDE5DDFFF0E8E1FFB0B0B0FF2A8E36FFA1C0A4FFD8D8D8FFDADA
      DAFFDCDCDCFFC8D7C9FF97C59CFF828180FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000483F3AFFE2E1E0FFE4DED7FFE8E1
      DBFFECE6E1FFEFEAE5FFF2EDE9FFD1D1D1FF54A85EFFB6D3B9FFE9E9E9FFEBEB
      EBFFEDEDEDFFEFEFEFFF9ED3A5FF8B8A89FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000483F3AFFE0DEDDFFD6AD8CFFD7B1
      90FFDAB495FFDBB799FFDDBB9DFFCACACAFF62B06BFF64B46DFFEDEDEDFFEFEF
      EFFFF1F1F1FFF2F2F2FFF0F0F0FF635F5CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000473E39FFDAD9D8FFDDDCDBFFE1DF
      DFFFE5E3E3FFE7E6E5FFE9E8E8FFD9D8D7FFE6E6E6FF70BC79FF73C07CFFF3F3
      F3FFF4F4F4FFDBEBDEFFECECECFF88827FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000473E39FFD4D2D1FFD2A47FFFD2A6
      83FFD3A985FFD5AB8AFFD6AE8DFFD7B091FFBCB5AEFFEEEEEEFFF2F2F2FFF5F5
      F5FFF5F5F5FFF1F1F1FFE4E0DCFF8A8481FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000048413CFFD1CFCDFFD3C4BAFFD7CB
      C0FFDCD0C7FFD7C9BFFFD7CABFFFD9CCC1FFD9CDC2FFDACEC5FFB9B4B0FFBFBD
      BBFFDED7D1FFE5DDD7FFE6E4E3FF908A86FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D453FFFE0DDDDFFE1DAD5FFE4DD
      D9FFDFD9D3FFDFD9D4FFDDD6D2FFD2CAC2FFD4CCC4FFD4CDC6FFD6CEC7FFD6CE
      C8FFDED8D3FFEAE5E2FFE9E7E6FF938D8BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000504842FFE3E2E1FFE2C2A7FFE4C6
      ACFFE5C8B1FFE6CBB5FFE6CCB7FFE5CBB7FFCEA27EFFCEA580FFCFA584FFCFA8
      86FFCFA989FFD7B79CFFEBE7E4FF989391FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004B433EFFDDDCDBFFE1E0DFFFE3E3
      E2FFE5E5E4FFE7E6E6FFE8E8E7FFE9E8E8FFE9E8E8FFDEDDDCFFBFBCBBFFC0BD
      BCFFC0BEBCFFC0BEBDFFC1C0BEFF9A9491FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000382F29FF382F29FF3C332DFF4037
      32FF453C37FF49413BFF4D4540FF514944FF564E49FF5A534EFF5E5752FF5750
      4BFF382F29FF382F29FF382F29FF382F29FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000382F29FF39302AFF3D342EFF4139
      33FF453D37FF4A413CFF4E4641FF524B45FF574F4AFF5B534EFF5F5853FF645D
      58FF68615CFF201F1EFF231F1CFF382F29FF0000000000000000000000000000
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
      00000000000000000000000000000000000000000000CECBCD0064646400A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00F5F5
      F500E9E9E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDDDD00ECEC
      EC00FAFAFA000000000000000000000000000000000000000000F5F5F500E9E9
      E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDDDD00ECECEC000000
      00000000000000000000000000000000000000000000FDFDFD00F5F5F500E9E9
      E900DFDFDF00D9D9D900D3D3D300D1D1D10000000000A7A9DB005A5CC2003C3F
      BE00494AB5008484B800000000000000000000000000AAA6A800E2DFE2004D58
      5D00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900E2E2E200C0C0
      C000A1A1A1008E8E8E00828282007676760071717100797979008C8C8C00B6B6
      B600EAEAEA0000000000000000000000000000000000E2E2E200C0C0C000A1A1
      A1008E8E8E00828282007676760071717100797979008C8C8C00B6B6B600EAEA
      EA0000000000000000000000000000000000F9F9F900E2E2E200C0C0C000A1A1
      A1008E8E8E008282820076767600000000009498EA005259E2006F76F1008185
      F200585EE9003337D6006868B500000000000000000000000000AFABAE00E2E0
      E20058686F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600999288006C51
      38006E4620006D4621008C5420008D521A00814A170071461E0059422D008888
      8800DADADA00000000000000000000000000E6E6E600999288006C5138006E46
      20006D4621008C5420008D521A00814A170071461E0059422D0088888800DADA
      DA0000000000000000000000000000000000E6E6E600999288006C5138006E46
      20006D4621008C5420008D521A009CA1F100545BDF00A9ADF100000000000000
      00007984DF00313FE6002C34D9005B6ABD0000000000000000000000000090A2
      AD00E2E0E20061757D00466B7A00476571003756620000000000000000000000
      000000000000000000000000000000000000000000009C7E6100985C2300C18A
      56009F6A3900804B2200C6916000C9936000B8793D00B3713300824B18008686
      8600DBDBDB000000000000000000000000009C7E6100985C2300C18A56009F6A
      3900804B2200C6916000C9936000B8793D00B3713300824B180086868600DBDB
      DB00000000000000000000000000000000009C7E6100985C2300C18A56009F6A
      3900804B2200C6916000C9936000626BE3007277C6000000000000000000909F
      E2003951DE00667DE8003E53EB002439B3000000000000000000000000000000
      000084969E00BFB1A500CED7D30099D7EA00B6C8C30051626500000000000000
      0000000000000000000000000000000000000000000089501A00C7905C00CC97
      660094623A00ECCCCF009E6C3F00CE9A6900CA956300B676390074461B00A8A8
      A800EAEAEA0000000000000000000000000089501A00C7905C00CC9766009462
      3A00ECCCCF009E6C3F00CE9A6900CA956300B676390074461B00A8A8A800EAEA
      EA000000000000000000000000000000000089501A00C7905C00CC9766009462
      3A00ECCCCF009E6C3F00CE9A6900535DDD008384B50000000000ADB0F000515A
      E100788BE400000000005C76ED002A37BC000000000000000000000000000000
      000070808200D3D1BF00A9D8DD00B9E3EE00B5E1E700C5C8B9002F4751009792
      8F0097928F0097928F0097928F00000000000000000095663A00CC976600DAAD
      83009F7B5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C644A00D7D7
      D700F9F9F90000000000000000000000000095663A00CC976600DAAD83009F7B
      5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C644A00D7D7D7000000
      00000000000000000000000000000000000095663A00CC976600DAAD83009F7B
      5E00FFFFF900BCA38E00B7885C005C66DF006567B2009EA2DF00666FEF008892
      E90000000000000000006170ED003D46B1000000000000000000000000000000
      000079807F00B1D2C600C0D8D300D2E3E200D5E7E500DBE2D1004B555700F6F6
      F600F6F6F600F6F6F60097928F000000000000000000AF957C00A6714000E5BE
      9900AA796E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4C400F6F6
      F60000000000000000000000000000000000AF957C00A6714000E5BE9900AA79
      6E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4C40000000000D5F2
      FE0000000000000000000000000000000000AF957C00A6714000E5BE9900AA79
      6E00BFCDCF009FB9C100866839008B93EC005059DA00555DD6008C90DC000000
      000000000000A0A2EB004852DD006671BD000000000000000000000000000000
      000078919200C4C0A500D6E4D800D3DBD000D4DFD200D6CCB60044586100B1B0
      AD00B1B0AD00F8F9F80097928F00000000000000000000000000C3AF9D009273
      450003698300157BC200177DC6000B71AF005B4719006D6D6D00BFBFBF00F5F5
      F5000000000000000000000000000000000000000000C3AF9D00927345000369
      8300157BC200177DC6000B71AF005B4719006D6D6D00BFBFBF00EBFFFF0051AB
      E800EBFFFF0000000000000000000000000000000000C3AF9D00927345000369
      8300157BC200177DC6000B71AF000B71AF008089EE004F5ADD006367B7008285
      B3007377C900525DE000707BD100000000000000000000000000000000000000
      000000000000918A7500DDD6C300F8FDF600E3DCCA007E847F00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC0097928F00000000000000000000000000000000006B9E
      B800298FEC003399FF003399FF003298FD00157BC20049565C0098989800E4E4
      E4000000000000000000000000000000000000000000000000006B9EB800298F
      EC003399FF003399FF003298FD00157BC2008BC4EA007DBDE9008FC1D0003590
      D1008FC1D00072B0D90082B5D9000000000000000000000000006B9EB800298F
      EC003399FF003399FF003298FD00369CF9000B71AF008D94ED005D66DF00525C
      DD00636CE500939BEC0000000000000000000000000000000000000000000000
      000000000000000000008E877F0094908B0074858600B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE0097928F00000000000000000000000000000000002585
      C3003EA4FF0040A6FF0040A6FF003EA4FF00369CF9001E5D7F007C7C7C00D6D6
      D6000000000000000000000000000000000000000000000000002585C3003EA4
      FF0040A6FF0040A6FF003EA4FF00369CF90094CAF4001FB7F9002C98D90023D5
      F1002E9BD9001EB6F9008CBDE4000000000000000000000000002585C3003EA4
      FF0040A6FF0040A6FF003EA4FF00369CF9001E5D7F007C7C7C00D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0097928F00000000000000000000000000000000002288
      CC0047ADFF004AB0FF004AB0FF0048AEFF0042A8FF001D7CBA0071717100D1D1
      D1000000000000000000000000000000000000000000000000002288CC0047AD
      FF004AB0FF004AB0FF0048AEFF008AA5A90099D1EB002E99D8008DE2F600AFF3
      FF008DE2F6002E99D8009AD2EB00A7C2C50000000000000000002288CC0047AD
      FF004AB0FF004AB0FF0048AEFF0042A8FF001D7CBA0071717100D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF0000000000000000000000000000000000278D
      CC0050B6FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC0071717100D1D1
      D100000000000000000000000000000000000000000000000000278DCC0050B6
      FF0053B9FF0053B9FF0051B7FF004EA3DF00398DCC0021D0EF009DF2FF00ECF8
      FF009DF2FF0021D0EF00358BCD00469FE0000000000000000000278DCC0050B6
      FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC0071717100D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF800266DBF00000000000000000000000000000000002086
      BF003398D1002E91C5003DA3DF004CB2F90045ABF2002180B40080808000D8D8
      D8000000000000000000000000000000000000000000000000002086BF003398
      D1002E91C5003DA3DF004CB2F900F5FBFE00BAE0F100319BDA007BDCF4008BF1
      FF007BDCF40038A0DA0097CAF100C3E0FE0000000000000000002086BF003398
      D1002E91C5003DA3DF004CB2F90045ABF2002180B40080808000D8D8D8000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00000000000000000000000000000000003E89
      AF00318DBF0052A6D50075B6DB005FA3C6003B8CB40015709E00ACACAC00EAEA
      EA000000000000000000000000000000000000000000000000003E89AF00318D
      BF0052A6D50075B6DB005FA3C6003B8CB40085BFEF0024B7FA00389CD80020CB
      ED00389CD80026B9F9007EB6F2000000000000000000000000003E89AF00318D
      BF0052A6D50075B6DB005FA3C6003B8CB40015709E00ACACAC00EAEAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDD7
      E3002381B20084C0E40097CAE80089C2E3002C88B8006390A600E0E0E000FAFA
      FA00000000000000000000000000000000000000000000000000BDD7E3002381
      B20084C0E40097CAE80089C2E3002C88B80098C8EC0093C0F100BBDFF1003891
      D000BBDFF10093C0F10099C9EC00000000000000000000000000BDD7E3002381
      B20084C0E40097CAE80089C2E3002C88B8006390A600E0E0E000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACCCDC005096B9004190B900408BB20089AFC200EDEDED00FBFBFB000000
      000000000000000000000000000000000000000000000000000000000000ACCC
      DC005096B9004190B900408BB200FEFEFE00EDEDED0000000000EFF7FD005CAE
      EB00EFF7FD000000000000000000FEFEFE00000000000000000000000000ACCC
      DC005096B9004190B900408BB20089AFC200EDEDED00FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A0000000000000000009B9C93005455
      52004B4B480031312E005B5B57000000000052524F0048484600555653009797
      9400000000002C2C27004C4C48005B5C5800000000000178A6000178A6000178
      A6000178A6000178A6000178A6000178A6000178A6000178A6000178A6000178
      A6000178A6000178A6000000000000000000000000000178A6000178A6000178
      A6000178A6000178A6000178A6000178A6000178A6000178A6000178A6000178
      A6000178A6000178A60000000000000000000000000000000000000000008686
      8600F0F0F200F1F1F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5
      F700F6F6F700F7F7F800F7F8F90086868600000000000000000096988A00FFFF
      FF00FFFFF900FFFFFF005B5C520082847900FFFFFF00FFFBF300B9BCB1004142
      3C0082857900EDE2D400FFF7EC0093938400000000004BC0EB004BC0EB0049BE
      E90045BAE50044B9E50043B8E4005ED3FD003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A6000000000000000000000000004BC0EB004BC0EB0049BE
      E90045BAE50044B9E50043B8E4005ED3FD003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A60000000000000000000000000000000000000000009090
      9000F1F1F300CCC1C300A28A8D00A28A8D00D8D1D200F4F5F600D4CACD00CFC4
      C600F7F7F800F7F8F900F8F9FA0090909000000000000000000093948900FFFF
      FF00F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B897B000000000033A7D40033A7D4002499
      C6002499C6002297C4002095C20035AAD600178CB9000379A7000379A7000379
      A7001C91BE000178A60000000000000000000000000033A7D40033A7D4002499
      C6002499C6002297C4002095C20035AAD600178CB9000379A7000379A7000379
      A7001C91BE000178A600000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F00F5F5F700D4CBCD00CFC4
      C600F8F8F900F8F9FA00F9FAFA009D9D9D00000000000000000091928700FFFF
      FF00EADDD500C6B3A400C6B3A400C9B9A900E6DCD400F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B00000000004BC0EB004BC0EB004DC2
      ED0048BDE80047BCE70046BBE60060D5FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A6000000000000000000000000004BC0EB004BC0EB004DC2
      ED0048BDE80047BCE70046BBE60060D5FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A600000000000000000097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F60097928F00F6F6F800D5CBCD00D0C5
      C700F8F9FA00F9FAFA00FAFBFB00ACACAC00000000000000000091938800FFFB
      FA00C4AF9900FFFFFF00FFFFFF00FFFFFF00D2BCB000F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B000000000033A7D40033A7D4002B9F
      CC002A9ECB00289CC900259AC70039AEDA00178CB9000379A7000379A7000379
      A7001C91BE000178A60000000000000000000000000033A7D40033A7D4002B9F
      CC002A9ECB00289CC900259AC70039AEDA00178CB9000379A7000379A7000379
      A7001C91BE000178A600000000000000000097928F00F8F8F800B1B0AD00B1B0
      AD00F8F8F800B1B0AD00B1B0AD00F8F9F80097928F00CABDBF00B9A7AA00D0C5
      C700F9FAFB00FAFBFB00FBFBFC00ADADAD009B9C9300545552007F817600FFF7
      F400AF9A8400FFFFFF00FFFFFF00FFFFFF00D8C3B800F7EDE500C6B3A400C6B3
      A400C6B3A400C6B3A400F5E9E0008C897C00000000004BC0EB004BC0EB0052C6
      F1004CC1EC004ABFEA0049BEE90064D5FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A6000000000000000000000000004BC0EB004BC0EB0052C6
      F1004CC1EC004ABFEA0049BEE90064D5FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A600000000000000000097928F00FCFCFC00FBFBFC00FBFB
      FC00FCFCFB00FBFBFC00FBFCFC00FBFBFC0097928F00F8F8F900CBBEC000D0C6
      C800FAFBFB00FBFCFC00FBFCFC00B1B1B10096988A00FFFFFF0086887C00FFF9
      F600C7B6A400FFFFFF00FFFFFF00FFFFFF00D7C4B900F7EDE500D1C1B200D4C4
      B700D4C4B700D3C4B600FAF1E900838274000000000033A7D40033A7D40031A5
      D20030A4D1002CA0CD002A9ECB003BB0DC00178CB9000379A7000379A7000379
      A7001C91BE000178A60000000000000000000000000033A7D40033A7D40031A5
      D20030A4D1002CA0CD002A9ECB003BB0DC00178CB9000379A7000379A7000379
      A7001C91BE000178A600000000000000000097928F00FEFEFE00B1B0AD00B1B0
      AD00FEFEFE00B1B0AD00B1B0AD00FEFEFE0097928F00F9F9FA00F9FAFB00FAFB
      FB00FBFCFC00FBFCFD00FCFDFD00B3B3B30093948900FFFFFF0091918600FFFC
      FB00EADDD500C6B3A400C6B3A400C0AD9700EADDD500F7EDE500C6B3A400C6B3
      A400C6B3A400C6B3A400FBF4ED008C8C7F00000000004BC0EB004BC0EB0056CB
      F50051C5F0004DC2ED004ABFEA0068D6FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A6000000000000000000000000004BC0EB004BC0EB0056CB
      F50051C5F0004DC2ED004ABFEA0068D6FF003FB4E0002CA0CD002CA0CD002CA0
      CD003FB4E0000178A600000000000000000097928F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0097928F00B9A8AA00A28A8D00A28A
      8D00F6F4F600FCFDFD00FDFEFE00B5B5B50091928700FFFFFF008E8E8100FFFF
      FF00EADDD500EADDD500EADDD500EADDD500EADDD500FFFFFE00FDFBF600FAF7
      F400F7F5F200F3ECE500FEFAF40093948900000000000178A6000178A6004E7D
      97004E7D97004E7D97000178A6000178A6000178A600527A92004E7D97004773
      8F000178A6000178A6000000000000000000000000000178A6000178A6004E7D
      97004E7D97004E7D97000178A6000178A6000178A600527A92004E7D97004773
      8F000178A6000178A6000000000000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00AE999C00FBFCFC00CCBF
      C100DED7D800FDFEFE00FDFEFE00B8B8B80091938800FFFBFA008F8D8100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091938800919388009193
      88009193880091938800919388009B9C9300000000000000000000000000517C
      970064C8E800577790000000000000000000000000004575930033ABD700447B
      9B0000000000000000000000000000000000000000000000000000000000517C
      970064C8E8005777900000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF001683F500238EF600329B
      F60042A8F7004FB3F70058BAF80058BAF800266DBF00BAA8AB00FCFDFD00D2C7
      C900D8CFD000FDFEFE00FDFEFE00B8B8B80091938800FFF7F400D8DBD1009193
      88009193880091938800919388009193880091938800D8DBD100C6B3A400C6B3
      A400F5E9E0008C897C000000000000000000000000000000000000000000537D
      980065C9E800567891000000000000000000000000004674920033ACD9003E7A
      9B0000000000000000000000000000000000000000000000000000000000537D
      980065C9E8005678910000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00B4A1A300FCFDFD00CCC0
      C200DFD7D800E5E5E600DFDFE000BABABA0086887C00FFF9F600C8B7A600FFFF
      FF00FFFFFF00FFFFFF00D7C4B900F7EDE500D1C1B200D4C4B700D4C4B700D3C4
      B600FAF1E900838274000000000000000000000000000000000000000000537D
      980065C9E800567891000000000000000000000000004674920033ACD9003E7A
      9B0000000000000000000000000000000000000000000000000000000000537D
      980065C9E800567891000000000000000000000000004674920033ACD9003E7A
      9B0000000000000000000000000000000000000000000000000000000000BDBD
      BD00F9FAFA00FAFBFB00DDD5D700BAA8AB00FCFDFD00BAA9AB00A28A8D00A28A
      8D00B7B4B400B8B8B800B8B8B800BABABA0091938800FFFCFB00EADDD500C6B3
      A400C6B3A400C0AE9900EADDD500F7EDE500C6B3A400C6B3A400C6B3A400C6B3
      A400FBF4ED008C8C7F0000000000000000000000000000000000000000005680
      980064C8E6005D839B000000000000000000000000004889A90034B4E1005B7E
      9800000000000000000000000000000000000000000000000000000000005680
      980064C8E6005D839B000000000000000000000000004889A90034B4E1005B7E
      980000000000000000000000000000000000000000000000000000000000BFBF
      BF00FAFBFB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFE
      FE00C5C5C500F6F6F600BBBBBB00F2F2F20090918500FFFFFF00EADDD500EADD
      D500EADDD500EADDD500EADDD500FFFFFE00FDFBF600FAF7F400F7F5F200F3EC
      E500FEFAF4009394890000000000000000000000000000000000000000006C90
      A7006DC7E3006DB1C9007599AE007B97AA005993AE0034B1DC00109DD8006C90
      A700000000000000000000000000000000000000000000000000000000006C90
      A7006DC7E3006DB1C9007599AE007B97AA005993AE0034B1DC00109DD8006C90
      A70000000000000000000000000000000000000000000000000000000000C0C0
      C000FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFE
      FE00CACACA00BABABA00F3F4F3000000000095958C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BBBCB300B5B7AE00AEAFA600AEAFA600A6A8
      9E00B8BBB1009B9C93000000000000000000000000000000000000000000C9D4
      DC00537D98006BC3DF0073CBE4006BC2DD004EB0D200109DD800537D9800C9D4
      DC0000000000000000000000000000000000000000000000000000000000C9D4
      DC00537D98006BC3DF0073CBE4006BC2DD004EB0D200109DD800537D9800C9D4
      DC0000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000BFBFBF00FAFAFA000000000000000000D8DBD100C3C4BA00BEC0B600BEC0
      B600BEC0B600BEC0B600B8B9B000D8DBD1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9D4DC007193A9005678920053768F00547791006C90A700C9D4DC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9D4DC007193A9005678920053768F00547791006C90A700C9D4DC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004F0000004C0000004E0000004F
      0000004F0000004F000000510000005100000052000000520000005200000052
      0000005200000052000000520000002200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000086000000820000007E0000007F
      0000008200000083000000830000008200000082000000810000008100000081
      000000800000007D000000880000003D00000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D400000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D0000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F0000840000F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF60000800000003D00000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F0097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D0000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D0000840000F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF60000800000003D0000DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A00000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD00000000000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D000000000000840000F6EEF60036A036002F98
      2F002A932A00299229002C952C002C952C002C952C00239423002C972C000085
      000000830000D0E1D000007C0000003D0000BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D0097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD000000000000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD00000000000000000000840000F6EEF600008600000087
      0000008800000088000000880000008800000083000092BD9200008600000087
      00009EA69E00F1EDF100007C0000003D0000DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A200000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B351090075716E0057545100000000002A72BD00449BE0004FA7
      E7004AA4E3002A72BD00000000000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD00000000000000000000840000F6EEF600FEF7FE000084
      000000880000008800000088000000860000A2C4A20000860000008800000989
      0900F6EEF600F6EEF600007E0000003D0000EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F50097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00A39D9800FDFEFE005193A9000E12160085C6E10099D9
      EF0092F8FF002A72BD000000000000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD00000000000000000000840000F6EEF600F6EEF600FFFB
      FF000B8D0B000087000000820000B1C9B1000085000000870000008500000086
      000040A04000F6EEF600007C0000003D000000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC00000000009B7E7E00FFFFFF00FFFA
      F400D4751500D4751500A39D980088B7C70074CEE200499AB2000E1216002A72
      BD002A72BD0000000000000000000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD00000000000000000000840000F6EEF600F6EEF600F6EE
      F600F6EEF60000850000B6CBB600008400000087000078AA7800F6EEF600F6EE
      F600F6EEF600F6EEF600007C0000003D00000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE0000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFAF400FFF8F000FFF6ED004D9CB3008CE0EE0062BFD700499AB2000E12
      1600000000000000000000000000000000000000000063493500634935006349
      35006349350063493500D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD0000000000000000000000000000840000F6EEF600F6EEF600ECEB
      EC009AC49A00B3C4B30000840000008800000088000000830000BEBEBE00F6EE
      F600F6EEF600F6EEF600007C0000003D000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C30074727000575451000000
      0000D8DBDE00FDFDFD000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FED4A200D4751500D4751500FED4A20057A0B5008CE0EE0062BFD700499A
      B2000E121600000000000000000000000000B8A49400F4E3DA00F3DFD400F0D7
      C900EDD0BF00ECCDBB0063493500FFF5EA00FFF4E800FFD7CA00795B5A000000
      00000000000000000000000000000000000000860000F6EEF600F6EEF600AFCB
      AF00B2C8B200008300000087000000840000008700000088000000850000A3A3
      A300F6EEF600F6EEF600007E0000003D000000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00A39D9800FDFEFE005193
      A9000E121600E7E6E600000000000000000097575A0097575A0097575A00FFFF
      FF00FFFFFE00FFA62400FFA62400FFFAF400FFF8F10065A6B7008CE0EE0062BF
      D700499AB2000E1216000000000000000000B8A49400F6E8E000F4E3DA006349
      3500EED3C400EDD0BF0063493500FED4A200FED4A200FFCFC300795B5A000000
      00000000000000000000000000000000000000860000F6EEF600B1CAB100B9CE
      B90000830000008600005CAD5C00F3ECF3002C9C2C0000870000008800000084
      0000D0CFD000F0ECF000007E0000003D000000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00A39D980088B7C70074CE
      E200499AB2000E1216000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEEDC0073ACB9008CE0
      EE006CC4D9007D8686003535900000000000BCA69700F9F0EB00634935006349
      350063493500F0D7C90063493500FFFAF400FFF8F100FFCFC300795B5A000000
      00000000000000000000000000000000000000850000F6EEF6004CAB4C0051AE
      510055B0550074BC7400F1EEF100F6EEF600FDF7FD0062B4620051AB51003994
      39003EA13E00F6EEF600007C0000003D000000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA0052A4D2004D9CB3008CE0
      EE0062BFD700499AB2001114180000000000000000009B7E7E009B7E7E009B7E
      7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E007DB0
      BB00CAB8AC007385D1005E6CAD0035359000C0AB9C00FCF7F500FBF4F0006349
      3500F4E3DA00F3DFD40063493500FFFFFF00FFFFFF00FFEEDC00795B5A000000
      00000000000000000000000000000000000000850000F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF60000810000003D00000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600898684006866630057A0
      B5008CE0EE006CC4D9007D868600353590000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005E6CAD00708FDF005E76D0005E6CAD00C3AC9D00FDFAF900FCF7F500F9F0
      EB00F6E8E000F4E3DA00634935009B7E7E009B7E7E009B7E7E009B7E7E000000
      00000000000000000000000000000000000000850000F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EEF600F6EE
      F600F6EEF600F6EEF60000830000003A00000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000F3F3F300DFDFDF00DFDF
      DF007DB0BB00CAB8AC007385D1005E6CAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD005E6CAD006579BC0000000000C2AC9D00C0AB9C00BBA7
      9800B8A39400B9A4950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000082000000830000008300000082
      000000830000008600000086000000850000008600000084000000840000008C
      0000008D000000840000008300004FAB4F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD00819FEB005E76D000000000007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600F0F0F200F1F1
      F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7
      F800F7F8F9008686860000000000000000000000000000000000000000000000
      0000000000000000000097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000000000
      0000000000000000000097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D00000000000000000090909000F1F1F300F1F2
      F300F2F2F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFE
      FE00F8F9FA009090900000000000000000000000000000000000000000000000
      0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F60097928F00000000000000000000000000000000000000
      0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F60097928F000000000000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F00000000009D9D9D00F2F2F300F2F2
      F400F3F3F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFE
      FE00FDFEFE009D9D9D0000000000000000000000000000000000000000000000
      0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
      AD00B1B0AD00F8F9F80097928F00000000000000000000000000000000000000
      0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
      AD00B1B0AD00F8F9F80097928F0000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D0000000000ACACAC00F2F2F400F3F3
      F500BAAAAD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFE
      FE00FDFEFE009FA1A30000000000000000000000000000000000000000000000
      0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC0097928F000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D000000000000000000ADADAD00F3F3F500F4F4
      F500B4A3A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFE
      FE00FDFEFE00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE0097928F0000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD00000000000000000000000000B1B1B100F4F4F600F5F5
      F600F5F6F700F6F7F800F7F8F800F8F8F900F9F9FA00F9FAFB00FAFBFB00FDFE
      FE00FDFEFE00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0097928F000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD00000000000000000000000000B3B3B300F5F5F600F5F6
      F700764B51008E6A6F00F8F9F900F9F9FA00AC999C00AD999C00AD9A9D00FBFC
      FD00FDFEFE00B8B8B80000000000000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF0000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD00000000000000000000000000B5B5B500F6F6F700F6F7
      F8008E6A6F00835C6100F9F9FA00FAFAFB00FAFBFB00FBFCFC00FCFCFD00FCFD
      FD00FDFEFE00B8B8B80000000000000000000000000000000000000000000000
      00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF800266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF800266DBF000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD00000000000000000000000000B8B8B800F6F7F800F7F8
      F900F8F9F900F9F9FA00FAFAFB00FAFBFC00FBFCFC00FCFCFD00FCFDFD00FDFE
      FE00FDFEFE00B8B8B80000000000000000000000000000000000757575007575
      75007575750000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF000000000000000000634A3700634935006349
      350063493500634A3700D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD0000000000000000000000000000000000BABABA00F7F8F900F8F9
      FA00F9FAFA00FAFAFB00FAFBFC00FBFCFC00FCFDFD00FCFDFD00FCFDFD00FDFE
      FE00FDFEFE00B8B8B8000000000000000000000000000000000075757500AEAE
      AE00757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8A49400F4E3DA00F3DFD400F0D7
      C900EDD0BF00ECCDBB0063493500FFF5EA00FFF4E800FFD7CA00795B5A000000
      00000000000000000000000000000000000000000000BCBCBC00F8F9FA00F9FA
      FA00BCABAE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE00FDFEFE00E5E5
      E600DFDFE000BABABA000000000000000000757575007575750075757500AEAE
      AE00757575007575750075757500000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200727272007272
      7200727272007272720072727200000000000000000000000000000000000000
      000000000000000000000000000000000000B8A49400F6E8E000F4E3DA00F4E3
      DA00EED3C400EDD0BF0063493500FED4A200FED4A200FFCFC300795B5A000000
      00000000000000000000000000000000000000000000BDBDBD00F9FAFA00FAFB
      FB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00BABABA00B8B8
      B800B8B8B800BABABA00000000000000000075757500AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE0075757500000000000000000000000000000000000000
      00000000000000000000000000000000000072727200AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE0072727200000000000000000000000000000000000000
      000000000000000000000000000000000000BCA69700F9F0EB00634935006349
      350063493500F0D7C90063493500FFFAF400FFF8F100FFCFC300795B5A000000
      00000000000000000000000000000000000000000000BFBFBF00FAFBFB00FBFB
      FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE00C5C5C500F6F6
      F600BBBBBB00F2F2F2000000000000000000757575007575750075757500AEAE
      AE00757575007575750075757500000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200727272007272
      7200727272007272720072727200000000000000000000000000000000000000
      000000000000000000000000000000000000C0AB9C00FCF7F500FBF4F000F4E3
      DA00F4E3DA00F3DFD40063493500FFFFFF00FFFFFF00FFEEDC00795B5A000000
      00000000000000000000000000000000000000000000C0C0C000FBFBFC00FBFC
      FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFEFE00CACACA00BABA
      BA00F3F4F300000000000000000000000000000000000000000075757500AEAE
      AE00757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3AC9D00FDFAF900FCF7F500F9F0
      EB00F6E8E000F4E3DA00634935009B7E7E009B7E7E009B7E7E009B7E7E000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBFBF00FAFA
      FA00000000000000000000000000000000000000000000000000757575007575
      7500757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4A6A000C0AB9C00BBA7
      9800B8A39400B8A3940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A000000000000000000000000000000000097928F009B9693009C97
      94009C9794009C9794009C9794009C9794009C9794009B96930097928F000000
      00000000000000000000000000000000000086868600F0F0F200F1F1F300F1F2
      F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7F800F7F8
      F900868686000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600F0F0F200F1F1F300F1F2
      F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6F700F7F7F800F7F8
      F90086868600000000000000000000000000000000009F9A9800EFEEEE00EAE9
      E900E9E8E800E9E9E800E9E9E800E9E8E800EAE9E900EFEEEE009B9693000000
      00000000000000000000000000000000000090909000F1F1F300F1F2F300F2F2
      F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFEFE00F8F9
      FA009090900000000000000000000000000000000000B0B0B0006E6E6E009B9B
      9B0000000000000000000000000000000000000000000000000000000000E4E4
      E400A7A7A70090909000000000000000000090909000F1F1F300F1F2F300F2F2
      F400F3F3F500F3F4F500F4F5F600F5F5F700FDFEFE00FDFEFE00FDFEFE00F8F9
      FA009090900000000000000000000000000000000000A19C9A00EAEAE900CCCB
      CA00BCBBB800EFEEEE00EFEEEE00BCBBB800CCCBCA00EBEBEA009C9794000000
      0000000000000000000000000000000000009D9D9D00F2F2F300F2F2F400F3F3
      F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFEFE00FDFE
      FE009D9D9D00000000000000000000000000917CEC002900DF003F28A6006565
      6500C9C9C9000000000000000000000000000000000000000000D5D5D5006250
      B2002E07D800A7A7A70000000000000000009D9D9D00F2F2F300F2F2F400F3F3
      F500F4F4F500F4F5F600F5F5F700F6F6F700FDFEFE00FDFEFE00FDFEFE00FDFE
      FE009D9D9D0000000000000000000000000000000000A19D9900ECECEB00E9E9
      E900EFEEEE00EFEEEE00EFEEEE00EFEEEE00EFEEEE00EDECEC009C9793000000
      000000000000000000000000000000000000ACACAC00F2F2F400F3F3F500BAAA
      AD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFEFE00FDFE
      FE009FA1A300000000000000000000000000BCAFF5002900DF00300ADB00534E
      6A007F7F7F00DDDDDD00000000000000000000000000C8C5D3004629C3002900
      DF007D6BCD00000000000000000000000000ACACAC00F2F2F400F3F3F500BAAA
      AD00B4A3A600F5F6F700F6F6F800AC989B009F9094009F909400FDFEFE00FDFE
      FE009FA1A30000000000000000000000000000000000A29D9A00EFEEEE00DBDB
      D900CDCDCC00EFEEEE00EFEEEE00CDCDCC00DBDBD900EFEEEE009C9794000000
      000000000000000000000000000000000000ADADAD00F3F3F500F4F4F500B4A3
      A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFEFE00FDFE
      FE00B8B8B800000000000000000000000000000000008770ED002900DF003D1C
      D2005F5F5F0094949400E1E1E10000000000C8C5D3003A18CD002E07D800A49C
      C60000000000000000000000000000000000ADADAD00F3F3F500F4F4F500B4A3
      A600BBABAE00F6F7F800F7F7F800F8F8F900F9F9FA00FDFEFE00FDFEFE00FDFE
      FE00B8B8B80000000000000000000000000000000000A59E9900F6F3F000E1DF
      DA00D4D1CC00F1EFEC0075716E005754510000000000EFEEEE009F9893000000
      000000000000000000000000000000000000B1B1B100F4F4F600F5F5F600F5F6
      F700F6F7F800F7F8F800F8F8F900F9F9FA00F9FAFB00FAFBFB00FDFEFE00FDFE
      FE00B8B8B80000000000000000000000000000000000000000007A60EB002900
      DF005238C3006464640092929200B7B4C2003A18CD002E07D800A49CC6000000
      000000000000000000000000000000000000B1B1B100F4F4F600F5F5F600F5F6
      F700F6F7F800F7F8F80075716E005754510000000000FAFBFB00FDFEFE00FDFE
      FE00B8B8B800000000000000000000000000000000007A8DA600EFEEEE00EFEE
      EE00EFEEEE00EFEEEE00A39D9800FDFEFE005193A9000E1216009F9893000000
      000000000000000000000000000000000000B3B3B300F5F5F600F5F6F700764B
      51008E6A6F00F8F9F900F9F9FA00AC999C00AD999C00AD9A9D00FBFCFD00FDFE
      FE00B8B8B8000000000000000000000000000000000000000000000000007A60
      EB002900DF005137C30053505E003312C7002C06D700A49CC600000000000000
      000000000000000000000000000000000000B3B3B300F5F5F600F5F6F700764B
      51008E6A6F00F8F9F900A39D9800FDFEFE005193A9000E121600FBFCFD00FDFE
      FE00B8B8B80000000000000000000000000000000000236CC0001E6EC8002070
      CA002373CA002676CA00A39D980088B7C70074CEE200499AB2000E1216000000
      000000000000000000000000000000000000B5B5B500F6F6F700F6F7F8008E6A
      6F00835C6100F9F9FA00FAFAFB00FAFBFB006767670076767600FCFDFD00FDFE
      FE00B8B8B8000000000076767600676767000000000000000000000000000000
      0000795FEA002900DF002C06D7002B05D6006A628C00DADADA00000000000000
      000000000000000000000000000000000000B5B5B500F6F6F700F6F7F8008E6A
      6F00835C6100F9F9FA00A39D980088B7C70074CEE200499AB2000E121600FDFE
      FE00B8B8B80000000000000000000000000000000000246EC300197DE7001F86
      EE002C90ED00379AEE0042A4EF004D9CB3008CE0EE0062BFD700499AB2000E12
      160000000000000000000000000000000000B8B8B800F6F7F800F7F8F900F8F9
      F900F9F9FA00FAFAFB00FAFBFC00FBFCFC00767676006262620076767600FDFE
      FE00B8B8B8007373730051515100767676000000000000000000000000000000
      0000C8C5D3002F08D9002900DF00472BC4007474740091919100D5D5D5000000
      000000000000000000000000000000000000B8B8B800F6F7F800F7F8F900F8F9
      F900F9F9FA00FAFAFB00FAFBFC004D9CB3008CE0EE0062BFD700499AB2000E12
      1600B8B8B80000000000000000000000000000000000256DBF00246FC4002570
      C5002671C4002872C5002974C5002A74C50057A0B5008CE0EE0062BFD700499A
      B2000E121600000000000000000000000000BABABA00F7F8F900F8F9FA00F9FA
      FA00FAFAFB00FAFBFC00FBFCFC00FCFDFD00FCFDFD0074747400636363007C7C
      7C007E7E7E005F5F5F007272720000000000000000000000000000000000C8C5
      D3003A18CD002E07D800705CCC00360FE000593DD6007D7A880085858500C3C3
      C30000000000000000000000000000000000BABABA00F7F8F900F8F9FA00F9FA
      FA00FAFAFB00FAFBFC00FBFCFC00FCFDFD0057A0B5008CE0EE0062BFD700499A
      B2000E1216000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000065A6B7008CE0EE0062BF
      D700499AB2000E1216000000000000000000BCBCBC00F8F9FA00F9FAFA00BCAB
      AE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE00FDFEFE007C7C7C006868
      6800686868007B7B7B0000000000000000000000000000000000C8C5D3003A18
      CD002900DF008A80B8000000000000000000431FE2004A28DD007A729C007C7C
      7C00B3B3B300000000000000000000000000BCBCBC00F8F9FA00F9FAFA00BCAB
      AE00BCACAE00BCACAE00BCACAE00FCFDFD00FDFEFE0065A6B7008CE0EE0062BF
      D700499AB2000E12160000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073ACB9008CE0
      EE006CC4D9007D8686003535900000000000BDBDBD00F9FAFA00FAFBFB00FBFB
      FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE007C7C7C005D5D
      5D005F5F5F007A7A7A00000000000000000000000000BBB9C7003917CC002900
      DF007263B700000000000000000000000000000000005F40E700350EDF007B6E
      B40089898900DBDBDB000000000000000000BDBDBD00F9FAFA00FAFBFB00FBFB
      FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00BABABA0073ACB9008CE0
      EE006CC4D9007D86860035359000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007DB0
      BB00CAB8AC007385D1005E6CAD0035359000BFBFBF00FAFBFB00FBFBFC00FBFC
      FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE004D4D4D00676767005959
      590062626200686868005F5F5F0000000000C6BEE8003917CC002900DF005A46
      B600000000000000000000000000000000000000000000000000947FEF002900
      DF00CFCAE600000000000000000000000000BFBFBF00FAFBFB00FBFBFC00FBFC
      FC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFEFE00C5C5C500F6F6F6007DB0
      BB00CAB8AC007385D1005E6CAD00353590000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005E6CAD00708FDF005E76D0005E6CAD00C0C0C000FBFBFC00FBFCFC00FCFD
      FD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00626262006868680054545400F3F4
      F300000000006B6B6B006868680061616100411DE0002900DF004629C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FBFBFC00FBFCFC00FCFD
      FD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFEFE00CACACA00BABABA00F3F4
      F3005E6CAD00708FDF005E76D0005E6CAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005E6CAD005E6CAD006579BC00C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0006565650074747400FAFAFA000000
      0000000000000000000069696900656565003610E1004D2CE100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBFBF00FAFAFA000000
      0000000000005E6CAD005E6CAD006579BC0000000000AC978800846F5E007D68
      56007C67550085715F008773610086716000755F4C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD582700F2E5DF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9F2
      F600226E8F00DFEBF00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300634935006349
      3500634935006349350063493500634935006349350063493500634935006349
      35006349350063493500000000000000000000000000BCA79900E8E9EB00FBFB
      FB00FFFFFF00F7F4F100EBE9E600F6F4F2007B65530000000000000000000000
      0000000000000000000000000000000000000000000000000000FDF7F100AD58
      2700D9A47800A5491800EEDDD500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005ABC
      DD005DC8E800226E8F00DFEBF000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300EDC3AF00EDC3
      AF00EDC3AF00EDC3AF00EDC3AF00EDC3AF00EDC3AF00EDC3AF00EDC3AF00EDC3
      AF00EDC3AF0063493500000000000000000000000000BBA79900F8F9F9000F0F
      0F00DCDCDB00FFFCFC000A0B0A00F8F9F6007F6A570000000000000000000000
      00000000000000000000000000000000000000000000FBF4EA00AD582700FFEA
      C500FEE1B400DDAB8000A4461500EDDAD1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005ABC
      DD0068D8F8002FC0EE002E80A300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300EEC8B600EEC8
      B600EEC9B600EFC8B600E5B8A200AE582B00DCAF9900EFC8B600EFC8B600EFC8
      B600EFC8B50063493500000000000000000000000000BFAB9E00FFFFFF008F8F
      8F0000000000C5C2C2000A090900EAEDED007B66530000000000000000000000
      00000000000000000000000000000000000000000000D89E4D00FEF9DB00FFF0
      C900FEE7BE00FEE1B400DFAE8300A44615000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6DBE4005ABC
      DD0068D8F8002E80A300DEEAEE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300F1D0BF00F0CF
      C000F1CFBF00E8BEAB00AE582B00C0693D00A2563100DEB4A100F1CFBF00F1CF
      BF00F1CFBF0063493500000000000000000000000000C7B5A800FFFFFF00FFFF
      FF00979797000000000000000000F4F6F8007E69570000000000000000000000
      00000000000000000000000000000000000000000000D89E4D00FFFEE300FFF8
      D600FFF0C900FEE8BE00FBDFB400AF5826000000000000000000000000000000
      00000000000000000000000000000000000000000000D6E8F0005FA9C80032CF
      FF0068D8F8002FC0EE002E80A300CDE1EB000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A29300F3D8CA00F3D8
      CA00E9C5B300AE582B00E5835100D87B4C00BF693E00A0502A00E0BBAA00F4D8
      CA00F4D8CA0063493500000000000000000000000000CFBFB200F7F7F7001010
      10002B2C2C000000000000000000F3F6F8007C675500755C4800715743006D53
      3E006A4F3B00674B3700BAAEA4000000000000000000FBF4EA00D89E4D00FFFE
      E300FFF7D600EED6AA00D89E4D00AC7E49007A604E00755C4800715743006D53
      3E006A4F3B00674B3700BAAEA40000000000000000007FB8D30096DBEE0068D8
      F8005ABCDD005ABCDD002FC0EE002E80A3007A604E00755C4800715743006D53
      3E006A4F3B00674B3700BAAEA4000000000000000000B7A29300F6E1D700F0D4
      C600C5764E00F79A6B00F89D6F00E5845300D1764800BB663B009D4E2800E3C3
      B300F6E1D70063493500000000000000000000000000CEBEB300FFFFFF00F7F7
      F800F2F3F300FBFBFC00F6F7F700FFFFFF008F7C6B00D5C5BC00D0BEB500CBB8
      AC00C6B1A600C3AB9F00684E3900000000000000000000000000FBF4EA00D89E
      4D00F5F1D400D89E4D00E2C29D00DED3CC00DACCC400D5C5BC00D0BEB500CBB8
      AC00C6B1A600C3AB9F00684E390000000000000000007FB8D300AEEBF500ACF5
      FE001F6B8C005ABCDD0032CFFF002E80A300DACCC400D5C5BC00D0BEB500CBB8
      AC00C6B1A600C3AB9F00684E39000000000000000000B7A29300F9EBE300E89C
      7600E5997300DB906A00FFA87D00F28C5900DE7F4F00A7522900AE603900B568
      4200F9EAE30063493500000000000000000000000000BCA99B00B8A69800BAA7
      9A00BCAB9D00C1B0A400BEAC9F00BBAA9D00AA968900DACCC400D5C5BC00D0BE
      B500CCB8AD00C6B1A5006D533E0000000000000000000000000000000000FBF4
      EA00D89E4D00EAD5BE00E9E1DC00E3D9D400DFD2CC00DACCC400D5C5BC00D0BE
      B500CCB8AD00C6B1A5006D533E000000000000000000CAE2ED007FB8D300B2EC
      F50068D8F80068D8F8003885A600A9C9D700DFD2CC00DACCC400D5C5BC00D0BE
      B500CCB8AD00C6B1A5006D533E000000000000000000BAA59600FBF3EE00FCF3
      EF00FBF3EE00D1855F00FEAE8500FC935E00EC885600B4633C00FCF3EF00FCF3
      EF00FBF3EE006349350000000000000000000000000000000000000000000000
      0000B79E9000F3EFEC00EEE8E400E8E0DC007E6552006E54400063483300D5C5
      BC00D0BEB400CBB8AC00735A4600000000000000000000000000000000000000
      0000B79E9000F3EFEC00EEE8E400E8E0DC007E6552006E54400063483300D5C5
      BC00D0BEB400CBB8AC00735A4600000000000000000000000000CAE2ED007FB8
      D30075AFCB005FA9C800A6CCDD00E8E0DC007E6552006E54400063483300D5C5
      BC00D0BEB400CBB8AC00735A46000000000000000000BEA99A00FEFAF800FEFA
      F900FDFAF800DA8E6800FDBE9E00FDA57800F7905C00B1643E00FEFAF800FDFA
      F900FDFAF9006349350000000000000000000000000000000000000000000000
      0000BCA39600F8F6F400F3EFED00EFE8E400E9E0DC00E3D9D300DFD3CB00DACC
      C500D5C5BC00D0BEB5007A604E00000000000000000000000000000000000000
      0000BCA39600F8F6F400F3EFED00EFE8E400E9E0DC00E3D9D300DFD3CB00DACC
      C500D5C5BC00D0BEB5007A604E00000000000000000000000000000000000000
      0000BCA39600F8F6F400F3EFED00EFE8E400E9E0DC00E3D9D300DFD3CB00DACC
      C500D5C5BC00D0BEB5007A604E000000000000000000C3AE9E00FFFFFF00FFFF
      FF00FFFFFF00E2967000FBC3A600FCB99700FDB08900BD714C00FFFFFF00FFFF
      FF00FFFFFF006349350000000000000000000000000000000000000000000000
      0000C1A99D00FCFBFB00F8F6F400F4EFEC007E6652006E543F0063483300DED3
      CC00DACCC400D5C5BC0080685500000000000000000000000000000000000000
      0000C1A99D00FCFBFB00F8F6F400F4EFEC007E6652006E543F0063483300DED3
      CC00DACCC400D5C5BC0080685500000000000000000000000000000000000000
      0000C1A99D00FCFBFB00F8F6F400F4EFEC007E6652006E543F0063483300DED3
      CC00DACCC400D5C5BC00806855000000000000000000C8B2A300FFFFFF00FFFF
      FF00FFFFFF00E89C7600E4987200DE926C00D78B6500D0845E00FFFFFF00FFFF
      FF00FFFFFF006349350000000000000000000000000000000000000000000000
      0000C5AFA300FFFFFF00FCFBFB00F9F6F500F4EFEC00EEE7E400E9E1DB00E4D9
      D300DED2CC00DACCC50088705D00000000000000000000000000000000000000
      0000C5AFA300FFFFFF00FCFBFB00F9F6F500F4EFEC00EEE7E400E9E1DB00E4D9
      D300DED2CC00DACCC50088705D00000000000000000000000000000000000000
      0000C5AFA300FFFFFF00FCFBFB00F9F6F500F4EFEC00EEE7E400E9E1DB00E4D9
      D300DED2CC00DACCC50088705D000000000000000000CCB6A700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00644A360000000000000000000000000000000000000000000000
      0000C9B4AA00FFFFFF00FFFFFF00FCFBFA00F8F5F400F3EFEC00EEE7E500E8E0
      DC00E3D9D400DFD3CC008E776600000000000000000000000000000000000000
      0000C9B4AA00FFFFFF00FFFFFF00FCFBFA00F8F5F400F3EFEC00EEE7E500E8E0
      DC00E3D9D400DFD3CC008E776600000000000000000000000000000000000000
      0000C9B4AA00FFFFFF00FFFFFF00FCFBFA00F8F5F400F3EFEC00EEE7E500E8E0
      DC00E3D9D400DFD3CC008E7766000000000000000000CCB6A700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00644A360000000000000000000000000000000000000000000000
      0000E6DDD800C9B4A900C4ADA200BFA89B00BBA29300B59C8E00B2988900AD94
      8400A88F7F00A38A7900C8BDB500000000000000000000000000000000000000
      0000E6DDD800C9B4A900C4ADA200BFA89B00BBA29300B59C8E00B2988900AD94
      8400A88F7F00A38A7900C8BDB500000000000000000000000000000000000000
      0000E6DDD800C9B4A900C4ADA200BFA89B00BBA29300B59C8E00B2988900AD94
      8400A88F7F00A38A7900C8BDB5000000000000000000EAAA8B00EAAA8B00E9A5
      8400E99F7A00E7976E00E68E6200E5865600E37D4A00E3764000E2723900E272
      3900E2723900C8622F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAAA8B00FFC2A200FDBD
      9A00FCB99600FBB59000FAB08B00F9AB8400F8A77D00F6A27700F59D7100F395
      6500F3956500CD65310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAAA8B00EAAA8B00EAAA
      8B00EAA68600E9A17F00E89B7600E7946C00E68E6200E5875800E4814E00E376
      3E00E3763E00E272390000000000000000000000000000000000000000000000
      0000F5F5F500E9E9E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDD
      DD00ECECEC000000000000000000000000000000000000000000000000000000
      0000F5F5F500E9E9E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDD
      DD00ECECEC00000000000000000000000000000000000000000000000000FDFD
      FD00F5F5F500E9E9E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDD
      DD00ECECEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900E2E2
      E200C0C0C000A1A1A1008E8E8E00828282007676760071717100797979008C8C
      8C00B6B6B600EAEAEA0000000000000000000000000000000000F9F9F900E2E2
      E200C0C0C000A1A1A1008E8E8E00828282007676760071717100797979008C8C
      8C00B6B6B600EAEAEA0000000000000000000000000000000000F9F9F900E2E2
      E200C0C0C000A1A1A1008E8E8E00828282007676760071717100797979008C8C
      8C00B6B6B600EAEAEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D4000000000000000000E6E6E6009992
      88006C5138006E4620006D4621008C5420008D521A00814A170071461E005942
      2D0088888800DADADA0000000000000000000000000000000000E6E6E6009992
      88006C5138006E4620006D4621008C5420008D521A00814A170071461E005942
      2D0088888800DADADA0000000000000000000000000000000000E6E6E6009992
      88006C5138006E4620006D4621008C5420008D521A00814A170071461E005942
      2D0088888800DADADA0000000000000000000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F0000000000000000009C7E6100985C
      2300C18A56009F6A3900804B2200C6916000C9936000B8793D00B3713300824B
      180086868600DBDBDB00000000000000000000000000000000009C7E6100985C
      2300C18A56009F6A3900804B2200C6916000C9936000B8793D00B3713300824B
      180086868600DBDBDB00000000000000000000000000000000009C7E6100985C
      2300C18A56009F6A3900804B2200C6916000C9936000B8793D00B3713300824B
      180086868600DBDBDB000000000000000000DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A00000000000000000089501A00C790
      5C00CC97660094623A00ECCCCF009E6C3F00CE9A6900CA956300B67639007446
      1B00A8A8A800EAEAEA000000000000000000000000000000000089501A00C790
      5C00CC97660094623A00ECCCCF009E6C3F00CE9A6900CA956300B67639007446
      1B00A8A8A800EAEAEA000000000000000000000000000000000089501A00C790
      5C00CC97660094623A00ECCCCF009E6C3F00CE9A6900CA956300B67639007446
      1B00A8A8A800EAEAEA000000000000000000BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D00000000000000000095663A00CC97
      6600DAAD83009F7B5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C64
      4A00D7D7D700F9F9F9000000000000000000000000000000000095663A00CC97
      6600DAAD83009F7B5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C64
      4A00D7D7D700F9F9F9000000000000000000000000000000000095663A00CC97
      6600DAAD83009F7B5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C64
      4A00D7D7D700F9F9F9000000000000000000DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A2000000000000000000AF957C00A671
      4000E5BE9900AA796E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4
      C400F6F6F6000000000000000000000000000000000000000000AF957C00A671
      4000E5BE9900AA796E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4
      C400F6F6F6000000000000000000000000000000000000000000AF957C00A671
      4000E5BE9900AA796E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4
      C400F6F6F600000000000000000000000000EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F500000000000000000000000000C3AF
      9D009273450003698300157BC200177DC6000B71AF005B4719006D6D6D00BFBF
      BF00F5F5F500000000000000000000000000000000000000000000000000C3AF
      9D009273450003698300157BC200177DC6000B71AF005B4719006D6D6D00BFBF
      BF00F5F5F500000000000000000000000000000000000000000000000000C3AF
      9D009273450003698300157BC200177DC6000B71AF005B4719006D6D6D00BFBF
      BF00F5F5F50000000000000000000000000000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC000000000000000000000000000000
      00006B9EB800298FEC003399FF003399FF003298FD00157BC20049565C009898
      9800E4E4E4000000000000000000000000000000000000000000000000000000
      00006B9EB800298FEC003399FF003399FF003298FD00157BC20049565C009898
      9800E4E4E4000000000000000000000000000000000000000000000000000000
      00006B9EB800298FEC003399FF003399FF003298FD00157BC2004A575D009898
      9800E4E4E4000000000000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000000000000000000000000000000000
      00002585C3003EA4FF0040A6FF0040A6FF003EA4FF00359BF900634935006349
      3500634935006349350063493500000000000000000000000000000000000000
      00002585C3003EA4FF0040A6FF0040A6FF003EA4FF00369CF900624A38006349
      35006349350063493500634A3700000000000000000000000000000000000000
      00002585C3003EA4FF0040A6FF0040A6FF003EA4FF0074727000575451000000
      0000D6D6D60000000000000000000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006591BC005480AB003664
      9100A0ACB900FDFDFD0000000000000000000000000000000000000000000000
      00002288CC0047ADFF004AB0FF004AB0FF0048AEFF00B5A49700F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB0069463C000000000000000000000000000000
      00002288CC0047ADFF004AB0FF004AB0FF0048ADFD00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB00634935000000000000000000000000000000
      00002288CC0047ADFF004AB0FF004AB0FF0048AEFF00A39D9800FDFEFE005193
      A9000E12160000000000000000000000000000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE0081ACD8006592BF00436A
      930024364800E7E6E60000000000000000000000000000000000000000000000
      0000278DCC0050B6FF0053B9FF0053B9FF0051B7FF00B8A49400F6E8E000F4E3
      DA0063493500EED3C400EDD0BF00634935000000000000000000000000000000
      0000278DCC0050B6FF0053B9FF0053B9FF0051B7FF00B8A49400F6E8E000F4E3
      DA00F4E3DA00EED3C400EDD0BF00634935000000000000000000000000000000
      0000278DCC0050B6FF0053B9FF0053B9FF0051B7FF00A39D980088B7C70074CE
      E200499AB2000E121600000000000000000000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA009DC7F2006FA0D0004158
      710026211E00DCDCDC0000000000000000000000000000000000000000000000
      00002086BF003398D1002E91C5003DA3DF004CB2F900BCA69700F9F0EB006349
      35006349350063493500F0D7C900634935000000000000000000000000000000
      00002086BF003398D1002E91C5003DA3DF004CB2F900BCA69700F9F0EB006349
      35006349350063493500F0D7C900634935000000000000000000000000000000
      00002086BF003398D1002E91C5003DA3DF004CB2F90045ABF2004D9CB3008CE0
      EE0062BFD700499AB200111219000000000000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA007D93AA00647A8E00464A
      4E002D2C2B00E4E4E40000000000000000000000000000000000000000000000
      00003E89AF00318DBF0052A6D50075B6DB005FA3C600C0AB9C00FCF7F500FBF4
      F00063493500F4E3DA00F3DFD400634935000000000000000000000000000000
      00003E89AF00318DBF0052A6D50075B6DB005FA3C600C0AB9C00FCF7F500FBF4
      F000F4E3DA00F4E3DA00F3DFD400634935000000000000000000000000000000
      00003E89AF00318DBF0052A6D50075B6DB005FA3C6003B8CB4002369A40057A0
      B5008CE0EE006CC4D9007D868600353590000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C60089868400686663005757
      5600AEAEAE00FEFEFE0000000000000000000000000000000000000000000000
      0000BDD7E3002381B20084C0E40097CAE80089C2E300C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000000000000000
      0000BDD7E3002381B20084C0E40097CAE80089C2E300C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000000000000000
      0000BDD7E3002381B20084C0E40097CAE80089C2E3002C88B8006390A600E2D3
      E2007DB0BB00CAB8AC007385D1005E6CAD000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000F3F3F300DFDFDF00E6E6
      E600000000000000000000000000000000000000000000000000000000000000
      000000000000ACCCDC005096B9004190B900408BB2008EB2C500C2AC9D00C0AB
      9C00BBA79800B8A39400B9A49500000000000000000000000000000000000000
      000000000000ACCCDC005096B9004190B900408BB20090A5C600C4A6A000C0AB
      9C00BBA79800B8A39400B8A39400000000000000000000000000000000000000
      000000000000ACCCDC005096B9004190B900408BB20089AFC200EDEDED00FBFB
      FB00000000005E6CAD00819FEB005E76D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00EEEC
      EA00B2AAA2009B918500988A7C00948474009C908800EAEAE900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D4000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D40000000000F0EFEE00B69A8000AF93
      8100D5B08E00E8BD9100ECC09700E0B68C00D3AA80009B826A00CBCAC9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00EAEAEA00C0BFC000A4A3A3008C8A8A008C8A8A00A2A0A100BCBB
      BB00E4E4E400FCFCFC0000000000000000000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F00FBF9F600BE9D7B00E0B58A00E6C8
      B700E3BEA000E1B78D00E5BE9900DAB69100D9B08800D0A57D0098928E000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00D1D1D100A09E9E00A9A19D00D8D1CD00D2C9C800D4C9C700DCD9D900AEAB
      AB009A979700C9C8C800FAFAFA0000000000DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A00DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A0000000000C4B28F00E1B18800CBBA
      AF00F2D9C600E8BE9100ECC8A400E1C2A400D8B28B00C59D7700A6A19E000000
      000000000000000000000000000000000000000000000000000000000000D2D2
      D200ABA8A600CCBFB200C8BBB200F5EADE00D2C8C300D9D3D000F9F9F800D7CF
      CF00DFDBDB00AEACAD00C9C9C90000000000BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D00BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D009B9C93007A7F6200F7BC9500CDC0
      B600FDFDFC00FFD0A000F5CCA600E6C9AD00E8BF96009E7E5E00888784000000
      000049494700494945004C4C48005B5C58000000000000000000EAE9EA00A09E
      9E00C7BCAF00F4E2C500D6C7B800F0E0D000FDF3EB00FFFDFC00FBFBFB00E4E0
      E000FFFFFF00D7D3D3009E9C9C00E4E4E400DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A200DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A20096988A00E3EEE500F3CF9F00C6AE
      9F00446F990097959400F1C29500F7CCA200CEA57D00918E830041423C008285
      7900F3E8DB00EDE2D400FFF7EC00939384000000000000000000C1C1C100828A
      7D007B7B6800CDC0B200F6E6CB00F6E4CF00F6E7D900F9EFE800FFFCFB00FFFF
      FF00E8E5E400D6CECD00B0ADAD00BCBBBB00EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F500EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F50093948900FFFFFF00EBE0CF007572
      7A00204E7D001A4B7D00978C8000C7A68500D3C6BC00F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B897B000000000000000000868F86004499
      50002D6C340096937D00EEDFC500F1E1CC00F4E5D200F7EADE00F5ECE500FFFB
      F800FCFBFB00FAF9F900E0DEDF00A2A1A10000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC0000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC0091928700FFFFFF00BCBBBD00234F
      7D003E638900305B88006B6E7100E5DBD300F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B0000000000D0D5D000469B52005CF6
      780047DA5F002B703500A69D8D00EEDDCB00E9D9C800A08A8400AC979100B39F
      9800B2A19B00CDC2BF00C9BDB8008D8B8B000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE0000000000000000000000000091938800F7F5F6006D8AAA004E77
      A0005279A0003D689100A5ABB100D2BCB000F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B00D1D5D100489A530075F58C005CEB
      750056EB700050F96B002C793500BAB0A000F0E1CE00A8948B00ECDBC900EBDC
      C800EEDED100D7C9C000C7BAB4008A88880000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006795C400634A37006349
      35006349350063493500634A37000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006693C300634935006349
      35006349350063493500634935000000000091938800EAE8EA006E94BA007099
      BF00668DB3004B78A2003D566C00C6B4AA00F7EDE500C6B3A400C6B3A400C6B3
      A400C6B3A400C6B3A400F5E9E0008C897C0055995E0051995A004B9D56006DE6
      82005DF27700299A3800359A3F0042794600F7E8CF00BBA79B00F3E2CB00F0E0
      CC00F2E0CA00EBDDCD00D6CCC400A4A3A30000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB006349350000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE00B8A49400F4E3DA00F3DF
      D400F0D7C900EDD0BF00ECCDBB006349350091938800E7E7ED008DB2D7009BBF
      E50079A5CF00527699002E3A4500A69A9300F7EDE500D2C2B500D4C6B800D4C6
      B800D4C6B800D3C4B600F7EDE5008B8B7D0000000000FEFEFE005E9B660071E3
      840070F08600407B4600E8DCD100FBEBD800F6E6D000B8A59800F8E7CC00F4E2
      CA00F0DFC900CCBCA700A7A19A00C0C0C00000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00B8A49400F6E8E000F4E3
      DA00F4E3DA00EED3C400EDD0BF006349350000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA00B8A49400F6E8E000F4E3
      DA0063493500EED3C400EDD0BF006349350091938800F4F2F30098BDE1009FC6
      EE007EAAD7004E637B002F261F0092878100F7EDE500D1C1B200D4C4B700D4C4
      B700D4C6B700D3C4B600FAF1E9008C8B7E000000000000000000CBD0CC0057A5
      5F0072E3850059C16A0054755400EEDED300FAEADA00BCA69D00F3E1C900E1D1
      BA00FDEBCE00D4C8B8009B989800EAE9EA0000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA00BCA69700F9F0EB006349
      35006349350063493500F0D7C9006349350000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA00BCA69700F9F0EB006349
      35006349350063493500F0D7C9006349350091938800F9F7F6009DA2A9007881
      8B006D757E00525253003D3B3900C8BEB800F7EDE500C6B3A400C6B3A400C6B3
      A400C6B3A400C6B3A400FBF4ED008C8C7F0000000000000000000000000091B7
      96005ECE700074EA880058AF65004B744E00BCB1AC00B9AAA400EDDFD100BDAF
      A000C1B5A900AAA7A500D0D0D100000000000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600C0AB9C00FCF7F500FBF4
      F000F4E3DA00F4E3DA00F3DFD400634935000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C600C0AB9C00FCF7F500FBF4
      F00063493500F4E3DA00F3DFD4006349350090918500FFFFFF00D8CEC700A59F
      9A00797371006B696600ADA6A200E9DCD400FFFFFE00FDFBF600FAF7F400F7F5
      F200F5F2EC00F3ECE500FEFAF40093948900000000000000000000000000EDF6
      EF009DC2A00052A15B006DE2810065D67700497C500059805B005B8E61004D7B
      510087868500D2D2D200FCFCFC00000000000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA00634935000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000C3AC9D00FDFAF900FCF7
      F500F9F0EB00F6E8E000F4E3DA006349350095958C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBCB300B5B7AE00AEAFA600AEAF
      A600AEAFA600AEAFA600B8BBB1009B9C93000000000000000000000000000000
      000000000000C5DEC8008AB38F0075AA7D006EB078007FBB890093B89800D1D9
      D200FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4A6A000C0AB
      9C00BBA79800B8A39400B8A39400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2AC9D00C0AB
      9C00BBA79800B8A39400B9A4950000000000D8DBD10091938800919388009193
      880091938800919388009193880091938800D8DBD10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF0000000000008FFFC007C01F80838FFF8007800F0101
      C7FF8007000F0030E07F8007000F0060F03F8007000F0044F0018007001F000C
      F001800F002F0018F001C00F80078001F801E00FC001C003FC01E00FC001C01F
      FC01E00FC000C01FFC01E00FC000C01FFC01E00FC000C01FFC01E00FC001C01F
      FFFFE00FC001C01FFFFFF01FE046E03FE000C10880038003E000C00080038003
      E000C000800380030000C000800380030000C000800380030000000080038003
      00000000800380030000000080038003000000008003800300000000E38FE3FF
      00000003E38FE3FF00000003E38FE38FE0000003E38FE38FE0000003E00FE00F
      E0010003E00FE00FE00300FFF01FF01FFF01FFFF0000FFFF8000FF010000FE00
      800080000000C000000180000000000080030001000000000003800300000000
      80030003000000000003800300008002800700030000C007000F80070000C003
      8007001F000080030003001F000081038001001F000081018000001F0000C100
      FFF0001F0000C080FFF883FF0000FFF88003FFFFFFFFFFFF8003FC01FC01FF01
      8003FC01FC0180008003FC01FC0180008003FC01FC0100018003FC01FC018003
      8003FC01FC0100038003FC01FC0180038003FC01FC0100038003C401FC018007
      8003C7FFFFFF001F800301FF01FF001F800301FF01FF001F800301FF01FF001F
      8007C7FFFFFF001F800FC7FFFFFF83FFFFFF0007FFFF0007801F0007FFFF0007
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
  object dsDiscInPlan: TDataSource
    Left = 96
    Top = 296
  end
  object PopupMenu5: TPopupMenu
    Left = 176
    Top = 104
    object actExportDepPlan1: TMenuItem
      Action = actExportDepPlan
    end
    object actExportFactPlanResult1: TMenuItem
      Action = actExportFactPlanResult
    end
    object MSExcel4: TMenuItem
      Action = actExportDistributedNarg
    end
    object MSExcel1: TMenuItem
      Action = actExportDistributedNagrForShedule
    end
    object MSExcel2: TMenuItem
      Action = actExportSummaryNagrForYear
    end
    object N1: TMenuItem
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '
      OnClick = N1Click
    end
    object N19: TMenuItem
      Action = ExportFactNagrYearExecution
      Visible = False
    end
  end
  object PopupMenu6: TPopupMenu
    Left = 64
    Top = 208
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077'...'
    end
    object N6: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077'...'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077'...'
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077'...'
    end
    object N9: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077'...'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077'...'
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
    end
    object N12: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077
    end
  end
  object PopupMenu7: TPopupMenu
    Left = 64
    Top = 176
    object actEditPotok1: TMenuItem
      Action = actEditPotok
    end
    object N2: TMenuItem
      Action = actDelPotok
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = actAddPotokSemesterShema
    end
    object N18: TMenuItem
      Action = actShowUchPlan
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085' '#1087#1086#1090#1086#1082#1072' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1089#1077#1084#1077#1089#1090#1088#1077'...'
    end
  end
  object PopupMenu8: TPopupMenu
    Left = 24
    Top = 176
    object actEditPrepod1: TMenuItem
      Action = actEditPrepod
    end
    object N4: TMenuItem
      Action = actDelPrepod
    end
  end
  object ImageList2: TImageList
    Left = 576
    Top = 96
    Bitmap = {
      494C010107000900580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCC7C200A0978F0094897F00908275008C7D6E0095877C00DEDD
      DC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D7C0F000D7C0F000D7C0F000D7C
      0F000D7C0F0032BA4D0032BA4D0000000000000000000000000000000000AFA7
      A00097877C00BEA08A00DAB18600E8BF9500E8BE9400DDB38B00CEA47C00A888
      6A00A7A39F000000000000000000000000000000000000000000000000000052
      5200005252000052520000525200005252000052520000525200005252000052
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000795B5A00795B5A00795B
      5A00795B5A00795B5A00795B5A00795B5A000D7C0F003ACA5B003ACA5B005ED5
      7900C0D9B80083CF8B0032BA4D000D7C0F000000000000000000B1ACA900C79F
      7600DDBCA300E8C7B500DBB38800E4BC9600E2BB9500DAB48F00CDA88100DDB1
      850085726100F7F7F700000000000000000000000000000000000052520000CE
      CE0000CECE0000FFFF0000FFFF0000FFFF0000FFFF00009C9C00009C9C00009C
      9C00007373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00DDB5B100E1B3
      AC00E0B2AA00DFB0A800DEAEA400DDACA200DCABA0000D7C0F003ACA5B0085B4
      9600BAC8D400A0C89E0065CD6E0032BA4D000000000000000000B5A58A00E6B6
      8A00C1A99300E4CBC100DCB48B00E8C29A00E7C29D00DDBC9B00CFAA8600D1A6
      7D0088766700F8F8F8000000000000000000000000000052520000CECE0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000CE
      CE00007373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFEF
      DF00FFEEDD00FFEDDB00FFECD900FFEBD700FFEBD500FFD0BA002A72BD002886
      CB001E80CF002A72BD0032BA4D00000000000000000000000000BCBDA100ECB7
      8C00BFA89200FCF9F800F1CAA600EBC29900F0CCAA00E4C7AA00D4B28D00CFA3
      7A009C918600000000000000000000000000000000000052520000CECE0000FF
      FF0000FFFF0073FFFF0000C6C60000C6C60073FFFF0000FFFF0000FFFF0000CE
      CE00007373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFF2
      E40099330000993300009933000099330000FED4A2002A72BD00449BE0003AAC
      F8003DB0F7002A72BD0000000000000000000000000000000000CAD6C500FDC5
      9B00D3B89F00E3E3E300ECE2D800F4C49600EDC9A500E2C4A500DFB99100B790
      6A00EDECEC00000000000000000000000000000000000052520000CECE0000FF
      FF0073FFFF0000C6C600FFFFFF000000000000C6C60000FFFF0000FFFF0000CE
      CE00007373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFF4
      E800FFF2E400A43F0400A43F0400FFEEDD00FFEDDB002A72BD0050B4F80052B4
      FC0052B4FC002A72BD0000000000000000000000000000000000F9FBFA00D0CC
      A900F4C5A000436281002C5B8B0096928C00EABD8E00EBC19800C8A07B00C5C1
      BD0000000000000000000000000000000000000000000052520000CECE0000CE
      CE0000FFFF0000C6C600FFFFFF00000000000000000000C6C60000CECE000052
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFF5
      EA00FED4A200B3510900B3510900FED4A200FED4A2002A72BD00449BE0004FA7
      E7004AA4E3002A72BD0000000000000000000000000000000000000000000000
      00009B9491003C5C7F001A457100285482009D8C7A00C1A78C00E1DFDC000000
      00000000000000000000000000000000000000000000000000000052520000CE
      CE0000CECE00006B8400107BC600107BC6000873AD00004A3900005252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFF8
      F000FFF5EA00C4640F00C4640F00FFF2E400FFF1E2002A72BD0085C6E10099D9
      EF0092F8FF002A72BD000000000000000000000000000000000000000000E7EA
      ED003D648D003A61890033557B00244E7B00999FA30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      5200005A8400298CEF00319CFF00319CFF00319CFF00107BC600005252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFA
      F400D4751500D4751500D4751500FED4A200FED4A200FFD7C8002A72BD002A72
      BD002A72BD0000000000000000000000000000000000000000000000000096AD
      C6004C749D0050769E004A719700375D8300CFD0D10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187BC60039A5FF0042A5FF0042A5FF0039A5FF00319CFF00004A73000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFAF400FFF8F000FFF6ED00FFF5EA00FFF4E800FFD7CA00795B5A000000
      0000000000000000000000000000000000000000000000000000F7F9FA007698
      BA00678FB600678DB300567EA500426C9500626E7900F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000218CCE0042ADFF004AB5FF004AB5FF004AADFF0042ADFF00187BBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FED4A200D4751500D4751500FED4A200FED4A200FFCFC300795B5A000000
      0000000000000000000000000000000000000000000000000000F0F3F70082A4
      C70085ACD10079A0C600648BB300486D91002E425700D6D5D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000218CCE0052B5FF0052BDFF0052BDFF0052B5FF004AB5FF00218CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097575A0097575A0097575A00FFFF
      FF00FFFFFE00FFA62400FFA62400FFFAF400FFF8F100FFCFC300795B5A000000
      0000000000000000000000000000000000000000000000000000F4F7FA0094B6
      D900A8CBEF0091B5DB006B98C40046586A00342E2800B0B0B000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002184BD00319CD6002994C60039A5DE004AB5FF0042ADF7002184B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEEDC00795B5A000000
      000000000000000000000000000000000000000000000000000000000000A6C1
      DC008EB2D60087AACE006686AA00464D5400312C2900B8B8B800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000639400318CBD0052A5D60073B5DE005AA5C600398CB500086B9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009B7E7E009B7E7E009B7E
      7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E009B7E7E000000
      000000000000000000000000000000000000000000000000000000000000B7B8
      B800797A7B007374760062606000504E4C0047474700E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006394002184B50084C6E70094CEEF008CC6E700298CBD00004A6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400C7C6C60093919000767474007F7F7E00D0D0D00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006394001873A5004294BD001873A50000527B00000000000000
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
      00000000000000000000000000000000000000000000F6F6F600ECECEC00E7E7
      E700E7E7E700E8E8E800ECECEC00F4F4F400FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D4000000000000000000000000000000
      0000B7A293006349350063493500634935006349350063493500634935006349
      3500634935006349350063493500634935000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4F4F400D0D0D000ACACAC00A0A0
      A000A0A0A000A1A1A100A9A9A900BABABA00D2D2D200E3E3E300E4E4E400DEDE
      DE00DCDCDC00DDDDDD00E3E3E300F0F0F0000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F000000000000000000000000000000
      0000B7A29300FDF8F600E1DCD800E0D7D200DFD2CA00DFCEC300DDC8BB00DCC3
      B300DBBFAD00DBBBA700CFB4A300634935000000000000000000000000000000
      00000000000000000000000000007B947B00D6D6D60000000000000000000000
      000000000000000000000000000000000000DECFC800AF6F5800965540009853
      420098534200844D380071534600666666007D7D7D0097979700989898008C8C
      8C00888888008989890098989800C2C2C200DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A000000000000000000000000000000
      0000B7A29300FFFEFE00B196870091786A00FDF7F400B196870091786A00FAED
      E800B196880091786A00CFB4A300634935000000000000000000000000000000
      00000000000000000000000000007B947B0018211800BDC6BD00000000000000
      000000000000000000000000000000000000C7694600DD523300F9635000FD70
      5B00F36C5200D26E4100F8655100CD4D2C004E522E00336F3300338433003D8E
      3D0032883200277927004163410098989800BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D0000000000815BBE00647DA2005D83
      9600BAA59600FFFFFF00FFFEFE00FEFCFB00FDF9F700FCF6F400FBF4EF00FBF0
      EB00FAECE700F8E9E200D0B9AB00634935000000000000000000000000000000
      00000000000000000000000000007B947B0042734A0018211800C6C6C6000000
      000000000000000000000000000000000000D1836600F9635000FD7A6200FE8C
      6E00DC855600F5CD9B00EF705200FD6A570092873C0053AF4F0067AE5C0061CA
      610055C3550038B538002A852A0099999900DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A2006768AD0051B0D10084D5E800A1EB
      F600BEA99A00FFFFFF00B196870091786A00FEFCFA00B196870091786A00FBF3
      EF00B196870091786A00D1C1B600634935000000000000000000000000007B9C
      8400212921002931290031423100394A3900528C630042734A0018211800C6C6
      C60000000000000000000000000000000000F2E3DC00E3664A00FD886B00E17D
      5100FAC79400FFD3A000E5775000F8745B00919C500086C28000EFF5E00055AF
      550073D2730052C252003A8A3A00C2C2C200EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F500538FAA004DD7FF0090EAFA00A1EB
      F600C3AE9E00FFFFFF00FFFFFF00FFFFFF00FFFDFD00FEFBFA00FDF9F700FCF5
      F200FBF2EE00FAEFE900D1C1B6006349350000000000000000000000000084A5
      8C00ADEFBD0073B584006BAD7B0063A573005A946B0063AD730042734A001821
      1800BDC6BD00000000000000000000000000F2F2F200BEA79D00A7574E004223
      5A004336780060487700BC5E3B00937A350082DA8200A4C69700FFF5EC00BACF
      A80063C1630045A54500889B8800E8E8E80000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC005491AE004CD2FA008DE4F600A1EB
      F600C8B2A300FFFFFF00B196870091786A00FEFEFE00B196870091786A00FDF8
      F500B196870091786A00D1C1B600634935000000000000000000000000008CAD
      9400B5EFC60094E7AD008CDEA50084CE9C0073C68C006BB5840063AD73005294
      630063736300000000000000000000000000B6B6B6001616160003060D000F2B
      7100143AA00010319700131F67005069500067A7670043888E001076B900207D
      BB001E735E004B5E4B00A8A8A800ECECEC000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE000000000000000000000000005795B0004ED2FA008DE4F400A1EB
      F600CCB6A700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFCFC00FEFA
      F900FDF7F500FBF4F100F9EAE3006349350000000000000000000000000094B5
      9C00B5F7CE00ADEFC600ADEFBD00A5E7BD00A5E7B50073C68C006BB584007B94
      8400D6E7D6000000000000000000000000003D3D3D001A1A1A00122F68001A4D
      B3001D57BD001B4FB5000D329300525768006E8EA2002D93F2003399FF003399
      FF002B91EF003656690086868600DADADA0000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006591BC005480AB003664
      9100A0ACB900FDFDFD0000000000000000005999B5004FD1FB008EE4F500A1EB
      F600EAAA8B00EAAA8B00EAAA8B00E9A58400E99F7A00E7976E00E68E6200E586
      5600E37D4A00E3764000E2723900C8622F0000000000000000000000000094BD
      A50094B59C008CAD940084A58C007B9C8400ADE7BD0084C694007B948400D6E7
      D600000000000000000000000000000000001515150028282800184281002673
      D9002673D9002673D9001B5CBD004C576B00478DBF003FA5FF0040A6FF0040A6
      FF003EA4FF00267FC0006E6E6E00C8C8C80000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE0081ACD8006592BF00436A
      930024364800E7E6E60000000000000000005C9BB7004FD0F9008DE3F500A1EB
      F600EAAA8B00FFC2A200FEC09F00FDBD9A00FCB99600FBB59000FAB08B00F9AB
      8400F8A77D00F6A27700F3956500CD6531000000000000000000000000000000
      000000000000000000000000000084A58C00A5E7BD007B948400D6E7D6000000
      0000000000000000000000000000000000002C2C2C003535350025456B003090
      F600349AFF003396FA002173D200526173004D99CF004CB2FF004DB3FF004DB3
      FF0049AFFF003197E60062686C00C2C2C20000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA009DC7F2006FA0D0004158
      710026211E00DCDCDC0000000000000000005E9EBA004DD0F9008DE3F400A1EB
      F600EAAA8B00EAAA8B00EAAA8B00EAAA8B00EAA68600E9A17F00E89B7600E794
      6C00E68E6200E5875800E3763E00E27239000000000000000000000000000000
      00000000000000000000000000008CAD94007B948400D6E7D600000000000000
      0000000000000000000000000000000000006A6A6A004A4A4A00424242003646
      65001B4590002262C60015477D007986930059A5D7004CB2F2004AB0EC0057BD
      FF0050B6FF0042A5EA0059727F00CFCFCF0000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA007D93AA00647A8E00464A
      4E002D2C2B00E4E4E40000000000000000005FA2BC0047CEF7008BE3F400A1EB
      F6006ED6F2001FB7EE0001A7E800039CDA003170920000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094B59C00E7EFE70000000000000000000000
      000000000000000000000000000000000000EEEEEE003A3A3A00696969008D8D
      8D00A4A4A4004F4F4F0036404800D0D0D0006FA8C5002987B90052A4D20061A8
      D300519FD0001875A400A5A5A500E6E6E6000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C60089868400686663005757
      5600AEAEAE00FEFEFE0000000000000000006BA9C00056D4FA009CECFA00ABEF
      FA00A6EDF80094E7F80071D9F6003CBDE900437C970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE006C6C6C005C5C
      5C005E5E5E0068686800D8D8D800F7F7F700DDEAF000368AB7008BC4E500A1CF
      EA0057A4CF005B92AF00DFDFDF00F9F9F9000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000F3F3F300DFDFDF00E6E6
      E6000000000000000000000000000000000080B3C5009BDEEB00C5F9FD00C5F9
      FD00C5F9FD00C5F9FD00C5F9FD00A0DFEA006691A20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEEBF10093BDD3009FC4
      D700A0C0D000F2F2F200FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006FA2B40076ABBA0070A3
      B3006C9DAF006B9BAE006FA2B4006FA2B4000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFF80FFFFF0000FF01E007E00F0000
      8000C003C00700008000C003800700000001C007800700008003C00781070000
      0003C00F818F00008003F01FC01F00000003E07FE01F00008007E07FF01F0000
      001FC03FF01F0000801FC03FF01F0000001FC03FF01F0000801FE03FF01F0000
      801FE03FF01F0000FFFFE07FF83F0000FFFFFFFFFFFFFFFFFFFF807FFE00F000
      FFFF0000C000F000FE7F00000000F000FE3F000000008000FE1F000000000000
      E00F000000000000E007000080020000E0070000C0070000E0070000C0030000
      E00F000080030000FE1F000081030000FE3F00008103007FFE7F0000C103007F
      FFFF8000C08F007FFFFFFF81FFFF80FF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu9: TPopupMenu
    Left = 24
    Top = 208
    object N13: TMenuItem
      Action = actAddDisc
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091'...'
    end
    object N14: TMenuItem
      Action = actEditDisc
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1075#1088#1091#1079#1082#1091' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077'...'
    end
    object N15: TMenuItem
      Action = actDelDisc
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091
    end
    object N17: TMenuItem
      Action = actGetDistributedNagr
      Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077'...'
    end
  end
  object ImageList3: TImageList
    Left = 576
    Top = 128
    Bitmap = {
      494C010106000900580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      00000000000000000000000000000000000000000000FCFCFB00ECEDEB00CACD
      C600ADB7A20096A9820096AC7A0090A37500A6AB9E00F3F3F300000000000000
      00000000000000000000000000000000000000000000FDFDFD00F5F5F500E9E9
      E900DFDFDF00D9D9D900D3D3D300D1D1D10000000000A7A9DB005A5CC2003C3F
      BE00494AB5008484B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6BBAE008EAB6D0094AA
      7400A4BC830094BA6E009DBB790099BB6F007C925F00B7B8B600000000000000
      000000000000000000000000000000000000F9F9F900E2E2E200C0C0C000A1A1
      A1008E8E8E008282820076767600000000009498EA005259E2006F76F1008185
      F200585EE9003337D6006868B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009DB87E008FB46900ABB9
      8F00C5CCA40090AF6D00A7C28B00A2C47A005E7D5D0047799B005693BE005693
      BE005693BE00C8ECFE000000000000000000E6E6E600999288006C5138006E46
      20006D4621008C5420008D521A009CA1F100545BDF00A9ADF100000000000000
      00007984DF00313FE6002C34D9005B6ABD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBCEA60096B17300A1AF
      9400A8B1B0008CA67600A0BE7B0097B8740054878D0065BDEB00519FC8006ACA
      FD006CC1EB0062ACD80000000000000000009C7E6100985C2300C18A56009F6A
      3900804B2200C6916000C9936000626BE3007277C6000000000000000000909F
      E2003951DE00667DE8003E53EB002439B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECF2E60091BA9A00799B
      8E003E6197005A787E008FAC74006F9E94005FB0D90065BDEB004D9DC70068CA
      FE00CEA147005DA0C900000000000000000089501A00C7905C00CC9766009462
      3A00ECCCCF009E6C3F00CE9A6900535DDD008384B50000000000ADB0F000515A
      E100788BE400000000005C76ED002A37BC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000067B7DE00558B
      9F00326090003354720065939F0065BEEA0065BDEB0065BDEB004D9CC50069C9
      FD00E2B55B005DA0C900000000000000000095663A00CC976600DAAD83009F7B
      5E00FFFFF900BCA38E00B7885C005C66DF006567B2009EA2DF00666FEF008892
      E90000000000000000006170ED003D46B1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFEFE0064ACD6006392
      BD005888B000395B7A005282970067C1ED0065BFEC0065BDEB004E9CC60068CA
      FE00FFFFFF005DA0C9000000000000000000AF957C00A6714000E5BE9900AA79
      6E00BFCDCF009FB9C100866839008B93EC005059DA00555DD6008C90DC000000
      000000000000A0A2EB004852DD006671BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFDFE0080B7DA00A4C2
      DA0085ACCE005781A5003B586C0063B6DD0063B8EA004D84D0003146B6002F3B
      BF004A4BB6003A59A000DEDEE700FFFFFF0000000000C3AF9D00927345000369
      8300157BC200177DC6000B71AF000B71AF008089EE004F5ADD006367B7008285
      B3007377C900525DE000707BD100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC008AC2E400CAE0
      F40099BFE0005988B00039506300558BB5004E7EE4003C51E1003C5AE1004872
      F300595FEA002C34D3006868B500D5D5E30000000000000000006B9EB800298F
      EC003399FF003399FF003298FD00369CF9000B71AF008D94ED005D66DF00525C
      DD00636CE500939BEC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F8006D99B3008DA4
      B7006F8497005062700040484B004F77D4004055DF00548DE9005AA9D80067BE
      F6004472DF002F3EE5002C34D9005B6ABD0000000000000000002585C3003EA4
      FF0040A6FF0040A6FF003EA4FF00369CF9001E5D7F007C7C7C00D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA006C95A8006569
      6C00616161005E676B006196AB004962E2004568C4006AC4F40068C1F000427C
      D8003951DD005577E7003E53EB002439B30000000000000000002288CC0047AD
      FF004AB0FF004AB0FF0048AEFF0042A8FF001D7CBA0071717100D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000068C5EF007DDF
      FF007DDCFF0078DBFF0075D9FE00475ADD004872B4006EC7F6005893EB004055
      E0004A73D600DDE5F6005C76ED002A37BC000000000000000000278DCC0050B6
      FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC0071717100D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000068C6F20083E3
      FF0080E0FF007DDFFF007ADCFF004C63E000435EB200578CDE004A67EF00517F
      E600559DD100FFFFFF006170ED003D46B10000000000000000002086BF003398
      D1002E91C5003DA3DF004CB2F90045ABF2002180B40080808000D8D8D8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000069CAF40086E4
      FF0085E2FF0084E1FF0080DEFF005E88ED004A58DB00485AD7005583DD0072CD
      FC0062B5E400A0A2EB004852DD006671BD0000000000000000003E89AF00318D
      BF0052A6D50075B6DB005FA3C6003B8CB40015709E00ACACAC00EAEAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006ACAF5006AC9
      F30069C8F30069C8F20069C6F00062ABEE005578EA004958DD004059B300426A
      AB006370C500525DE000707BD100DDE0EF000000000000000000BDD7E3002381
      B20084C0E40097CAE80089C2E3002C88B8006390A600E0E0E000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9FE00D7DAF8008D94ED005D66DF00525C
      DD00636CE500939BEC00DADEF300FFFFFF00000000000000000000000000ACCC
      DC005096B9004190B900408BB20089AFC200EDEDED00FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F5F5F500E9E9
      E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDDDD00ECECEC00FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2663200E97E530000000000FFCB
      9D00E35B210000000000000000000000000000000000FCFCFB00ECEDEB00CACD
      C600ADB7A20096A9820096AC7A0090A37500A6AB9E00F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900E2E2E200C0C0C000A1A1
      A1008E8E8E00828282007676760071717100797979008C8C8C00B6B6B600EAEA
      EA00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7975900EC3F0300E5F6FD00D877
      3C00E35B210000000000000000000000000000000000B6BBAE008EAB6D0094AA
      7400A4BC830094BA6E009DBB790099BB6F007C925F00B7B8B600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600999288006C5138006E46
      20006D4621008C5420008D521A00814A170071461E0059422D0088888800DADA
      DA00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7A07000009AE90000A8EC0000AC
      EF00A8553100000000000000000000000000000000009DB87E008FB46900ABB9
      8F00C5CCA40090AF6D00A7C28B00A2C47A005E7D5D0047799B005693BE005693
      BE005693BE00C8ECFE0000000000000000000000000000000000000000000000
      00000000000000000000000000007B947B00D6D6D60000000000000000000000
      0000000000000000000000000000000000009C7E6100985C2300C18A56009F6A
      3900804B2200C6916000C9936000B8793D00B3713300824B180086868600DBDB
      DB00000000000000000000000000000000007C9BAF0038586D0038586D003858
      6D0038586D0038586D0038586D0038586D000986C700007BB9000088C40000B3
      E80003A4E10038586D0038586D0038586D0000000000BBCEA60096B17300A1AF
      9400A8B1B0008CA67600A0BE7B0097B8740054878D0065BDEB00519FC8006ACA
      FD006CC1EB0062ACD80000000000000000000000000000000000000000000000
      00000000000000000000000000007B947B0018211800BDC6BD00000000000000
      00000000000000000000000000000000000089501A00C7905C00CC9766009462
      3A00ECCCCF009E6C3F00CE9A6900CA956300B676390074461B00A8A8A800EAEA
      EA00000000000000000000000000000000007C9BAF00C1CFD700CBD8DE00CBD8
      DE00CBD8DE00CBD8DE00CBD8DE00CBD8DE00007BAE00178BC20064D1FA000088
      C4000095D700CBD8DE00CBD8DE0038586D0000000000ECF2E60091BA9A00799B
      8E003E6197005A787E008FAC74006F9E94005FB0D90065BDEB004D9DC70068CA
      FE00CEA147005DA0C90000000000000000000000000000000000000000000000
      00000000000000000000000000007B947B0042734A0018211800C6C6C6000000
      00000000000000000000000000000000000095663A00CC976600DAAD83009F7B
      5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C644A00D7D7D700F9F9
      F900000000000000000000000000000000007C9BAF00CBD8DD00FEFEFD00F4F0
      ED00F1EEEF00F1F0F000FFFFFF00FFFFFF000383B00000ABDF001C99C8000095
      D7000077B700FFFFFF00CBD8DE0038586D00000000000000000067B7DE00558B
      9F00326090003354720065939F0065BEEA0065BDEB0065BDEB004D9CC50069C9
      FD00E2B55B005DA0C90000000000000000000000000000000000000000007B9C
      8400212921002931290031423100394A3900528C630042734A0018211800C6C6
      C60000000000000000000000000000000000AF957C00A6714000E5BE9900AA79
      6E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4C400F6F6F6000000
      0000000000000000000000000000000000007C9BAF00CAD6DD00FDFDFC00D5B5
      B000D5B1AC00D4B0AB00FFFFFF00FFFFFF00CDE6EF000383B0000086BD000086
      BD00CDE6EF00FFFFFF00CBD8DE0038586D0000000000FDFEFE0064ACD6006392
      BD005888B000395B7A005282970067C1ED0065BFEC0065BDEB004E9CC60068CA
      FE00FFFFFF005DA0C900000000000000000000000000000000000000000084A5
      8C00ADEFBD0073B584006BAD7B0063A573005A946B0063AD730042734A001821
      1800BDC6BD0000000000000000000000000000000000C3AF9D00927345000369
      8300157BC200177DC6000B71AF005B4719006D6D6D00BFBFBF00F5F5F5000000
      0000000000000000000000000000000000007C9BAF00CAD7DD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CBD8DE0038586D0000000000FCFDFE0080B7DA00A4C2
      DA0085ACCE005781A5003B586C0063B6DD0067C1EE0066C0EC004E9DC60068CA
      FE00FFFFFF005DA0C90000000000000000000000000000000000000000008CAD
      9400B5EFC60094E7AD008CDEA50084CE9C0073C68C006BB5840063AD73005294
      63006373630000000000000000000000000000000000000000006B9EB800298F
      EC003399FF003399FF003298FD00157BC20049565C0098989800E4E4E4000000
      0000000000000000000000000000000000007C9BAF00CBD6DD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3D3D100DEC7C300DEC5C200E0CAC600F1E9E700FFFF
      FF00FFFFFF00FFFFFF00D9E5EA0038586D0000000000FCFCFC008AC2E400CAE0
      F40099BFE0005988B000395063005995B1006AC5EF0068C2EE0052A0C9006CCC
      FE00FFFFFF005DA0C900000000000000000000000000000000000000000094B5
      9C00B5F7CE00ADEFC600ADEFBD00A5E7BD00A5E7B50073C68C006BB584007B94
      8400D6E7D60000000000000000000000000000000000000000002585C3003EA4
      FF0040A6FF0040A6FF003EA4FF00369CF9001E5D7F007C7C7C00D6D6D6000000
      0000000000000000000000000000000000007C9BAF00CCD7DE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DBE6EB0038586D0000000000F9F9F8006D99B3008DA4
      B7006F8497005062700040484B0061A6C4006CC9F3006AC6F0005CAED9006FCD
      FE006FCDFE0062ACD800000000000000000000000000000000000000000094BD
      A50094B59C008CAD940084A58C007B9C8400ADE7BD0084C694007B948400D6E7
      D6000000000000000000000000000000000000000000000000002288CC0047AD
      FF004AB0FF004AB0FF0048AEFF0042A8FF001D7CBA0071717100D1D1D1000000
      0000000000000000000000000000000000007C9BAF00CDD9DE00FFFFFF00CE9E
      9700D8B1AC00CE9E9700CE9E9700CE9E9700CE9E9700CE9E9700E0C1BD00CE9E
      9700CE9E9700FFFFFF00DDE7EC0038586D0000000000FAFAFA006C95A8006569
      6C00616161005E676B006196AB006FCAF1006FCDF6006CC9F4006AC6F20056B2
      E7005BA5CE00BBE8FE0000000000000000000000000000000000000000000000
      000000000000000000000000000084A58C00A5E7BD007B948400D6E7D6000000
      0000000000000000000000000000000000000000000000000000278DCC0050B6
      FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC0071717100D1D1D1000000
      0000000000000000000000000000000000007C9BAF00D2DCE200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0EAEF0038586D00000000000000000068C5EF007DDF
      FF007DDCFF0078DBFF0075D9FE0073D6FB0072D2FA0070CCF6006CCCF4006BC8
      F2005AA8CF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008CAD94007B948400D6E7D600000000000000
      00000000000000000000000000000000000000000000000000002086BF003398
      D1002E91C5003DA3DF004CB2F90045ABF2002180B40080808000D8D8D8000000
      0000000000000000000000000000000000007C9BAF00B9C8D300D4DEE400D2DB
      E100D1D7DD00D2D9DE00D3DBE000D6DEE200D6DEE200D7DEE200D9E0E400DAE0
      E400DEE7EB00E4ECF000D1DFE60038586D00000000000000000068C6F20083E3
      FF0080E0FF007DDFFF007ADCFF0076DAFE0073D5FC0072D2FA0070CFF7006ECA
      F50058A9D3000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094B59C00E7EFE70000000000000000000000
      00000000000000000000000000000000000000000000000000003E89AF00318D
      BF0052A6D50075B6DB005FA3C6003B8CB40015709E00ACACAC00EAEAEA000000
      0000000000000000000000000000000000007C9BAF007C9BAF007C9BAF007C9B
      AF007C9BAF007C9BAF007C9BAF007C9BAF007C9BAF007C9BAF007C9BAF007C9B
      AF007C9BAF007C9BAF007C9BAF0038586D00000000000000000069C8F30085E2
      FF0080E0FF0080E0FF007EDDFF007BDCFF0077DAFF0074D6FD0072D3FB0070CF
      F7005CADDA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDD7E3002381
      B20084C0E40097CAE80089C2E3002C88B8006390A600E0E0E000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000069CAF40086E4
      FF0085E2FF0084E1FF0080DEFF007FDEFF007FDEFF007DDBFF0079DDFF0078DB
      FF0067BFED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACCC
      DC005096B9004190B900408BB20089AFC200EDEDED00FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006ACAF5006AC9
      F30069C8F30069C8F20069C6F00069C5F00068C3EE0067C3ED0067C0EC0067BF
      EB00D1E7F200000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00803F808300000000803F010100000000
      800300300000000080030060000000008003004400000000C003000C00000000
      800300180000000080008001000000008000C003000000008000C01F00000000
      8000C01F00000000C000C01F00000000C000C01F00000000C000C01F00000000
      C000C01F00000000FE00E03F00000000FFFF800FFF27803FFFFF000FFF07803F
      FFFF000FFF078003FE7F000F00008003FE3F000F00008003FE1F000F0000C003
      E00F001F00008003E007801F00008003E007C01F00008003E007C01F00008003
      E00FC01F00008003FE1FC01F0000C007FE3FC01F0000C007FE7FC01F0000C007
      FFFFC01FFFFFC007FFFFE03FFFFFC00700000000000000000000000000000000
      000000000000}
  end
  object dsContentForDiscVC: TDataSource
    DataSet = dmUchPlan.ADOQContentForDiscVC
    Left = 480
    Top = 488
  end
  object dsContentForDiscAZ: TDataSource
    DataSet = dmUchPlan.ADOQContentForDiscAZ
    Left = 544
    Top = 488
  end
  object dsNagrCommit: TDataSource
    DataSet = dm.adsNagrCommit
    Left = 592
    Top = 400
  end
  object Timer1: TTimer
    Left = 720
    Top = 40
  end
  object dsPlanNormTime: TDataSource
    OnDataChange = dsPlanNormTimeDataChange
    Left = 344
    Top = 304
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 488
    Top = 103
    object actNormSaveChanges: TAction
      Caption = ' '#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
      ImageIndex = 12
      OnExecute = actNormSaveChangesExecute
      OnUpdate = actNormUndoChangesUpdate
    end
    object actNormUndoChanges: TAction
      Caption = ' '#1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
      ImageIndex = 13
      OnExecute = actNormUndoChangesExecute
      OnUpdate = actNormUndoChangesUpdate
    end
  end
end
