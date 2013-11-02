inherited fmSheduleDep: TfmSheduleDep
  Height = 587
  ExplicitHeight = 587
  inherited Panel1: TPanel
    Height = 587
    ExplicitHeight = 587
    object Bevel6: TBevel
      Left = 2
      Top = 2
      Width = 741
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 6
      Width = 741
      Height = 579
      ActivePage = TabSheet3
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = ImageList2
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1040#1091#1076#1080#1090#1086#1088#1085#1099#1081' '#1092#1086#1085#1076
        ImageIndex = 1
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 26
          Width = 733
          Height = 521
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsRoomFond
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
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Cname_room'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088' '#1072#1091#1076#1080#1090#1086#1088#1080#1080
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'CName_campus'
              Footers = <>
              Title.Caption = #1050#1086#1088#1087#1091#1089
              Width = 104
            end
            item
              EditButtons = <>
              FieldName = 'iSeatCount'
              Footers = <>
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1077#1089#1090
              Width = 99
            end
            item
              EditButtons = <>
              FieldName = 'cName_room_type'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1072#1091#1076#1080#1090#1086#1088#1080#1080
              Width = 111
            end>
        end
        object ToolBar8: TToolBar
          Left = 0
          Top = 0
          Width = 733
          Height = 26
          ButtonWidth = 173
          Caption = 'ToolBar8'
          Images = ImageList1
          List = True
          ParentShowHint = False
          AllowTextButtons = True
          ShowHint = True
          TabOrder = 1
          object ToolButton4: TToolButton
            Left = 0
            Top = 0
            Action = actLoadPrevPeriodList
            Style = tbsTextButton
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103
        ImageIndex = 2
        object Bevel5: TBevel
          Left = 0
          Top = 522
          Width = 733
          Height = 4
          Align = alBottom
          Shape = bsSpacer
          ExplicitLeft = -3
          ExplicitTop = 523
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 733
          Height = 522
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel9'
          TabOrder = 0
          object PageControl2: TPageControl
            Left = 1
            Top = 1
            Width = 731
            Height = 520
            ActivePage = tsUseRoomFundConstraint
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsTeacherWorkConstraint: TTabSheet
              Caption = 'tsTeacherWorkConstraint'
              TabVisible = False
              DesignSize = (
                723
                510)
              object Label2: TLabel
                Left = 2
                Top = 2
                Width = 82
                Height = 13
                Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object dbcbCTeachers: TDBLookupComboboxEh
                Left = 92
                Top = 0
                Width = 630
                Height = 19
                AlwaysShowBorder = True
                Anchors = [akLeft, akTop, akRight]
                EditButtons = <>
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Flat = True
                ParentFont = False
                TabOrder = 0
                Visible = True
                OnKeyValueChanged = dbcbCTeachersKeyValueChanged
              end
              object Panel3: TPanel
                Left = 2
                Top = 25
                Width = 720
                Height = 478
                Anchors = [akLeft, akTop, akRight, akBottom]
                BevelOuter = bvNone
                TabOrder = 1
                object Splitter1: TSplitter
                  Left = 0
                  Top = 233
                  Width = 720
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                  ExplicitLeft = 1
                  ExplicitTop = 193
                  ExplicitWidth = 268
                end
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 720
                  Height = 233
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Bevel2: TBevel
                    Left = 0
                    Top = 203
                    Width = 720
                    Height = 4
                    Align = alBottom
                    Shape = bsSpacer
                    ExplicitTop = 200
                  end
                  object Panel6: TPanel
                    Left = 0
                    Top = 207
                    Width = 720
                    Height = 26
                    Align = alBottom
                    BevelKind = bkFlat
                    BevelOuter = bvNone
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object ToolBar5: TToolBar
                      Left = 432
                      Top = 0
                      Width = 284
                      Height = 22
                      Align = alRight
                      ButtonWidth = 139
                      Caption = 'ToolBar4'
                      Images = ImageList1
                      List = True
                      ShowCaptions = True
                      AllowTextButtons = True
                      TabOrder = 0
                      object ToolButton13: TToolButton
                        Left = 0
                        Top = 0
                        Cursor = crHandPoint
                        Action = actCTUndoChanges
                        Style = tbsTextButton
                      end
                      object ToolButton14: TToolButton
                        Left = 140
                        Top = 0
                        Cursor = crHandPoint
                        Action = actCTSaveChanges
                        Style = tbsTextButton
                      end
                    end
                    object ToolBar6: TToolBar
                      Left = 0
                      Top = 0
                      Width = 60
                      Height = 22
                      Align = alLeft
                      Caption = 'ToolBar6'
                      Images = ImageList1
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 1
                      object ToolButton17: TToolButton
                        Left = 0
                        Top = 0
                        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
                        Action = actTCSetAll
                      end
                      object ToolButton18: TToolButton
                        Left = 23
                        Top = 0
                        Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1095#1077#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
                        Action = actTCUncheckAll
                      end
                    end
                  end
                  object Panel10: TPanel
                    Left = 0
                    Top = 0
                    Width = 720
                    Height = 20
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label6: TLabel
                      Left = 0
                      Top = 0
                      Width = 475
                      Height = 13
                      Caption = 
                        #1042#1088#1077#1084#1103', '#1074' '#1082#1086#1090#1086#1088#1086#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100' '#1085#1077' '#1084#1086#1078#1077#1090' '#1087#1088#1086#1074#1086#1076#1080#1090#1100' '#1079#1072#1085#1103#1090#1080#1103' '#1074' '#1090#1077#1095#1077 +
                        #1085#1080#1077' '#1091#1095#1077#1073#1085#1086#1075#1086' '#1089#1077#1084#1077#1089#1090#1088#1072':'
                    end
                  end
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 236
                  Width = 720
                  Height = 242
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  DesignSize = (
                    720
                    242)
                  object Bevel3: TBevel
                    Left = 0
                    Top = 212
                    Width = 720
                    Height = 4
                    Align = alBottom
                    Shape = bsSpacer
                    ExplicitTop = 219
                  end
                  object Panel7: TPanel
                    Left = 0
                    Top = 216
                    Width = 720
                    Height = 26
                    Align = alBottom
                    BevelKind = bkFlat
                    BevelOuter = bvNone
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object ToolBar1: TToolBar
                      Left = 432
                      Top = 0
                      Width = 284
                      Height = 22
                      Align = alRight
                      ButtonWidth = 139
                      Caption = 'ToolBar4'
                      Images = ImageList1
                      List = True
                      ShowCaptions = True
                      AllowTextButtons = True
                      TabOrder = 0
                      object ToolButton1: TToolButton
                        Left = 0
                        Top = 0
                        Cursor = crHandPoint
                        Action = actSCUndoChanges
                        Style = tbsTextButton
                      end
                      object ToolButton2: TToolButton
                        Left = 140
                        Top = 0
                        Cursor = crHandPoint
                        Action = actSCSaveChanges
                        Style = tbsTextButton
                      end
                    end
                    object ToolBar2: TToolBar
                      Left = 0
                      Top = 0
                      Width = 82
                      Height = 22
                      Align = alLeft
                      Caption = 'ToolBar6'
                      Images = ImageList1
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 1
                      object ToolButton3: TToolButton
                        Left = 0
                        Top = 0
                        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1088#1072#1073#1086#1090#1099'...'
                        Action = actSessionConstAdd
                      end
                      object ToolButton5: TToolButton
                        Left = 23
                        Top = 0
                        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1088#1072#1073#1086#1090#1099
                        Action = actSessionConstDel
                      end
                      object ToolButton7: TToolButton
                        Left = 46
                        Top = 0
                        Width = 8
                        Caption = 'ToolButton7'
                        ImageIndex = 20
                        Style = tbsSeparator
                      end
                      object ToolButton6: TToolButton
                        Left = 54
                        Top = 0
                        Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1076#1086#1089#1090#1091#1087#1085#1086#1077' '#1074#1088#1077#1084#1103
                        Action = actSessionConstLoadAvto
                      end
                    end
                  end
                  object DBGridEh2: TDBGridEh
                    Left = 0
                    Top = 25
                    Width = 720
                    Height = 187
                    Align = alClient
                    AutoFitColWidths = True
                    DataSource = dsSessionTime
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
                    FooterFont.Name = 'Tahoma'
                    FooterFont.Style = []
                    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                    ParentFont = False
                    RowHeight = 18
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    UseMultiTitle = True
                    Columns = <
                      item
                        EditButtons = <>
                        FieldName = 'd_session_date'
                        Footers = <>
                        Title.Caption = #1044#1072#1090#1072
                        Width = 98
                      end
                      item
                        DisplayFormat = 'HH:NN'
                        EditButtons = <>
                        FieldName = 'd_work_time_start'
                        Footers = <>
                        Title.Caption = #1053#1072#1095#1072#1083#1086' '#1074#1088#1077#1084#1077#1085#1085#1086#1075#1086' '#1080#1085#1090#1077#1088#1074#1072#1083#1072
                        Width = 195
                      end
                      item
                        DisplayFormat = 'HH:NN'
                        EditButtons = <>
                        FieldName = 'd_work_time_end'
                        Footers = <>
                        Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1074#1088#1077#1084#1077#1085#1085#1086#1075#1086' '#1080#1085#1090#1077#1088#1074#1072#1083#1072
                        Width = 212
                      end>
                  end
                  object Panel8: TPanel
                    Left = 0
                    Top = 112
                    Width = 243
                    Height = 102
                    Anchors = [akLeft, akBottom]
                    BevelEdges = [beTop, beRight]
                    BevelKind = bkFlat
                    BevelOuter = bvNone
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                    Visible = False
                    object Label1: TLabel
                      Left = 59
                      Top = 8
                      Width = 29
                      Height = 13
                      Caption = #1044#1072#1090#1072':'
                    end
                    object Label3: TLabel
                      Left = 0
                      Top = 28
                      Width = 88
                      Height = 13
                      Caption = #1055#1077#1088#1080#1086#1076' '#1074#1088#1077#1084#1077#1085#1080':'
                    end
                    object Label4: TLabel
                      Left = 50
                      Top = 49
                      Width = 38
                      Height = 13
                      Caption = #1085#1072#1095#1072#1083#1086':'
                    end
                    object Label5: TLabel
                      Left = 137
                      Top = 49
                      Width = 56
                      Height = 13
                      Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077':'
                    end
                    object Bevel4: TBevel
                      Left = 93
                      Top = 68
                      Width = 150
                      Height = 5
                      Shape = bsBottomLine
                    end
                    object SpeedButton1: TSpeedButton
                      Left = 93
                      Top = 76
                      Width = 73
                      Height = 23
                      Cursor = crHandPoint
                      Action = actAddSCOK
                      Flat = True
                    end
                    object SpeedButton2: TSpeedButton
                      Left = 167
                      Top = 76
                      Width = 71
                      Height = 23
                      Cursor = crHandPoint
                      Caption = #1054#1090#1084#1077#1085#1072
                      Flat = True
                      OnClick = SpeedButton2Click
                    end
                    object dbdtSessionDate: TDBDateTimeEditEh
                      Left = 94
                      Top = 6
                      Width = 82
                      Height = 19
                      AlwaysShowBorder = True
                      EditButtons = <>
                      Flat = True
                      Kind = dtkDateEh
                      TabOrder = 0
                      Visible = True
                    end
                    object dbdtWorkTimeStart: TDBDateTimeEditEh
                      Left = 94
                      Top = 47
                      Width = 35
                      Height = 19
                      AlwaysShowBorder = True
                      EditButton.Visible = False
                      EditButtons = <>
                      Flat = True
                      TabOrder = 2
                      Visible = True
                      EditFormat = 'HH:NN'
                    end
                    object CheckBox1: TCheckBox
                      Left = 94
                      Top = 27
                      Width = 97
                      Height = 17
                      Caption = #1094#1077#1083#1099#1081' '#1076#1077#1085#1100
                      TabOrder = 1
                      OnClick = CheckBox1Click
                    end
                    object dbdtWorkTimeStop: TDBDateTimeEditEh
                      Left = 201
                      Top = 47
                      Width = 37
                      Height = 19
                      AlwaysShowBorder = True
                      EditButton.Visible = False
                      EditButtons = <>
                      Flat = True
                      TabOrder = 3
                      Visible = True
                      EditFormat = 'HH:NN'
                    end
                  end
                  object Panel11: TPanel
                    Left = 0
                    Top = 0
                    Width = 720
                    Height = 25
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 3
                    object Label7: TLabel
                      Left = 0
                      Top = 5
                      Width = 423
                      Height = 13
                      Caption = 
                        #1042#1088#1077#1084#1103', '#1074' '#1082#1086#1090#1086#1088#1086#1077' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100' '#1085#1077' '#1084#1086#1078#1077#1090' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1101#1082#1079#1072#1084#1077#1085#1099' '#1074' '#1087#1077#1088 +
                        #1080#1086#1076' '#1089#1077#1089#1089#1080#1080':'
                    end
                  end
                end
              end
            end
            object tsUseRoomFundConstraint: TTabSheet
              Caption = 'tsUseRoomFundConstraint'
              ImageIndex = 1
              TabVisible = False
              object ToolBar7: TToolBar
                Left = 0
                Top = 0
                Width = 723
                Height = 26
                ButtonWidth = 181
                Caption = 'ToolBar4'
                Images = ImageList1
                List = True
                ShowCaptions = True
                AllowTextButtons = True
                TabOrder = 0
                object ToolButton19: TToolButton
                  Left = 0
                  Top = 0
                  Cursor = crHandPoint
                  Action = actSetRoomList
                  Style = tbsTextButton
                end
                object ToolButton21: TToolButton
                  Left = 185
                  Top = 0
                  Action = actDeleteRoomFromConstraint
                  Style = tbsTextButton
                end
              end
              object TreeView1: TTreeView
                Left = 0
                Top = 26
                Width = 723
                Height = 484
                Align = alClient
                Images = ilRoomConstraint
                Indent = 19
                ReadOnly = True
                TabOrder = 1
                OnExpanding = TreeView1Expanding
              end
            end
          end
        end
        object DockTabSet1: TDockTabSet
          Left = 0
          Top = 526
          Width = 733
          Height = 21
          Align = alBottom
          DitherBackground = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          StartMargin = 0
          SoftTop = True
          Style = tsSoftTabs
          Tabs.Strings = (
            #1042#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081
            #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1072#1091#1076#1080#1090#1086#1088#1085#1086#1075#1086' '#1092#1086#1085#1076#1072)
          TabIndex = 0
          OnChange = DockTabSet1Change
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
        ImageIndex = 2
        object Bevel1: TBevel
          Left = 0
          Top = 522
          Width = 733
          Height = 4
          Align = alBottom
          Shape = bsSpacer
          ExplicitTop = 525
        end
        object DockTabSet2: TDockTabSet
          Left = 0
          Top = 526
          Width = 733
          Height = 21
          Align = alBottom
          DitherBackground = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          StartMargin = 0
          SoftTop = True
          Style = tsSoftTabs
          Tabs.Strings = (
            #1040#1091#1076#1080#1090#1086#1088#1085#1086#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
            #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1101#1082#1079#1072#1084#1077#1085#1086#1074)
          TabIndex = 0
          OnChange = DockTabSet2Change
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 733
          Height = 522
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel2'
          TabOrder = 1
          OnResize = Panel2Resize
          object PageControl3: TPageControl
            Left = 1
            Top = 1
            Width = 731
            Height = 520
            ActivePage = TabSheet4
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet4: TTabSheet
              Caption = 'TabSheet4'
              TabVisible = False
              inline fmLessonShedule1: TfmLessonShedule
                Left = 0
                Top = 0
                Width = 723
                Height = 510
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 723
                ExplicitHeight = 510
                inherited Panel4: TPanel
                  Top = 485
                  Width = 723
                  ExplicitTop = 485
                  ExplicitWidth = 723
                  inherited Panel15: TPanel
                    Left = 456
                    ExplicitLeft = 456
                  end
                  inherited ToolBar1: TToolBar
                    inherited tbDayShedule: TToolButton
                      ExplicitWidth = 61
                    end
                    inherited tbWeekShedule: TToolButton
                      Left = 61
                      ExplicitLeft = 61
                      ExplicitWidth = 72
                    end
                    inherited tbMonthShedule: TToolButton
                      Left = 133
                      ExplicitLeft = 133
                      ExplicitWidth = 64
                    end
                  end
                end
                inherited Panel5: TPanel
                  Width = 723
                  Height = 485
                  ExplicitWidth = 723
                  ExplicitHeight = 485
                  inherited Panel14: TPanel
                    Width = 723
                    ExplicitWidth = 723
                    inherited ToolBar2: TToolBar
                      inherited ToolButton6: TToolButton
                        ExplicitWidth = 36
                      end
                      inherited ToolButton15: TToolButton
                        ExplicitWidth = 36
                      end
                      inherited ToolButton16: TToolButton
                        ExplicitWidth = 36
                      end
                      inherited ToolButton9: TToolButton
                        ExplicitWidth = 36
                      end
                    end
                  end
                end
                inherited Panel6: TPanel
                  Left = 480
                  Top = 30
                  ExplicitLeft = 480
                  ExplicitTop = 30
                  inherited Panel9: TPanel
                    inherited MonthCalendar1: TMonthCalendar
                      Date = 39488.498709687500000000
                    end
                    inherited MonthCalendar2: TMonthCalendar
                      Date = 39517.498709687500000000
                    end
                    inherited MonthCalendar3: TMonthCalendar
                      Date = 39548.498709687500000000
                    end
                  end
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'TabSheet7'
              ImageIndex = 1
              TabVisible = False
              inline fmExaminationShedule1: TfmExaminationShedule
                Left = 0
                Top = 0
                Width = 723
                Height = 510
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 723
                ExplicitHeight = 510
                inherited Panel5: TPanel
                  Width = 723
                  Height = 485
                  ExplicitWidth = 723
                  ExplicitHeight = 485
                  inherited Panel14: TPanel
                    Width = 723
                    ExplicitWidth = 723
                    inherited ToolBar2: TToolBar
                      inherited ToolButton8: TToolButton
                        ExplicitWidth = 36
                      end
                    end
                  end
                end
                inherited Panel4: TPanel
                  Top = 485
                  Width = 723
                  ExplicitTop = 485
                  ExplicitWidth = 723
                  inherited Panel15: TPanel
                    Left = 456
                    ExplicitLeft = 456
                  end
                  inherited ToolBar1: TToolBar
                    ButtonWidth = 67
                    inherited tbDayShedule: TToolButton
                      ExplicitWidth = 61
                    end
                    inherited tbWeekShedule: TToolButton
                      Left = 61
                      ExplicitLeft = 61
                      ExplicitWidth = 71
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Left = 3
    Top = 656
    Align = alNone
    Visible = False
    ExplicitLeft = 3
    ExplicitTop = 656
  end
  object ImageList1: TImageList
    Left = 24
    Top = 176
    Bitmap = {
      494C010114001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000000000
      0000000000000000000097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F00000000000000000000000000000000008686
      8600F0F0F200F1F1F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5
      F700F6F6F700F7F7F800F7F8F9008686860097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F60097928F00000000000000000000000000000000000000
      0000000000000000000097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F60097928F00000000000000000000000000000000009090
      9000F1F1F300CCC1C300A28A8D00A28A8D00D8D1D200F4F5F600D4CACD00CFC4
      C600F7F7F800F7F8F900F8F9FA009090900097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600EAE6E400D0C6BE00EAE6
      E400F6F6F600F6F6F600F6F6F60097928F000000000000000000000000000000
      0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
      AD00B1B0AD00F8F9F80097928F00000000000000000000000000000000000000
      0000000000000000000097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
      AD00B1B0AD00F8F9F80097928F000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F00F5F5F700D4CBCD00CFC4
      C600F8F8F900F8F9FA00F9FAFA009D9D9D0097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600E8E4E100BFAD9E008C725C00BBAC
      9E00F6F6F600F6F6F600F6F6F60097928F000000000000000000000000000000
      0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC0097928F000000000097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F60097928F00F6F6F800D5CBCD00D0C5
      C700F8F9FA00F9FAFA00FAFBFB00ACACAC0097928F00F6F6F600F6F6F600DBD5
      D100F6F6F600A4928700DED8D400ADA09600F5F5F5008C725C00FFFFFF008C72
      5C00E8E6E200F6F6F600F6F6F60097928F000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE0097928F000000000097928F00F8F8F800B1B0AD00B1B0
      AD00F8F8F800B1B0AD00B1B0AD00F8F9F80097928F00CABDBF00B9A7AA00D0C5
      C700F9FAFB00FAFBFB00FBFBFC00ADADAD0097928F00F6F6F600F6F6F600F6F6
      F6009E8B7D00A7928200A3918100A3908100A08D7F00BAACA3008C725C00C7B4
      A200EAE6E300F6F6F600F6F6F60097928F000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0097928F00000000000000000000000000000000000000
      0000000000000000000097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0097928F000000000097928F00FCFCFC00FBFBFC00FBFB
      FC00FCFCFB00FBFBFC00FBFCFC00FBFBFC0097928F00F8F8F900CBBEC000D0C6
      C800FAFBFB00FBFCFC00FBFCFC00B1B1B10097928F00F6F6F600F6F6F600AD9E
      90009E8B7D00D4CBC200E1DCD800CFC2B800A08D7F00BAACA300E7E2DD00E9E2
      DB00F7F6F700F6F6F600F6F6F60097928F000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF000000000097928F00FEFEFE00B1B0AD00B1B0
      AD00FEFEFE00B1B0AD00B1B0AD00FEFEFE0097928F00F9F9FA00F9FAFB00FAFB
      FB00FBFCFC00FBFCFD00FCFDFD00B3B3B30097928F00F6F6F600F6F6F600DBD6
      D1009E8C7D00EEEDEB00F6F6F600E3DEDA00A08E7F00DCD7D200F9F9F600F8F8
      F700F7F7F700F6F6F600F6F6F60097928F000000000000000000000000000000
      00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF800266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF800266DBF000000000097928F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0097928F00B9A8AA00A28A8D00A28A
      8D00F6F4F600FCFDFD00FDFEFE00B5B5B50097928F00F6F6F600F6F6F600AA98
      8A009E8C7D00D6CFC900E7E4E100CBC1B800A08E7F00B8AA9F00F9F9F900F6F6
      F600F6F6F600F6F6F600F6F6F60097928F000000000000000000757575007575
      75007575750000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF0000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00AE999C00FBFCFC00CCBF
      C100DED7D800FDFEFE00FDFEFE00B8B8B80097928F00F6F6F600F6F6F600FFFF
      FF009E8C7D00A08D7F00A08D7F00A08E7F00A18E8000F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60097928F00000000000000000075757500AEAE
      AE00757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF001683F500238EF600329B
      F60042A8F7004FB3F70058BAF80058BAF800266DBF00BAA8AB00FCFDFD00D2C7
      C900D8CFD000FDFEFE00FDFEFE00B8B8B80097928F00F6F6F600F6F6F600DBD6
      D100F6F6F600AB9B8F00DCD6D200B4A59800F6F6F600DCD7D200F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60097928F00757575007575750075757500AEAE
      AE00757575007575750075757500000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200727272007272
      7200727272007272720072727200000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00B4A1A300FCFDFD00CCC0
      C200DFD7D800E5E5E600DFDFE000BABABA0097928F00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F0075757500AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE0075757500000000000000000000000000000000000000
      00000000000000000000000000000000000072727200AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE0072727200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00F9FAFA00FAFBFB00DDD5D700BAA8AB00FCFDFD00BAA9AB00A28A8D00A28A
      8D00B7B4B400B8B8B800B8B8B800BABABA0097928F00DCD5CF00DCD5CF00DCD5
      CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF0089726200DCD5
      CF0089726200DCD5CF008972620097928F00757575007575750075757500AEAE
      AE00757575007575750075757500000000000000000000000000000000000000
      0000000000000000000000000000000000007272720072727200727272007272
      7200727272007272720072727200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00FAFBFB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFE
      FE00C5C5C500F6F6F600BBBBBB00F2F2F20097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F00000000000000000075757500AEAE
      AE00757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFE
      FE00CACACA00BABABA00F3F4F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000757575007575
      7500757575000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000BFBFBF00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097928F00FEFEFE00F8F9F800F8F9F800F8F9F800F8F9F800F7F7
      F700F4F4F400F1F1F100F0F0F00097928F00000000000000000000000000FDFE
      FE0076BCDA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097928F00FEFEFE00F8F9F800F8F9F800F8F9F800F8F9F800F7F7
      F700F4F4F400F1F1F100F0F0F00097928F00000000008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E000000000000000000000000000000000000000000F7F5
      F200FCFBFA0097928F00FFFEFF00F8F9F800E7DDCC00B0843100D6C5A600F7F7
      F800F5F4F400F1F1F100F1F0F10097928F0000000000F7FBFC00E3F0F50076BC
      DA00508FA900FEFEFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F5
      F200FCFBFA0097928F00FFFEFF004C39C600A9A0E300F6F7F600A9A0E3004B38
      C500F5F4F400F1F1F100F1F0F10097928F00000000008F8F8E00F4F4F400F4F4
      F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4F400F4F4
      F400F4F4F4008F8F8E0000000000000000000000000000000000F9F7F400CBB7
      9F00D4C3B10097928F00FFFFFF00D2C4AD00B7832200B9840A00C0954700F6F4
      F200AB989A00AA979900DAD3D40097928F00E8F1F5008AC3DB0076BCDA0087D3
      F600508FA9005191AC0078B3CC0078B3CC0078B3CC0078B3CC0078B3CC00D6E7
      EE00000000000000000000000000000000000000000000000000F9F7F400CBB7
      9F00D4C3B10097928F00FFFFFF009388DC006454CD008275D5006150CC00ABA1
      E600AB989A00AA979900DAD3D40097928F00000000008F8F8E00F4F4F400CCCB
      CA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEBEB00EAE9
      E900F4F4F4008F8F8E0000000000000000000000000000000000FBFAF800CDBB
      A500D1BBA40097928F00FFFFFF00CEB07A00BF903800F8F9F800B7830700DBC2
      9500F6F7F600F2F2F300F2F1F10097928F0075B0C70082CFEE007FC9EA0083CE
      F000508FA90067AECB0085D8FB0090E7FF0089E1FF008DE2FF0073C1E10078B3
      CC00000000000000000000000000000000000000000000000000FBFAF800CDBB
      A500D1BBA40097928F00FFFFFF00F6F7F6008477D8004C39C6008275D600F6F7
      F600F6F7F600F2F2F300F2F1F10097928F00000000008F8F8E00F4F4F400CAC8
      C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6F600E6E6
      E600F4F4F4008F8F8E000000000000000000FAF8F600D8C9B500D9C9B600D9C7
      B200ECDDCE0097928F00FFFFFF00F8F9F800F8F9F800FDFCFC00DFC99800C496
      2000F7F7F700F3F3F300F2F2F20097928F0074AFC70081D0ED007FCCEA0084D2
      F0006AAECB00508FA9006FB9D70077C4E4007FD0F30096E3FF00FFFFFF0078B3
      CC0000000000000000000000000000000000FAF8F600D8C9B500D9C9B600D9C7
      B200ECDDCE0097928F00FFFFFF009388DC006555CE008578D8006454CD00A9A0
      E300F7F7F700F3F3F300F2F2F20097928F00000000008F8F8E00F4F4F400D1CF
      CD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4F400E2E2
      E100F4F4F4008F8F8E000000000000000000FBF9F800CFBBA300E0CEBB00F0E1
      D200E3D1C30097928F00FFFFFF00FEFFFE00FEFEFE00FDFDFD00F2ECE300E5D7
      A200E9DDC000F4F3F400F3F2F20097928F0075B0C80085D5F00082D1ED0083D0
      ED007AC5E2006AAECB00508FA90067AECB007ED0F30094E1FF00F8F9F90078B3
      CC0000000000000000000000000000000000FBF9F800CFBBA300E0CEBB00F0E1
      D200E3D1C30097928F00FFFFFF004C39C6009287DC00F6F7F6009287DC004C39
      C600F6F7F600F4F3F400F3F2F20097928F00000000008F8F8E00F4F4F400E1E0
      DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6F600DEDD
      DC00F4F4F4008F8F8E00000000000000000000000000EDE5DB00EAD9C700E3D5
      C300C9B7A40097928F00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F0075B0C80089DCF50085D4F00084D2
      ED0084D2EE008FDFFE0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0000000000EDE5DB00EAD9C700E3D5
      C300C9B7A40097928F00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F00000000008F8F8E00F4F4F400CDC9
      C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8F800D6D5
      D500F4F4F4008F8F8E000000000000000000DDCEBC00E0CEBB00F0E0D000CEBB
      A400F9F8F60097928F00E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9
      D3009A847400DFD7D1009A84740097928F0075B0C7008DE2F80088DBF40087D7
      F00085D6F0008CDEF90097928F00F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600FEFEFE0097928F00DDCEBC00E0CEBB00F0E0D000CEBB
      A400F9F8F60097928F00E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9
      D3009A847400DFD7D1009A84740097928F00000000008F8F8E00F4F4F400B9B3
      AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3BC00DCDC
      DB00F4F4F4008F8F8E000000000000000000DBCAB600DCCAB400EEE0D000C9B4
      9E00FCFBFA0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0074B0C80091E7FC008CE2F7008BDE
      F50089DCF40090E3FE0097928F00F8F8F800B1B0AD00B1B0AD00F8F8F800B1B0
      AD00B1B0AD00F8F9F800FEFEFE0097928F00DBCAB600DCCAB400EEE0D000C9B4
      9E00FCFBFA0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F00000000008F8F8E00F4F4F400B9B3
      AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A5776500E8E7
      E700F4F4F4008F8F8E00000000000000000000000000EEE6DD00EFE3D700E5DA
      C800BEAF9C00FCFCFB000000000000000000F3EEE900D3BFA800D5C6B300C6B0
      9700FDFDFD0000000000000000000000000075AFC80094EDFF008FE6FA008EE3
      F8008DE2F70095ECFF0097928F00FCFCFC00FBFBFC00FBFBFC00FCFCFB00FBFB
      FC00FBFCFC00FBFBFC00FEFEFE0097928F0000000000EEE6DD00EFE3D700E5DA
      C800BEAF9C00FCFCFB000000000000000000F3EEE900D3BFA800D5C6B300C6B0
      9700FDFDFD00000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A4400D0BF
      B900F6F6F6008F8F8E000000000000000000FAF8F500D2BEA500EDE0D300F9F1
      EA00CCBEAB00B4A28E00E7E1D900DED4C900C8B19A00D9C7B500DACEBC00C7AE
      9800BFAE9D0000000000000000000000000077B2CB0096F2FF0093EBFE0093EA
      FE0090E8FA0078C5E70097928F00FEFEFE00B1B0AD00B1B0AD00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE00FEFEFE0097928F00FAF8F500D2BEA500EDE0D300F9F1
      EA00CCBEAB00B4A28E00E7E1D900DED4C900C8B19A00D9C7B500DACEBC00C7AE
      9800BFAE9D00000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB867700E4DF
      DC00F5F5F5008F8F8E000000000000000000F9F7F400DBCBB700E4D6C700F2E7
      DB00F6ECE500E4D6C700CDB8A200CCB8A000DACAB600D8C7B400D7C2AD00D0BE
      AA00C8B7A6000000000000000000000000007DBAD3009BF8FF0098F2FF0078C5
      E70078C5E70087DBFF0097928F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE0097928F00F9F7F400DBCBB700E4D6C700F2E7
      DB00F6ECE500E4D6C700CDB8A200CCB8A000DACAB600D8C7B400D7C2AD00D0BE
      AA00C8B7A600000000000000000000000000000000008F8F8E00F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9F900F6F6
      F600F4F4F4008F8F8E000000000000000000000000000000000000000000DFCE
      BC00E8D9C700F3E8DC00F8ECE000ECDAC700D5C1AC00BDAD9B00E0D4C7000000
      00000000000000000000000000000000000084C3DC0087D6F00073C1E10087DB
      FF008CE0FF0090E8FF00266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00000000000000000000000000DFCE
      BC00E8D9C700F3E8DC00F8ECE000ECDAC700D5C1AC00BDAD9B00E0D4C7000000
      000000000000000000000000000000000000000000008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E0000000000000000000000000000000000FEFEFE00D9C8
      B300E0CFBD00F1EBE300D7C2AC00D7C5AF00EBE2D800C8B29B00DDD2C6000000
      00000000000000000000000000000000000089C5DE0083C9E50088C8E20088C8
      E20088C8E20088C8E200266DBF001683F500238EF600329BF60042A8F7004FB3
      F70058BAF80058BAF80058BAF800266DBF000000000000000000FEFEFE00D9C8
      B300E0CFBD00F1EBE300D7C2AC00D7C5AF00EBE2D800C8B29B00DDD2C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFA
      F8000000000000000000CFBAA300D9CAB60000000000FBF9F800FCFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000266DBF00266DBF00266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00000000000000000000000000FBFA
      F8000000000000000000CFBAA300D9CAB60000000000FBF9F800FCFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7C3C300827878008278780082787800827878008278
      7800787474008278780082787800C7C3C3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000082787800A19D9D00B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000A19D9D00827878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000838383007E7E7E007E7E7E007E7E
      7E007E7E7E007E7E7E0082787800B4AFB000E5D9D800E5D9D800E5D9D800E5D9
      D80009EA53005D5A5A00B3AEAF00827878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E00000000000000000089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009A817C00B4AFB000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B4AFB0009A817C000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC700000000000000000000000000000000008F8F8E00F4F4F400F4F4
      F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4F400F4F4
      F400F4F4F4008F8F8E00000000000000000092929200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0D4CE00C3BCB900B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000C1BAB700DCCDC5000000000000000000B8A49400F4E3
      DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
      B500634935000000000000000000000000000000000000000000B8A49400F4E3
      DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
      A20063493500000000000000000000000000000000008F8F8E00F4F4F400E1E0
      DE00F6F3F200F6F3F200F6F3F200F6F3F200F6F3F200EDEDEC00ECEBEB00EAE9
      E900F4F4F4008F8F8E0000000000000000009A9A9A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F800F2F0F000E4E1DF00B3B0AE00DEDA
      D800E3E0DE00F0EFEE00F9F8F800000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
      B800634935000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
      A30063493500000000000000000000000000000000008F8F8E00F4F4F400E1E0
      DE00F0ECEA00F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F6F6F600E6E6
      E600F4F4F4008F8F8E000000000000000000A4A4A400FFFFFF00FFFFFF00D5E0
      D60050A65B00B3C1B500FFFFFF004C39C6004C39C600E4E1DF00C0C0C0000000
      0000000000004C39C6004C39C600000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
      BB00634935000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
      A50063493500000000000000000000000000000000008F8F8E00F4F4F400E1E0
      DE00EEEEED00EEEEED00F9F9F900F9F9F900F9F9F900FAF9F800F4F4F400E8E7
      E700F4F4F4008F8F8E000000000000000000ACACAC00FFFFFF00DDE8DF005FC7
      700041E75A0055AE6200F3F3F3004C39C6004C39C6004C39C600C0C0C000FAFA
      FA004C39C6004C39C6004C39C600000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
      BF00634935000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
      A70063493500000000000000000000000000000000008F8F8E00F4F4F400E1E0
      DE00DCD8D500EEEEED00EEEEED00F9F9F900F9F9F900F9F9F900F6F6F600E8E7
      E700F4F4F4008F8F8E000000000000000000B5B5B500FFFFFF0070E082006BD8
      7D00E5F2E60054EE6D0093AE9700FFFFFF004C39C6004C39C6004C39C6004C39
      C6004C39C6004C39C60000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
      C400634935000000000000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
      A90063493500000000000000000000000000000000008F8F8E00F4F4F400CDC9
      C500E5E2DF00DCD8D500EEEEED00EEEEED00F9F9F900F9F9F900F8F8F800E8E7
      E700F4F4F4008F8F8E000000000000000000BBBBBB00FFFFFF00E4F5E600F8FB
      F800FFFFFF0089DD960052C86600F9FAF900F9FAF9004C39C6004C39C6004C39
      C6004C39C600F8F8F80000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
      C900634935000000000000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
      AC0063493500000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00DDD9D500E5E2DF00DCD8D500F4F3F200EEEEED00F9F9F900F9F9F900E8E7
      E700F4F4F4008F8F8E000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0F6F1004DDD630084A48900EDEEED004C39C6004C39C6004C39
      C6004C39C6000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
      CF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
      AF0063493500000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000EEEEED00EEEEED00F9F9F900E8E7
      E700F4F4F4008F8F8E000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5DDBA0052C866004C39C6004C39C6004C39C6004C39
      C6004C39C6004C39C60000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
      D400634935000000000000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
      C00063493500000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED00EEEEED00EEEEED00E8E7
      E700F6F6F6008F8F8E000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFCFA004C39C6004C39C6004C39C600C0C0C0000000
      00004C39C6004C39C6004C39C600000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA0063493500000000000000000000000000000000008F8F8E00F4F4F400B9B3
      AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900D0CCC900E8E7E700E4DF
      DC00F5F5F5008F8F8E000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004C39C6004C39C600FFFFFF00C0C0C0000000
      0000000000004C39C6004C39C600000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC7000000000000000000000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC700000000000000000000000000000000008F8F8E00F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9F900F6F6
      F600F4F4F4008F8F8E000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7C3C300827878008278780082787800827878008278
      7800787474008278780082787800C7C3C3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFE
      FE0076BCDA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000082787800A19D9D00B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000A19D9D00827878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B0006E6E6E009B9B
      9B0000000000000000000000000000000000000000000000000000000000E4E4
      E400A7A7A70090909000000000000000000000000000F7FBFC00E3F0F50076BC
      DA00508FA900FEFEFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000838383007E7E7E007E7E7E007E7E
      7E007E7E7E007E7E7E0082787800B4AFB000E5D9D800E5D9D800E5D9D800E5D9
      D80009EA53005D5A5A00B3AEAF00827878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000917CEC002900DF003F28A6006565
      6500C9C9C9000000000000000000000000000000000000000000D5D5D5006250
      B2002E07D800A7A7A7000000000000000000E8F1F5008AC3DB0076BCDA0087D3
      F600508FA9005191AC0078B3CC0078B3CC0078B3CC0078B3CC0078B3CC00D6E7
      EE000000000000000000000000000000000089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009A817C00B4AFB000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B4AFB0009A817C000000000000000000000000000000
      00000000FF000000800000000000000000000000000000000000000000000000
      80000000FF00000000000000000000000000BCAFF5002900DF00300ADB00534E
      6A007F7F7F00DDDDDD00000000000000000000000000C8C5D3004629C3002900
      DF007D6BCD0000000000000000000000000075B0C70082CFEE007FC9EA0083CE
      F000508FA90067AECB0085D8FB0090E7FF0089E1FF008DE2FF0073C1E10078B3
      CC000000000000000000000000000000000092929200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0D4CE00C3BCB900B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000C1BAB700DCCDC5000000000000000000000000000000
      0000000080000000FF0000008000000000000000000000000000000080000000
      FF0000008000000000000000000000000000000000008770ED002900DF003D1C
      D2005F5F5F0094949400E1E1E10000000000C8C5D3003A18CD002E07D800A49C
      C6000000000000000000000000000000000074AFC70081D0ED007FCCEA0084D2
      F0006AAECB00508FA9006FB9D70077C4E4007FD0F30096E3FF00FFFFFF0078B3
      CC00000000000000000000000000000000009A9A9A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F800F2F0F000E4E1DF00B3B0AE0081A1
      7F00918E8C00DEDDDC00F9F8F800000000000000000000000000000000000000
      000000000000000080000000FF000000800000000000000080000000FF000000
      80000000000000000000000000000000000000000000000000007A60EB002900
      DF005238C3006464640092929200B7B4C2003A18CD002E07D800A49CC6000000
      00000000000000000000000000000000000075B0C80085D5F00082D1ED0083D0
      ED007AC5E2006AAECB00508FA90067AECB007ED0F30094E1FF00F8F9F90078B3
      CC0000000000000000000000000000000000A4A4A400FFFFFF00FFFFFF00D5E0
      D60050A65B00B3C1B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A400B376
      1F00BC7C22000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF00000080000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000007A60
      EB002900DF005137C30053505E003312C7002C06D700A49CC600000000000000
      00000000000000000000000000000000000075B0C80089DCF50085D4F00084D2
      ED0084D2EE008FDFFE00508DA80067AECB0080D2F50095E2FF00FFFFFF0078B3
      CC0000000000000000000000000000000000ACACAC00FFFFFF00DDE8DF005FC7
      700041E75A0055AE6200F3F3F300FFFFFF00FFFFFF00EFE3D200B97B1F00EEC6
      7700E3C89200C684260000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000FF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000795FEA002900DF002C06D7002B05D6006A628C00DADADA00000000000000
      00000000000000000000000000000000000075B0C7008DE2F80088DBF40087D7
      F00085D6F0008CDEF9005290AA009B9C93009B9C930084847C00FFFFFF009B9C
      930084847C00000000009B9C93009B9C9300B5B5B500FFFFFF0070E082006BD8
      7D00E5F2E60054EE6D0093AE9700FEFEFE00FFFFFF00B2751C00EFC77800EFBA
      4A00F2B94300F4D39000BF7B2000000000000000000000000000000000000000
      00000000000000000000000080000000FF00000080000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C5D3002F08D9002900DF00472BC4007474740091919100D5D5D5000000
      00000000000000000000000000000000000074B0C80091E7FC008CE2F7008BDE
      F50089DCF40090E3FE005391AB00FFFFFF00FFFFFF0084847C0084847C00E3E4
      E00084847C0084847C00EBE1D3009B9C9300BBBBBB00FFFFFF00E4F5E600F8FB
      F800FFFFFF0089DD960052C86600DBDCDB00B6781D00B1741D00B1741D00F2BD
      4C00F6D08100C58A3200C58A3200BE822E000000000000000000000000000000
      000000000000000080000000FF000000800000000000000080000000FF000000
      800000000000000000000000000000000000000000000000000000000000C8C5
      D3003A18CD002E07D800705CCC00360FE000593DD6007D7A880085858500C3C3
      C3000000000000000000000000000000000075AFC80094EDFF008FE6FA008EE3
      F8008DE2F70095ECFF00518FA900FFFFFF00F7EDE500F7EDE500F7EEE600F7ED
      E600F7EDE500F7EDE500F7EDE5009B9C9300C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0F6F1004DDD630085AB8B00F9FAF900FFFFFF00B1741D00F1B7
      4200F4CE8600C58A320000000000000000000000000000000000000000000000
      0000000080000000FF0000008000000000000000000000000000000080000000
      FF00000080000000000000000000000000000000000000000000C8C5D3003A18
      CD002900DF008A80B8000000000000000000431FE2004A28DD007A729C007C7C
      7C00B3B3B30000000000000000000000000077B2CB0096F2FF0093EBFE0093EA
      FE0090E8FA0078C5E700BEC0B600FFF7F400C6B3A400C6B3A400C6B3A400F7ED
      E500C6B3A400C6B3A400C6B3A4009B9C9300C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5DDBA0045BE570084A48900EDEEED00B1741D00F1B7
      4200F3CD8500C58A320000000000000000000000000000000000000000000000
      00000000FF000000800000000000000000000000000000000000000000000000
      80000000FF0000000000000000000000000000000000BBB9C7003917CC002900
      DF007263B700000000000000000000000000000000005F40E700350EDF007B6E
      B40089898900DBDBDB0000000000000000007DBAD3009BF8FF0098F2FF0078C5
      E70078C5E70087DBFF00BEC0B600FFFCFB00C6B3A400FFFFFF00C6B3A400F7ED
      E500C6B3A400C6B3A400C6B3A4009B9C9300C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFCFA00A3D3A80096BF9B00FFFFFF00B1741D00EDB0
      3700ECC68000C58A320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6BEE8003917CC002900DF005A46
      B600000000000000000000000000000000000000000000000000947FEF002900
      DF00CFCAE60000000000000000000000000084C3DC0087D6F00073C1E10087DB
      FF008CE0FF0090E8FF00BEC0B600FFFFFF00C6B3A400C6B3A400C8B5A700FFFF
      FE00FDFBF600FAF7F400F3ECE5009B9C9300C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1741D00F3CC
      8200E8C68C00C58A320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000411DE0002900DF004629C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000089C5DE0083C9E50088C8E20088C8
      E20088C8E20088C8E200BEC0B600FFFFFF00FFFFFF00FFFFFF00E6E6E300BEC0
      B600BEC0B600BEC0B600BEC0B600BEC0B600C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A1993D00C389
      3300C3893300C093500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003610E1004D2CE100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BEC0B600BEC0B600BEC0B600BEC0B600BEC0B600EBEB
      E90000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3BEBD00877D7C00877D7C00877D
      7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D
      7C00877D7C00877D7C00877D7C00C3BEBD000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F5F500ECECEC00EEEE
      EE00F0F0F000F4F4F400F9F9F900000000000000000000000000000000000000
      00000000000000000000E7D2B500CBA26D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBA26D00E7D2B500000000000000
      000000000000000000000000000000000000877D7C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00877D7C00000000000087A00000859D000085
      9D0000859D0000859D0000859D0000859D0000829A000079900000799000037C
      9300F2F2F200FCFCFC0000000000000000000000000000000000000000000000
      000000000000E7D2B500B87E2F00B98239000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9823900B87E2F00E7D2B5000000
      000000000000000000000000000000000000877D7C00FFFFFF00B6452D00B846
      2D00BA462E00BD472E00BE472E00BF472E00C1482F00C3482F00C3482F00C348
      2F00C3482F00C0482F00FFFFFF00877D7C0000000000008EA800FFFFFF00DDF9
      FF00DDF9FF00DDF9FF00DDF9FF00DDF9FF009DEFFF0057E5FF006BE8FF00008E
      A800FCFCFC000000000000000000000000000000000000000000000000000000
      0000E7D2B500B87E2F00EDC57A00B77D2E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B77D2E00EDC57A00B87E2F00E7D2
      B50000000000000000000000000000000000877D7C00FFFFFF00B0442C00B244
      2C00B4452D00B7462D00B9462D00BA462E00BC462E00BD472E00BF472E00C148
      2F00C3482F00BD472F00FFFFFF00877D7C00000000000A98B200E7FBFF00C0F3
      FC00BDF2FC00BAF2FD00B8F2FD00B6F2FE00B3F2FE00B1F3FE008EEDFF00008E
      A80000000000000000000000000000000000000000000000000000000000E7D2
      B500B87E2F00F2CB7E00F0C77B00B77D2E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B77D2E00F0C77B00F2CB7E00B87E
      2F00E7D2B500000000000000000000000000877D7C00FFFFFF00AC442C00AE45
      2C00FFFFFF00FFFFFF00FFFFFF00B8462E00B9462D00FFFFFF00FFFFFF00FFFF
      FF00C3482F00BB472F00FFFFFF00877D7C000000000017A5BF00E7FBFF00C5F2
      FB00C2F2FB00BFF2FC00DFDFE000DEDDDE00F1F2F300C2C1BE0043D1EB00008E
      A800000000000000000000000000000000000000000000000000E7D2B500B87E
      2F00F6CF7E00EDAB2700F2CA7D00B77D2E00B77D2E00B77D2E00B77D2E00B77D
      2E00B77D2E00B77D2E00B77D2E00E1C7A200E1C7A200B77D2E00B77D2E00B77D
      2E00B77D2E00B77D2E00B77D2E00B77D2E00B77D2E00F2CA7D00EDAB2700F6CF
      7E00B87E2F00B97F2F0000000000000000008D838200FFFFFF00A9442B00AB45
      2C00FFFFFF00FFFFFF00D79E9100B5462E00B6462E00D99F9100FFFFFF00FFFF
      FF00C1472E00B9462E00FFFFFF00877D7C000000000026B4CE00ECFBFF00CAF2
      FA00C7F2FB00C4F2FB00C9C9CB007A7F8800AC9C8000AD7A1D009F711B00A9A3
      96000000000000000000000000000000000000000000E7D2B500B2762600F7D6
      9000F2B43700F0AF2B00F4CF8300F2CD8300EFCB8500ECC78200E8C28000E4BD
      7D00E1B97A00DDB47800D9AE7400B77D2E00B77D2E00D9AE7300DBB17400E1B8
      7800E4BC7900E8C07C00ECC68000EFCA8200F2CD8200F4CF8300F0AF2B00F2B4
      3700F7D69000B2762600CF9E5C00000000008E858400FFFFFF00A8472D00A946
      2C00FFFFFF00D49F9100F9F0EE00B0452D00B3462E00F9F0EE00D99E9100FFFF
      FF00BD462D00B7462E00FFFFFF00877D7C000000000027B5CF00ECFBFF00CFF2
      FA00CCF2F900C9F3FA00C7F2FB00C7B89D00E3A43300F0AE3B00B47400009977
      470000000000000000000000000000000000E7D2B500B2762600F4D39100F0BA
      4A00F2BC4C00F2BA4400F0B33600EDAB2A00E8A52300E39E1F00DD971C00D690
      1800D0881400C97F1000DCB27400B77D2E00B77D2E00DCB27400C97F1000D088
      1400D6901800DD971C00E39E1F00E8A52300EDAB2A00F0B33600F2BA4400F2BC
      4C00F0BA4A00F4D39100B2762600B97F2F008F858400FFFFFF00B25B4200AC4D
      3200AA482F00AA472E00AA462D00FFFFFF00FFFFFF00B1462D00B2452D00B545
      2D00B8452C00B4462E00FFFFFF00877D7C00000000002BB9D300F1FCFF00D4F2
      F800D1F3F800CEF3F900CBF3FA00E9D2A900FECE8300F7C37500BF7B00009C63
      050077622D0085794B00C7C7BB0000000000A5661600EAC37700E8B14400ECB6
      4600EFBA4900F2BD4C00F2BC4C00F0B74400EDB13700E8A72A00E29D2000DB95
      1A00D58E1500CE851200DFB57700B77D2E00B77D2E00DFB57700CE851200D58E
      1500DB951A00E29D2000E8A72A00EDB13700F0B74400F2BC4C00F2BD4C00EFBA
      4900ECB64600E8B14400EAC37700A56616008E858400FFFFFF00BF715A00B762
      4A00B2563C00AE4F3500AC4A3000FFFFFF00FFFFFF00AE462D00AF462D00B145
      2D00B4442B00B0462E00FFFFFF00877D7C00000000002DBBD500F6FDFF00D9F3
      F800D6F3F800D3F3F800D0F2F900E3CFAE00E4A83C00E09E2800CD860200C682
      0200C78A1D00CC8703008576450000000000E2CBAF00A5661600EBC37800E9B2
      4500EDB74700F1BB4900F2BD4B00F2BC4C00F1BA4B00EEB54500E9AC3A00E2A2
      2E00DC982200D38D1700E2B87800B77D2E00B77D2E00E2B87800D38D1700DC98
      2200E2A22E00E9AC3A00EEB54500F1BA4B00F2BC4C00F2BD4B00F1BB4900EDB7
      4700E9B24500EBC37800A5661600B47829008F868500FFFFFF00C3776000C176
      5F00FFFFFF00DAAEA100F9F1EF00B1563D00AF523900F8F0EE00D5A39600FFFF
      FF00B24C3400B14F3A00FFFFFF00877D7C00000000002FBDD700FBFEFF00DCF3
      F700DAF3F700D8F3F800D5F3F800FAF8F700DFC8A500D5BA8C00DECBAD00BF92
      4000E4A32C00CD840200918A65000000000000000000E2CBAF00A5661600ECC4
      7900EAB34500EEB84700F2BB4A00F2BC4A00F4BE4B00F4BD4A00F1B94800ECB3
      4600E8AC4000E0A13400E9C38500B77D2E00B77D2E00E9C38500E0A13400E8AC
      4000ECB34600F1B94800F4BD4A00F4BE4B00F2BC4A00F2BB4A00EEB84700EAB3
      4500ECC47900A5661600D4A56100000000008F868500FFFFFF00C97D6400C77A
      6000FFFFFF00FFFFFF00DDB5A900BB6D5700B7695200D8AFA300FFFFFF00FFFF
      FF00B45B4600B45E4A00FFFFFF00877D7C000000000032C0DA00FFFFFF00DFF3
      F700DDF3F600DCF3F700DAF3F700D8F3F800FBFEFF007FEBFF0061E6FF00AAA2
      9500A08127008D7B3F00EBEBE700000000000000000000000000E2CBAF00A566
      1600EDC67900EBB44500EFB94800AF722200B3782900B3782900B3782900B378
      2900B3782900B3782900B3782900DFC49F00DFC49F00B3782900B3782900B378
      2900B3782900B3782900B3782900B3782900AF722200EFB94800EBB44500EDC6
      7900A5661600B175260000000000000000008F868500FFFFFF00CD816500CC80
      6400FFFFFF00FFFFFF00FFFFFF00BB705800B86C5500FFFFFF00FFFFFF00FFFF
      FF00B05D4600B2614C00FFFFFF00877D7C000000000034C2DC00FFFFFF00E0F3
      F600E0F3F600DFF3F700DDF3F700DBF3F60017A5BF0017A5BF0017A5BF00B1B1
      B10000000000000000000000000000000000000000000000000000000000E2CB
      AF00A5661600EDC67A00EDB74700AF7222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF722200EDB74700EDC67A00A566
      1600E2CBAF0000000000000000000000000090878600FFFFFF00D1876800CF86
      6600CE826600CA7E6400C2785F00BC725A00BA6F5700B46B5400B0675000AD62
      4D00AC5D4700B0644F00FFFFFF00877D7C000000000036C4DE00FFFFFF00E0F3
      F600E0F3F600E0F3F600E0F3F600DFF3F60017A5BF00D3F8FF00008EA800B8D2
      D700000000000000000000000000000000000000000000000000000000000000
      0000E2CBAF00A5661600EFC87A00AF7222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF722200EFC87A00A5661600E2CB
      AF000000000000000000000000000000000090878600FFFFFF00D88A6B00D487
      6800D2866800CF836500C97E6200C0785C00BB725900B56E5600B0685200AB64
      4F00A85F4900AD665100FFFFFF00877D7C000000000037C5DF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0018A6C000008EA8009BEFFF00E4F6
      F900000000000000000000000000000000000000000000000000000000000000
      000000000000E2CBAF00A5661600B37C36000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B37C3600A5661600E2CBAF000000
      0000000000000000000000000000000000008F858400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00877D7C00000000003ECCE60046D0E90046D0
      E90046D0E90046D0E90046D0E9003ECAE400008EA800C1F5FF00F9FEFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2CBAF00C39963000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3996300E2CBAF00000000000000
      000000000000000000000000000000000000C3BEBD00877D7C00877D7C00877D
      7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D7C00877D
      7C00877D7C00877D7C00877D7C00C3BEBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFE000FFFFFC01FC01E0000000
      FC01FC01E0000000FC01FC0100000000FC01FC0100000000FC01FC0100000000
      FC01FC0100000000FC01FC0100000000FC01FC0100000000C401FC0100000000
      C7FFFFFF0000000001FF01FF0000000001FF01FFE000000001FF01FFE0000000
      C7FFFFFFE001FFFFC7FFFFFFE003FFFFFFFFF800FFFFF800FFFFF800E7FFF800
      8003E00083FFE0008003C000000FC0008003C000000FC00080030000000F0000
      80030000000F0000800380000000800080030000000000008003000000000000
      8003830700008307800300070000000780030007000000078003E01F0000E01F
      8003C01F0000C01FFFFFEC9FFC00EC9FFC00FFFFFFFFFFFFFC00FFFFFFFFFFFF
      0000FFFFFFFF80030000C007C00780030000C007C00780030001C007C0078003
      0019C007C00780030001C007C00780030003C007C00780030003C007C0078003
      0007C007C00780030003C007C00780030011C007C00780030019C007C0078003
      001FFFFFFFFF8003001FFFFFFFFFFFFFFFFFFFFFFFFFFC00FFFFFFFFE7FFFC00
      FFFF8FE383FF0000FFFF07C3000F0000F3E70387000F0000F1C7810F000F0001
      F88FC01F000F0007FC1FE03F000F0003FE3FF03F00040001FC1FF01F00000000
      F88FE00F00000003F1C7C30700000003F3E7878300000003FFFF0FC700000003
      FFFF1FFF00000003FFFF3FFFFC0F001FFFFFFFFF0000FF81FCFFFF3F00008003
      F8FFFF1F00008007F0FFFF0F0000800FE0FFFF070000800FC00000030000800F
      800000010000800F000000000000800100000000000080010000000000008001
      8000000100008001C00000030000800FE0FFFF070000800FF0FFFF0F0000800F
      F8FFFF1F0000801FFCFFFF3F0000FFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 24
    Top = 216
    object actDelShedule: TAction
      Category = 'catAudShedule'
      ImageIndex = 5
    end
    object actFullScreen: TAction
      Category = 'catAudShedule'
      ImageIndex = 2
    end
    object actMakeBookmark: TAction
      Category = 'catAudShedule'
      ImageIndex = 3
    end
    object actNextWeek: TAction
      Category = 'catAudShedule'
      ImageIndex = 1
    end
    object actPrevWeek: TAction
      Category = 'catAudShedule'
      ImageIndex = 0
    end
    object actCloseFullScreen: TAction
      Category = 'catAudShedule'
      ImageIndex = 4
    end
    object actLoadShedule: TAction
      Category = 'catAudShedule'
      Caption = 'OK'
    end
    object actAddRoom: TAction
      Category = 'catRoomFond'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1080#1102
      ImageIndex = 16
    end
    object actDelRoom: TAction
      Category = 'catRoomFond'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1080#1102
      ImageIndex = 17
      OnExecute = actDelRoomExecute
      OnUpdate = actDelRoomUpdate
    end
    object actCTSaveChanges: TAction
      Category = 'catConstraints'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 7
      OnExecute = actCTSaveChangesExecute
      OnUpdate = actCTSaveChangesUpdate
    end
    object actCTUndoChanges: TAction
      Category = 'catConstraints'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      OnExecute = actCTUndoChangesExecute
      OnUpdate = actCTSaveChangesUpdate
    end
    object actTCSetAll: TAction
      Category = 'catConstraints'
      ImageIndex = 12
      OnExecute = actTCSetAllExecute
      OnUpdate = actTCSetAllUpdate
    end
    object actTCUncheckAll: TAction
      Category = 'catConstraints'
      ImageIndex = 11
      OnExecute = actTCUncheckAllExecute
      OnUpdate = actTCSetAllUpdate
    end
    object actSetRoomList: TAction
      Category = 'catConstraints'
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1072#1091#1076#1080#1090#1086#1088#1080#1081
      ImageIndex = 13
      OnExecute = actSetRoomListExecute
      OnUpdate = actDeleteRoomFromConstraintUpdate
    end
    object actLoadPrevPeriodList: TAction
      Category = 'catRoomFond'
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1085#1099#1081' '#1092#1086#1085#1076
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1085#1099#1081' '#1092#1086#1085#1076' '#1082#1072#1092#1077#1076#1088#1099' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1095#1077#1073#1085#1099#1081' '#1089#1077#1084#1077#1089#1090#1088
      ImageIndex = 18
      OnExecute = actLoadPrevPeriodListExecute
    end
    object actDeleteRoomFromConstraint: TAction
      Category = 'catConstraints'
      Caption = #1057#1085#1103#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
      ImageIndex = 15
      OnExecute = actDeleteRoomFromConstraintExecute
      OnUpdate = actDeleteRoomFromConstraintUpdate
    end
    object actSessionConstAdd: TAction
      Category = 'catConstraints'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 10
      OnExecute = actSessionConstAddExecute
      OnUpdate = actSessionConstAddUpdate
    end
    object actSessionConstDel: TAction
      Category = 'catConstraints'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 9
      OnExecute = actSessionConstDelExecute
      OnUpdate = actSessionConstDelUpdate
    end
    object actSessionConstLoadAvto: TAction
      Category = 'catConstraints'
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1076#1086#1089#1090#1091#1087#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1074' '#1090#1077#1095#1077#1085#1080#1077' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1076#1085#1103
      ImageIndex = 19
      OnExecute = actSessionConstLoadAvtoExecute
      OnUpdate = actSessionConstAddUpdate
    end
    object actSCUndoChanges: TAction
      Category = 'catConstraints'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      OnExecute = actSCUndoChangesExecute
      OnUpdate = actSCUndoChangesUpdate
    end
    object actSCSaveChanges: TAction
      Category = 'catConstraints'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 7
      OnExecute = actSCSaveChangesExecute
      OnUpdate = actSCUndoChangesUpdate
    end
    object actAddSCOK: TAction
      Category = 'catConstraints'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actAddSCOKExecute
      OnUpdate = actAddSCOKUpdate
    end
  end
  object ImageList2: TImageList
    Left = 64
    Top = 216
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FFFFFF00BCAFA400BFB2
      A900FBFBFB00C6BBB300CAC1BA00F3F3F300F3F3F300F1F1F100EEEEEE00ECEC
      EC00E9E9E900E8E8E800E6E6E60097928F000000000097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F00000000000000
      0000000000000000000000000000000000000000000097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F00000000000000
      000000000000000000000000000000000000000000009B9693009B9693009B96
      93009B9693009B9693009B9693009B9693009B9693009B9693009B9693009B96
      93009B9693009B9693009B9693000000000097928F00FFFFFF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00F8F8F800F5F5F500F5F5F500F3F3F300F0F0F000EEEE
      EE00EBEBEB00E9E9E900E7E7E70097928F000000000097928F00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F60097928F00000000000000
      0000000000000000000000000000000000000000000097928F00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F60097928F00000000000000
      000000000000000000000000000000000000000000009B969300FDFDFC00FCFD
      FD00FDFDFE00FEFEFD00FEFEFD00FEFEFE00FFFFFF00FFFEFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009B9693000000000097928F00FFFFFF00BC845800BC81
      5400BD825400BC7D4D00BD835500F7F7F700CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00EDEDED00EBEBEB00E8E8E80097928F000000000097928F00F8F8F800B1B0
      AD00B1B0AD00F8F8F800B1B0AD00B1B0AD00F8F9F80097928F00000000000000
      0000000000000000000000000000000000000000000097928F00F8F8F800B1B0
      AD00B1B0AD00F8F8F800B1B0AD00B1B0AD00F8F9F80097928F00000000000000
      000000000000000000000000000000000000000000009B969300FBFBFB00FCFB
      FB00FDFCFC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00A9D7F7001179
      D000DDEAF600FFFFFF009B9693000000000097928F00FFFFFF00CC9D6E00CC9D
      6E00CD9D6F00CC9B6B00CEA07300F9F9F900F6F6F600F4F4F400F4F4F400F1F1
      F100EFEFEF00ECECEC00EAEAEA0097928F000000000097928F00FCFCFC00FBFB
      FC00FBFBFC00FCFCFB00FBFBFC00FBFCFC00FBFBFC0097928F00000000000000
      0000000000000000000000000000000000000000000097928F00FCFCFC00FBFB
      FC00FBFBFC00FCFCFB00FBFBFC00FBFCFC00FBFBFC0097928F00000000000000
      000000000000000000000000000000000000000000009B969300FAFAFA00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FEFDFE00CCE7FA0055A0
      DF00EEF3F900FFFFFF009B9693000000000097928F00FFFFFF00D4A67200D5A6
      7300D5A87500D5A67200D5AA7900FBFBFB00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00F1F1F100BD835500ECECEC0097928F000000000097928F00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE00B1B0AD00B1B0AD00FEFEFE0097928F00000000000000
      0000000000000000000000000000000000000000000097928F00FEFEFE00B1B0
      AD00B1B0AD00FEFEFE00B1B0AD00B1B0AD00FEFEFE0097928F00000000000000
      000000000000000000000000000000000000000000009B969300F9F9FA00FAFA
      F900FAFAFA00FBFBFB00FCFBFC00FCFBFC00FCFCFC00FCFDFD00FDFDFD00CAE1
      F400FEFEFE00FEFEFE009B9693000000000097928F00FFFFFF00DDB27900DBB0
      7400DCB27700DCB07500DCB47C00FCFCFC00FAFAFA00F8F8F800F8F8F800F5F5
      F500F3F3F300D5A67300EEEEEE0097928F000000000097928F00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0097928F00AC9C7F00AFA2
      9000B2AAA300EFEDEA0000000000000000000000000097928F00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0097928F00AC9C7F00AFA2
      9000B2AAA300E4E1DC000000000000000000000000009B969300F8F9F800CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00FCFCFC00BEE0F8001181
      DA00FDFDFD00FDFEFE009B9693000000000097928F00FFFFFF00EFD29B00EFD2
      9B00EFD29B00EFD29B00EFD29B00FDFDFD00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00F5F5F500DEB58200EFEFEF0097928F0000000000266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00AB9D8800C1B9A200EBE2D000E5DC
      CE00C8C0B400A6998800E2DEDB00000000000000000074976800749768007497
      680074976800749768007497680074976800AB9D8800C1B9A200EBE2D000E5DC
      CE00C8C0B400A6998800D4CEC90000000000000000009B969300F7F7F700F7F7
      F800F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00FBFBFB0081C4F4000084
      E400EBF2F800FCFDFD009B9693000000000097928F00FFFFFF00F5DCB100F5DC
      B100F5DCB100F5DCB100F5DCB100FEFEFE00FEFEFE00FDFDFD00FBFBFB00F9F9
      F900F6F6F600F2D7A600F1F1F10097928F0000000000266DBF001683F500238E
      F600329BF60042A8F7004FB3F700A5978100BCB09700EAE4CF00F0EBD700FBF5
      E300EFE9DE00D3CDC300AD9E8F00EEECEA00000000007497680061D7280061D7
      280061D7280061D7280061D72800A5978100BCB09700EAE4CF00F0EBD700FBF5
      E300EFE9DE00D3CDC300AD9E8F00E3DFDC00000000009B969300F6F5F600CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00F9F9FA0066B8F100088E
      EC0087BCE700FCFCFC009B9693000000000097928F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FDFDFD00FBFBFB00F9F9
      F900F6F6F600F4F4F400F1F1F10097928F0000000000266DBF00266DBF00266D
      BF00266DBF00266DBF00B2A59100B4A99300E7E0CC00E6E0CC00D5CBB9009E8D
      7700EEE8DA00E1DACE00CEC4B800C8C0B8000000000074976800749768007497
      68007497680074976800B2A59100B4A99300E7E0CC00E6E0CC00D5CBB9009E8D
      7700EEE8DA00E1DACE00CEC4B800B6ABA100000000009B969300F5F5F500F5F5
      F500F6F6F600F6F6F600F7F7F700F8F8F700F8F8F800F8F9F900D0E7F7004FAE
      EF00E9F2F800FAFBFA009B9693000000000097928F00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F000000000000000000000000000000
      00000000000000000000ABA08D00DDD4C300F1EEDD00C8BEA800978875008371
      58009686710097877200D3C7B800AFA292000000000000000000000000000000
      00000000000000000000ABA08D00DDD4C300F1EEDD00C8BEA800978875008371
      58009686710096867100D3C7B700A7998700000000009B969300CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA009B9693000000000097928F00E0D9D300E0D9D300E0D9
      D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D30091796800E0D9
      D30091796800E0D9D3009179680097928F000000000000000000000000000000
      00000000000000000000B1A59400E0D7C900FDF9EE00F1EDDF00D0C7BC009684
      7000D9D2C100D5CCBB00D1C6B700ACA090000000000000000000000000000000
      00000000000000000000A99C8A00E0D7C900FDF9EE00F1EDDF00D0C7BB009583
      6F00D9D1C000D5CBBA00D1C6B600A4978500000000009B969300E0D9D300E0D9
      D300E0D9D300E0D9D300E0D9D300E0D9D300E0D9D300A7958700E0D9D300A390
      8200E0D9D3009B8779009B9693000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      00000000000000000000CCC5BB00C8C0AE00EFEDDF00FFFFF300D5CCC0009685
      7100F8F6E700F1ECDA00C2B9A800C6BFB7000000000000000000000000000000
      00000000000000000000BBB2A500C8C0AD00EFEDDF00FFFFF300D5CCC0009685
      7000F8F6E700F1ECDA00C2B8A700B3AA9F00000000009B9693009B9693009B96
      93009B9693009B9693009B9693009B9693009B9693009B9693009B9693009B96
      93009B9693009B9693009B969300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEECEA00ADA19000C9C4B600EFEDE100D0C7BB009685
      7200EFEDE000CBC1AE00A99B8900EBE9E8000000000000000000000000000000
      00000000000000000000E3DFDC00ADA19000C9C4B500EFEDE100D0C7BB009685
      7100EFEDE000CBC1AD00A99B8900DEDAD8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00DFDBD500AA9E8C00CBC5B700CFC6B8009B8C
      7800C3BCA700AEA28F00DEDBD500FBFBFB000000000000000000000000000000
      00000000000000000000F9F9F900CFC9C100AA9E8C00CBC5B600CFC6B7009A8B
      7700C3BBA600AEA28F00CEC9C100F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEECE900CAC3B900B0A49300A89A
      8900C8C2B900EDEBE90000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3DFDA00B9AFA200A89B88009F90
      7D00B6AEA200E1DEDA000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000FFFFFFFFFFFF0000803F803F
      80010000803F803F80010000803F803F80010000803F803F80010000803F803F
      8001000080038003800100008001800180010000800080008001000080008000
      80010000FC00FC0080010000FC00FC0080010000FC00FC008001FFFFFC00FC00
      FFFFFFFFFC00FC00FFFFFFFFFF03FF0300000000000000000000000000000000
      000000000000}
  end
  object dsRoomFond: TDataSource
    Left = 64
    Top = 176
  end
  object ImageList3: TImageList
    Left = 104
    Top = 216
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000FDFDFD00EEEC
      EA00B2AAA2009B918500988A7C00948474009C908800EAEAE900000000000000
      00000000000000000000000000000000000000000000000000009B9C93005455
      52004B4B480031312E005B5B57000000000052524F0048484600555653009797
      9400000000002C2C27004C4C48005B5C58000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0EFEE00B69A8000AF93
      8100D5B08E00E8BD9100ECC09700E0B68C00D3AA80009B826A00CBCAC9000000
      000000000000000000000000000000000000000000000000000096988A00FFFF
      FF00FFFFF900FFFFFF005B5C520082847900FFFFFF00FFFBF300B9BCB1004142
      3C0082857900EDE2D400FFF7EC00939384000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBF9F600BE9D7B00E0B58A00E6C8
      B700E3BEA000E1B78D00E5BE9900DAB69100D9B08800D0A57D0098928E000000
      000000000000000000000000000000000000000000000000000093948900FFFF
      FF00F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B897B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4B28F00E1B18800CBBA
      AF00F2D9C600E8BE9100ECC8A400E1C2A400D8B28B00C59D7700A6A19E000000
      000000000000000000000000000000000000000000000000000091928700FFFF
      FF00EADDD500C6B3A400C6B3A400C9B9A900E6DCD400F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9C93007A7F6200F7BC9500CDC0
      B600FDFDFC00FFD0A000F5CCA600E6C9AD00E8BF96009E7E5E00888784000000
      000049494700494945004C4C48005B5C5800000000000000000091938800FFFB
      FA00C4AF9900FFFFFF00FFFFFF00FFFFFF00D2BCB000F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000096988A00E3EEE500F3CF9F00C6AE
      9F00446F990097959400F1C29500F7CCA200CEA57D00918E830041423C008285
      7900F3E8DB00EDE2D400FFF7EC00939384009B9C9300545552007F817600FFF7
      F400AF9A8400FFFFFF00FFFFFF00FFFFFF00D8C3B800F7EDE500C6B3A400C6B3
      A400C6B3A400C6B3A400F5E9E0008C897C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093948900FFFFFF00EBE0CF007572
      7A00204E7D001A4B7D00978C8000C7A68500D3C6BC00F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B897B0096988A00FFFFFF0086887C00FFF9
      F600C7B6A400FFFFFF00FFFFFF00FFFFFF00D7C4B900F7EDE500D1C1B200D4C4
      B700D4C4B700D3C4B600FAF1E900838274000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091928700FFFFFF00BCBBBD00234F
      7D003E638900305B88006B6E7100E5DBD300F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B0093948900FFFFFF0091918600FFFC
      FB00EADDD500C6B3A400C6B3A400C0AD9700EADDD500F7EDE500C6B3A400C6B3
      A400C6B3A400C6B3A400FBF4ED008C8C7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091938800F7F5F6006D8AAA004E77
      A0005279A0003D689100A5ABB100D2BCB000F7EDE500F7EDE500F7EDE500F7ED
      E500F7EDE500F7EDE500F7EDE5008B887B0091928700FFFFFF008E8E8100FFFF
      FF00EADDD500EADDD500EADDD500EADDD500EADDD500FFFFFE00FDFBF600FAF7
      F400F7F5F200F3ECE500FEFAF400939489000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091938800EAE8EA006E94BA007099
      BF00668DB3004B78A2003D566C00C6B4AA00F7EDE500C6B3A400C6B3A400C6B3
      A400C6B3A400C6B3A400F5E9E0008C897C0091938800FFFBFA008F8D8100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091938800919388009193
      88009193880091938800919388009B9C93000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091938800E7E7ED008DB2D7009BBF
      E50079A5CF00527699002E3A4500A69A9300F7EDE500D2C2B500D4C6B800D4C6
      B800D4C6B800D3C4B600F7EDE5008B8B7D0091938800FFF7F400D8DBD1009193
      88009193880091938800919388009193880091938800D8DBD100C6B3A400C6B3
      A400F5E9E0008C897C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091938800F4F2F30098BDE1009FC6
      EE007EAAD7004E637B002F261F0092878100F7EDE500D1C1B200D4C4B700D4C4
      B700D4C6B700D3C4B600FAF1E9008C8B7E0086887C00FFF9F600C8B7A600FFFF
      FF00FFFFFF00FFFFFF00D7C4B900F7EDE500D1C1B200D4C4B700D4C4B700D3C4
      B600FAF1E9008382740000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091938800F9F7F6009DA2A9007881
      8B006D757E00525253003D3B3900C8BEB800F7EDE500C6B3A400C6B3A400C6B3
      A400C6B3A400C6B3A400FBF4ED008C8C7F0091938800FFFCFB00EADDD500C6B3
      A400C6B3A400C0AE9900EADDD500F7EDE500C6B3A400C6B3A400C6B3A400C6B3
      A400FBF4ED008C8C7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090918500FFFFFF00D8CEC700A59F
      9A00797371006B696600ADA6A200E9DCD400FFFFFE00FDFBF600FAF7F400F7F5
      F200F5F2EC00F3ECE500FEFAF4009394890090918500FFFFFF00EADDD500EADD
      D500EADDD500EADDD500EADDD500FFFFFE00FDFBF600FAF7F400F7F5F200F3EC
      E500FEFAF4009394890000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095958C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBCB300B5B7AE00AEAFA600AEAF
      A600AEAFA600AEAFA600B8BBB1009B9C930095958C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BBBCB300B5B7AE00AEAFA600AEAFA600A6A8
      9E00B8BBB1009B9C930000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8DBD10091938800919388009193
      880091938800919388009193880091938800D8DBD10000000000000000000000
      000000000000000000000000000000000000D8DBD100C3C4BA00BEC0B600BEC0
      B600BEC0B600BEC0B600B8B9B000D8DBD1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C03FC10800000000801FC00000000000
      001FC00000000000801FC000000000000010C000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000300000000000000030000000000000003000000000000000300000000
      0000000300000000007F00FF0000000000000000000000000000000000000000
      000000000000}
  end
  object ilRoomConstraint: TImageList
    Left = 104
    Top = 176
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000000000000BDBDBD007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600F0F0F200F1F1F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5
      F700F6F6F700F7F7F800F7F8F900868686000000000000000000BDBDBD00F0F0
      F200F1F1F300F1F2F300F2F2F400F3F3F400F3F4F500F4F5F600F5F5F700F6F6
      F700F7F7F800F7F8F90086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      9000F1F1F300CCC1C300A28A8D00A28A8D00D8D1D200F4F5F600D4CACD00CFC4
      C600F7F7F800F7F8F900F8F9FA009090900000000000FEFDFD009A877300DFDF
      DF009A877300DFDFDF009A877300DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF0090909000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F00F5F5F700D4CBCD00CFC4
      C600F8F8F900F8F9FA00F9FAFA009D9D9D00FEFEFE00E0CDB900B5A592009A87
      73009A8773009A877300B49D8400C7B29B00F5F5F600F6F6F700F7F7F800F8F8
      F900F8F9FA00F9FAFA009D9D9D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F60097928F00F6F6F800D5CBCD00D0C5
      C700F8F9FA00F9FAFA00FAFBFB00ACACAC009A877300B5A59200E0CDB900B7A1
      8900B7A18900B7A18900C7B29B00B19F8A009A877300DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00F8F8F800B1B0AD00B1B0
      AD00F8F8F800B1B0AD00B1B0AD00F8F9F80097928F00CABDBF00B9A7AA00D0C5
      C700F9FAFB00FAFBFB00FBFBFC00ADADAD00FEFEFE00D0BEA6009A877300F1F1
      F200F2F2F200F4F5F600B7A189009A877300F4F3F300F8F8F900F9F9FA00F9FA
      FB00FAFBFB00FBFBFC00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FCFCFC00FBFBFC00FBFB
      FC00FCFCFB00FBFBFC00FBFCFC00FBFBFC0097928F00F8F8F900CBBEC000D0C6
      C800FAFBFB00FBFCFC00FBFCFC00B1B1B1009A877300D0BEA6009A877300DEDD
      DD00DEDDDD00DFDFDF00B7A189009A8773009A877300DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00B1B1B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FEFEFE00B1B0AD00B1B0
      AD00FEFEFE00B1B0AD00B1B0AD00FEFEFE0097928F00F9F9FA00F9FAFB00FAFB
      FB00FBFCFC00FBFCFD00FCFDFD00B3B3B300FAF9F700F2EEEA009A877300F4F4
      F400F4F5F500F6F7F800B7A189009A877300F8F7F800F9FAFB00FAFBFB00FBFC
      FC00FBFCFD00FCFDFD00B3B3B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000097928F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0097928F00B9A8AA00A28A8D00A28A
      8D00F6F4F600FCFDFD00FDFEFE00B5B5B5009A877300D0BEA600F2EEEA009A87
      73009A8773009A877300D1BDA400C7B096009A877300DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00AE999C00FBFCFC00CCBF
      C100DED7D800FDFEFE00FDFEFE00B8B8B80000000000F2EEEA00D0BEA600F2EE
      EA00D0BEA600D0BEA600B7A18900EAD9C800FAFBFC00FBFCFC00FCFCFD00FCFD
      FD00FDFEFE00FDFEFE00B8B8B800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF001683F500238EF600329B
      F60042A8F7004FB3F70058BAF80058BAF800266DBF00BAA8AB00FCFDFD00D2C7
      C900D8CFD000FDFEFE00FDFEFE00B8B8B80000000000000000009A877300DFDF
      DE009A877300DFDFDF009A877300DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00B8B8B800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266DBF00266DBF00266DBF00266D
      BF00266DBF00266DBF00266DBF00266DBF00266DBF00B4A1A300FCFDFD00CCC0
      C200DFD7D800E5E5E600DFDFE000BABABA000000000000000000BCBCBC00F8F9
      FA00F9FAFA00FAFAFB00FAFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFE
      FE00E5E5E600DFDFE000BABABA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00F9FAFA00FAFBFB00DDD5D700BAA8AB00FCFDFD00BAA9AB00A28A8D00A28A
      8D00B7B4B400B8B8B800B8B8B800BABABA000000000000000000BDBDBD00F9FA
      FA00FAFBFB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00BABA
      BA00B8B8B800B8B8B800BABABA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00FAFBFB00FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FDFE
      FE00C5C5C500F6F6F600BBBBBB00F2F2F2000000000000000000BFBFBF00FAFB
      FB00E3E1E000E8E5E500FCFDFD00E3E1E000E8E5E500FDFEFE00E3E1E000C5C5
      C500F6F6F600BBBBBB00F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000FBFBFC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFE
      FE00CACACA00BABABA00F3F4F300000000000000000000000000C0C0C000FBFB
      FC00BEBEBE00DAD8D800FCFDFD00BEBEBE00DAD8D800FBFCFC00BEBEBE00CACA
      CA00BABABA00F3F4F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000BFBFBF00FAFAFA0000000000000000000000000000000000C0C0C000C0C0
      C000F6F3F300C0C0C000C0C0C000F6F3F300C0C0C000C0C0C000F6F3F300BFBF
      BF00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCC7C200A0978F0094897F00908275008C7D6E0095877C00DEDD
      DC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F500E3E3E300000000000000000000000000FDFDFD00F5F5
      F500E9E9E900DFDFDF00D9D9D900D3D3D300D1D1D100D4D4D400DDDDDD00ECEC
      EC00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3EFED00B7ABA100AA9A8A00A6907D00A48B
      7500A6907D00AA9A8A00B1A69D00DED9D400000000000000000000000000AFA7
      A00097877C00BEA08A00DAB18600E8BF9500E8BE9400DDB38B00CEA47C00A888
      6A00A7A39F000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500ECECEC00ECECEC000000000000000000F5F5
      F500DCDCDC00BFBFBF00ACACAC000000000000000000F9F9F900E2E2E200C0C0
      C000A1A1A1008E8E8E00828282007676760071717100797979008C8C8C00B6B6
      B600EAEAEA000000000000000000000000000000000000000000F4F4F400E4E4
      E400E1E2E100E3E3E300ECECEC00A4907F00B4947600F4D5BA00EABE9100F0C2
      9500EDC19500D8B08800BF9B7A00B9A48F000000000000000000B1ACA900C79F
      7600DDBCA300E8C7B500DBB38800E4BC9600E2BB9500DAB48F00CDA88100DDB1
      850085726100F7F7F70000000000000000000000000000000000000000000000
      0000ECECEC00CFCFCF00AFAFAF009C9C9C00AFAFAF00DCDCDC00F5F5F500D5D5
      D500BFBFBF00FAFBFB00ADADAD000000000000000000E6E6E600999288006C51
      38006E4620006D4621008C5420008D521A00814A170071461E0059422D008888
      8800DADADA00000000000000000000000000DFDFDF0084978E0051896D004B8D
      6B00478B69005E8D750047795D00AC917100CFA98400F4DAC400EFC49F00F4C7
      9900F6CBA200E7C19A00C8A27D00B59E8A000000000000000000B5A58A00E6B6
      8A00C1A99300E4CBC100DCB48B00E8C29A00E7C29D00DDBC9B00CFAA8600D1A6
      7D0088766700F8F8F800000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C00A6A6A600DCDCDC00E6E6E600D1D1D100BFBFBF00B5B5B500BFBF
      BF00F9FAFA00FAFBFB00B1B1B10000000000000000009C7E6100985C2300C18A
      56009F6A3900804B2200C6916000C9936000B8793D00B3713300824B18008686
      8600DBDBDB00000000000000000000000000BFBFBF006CC3990064C091005CB8
      890054B28400A0C1A8005AA77D00AFA07100E5B79100F4DFC900FFDDB900F8C9
      9A00FCD6AF00EDCAA800CBA78100A9917D000000000000000000BCBDA100ECB7
      8C00BFA89200FCF9F800F1CAA600EBC29900F0CCAA00E4C7AA00D4B28D00CFA3
      7A009C9186000000000000000000000000000000000000000000ADADAD00D7D7
      D700F3F3F500F4F4F500F4F5F600F5F6F700F6F6F800F7F7F800EEEEEF00F7F7
      F700F9FAFA00FAFBFB00ACACAC00000000000000000089501A00C7905C00CC97
      660094623A00ECCCCF009E6C3F00CE9A6900CA956300B676390074461B00A8A8
      A800EAEAEA00000000000000000000000000DFDFDF0073CAA0006AC2960065BF
      93006CC09100D1E3C60065B590008DAB7700FFD2A500DACBB800D1CBC200E2BE
      9900F9CCA000EEC69D00D8AA7D00C2B2A2000000000000000000CAD6C500FDC5
      9B00D3B89F00E3E3E300ECE2D800F4C49600EDC9A500E2C4A500DFB99100B790
      6A00EDECEC000000000000000000000000000000000000000000ADADAD00F3F3
      F500E4C9C900BE646200E5CBCB00F6F7F800BF646200F8F8F900E8CDCD00BF65
      6300E9CFCE00FBFBFC00ADADAD00000000000000000095663A00CC976600DAAD
      83009F7B5E00FFFFF900BCA38E00B7885C00CC976600AE7743007C644A00D7D7
      D700F9F9F900000000000000000000000000EFEFEF007DCFA70073CAA00069C4
      950082C3A800B2CABF0060AA85004DA87700AAA78100797F88000A417A004664
      8200CFAA8600DDB18800C5B3A200F5F5F5000000000000000000F9FBFA00D0CC
      A900F4C5A000436281002C5B8B0096928C00EABD8E00EBC19800C8A07B00C5C1
      BD00000000000000000000000000000000000000000000000000B1B1B100F4F4
      F600BE646200F5F6F700BF646200F7F8F800BF646200F9F9FA00BF656300FAFB
      FB00C0656300FBFCFC00B1B1B1000000000000000000AF957C00A6714000E5BE
      9900AA796E00BFCDCF009FB9C10086683900A7734300714D2B00C4C4C400F6F6
      F6000000000000000000000000000000000000000000C1E8D50075CBA10067BC
      91006091B2005780A5003E7D5B0066A5830073899300365C8600224D7A001848
      7A006E747800E0D2C40000000000FCFCFC000000000000000000000000000000
      00009B9491003C5C7F001A457100285482009D8C7A00C1A78C00E1DFDC000000
      0000000000000000000000000000000000000000000000000000B3B3B300F5F5
      F600BE646200F6F7F800BF646200F8F9F900BF656300F9FAFB00C0656300FBFC
      FC00C0656300FCFDFD00B3B3B300000000000000000000000000C3AF9D009273
      450003698300157BC200177DC6000B71AF005B4719006D6D6D00BFBFBF00F5F5
      F500000000000000000000000000000000000000000000000000D4EEE10063B0
      92004F7CA8005B86AA0090ADAA00E0E8E7005F85AC00436F9D003D6794002854
      8000D8DBDE00000000000000000000000000000000000000000000000000E7EA
      ED003D648D003A61890033557B00244E7B00999FA30000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500F6F6
      F700E6CCCC00BF646200E7CDCC00F9F9FA00C0656300FAFBFB00E9CFCF00C065
      6300EAD0D000FDFEFE00B5B5B500000000000000000000000000000000006B9E
      B800298FEC003399FF003399FF003298FD00157BC20049565C0098989800E4E4
      E4000000000000000000000000000000000000000000000000009DB5C3003468
      860075A1CC0081ABD800587FA200A4B6C5006E97C3006591BC005480AB003664
      9100A0ACB900FDFDFD00000000000000000000000000000000000000000096AD
      C6004C749D0050769E004A719700375D8300CFD0D10000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F6F7
      F800F7F8F900F8F9F900F9F9FA00FAFAFB00FAFBFC00FBFCFC00FCFCFD00FCFD
      FD00FDFEFE00FDFEFE00B8B8B800000000000000000000000000000000002585
      C3003EA4FF0040A6FF0040A6FF003EA4FF00369CF9001E5D7F007C7C7C00D6D6
      D6000000000000000000000000000000000000000000FAFCFD005991A500588C
      AF00A1CBF90096C3F1006D97BE00BDCCD9008DB5DE0081ACD8006592BF00436A
      930024364800E7E6E60000000000000000000000000000000000F7F9FA007698
      BA00678FB600678DB300567EA500426C9500626E7900F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000BABABA00F7F8
      F900BF656300F9FAFA00E9CECE00C0656300E9CFCF00FCFDFD00C0666300FCFD
      FD00FDFEFE00FDFEFE00B8B8B800000000000000000000000000000000002288
      CC0047ADFF004AB0FF004AB0FF0048AEFF0042A8FF001D7CBA0071717100D1D1
      D1000000000000000000000000000000000000000000F8FBFC00619CB1008EB9
      DF00CCF4FF00AAD6FE008DAFD40000000000A6D0FA009DC7F2006FA0D0004158
      710026211E00DCDCDC0000000000000000000000000000000000F0F3F70082A4
      C70085ACD10079A0C600648BB300486D91002E425700D6D5D400000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00F8F9
      FA00BF656300FAFAFB00C0656300FBFCFC00C0666300FCFDFD00C0666400FDFE
      FE00E5E5E600DFDFE000BABABA0000000000000000000000000000000000278D
      CC0050B6FF0053B9FF0053B9FF0051B7FF004DB3FF00248ACC0071717100D1D1
      D1000000000000000000000000000000000000000000FEFEFE0089BDCC006CA7
      C200BCE3F400AAD2F90083A5CD00000000008FA4BA007D93AA00647A8E00464A
      4E002D2C2B00E4E4E40000000000000000000000000000000000F4F7FA0094B6
      D900A8CBEF0091B5DB006B98C40046586A00342E2800B0B0B000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00F9FA
      FA00C0656300FBFBFC00C0656300FCFDFD00C0666300FDFEFE00C0666400BABA
      BA00B8B8B800B8B8B800BABABA00000000000000000000000000000000002086
      BF003398D1002E91C5003DA3DF004CB2F90045ABF2002180B40080808000D8D8
      D800000000000000000000000000000000000000000000000000DCF0F40077BE
      D1005BA0B5005893B0004074930000000000CBC9C60089868400686663005757
      5600AEAEAE00FEFEFE000000000000000000000000000000000000000000A6C1
      DC008EB2D60087AACE006686AA00464D5400312C2900B8B8B800000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00FAFB
      FB00C0656300FBFCFC00EAD0D000C0666300EBD1D000FDFEFE00C0666400C5C5
      C500F6F6F600BBBBBB00F2F2F200000000000000000000000000000000003E89
      AF00318DBF0052A6D50075B6DB005FA3C6003B8CB40015709E00ACACAC00EAEA
      EA00000000000000000000000000000000000000000000000000FFFFFF00DFFA
      FF00A5E1F00084C9D80078BBCA00BFDAE20000000000F3F3F300DFDFDF00E6E6
      E60000000000000000000000000000000000000000000000000000000000B7B8
      B800797A7B007374760062606000504E4C0047474700E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000FBFB
      FC00FBFCFC00FCFDFD00FCFDFD00FDFEFE00FDFEFE00FBFCFC00FDFEFE00CACA
      CA00BABABA00F3F4F3000000000000000000000000000000000000000000BDD7
      E3002381B20084C0E40097CAE80089C2E3002C88B8006390A600E0E0E000FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400C7C6C60093919000767474007F7F7E00D0D0D00000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000BFBF
      BF00FAFAFA000000000000000000000000000000000000000000000000000000
      0000ACCCDC005096B9004190B900408BB20089AFC200EDEDED00FBFBFB000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00E000C00100000000E000C00100000000
      E000800100000000000000010000000000000001000000000000000100000000
      0000000100000000000000010000000000000001000000000000800100000000
      0000C001000000000000C00100000000E000C00100000000E000C00100000000
      E001C00300000000E003C00700000000FFFFF80FFFF9C007FE00E007FC618007
      C000C003F00180070000C003C00180070000C007C00180070000C007C0018007
      0000C00FC001800F8002F01FC001C00FC007E07FC001E00FC003E07FC001E00F
      8003C03FC001E00F8103C03FC001E00F8103C03FC001E00FC103E03FC001E00F
      C08FE03FC003E00FFFFFE07FC007F01F00000000000000000000000000000000
      000000000000}
  end
  object dsSessionTime: TDataSource
    OnUpdateData = dsSessionTimeUpdateData
    Left = 376
    Top = 376
  end
end
