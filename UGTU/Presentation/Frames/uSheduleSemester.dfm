inherited fmSheduleSemester: TfmSheduleSemester
  Width = 644
  Height = 525
  ExplicitWidth = 644
  ExplicitHeight = 525
  inherited Panel1: TPanel
    Width = 644
    Height = 525
    ExplicitWidth = 644
    ExplicitHeight = 525
    object Bevel6: TBevel
      Left = 2
      Top = 2
      Width = 640
      Height = 4
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 741
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 6
      Width = 640
      Height = 517
      ActivePage = TabSheet2
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1074
        ImageIndex = 1
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 632
          Height = 485
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsFaculties
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          RowHeight = 16
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGridEh1DblClick
          OnKeyDown = DBGridEh1KeyDown
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Ik_fac'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Cname_fac'
              Footers = <>
              Title.Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1074
              Width = 395
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1089#1077#1084#1077#1089#1090#1088#1072
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 632
          Height = 485
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            632
            485)
          object Label11: TLabel
            Left = 8
            Top = 113
            Width = 104
            Height = 13
            Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1081':'
          end
          object Label6: TLabel
            Left = 8
            Top = 8
            Width = 123
            Height = 13
            Caption = #1054#1073#1097#1080#1081' '#1091#1095#1077#1073#1085#1099#1081' '#1075#1088#1072#1092#1080#1082':'
          end
          object Panel4: TPanel
            Left = 8
            Top = 454
            Width = 617
            Height = 26
            Anchors = [akLeft, akRight, akBottom]
            BevelKind = bkFlat
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object ToolBar4: TToolBar
              Left = 329
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
              object BitBtn1: TToolButton
                Left = 0
                Top = 0
                Cursor = crHandPoint
                Action = actSLUndoChanges
                Style = tbsTextButton
              end
              object BitBtn2: TToolButton
                Left = 140
                Top = 0
                Cursor = crHandPoint
                Action = actSLSaveChanges
                Style = tbsTextButton
              end
            end
            object ToolBar1: TToolBar
              Left = 0
              Top = 0
              Width = 247
              Height = 22
              Align = alLeft
              ButtonWidth = 161
              Caption = 'ToolBar4'
              Images = ImageList1
              List = True
              ShowCaptions = True
              AllowTextButtons = True
              TabOrder = 1
              object ToolButton1: TToolButton
                Left = 0
                Top = 0
                Cursor = crHandPoint
                Action = actAddLengthException
              end
              object ToolButton3: TToolButton
                Left = 24
                Top = 0
                Cursor = crHandPoint
                Action = actDelLengthException
              end
              object ToolButton2: TToolButton
                Left = 48
                Top = 0
                Cursor = crHandPoint
                Action = actLoadExceptionsAvto
                Style = tbsTextButton
              end
            end
          end
          object DBGridEh2: TDBGridEh
            Left = 8
            Top = 133
            Width = 617
            Height = 315
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoFitColWidths = True
            DataSource = dsSemLengthException
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'spec_fac_name'
                Footers = <>
                Title.Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
                Width = 99
              end
              item
                EditButtons = <>
                FieldName = 'course_number'
                Footers = <>
                Title.Caption = #1050#1091#1088#1089
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'd_sem_start'
                Footers = <>
                Title.Caption = #1053#1072#1095#1072#1083#1086' '#1091#1095'. '#1087#1077#1088#1080#1086#1076#1072
                Width = 110
              end
              item
                EditButtons = <>
                FieldName = 'd_sem_end'
                Footers = <>
                Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1091#1095'. '#1087#1077#1088#1080#1086#1076#1072
                Width = 124
              end
              item
                EditButtons = <>
                FieldName = 'd_session_start'
                Footers = <>
                Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1077#1089#1089#1080#1080
                Width = 91
              end
              item
                EditButtons = <>
                FieldName = 'd_session_end'
                Footers = <>
                Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1089#1077#1089#1089#1080#1080
                Width = 103
              end>
          end
          object Panel3: TPanel
            Left = 8
            Top = 27
            Width = 617
            Height = 80
            Anchors = [akLeft, akTop, akRight]
            BevelKind = bkFlat
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Label1: TLabel
              Left = 8
              Top = 7
              Width = 87
              Height = 13
              Caption = #1059#1095#1077#1073#1085#1099#1081' '#1087#1077#1088#1080#1086#1076':'
            end
            object Label10: TLabel
              Left = 100
              Top = 55
              Width = 73
              Height = 13
              Caption = #1074#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072':'
            end
            object Label2: TLabel
              Left = 275
              Top = 7
              Width = 82
              Height = 13
              Caption = #1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
            end
            object Label3: TLabel
              Left = 15
              Top = 31
              Width = 80
              Height = 13
              Caption = #1055#1077#1088#1080#1086#1076' '#1089#1077#1089#1089#1080#1080':'
            end
            object Label4: TLabel
              Left = 275
              Top = 31
              Width = 82
              Height = 13
              Caption = #1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
            end
            object Label5: TLabel
              Left = 23
              Top = 55
              Width = 72
              Height = 13
              Caption = #1056#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100':'
            end
            object Label7: TLabel
              Left = 109
              Top = 7
              Width = 64
              Height = 13
              Caption = #1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
            end
            object Label8: TLabel
              Left = 109
              Top = 31
              Width = 64
              Height = 13
              Caption = #1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
            end
            object Label9: TLabel
              Left = 266
              Top = 55
              Width = 91
              Height = 13
              Caption = #1074#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103':'
            end
            object dbdtSemesterStop: TDBDateTimeEditEh
              Left = 363
              Top = 5
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              TabOrder = 1
              Visible = True
              OnChange = dbdtSemesterStartChange
            end
            object dbdtSessionStop: TDBDateTimeEditEh
              Left = 363
              Top = 29
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              TabOrder = 3
              Visible = True
              OnChange = dbdtSemesterStartChange
            end
            object dbdtSessionStart: TDBDateTimeEditEh
              Left = 179
              Top = 29
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              TabOrder = 2
              Visible = True
              OnChange = dbdtSemesterStartChange
            end
            object dbdtWorkTimeStop: TDBDateTimeEditEh
              Left = 363
              Top = 53
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButton.Visible = False
              EditButtons = <>
              Flat = True
              TabOrder = 5
              Visible = True
              OnChange = dbdtSemesterStartChange
              EditFormat = 'HH:NN'
            end
            object dbdtWorkTimeStart: TDBDateTimeEditEh
              Left = 179
              Top = 53
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButton.Visible = False
              EditButtons = <>
              Flat = True
              TabOrder = 4
              Visible = True
              OnChange = dbdtSemesterStartChange
              EditFormat = 'HH:NN'
            end
            object dbdtSemesterStart: TDBDateTimeEditEh
              Left = 179
              Top = 5
              Width = 81
              Height = 19
              AlwaysShowBorder = True
              EditButtons = <>
              Flat = True
              Kind = dtkDateEh
              TabOrder = 0
              Visible = True
              OnChange = dbdtSemesterStartChange
            end
          end
        end
      end
      object tsScheduleSearch: TTabSheet
        Caption = #1055#1086#1080#1089#1082
        ImageIndex = 6
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 632
          Height = 485
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            632
            485)
          object Panel7: TPanel
            Left = 2
            Top = 0
            Width = 628
            Height = 478
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 210
              Width = 628
              Height = 3
              Cursor = crVSplit
              Align = alBottom
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 87
            end
            object Panel8: TPanel
              Left = 0
              Top = 213
              Width = 628
              Height = 265
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                628
                265)
              object Label26: TLabel
                Left = 79
                Top = 30
                Width = 29
                Height = 13
                Caption = #1044#1072#1090#1072':'
              end
              object Label27: TLabel
                Left = 275
                Top = 30
                Width = 36
                Height = 13
                Caption = #1042#1088#1077#1084#1103':'
              end
              object Label28: TLabel
                Left = 47
                Top = 55
                Width = 61
                Height = 13
                Caption = #1058#1080#1087' '#1087#1086#1080#1089#1082#1072':'
              end
              object Label29: TLabel
                Left = 281
                Top = 55
                Width = 30
                Height = 13
                Caption = #1060#1048#1054':'
                Visible = False
              end
              object Label30: TLabel
                Left = 380
                Top = 30
                Width = 12
                Height = 13
                Caption = #1087#1086
              end
              object Label31: TLabel
                Left = 258
                Top = 56
                Width = 53
                Height = 13
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
                Visible = False
              end
              object Label32: TLabel
                Left = 258
                Top = 55
                Width = 100
                Height = 13
                Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103':  '#1082#1086#1088#1087#1091#1089':'
              end
              object Label33: TLabel
                Left = 472
                Top = 55
                Width = 35
                Height = 13
                Caption = #1085#1086#1084#1077#1088':'
              end
              object Label34: TLabel
                Left = 5
                Top = 79
                Width = 102
                Height = 13
                Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072':'
              end
              object Label35: TLabel
                Left = 317
                Top = 30
                Width = 6
                Height = 13
                Caption = 'c'
              end
              object Label36: TLabel
                Left = 6
                Top = 8
                Width = 94
                Height = 13
                Caption = #1055#1086#1080#1089#1082' '#1101#1082#1079#1072#1084#1077#1085#1086#1074':'
              end
              object DBGridEh4: TDBGridEh
                Left = 5
                Top = 98
                Width = 617
                Height = 134
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoFitColWidths = True
                DataSource = dsFoundExams
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                UseMultiTitle = True
                Columns = <
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'dt_time_start'
                    Footers = <>
                    Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
                    Width = 90
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'dt_time_stop'
                    Footers = <>
                    Title.Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
                    Width = 98
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'FIO'
                    Footers = <>
                    Title.Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
                    Width = 119
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'cName_disc'
                    Footers = <>
                    Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
                    Width = 128
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = #1057'name_vid_nagruzki_short'
                    Footers = <>
                    Title.Caption = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
                    Width = 83
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'cName_calc_unit'
                    Footers = <>
                    Title.Caption = #1056#1072#1089'. '#1077#1076#1080#1085#1080#1094#1072
                    Width = 93
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'full_room_name'
                    Footers = <>
                    Title.Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103
                  end>
              end
              object Panel6: TPanel
                Left = 5
                Top = 236
                Width = 618
                Height = 26
                Anchors = [akLeft, akRight, akBottom]
                BevelKind = bkFlat
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object ToolBar2: TToolBar
                  Left = 512
                  Top = 0
                  Width = 102
                  Height = 22
                  Align = alRight
                  ButtonWidth = 96
                  Caption = 'ToolBar4'
                  Images = ImageList1
                  List = True
                  ShowCaptions = True
                  AllowTextButtons = True
                  TabOrder = 0
                  object ToolButton5: TToolButton
                    Left = 0
                    Top = 0
                    Cursor = crHandPoint
                    Action = actStartSearchExams
                    Style = tbsTextButton
                  end
                end
              end
              object dbcbSearchCampusExams: TDBLookupComboboxEh
                Left = 364
                Top = 53
                Width = 100
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 2
                Visible = True
                OnKeyDown = dbdtSearchDateExamsKeyDown
                OnKeyValueChanged = dbcbSearchCampusExamsKeyValueChanged
              end
              object dbcbSearchGroupExams: TDBLookupComboboxEh
                Left = 317
                Top = 53
                Width = 305
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 3
                Visible = False
                OnKeyDown = dbdtSearchDateExamsKeyDown
              end
              object dbcbSearchNumberExams: TDBLookupComboboxEh
                Left = 512
                Top = 53
                Width = 110
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 4
                Visible = True
                OnKeyDown = dbdtSearchDateExamsKeyDown
              end
              object dbcbSearchPrepExams: TDBLookupComboboxEh
                Left = 317
                Top = 53
                Width = 305
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 5
                Visible = False
                OnKeyDown = dbdtSearchDateExamsKeyDown
              end
              object dbcbSearchTypeExams: TDBComboBoxEh
                Left = 114
                Top = 53
                Width = 138
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                Items.Strings = (
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1091#1076#1080#1090#1086#1088#1080#1080
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1102
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1075#1088#1091#1087#1087#1077)
                TabOrder = 6
                Visible = True
                OnChange = dbcbSearchTypeExamsChange
                OnKeyDown = dbdtSearchDateExamsKeyDown
              end
              object dbdtSearchDateExams: TDBDateTimeEditEh
                Left = 114
                Top = 28
                Width = 138
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                Kind = dtkDateEh
                TabOrder = 7
                Visible = True
                OnKeyDown = dbdtSearchDateExamsKeyDown
              end
              object dbdtSearchTimeStartExams: TDBDateTimeEditEh
                Left = 331
                Top = 28
                Width = 40
                Height = 19
                AlwaysShowBorder = True
                EditButton.Visible = False
                EditButtons = <>
                Flat = True
                TabOrder = 8
                Visible = True
                OnKeyDown = dbdtSearchDateExamsKeyDown
                EditFormat = 'HH:NN'
              end
              object dbdtSearchTimeStopExams: TDBDateTimeEditEh
                Left = 402
                Top = 28
                Width = 39
                Height = 19
                AlwaysShowBorder = True
                EditButton.Visible = False
                EditButtons = <>
                Flat = True
                TabOrder = 9
                Visible = True
                OnKeyDown = dbdtSearchDateExamsKeyDown
                EditFormat = 'HH:NN'
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 628
              Height = 210
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                628
                210)
              object Label20: TLabel
                Left = 5
                Top = 79
                Width = 102
                Height = 13
                Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072':'
              end
              object Label12: TLabel
                Left = 79
                Top = 30
                Width = 29
                Height = 13
                Caption = #1044#1072#1090#1072':'
              end
              object Label13: TLabel
                Left = 217
                Top = 30
                Width = 36
                Height = 13
                Caption = #1042#1088#1077#1084#1103':'
              end
              object Label14: TLabel
                Left = 47
                Top = 55
                Width = 61
                Height = 13
                Caption = #1058#1080#1087' '#1087#1086#1080#1089#1082#1072':'
              end
              object Label15: TLabel
                Left = 281
                Top = 55
                Width = 30
                Height = 13
                Caption = #1060#1048#1054':'
                Visible = False
              end
              object Label16: TLabel
                Left = 561
                Top = 30
                Width = 12
                Height = 13
                Caption = #1087#1086
                Enabled = False
              end
              object Label17: TLabel
                Left = 258
                Top = 56
                Width = 53
                Height = 13
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
                Visible = False
              end
              object Label18: TLabel
                Left = 258
                Top = 55
                Width = 100
                Height = 13
                Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103':  '#1082#1086#1088#1087#1091#1089':'
              end
              object Label19: TLabel
                Left = 472
                Top = 55
                Width = 35
                Height = 13
                Caption = #1085#1086#1084#1077#1088':'
              end
              object Label21: TLabel
                Left = 498
                Top = 30
                Width = 6
                Height = 13
                Caption = 'c'
                Enabled = False
              end
              object Label25: TLabel
                Left = 6
                Top = 8
                Width = 143
                Height = 13
                Caption = #1055#1086#1080#1089#1082' '#1072#1091#1076#1080#1090#1086#1088#1085#1099#1093' '#1089#1086#1073#1099#1090#1080#1081':'
              end
              object DBGridEh3: TDBGridEh
                Left = 5
                Top = 99
                Width = 618
                Height = 76
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoFitColWidths = True
                DataSource = dsFoundEvents
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -11
                FooterFont.Name = 'MS Sans Serif'
                FooterFont.Style = []
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                UseMultiTitle = True
                Columns = <
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'ik_event_type'
                    Footers = <>
                    Title.Caption = #8470' '#1087#1072#1088#1099
                    Width = 51
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'FIO'
                    Footers = <>
                    Title.Caption = #1060#1048#1054' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1103
                    Width = 121
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'cName_disc'
                    Footers = <>
                    Title.Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072
                    Width = 133
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'cName_vid_zanyat'
                    Footers = <>
                    Title.Caption = #1042#1080#1076' '#1079#1072#1085#1103#1090#1080#1081
                    Width = 77
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = #1057'name_vid_nagruzki_short'
                    Footers = <>
                    Title.Caption = #1042#1080#1076' '#1085#1072#1075#1088#1091#1079#1082#1080
                    Width = 80
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'cName_calc_unit'
                    Footers = <>
                    Title.Caption = #1056#1072#1089'. '#1077#1076#1080#1085#1080#1094#1072
                    Width = 83
                  end
                  item
                    Alignment = taCenter
                    EditButtons = <>
                    FieldName = 'full_room_name'
                    Footers = <>
                    Title.Caption = #1040#1091#1076#1080#1090#1086#1088#1080#1103
                  end>
              end
              object Panel11: TPanel
                Left = 5
                Top = 180
                Width = 618
                Height = 26
                Anchors = [akLeft, akRight, akBottom]
                BevelKind = bkFlat
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                object ToolBar3: TToolBar
                  Left = 512
                  Top = 0
                  Width = 102
                  Height = 22
                  Align = alRight
                  ButtonWidth = 96
                  Caption = 'ToolBar4'
                  Images = ImageList1
                  List = True
                  ShowCaptions = True
                  AllowTextButtons = True
                  TabOrder = 0
                  object ToolButton4: TToolButton
                    Left = 0
                    Top = 0
                    Cursor = crHandPoint
                    Action = actStartSearchEvents
                    Style = tbsTextButton
                  end
                end
              end
              object dbcbSearchCampusEvents: TDBLookupComboboxEh
                Left = 364
                Top = 53
                Width = 100
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 2
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
                OnKeyValueChanged = dbcbSearchCampusEventsKeyValueChanged
              end
              object dbcbSearchGroupEvents: TDBLookupComboboxEh
                Left = 317
                Top = 53
                Width = 305
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 3
                Visible = False
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbcbSearchNumberEvents: TDBLookupComboboxEh
                Left = 512
                Top = 53
                Width = 110
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 4
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbcbSearchPart: TDBLookupComboboxEh
                Left = 317
                Top = 28
                Width = 86
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 5
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbcbSearchPrepEvents: TDBLookupComboboxEh
                Left = 317
                Top = 53
                Width = 305
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                TabOrder = 6
                Visible = False
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbcbSearchTypeEvents: TDBComboBoxEh
                Left = 114
                Top = 53
                Width = 138
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                Items.Strings = (
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1091#1076#1080#1090#1086#1088#1080#1080
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1102
                  #1055#1086#1080#1089#1082' '#1087#1086' '#1075#1088#1091#1087#1087#1077)
                TabOrder = 7
                Visible = True
                OnChange = dbcbSearchTypeEventsChange
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbdtSearchDateEvents: TDBDateTimeEditEh
                Left = 114
                Top = 28
                Width = 91
                Height = 19
                AlwaysShowBorder = True
                EditButtons = <>
                Flat = True
                Kind = dtkDateEh
                TabOrder = 8
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
              end
              object dbdtSearchTimeStartEvents: TDBDateTimeEditEh
                Left = 512
                Top = 28
                Width = 40
                Height = 19
                AlwaysShowBorder = True
                Enabled = False
                EditButton.Visible = False
                EditButtons = <>
                Flat = True
                TabOrder = 9
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
                EditFormat = 'HH:NN'
              end
              object dbdtSearchTimeStopEvents: TDBDateTimeEditEh
                Left = 583
                Top = 28
                Width = 39
                Height = 19
                AlwaysShowBorder = True
                Enabled = False
                EditButton.Visible = False
                EditButtons = <>
                Flat = True
                TabOrder = 10
                Visible = True
                OnKeyDown = dbdtSearchDateEventsKeyDown
                EditFormat = 'HH:NN'
              end
              object RadioButton1: TRadioButton
                Left = 262
                Top = 30
                Width = 49
                Height = 17
                Caption = #1087#1072#1088#1072':'
                Checked = True
                TabOrder = 11
                TabStop = True
                OnClick = RadioButton1Click
              end
              object RadioButton2: TRadioButton
                Left = 409
                Top = 30
                Width = 87
                Height = 17
                Caption = #1087#1088#1086#1084#1077#1078#1091#1090#1086#1082': '
                TabOrder = 12
                OnClick = RadioButton1Click
              end
            end
          end
        end
      end
    end
  end
  inherited pnlSave: TPanel
    Top = 600
    Align = alNone
    Visible = False
    ExplicitTop = 600
  end
  object Panel10: TPanel
    Left = 193
    Top = 366
    Width = 238
    Height = 65
    BorderStyle = bsSingle
    TabOrder = 2
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
    object Label23: TLabel
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
    object Label24: TLabel
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
  object ImageList1: TImageList
    Left = 184
    Top = 256
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF007C7C7C0081818100C5C4C40097979700E5E5E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF007B7B7B00A8A8A8007C7C7C00A7A2A50079797A0094949400F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF007B7B7B00A7A7A7007B7B7B00BFBFBF00B8B5B700E7E5E7006A6B6B00BABA
      BA00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000000000000000
      0000F3F3F300E1E1E100D9D9D900DCDCDC00F5F5F50000000000DBDBDB007B7B
      7B00A6A6A6007B7B7B00BEBEBE0000000000F5F4F500B7B2B500E5E3E5006464
      6400D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8A49400F4E3
      DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
      B500634935000000000000000000000000000000000000000000B8A49400F4E3
      DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
      A200634935000000000000000000000000000000000000000000FBFBFB00C3C3
      C3008A8C8D0085848600908F8F00868787008D8E8F00BFBFC00086868600A4A4
      A40079797900BEBEBE00000000000000000000000000E6E6E600BBB3B600DFDD
      DF0077777700F0F0F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
      B800634935000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
      A3006349350000000000000000000000000000000000FCFCFC00ADAEAE009191
      9100DCD1C700F8EEE400FEFAF700FBFCFC00EAE6E200C3C0BD00AEAFB1008282
      8200DADADA000000000000000000000000000000000000000000DDDBDC00BAB4
      B50080808000A7A7A700D4D4D500A4A5A500A4A5A500A3A4A500ECECED00FEFE
      FE00000000000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
      BB00634935000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
      A50063493500000000000000000000000000FEFEFE00B8B9B9009C989400F6E5
      D200FFF6EC00FFF9F300FFFCF900FFFDFB00FFFBF800FFF5EB00CFC6BE00A5A5
      A80000000000000000000000000000000000000000000000000000000000DFDD
      DE00ADA7A90053575A00A59F9900C6C7C800C6C7C800C1BEBB0075777800C0C0
      C000F7F7F7000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
      BF00634935000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
      A70063493500000000000000000000000000ECECEC0094959600EBD5C100FFF1
      E200FFF3E900FFF6EE00FFF8F300FFF6EE00FFF3EB00FFF5ED00FDECDC009F9D
      9A00D7D8D9000000000000000000000000000000000000000000000000000000
      00008E8F9200DCD8D400FEFAF700FEFCFA00FDF8F400FDF8F200FAF0E6008B89
      8700B9B9B900FBFBFB0000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
      C400634935000000000000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
      A90063493500000000000000000000000000D5D5D600AAA39C00FBE4CF00FFEF
      E000FFF1E600FFF3E900FFF4EC00FFF7F100FFF0E500FFECDE00FFEDDC00D5C8
      B900B6B7B800FCFCFC000000000000000000000000000000000000000000DCDC
      DC00A29F9B00FFF3E600FFFBF800FFF6EE00FFFAF500FFF8F000FFF5E800F9E3
      CB0084838400E4E4E50000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
      C900634935000000000000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
      AC0063493500000000000000000000000000C8C9CA00C6B3A200FFE8D200FFEF
      E100FFEFE200FFF1E600FFF3E900FFF4ED00FFEFE200FFE7D500FFE8D400EDD4
      BE00A9A9AB00F8F8F8000000000000000000000000000000000000000000A8AA
      AB00ECD7C300FFF1E300FFEDDE00FFF9F400FFF6F000FFF4EA00FFF2E800FFEF
      D900BCAD9F00B1B2B30000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
      CF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
      AF0063493500000000000000000000000000C5C7C900C6B2A100FFE7D100FFF0
      E200FFF0E400FFF1E500FFEDDF00FFE9D700FFE7D300FFE1CB00FFE4CC00EDD2
      BA00A7A8A900F9F9F9000000000000000000000000000000000000000000A0A0
      A100FDDFC200FFE9D500FFEAD900FFF7F000FFF4EB00FFF1E700FFF0E400FFF0
      DC00DFC3A9009DA0A20000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
      D400634935000000000000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
      C00063493500000000000000000000000000CFCFD100B8AFA700F9E2CC00FFEA
      D700FFE5D100FFE3CC00FFE4CE00FFE5CF00FFEDE000FFDFC500FFE1C700D5C0
      AA00ADB0B100FAFAFA0000000000000000000000000000000000000000009B9D
      9E00FCDAB900FFE1C600FFE5CE00FFE8D400FFEAD900FFEEE000FFEFE200FFF2
      E000DBBFA700AEB0B20000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA0063493500000000000000000000000000EFEFF000AAAAA800E7CEB500FFE8
      CF00FFE5CF00FFE7D400FFEDDF00FFF2E700FFF2E800FFE0C300FAD9BB00B0A6
      9C00CACCCD00FEFEFE000000000000000000000000000000000000000000A4A8
      AA00E2C3A600FFE0C000FFEDDE00FFECDC00FFE4CE00FFE1C800FFE4CC00FFE7
      CC00BAADA000CCCECF0000000000000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC7000000000000000000000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC70000000000000000000000000000000000D3D4D400ABA49C00F5E4
      D100FFF9EB00FFF7ED00FFF5E900FFF6EB00FFF3E400FCDEC200CAB19800A9AA
      AA00F1F1F200000000000000000000000000000000000000000000000000D4D5
      D700A99D9000FCD6B100FFEED800FFFAF400FFF5EB00FFF2E500FFF5E100EDD2
      B600A19F9C00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00C3C3C500ADA4
      9E00D8CBBC00F1E4D600F8ECDF00F6EADE00E6D7C300C0AD9B00A8A6A600EDED
      ED00000000000000000000000000000000000000000000000000000000000000
      0000B6B7B800B6A08D00F1D7BD00FFF6E800FFF7EA00FBF1E300E0D2C1009D98
      9500E3E3E4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCDC
      DD00AEACAB00ABA6A100B2ABA500ACA49D00A5A19C00B2B3B400F3F3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C3C4C5009B969300ACA29700B4ABA200A59E9600AAA9A900ECEC
      ED00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B1AF00BDBDBC00BDBDBC00BDBD
      BC00BDBDBC00BCBCBB00BCBCBB00BCBCBB00BBBBBB00BBBBBA00BBBBBA00BABA
      B900BABAB900B9B9B800BAB9B800ABABAA000000000000000000000000000000
      00000000000000000000C7C3C300827878008278780082787800827878008278
      7800787474008278780082787800C7C3C3000000000000000000000000000000
      00000000000000000000C7C3C300827878008278780082787800827878008278
      7800787474008278780082787800C7C3C30097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F00BDBDBC00FFFFFF00FFF8F000FFF8
      EF00FFF7EE00FFF7EE00FFF7ED00FFF7EC00FFF7EC00FFF6EB00FFF6EB00FFF5
      E800FFF5E700FFF4E700FFF4E600BBBBBA000000000000000000000000000000
      0000000000000000000082787800A19D9D00B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000A19D9D00827878000000000000000000000000000000
      0000000000000000000082787800A19D9D00B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000A19D9D008278780097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600EAE6E400D0C6BE00EAE6
      E400F6F6F600F6F6F600F6F6F60097928F00BCBCBA00FFFFFF008487E0007478
      DC006669D7005A5CD3004F52CF00F2EBE500F1EAE200F0E9E100F0E8DF00EEE6
      DD00E4DCD200BA4B3600FFF4E700BABAB900838383007E7E7E007E7E7E007E7E
      7E007E7E7E007E7E7E0082787800B4AFB000E5D9D800E5D9D800E5D9D800E5D9
      D80009EA53005D5A5A00B3AEAF0082787800838383007E7E7E007E7E7E007E7E
      7E007E7E7E007E7E7E0082787800B4AFB000E5D9D800E5D9D800E5D9D800E5D9
      D80009EA53005D5A5A00B3AEAF008278780097928F00F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600E8E4E100BFAD9E008C725C00BBAC
      9E00F6F6F600F6F6F600F6F6F60097928F00BCBCBB00FFFFFF00F9F5F200F7F4
      F000F7F2EE00F6F1EC00F5EFEA00F4EFE800F3EDE600F2EBE400F1EAE200D3CA
      C300C7543F00CD655200FCEBDE00BCB7B50089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009A817C00B4AFB000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B4AFB0009A817C0089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009A817C00B4AFB000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B4AFB0009A817C0097928F00F6F6F600F6F6F600DBD5
      D100F6F6F600A4928700DED8D400ADA09600F5F5F5008C725C00FFFFFF008C72
      5C00E8E6E200F6F6F600F6F6F60097928F00BCBCBB00FFFFFF00F1A07800EA9B
      7400F0A07800E99B7300E1956F00D98F6B00D18A6700F3EEE800F3ECE500D378
      6700CD655200CD655200CD655200CB604C0092929200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0D4CE00C3BCB900B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000C1BAB700DCCDC50092929200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0D4CE00C3BCB900B4AFB000B4AFB000B4AFB000B4AF
      B000B4AFB000B4AFB000C1BAB700DCCDC50097928F00F6F6F600F6F6F600F6F6
      F6009E8B7D00A7928200A3918100A3908100A08D7F00BAACA3008C725C00C7B4
      A200EAE6E300F6F6F600F6F6F60097928F00BCBDBB00FFFFFF00FCFAF800FBF8
      F600FAF7F400F9F6F200F8F4F000F8F3EF00F7F1ED00F5F0EB00F5EEE900F4EE
      E700D57E6E00CD655200FFF5E900BBBBB9009A9A9A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F800F2F0F000E4E1DF00B3B0AE0081A1
      7F00918E8C00DEDDDC00F9F8F800000000009A9A9A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F800F2F0F000E4E1DF00B3B0AE00DEDA
      D800E3E0DE00F0EFEE00F9F8F8000000000097928F00F6F6F600F6F6F600AD9E
      90009E8B7D00D4CBC200E1DCD800CFC2B800A08D7F00BAACA300E7E2DD00E9E2
      DB00F7F6F700F6F6F600F6F6F60097928F00BFC0BF00FFFFFF00657D9300657D
      9300657C9200647C9200647C9200647C9100637B9100637B9000F6F2EC00F5F0
      EA00F1E4DD00D6817100FFF7EC00BFBFBE00A4A4A400FFFFFF00FFFFFF00D5E0
      D60050A65B00B3C1B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A400B376
      1F00BC7C2200000000000000000000000000A4A4A400FFFFFF00FFFFFF00D5E0
      D60050A65B00B3C1B500FFFFFF004C39C6004C39C600E4E1DF00C0C0C0000000
      0000000000004C39C6004C39C6000000000097928F00F6F6F600F6F6F600DBD6
      D1009E8C7D00EEEDEB00F6F6F600E3DEDA00A08E7F00DCD7D200F9F9F600F8F8
      F700F7F7F700F6F6F600F6F6F60097928F00C0C0BF00FFFFFF00FEFDFD00FDFD
      FC00FDFCFA00FCFBF800FBFAF700FAF8F600FAF7F300F9F5F100F8F4EF00F7F2
      EE00F6F1EC00F5EFEA00FFF7EE00BFC0BF00ACACAC00FFFFFF00DDE8DF005FC7
      700041E75A0055AE6200F3F3F300FFFFFF00FFFFFF00EFE3D200B97B1F00EEC6
      7700E3C89200C68426000000000000000000ACACAC00FFFFFF00DDE8DF005FC7
      700041E75A0055AE6200F3F3F3004C39C6004C39C6004C39C600C0C0C000FAFA
      FA004C39C6004C39C6004C39C6000000000097928F00F6F6F600F6F6F600AA98
      8A009E8C7D00D6CFC900E7E4E100CBC1B800A08E7F00B8AA9F00F9F9F900F6F6
      F600F6F6F600F6F6F600F6F6F60097928F00C0C0BF00FFFFFF00C9868200C785
      8000C37F7900C9868200C7847F00C27E7800C17C7600C07A7400BE787200BD76
      6F00F7F4EF00F7F2ED00FFF9F100C0C0BF00B5B5B500FFFFFF0070E082006BD8
      7D00E5F2E60054EE6D0093AE9700FEFEFE00FFFFFF00B2751C00EFC77800EFBA
      4A00F2B94300F4D39000BF7B200000000000B5B5B500FFFFFF0070E082006BD8
      7D00E5F2E60054EE6D0093AE9700FFFFFF004C39C6004C39C6004C39C6004C39
      C6004C39C6004C39C600000000000000000097928F00F6F6F600F6F6F600FFFF
      FF009E8C7D00A08D7F00A08D7F00A08E7F00A18E8000F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60097928F00C0C0BF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFE00FEFEFD00FDFDFB00FDFCFA00FCFBF900FBF9F800FBF8F600FAF7
      F400F9F6F200F8F4F000FFFAF400C0C0BF00BBBBBB00FFFFFF00E4F5E600F8FB
      F800FFFFFF0089DD960052C86600DBDCDB00B6781D00B1741D00B1741D00F2BD
      4C00F6D08100C58A3200C58A3200BE822E00BBBBBB00FFFFFF00E4F5E600F8FB
      F800FFFFFF0089DD960052C86600F9FAF900F9FAF9004C39C6004C39C6004C39
      C6004C39C600F8F8F800000000000000000097928F00F6F6F600F6F6F600DBD6
      D100F6F6F600AB9B8F00DCD6D200B4A59800F6F6F600DCD7D200F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60097928F00C0C0BF00FFFFFF005AAC71005AAD
      720059AD71005AAC72005AAD71005AAD710059AC700059AB700059AC700059AB
      6F0059AB6E00F9F7F400FFFDFB00C1C1BF00C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0F6F1004DDD630085AB8B00F9FAF900FFFFFF00B1741D00F1B7
      4200F4CE8600C58A32000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0F6F1004DDD630084A48900EDEEED004C39C6004C39C6004C39
      C6004C39C60000000000000000000000000097928F00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCCCA00CDCC
      CA00CDCCCA00CDCCCA00CDCCCA0097928F00C2C2C100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FD00FFFEFD00FFFEFC00FFFEFC00C3C2C200C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5DDBA0045BE570084A48900EDEEED00B1741D00F1B7
      4200F3CD8500C58A32000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5DDBA0052C866004C39C6004C39C6004C39C6004C39
      C6004C39C6004C39C600000000000000000097928F00DCD5CF00DCD5CF00DCD5
      CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF00DCD5CF0089726200DCD5
      CF0089726200DCD5CF008972620097928F00B5B5B400C2C2C100C2C2C100C2C2
      C100C2C2C100C2C2C100C2C2C100C2C2C100C2C2C100C2C2C100C2C1C100C1C0
      BF00C0C1BF00C0C0BF00C0C0BF00B1B1B000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFCFA00A3D3A80096BF9B00FFFFFF00B1741D00EDB0
      3700ECC68000C58A32000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFCFA004C39C6004C39C6004C39C600C0C0C0000000
      00004C39C6004C39C6004C39C6000000000097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F0097928F0097928F0097928F009792
      8F0097928F0097928F0097928F0097928F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1741D00F3CC
      8200E8C68C00C58A32000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004C39C6004C39C600FFFFFF00C0C0C0000000
      0000000000004C39C6004C39C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A1993D00C389
      3300C3893300C09350000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFF81FFFFFFFFFFFFFF00FFF
      FFFFFFFFFFE007FFC007C007F04107FFC007C007C00383FFC007C0078007C00F
      C007C007000FE007C007C0070007F003C007C0070003E003C007C0070003E003
      C007C0070003E003C007C0070003E003C007C0070003E003C007C0078007E003
      FFFFFFFF800FF007FFFFFFFFE01FF80FFFFF0000FC00FC0000000000FC00FC00
      0000000000000000000000000000000000000000000000000000000000010001
      0000000000070019000000000003000100000000000100030000000000000003
      0000000000030007000000000003000300000000000300110000FFFF00030019
      FFFFFFFF0003001FFFFFFFFF001F001F}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 224
    Top = 256
    object actSLSaveChanges: TAction
      Category = 'catSemLength'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Enabled = False
      ImageIndex = 2
      OnExecute = actSLSaveChangesExecute
      OnUpdate = actSLSaveChangesUpdate
    end
    object actSLUndoChanges: TAction
      Category = 'catSemLength'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Enabled = False
      ImageIndex = 3
      OnExecute = actSLUndoChangesExecute
      OnUpdate = actSLSaveChangesUpdate
    end
    object actAddLengthException: TAction
      Category = 'catSemLength'
      ImageIndex = 5
      OnExecute = actAddLengthExceptionExecute
    end
    object actDelLengthException: TAction
      Category = 'catSemLength'
      ImageIndex = 4
      OnExecute = actDelLengthExceptionExecute
    end
    object actLoadExceptionsAvto: TAction
      Category = 'catSemLength'
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      ImageIndex = 0
      OnExecute = actLoadExceptionsAvtoExecute
      OnUpdate = actLoadExceptionsAvtoUpdate
    end
    object actStartSearchEvents: TAction
      Category = 'catSearch'
      Caption = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
      ImageIndex = 7
      OnExecute = actStartSearchEventsExecute
      OnUpdate = actStartSearchEventsUpdate
    end
    object actStartSearchExams: TAction
      Category = 'catSearch'
      Caption = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
      ImageIndex = 7
      OnExecute = actStartSearchExamsExecute
      OnUpdate = actStartSearchExamsUpdate
    end
  end
  object dsFaculties: TDataSource
    Left = 112
    Top = 248
  end
  object dsSemLengthException: TDataSource
    OnStateChange = dsSemLengthExceptionStateChange
    Left = 360
    Top = 240
  end
  object dsFoundEvents: TDataSource
    Left = 528
    Top = 144
  end
  object dsFoundExams: TDataSource
    Left = 528
    Top = 352
  end
end
