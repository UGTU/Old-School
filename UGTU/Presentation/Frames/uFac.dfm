inherited fmFacultet: TfmFacultet
  Width = 763
  Height = 459
  ExplicitWidth = 763
  ExplicitHeight = 459
  inherited Panel1: TPanel
    Width = 763
    Height = 422
    ExplicitWidth = 763
    ExplicitHeight = 422
    object tsSessia: TPageControl
      Left = 2
      Top = 2
      Width = 759
      Height = 418
      ActivePage = tsKontingent
      Align = alClient
      Images = frmMain.ImageList1
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = tsSessiaChange
      object TabSheet1: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1077#1081
        ImageIndex = 38
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 751
          Height = 386
          Align = alClient
          AutoFitColWidths = True
          DataSource = DataSource1
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
          RowHeight = 16
          TabOrder = 0
          OnDblClick = DBGridEh1DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cname_spec'
              Footers = <>
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object tsKontingent: TTabSheet
        Caption = #1050#1086#1085#1090#1080#1085#1075#1077#1085#1090
        ImageIndex = 37
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 10
          Top = 11
          Width = 90
          Height = 13
          Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
          Visible = False
        end
        object Label2: TLabel
          Left = 104
          Top = 11
          Width = 12
          Height = 13
          Caption = #1086#1090
          Visible = False
        end
        object Label3: TLabel
          Left = 224
          Top = 12
          Width = 13
          Height = 13
          Caption = #1076#1086
          Visible = False
        end
        object dtpBeg: TDateTimePicker
          Left = 121
          Top = 4
          Width = 99
          Height = 21
          Date = 39015.586093263890000000
          Time = 39015.586093263890000000
          TabOrder = 0
          Visible = False
        end
        object dtpEnd: TDateTimePicker
          Left = 241
          Top = 5
          Width = 99
          Height = 21
          Date = 39015.586585567130000000
          Time = 39015.586585567130000000
          TabOrder = 1
          Visible = False
        end
        object btnGetRepKont: TButton
          Left = 349
          Top = 1
          Width = 88
          Height = 25
          Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 2
          Visible = False
        end
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 24
          Width = 751
          Height = 362
          Align = alClient
          AutoFitColWidths = True
          DataSource = dmFacultetStatistic.dsSmallKont
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 751
          Height = 24
          ButtonHeight = 19
          TabOrder = 4
          object KontExcel: TSpeedButton
            Left = 0
            Top = 0
            Width = 156
            Height = 19
            Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1090#1095#1077#1090#1072' '#1074' Excel'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009E8D8000634935006349350063493500634935006349
              350063493500634935006349350063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009B8A7D00FCFAF800D9C0AE00D5BCAB00CFB7A600C8B1
              A000C1AB9B00BBA69600B7A2930063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009B8A7D00FEFEFE00FBF8F700F6F1ED00F1E8E100EBDE
              D600E5D5C900E1CDBE00BCA5960063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009E8D8000FFFFFF00FEFDFD00FAF7F500F5EFEA00F0E6
              DF00EBDDD300E5D4C700C1AA9B0063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00A2918400FFFFFF00FFFFFF00FDFDFB00F9F5F300F4ED
              E800EFE4DC00E9DBD000C8B1A10063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00A7958800FFFFFF00FFFFFF00FFFFFF00FCFBFA00F9F4
              F100F3ECE600EDE3DA00CFB7A60063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00AB9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFA
              F800F7F3EF00F2EAE400D5BCAB0063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00B09E9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
              FE00FBF9F700F6F1ED00D9C0AE0063493500FF00FF00FF00FF00FF00FF0070C7
              E10081D8EE0086E6FA0039BEE50099D8DF0091E1F60081D0E900FFFFFF00FFFF
              FF00FEFEFD00C4AD9D00C3AB9C00644A3600FF00FF00FF00FF00FF00FF0098E2
              F30031B7DF007DE9FD005DC6E60093F0FF002FB6DF00A0E8F900FFFFFF00FFFF
              FF00A9988A00644A3600644A3600644A3600FF00FF00FF00FF00FF00FF0094EA
              FA0093F1FF00BFF8FF00AFE8F400C7FBFF0093F1FF009FF0FF00FFFFFF00FFFF
              FF00AE9C8E00D4C5BA00644A3600D0CBC400FF00FF00FF00FF00FF00FF0022AB
              D90053BFE100AFE8F400F0FFFD00B4EBF60053BFE10036BBE500FFFFFF00FFFF
              FF00B2A09200644A3600D0CCC500FF00FF00FF00FF00FF00FF00FF00FF0094EA
              FA0096F3FF00C7FBFF00ADE5F300C3FBFF0096F3FF008BD7E200B6A49600B6A4
              9600B5A39500D0CCC500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0096E1
              F30032B8E0008CF1FF0058C2E30090F1FF002FB6DF008DDDF000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0066C3
              E00081D8EE0094EAFA0026AFDB008CE8FA008EDEF10081CCE300FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = KontExcelClick
          end
          object ToolButton1: TToolButton
            Left = 156
            Top = 0
            Width = 8
            Caption = 'ToolButton1'
            Style = tbsDivider
          end
          object dbdteEx: TDBDateTimeEditEh
            Left = 164
            Top = 0
            Width = 80
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            TabOrder = 0
            Visible = True
          end
        end
      end
      object tsItogi: TTabSheet
        Caption = #1054#1073#1097#1080#1077' '#1080#1090#1086#1075#1080' '#1089#1077#1089#1089#1080#1080
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 751
          Height = 24
          Images = ilMain
          TabOrder = 0
          DesignSize = (
            751
            24)
          object SpeedButton2: TSpeedButton
            Left = 0
            Top = 0
            Width = 137
            Height = 22
            Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1077#1090
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000040204000482
              04008482040084020400FCFE040004FE04008402840004028400C4C2C400FC02
              FC0004FEFC00FC020400FCFEFC0004828400848284000402FC00999999999999
              99999990000000000099990CCCCCCCCCC099900000000000C0990A0E88888880
              C099900E88888880C0000A0E88888880C040900E88888880C0400A0E88888880
              C000900E88888880C0990A0E88888880C009900E88888880C8090A0E88888880
              C809900E88888880C0090A0E8888888009999000000000009999}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton2Click
          end
          object ToolButton3: TToolButton
            Left = 137
            Top = 0
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 0
            Style = tbsDivider
          end
          object ToolButton8: TToolButton
            Left = 145
            Top = 0
            Action = actItogiFacToExc
            DropdownMenu = pmItogi
            Style = tbsDropDown
          end
          object ToolButton2: TToolButton
            Left = 183
            Top = 0
            Width = 10
            Caption = 'ToolButton2'
            Style = tbsDivider
          end
          object cbSemestr: TComboBox
            Left = 193
            Top = 0
            Width = 145
            Height = 21
            Hint = #1042#1080#1076' '#1089#1077#1084#1077#1089#1090#1088#1072
            Style = csDropDownList
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            Sorted = True
            TabOrder = 0
            Items.Strings = (
              #1042#1077#1089#1077#1085#1085#1080#1081
              #1054#1089#1077#1085#1085#1080#1081)
          end
          object ToolButton4: TToolButton
            Left = 338
            Top = 0
            Width = 8
            Caption = 'ToolButton4'
            ImageIndex = 0
            Style = tbsDivider
          end
          object spYear: TSpinEdit
            Left = 346
            Top = 0
            Width = 92
            Height = 22
            Hint = #1043#1086#1076' '#1086#1073#1091#1095#1077#1085#1080#1103
            MaxValue = 2011
            MinValue = 2005
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Value = 2005
            OnChange = spYearChange
          end
        end
        object dbgrItogi: TDBGridEh
          Left = 0
          Top = 24
          Width = 751
          Height = 362
          Align = alClient
          AutoFitColWidths = True
          DataSource = dmFacultetStatistic.dsSelKursItogiCol
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel2: TPanel
          Left = 148
          Top = 174
          Width = 361
          Height = 71
          BorderStyle = bsSingle
          TabOrder = 2
          Visible = False
          object Label4: TLabel
            Left = 135
            Top = 19
            Width = 93
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
          end
          object ProgressBar1: TProgressBar
            Left = 5
            Top = 45
            Width = 346
            Height = 17
            Smooth = True
            TabOrder = 0
            Visible = False
          end
        end
      end
      object tsDaily: TTabSheet
        Caption = #1045#1078#1077#1076#1085#1077#1074#1085#1099#1077' '#1080#1090#1086#1075#1080' '#1089#1077#1089#1089#1080#1080
        ImageIndex = 19
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGridEh3: TDBGridEh
          Left = 0
          Top = 24
          Width = 751
          Height = 362
          Align = alClient
          AutoFitColWidths = True
          DataSource = dmFacultetStatistic.dsSelDaysItogi
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 751
          Height = 24
          ButtonHeight = 19
          TabOrder = 1
          object SpeedButton3: TSpeedButton
            Left = 0
            Top = 0
            Width = 156
            Height = 19
            Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1090#1095#1077#1090#1072' '#1074' Excel'
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009E8D8000634935006349350063493500634935006349
              350063493500634935006349350063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009B8A7D00FCFAF800D9C0AE00D5BCAB00CFB7A600C8B1
              A000C1AB9B00BBA69600B7A2930063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009B8A7D00FEFEFE00FBF8F700F6F1ED00F1E8E100EBDE
              D600E5D5C900E1CDBE00BCA5960063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF009E8D8000FFFFFF00FEFDFD00FAF7F500F5EFEA00F0E6
              DF00EBDDD300E5D4C700C1AA9B0063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00A2918400FFFFFF00FFFFFF00FDFDFB00F9F5F300F4ED
              E800EFE4DC00E9DBD000C8B1A10063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00A7958800FFFFFF00FFFFFF00FFFFFF00FCFBFA00F9F4
              F100F3ECE600EDE3DA00CFB7A60063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00AB9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFA
              F800F7F3EF00F2EAE400D5BCAB0063493500FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00B09E9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
              FE00FBF9F700F6F1ED00D9C0AE0063493500FF00FF00FF00FF00FF00FF0070C7
              E10081D8EE0086E6FA0039BEE50099D8DF0091E1F60081D0E900FFFFFF00FFFF
              FF00FEFEFD00C4AD9D00C3AB9C00644A3600FF00FF00FF00FF00FF00FF0098E2
              F30031B7DF007DE9FD005DC6E60093F0FF002FB6DF00A0E8F900FFFFFF00FFFF
              FF00A9988A00644A3600644A3600644A3600FF00FF00FF00FF00FF00FF0094EA
              FA0093F1FF00BFF8FF00AFE8F400C7FBFF0093F1FF009FF0FF00FFFFFF00FFFF
              FF00AE9C8E00D4C5BA00644A3600D0CBC400FF00FF00FF00FF00FF00FF0022AB
              D90053BFE100AFE8F400F0FFFD00B4EBF60053BFE10036BBE500FFFFFF00FFFF
              FF00B2A09200644A3600D0CCC500FF00FF00FF00FF00FF00FF00FF00FF0094EA
              FA0096F3FF00C7FBFF00ADE5F300C3FBFF0096F3FF008BD7E200B6A49600B6A4
              9600B5A39500D0CCC500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0096E1
              F30032B8E0008CF1FF0058C2E30090F1FF002FB6DF008DDDF000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0066C3
              E00081D8EE0094EAFA0026AFDB008CE8FA008EDEF10081CCE300FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = SpeedButton3Click
          end
          object dbdtExam: TDBDateTimeEditEh
            Left = 156
            Top = 0
            Width = 80
            Height = 19
            DynProps = <>
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            TabOrder = 0
            Visible = True
            OnChange = dbdtExamChange
          end
        end
      end
      object tsNapr: TTabSheet
        Caption = #1046#1091#1088#1085#1072#1083' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1081
        ImageIndex = 27
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 751
          Height = 24
          Images = ilMain
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Action = actPrintEmptyNapr
          end
          object tbtPrintNapr: TToolButton
            Left = 23
            Top = 0
            Action = actPrintNapr
          end
          object tbtCloseNapr: TToolButton
            Left = 46
            Top = 0
            Action = actCloseNapr
          end
          object ToolButton9: TToolButton
            Left = 69
            Top = 0
            Action = actEditNapr
          end
          object ToolButton10: TToolButton
            Left = 92
            Top = 0
            Action = actDelNapr
          end
          object ToolButton5: TToolButton
            Left = 115
            Top = 0
            Action = actRefreshNaprList
          end
          object ToolButton6: TToolButton
            Left = 138
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 13
            Style = tbsSeparator
          end
          object Panel7: TPanel
            Left = 146
            Top = 0
            Width = 209
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object Label5: TLabel
              Left = 0
              Top = 4
              Width = 24
              Height = 19
              Alignment = taCenter
              AutoSize = False
              Caption = #1086#1090
              Transparent = False
            end
            object Label6: TLabel
              Left = 95
              Top = 4
              Width = 28
              Height = 19
              Alignment = taCenter
              AutoSize = False
              Caption = #1076#1086
            end
            object dbdtDateBegin: TDBDateTimeEditEh
              Left = 22
              Top = 2
              Width = 74
              Height = 19
              Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1078#1091#1088#1085#1072#1083#1072
              DynProps = <>
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Visible = True
              OnChange = dbdtDateBeginChange
            end
            object dbdtDateEnd: TDBDateTimeEditEh
              Left = 122
              Top = 2
              Width = 80
              Height = 19
              Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1078#1091#1088#1085#1072#1083#1072
              DynProps = <>
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Visible = True
              OnChange = dbdtDateEndChange
            end
          end
        end
        object dbgrdNapr: TDBGridEh
          Left = 0
          Top = 24
          Width = 751
          Height = 362
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          AutoFitColWidths = True
          ColumnDefValues.ToolTips = True
          DataSource = dmUspevaemost.dsGetAllNaprForFac
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = ppmFacNapr
          ReadOnly = True
          SortLocal = True
          TabOrder = 1
          OnTitleClick = dbgrdNaprTitleClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cNumber_ved'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 53
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'lClose'
              Footers = <>
              Title.Caption = #1047#1072#1082#1088#1099#1090#1086
              Width = 51
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'StudName'
              Footers = <>
              Title.Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1085#1080#1094#1080#1072#1083#1099
              Width = 131
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nn_zach'
              Footers = <>
              Title.Caption = #8470' '#1079#1072#1095#1105#1090#1082#1080
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cName_disc'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
              Width = 144
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Name_osenca'
              Footers = <>
              Visible = False
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'cName_vid_exam'
              Footers = <>
              Title.Caption = #1042#1080#1076' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'dD_vydano'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              Width = 72
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'Dd_exam'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
              Width = 82
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ctema'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072' '#1076#1083#1103' '#1050#1055' ('#1050#1056')'
              Visible = False
              Width = 300
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'UserName'
              Footers = <>
              Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object tsAcadem: TTabSheet
        Caption = #1040#1082#1072#1076#1077#1084#1080#1095#1077#1089#1082#1080#1077' '#1086#1090#1087#1091#1089#1082#1072
        ImageIndex = 55
        inline fmAcadem: TfmAcadem
          Left = 0
          Top = 0
          Width = 751
          Height = 386
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 751
          ExplicitHeight = 386
          inherited Panel1: TPanel
            Width = 751
            Height = 349
            ExplicitWidth = 751
            ExplicitHeight = 349
            inherited tbAcadem: TToolBar
              Width = 747
              ExplicitWidth = 747
            end
            inherited dbgeAcadem: TDBGridEh
              Width = 747
              Height = 322
            end
          end
          inherited pnlSave: TPanel
            Top = 349
            Width = 751
            ExplicitTop = 349
            ExplicitWidth = 751
            inherited bbSave: TBitBtn
              Left = 582
              ExplicitLeft = 582
            end
            inherited bbUndo: TBitBtn
              Left = 414
              ExplicitLeft = 414
            end
          end
        end
      end
      object tsAvgBalls: TTabSheet
        Caption = #1057#1088#1077#1076#1085#1080#1077' '#1073#1072#1083#1083#1099
        ImageIndex = 71
        inline fmAverageBallsFac: TfmAverageBalls
          Left = 0
          Top = 0
          Width = 751
          Height = 386
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 751
          ExplicitHeight = 386
          inherited Panel1: TPanel
            Width = 751
            Height = 349
            ExplicitWidth = 751
            ExplicitHeight = 349
            inherited tbAcadem: TToolBar
              Width = 747
              ExplicitWidth = 747
            end
            inherited lvBalls: TListView
              Width = 747
              Height = 290
              ExplicitWidth = 747
              ExplicitHeight = 290
            end
            inherited pnlFilters: TPanel
              Width = 747
              ExplicitWidth = 747
            end
          end
          inherited pnlSave: TPanel
            Top = 349
            Width = 751
            ExplicitTop = 349
            ExplicitWidth = 751
            inherited bbSave: TBitBtn
              Left = 582
              ExplicitLeft = 582
            end
            inherited bbUndo: TBitBtn
              Left = 414
              ExplicitLeft = 414
            end
          end
          inherited ilBalls: TImageList
            Bitmap = {
              494C010102000400240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
              0000000000003600000028000000400000001000000001002000000000000010
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000D4CCC7006349
              3500634935006349350063493500634935006349350063493500634935006349
              3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
              3500634935006349350063493500634935006349350063493500634935006349
              3500D4CCC7000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F4E3
              DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
              A200634935000000000000000000000000000000000000000000B8A49400F4E3
              DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
              B500634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F6E8
              E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
              A300634935000000000000000000000000000000000000000000B8A49400F6E8
              E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
              B800634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B8A49400F8EC
              E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
              A500634935000000000000000000000000000000000000000000B8A49400F8EC
              E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
              BB00634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000B9A59500F9F0
              EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
              A700634935000000000000000000000000000000000000000000B9A59500F9F0
              EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
              BF00634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BCA69700FBF4
              F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
              A900634935000000000000000000000000000000000000000000BCA69700FBF4
              F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
              C400634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000BEA89A00FCF7
              F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
              AC00634935000000000000000000000000000000000000000000BEA89A00FCF7
              F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
              C900634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C0AB9C00FDFA
              F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
              AF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
              F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
              CF00634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C3AC9D00FEFD
              FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
              C000634935000000000000000000000000000000000000000000C3AC9D00FEFD
              FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
              D400634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000C4AE9E00FFFF
              FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
              DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
              FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
              DA00634935000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EFE8E400C3AD
              9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
              9400D4CCC7000000000000000000000000000000000000000000EFE8E400C3AD
              9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
              9400D4CCC7000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000424D3E000000000000003E000000
              2800000040000000100000000100010000000000800000000000000000000000
              000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
              FFFFFFFF00000000C007C00700000000C007C00700000000C007C00700000000
              C007C00700000000C007C00700000000C007C00700000000C007C00700000000
              C007C00700000000C007C00700000000C007C00700000000C007C00700000000
              FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
              000000000000}
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 422
    Width = 763
    Visible = False
    ExplicitTop = 422
    ExplicitWidth = 763
    inherited bbSave: TBitBtn
      Left = 595
      Top = 7
      ExplicitLeft = 595
      ExplicitTop = 7
    end
    inherited bbUndo: TBitBtn
      Left = 549
      ExplicitLeft = 549
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 154
    Top = 173
  end
  object ilMain: TImageList
    Left = 214
    Top = 152
    Bitmap = {
      494C01010F001000200010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD948400735A
      4A00735A4A00735A4A00735A4A00735A4A00735A4A00735A4A00735A4A00735A
      4A00735A4A00735A4A00735A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD948400DECE
      C600DECEC600DECEC600DECEC600DECEC600DECEC600DECEC600DECEC600DECE
      C600DECEC600DECEC600735A4A0000000000F3F1EF00E3DEDB00927A69008C75
      630087705E00E3DEDB007F6654007A624F00755D4A00E3DEDB006E5441006A51
      3E00674E3A00E3DEDB000000000000000000F7F3EF00E7DFDE0094796B008C75
      630084715A00E7DFDE007B6552007B614A00735D4A00E7DFDE006B5542006B51
      3900634D3900E7DFDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD948400FFEF
      E700F7E7DE00F7E7DE00F7DED60000945A00F7DECE00F7D6CE00F7D6C600F7D6
      C600F7CEBD00DECEC600735A4A0000000000E3DEDB00AE988800EFE3DD00F2E7
      E100EDDFD700836B5900B79B8B00DBBDAD00D9B7A60072594600AE8B7700D0A6
      9200CC9E8700654B3800E3DEDB0000000000E7DFDE00AD9A8C00EFE3DE00F7E7
      E700EFDFD60084695A00B59A8C00DEBEAD00DEB6A50073594200AD8A7300D6A6
      9400CE9E840063493900E7DFDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD948400FFEF
      E700FFEFE700F7E7DE0000945A00008C5A008CDEB5008CDEB500EFD6C600F7D6
      C600F7D6C600DECEC600735A4A0000000000B7A29300FBF8F700F9F4F200F7F0
      EC00F4EBE600F1E5DF007F6754007A624F00765D4A00735946006E5542006B52
      3E00674E3A00654B38006349350000000000B5A29400FFFBF700FFF7F700F7F3
      EF00F7EBE700F7E7DE007B6552007B614A00735D4A00735942006B5542006B51
      3900634D39006349390063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD9C8C00FFEF
      EF00FFEFE70000945A0000945A0000945A0000945A0000945A0000945A00B5DE
      BD00F7D6C600DECEC600735A4A0000000000B7A29300FDFCFB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F2E5DF00DDDCD700DFD7CE00DECDC000DEC5B600DEBF
      AC00DBBAA600D8B5A3006349350000000000B5A29400FFFFFF00FFFBF700FFF7
      F700F7EFEF00F7EBE700F7E7DE00DEDFD600DED7CE00DECFC600DEC7B500DEBE
      AD00DEBAA500DEB6A50063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59C8C00FFF7
      EF00FFF7EF00FFEFE70000945A0000945A00D6EFDE00F7E7D600D6EFD6000094
      5A00F7D6CE00DECEC600735A4A0000000000B7A29300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFDFD700EBD9D100E8D3C900E5CD
      C100E1C6B900D6B3A100634A350000000000B5A29400FFFFFF00B57D6300B57D
      6300EFDFD600B57D6300F7EBE700F7E7DE00EFDFD600EFDBD600EFD3CE00E7CF
      C600E7C7BD00D6B2A50063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59C8C00FFF7
      F700FFF7EF0073DEB500FFEFE70000945A00FFE7DE0000945A00F7E7D60073D6
      AD00F7DECE00DECEC600735A4A0000000000B9A49500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2E5DF00EEDFD800EBD9D000E8D3
      C800E5CCC100DBBDAD00634A360000000000BDA69400FFFFFF00FFFFFF00FFFF
      FF00FFFBF700FFF7F700F7F3EF00F7EBE700F7E7DE00EFDFDE00EFDBD600EFD3
      CE00E7CFC600DEBEAD0063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA59400FFFF
      F700FFF7F70000945A00ADEFD600FFEFEF00D6F7E70000945A0000945A00F7E7
      DE00F7DED600DECEC600735A4A0000000000BDA79800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4EBE600F2E5DF00EFDFD800ECD9
      D000E8D3C900E0C7BA00634A350000000000BDA69C00FFFFFF00948E8C00EFDF
      D600948E8400EFDFD600948E8400948E84000000000084828400ADB6B500EFDB
      D600EFD3CE00E7C7BD0063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDA59400FFFF
      FF00FFFFF700D6F7E70000945A0000945A0000945A0000945A00009463000094
      5A00F7E7DE00DECEC600735A4A0000000000C1AB9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1E5DF00EEDF
      D700EBD9D000E6D1C600634A350000000000C6AA9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFBF700FFF7F7008482840073716B00525552000000
      0000EFDBD600E7D3C60063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDAD9C00FFFF
      FF00FFFFFF00FFFFF700D6F7E700ADEFD6008CE7C60000945A0000945A00FFEF
      E700F7E7DE00DECEC600735A4A0000000000C5AFA000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4EBE600F2E5
      DF00EFDFD800EADBD1006349360000000000C6AEA500FFFFFF00B5826300B582
      6300948E8C00C6B2A500948E8400948E840000619400A59E9C00FFFFFF005292
      AD0008101000EFDBD60063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AD9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F70000945A00FFEFEF00FFEF
      E700DECEC600DECEC600735A4A0000000000C8B2A300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F0EC00F4EB
      E600F1E5DF00EEE2DA00644A360000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000619400A59E9C008CB6C60073CF
      E7004A9AB5000810100063493100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6B5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7EF00FFF7
      EF00735A4A00735A4A00735A4A0000000000C9B4A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF5F200F7F0
      EC00F4EBE600EEE2DA00644A360000000000CEB6A500FFFFFF00FFFFFF0063A2
      630063A2630063A26300C6B6AD0063A2630063A26300006194004A9EB5008CE3
      EF0063BED6004A9AB50008101000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700947B
      6B00F7DECE00D6BDAD00735A4A0000000000C8B2A300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FBF9F700FAF4
      F200F7F0ED00F3EAE400644A360000000000CEB2A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF70052A2
      B5008CE3EF006BC7DE007B868400313494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700947B
      6B00D6BDAD00AD9484000000000000000000C8B2A300CAB4A500CBB5A600CAB4
      A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA9B00BDA89900BBA6
      9700B9A49500B8A39400B7A2930000000000CEB2A500CEB6A500CEB6A500CEB6
      A500CEB2A500C6B2A500C6B2A500C6AE9C00C6AE9C00BDAA9C00BDAA9C00BDA6
      94007BB2BD00CEBAAD007386D6005A6DAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5AD00CEB5
      A500C6B5A500C6B5A500C6AD9C00BDAD9C00BDA59400BDA59400B59C8C00B59C
      8C00B59C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A6DAD00849EEF005A75D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000520000005200000052000000520000005200000052
      0000005200000052000000520000002100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000525252004A4A4A004A4A
      4A004A4A4A005A5A5200FF00FF0052524A004A4A42005252520094949400FF00
      FF004A4A42004A4A42004A4A4A005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000007B0000007B
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000007B0000008C0000003900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000949C8C00FFFFFF00FFFFFF00FFFF
      F700FFFFFF005A5A520084847B00FFFFFF00FFFFF700BDBDB500424239008484
      7B00F7EFDE00EFE7D600FFF7EF0094948400F7F7EF00E7DEDE00947B6B008C73
      630084735A00E7DEDE007B6352007B634A00735A4A00E7DEDE006B5242006B52
      3900634A3900E7DEDE00000000000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700008400000039000000000000B5B5B5006B6B6B009C9C
      9C0000000000000000000000000000000000000000000000000000000000E7E7
      E700A5A5A50094949400000000000000000094948C00FFFFFF00F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00E7DEDE00AD9C8C00EFE7DE00F7E7
      E700EFDED600846B5A00B59C8C00DEBDAD00DEB5A500735A4200AD8C7300D6A5
      9400CE9C8400634A3900E7DEDE000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000947BEF002900DE003929A5006363
      6300CECECE000000000000000000000000000000000000000000D6D6D6006352
      B5002900DE00A5A5A500000000000000000094948400FFFFFF00EFDED600D6BD
      AD00C6B5A500C6B5A500CEBDAD00E7DED600F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00B5A59400FFFFF700FFF7F700F7F7
      EF00F7EFE700F7E7DE007B6352007B634A00735A4A00735A42006B5242006B52
      3900634A3900634A3900634A31000000000000840000F7EFF70031A53100299C
      2900299429002994290029942900299429002994290021942100299429000084
      000000840000D6E7D600007B000000390000BDADF7002900DE003108DE00524A
      6B007B7B7B00DEDEDE00000000000000000000000000CEC6D6004229C6002900
      DE007B6BCE0000000000000000000000000094948C00FFFFFF00C6AD9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6BDB500F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE7008C8C7B00B5A59400FFFFFF00FFFFF700FFF7
      F700F7EFEF00F7EFE700F7E7DE00DEDED600DED6CE00DECEC600DEC6B500DEBD
      AD00DEBDA500DEB5A500634A31000000000000840000F7EFF700008400000084
      0000008C0000008C0000008C0000008C00000084000094BD9400008400000084
      00009CA59C00F7EFF700007B000000390000000000008473EF002900DE003918
      D6005A5A5A0094949400E7E7E70000000000CEC6D6003918CE002900DE00A59C
      C6000000000000000000000000000000000094948C00FFF7F700C6AD9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6BD00F7EFE700C6B5A500C6B5A500C6B5
      A500C6B5A500C6B5A500F7EFE7008C8C7B00B5A59400FFFFFF00B57B6300B57B
      6300EFDED600B57B6300F7EFE700F7E7DE00EFDED600EFDED600EFD6CE00E7CE
      C600E7C6BD00D6B5A500634A31000000000000840000F7EFF700FFF7FF000084
      0000008C0000008C0000008C000000840000A5C6A50000840000008C0000088C
      0800F7EFF700F7EFF700007B00000039000000000000000000007B63EF002900
      DE005239C6006363630094949400B5B5C6003918CE002900DE00A59CC6000000
      00000000000000000000000000000000000094948C00FFF7F700CEBDA500FFFF
      FF00D6F7FF00FFFFFF00FFFFFF00DEC6BD00F7EFE700D6C6B500D6C6BD00D6C6
      BD00D6C6BD00D6C6B500F7EFE7008C8C7B00BDA59400FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700F7F7EF00F7EFE700F7E7DE00EFDEDE00EFDED600EFD6
      CE00E7CEC600DEBDAD00634A31000000000000840000F7EFF700F7EFF700FFFF
      FF00088C08000084000000840000B5CEB5000084000000840000008400000084
      000042A54200F7EFF700007B0000003900000000000000000000000000007B63
      EF002900DE005231C60052525A003110C6002900D600A59CC600000000000000
      00000000000000000000000000000000000094948C00FFFFF700CEC6B500EFFF
      FF0052ADEF00EFFFFF00FFFFFF00D6C6BD00F7EFE700D6C6B500D6C6B500D6C6
      B500D6C6B500D6C6B500FFF7EF008C8C7B00BDA59C00FFFFFF00948C8C00EFDE
      D600948C8400EFDED600948C8400948C8400F7EFE700F7E7DE0000840000EFDE
      D600EFD6CE00E7C6BD00634A31000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF70000840000B5CEB50000840000008400007BAD7B00F7EFF700F7EF
      F700F7EFF700F7EFF700007B0000003900000000000000000000000000000000
      00007B5AEF002900DE002900D6002900D6006B638C00DEDEDE00000000000000
      00000000000000000000000000000000000094948C008CC6EF007BBDEF008CC6
      D6003194D6008CC6D60073B5DE0084B5DE00F7EFE700C6B5A500C6B5A500C6B5
      A500C6B5A500C6B5A500FFF7EF008C8C7B00C6AD9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700F7F7EF00F7EFE70000840000EFDE
      D600EFDED600E7D6C600634A31000000000000840000F7EFF700F7EFF700EFEF
      EF009CC69C00B5C6B50000840000008C0000008C000000840000BDBDBD00F7EF
      F700F7EFF700F7EFF700007B0000003900000000000000000000000000000000
      0000CEC6D6002908DE002900DE004229C6007373730094949400D6D6D6000000
      0000000000000000000000000000000000009494840094CEF70018B5FF00299C
      DE0021D6F700299CDE0018B5FF008CBDE700FFFFFF00FFFFF700FFF7F700F7F7
      F700F7F7EF00F7EFE700FFFFF70094948C00C6ADA500FFFFFF00B5846300B584
      6300948C8C00C6B5A500948C8400948C8400FFF7F70000840000F7EFE7000084
      0000EFDEDE00EFDED600634A31000000000000840000F7EFF700F7EFF700ADCE
      AD00B5CEB50000840000008400000084000000840000008C000000840000A5A5
      A500F7EFF700F7EFF700007B000000390000000000000000000000000000CEC6
      D6003918CE002900DE00735ACE003108E7005A39D6007B7B8C0084848400C6C6
      C600000000000000000000000000000000008CA5AD009CD6EF00299CDE008CE7
      F700ADF7FF008CE7F700299CDE009CD6EF00A5C6C600B5B5AD00ADADA500ADAD
      A500ADADA500ADADA500BDBDB50000000000CEB5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF70000840000F7F7EF000084
      0000F7E7DE00EFE7DE00634A31000000000000840000F7EFF700B5CEB500BDCE
      BD0000840000008400005AAD5A00F7EFF700299C290000840000008C00000084
      0000D6CED600F7EFF700007B0000003900000000000000000000CEC6D6003918
      CE002900DE008C84BD0000000000000000004218E7004A29DE007B739C007B7B
      7B00B5B5B5000000000000000000000000004AA5DE00398CCE0021D6EF009CF7
      FF00EFFFFF009CF7FF0021D6EF00318CCE00429CE700FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB5A500FFFFFF00FFFFFF0063A5
      630063A5630063A56300C6B5AD0063A563000084000063A56300FFF7F700F7F7
      EF0000840000EFE7DE00634A31000000000000840000F7EFF7004AAD4A0052AD
      520052B5520073BD7300F7EFF700F7EFF700FFF7FF0063B5630052AD52003994
      390039A53900F7EFF700007B00000039000000000000BDBDC6003910CE002900
      DE007363B500000000000000000000000000000000005A42E7003108DE007B6B
      B5008C8C8C00DEDEDE000000000000000000F7FFFF00BDE7F700319CDE007BDE
      F7008CF7FF007BDEF70039A5DE0094CEF700C6E7FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFF700FFF7
      F70000840000F7EFE700634A31000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF7000084000000390000C6BDEF003910CE002900DE005A42
      B500000000000000000000000000000000000000000000000000947BEF002900
      DE00CECEE700000000000000000000000000FF00FF0084BDEF0021B5FF00399C
      DE0021CEEF00399CDE0021BDFF007BB5F700FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB5A500CEB5A500CEB5A500CEB5
      A500CEB5A500C6B5A500C6B5A500C6AD9C00C6AD9C00BDAD9C00BDAD9C00BDA5
      9400BDA5940000840000B5A594000000000000840000F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EFF700F7EF
      F700F7EFF700F7EFF70000840000003900004218E7002900DE004229C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF009CCEEF0094C6F700BDDE
      F7003994D600BDDEF70094C6F7009CCEEF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000084000000840000008400000084
      000000840000008400000084000000840000008400000084000000840000008C
      0000008C000000840000008400004AAD4A003110E7004A29E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00EFF7
      FF005AADEF00EFF7FF00FF00FF00FF00FF00FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000E3DEDB00AE988800B7A29300FDFCFB00FBF9F700FAF5F200F7EFED00F4EA
      E600F2E5DF00DDDCD700DFD7CE00DECDC000A6776BFFA6776BFFA6776BFFA576
      6BFFA5776AFFA4766AFFA27469FFA17368FF9F7066FF9D6F65FF9A6C64FF986A
      63FF986A63FF956761FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F1EF00E3DE
      DB00B7A29300FBF8F700B7A29300FFFFFF00B47F6500B47F6400EDDDD500B37E
      6300F4EBE600F1E5DF00EFDFD700EBD9D100AB7C6DFFFFDCBBFFDADAD6FFDAD8
      D3FFDCD4CDFFDBCFC7FFDCCCC1FFDCC8BFFFDEC3B7FFDEC2B5FFDEBFB0FFDEBE
      AEFFDEBEAEFF996A63FF00000000000000000000000000000000AC958400765C
      4900765C4900765C4900765C4900765C4900765C4900765C4900765C4900765C
      4900765C4900765C4900765C4900000000000000000000000000000000000000
      00009E8D80006349350063493500634935006349350063493500634935006349
      3500634935006349350000000000000000000000000000000000E3DEDB00AE98
      8800B7A29300FDFCFB00B9A49500FFFFFF00FFFFFF00FDFCFC00FCF9F700FAF4
      F200F6F0EC00F4EBE500F2E5DF00EEDFD800AB7C6DFFFFDCBBFFFFDCBBFFFFDD
      BBFFFFDCBBFFFFDCBAFFFFDCB8FFFFDBB6FFFFD9B3FFFFD8B1FFFFD7AFFFFFD5
      ABFFDEBEAEFF996A63FF00000000000000000000000000000000AC958400D9CB
      C000D9CBC000D9CBC000D9CBC000D9CBC000D9CBC000D9CBC000D9CBC000D9CB
      C000D9CBC000D9CBC000765C4900000000000000000000000000000000000000
      00009B8A7D00FCFAF800D9C0AE00D5BCAB00CFB7A600C8B1A000C1AB9B00BBA6
      9600B7A29300634935000000000000000000F3F1EF00E3DEDB00B7A29300FBF8
      F700B7A29300FFFFFF00BDA79800FFFFFF00968E8800EEDED700968E8700EDDD
      D600968D8600958C8500F4EBE600F2E5DF00B18171FFFFE1C2FFFFE1C2FFD3A4
      83FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFFFD7
      B0FFDEBEAEFF9C6D65FF00000000000000000000000000000000AC958400F8E8
      E000F7E5DC00F6E2D800F5DED30000925E00F3D9CB00F2D6C800F1D3C400F1D0
      C000F0CEBD00D9CBC000765C4900000000000000000000000000000000000000
      00009B8A7D00FEFEFE00FBF8F700F6F1ED00F1E8E100EBDED600E5D5C900E1CD
      BE00BCA59600634935000000000000000000E3DEDB00AE988800B7A29300FDFC
      FB00B9A49500FFFFFF00C1AB9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFC
      FC00FBF8F700FAF4F200F7F0EC00F4EAE600B78774FFFFE4C9FFFFE4C9FFFFE5
      CAFFFFE3C8FFFFE4C7FFFFE2C6FFFFE1C3FFFFDFBFFFFFDEBCFFFFDBB9FFFFD9
      B4FFDEBFB0FFA07167FF00000000000000000000000000000000AD978600F9EB
      E500F8E9E100F7E5DC0000925E00008D5D008FDBB6008FD8B300EBD6C500F2D3
      C400F1D0C200D9CBC000765C4900000000000000000000000000000000000000
      00009E8D8000FFFFFF00FEFDFD00FAF7F500F5EFEA00F0E6DF00EBDDD300E5D4
      C700C1AA9B00634935000000000000000000B7A29300FBF8F700B7A29300FFFF
      FF00BDA79800FFFFFF00C5AFA000FFFFFF00B4806500B4806500968E8800C2B0
      A300968E8700968E8600F9F4F200F7EFEC00BC8D77FFFFE8D0FFFFE8D0FFD3A4
      83FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FFFFDC
      B9FFDEC2B5FFA3756AFF00000000000000000000000000000000AF9A8900FAEF
      E900F9ECE50000925E0000925E0000925E0000925E0000925E0000925E00B0DC
      BE00F2D4C500D9CBC000765C4900000000000000000000000000000000000000
      0000A2918400FFFFFF00FFFFFF00FDFDFB00F9F5F300F4EDE800EFE4DC00E9DB
      D000C8B1A100634935000000000000000000B7A29300FDFCFB00B9A49500FFFF
      FF00C1AB9C00FFFFFF00C8B2A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFCFC00FCF8F700F9F5F200C3937AFFFFEBD8FFFFEBD8FFD3A4
      83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3A483FFFFDE
      BDFFDEC3B7FFA7786BFF00000000000000000000000000000000B29C8C00FBF2
      ED00FBF0EA00F9EDE70000925E0000925E00D5ECDE00F5E1D600D4E9D6000092
      5E00F3D7CA00D9CBC000765C4900000000000000000000000000000000000000
      0000A7958800FFFFFF00FFFFFF00FFFFFF00FCFBFA00F9F4F100F3ECE600EDE3
      DA00CFB7A600634935000000000000000000B7A29300FFFFFF00BDA79800FFFF
      FF00C5AFA000FFFFFF00C9B4A500FFFFFF00FFFFFF0066A3650066A3650066A3
      6500C0B4AD0066A3650066A3650066A26400C8987EFFFFEEDEFFFFEEDEFFD3A4
      83FFFFFFFFFF999999FF0030CCFF999FFFFF39518CFFFFFFFFFFD3A483FFFFE0
      C2FFDCC8BFFFAA7B6DFF00000000000000000000000000000000B59F8F00FCF5
      F200FBF2EF0072DEB700F9EDE70000925E00F8E7DF0000925E00F6E1D70072D7
      AB00F4DBCF00D9CBC000765C490000000000000000000000000000000000E79C
      7300C66B4200AD5A3100FFFFFF00FFFFFF00FFFFFF00FCFAF800F7F3EF00F2EA
      E400D5BCAB00634935000000000000000000B9A49500FFFFFF00C1AB9C00FFFF
      FF00C8B2A300FFFFFF00C8B2A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00CD9E81FFFFF2E5FFFFF2E5FFD3A4
      83FFFFFFFFFFFFFFFFFFCCECFFFFCCECFFFF999FFFFF39518CFFD3A483FFFFE3
      C6FFDCCCC1FFAE7F6FFF00000000000000000000000000000000B9A39300FDF8
      F500FCF6F20000925E00AFEBD600FAEDE800D3F3E70000925E0000925E00F6E1
      D800F5DFD300D9CBC000765C490000000000000000000000000000000000E79C
      7300CE734200AD5A3100FFFFFF00FFFFFF00FFFFFF00FFFEFE00FBF9F700F6F1
      ED00D9C0AE00634935000000000000000000BDA79800FFFFFF00C5AFA000FFFF
      FF00C9B4A500FFFFFF00C8B2A300CAB4A500CBB5A600CAB4A500C9B3A400C7B2
      A300C6B0A100C3AE9F00C1AC9D00BFAA9B00D3A283FFFFF5ECFFFFF5ECFFD3A4
      83FFFF3333FFFF3333FFCCECFFFF7A7EFFFF4E5FFFFF2352FFFF39518CFFFFE4
      CAFFDBCFC7FFB18171FF00000000000000000000000000000000BBA69700FEFA
      F800FDF8F600D3F5E70000925E0000925E0000925E0000925E00009663000092
      5E00F6E3D900D9CBC000765C490000000000000000000000000000000000EFA5
      7B00DE7B4A00CE734200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00C4AD
      9D00C3AB9C00644A36000000000000000000C1AB9C00FFFFFF00C8B2A300FFFF
      FF00C8B2A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFB00FBF9F700FAF4F200D7A786FFFFF9F1FFFFF9F1FFD3A4
      83FFD3A483FFD3A483FFD3A483FF999FFFFF7A7EFFFF4F5FFFFF2352FFFF3951
      8CFFDCD4CDFFB38471FF00000000000000000000000000000000BFAA9A00FEFC
      FC00FDFBFA00FDF9F700D3F5E700AFEBD6008EE3C70000925E0000925E00F9E9
      E200F6E3D900D9CBC000765C490000000000000000000000000000000000FFAD
      7B00EF845200DE7B4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9988A00644A
      3600644A3600644A36000000000000000000C5AFA000FFFFFF00C9B4A500FFFF
      FF00C8B2A300CAB4A500CBB5A600CAB4A500C9B3A400C7B2A300C6B0A100C3AE
      9F00C1AC9D00BFAA9B00BDA89900BBA69700DCAC89FFFFFAF6FFFFFAF6FFFFFB
      F7FFFFFBF6FFFFF9F3FFFFF7EEFFFFF4E9FF999FFFFF797DFFFF4E5FFFFF2353
      FFFF39518CFFB38471FF00000000000000000000000000000000C2AD9E00FFFE
      FE00FEFDFC00FEFBFA00FDF9F700FDF7F400FCF4F10000925E00FAEFEA00FAED
      E600D9CBC000D9CBC000765C49000000000000000000DED6CE00E79C7300FFB5
      8C00FF9C6B00F78C5A009C4A2900CECEC600FFFFFF00FFFFFF00AE9C8E00D4C5
      BA00644A3600D0CBC4000000000000000000C8B2A300FFFFFF00C8B2A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFC
      FB00FBF9F700FAF4F200F7F0ED00F3EAE400E0AF8BFFFFFDFAFFFFFDFAFFD3A4
      83FFD3A483FFD3A483FFD3A483FFD3A483FFD3A483FF999FFFFF7A7EFFFF4F5F
      FFFF2352FFFF39518CFF00000000000000000000000000000000C5B0A200FFFF
      FF00FFFFFF00FEFDFC00FEFCFA00FDF9F800FDF8F500FCF5F100FCF3EE00FAF0
      EB00765C4900765C4900765C4900000000000000000000000000DED6CE00FFC6
      A500FFB58C00E7845A00CECEC600FFFFFF00FFFFFF00FFFFFF00B2A09200644A
      3600D0CCC500000000000000000000000000C9B4A500FFFFFF00C8B2A300CAB4
      A500CBB5A600CAB4A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA
      9B00BDA89900BBA69700B9A49500B8A39400E3B28DFFFFFDFCFFFFFDFCFFFFFF
      FFFFFFFDFBFFFFFBF7FFFFF9F2FFFFF5ECFFFFF2E6FFFFEEDFFF999FFFFF7A7E
      FFFF4F5FFFFF2352FFFF39518CFF000000000000000000000000C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FFFCFB00FDFAF900FDF8F500FCF5F300967C
      6900F4DBCE00D1BAAF00765C490000000000000000000000000000000000DED6
      C600E7946B00CECEC600B6A49600B6A49600B6A49600B6A49600B5A39500D0CC
      C50000000000000000000000000000000000C8B2A300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FBF9F700FAF4
      F200F7F0ED00F3EAE400644A360000000000E4B48EFFE4B48EFFE7B68FFFE5B4
      8DFFE1B08BFFDDAC89FFD8A887FFD3A485FFCE9E81FFC9987EFFC3937AFF999F
      FFFF7A7EFFFF0030CCFF0030CCFF000000000000000000000000C9B6A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFD00FEFDFB00FDFBF900FDF9F600967C
      6900D1BAAF00AC95840000000000000000000000000000000000000000000000
      0000DED6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8B2A300CAB4A500CBB5A600CAB4
      A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA9B00BDA89900BBA6
      9700B9A49500B8A39400B7A29300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000034EFFFF034EFFFF0030CCFF000000000000000000000000CBB7A900C9B5
      A700C7B3A400C5B0A100C1AD9E00BFA99A00BBA69600B9A29300B69F8F00B29C
      8B00B09988000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BCC4CD0027313C00B7BEC300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7A2
      9300FFFFFF00B7A29300FFFFFF00BAA59600FFFFFF00FFFFFF00FFFFFF009A97
      8F00EDE9E400FDF7F300FCEFE800F9E5D9000000000000000000000000000000
      00009E8D80006349350063493500634935006349350063493500634935006349
      35006349350063493500000000000000000000000000B7A29300634935006349
      350063493500634935006349350063493500634935006349350063493500544A
      4600334C67003877BD002D486600BFC6CA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7A2930063493500B7A2
      9300FFFFFF00B7A29300FFFFFF00BEA99A00FFFFFF00FFFFFF00FFFFFF00A19E
      9600EBE9E500FFFCFB00FDF7F300FBF0E8000000000000000000000000000000
      00009B8A7D00FCFAF800D9C0AE00D5BCAB00CFB7A600C8B1A000C1AB9B00BBA6
      9600B7A2930063493500000000000000000000000000B7A29300FFFFFF00B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A293008C868500344D
      6800357FD0004198E40057B3ED004F677600F3F1EF00E3DEDB00927A69008C75
      630087705E00E3DEDB007F6654007A624F00755D4A00E3DEDB006E5441006A51
      3E00674E3A00E3DEDB00000000000000000000000000B7A29300FFFFFF00B7A2
      9300FFFFFF00BAA59600FFFFFF00C3AE9E00FFFFFF00FFFFFF00FFFFFF00C3C4
      BF00C2BFB900FFFFFF00FFFCFB00FDF7F3000000000000000000000000000000
      00009B8A7D00FEFEFE00FBF8F700F6F1ED00F1E8E100EBDED600E5D5C900E1CD
      BE00BCA5960063493500000000000000000000000000B7A29300FFFFFF00FFFF
      FF00FCFAF900F7F1EE00D7D7D400979792006C6A67006664620051575B004373
      930047A0E70061C6FD00738EA100D5DADD00E3DEDB00AE988800EFE3DD00F2E7
      E100EDDFD700836B5900B79B8B00DBBDAD00D9B7A60072594600AE8B7700D0A6
      9200CC9E8700654B3800E3DEDB000000000000000000B7A29300FFFFFF00B7A2
      9300FFFFFF00BEA99A00FFFFFF00C8B2A300FFFFFF00FFFFFF00FFFFFF00F6F8
      F800B8B8B200C4C2BC00ECEBE700EBE8E2000000000000000000000000000000
      00009E8D8000FFFFFF00FEFDFD00FAF7F500F5EFEA00F0E6DF00EBDDD300E5D4
      C700C1AA9B0063493500000000000000000000000000B7A29300FFFFFF00FFFF
      FF00FEFEFE00DFDFDE00938F8B00B4A89D00D7C3B000C8AE98007F766D005559
      57005D90A8007098B200B8C0C60000000000B7A29300FBF8F700F9F4F200F7F0
      EC00F4EBE600F1E5DF007F6754007A624F00765D4A00735946006E5542006B52
      3E00674E3A00654B3800634935000000000000000000B7A29300FFFFFF00BAA5
      9600FFFFFF00C3AE9E00FFFFFF00CCB6A700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6FAFB00C1C5C100A19F9700918D84000000000000000000000000000000
      0000A2918400FFFFFF00FFFFFF00FDFDFB00F9F5F300F4EDE800EFE4DC00E9DB
      D000C8B1A10063493500000000000000000000000000B7A29300FFFFFF00FFFF
      FF00FFFFFF00B3B2AE00BFB9B200FBEFE700FAE6D900F7DAC700F4CDB5007F77
      6D009D9D9C00B8C0C6000000000000000000B7A29300FDFCFB00FBF9F700FAF5
      F200F7EFED00F4EAE600F2E5DF00DDDCD700DFD7CE00DECDC000DEC5B600DEBF
      AC00DBBAA600D8B5A300634935000000000000000000B7A29300FFFFFF00BEA9
      9A00FFFFFF00C8B2A300FFFFFF00D1BBAB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B7A29300644A36000000000000000000000000000000
      0000A7958800FFFFFF00FFFFFF00FFFFFF00FCFBFA00F9F4F100F3ECE600EDE3
      DA00CFB7A60063493500000000000000000000000000BAA59600FFFFFF00FFFF
      FF00FFFFFF009A978F00EDE9E400FDF7F300FCEFE800F9E5D900F7D9C800C8AD
      99006D6D6A00000000000000000000000000B7A29300FFFFFF00B47F6500B47F
      6400EDDDD500B37E6300F4EBE600F1E5DF00EFDFD700EBD9D100E8D3C900E5CD
      C100E1C6B900D6B3A100634A35000000000000000000BAA59600FFFFFF00C3AE
      9E00FFFFFF00CCB6A700FFFFFF00D5BFAF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B9A49500D4C5BA000000000000000000000000000000
      0000AB9A8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFAF800F7F3EF00F2EA
      E400D5BCAB0063493500000000000000000000000000BEA99A00FFFFFF00FFFF
      FF00FFFFFF00A19E9600EBE9E500FFFCFB00FDF7F300FBF0E800FAE5D900D8C3
      B30072726E00000000000000000000000000B9A49500FFFFFF00FFFFFF00FDFC
      FC00FCF9F700FAF4F200F6F0EC00F4EBE500F2E5DF00EEDFD800EBD9D000E8D3
      C800E5CCC100DBBDAD00634A36000000000000000000BEA99A00FFFFFF00C8B2
      A300FFFFFF00D1BBAB00FFFFFF00D8C2B200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0AB9C00644A36000000000000000000000000000000
      0000B09E9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FBF9F700F6F1
      ED00D9C0AE0063493500000000000000000000000000C3AE9E00FFFFFF00FFFF
      FF00FFFFFF00C3C4BF00C2BFB900FFFFFF00FFFCFB00FDF7F300FCEEE600AA9E
      9300AFABA700000000000000000000000000BDA79800FFFFFF00968E8800EEDE
      D700968E8700EDDDD600968D8600958C8500F4EBE600F2E5DF00EFDFD800ECD9
      D000E8D3C900E0C7BA00634A35000000000000000000C3AE9E00FFFFFF00CCB6
      A700FFFFFF00D5BFAF00FFFFFF00D8C2B200D8C2B200D8C2B200D8C2B200D8C2
      B200D4BEAE00CFB9A900C9B3A400E2D6CD000000000070C7E10081D8EE0086E6
      FA0039BEE50099D8DF0091E1F60081D0E900FFFFFF00FFFFFF00FEFEFD00C4AD
      9D00C3AB9C00644A3600000000000000000000000000C8B2A300FFFFFF00FFFF
      FF00FFFFFF00F6F8F800B8B8B200C4C2BC00ECEBE700EBE8E200B2AEA400756C
      6300F7F6F500000000000000000000000000C1AB9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFCFC00FBF8F700FAF4F200F7F0EC00F4EAE600F1E5DF00EEDF
      D700EBD9D000E6D1C600634A35000000000000000000C8B2A300FFFFFF00D1BB
      AB00FFFFFF00D8C2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0AB9C00644A3600E2D6CD00000000000000000098E2F30031B7DF007DE9
      FD005DC6E60093F0FF002FB6DF00A0E8F900FFFFFF00FFFFFF00A9988A00644A
      3600644A3600644A3600000000000000000000000000CCB6A700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6FAFB00C1C5C100A19F9700918D840095918800634D
      3C0000000000000000000000000000000000C5AFA000FFFFFF00B4806500B480
      6500968E8800C2B0A300968E8700968E8600F9F4F200F7EFEC00F4EBE600F2E5
      DF00EFDFD800EADBD100634936000000000000000000CCB6A700FFFFFF00D5BF
      AF00FFFFFF00D8C2B200D8C2B200D8C2B200D8C2B200D8C2B200D4BEAE00CFB9
      A900C9B3A400E2D6CD0000000000000000000000000094EAFA0093F1FF00BFF8
      FF00AFE8F400C7FBFF0093F1FF009FF0FF00FFFFFF00FFFFFF00AE9C8E00D4C5
      BA00644A3600D0CBC400000000000000000000000000D1BBAB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7A29300644A3600644A3600644A
      360000000000000000000000000000000000C8B2A300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFCFC00FCF8F700F9F5F200F7F0EC00F4EB
      E600F1E5DF00EEE2DA00644A36000000000000000000D1BBAB00FFFFFF00D8C2
      B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0AB9C00644A
      3600E2D6CD000000000000000000000000000000000022ABD90053BFE100AFE8
      F400F0FFFD00B4EBF60053BFE10036BBE500FFFFFF00FFFFFF00B2A09200644A
      3600D0CCC50000000000000000000000000000000000D5BFAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49500D4C5BA00644A3600E1D5
      CD0000000000000000000000000000000000C9B4A500FFFFFF00FFFFFF0066A3
      650066A3650066A36500C0B4AD0066A3650066A3650066A26400FAF5F200F7F0
      EC00F4EBE600EEE2DA00644A36000000000000000000D5BFAF00FFFFFF00D8C2
      B200D8C2B200D8C2B200D8C2B200D8C2B200D4BEAE00CFB9A900C9B3A400E2D6
      CD00000000000000000000000000000000000000000094EAFA0096F3FF00C7FB
      FF00ADE5F300C3FBFF0096F3FF008BD7E200B6A49600B6A49600B5A39500D0CC
      C5000000000000000000000000000000000000000000D8C2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0AB9C00644A3600E2D6CD000000
      000000000000000000000000000000000000C8B2A300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FBF9F700FAF4
      F200F7F0ED00F3EAE400644A36000000000000000000D8C2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0AB9C00644A3600E2D6CD000000
      0000000000000000000000000000000000000000000096E1F30032B8E0008CF1
      FF0058C2E30090F1FF002FB6DF008DDDF0000000000000000000000000000000
      00000000000000000000000000000000000000000000D8C2B200D8C2B200D8C2
      B200D8C2B200D8C2B200D4BEAE00CFB9A900C9B3A400E2D6CD00000000000000
      000000000000000000000000000000000000C8B2A300CAB4A500CBB5A600CAB4
      A500C9B3A400C7B2A300C6B0A100C3AE9F00C1AC9D00BFAA9B00BDA89900BBA6
      9700B9A49500B8A39400B7A293000000000000000000D8C2B200D8C2B200D8C2
      B200D8C2B200D8C2B200D4BEAE00CFB9A900C9B3A400E2D6CD00000000000000
      0000000000000000000000000000000000000000000066C3E00081D8EE0094EA
      FA0026AFDB008CE8FA008EDEF10081CCE3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C001FFFFFFFF0000
      C001000300030000C001000100010000C001000100010000C001000100010000
      C001000100010000C001000100010000C001000100010000C001000100010000
      C001000100010000C001000100010000C001000100010000C001000100000000
      C003000100000000C007FFFFFFF80000FFFFFC00FFFF8000FFFF0000FFFF0000
      000300008FE300000001000007C30000000100000387000000010000810F0000
      00010000C01F000000010000E03F000000010000F03F000000010000F01F0000
      00010000E00F000100010000C30700000001000087830000000100000FC70000
      000100001FFF0000FFFB00003FFF0000F0000000FFFFFFFFC0000000C001F003
      C0000000C001F00300000000C001F00300000000C001F00300000000C001F003
      00000000C001F00300000000C001E00300000000C001E00300000000C001E003
      00000000C001E00300000000C001800300000000C001C00700000000C001E00F
      00010000C003F7FF00010000C007FFFFFFFFFFF1FFFFE000F0038000FFFF8000
      F003800000038000F003800000018000F003800100018000F003800300018000
      F003800700018000F003800700018000F0038007000180008003800700018001
      8003800F000180038003800F000180078007800F0001800F800F801F0001801F
      80FF803F0001803F80FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ilMain
    Left = 153
    Top = 137
    object actPrntGroup: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Excel'
    end
    object actCloseNapr: TAction
      Category = 'Napr'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 8
      OnExecute = actCloseNaprExecute
      OnUpdate = actCloseNaprUpdate
    end
    object actPrintNapr: TAction
      Category = 'Napr'
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100'  '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100'  '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = actPrintNaprExecute
      OnUpdate = actPrintNaprUpdate
    end
    object actDelNapr: TAction
      Category = 'Napr'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 10
      OnExecute = actDelNaprExecute
      OnUpdate = actDelNaprUpdate
    end
    object actRefreshNaprList: TAction
      Category = 'Napr'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1082#1086#1082' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1081
      ImageIndex = 12
      OnExecute = actRefreshNaprListExecute
    end
    object actPrintEmptyNapr: TAction
      Category = 'Napr'
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1091#1089#1090#1086#1084' '#1073#1083#1072#1085#1082#1077
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1091#1089#1090#1086#1084' '#1073#1083#1072#1085#1082#1077
      ImageIndex = 13
      OnExecute = actPrintEmptyNaprExecute
      OnUpdate = actPrintNaprUpdate
    end
    object actItogiFacToExc: TAction
      Category = 'Itogi'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1080#1090#1086#1075#1086#1074' '#1087#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091' '#1074' MS Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1080#1090#1086#1075#1086#1074' '#1087#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091' '#1074' MS Excel'
      ImageIndex = 9
      OnExecute = actItogiFacToExcExecute
    end
    object actItogiToExc: TAction
      Category = 'Itogi'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1073#1097#1080#1093' '#1080#1090#1086#1075#1086#1074' '#1074' MS Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1086#1073#1097#1080#1093' '#1080#1090#1086#1075#1086#1074' '#1074' MS Excel'
      ImageIndex = 9
      OnExecute = actItogiToExcExecute
    end
    object actAcademToExcel: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 9
      OnExecute = actAcademToExcelExecute
    end
    object actEditNapr: TAction
      Category = 'Napr'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 14
      OnExecute = actEditNaprExecute
      OnUpdate = actPrintNaprUpdate
    end
  end
  object ppmFacNapr: TPopupMenu
    Images = ilMain
    Left = 216
    Top = 184
    object N2: TMenuItem
      Action = actRefreshNaprList
    end
    object actPrintEmptyNapr1: TMenuItem
      Action = actPrintEmptyNapr
    end
    object actPrintNapr1: TMenuItem
      Action = actPrintNapr
    end
    object actCloseNapr1: TMenuItem
      Action = actCloseNapr
    end
    object N1: TMenuItem
      Action = actDelNapr
    end
  end
  object pmItogi: TPopupMenu
    Images = ilMain
    Left = 352
    Top = 128
    object MSExcel1: TMenuItem
      Action = actItogiFacToExc
    end
    object MSExcel2: TMenuItem
      Action = actItogiToExc
    end
  end
end
