inherited fmUchPlan: TfmUchPlan
  Width = 805
  Height = 666
  Font.Name = 'MS Sans Serif'
  ParentFont = False
  ExplicitWidth = 805
  ExplicitHeight = 666
  inherited Panel1: TPanel
    Width = 805
    Height = 666
    BevelInner = bvNone
    BevelOuter = bvNone
    ExplicitWidth = 805
    ExplicitHeight = 666
    object Panel3: TPanel
      Left = 0
      Top = 22
      Width = 805
      Height = 644
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'Panel3'
      TabOrder = 0
      object ScrollBox1: TScrollBox
        Left = 1
        Top = 1
        Width = 803
        Height = 642
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        DesignSize = (
          803
          642)
        object Bevel1: TBevel
          Left = 0
          Top = 81
          Width = 800
          Height = 7
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 678
        end
        object Bevel2: TBevel
          Left = 0
          Top = 160
          Width = 800
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 799
        end
        object Label1: TLabel
          Left = 115
          Top = 8
          Width = 3
          Height = 13
          Alignment = taRightJustify
        end
        object Label16: TLabel
          Left = 30
          Top = 30
          Width = 89
          Height = 13
          Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103':'
        end
        object Label2: TLabel
          Left = 36
          Top = 54
          Width = 82
          Height = 13
          Caption = #1043#1086#1076' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103':'
        end
        object Label3: TLabel
          Left = 34
          Top = 91
          Width = 86
          Height = 13
          Caption = #1062#1080#1082#1083' '#1076#1080#1089#1094#1080#1087#1083#1080#1085':'
        end
        object Bevel6: TBevel
          Left = -2
          Top = 190
          Width = 800
          Height = 2
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
          ExplicitWidth = 799
        end
        object Label4: TLabel
          Left = 25
          Top = 115
          Width = 95
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072' '#1076#1080#1089#1094#1080#1087#1083#1080#1085':'
        end
        object Label29: TLabel
          Left = 74
          Top = 168
          Width = 47
          Height = 13
          Caption = #1057#1077#1084#1077#1089#1090#1088':'
        end
        object Label30: TLabel
          Left = 35
          Top = 65
          Width = 56
          Height = 13
          Caption = #1074' '#1076#1077#1081#1089#1090#1074#1080#1077
        end
        object Label31: TLabel
          Left = 286
          Top = 168
          Width = 66
          Height = 13
          Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1103':'
        end
        object Label36: TLabel
          Left = 262
          Top = 58
          Width = 101
          Height = 13
          Caption = #1044#1072#1090#1072' '#1091#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103' :'
        end
        object Label37: TLabel
          Left = 7
          Top = 139
          Width = 114
          Height = 13
          Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' '#1076#1080#1089#1094#1080#1087#1083#1080#1085':'
        end
        object Panel2: TPanel
          Left = 0
          Top = 192
          Width = 802
          Height = 448
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 204
            Top = 0
            Height = 448
            ExplicitTop = 25
            ExplicitHeight = 462
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 204
            Height = 448
            Align = alLeft
            BevelOuter = bvNone
            Constraints.MinWidth = 200
            TabOrder = 0
            DesignSize = (
              204
              448)
            object Label5: TLabel
              Left = 5
              Top = 6
              Width = 68
              Height = 13
              Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1099':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbgDisc: TDBGridEh
              Left = 5
              Top = 28
              Width = 197
              Height = 420
              AllowedOperations = []
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoFitColWidths = True
              DataSource = dsDisc
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
              Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = PopupMenu1
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGreen
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleHeight = 20
              OnDblClick = dbgDiscDblClick
              OnKeyDown = dbgDiscKeyDown
            end
          end
          object Panel6: TPanel
            Left = 207
            Top = 0
            Width = 595
            Height = 448
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            DesignSize = (
              595
              448)
            object ScrollBox2: TScrollBox
              Left = 1
              Top = 0
              Width = 595
              Height = 448
              Anchors = [akLeft, akTop, akRight, akBottom]
              BorderStyle = bsNone
              TabOrder = 0
              OnResize = ScrollBox2Resize
              object sgDisc: TStringGrid
                Left = 0
                Top = 178
                Width = 429
                Height = 149
                Color = clBtnFace
                ColCount = 3
                DefaultColWidth = 150
                DefaultRowHeight = 18
                FixedCols = 0
                RowCount = 27
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goTabs]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnMouseMove = sgDiscMouseMove
                ColWidths = (
                  153
                  73
                  139)
              end
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 553
                Height = 172
                BevelOuter = bvNone
                Constraints.MinWidth = 360
                TabOrder = 1
                object Bevel4: TBevel
                  Left = 2
                  Top = 141
                  Width = 177
                  Height = 9
                  Shape = bsTopLine
                end
                object Bevel5: TBevel
                  Left = 0
                  Top = 84
                  Width = 177
                  Height = 9
                  Shape = bsTopLine
                end
                object Label10: TLabel
                  Left = 80
                  Top = 36
                  Width = 3
                  Height = 13
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  OnMouseMove = Label10MouseMove
                end
                object Label11: TLabel
                  Left = 82
                  Top = 60
                  Width = 3
                  Height = 13
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 5
                  Top = 96
                  Width = 131
                  Height = 13
                  Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074':'
                end
                object Label13: TLabel
                  Left = 210
                  Top = 36
                  Width = 111
                  Height = 13
                  Caption = #1051#1077#1082#1094#1080#1086#1085#1085#1099#1077' '#1079#1072#1085#1103#1090#1080#1103':'
                end
                object Label14: TLabel
                  Left = 199
                  Top = 56
                  Width = 122
                  Height = 13
                  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1099#1077' '#1079#1072#1085#1103#1090#1080#1103':'
                end
                object Label15: TLabel
                  Left = 202
                  Top = 76
                  Width = 119
                  Height = 13
                  Caption = #1055#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1079#1072#1085#1103#1090#1080#1103':'
                end
                object Label17: TLabel
                  Left = 162
                  Top = 96
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label18: TLabel
                  Left = 326
                  Top = 36
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label19: TLabel
                  Left = 187
                  Top = 116
                  Width = 134
                  Height = 13
                  Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' '#1079#1072#1085#1103#1090#1080#1103':'
                end
                object Label20: TLabel
                  Left = 297
                  Top = 136
                  Width = 24
                  Height = 13
                  Caption = #1057#1056#1057':'
                end
                object Label21: TLabel
                  Left = 326
                  Top = 56
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 326
                  Top = 76
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label23: TLabel
                  Left = 326
                  Top = 116
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label24: TLabel
                  Left = 326
                  Top = 136
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label25: TLabel
                  Left = 194
                  Top = 96
                  Width = 127
                  Height = 13
                  Caption = #1042#1089#1077#1075#1086' '#1072#1091#1076#1080#1090#1086#1088#1085#1099#1093' '#1095#1072#1089#1086#1074':'
                end
                object Label26: TLabel
                  Left = 326
                  Top = 96
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 5
                  Top = 6
                  Width = 147
                  Height = 13
                  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1077':'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGreen
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 23
                  Top = 36
                  Width = 53
                  Height = 13
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 44
                  Top = 60
                  Width = 32
                  Height = 13
                  Caption = #1064#1080#1092#1088':'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label9: TLabel
                  Left = 5
                  Top = 148
                  Width = 163
                  Height = 13
                  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1074#1080#1076#1072#1084' '#1079#1072#1085#1103#1090#1080#1081':'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGreen
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Bevel3: TBevel
                  Left = 0
                  Top = 28
                  Width = 361
                  Height = 9
                  Shape = bsTopLine
                end
                object Label32: TLabel
                  Left = 5
                  Top = 115
                  Width = 151
                  Height = 13
                  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1095#1077#1090#1085#1099#1093' '#1077#1076#1080#1085#1080#1094':'
                end
                object Label33: TLabel
                  Left = 162
                  Top = 116
                  Width = 6
                  Height = 13
                  Caption = '0'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label34: TLabel
                  Left = 367
                  Top = 36
                  Width = 71
                  Height = 13
                  Caption = #1050#1086#1084#1087#1077#1090#1077#1085#1094#1080#1080':'
                end
                object Label35: TLabel
                  Left = 367
                  Top = 56
                  Width = 3
                  Height = 13
                  Caption = '-'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
            end
          end
        end
        object dbcbSpclz: TDBLookupComboboxEh
          Left = 126
          Top = 5
          Width = 662
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Visible = True
          OnKeyValueChanged = dbcbSpclzKeyValueChanged
        end
        object dbcbFormEd: TDBLookupComboboxEh
          Left = 126
          Top = 30
          Width = 283
          Height = 19
          EditButtons = <>
          Flat = True
          TabOrder = 2
          Visible = True
          OnKeyValueChanged = dbcbFormEdKeyValueChanged
        end
        object dbcbYear: TDBLookupComboboxEh
          Left = 126
          Top = 56
          Width = 123
          Height = 19
          EditButtons = <>
          Flat = True
          TabOrder = 3
          Visible = True
          OnKeyValueChanged = dbcbYearKeyValueChanged
        end
        object dbcbCklDisc: TDBLookupComboboxEh
          Left = 126
          Top = 88
          Width = 670
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = True
          OnKeyValueChanged = dbcbCklDiscKeyValueChanged
        end
        object dbcbGrpDisc: TDBLookupComboboxEh
          Left = 126
          Top = 113
          Width = 670
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Visible = True
          OnKeyValueChanged = dbcbCklDiscKeyValueChanged
        end
        object Panel8: TPanel
          Left = 184
          Top = 5
          Width = 209
          Height = 65
          BevelInner = bvLowered
          TabOrder = 6
          Visible = False
          object Label27: TLabel
            Left = 8
            Top = 10
            Width = 48
            Height = 13
            Caption = #1050#1072#1092#1077#1076#1088#1072':'
          end
          object SpeedButton1: TSpeedButton
            Left = 71
            Top = 33
            Width = 73
            Height = 25
            Cursor = crHandPoint
            Action = actLoadSelection
            Flat = True
          end
          object SpeedButton2: TSpeedButton
            Left = 136
            Top = 32
            Width = 65
            Height = 25
            Cursor = crHandPoint
            Caption = #1054#1090#1084#1077#1085#1072
            Flat = True
            OnClick = SpeedButton2Click
          end
          object dbcbKaf: TDBLookupComboboxEh
            Left = 64
            Top = 8
            Width = 137
            Height = 19
            EditButtons = <>
            Flat = True
            TabOrder = 0
            Visible = True
          end
        end
        object cmbxSem: TDBComboBoxEh
          Left = 127
          Top = 167
          Width = 80
          Height = 19
          Hint = #1053#1086#1084#1077#1088' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
          EditButtons = <>
          Flat = True
          Items.Strings = (
            #1042#1089#1077
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Visible = True
          OnChange = dbcbCklDiscKeyValueChanged
        end
        object cmbxVidZan: TDBComboBoxEh
          Left = 358
          Top = 167
          Width = 279
          Height = 19
          Hint = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1103', '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1086#1090#1073#1088#1072#1078#1072#1077#1090#1089#1103
          EditButtons = <>
          Flat = True
          Items.Strings = (
            #1074#1089#1077
            #1069#1082#1079#1072#1084#1077#1085#1099
            #1047#1072#1095#1077#1090#1099
            #1050#1055
            #1050#1056
            #1056#1043#1056
            #1056#1077#1092#1077#1088#1072#1090#1099
            #1050#1086#1085#1090#1088#1086#1083#1100#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
            #1040#1090#1090#1077#1089#1090#1072#1094#1080#1103
            #1055#1088#1072#1082#1090#1080#1082#1072
            #1083#1077#1082#1094#1080#1080
            #1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1099#1077
            #1087#1088#1072#1082#1090#1080#1082#1080)
          KeyItems.Strings = (
            '0'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '33'
            '27'
            '3'
            '4'
            '5')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Visible = True
          OnChange = dbcbCklDiscKeyValueChanged
        end
        object cbBRS: TCheckBox
          Left = 510
          Top = 58
          Width = 151
          Height = 17
          Action = actBRS
          TabOrder = 9
          Visible = False
        end
        object dtpDateUtv: TDateTimePicker
          Left = 369
          Top = 54
          Width = 128
          Height = 21
          Date = 0.508695752316271000
          Time = 0.508695752316271000
          Enabled = False
          TabOrder = 10
        end
      end
      object dbcbPdgrpDisc: TDBLookupComboboxEh
        Left = 126
        Top = 139
        Width = 671
        Height = 19
        EditButtons = <>
        Flat = True
        TabOrder = 1
        Visible = True
        OnKeyValueChanged = dbcbCklDiscKeyValueChanged
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 805
      Height = 22
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 805
        Height = 22
        AutoSize = True
        Caption = 'ToolBar1'
        Images = ImageList1
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = ActionAddUchPlan
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          HelpType = htKeyword
          Action = ActionEditUchPlan
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton8: TToolButton
          Left = 46
          Top = 0
          HelpType = htKeyword
          Action = ActionRemUchPlan
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton3: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton7: TToolButton
          Left = 77
          Top = 0
          Action = ActionAddDisc
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton9: TToolButton
          Left = 100
          Top = 0
          Action = ActionEditDisc
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton10: TToolButton
          Left = 123
          Top = 0
          Action = ActionRemDisc
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton6: TToolButton
          Left = 146
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 154
          Top = 0
          Action = ActionSemLength
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton11: TToolButton
          Left = 177
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 185
          Top = 0
          Action = actExport
          DropdownMenu = PopupMenu2
          ImageIndex = 7
          ParentShowHint = False
          ShowHint = True
          Style = tbsDropDown
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 535
    Width = 683
    Align = alNone
    Visible = False
    ExplicitTop = 535
    ExplicitWidth = 683
    DesignSize = (
      683
      37)
    inherited bbSave: TBitBtn
      Left = 513
      ExplicitLeft = 513
    end
    inherited bbUndo: TBitBtn
      Left = 127
      ExplicitLeft = 127
    end
  end
  object Panel9: TPanel
    Left = 289
    Top = 431
    Width = 337
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object Label28: TLabel
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
  object ImageList1: TImageList
    Left = 520
    Top = 32
    Bitmap = {
      494C010108000C00080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object actList: TActionList
    Images = ImageList1
    Left = 488
    Top = 32
    object ActionAddUchPlan: TAction
      Tag = 1
      Caption = 'ActionAddUchPlan'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
      ImageIndex = 3
      ShortCut = 16455
      OnExecute = ActionEditUchPlanExecute
      OnUpdate = ActionAddUchPlanUpdate
    end
    object ActionEditUchPlan: TAction
      Tag = 2
      Caption = 'ActionEditUchPlan'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
      ImageIndex = 0
      ShortCut = 16456
      OnExecute = ActionEditUchPlanExecute
      OnUpdate = ActionRemUchPlanUpdate
    end
    object ActionRemUchPlan: TAction
      Caption = 'ActionRemUchPlan'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
      ImageIndex = 5
      ShortCut = 16457
      OnExecute = ActionRemUchPlanExecute
      OnUpdate = ActionRemUchPlanUpdate
    end
    object ActionAddDisc: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1074' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
      ImageIndex = 1
      ShortCut = 16458
      OnExecute = ActionAddDiscExecute
      OnUpdate = ActionRemUchPlanUpdate
    end
    object ActionEditDisc: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1074' '#1091#1095#1077#1073#1085#1086#1084' '#1087#1083#1072#1085#1077'...'
      ImageIndex = 6
      ShortCut = 16459
      OnExecute = ActionEditDiscExecute
      OnUpdate = ActionRemDiscUpdate
    end
    object ActionRemDisc: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1080#1079' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
      ImageIndex = 4
      ShortCut = 16460
      OnExecute = ActionRemDiscExecute
      OnUpdate = ActionRemDiscUpdate
    end
    object ActionSemLength: TAction
      Caption = 'ActionSemLength'
      Hint = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1089#1077#1084#1077#1089#1090#1088#1086#1074' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072'...'
      ImageIndex = 2
      ShortCut = 16461
      OnExecute = ActionSemLengthExecute
      OnUpdate = ActionRemUchPlanUpdate
    end
    object actLoadSelection: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1042#1099#1073#1086#1088#1082#1072' '#1080#1079' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1072#1084
      OnExecute = actLoadSelectionExecute
      OnUpdate = actLoadSelectionUpdate
    end
    object actExport: TAction
      Caption = 'actExport'
      Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085' '#1074' MS Excel'
      ImageIndex = 8
      ShortCut = 16462
      OnExecute = actExportExecute
      OnUpdate = ActionRemUchPlanUpdate
    end
    object actBRS: TAction
      Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1087#1083#1072#1085#1086#1084' '#1041#1056#1057
      OnExecute = actBRSExecute
      OnUpdate = actBRSUpdate
    end
    object actFgosApp3: TAction
      Caption = 
        #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' 3. '#1057#1086#1089#1090#1072#1074', '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1080' '#1089#1086#1076#1077#1088#1078#1072#1090#1077#1083#1100#1085#1086'-'#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1089#1074#1103#1079 +
        #1080
      ImageIndex = 7
      OnExecute = actFgosApp3Execute
      OnUpdate = actFgosApp3Update
    end
    object actFgosApp5: TAction
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' 5. '#1050#1072#1083#1077#1085#1076#1072#1088#1085#1099#1081' '#1091#1095#1077#1073#1085#1099#1081' '#1075#1088#1072#1092#1080#1082
      ImageIndex = 7
      OnExecute = actFgosApp5Execute
      OnUpdate = actFgosApp5Update
    end
    object actFgosApp12: TAction
      Caption = 'actFgosApp12'
      ImageIndex = 7
      OnExecute = actFgosApp12Execute
      OnUpdate = actFgosApp12Update
    end
  end
  object dsSemLength: TDataSource
    Left = 523
    Top = 74
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 210
    Top = 177
    object N2: TMenuItem
      Action = ActionEditDisc
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1074' '#1091#1095#1077#1073#1085#1086#1084' '#1087#1083#1072#1085#1077'...'
      Default = True
    end
    object N1: TMenuItem
      Action = ActionAddDisc
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1074' '#1091#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085'...'
    end
    object N3: TMenuItem
      Action = ActionRemDisc
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1091' '#1080#1079' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
    end
  end
  object dsDisc: TDataSource
    DataSet = dm.aspGetDiscplines
    OnDataChange = dsDiscDataChange
    Left = 728
    Top = 408
  end
  object dsDiscZE: TDataSource
    DataSet = dmFgos.aspGetDiscZE
    Left = 680
    Top = 224
  end
  object dsDiscExceptionZE: TDataSource
    DataSet = dmFgos.aspGetDiscExceptionZE
    Left = 728
    Top = 224
  end
  object dsGetFgosBySpec: TDataSource
    DataSet = dmFgos.aspGetFgosBySpec
    Left = 592
    Top = 248
  end
  object PopupMenu2: TPopupMenu
    Left = 432
    object N31: TMenuItem
      Action = actFgosApp3
    end
    object actExport1: TMenuItem
      Action = actExport
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' 4. '#1059#1095#1077#1073#1085#1099#1081' '#1087#1083#1072#1085
    end
    object N4: TMenuItem
      Action = actFgosApp5
    end
    object actFgosApp121: TMenuItem
      Action = actFgosApp12
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' 12. '#1052#1072#1090#1088#1080#1094#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1081
    end
  end
  object dsGetDataTitle: TDataSource
    DataSet = dmFgos.aspGetDataTitle
    Left = 656
    Top = 296
  end
  object dsGetAllDiscFgos: TDataSource
    Left = 672
    Top = 352
  end
  object dsGetAllComp: TDataSource
    Left = 712
    Top = 352
  end
  object dsComp_Disc: TDataSource
    Left = 752
    Top = 344
  end
end
